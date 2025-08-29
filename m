Return-Path: <linux-arm-msm+bounces-71253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A09B3C0A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 18:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA04D189D9E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 16:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7BF326D7C;
	Fri, 29 Aug 2025 16:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vx1+Nkfe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD70326D44
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 16:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756484680; cv=none; b=JRfKDPLKLD1a37vDC47BC9aoXcTtZPj+8hE8RdZl5lEEoaLFRbrCDs0rtlZVHW1Q1mPDzlxJOOaaB6l+SMLWgmZbM4OdjAqqGDk/Qjf8jeytW4sxZ6EItBq3LkS/QO1310Kt47bsL4xu9Be0m/+gWumL1a/wwB53HoHPH2IT8Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756484680; c=relaxed/simple;
	bh=3B97zBH4p9jRcLgMlEAc2P4fRn926Py9yl1OWBr7GvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6b37/hHenQyUAzdlS2qU8iif9tfUlnuIeNfviONdOtzJeMleSwSSvGohYH/m5khuNnyrjtvdOknbOlfRQX9QP9w39JXHMVk301lWXquk4+QTUHBTiCPms0XcPzUqQ6tQ9G5xZhDy+dMlltgnIDoxb2wQi7b/Aoie1xQ7v+mFtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vx1+Nkfe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85K7L001901
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 16:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XCIfjiGc29TyHYiTm4KLiwCktBOr1c2fqrZ/oTTcfZo=; b=Vx1+NkfegDhBk6Bf
	fz9QkSj4uQXedF2HcUipcq/YN/IeXx+DvrakGMN4PA8SIbyDMeF/EFY8+SGlJhCM
	hWQuULnOEPwdLEE9OI3kN3J9ENLVFPsOSQGeArClQUEq5AT2HDzNZZXN7cXGDlL2
	XEMstV+DzQaqKeu5+yvsyikbFjzUAsBHRJXkxz/H0qyhjmQUeNxQ4OMXTUVTOAFb
	hw2ZCWfBXFpoFE987qMsXv8Y4aL1WzcICnFpLL76rNO4YL2wqNF+jM2zBcUZCD1y
	MoKNK2FFxccJCt1R8PkBP7U6X615kh7h6V8HaaawsANhi73UCyGASKypSnlclA95
	rWCH/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se173dnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 16:24:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2ffba8809so40690941cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 09:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756484677; x=1757089477;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCIfjiGc29TyHYiTm4KLiwCktBOr1c2fqrZ/oTTcfZo=;
        b=JYRKLBzr1WTjCdz03+nhYIpGKhSnwmTlOaTiZlpJHj9r9Gy4TrjpPjzy6a/S44cKbC
         3oqGloMaKF9k9Jawrw5r/UnGVdZr9ufkg5UI1VvtBtlJYHE4EqU5biDKAd56BPDzRyZh
         IYeHyJMOmPIWQjv8ylOFgpYQU6HOc9Eba8i1DFAjaOeCSMzT3ZFUPRQSIz7jlnEqcaGb
         MbqATX36seFuzKKgbC2p2uPHpR6gjxEW4tepQrmM2UYt2RJAQHg7KCmxuCxeuIUEnDhc
         v/HSwmEG+so6Vshe3WCVNZQd83ckOF9SZp/rx+J4fYM+3KDdeHAyV6M91PoZCPK+kYIo
         Culg==
X-Forwarded-Encrypted: i=1; AJvYcCXE3beOeEJLnjth0Hov8Ov0Zu+SSjXjjyIjW39305LYD2elARnnGDz8vxwy+FknzLlOvcWDnKjUDfYQxaHN@vger.kernel.org
X-Gm-Message-State: AOJu0YwRpS/fCcIOGXmCmp+IROrLqUVN7MvBrD9umO4h5VZel0GCwWhG
	4AYqj2VNHwipVkjMZGyN7g7k9OAVTw0xU+TP6XqU6V0uT6LvaVUhmNOLIkngFUEubWQvPFs5uQ8
	p7OW5zICzm0dcpX+pIcJH85GrSWmQErI28RvcRbr+LZuOcAcuQanopmueEq3DijN3RiD/
