Return-Path: <linux-arm-msm+bounces-107759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAxcHrfrBmqCowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:47:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A6E54CB44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6CE75308E2C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03DD32BF41;
	Fri, 15 May 2026 09:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nUwwcI8i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gj1E4WXV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682B6383C7F
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837440; cv=none; b=bMWxH6lwP/NtIqyeU5rtwRn4Rqvq1I6DGhZrdVK8bHwg9RCSWSFldDpV9Ph419e/2i2QKsgJQD5VpzYkJ0Pj9QmRdjAPnAhtnOC9oMgH7PXxbmdGH96P4wd7+x9tuWAP1F2U5m1pa/cVno5yN/Dq2wugkanxgrX5iHf4naOlNwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837440; c=relaxed/simple;
	bh=Y4BSPp0dDK26mTaTR0n/dia2UU9V4N6M5EHqaz7EZ98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/EiZhgji6dGNnIS/sqamPjmt//KyKfhURrQpQ3pRwaLLFPWwxz9Yl8P1Jcb8kv2jBpPfPlJxtvGZTeIts3ijrULnBZ3ws2q43bc6emAaGJ2pwKYSZvHBTuXn+bVlxiO7XEjSmO0EMt4pa6XCt5WvZ4dFA/DQS6ae5tGnsLUUFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nUwwcI8i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gj1E4WXV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5I3O33670906
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUhAyNz1XFXKod2vcUNqCBCCnku0MrI8ZdXb0C+8GzE=; b=nUwwcI8iMJ4KmfvQ
	G5qGhL6/oacw/Zc9sK9e8ZscpjkNdUX4ejU/6jJhYJYOu+kDL8hyrIixu1EHsT69
	cWxU2elMilteNuTN1eTqYLZoa3Wgg7EQKJV2qz2Hcx27TPGkYVJRRNbDgytwO364
	kbtxRpRbSmP5BIDtPXoR1p3p8p7USQQGRiyRFDvWvcqrrxHe1m7unNH/SO9xxRnk
	wBg39cgqLWs4iTPHt7CPPCRw19cxffuZ98jWSIPsfLcb6a2y8rylKuJ4HYryCnA3
	ojBI6CXU3rYphWbl2iJ/W64K2hUFVw18tMxfZEjHm7kaey9FJRMYT0aiZDmtdUAS
	thF3TQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2p58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:30:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50de6db1eabso20263041cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778837438; x=1779442238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CUhAyNz1XFXKod2vcUNqCBCCnku0MrI8ZdXb0C+8GzE=;
        b=Gj1E4WXV82mGnf6tl45c3A1qG8oIOWFRwWL2/GfzocWc0GpPz53Cegu17kz62LRJ8H
         JnTfXE3qwDYZTeGLuDUj463VyRc0IaV3HMzl75peu4uRoCgW3Ewa7Da1E4K3vVkWxK/1
         apto8iPT4HR/euGE/7OrGk6FznCVWSWtOxSANcK2Y0U3i3d4fiEu4biZGEBOpMZgqADG
         YrzCg4s4xdxU5uJtCIdGVmzSCNdQCYXhlr9mWU/7EC6dwlkXbm4DoYgOA6OjUG0Uy1qq
         Mf3bGGZIEzoNCIjiL61o2WY4PClqPeit0HCDp9QdpLRwrTPeIdBfqorlDBmamfGT0El4
         IN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837438; x=1779442238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUhAyNz1XFXKod2vcUNqCBCCnku0MrI8ZdXb0C+8GzE=;
        b=FaAaHg/emcQUTTH1/GWC7b8Y+BN5YrJEJZfngnzuwdFQgaWOkGOMDaiJMB58aKGHVE
         ESJMufAIvxKVuko9q5pYJ35q//v50megYEBl6qE1F7eiZ/EPhPqe5v75wdXUtVVi+YME
         7C8uTW+ZEvtd18V8pN+VjSCvR0p4ufaG0Ci3YBgWKAkmiE71Cdbz2ZtV7MPfdAMW2JE3
         /RhINKJ6i9zuWSpwR9nEy2vQEj07fXXF7DUQ/VshJI8+UkuMGddLWaeTI8ppmTWgzaPh
         hjqf1t8VdFEehZwra1hp9nvrTOG9zfj47hduvegK+i2+I1gHx3IDvYA/kChlxjx/e7ts
         68tA==
X-Gm-Message-State: AOJu0Yxn21wYqiEHIhXye4PFJvbClm9Kx1DklyyJEcOq1AWOEjtkCAuv
	nLKduJTvpkfQZG/Wa82O7erqojajtzRERnMj8E7DSUYpuwmg/7M7CJydlDBT7apNTmkhX6F7gIP
	q6zbYAhZ2T/4EZl2aDjDp8LFUnSRUdFRZ0idvTS037qX5WfMncUoYaNTndhofCYblmozM
