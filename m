Return-Path: <linux-arm-msm+bounces-87723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BCCCF9481
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 17:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0675300A293
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 16:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7023623BF83;
	Tue,  6 Jan 2026 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPY1q7sv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hVYM5IKA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653EE22A4D8
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 16:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715803; cv=none; b=FBnbyybRVwOVpmcM4W93QDig08HDpd7RyU3EKovnhWZV+H0eIGtil/7yZVT0CTGDXTk/wGSa1kZyihOeTjwFlF4S904R5ycswzYrp9TGXoXch8kZb0xs44dyyu5w3xTxV0s3Ijhi4SPJufiPpOag6wkHztqGR5rykLmvcsHO/WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715803; c=relaxed/simple;
	bh=GKJahy9bevsbHRGE/eglT/m8qX8vTJghuh2mr9yMkm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RB+2By8hu9lCpSLigTMgfnIiIM6pYbsooGd0txVQBtKWIHytnx4cqxGzKJmbBrSAmy/VL4O5TOp92jLxqgFoNFt0yA/zLhhfCfttXnRyMDXMP/RFR6TP1YabgVuJpWZfp7aeUcRKEPMTR6x0nC3VGp+wtP2Y/asENMnRJaKM4c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MPY1q7sv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVYM5IKA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6069W8di4090722
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 16:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fWqs1Qn3NpZHXjse/DaLUi1M
	PNuZ1A1rxoloy7v1ngQ=; b=MPY1q7sv8B8ld5H75IelkQUs3MhNTGABvOSI/mw0
	K2CPWMWJQ52AtxSetkXMkuXT8P44h33dNLll7mQ7XTVPt3rfKK08ZjevlDQ9trBc
	urvk+uAWTyaSF3iyi7sip26Gvs0mAoG8hfvW7LlKId19t6jyl0Pad8KK0mkGOc6G
	nUYQMYmYW75yXGfaW4MDLp01NPwc5b/jCi6IUrRLNEy1Y2cy9ZeDIsgHHvjmc6fP
	MDzXg6QqLE7ZZWDIVSQks+/5RioDzFZEfkjAzcjy4+GF29kCowTCH7TPITwd09rD
	Mkzi5Y5BuoIDv+IC8HCeYJ1NfqVddEu2xHbPMoPnyRHiMA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyun93f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 16:10:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4a5dba954so30367741cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 08:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767715800; x=1768320600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fWqs1Qn3NpZHXjse/DaLUi1MPNuZ1A1rxoloy7v1ngQ=;
        b=hVYM5IKAEcW/yAPTHoxUZMAa3TEBXUMS6QOW+7STNaLpHAQgtXPZ91D5Dyrf5z8Gv6
         xXZ0pqdCJoqmockeKHiSSucUI7cqtxWau0OjOtNyeGI68RTpKtEwI7UeOk8G2v0Go5jA
         r0PdGov3INpVBSV0SubENpE/hzw/pnKOhUAJclisRrIfbLhd/S1Di4bY/bjG3/mj7uKD
         Dl02ebitC8pQh3MxsUkX2RoU1n1r+WbJpIXXv2vc1/DlWsIOmLXolu89+Onl1E0T0wGJ
         jWO9TQ068k+XHIpe4ML1jNooZ+MumurBHoy84y1qZIJYnqjyHjmKOY9CU1Iw6j80e0GK
         qvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715800; x=1768320600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWqs1Qn3NpZHXjse/DaLUi1MPNuZ1A1rxoloy7v1ngQ=;
        b=JdokKwn8uockPnqn4MLwJR3V5ziAekSaIEueq0CvzQpSgws0UfhW0yfbI7d0R0oSM6
         y+VGqYJi/X3Ap2g6FoLDDj90CytMfDLOCmkmFxyDZf3W3sZMfaI1vA/ES4E4dWzOuuCm
         odsBNP5IrHoF1WpKKVrrbpyYugt8F7arOEXhgCvtD2GlmnfPGdyK/4cuiJy34MIeGfxy
         y96R8U6mseOwiyV5QzTFlPvfTX+GqH75Cp7oiNj2BCJgZUuxCrE/0sqbT4eOxCdb3y3l
         WRD0en/ncn8U2xB6RoEXsttuBwYTxq9FhH1KxwRiZO86Ia/kcEjSFnhvcEetZFIKgc9C
         /0HA==
X-Gm-Message-State: AOJu0YzrxfIilK9YeOoIAN7yxXtU1HaKN9db9Zmk4FLIzKRxbDDHCACs
	YiYaZ0e/DYqi1eKGqy4UGpQMVM80CMtn1WNLbV5HfSXqvDpxWCWkWDRPJt9iHmoDWYgiU3RYqT8
	HvcpRPjlGM/q+52jvabHNFH7rcA4LtOCQr5jQo0qqO/3bM69NM+EhHRdEq3J2N4/Rt0Hz
X-Gm-Gg: AY/fxX6gz846ttenALoc46ZAC9syPEZMYu7jJMHyikjhArryEMe5a3iZB3tooufGALO
	e/LzC7v4BNHOR84gKqWVVtqLwa1jWv0ewp7f71kA/+o8k9oR5/L64Ucph/NWzPQu4YGT2/QBU2e
	uorqBm173vUOKK0dPmJotAdqeiq7IQBBMCCElHWJTSl0C1LkW7cXAdbPeH96qdyYP2SP9W0zUCi
	Z175uFm0DfSsPlUavw1Rc8egmEzzC7aLLTezwg+AeuBENcZLcQzOZIX2R75Ul0IYgF3Fo1ZDAGW
	sf46B3sf4X++Akygr5iR0GAqQFHZV8MwDYc26ukN63DSovfQtRmLCLIpw8wt5MMfgOZgj6G6l1O
	Bz5NvGC1Pvy5s3s3oTOarIgVb6NXebaM2VmhGvb3hdZCIru6+UZke5Jzx8RBTzaxN61te5mD4Ar
	M5PgjObQ6HAdf8A3HabBVBAw8=
