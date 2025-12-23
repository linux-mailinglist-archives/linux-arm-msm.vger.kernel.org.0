Return-Path: <linux-arm-msm+bounces-86406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3460DCDA4F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A27D53000B3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 19:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF80E2FF153;
	Tue, 23 Dec 2025 19:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PfpJMe5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WhpuG2Nf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350572D12F3
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766516925; cv=none; b=C9Dmk6032o7x0JBqoomMyNhAJipudIckONdcqlYxiu3d6bFu4A4SnU+DyGH9vrb5p2KRB33SQDZKftum5I/Kc2/xRGO59zBkC9djNP+LNjL9IueL7GaEOsAkz9B8QO1J4yJxWaYttSG+jY+x31z2FawK6/fJTo+r8Gzb1nmjesU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766516925; c=relaxed/simple;
	bh=DLTcc4UnApmdJF/W1Hj2GExnopeZ5YRVc9FY544L5ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjOCWgi5UYCK4zxMfVlDItsEr2PoGrcTCkm7I0YskrbxpcvwmZ93wYWyYYmNweUGW3UsobDrVj7CYAtvo5w4y+1jB0IZVGdDc/xZQJILuPWP0jUychSbIrBI6/sGHGDbR59vbow3s8QsNMjUTd6FIYiOWUIRIQ2VYCzxjQvfIY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PfpJMe5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WhpuG2Nf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBR8VJ700440
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QO62dClkkSjUhSgsu+9Nxagr
	QOnviHb8v87abS5uRHc=; b=PfpJMe5/5vCU3xoqcGYJj+P/k0Wp9b/oTE9Dhoen
	yN/zwVwNQc8W2Wpcmxka9pgcNFXfn+qkM2dK/vYDmZJzRCIsVeBtYznozj3e52xp
	lg6312188i1QbFwD3WiSJKTz7IOWz9AGZuw+RNMpe/fxiipv8y1XMIHiOS+202Vs
	qgCn4ApkV806vlHPiOD7vAzPN2ZTXroZtiUy6W9i2GhSSr1a9p1FMGyCLvb5bMWI
	qyVQHG+SbCyfbaic4pyCWvHlaQ2HEq4X3Gfr2iqdjr2z81fCts0GVji3IEkVK82K
	6g34MRcT1AMrSppNdazEiV1shmnj2/CF5J/n7f4fD3x24Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jsa1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:08:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a2cff375bso113457696d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 11:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766516922; x=1767121722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QO62dClkkSjUhSgsu+9NxagrQOnviHb8v87abS5uRHc=;
        b=WhpuG2Nf+05jDOeiHbwbm1XBWVpjn2Mlwm9/uP8NUGEVQ/EswE5lkHyTYHFDhSfRWQ
         s3T0EAd/nWx13pvbH8zIDiycARlXRowzzenhtc1UbtPf0WfjbemIK5oXjywkPlURmx/K
         9q1Hk85V4y1DPzDEvLzBB/t/C99KPCatSB0cs+vbbaqIkkOXLC2V5hzeBcKEElzdV2ta
         SBoH2enFeGlbJ+9gHodfU/x7yH7+jY9evEN0tZOrgCvzKlL6TMJPdwglKKlVWzvl0oME
         kKGmavjVZGMwnr1asfCGf7pdjPErcB63gFg3fEXCBX2tdSAHHx3TArcEGk4Xrm92RdXu
         k/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766516922; x=1767121722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QO62dClkkSjUhSgsu+9NxagrQOnviHb8v87abS5uRHc=;
        b=eEXRtiC2/zXDy4SqkiCDswhUnxNrFPZ2babzTT7fbNr8ABekuXkGELSpLpFwy2RJ5e
         nO4ILGKwTH+ZoLjA95tXkjkIGBFEAiEaIGIpggSbuPt2sb/l9bM/YEfdoW5PAGnGN31Y
         xRXv0heLa5V+N6bn7vpEUhAYD4asYPGqeRfkQTazDaF0/Pp2ehzsV8BPREpSzZYJp9p5
         7xfJQGhXyxRTH9U9gsWX5iMbqx1OErhP4ZH7X0YN958biOWIsONOXUiQ4aqUmn0tkv+p
         ca+EKh0HGDYeNDR6rmM0cOy3lO/XOEMhJ1l83geozSXOiLsqYfnm4kXxqS3MC919zlht
         C+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWidMmqiN8DsT7gSoiv/Zgxi82Hht51tiS8OO9QL+SWcQXOXNzd50cB6t265TM2umx/8xhutflfMEVlBQyY@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ/vGDw9QT05ApU3BhtsVrHCSEXE+2H2tx5AnqclL5fHIrK8yy
	7uklQFi/ON1kcCLcAeN7kayYDXI8b86zUk2MJ9qkkYWxeVLShSrxCE9cfEeVJsGMFfIfWMghq3V
	6NBg01/yfHCdxMl3rup9DOIu849tYta3YMqMa4WfFHN9CvneEtPCAsc0EplTUPQqjcXki
