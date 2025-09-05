Return-Path: <linux-arm-msm+bounces-72292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CE4B45959
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 334BB1C86654
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 13:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50DC352076;
	Fri,  5 Sep 2025 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9B0clsF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D0D3451AF
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 13:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757079688; cv=none; b=b43WdI3JTt00cQjENCZVH/utGYMlRzqEg01wXFM+CJS+MevMpgHec3jNLGY6N7XNW2KgeTj8Wr6lftV9qFt9VTnDb7JTC2toREedNcc9phiNhiLwhzA2UiBAUx2lNUlnWO7eglWk0Xoca/rzMPXRS3odisv/clyFgSBST+ArLxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757079688; c=relaxed/simple;
	bh=jLry5UhH6/hPCvtIbxA4Y7EVMcaMoizeFGKLOfELDV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAdlapY+6/EdQh0W424wuPXWkYAwgsmlp1asNwB+bDq3oehzQifpwqgza/MbgQy8PFWcPQWWHLpS8uVGDZoLDFaFAFnL6v920xh0FArAK2SnAsE81+fV6cgYHk+2S0FHQVcLdaDPBooYujnAi8c4ZGx0t2dII6wwyE6b8b7LsCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9B0clsF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857adlZ012043
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 13:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9nairzrxrLx+7AmhxXAPpkwSM1Xt+xwotCDD82OGERA=; b=n9B0clsF/5Xvf6fQ
	HgVu6KdMH+j+jIb0eHfcKqZWA7cOthaiEiUELXvxcHzTcBJGv1S4zBLh8FHqTHDZ
	fYHD8hgC3RpgGcujbi+O/3mbnVFgp3qshrVwPJLrKrN+xCE4j0F5LVsmOJ3fLTML
	dKP1EXdtxf695XzIP0bS/Hd5g4VaGzvLmdJHZHoFkXz7FqvUXUcxBrPpFRzewgO7
	FFTZuSI1n5vd36ufu+7SDnQeDZZ3YGSYy7LHPpJQj/k5ku2Tgd5TaQH8mOKHm9Zd
	utyuf5ciEYzYC54sWCBGappjxvgW5kBm/Im69b8rHDUPx/0km/wbzZM7wtYZ/oU5
	wOdf5Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj7m4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 13:41:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b32b721a23so71443221cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 06:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079685; x=1757684485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nairzrxrLx+7AmhxXAPpkwSM1Xt+xwotCDD82OGERA=;
        b=uxxz6JwcoRX7GIJMuXebIw3dSWWNsWKq0d/CODZ4/6vm9qooqdUP7QNk+b8GaG9Hf8
         oBdUzKoeO0N/b/f2+z5N38SnDzFvGIqgy+1HFdPs5UZfRZlgbdiiAsNQ9uh0FXScSuol
         3PDOw6R2go7/wANtHmmEvNbSXqhs3GllpzPrNsYcXnJ1DQCxsucwkejL0hPYQqnx9AHb
         inh8t76JCClNKh3bhSqiqijoCywsst5Ia7pFKD70fFXsOV5WXEzQau0bYRvSaz47XOln
         rlzK6brQSDQiapEZ0EXu0Nvnv2wBqGA2i8I5M+NJa2OISOe1WW8Jg5ZpKh8nKnW2Bcdx
         Xvvg==
X-Forwarded-Encrypted: i=1; AJvYcCWR4us6ZcBJeR8WA35G7o3a2P4m8fOfmZim2B+ton29hzPY4VO8316BiyFGPGrIOZVk+6U9o6EENae76UP4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5RccaZwYk8g23TvjFSBY9fqQm97rBWjoD9d0YgMMeYONH8RIC
	4CZFe0VVE3LYRoXzs+JbKAghsKCgIp8w4MQajNwQY499yRHyeSTuh3sZR+2zD8s4Oc5cx/Yyn2r
	/7f9Mzh/BiDYlcCwIrV49epqBlEuhwpf7VcDvYuRut8lA/whhXUM0d+Mp1ZkkZJLASP3Y
X-Gm-Gg: ASbGnct+qP9zz1kRNTDy+jDegKsY+nxJa+sctYm8dhjLAClKs2D4fJq9yDyl5zxl9jD
	6tJs1w/5TC0HEsRw4R3zNaDRYmffDIvve6lJTNbE7Na4V9lYv2rCS4f8EOHZL8PvV0TEtzqbAIu
	d/Le32jZLrOgEdmvmcka+wHpzcN/yXXSU6vQFKOePvc+W0DA59dGTeC1I90NqotVhWOxiTx9BFT
	Rrt/eyNj863ocU0HB5F0a0kIkrtXwtkIk14ADin00+plOKFQcH/4TreKiUi3fu+5Fv+Dnpb/n1Y
	iwygAqVPsXhFHRf7oXNbb1MXwDbjfYeS0R34mQXbsDXuf6T41A5SrI62Xl9PQHXZ3nquiA0M8ya
	QnpGe4NU35e2l5QCWBRK1im4VicAtRxaDCTNsPkZMqk8Vqq03Xzk9
X-Received: by 2002:a05:622a:a10:b0:4b3:285:91da with SMTP id d75a77b69052e-4b31dc737afmr311154881cf.68.1757079684682;
        Fri, 05 Sep 2025 06:41:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuMjYizg5Pnq40M/qfidOWisBr2dPqOMM0XLBwoecs1KjkC0Nk5K5IjnyM5w+W1vLbkO4LuQ==
