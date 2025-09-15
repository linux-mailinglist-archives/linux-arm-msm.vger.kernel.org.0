Return-Path: <linux-arm-msm+bounces-73492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1EB5716A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 237BF3AEADA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C152D46B2;
	Mon, 15 Sep 2025 07:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0cqSq+B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AB92C027F
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921244; cv=none; b=ddZyLMdxD+jVmTQnL6O4kqV+djWuLIMYvQxGI01a3tYzKt4kDAuNjii5fVYmFiUE/kHyeZZYF2ZbbSOt3zSxv9OebiFoztIxK1EOhsuSpddqNTANdaJDiYc5lbsYSOvFje8X3CDPuw0kxkM8dY9lqOAmR0mGGWvGFTCjDsae6Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921244; c=relaxed/simple;
	bh=3w6Tj3yZ5WcfNFwd5OXpqNPXWKjkPuKxVPbx2R2aOMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IefqsuqX4wEs0tHy9jgvaqO/eWJ9EOzFWyHB8KCQMb587kAXowkJRM5Thi04NANii+sLraTIjE6kx98xL/F2cu+TkbRNrFT9/7y4gbZSEBjVXWE2+wjFUlnb74KgzfZP+gRJVIgC07n/XlvvlyJ1J1BrpnqqRK8I9E2+HVrGXNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0cqSq+B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F7I164013545
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eGu4W1lBn0ee9x5u/lYEsjYwHwIwgyWNttS2IO7E5dM=; b=T0cqSq+B4KlNDPGP
	wuojkAkT03/SS/Cln0yCgCRfM5cIHh6QJbNuaVmeG4SlnAMF1gfgPWB/l7uto+Ik
	PrOkU6s5EiuoJzmpcdbE2gD8JqQyy61QE4BuAbE6Gb1WVciR6OzhVm6FkmfQ8XnA
	6h/JwtIjFete+U6/Ud45SaIw4ta9KD8t/HxoYO36g1hRBUqSUj0JmLr3v+w/GGN0
	x7/mIdIfHD8+mZRjHt/BEzXv7vEWEKI7HHx7/mn8tY6qTmLCzmgrWbgoN6iQCp5s
	AdIqHswzen7hqgJUqUt98Z2xlbNCTgqHfgs5qIRPDwCzyrkIDTzO4S98RH0iXPTM
	eWrlIQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da986w5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:27:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-77c0a919a51so4944676d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757921240; x=1758526040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGu4W1lBn0ee9x5u/lYEsjYwHwIwgyWNttS2IO7E5dM=;
        b=e+wH9/tWL5w5yr/dqZPjwr/eO11A98b1a51GH91r3vPkLreFY3brhfogZrlaaU6REA
         liJb8/exuYRAwyMc+F/9Kv83MB3DPQRuJtGfgWuwWpIcv+4vyI+sI/ST5GLrd3JK2FBB
         d8rbsPwPHyY9YC6iK28w2BvRbEHK8yiUUq7sL0MbFs4hZgCpWv+QZmgIOVc+3BlqlaHU
         qe8TbDMSaYdjTxSL6Nw10/ylCntk1JOdFIokRn/0ix2otmMP1g5A8+5PIElrUF+FI9cr
         Ma/XUGGdhRnPfKIH1nfSA1B363e1CEGUu2dTKWQWMVs3RO6D8kshLXuoeIJW8L+cJljI
         T7QQ==
X-Gm-Message-State: AOJu0Yy+O0FTQnYn2kkh8EvYqyiInOo6/huNK+OYQH8zo7wwdLaQperB
	MGCNHeO9Wq22RObBLKbLatT6RzxswYs43hZLAuY/mMwHXuGwaZouSO4zE8JyDqI/n8IzSSrK1hj
	Vx9fCZGxrjh2ZeXbzM0ygfzLrLfE204X+7WDQpB89mdAJdMa67qGUuX58P63IBCm3chbx