X-Gm-Gg: AY/fxX6DINlfapoxT3jqdA7GrRcYkDcx9mwLMSzggBYti0f9yRF5GPb3hP93wBuAhzg
	uIRMmCSLjuu/Buh/golo26H9L9X2apCCOC0wecVIs4bYJcSiInKpVqL3kIYnjniDfABsxuZlZsf
	ZgIGRI+ZoTYe89F6wsCt6ayLyijepjT41Bxs37CfHjurp6T8nhr824w6toA2jC0y44hIekORTqu
	5sOLFvLlUIZbTz4D1bx2nIJNixv2d/2o47VOXAEvWsHAY28vTxnowerxlsdJI/RwHchuZK7uaTv
	isswvoakPrMHmxs4zm3Hra6nC7bPZZ0BaCfrwvJ78UwZAaLqzRXXPKJFX/rz0fQtg3td3dsMOTo
	JiTpmwTK8fOuEGeeF2ekKfk8QUlEIpQdHy1VywB6ShqP8+Ujo6QVg5bsrCufjGSPQclpbHJ8kOs
	qac8PE+zFpWR3RrZ7HFjvAAF0=
X-Received: by 2002:a05:6214:8092:b0:88a:2eed:486f with SMTP id 6a1803df08f44-88d8166a46amr214299136d6.9.1766516922356;
        Tue, 23 Dec 2025 11:08:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFCSdKwVH5wD13PdUqft6HXd3dcPPbF0TX+I1lL0wNpE7844fv4MmXsU6qhN91InL4Jgp/XA==
X-Received: by 2002:a05:6214:8092:b0:88a:2eed:486f with SMTP id 6a1803df08f44-88d8166a46amr214298706d6.9.1766516921767;
        Tue, 23 Dec 2025 11:08:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea2d8sm4266990e87.45.2025.12.23.11.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:08:40 -0800 (PST)
Date: Tue, 23 Dec 2025 21:08:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
Message-ID: <catfa6d7qofd6uwkz3vepidznxa54btpw5a47rokugjdg2ogs3@qqqmo5suq36v>
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-4-yijie.yang@oss.qualcomm.com>
 <woqdn6gvlkgux6nuixpcwmcqkl7siqajgwrvd4x5cuuw3nlrpp@vmq63mgudnoa>
 <a8784c60-6551-4312-881c-c36523731862@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8784c60-6551-4312-881c-c36523731862@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE1OSBTYWx0ZWRfX0ttNV1MI0Acj
 DMl7cvWXEZxV6zFjAMjzalVwZfhKm1QvLe6eQmA4rkc9omZXCiXkyt8Fp//s8zQaqWFMCQW6/pk
 ejlltGG7L9iZOXhZZi5Y7yYo6tPbqWme3A/Wahwfd1sW2TVTa2WqThbmxE+ulfOXHHjA768L0PT
 Vqp60lrpRzQHGNzTZqd3TQwMegf+SYbSLPUIQjDUBtQr8wnXi6ctJ8fE2iacuuyBbttNe24JaCm
 HF4muYjcH6vbTBfVHNbwFKioFZ6WT/Vx/3diRJ1xvSi5sOgeJMrktkvbH6HY9REo+M8evwheKOg
 Ewen8Otcc5Ip1eI0dYNFjJr0xvqKf/7nxvR2+HfDZfMHdhjoiIsS7l3ftSEO4tPCUtdZW5jgdbl
 MTERUYAriglLYtC6bJBZYnEH5Mhd3y3yev4seaK/7amRrS0Fsw/nKMqxiYUwwIWgAiH2wfJGS7a
 jnY8JASb26lrKRjo27Q==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694ae8bb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=l_G8NALvrxP8-mubxe4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: hJFRuD8i_05l_BX40p5aPdUiWSNJlxt8
X-Proofpoint-ORIG-GUID: hJFRuD8i_05l_BX40p5aPdUiWSNJlxt8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230159

On Tue, Dec 23, 2025 at 10:02:54AM +0800, Yijie Yang wrote:
> 
> 
> On 12/22/2025 5:22 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 22, 2025 at 02:03:29PM +0800, YijieYang wrote:
> > > From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > 
> > > The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
> > > the Purwa IoT SoM and a carrier board. Together, they form a complete
> > > embedded system capable of booting to UART.
> > > 
> > > PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
> > > Meanwhile, USB0 bypasses the SBU selector FSUSB42. As a result, the glink
> > > topology differs from that of HAMOA-IOT-EVK.
> > > 
> > > Make the following peripherals on the carrier board enabled:
> > > - UART
> > > - On-board regulators
> > > - Regulators on the SOM
> > > - PMIC GLINK
> > > - USB0 through USB6 and their PHYs
> > > - Embedded USB (EUSB) repeaters
> > > - USB Type-C mux
> > > - PCIe6a and its PHY
> > > - PCIe4 and its PHY
> > > - Reserved memory regions
> > > - Pinctrl
> > > - NVMe
> > > - ADSP, CDSP
> > > - WLAN, Bluetooth (M.2 interface)
> > > - USB DisplayPorts
> > > - Graphic
> > > - Audio
> > > 
> > > Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/Makefile           |   1 +
> > >   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts  | 100 ++++++++++++++++++++
> > >   arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi |  11 +++
> > >   3 files changed, 112 insertions(+)
> > >   create mode 100644 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> > >   create mode 100644 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> > > 
> > 
> > > +
> > > +&gpu_zap_shader {
> > > +	firmware-name = "qcom/x1e80100/gen71500_zap.mbn";
> > 
> > This wasn't tested.
> 
> It should be qcom/x1p42100/gen71500_zap.mbn. This has been tested locally.

The DT that you've sent wasn't tested. Please send a fixed version.

> 
> > 
> > > +};
> > > -- 
> > > 2.34.1
> > > 
> > 
> 
> -- 
> Best Regards,
> Yijie
> 

-- 
With best wishes
Dmitry

