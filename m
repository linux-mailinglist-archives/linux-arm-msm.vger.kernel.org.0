Return-Path: <linux-arm-msm+bounces-55755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC8AA9D257
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45EF41682ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D41F202C31;
	Fri, 25 Apr 2025 19:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlxq57EU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C393C217F27
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610694; cv=none; b=TUDEWz0cMwAhxMULlNDEEPPBdv+iVqf1AbrLvM/EuHlwjOo9eaGQEqN1T91FAWnCgVTWSjHw8kTsmVrYbaYUIKCvgVCi9ZDHmeazDMZmBzOeTng61uJLe38ZMQuLnNw+GuOA4aF1T7HwvRsyKTQsFm5eNLePB4a6QiKfOud1ZGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610694; c=relaxed/simple;
	bh=hUJsbchXR3Ekft/7c3FAE2ianmHgWCZn5D2kabC9No8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tA/DfFvchMgWPO2bC8AVGx5C7lyHVdz+TmomIQWT+eJCUz7X942vuXRHemK0Y/0PGrs0SZOmRXmLe6gy3QHTZWKjMlRwjwFU1rX3UzgeTMsCTZeSzBVa7vrRDVBWi1hOGXzP9LwPvSKheudAbZnaM/Vr6KjKxVt2BgF6QX1S0vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlxq57EU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJr0c011053
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZhXAb5N82DC4xoZmaDuqgjsFIB2BulQK9Ow83G6Ys0=; b=hlxq57EUtm09HRLM
	ZCYMbUC+MXBADtX5rID7Dsw2Hf/Y3TunQHry4eXA8LYdMnwJ6veIUVCa9t8M+3Wi
	O7eA/eMG7xP2ZjdudFUFAXEnG11fHdxB5DJe7oxloHTQ6LTV31PG7wlW27xS2Iq3
	epC9rjhw8DE5XYnY9Tc6rHmhRLqni0J4X9h5HWHi9owSL95fCpNQ8j7VXttv2K59
	5YQNc1XZgL1fZE2cfDEyJYrvuHh3E91L27DJPsek5OEVi51URNHimUKxqwBUOQts
	4WSm7nVLx3bu6wcypgufmnCzjmYhD+ZikbigF6CmRJuvtwjzzUYfRUdSQmzsfB3F
	HGXxZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0jah4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:51:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5560e0893so10313385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610690; x=1746215490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZhXAb5N82DC4xoZmaDuqgjsFIB2BulQK9Ow83G6Ys0=;
        b=u+M669nKIBjQqU5CoPDocO/phSKasRlvvy/puZFH3Phxqy2dLDnNVynzSGVPYHMbp2
         ogidaWOCU9oGxlFzAGxYG+bc0gRZHL7HHt7zCuCWB1cN4FgAd0YF4PHKnRk/ktb5G8rX
         xknlDKkXfv/Z/LkRZSfdLKzLUk8ZhFOfxooGWHnstnW1oLxBomnSjLHo+ZApjBMsK/or
         c41B0E8T9JKhdI8niwsXZrqNNqYazlh6gKs2Fs5KvO+RJYIJDmgC40MTnMMKeTlh9O3N
         gwaYW2/R7y9sy8w8Ks5ZL04dFX/pFL8QfK3QByvPsJKvoyl6w03H1jc1x0N9Lu3BaKl6
         EJGA==
X-Gm-Message-State: AOJu0YyzN3nXxP1EDilNnzBejuDD/5ez0O0BhK4/ERNG0/0z2atlz1p+
	JOTHOfG7XbCq4ft+T986BVCzAI/eGt0P2sjk+NcEDY6AagjIfi81KOGmqtzvi1OstqU0AIXMQ8w
	tlUkgfC/1Ctg7hVPC3qOxgCMwKRrHX1Hgnsq0jGlme4qRmQiE47F7+iZ0l3+OCwmR
