Return-Path: <linux-arm-msm+bounces-54133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5EBA87299
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 18:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C86DD3A3339
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 16:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40971A9B3D;
	Sun, 13 Apr 2025 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MikeDy2o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6431DF721
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744562128; cv=none; b=YkzWcLuhitWAmRRqRHvtpGYVjNpMtfb/X2cRkvhS6fg9ZkkNPiVdk4eSC3rM/0f1LG6Kj/RBsAEvrWYGq/i3Q0OEKdVzEQ9NSSabKsTgZ+U6ZJ6Txbh67q8Xf68LL2u5jYuF47bqZziVzMcRdDw5TdjmFwKpE9lQ1/zlXFtjg4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744562128; c=relaxed/simple;
	bh=RB0Is3RsXE4ayIze9bhVA06wlRHIFRumqGpp63ItTVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFZ9HbQwJB7GOCQy6sSbIDvzfHk4yWkVvm6JN7/5PP0p0nyvprJUuOher5mk72uetekOGUV4PveQrv4amPWReX7pf/gM8smH74rqvcMRyFVZtEJbSvuRIZsxmy6UydJNdGfpV5Dfx8DbS0u0Ef0YU0LlZQ+8rKfxMxyCizY5Szo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MikeDy2o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DFpJUV021271
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 16:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HHDGRlqVtQyxh83zlwnFTMpQ
	Jn3llTrejkQ0QtY9TUg=; b=MikeDy2oM6IDwZvBeICfrVy6g2JuSn1wycCTDOJy
	ewpYcbNKm1lkqdvXr3OCB4shtXjbWN+TBdYtBVgcPSAIi6/zQM4I56WAMY5FjJ4h
	dn7FDu0fQaDrk9cbqdTUNneHMfwnhGAHMRgtP9+qGg0YI2MiVtKSWjj7orm7QRUX
	ZGYJvM8W3c972lOf/HW79X8durgIMCEro9e2RyIRBJM4dT+kPhHllv31StHI1gpl
	YVcdKhNbB2lQZ4txeZXjvuvtLb2NNGTae32ixYaZr6rsvoaJahePKgP/MXwS8FxG
	TttBkWSNZP1X/DghyQqyFoUQgRtCXFdMHmN7mxebRRJ+EQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj92byh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 16:35:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d608e703so634791885a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 09:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744562125; x=1745166925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHDGRlqVtQyxh83zlwnFTMpQJn3llTrejkQ0QtY9TUg=;
        b=kLrqvfZX2eIsButGB4qscLSSC2g/d6xn35TQ/RqESU7FIzduPW1i7LCzje9sYNbhGN
         MJD9T3vU2FVtPgYiCNi3s9inR9ZMU7y8vPQ1f9w1FL73XmwbhbMf85iDeLisp8t84UGz
         iP+qiq75Kg50qkOaNZrAz76h9IgipmWDs+VyzEmti4/aaH9xbUkMV8bb09HHMxSKBXWA
         16QfIOxnH4K4Oo9csTYTd+lHs4zlt9mAK/W4fC9ru5Pyvwy6JWOk2ApgJ2KkP8xStMBD
         kAbIjtGJ83vWeep/GxNNfqWUdcwQ5F0apW+tViHbL/TQLrzDAFeQ3X3PqT4r4eJi6ol0
         fKrg==
X-Forwarded-Encrypted: i=1; AJvYcCVL1//yjYgrVvShtTuJt/X8mEjVgwyuJ+EL4CeEhNSIpr7bAdpl8NPioLDHamayrlRtrX+bfmguG9ei6ML4@vger.kernel.org
X-Gm-Message-State: AOJu0YxKt9bmTROrYCXoM1KAytO2HL4fjT5vnlAb3+Qc1w8hRfLwAHgK
	UQ/J49I5VLNPWkV/r5W71UYjTfS4IySFw/Ki0W3+Jcij0zgfA768Dq50XSDAS18H6VxpE5DHgwh
	rzDHCPXmjChRgaKMdFNqsm56c/sQC9H+79kJKvukgoGVAeIB8YacwCXz65S5luNVI
X-Gm-Gg: ASbGncuzmMqmjDa7oeV8GHOVoau5JzP5TgkK38++SXT/1r3pJGgN1xRUm41M9cBMu6L
	RCp1jZo2KqobpsQh7oAXbBEGid0xLpCfpr4gFTeCuoGPUzl0WoQ6w8BxoKwn2u6vbK+heVYXt4J
	c5ZZRX9nZ2HngUQkY5kAD12CVNE5Pr2Z8fiVQ5MYlFHRP+1og6ntET43mrgJUYAgjpLWZDh04E0
	TmMhxUkAxs0t74l/2nEzr4duM+c40YNIbPEFHYOI6o/nLIVLfUgJRAbRRSJMCPX4E9Utasb2tqq
	kK4SlNJFTIyv1fj9obogutP/2eS9kfBcxP4ZsKZ42SVQKIOIZWIS7jblCmz4K+B3y6xJQJWp004
	=
X-Received: by 2002:a05:620a:2684:b0:7c5:50ab:ddf7 with SMTP id af79cd13be357-7c7af20babcmr1365619785a.52.1744562125102;
        Sun, 13 Apr 2025 09:35:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ2SmFOwzSyR099QmLh/foSM29GY2hyA1aduFy1joD+oyH331vhHReKlrLXjjTN89o+aPFZg==
X-Received: by 2002:a05:620a:2684:b0:7c5:50ab:ddf7 with SMTP id af79cd13be357-7c7af20babcmr1365615385a.52.1744562124627;
        Sun, 13 Apr 2025 09:35:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d23c8afsm888868e87.101.2025.04.13.09.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:35:22 -0700 (PDT)
Date: Sun, 13 Apr 2025 19:35:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 2/9] arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563
 PCIe switch node
Message-ID: <ethalrlraf4lnaefcmks4buffqfsuxasmfjmajhlz66zoqtzvi@37hh57nbfrmd>
References: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
 <20250412-qps615_v4_1-v5-2-5b6a06132fec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412-qps615_v4_1-v5-2-5b6a06132fec@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: d5vKu58rK8YDcGye8CiLMlL58Z9NXyYv
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fbe7cd cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=2cuD_6P_uzM7HzBj738A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: d5vKu58rK8YDcGye8CiLMlL58Z9NXyYv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130127

On Sat, Apr 12, 2025 at 07:19:51AM +0530, Krishna Chaitanya Chundru wrote:
> Add a node for the TC9563 PCIe switch, which has three downstream ports.
> Two embedded Ethernet devices are present on one of the downstream ports.
> As all these ports are present in the node represent the downstream
> ports and embedded endpoints.
> 
> Power to the TC9563 is supplied through two LDO regulators, controlled by
> two GPIOs, which are added as fixed regulators. Configure the TC9563
> through I2C.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 129 +++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi         |   2 +-
>  2 files changed, 130 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