X-Gm-Gg: ASbGncvsCKJmLqWSAzkrwOnG32H0jcSC6/0eV1EKsyBYj0FcquFdGvQUbbwevkwVY4+
	Q/YWVQVdZGfRGkeRgpeFAGYlMV81/YORkR4SHyFT6cyJR554w6PYEYZIQp4i7gxKxHAXtd6p+/W
	ZRBLWnBAn+ZMoGViFofCc+rAqgahi20dTlNMHVW9CE94pCzu2YEqTQs/e6522Sjsln2kT5tMt19
	w1lwUBz6qXWD7XgcKFdSbk110QKIHnpVrs6V2l3zW2UlehuGwK05WRPk52BdpC/D9cZlpBXWGJs
	MjMG1Kk/yLI7bhYEbM1ygxTozL++JCjh8D/G+1bmi3NE33Tch5ACY6q9UGk0VYJ4ddXxIYrLpw8
	V70uhD7KXHWMf+FWD8DYhP/fCDNyLh/EtsTtskAj/iJrEZnB7UisR
X-Received: by 2002:a05:622a:2c1:b0:4af:bfd:82bf with SMTP id d75a77b69052e-4b2e76f6c2fmr159960161cf.17.1756484676479;
        Fri, 29 Aug 2025 09:24:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3avH1Zre9WfCU8qCI5LcLOBiCx7PfjvDuQh+HklBIJkQz+ZtJjjyCJREb1zAER0kzRP6i/A==
X-Received: by 2002:a05:622a:2c1:b0:4af:bfd:82bf with SMTP id d75a77b69052e-4b2e76f6c2fmr159959551cf.17.1756484675754;
        Fri, 29 Aug 2025 09:24:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f678450dfsm713370e87.72.2025.08.29.09.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 09:24:34 -0700 (PDT)
Date: Fri, 29 Aug 2025 19:24:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <quic_mchunara@quicinc.com>
Cc: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
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
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vishal Kumar Pal <quic_vispal@quicinc.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: lemans-evk: Extend peripheral and
 subsystem support
Message-ID: <ozkebjk6gfgnootoyqklu5tqj7a7lgrm34xbag7yhdwn5xfpcj@zpwr6leefs3l>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-3-08016e0d3ce5@oss.qualcomm.com>
 <kycmxk3qag7uigoiitzcxcak22cewdv253fazgaidjcnzgzlkz@htrh22msxteq>
 <3f94ccc8-ac8a-4c62-8ac6-93dd603dcd36@quicinc.com>
 <zys26seraohh3gv2kl3eb3rd5pdo3y5vpfw6yxv6a7y55hpaux@myzhufokyorh>
 <aLG3SbD1JNULED20@hu-mchunara-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLG3SbD1JNULED20@hu-mchunara-hyd.qualcomm.com>
X-Proofpoint-GUID: 63fd3kSe3uTIJZfGoiFp_esRZyKZwUYg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX/zp3To6PZ+ol
 lpNDGjXQMpGFk5CS7ZJqmRcx7fQ0NGtCsatduKJVubpvmvEmKL0bK97ikL+VFeqWDIDuWuvH5ok
 dGtnRN/Mdb9D5ZSfsclPT8+cWBSeRLPbhShDCRTLR7895XN1f6r33iTou7TSa06WrdS5Q4qd2pI
 Bfk1xJP1ZC8XNJTcZF3p1f/3Wz1/AjkuNiqE0b2NhYjyir2DrIOVCL+LngR/XCR3n7nqQ/rWrVA
 Ctn2hESsnkneKGQxUEF3P1hDH8NUK74hN2Fkezi1eTM/L2tHY2v0Fk7ctGc0NfnU6XOaAB9rPZc
 IFEFHFdVPa8KtO/pzDzwMu1XdxSiV0qyqn96SWQ+BV64tJ1ZHQY221QAlmf1EWVHL9Z2i64HJgq
 M4uhd0r+
