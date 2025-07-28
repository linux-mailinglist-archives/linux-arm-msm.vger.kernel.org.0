Return-Path: <linux-arm-msm+bounces-66829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD14B13868
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 11:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C761B188A3B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 09:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2682221FA1;
	Mon, 28 Jul 2025 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AB01ZgpX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5771F1505
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753696563; cv=none; b=KVx/aFGY8ldS3uxxAaK9n/ZxOuUw8L3cGNSg18nM3RLXQFG2CVizx6Vw7xWUeIMdnc7IsKuc15Cxw35+DCWJ9G8ZtSsgKq648dTikVw04yOxFp91XfxCy9Wk8iFHneG6Dz83nJmeKu7cAIXqu9S7IKA1HSV/1ii+5GYRMOWo7t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753696563; c=relaxed/simple;
	bh=v101+JVVdRGnyO1F+hI3mGw6HG5ajOkVZ4PmcXP/YGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o5sdlJ6QXkorTE7AqCFWAKvSGOhcg2+fpJhm6OOS/cwNcTZ9OqLDXwOOfCgrqbk3wkmx7a7aBsEw71YJEEL+87NlqTjkEtSup5gMWqLCJQOVrkLXBz8FESD1gyFnxholVLCE52KJr5EcPRowMqeZufoVH91oTMz6+HLB48365WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AB01ZgpX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rYsM016846
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	97qWNmr/hvr298Xbx3iKU+H/sSf9Iuo2XWsMv/z0KYA=; b=AB01ZgpXwV9CE58v
	oMRLvClbMm583FF/GHa1lJCL0VkbsWZ0CcsxGZt4WScLucw6To6cTNnifEGQ4H7+
	YB8zm5KkXQEZ3GNLML8X/4a2SAdzz0nK+9pTxKW6DuOdAu6Q/6i+omNfQ01T2Qqp
	FwYLMATgpwyNYmxBaAotT4cNcaokx8RAat6HjuAaT7WtFEhSZvuWccqwkYWIiVEw
	/gag44mFDREH4/vYAS39IvpaL7CHTy9uQlC3lfOkLGVgJFnU/ykM2kbMuuxVglOq
	lw9Cdk3F25Sdrkxnb82uH/Ci8QjbykzP5RM0D4N8EOpM7yJk3+dKzPTpCWU+/qwg
	xS1l6g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbkv3p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:56:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab716c33cdso19941351cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 02:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753696560; x=1754301360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=97qWNmr/hvr298Xbx3iKU+H/sSf9Iuo2XWsMv/z0KYA=;
        b=MmUGe2HsTZBmFGgbwjbg2Gxc/yiBdowKa7xR8JERCyvnhOmNP1ypjoXJ9C/QeDylS6
         Xa2mFulUbwgY+adD6tvRN0AWohvMuwvCDRMKsEaezSQNRrdgKQAMLgzEt48UKRtngv/j
         JoJBdzB0Jo/iKn3HW1EcBU59GCNlP8CUbwiOp42NjLdl2iSgABFIyHiaj0YmZK4ztGnX
         HCo8ElyFfozVvO22fE4mUsELhAzYXD54oEthkoRQyuLSlf9WIuhr/s8vCB4V2X7wx9qB
         mGcEGyW28bg2ed/U18DgvxRWeC/7NymvwMA82KjJOAV/w++AmliUomzMzSd/z0lvjhs0
         dDdw==
X-Forwarded-Encrypted: i=1; AJvYcCXZlC3G8O9h0/UgCrEqdPQDh1+Vmf4Ek+GE8E0MD2kmi2R4185bWFyuRqoxjuycwNT4JdYij2v/FDTLBCW2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywevb6yk0Xu7I6BNRVIfYqZzlTBQNqnJFxztrvAGkyp5EnvQBKP
	Da/Rcb06axAVqV6t+DDZZJcC+T60zF69URQfFxB3ihnkY8hC87c59PD+kCbiDfmlNtFdmnmjTMs
	rgwPwY5kMTRuHr3/GOVODYM5Xl9sD6YpEqb7HVB2fwuUQWyVHFugx6prUPEC/fs+uNW6Z
X-Gm-Gg: ASbGncuAF8XyfqjIUqDmddEOj3skUfLxMv8GHR/TaP/CMdCw7/1H2V+u/ungq3YUiJX
	ZQU+EZPu+reGeup0Ld2MD3bnK7rc86pams9rWVC+LskeXiM1Wg9lQM7PyZMuGEn/T8fN0FeLxit
	tRdPCCVGRCdjDorTKr0EVyYDPgoYwknvJZ2ktCB9DpH4xNqqbBggtH9EPh1FnsOpWeBOvQyvVQY
	hv8Nn16LPdI44stXQd8XM1IYmM3zBUwpT0a1CUXNEfb51eQmsFE6Qidz2nnJWCNPV2xmmAZGtKB
	jwplT5rhdzGuiaRuGWBMBDajKNfdOcZVG5NNRPCdRrMS6pSbiMkJeWwkMCUDcbbaDZNZc1gd46p
	aTVHQAzZXdhg+KkQiyg==
X-Received: by 2002:ac8:7f16:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4ae8ef5920cmr68336261cf.7.1753696559923;
        Mon, 28 Jul 2025 02:55:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0HAJx5dftHoSRKBGKbv7hde358hLOMoAdMt9sqZhRSin7VI9+c5bS2wf7Z0CKCrsCj+V1+w==
X-Received: by 2002:ac8:7f16:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4ae8ef5920cmr68336141cf.7.1753696559325;
        Mon, 28 Jul 2025 02:55:59 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635acc99esm390087966b.115.2025.07.28.02.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 02:55:58 -0700 (PDT)
Message-ID: <8c59ab39-8cc3-4b00-a694-3ed970b9f7dd@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 11:55:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: Flatten usb controller nodes
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250728035812.2762957-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250728035812.2762957-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=68874931 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=GZkaEewYkbA08GeAVZkA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA3MiBTYWx0ZWRfX9aT7hVwj53Ji
 f16njXTkf3ly19KH7Svdj8hw5NEowUlpCx+jlWC0kZ5GtIn1HsOKpvQM9K7P5k+3HCs2dK6NC/Z
 JezHMwmx6gp8EwjHDQ8/I5dgQ73vr0Qt7mAZHjZTF+koNMOXgGfZukL/Fdhqg0TLf+XhgidIwEv
 4bxwrsrdVK38Up+JHuQCyqxOIrWlnV3O6ddZGzeI7xsNOKxSGX09JZTKF6DZAb/rT68Zh1zcMDi
 pl/BqQDH7oUUMF8jyfz/y8Eq5QbiDQximpJqpjbJC5x/JiJQzLGEjGGY6f47W9nZ1PY4Fcrk/z5
 Cw8urQrIAkvfqfI4ljNao4z/Gad6oh8AaupdSUBO94EaTejzDeGpJzA+HdVxIaA0o0kE66AHBCb
 /wTMUx4mZ70zwqfvJHKRF6ALuIejFLpE4Dibm5DDfMuT0UAlj1MZBK47pt3tVpEs2b4O5SWZ
X-Proofpoint-ORIG-GUID: hxChs3UQqEdHzD567RIBnqY6Plh3bfmj
X-Proofpoint-GUID: hxChs3UQqEdHzD567RIBnqY6Plh3bfmj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=598 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280072

On 7/28/25 5:58 AM, Krishna Kurapati wrote:
> Flatten usb controller nodes and update to using latest bindings
> and flattened driver approach.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # FP5

Konrad

