Return-Path: <linux-arm-msm+bounces-56944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97698AAC446
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 14:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00D37B20D64
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 12:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EBC280016;
	Tue,  6 May 2025 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h9GjvRVV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E1D27FB16
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 12:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534504; cv=none; b=pCjDsAtQyYpDI1BZi5Z+c3ff/CQ1wnqb1eGEeWM2u/89CDtiVAqn9bh9xW6lpkp82fs+B74qGMdc+S1lQUnhMX5Y1grALTfmPmgkIwvg6w6EN8GYCVxJvI2GRy8cLuaTc4uWxJFCFh7l3q35ZVqcyWruEEmmKMO1x66QptNhrnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534504; c=relaxed/simple;
	bh=GwHJfPYBAa02n8mtCLeKpWVcI6hgBB3uCvSSN9RyeAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpFXfzrgo/a0XnYO8hgNPcw7u1pZTqbsekkTCqfI3LM4ImWcce8wblcw9V0iLb8w7JPubT8vMgB3fGzlh00lWAWjJKPr0W9f5SLyPxx9opkk9NmujAHx5Mbd3d1kCiUzK4zp6hYIdXGLPD4AofbtcOm6w2ltMpKoev/Z/P17sCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9GjvRVV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5467If6h015837
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 May 2025 12:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pMr0pQfkZDzwyRYDfelKCIMW
	JikVyJ1ChOSk0SMsQ3g=; b=h9GjvRVVU3uo5NAzoCkH1M4/efx7Le5pKqoBAWlk
	KHjiHTu62y0vboD821I/hC6aTrCPPvBR53r38EklDXJxsYmfH6k7WI97CXM2Uk4n
	tNPKARH6t5lRAR6WR4LBMMfe37auRuXRMbzDL0xq3l+W0fWW1/h+FLfWIVs8c9kg
	hmuegPyawh6/XZQ2VG6tWpMByv8cjzRevFOkCkfTQdhIq6FeGmZOyMvFbuPS6krR
	eq8wdEoyJQ9F0xf70/HBpQ3qezI6DNksuxvP07GJXUXKCweCD5AKpM8SEhVW6f9q
	MlA+fn2Z0NiJHl1tBwqrghWal8q9ilBgFOoifs+Zu3uhSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fdwtrxk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 12:28:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47b36edcdb1so112029461cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 05:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746534500; x=1747139300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMr0pQfkZDzwyRYDfelKCIMWJikVyJ1ChOSk0SMsQ3g=;
        b=FYaUxfEv6ajuK5g93wlrDmnLCX/W25xfed7zaC3DR0EpQejbrgxHE1tK3UyjNjB3QO
         iHjoX1ikTKpHEefipuhFeUbYnLekhkSkAyylbV7k1lqMg4U/oYr/m1dJZGG1ahuLPzKa
         tBbeZBtePims4FDV7QfHjoW6iSiJSX5DXygsFFSo90kgxP3jDdU+VF+TTLKCbEIA2P6x
         w3lUe75oyVe8l5eo5rG7nWadG6KOBFr2Ya+oS+mQi2ydPwiNn31XsVTDkIBVPDT4c4FT
         hl+Sy7T/KdjJd55JvbXzpEnEWy/2SiQqRYfqLbFAwOPW9lE3/qCSj7NAO7V4q9A+6mDt
         5GTQ==
X-Gm-Message-State: AOJu0Ywjn/qSd3FwNDgaBKnkiTaQ0qDMAV2ptvCqX55zD+Cet+aSotm+
	9hvYbqU5Xz1tZ3KlqieZ+4sEmUqiDG3KTurJWbi0FDxfCxzZWa3QTu7jIsBp7UudeQtUxZBx5nC
	m14NhyWNKNR5GqtGx6kKP5WNmYi0S3wI0svxH+gZfm1jh4Xo00eQNxXGf/CoYU5Te
X-Gm-Gg: ASbGncte3C3Vp5FUfdXlU1FZfjSq1ypXQa5X5kd1AMgeahxtPQa2S5ilbXYiBP4XVRK
	xpn7SWozr8cFro1A4oIeEVRlC4HmxFCxkqxxlGQTkcppvySeMkiQUB4+XXGH/zy13/PsNJC/Ivu
	4KDOSxa1ngcAvXdt6EVNg7WQ/NVZYbOJUMcutPrdJVNnppYA8IqG9rsYEL62wtH0+QPpuqpGNtC
	DDowXyGROoSGVqifQdY0J0z5A7i0fHW7iMwcPQmqI1G0LNJ1PG3LMSwvDHleTKHFU0IpEJ7N5HL
	c2OvXMCBxQDADilLgjOQ9qHofJC6utzXvskh3Vw+GqaZqNNStux1tNA9l2XgnBV1Z6t7HwRlG3o
	=
X-Received: by 2002:a05:622a:2d5:b0:48c:51f9:5dff with SMTP id d75a77b69052e-48dfeff471fmr207623731cf.4.1746534500246;
        Tue, 06 May 2025 05:28:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVRzpe5kZ/C7fSbCX4k6D/yogiK3rg+EtVHsuYgNUWoJdLKfUJJzjORpHHDyQ+IzfzB/DYpg==
X-Received: by 2002:a05:622a:2d5:b0:48c:51f9:5dff with SMTP id d75a77b69052e-48dfeff471fmr207623051cf.4.1746534499730;
        Tue, 06 May 2025 05:28:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94edff7sm2006256e87.137.2025.05.06.05.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:28:18 -0700 (PDT)