X-Proofpoint-ORIG-GUID: 63fd3kSe3uTIJZfGoiFp_esRZyKZwUYg
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68b1d446 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=YDAz1v9_iDTVm1Y559YA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

On Fri, Aug 29, 2025 at 07:50:57PM +0530, Monish Chunara wrote:
> On Thu, Aug 28, 2025 at 04:30:00PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Aug 28, 2025 at 06:38:03PM +0530, Sushrut Shree Trivedi wrote:
> > > 
> > > On 8/27/2025 7:05 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Aug 26, 2025 at 11:51:02PM +0530, Wasim Nazir wrote:
> > > > > Enhance the Qualcomm Lemans EVK board file to support essential
> > > > > peripherals and improve overall hardware capabilities, as
> > > > > outlined below:
> > > > >    - Enable GPI (Generic Peripheral Interface) DMA-0/1/2 and QUPv3-0/2
> > > > >      controllers to facilitate DMA and peripheral communication.
> > > > >    - Add support for PCIe-0/1, including required regulators and PHYs,
> > > > >      to enable high-speed external device connectivity.
> > > > >    - Integrate the TCA9534 I/O expander via I2C to provide 8 additional
> > > > >      GPIO lines for extended I/O functionality.
> > > > >    - Enable the USB0 controller in device mode to support USB peripheral
> > > > >      operations.
> > > > >    - Activate remoteproc subsystems for supported DSPs such as Audio DSP,
> > > > >      Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
> > > > >      firmware.
> > > > >    - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
> > > > >      and other consumers.
> > > > >    - Enable the QCA8081 2.5G Ethernet PHY on port-0 and expose the
> > > > >      Ethernet MAC address via nvmem for network configuration.
> > > > >      It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
> > > > >    - Add support for the Iris video decoder, including the required
> > > > >      firmware, to enable video decoding capabilities.
> > > > >    - Enable SD-card slot on SDHC.
> > > > > 
> > > > > Co-developed-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > > > > Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > > > > Co-developed-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > > > > Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > > > > Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > > > > Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > > > > Co-developed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > > > Co-developed-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> > > > > Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> > > > > Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > > > > Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > > > > Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> > > > > Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> > > > > Co-developed-by: Vishal Kumar Pal <quic_vispal@quicinc.com>
> > > > > Signed-off-by: Vishal Kumar Pal <quic_vispal@quicinc.com>
> > > > > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > > > > ---
> > > > >   arch/arm64/boot/dts/qcom/lemans-evk.dts | 387 ++++++++++++++++++++++++++++++++
> > > > >   1 file changed, 387 insertions(+)
> > > > > 
> > > > 
> > > > > @@ -356,6 +720,29 @@ &ufs_mem_phy {
> > > > >   	status = "okay";
> > > > >   };
> > > > > +&usb_0 {
> > > > > +	status = "okay";
> > > > > +};
> > > > > +
> > > > > +&usb_0_dwc3 {
> > > > > +	dr_mode = "peripheral";
> > > > Is it actually peripheral-only?
> > > 
> > > Hi Dmitry,
> > > 
> > > HW supports OTG mode also, but for enabling OTG we need below mentioned
> > > driver changes in dwc3-qcom.c :
> > 
> > Is it the USB-C port? If so, then you should likely be using some form
> > of the Type-C port manager (in software or in hardware). These platforms
> > usually use pmic-glink in order to handle USB-C.
> > 
> > Or is it micro-USB-OTG port?
> > 
> 
> Yes, it is a USB Type-C port for usb0 and we are using a 3rd party Type-C port
> controller for the same. Will be enabling relevant dts node as part of OTG
> enablement once driver changes are in place.

Which controller are you using? In the existing designs USB-C works
without extra patches for the DWC3 controller.

> 
> > > 
> > > a) dwc3 core callback registration by dwc3 glue driver; this change is under
> > >     review in upstream.
> > > b) vbus supply enablement for host mode; this change is yet to be submitted
> > >     to upstream.
> > > 
> > > Post the above mentioned driver changes, we are planning to enable OTG on
> > > usb0.

-- 
With best wishes
Dmitry

