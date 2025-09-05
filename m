Return-Path: <linux-arm-msm+bounces-72293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B46C7B4596C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA5C618919C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 13:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E335352FE7;
	Fri,  5 Sep 2025 13:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sk8wWwLY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7929E353368
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 13:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757079896; cv=none; b=rjpUQFDmvCI+cS8GFnsbTIfqt0feUysbqpIBo3Yon2I6c/eTbDJiMSKJWLpUhSj2Kbmal6PLmwPTREGjNQJHlXfkiceS6yVwX1V5E8AD5hpOwk3cyuv5NPbjO2HEkrAlJy7ODa4SU+zjLZTQXLUG1K0WCZraNPtwP0+h9pmp/Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757079896; c=relaxed/simple;
	bh=+mpyX9Og8aI2yg1J7ZFrWaBz9IJchiYAHonQj1EnHfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuAQLnSvKtJN6yhoOXlC4pNtvb3D4qo4GaRChioivLAchgpIilGfN1SbRrotEF3gtS3+2O7V26ZFV8G/hGp5bGWSlqzqA72t/YhJxK0nph0wLeMiM7/Jr+X40U1QU0P0fY7owCHluRnEQxJgFfPwNGDMWdxmMtbX50xvOJmEAAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sk8wWwLY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856fZO6032388
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 13:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2zKvsgCGnbfbtTBnulsiawiQ/4EzwqzyBuLEYUqo6M=; b=Sk8wWwLYQeKcpOfl
	cRcYHlh7C9bBOynUVS9GO1QdJmwRA4sV9fab0L/DGaknVyzkgVm9td3CMBtWAbRD
	EBIUquW9fFk0OidquP7a/1wvNkCIgXulmsz4J9d6G57Qe/WSooDeU2j/zusegx71
	qwMiOUbQJEXRZOy62TyzQj0WqGC132D/kY9snRfLdUvid230RuwcPGwRVcg6fR5i
	5jMlEdkONjHkKUszbt/8Hd8DXQUVQx5WMMNq6ZO1OrFDGkGh75rk/exCs8OIS71Q
	ySHR070bWvV8xafoND0wBbH/sY/s3hzxKuvyvJ/I4f39MT3PQsuMrDF5UY4dt5Ml
	S6f/bw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpkedw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 13:44:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-71ffd145fa9so53517736d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 06:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079891; x=1757684691;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2zKvsgCGnbfbtTBnulsiawiQ/4EzwqzyBuLEYUqo6M=;
        b=r9QIkxHkUoyAceuM7OHltEVS4nJI04ie2IY07Og8lA13xlTo7FQQNXlnxS97oy/THP
         SK2sh3+M588zxnnzaWBmGCLgoGChWi9YmRdePHo9dNLnkNpdvNgS+rGXX9KljV944CXV
         6hbn85CINuLdK4x44xllgp5s/4PtKONEpjc31psOksZoLaDjcmcsgfUMm867ql3vkea8
         1Nb4Jmx194S16ZL5koUMBojY6fMVoFRAhmTW1P7nOdk05VH3ixtr3FwPNlfyq6fntCi0
         8ydeMPtJqwSmAq2cAUoSxtA43gEDGPqrk9nLz2LnP+ju8bHUWsX1IVn93anr9lY5jaYW
         2Hiw==
X-Forwarded-Encrypted: i=1; AJvYcCW1veCcSsdtdTopxSthENpDqgF+zdSzdsEsUWe19UKG7N36ho+LUzFxI+juqaIvTuoqkk1bshQVl0Ldv9lp@vger.kernel.org
X-Gm-Message-State: AOJu0YyE1pPloKWKPr/4fp0IPOCOn/s9oZN3ueUqzyui7a+f99SABN4B
	NFh7RXBirwOC1TEbKhZc3ug6qWONLKJ/M4tyIKw6Et8Wyc2JASQ/uln87NIDjh5DBPG8Nwt1aAf
	P8VQH6W1VnIsGI+hmoFlH5Nwq0OSGKq34YWD9Ux52mVzVyFmPDIkpSW6rMUuMOXn9t8DQ
