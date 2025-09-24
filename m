Return-Path: <linux-arm-msm+bounces-74591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F381EB99FE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 15:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE71F188A8F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 13:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05842FD7AE;
	Wed, 24 Sep 2025 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSdNBciZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03B8279794
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758719722; cv=none; b=OaG6AwU1DBcA/iV1IDPni7BDrra4cknb2rcuCMXcUtXcdZqO+O7rrB7RRz7bfvapMmRUZnugptqRToP7tjl6lxU0HeYFBTs8i0BFfcJTM2myWWKpmTZ/33iO36I2gQam1x7z6olckVvZVhTxqs94GYTFqVY4X06b61oURPSna8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758719722; c=relaxed/simple;
	bh=ZsZyQ7Ql3rqRY8h1WntWXGDU7/FgBAc7YAVNLpKKuuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2S7ipcbX4nYuteO9gU9Te0c5pY4Gm9awHFz4NQ7My/PKkTL7SktMoVy3wSwZ/o7ufQM/9PaPULmdhntAxXfeqM5Pwy/ywRSmqYbNEoao7OJrx5oiHwpnBo6WgUXZ1lXW9xKyG1o3He6FR6pMpdtWikwzE6BFM8nBylqUbLGb8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSdNBciZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODCtOs002152
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 13:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TwFCyIUYndJk/I4av4mMJ5Ifu5vDiUCjBB5zV4J2loE=; b=aSdNBciZsLiwV62j
	n9AkhY2P7L6z8u+JJaltqeJNw+GDWyfHn06OBDX8sbN25WG/WAfYWVB6NfZbNJ2v
	LEpA6dOGgE5+gr3LuLXzYtqhFXYPvW3HdJ/YtIX1l2iMsEbikIShVciG95+yRQxF
	38zFCVtIlI+AKE/GCCFQhYd0rhoSrUibHp3nTBvg1tI2jUr5+hVs/CJAuck96xO8
	9W9JFaV1fGRN0ZWR19G3LI2L+BqP3XeBYr7nkuMUzoJ0sv3CKw+rxoAIxSslUcoK
	uzRVl9QGWTZpejHi8WpowdT7tL9qo6nHZOqINzER54YaLmM4ORPjwwsXN0uKkPUX
	B/hsOg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98md98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 13:15:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4c39b8cb20fso25065981cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 06:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758719719; x=1759324519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TwFCyIUYndJk/I4av4mMJ5Ifu5vDiUCjBB5zV4J2loE=;
        b=TasiPRKENS5cx7qAvslgBaY4J1P5nc2jBBCwHZEle+Qe/BzJlegMIiDv+ldmIdxLoy
         NGrB1cW0De6Le8YtEKjKL5+Z+sNU/lTiZf07cSoYPhrPZtkOR9y08I2HGEWTrypldYyN
         aCJVFAULY6QbZiK+HCMtyblzQftjJ7ZafKtSG1c+CidwXRWlHOMspyctAi/52uTmJnWS
         IbBzTc6y+hfeuwP9lSXpBUFiLFkhJCOYDvPeJ7b9ZqmsSVWnMByM8gcke5p5cS0Onpyq
         cZGSWq18yhyuwkhag2hmZFKcFPkuKV0YiKEJMgbtNkvUdzB2/FoZS223+NR+bumzMByH
         KByw==
X-Gm-Message-State: AOJu0Ywv3PfVTP+kF/m7nH2O+PwFYjrmYvGEwMTSiO2FTG13f8IX9ep5
	cCqBMfoAC8J8Y3xxt+eVg8SPDkjw6cw7Ed74Wsv3AeHpKSByIDXsFwmpkPpyen1G9Zk6iBxpzh0
	5zXWAWlxVhY5OymrtpqSiei6G9oF6g0PMfedvD04gywV8yNBUC2xic0ut6bsucA6wLKXF
X-Gm-Gg: ASbGncs8JtCqwXwEtmiUcjo0gF/8JQAGqOi/pOoc+Ob0coHq8TZCI8XUv9SlfpMWRVV
	RbB67J1jBJITmA2HT2sXLEsFvYQMatEBAzvhpxNKTUHQgHJSIdv3qDt8Y2jN8O5er3WsEG+udll
	bGGIX1P58jJ6tDZ6GykFL5dANTS64K3A9q81W+9FMVkmVcWVAjpuj3BpG2W1xh7QaF752BuKQ+Q
	WcssOWxqQpiPo49tt0zGBaStH9jsLVAmMpUedlpMgiW3HcXEoNq2Y03Ma6C0JF6ZAeSVkF6ttPM
	WE7mx8Na6k4jFiglyAQmJh5XvqoU6yAHkq+SA+OMW8OvI+wJbJzZlXoO1U52fVNe7TyxmHStzy9
	zGNING5ASbp0K8SIXLF2S7w==
X-Received: by 2002:ac8:7e89:0:b0:4b7:94f1:7722 with SMTP id d75a77b69052e-4d35bdf0ab6mr48207401cf.0.1758719718492;
        Wed, 24 Sep 2025 06:15:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESZfa8efiSxEuXWBpFzEPdHkSAYRXc+abBpIikFgLyQyl0nwGOhQi4FND05AsXWtX0Zyh0sg==
X-Received: by 2002:ac8:7e89:0:b0:4b7:94f1:7722 with SMTP id d75a77b69052e-4d35bdf0ab6mr48206741cf.0.1758719717686;
        Wed, 24 Sep 2025 06:15:17 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2d4309ab9asm632180266b.74.2025.09.24.06.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 06:15:17 -0700 (PDT)
Message-ID: <d650fde0-7ad6-47bf-a8fd-86dadbce235c@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 15:15:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] arm64: dts: qcom: lemans: move USB PHYs to a proper
 place
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
 <20250921-refgen-v1-2-9d93e64133ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250921-refgen-v1-2-9d93e64133ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 65wVEQxuD4aEr4iVkqWWpazeOERpF8ol
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX43EKtAQQgq0o
 is6ViqF3sb0QRuv4+KBjQRDbpeqQ7OpU6tlgyq9SKpplA29w6D9Vv/LVYJyv0BHSgpYP73jEt9I
 eNk9U98ivZ26QrKI79N8hx6BXRLeHmgu5Gu1fHwFGzsG0WJmkLfFMyhAwl26BoHiIlAcSgob1z8
 7oJsLTMWHeuwaF0wztWgEsRAG9fiRHn+lGNehUVe89ZZXA74d1OKnRfeHUPCR06eZ1DcksQa/Uw
 aLNkpD/+I4A5H2SV7NZyelq4nIL6Ou0Wm/qBw107nPVBoEdAAqQv7/J52mK1fBtR/A+qIXxTdaZ
 jjqSc/dUVHrqgmbroK4fuBhUKrj0cl3TWEQSQiVTrzqMAfQ+H4YbiKb6uCgVTHvmg6bHDyAvcJN
 e6WWgVho
X-Proofpoint-ORIG-GUID: 65wVEQxuD4aEr4iVkqWWpazeOERpF8ol
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d3eee7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9b4w7uh9JfneBs45nCQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On 9/21/25 9:09 AM, Dmitry Baryshkov wrote:
> Sort the lemans.dtsi, moving USB1 and USB2 PHYs to a proper place,
> making the DT file sorted by the address.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