Date: Tue, 6 May 2025 15:28:17 +0300
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
Message-ID: <ip2phi56u4yof376t5a5mqhvo3x4oo4blcnirwc6w7eancpm7i@ofcgyfcxdmre>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
 <20250505094245.2660750-3-quic_amakhija@quicinc.com>
 <grwlmrgi5cfv3jtuki57ug7gsqykpwdf2to2l7di6glfxtb7vz@6id6cpfkrbuh>
 <88b139c4-0a35-4c9e-9993-573fede29b71@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88b139c4-0a35-4c9e-9993-573fede29b71@quicinc.com>
X-Authority-Analysis: v=2.4 cv=VPPdn8PX c=1 sm=1 tr=0 ts=681a0065 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mgRI5fNFQDWczPtYMtsA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RiuM8HM30LuSUT9-eyaciQp6rkCxfXmP
X-Proofpoint-ORIG-GUID: RiuM8HM30LuSUT9-eyaciQp6rkCxfXmP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEyMCBTYWx0ZWRfX5qvx3RJkw9yJ
 wmpUlB3Mxe1ewvwrCTNSDiRao5YUlcNHcv9PdsEneptKPyT+hgPrDlRaaAiLujAxxYrPN3q7se5
 KQD+opsXV4dnSRw6x0zRUB9u6ab76NjzYnmIXjLwEAlMioc7k4pTihUgOlMGoqW20fu7jR52Kif
 5IjG3vixeCzBYP74sYzy8k9k59tgWDJAJRB1xGh0PbkXAR/tbZYHGwEJeHd2W718owcEEuLeMRp
 27x9FAHP3xnXJZu0XdSLypRCOJ10ZDOI2am+dfqNfQLkRiQXos4OjUGa9OtR5x95ZUMDCwXy14I
 ndR/z1bMuO4dJyAosbFGtATG1uuZFT4otB5gO3JSVHAowmt0qsvLa8JWu1QsdBSJJ0bLP8esw5N
 Mnq+oxu+Z6eo6vkWJClBncGj73uDbCejWuSP3xLHek8TQxQ57BL4vU8Ebw5l2sw+ruViGMEY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060120

On Tue, May 06, 2025 at 05:42:50PM +0530, Ayushi Makhija wrote:
> Hi Dmitry,
> 
> On 5/5/2025 3:32 PM, Dmitry Baryshkov wrote:
> > On Mon, May 05, 2025 at 03:12:41PM +0530, Ayushi Makhija wrote:
> >> Add anx7625 DSI to DP bridge device nodes.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 183 +++++++++++++++++++++
> >>  1 file changed, 183 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> index 175f8b1e3b2d..de14f3ea8835 100644
> >> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> @@ -28,6 +28,15 @@ chosen {
> >>  		stdout-path = "serial0:115200n8";
> >>  	};
> >>  
> >> +	vph_pwr: vph-pwr-regulator {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "vph_pwr";
> >> +		regulator-min-microvolt = <12000000>;
> >> +		regulator-max-microvolt = <12000000>;
> > 
> > 12 V, if my eyes don't deceive me.
> 
> Yes, it's 12V. According to the chipset's power grid, the VPH rail is rated at 12 volts.
> That's significantly higher than what we typically see on mobile platforms. I guess,
> this is due to the SA8775P Ride SX being designed for automotive applications, where higher voltage levels are required.
> 
> > 
> >> +		regulator-always-on;
> >> +		regulator-boot-on;
> >> +	};
> >> +
> > 
> > [...]
> > 
> >> +
> >> +			bridge@58 {
> >> +				compatible = "analogix,anx7625";
> >> +				reg = <0x58>;
> >> +				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
> >> +				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
> >> +				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
> >> +				vdd10-supply = <&vph_pwr>;
> >> +				vdd18-supply = <&vph_pwr>;
> >> +				vdd33-supply = <&vph_pwr>;
> > 
> > Here you are saying that 1.0V, 1.8V and 3.3V pins are powered on by 12V
> > supply. I wonder how the board doesn't trigger all fire alarms in the
> > building.
> > 
> 
> Let me try to explain the connections from the schematics.
> 
> In the SA8775P RIDE SX platform, the ANX bridge supplies are connected from the below sources:
> 
> 1) AVDD1P8 is sourced from the `VREG_1P8` of the backplane card.
> 2) AVDD3P0 is sourced from the `VREG_3P0` of the backplane card.
> 3) AVDD1P0 is sourced from the TPS74801 LDO voltage regulator that has `VREG_1P8` connected to
>    VIN & EN lines, and `VREG_3P0` connected to BIAS line.
>  
> The `VREG_1P8` is sourced from a buck converter TPS54618CQRTERQ1 that is using 
> `VREG_5P0` as VIN and EN_VR1P8_M3P3 as EN signal. 
> Where the `EN_VR1P8_M3P3` is an output signal from SAK-TC397XX-256F300S BD micro-controller.
>  
> Similarly, the `VREG_1P3` and `VREG_5P0` are sourced from another buck converter LM5143QRWGRQ1
> that is using `VREG_12P0` as VIN and `EN_VR5P0_M3P3` as EN signal.
> Where the EN_VR5P0_M3P3 is an output from the same micro-controller.
>  
> Combining above details, all three ANX bridge supplies are getting enabled by `VREG_12P0` supply,
> `EN_VR1P8_M3P3` and `EN_VR5P0_M3P3` signals once the SOC is out of reset.
>  
> The `VREG_12P0` is directly sourced from `VBATT_IN`.
>  
> Since, there is no SW control for ANX bridge supplies and they are getting enabled
> once the SOC is out of reset, I have used vph-pwr-regulator dummy regulator.
> I am not sure if it's the right way to handle above scenario. Please let me know if there is other way to do the same.

Add these regulators as fixed ones, describing the power grid. Consult
other board files if you are unsure. RB3, RB5, HDKs - all these boards
have fixed-regulators for the grid.

-- 
With best wishes
Dmitry

