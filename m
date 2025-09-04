Return-Path: <linux-arm-msm+bounces-71999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE3BB4361D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2640D160397
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 08:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2992D0C70;
	Thu,  4 Sep 2025 08:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jzWBWKeA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7B12C21EB
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756975256; cv=none; b=isxiv5VQLSJmD9QKe1mKV58ewEN38FTdjYqeYSh0HjQnS/xXXOAoYhoMHVh6mEDktdwMx1qSt+6lBz8qlVJBUAPkyGtB3itzZoA/T3gNKCE6Jm70IgqfyoDyC2XktE660I9dwxcpSNc4FR3FoLqKUB0N4loY7DCucZJj7SRHIXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756975256; c=relaxed/simple;
	bh=NeuaUx7smKmYtWJXPRDCSomZ5mneveiatz9Nf9EB2u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUDrbuHmGZJvRWHJFT3zu4a7uTttDcn4i3YiD7HC8NoXaZOexl0vSWJupMYUiCoj74Z4qCNL0i+S/gK5QmnYCwfVcLPvq+odvxzA2BLl36DYdI3v2TWBibl0LHeLKr3z4KhyAnjjU5+fdnngn7qKzQa423P5ZdBekZQL1/xAjN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jzWBWKeA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840XbDs005251
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 08:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LVRFBw8y4TYM0aV+IQrAzF1l
	KHpBMR6sAe/MnFd5W2o=; b=jzWBWKeAKpndbqbxCUK94/bpit/U2ASgLoaqpyKR
	iq6f2IvpOPsjCXSb4dOlBcfj0HZwmrKEwdm0pAmYAcMZ27rCGVNbaiuxqaeQmaRL
	ww8ynHlEYTgXkARIEA4SrublB4toxeQprTmMKC7HMajpw/Yb0zKDZUhn9nABOgO6
	mLcua/gsdL4g6Cmec5xbPZ3zW8xxv6jaHsCh+D9uGQ1PTM2onq/Yio7RC8T2RWoE
	9+Em7kGE84DrwvV2SQrW1LRy3acqFAgSRj5jl71LdKAJB5XA8HZZTapllwclTDVN
	063Vww36bMc/WHYy8tnHeg25lGfq66TuHLNqtx++ScIflw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjpsc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 08:40:53 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77250c660d3so920446b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 01:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756975252; x=1757580052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVRFBw8y4TYM0aV+IQrAzF1lKHpBMR6sAe/MnFd5W2o=;
        b=QTdzRPugGfEhnoy9JIdzRWHAqQDMsA/vhFCa4rGbmcXuCkXeThLDCFQtTDCsU9qWAG
         d9yqyZjDisWJAnb3W2jKUtP3jZyXa7sodAfEbz3y/MkzW2NN9kYbq2BzMEOkNhxI/n3n
         il9kun5WcMTH7KPNKSB6s0ZIPz/eLejcQCOnwDvkEek/XPkvO6A85EV2BCelr1OVcP+S
         G4H/uRD5alJyc8+VOrgoCKDHrzbIoUjscZyEzedrKx7Kvgquqkd5vL3WySvtYrMpnLaX
         545VjKpKpE/11GiWURcbpJqIoV/CRslNhdW8nb9CpaZ97eFC4ByW028Bg515l2VXv+Xj
         KJlg==
X-Forwarded-Encrypted: i=1; AJvYcCXG+5WzkfnjXavHPFiJzw1e2t8lSJeVnU2n2n+8qyezx76P3NdgENf0LDfoxyJhBmt+H+wOYcp+XiQlQS8e@vger.kernel.org
X-Gm-Message-State: AOJu0YwRHbHm508+e4LuE8fuMSPDJ2MyazIxGqqgq/G5cpv+7PC76tDR
	ccT1pn1Hb18GQpnQS/7rFXn4uPPi2TGp3gC2BxsVQeEqemmjVQmfFMemtVlkqFOdc7N1f5HoVVf
	buhuZ14seGY62GdwgW4VQAVb7Ft0aYukBfLmtYzKYdQ0n+dClbHC3GmjAksnTaNYcWWq/
X-Gm-Gg: ASbGnctksjBMq3P7gNdBuuIm0hpJSmAxDWPeCpIYVOujUL9ZuZv2b4/PgBHuvgZaXEl
	ZUsTESu12x54aRrscz2CXqChGF7pn1BI+6s7GwKl0kUC80AVFi9NLGRNmAtXWjxMaHGgg4ifhCW
	Qaaz0eriUJjsBnkCO1KMXEqEq4h9AYN02gJd/UwR0+3Gf+T3cu+RoXNuC0pI6LaDrdx+S3mu899
	7TlApNsEXdPQUXD2QwRqbWQmy0VY+XrPuWgWMNWcuUhThWN7Ws++KddkkCNyzwp255Krb4HUE/k
	hvs9tFRYD/NAixhWCopXbEnItxqFS3XjI6ZLmdwaK7BNbiPYxesknIvfEd5yGn1nnYyp
