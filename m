Return-Path: <linux-arm-msm+bounces-91353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKyIJdO1fWlXTQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:57:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCDEC12A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28A9A3010149
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 07:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A86F31ED9D;
	Sat, 31 Jan 2026 07:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obY5bTeh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBPa8Dhw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F71E275AE3
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769846214; cv=none; b=RxCfVOibYSNQFZVqlaPFla/aZq21n/N9H8E36lHQVR1POzvSEebt3pUy5RYzi2/8SzeYtTu5lX7INIW5fVJcAoRqcGcLIX8FDT1gJ2gMs7c0HmhibQ4FLsZGf2PXKtluNVZ1x4cXiTer/KRN0j4I8+pBV8f3BKnVS+q7VvhyNJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769846214; c=relaxed/simple;
	bh=sHEicpusxt1BhCWPqTEoWD2qVeq44bchRv74bgEZmSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCNtluIT9iE1IwCT+hv+rw42zGztJ3nZ3+bbJs6AUviKoGHUNPP94xryAm8j0oE5aJBOAeZAgCFIuKuzKQdck76KonC4SQe4lIuxjYWC7hps+XBgt/g//VtCLMm8UUmciivSuWloI8xqyf8wShGw44HWOBP6Iu5UpjvIXrit/B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obY5bTeh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBPa8Dhw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4Shfm1510027
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 07:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PFdJohiEcyNjLvWuefXTpcb9
	eDVSKkB5aq+atHh5Jos=; b=obY5bTehtMKIDHJwW4DzRjMb7E5VBVjBZIW5vkmf
	Nvp2cD2CFEoPe2vczcxvwYgTelyIrlv9Hy9DdedDa86WHLLPVeInb0vqYmrNIYVC
	oFGIGUkTYK066JpphwTlWrQJ0kFOsRuNHQFacp/grXsRuOmAopC2EN/D1OxgTcfN
	c1sQPa9c8aF2xCrOwTShQZrkM9QjCfSZvE29DlZQ0uKrt5x9+nKPRU5EtnW3Ll4b
	EpcsvSaJDulSt8f5ssueoN09aoRKjhMy7ttLZwAqW1SAc/tDFTnDvr1GQ++F08Uw
	lOOGIhnJtBbFYayxEPa2oibdxyzqFwHW9GDpKQMCd26d8A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard0e7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 07:56:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c1cffa1f2dso1153265385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 23:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769846210; x=1770451010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PFdJohiEcyNjLvWuefXTpcb9eDVSKkB5aq+atHh5Jos=;
        b=OBPa8Dhw7H3+NKA9spTHblGpe9PnA9+lPzFO4XCFs8NfoMc15bO9CVJIQdaIEIYdA9
         hGPqmJaa8DdSgssvWERJTZqDCbysdo0vqzh5IPHCZgS4Jfw/t+/r8uCleIaxFjXw/IDO
         TLWDg19RAH7DuGQNcynb964i3GI63jM4OIodrSATZi8vbBLl6U18NwPMgIeqVyThFaoS
         wY9JMUpiHKATZXBWrX6N44ecfX1mKInt5QX5x58HJXc32oBlcNkRVCBkb1XhtUDgVe0W
         TuWh/6WOFUdBSIpMIZt77UzFP2RVASloN0daBzmT0fIVW9QQjwmGIlVwAV81J1bq/Tqv
         YJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846210; x=1770451010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFdJohiEcyNjLvWuefXTpcb9eDVSKkB5aq+atHh5Jos=;
        b=ON/J1nhursigkYhWOf2OYnQnimOpgMiOAnFDV9JYjGfOpEFUX6uB0SWMnX9bso7AI8
         NCLmnMYZvhg9nMOBTa54rIiwwptvcY5Kkt8fmed34/bHx38EN6EmT+HN+k0qh7S2zah3
         fvrL6KdClAa5iSYMdFhX2BDWE8/xxUbQCnStZeUaidda2+tq5yxNOI3/i4G4YSxipKzV
         djwDFyXrovXYUWXfYEhYVtoACfbjQoFdm+5N9qGkok7srMrVgg5FZjGR2T7o3eYDRBA1
         4koFIalkefW7fXOaAZTWL0MHzeNfSbla8gOE9k/yOM0nrqiExrKe+OvehUxtWcK45iPq
         FEhg==
