Return-Path: <linux-arm-msm+bounces-83046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7A0C8017A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 12:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BDDCA346381
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA7B2FD667;
	Mon, 24 Nov 2025 11:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GX52aH3a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N0Ktl6QM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300E32FB98D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763982395; cv=none; b=SixK01cV7JH2376MP+Xlll023zNtQ7byPdricy3nW8Es2y+mDdaBJlw+FVD+9KQh87x+83JynhplVTFo/zxtOoqi2PSnhg18BTxWy5421ycMFw//WS0wvBT98zBaNf6D8Ri/Y9eGQzjAkJEQvJffkalrTSmSVGoKQOq7U5/ieBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763982395; c=relaxed/simple;
	bh=CJ8dUbSlQ7jCsg6xWPRrcivBhiDaMlMgVaDwsedR+2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FWnXoW2OhB2iZyd16RDEk3OpGYJmDBMekXfh93ZTYOUEitd8OQWp5AkR/kOlexsRei0jW6QByer4XKuL230a+j1pf+5YQuFYGUdfBD0EOTkFSDQl494Uf96Mocu84MpPxmtMMSw1tfOxOQZkVI9x6uEdNv7axNCBDHYaevXyT/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GX52aH3a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N0Ktl6QM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOB6IGs4005597
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	umhaVYhqzRJNctwN1ps//3SxnGdqNok23XI1ZVz0zLo=; b=GX52aH3aeaxo5EhJ
	fGeKBxbfcQ3XwiN7haa7WCGydj3zRofwqmI9qpzO5yKK2gFlv66kYHqsmbRUIQtM
	mWZhNAQ6jGHRopXALxVAFhrP9t4gy2MqS1t2yknUV5oalmG7GkpvPEvoG2PpDHWQ
	qnGPq8ndq9e+FLI5TwJ5TUWg37p84sL3t+w0IopEk738QmY2cQli0nVVSdqzi/0K
	yyVSbWJB+kqp5jlq39hXBoDQqWhUA3NBVIz1g2XqVVQf0JtBZfx/g7z1r5Yh5vtX
	HUd12do/igez8rLdLP6D/BnIwN95Rqs7KDFzxxKp3OcScxDH7nue44v2A9klN3Fd
	MR/ENw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amp6h002b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:06:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2ea2b51cfso119762785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 03:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763982392; x=1764587192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umhaVYhqzRJNctwN1ps//3SxnGdqNok23XI1ZVz0zLo=;
        b=N0Ktl6QMDZ3VdwxHlh6ikNPD9UGMyUr4hHb8jZpQER66MXK6RtVeSOuqNPWtXLzBCE
         JG6LFFVmhXzZ/o91fAxKRyNaU3OUxVee6zQ0Q30ABDj+ss5c6TLcbaXONiP/WxH++dOr
         DXgSHlW1OZZaMMUtkeWz2a7/JdAUGwNk8CrFjYKu/acNrdf8s1DoLg9RD7XUehz7gsmq
         RzwWyy+YLvJqvfaihikKOSXjXEH3gwTSWsqTXj4ivsLOg/vKBZHVvgCdSwI1I9+TWESI
         g+LtPf0/lxRBbCf4qf5C9MrBvX6PRTauPMapuGBlUUbIiLVcZvggn+O4rEgPVulXL/pW
         nztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763982392; x=1764587192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umhaVYhqzRJNctwN1ps//3SxnGdqNok23XI1ZVz0zLo=;
        b=ZkdRbfvCE9zHfNKREyxa6dOrSQQJjiFZRa4pnDWH9lk0Jxp8VUm5FuyOCZYc2snTvr
         3DOf3XINXO/oCdVQNA7C7QU31WFGEraMEnxJz9LKchmDyf1BWMGbUBHKd6JFMDq4Fn86
         5xQfE7kFg0BxWdfcqWLoso1RWMhgTwaiypqskHeqE8gaToLklI2ODhJ2xXlOufX141h/
         DtapuaqZKx2eTRYdAP8qCpLnXz1tBcA3dRBaxeBmgfisAaRnYPfCRMKGnaM2FgGBwdBK
         PdPX1vSVOLBbQjX4MSTVyKDndxHMd+lNB7CmOpBFlodxJh+aiwXeBlnVN3KAmB2wlM+h
         NO/w==
X-Forwarded-Encrypted: i=1; AJvYcCXhCBOk5sNBOfnhXYxyzyng+nY+LWqYK0qxsHIl3rabZeO/C6TQi4/Sj0xNAa1wOKzmypDLbg7kOsTxIMhP@vger.kernel.org
X-Gm-Message-State: AOJu0YxXM32XlwrgB2DSIICNnhN5XLrxzn2n5pk5hHfA5rQyBJqka4Xv
	sfTZukhyhD3Rqpjpz1ic5Hb0dZ1gnS4CdgYZ/icDwsI8w1PaJfKa7CF9HiWTI2iPptKY+SkHzts
	hyemg9A2M++MgfKO7CikE1L5rISj+oKDIp8MRXPabH4+QSXGhbk4FipVvPOQSyUPZReA0