X-Gm-Gg: Acq92OGUVPV4dWXspRHr9zR57e3hhRlRr1hcbb0U5GvbOd67Vf3Nw/Nqesa2VUdJVvh
	46rPdG0FASvNNIuHHuvik3HToVVxRn5D6M2+tWLd9vFVXZYxtiULr+lKZ04UMVNRk2X9HZyfNiQ
	BwflSggKzRKzTrk4kgksZMLwkXuVvfME6u6xAmQOM7d9JKv9aDoNGpR11k1RqV3SVufqVZP/VfK
	2uk8D0VS1FpnngZVtKz7YFWxQrOMUFG3tUJOOKn8rNBmhyHAoa484vHf58r7qVZn4m+NQX42EwR
	CTj2negcO0fdr0cLmFtXcY6huPn7+Wb3qsHbuh4m7GPyBC6TH8XGGeN5OeePhttKZRSPSCH1Hi4
	zTF2l44wFDkVszKEdIsgPhA+Yycmp5QPWUAU+uiZ4DpPK+/+74mFpyDfTdrhOXPlh8i6vTXb89p
	vcoKrTCNbv0o1uLw==
X-Received: by 2002:a05:622a:1207:b0:50f:bea5:52a with SMTP id d75a77b69052e-51659e99e40mr30151881cf.0.1778837437761;
        Fri, 15 May 2026 02:30:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1207:b0:50f:bea5:52a with SMTP id d75a77b69052e-51659e99e40mr30151451cf.0.1778837437113;
        Fri, 15 May 2026 02:30:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310d510fasm1765815a12.11.2026.05.15.02.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:30:35 -0700 (PDT)
Message-ID: <1bf1558f-19b8-4052-9609-52039f820bbb@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:30:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: spm: Add MSM8960 SAW2 CPU support
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
 <20260514-expressatt_cpufreq-v1-2-487fd2d78859@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514-expressatt_cpufreq-v1-2-487fd2d78859@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5NCBTYWx0ZWRfX04B62aKlnVv9
 uuhPSpf6nfpunvv6odG/JbBo+ysolnD51/KcTssxOg5r/Np4UvA01bPtUi6ETfxRIrW50uADYUK
 UJDsOS9kYe5hSH0qEbFi01RrrrEt9qTRwnayFzWE6PYekT2D6SbLNzIF7Z7tToAPaCXXDfi0G90
 gba2CdDOQ3g5V0sK53RdTLXb3uJXJQsQCgzOcqVCzukGGi03rq9/xyX7GUleOPa/nf+JFi7EeSM
 wI4+h4uZss62WTtEtbWq5wSdBOEnCB6C4K5Mc2IU1+dchQn6mfBCEXZN3MTNDTQkOKBFg+9iNWZ
 QHffcO3LXEY59Fi8mZPmKL/QVWTD1YaETTAsv1VI5HXfmW78zhqxuU4rD8R37WjoWRSKaE+oWbT
 HXwMtM7Ke6a5C9IBhPwygTJDm+/1ais0O0gAKRwO8y47oCSvci3IXsjj9Fqhf7pe4+eDvx1Qvjf
 QyYvgYqMhom9HsLtunw==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a06e7be cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=oA5LrNwOAAAA:20 a=pGLkceISAAAA:8 a=CuIG2ROkbE135izgqDAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: lxOLlzx1lo8rnKlr5l2zOlHObQnsEBo1
X-Proofpoint-ORIG-GUID: lxOLlzx1lo8rnKlr5l2zOlHObQnsEBo1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150094
X-Rspamd-Queue-Id: 24A6E54CB44
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107759-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/26 9:04 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> The MSM8960 uses SAW2 v1.1, the same hardware version as the APQ8064.
> Add SPM register data so that the SAW2 driver can program the correct
> SPM sequences and PMIC parameters for MSM8960 CPUs.
> 
> The register layout, SPM sequences, voltage range, and regulator
> parameters are shared with APQ8064. The only difference is pmic_dly:
> 0x03020004 on MSM8960 vs 0x02020004 on APQ8064.
> 
> Link: https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3353-L3381
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

[...]

> +static const struct spm_reg_data spm_reg_8960_cpu = {
> +	.reg_offset = spm_reg_offset_v1_1,
> +	.spm_cfg = 0x1F,
> +	.pmic_dly = 0x03020004,
> +	.pmic_data[0] = 0x0084009C,
> +	.pmic_data[1] = 0x00A4001C,

Let's use lowercase hex

> +	.seq = { 0x03, 0x0F, 0x00, 0x24, 0x54, 0x10, 0x09, 0x03, 0x01,
> +		0x10, 0x54, 0x30, 0x0C, 0x24, 0x30, 0x0F },

I can't see these values anywhere downstream

Konrad