X-Received: by 2002:a05:622a:a10:b0:4b3:285:91da with SMTP id d75a77b69052e-4b31dc737afmr311153971cf.68.1757079683724;
        Fri, 05 Sep 2025 06:41:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c89sm1784613e87.91.2025.09.05.06.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:41:22 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:41:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Arun Khannna <quic_arkhanna@quicinc.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add Monaco EVK initial board
 support
Message-ID: <ow7gdrkissn4npgbua3krdtkexvf47yu57e6luf7bizfvcvbge@33uwiohzlunk>
References: <20250826181506.3698370-1-umang.chheda@oss.qualcomm.com>
 <20250826181506.3698370-3-umang.chheda@oss.qualcomm.com>
 <ao3nb3xkeutqetqx7amlfbqtvhuyojfvzm4prsze2mhgb2rpnc@s2bsigcrlxzo>
 <CAHz4bYs7Jy_NXcn6bOCHfxG=YoO+5vcAMUYEcptkJK+Cx+pA9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHz4bYs7Jy_NXcn6bOCHfxG=YoO+5vcAMUYEcptkJK+Cx+pA9Q@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX5zDge2oKc+dA
 RGS6pQzoNUtmKxlBLeO/UOGQ8swmJ452wEJula2aVShITatpVOFjKCJN4it3Pi/7xYN0BbPm1S6
 mxnQ6z8zVpq+/lSTmvu63Fv6SpAnyXLIt5WbRLXrENL92t9I1JRqx86YFGWNhlbCGBtgtmpEsVb
 AZaOy23ly2aADYiZnr9DNOpzCH4ehfTuk76Hkdc8uUJvGu97saRQSIvhlz9UD8iusGSmXAWMh0V
 hNWK4cTc5uHEsgyldluua9hhsmUioGokmXsc/OmfoFc13r8j0VlEWi6Ck55QDd7MA7TO15C4Div
 UTeVuvcmgPQ1mWpiODYBL1w8Z20TR7Oj+8rbhYK4zCYcA25U3LIuJ72qeg6PUV/DZqZassMjCs5
 NjnO85MJ
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68bae886 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=5rBl_X4QI-NXlREZvckA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WsxHuIDYeh0ARpBWpGbhoq1OXVZ4qx-w
X-Proofpoint-ORIG-GUID: WsxHuIDYeh0ARpBWpGbhoq1OXVZ4qx-w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On Fri, Sep 05, 2025 at 06:54:25PM +0530, Swati Agarwal wrote:
> On Wed, Aug 27, 2025 at 7:13 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Aug 26, 2025 at 11:45:06PM +0530, Umang Chheda wrote:
> > > Add initial device tree support for Monaco EVK board, based on
> > > Qualcomm's QCS8300 SoC.
> > >
> > > Monaco EVK is single board supporting these peripherals:
> > >   - Storage: 1 в 128 GB UFS, micro-SD card, EEPROMs for MACs,
> > >     and eMMC.
> > >   - Audio/Video, Camera & Display ports.
> > >   - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD.
> > >   - PCIe ports.
> > >   - USB & UART ports.
> > >
> > > On top of Monaco EVK board additional mezzanine boards can be
> > > stacked in future.
> > >
> > > Add support for the following components :
> > >   - GPI (Generic Peripheral Interface) and QUPv3-0/1
> > >     controllers to facilitate DMA and peripheral communication.
> > >   - TCA9534 I/O expander via I2C to provide 8 additional GPIO
> > >     lines for extended I/O functionality.
> > >   - USB1 controller in device mode to support USB peripheral
> > >     operations.
> >
> > Is it actually peripheral-only?
> Hi Dmitry,
> 
> HW supports OTG mode as well on the USB0 port but for enabling OTG
> mode , it requires two things, one is role switch support and another
> is VBUS supply on/off support. Both will be taken care of by Type-C
> manager HD3SS3220. Currently, VBUS enablement support is not present
> in the driver. Once that support is added, I will add OTG support for
> the USB0 port, until then we would like to keep it in peripheral mode
> for ADB support.

Add comment to the DT file, please.

> 
> This is the same change which was discussed for lemans-evk [1] applies
> for monaco-evk as well.
> 
> [1] https://lore.kernel.org/linux-arm-msm/d6816cc6-c69e-4746-932e-8b030ca17245@oss.qualcomm.com/
> 
> Regards,
> Swati
> >
> > >   - Remoteproc subsystems for supported DSPs such as Audio DSP,
> > >     Compute DSP and Generic DSP, along with their corresponding
> > >     firmware.
> > >   - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
> > >     and other consumers.
> > >   - QCA8081 2.5G Ethernet PHY on port-0 and expose the
> > >     Ethernet MAC address via nvmem for network configuration.
> > >     It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
> > >   - Support for the Iris video decoder, including the required
> > >     firmware, to enable video decoding capabilities.
> >
> > I don't see firmware being declared here.
> >
> > >
> > > Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > > Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > > Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > > Co-developed-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > > Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > > Co-developed-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> > > Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> > > Co-developed-by: Arun Khannna <quic_arkhanna@quicinc.com>
> > > Signed-off-by: Arun Khannna <quic_arkhanna@quicinc.com>
> > > Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> > > Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> > > Co-developed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> > > Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> > > Co-developed-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile       |   1 +
> > >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 463 ++++++++++++++++++++++++
> > >  2 files changed, 464 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk.dts
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

