Return-Path: <linux-arm-msm+bounces-71465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 750B9B3F25E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 04:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AAD418806AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 02:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82652DE71A;
	Tue,  2 Sep 2025 02:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RhYX4Xu7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7E02253EC
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 02:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756780476; cv=none; b=gKjqHD9Rx/Cw0mHfGdH6g8oV1YymPDHm3YGG5rXQD8GX6oGuq+EHjFCKtq9GXd+ReP35dvGM1d2Zmv2/rXYvKr+qDBJBZudtch7wK3VUIFa8cEfoyCAKxLjp7NdwmozKIit1Z02wd9NXefwGj4xDvG3AD2GsBNNLlt+regdMm/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756780476; c=relaxed/simple;
	bh=da4uTNhiqePv0Xg9eLwNKjRKFjWWOOVrp+AzpZL2hy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKIgfC2LPOK7gAM6sM0Sw7IpwSN6nd30QGKMuhgw8LOzSkhIR17nftU2wplhplHTdvXqEEQlA9oR58k+wBhKi7DIqoDFwFmdX3dIEsmgA1FE9elM1yiho9Su6UvoZXgnbWq3DhmXpLUexgFysXvqFugSPvQxQ/jY4SOCyz0oi8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RhYX4Xu7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SHrc010488
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 02:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vS0F+s8gHxST2GOfLmUKRNqUAeMPii9K1GmPXyJtBXE=; b=RhYX4Xu7SpXM/EDh
	E7fuhwt6QyQakbMwxU7oBL4DfKv+4MPu144oSL5xwRrI8BaDOYQWnNPK3M3Idr8W
	kwbeZ3tY0CETMTw5qaiPOwSVhOcLLJ7zTVbwTXVuq7QjuPpMZddlLH7Vrz85q7b2
	9uTZQ3LiC7zmkTslRB8C5FkAs2z9hvcsvDhsmzPGQ0PK6riLBOvQXA7W3A1egrJd
	IPfA65WzKG+O06hscRvDEYEh+xWnmoW8oCER1a4zwWdws20zLplr+wL4dcEI+1uK
	1hHqY27u8KrbaZaTr6t91AoM7pz3gocWwpuDgIFxQ5l7HdIvuvfDC4M5MQiY5af9
	zxpSPw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmje845-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 02:34:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b340f94860so11960871cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 19:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756780472; x=1757385272;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vS0F+s8gHxST2GOfLmUKRNqUAeMPii9K1GmPXyJtBXE=;
        b=rWPUfKWh7vyRsUL1a9M18arPWQap+OyLJ2C1e+S4vahKYhjXstgwVvgQVCdzNvYnLj
         8GugHBIYoImWLioATfRAmD361TQQ9jVL/mq1s1caCkfLrCJPdaE8UzaCNi0m9kc6DuLD
         nr6/UAh/yKk233b0LaPQhhf/WzTBeobMlcDorP7I62UdFPrmnFXs4m2RiD9r+QxnU1Ek
         xSxA2WDzhekEfdFc1cGUSnsLT21ADOHIKdY+vsaLnthWRXiu5HOu0quXfQXxT02meAgw
         eEywNP7bV+de8nhbjZNXKEp8tGn/LHbDuhyp3lyGV1O7K2yToFSyiNi3NXc939j6j+I5
         i4RA==
X-Forwarded-Encrypted: i=1; AJvYcCX17LR7eNX/KuuyNctX4YM2lAVuCg92Q6/rRC8RwPz9O0bm1mB8VLFdsZflyPM7dB4NhU8ro3+LE+1iVT/6@vger.kernel.org
X-Gm-Message-State: AOJu0YydQwVK3HDvLBEj6Ag0lupbA+jVjlTS2PeECPLMKN3TjdQSfs2/
	vw4S6yxLxFwtkA03EZ7i0mkdnmxYlRN+5gB0n1sQJl7kmxZqcYV2pdlH6+7ypC3e4yUND6Z4T+Y
	/osbWXHTnRsavJu0z9ztMzu0gUTDOOPLsEQIixklgBOq++SipkJyRlW+Z8Ih02BaSsTRn
X-Gm-Gg: ASbGnctrHA8LAOlM3n/6DOPoH3j96NR63/AF8B0/9vzJtLeOTkPZ6qAn7yXLoADObo3
	2zGUU+x1/BYDBgulso/lDEweyXpMaD/7TfITPp3BwQZ4+VJJ+2/UfSGcX7Hd4BE9w6BQJFuUV02
	9+oLnK0cua9HmsQuD+MzcA5IusGKR8zDP2t0HhkRxW7NYKq+ylQucy+rr2kBE7DDCkXIj0k/z3o
	e9z2j/Z+zZdyHPqWJrFULPDafceaFyFupLxS1aLLZvhBjPV8+RWHRWkogRR+cd4AC8OE/7Oy6f5
	lWjrTMD9EJrLYCQYhp34fnQstRobAGD3X3IfNWiH478t2wFRLM7pkTn4q8hmBI1rfYRhKBg/sGn
	iy/qomvLnTlRfLpnOET+2iQohJgTvYDNzyv2WWJi1wEtuxeNSeEUE
