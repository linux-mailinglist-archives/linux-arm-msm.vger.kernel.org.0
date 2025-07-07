Return-Path: <linux-arm-msm+bounces-63901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DEFAFAF5F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF50217F878
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 09:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377F328D8FB;
	Mon,  7 Jul 2025 09:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRn+Zj9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C1C28CF79
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879726; cv=none; b=NN22M2hl0K3+fqi7cKsiw9ENnKqfMETOR8B61pD7E5lWhkdw/E2C0+/wcKoKLV+iLuqCB+1kn4/N64/jiorfsgUH08fgrWLLiY6WeCDH0wkFaXI2/qF0LE/sHCwFJKKN+TERndMk84z00FCzL5XvPAVmw/v+hL0HfLekksu5OnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879726; c=relaxed/simple;
	bh=tjjCvBxWbRxuzfcmwgt2e14BCgemhZ17sHNnbJDoRqo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNyNA5u31zLce1gcQWRGgMXfA5i9BIhcup0svFgUS0u3vQWrxixT1RuC9QQXSjGFx7kOOK2G1SkRVlPAIczJZXj3xW8LAShJ/C4Qvwo37JOIwcczbHLaTk408cjCMZMy/Ggj7c/mdSWe/OcG3lWtVExrhrLj3nu5ChGQ1d/DkF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRn+Zj9b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5678vLmh006090
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 09:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ngeouwKDCRN8FHS2Ov3SiLW7
	xuB2mIEuudvyrN1Stik=; b=gRn+Zj9bPJLipbfniCQ+2soZ1LekeEo3ru9DrdYp
	xpO1dZyRSt0kAkQoVyunkLhcb1W44MwZYyNrgEprB/4jKQa2CZ0LQqB6yR+X8xk8
	H7LZJKC+nBNzUK4hBGAX6ISwXfkZ0xGgev0DosLyJuyHUSmwxA0ea7tCdc+dog61
	yN0cHDZMaLf2oe0dsToMESJRStQKHAxMAGlj3NiTE4vf4fOYHgyPV2OviBI5gvcB
	xznn3wii1j8WznOX3hNVJSpoKnR+YSk5JUVlGsE2laiPYbFS+kzVakERlaIbQeby
	ZFNbhdF6Ksb7HVCqH7a7whGOGzfogP9IWEFZY4kIXnqENQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrkbnqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 09:15:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d4576e83cdso882844785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 02:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879713; x=1752484513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngeouwKDCRN8FHS2Ov3SiLW7xuB2mIEuudvyrN1Stik=;
        b=cdr6RhAXXr47iXWPy9b2wmSJmSj9OwGeG8lajNNyyViCLZQ5M3Bk1HwQN8NEU0K8BG
         p8bUt2BlXmqMdUGPFIHpT1x8xTKGbzeosLao6I2iMBYsURSLLYFA8OJKs5GXYzYVQHRT
         UI0fFAjgfs5akiRFLw9nCySoX78DDbwkHltqlmQ+R7goBD/Fp5+qkR3xU5fyd9xZRjom
         ncmZCxN7HawwNhR3N2KWplgRYm9rE7joaxyQFBab9Ka5jBtfkVIYNboi9We50kYKDRni
         ErWaZNE5wjy/nRatHw5ngIZj2TcDe0g1jbI2kcOusPnP2yt8YewETK2/Fqb7j0tX4cLX
         uepQ==
X-Forwarded-Encrypted: i=1; AJvYcCUskT7hznWdPHKc5uE5D8LRD6nt9sL8YOqMV16hwwfC35UO5BLwiWWFGMna+96TZbvo5bqpQpCoqGubbgy1@vger.kernel.org
X-Gm-Message-State: AOJu0YwKNHakyVjmcBMaqx4C5GAh97S8aS7SN9cdm5WP6yxdRtrjXBNY
	kK/YUIxQdkPmRRMgKfgyQU5OtvtP3Bh7vo8WFqYjv846+UyP+y2NJJo6aEEtzJJJyVfuM8ycc61
	ZsmSVr+cL0ORq1f6jX2zBQUzsjdB2eFY93+Y+HOSNqngQDjeFwF3VUbf72qwqT6y8lyF8
