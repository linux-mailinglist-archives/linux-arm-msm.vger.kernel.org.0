Return-Path: <linux-arm-msm+bounces-60766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7367AD3562
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 13:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BE141757E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1261C22B5B5;
	Tue, 10 Jun 2025 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWKkWxYp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D3A22A4CB
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749556696; cv=none; b=BfY6TnAQV71JAyrEJBPV2dpunOaOGCEYVHsagqZDhOrDZALzZtW9WawGHal8kTnEkr7HTOi4GWoH6awIgq5YylcI4Lncz6Mqz++o46CsTlwlwUwMFYpl+45FSvDcFNIcLFXAmYuoYzdUD190IhptpBC+lMZdKVLNINKp4tDFg+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749556696; c=relaxed/simple;
	bh=Y8Em9NS4yQ6mlgIzt0kUNbKJWBlBLGc6b39eEx7HxfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HPsRBaMwEDlcWh8O0013u2cVw8CpCdwtch0e61x208iad8xpWsCtaPLWjnMcba6wwv2C/Og6BvOaoyBxdZFxa2U6EPeaq9cndOkdnLu/VXCLY0isX3+ShP1twZyrAiA34n7tdRZDt2EBozFY1ubucTomkJiFC87cLBNJteIRrCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWKkWxYp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9O99h011931
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJ6+ORb5liBk+mkhK1nYbmCS+4yM7TemgWQTbWX2QOw=; b=AWKkWxYpgJXrVaLE
	UrBS05768i944CObxrkJFp5bufq2NoP2/OmyeRzleX7rNczsowZZxxRHnhMCjhh2
	UWU9vbWWfSve5s9e9nJMXK74X9UNbwWrX4zrMwUii7cs75sYEXu4+vlEc8eE9bmx
	z4/Ic5RzVjPkywT4Wq77qGZb01rTMZeZ10LBWiy1WBqL9aFCfu/EtDLO/uVKWwkU
	7Pt5i2zmXmIS2CszK/FRnhhC4im3O5z0R1G5dUoseOP9ONM/IVHTMt39x7ScefS9
	Sl4oUYDzJIcC15z1MT+JnBK8FkmkLCaDr+tKGIGbal+XbYkyhpJBF4wn8zPvN+j5
	uHF1Sg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekps1nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:58:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-49a4f4021ccso11011581cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 04:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749556692; x=1750161492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJ6+ORb5liBk+mkhK1nYbmCS+4yM7TemgWQTbWX2QOw=;
        b=AXZSMUWzUClZvujTCckM3E6ZkJYUKFg2M5lZ9PNOS7VXwB8metChvMhpwHMCigRB7s
         zpB8n1qBcXpzL1OZJ/tPiV+0lMt3XmXEScwdYelRFt5E1WVLhxEkRJ1VIzEwv6EjuOfH
         dtCeIx/JHOZX+nNsj2vl8MhDyqmfL/Q31PZTAQdu82NLHD2IWxNQ6smq3YELMECFq6BM
         MqHI8EksdjPrQMiiJJBCCLTTUAqadrNb8Sdux6+Ohh+FKdLwDkTXEmVS1aG2x7DhR7WU
         Wn6KarLKCpBu5jfqLScxb0GgXKhR4856LaaREjouRofy218tTvvTEsnmiDGfdYmQeEzi
         3C/A==
X-Forwarded-Encrypted: i=1; AJvYcCVBX8OGCnqhlkWKocOc91H76tbiD/mUFASs+ueQpTNxHZ+0+zYRGl3LtVj1+uhjYIq4iJ+TUOMA4scopQtu@vger.kernel.org
X-Gm-Message-State: AOJu0Yym4K6C0Y4PZ2Bbnem+cD/W7LenhF/SfYMLJYi1gQN3VFKxqXc3
	vnU+STsNX3Dz+ccOhEZoQnxXy+Ln+j+6BeDvkTw3tBAgykdVjbk+PBX5/F9J+QBUL6HhzK4VUar
	lKyoNUDTrunxfG2MK7+U7eOQmzsltxx/L5kwiTpBfXKHpS4PzTtUxL54J0wVXxg4qzvgn
