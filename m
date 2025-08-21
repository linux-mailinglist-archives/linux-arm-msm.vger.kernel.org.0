Return-Path: <linux-arm-msm+bounces-70133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3282B2F572
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58BAB3AB029
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B433054E0;
	Thu, 21 Aug 2025 10:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GVVeM7wW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47AE3074A1
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755772571; cv=none; b=Q2XkHppXRgoe54u2XubMbFSmMd7UpdmmAqYbchgayy5+GaQYkSkpcysk5NLFnhDE6pIwI6f31ZdqKUgQsGe/VDyv/KdYlA8B/kOInelltll0WwU55xC6/Oh8DoOVWnyeZI86IXHLjQ1UCv5MqPq9b9AiSrqaDj8l6ysARVIISW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755772571; c=relaxed/simple;
	bh=RDuV1besyzzDAzdyFeQhw0JwJepUWtsZGZmkP0nNXDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4551Dn768YBAb21ZdbBRox7Sflkyi2YUXLDP3T4rMFNIS9XA2ciyaK7yv6FkzSZQ6CkX6pdtba4q112ASgIwiPU4JHVnE1ujy2sA2KBsll3KCRsclKnart55NPAxIJwwP4WgeiBKPquUeiYJMwY+66JW++0Rw7GNJzuKx+UVeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GVVeM7wW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bAvs003687
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7oo2zqFqG/uy2ujzQIvz8umA
	iinujNdzdiBtiiHUTrI=; b=GVVeM7wW3PQpz36KtSKHXA79R1SZCspJcF5r9uyi
	OKQkaeZtpNw+/A1Whiwkh+K3IyE4EWBS+h2HQuOd8kZFr1tmWExrArY5Tyzfbe+P
	f0IlHRHGbcxxzNkS4t2tqpmWywHvE6EtMoScQuNk95ZSz16Fd/kjHi9+8zh9U8Kg
	3vc2yYdqviPozvZgOcdookVZ2SqHRKF0eT6ms42zB5gxuJZeznWCFhgjK4xWnsTp
	X3feIci0VaQupEf+oVnV0HPIDycorZNffGd7rl6WNeoJfrMzE4OMzVogFIpmbiTB
	LWeN6YI+RUm95Egq4aMINaq8O/3heQUHuxrgLAt6DmaZMQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdjxdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:36:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d7c7e9735so41122916d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755772567; x=1756377367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oo2zqFqG/uy2ujzQIvz8umAiinujNdzdiBtiiHUTrI=;
        b=rUlkhL8ni3lOtwL6HL93c/an2y9gaS4vYswrpwePrFDlS1nl0lOuPNACfxQ8CE6Krm
         20XDCZDwFVRpyECx6PuxeS1Gr0ySYToiZw1FCWa3xISTatSfpcIonUciosPWJhQYAELL
         98wCexUo2tB2oEiSZXO0jqnWwwyvpRW6RmPj1RQdWM+UXrIh0/Hb+13iNA5hI3PC4i8M
         M1T7sXMU7XbILMobgelhvUCpsz3xd94FXvqCYbUU615Qw6niWDhKkgTEYcwdNC8pRmZ7
         bokntFLfOU7KmIvtbkYffGl9kBVpQ3HFObZkylc14PpUnLkFa+/zY60Gl5F5N6gerSx9
         6hJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+1dgrUxTuLnOWLUqbre3oLHFMiARyF8lNeP1PG4jmzgqAFuk3bCJeSgqF45WlVGNWVICUfg/lAXMc9hmW@vger.kernel.org
X-Gm-Message-State: AOJu0YzpE9feQnNSUzPlsb6Jzz3Dy1RLiWihorvIdCQKxmgUZmXUiY1g
	1k/uery2z/5Rieo3h+6doRFJCilB/Ne2/nJBQ2Perpmg3n7o2c/ZVwth6bdv7a8KB+T9uEm/QrS
	NNznOgGaSGuAZJuZY1ilR92rL/1HeCOM4pscOiS7Mb80BnE3OdA2Vl0whwfrn4rOhbiEN
X-Gm-Gg: ASbGncu2PxH1gUAePk5kkI3/yo0exTGaHbj3JaEYMLpZrxy/jcqCIgqjBV1DPrwi0cE
	Vx1CtugDRKadsCg63VwiVwUNR21IgF2SHUhuyJ3AazpIZiinXn5SwHYp9WvdEoovO0rXUm3usOq
	tmXjQIylqDd/4ZBl3TpZ7vqgd9ZYyNdLGI1o+npic/KBl8ukhNHiSQs5TUhDvOhM9sKTpERyPWp
	YTowPrYp7t3RDYxIdEy2aQvBj9tf5lcOYVah5E3hDANGX/IFuaftsDHVSPF6OTX5RHFwYxDbsw2
	Wwxd2Vlr7iFaQTM9YoBFW6vcZPe/8XSH3wDmplQNzJK7/iJCMeQXZyDiPvkt55462rdxazfcjJy
	J+9xeEGGkXhO73nx5mb8NRhDuaQ4Kpa5D8EsCUJxasIsWNKzeB5Ac
