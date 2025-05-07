Return-Path: <linux-arm-msm+bounces-57179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DED9AAE689
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 18:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3834D505B1D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7E028BABD;
	Wed,  7 May 2025 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPkq35zO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD8828BAA9
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 16:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634873; cv=none; b=bjoMkOdPsPoSl9NXJZpVFNkN67mNBzzpUY0jqhGprtjU3apA4s4okIU4X424f/AiMT+MvPtH06lBaiMKza+s+4UaO6Su5/ukaX2YgnHjhvMQVfqD2gd1z6m2gfZ4FSdSHlVoPuvUYPl61FdWEh2lmBBgTxF2KdeGVobYIjRaoVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634873; c=relaxed/simple;
	bh=4CPRvqP9o3Wz9Yk/8RkLaScl5LuWpsRDZZF+CLPFlN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bc149GNX2f1AElTWsocKNaJb+xIVZNP/X2lRg/6Xovz0ZAcBQ5PwoBFDCrkae2iEPjdxB8swIkNTSAquuhILAow22lTxSN+F3fGuaTjXCvocbRbPcvy7AEMW6hCJ0LP0vGOMWklKmg1Tg/8qPL7x5mu8TJ8bLYMcI6D/CJlHqSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPkq35zO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547B5Ppo019003
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 May 2025 15:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sCssKQwqlkZybFzzJZnS5cDS
	IKfik9hOyKrvkleK4eY=; b=EPkq35zO6ueuQcbFY7Px3KxAZJumYb2SgJYVMIQG
	QOioTsVercQ9Au6rONc5DUjOCZRprRLhxNKz3eMeLFu2GH2boF1onBY7bAz9MkiG
	Y2DGVLDXvhDEPOCOGzZB+lpfNFOkRvIE5/xsJ4tyCuOvp380xcEbaPii4Z6NoGze
	pXm+AeCpkNvWQ+sU0J1HHA/NFSQi10WWQAekdRujOu96+FDISDMgYl0v1MY+v1kl
	e9sn9SIYmj9YESZxEhnWUkSrBXXkaG5BxQGNS16Zt4bG2IWfmjnjXfXR/tFdutke
	d3jCuxNW0I4J+t4Yl1W2cCBOpv+rmQr315g08EoCtE8Mcg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg6727-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 15:48:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e91b1ddb51so1247076d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 08:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632938; x=1747237738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCssKQwqlkZybFzzJZnS5cDSIKfik9hOyKrvkleK4eY=;
        b=v/eVDxBu9GJFjfXENdXDsncSPYlPnRt4HeeJI8qlbTyDNMQyV2wWbgAzwhDkwcwd6S
         e9Se52n69quq8TreAF4LE2eI5G2k1Lj/7zoy1dZ0EOgyzyODQZG5q6QCEqE1i10hcJdu
         245/GFwPFJpxtNzVKKlA5n8NA0d3ns6bNsy+AC1wpZVstJgbL3O6aUs7PbytfSvpxUkf
         ilWdNsGT1e8Rw81l+K0tWfyqTKTtzllI41O2fmGPO/RzNvIpQ4kvo5oS1spvjKugk/lm
         uMF6lXRr/izTZlY0EiTESD+ZyQmWrKywD4lXQkXr+DWrDgNkk9swgQrpJCDZF9HdpW1G
         djqQ==
X-Gm-Message-State: AOJu0YxjhfBKaNruSS+62YpY08rKSimlTJMvJDDzUk2f//xX7nYTvcry
	nvy7yMsafrGwv25I4/pk7+EfK31FZMp3+Ia0y/KDlhZL1JofMK0AljxlEFPqJtQT8NpRUTGhEe+
	/73eWd/KIDb9QuLhXVfpVVvqU+NFyTeYPoZ6byTI6IM54L0DPyHcBEA7jQY+b3MsV
