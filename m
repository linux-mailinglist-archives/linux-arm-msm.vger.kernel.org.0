Return-Path: <linux-arm-msm+bounces-74632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F50B9B1A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 19:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0C964C3DC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 17:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B386A2F56;
	Wed, 24 Sep 2025 17:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKL8eAHJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB6021C176
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758735974; cv=none; b=hU6GmPKdU32KdPFh2u1hS9VnAIrJms6mG93d6aP7S/0BmpFjIeF2rO4wP4D4YrmCkhKfFB30rLCj1E8iqUumMu9YY6c3s2q3PNU3TiS7IFHSCBn9tHxMZ/ATPaXmPEsbPBjXsXxFsrtYvlyOh9GFBOfdCOiKOeUvJP7jD+sxQAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758735974; c=relaxed/simple;
	bh=G57FsUyDyn8h8fkB1Or0bqNSNFoW4Q4Ia8KAWEAOues=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixYxHdJ2spu7Cj35OY7vfsgm9WfCQJSH7j5/GMv5eENfPdt+zDfMUFJQthHyKpWZotPAhqQhhsYmicUzGEeYSG1fQmEXGizYtW3cZLZgH+AzSrmCj2gIuypKlfZ206TsYELcW+7PP5a8DXEKnC2a3o1kdoy9lBuIwhGdPAfBKNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKL8eAHJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OClbn6018026
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LDwHl628Uh/61TKfX0Rb4ybv
	LQ39DaKkW3ER6G+BopI=; b=AKL8eAHJp24vcnyLkwkwIB+j25r80yeQLUqUEZaC
	hKZyq3jKaBBfIs9/9iKemX/uGWtZs4aE0G8/KT4w6XPHPjZ/PDho2nkbWKbXY6IQ
	XGwNGMgwzEwQS+Vvbt8jc+/N+fdKCmAoGzn59Tgvm37LtfXqmAe41HDQM+wTzfsq
	hpIAiNADaHDy9J5E2EDfv3ijn3ZnybZ7Ch6MT3/oHWQgxG3jGmYsEpfl9TNoczZR
	vDbD5jvRxXM+ju/ts0q01bMtjp+IBheq1U/BIF5rphoMlCg/8IlF1uFUq+muoDYw
	XXGYTlqhyK+iMlEm1FswLVmp9oYMCqCewYtPKY8oaK2Stw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk97cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:46:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d7f90350f3so1170571cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758735969; x=1759340769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDwHl628Uh/61TKfX0Rb4ybvLQ39DaKkW3ER6G+BopI=;
        b=BaQ1i3rqnD7VEu2vlqQZBu0WtZ+i+RBxBtA3VZq/OO3VcA7TlNbe9HcOAcZAHfrjjU
         u7T4TmY63D17QnUlgB/KMeejahmHwEaWwgUwtikXwjns9nEagYVPUUrl+b1yqnGdboek
         UicFJuMz8A7EGoLNTgqoXL9eT7dWprbzEH7a0JXopGFgN/g3yMVbYbI8rM5jPJ+xDowj
         EeQpB3S8qUXVOchozbqeIaygYa1HXwWNJyiCRyUL/nC96UGAo4YXCL9B4kSHXHZkC3Qi
         t1+VKf/lV7Oc7qG9yoeM4YlXX6l5StMJRQGrXyrjvX2eql0/8pasNRmYxMC9nfkP2otm
         jceQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+1JUEL3DWD28rQPM2706XNWk2ertN4aRWqPg96D+LMEs7j5tDERe6xqGkIO37metH7J6rdwox2YQdEyMM@vger.kernel.org
X-Gm-Message-State: AOJu0YxNVko1aQHq3byrLeDDQ78hKKfEIp5QqBJ2QN3Oio1N1TnAKCxl
	BClBmoN5hSZOHo2P85pMg5FkeNM18SUZPRQ8UAfTkcfGGuXHqaJ0+MWnu8SfwBNE1QWvA+cP+Eq
	YMfkd/axjIHXWYbYXwumaHwL6LKsvCSK7AHvSgSjftGE0Bj7FT0XK1cbnArsdXe5bqst16lO1ur
	5cpF0=