X-Gm-Gg: ASbGncuF28WDfaAeD6xJtEA6E1WQ5Sltr8Dbxll7Ep3vLwJcDtoLF7/jOYZ+4/TMIF8
	fxeA1UMjJjUKidy0TtiAMKX2vhf6H98rcDIm0Qob7LK8fJGNPClGFSZ2hrvJu/uKwfYv/+0tHlz
	FP3m2ghnsx6e/Hw8brRcm8mMDy9e2xcvpRHmC4tdMbbDc00hrTco1qeR+LXRoADWA/ml7y+uUqu
	Z6qKKEjZxTjk+F1D4Eo1/0qg3r2zHvBoDlLZpfqMMCvl3voc80YrRdLjlfwwNUU7dIydFCbW4xk
	h/ExVfZzgANg1B1R2wL8a4lpOdAgSyJRloD4BQ8eMM3HxJhWgrs/J0s2LnKdDYPXwwxuQE42njQ
	hFNPHtv35LWQxPA6T2DJoRIVHxyPGCN/xreuuwk93skRbh2w6r82JF4pnHVRfQaL/AFk=
X-Received: by 2002:a05:622a:10e:b0:4ee:1f0c:c19d with SMTP id d75a77b69052e-4ee5b45a447mr106741221cf.0.1763982391951;
        Mon, 24 Nov 2025 03:06:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqsaQwNFnOAMYmTTZx3DN112lIwtKTFS+z3griOhtKAWBaF+LSoOoX9RPfblnZNkwsXl78LQ==
X-Received: by 2002:a05:622a:10e:b0:4ee:1f0c:c19d with SMTP id d75a77b69052e-4ee5b45a447mr106740881cf.0.1763982391577;
        Mon, 24 Nov 2025 03:06:31 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363ac97esm11984833a12.1.2025.11.24.03.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 03:06:30 -0800 (PST)
Message-ID: <2622656e-9abd-4407-b1fa-228da9959d60@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 12:06:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: vdec: restrict EOS addr quirk to IRIS2 only
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Viswanath Boma <quic_vboma@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Mecid Urganci <mecid@mecomediagroup.de>
References: <20251124-venus-vp9-fix-v1-1-2ff36d9f2374@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251124-venus-vp9-fix-v1-1-2ff36d9f2374@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA5OCBTYWx0ZWRfX6Vl+KIbWUXfa
 WvSNgPElvVhRLlep/HsxOTJ72sOxzJEEtdfpJ3IXaWgvt8uf9QLXHZtctvgYCejsbOzVUF8nMcq
 Cr/xkwqNHOHD0hx1yZ6O/nrXvQk7j7GI/gWSugk8QZZfRHgaDv03ReM74w8aNsH7VgpkZ8xGRM5
 pWymT18zm3Hk4jtnKXphvWT6+0eVXH7TURU79/afuvKP+oDupArr1knb0sBoViRvP25nhxqmIvT
 lHRYs1lRCR3tTnB6ZbcL0UaAKSYS1VXMyJ9VqxB56yAnBo3XEO6OG2N4Ar08r6oJdfUxmhK7wA2
 mA7Y2fckRA9+qe297nEUeQXb6P3k6yZ/Rf2Y+LQYaQcNC7fRLelRJINtbnd6XsjS1UaP38WzWrD
 iI1O8h3zsQl7bOah0/yXlxYFarnz5A==
X-Proofpoint-GUID: 4ED0csyl7FvpbkTtCRsUuFezMtLjQMVf
X-Proofpoint-ORIG-GUID: 4ED0csyl7FvpbkTtCRsUuFezMtLjQMVf
X-Authority-Analysis: v=2.4 cv=GoFPO01C c=1 sm=1 tr=0 ts=69243c39 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=wfby7z1SNJwdpBdL-ZgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240098

On 11/24/25 11:58 AM, Dikshita Agarwal wrote:
> On SM8250 (IRIS2) with firmware older than 1.0.087, the firmware could
> not handle a dummy device address for EOS buffers, so a NULL device
> address is sent instead. The existing check used IS_V6() alongside a
> firmware version gate:
> 
>     if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
>         fdata.device_addr = 0;
>     else
> 	fdata.device_addr = 0xdeadb000;
> 
> However, SC7280 which is also V6, uses a firmware string of the form
> "1.0.<commit-hash>", which the version parser translates to 1.0.0. This
> unintentionally satisfies the `is_fw_rev_or_older(..., 1, 0, 87)`
> condition on SC7280. Combined with IS_V6() matching there as well, the
> quirk is incorrectly applied to SC7280, causing VP9 decode failures.
> 
> Constrain the check to IRIS2 (SM8250) only, which is the only platform
> that needed this quirk, by replacing IS_V6() with IS_IRIS2(). This
> restores correct behavior on SC7280 (no forced NULL EOS buffer address).

This really needs an inline comment, since you provided a long backstory
explaining how fragile this check is

> Fixes: 47f867cb1b63 ("media: venus: fix EOS handling in decoder stop command")
> Cc: stable@vger.kernel.org
> Reported-by: Mecid <notifications@github.com>

This is certainly not a correct email to use... it will at best bounce
or get ignored and at worst cause some unintended interactions with gh if
you have an account registered with the email you're sending from 

I opened that person's GH profile and grabbed the git identify of a recent
commit made attributed to this account:

Mecid Urganci <mecid@mecomediagroup.de>

(+CC Mecid, -CC github, fwiw)

Konrad

