Return-Path: <linux-arm-msm+bounces-89564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B2D39E97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 07:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE55F300F184
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 06:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4C926F2BD;
	Mon, 19 Jan 2026 06:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2lfrOaf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="InO1rNIV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92FC2690D1
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804500; cv=none; b=UxYgrSCEPauVOz1Mgo4VnMS5Zc67uaH5rZ8rQgE1dVPHCMGig4gsBjLt7a18q9RPEgf2+ZGqdBKknAGEwFXoYFFbEMYYJOpHHBYt67lEgovz8iX10qGh/A8N+SceKyKh2ffR0SFLUFRaSgROHljn0NEaR5x1b3kVqkb6M3PV2yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804500; c=relaxed/simple;
	bh=xw982SuS0WjHblirWqSp87cGGfUE/L/njWAN0kQP1QI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgojJIRTFjawMZ9I073XW+dBlCzlcT5xblBNK8YJrFJY7EoqkEZs7ZqglCKDaiX31Jv6XqKRtN7dwwoSqPAH+Ah5DGqiaNJsl8V/A2tUSlNWIGw2wg47aP/NrM3u+S3yJBL/4hfnm1zKPIcito9NbqaKi+7YujxjSymenSWdYbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2lfrOaf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=InO1rNIV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ILGFT13749029
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vtk98BntBgPHYqOi2a6nyqVXvxV/tsREvYYoRaWitlE=; b=V2lfrOafdW0Kub5b
	R3W7fJlWtS7WU6jPRyjtwBJWs9xnG1X5zGA0rLXdkkVcl5shmxODpZegsbRHfTek
	z0G89e3H+Ii7R3MzUKZe5ZyaVWPAPlHfhKxDuZMM6OG+uBmZg3HiizEL9qcadKjZ
	CVx+PpGcdGJKpKxKWPyAo6Vn6gVCH78Lkzat/zOwypOsAPVh+EBusWZymL47mQC5
	NwBBnTGXbEjfS+Z6Ctwjn6xJ+BpfSc/mQxW7nEF2ivbzmcXiQo2z69sk32au0uCH
	i6quer50cjGdar+Bk2i/qUy+YfYZGzSny4VzcZ8POJzam4BIAKkJzCHegE3oSuk/
	KrfvoQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79egxk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:34:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c2a3a614b5so992461685a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 22:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768804497; x=1769409297; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vtk98BntBgPHYqOi2a6nyqVXvxV/tsREvYYoRaWitlE=;
        b=InO1rNIVuvJPxP6o4/8lq37zXVT2d0pvOexQ4LV8y/5W+2uCMTozjMJEGSyxusz49K
         YReg0cau2ZdhDcyPIlcdggqGQOo9tnAi+xeb0qGxLbcASWrYqlJlQqJpNExyAHK1EaAY
         ViBFgKm75Er7A/yEZ6NfvrYORz7iuVxRMxdDzrJpcvcHHZMMuEUQ0NNEXQt+wXrxEydh
         79cWO4UHnY30uphc3jKQ+lsQd/vJ2m0JupL5SQhnWXiHfARGsSYjU/Sjlpk7T1LPUcDe
         nB4uk9T8JQzeQqPV9Ax8t1yR80hfRPSzL9kE6s6uhzZ63BbNeUoMNFpfTTPeiiwIo0HY
         pVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804497; x=1769409297;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vtk98BntBgPHYqOi2a6nyqVXvxV/tsREvYYoRaWitlE=;
        b=P/zjyiflbCUiLnUiX98h3+l0J70IntBJef3B9bNvfAKWT69hk/Qdp8ypODzlkv1XJ7
         lNneApK62R5lKE7YZDY2nTFIHsighEi9xO4i3/MjtKp3kGm5qNlhlGhvUSmRyl1ehdVr
         fAM6VCZ+sI2H8GtjmJGbePupioVkTagrHjN/JVLH6f4/0efB7+8x/QsiwHmfnwpq97NU
         Nho+lxDzjhwIuz3dTxCNreFiC365qBhPYoKRgHwatWYeN3RQ+Dhh58TcXkXfkC6muo4/
         Szoh4ypgYWizfk+fR44pGzfNUZzAhOaU14ysLY7IkB5LhUrD2ixYCfFLtf3IAr6t++E+
         8Kfw==
