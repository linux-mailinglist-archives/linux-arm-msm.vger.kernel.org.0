Return-Path: <linux-arm-msm+bounces-63902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F45AFAF62
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75F28188B8A3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 09:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0143A28C5B3;
	Mon,  7 Jul 2025 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Swleq3Ic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A761F3BA9
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879757; cv=none; b=XMhOzAE33TBLKyBq6XmVsgvwZvVC29KiPFW9Yc5Txw4kDJ7ItdAS0AX0No6k4sON9ZDHD4SYOvPitw80Cgi/tFwBVU5QOf5Sqnlg7pBLR28YPDz59+/KfnhE7AAo7AGwcDmxfLLXKPhi90JQbTRuMZJsF9qZOSAADgkE1zzoKlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879757; c=relaxed/simple;
	bh=1xedEVDzsSxxbrLYD+QB7jvQWEPveVoc0Amb9x1OZm4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhI1Ve+DZWFNlLaUk1yDg7g11ie0G5aQz1IYvHX8pN3Uba4R/03jzIwHpvjNNZiBJf7ljE0S3D4o3wyGigjk6u5ktulxXxD5hGukznKGtoBhT33u+/4Fm+zi2GcCU6CnWNTn2ktU/YIQa/XQpRo+sUyHW/AT3xK7yEZQHLgUCD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Swleq3Ic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5676pxLM015244
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 09:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EaUOc8gZnCaiHfxMVU/rdhzj
	ZBI8Ckok1Y/QujtjMx8=; b=Swleq3IcdpUXqWzYole/NGaH1CtisoWQwetpdhsX
	dIfw6VYNhJEYSN7CRc9ABwpPZHfAaEbtz6+MgIcjTIaJkIuDWkOJeGYTrTM9Zx2D
	D+t0UADw6/+NFSVebUP8zRVcyT4hI6jYxHK3ghUKmSXKqxhU87OyTBxnOMOhyGU9
	KoHR4CEKxmq4Ofu1aRTBHwvF6G6SfLOFViHfgV4Xaknqq0YPTro+mSSi0KX72Sen
	hn3XnI6gihWOK6rMxIEtgHxjkus9hB1IxyTDvR4Ww8PmP01kgXKaa7awga67v0in
	6mfv2Pp7NlH66i5k86SGzQnkTgBCcTELjsABVJdwG3xlZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0h64d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 09:15:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3d3f64739so636418685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 02:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879754; x=1752484554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaUOc8gZnCaiHfxMVU/rdhzjZBI8Ckok1Y/QujtjMx8=;
        b=enZKz1pJyR+mArbp0ny51FVHarAh3e2NIBIlQ0sABJylFmzyLJUqBoRMi3oc7sBauB
         KoE7MMOr7Iw2uwzp7IP+gLEf6PhdrtK4Kp6R9Vagjn5G/9hRx1w8WB9ZIWGZ/L8nF3tx
         WiNN4FWYXzkkSVNvpd4k2fZbyeftXFy4D1KVcp5Rzh8+hyYX8MURz+zKr7haoniZzzYi
         WhBQt1vaYjshY5k8Af3zRh0R8AauXXiU3T2WR9Ng0t5frtjZn7xU7+fvE0op5awTjhVK
         ICfwwcBHilMG0VpkMtnt95nKdGNVnz+LqSxFYIXX0ICZj0cd3qC3NehBKndZfQUfzqH3
         sWCg==
X-Forwarded-Encrypted: i=1; AJvYcCWE+spxXA1wahFaO6RY/1KP9a50DvpeizJhU1779qAhYSLRQUjh0szaf9obSsDLV2HfKvBHRnFIDU9k/i6B@vger.kernel.org
X-Gm-Message-State: AOJu0YywT2qg6NzektzYInDluKxoxhb6SKma6RHCSzjkTqdVtZv1s4nI
	JC1Ub9Hyk2YC5n0HQpkuoov+uUaWmVU9cc2ThVO0JVF+JT5psLJ+sDg1sqcXS75PxM9WkEI8Hu9
	zHeHTlsyd3Q/LWp+SfhwxaScWrKfPzQ2HlVrbrvgOXxphBTqzreSPzwhNqbUww64JZzF2
