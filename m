Return-Path: <linux-arm-msm+bounces-88897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B38B4D1C37E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 04:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3A84302759B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 03:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373E6322B8E;
	Wed, 14 Jan 2026 03:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bg+ZARYm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SdZcMZpi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55342D6E53
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 03:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768360473; cv=none; b=osV+pPUhByxURbwkdNm77JQqwQQhb1kdUHgRgwkKMkg9kTiUXrps0nJj/lTexVV5vU91oKffcuGYlr6QW7pLkGeCgwoR4TXppmvXujCUn9iLRbGpb8hMK40X0yE/0WBIZEtxkoi2CZEShF+BmNP8svxfm9bYyzF3M5H3PgSDyGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768360473; c=relaxed/simple;
	bh=tmstHXmbtQtNzUFEOMIDB+DFApVjPcnTHPv9ac2Zz5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtihBhYTtfED7mE1TWxAymHYJ2nAPkQ0xxBhCqqKRg0SAN2jNaO8bG3tqw7TqmeHjBegMURNHj86+lGy6JmfbDMJDr2O5XmvbPIY6XD+mBCvcGmc+WLBiAVw60kYp8nq29NuNCOPfQPMj9gGwctNB+ezt94dA2OJ8k3BAS2f+Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bg+ZARYm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SdZcMZpi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DNHe5W2203886
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 03:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WA0Duyy7oOsOZpF1Hhf6vvf/KMhyZASXJgxYvMzuc1E=; b=Bg+ZARYmUDXdksuW
	QgXjKlDRCCXtl33HQIfjIOynDS1owYIqMZeXFC3VzDX1R8LE8xCbTdasnKpBfypj
	DAgtMD6YNxK2aP2Faah489ct0duBepJl9f+0eTkwH5Qh3gczr7T9+OMNNAPdmiN1
	sohc0yVixiJOobE5AqolBjcG2xKJPIJC1NxC6iB9ZEYpcvRGcREkWjk+iUrwLCT4
	COTgG2jyW4p9AiEVqG16ck5JMDKbuD+CzmTLlilrrk62wf0L8QdMOPfglE45SzwJ
	3mNQUTfIiBcp/g5fxTIMK7+ZKgOr0uCYmR+nzxXZgLKRYGBbuKyxjCOPfbGcLl+N
	ZIbDtg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bns8v1tmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 03:14:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52fd47227so80531785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 19:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768360470; x=1768965270; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WA0Duyy7oOsOZpF1Hhf6vvf/KMhyZASXJgxYvMzuc1E=;
        b=SdZcMZpia4Ir/VgwiTI1f6KpvPqOyPzPaNS5Ll24Fd0ed3G3sDuJyLa5m3w2Ietd8O
         0yG0psh7hRab3ld70xmjLVbgljCMn/Qv92JuH4l+R7CvYLU0+Zx4OxT18tlyM0lmQTyT
         poGDC7fj1w+As5GFncdSESwm6A7cIRFZAwbdE13jLwNYUO2WxUGdJFIt6xKTpms3PJiW
         DxQfvh/92zpPlUmLkUzm+zWbiEQ+k+Wu5XGFVJ6KxphmOFdNSwix3nIXfGrO2j9Kgxxr
         mp+moYgjPDd35PQMCxmIoCGSLIszDyF962sLbR0LmrhdcXUyQelv67nUYIVXD66k6+9d
         bDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768360470; x=1768965270;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WA0Duyy7oOsOZpF1Hhf6vvf/KMhyZASXJgxYvMzuc1E=;
        b=lKghOscoUjzLMkJVLK1iEgk1NWVtSCn4eObs8MSM1iIQnIARnKkrn3Nz2mXKO6Zwxk
         tfJnEQd9fSjwus6du70jNatJ9sdr4RPxjdnOCECpqN75Fk3lKuNiD4QuubEl2A2PyUTx
         keU76PuD2T+7eO25xK+NfFEM3y+T8XENBjQRAzWQze9uUd1eLNesVZsM2k1+VGaGa2dJ
         4fEQ6SG3sLYtVP9+rMAfk+LyME5voLKjKotJtv2iZ5zJlSAEehe9fzXj74IlC/ELTZ+q
         zS1WjWyD1MdS9Y3nHqMxCipW/ELI1/cepuc6yvlB8J3a0oyjPGb4vcA5vBO+p3d+MIl4
         8o+A==
