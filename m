Return-Path: <linux-arm-msm+bounces-72054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDB0B43D55
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 15:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CDED1897B86
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 13:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006CB303C9B;
	Thu,  4 Sep 2025 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sw1j+vVA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5126E2FF15B
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 13:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756992911; cv=none; b=dZgNA/HDJeCB9FhX+ajN73Ve8Rh4IDAl1HGnyleMfe8jWDN4Rnex5mhei+AgwqAZVPuwE7UGtamXgySugpyNsSdQudtOBb6Qbhsb/vmRBNnHIPQEAvHBI0PoFrf/wKs1+GuUEiWkExAn+ZFXxY8n4gSX7g1SLs3vBIjfUcMRZ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756992911; c=relaxed/simple;
	bh=mNw4NPJv7jfExJEaKhRJuxPTUkc0hirhY7JArHV4h90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDdaJZHq258a24698qB0fp5mDQtsKqcTww+6nijh6fP4Pj/hzj8KemqkpzkbYOaE0ypndr4waIlDu6feW2oHxUEUBsuSC7TmyB4KYXMPKu/ko45YRvYRhjvjjH63xeflTjdOuzJEIuE04J76Qfi+KOxVjXPeLkUHTOxSgWzhyxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sw1j+vVA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7Ub013973
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 13:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OPxYfslCOHAID8SwXwG5fuaFBZwwpSGhUdIFauIo1JE=; b=Sw1j+vVAiPFzQ5kk
	VZ6QxScya+uHCTspldly+ltI7VOtyAO+fwpG/mfGEfNBIngjzlf4BKj9IUK1D9WP
	c77xC+M6IVj9SRNrNi4O/chNKqy3lQ2pEZnrNmTYfqN7NFTM2Z49+nBq5cMoaky0
	nSHf+u8W9h/1Woavt+BZ8WI7xrstxuudIBigaaMGixM2z9SZMn9Qj3pe6tI2Jk2E
	dzuzKc8aZVOhvPJjsFCqUQade9bqJbJEokDZu2BgS+Wodgh49KiXqk189L4bPCs4
	0JJrAPvTp9pJ5M8jnotkLAsFsaxHD3aO4sN0s04DQwwBguUW4E25DrKSUmEmXbLZ
	R2YHUA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv7s6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 13:35:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7222232866aso18118356d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 06:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992908; x=1757597708;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OPxYfslCOHAID8SwXwG5fuaFBZwwpSGhUdIFauIo1JE=;
        b=HWcLWJsgwvO13h5Tb/c1YJBPXDo4zw+xBmzsOm9g0C29azyKmXPvUIODQHs/BS9NMT
         dqBcaOfUJD2G2Vu7v99MxnuwCfVADt6QYCgj9tJSlFrjRxremspB/jbjAFS29k8RUFDd
         wsVeYL/ESJSaquBkmUgW2KrWccKIejMI0c6Sep7WDugTDT5euKOuP4bnMlSTwDMczNks
         dRqBbb8SS0xLHhAgAwwNwMpVY7BPMQpPZXQj67XD1uD0ITRfragKnYy2JW0mIBdbC/jR
         uBTKV5v/kv0lb9PSc3D5oAJZi4iFq7okDqGvZFFU/yfdLt3HMEUmbnJPioYEQpVjMS8f
         3FWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi2AYigRD/irYVYRu9Vh2DziEi4Kqa1Na1flmQQ5/jLjXOZCwEBxANZ5qvLQ/G0KVJx1pl4Tu/qzaOaDYL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3tinVlye4xe4D7NDycbPd1aBlypG+NW/72pvS9XhN0qxblZ4j
	9lYI8n3mAxD+1xuD55XWvNemo38P5eAXdHO0r3dOjfDryq4u1qF4PoV9oXXpbgZakT0PBHO9bL/
	j9uYTt4GHe6vF9HnAfdZt7ixYQ9w2BxA79fIYdE0rlrMtu2AjWMaX+ZRdVOdgvXWHgrXC
X-Gm-Gg: ASbGncuUIwm7/lZwoHv/NQUJHhAx6UlEWTMu7TOD9xqUxST68mVvnzBZBezwD22Ehla
	UWv2k/rLauld6z/mldB7RBD27hWsvhXRi+coHCw3cZCqg9EzeHGNvJvrXpuhIZuiheZWlefGa8U
	BXTDZVMRgoGaivICO92z60LyKfTDuOWcFqYuxLIwPwa9sWUyA/vQ97S4z9lZMw78oCw5TpkXdSi
	PugrHr/0RYspBLNJEGrA6VP/3h4fF/fllmvjoKeN03whHPH2hr2wYiM8aZJ++/ceYVEDhr6+QnF
	wuC8vZJMZ5wnD16MmC6sprx6abheG16bI6rw0HbE8XwY3EjmvPWj08znx3EYLYCKD9B7D4ZSAxM
	Iqc4PeZ39oTJfeu4+EHBAjSlEVOIRgqOPDvUDcq+o/b42E1yXfNmP
X-Received: by 2002:ad4:5b88:0:b0:70d:f64e:d49e with SMTP id 6a1803df08f44-70fa99538d7mr217622406d6.23.1756992907761;
        Thu, 04 Sep 2025 06:35:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/pjp1F9a67cZt9KewNwhTZVwINluKfADfpH0CCTf4H3LNZ9T9PTZyP8kwGKz/Y999D34yNQ==
