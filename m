Return-Path: <linux-arm-msm+bounces-62025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6222AE3BCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 487163A9D8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 10:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B619B238C21;
	Mon, 23 Jun 2025 10:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuaRtJ34"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A306238C0C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673305; cv=none; b=s35w7LINmKBGtrm3UJkC1greduaAL8s/d9FCMnEs8ubYkBs/puaj7riOPBFrnJVsH6hBGMKcrejmFpJ+RsbhmQa2hydpML6XxASHwNgYykIY+Ar9K5ZBb8vFNbK/Dhj2pEgTo/0STF11irqL1M05UcTN8y3zdU/88qTOFk0VAOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673305; c=relaxed/simple;
	bh=eIeyqlTM7XajqirG2GsOm0mN2EPqcedROiQ84CPbzhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdKAHbVbSW81GEtDzjTxiNqYKXW4oA76tw4G+gYcT52OGFmMQ3fJadgRa4set/86znVYDkElqFnfZEv+tPj51eVjcaukGSfF+x49/H3jCqODbq+rMdf4xdQdwbkR51iJGZoMZgKO4RF3q6/iFT6LVD+tKEcQTwGL/ifkqEEdwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuaRtJ34; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9BjLX028706
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PnyKX1fEcR6bJxd/pvho3kDJwhwkeyCLZI3+nIr4TFs=; b=WuaRtJ341nFVLWVF
	qEi25tLMfnDbbQWDZvBDnjAD/oeCWQHYZ27+sifMW1HhX4yVcpwoad2i8TxBZnWE
	zVNQl2cc+/OFzYYXJ7ZwKaeKIDgE3SCepFvgaZmEZckXyVA5QT40OOKrxZFcOIMn
	G8qFoqlvQl6ogmDf+UMgw/jAhKz27i5C8X9rVEeh+VX5PVnv7CfptJqYyEGB6YPc
	ljFYs/pX1ZtduDBMMnw8Cm01L5KHiUWeFZ7Tvb7RiJV9JN/NOVWqj2pIOvz6x+vO
	08w46rxAUlNPVpq0uOIp8qD1kSZFsYP5vdsiRpp0FgOdELsx9F4XRGX1o1Lo2UlY
	R5JL6A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4hhr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:08:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fac0b29789so5118936d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 03:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750673302; x=1751278102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PnyKX1fEcR6bJxd/pvho3kDJwhwkeyCLZI3+nIr4TFs=;
        b=YlC9mCbkdlfPPQHzR/xESjbW3EWT5AJ4EYoS49vXrH5OncjJCiIW05dQwGkgcZFw8P
         SGlw4SxTJwsdwGUqTI0Y2nLhzz3I1/7sGYVPYGZPLApH9rykV7COq8qrAu24n8Wcv8tY
         N6e8b+mnJI5T4MiLZEc4uaW7fekT65KbvhzQGjly66IdiBveyVM9zl4jsb1vj6Fzt2xf
         lCd5dLLfRa4HA9mKf1UP2E7kXYeTZrIL+edG7suR3oG0wnYhVQzW6aRdW1WogCzBZJu9
         wWr0EMEydo5TgujWXFPblWsaoGIQhocVTCFjPeLXknDKMCmgcP2xcEsui4L9BzGTbBdB
         X4bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzlnTnYMf9TGO6G12rCqetBJopXOqtgUZuq1k4fXJRGym7SJqJP71APw8C1a2prOEanhAGRNJQPuK9hfoN@vger.kernel.org
X-Gm-Message-State: AOJu0YwWsrhaYzmmXgsSi1sddSWzoaqx/ITBiNPH+ijkwobc19XD5ZO6
	QMIiDtJTWhRMKeuJxpiB3SDiE1HUoOgm0DfFDjd9fJtxodT5IFckHAExEP7GUQOl4dpHRIipbRf
	sonuT8PqLldoAbFsC6YcqEjepXsXle75312SfWqad9w5zyKH/SE4BRlTAPnjPc0z7s2ZN