X-Forwarded-Encrypted: i=1; AJvYcCUw5toWMjuV8RtZGgQaU/ZY+Cg/odcIRWF9vDOgwfVnsWwwY/7tAZEbExA13CZZupHruSuklEOulstbCGnt@vger.kernel.org
X-Gm-Message-State: AOJu0YwVgwgi9SyJGFY2qvoaCWVOYZIhL2qwHLr2TNw8O1ZgteS7qf5L
	bAS5q5mYoEzFg9R7lzuKl0ZIaR7XgdGuq3XUpoXrV3mJWMUJ0P9gft0a37hbi+0SMltPAIAHYPc
	c9A7zE89eRbonxoO/iXBFSyKDPyDij8SO3ArKzGwUwZ0l47JaW8TxaigSR+LbByvcEWw4
X-Gm-Gg: AY/fxX5Rs0v04NfyKshfI75VyfyNPui2X9d6sODiY56QCJ8IFyiepABR83w527HTsNZ
	Obpn0HucZo0hYrEdwi5tyUyCidclcJjEefSW2Wp9TRTLQ0vPTv9FQEN71LeQo6yAmvUIhNF3rSo
	KM0DitLMCNc2K5T5gXRlSV6NeDd68mF1CMrnSb/fagdrRQEOp3BaYw5NSXNVhz7XZ41Ef1gsYZd
	RVRY75aTk+/rD77LXodKACWXRHY0uPpFPm6NKwWFuIucdq7H8LKYVMhlfRNQ9Q6E6STZZR8DQBV
	n4AU6oYbwpMsMTgt0TJXcGzfyjnqMc6eWsRh3NMb7r0ngrB9S5sOLZGHh0epvAcAsMWUjxu1XpM
	4g64Fd2q3COcA2J3yYEhyps7G3K1pXV3Grn4WgEo02GTBypeYc33T7noZnIdtT+LisPc5hZ0QK5
	zEgit7blFlbz09wZD/NFDp4CU=
X-Received: by 2002:a05:620a:31a5:b0:8c5:2e2a:68f5 with SMTP id af79cd13be357-8c52fb1dbc0mr197468285a.35.1768360469810;
        Tue, 13 Jan 2026 19:14:29 -0800 (PST)
X-Received: by 2002:a05:620a:31a5:b0:8c5:2e2a:68f5 with SMTP id af79cd13be357-8c52fb1dbc0mr197466285a.35.1768360469263;
        Tue, 13 Jan 2026 19:14:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba1041152sm265207e87.51.2026.01.13.19.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 19:14:27 -0800 (PST)
Date: Wed, 14 Jan 2026 05:14:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
Message-ID: <bcikdrswcqyibzvtygavuev4c5g3lphdmvl5l3xtxlihshaxpl@miwpuwyfacqv>
References: <20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com>
 <20260113102822.590677-4-yijie.yang@oss.qualcomm.com>
 <2qa3kn6gw4f5qlncq6iwgxattfbbztu42gpcbekqfghcrdg3l5@z7zsx44xch7a>
 <3906614d-d9df-485c-963b-603e2311bc2c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3906614d-d9df-485c-963b-603e2311bc2c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aY5sXBot c=1 sm=1 tr=0 ts=69670a16 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vOeAKl8klYon9pFA0QwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Ru-Vmi2Edx7uiiXc187PEqWhRm6T8JJY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAyMSBTYWx0ZWRfXwWHbV4HKjpsS
 i6Ec+CArXPJp6FNqxqZLI9KSPFxD8UnTrVg0ox5fgHcB5jr2KI4DDeDDkHkEInMtzH+n5zcpwK0
 7tO/SXQ0/HV5d3TiwmXG9zjmt3z8SpbNF1CTnw7jxsZq7UUe5EYtu/C9fKubcTnu+gYQXsg+Z6z
 LBcMA+HoM5x3KifpPz3FV/NbF4FCo6t/L1SV2otiv4vvjq0aN5cz/nC0VkQBLJK6/FADShWAPQ3
 3r1iaYD5q5X2gazpEKlVNYHJNtpVfLbS16ysuhDv6HdELO19p9rmH7o2AH59S4z1Zmv77p6EOrR
 q8XgYnljAnRoRSCuWuZbGyxMdqBKw04nHyR2qvtEz1oLi+pG1eOMJPEfz+h7hLnMth8WUMY42kr
 nXujFJRrcvgM+BbAAFr/U7BSEa8fj0DoY6X5r4tYzNq4T/2+V+UgvH+K2vAug+qNAqPkGLO0oIk
 aLkgNetnFW8RgeKijiQ==
