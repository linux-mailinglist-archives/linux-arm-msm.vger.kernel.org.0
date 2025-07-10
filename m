Return-Path: <linux-arm-msm+bounces-64377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CE5B00260
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 14:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A535C3BEFAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4694E262FF3;
	Thu, 10 Jul 2025 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFU94fcN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27E125F96D
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752151618; cv=none; b=WLONOiZqqqSOkJj1+ps2+PlNQN+Jye60KgoN/4tzJ47GHEemlxvejSTpo9apnmKfvA3Q7wqnImggLSGFoUPzKI+mojPQ9zAC9vGLtPiOuKwRwHsonQuWypHVRjbqLTvPN67km4T1aWPm9E/m7Gv0UUoEceTqIACTPjgmDmvwR+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752151618; c=relaxed/simple;
	bh=na+u8g59eooGkQR29QZfM0thwy/I+CVeSWbBhPqsdd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ea/hNZ5P4M7125da1+PmQMYENrJ2dau9kyDtGD9Galvz3P5GqU9UT7emBNEuwMQsBGPOz5FTVJvLKeMSnSyRHzZ2j4C6+TZM3szJ96kbw4QuhWqwsI1vd7rGywLqvmV6ePkWJe44nEs3q0Njy1Nhd+V5mTun2Rz3RpDXzvinHnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFU94fcN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9MJMH002667
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JtA4kuwweCCzbSwKPwc94SCzNcShIngig3W8sfl7IDU=; b=hFU94fcNH0RxHwCg
	HFGHrz6MPMYYMndzbGlACDmvwsDGTYSijgIVdSvK1+4Q6rm4k7EAh02keip5wKfv
	oJ27WAMVSi+ZeYZSjdGXHj5aH9XnBsptU438zEAHuzr1O9J8drCeEJ3muG1qXSh3
	/MlAPX9kqou7Aj6Q6kWFQ+mXImW4jQnmweZIKVzUC5KYA/0bMPm8qPWeczWlf/6U
	DYKCMmowZznvWV89fjL7N8a9rgDK/e3L7n4iB5pVv5ccRCtFMUGkaBrR5VfgiGrB
	YQG892Xi12iv70HKn/uPZn2RS8hwxz0vhG/Hxe6nmQms38szSwQStWYvqsKkx7Fh
	/6Bfow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bg8j3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:46:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7dbce38d456so19348185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 05:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752151615; x=1752756415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JtA4kuwweCCzbSwKPwc94SCzNcShIngig3W8sfl7IDU=;
        b=Ow89zjJDoHpyH7eCrCQlm+NSYC/gwCRJAL9PiEBJeQa3lYxOfTKZZ/vmgh/5QVgzyJ
         Fbwiz7/GY9G470brEC09/xvCofwGxRr5UytyfUORbBd2M52fxwoGOMHnH9P8h0YLCGga
         gGzNvqRVp/3kEg5nl8Fh6KNDIofdx/ENTciwCbRE+LweiMT4/ZIJ/P17YihDeitX4VV7
         wFeuUQjGmURIDfzA/HKamtuDSNCjDK9PPhxwuWOGl0kbdYpWNpgFK5d3uHBj+468nJnF
         qfAMQoi150O2AxHbN4wzECQTzLsQ5kFQh6eaaaWTcFn0uDKRlIueyzSjzbc+oyrs6YNM
         cR4w==
X-Forwarded-Encrypted: i=1; AJvYcCXUe77f0HyZft6Ys1VWtP3cGYdrUnXjVw2JbW0HKVcr3yicn3dn3SHH231BxgNqiOiUIW/OlrzDIybw0y+v@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8DbuX9u9haX+x/GQw0f3eoZMBd/+viTupoJHV/IsCZP1gSWI9
	CJDtDbmxvaqAZ/PhQMkv9m6u2u6GMkhrCQY/LEk0p0f9Fwsu6gLzTLKnYuBQySuKtlwxqLI8wPs
	oYAWbJhsR2LvIY98v7kaSuYtdaOGZZKudKUkh9XTD5llIv5NciQRWBu50N+2zBv+bt0Qt
