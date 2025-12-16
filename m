Return-Path: <linux-arm-msm+bounces-85334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DBFCC4483
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 17:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 768D63139755
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 16:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8C435A943;
	Tue, 16 Dec 2025 12:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBKxnfVH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGtF8RUt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF9335A93F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765886714; cv=none; b=CPi9iiaAjk4b8/oWCAX7g3ChVR5I5TRRuo1qrcs75/9m57gT2BuXgUvU/BC3d0MMxd72LW7TlMJIT2pyZLpUIDR+osxZlSdrGvq/nRT1Im6RrEsCRlEbiWLw+fq61xdZj23QOvVp0cAAJx36Zrk36182MXtPVpHC+tnBzcfwaLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765886714; c=relaxed/simple;
	bh=d5y3Lo3v3T8dZoTUs6eSHZXVLGQ9rdOap5SB0IE0o38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYo6/rg4/zSvs5ELXJJUNytJUdHIt57BHg1TaIR6r3fODfJ9Jibz4oMge7Y1LqimW0LHjRb48iKS8LZMIyAKl2d7uI/kgLWujP2LmK03hn1UFvZAB9j8Z8d+6kvdHQx4aJIqwx8mFZ8PmGEz1r5ZIVQ9KPb4hkn3bJNdWYKNHkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBKxnfVH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGtF8RUt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG8SHPa3745761
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vNln+9kM1weo0q44z/oiV3Z6MfCuKM2uD/VbeFCHM8M=; b=BBKxnfVHOqytHJMN
	v/4apTpGrK4TKRZkTNYzNjAqfwhvtgsO8puuyO7qZTVbR2Whcn2fDh2SivE7r+eS
	bIsvNmQCWnOdIsWYlxZZ3XhueE+X+BSbB+3zX5CSaoYToP4wRpOKKzzDTbdML9H1
	RUJhMpE9EnPfYRO0Rbpu886nYa7q0PmHLVpkTL5lTn7B4BvDN4tRHdkqp+5FpX/5
	ibLAYs72NYjIRRuvA2+KvMPAMC2Y7uQieY2I4jWfycBku48cKNeknG123BXSxvEK
	I1nMlbg50NLBlbckv0OxZTIXH8RBquwe8yaC6loTkGKuo/EckpjHUw8/TzH6AS5D
	fCX18w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33xj0ues-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:05:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88887682068so13150536d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765886711; x=1766491511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vNln+9kM1weo0q44z/oiV3Z6MfCuKM2uD/VbeFCHM8M=;
        b=dGtF8RUtBpjWKdogqMxaDn5f6q1O30Y5kMvwvrhzsIIGrb1bMo2ylRPy360dUUsW8y
         PVi4cm2Oe3bWa98LZHuPXxaSfgNyq91WIeS1ol2XTHyPaSb+JPEP7YqsR4N269iEbbXR
         p3jZCTbHHqflstL1FGbSNK85HkLJiJ4vsLewZ9z16j/198OFNTBJiKdmcgYj2e6RmdIc
         63q8y1gq47R9VVhDeva6CQfQPJOZOBucDZvNxC04aiXRq4lppHX/3bMxulQZjIY0J6Ul
         TWwQa4Q2s/y3R7Vuh/a69hAc0b/bpiN/KFGc//Bck+4g3PzBqcxxeeLAjvLtQ9FQ/624
         0Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765886711; x=1766491511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNln+9kM1weo0q44z/oiV3Z6MfCuKM2uD/VbeFCHM8M=;
        b=NMBC1jVL9TAhiRVKMzXNrWu8dPvVqjWTouD1oj/UFJCYtGQBIqxbfgAiaHhM3soBU2
         96Ou1UVMEHC4e+Nj+M1dTt9Dp0//Y0bca+y6scPhc7hM1UYuHc20hCiR1ANActOoLfIm
         6ZSOG/BZPrjOuMaIPek8WMMWfm7EHmgY1SKryxL4zhJNlxN1WA/3+0Ud893fs7GcEs/a
         vZycgXJ4c+6Uqhv0HLrSXULojD2kW++qiL8dzSLFwnXNkXcAmw0sRydtlkmcoQNLVxcW
         uATELssNdhTDOfuGj+ZUGcm2hwWHkr2sYpdL66YyiHcoCZIFPofmYXDzteCdXyE1yyC0
         2atA==
