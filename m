Return-Path: <linux-arm-msm+bounces-62812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05466AEBB09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14181560F8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2070E1C6FE8;
	Fri, 27 Jun 2025 15:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGxzK2vo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4163F296163
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751036917; cv=none; b=WZOPxID4RxDd36gJzFMwwcS0UBZevtxa41CcebXxZYSewQsHmFGU8ZFeH/MI0jVIjZtJlUrJIwo7rBH2DLQzlrM/kPhKs4p4bNtM1ntPpbgMRQf9BK/SZdxR9OnGHBSqsP0QUXdMVDi87hSGB7lFQxom19mBHvYw9INGluJYpy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751036917; c=relaxed/simple;
	bh=kpMTMvA3cHKV1C25fHAt4ScwoPCkE8sx7InfnacHj44=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWmam/wBEYuK5oNRasYXtUvcsl11Xqq9nTJ28B/FQ9DBOYaT/COghrhErPVnAeWV+PqDHNjQ+NdqL2oMzLe9+P94XHX12NaLYN1LgVleSi1JTOnUcBEx+bQFULg3ds0pD1N0rj3GDojzm4fuPEoXW0BgyOLYx25FWY9MYdMLwbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGxzK2vo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC95dX032643
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P73tOWEQ2c6J/KzyC3iJome9
	vnN0/Y1gdrBWWFMKlSQ=; b=AGxzK2voQZNGlKU+WUxJP1Nb0cKbZcDdS2Chg+GU
	7pP3+fUgVtkKnm3ZqRX9X+jxiGpQ+BAjsdL19rmDYSR981J/5Kq0XK8LPx0NsD2k
	YN0/yKY7XXHNC7S13iPT1qYCZjUVVPLDi50Pdx0rD+1kProcdMklcj66kzoYlxVs
	iGjn5u7csMS00ngM+bzwM0kE3TR3N/7wdBD8aZHUGQaettxFCDFsoO42XHjuCVFY
	pzcbNfd49lS073GBYzPWXRugEVy2a3mbwW9wI+EZ4JuMpepqoJAkBh4GJS7Q3jUk
	YLRMPLJ9gfK2Y59QDmanmdTo+UYU4yCWq1s5OHXpOmGvZg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdh8tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:08:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a57fea76beso49633611cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 08:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751036913; x=1751641713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P73tOWEQ2c6J/KzyC3iJome9vnN0/Y1gdrBWWFMKlSQ=;
        b=NGSQCBNgMRGgbwVOJi6vcXjfqpq4AgkAa2wT6NUCTBA/wLp2epTVEwZPwTpoebpelu
         tjuAV/u+6ncroXlta2YxvNQrSdcXQmLG24By2NuRHggjGRSIiSWQt2xbkcGBVyyjqJEd
         ZdDgO+G83+YSIVNhJejbT3b57GmCq6av4dFOo5CnmUI+IFmgftnj51Wy+uHeVkiGtjuy
         SJGQ3MrAU1RBfZ0+uJXJyvGlfay+jGhDIvrka/Y8OCmSKiI4/GdFBxw6J3fbxs9aWJ2I
         NSOe0JfaeSGavQF1f9kF5eOHP+1keoteprVEvUgmQ6Pa07h8TZUa0h3wbSGxsWPQt5rz
         blsA==
X-Forwarded-Encrypted: i=1; AJvYcCWFL0N1Gio8aeBc3fBF0YHnbfSD5Ey1qPEkEfAPa9tgh71OwkkSJst8Re3X4FmGN2mpTc7PJjyH7/zoLnzj@vger.kernel.org
X-Gm-Message-State: AOJu0YwNA3JFyBaTsio7xetaWO9PgtveQncbzQHp/o208pTNKa/cWky8
	7Iafn2vjooPe/yCInGE2HBlGFdqh+abfaFTS9IPtcGEvWzXnMK7Zh06BZDvKbQr210hoI/rbxxd
	XbKOGePCJh+yP8xYeWIy1vp1+1uNg6UciUF9khjaQWH6e7biQaWcCQT9fwtJj52vaTKu6
X-Gm-Gg: ASbGncvDr8dr+zGsauT04n55B3P3YdpLSYTFaGBMPj/z/s72ygXS7Ysh6I1/vkD5dih
	Yf0M1k48Uug0DSuyy4SYqtTjJ/nOc7YrSK3PMoQsW98hQxlbS3oquMOak6Zx06Zu1Z8Ok26VhNy
	Vuta5bBnZP+7RwCg0lSEe2Zx4L2dxGWO7bPJtR0nwWaBMB2kA5A9STbr6qjw4dCZwGM2Hg3FNFd
	ujf9Chi+J1kXxgytsbiRoYVgSU/QOqccXv0APDxbGCzjYmTQWYFdVRhv7/WV66ofv+K3Q82ZuyL
	ALm3UUpAZKiq9XihD5q+C6e6FX/nkJXe3BYZYF+68p041lNtR0wwOK3kXQ==
X-Received: by 2002:ac8:4f05:0:b0:476:ff0d:ed6c with SMTP id d75a77b69052e-4a8040706eemr14633191cf.40.1751036912890;
        Fri, 27 Jun 2025 08:08:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9WiaEVlfLqLgMXPTA0t8gmR7V19G9517FcdHUO2A8QtsXrCGFlce45537kX8z4hnAg6p1xA==
