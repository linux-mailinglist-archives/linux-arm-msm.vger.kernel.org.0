Return-Path: <linux-arm-msm+bounces-42840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 408269F85F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C78C163D80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354031B2198;
	Thu, 19 Dec 2024 20:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UubtjLmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86CD1A3AB8
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734640278; cv=none; b=PUzwYHMVunO9v1TIeFNOi1/7JsvHCfWB6YU0gStYMWv+WGD+p4GddiP3koKDSqhkXAhhNzwTxQBKkPwdHRIK+Sdk+QCVjUExWmwt3PZ7rmayHXj+ua5HR4mRl9zfVK/zY1kaBxjdOKYL3sJaMo+XRv/seJPl06a99HCaG0SbBbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734640278; c=relaxed/simple;
	bh=Stb5F+PLbGVcj04yCFnD7g1zWF4aaJ0ugAOc3kFyYZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxUJcIFlZZuy07F8U8t+2KmMQfW7qfLNoRhB2fgUBNEFx/FSwaW8DcV+KvI2vLLh7uHy3N18i+yP6yt0INdjwLsGLIAzd/f7sfHwUVqsG3y+Zze87IQwSzVQzpiUI1dyGxhtF5iCBjj3Q9UqAjS6vA/hUFg4B35jMfkyGUQ2tuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UubtjLmU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJF4ZSF028829
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kEd1ikdMFXCq6Hs/06c9ITB9jI1Rf8Mdc5eUz+u92eo=; b=UubtjLmUFrZu7DFM
	pYmBkWti2jQxUHX3P7vSJQL/uAMcRhRf5T1hzt938WX46iMyQdHT/TpBwD0EXZ0P
	+rE3L81KCdp8OJgTILgnahpOaCei6SiMIkD+75sXbn8PaMwXVwCYL/fcSUiUMNae
	gHyFyXaccrv8tmUp5HqQnppa8LWZwmKJNui+itVnPYovq7F7CQIvOZaysLVGXb8d
	60Kxc1BOSU9errnkq9Cz0I+H2DbQzut65KNREizFPYowz6WJrfF8NekRznIdvzVc
	by2Zf/Eq9aXNhuuyiMAYZsaRPip8c6QWIum7aSpHJ+EEFOh/bwTLVMarwTcefw/J
	/z6z2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mntf0swv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:31:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467a97dec51so459801cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 12:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734640274; x=1735245074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kEd1ikdMFXCq6Hs/06c9ITB9jI1Rf8Mdc5eUz+u92eo=;
        b=f4YFvVpsLGUjW6XH7eYirnjQQnp8mBSVNz3RQImHFp+eKHdTM1J1deCwUCIEL5eGDM
         rdkMl+xNlCuNZKi0FF4qw3Qy4lg3LBj2ixqHVRisTd7CoyJiNgXy9zEo4Bq/B4JjF/lJ
         CgdaY1y7O25e80AydUp32j79magxEBxiJps5E9KrKyul/x11NF6X4DKMiL4Tk2VHdRqL
         2wHooVurcciMFWT2B1WzDksLg6LebL7Ze0jEt3YFdzsIGg897Dt+fbspaWtL0cbRc/nP
         fti00E/+8STchUztLet9JdddLk4aH/xpxSUEqJDF7SEcN0Mq7j4fCiGKTB6vONLnguna
         Wi/A==
X-Gm-Message-State: AOJu0YwIF4DoJL9CnSvxDs0TahXXmJV71wvuTr15wl1mkDXvVim6Hdou
	3/aawMZoe1HdUZWsS4aipkXlIYfe9stjWuDi1X85HU/Rf8o+Qqk+9rYZxliSf2HQ14KmGVHY+jI
	m20vJS0/1DLgGUVCxzkJIgsqs6NBQnLxp48UKtxQOW10O45gr9HI2q6USLuWR8MyX
X-Gm-Gg: ASbGncvgPyizlkEORsINkJtg5KzRJ103uicFTOdtLEA+h1iNTYpMdWgpAniYq7Hq+0I
	pa3y6W0ndV1gyulVEIYft2zPmEHJE6tav6jWa7G1futFpeFxrBebhwhT3yc8Y7eR5sOwUd8rP9H
	Siyj3WJrIks0jbOEtZxTfv+X91wS6pnTlJ8kdTrl7V6ES6rNOc87W8LbXJ+pOfCetpaLcfnYr7w
	8Jxy0TElPjlENLvmagQHppt5VIrCMuHHlqzZ/0t1vlQBjya3Rlm4KnpWhX3S5VQ1lr9Mjiv0aHY
	CtIhG2O61+UlQht5m1jrQjH1G7/Es6TE5PI=
X-Received: by 2002:a05:622a:1909:b0:461:3cd2:390 with SMTP id d75a77b69052e-46a4a976f47mr2527131cf.12.1734640274537;
        Thu, 19 Dec 2024 12:31:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFw1vwgTOwOzVY8/Tn7DUj0B0ykISEDQWZkgubggiXEVzJ9LlH9NuacPGwqxgW8at9UmwiV/w==
X-Received: by 2002:a05:622a:1909:b0:461:3cd2:390 with SMTP id d75a77b69052e-46a4a976f47mr2526841cf.12.1734640274122;
        Thu, 19 Dec 2024 12:31:14 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f013ab3sm100448666b.140.2024.12.19.12.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 12:31:12 -0800 (PST)
Message-ID: <52333311-5649-4d0d-9160-9c16d01764db@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 21:31:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 18/23] arm64: dts: qcom: sm6375: Fix CDSP memory
 base and length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
 <20241213-dts-qcom-cdsp-mpss-base-address-v3-18-2e0036fccd8d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-dts-qcom-cdsp-mpss-base-address-v3-18-2e0036fccd8d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3C5B5Zz7ROc4AFyWXlk5CQLfIKgPmBxI
X-Proofpoint-ORIG-GUID: 3C5B5Zz7ROc4AFyWXlk5CQLfIKgPmBxI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=802
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190163

On 13.12.2024 3:54 PM, Krzysztof Kozlowski wrote:
> The address space in CDSP PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB): 0x0b30_0000 with length of 0x10000.
> 
> 0x0b00_0000, value used so far, is the main region of CDSP.
> 
> Correct the base address and length, which should have no functional
> impact on Linux users, because PAS loader does not use this address
> space at all.
> 
> Fixes: fe6fd26aeddf ("arm64: dts: qcom: sm6375: Add ADSP&CDSP")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