X-Received: by 2002:a05:622a:230c:b0:4b3:1847:4192 with SMTP id d75a77b69052e-4b31dd2f96fmr131936781cf.69.1756780471832;
        Mon, 01 Sep 2025 19:34:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzqodcfWhpK6qJYUt42vLlLnCY1b1EAphCtxu0+mddayjBUMwightL8KwYc5BxzP8zvbba9w==
X-Received: by 2002:a05:622a:230c:b0:4b3:1847:4192 with SMTP id d75a77b69052e-4b31dd2f96fmr131936501cf.69.1756780471342;
        Mon, 01 Sep 2025 19:34:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827a0218sm281176e87.117.2025.09.01.19.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:34:30 -0700 (PDT)
Date: Tue, 2 Sep 2025 05:34:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Cc: Monish Chunara <quic_mchunara@quicinc.com>,
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vishal Kumar Pal <quic_vispal@quicinc.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: lemans-evk: Extend peripheral and
 subsystem support
Message-ID: <ly5j2eodrajifosz34nokia4zckfftakz5253d2h6kd2cxjoq3@yrquqgpnvhp6>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-3-08016e0d3ce5@oss.qualcomm.com>
 <kycmxk3qag7uigoiitzcxcak22cewdv253fazgaidjcnzgzlkz@htrh22msxteq>
 <3f94ccc8-ac8a-4c62-8ac6-93dd603dcd36@quicinc.com>
 <zys26seraohh3gv2kl3eb3rd5pdo3y5vpfw6yxv6a7y55hpaux@myzhufokyorh>
 <aLG3SbD1JNULED20@hu-mchunara-hyd.qualcomm.com>
 <ozkebjk6gfgnootoyqklu5tqj7a7lgrm34xbag7yhdwn5xfpcj@zpwr6leefs3l>
 <ed3a79e0-516e-42f4-b3c6-a78ca6c01d86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed3a79e0-516e-42f4-b3c6-a78ca6c01d86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b657b9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=FAQitTM21wLSu42_UfgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rwfgYYUArIbXHGGZkA-x0V0BdUQ8RejA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX6uDW5bV4TjFt
 AW5Lz/hn3GlgOHQENE5ceEjlOBCfWBtGTvXD5ztAYhQwkBQXuaPRRHa6UMgM85UdhFNzIeX6yfD
 4i80EhA2kpRuR92d0d88xiauWJVKSg0aeefvynw6Z0ZndLeXTKsNlp4/7IZOu8ClF0yPpweJFkw
 X06WcUo6DDXZc6R+Io1zGKwanBRinLHDWe1+Q0roslx7EnvPuMl6sU3/ijz9lhvvW1Ma1t70BE6
 d+u1oN9tiuhwh3bFqAkiqmDwx869hXTmrp/whCPeV4DmcGgsMJP3CF9OxVD9zEnyTospgdbzn5E
 cJl4rfGykmjoSPY21e9Vnorzy8FWtVhapHwIppx2EsCnE/+eEsi8Eiq8zeEB9cpCIROcdtK21Ih
 FE0QM8Jv
