Return-Path: <linux-arm-msm+bounces-73694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BE9B5949C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 13:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 651353AF95B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 11:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70DF2C08B2;
	Tue, 16 Sep 2025 11:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mZ6riIwC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C83F2877D3
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020523; cv=none; b=GpNfv9iM24Cj04QExHg1hPJMD6pVJUMR4fPd+2kaaMD/vKnQJBRJ1n4An957TquYNDZcF3aMsOHRoRzQJeZEckpgFVse7wGDlckvH1W/g47mXusTssUtK1VgNNWAxBZdkICP1KbVuGOqN9NV+uMLE5s0NWJ79csGI6yeE58lEIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020523; c=relaxed/simple;
	bh=JecI4baRKbxg9mlRZPX14WKgBFLLGnH9ACj7lbwRX78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjCkaUrkGO7WKjXkfdK82TsCFQTzom3Lf0TRv9twK14FP9Mk3+Pr0e7vJk3288wSEpYST2Dn21ZFkW0oPmYtuM6gYeh/7CRX5nDO8i+VqcZbf2U7v5M1wWEGowYQyHWPPaWbrrb7KrnasZX2ZPTFtADMJQGN1D+UzkxYE3bmAVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mZ6riIwC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA47Ag012308
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OWBe468scwOzFXQ4FxY74VVg
	9u9BX5oCReSyR7Jc2vg=; b=mZ6riIwCeVoyP9biCabTnNSPvQyOeOZmDSXFkNgu
	c9HT8QqkzJYfxPZiSKYzkQEG+ALrKKM1nwYKwXlyRZi9cJtIQ7pvWFhS9MqC6WRh
	4YG7jHroAaC6ZMkUlcwInkZ3CNTllvyQLbvJrjMtD/Vg9GAfMc81ddILUn+FjERc
	4M+Yyxp7Hzg2Hl+th7HmfrShx/7DaUh3h02xfMf7LN/HNtlpRT/xiMc41fRfnSA2
	Bys3yD6jE0iplgnAfucmVWEw5pIk65V+b+revqmyYX8n684cgD8/lEUM2COjifd4
	6d/xEsT/Oh2dBvrCMEjm2ZQcCO5NN513W2mGCwMqnKx8Xg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g12m8ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:02:01 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-54a1a08af5cso4943640e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020519; x=1758625319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWBe468scwOzFXQ4FxY74VVg9u9BX5oCReSyR7Jc2vg=;
        b=X6pWv+cvE4z/lD0Wz6MpS3cmpTfaGZIIe3m78XmtiUk9yHoUiHEJuNHpW3lzBtdE6S
         QZRfE743VkGKbx6LQ8JElk326U1qlnCh4SEhF/gxl+CNZcvHD0arODaxztBOVhZeWg+w
         07ez83a+txZFWGEAQOpezZP8034rC+GLu/0EqnXliYVQxmAj2DzJofwgxoIIi6NU0z+1
         MtSQWXN9HYCarMQrscVQvSD2Pz0dAdrwfFw6W9eR628N35T28WsZmmGq/fBXu23kKvhP
         Hbfk9pi3PNfqAnMH3rgcOqlNJi0GQsAtvx96cg6McCM1YAnK+sWk6S8tyc1+F49IheVI
         UOTg==
X-Forwarded-Encrypted: i=1; AJvYcCVUEGbbDhql28I3BtN3e/C9sT9LClZPUDVTZyy8KApiukKfwMJew5Ej//iZqWEwFyiAiOa0GOKWUwiQHmXT@vger.kernel.org
X-Gm-Message-State: AOJu0YyTXZvA1NWwvOxvQwcbE9EBjD0IHMHyk04xRfyq6MEbUGWRmFjd
	oR6N3LaXnjqjp5VxNI7vWbY0dZVcNDTtZLj9kZdENTxDpKNorUVAHxCRl99gGwu821tUgfq+FWP
	Mj/nkjhk9WAOo6kFrGPxIWCJQ9p54x0jmrOZWLsE3mD7gfg5gux6IPArXKiX4aECwgw3q