X-Gm-Gg: ASbGnct5PBSe2allG2GHIBa9i1XZp6hO9fnoac7PyXA1HS+OqTNDkufAbEtdLwZFS+e
	IqPgLquBeKDtcInobgrg6c71epkoPzwOJ6LNLcFSzoOrWcNqtPo/DXgGjRe2GNFnxVn2ctALGyg
	1a9jXayLivPQoeJiPxH7a3gxiHlIwJbvvBPi8epH5SQYzK3Ufseeu8OdiNblwxxoLYZPGeCXxii
	Cf2W4t9RjHO+o3CK6H/RqQbPkqwarUsLdWo21nT3qNOFNjt6VhNckKoJ/1n8ZhKEK9cQqEnnpPF
	StiJSykKLqT7263ugcMTT9PghzkRkDMMNDMByZ1THoTFcmT7xf8O0CeuP+U43o1NABstpyB1WBp
	9KwE=
X-Received: by 2002:a05:620a:488e:b0:7d4:4aac:33cd with SMTP id af79cd13be357-7db90552afbmr345643385a.13.1752151614540;
        Thu, 10 Jul 2025 05:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2fKFA127cNTfsAIaYwVMHS86Ycrn1vr4U6fqBaR9/PrG8hz7GzSfVNTjRbbEfFWJGJLsDug==
X-Received: by 2002:a05:620a:488e:b0:7d4:4aac:33cd with SMTP id af79cd13be357-7db90552afbmr345640985a.13.1752151613874;
        Thu, 10 Jul 2025 05:46:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7f15803sm127935166b.70.2025.07.10.05.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:46:53 -0700 (PDT)
Message-ID: <f80d4e32-0f28-4a90-9db4-05c95e260658@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:46:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] bus: host: mhi: Need to honor sys_err at power_up
 state
To: Vivek.Pernamitta@quicinc.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
 <20250710-sriov_vdev_next-20250630-v2-5-4bd862b822e8@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-sriov_vdev_next-20250630-v2-5-4bd862b822e8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwOSBTYWx0ZWRfX/f4fv+NXYqlh
 QI4U4LADgQr7drRTDJwEr7lX3X4/r1dqvuw74fKPEVeNqcrKgCWhZ06a5jZmAo8sJjMOPseDnWb
 3Sdgd4+vUAt8PQXWd+sgi03LTONSfdVG/ONiWxEC0brhxkTjwat1ZTdf6c3z3aa4+/8iwBlpOqf
 gEEVmCqeKARAKeQveE06d8nJSfu3nX2CtjEl+x76seeNh2boweo270YA5CQtlTEG6oagFHjyhX3
 bz8wi1HTTZYmL3sv3YcH7H/x/QsfzksqF3/lL/t+7FagU0EdjfK19JLnhboj7zQ64WlT/jQa/6/
 FxnHhCWvcGaQDQj9mTBjbPVInZuJXrtVSfRpTRF02ctw6SqK8eIl8Z+j/F3ERe93YrrpKV4zixS
 bFOyQstQ0T4/338pJlINLP6ks07ToLBswwwTbT1kav1cpVVdL2WagI2IR14QDELsiOHP0iUn
X-Proofpoint-ORIG-GUID: r_xRpPOIaHvJGsdrzj-cxb2I65RtzjRO
X-Proofpoint-GUID: r_xRpPOIaHvJGsdrzj-cxb2I65RtzjRO
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686fb63f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=oYOKNLqQD3L5wEaBywQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100109

On 7/10/25 10:58 AM, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> In mhi_sync_power_up() host waits for device to enter in to mission mode
> but SYS_ERR is an valid state, If device sends an SYS_ERR host will bail
> out for wait_event_timeout() as MHI is in error state and if MHI is tear
> downed sys err cant't be serviced and mhi can't be recovered.
> 
> If there is any SYS_ERR, sys_err handler needs to process SYS_ERR state
> and queues the next state transition for device to bring in to Mission
> mode, so mhi_sync_power_up() needs to wait for device to enter in to
> mission mode.

This is very difficult to read, please rephrase the commit message

Konrad

