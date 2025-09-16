Return-Path: <linux-arm-msm+bounces-73672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03310B593A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6443317E7BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5EF303A3D;
	Tue, 16 Sep 2025 10:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qu+7r6xn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9674A2C0F64
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758018355; cv=none; b=ttrae52C8MFqEcgSBrX/Z1DNlKHDpG3NfVfZpi+ILDRF++E10Gog2ZVYoz/dzMUElqc8gG46X9k36vmEqrxFrZVVC59LnfOE32NL7Qw9pDDphctYpXvyiq610LUZq0TTt2UtIY6q4XpKpM6lx1Bv+MtfASwMsxKTIDxflVNDIz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758018355; c=relaxed/simple;
	bh=78cQhNh/OCzvZADHozB+sfqwV5S9C9YmKnjhwd1DjHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFXSxi5CO7b6TtOfeeMOlZ+XCw3DhzQ9HA9EnwRLeVQKTXB53ETe8NDY7qQ6yaTi2G3EoOAlvprBfkIW+IkwvatUlrGcWUeNHBYeyp56hNpqs5NclI72HFm+OfAbFPUNkOJyxIzI4noLNGafqj//mF9XcowQrCs80REtWx44Sa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qu+7r6xn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GACm3P003651
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fdYk7NreptJTGbbMJJFNX85/
	T6Ks8jqLfPxEeHI0SVQ=; b=Qu+7r6xnxXzFnrx2uN+ktyEmh9oLTi+K9KxOy2/n
	F7WN8dss3UmfDGd2rzDfQ2S2XcZudR0o0nb/QtfkhfTPcSfw5KG/5YPk1nUXEvVQ
	KN4DAEVZmiw+MDTPZ3KdwH9sxFqLSNFLK+/CfDKx953BBBC0pnBOGCbFVycsC148
	X6POQ7HEVp+Xaa0l2UELfydJa9pVkzdE/GJCHs2wWT+9tuAHYG8IsuRBgE+J6AYg
	fujvXNl56347D5LUPtsAfA+LXMDpdjt0vwu6nfyu2omIZZdg4twjFLs2jz7E6xAA
	hrRCnZjzEPPvb4dIL+q4rmbBKJudJ/StKT3Bc43WCG43BA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr8sgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:25:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b31bea5896so62059461cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758018352; x=1758623152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdYk7NreptJTGbbMJJFNX85/T6Ks8jqLfPxEeHI0SVQ=;
        b=U0ZHQBYEwEovyuisy1dgThP7P8UCScXeIfIJxO86rkHuwEeoF+C3csEZmPuCuzRIwn
         QLucIwOiWZLqG3WSiiLORzMT8oNnXWdRDafXMPWg9tBebm3Xb9P8K06V0FsFTKyDb4An
         soGdj2JyzdlgZi9KudHMdET04aGHbTFDo58msGscfbCSiS4gssEALOCSe9i9m/OvhyEV
         raVAjITxKKOF4H7Whohf9ea0FeQvIVbvww0Gl3IHQpic1mMpSKiyZ95whxEGyylmBm1q
         9W3BXZBt3aiaoKtaPe2Zmor8XV31D/uRc19VMiaykq9iEKwFGEWgtfH0JwE2REZ23V6h
         OdPg==
X-Forwarded-Encrypted: i=1; AJvYcCVTvADC4FnQ7dbl4jkG0FL1KN6I2lGGuqQAUrumx5EwkBpHH7VJRmgFJWv4U9aOPmz2e63fPMYyXlchdNG7@vger.kernel.org
X-Gm-Message-State: AOJu0YzLheDREFBW/zrjCFsqKmNfOAQnzwBrKUoMyGdl+id6tQ4NckM4
	aEh/KDLhjLLvWZyBLBeKXAAJv9d18fjGxrbyU/r7qmXimUZzxcPImHc6aSKXfSHTXlPGJntd029
	wJsY8/Cko5PSvbAZR9agMpRFu71vomwG3ejEsd18o20J9UEi6VwSt9IR3t2hBAn5+4jm5
X-Gm-Gg: ASbGncvO8XqvnusV2dEGuRUsv3VhibeFZ6GTxiFDABX+L/6UVrATiFW9Umec3sdl6Gf
	pcpP03cA/sgJ5cDtag04vcI0pFGojIy9TrgO6l/2Vm23DTvSuQVLm5QWAtG0W/1Y6hQCFpimehj
	u0HtNsFXF94lx6ZfGh1MWCIdAlHapeeMb9HsjGSxdnWUACPMxGGEKvEDtaQ0e0agwV/1EBQy+az
	xp50mxhT+Yh2AzuRd3a8X0RrvQSGXclzE4PW3qusImXB37dFZoRo0Xb8AzR51Pi5qupoKpnxIGo
	rJom5hLT6nyYP9jYDBjuH7Ouv6dnyV1N8BZ6scKUVmBASQLEjfTd28XkZytdvZva6NxPDN6DN47
	fnDICe8JAp8KOpp+aFrB9UJd1zj2M00H1ySg5FAvWe9x/cQEw9FAn