X-Received: by 2002:a05:6214:5184:b0:707:62c5:975b with SMTP id 6a1803df08f44-70d88e6e24amr16306286d6.15.1755772567151;
        Thu, 21 Aug 2025 03:36:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJD+FeF4dIo0pLY6T95BYJZrasalSuOqAYF2ufCE5H5qdImROfk2vmGTbiJggf0s0m/2xKdA==
X-Received: by 2002:a05:6214:5184:b0:707:62c5:975b with SMTP id 6a1803df08f44-70d88e6e24amr16305876d6.15.1755772566559;
        Thu, 21 Aug 2025 03:36:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef369bd7sm2985905e87.68.2025.08.21.03.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:36:05 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:36:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shashank Maurya <quic_ssmaurya@quicinc.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans-evk: Enable Display Port
Message-ID: <e2ke65gru7b75rnlg5cqlxpk3e7322tewvt7gvugjgnoezgdfh@6pqiymj7nipu>
References: <20250820-enable-iq9-dp-v2-1-973c9ca22474@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-enable-iq9-dp-v2-1-973c9ca22474@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a6f699 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=MzpP2GudIQyLNU4cacwA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Kqf5L0JFE3nWO8oW1YPP3X965rNmiHW5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfX9vAE2lFmZdJm
 ujPUM2n1hYmSlIdIrHLXUdwQQ24Lkbk6FiCfYbFkD9bVx5XJkImFBu2AUCa6oS5HVWVhOIfY/4k
 CSRL2/OZIqE/ArE/L1w8TrM90ZHVnt9GVFBgjOEH2hW5eryZQvnz4C1p1Ifa6640D9q9vGFWr3E
 9mVInElQ/fGKR/TRLudgo4mfaEzfrhQaMYpF7GVl2kUaSZU+uAgGl9lN2zVUO9N2lYPRzMdHgR6
 X3Jh/ULFPRB7lHnUslcXV5XeXD/iXdz8zoCzIMI/otkdFomRrG+hkTYx1cecBXsOgmiBmU3rWWy
 /xIuY498/CGYI7FpuM6zfGhWngQXYvalxNMsy6YwV5BdAqBJT0K5Bj+lTAEEEJO1Y/MmIA6uGCU
 Vqe81RGMfU6njn+7UqHiUQECK79XsA==
X-Proofpoint-ORIG-GUID: Kqf5L0JFE3nWO8oW1YPP3X965rNmiHW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135

On Wed, Aug 20, 2025 at 07:58:35PM +0530, Prahlad Valluru wrote:
> From: Shashank Maurya <quic_ssmaurya@quicinc.com>
> 
> Lemans EVK board has two mini-DP connectors, connected to EDP0
> and EDP1 phys. Other EDP phys are available on expansion
> connectors for the mezzanine boards.
> Enable EDP0 and EDP1 along with their corresponding PHYs.
> 
> Signed-off-by: Shashank Maurya <quic_ssmaurya@quicinc.com>
> Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> ---
> Changes in v2:
> - added dp-connector nodes for edp0 and edp1.
> - Link to v1: https://lore.kernel.org/r/20250711-enable-iq9-dp-v1-1-6d381e105473@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 84 +++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> @@ -261,6 +331,20 @@ &sleep_clk {
>  	clock-frequency = <32768>;
>  };
>  
> +&tlmm {
> +	dp0_hot_plug_det: dp0-hot-plug-det-state {
> +		pins = "gpio101";
> +		function = "edp0_hot";
> +		bias-disable;
> +	};
> +
> +	dp1_hot_plug_det: dp1-hot-plug-det-state {
> +		pins = "gpio102";
> +		function = "edp1_hot";
> +		bias-disable;
> +	};

Please move these to the SoC dtsi.

> +};
> +
>  &uart10 {
>  	compatible = "qcom,geni-debug-uart";
>  	pinctrl-0 = <&qup_uart10_default>;
> 
> ---
> base-commit: 1aa50d938e88fcad1312467bd09be4037bfe68ff
> change-id: 20250711-enable-iq9-dp-addc9c7195c9
> 
> Best regards,
> -- 
> Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