X-Received: by 2002:a05:6a21:8311:b0:245:fe25:7024 with SMTP id adf61e73a8af0-245fe257561mr7818359637.30.1756975251866;
        Thu, 04 Sep 2025 01:40:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHShG+ywVPwMMnN5ITlEBaV4t7zgpBVXXayaVZuxH1iz3KDcZhyTFEKIB2j/DH6XqeArvxfnw==
X-Received: by 2002:a05:6a21:8311:b0:245:fe25:7024 with SMTP id adf61e73a8af0-245fe257561mr7818320637.30.1756975251313;
        Thu, 04 Sep 2025 01:40:51 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f317ee7cfsm11700910a12.3.2025.09.04.01.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 01:40:50 -0700 (PDT)
Date: Thu, 4 Sep 2025 14:10:44 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>
Subject: Re: [PATCH v2 02/13] arm64: dts: qcom: lemans: Add SDHC controller
 and SDC pin configuration
Message-ID: <aLlQjAmEe795u+nF@hu-wasimn-hyd.qualcomm.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
 <20250903-lemans-evk-bu-v2-2-bfa381bf8ba2@oss.qualcomm.com>
 <8a963e12-1113-4604-b15f-a5867c4b5bbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a963e12-1113-4604-b15f-a5867c4b5bbf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b95095 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=k3xEAXBReI645-sCZUAA:9 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Thlf1dPdliBx9kKSgRs3DTVCiew3Nnl9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX+5V3dcTzOJhq
 6XyaNFy5nalVjNlHHM3pAgUCY+Ma159SNArcKC2AjD5+1y0r1Cy5e4RbwAlHtG08QsaSRM45mMV
 GnU3D77PP0imQiqWqfbjNLdNWU7PHYxf0kl/R7ByKBpZUuILfCCzTA5kHPtE+SvGpiImXEA6RNB
 vBDbxq1jorpyv8G7Jm93IGI7gGjDMxeiY+rzKLZVMBYKk/wyp6zkfS2J1vzSCW2+3eZYmsbyFfA
 RpXUK9J/igaCj9Sm0EbOyvoPzVBBGRnRVKnqsq0AFrEpS14uheTwkZAaMRDH0UeST1EMim6EFRw
 NVRgcn+JPXyR0Aqa+ZZr233zl1ZlIyXpDcdV4FIWnICNmPt4c3tZsH4kLP8nVCI2S0G5Oj4bLmv
 sv4AxQ4K
X-Proofpoint-ORIG-GUID: Thlf1dPdliBx9kKSgRs3DTVCiew3Nnl9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On Wed, Sep 03, 2025 at 05:48:40PM +0200, Konrad Dybcio wrote:
> On 9/3/25 1:47 PM, Wasim Nazir wrote:
> > From: Monish Chunara <quic_mchunara@quicinc.com>
> > 
> > Introduce the SDHC v5 controller node for the Lemans platform.
> > This controller supports either eMMC or SD-card, but only one
> > can be active at a time. SD-card is the preferred configuration
> > on Lemans targets, so describe this controller.
> > 
> > Define the SDC interface pins including clk, cmd, and data lines
> > to enable proper communication with the SDHC controller.
> > 
> > Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> > Co-developed-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans.dtsi | 91 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 91 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > index 99a566b42ef2..9e4709dce32b 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > @@ -3834,6 +3834,57 @@ apss_tpdm2_out: endpoint {
> >  			};
> >  		};
> >  
> > +		sdhc: mmc@87c4000 {
> > +			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
> > +			reg = <0x0 0x087c4000 0x0 0x1000>;
> > +
> > +			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "hc_irq", "pwr_irq";
> 
> 1 entry per line in xx-names too, please> +

Ack.

> > +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> > +				 <&gcc GCC_SDCC1_APPS_CLK>;
> > +			clock-names = "iface", "core";
> > +
> > +			interconnects = <&aggre1_noc MASTER_SDC 0 &mc_virt SLAVE_EBI1 0>,
> > +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDC1 0>;
> 
> QCOM_ICC_TAG_ALWAYS for the first path, both endpoints
> QCOM_ICC_TAG_ACTIVE_ONLY for the second one

Ack.

> 
> [...]
> 
> > +
> > +				data-pins {
> > +					pins = "sdc1_data";
> > +					bias-pull-up;
> 
> Please put bias properties below drive-strength for consistency
> 

Ack.

> Konrad

-- 
Regards,
Wasim