X-Received: by 2002:a05:622a:1355:b0:4b5:edd3:ddde with SMTP id d75a77b69052e-4b77d10a730mr186827671cf.81.1758018351635;
        Tue, 16 Sep 2025 03:25:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQP5YPYxOpUVQXHgMsfOO7ilhKtcaPm2siTqf/LOWCcEXazsjWC7pBKu1oB86ZeRmDb/l7qw==
X-Received: by 2002:a05:622a:1355:b0:4b5:edd3:ddde with SMTP id d75a77b69052e-4b77d10a730mr186827401cf.81.1758018351191;
        Tue, 16 Sep 2025 03:25:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1a82065asm31946791fa.34.2025.09.16.03.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:25:50 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:25:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tessolve Upstream <tessolveupstream@gmail.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingweiz@qti.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for QCS615 talos evk
 board
Message-ID: <axtz5euoa5lyg5clwj44jhdn5gvfubic6un3ilndzzoy22rici@rqqk4eyw7yas>
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
 <20250909125255.1124824-2-tessolveupstream@gmail.com>
 <v2d4e6py34xb2hjrfnmlrmd7xme45equ76zb2c5cmftgylk7w6@5lmexwfupj4e>
 <70c2f78b-c3ce-4b7b-a961-9f3957ce40f8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70c2f78b-c3ce-4b7b-a961-9f3957ce40f8@gmail.com>
X-Proofpoint-ORIG-GUID: SORGr8EGD4A3VS4AbA74SKZpS_OhQaBo
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c93b30 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=M5iAUQSpgaS7r5DjpD8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX871ygZkhW6BO
 0uYsEjRT4U4URFjmHwyRY5rZLKEFlmlZv7xwG2ZHxwMvWbhT3Qjjn0W+SD/keV/kCRLbHC5kBC7
 e1TxCxBdozvJi2TpUcR/eIDtoTFNq/XDtEG4uXGf7HBDs/w478gclnamE7J2ZGFJxUZMIvL95rq
 XDtmbUU9SK0nKKo6a20sjeIVzDpS98m7e65vInQnJVnt/JyGfzjOrlxq8WXGYx1GeQicmxOntOB
 /ZCNXZoHLWAKqjzgwShMf7jiWEFuduq3FzHjgCIWNdS/llnxj5Zz7ulNgpmoYBm64gJPoCC1l+8
 RS754VjeQ31AhFwZgbgDhvcf+PXId4aNG4CodFstDpEa2V0J0Km7iR7Eq4j8Ru+b5U9oLSASXkQ
 EjVerAWL
X-Proofpoint-GUID: SORGr8EGD4A3VS4AbA74SKZpS_OhQaBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

On Tue, Sep 16, 2025 at 11:22:02AM +0530, Tessolve Upstream wrote:
> 
> 
> On 09/09/25 19:28, Dmitry Baryshkov wrote:
> > On Tue, Sep 09, 2025 at 06:22:55PM +0530, Sudarshan Shetty wrote:
> >> Introduce the device tree support for the QCS615-based talos-evk
> >> platform, which follows the SMARC (Smart Mobility ARChitecture)
> >> standard. The platform is composed of two main hardware
> >> components: the IQ-QCS615-SOM and the talos-evk carrier board.
> >>
> >> The IQ-QCS615-SOM is a compact System on Module that integrates the
> >> QCS615 SoC, PMIC, and essential GPIO connectivity. It follows the
> >> SMARC standard, which defines a modular form factor allowing the SoM
> >> to be paired with different carrier boards for varied applications.
> >>
> >> The talos-evk is one such carrier board, designed for evaluation
> >> and development purposes. It provides additional peripherals
> >> such as UART, USB, and other interfaces to enable rapid
> >> prototyping and hardware bring-up.
> >>
> >> This initial device tree provides the basic configuration needed
> >> to boot the platform to a UART shell. Further patches will extend
> >> support for additional peripherals and subsystems.
> >>
> >> The initial device tree includes basic support for:
> >>
> >> - CPU and memory
> >>
> >> - UART
> >>
> >> - GPIOs
> >>
> >> - Regulators
> >>
> >> - PMIC
> >>
> >> - Early console
> >>
> >> - AT24MAC602 EEPROM
> >>
> >> - MCP2515 SPI to CAN
> > 
> > No WiFi/BT/ethernet?
> 
> Networking peripherals such as WiFi/BT and Ethernet will be enabled in follow-up patches.

Why? WiFi/BT are supported for the RIDE platform. Is EVK using something
different?

-- 
With best wishes
Dmitry