X-Gm-Gg: ASbGncv0B0vbtveCb4NtMDWrssIQ16EyTcy4uKyxKMT8Zh/DZj3Hz+CBQRi0KNsQT0q
	+emAAYI+IdbE5KJh4zvEsNYBRhh1rNmHAW1syereS4EltUYGQZeWcm1ZF4sVXiiQGPXSVqwAZlc
	kSkh5odiKT60vSclUj9u2wIJJc+Yn4t3m6Tb21yRZjeTWoYXUYWNa78YcJfoSYI1UaP6VtctSgj
	Uvdmdx8fRuJu1z3Ip2sSQ8NyyEEuRx/fJFXQwwTVRrDVZqEUFG/MwRvsmHvggDrximBnCmSkVYQ
	RL2RiAXgnaYe+iev9PDBwKyADOrgKZawxKhgZucWrWSa3SF+EIpOMz2dszkLQq69pk3q/pjbWjN
	M
X-Received: by 2002:a05:622a:1101:b0:4a4:40e8:6e23 with SMTP id d75a77b69052e-4a667c1d1dbmr95006071cf.2.1749556692147;
        Tue, 10 Jun 2025 04:58:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbA5DrdMqWCD2ySC5PETSlVXoPSub2FJPNFoTOkSwxhiBGPqwDNOPd7MHJQlO6PqwixOLarA==
X-Received: by 2002:a05:622a:1101:b0:4a4:40e8:6e23 with SMTP id d75a77b69052e-4a667c1d1dbmr95005791cf.2.1749556691688;
        Tue, 10 Jun 2025 04:58:11 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783e66f1sm6071020a12.79.2025.06.10.04.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 04:58:11 -0700 (PDT)
Message-ID: <90791cfa-89a9-4745-916f-ca5381247a90@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 13:58:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: Add support for X1-based Asus
 Zenbook A14
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Nikita Travkin <nikita@trvn.ru>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        maud_spierings@hotmail.com
References: <20250607200229.30538-1-alex.vinarskis@gmail.com>
 <20250607200229.30538-2-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250607200229.30538-2-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68481dd5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=04dXdBH-sfCwm-JsXqsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5MyBTYWx0ZWRfX70wWpaX3g6gw
 Fy0bdyPD4i25/3jzdhlt/Xew2CQxPVe1a1xRKeqDcehCYt/RFPLhLfMBvEhyl+eCpgS8Cln0tmF
 EOsa8WDwjLYn9ym0VVHepN/vQmObdWjg/7H16JDDZ/ae49Fv0rTkEKU3Yo8CGNgz7jTRa9Eqh0x
 5YNRVyKLJlrH2Udmtbc3mX8bR/exzEefrNLGvdc3o6epslP9Qt+erdYvKcwofCBoXQNEzoD8evY
 WY34KqFalwApmRFJdM3Tio3gK4Cu+dGdbr4w4AeZu7uc5K2jyGuRtJD2uYLyfaOi4VfBFTvivQg
 oX8f3Im1Zhu9/CMR+8Gc1RV+TNeXJcxtTUZb1rrFvjJZEK8liLl8fOas5fLmhYUMmb5ifjbu+dm
 qRmLQ9PvxpHmu4odZ11HMsf3eoIQzACvXZS7Bc/PYPVLLDr8x9YSfxLdLCIRniD5BkFoU6GD
X-Proofpoint-GUID: ZHYQRufaKyIRvPPbc98dPmzPPZ1oxWR2
X-Proofpoint-ORIG-GUID: ZHYQRufaKyIRvPPbc98dPmzPPZ1oxWR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100093

On 6/7/25 10:00 PM, Aleksandrs Vinarskis wrote:
> Initial support for Asus Zenbook A14. Particular moddel exists
> in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
> 
> Mostly similar to other X1-based laptops. Notable differences are:
> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
>   and Qualcomm FastConnect 7800 on UX3407RA
> * USB Type-C retimers are Parade PS8833, appear to behave identical
>   to Parade PS8830
> * gpio90 is TZ protected
> 
> Working:
> * Keyboard
> * Touchpad
> * NVME
> * Lid switch
> * Camera LED
> * eDP (FHD OLED, SDC420D) with brightness control
> * Bluetooth, WiFi (WCN6855)
> * USB Type-A port
> * USB Type-C ports in USB2/USB3/DP (both orientations)
> * aDSP/cDPS firmware loading, battery info
> * Sleep/suspend, nothing visibly broken on resume
> 
> Out of scope of this series:
> * Audio (Speakers/microphones/headphone jack)
> * Camera (OmniVision OV02C10)
> * HDMI (Parade PS185HDM)
> * EC
> 
> Add dtsi and create two configurations for UX3407QA, UX3407RA.
> Tested on UX3407QA with X1-26-100.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

[...]

> +&gpu {
> +	status = "okay";
> +
> +	zap_shader {
> +		firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qcdxkmsuc8380.mbn";
> +	};
> +};

Override &gpu_zap_shader {} instead, this doesn't work as pointed out by Rob's bot

Also in the second dt

Konrad

