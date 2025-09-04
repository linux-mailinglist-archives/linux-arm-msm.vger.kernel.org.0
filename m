Return-Path: <linux-arm-msm+bounces-72091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3E5B4409E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 17:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EAD67A5FD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 15:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBBB23D7EE;
	Thu,  4 Sep 2025 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JykgU5gr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84F6134A8
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756999761; cv=none; b=FPb6BtSmeDosWQD8BK2QxoKmxjmVmwF5QnbEZ/U270qShmKOBsfOedtBgSbEoD1RiL1dASVjpkge+uLNnWumaOEKppR0sl1xAhug94BXXztYE3/zCE17IQpkkA400bMvhlv6vKhzJoe836MsgI6ge5wQp9OvLC3eofFswQxWBKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756999761; c=relaxed/simple;
	bh=EUUOJm8+pqfJE0C02BV4F6cE3SBmlMX62RiOmXxnlyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RL+nh+seVAVkziSJC3CRb4lP42+mb7PDM0igW9UZgqLdNmxyLCQHItLW8YgA3SNTlTNI3mo5cZQyS1vNaouHNFF1xMDtYvExZYWRub64c67+qoQyWK4a+7jN92dodQR4gZl9dnnotGWWtzRrUo+QBsxu+p/sGGkAIXEMWwe3N+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JykgU5gr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XBwR014013
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 15:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aCKrmPJEFXGT0WYbXHZg3VTYOIhYkJFe7iTrbDkI7Yg=; b=JykgU5grP0LzChRS
	jo5fMTmzga1W8yeVxF9tViRBvkFXCJtHR7aVYgmLnoqxhr9ttxNTxlGbZsS4LdRN
	kpsDb53P3r3X5KkbWDFxac815aVm1cUa1fLkD+NMSL3FOGhM9YAkXrkyeUJ6g3r3
	go9383tqDVDZUo6MbK/JJTuRcmNg1ikvHWaGxgVpgdiWVZtxFlqnPTviuC+i6zOb
	orDfQhNzgKA3FudfFzcbgNh+zFlz7oubp3DMwkUV0jJ773Z7HdaX0J8xPyo1ow8k
	K3nxAlgQPa+EMv+QseXkgHtUGVQYJJTg5oHDfA744/Dzy+cff7TLAMoZHK2yoRJS
	uYvHtQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv843q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 15:29:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24ce3e62946so4003365ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 08:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999757; x=1757604557;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCKrmPJEFXGT0WYbXHZg3VTYOIhYkJFe7iTrbDkI7Yg=;
        b=cStNL3mxpaXeu/GiiSfjz8FQ94/9UrHUxrCHLKSmwLml5gdQLimXBTMC164Cpveh0u
         um/OU2aF7yE/wDBrwl+VyGZ3FtYD8YCyDEPyThID3IWMdwcqCT+k5l2ycOC4+6fHvcRE
         t1Ip+rN7kKtD9xrPuT2PX3hoKuyoLyzGHb8Ne3AKZiQuuLQf7D3RlgISTnK3YoUx3cJF
         ZEwfpR8ngKF8XZV1S18NbIYLSwgtM7/YTreCElbyOQk2O4ul+UOnRGgHz/eOaWvUBUf1
         pL88qs2aQY6mhCxk0POiNwdxO7rnc3lI+sk8FY8++qd5VHC8P1DNKGh2x0yN6Bznpm1m
         OTIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUfP0ZIvIHz3ubFuxNmpJuWul3fjdEM3EgVGXi6mrtyC9r4ZLYao9bqwu86IgK7Q5y0Js/tj92YeTNlFvB@vger.kernel.org
X-Gm-Message-State: AOJu0YyrwcQts/kXc9VURyaN6Rqf/XJ5vAMMqpUxV8QW0E6QoScanpCD
	JSEwVRANW3RqgPLXne2VzmXkXd0pjWwkXGtH9H3ccQ5z+RDa91NgiF17Xg0YUce4Wp+XgXAs31z
	hYe0BNuoaYPymz/jbYUsHnbW/WmDyuInvVXVks27qLMLo0kNHy2anPBkVMHaOMZ0uxE2E
X-Gm-Gg: ASbGncv421NV7MHLWCfrE3xi95BD/HpjwLQMx0dWjIbdbCMsZ1DomM5iBtPc7vv3kXw
	0W3f/h8zQA5OsVHCy1kBfCmpJXJewLaeTc8If84cQOVWKTUQnOJRHGOwh+VmNF/QKmsReCFaPpl
	nsEFslat0Bkwuu9i+2KKVIUWYINEeXHoSQaRndZ/MQzHJddE5sxEMfs4rBCGWyY6A2N3ioJ+GCv
	MS1/g0r6kHdzBxCPtC1MB8GWhP1OHmNIfacftqWxmt+ti1Foz9rRXTAeHTrrbThqYWRYOFA3bzZ
	M2xAqZy0HRI7jhWZLLJWS8GmlktC1SilpHE7gUYjxLMpALVXnnCkZUqQvbqHDhi4WCgn
X-Received: by 2002:a17:902:d4c1:b0:24c:92b5:2175 with SMTP id d9443c01a7336-24c92b5262fmr76676055ad.24.1756999757449;
        Thu, 04 Sep 2025 08:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4JhBNWdG2V+TxgIDesrLMeTY0t0q4ahoJ30jB1TKaWOy2/eOV1xvyNkelIVpDUVQxYmrVWg==
X-Received: by 2002:a17:902:d4c1:b0:24c:92b5:2175 with SMTP id d9443c01a7336-24c92b5262fmr76675745ad.24.1756999756970;
        Thu, 04 Sep 2025 08:29:16 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327c5fc5055sm22049502a91.14.2025.09.04.08.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:29:16 -0700 (PDT)