X-Gm-Gg: ASbGnctw3huygwp9CZTDpG1hT5GVgH3ccI2LLxZmm2qTWid4hv8fKvq3YFtEZ6zVj0G
	Cs5VjUWlfG5pSxeT3PEtBj563LmwZT/WsbC4ArSjAERIhWVLGQnGHsCDPTD2FQN2vmgv5bgXVvz
	/352gl9lwmx5qtvdvKENw+lmLh00++N8+9+6IJ4qTyE8BChJSVHN2qhG3qXkxVChd9wG3D7cfZH
	OUNJvRShFvzH8GgTHrNUi951Q3dwTUroCYa7KP+cj0g/8nPWnqduOIFmoEHMSlQ3vvp/qFSfDL1
	YRXIeOWfcRkA3lo8f7m5DKW0zS5n7e6uzKhuBFH0cnQkJDu2NbWjP4wzBZQz5qN7ZWr1pzfcXSU
	lhB1uVyjPGOZ6CknT7UxkK1Gki3vbc3m6gmEGVfl9jzigf9e1lQM3
X-Received: by 2002:a05:6122:250b:b0:537:3e5b:9f66 with SMTP id 71dfb90a1353d-54a16cb4b3emr5739172e0c.12.1758020519577;
        Tue, 16 Sep 2025 04:01:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIhQ74kakQxgpRzO0ONsKwulv83qkPHfKj7TAFJZhqWDBg4A4PoFyYmOJehH1fow8stkNEhQ==
X-Received: by 2002:a05:6122:250b:b0:537:3e5b:9f66 with SMTP id 71dfb90a1353d-54a16cb4b3emr5739122e0c.12.1758020519115;
        Tue, 16 Sep 2025 04:01:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-353725e1bc6sm26001481fa.27.2025.09.16.04.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:01:58 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:01:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-i2c@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 08/10] arm64: dts: qcom: lemans-evk: Enable first USB
 controller in device mode
Message-ID: <nz2dsvc6qyz47dxfbj4deo5xttnegv2qmueo4k5mhrvnkqh3oo@ddakv5hphfw3>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v5-8-53d7d206669d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-lemans-evk-bu-v5-8-53d7d206669d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GY_mRzWOIMWUFRFeS1G-BSYMSTXL2FlP
X-Proofpoint-GUID: GY_mRzWOIMWUFRFeS1G-BSYMSTXL2FlP
X-Authority-Analysis: v=2.4 cv=E5PNpbdl c=1 sm=1 tr=0 ts=68c943a9 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B3P4ua6ZyXwAq7e7NPAA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfX2B+cUCr9WMvS
 omwpclNf0uQzxfqQehCsZ08P1egkm4/UhO/RscTMZCJeWnzz0hTr8Rjs3UFmt3ZLDQh9CeMTI2k
 K/D+vrQl4hzgk8TuFnR3dLPvznV2LvM3vgktX0cwC5FJnS+N1kCBZLTw2wLj8aqjMADwv/8UMCD
 aPgfjqxNMTyojXXOCa3yepHq5eHA/PijZBgWpGiFqN+uplcBjzyLMhZjIbt3hAgAxyTGRPRI/vJ
 6xHDF5LLCqMc56zYy8JqO9lhkQWN2RF++jizSnAu3iBGaYMUfOS2MYtQ4wQRbdyRkm2o/bLi92F
 uGlxd1qfFN7gXVqedbyZBbeBeK1FuJ8I+sILDtZS9SWXKdri5qRMPT4f4kCDI0Z42Eus5u7hPkj
 BgVpR8OR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086

On Tue, Sep 16, 2025 at 04:16:56PM +0530, Wasim Nazir wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Enable the first USB controller in device mode on the Lemans EVK
> board and configure the associated LDO regulators to power
> the PHYs accordingly.
> 
> The USB port is a Type-C port controlled by HD3SS3320 port controller.
> The role switch notifications would need to be routed to glue driver by
> adding an appropriate usb-c-connector node in DT. However in the design,
> the vbus supply that is to be provided to connected peripherals when
> port is configured as an DFP, is controlled by a GPIO.
> 
> There is also one ID line going from Port controller chip to GPIO-50 of
> the SoC. As per the datasheet of HD3SS3320:
> 
> "Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
> not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID
> pin low. This is done to enforce Type-C requirement that VBUS must be
> at VSafe0V before re-enabling VBUS."
> 
> The current HD3SS3220 driver doesn't have this functionality present. So,
> putting the first USB controller in device mode for now. Once the vbus
> control based on ID pin is implemented in hd3ss3220.c, the
> usb-c-connector will be implemented and dr mode would be made OTG.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