X-Received: by 2002:a05:622a:5c91:b0:4f1:b712:364a with SMTP id d75a77b69052e-4ffa77f4f64mr43937571cf.56.1767715799572;
        Tue, 06 Jan 2026 08:09:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFN301CIMXpTn3Ofe7I2pGsbC+Tm+6+kz6hSrM4FOS9auE9S6OSXxipOg5vf+IT3IQJdRX6Vw==
X-Received: by 2002:a05:622a:5c91:b0:4f1:b712:364a with SMTP id d75a77b69052e-4ffa77f4f64mr43936431cf.56.1767715798766;
        Tue, 06 Jan 2026 08:09:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d67883sm669963e87.67.2026.01.06.08.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:09:58 -0800 (PST)
Date: Tue, 6 Jan 2026 18:09:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/14] power: sequencing: extend WCN driver to support
 WCN399x device
Message-ID: <hnuhw23po45mpla76b7z3ppflrrh6ksgcpay42lh6dcuou5usq@e45oapvn37n6>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE0MCBTYWx0ZWRfX0hmaqYl+1PKg
 YHqUU4QfESQzBw6O8/EaYgdxiU31HBun3ybE9imwjgkAunyendG7NzRVuCznbd5T0EeODFo2yuU
 QqYl7WzFcvqyc9oAnLPyAtMHKeOuKEnoEmBJMs69sCIN439DklCUEORLYYELGhITVA+EzzLxOBy
 I37rLWBEqsJ5+EwDHevgalI5284x9O9c3eASbsv7l+Cx6bOD3DT8I8Psdg0HR9Jrr6rdMfgsEmj
 cyDsFjHgTU2f/W8W15AjHH50qc/jrjfFHRH/nT6R3odHsHDDJtWuce4jWojOUe0hjn6nvqaGLuH
 7dOk2rvs5Nz23ooPynE44MiAtpwjbZ2iJo28vlQS9q3LmLSDFZUieCvaHSKCbb2HIYFH9bhPqJi
 pXo+76LHaJA5QEPhCHWbjXXuJ8ur7yUPxi0MdmDZ38SQZcpv4w/xWIeZzLcpyG19v+W6UyHLvjf
 uHP86P9CCj/RVHz/HLg==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695d33d8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XeftDj3-BFt3Fdqp7McA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: gKnuyYksruu3rGoz3K3iJhqylxEhpWLa
X-Proofpoint-ORIG-GUID: gKnuyYksruu3rGoz3K3iJhqylxEhpWLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060140

On Tue, Jan 06, 2026 at 03:01:10AM +0200, Dmitry Baryshkov wrote:
> Qualcomm WCN3950, WCN3988 and WCN399x families of WiFi/BT chips preceed
> the later WCN / QCA devices, but they still incorporate a very simple
> PMU on die. It controls internal on-chip power networks, but, most
> importantly, it also requires a certain start-up procedure (first bring
> up VDD_IO, then bring up other voltages). In order to further unify code
> supporting different families of QCA / WCN chips and in order to
> maintain the required power up sequence, properly represent these chips
> in DTs and modify drivers to use power sequencing for these chips.
> 
> Backwards compatibility with the existing DTs is retained by keeping the
> regulator&clock code in the drivers as a fallback.
> 
> As a part of the series I've converted only several boards, verifying
> that all known instances of WCN39xx family works (fixing the issues
> meanwhile). The rest of devices might follow the pattern later.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Split the WCN39xx PMU schema from the qcom,qca6390-pmu.yaml
>   (Krzysztof)
> - Expanded the comment in the WiFi driver (Bartosz)
> - Changed vddrfa1p3-supply to vddrf-supply.
> - Link to v1: https://lore.kernel.org/r/20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com
> 
> ---
> Dmitry Baryshkov (14):
>       regulator: dt-bindings: qcom,wcn3990-pmu: describe PMUs on WCN39xx
>       Bluetooth: qca: enable pwrseq support for WCN39xx devices
>       Bluetooth: qca: fix ROM version reading on WCN3998 chips
>       wifi: ath10k: snoc: support powering on the device via pwrseq
>       power: sequencing: qcom-wcn: add support for WCN39xx

>       arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup IRQ storm
>       arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
>       arm64: dts: qcom: sdm845-db845c: specify power for WiFi CH1
>       arm64: dts: qcom: sm8150: add uart13

Note for the Bjorn: I'd ask to merge these DT patches in this cycle,
while merging the rest of the patches only in the next cycle after
landing all PMU-related driver changes. If it helps, I can submit the
patches above separately.

>       arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT properly
>       arm64: dts: qcom: qrb4210-rb2: describe WiFi/BT properly
>       arm64: dts: qcom: sda660-ifc6560: describe WiFi/BT properly
>       arm64: dts: qcom: sdm845-db845c: describe WiFi/BT properly
>       arm64: dts: qcom: sm8150-hdk: describe WiFi/BT properly

-- 
With best wishes
Dmitry