X-Gm-Gg: ASbGncuEuI9i0mGZVd3DLgXS3/eMCmVT7G/QbIrC0T0zcnNoa3kWWMi0udV7r9ZEYvF
	Rsukj/UQc0Hnyt/vmBVDkwu8ciFwbkQ7/wlSYCAoFcU+AM8rf4BV6DMtboMpBdA0Hbo3OQt1i8X
	tUru9+aemYGIeBbpbLZdLBLX4xWvX2xRFGA6cnLbQCJCd0Ga+iM4AptueJ/NETr6Ts2vZHI2snD
	zCkJdYPYSra++1sHTcrVkaXa7L3hHJosDVW6+5BZdrnIykfcaTWauQtGb65VaAPshkApsHT18TB
	pb2HwqW6MWNteo/3rS5PuDJ3D6YvTXOJkHVtziou1N01TK83D+4O2eSYBOCcH/njkqvPwWrHlOx
	e0UY=
X-Received: by 2002:a05:6214:2c13:b0:6fa:ba15:e86 with SMTP id 6a1803df08f44-6fd0a2fd7a7mr77471206d6.0.1750673301760;
        Mon, 23 Jun 2025 03:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS/1yCegb7N0aHHgiVh72Q6EJAth0MgnKHXXG+J9DtMg+J5O92x5oynT6QeF3XgvXxs2uA6A==
X-Received: by 2002:a05:6214:2c13:b0:6fa:ba15:e86 with SMTP id 6a1803df08f44-6fd0a2fd7a7mr77470986d6.0.1750673301349;
        Mon, 23 Jun 2025 03:08:21 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080a61sm693438466b.106.2025.06.23.03.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:08:06 -0700 (PDT)
Message-ID: <b5d181d8-26bc-4855-a8df-ab352837e800@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:08:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Add video clock controller
 node
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623-sc8180x-videocc-dt-v1-1-9d210c140600@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250623-sc8180x-videocc-dt-v1-1-9d210c140600@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=68592797 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=970yK1cPiZu4FA_SsT4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: f1z57QFwMxvY7S-cRftPJTAzDznkRxBh
X-Proofpoint-ORIG-GUID: f1z57QFwMxvY7S-cRftPJTAzDznkRxBh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MCBTYWx0ZWRfXzVs0FzGFNwPq
 Xc+QUrbmbVTIzKjwn047AaTyaXyZBY7QnP9FPMUorCTPugNSx6gdICjqv7Syv15Mdnb2HFCrhIJ
 QzmS94wsfQFk04J24Cl50uE2XqvXMKuCKPRTDOX1Z8etH+OUK+/AFPWZJdmOkbOoJjcpxciRS93
 ssSN5jwrvif5GpBN4Uq9Y8NwhRkUbsdAaViKhBPr+CPHIaNiETR1lAEduM0skhhHFPAA6cy0fRm
 KM99kzQtodegTRmPlydH6mYJNPzHiQ4D4ylqQ9IxyYa/uYW8MWYlMhLmbgWlE+E2AxM44dbrgG8
 uuyNfk7+7K1uu5dGF2iewODJcWiU1JnmmoWiYIGCi/q3H8zZOiE+JaCsSNuW0KjfhQ7erU2d47K
 tIclUzqbbisBMtgNRrr0OQ9WDnTvbbbwLpU/S2octgF+FLo3iRJFYpmyZjAC8G/v5Ufg4ywm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230060

On 6/23/25 10:14 AM, Satya Priya Kakitapalli wrote:
> Add device node for video clock controller on Qualcomm
> SC8180X platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
> Add device node for video clock controller on Qualcomm
> SC8180X platform.

Because you added this text under '---', it will not be included in
the commit log (and we want it to be there), please put the message
above your sign-off

> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> index b74ce3175d209b569e634073662307964158b340..4590c2ff68a9885d8047d728bbf2dea0236d5b8f 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sc8180x-camcc.h>
> +#include <dt-bindings/clock/qcom,videocc-sm8150.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interconnect/qcom,sc8180x.h>
> @@ -2943,6 +2944,19 @@ usb_sec_dwc3_ss: endpoint {
>  			};
>  		};
>  
> +		videocc: clock-controller@ab00000 {
> +			compatible = "qcom,sm8150-videocc";

If the blocks are truly 1:1 shared, with no additional software changes
required, please still include a 8180-specific compatible in the front,
with a 8150 fallback:

"qcom,sc8180x-videocc", "qcom,sm8150-videocc"

which will require a dt-bindings update

Konrad

