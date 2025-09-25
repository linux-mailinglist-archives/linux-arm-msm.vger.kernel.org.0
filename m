Return-Path: <linux-arm-msm+bounces-75159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9318ABA0B35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 18:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90EE17A81E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 16:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF772DEA9E;
	Thu, 25 Sep 2025 16:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lU5Cu3CF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4F92C032C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758819094; cv=none; b=drFNqrwNKdmIwi8n0giTU3UTTTbg2/EQGqbeTx0W1SeIzzuPO136fCgpI3hdMhnQB7Vk1+Itt0tzbTH1cWvMbJwgfnx62+MLCJ6bfRuGAgF3pRul4vBbVaaRPPvy6nK6ubzEF1of2KFIWKseUETO7bKc+p/BGUNodWrCU9S0aRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758819094; c=relaxed/simple;
	bh=S6a5ag5L4g7VdPjFvaTg47WUro1fnBjqK7elHYvqxSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtQN7Eh7jIJOqyOYQS2yXtSD//ZZAUsi57WoMr9zENpeprLH7/XMNW6R78dQfCbufl2Y8YxaDKG/JudsHp2ICBJGIU5xtNEYojOPbeJvuCOHaU4fzv0xKUoF123xirHvf69W/6b5jrnIRlaqmJxRQMPmqsF5WxqwAS2VeZTF9u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lU5Cu3CF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9tIi8029443
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 16:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c+JG/OhuIQPupywuY6KkOajV
	6jlmXSzIcLrtrmBfD70=; b=lU5Cu3CFo0GDvXb6ni7MhbGvqQwQx269+v+IEbE8
	m3//IfinKopHPg2FX5A2k/nfImgwuoIMEYrgKPV8S19EqoqwRnjlaRhg0kiq6Ifw
	cI8YmDFqZWZGWGVZ1U6peoR1SLuMiH2vc/lBJGTLS/YPw5e6fncgzKZ7FDxw5myj
	/KTnpJJh4636GbkZVpf/S+Drm7qPYAZfvo+aMyYrh4R2NSVNhm7nja7gOLQtv9pY
	FBE7HHofWvz5SMoIwCN2c4yt1zIjHIKa3wkafdOSB5sjPbp3eNYRDqLkNQcs2E+t
	NtjLFO05hZ/+/lrZQlq+PSqR94w36dF9O/xY0DLcRR+wVw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1frt0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 16:51:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ca8c6ec82eso26875121cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758819089; x=1759423889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+JG/OhuIQPupywuY6KkOajV6jlmXSzIcLrtrmBfD70=;
        b=hUMvZ6hNGKhOJBJqkvcAJoeyh6vmnbrmL6tY9/f95kEegQWEZK62TQiGp2NOop+J9B
         5k/dQo1wkZbus/h/VtCWzZjZwjAncQkrx8XAnYpll/xsLcy7DiK3FKWqlkrLJT+bIC1f
         VAlxAHnm5c1Wcpt5VyZfrZeMcoxCwP39A1Wsp6PQUZ1mTjXKTRNwuEAuRajI9Avwog0K
         ncWHIv0tg9cI0XlCEXVRe4wMa2zt6caD3DKkKDrgQ+ZzR9NYXnvE/fIhj8DBN9ylOHSK
         x1zQSdm0Q1/bxnlWimBDtivBi67rl5daCSM8B2Kt4Ds8HTo5IGQRvS0KyjpW4MEaUNjn
         XACw==
X-Forwarded-Encrypted: i=1; AJvYcCW7mwTlgw3sPlc4p0QPskBTBEDO0w2FUBF4jCynoUyXRa0oC4eJ7hSUtFQkXDMCsrQAOAfI0ohBNVxmzzVW@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ+gxiJjQvUAyxxXJuVl0v2uobugeqoRXNLVaMcCDXA4M+Diwy
	UfPpg/TNJ05IZmAdkY5bYWTxF+WkI9b2/O145XjgJrT/B4nzYXZp+s/IUMh8Y3ewReSbv1dc9O2
	eVE0FIh3EPIdYTAjze+HVChOAXrnd2kdTM7E+23nfajwqIx8/jGalOe/DprDPkemi5pGM
X-Gm-Gg: ASbGnct7KVkdYFY5sPtN4Cwf3qG37prYsf2MLchnth9MEC9Nvm6r18punnuncYSjDw3
	DY1kgNiUf4iLGa5qNwm3nSnHdJ2XvajlLxHiGDqhzChJcpO0Xg6ooFA7fo+UjsmCmUwtN5ujlFK
	vhLfWI+/hJq5p84JhdeHcZfdXcWQ1hI1i1ZprBy3EQA3NQ/WFnB++gpHdqvIhGF6ORytCXfzS4T
	ZeoRQ8p1QG9x04sxbIIWXoM0HgJ7vZGQ+56+liO4a6lbMJhLkT+tXS9KM6baG/MbCxqGmEPNUwr
	WH2GQB1pcLWwUDOdYPOmYTzGj4fMdPk6v0/i1N/BBYa4l4FJogSkD2YT7EPAsg5jVB8KR0+kuw3
	l6o4afuccVdbAQ6PtvBjpWS5Ex6U9UeLcyUnDyyDMC3OLAnvIBCq8
