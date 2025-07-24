Return-Path: <linux-arm-msm+bounces-66525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D747FB10A26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADCD91886739
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 12:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B7A272813;
	Thu, 24 Jul 2025 12:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfeEfHrS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ED32D12EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753360038; cv=none; b=jMlYRiqw51eg1Bf6UxGPOKTcmjStf238P2OuM3WxMGWc2a48NvT3ZA95gzdKX3FMmfc9hfTv9XMISNhPU+xUC2L0MPwz8Toy/rdaBKIrrGfEKNL9K4va6qLP7vk4z4VeSRaso7xa+bfQZ4JbcaG30MW6Bkoh5Ozwy+qkHo02Wq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753360038; c=relaxed/simple;
	bh=sMhp0wFjv4s+VblK/kTnh41T9LMryayKhKLgKql4oac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubZWJfmJMrWPkN7gbM+Rt/B+sb2MWkujw6iFC8vtfyzLcyewjTgEDa5ZamVQHWuZ8SrpcnQxarOaOrCFHZgdfwqdbrrRJPCCcV91J6+W/EC25PzN/LiV8FC9TqP+CL/pTODb247lLRAPXqjc5pJAPtz5pj0Lal0JEbZGKjCn3AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfeEfHrS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9sSqd018720
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	igsMavPa7JPXTss/EBIRJaKGYqtyWBb48bk9Go1RYYA=; b=YfeEfHrSv2MTOUzb
	NGWDQXiHr3HzRI/5gH03QxpvEtoNKTxIZq3fQv0H6hUWeYOlxPViGD8y5dI2+HMp
	DuG4A2ns3OEEqdkwI+sYAOUS01aXKp7ihF2YbtzQ7mwxERrIk8dDB+qFf2EmZj0y
	+8NDw1M18AN4Eizqs48FVP2X6GockVJjV1Jn04DK5D2BPn5IzMfH1sZO99fSLFXy
	6/94LMMza+iw9y0X1d57LYPeo8p/qTxmY+BdPIehANSzM8+ygyFODGV5qRdoBRk9
	gq+A1KXxn7xzEhs4fhGOa5V8DWUYaa06cjUja/z11uW+R5h7ZNh2dBqiHWM7dezD
	xWaMiA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6ttu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:27:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab3f1d1571so1341881cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 05:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753360035; x=1753964835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igsMavPa7JPXTss/EBIRJaKGYqtyWBb48bk9Go1RYYA=;
        b=OUNyHyl3bbm88haqhy/q8lyFyauYy+S1XL3baMPW6PRrJu9wKCcEXy1veaRTuNp9uN
         onKqC9C28MTBMcuSKDHpKTQCX5QvGXeQ8pnS/qoFe+mqTGZC2aRZdsmonaksmt7Sw36K
         j8B3H1BzUF+mGgfUO5jAgH06Rog9c15MaCdmzx2aBtiiWZ7dlZhHQ3tfrwYmfn8zeb+p
         /A2wchHLm9hxq85K/M71VSimNufLePFis6QF7FCPStEPFc9z3x1cZdsO+1h1Da+X5dMK
         ob4maxGGPQ8o7SpyAKdlQkuRgrO1ygFow5+y6rZuW/fF/AYxE4UT6mquvjvHxtahcFKi
         /tWA==
X-Gm-Message-State: AOJu0Yxv17EekG3nzeuOAAFAaGmc5LKo2/f0kTv/ahjlaXp+xYEaEDhS
	bk4LCsn3S0rlxTiAOdfwSTJmbrP8rn777sfV2Z5V4DMFBDhjuAhFZrOBUH2lqltKOqLiUYGFFOs
	xW5/hQ932WBfPb9c45k2BBk/fZ3J77kZReJIUpO+QzaEyNj2Fla85Zybht0g/hB1A+p9YtQ9z4w
	FW