X-Gm-Gg: ASbGncstpUKMJkMPlXs3YvDsK/jikpjK5/4c/fsIZTAWAdK8d6Io/shS/4oh/i+OYcT
	4sUuJ9wdBIOobhuPN+nR5m+V4fT1a+alE2IPhZa20tbgdgdW+SmCunt5tMlBLs0TgK8Cr8bGPUj
	hf+PfKU1FsHWolt3lEJN0Yik4M6pa872blrKEEh81XYb9/eTtZM6z6s5fpZaIQsl4Gx78DTSI3J
	Si8Dza71XavYrxeUXS5n0KBs8cQcnMlVrzYWWeRuyoxRmPheyvTYJkZ9NxdlVlI9AM10D/dxi7Y
	UG7HEYfwjGAYMha5663d8mg6l0MkUTKuIE5xYab7bClUpguEBEMrBhUrIIDx93GyA36BB9IXekY
	=
X-Received: by 2002:ad4:574c:0:b0:6f4:f1aa:bdc9 with SMTP id 6a1803df08f44-6f542a22256mr63115176d6.7.1746632938283;
        Wed, 07 May 2025 08:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpqKBqvVCtmEDGnqQSDIg99DPZFwCrSN2UhDVL/02dWzadQzFLThTPNaoR0pTeP+O9HpyfqQ==
X-Received: by 2002:ad4:574c:0:b0:6f4:f1aa:bdc9 with SMTP id 6a1803df08f44-6f542a22256mr63114676d6.7.1746632937860;
        Wed, 07 May 2025 08:48:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029306984sm22747811fa.58.2025.05.07.08.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:48:56 -0700 (PDT)
Date: Wed, 7 May 2025 18:48:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <m6qrmvku6anw6ajg2qdbusodjxesfusi7w2pogvvz5lj5vfyx2@mcit7fy5w6ij>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
 <20250505094245.2660750-3-quic_amakhija@quicinc.com>
 <grwlmrgi5cfv3jtuki57ug7gsqykpwdf2to2l7di6glfxtb7vz@6id6cpfkrbuh>
 <88b139c4-0a35-4c9e-9993-573fede29b71@quicinc.com>
 <ip2phi56u4yof376t5a5mqhvo3x4oo4blcnirwc6w7eancpm7i@ofcgyfcxdmre>
 <bd136800-8ef5-4597-b918-41b9f97db14f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd136800-8ef5-4597-b918-41b9f97db14f@quicinc.com>
X-Proofpoint-ORIG-GUID: y3QODvjHvrZP1isSK6eFF_M-RFNGMxHp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE0OCBTYWx0ZWRfX/l8e6Lo3nmrr
 H9qXdhXZqH7vLSDXjSbL0iErDlD7AfxMSZpD56mO784c46uLHF1daLUjOpJ2/suJY8kLhtxEGXr
 u6W7VNyXW1pHNHWaT5AJaEO3vDTk7YvXm7lNpQTtiTCdGPDLATYs26ej1wDPEYdFvCCtkY0813s
 2BhsHHG5IqeGjWkFRzWXoJh3Y/MyWK+O+rGN1gHsF92DcNSn2B33GSEPo0DTQXXELTWpzEfH1cn
 CdMH9k4ODQ8TcC5F+M9qXQqejocQHJcM4cBTscWujQmkcSb12iDViUz00N1XjiIHkDFfg94dtpI
 Vvsroyb3c/ZaRV/H+pL9zpAPAj0evhI+2/N1PtdE+AgGAK2uxoyVZQ85wu1Xuiuy5Iuh8fyMTeb
 UsyAMdTkavsfxX2cdeYX0n4+AekhG54K5oAlJH5mBjkBZ8FLERDVnKQ56od3yoFDmqFevDFO
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=681b80eb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=hnXmAr2WX_wFmnp3NVMA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: y3QODvjHvrZP1isSK6eFF_M-RFNGMxHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_05,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070148