X-Gm-Gg: ASbGncuPRlykdE42iVRhSrFhNG2dyUnpVN+ClALZGeKllPN3AeLToWJZ9/PAy2ku6Sy
	2+BVjrVsGHRExSdcLhSoUAXLYkPd5I077UmUjh+AgEo72B8Ihw4xdCe65HkB8v5AeIussH1HXFX
	PLvsNlGQNAI2QXztNjbNdtTQbdZWj8pTmZAWJ/tMS537I3278qIdUS3pEX9lsPkcSmt9ZboD6Z6
	ewYeU76MEvauXyrGKaVY4oqRQMj9sdUzJ2V8H7P3dTgfbWOHZRZy+1s71DTqzoEJbf2zDFECH1D
	jH8cz89rqw1/eAzy2CkJMeeNY6VVo8IiP0BRQkbjZss3ONF43eOPNCI=
X-Received: by 2002:a05:620a:1aa7:b0:7d4:57a5:9742 with SMTP id af79cd13be357-7d5dcd0783amr1550595285a.39.1751879754051;
        Mon, 07 Jul 2025 02:15:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVADocE7bXOXurJZ6dv/hL0nI9aX9Csz55eF2TfSxS1UBR2Q2notThFEzW/XQxmcaZfbwOTg==
X-Received: by 2002:a05:620a:1aa7:b0:7d4:57a5:9742 with SMTP id af79cd13be357-7d5dcd0783amr1550592085a.39.1751879753422;
        Mon, 07 Jul 2025 02:15:53 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm136453855e9.21.2025.07.07.02.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:15:52 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:15:51 +0200
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aGuQR194iqu0Qs97@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <6e330e8f-5856-ef8e-5fe3-52bd61b59e02@quicinc.com>
 <aF6PqCY/E6H0Mc2/@trex>
 <2722e70a-1080-c9f3-eb56-4a6e79084bdc@quicinc.com>
 <aF6z7iaicHyNXg6w@trex>
 <e704535c-0004-6dbd-bc81-b4ebc7747881@quicinc.com>
 <bac1e5e4-ed18-4e26-a883-2a41bf8468a8@oss.qualcomm.com>
 <a934bb78-587b-6aca-2fb1-38605d3b385a@quicinc.com>
 <7df8a438-364e-431e-8424-209ad7482efc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7df8a438-364e-431e-8424-209ad7482efc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686b904b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=g0UWXt2G9gbouz_zptwA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MyBTYWx0ZWRfX4FfVmZlV42Hg
 y/+EjGVWdL5U37iQUaDzm7hcC0qGfUCNf9PU4hMuqrwj4iKFccfOE8L7fsKbuVCnm94+fYo0aQ6
 DLgJkyBMoIw5U2JOwBW3OvTfyeE1N02Tl4V8DElnt5dGuqQqDiZRsJAFNzfec5V9ziFMgBObJZX
 aU56LSIsjthKLSyNAAQIHPbYkIB9TWYmZi3t0im/Fb3O3TwV4LeWY2V89TpnfKqUNYWDYWFHlc8
 U93zUUwT8bXModYdunTzA1zE5W18KLBS0EcEBWCcrHQGnCnw32O2m7x1dy0byRasIqJu8QcViFo
 VrXPmVTavue0Zwk5TU6fxiDQByM2u2Xq4st3v2f4HY+uNtlKLhYqMJmWvvWkU5uGnv2nDT/M5cn
 gPEeeUhkOi7t682cgIUIxD8o46mpAO4t4iXRItc1Sqqy8vuHT4vnsZjXXOsMSBJ1yGK2LmeO
X-Proofpoint-GUID: sKjjbJnvfACzM2j8he3PWs44kjoQ-zIG
X-Proofpoint-ORIG-GUID: sKjjbJnvfACzM2j8he3PWs44kjoQ-zIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070053

