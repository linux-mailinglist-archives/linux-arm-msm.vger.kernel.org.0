Return-Path: <linux-arm-msm+bounces-87110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB595CEBF1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 13:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D82863008D79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 12:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2E8315D5E;
	Wed, 31 Dec 2025 12:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1+lzf8R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1UZN//W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CFB3126D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767183646; cv=none; b=uAw30n/2V63WKrN8LXdnJFTq+NHtfUWv6vUCAs49wfdLoQTK9oxxr2jbqEJn/xrrSL5Ewp5WJ176nc3tw5k6A5V9pURex4OnbawDTnYlwti09xqTppGgbHsUSrCgjXDbqNRCrURKCPBVfgKrVP3htkqJ8eNUMjoqOWqlwqP12I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767183646; c=relaxed/simple;
	bh=MQmo3DqHrNqw852pxcHHZYIycvRtZz0hHyNxKMK+caw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfYv/fW55X78RPr1bX4AX+SVhZGugDra5rS5JMtwSFb0LUeeti7I0fdopkaGqjNyK7ngNsEkN9X5jXu1xXCoVTiv5sTUt40FW48oD59kHEBvaff9hYRBWcQ09lFcyYrO3+vhkTf3tymowiaUeO1duTec+/yEo2G/HOX34zHGcmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1+lzf8R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1UZN//W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV1vKZa3971212
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zllIvUd7nwiRGgPkDw+woicrVI32te+1le0taRMAsb8=; b=P1+lzf8ReZpj3byR
	hyecp0nAeX6fcWHGEXiK1bpbcfhdPjFhZStXSR4KGbAdbWUODhI/0jaG+ZKIIxK/
	9+c08q4AfIMdwTg6tGJlDuFgZsE2ujnVSQUJGJURAAKwTIOOqASq51eN2aAOrK5W
	xfgBrL+JmzhySsPyzFNKvpQJA1xubTL77TKekny0CwPlYJW8Dt09uW5DZGnejmPR
	tpqXB5VnPjZXHqlM8P9tTqe05TtSaAJpy4adj1ytUGjQc3knloZChTxwhnAlzjzk
	Iko0kEPxEW5NH52gSgbOM54c22sg5czZtO2l/t8aF4oAz1M76ML9dtenRsZhaBR5
	qUpqOA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky2mw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:20:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8893be16bf2so16757456d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767183644; x=1767788444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zllIvUd7nwiRGgPkDw+woicrVI32te+1le0taRMAsb8=;
        b=h1UZN//WDEnKjJQ0tKE8UQc9TAatJ67vr3AfcipS6UjhZ4bkctv51G0GyK733eoeP2
         8R/V9CUULxviCjiihBqqG02Upy7tei+qU3qBgkMTp6da+lfU2T5bnzPtlsBEtAymtJbd
         l8Shwi5i3pNeprWXdeEadmmLw8UJ2mMIchg4kQkRd8+lZkvEtz/iYPR3wSvj0aAgjaeM
         FHUpj8u/CFoFKm3hXtZ0HMcEuNk19k9aiKMyopFbF1BnbCGre2AjceEGleSAhn8eyZPa
         4R51k/pH8hYmyTXuAFxHgRIbmOb1EAgSr3bPxMc8SPuiAB4kr7AuRZnMZ8R/Q1nC1ZQQ
         WvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183644; x=1767788444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zllIvUd7nwiRGgPkDw+woicrVI32te+1le0taRMAsb8=;
        b=pju7ywBj1eKGMf7O7TCpWlYH58CCw/eN5K820ljaN3uJ+0P8ZsJpFLP851K5OyYd/a
         itA2p9QdS9SJ3/Ri/zur1ze2LkTbX0jHUN+/lSfpXehl6q7W7NvLP2KUHGNPq+lZYk7z
         mAgTCE+eh8TqGUeAqzBvBkHV8Doep37fQfPmWup/sTA5P3y/m2Go/sv54AMoBHIfF2TF
         Q+BUPamac19BQWT5vnKnwm7M9HeG0tzknONG2bhLA3ZLuiTC1VnNa+lVtEnpM8UUACa6
         RJ8z3wxkvfGsztFr4/jg689cTd3pP8dtJGT2dXggU1ttjdOJR+6Z+L96kJcL2UviP2Gh
         VMGw==