X-Gm-Gg: ASbGncuQL+ZuKb2OEINE16aywoA6nkkpjEs0lfEpBBjFA7f4eLxaxw2fssHlDdhBo7Y
	xOEVDAXH1GyFhDpdqV2G3874TX7U24v51xSZ+KNt9koA6dHb3RYkFsBIbWIE8H1so8k9mg+wCnx
	RDnhr0DjOoTHXVktZRuhAfF4hSOXN/zdu96UZ3sdKlPoP+wO1G4VR7uYpShhbRMDKeKqktI1kbz
	NUsnscTJ4Rm90Nwth0AHbiasMh9KRMvV5RdX0hJLz4yN9DdYVNY0RbG6Ewd0bPTJUti8MszsUDp
	3ddV4KDSNrETWeEA8T56pGZtxgowoh43uOlY6uryD8bsxzljhGHeXtDmf9rmjZdiWRs=
X-Received: by 2002:a05:622a:20f:b0:474:e213:7480 with SMTP id d75a77b69052e-4801e6f355emr20287301cf.15.1745610690529;
        Fri, 25 Apr 2025 12:51:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGixXgh/UfVDbXANnAdc5BNsWh63o++g6JqWbU8CImmPZ2H5rCWnTMEJKVAKIbuE1Syh75RhA==
X-Received: by 2002:a05:622a:20f:b0:474:e213:7480 with SMTP id d75a77b69052e-4801e6f355emr20287081cf.15.1745610690227;
        Fri, 25 Apr 2025 12:51:30 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6eda7d9asm178782266b.166.2025.04.25.12.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:51:29 -0700 (PDT)
Message-ID: <43e5ec19-4377-4890-aa6c-e0f9733d5106@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:51:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] ARM: dts: qcom: apq8064: use new compatible for
 SPS SIC device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-10-da4e39e86d41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-10-da4e39e86d41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7-yZfNMXoeLi4QRSKAkmYBWOoCbFj1IE
X-Proofpoint-ORIG-GUID: 7-yZfNMXoeLi4QRSKAkmYBWOoCbFj1IE
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680be7c3 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=exUESaSVoveG68c7jMoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MiBTYWx0ZWRfX/wP+Ff/jrwCw H9gN2IOhT2AxfJzO5vl/fSlbPyZrDWb/pfr04duW7Ob6XHqlG8bufgKuEgY0Bk9mOZp/zE0SxoA qJQNqhLe7BtY0WmY0j6gYkqljVyXG+9qusv4sJlKUuMCTnFPrLID1BeVy+gbyzDin4Vb3hqapgL
 KuZ/IHP80BL8VByi5puazDaMdNrXTA34IIAkgKbb5PPhyuBO9wKLG183bDxK68TRmatgnXEUPKa CfzqOE8ZC6mAvzUFelk/UjyPGEJIE0aLhl4wX3AMUB9i4q+aU65T3c/SUJQQeRE9qCm61f0B5u3 gHX6/mkhYSCbaT16VM9rUsYdTYHbRcimynWUGFv9jV6HGU5pZQZMDOAAp3Mm0Wrf8BnD0ccfp4N
 y4n3ZfnydHrC7wGbBrYpTO5lLjWZ/9x5NPIf+3QHIYIc1erJq1qhJ+R0eu5L7fIGKTkKGgvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=584 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250142

On 4/25/25 7:47 PM, Dmitry Baryshkov wrote:
> Use new SoC-specific compatible to the SPS SIC in addition to the
> "syscon" compatible and rename the node to follow the purpose of it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index a5aad4f145dd368aabed44cf520ffc037018b37e..b6533630e347c8fc5e3f0791778cd05760b3f3c8 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -402,8 +402,8 @@ saw3_vreg: regulator {
>  			};
>  		};
>  
> -		sps_sic_non_secure: sps-sic-non-secure@12100000 {
> -			compatible = "syscon";
> +		sps_sic_non_secure: interrupt-controller@12100000 {
> +			compatible = "qcom,apq8064-sps-sic", "syscon";
>  			reg = <0x12100000 0x10000>;

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

