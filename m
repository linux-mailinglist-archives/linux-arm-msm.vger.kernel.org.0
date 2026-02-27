Return-Path: <linux-arm-msm+bounces-94518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGo3HWTyoWkwxgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:37:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 049001BCE9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0909630E3EFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C7F44D03D;
	Fri, 27 Feb 2026 19:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="BId/d7GQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8440355F2F;
	Fri, 27 Feb 2026 19:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772220695; cv=none; b=ftEG2h25dHmusrhq8+9Yhbsy/Ei+r1R8BfBGT44C3CykeELVrbgabo0MLzOH1HE7LYVcEzx0+FIEkeyGVFpBrwWQJtfawej9EKdg0gRWz7ArbWnDgCBu3Xb5RPIH2Ce0N0lEQEvNH9QiItG4EbhY3Lvudph8BaodDuvtaCkO2x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772220695; c=relaxed/simple;
	bh=gcUwh0qPFw5GdQRQKa/RuurbIQBpHHkCJD7079f3Oq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPWeYaWYUQJmmIOaVgk1HFPPbQvjEz85L6UDYi+ehLpMN0wfq4kHltyZgDzNUQ1V5VTl01SlO9ZJW1tpFpp++V0jS/e4gfUacYpNUmqt647beWSFXvPTbSpHEFDuQSd9Lg2eXPpPnJ/eoLhhOWnkTnPGQkU7a+QKC+uOXI57XM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=BId/d7GQ; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fMz391N4VzlfgS0;
	Fri, 27 Feb 2026 19:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1772220680; x=1774812681; bh=KMd0qDawP3LtnNVvdXu0EXZ0
	bVclYbc/s4g1QlOu6ME=; b=BId/d7GQJieiPJXeB15F3xR7jTlrDEn6whU05ToR
	lVQj5w9r6atacQ/ykKhH8hZNvihgIKl5O1jVgbWVBbNpWMWiCmqg4ufzhpGKNtET
	OlazOYWfWmhvjn/CYoIx37rTUIhKoCEFSMkxWTsrqAXMok9hNkwnWluCFCOecQEf
	NrcduviqoDilLdkeXcUWJMSl6oRgkYTxWfrje0243cgJjlT5r+GXPliCRXE3h7D4
	L+1XR9167R4wFe2XJ8jP1fzl1XyC4c4WmtjG+FEIdMyPK3SuQvRK/SR956bRoS4s
	ecSNPm+/sCSSxJvwJ3yrWoLLIDSDs+7KoxFhufzWgu/zqA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id F69mF0ONa_jO; Fri, 27 Feb 2026 19:31:20 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fMz2n0mQrzlfgRw;
	Fri, 27 Feb 2026 19:31:12 +0000 (UTC)
Message-ID: <9d975881-7570-495d-94ea-085e2012a9af@acm.org>
Date: Fri, 27 Feb 2026 11:31:11 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Ajay Neeli <ajay.neeli@amd.com>, Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Wang <peter.wang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Stanley Jhu <chu.stanley@gmail.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Archana Patni <archana.patni@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-arm-msm@vger.kernel.org>
References: <20260227160809.2620598-1-can.guo@oss.qualcomm.com>
 <20260227160809.2620598-2-can.guo@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260227160809.2620598-2-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94518-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,samsung.com,HansenPartnership.com,amd.com,linaro.org,kernel.org,mediatek.com,gmail.com,linux.alibaba.com,collabora.com,quicinc.com,intel.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[acm.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,acm.org:mid,acm.org:dkim]
X-Rspamd-Queue-Id: 049001BCE9E
X-Rspamd-Action: no action

On 2/27/26 8:07 AM, Can Guo wrote:
> Before power mode change to a target power mode, TX Equalzation Training

"Equalzation" -> "Equalization"

> (EQTR) needs be done for that target power mode. In addition, before TX
> EQTR we need to change the power mode to HS-G1. These cannot happen
> before the vops pwr_change_notify(PRE_CHANGE) because we don't know the
> negotiated target power mode yet. It is neither approprite if all these
> happen post the vops pwr_change_notify(PRE_CHANGE) as we are going to
> change the power mode to HS-G1 for TX EQTR.

approprite -> appropriate

Additionally, if "neither" occurs in a sentence, "nor" should occur in
the same sentence. I don't see "nor" in the above sentence?

> Introduce a new ufshcd vops negotiate_pwr_mode(), so that TX EQTR can be
> done after vops negotiate_pwr_mode() and before vops pwr_change_notify().

This patch does much more than only introducing a new vendor operation.
Please make sure the patch description is complete.

> -	return -ENOTSUPP;
> +	return -EOPNOTSUPP;

Why has ENOTSUPP been changed into EOPNOTSUPP?

> -static int ufshcd_change_power_mode(struct ufs_hba *hba,
> -			     struct ufs_pa_layer_attr *pwr_mode)
> +static int __ufshcd_change_power_mode(struct ufs_hba *hba,
> +				      struct ufs_pa_layer_attr *pwr_mode)
>   {
>   	int ret;

The double underscore prefix is typically used in the Linux kernel to
indicate that the caller holds a lock. That is not the case here. Please
choose another name for this function, e.g.
ufshcd_dme_change_power_mode().

Thanks,

Bart.

