Return-Path: <linux-arm-msm+bounces-64852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46239B04682
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 19:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84C4A188E562
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5634E25E814;
	Mon, 14 Jul 2025 17:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="qeys7ip/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ABE265630;
	Mon, 14 Jul 2025 17:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752514153; cv=none; b=SCI4RuF0xAwKgcs9MlrEhfy3OzXLRq3iyBr81EFpb7Vt9l8KuI8FMRaY2b1sQeNi4fgmDTr2hwxVQdWvhcy6CL9bn4RhO0glBMzn/vqP+T64IIVmbVmcLkp/35wN7HWu67Wze/Py11Z6zlLfRMGP+xkoBDv09OWq/epNMwd487E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752514153; c=relaxed/simple;
	bh=SUY+mA54gj2mVgNyrXv6SgFTk3a/RhARaO8UlwEzOjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kA0VJWxZqXoXVmeFFslOnMmAB6lxwXEO3GFPcbdLmEsWPZHmo08w64J02kkiKoXhFBBYQdoDPBo4EaipBqa9KbzKQhNpJa88hGhDWhtnK7vwFg8XelsHCDssXC4QyzhkTJwjYko39zjBllKZbcTL9DET8cnJeJR2s0J9bIkzRP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=qeys7ip/; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4bgq7B2pmfzlngSF;
	Mon, 14 Jul 2025 17:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1752514148; x=1755106149; bh=A3o518QAyKyHrEr+zFPEn2j6
	kZg4PTQ65nmlzov72rQ=; b=qeys7ip/Koaqfl+uVm/xPKSlonOfusJ2Jet1zzyw
	5R6Ps1hBswnWYqLhEpTIZDPU5pOxm0PYclO1FjeI8cONL1AiviuwabXVpEfNFi/M
	QRrtfjgwJpcwtyV4wq1XuGCUe879aYYQBLqC9LCbjYV+hnhW30xaU+ipLtNQmCn2
	+Xnw6+fD1B+n4s7YldcNNHFFj75klYWVwjCEU6yTNqqVnXzkpHkEcDPw176HnNAT
	EDbxWZetFmwr3cJPjmySs3XHlescfLPx2s2rjWqYkgVMCno9IxhepgB2oyP0/9vM
	DRlLNl2fQEjgmA2VaXdMvvc2BWTKKdvFX+UZBghmVVq0pA==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id CLmEdSVDWbWD; Mon, 14 Jul 2025 17:29:08 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4bgq6y4Xkkzlfl2g;
	Mon, 14 Jul 2025 17:28:57 +0000 (UTC)
Message-ID: <ef319052-4fe7-4512-a6b0-e9148e1414f4@acm.org>
Date: Mon, 14 Jul 2025 10:28:56 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] scsi: ufs: ufs-qcom: Update esi_vec_mask for HW
 major version >= 6
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Nitin Rawat <quic_nitirawa@quicinc.com>,
 James.Bottomley@hansenpartnership.com, avri.altman@wdc.com,
 ebiggers@google.com, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
References: <20250707210300.561-1-quic_nitirawa@quicinc.com>
 <20250707210300.561-2-quic_nitirawa@quicinc.com>
 <ldid3ptehto2kmzyixih73vc7tszwdiitr74rnwklxeeekwxrn@mm7zmyfickda>
 <5a1bd678-c935-4c1b-812d-a249f1caebb7@acm.org>
 <yq1jz4a8z8h.fsf@ca-mkp.ca.oracle.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <yq1jz4a8z8h.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/25 10:25 AM, Martin K. Petersen wrote:
>>> Maybe we should get rid of 'scsi' prefix since the ufs code is now
>>> moved outside of drivers/scsi/. Bart?
> 
>> Dropping the "scsi:" prefix sounds good to me because this prefix makes
>> patch subject lines a bit long.
> 
> I have attempting separating SCSI and UFS a couple of times in the past.
> However, there always seemed to be at least one SCSI core change
> dependency per cycle which prevented that from happening.
> 
> I don't think we have had any for a while so I'll try to do two separate
> trees for 6.18.

Hi Martin,

Thanks for the feedback, but please keep in mind that I plan to repost
this patch series soon, a series that includes SCSI core and UFS driver
changes: "[PATCH 00/24] Optimize the hot path in the UFS driver"
(https://lore.kernel.org/linux-scsi/20250403211937.2225615-1-bvanassche@acm.org/). 
For the future, I expect such patch changes to be
the exception rather than the norm.

Thanks,

Bart.