X-Forwarded-Encrypted: i=1; AJvYcCXRI3RODVcYEx/pXw6z6Ut8IwFhklMn8T8Y/5PCVCcmvx7Wq44difSP/Ji6slHGFw/afPgJQicJqKxviqQh@vger.kernel.org
X-Gm-Message-State: AOJu0YxwU3umjaoJKlldvbO8YBd+Rogps3d916fU3uXgJUrI9D/+Y4jI
	vsUhIRllHk9lXmZoo7P4aKtBIDjUBsopDpBFSGivIEji4DrGYZXVgaShspTwqmOnBPJX2QSaVp2
	OgE3dCmBPAVWbq4QiRtx0EjLRiXeAmvg3fyO5TBQtZt3XmcPBSGoPQLsH6UxWFnO5zO40
X-Gm-Gg: AY/fxX4ifA5CMGCnE1Dz8KmHC2zN+ujOKbiPcJbWeptYOjnxqgxqcahkESAV+KBxHIT
	vIW0YgnKqVREX5UJpEcI6ITKuZeombs2Tan6h8EPj7i6XtfIUtzhM3H+pe7X9eUwTe9CyaK6/J/
	jHwDVUkWQKVzEU4IdW+cvIxci1fk1/w28DNHOZaU5xEXl2LpC0iRahK3yW3lQeRgqIolNnXmber
	JHOtxSOrkvhkZTz44GSAACYysOh8OHKHzaNR2qmi/9zhUHYZto6lUroWNdyL9dRiZUROJs/qah0
	c2kU0mxlXRy0bd7zm9ZBQcQ6E4ib/QanKVEY+PQIMDmaS3qnyI76x/wfb3HudJbs5vtZTYidoew
	tkQYXsRdxgEUpKxzhRx6Jmh4mvvduT2jWRuidOkjWUSSDi8zB7Bg9YEXcnUTblogzds5s2TSbON
	BT6mgCfdt/CshnsazHkU2xTVM=
X-Received: by 2002:a05:620a:7103:b0:8c5:36be:7c20 with SMTP id af79cd13be357-8c589b84dadmr1811301485a.3.1768804496977;
        Sun, 18 Jan 2026 22:34:56 -0800 (PST)
X-Received: by 2002:a05:620a:7103:b0:8c5:36be:7c20 with SMTP id af79cd13be357-8c589b84dadmr1811300085a.3.1768804496497;
        Sun, 18 Jan 2026 22:34:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb9b31sm31475791fa.50.2026.01.18.22.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:34:55 -0800 (PST)
Date: Mon, 19 Jan 2026 08:34:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] Initial patch set for PURWA-IOT-EVK
Message-ID: <b3p5yhstng6nbrrdavx67vlv62hqqlnms7742txbimpeswqklv@eomkmkkearwp>
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <jeyj5wqu4uw7tnm4h5ryatoqupdrqpkjcynnydgbum6oj2d4jj@qvvbbifrvud3>
 <ed49abf0-c2b6-4496-a3b0-ef040fd94615@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed49abf0-c2b6-4496-a3b0-ef040fd94615@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA1MiBTYWx0ZWRfX2m6F/rHC3Pes
 FMk9ndvHcKyQGN9thCCjXAtHhM1drwTKCzMLu0947I+z9z7+RtRUb+HoLjqZ95qShY7kP3TIqPu
 av0NAp8t++efHTjohXuoaGiUn3qWagZY+StekPl8LZKQEXqpqXVrHH71FxjwpT6O191cvzEvgew
 bl8awC2RxG6iowybhRnxBUzdAdMk475H2QRafmHF8wP7JVV/oZdb21S/DYw7FP1S6fpNDv0+Tbr
 bS9bnrqzZIni8U19vgrOCH00J39+nAQssJ9b7HUH+KG8kdFcKLZUzn0d2lbyKPvbVSkHYJ+byxa
 tVcGcODCAc34OnJ0LQdIBUwrRpJjhxCk40S+LI0pdSPxzBH095oB8HXJHs94ePYgCY/x6iTua2h
 o3rVMCiL7F1woo4jGlY9mq5j1ImIbktrebYt4y8E+OEYnintmOOFcKuU99/VJaaTGl13Bu1I7vG
 uPbYvc542GVAbvg99RQ==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696dd092 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=R9z89uIQJvrLHeLMgzUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: lvS7ryQ_c_6lbIRFgWbS1Mmry90FBuwk
X-Proofpoint-GUID: lvS7ryQ_c_6lbIRFgWbS1Mmry90FBuwk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190052