X-Received: by 2002:ac8:4f05:0:b0:476:ff0d:ed6c with SMTP id d75a77b69052e-4a8040706eemr14632841cf.40.1751036912270;
        Fri, 27 Jun 2025 08:08:32 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453814a6275sm57996535e9.1.2025.06.27.08.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:08:31 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Fri, 27 Jun 2025 17:08:30 +0200
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aF6z7iaicHyNXg6w@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <6e330e8f-5856-ef8e-5fe3-52bd61b59e02@quicinc.com>
 <aF6PqCY/E6H0Mc2/@trex>
 <2722e70a-1080-c9f3-eb56-4a6e79084bdc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2722e70a-1080-c9f3-eb56-4a6e79084bdc@quicinc.com>
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685eb3f2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=4ycgIVn65cuQyXs68zAA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyMiBTYWx0ZWRfX97DnJFq1rN3/
 5cBHQm4+h21TTvPnIlnfDsC1RA2DhggFKJdYWP6it9QbdCL2y8UbXGdphFwSR7gF4IHVLDl7Ds2
 ZYwytUiBwwOZbOy0kUI19O/cCroK8pfMDGHU9d2OSeoBp2gPTmJQpRWpwnE7of+pwhmxTwopsRR
 92RXRYX0FD2+KeLSYlKFIHGCfPf2Yc81cFUdrQOZ2zrYvgy6hGX8YFq+shriJ01iElNqWLd46us
 kbiRrihK8c5NDVXwOY7FqcD1YcmESFMZDvfKOkCAfnMl4K2RP4U+35Wf2mF7OKXB8pofgwzjvO5
 xLCAorelVSnU1dRtC5DIP0eoq7sL2bnL2G5bq4zFM9L/6fZhIOA8/0nVPtXIORZAiHAh6tctboe
 A1HNH0oabLYn5Wwz1P5+vAe/8nR4ywmRJmjztEQa+KMafEW3+w0yZd6OzsChPsgULLg//nbE
X-Proofpoint-GUID: 4nePca6PQKNLDyVao0vWeZF3syx3HoEs
X-Proofpoint-ORIG-GUID: 4nePca6PQKNLDyVao0vWeZF3syx3HoEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270122

On 27/06/25 20:28:29, Vikash Garodia wrote:
> 
> On 6/27/2025 6:03 PM, Jorge Ramirez wrote:
> > On 27/06/25 17:40:19, Vikash Garodia wrote:
> >>
> >> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> >>> Add DT entries for the qcm2290 venus encoder/decoder.
> >>>
> >>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
> >>>  1 file changed, 57 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>> index f49ac1c1f8a3..5326c91a0ff0 100644
> >>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>> @@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
> >>>  			#iommu-cells = <2>;
> >>>  		};
> >>>  
> >>> +		venus: video-codec@5a00000 {
> >>> +			compatible = "qcom,qcm2290-venus";
> >>> +			reg = <0 0x5a00000 0 0xf0000>;
> >>> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> >>> +
> >>> +			power-domains = <&gcc GCC_VENUS_GDSC>,
> >>> +					<&gcc GCC_VCODEC0_GDSC>,
> >>> +					<&rpmpd QCM2290_VDDCX>;
> >>> +			power-domain-names = "venus",
> >>> +					     "vcodec0",
> >>> +					     "cx";
> >>> +			operating-points-v2 = <&venus_opp_table>;
> >>> +
> >>> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> >>> +				 <&gcc GCC_VIDEO_AHB_CLK>,
> >>> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> >>> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> >>> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> >>> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> >>> +			clock-names = "core",
> >>> +				      "iface",
> >>> +				      "bus",
> >>> +				      "throttle",
> >>> +				      "vcodec0_core",
> >>> +				      "vcodec0_bus";
> >>> +
> >>> +			memory-region = <&pil_video_mem>;
> >>> +			iommus = <&apps_smmu 0x860 0x0>,
> >>> +				 <&apps_smmu 0x880 0x0>,
> >>> +				 <&apps_smmu 0x861 0x04>,
> >>> +				 <&apps_smmu 0x863 0x0>,
> >>> +				 <&apps_smmu 0x804 0xe0>;
> >> keep only the non secure ones.
> > 
> > ok
> > 
> >>> +
> >>> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> >>> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> >>> +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> >>> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> >>> +			interconnect-names = "video-mem",
> >>> +					     "cpu-cfg";
> >>> +
> >>> +			status = "okay";
> >>> +
> >>> +			venus_opp_table: opp-table {
> >>> +				compatible = "operating-points-v2";
> >>> +
> >>> +				opp-133000000 {
> >>> +					opp-hz = /bits/ 64 <133000000>;
> >>> +					required-opps = <&rpmpd_opp_low_svs>;
> >>> +				};
> >> Fix the corner freq value
> > 
> > can you add some reference please?
> > 
> > I took this data from an internal document - not sure why the downstream
> > driver supports different values or where those were taken from (AFAIK
> > they are not supported)
> Most likely you have referred incorrect downstream file. Refer scuba-vidc.dtsi.

I took them from actual documents (which might or might not be obsolete,
hard to say but they were the latest version and as such, they
contradict the downstream dtsi).

So I'd rather not use downstream - could you point me to the reference
you used please - I wonder if the fix is required downstream instead of here? 

> Again, good reference for such cases would IP catalogues and if not, gcc driver
> in this case which have structures defining different corners for
> video.

The PM document for this chip only confirms two values - the other 4 ones
claim they are not supported on 50_LT

but we can discuss offline.

> > 
> > 
> >>
> >> Regards,
> >> Vikash
> >>> +
> >>> +				opp-240000000 {
> >>> +					opp-hz = /bits/ 64 <240000000>;
> >>> +					required-opps = <&rpmpd_opp_svs>;
> >>> +				};
> >>> +			};
> >>> +		};
> >>> +
> >>>  		mdss: display-subsystem@5e00000 {
> >>>  			compatible = "qcom,qcm2290-mdss";
> >>>  			reg = <0x0 0x05e00000 0x0 0x1000>;