X-Gm-Gg: ASbGnctMys555s+AvSRKnnTu4wNpzGgfitEQzvS7anmkg666vdkC32Ge+4/FpxE7ANw
	6iDb8mdtUxU1CtUqUP3GlSlfpXwmacxDmwB1sZSiXhgWussrjctDzd3OdukcMd+f4X6hDVtbfjb
	jb91tI/SsEVAUirMDcu5Su0byh+bPfpXkXE4JLLLS1nAowuxPyXb544WDZzLmFGwH593SdPA1+u
	k2qTKXnro9NCOyqzn7LAwC4Um+VOf+baWbOJVo6yhFAh/EGits8skMJlJznC33cr3h/E6ZluHZJ
	5+E1cUY3N9oaqtXl0Z8QOYKAk2PZVyL/zVPsM16AhywXpVGRttuw7xQ=
X-Received: by 2002:a05:620a:1aa6:b0:7d2:26e8:e91b with SMTP id af79cd13be357-7d5f17e5c89mr925299685a.38.1751879713284;
        Mon, 07 Jul 2025 02:15:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpbSVqCx6tFJzqSoaUTECC1w7GfStZZinCZQdif7BWXOwJSsYmKAa+1rKlwK+D1nlqL0TnFg==
X-Received: by 2002:a05:620a:1aa6:b0:7d2:26e8:e91b with SMTP id af79cd13be357-7d5f17e5c89mr925296085a.38.1751879712780;
        Mon, 07 Jul 2025 02:15:12 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453a85b3e2bsm97448195e9.0.2025.07.07.02.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:15:12 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:15:10 +0200
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aGuQHk4tpPl8kAsz@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <6e330e8f-5856-ef8e-5fe3-52bd61b59e02@quicinc.com>
 <aF6PqCY/E6H0Mc2/@trex>
 <2722e70a-1080-c9f3-eb56-4a6e79084bdc@quicinc.com>
 <aF6z7iaicHyNXg6w@trex>
 <e704535c-0004-6dbd-bc81-b4ebc7747881@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e704535c-0004-6dbd-bc81-b4ebc7747881@quicinc.com>
X-Proofpoint-ORIG-GUID: 3Mbpg_UBDqxOQ1fINS3q4VGBVivobu40
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MyBTYWx0ZWRfXxalqvh43KU1k
 L19xhs17xT7fHcMY/KSi7BbV25yFoQB2T41UkmO2sGArxdxSsf5zzcJIg9KGwUcsr+PLGD0Igv3
 DjiNTJs6Jn/KvHdMOC31/0OnWIj3aLJlnBdtgZugxElq4igPdXi7P89AcP5mGd19nr0goXJwNTc
 2aB1Wh6P/iveDYenraT4GQIRPhFqYpR2J+kPdpuDdJmBf2NQDjdPIwI86qXHN9zalznNALehHrB
 UXnWtks7W1SWsqqsGe58bRwHp9K5zZCwPvRVyeCvRbjFZdZsuGBibWQm8DLoV0r82Ve1ps4tWwE
 iiojrLiIvFRgAoVUKtZ01SZ6foBw3FuRGLGQIgcaAOf8kkdw3+M6nY8ZZg1VbUirq5+xgHAaXDO
 SMjXdKrFc7NTl6ZfAayktS7IYlzRUhm9xydPm4Q+5NA5B//4ma5puijxuhA74gEZJ1lCwO66
X-Proofpoint-GUID: 3Mbpg_UBDqxOQ1fINS3q4VGBVivobu40
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686b902b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VQ7V1meLN1WFzF7lOz0A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070053