Date: Thu, 4 Sep 2025 20:59:09 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Message-ID: <aLmwRSROlgXxw3bI@hu-wasimn-hyd.qualcomm.com>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-2-08016e0d3ce5@oss.qualcomm.com>
 <rxd4js6hb5ccejge2i2fp2syqlzdghqs75hb5ufqrhvpwubjyz@zwumzc7wphjx>
 <c82d44af-d107-4e84-b5ae-eeb624bc03af@oss.qualcomm.com>
 <aLhssUQa7tvUfu2j@hu-wasimn-hyd.qualcomm.com>
 <tqm4sxoya3hue7mof3uqo4nu2b77ionmxi65ewfxtjouvn5xlt@d6ala2j2msbn>
 <3b691f3a-633c-4a7f-bc38-a9c464d83fe1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b691f3a-633c-4a7f-bc38-a9c464d83fe1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX51avA9eviDCq
 pHEC/Ifboh2IEA0AqTy+KE3iXM5Gtl4iLFfHBYfAvWXytAvflAwiQypawzt6YPChz2k0ehD/mfB
 8D5RNcCvRZVAQ3hPSAcwypnsWKdISlRAGLgRukTprAhj2HxP8uu7Vy0EVRVkBqeKVMeP2Ax+0Vq
 OOiNofVPcChjeT9GkQn+NwuFzWmQSxF7W9R2NcEkZv+5m8OZ3jPIv6ntASNLBcmfaOHZNLyhj4d
 BcLp3cEaG4S+f3iUpV3SBgskQDEG85FY0R/Gyy5FeHhmhZho8YY81Ao81Xthy8UhcgTMPh8Pp+K
 nU6+zyXrE9kOrqjrGhfNakDDvmf2eybCqSCjgjIPKWxaZxpv7HGuOdTPw2PZR3Kx5oxwyL4221J
 20gyXLRq
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b9b04e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=7jlciowUQMUDIi_Z8n8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: b2F9oZx4d_HwwSsrGQxjtkhHcJR-UvH2
X-Proofpoint-GUID: b2F9oZx4d_HwwSsrGQxjtkhHcJR-UvH2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On Thu, Sep 04, 2025 at 04:34:05PM +0200, Konrad Dybcio wrote:
> On 9/4/25 3:35 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 03, 2025 at 09:58:33PM +0530, Wasim Nazir wrote:
> >> On Wed, Sep 03, 2025 at 06:12:59PM +0200, Konrad Dybcio wrote:
> >>> On 8/27/25 3:20 AM, Dmitry Baryshkov wrote:
> >>>> On Tue, Aug 26, 2025 at 11:51:01PM +0530, Wasim Nazir wrote:
> >>>>> From: Monish Chunara <quic_mchunara@quicinc.com>
> >>>>>
> >>>>> Introduce the SDHC v5 controller node for the Lemans platform.
> >>>>> This controller supports either eMMC or SD-card, but only one
> >>>>> can be active at a time. SD-card is the preferred configuration
> >>>>> on Lemans targets, so describe this controller.
> >>>>>
> >>>>> Define the SDC interface pins including clk, cmd, and data lines
> >>>>> to enable proper communication with the SDHC controller.
> >>>>>
> >>>>> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> >>>>> Co-developed-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> >>>>> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> >>>>> ---
> >>>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 70 ++++++++++++++++++++++++++++++++++++
> >>>>>  1 file changed, 70 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>>>> index 99a566b42ef2..a5a3cdba47f3 100644
> >>>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>>>> @@ -3834,6 +3834,36 @@ apss_tpdm2_out: endpoint {
> >>>>>  			};
> >>>>>  		};
> >>>>>  
> >>>>> +		sdhc: mmc@87c4000 {
> >>>>> +			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
> >>>>> +			reg = <0x0 0x087c4000 0x0 0x1000>;
> >>>>> +
> >>>>> +			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> >>>>> +				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
> >>>>> +			interrupt-names = "hc_irq", "pwr_irq";
> >>>>> +
> >>>>> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> >>>>> +				 <&gcc GCC_SDCC1_APPS_CLK>;
> >>>>> +			clock-names = "iface", "core";
> >>>>> +
> >>>>> +			interconnects = <&aggre1_noc MASTER_SDC 0 &mc_virt SLAVE_EBI1 0>,
> >>>>> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDC1 0>;
> >>>>> +			interconnect-names = "sdhc-ddr", "cpu-sdhc";
> >>>>> +
> >>>>> +			iommus = <&apps_smmu 0x0 0x0>;
> >>>>> +			dma-coherent;
> >>>>> +
> >>>>> +			resets = <&gcc GCC_SDCC1_BCR>;
> >>>>> +
> >>>>> +			no-sdio;
> >>>>> +			no-mmc;
> >>>>> +			bus-width = <4>;
> >>>>
> >>>> This is the board configuration, it should be defined in the EVK DTS.
> >>>
> >>> Unless the controller is actually incapable of doing non-SDCards
> >>>
> >>> But from the limited information I can find, this one should be able
> >>> to do both
> >>>
> >>
> >> It’s doable, but the bus width differs when this controller is used for
> >> eMMC, which is supported on the Mezz board. So, it’s cleaner to define
> >> only what’s needed for each specific usecase on the board.
> > 
> > `git grep no-sdio arch/arm64/boot/dts/qcom/` shows that we have those
> > properties inside the board DT. I don't see a reason to deviate.
> 
> Just to make sure we're clear
> 
> I want the author to keep bus-width in SoC dt and move the other
> properties to the board dt
> 

I'll move the no-sdio and no-mmc properties to the board-specific device
tree file, and keep the bus-width configuration in the SoC-level file.


-- 
Regards,
Wasim