X-Gm-Message-State: AOJu0YzWkT6+OKjxTmxFuZ+fjsVcHapfYF7ggBHd1CyGPUqDl5we8TGk
	Y9AqAPI4p278MRhQzcutuO8iOvKhGom+VOpgPJxGQvdC/6caR2HFn5jiTqrjN6tGxxRv3gidVxZ
	8fud+sHiUR7j8AGElvMv3OdwhzpsqqyT9aFaG3LK8ryGCN2i9eeK/iMINAKyGMWh0JRlf
X-Gm-Gg: AY/fxX4yET18l5WtTk/7/ha1d81CLzCAkVUznhbO2VKAlzVInM7B4s/KKAnbmUy5eqs
	QryT1QoICpYO4tVwGzVGc/AnZdJCb1YgzwGfFnUAuDLY0mlhAj/Ade9jPsQfBLvXHLDfxpJXUl6
	fV3oLvkZijSjD2pXX71oH6CcFzBGNHMJyO45zr5g6Xn1s/CNLHJP9BYB/Dn5t0bi9Mf1TQsDPGr
	LztJmiQrAFmQR9qVzxx4ScTsDjHRzgeYipEVjg8w7EuLTe7mnnP6enSle1ZaWt6NFfMaN9Qjptc
	Gv50oNUz3oE6EQOEzLPHaZOmSrjXDkw2lAaGOXQEgA3vfzldhSbx58bnOh62SzZZN7/MaCO+x8K
	+9hgOABMNqbFy3pnA6+9R9ekPkcDmlQKW6FhNYaWNXq86aGszug6nXUf6ax5IsRzYrw==
X-Received: by 2002:a05:620a:28c9:b0:8b1:c1d3:8e7f with SMTP id af79cd13be357-8bb398dd11emr1347956985a.4.1765886710794;
        Tue, 16 Dec 2025 04:05:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJtgHIaii2ndwMMm9Uz3b+euRN2sQjAhHXIPNW9ZZ2taRipk+LNh1BoEgH6vxaRUAeH5J5gw==
X-Received: by 2002:a05:620a:28c9:b0:8b1:c1d3:8e7f with SMTP id af79cd13be357-8bb398dd11emr1347954185a.4.1765886710244;
        Tue, 16 Dec 2025 04:05:10 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64982040cfbsm15825612a12.7.2025.12.16.04.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:05:09 -0800 (PST)
Message-ID: <528ba93d-64b1-468c-9dff-04595becb7b3@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:05:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8250-hdk: specify ZAP firmware
 name
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251213-zap-names-v1-0-c889af173911@oss.qualcomm.com>
 <20251213-zap-names-v1-2-c889af173911@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251213-zap-names-v1-2-c889af173911@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yUG8dGFXqhIeCEg3ogla3U1B1XWR3u3Z
X-Proofpoint-GUID: yUG8dGFXqhIeCEg3ogla3U1B1XWR3u3Z
X-Authority-Analysis: v=2.4 cv=KtNAGGWN c=1 sm=1 tr=0 ts=69414af7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wPDdPnR0QRQf7uGA_pwA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwMiBTYWx0ZWRfX5YpcxXb9FkfF
 wUZDDUwm00q5bJH+cIHgGiMVAZmZ+kL9aqjP7Lk3WZhs2q4RcjO4bsZslqdcfDbD6HKwUHO6sxp
 DJC31MQ73xL60AN8fKv5MZztLfWZ3wy2oPbHTS7UE7P+69x6OiG2QBGbTsbNCdnTJLPqqkJbbyV
 oLSKKdG2M0+7LyXPCuv9T19f8xG/JMG5+voRo+NLQ9zcY4PDR+FmHl3xWlMX+Ql5Jc+0uMKdCDk
 EATL7Q7/wt44RwPeapDtaWTNRuCrpCmbKuFY8kI4iLOEnuJjcN8QJDhQ22oyju7BuODDF4hNFX1
 GP0epToDTe2vFBizU0nAGDyTAcv7JqY7JFKHl8vUzFhCljmU5C/BIZ7nBfg5PamHxxWSfIahI8H
 +gChlIUXCy1l7id7GTSmXBwLWyKV0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160102

On 12/13/25 10:28 AM, Dmitry Baryshkov wrote:
> The DT file has GPU node enabled, but doesn't specify the file name of
> the ZAP firmware, which means using a default file name. Specify the
> name to the ZAP shader firmware, pointing to the file in the
> linux-firmware repo.
> 
> Fixes: 04a3605b184e ("arm64: dts: qcom: add sm8250 GPU nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