On 27/06/25 17:27:04, Konrad Dybcio wrote:
> On 6/27/25 5:23 PM, Vikash Garodia wrote:
> > 
> > On 6/27/2025 8:50 PM, Konrad Dybcio wrote:
> >> On 6/27/25 5:12 PM, Vikash Garodia wrote:
> >>>
> >>> On 6/27/2025 8:38 PM, Jorge Ramirez wrote:
> >>>> On 27/06/25 20:28:29, Vikash Garodia wrote:
> >>>>>
> >>>>> On 6/27/2025 6:03 PM, Jorge Ramirez wrote:
> >>>>>> On 27/06/25 17:40:19, Vikash Garodia wrote:
> >>>>>>>
> >>>>>>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> >>>>>>>> Add DT entries for the qcm2290 venus encoder/decoder.
> >>>>>>>>
> >>>>>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>>>>>>> ---
> >>>>>>>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
> >>>>>>>>  1 file changed, 57 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>>>>>>> index f49ac1c1f8a3..5326c91a0ff0 100644
> >>>>>>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>>>>>>> @@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
> >>>>>>>>  			#iommu-cells = <2>;
> >>>>>>>>  		};
> >>>>>>>>  
> >>>>>>>> +		venus: video-codec@5a00000 {
> >>>>>>>> +			compatible = "qcom,qcm2290-venus";
> >>>>>>>> +			reg = <0 0x5a00000 0 0xf0000>;
> >>>>>>>> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> >>>>>>>> +
> >>>>>>>> +			power-domains = <&gcc GCC_VENUS_GDSC>,
> >>>>>>>> +					<&gcc GCC_VCODEC0_GDSC>,
> >>>>>>>> +					<&rpmpd QCM2290_VDDCX>;
> >>>>>>>> +			power-domain-names = "venus",
> >>>>>>>> +					     "vcodec0",
> >>>>>>>> +					     "cx";
> >>>>>>>> +			operating-points-v2 = <&venus_opp_table>;
> >>>>>>>> +
> >>>>>>>> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> >>>>>>>> +				 <&gcc GCC_VIDEO_AHB_CLK>,
> >>>>>>>> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> >>>>>>>> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> >>>>>>>> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> >>>>>>>> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> >>>>>>>> +			clock-names = "core",
> >>>>>>>> +				      "iface",
> >>>>>>>> +				      "bus",
> >>>>>>>> +				      "throttle",
> >>>>>>>> +				      "vcodec0_core",
> >>>>>>>> +				      "vcodec0_bus";
> >>>>>>>> +
> >>>>>>>> +			memory-region = <&pil_video_mem>;
> >>>>>>>> +			iommus = <&apps_smmu 0x860 0x0>,
> >>>>>>>> +				 <&apps_smmu 0x880 0x0>,
> >>>>>>>> +				 <&apps_smmu 0x861 0x04>,
> >>>>>>>> +				 <&apps_smmu 0x863 0x0>,
> >>>>>>>> +				 <&apps_smmu 0x804 0xe0>;
> >>>>>>> keep only the non secure ones.
> >>>>>>
> >>>>>> ok
> >>>>>>
> >>>>>>>> +
> >>>>>>>> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> >>>>>>>> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> >>>>>>>> +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> >>>>>>>> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> >>>>>>>> +			interconnect-names = "video-mem",
> >>>>>>>> +					     "cpu-cfg";
> >>>>>>>> +
> >>>>>>>> +			status = "okay";
> >>>>>>>> +
> >>>>>>>> +			venus_opp_table: opp-table {
> >>>>>>>> +				compatible = "operating-points-v2";
> >>>>>>>> +
> >>>>>>>> +				opp-133000000 {
> >>>>>>>> +					opp-hz = /bits/ 64 <133000000>;
> >>>>>>>> +					required-opps = <&rpmpd_opp_low_svs>;
> >>>>>>>> +				};
> >>>>>>> Fix the corner freq value
> >>>>>>
> >>>>>> can you add some reference please?
> >>>>>>
> >>>>>> I took this data from an internal document - not sure why the downstream
> >>>>>> driver supports different values or where those were taken from (AFAIK
> >>>>>> they are not supported)
> >>>>> Most likely you have referred incorrect downstream file. Refer scuba-vidc.dtsi.
> >>>>
> >>>> I took them from actual documents (which might or might not be obsolete,
> >>>> hard to say but they were the latest version and as such, they
> >>>> contradict the downstream dtsi).
> >>>>
> >>>> So I'd rather not use downstream - could you point me to the reference
> >>>> you used please - I wonder if the fix is required downstream instead of here?
> >>>
> >>> You can look for this file gcc-scuba.c and refer gcc_video_venus_clk_src which
> >>> is the src for different venus clocks.
> >>
> >> This is not a good source in general, GCC often has more rates defined
> >> than the consumer is supposed to finally run at (because they were deemed
> >> power-inefficient or similar, you can pretty much set any rate you want
> >> on the clocks fwiw)
> > Count wise, i agree. Value-wise, afaik, corners should match OR are you saying
> > client scaling request for 133.0 MHz is ok when src is generating 133.33 MHz ?
> 
> I *think* we're running a closest-match in there.. but I'd love to
> have the clock and consumer drivers agree on the rate exactly
> (which in this case would be 133333333 - and the clock plan in
> our docs agrees)
>

ok, will use this instead

> Konrad