X-Gm-Gg: ASbGncuRYExTM9HVBq7myDlAdhWShvGDPWhQHsgQ8/hW3Ca5E03liz2ElEyEUvZjBno
	tc9t1H+2CwXgshGper8cLZXGBEjAhhwVD5Yc4EAvHkBmx/Og1tDt7FVCskl9BlwuhiU7cVMSmvM
	DZSfFatWmV6ctFguz6rZMItHU1ETSjDfuoRKpJCITSfxbKPyJpvBNawjlwSvO1U4eZ5enN2d+Mc
	M5Dm/r35036MZUD69IxxMmPu0ST87YxVtpFK1ZKTdZ8jP6sEvOp4FlEqFJfIRmRw+k8tEsb1kUx
	lpWcw9fP2rIOhm0bCjzmlRtev8lG23nU6OjmbwJejN/zWDrHefBRJ3HbuBx0EsQh8svNigG3F8Q
	RH+7rz0gwW7Aa+o/p0vdpvQ==
X-Received: by 2002:a05:622a:110c:b0:4b5:db7d:da77 with SMTP id d75a77b69052e-4b77d0a01f3mr106924941cf.13.1757921239943;
        Mon, 15 Sep 2025 00:27:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtobAvdlCKx4ucK/uBFF0UnOD1F2RQQxMsuY4by3yh/9zwQPo5Yuz4Oqwbh1x74LJLsPuMYw==
X-Received: by 2002:a05:622a:110c:b0:4b5:db7d:da77 with SMTP id d75a77b69052e-4b77d0a01f3mr106924811cf.13.1757921239456;
        Mon, 15 Sep 2025 00:27:19 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd413sm904627166b.71.2025.09.15.00.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 00:27:19 -0700 (PDT)
Message-ID: <b3c169b5-607c-40ae-9ca1-0977b6f526c2@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 09:27:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v2 5/5] arm64: dts: qcom: qcs6490-radxa-dragon-q6a:
 Enable USB 3.0 and HDMI ports
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
 <20250914-radxa-dragon-q6a-v2-5-045f7e92b3bb@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250914-radxa-dragon-q6a-v2-5-045f7e92b3bb@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c7bfd9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=ksxQWNrZAAAA:8 a=Sl3xjKqUaxPrt8roMgEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: Eigpjae6kKyGP-juAiup3F1BWj29GJet
X-Proofpoint-ORIG-GUID: Eigpjae6kKyGP-juAiup3F1BWj29GJet
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfXyUkZcI4PoNLZ
 oFmzOFX8oimQFu+YmqiJKu5iWT0lv8yTLl/SudajMr+9lQSGlzh2Mt8Y4gMZ2YUg4wc9b5pFRMs
 23tTtB61b5KjbWc5GLC/qT11vDENz8C8wZILdheoVYVrpHeBeXMfC0Bp9R9p5lFokyNTESIkIDr
 L/pzMRLUoRChUfXw1Sg1Ic1a5hA7Ahb/ToVYU2mQl+A+WWoeQcIDutQCKqJUIfNO5qCgEnOm2FT
 W4WsUMUydPe03hSD3R+BaXRXnm7Lwn4DU2GpJKK06VZECPQkYiCpC/Zv7qF+th6KQcp9jaQDMJX
 J3Jmk/GYN4SuvcC7LZaYCOWeVUaMOkXqzRD0AQUeGMIWycnnAmYfwExosZo930B5u7LNclQPHyF
 R5lrTeo+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056

On 9/14/25 5:57 PM, Xilin Wu wrote:
> This board doesn't feature a regular Type-C port. The usb_1_qmpphy's
> RX1/TX1 pair is statically connected to the USB-A port, while its RX0/TX0
> pair is connected to the RA620 DP-to-HDMI bridge.
> 
> Add and enable the nodes for the features to work.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> 
> ---
> 
> This change depends on the following patch series:
> https://lore.kernel.org/all/20250908-topic-x1e80100-hdmi-v3-4-c53b0f2bc2fb@linaro.org/
> ---
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 152 +++++++++++++++++++++
>  1 file changed, 152 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index 3bf85d68c97891db1f1f0b84fb5649803948e06f..12bc9a0fcfbfeaabf6ede351f96c61193a8261c0 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -78,6 +78,71 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	usb3_con: connector {
> +		compatible = "usb-a-connector";

Looking at https://docs.radxa.com/en/dragon/q6a, I see two of these.

I suppose there's a (dumb) hub inbetween - check sdm850-lenovo-yoga-c630
for reference if that's the case

Konrad