X-Gm-Message-State: AOJu0Yxslv4vgnmPBNVTj3CkafRGQsHOHhfl7KWF/POj6tu5UiBlYyIx
	r8lnFoD4Uan4LezJEWGCfB5WIpDNwbpGAd7Igwp4CQPW7Oia0zLJseJyNjpAX4XVVCMxoaNUh+k
	uI9INIguXhLehYMMjVcPko/01hRIFKdurWyTH5blFyxXfs+f7xMuuXDymhi34k0/D9eXp
X-Gm-Gg: AY/fxX4TRhgnho4TO0yepb4/UmJpDYwifwScKezb/PBjmcSJfPq7lAQ2yJ90jtNvNTw
	vH+zD8vnMd0K7rysiQTbkF8MlNcad8gFeqjPAGAvj6Q0ywPmUL0R01fuFT9WkHTrRBfyXdsAzDT
	AryfWcdbcNMnNoEtDuS/CCReN1ROPTjzzK0PpxnMv6pLAwpNugVcI4xOb1IPK9oEGJI2dpIvPOL
	N/YtfH49TAMJOEX1xkso/zPiL8swUZS6g9UmVD/A6sqe6BbW7oUbV0rMf09CaPgy9rNj35/n43q
	pnhmzhSJcuyNdsRlF7NOeIa1Fid/2vqvSILIETDh/yxhGqlaA5mmr97idA5uVBMkqxzo+k1iGUW
	OG9Yk49+jSQVBMcQ+D/geDAnxEAslrSEqN7NBQrKic1q2ft+qlCNp4y9PhMheD+2erw==
X-Received: by 2002:a05:6214:528b:b0:88a:522e:f1aa with SMTP id 6a1803df08f44-88d876fef2cmr429758466d6.4.1767183643718;
        Wed, 31 Dec 2025 04:20:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNxYZD2jUzi4kfyb+ZH7BBn1xDuW5BG9mO7Ob5u6zKgvjm1mqF447/ECV5NVNX2+vlurqoxg==
X-Received: by 2002:a05:6214:528b:b0:88a:522e:f1aa with SMTP id 6a1803df08f44-88d876fef2cmr429758246d6.4.1767183643248;
        Wed, 31 Dec 2025 04:20:43 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5ea6sm10827713e87.5.2025.12.31.04.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:20:42 -0800 (PST)
Message-ID: <4fa4a6f3-cc38-452a-a724-d2dc19219516@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:20:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] arm64: dts: qcom: sdm845-db845c: describe WiFi/BT
 properly
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-13-1ff4d6028ad5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-13-1ff4d6028ad5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOCBTYWx0ZWRfXxbm/csyr+gqy
 us6ksYu2bTJNMaGr/3pICDetWuMblQCetpv5ZAeGdxguLMm9H5hRskbTcwE7ib0MOFmL9YejOg+
 voYh59jm2CePY5sBgvdu0PHJfsmLyXWM/nyRKwu+fBJRoaPriEaXvm8XuSoFuAlpytEzu1A4h/r
 3fS5IhgjfGiFtgKZUfrnHGVNEvzMnup0+zRlKoMQx9xooVY9fvGvBWiY/A0HuoSd28MbNgB7DX7
 5Nn5K5W2DxG9Te+9kHnFDAh0sxuiZw+Lgi3XJRbFlHvXFBoUUjV+Nu1WnHp0MDvV1ccXt242AEL
 R+MCy1cxGUoqogkEolnwrgVBOzblOyPQ618iAj79WqM5evtPvI11QzbQIH6i7ry+8qdErS42pQ7
 dX+jXDbTof8jyhnXbTzb1MxcBHEGomLSlkQ8LBGuGYI4R7U1heXfiY3foCVsH0sda6zMCvFt6PB
 tyCROzUDBNZonSHZk7g==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=6955151c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YN4nVyxdPvXl5XCbABQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: hCdrD_FGOmLiAznTGv2N8L0BattFKk8a
X-Proofpoint-ORIG-GUID: hCdrD_FGOmLiAznTGv2N8L0BattFKk8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310108

On 12/31/25 12:36 AM, Dmitry Baryshkov wrote:
> The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +	sw_ctrl_default: sw-ctrl-default-state {
> +		pins = "gpio3";
> +		function = "normal";
> +
> +		input-enable;
> +		bias-pull-down;
> +	};

likewike to the previous patch

+ please confirm ch1 supply

Konrad



