Return-Path: <linux-arm-msm+bounces-55745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8B1A9D219
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EC211B87601
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EC721A45D;
	Fri, 25 Apr 2025 19:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chkxq0cH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FC421CC59
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610337; cv=none; b=BWomESE7sdOAN4lotdkQs0i9jjSeDq1sSunBhzOlqk/KLVg4IKayaSk3ltYXX63NvX5tvExZl+HafGpsrFaVG0rWBvxFnDfJf07ufEOyQZUlul5Tb+04yzp6rDpeEPlsu4VyrziEN8Bs77bINjYMw5KlDJ7qiyN/CuAcS+UMZrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610337; c=relaxed/simple;
	bh=cswa6dW5aA9ue0GjESk6mDrCFdxgQa+QhzwAB+RgFxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AmEVxNn0G/U0y11Etepsoxfj+FwWdEveQ0eJqB3Z/d53ybJSu8cswI9vLGZthBupfm4PrM4HG8Lvt/hbRNk8p2Yc/s49KaLZckHHSAa9xoNoSt5nJSFm6TtGrH6fSV2o8u5lwrkQnyKhYG/PMIy7CEmhTSvUl87cwOdU6TD2KN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chkxq0cH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK2EJ021908
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rxx5wfe6aG6Fa55yWqNPwUBU+glFaz9EsS80UceDj08=; b=chkxq0cHtsnBj8R4
	Xu1TqV3UbHWb96//HVSO6DWneslIkkm41CwsmW1lW4LLrOlmtpNyEGcJbZKex8gs
	qr4e+syqx4wly4qj/LQXQAT58cuipVOspbWxeWDv0c9dXcg3yEvwxxubNsrvAwrB
	5gGRiGyx9glz2cqTh1zv4mcL0evZH8ymbVkteqS96NSvnBJZOSLzBWiLQ+oQym9d
	6H3vvc9BBHEViFn+tNhD/JWDDlSbT2BZYXBoy428d8DCSvWK+VP20lBZhvpZk8lL
	ruixfTNBZtmFB2wdDbY8m5V2eT/mJvFyb/4tU6wnzWx47TWlmToYdZD5guWoKvVP
	s+lkzg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5j6f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:45:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476695e930bso4232891cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610334; x=1746215134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rxx5wfe6aG6Fa55yWqNPwUBU+glFaz9EsS80UceDj08=;
        b=IQ/9lW6jPukXrSeVRmxOu69hRzaXg0FbZizPC7Wc+1/rcMdZTT/s3yL+bRXQefPYCU
         V0Gpju52T2IjgXG87GrjpkgdxELUJeD1G+g2HYocaNlZKItJUYkeWeEj+bBNYfK/bKlj
         HUG+mvoDB4XnQB7dhKMkb1XeyH/CJNyl/Z3jgukwiSreAYFpWvtMgnLOC3Tw7+8HURcv
         bW2LVadX2HdBg1/urRl1BEDLsC6svM5W2Km7iRQBfPfe+8uABtd//x3X4SU/28m8L5QI
         8vtWCH7GyXuWarZlDgwOwbfk/Edu0oZFS4OMrtCpborVTy2LNNxYMQOZx9UcYijoeqAu
         JW5A==
X-Gm-Message-State: AOJu0YzhR1Dv+6RmZ7VgtJeICTOKYw35LVLne4x8KWXB8tynG+N7rkdr
	4WeiV6KRRO1UaaJK4tVsN+2pwsM2TlVQiXXbBzDPQh5neVR2xSvLCrenhTjj1wbff/YI0TBhakt
	nWJjZOeR2lkK2FinWB8Oa5eisLurjtQku9b9XMxi05Hii0Dh2revZS1rQq3idnODT
X-Gm-Gg: ASbGncupxDYG7z3uRAGNENIqKaqNLchd4REOsYAVMwk4d9UtGVSgEuHuA4LADXUuPe9
	jeaTH0OWX6tLpadAKo797kKqZ6xtLReCHoms/Af6safJV5L8i7YHKx8vBvW73J92504nX6SrvoF
	yA2sRkQX+74U4h3xkJsyJsnni7XCxU+OfR0V+JQwimJVXDIrpDvIDNAh5ErbOMWPTmYfS6oj4l6
	9XFraXiCz65Bx3voC8YyVLkAicMBTEkNh3j+eT9c5VKZkj/yLJE55a2AwPD0HpOMz+1+BhA416B
	EiKfdPel+DhPgK07eHQKfbZubX2kC3Qg78poEnXnvxjf53+Kn1iXhg2n88b8fqa3dqA=
X-Received: by 2002:a05:622a:1452:b0:473:88e7:e434 with SMTP id d75a77b69052e-4801eadc57cmr21800291cf.14.1745610334223;
        Fri, 25 Apr 2025 12:45:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBMn9Y+Q3/QKqsAdN0ymIzhA38kSGeTKsCOv88eKpG69zK6HEh4pdNVXq7aJI9uMOK+nDotg==
X-Received: by 2002:a05:622a:1452:b0:473:88e7:e434 with SMTP id d75a77b69052e-4801eadc57cmr21800111cf.14.1745610333853;
        Fri, 25 Apr 2025 12:45:33 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8ca6sm178331566b.118.2025.04.25.12.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:45:33 -0700 (PDT)
Message-ID: <89f431c2-1b1c-4c83-b45f-68afc1a974ac@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:45:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 retimers, dp altmode support
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Jos Dehaes <jos.dehaes@gmail.com>
References: <20250417-slim7x-retimer-v2-1-dbe2dd511137@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417-slim7x-retimer-v2-1-dbe2dd511137@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX0fdCQrLj0PvN jfHP+cMIfrJlh4h6Tk93SR4pamhqM5/DjE2LHp4TSOBr8WgRXoO7zFaPEgj5teoUHLjCH2x90Qv QDTsNGQC9MqrUhsRoy+ZHEXaClobbBlV1xWcDVdS5R0auKRrDMHkVNFaqi/rqjerLbIjdlC908U
 G/SLDZVZuUtX3i9ya2cDafdTb0907NYvxVk7yRTq93ua8BZ1144mD/7vIi3spj1hE3dkUNxye3j nRoyk7DBqekb6h/VPTppAItzn+RAf/t6DGzeFtZ2q4w6M37Amk5FeDGGTcIvpejhE+1JfMuesoX eByg1CL8cC2ZWoWO3bfNvoCnSVBpJ5GaFtUla5daT7e45I/CDn15++oRE13M4JS6k2uS3CI/NQf
 FZD46AF3FjnjWtgI4HommLQE+scMFhPMCfSobju5zlnolVfO67FfEb0snDoHj+rnIvc2Vm/R
X-Proofpoint-GUID: 1pzr0NVVztjRQtvz5uXx54AkTSJYZG70
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680be65e cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gxl3bz0cAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=70XoFFO73b3tUdKEuYYA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: 1pzr0NVVztjRQtvz5uXx54AkTSJYZG70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

On 4/17/25 6:35 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> comparing with CRD and other dts for a more complete support of the 7X
> only retimers, gpios, regulators, dp outputs
> 
> Tested-by: Rob Clark <robdclark@gmail.com>
> Tested-by: Jos Dehaes <jos.dehaes@gmail.com>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