X-Gm-Gg: ASbGncuTG0EHPHZBOesFZcUe5XjO1L1EopxvZ81LMP/v2+MrXREkOU9GLSfGbrUjytY
	E6IUW96/2A/EsIe4tCCm0PeIJsnr1J0sn4tWX4IvkDGlUIxQI6NmkNnljZ8s06tkWuePp120x2T
	4SR9Mn0b6AYATseYLRfU4RIgRnxPEmSwVTcoZGSyl45fFa9OJvE4dTYr1zZf3WiLmOV3tE+9qoL
	1Viz5YW6CtfqDFe5VhWT7MUoQeTnvM9Jbs5wOfMhdF2215FdxBJ9SvprnfjB4GOItmozJulzF61
	SxknpJBRuuRFbL+zGBNluAXiakf3sS7mkLvOWKNIc4Fz+MR3swZuOk43pn9yapx0BXQa2mVwI9y
	OgEDddyi2UbYJhWXsSl0UNhDUpZu6nlL5wOcva/CFJ/u+/kFYbcJh
X-Received: by 2002:a05:6214:3a03:b0:728:854:6c5d with SMTP id 6a1803df08f44-7280854734cmr82649036d6.40.1757079891313;
        Fri, 05 Sep 2025 06:44:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEysaH2r+sDH1VYSbBfUlmUfjVqBsoj0EWYtUbiy6ntQYp2Fs9xV0PFRVXB9rLnJ9AW0Z0rlg==
X-Received: by 2002:a05:6214:3a03:b0:728:854:6c5d with SMTP id 6a1803df08f44-7280854734cmr82648586d6.40.1757079890632;
        Fri, 05 Sep 2025 06:44:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad11f25sm1749779e87.115.2025.09.05.06.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:44:49 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:44:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
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
Message-ID: <zw6o6nxczrzz3dkreq2nuxalbrlv7jmra2hs3pljew7xnbuepo@b6rs47vnnctx>
References: <20250826-lemans-evk-bu-v1-2-08016e0d3ce5@oss.qualcomm.com>
 <rxd4js6hb5ccejge2i2fp2syqlzdghqs75hb5ufqrhvpwubjyz@zwumzc7wphjx>
 <c82d44af-d107-4e84-b5ae-eeb624bc03af@oss.qualcomm.com>
 <aLhssUQa7tvUfu2j@hu-wasimn-hyd.qualcomm.com>
 <tqm4sxoya3hue7mof3uqo4nu2b77ionmxi65ewfxtjouvn5xlt@d6ala2j2msbn>
 <3b691f3a-633c-4a7f-bc38-a9c464d83fe1@oss.qualcomm.com>
 <zofmya5h3yrz7wfcl4gozsmfjdeaixoir3zrk5kqpymbz5mkha@qxhj26jow5eh>
 <57ae28ea-85fd-4f8b-8e74-1efba33f0cd2@oss.qualcomm.com>
 <xausmwmh6ze5374eukv6pcmwe3lv4qun73pcszd3aqgjwm75u6@h3exsqf4dsfv>
 <53aac104-76fb-42b8-9e0d-0e8a3f59b2da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53aac104-76fb-42b8-9e0d-0e8a3f59b2da@oss.qualcomm.com>
X-Proofpoint-GUID: 1pCdMy0Uwd1Bs8iSZkRvFwWNpE5lDsol
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bae954 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mUbd499wupVbqrUIRmUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1pCdMy0Uwd1Bs8iSZkRvFwWNpE5lDsol
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX/OfWr8EbnBBg
 dAh86vVoauy0Ea7J2QI122lZ2d4uAYk/lTq89xhBAe1Zid4XUkPLAF0PKcrYQl+Ksq0sWXrxY9o
 RhPfReVWCoAB7ttG/Uuf7kK2zL5PrdlPNuZwH6BRY8/C0iZicekDkAn813G9vmDDCFdFqHGPwJS
 N/aIwEVlM/JOd6A0uZdvB9C5a/S3E92zRAPsSx+GAa8FzYtZ7rVfAtkFR8H7pDp/KP42R5KU0+P
 WpymZMhGCoKwnvFj5tv/0aHPthFO+c5BsWdzNTswJ9Sru9BoPDULrw2k82gzgCHi/Gm6Bkqhwjm
 Wv93KRqvskKhc3nH8sQocgW8fFam6q72tgMp+EQxCnRaSMKXnnxmO0gx8XMh5xM3MKNrCbIqYqo
 n0QMnpDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On Fri, Sep 05, 2025 at 02:04:47PM +0200, Konrad Dybcio wrote:
> On 9/5/25 1:45 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 05, 2025 at 01:14:29PM +0200, Konrad Dybcio wrote:
> >> On 9/4/25 7:32 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Sep 04, 2025 at 04:34:05PM +0200, Konrad Dybcio wrote:
> >>>> On 9/4/25 3:35 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, Sep 03, 2025 at 09:58:33PM +0530, Wasim Nazir wrote:
> >>>>>> On Wed, Sep 03, 2025 at 06:12:59PM +0200, Konrad Dybcio wrote:
> >>>>>>> On 8/27/25 3:20 AM, Dmitry Baryshkov wrote:
> >>>>>>>> On Tue, Aug 26, 2025 at 11:51:01PM +0530, Wasim Nazir wrote:
> >>>>>>>>> From: Monish Chunara <quic_mchunara@quicinc.com>
> >>>>>>>>>
> >>>>>>>>> Introduce the SDHC v5 controller node for the Lemans platform.
> >>>>>>>>> This controller supports either eMMC or SD-card, but only one
> >>>>>>>>> can be active at a time. SD-card is the preferred configuration
> >>>>>>>>> on Lemans targets, so describe this controller.
> >>>>>>>>>
> >>>>>>>>> Define the SDC interface pins including clk, cmd, and data lines
> >>>>>>>>> to enable proper communication with the SDHC controller.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> >>>>>>>>> Co-developed-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> >>>>>>>>> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> >>>>>>>>> ---
> >>>>>>>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 70 ++++++++++++++++++++++++++++++++++++
> >>>>>>>>>  1 file changed, 70 insertions(+)
> >>>>>>>>>
> >>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>>>>>>>> index 99a566b42ef2..a5a3cdba47f3 100644
> >>>>>>>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>>>>>>>> @@ -3834,6 +3834,36 @@ apss_tpdm2_out: endpoint {
> >>>>>>>>>  			};
> >>>>>>>>>  		};
> >>>>>>>>>  
> >>>>>>>>> +		sdhc: mmc@87c4000 {
> >>>>>>>>> +			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
> >>>>>>>>> +			reg = <0x0 0x087c4000 0x0 0x1000>;
> >>>>>>>>> +
> >>>>>>>>> +			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> >>>>>>>>> +				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
> >>>>>>>>> +			interrupt-names = "hc_irq", "pwr_irq";
> >>>>>>>>> +
> >>>>>>>>> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> >>>>>>>>> +				 <&gcc GCC_SDCC1_APPS_CLK>;
> >>>>>>>>> +			clock-names = "iface", "core";
> >>>>>>>>> +
> >>>>>>>>> +			interconnects = <&aggre1_noc MASTER_SDC 0 &mc_virt SLAVE_EBI1 0>,
> >>>>>>>>> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDC1 0>;
> >>>>>>>>> +			interconnect-names = "sdhc-ddr", "cpu-sdhc";
> >>>>>>>>> +
> >>>>>>>>> +			iommus = <&apps_smmu 0x0 0x0>;
> >>>>>>>>> +			dma-coherent;
> >>>>>>>>> +
> >>>>>>>>> +			resets = <&gcc GCC_SDCC1_BCR>;
> >>>>>>>>> +
> >>>>>>>>> +			no-sdio;
> >>>>>>>>> +			no-mmc;
> >>>>>>>>> +			bus-width = <4>;
> >>>>>>>>
> >>>>>>>> This is the board configuration, it should be defined in the EVK DTS.
> >>>>>>>
> >>>>>>> Unless the controller is actually incapable of doing non-SDCards
> >>>>>>>
> >>>>>>> But from the limited information I can find, this one should be able
> >>>>>>> to do both
> >>>>>>>
> >>>>>>
> >>>>>> It’s doable, but the bus width differs when this controller is used for
> >>>>>> eMMC, which is supported on the Mezz board. So, it’s cleaner to define
> >>>>>> only what’s needed for each specific usecase on the board.
> >>>>>
> >>>>> `git grep no-sdio arch/arm64/boot/dts/qcom/` shows that we have those
> >>>>> properties inside the board DT. I don't see a reason to deviate.
> >>>>
> >>>> Just to make sure we're clear
> >>>>
> >>>> I want the author to keep bus-width in SoC dt and move the other
> >>>> properties to the board dt
> >>>
> >>> I think bus-width is also a property of the board. In the end, it's a
> >>> question of schematics whether we route 1 wire or all 4 wires. git-log
> >>> shows that bus-width is being sent in both files (and probalby we should
> >>> sort that out).
> >>
> >> Actually this is the controller capability, so if it can do 8, it should
> >> be 8 and the MMC core will do whatever it pleases (the not-super-sure
> >> docs that I have say 8 for this platform)
> > 
> > Isn't it a physical width of the bus between the controller and the slot
> > or eMMC chip?
> 
> No, that's matched against reported (sd/mmc) card capabilities IIUC

What if both host and the card support 4 bits bus (normal SD card), but
board has only one data wire?

-- 
With best wishes
Dmitry