X-Received: by 2002:a05:622a:4015:b0:4b5:e8ae:2c4f with SMTP id d75a77b69052e-4da4b141621mr51887161cf.51.1758819089201;
        Thu, 25 Sep 2025 09:51:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVLyOb6HzBw7NE0KYW6ReZtLk4APwH1tqa4Vyy2rWMVoaQRkN28lYQtae4HFZZ6flWO3/88A==
X-Received: by 2002:a05:622a:4015:b0:4b5:e8ae:2c4f with SMTP id d75a77b69052e-4da4b141621mr51886431cf.51.1758819088411;
        Thu, 25 Sep 2025 09:51:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7710474sm6418341fa.33.2025.09.25.09.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:51:26 -0700 (PDT)
Date: Thu, 25 Sep 2025 19:51:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        trilok.soni@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, devicetree@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        Manish Pandey <manish.pandey@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        yijie.yang@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: Re: [PATCH 00/20] arm64: dts: qcom: Introduce Kaanapali platform
 device tree
Message-ID: <yjerom55r2jc6afqslzqfwgpq47dl6qmbuuofqrerchugnqkso@od53xmgnsyen>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <175880948892.820179.14957034733872726075.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175880948892.820179.14957034733872726075.robh@kernel.org>
X-Proofpoint-ORIG-GUID: Hi5c8xWXxBbNFYoEa06LtsGnn29CVBrg
X-Proofpoint-GUID: Hi5c8xWXxBbNFYoEa06LtsGnn29CVBrg
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d57312 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=CYqfMpDs-nAaQ_9fh9QA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX5/ssuL5PISB/
 Wo0CWdmEQuax5mJJBfiupqNW0eza/vXHpD07uVJmx4OVj0pmlGRcKFqDmws2+9v863E+FXX+NkV
 3Bj38FME/+psj15zg8GGHk3efxPUpSXBsvEozJ88ykMmX3H4tyi6m+1GbyVLdjFa+FfmT4dfEcE
 mwYpr14E5u6A9fHmDY0ykJY01tPFvmA09WmISyekQJNmpjG1GxvKK7wvMZMvG2uHfVnQ/WPN0Vy
 t18cNvque2dqCVLVx9jZ8LiHoK8zTnC2DEu/hTi4RIPdN1O8wKuEyZWYOHgAVhP43/ObVe+05D9
 TVUB2ZlZUOqE9AkSHZFn/ZC6CmQQYOmZz7BLD7YV2nCPrOuLc9X8sbvsQHqBPMsephGqDJQA6BP
 gTyaTRvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Thu, Sep 25, 2025 at 09:12:30AM -0500, Rob Herring (Arm) wrote:
> 
> On Wed, 24 Sep 2025 17:17:17 -0700, Jingyi Wang wrote:
> > Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
> > https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
> > 
> > Bindings and base Device Tree for the Kaanapali SoC, MTP (Mobile Test Platform)
> > and QRD (Qualcommm Reference Device) are splited in three:
> > 
> > - 1-3: MTP board boot-to-shell with basic function.
> > - 4-16: More feature including PCIE, sdcard, usb, DSPs, PMIC related, tsense, bus, crypto etc. Add QRD board support.
> > - 17-20: Multimedia features including audio, video and camss.
> > 
> > Features added and enabled:
> > - CPUs with PSCI idle states and cpufreq
> > - Interrupt-controller with PDC wakeup support
> > - Timers, TCSR Clock Controllers
> > - Reserved Shared memory
> > - GCC and RPMHCC
> > - TLMM
> > - Interconnect with CPU BWMONs
> > - QuP with uart
> > - SMMU
> > - RPMHPD and regulator
> > - UFS with inline crypto engine (ICE)
> > - LLCC
> > - Watchdog
> > - cDSP, aDSP with SMP2P and fastrpc
> > - BUS with I2C and SPI
> > - USB2/USB3
> > - Modem(see crash after bring up)
> > - SoCCP
> > - SDHCI
> > - random number generator (RNG) and Qcrypto
> > - tsens
> > - PCIE
> > - coresight
> > - Bluetooth
> > - WLAN
> > - Audio
> > - CAMSS
> > - Video
> > 
> > For part1(patch 1-3)
> > build dependency:
> > - tlmm: https://lore.kernel.org/all/20250924-knp-tlmm-v1-0-acabb59ae48c@oss.qualcomm.com/
> > - gcc: https://lore.kernel.org/all/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/
> > - interconnect: https://lore.kernel.org/all/20250924-knp-interconnect-v1-0-4c822a72141c@oss.qualcomm.com/
> > - rpmhpd: https://lore.kernel.org/all/20250924-knp-pd-v1-0-b78444125c91@oss.qualcomm.com/
> > - config: https://lore.kernel.org/all/20250924-knp-config-v1-1-e2cf83b1932e@oss.qualcomm.com/
> > binding dependency:
> > - ipcc: https://lore.kernel.org/all/20250924-knp-ipcc-v1-1-5d9e9cb59ad4@oss.qualcomm.com/
> > - smmu: https://lore.kernel.org/all/20250924-knp-smmu-v1-1-c93c998dd04c@oss.qualcomm.com/
> > - pdc: https://lore.kernel.org/all/20250924-knp-pdc-v1-1-1aec7ecd2027@oss.qualcomm.com/
> > - cpufreq: https://lore.kernel.org/all/20250924-knp-cpufreq-v1-1-1bda16702bb1@oss.qualcomm.com/
> > - mfd: https://lore.kernel.org/all/20250924-knp-mfd-v1-1-6c8a98760e95@oss.qualcomm.com/
> > - watchdog: https://lore.kernel.org/all/20250924-knp-watchdog-v1-1-fd8f3fa0ae7e@oss.qualcomm.com/
> > - llcc: https://lore.kernel.org/all/20250924-knp-llcc-v1-0-ae6a016e5138@oss.qualcomm.com/
> > - bwmon: https://lore.kernel.org/all/20250924-knp-bwmon-v1-1-56a9cdda7d72@oss.qualcomm.com/
> > - ufs: https://lore.kernel.org/all/20250924-knp-ufs-v1-0-42e0955a1f7c@oss.qualcomm.com/
> > - ice: https://lore.kernel.org/all/20250924-knp-ice-v1-1-1adfc2d9e83c@oss.qualcomm.com/
> > - regulator: https://lore.kernel.org/all/20250924-knp-regulator-v1-0-d9cde9a98a44@oss.qualcomm.com/
> > - misc soc related: https://lore.kernel.org/all/20250924-knp-soc-binding-v1-0-93a072e174f9@oss.qualcomm.com/
> > others:
> > - socinfo: https://lore.kernel.org/all/20250924-knp-socid-v1-0-fad059c60e71@oss.qualcomm.com/
> > 
> > For part2(patch 4-16)
> > build dependency:
> > - ipcc header: https://lore.kernel.org/all/20250922-ipcc-header-v1-1-f0b12715e118@oss.qualcomm.com/
> > binding dependency:
> > - pcie: https://lore.kernel.org/all/20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com/
> > - sdcard: https://lore.kernel.org/all/20250924-knp-sdcard-v1-1-fc54940066f1@oss.qualcomm.com/
> > - usb: https://lore.kernel.org/all/20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com/
> > - remoteproc: https://lore.kernel.org/all/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com/
> > - tsense: https://lore.kernel.org/all/20250924-knp-tsens-v1-1-ad0cde4bd455@oss.qualcomm.com/
> > - crypto: https://lore.kernel.org/all/20250924-knp-crypto-v1-0-49af17a231b7@oss.qualcomm.com/
> > - bam: https://lore.kernel.org/all/20250924-knp-bam-v1-0-c991273ddf63@oss.qualcomm.com/
> > - spmi: https://lore.kernel.org/all/20250924-knp-spmi-binding-v1-1-b4ace3f7a838@oss.qualcomm.com/
> > - pmic: https://lore.kernel.org/all/20250924-knp-pmic-binding-v1-1-b9cce48b8460@oss.qualcomm.com/
> > - pmic-peripherals: https://lore.kernel.org/all/20250924-knp-pmic-peri-v1-0-47413f8ddbf2@oss.qualcomm.com/
> > - bus: https://lore.kernel.org/all/20250924-knp-bus-v1-1-f2f2c6e6a797@oss.qualcomm.com/
> > others:
> > - fastrpc: https://lore.kernel.org/all/20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com/
> > - spmi-gpio: https://lore.kernel.org/all/20250920-glymur-spmi-v8-gpio-driver-v1-1-23df93b7818a@oss.qualcomm.com/
> > 
> > For part3(patch 17-20)
> > dependency:
> > - multimedia clk: https://lore.kernel.org/all/20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com/
> > - config: https://lore.kernel.org/all/20250924-knp-config-v1-2-e2cf83b1932e@oss.qualcomm.com/
> > - pd-mapper: https://lore.kernel.org/all/20250924-knp-pdmapper-v1-1-fcf44bae377a@oss.qualcomm.com/
> > - audio: https://lore.kernel.org/all/20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com/
> > - camss: https://lore.kernel.org/all/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com/
> > - video: https://lore.kernel.org/all/20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com/

Please separate the actual dependencies (the patches which are required
to build the DT) and all other patches which are not a real
dependencies. Just adding a binding is not a dependency.

> > 
> > For convenience, a regularly refreshed linux-next based git tree containing all the Kaanapali related work is available at:
> > https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali?ref_type=heads
> > 
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

> > ---
> > base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> > change-id: 20250918-knp-dts-0e8da3f76e85

Oh, you are using b4, but you don't use b4 prep --edit-deps. That's sad.

> > 
> > Best regards,
> > --
> > Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > 
> > 
> > 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
-- 
With best wishes
Dmitry