X-Gm-Gg: ASbGncuiWwUWFdS8ixSrwKOCCEPLDBItZ9tzas5yJV2vVyctS8FSFdmzoSlFOVeTFzM
	fyQ5toVLxiXiY4stgXoD4fs31B2fYkdC1sBqjYjEf3l7r2Rm0lk570yCENx6anNl9JJ7X04eWbF
	t1EZWZga/y7/yN3Jbt8MRjsvgKQBzuMmTXA/BHm+wcDpkSVTm2kkLDJFyb08Q7ydKoUdquNhEQg
	+VCei3w70FKo98RTewt9Z84JApFsPSzqx+kb3FnEjryEMHBAtUMTCaMGVyzTzzsrXE1dY9Z8T2n
	h6DEgsjf/ynCTFbHdoR8OtkXCNiIqK2sINNbm/f4IE3Uarr4tU5PtHqBcFlJIpkSPBqTV6zb4gh
	9bslPbB3GcGebye7Wr8Znr7/AYxBGTitd9oBO0mNiBWLWudrvdUD0
X-Received: by 2002:a05:622a:110:b0:4b2:8ac4:f097 with SMTP id d75a77b69052e-4da52cf5573mr9162601cf.33.1758735969204;
        Wed, 24 Sep 2025 10:46:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGVVSrRGIdbRQt/tvy+RsfE8IvHUt6+BowFKniIp4tDXNBsHhZ1i3kGmh5aT5eBsLtDvJm5Q==
X-Received: by 2002:a05:622a:110:b0:4b2:8ac4:f097 with SMTP id d75a77b69052e-4da52cf5573mr9161821cf.33.1758735968387;
        Wed, 24 Sep 2025 10:46:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9573541sm5242209e87.108.2025.09.24.10.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 10:46:07 -0700 (PDT)
Date: Wed, 24 Sep 2025 20:46:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: andersson@kernel.org, casey.connolly@linaro.org,
        christopher.obbard@linaro.org, linux-arm-msm@vger.kernel.org,
        loic.minier@oss.qualcomm.com, rosh@debian.org
Subject: Re: [PATCH] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board
 dts
Message-ID: <72igbjqjadms56geag7ftf7lch53e7p5b2g6zhcfjget7zfhvi@mokcb3l4xaxr>
References: <j2hpzksc3ldh2beraemnqlg7fppbg6pqht5f2lkqah777o3q7o@xzdkammzc5db>
 <20250924121330.128339-1-hongyang.zhao@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924121330.128339-1-hongyang.zhao@thundersoft.com>
X-Proofpoint-GUID: wAlaInVANuEAEF_lNaR0736dGQEWxOqL
X-Proofpoint-ORIG-GUID: wAlaInVANuEAEF_lNaR0736dGQEWxOqL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX8pWlN4oUKNK/
 znxl4nSrGmlaMi1qIixo6rvJ5bvKsaTR/0Wm27itlJM8eDUwfQ4TbcdG7brT/2epxKjNZ496dKW
 e03lS4N5jf/+RxbQVhymRJ/Nu3LixHiN86CvX81X+ilHAQ8Xb7evoBf5pfhQtBqwHzmeA8XspSB
 P3rcGehCAi3fWmWD3XiNdIVEOre7WyUYsS5Af10YcpBWM2Mwh52VHhLxar/JwvLHg3Dp5ulbanu
 FAiCNMOcmK6sn5OGdJEXwA/B9T0NSdU0mbkC6Hd1F3Iv+3N4QLhK00fkAxDeusLwWYK4vZjjvqi
 zHolb7jqRzYiVgzQ+q5ue4QjYhmFX00L5fn3F28lWGqLuAQoURcffD3ihMHcOHOdIqLCxikI1Iu
 EbTEB7Gm
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d42e62 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=ItehdQfWb9GqH6OLNUYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=j5gyrzqu0rbr1vhfHjzO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On Wed, Sep 24, 2025 at 08:13:30PM +0800, Hongyang Zhao wrote:
> >On Tue, Sep 23, 2025 at 02:43:30PM +0800, Hongyang Zhao wrote:
> >> From: hongyang-rp <hongyang.zhao@thundersoft.com>
> >> 
> >> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> >> QCS6490 SoC.
> >> This will add support for debug uart, usb-typec, wifi,
> >> bluetooth, fan, m.2, i2c and uart on the 40-pin connector,
> >> and some voltage regulators to the board.
> >> 
> >> Signed-off-by: hongyang-rp <hongyang.zhao@thundersoft.com>
> >> Reviewed-by: Roger Shimizu <rosh@debian.org>
> >> Cc: Casey Connolly <casey.connolly@linaro.org>
> >> Cc: Christopher Obbard <christopher.obbard@linaro.org>
> >> Cc: Loic Minier <loic.minier@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
> >>  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1299 +++++++++++++++++
> >>  2 files changed, 1300 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> >> 