X-Forwarded-Encrypted: i=1; AJvYcCVmuNc5wwtG8cg9H4CoqeV7Mh/cT6ShSfxhFHazJQBnW1Wze7A+m76Nw4t7x8pzdanuo33JMk0VqUR10Oew@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbm1Aqu1PoO4D4BYl4s66F6gf61uohstk400YCNG9TTVjylZWE
	ncbnQwRZeCIzWCksPTpoGQkLd769tielvKyWsgHy7UzrRckkesh4uS3GFFWgNTHeRR/vFdeKOIA
	B+VHzFCvmv0pWv56zCj6+x1emJrn/TB6Q822neHqGR3I1laqXNNaPHf7Yg/QA0Azh7Ht6
X-Gm-Gg: AZuq6aIhsKS6VZf4RArqy/4v5eDCi2C8DcNGILeqTq6gbh2JwzuA12HEwsF5hMiY44V
	94YPk42ufFMwPSoBPjFMj4VVNknzbjyGtGel4fGznhtuRjRSvB4cLHUDc8w/x+m0gg/vkl8vp2X
	kgNXwfzfUYl++nDSBtdpJZvcffxFmBTNi8L1peZ1QHA8zqAVjji6RYp2z0xbse7Qm8U6c9YkbCf
	0Za/OSxLQHPTcGe9suwjO6jZVkcQ3BMLfVCPBhRgpeV0d57/5Y/ajNtkELKeQCygSBeB8LHeiVw
	dkIJz5Tx25ZxcVsrw1b85pkSnJrWK7LHgvH7MQhGKO9bA2UGEP0Buo+hewu1WAXmCOLfxgVM2Ju
	5j8ELVxviBFaFDbOWKBFSpaKYmCKLy627OYHuKX0US3IMcI/rLPQbStQYmtAJAqeLHmpGUWJAnU
	l1tg+KFFdOAJGCXPklNwD9xPI=
X-Received: by 2002:a05:620a:d58:b0:8c7:a39a:d51 with SMTP id af79cd13be357-8c7a39a0d92mr831914985a.13.1769846210528;
        Fri, 30 Jan 2026 23:56:50 -0800 (PST)
X-Received: by 2002:a05:620a:d58:b0:8c7:a39a:d51 with SMTP id af79cd13be357-8c7a39a0d92mr831913585a.13.1769846210035;
        Fri, 30 Jan 2026 23:56:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625f6c13bsm19324641fa.30.2026.01.30.23.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:56:48 -0800 (PST)
Date: Sat, 31 Jan 2026 09:56:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add remoteproc in EL2 device
 trees
Message-ID: <5qplhwnkiwhsfr5rxzjqk4v6rtvpqkvsg7qxvrpkqd3b7vjvob@jffvv4fvvd3d>
References: <20260130073113.3091884-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130073113.3091884-1-xin.liu@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2NSBTYWx0ZWRfX7w5EGEJHSjef
 iFfelPqjYCep9Z9ONgHOM1Gl3UScntnVT5c4mj7MHAnaeIbkj3u/fI8aRPTvdICnBv9vx2lzKEH
 RsSZi8BRWP+KGqkThuVIf+qWH7JvSe0NmYeLPLEinSbCspt3J9TplVxNLv71B48WWtnXN2JJPf6
 ghSlTmqSi0qgLGAKTDDohCXodhq3eic0wmOsFaS9FY5V1EsmyJKkdQp7ukVz54hUV1nsGKStu8w
 wv1ayZ7/AAk2YPeJwr8C3CaRX/3zN6wux1yz93x9gxQmGvXYP9a95U178iAEmhncZUpZ7Aw3Qpm
 rPvvMRtBpHm38VHCzgwAj7/6U2V/JzmNY9I6GUJaTQBU75CGdZtt9nZMDccM13wi+nuv055SSnq
 HGGmEGgmYhESaSpRbZNalQZA0lHgujfyiBQ5t8el7Yjgrp92E/B0PRYFvA5PVdoGQMvP1IiK9u5
 LDLunY11K1F4FBDx5eQ==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=697db5c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7aDssnv-2FInNtQMBZEA:9 a=CjuIK1q_8ugA:10 a=eSe6kog-UzkA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: t_yrb-v9dBlnIqhNIjIOgnJvqxMIo3tL
X-Proofpoint-GUID: t_yrb-v9dBlnIqhNIjIOgnJvqxMIo3tL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91353-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3FCDEC12A6
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 11:31:13PM -0800, Xin Liu wrote:
> All the existing variants Talos boards are using Gunyah hypervisor

Why are you mentioning Talos here?

> which means that, so far, Linux-based OS could only boot in EL1 on
> those devices.  However, it is possible for us to boot Linux at EL2
> on these devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU streams
> are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
> by the consumer of this DeviceTree. Therefore, describe the firmware
> streams for each remote processor.
> 
> Add remoteproc to the EL2 device trees to generate the corresponding
> -el2.dtb files.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-el2.dtso | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

-- 
With best wishes
Dmitry