On Mon, Jan 19, 2026 at 10:39:04AM +0800, Yijie Yang wrote:
> 
> 
> On 1/16/2026 7:31 PM, Dmitry Baryshkov wrote:
> > On Fri, Jan 16, 2026 at 06:41:26PM +0800, YijieYang wrote:
> > > From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > 
> > > Introduce the device tree, DT bindings, and driver updates required to enable
> > > the bring-up of the PURWA-IOT-EVK evaluation board. Focus is on two key
> > > hardware components:
> > > 
> > > PURWA-IOT-SOM — A compact System-on-Module integrating the SoC, GPIOs, and
> > > PMICs. Designed for modularity, it can pair with various carrier boards to
> > > support diverse use cases.
> > > 
> > > PURWA-IOT-EVK — A carrier board tailored for IoT scenarios, providing
> > > essential peripherals such as UART, on-board PMICs, and USB components.
> > > 
> > > Together, these components form a flexible and scalable platform. Initial
> > > functionality is achieved through proper device tree configuration and driver
> > > support.
> > > 
> > > The PURWA-IOT-EVK/SOM shares most of its hardware design with
> > > HAMOA-IOT-EVK/SOM, differing primarily in the BOM. Consequently, the DTS files
> > > are largely similar. Both platforms belong to Qualcomm’s IQ-X family. For more
> > > details on the IQ-X series, see:
> > > https://www.qualcomm.com/internet-of-things/products/iq-x-series
> > > 
> > > Hardware differences between HAMOA-IOT and PURWA-IOT:
> > > - Display — PURWA uses a different number of clocks and frequency compared to
> > >    HAMOA.
> > > - GPU — PURWA integrates a different GPU.
> > > - USB0 — PURWA uses a PS8833 retimer, while HAMOA employs an FSUSB42 as the
> > >    SBU switch.
> > > 
> > > Features added and enabled:
> > > - UART
> > > - On-board regulators
> > > - Regulators on the SOM
> > > - PMIC GLINK
> > > - USB0 through USB6 and their PHYs
> > > - Embedded USB (eUSB) repeaters
> > > - USB Type-C mux
> > > - PCIe3, PCIe4, PCIe5, PCIe6a
> > > - Reserved memory regions
> > > - Pinctrl
> > > - NVMe
> > > - ADSP, CDSP
> > > - WLAN, Bluetooth (M.2 interface)
> > > - USB DisplayPort and eDP
> > > - Graphics
> > > - Audio
> > > - TPM
> > > 
> > > Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > ---
> > > Changes in v4:
> > > - EDITME: describe what is new in this series revision.
> > > - EDITME: use bulletpoints and terse descriptions.
> > 
> > Oh no. B4 probably even warned you about not sending it out.
> > 
> >  From this changelog I can assume that nothing has changed. Is it
> > correct?
> 
> This section was generated automatically by b4 and was not reviewed
> carefully. The actual list of changes is in the section below.

But why????? Why do you ignore what was done for you and write it on
your own, reversing the order, etc? And even if you decided to ignore it
for any reason, why didn't you delete it?

> 
> > 
> > > - Link to v3: https://lore.kernel.org/r/20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com
> > > 
> > > Changes in v2:
> > > - Update the GPU firmware path.
> > > - Update the description in the cover letter.
> > > - Reorder the patches.
> > > - Use separate DTS files for Purwa and Hamoa.
> > > - Update base commit.
> > > - Link to v1: https://lore.kernel.org/all/20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com/
> > > 
> > > Changes in v3:
> > > - Delete unused PMIC and thermal nodes.
> > > - Add WiFi node.
> > > - Add display backlight node.
> > > - Add connectors and VBUS regulators for USB3 and USB6.
> > > - Enable PCIe3 and PCIe5; add PCIe ports along with reset and wake-up GPIOs.
> > > - Link to v2: https://lore.kernel.org/r/20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com
> > > 
> > > Changes in v4:
> > > - Enable TPM.
> > > - Update the descriptions for video and the USB OF graph.
> > > - Link to v3: https://lore.kernel.org/all/20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com/
> 
> Here.
> 
> > > 
> > > ---
> > > Yijie Yang (4):
> > >        dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
> > >        firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
> > >        arm64: dts: qcom: Add PURWA-IOT-SOM platform
> > >        arm64: dts: qcom: Add base PURWA-IOT-EVK board
> > > 
> > >   Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
> > >   arch/arm64/boot/dts/qcom/Makefile               |    1 +
> > >   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 1549 +++++++++++++++++++++++
> > >   arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi     |  685 ++++++++++
> > >   drivers/firmware/qcom/qcom_scm.c                |    1 +
> > >   5 files changed, 2242 insertions(+)
> > > ---
> > > base-commit: 377054868ffa544991cc491ecc4016589fc58565
> > > change-id: 20251113-purwa-907ec75b4959
> > > 
> > > Best regards,
> > > --
> > > Yijie Yang <yijie.yang@oss.qualcomm.com>
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