X-Proofpoint-ORIG-GUID: rwfgYYUArIbXHGGZkA-x0V0BdUQ8RejA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On Mon, Sep 01, 2025 at 01:02:15PM +0530, Krishna Kurapati PSSNV wrote:
> 
> 
> On 8/29/2025 9:54 PM, Dmitry Baryshkov wrote:
> > On Fri, Aug 29, 2025 at 07:50:57PM +0530, Monish Chunara wrote:
> > > On Thu, Aug 28, 2025 at 04:30:00PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Aug 28, 2025 at 06:38:03PM +0530, Sushrut Shree Trivedi wrote:
> > > > > 
> > > > > On 8/27/2025 7:05 AM, Dmitry Baryshkov wrote:
> > > > > > On Tue, Aug 26, 2025 at 11:51:02PM +0530, Wasim Nazir wrote:
> > > > > > > Enhance the Qualcomm Lemans EVK board file to support essential
> > > > > > > peripherals and improve overall hardware capabilities, as
> > > > > > > outlined below:
> > > > > > >     - Enable GPI (Generic Peripheral Interface) DMA-0/1/2 and QUPv3-0/2
> > > > > > >       controllers to facilitate DMA and peripheral communication.
> > > > > > >     - Add support for PCIe-0/1, including required regulators and PHYs,
> > > > > > >       to enable high-speed external device connectivity.
> > > > > > >     - Integrate the TCA9534 I/O expander via I2C to provide 8 additional
> > > > > > >       GPIO lines for extended I/O functionality.
> > > > > > >     - Enable the USB0 controller in device mode to support USB peripheral
> > > > > > >       operations.
> > > > > > >     - Activate remoteproc subsystems for supported DSPs such as Audio DSP,
> > > > > > >       Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
> > > > > > >       firmware.
> > > > > > >     - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
> > > > > > >       and other consumers.
> > > > > > >     - Enable the QCA8081 2.5G Ethernet PHY on port-0 and expose the
> > > > > > >       Ethernet MAC address via nvmem for network configuration.
> > > > > > >       It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
> > > > > > >     - Add support for the Iris video decoder, including the required
> > > > > > >       firmware, to enable video decoding capabilities.
> > > > > > >     - Enable SD-card slot on SDHC.
> > > > > > > 
> > > > > > > Co-developed-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > > > > > > Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > > > > > > Co-developed-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > > > > > > Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > > > > > > Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > > > > > > Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > > > > > > Co-developed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > > > > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > > > > > Co-developed-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> > > > > > > Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> > > > > > > Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > > > > > > Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > > > > > > Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> > > > > > > Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> > > > > > > Co-developed-by: Vishal Kumar Pal <quic_vispal@quicinc.com>
> > > > > > > Signed-off-by: Vishal Kumar Pal <quic_vispal@quicinc.com>
> > > > > > > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >    arch/arm64/boot/dts/qcom/lemans-evk.dts | 387 ++++++++++++++++++++++++++++++++
> > > > > > >    1 file changed, 387 insertions(+)
> > > > > > > 
> > > > > > 
> > > > > > > @@ -356,6 +720,29 @@ &ufs_mem_phy {
> > > > > > >    	status = "okay";
> > > > > > >    };
> > > > > > > +&usb_0 {
> > > > > > > +	status = "okay";
> > > > > > > +};
> > > > > > > +
> > > > > > > +&usb_0_dwc3 {
> > > > > > > +	dr_mode = "peripheral";
> > > > > > Is it actually peripheral-only?
> > > > > 
> > > > > Hi Dmitry,
> > > > > 
> > > > > HW supports OTG mode also, but for enabling OTG we need below mentioned
> > > > > driver changes in dwc3-qcom.c :
> > > > 
> > > > Is it the USB-C port? If so, then you should likely be using some form
> > > > of the Type-C port manager (in software or in hardware). These platforms
> > > > usually use pmic-glink in order to handle USB-C.
> > > > 
> > > > Or is it micro-USB-OTG port?
> > > > 
> > > 
> > > Yes, it is a USB Type-C port for usb0 and we are using a 3rd party Type-C port
> > > controller for the same. Will be enabling relevant dts node as part of OTG
> > > enablement once driver changes are in place.
> > 
> > Which controller are you using? In the existing designs USB-C works
> > without extra patches for the DWC3 controller.
> > 
> 
> Hi Dmitry,
> 
>  On EVK Platform, the VBUS is controlled by a GPIO from expander. Unlike in
> other platforms like SA8295 ADP, QCS8300 Ride, instead of keeping vbus
> always on for dr_mode as host mode, we wanted to implement vbus control in
> dwc3-qcom.c based on top of [1]. In this patch, there is set_role callback
> present to turn off/on the vbus. So after this patch is merged, we wanted to
> implement vbus control and then flatten DT node and then add vbus supply to
> glue node. Hence made peripheral only dr_mode now.

In such a case VBUS should be controlled by the USB-C controller rather
than DWC3. The reason is pretty simple: the power direction and data
direction are not 1:1 related anymore. The Type-C port manager decides
whether to supply power over USB-C / Vbus or not and (if supported)
which voltage to use. See TCPM's tcpc_dev::set_vbus().

> 
> [1]: https://lore.kernel.org/all/20250812055542.1588528-3-krishna.kurapati@oss.qualcomm.com/
> 
> Regards,
> Krishna,
> 
> > > 
> > > > > 
> > > > > a) dwc3 core callback registration by dwc3 glue driver; this change is under
> > > > >      review in upstream.
> > > > > b) vbus supply enablement for host mode; this change is yet to be submitted
> > > > >      to upstream.
> > > > > 
> > > > > Post the above mentioned driver changes, we are planning to enable OTG on
> > > > > usb0.
> > 
> 

-- 
With best wishes
Dmitry

