Return-Path: <linux-arm-msm+bounces-104756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFZZDzKI72mtCQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:00:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7FB475DC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C45DF3079877
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CAF32AAA3;
	Mon, 27 Apr 2026 15:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="G0fCgTE5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A0E29C325;
	Mon, 27 Apr 2026 15:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777304608; cv=none; b=eZu7DIV8avBTiT/U5W9TMT2mIetGb6xul4xUMmGor8TXsfuGDnj+Xxs0/BbvjIpSBODLJYUCIN03oiKTbZDaXgEeHzuVyntwDFokNDElOwYDEx51NoT9UIVOj/u9OXLc54LbpI2BiuEm858V5zgZG7GeAQRV/dxUWd/Y1ZamHTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777304608; c=relaxed/simple;
	bh=bo0dzjYtrvdWf19YSaqNgbZbQR8Dz0tHyTrqPTzO1fM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ubpg2yPq/F/fmPzoP0l8Edeev7owguuhkX8uFKQe5B5euQojKpqOp8YaT8fjQBy9n/KDnH/bUsFjQDKZ+nezFW9bGVFuumR5EQGD5jH3kVfcCKBf0uAm9aVYVdSOKcc6cQASJs+Cbi+KhREK6CggWkj5vDSUxrV4iwQTDFTQSxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=G0fCgTE5; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4g47Bd4nnZzlfl5V;
	Mon, 27 Apr 2026 15:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1777304598; x=1779896599; bh=hDmLsryRdBaOq6ergwAZFKH/
	HP1fZNCKKsGnvVjX+oU=; b=G0fCgTE5UU/wXx3p+6YLBozng29ybrxvlI1E8iy1
	XJ/aNUOQudoTLFw3O3X49ot0iCv0ctt/D/8jENgkB2/gwq7gCF3pD8EbBbe5xpRG
	9crZsTGxOrX8ESyPzxbKTOKEprzxC283R7eB1u/RRVH98/fSDr0RYELbbKSzb2zx
	e1I9g/oiv6hZm+vW3wKT3cS5gyV7Mb36NXJNc6VCucO6A9KbrL+il6VYouHrhPeK
	u+Zx+yXybEE+mwj+6PXB7Lw3qA0q3u73eVbvPFMeIOz+CizxtwVgB+H3j4tk4CDW
	twera0iWZVWp0eCZ+v539R/7c473RGhr2vc56QjJ/SNxOw==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id EIofrjMLTe_4; Mon, 27 Apr 2026 15:43:18 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4g47BW4lx0zlfpM9;
	Mon, 27 Apr 2026 15:43:14 +0000 (UTC)
Message-ID: <f81746c6-b70c-4410-831d-8f3c3756d76f@acm.org>
Date: Mon, 27 Apr 2026 08:43:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: qcom: Unify user-visible "Qualcomm" name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260427070048.18017-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260427070048.18017-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CD7FB475DC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[acm.org:+];
	TAGGED_FROM(0.00)[bounces-104756-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On 4/27/26 12:00 AM, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