X-Proofpoint-GUID: Ru-Vmi2Edx7uiiXc187PEqWhRm6T8JJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140021

On Wed, Jan 14, 2026 at 10:27:16AM +0800, Yijie Yang wrote:
> 
> 
> On 1/13/2026 6:52 PM, Dmitry Baryshkov wrote:
> > On Tue, Jan 13, 2026 at 06:28:16PM +0800, YijieYang wrote:
> > > From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > 
> > > The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
> > > the Purwa IoT SoM and a carrier board. Together, they form a complete
> > > embedded system capable of booting to UART.
> > > 
> > > PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
> > > Meanwhile, USB0 bypasses the SBU selector FSUSB42. As a result, the glink
> > > topology differs from that of HAMOA-IOT-EVK.
> > 
> > What is "glink topology"?
> 
> What I’m referring to here is that the graph composed of glink nodes and
> their peers.

Then:

As a result, implement corresponding changes to OF graph connections
between USB-C connectors and USB host controllers.

Or just drop this phrase completely.

> 
> > 
> > > 
> > > Make the following peripherals on the carrier board enabled:
> > > - UART
> > > - On-board regulators
> > > - USB Type-C mux
> > > - Pinctrl
> > > - Embedded USB (EUSB) repeaters
> > > - NVMe
> > > - pmic-glink
> > > - USB DisplayPorts
> > > - Bluetooth
> > > - WLAN
> > > - Audio
> > > - PCIe ports for PCIe3 through PCIe6a
> > > 
> > > Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/Makefile             |   1 +
> > >   .../{hamoa-iot-evk.dts => purwa-iot-evk.dts}  | 102 +++++++++++-------
> > >   2 files changed, 65 insertions(+), 38 deletions(-)
> > >   copy arch/arm64/boot/dts/qcom/{hamoa-iot-evk.dts => purwa-iot-evk.dts} (95%)
> > > 
> > > @@ -1102,9 +1140,7 @@ edp_bl_reg_en: edp-bl-reg-en-state {
> > >   		pins = "gpio10";
> > >   		function = "normal";
> > >   	};
> > > -};
> > > -&pmc8380_3_gpios {
> > 
> > This needs to be fixed in hamoa-iot-evk.dtsi.
> 
> Will do.
> 
> > 
> > >   	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
> > >   		pins = "gpio8";
> > >   		function = "normal";
> > > @@ -1171,16 +1207,6 @@ &smb2360_2_eusb2_repeater {
> > >   	vdd3-supply = <&vreg_l8b_3p0>;
> > >   };
> > > -&spi11 {
> > > -	status = "okay";
> > > -
> > > -	tpm@0 {
> > > -		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
> > 
> > No TPM on the board?
> 
> It has not been verified yet since this patch set was sent out; I will add
> it.
> 
> > 
> > > -		reg = <0>;
> > > -		spi-max-frequency = <20000000>;
> > > -	};
> > > -};
> > > -
> > >   &swr0 {
> > >   	status = "okay";
> > > @@ -1470,7 +1496,7 @@ &usb_1_ss0_hsphy {
> > >   };
> > >   &usb_1_ss0_qmpphy_out {
> > > -	remote-endpoint = <&pmic_glink_ss0_ss_in>;
> > > +	remote-endpoint = <&retimer_ss0_ss_in>;
> > >   };
> > >   &usb_1_ss1_dwc3_hs {
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