On Wed, May 07, 2025 at 06:27:54PM +0530, Ayushi Makhija wrote:
> On 5/6/2025 5:58 PM, Dmitry Baryshkov wrote:
> > On Tue, May 06, 2025 at 05:42:50PM +0530, Ayushi Makhija wrote:
> >> Hi Dmitry,
> >>
> >> On 5/5/2025 3:32 PM, Dmitry Baryshkov wrote:
> >>> On Mon, May 05, 2025 at 03:12:41PM +0530, Ayushi Makhija wrote:
> >>>> Add anx7625 DSI to DP bridge device nodes.
> >>>>
> >>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 183 +++++++++++++++++++++
> >>>>  1 file changed, 183 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>>> index 175f8b1e3b2d..de14f3ea8835 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>>> @@ -28,6 +28,15 @@ chosen {
> >>>>  		stdout-path = "serial0:115200n8";
> >>>>  	};
> >>>>  
> >>>> +	vph_pwr: vph-pwr-regulator {
> >>>> +		compatible = "regulator-fixed";
> >>>> +		regulator-name = "vph_pwr";
> >>>> +		regulator-min-microvolt = <12000000>;
> >>>> +		regulator-max-microvolt = <12000000>;
> >>>
> >>> 12 V, if my eyes don't deceive me.
> >>
> >> Yes, it's 12V. According to the chipset's power grid, the VPH rail is rated at 12 volts.
> >> That's significantly higher than what we typically see on mobile platforms. I guess,
> >> this is due to the SA8775P Ride SX being designed for automotive applications, where higher voltage levels are required.
> >>
> >>>
> >>>> +		regulator-always-on;
> >>>> +		regulator-boot-on;
> >>>> +	};
> >>>> +
> >>>
> >>> [...]
> >>>
> >>>> +
> >>>> +			bridge@58 {
> >>>> +				compatible = "analogix,anx7625";
> >>>> +				reg = <0x58>;
> >>>> +				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
> >>>> +				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
> >>>> +				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
> >>>> +				vdd10-supply = <&vph_pwr>;
> >>>> +				vdd18-supply = <&vph_pwr>;
> >>>> +				vdd33-supply = <&vph_pwr>;
> >>>
> >>> Here you are saying that 1.0V, 1.8V and 3.3V pins are powered on by 12V
> >>> supply. I wonder how the board doesn't trigger all fire alarms in the
> >>> building.
> >>>
> >>
> >> Let me try to explain the connections from the schematics.
> >>
> >> In the SA8775P RIDE SX platform, the ANX bridge supplies are connected from the below sources:
> >>
> >> 1) AVDD1P8 is sourced from the `VREG_1P8` of the backplane card.
> >> 2) AVDD3P0 is sourced from the `VREG_3P0` of the backplane card.
> >> 3) AVDD1P0 is sourced from the TPS74801 LDO voltage regulator that has `VREG_1P8` connected to
> >>    VIN & EN lines, and `VREG_3P0` connected to BIAS line.
> >>  
> >> The `VREG_1P8` is sourced from a buck converter TPS54618CQRTERQ1 that is using 
> >> `VREG_5P0` as VIN and EN_VR1P8_M3P3 as EN signal. 
> >> Where the `EN_VR1P8_M3P3` is an output signal from SAK-TC397XX-256F300S BD micro-controller.
> >>  
> >> Similarly, the `VREG_1P3` and `VREG_5P0` are sourced from another buck converter LM5143QRWGRQ1
> >> that is using `VREG_12P0` as VIN and `EN_VR5P0_M3P3` as EN signal.
> >> Where the EN_VR5P0_M3P3 is an output from the same micro-controller.
> >>  
> >> Combining above details, all three ANX bridge supplies are getting enabled by `VREG_12P0` supply,
> >> `EN_VR1P8_M3P3` and `EN_VR5P0_M3P3` signals once the SOC is out of reset.
> >>  
> >> The `VREG_12P0` is directly sourced from `VBATT_IN`.
> >>  
> >> Since, there is no SW control for ANX bridge supplies and they are getting enabled
> >> once the SOC is out of reset, I have used vph-pwr-regulator dummy regulator.
> >> I am not sure if it's the right way to handle above scenario. Please let me know if there is other way to do the same.
> > 
> > Add these regulators as fixed ones, describing the power grid. Consult
> > other board files if you are unsure. RB3, RB5, HDKs - all these boards
> > have fixed-regulators for the grid.
> > 
> 
> Hi Dmirty,
> 
> After referring the RB3, RB5, HDKs boards example for fixed regulator.
> 

[...]

> 
> Let me know, Which way we need to define the our anx7625 bridge supplies.

Please describe the power grid. As accurate as seems logical for you. I
won't give you a single 'this is correct' here, but generally I'd prefer
having all vin-supply properly set. Please use grid names from the
schematics in order to describe the regulators (instead of inventing
them).

Hope this helps. Anyway, it's easier to discuss the code once you post
something, so I'm looking forward to seeing the patch.

-- 
With best wishes
Dmitry

