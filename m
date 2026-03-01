Return-Path: <linux-arm-msm+bounces-94761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAR+GRR9pGl5iQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 18:53:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D11871D0FB4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 18:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 231C83015A78
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 17:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A05337B87;
	Sun,  1 Mar 2026 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="BNwluevo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54F5A59;
	Sun,  1 Mar 2026 17:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772387515; cv=none; b=lv2M/qaQbo8yvEpQMntGRC07Sq0z8oEIrP6zbtvBx4yIKRrqPmWRIePdinC3thVypBk0+H6j5KrtczfHPMk7Vuc1jg2smQnrWA3FLY90bFhoPkMbE2lTqa5NY3uCZw5Gb3vetcu+j4S1C1T4E8iscJ7I65eJhjYVmI6NaeFB3w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772387515; c=relaxed/simple;
	bh=gBxMJaUKa1C9JEFX2ZaVz3QyDUnGEtOPQuNCPOMH3xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t7Jv2GIl/SPm7WPJ/O+kp8hPKmnYRo3LguXR5T7NyRrQiq6yMLfIvHFg1xU9Y3CJS8kzssoUqltYYuCBtfzdmDBJswM8cC2jqLH6/unbYJKswWIx3VyqJRuzpDEIU/bkgSpDlIC3/eBUDvvbhTwLST0RXcW7DMr9SBNZTIGOrZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=BNwluevo; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fP8l76g1fz1XM31H;
	Sun,  1 Mar 2026 17:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1772387495; x=1774979496; bh=gBxMJaUKa1C9JEFX2ZaVz3Qy
	DUnGEtOPQuNCPOMH3xw=; b=BNwluevo8QwQgftfHB+DAqTk9ymT2rv4ZQaRtkv1
	fEE+STVCIEETCbEGDy6mPRz/sGX18yEGYpRhqFMzOGhGTN2IeFLZUb2xX5fByOva
	HSPj3fQYRzfbH8s99Gojromm8NSb7kZqaVqPqiRcwFpg0igO7/hef9tgIxeT1dUi
	6s/15zHh1tkYNv9+Ck+Jaa7msTHuvX1wexjljDqKd5CGnECL/W8Ueahcos4OV1rt
	k2Ub1EtAEcCNTTF6F6XWyjlYJmmStvxNYUokguq1Ocp3+fsvoTwY+RBUu7MIzxQS
	MB8AcL9iv6pLSpoLjF0H+Q4bgEu1UABPn13zEmAVM8AF1w==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id G5Djf-GxRJGn; Sun,  1 Mar 2026 17:51:35 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fP8kk4Xv4z1XM5jn;
	Sun,  1 Mar 2026 17:51:26 +0000 (UTC)
Message-ID: <3abcef32-f872-4aa5-a7e1-c99286f426aa@acm.org>
Date: Sun, 1 Mar 2026 09:51:25 -0800
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
 <9d975881-7570-495d-94ea-085e2012a9af@acm.org>
 <5a2961af-dada-44f3-8e57-119076f10750@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <5a2961af-dada-44f3-8e57-119076f10750@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94761-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,samsung.com,HansenPartnership.com,amd.com,linaro.org,kernel.org,mediatek.com,gmail.com,linux.alibaba.com,collabora.com,quicinc.com,intel.com,lists.infradead.org];
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
X-Rspamd-Queue-Id: D11871D0FB4
X-Rspamd-Action: no action

On 3/1/26 6:26 AM, Can Guo wrote:
> On 2/28/2026 3:31 AM, Bart Van Assche wrote:
>> On 2/27/26 8:07 AM, Can Guo wrote:
>>> -=C2=A0=C2=A0=C2=A0 return -ENOTSUPP;
>>> +=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
>>
>> Why has ENOTSUPP been changed into EOPNOTSUPP?
> I got a warning from checkpatch.pl when I add the new vops, so I change=
d=20
> the same for
> ufshcd_vops_pwr_change_notify() too.
>=20
> WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
Hi Can,

SUSv4 =3D Single UNIX Specification, Version 4. This is a standard that
defines how system calls should behave. Hence, ENOTSUPP must not be
returned as an error value by e.g. sysfs callbacks. As far as I know the
ufshcd_vops_pwr_change_notify() return value is never returned to user
space and hence returning ENOTSUPP from inside this function is fine.

If you want to keep this change in ufshcd_vops_pwr_change_notify()
please make it a separate patch.

Thanks,

Bart.