X-Received: by 2002:ad4:5b88:0:b0:70d:f64e:d49e with SMTP id 6a1803df08f44-70fa99538d7mr217621666d6.23.1756992907150;
        Thu, 04 Sep 2025 06:35:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfaae4sm1239147e87.99.2025.09.04.06.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:35:06 -0700 (PDT)
Date: Thu, 4 Sep 2025 16:35:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: lemans: Add SDHC controller and
 SDC pin configuration
Message-ID: <tqm4sxoya3hue7mof3uqo4nu2b77ionmxi65ewfxtjouvn5xlt@d6ala2j2msbn>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-2-08016e0d3ce5@oss.qualcomm.com>
 <rxd4js6hb5ccejge2i2fp2syqlzdghqs75hb5ufqrhvpwubjyz@zwumzc7wphjx>
 <c82d44af-d107-4e84-b5ae-eeb624bc03af@oss.qualcomm.com>
 <aLhssUQa7tvUfu2j@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLhssUQa7tvUfu2j@hu-wasimn-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX05FINomwTxqH
 2N8h69cIUNQAvX65/JMniYA+gRkJl+yTcM1Q4x3ncBdurRIHxNfsc+Rzu1bS1gA4ucpViJm1IiG
 urxIkKlOvgnd3OZW0Ec2CPO9/SfjUiYgtae51PUwb5cQZJ+gmSA4IbmWatXzodPBOrAix9LNBDL
 LERMU3m2AIl3kK5D4zBfst1uUWhHwucAL5ofXiGH3UZtCL+p4dNaL9tGoIOUMMTz6jgOrpaTLZG
 YbQYIOkW8S7CCG/iuKK6LIHACe1df3oTHpDae32JlYrdpKjR+9F6oV8FwC3Pn4wlciO259f7wEv
 GQcWmwtbUdgjd4XF0ouveh8o4+jo5einVV+TJa08J6ZNrE2UoSikS7UpSvOsqyN5XvGq8gTxXRC
 F7pNWAlu
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b9958c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QCn0C3cCROmBCoviGrEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: F5MD3LRnuH8wkLYhcmN6bQqr2i4lCUrz
X-Proofpoint-GUID: F5MD3LRnuH8wkLYhcmN6bQqr2i4lCUrz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On Wed, Sep 03, 2025 at 09:58:33PM +0530, Wasim Nazir wrote:
> On Wed, Sep 03, 2025 at 06:12:59PM +0200, Konrad Dybcio wrote:
> > On 8/27/25 3:20 AM, Dmitry Baryshkov wrote:
> > > On Tue, Aug 26, 2025 at 11:51:01PM +0530, Wasim Nazir wrote:
> > >> From: Monish Chunara <quic_mchunara@quicinc.com>
> > >>
> > >> Introduce the SDHC v5 controller node for the Lemans platform.
> > >> This controller supports either eMMC or SD-card, but only one
> > >> can be active at a time. SD-card is the preferred configuration
> > >> on Lemans targets, so describe this controller.
> > >>
> > >> Define the SDC interface pins including clk, cmd, and data lines
> > >> to enable proper communication with the SDHC controller.
> > >>
> > >> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> > >> Co-developed-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > >> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > >> ---
> > >>  arch/arm64/boot/dts/qcom/lemans.dtsi | 70 ++++++++++++++++++++++++++++++++++++
> > >>  1 file changed, 70 insertions(+)
> > >>
> > >> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > >> index 99a566b42ef2..a5a3cdba47f3 100644
> > >> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> > >> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > >> @@ -3834,6 +3834,36 @@ apss_tpdm2_out: endpoint {
> > >>  			};
> > >>  		};
> > >>  
> > >> +		sdhc: mmc@87c4000 {
> > >> +			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
> > >> +			reg = <0x0 0x087c4000 0x0 0x1000>;
> > >> +
> > >> +			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> > >> +				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
> > >> +			interrupt-names = "hc_irq", "pwr_irq";
> > >> +
> > >> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> > >> +				 <&gcc GCC_SDCC1_APPS_CLK>;
> > >> +			clock-names = "iface", "core";
> > >> +
> > >> +			interconnects = <&aggre1_noc MASTER_SDC 0 &mc_virt SLAVE_EBI1 0>,
> > >> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDC1 0>;
> > >> +			interconnect-names = "sdhc-ddr", "cpu-sdhc";
> > >> +
> > >> +			iommus = <&apps_smmu 0x0 0x0>;
> > >> +			dma-coherent;
> > >> +
> > >> +			resets = <&gcc GCC_SDCC1_BCR>;
> > >> +
> > >> +			no-sdio;
> > >> +			no-mmc;
> > >> +			bus-width = <4>;
> > > 
> > > This is the board configuration, it should be defined in the EVK DTS.
> > 
> > Unless the controller is actually incapable of doing non-SDCards
> > 
> > But from the limited information I can find, this one should be able
> > to do both
> > 
> 
> It’s doable, but the bus width differs when this controller is used for
> eMMC, which is supported on the Mezz board. So, it’s cleaner to define
> only what’s needed for each specific usecase on the board.

`git grep no-sdio arch/arm64/boot/dts/qcom/` shows that we have those
properties inside the board DT. I don't see a reason to deviate.

-- 
With best wishes
Dmitry