> >> +
> >> +&mdss_dp_out {
> >> +	data-lanes = <0 1>;
> >
> >Without link-frequencies it's limited to HBR2, is this expected?
> 
> This is expected. I refer to qcs6490-rb3gen2.dts for the modifications.

Why? Is the board / chip limited to HBR2? Don't just c&p rb3gen2, you
have a different board and different configuration.

> >> +
> >> +&pcie1 {
> >> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> >
> >No wake-gpios?
> 
> Yes, this part also refers to qcs6490-rb3gen2.dts,
> and I checked drivers/pci/controller/dwc/pcie-qcom.c
> and there is no wake gpio related operations.

DT desribes the hardware. As such, please add wake-gpios if it's rounted
on the board.

> 
> >
> >> +
> >> +	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
> >> +	pinctrl-names = "default";
> >> +
> >> +	vdda-supply = <&vreg_m2_1p8>;
> >> +
> >> +	status = "okay";
> >> +};
> >> +
> >
> >[...]
> >
> >> +
> >> +&pm8350c_gpios {
> >> +	fan_pwm_out_default: fan_pwm_out_default {
> >
> >You should have gotten a warning here.
> 
> Yes, I have fixed it.

Can I asusme that you've run `make foo.dtb CHECK_DTBS=y` now?

> 
> >
> >> +		pins = "gpio8";
> >> +		function = "func1";
> >> +		power-source = <1>;
> >> +		drive-push-pull;
> >> +		output-high;
> >> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> >> +	};
> >> +};
> >> +
> >> +&pmk8350_rtc {
> >> +	status = "okay";
> >> +	allow-set-time;
> >
> >status should be the last property.
> 
> Adjustments have been made in the new patch.
> 
> >
> >> +};
> >> +
> >> +&pmk8350_vadc {
> >> +	channel@3 {
> >> +		reg = <PMK8350_ADC7_DIE_TEMP>;
> >> +		label = "pmk8350_die_temp";
> >> +		qcom,pre-scaling = <1 1>;
> >> +	};
> >> +
> >> +	channel@44 {
> >> +		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
> >> +		label = "xo_therm";
> >> +		qcom,hw-settle-time = <200>;
> >> +		qcom,pre-scaling = <1 1>;
> >> +		qcom,ratiometric;
> >> +	};
> >> +
> >> +	channel@103 {
> >> +		reg = <PM7325_ADC7_DIE_TEMP>;
> >> +		label = "pm7325_die_temp";
> >> +		qcom,pre-scaling = <1 1>;
> >> +	};
> >> +
> >> +	channel@144 {
> >> +		reg = <PM7325_ADC7_AMUX_THM1_100K_PU>;
> >> +		qcom,ratiometric;
> >> +		qcom,hw-settle-time = <200>;
> >> +		qcom,pre-scaling = <1 1>;
> >> +		label = "pm7325_quiet_therm";
> >> +	};
> >> +
> >> +	channel@146 {
> >> +		reg = <PM7325_ADC7_AMUX_THM3_100K_PU>;
> >> +		qcom,ratiometric;
> >> +		qcom,hw-settle-time = <200>;
> >> +		qcom,pre-scaling = <1 1>;
> >> +		label = "pm7325_sdm_skin_therm";
> >> +	};
> >> +};
> >> +
> >> +&pon_pwrkey {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&pon_resin {
> >> +	linux,code = <KEY_VOLUMEDOWN>;
> >> +
> >> +	status = "okay";
> >> +};
> >> +
> >> +&qup_uart7_cts {
> >> +	/*
> >> +	 * Configure a bias-bus-hold on CTS to lower power
> >> +	 * usage when Bluetooth is turned off. Bus hold will
> >> +	 * maintain a low power state regardless of whether
> >> +	 * the Bluetooth module drives the pin in either
> >> +	 * direction or leaves the pin fully unpowered.
> >> +	 */
> >> +	bias-bus-hold;
> >> +};
> >> +
> >> +&qup_uart7_rts {
> >> +	/* We'll drive RTS, so no pull */
> >> +	drive-strength = <2>;
> >> +	bias-disable;
> >> +};
> >> +
> >> +&qup_uart7_rx {
> >> +	/*
> >> +	 * Configure a pull-up on RX. This is needed to avoid
> >> +	 * garbage data when the TX pin of the Bluetooth module is
> >> +	 * in tri-state (module powered off or not driving the
> >> +	 * signal yet).
> >> +	 */
> >> +	bias-pull-up;
> >> +};
> >> +
> >> +&qup_uart7_tx {
> >> +	/* We'll drive TX, so no pull */
> >> +	drive-strength = <2>;
> >> +	bias-disable;
> >> +};
> >> +
> >> +&qupv3_id_0 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&qupv3_id_1 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&remoteproc_adsp {
> >> +	firmware-name = "qcom/qcs6490/adsp.mbn";
> >> +	status = "okay";
> >> +};
> >> +
> >> +&remoteproc_cdsp {
> >> +	firmware-name = "qcom/qcs6490/cdsp.mbn";
> >> +	status = "okay";
> >> +};
> >> +
> >> +&remoteproc_mpss {
> >> +	firmware-name = "qcom/qcs6490/modem.mbn";
> >> +	status = "okay";
> >> +};
> >> +
> >> +&remoteproc_wpss {
> >> +	firmware-name = "qcom/qcs6490/wpss.mbn";
> >> +	status = "okay";
> >> +};
> >> +
> >> +&sdhc_2 {
> >> +	pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;
> >> +	pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;
> >
> >What's the difference from the defaults here?
> 
> This part is redundant and has been deleted.
> 
> >
> >> +
> >> +	vmmc-supply = <&vreg_l9c_2p96>;
> >> +	vqmmc-supply = <&vreg_l6c_2p96>;
> >> +
> >> +	non-removable;
> >> +	keep-power-in-suspend;
> >> +	/delete-property/ cd-gpios;
> >> +
> >> +	status = "okay";
> >> +};
> >> +
> >> +&tlmm {
> >> +	bt_device_wake: bt_device_wake {
> >
> >Please check your DT for schema compliance. Read the documentation for
> >DT writing. There are two mistakes here.
> 
> Sorry, this is my first commit.
> After running the device tree check, this should be the only issue left,
> but I checked that the driver vdda-supply was being parsed properly,
> and I need this node to enable power on the M.2 port, so I didn't delete it.
> 
> (qcom,pcie-sc7280): Unevaluated properties are not allowed
> ('vdda-supply' was unexpected)

This needs to be fixed.

> 
> >
> >> +		pins = "gpio39";
> >> +		function = "gpio";
> >> +		drive-strength = <2>;
> >> +		bias-disable;
> >> +	};
> >> +
> >> +	bt_host_wake: bt_host_wake {
> >> +		pins = "gpio137";
> >> +		function = "gpio";
> >> +		drive-strength = <2>;
> >> +		bias-disable;
> >> +	};
> >> +
> >> +	bt_reset: bt_reset {
> >> +		pins = "gpio17";
> >> +		function = "gpio";
> >> +		drive-strength = <2>;
> >> +		bias-disable;
> >> +	};
> >> +
> >> +	qup_uart7_sleep_cts: qup-uart7-sleep-cts-state {
> >> +		pins = "gpio28";
> >> +		function = "gpio";
> >> +		/*
> >> +		 * Configure a bias-bus-hold on CTS to lower power
> >> +		 * usage when Bluetooth is turned off. Bus hold will
> >> +		 * maintain a low power state regardless of whether
> >> +		 * the Bluetooth module drives the pin in either
> >> +		 * direction or leaves the pin fully unpowered.
> >> +		 */
> >> +		bias-bus-hold;
> >> +	};
> >> +
> >> +	qup_uart7_sleep_rts: qup-uart7-sleep-rts-state {
> >> +		pins = "gpio29";
> >> +		function = "gpio";
> >> +		/*
> >> +		 * Configure pull-down on RTS. As RTS is active low
> >> +		 * signal, pull it low to indicate the BT SoC that it
> >> +		 * can wakeup the system anytime from suspend state by
> >> +		 * pulling RX low (by sending wakeup bytes).
> >> +		 */
> >> +		bias-pull-down;
> >> +	};
> >> +
> >> +	qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
> >> +		pins = "gpio31";
> >> +		function = "gpio";
> >> +		/*
> >> +		 * Configure a pull-up on RX. This is needed to avoid
> >> +		 * garbage data when the TX pin of the Bluetooth module
> >> +		 * is floating which may cause spurious wakeups.
> >> +		 */
> >> +		bias-pull-up;
> >> +	};
> >> +
> >> +	qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
> >> +		pins = "gpio30";
> >> +		function = "gpio";
> >> +		/*
> >> +		 * Configure pull-up on TX when it isn't actively driven
> >> +		 * to prevent BT SoC from receiving garbage during sleep.
> >> +		 */
> >> +		bias-pull-up;
> >> +	};
> >> +};
> >> +
> >> +&uart2 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&uart5 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&uart7 {
> >> +	/delete-property/ interrupts;
> >> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
> >> +			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> >> +	pinctrl-1 = <&qup_uart7_sleep_cts>,
> >> +		    <&qup_uart7_sleep_rts>,
> >> +		    <&qup_uart7_sleep_tx>,
> >> +		    <&qup_uart7_sleep_rx>;
> >> +	pinctrl-names = "default",
> >> +			"sleep";
> >> +
> >> +	status = "okay";
> >> +
> >> +	bluetooth {
> >> +		compatible = "brcm,bcm4345c5";
> >> +		clocks = <&sleep_clk>;
> >> +		clock-names = "lpo";
> >> +		device-wakeup-gpios = <&tlmm 39 GPIO_ACTIVE_HIGH>;
> >> +		host-wakeup-gpios = <&tlmm 137 GPIO_ACTIVE_HIGH>;
> >> +		shutdown-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
> >> +		pinctrl-0 = <&bt_device_wake>, <&bt_host_wake>, <&bt_reset>;
> >
> >one per line
> 
> Adjustments have been made in the new patch.
> 
> >
> >> +		pinctrl-names = "default";
> >> +		vbat-supply = <&vreg_sdio_wifi_1p8>;
> >> +		vddio-supply = <&vreg_sdio_wifi_1p8>;
> >> +		max-speed = <3000000>;
> >> +	};
> >> +};
> >> +
> >> +&usb_1 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb_1_dwc3 {
> >
> >Please rebase on top of a resent linux-next.
> 
> I re-made the patch at the next-20250923 tag.
> 
> >
> >> +	dr_mode = "otg";
> >
> >This is the default
> 
> This node has been deleted.
> 
> >
> >> +	usb-role-switch;
> >
> >This should be a part of sc7280.dtsi
> 
> Sorry, I don't understand here. Should we write usb-role-switch
> in sc7280.dtsi? I think the changes for RUBIK Pi should be fixed
> in the current device tree. This part of the changes refers to
> qcs6490-rb3gen2.dts.

Yes, the host is supposed to handle USB role-switching, so if the
property is not there, add it in the sc7280.dtsi (in a separate commit).


-- 
With best wishes
Dmitry