On 27/06/25 20:42:45, Vikash Garodia wrote:
> 
> On 6/27/2025 8:38 PM, Jorge Ramirez wrote:
> > On 27/06/25 20:28:29, Vikash Garodia wrote:
> >>
> >> On 6/27/2025 6:03 PM, Jorge Ramirez wrote:
> >>> On 27/06/25 17:40:19, Vikash Garodia wrote:
> >>>>
> >>>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> >>>>> Add DT entries for the qcm2290 venus encoder/decoder.
> >>>>>
> >>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>>>> ---
> >>>>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
> >>>>>  1 file changed, 57 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>>>> index f49ac1c1f8a3..5326c91a0ff0 100644
> >>>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>>>> @@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
> >>>>>  			#iommu-cells = <2>;
> >>>>>  		};
> >>>>>  
> >>>>> +		venus: video-codec@5a00000 {
> >>>>> +			compatible = "qcom,qcm2290-venus";
> >>>>> +			reg = <0 0x5a00000 0 0xf0000>;
> >>>>> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> >>>>> +
> >>>>> +			power-domains = <&gcc GCC_VENUS_GDSC>,
> >>>>> +					<&gcc GCC_VCODEC0_GDSC>,
> >>>>> +					<&rpmpd QCM2290_VDDCX>;
> >>>>> +			power-domain-names = "venus",
> >>>>> +					     "vcodec0",
> >>>>> +					     "cx";
> >>>>> +			operating-points-v2 = <&venus_opp_table>;
> >>>>> +
> >>>>> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> >>>>> +				 <&gcc GCC_VIDEO_AHB_CLK>,
> >>>>> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> >>>>> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> >>>>> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> >>>>> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> >>>>> +			clock-names = "core",
> >>>>> +				      "iface",
> >>>>> +				      "bus",
> >>>>> +				      "throttle",
> >>>>> +				      "vcodec0_core",
> >>>>> +				      "vcodec0_bus";
> >>>>> +
> >>>>> +			memory-region = <&pil_video_mem>;
> >>>>> +			iommus = <&apps_smmu 0x860 0x0>,
> >>>>> +				 <&apps_smmu 0x880 0x0>,
> >>>>> +				 <&apps_smmu 0x861 0x04>,
> >>>>> +				 <&apps_smmu 0x863 0x0>,
> >>>>> +				 <&apps_smmu 0x804 0xe0>;
> >>>> keep only the non secure ones.
> >>>
> >>> ok
> >>>
> >>>>> +
> >>>>> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> >>>>> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> >>>>> +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> >>>>> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> >>>>> +			interconnect-names = "video-mem",
> >>>>> +					     "cpu-cfg";
> >>>>> +
> >>>>> +			status = "okay";
> >>>>> +
> >>>>> +			venus_opp_table: opp-table {
> >>>>> +				compatible = "operating-points-v2";
> >>>>> +
> >>>>> +				opp-133000000 {
> >>>>> +					opp-hz = /bits/ 64 <133000000>;
> >>>>> +					required-opps = <&rpmpd_opp_low_svs>;
> >>>>> +				};
> >>>> Fix the corner freq value
> >>>
> >>> can you add some reference please?
> >>>
> >>> I took this data from an internal document - not sure why the downstream
> >>> driver supports different values or where those were taken from (AFAIK
> >>> they are not supported)
> >> Most likely you have referred incorrect downstream file. Refer scuba-vidc.dtsi.
> > 
> > I took them from actual documents (which might or might not be obsolete,
> > hard to say but they were the latest version and as such, they
> > contradict the downstream dtsi).
> > 
> > So I'd rather not use downstream - could you point me to the reference
> > you used please - I wonder if the fix is required downstream instead of here?
> 
> You can look for this file gcc-scuba.c and refer gcc_video_venus_clk_src which
> is the src for different venus clocks.

sure, but the question remains, how do I know these are correct when the
documentation I have claims the opposite?

AFAIK downstream could be wrong, no?

> 
> > 
> >> Again, good reference for such cases would IP catalogues and if not, gcc driver
> >> in this case which have structures defining different corners for
> >> video.
> > 
> > The PM document for this chip only confirms two values - the other 4 ones
> > claim they are not supported on 50_LT
> > 
> > but we can discuss offline.
> > 
> >>>
> >>>
> >>>>
> >>>> Regards,
> >>>> Vikash
> >>>>> +
> >>>>> +				opp-240000000 {
> >>>>> +					opp-hz = /bits/ 64 <240000000>;
> >>>>> +					required-opps = <&rpmpd_opp_svs>;
> >>>>> +				};
> >>>>> +			};
> >>>>> +		};
> >>>>> +
> >>>>>  		mdss: display-subsystem@5e00000 {
> >>>>>  			compatible = "qcom,qcm2290-mdss";
> >>>>>  			reg = <0x0 0x05e00000 0x0 0x1000>;