X-Gm-Gg: ASbGnct1OFAWt7vrnW3SFTbV1/zBIAulmE/U4fYzHwoe+tmWe51vnCdw2uIzifrujgX
	VjzDgLFkRxNNxUFp9X2yTzHeD3cKAZZaHPEC2+HTW6Be8f6zSB1784AJFCTf6aiB65m9IMiBYXr
	TQcms+1syx6Dp9LlwxP0JZ6FlXQFAKdJlpKWud9Ct5jxqW3JFNL7XuiDUxWNzlS+zDqzlF4GAwL
	WgGgPFJupeCsO5agt8k+Nm38TWMFQzkKiepKwjHUr0TGdfGIRaPQo9oLC0UMGU0mu+sk0sPeX0Z
	O7n4hmY8wW0fn1uQNSKExwxiunr454auBileReh9nyJsnzzAjPEoR+BusSFT/0wtsNVbAW8Y+Wn
	3aYy+tI6wUa+6HKONng==
X-Received: by 2002:a05:622a:351:b0:4ab:a762:4c7b with SMTP id d75a77b69052e-4ae6df4daa7mr38084861cf.11.1753360035269;
        Thu, 24 Jul 2025 05:27:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4Hbl/n74fVwqDjYfUnzurZ8t7bnLxSNLYhNI7jtGJZAgoemmv7JgK5Z7eWdh8dpJjt4oc2Q==
X-Received: by 2002:a05:622a:351:b0:4ab:a762:4c7b with SMTP id d75a77b69052e-4ae6df4daa7mr38084671cf.11.1753360034869;
        Thu, 24 Jul 2025 05:27:14 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47f44e0bcsm103949466b.74.2025.07.24.05.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 05:27:14 -0700 (PDT)
Message-ID: <d71d0624-7730-42a4-8aba-77b095572906@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 14:27:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sc8280xp: add empty mdss*_dp*_out
 endpoints
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250724-move-edp-endpoints-v1-0-6ca569812838@oss.qualcomm.com>
 <20250724-move-edp-endpoints-v1-2-6ca569812838@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250724-move-edp-endpoints-v1-2-6ca569812838@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=688226a4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=NQC8z-4SoV2Hx17wLY4A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Uw_cVD_0jdxsWMPXXj4cj7VPP6fKTU6L
X-Proofpoint-GUID: Uw_cVD_0jdxsWMPXXj4cj7VPP6fKTU6L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA5MyBTYWx0ZWRfX/Pt9EDQNLn8i
 ILlsNF+WMrmJuqyFagUxXU0nT7EWof9yif+omDTkOl0U9E8gThogr/X6sQbMkmzUtjAUsBeIe27
 Y4R3J+ZZ4zpD2INNAcBg9y7txfxWpartMXbZmDgKFf3GOYZAz85IYs+sQkkRKjH/ekDCaYbKU1a
 0E4iQOy9GOGF4Tm+wtJGLg2b7Rf0SCXUs+XlOFswaVD4KqBDpA2VngM7nzZ35FVJipA39isp6Uq
 pbhh79nejWDGFMLMUkECXxlOThFw2Xj6j5EJ1ojytASMYCy4J5liy+L1IiVEMWJ64XNFa0aXSn7
 qP5aw+YckBUItwCvlcJaE+COOJDSWVaniuijepbmGKLlal98K/ENa0Gf/aAZu59VwlimwJckchv
 DXXYdGiorncljQb7jQohRTKgcprwIrQpiXtdAItWgiLp8MA8XzlrpimmI+7FAsFGr6fIb3bM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=816 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240093

On 7/24/25 2:23 PM, Dmitry Baryshkov wrote:
> Follow the example of other DP controllers and also eDP controller on
> SC7280 and move all mdss[01]_dp[0123]_out endpoints declaration to the
> SoC DTSI. This slightly reduces the boilerplate in the platform DT files
> and also reduces the difference between DP and eDP controllers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

