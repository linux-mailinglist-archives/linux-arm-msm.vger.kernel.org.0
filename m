Return-Path: <linux-arm-msm+bounces-66084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 356AFB0D9E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C51EF7A4066
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 12:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AB92E498E;
	Tue, 22 Jul 2025 12:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hApQCgri"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684B528B4EC
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753188093; cv=none; b=ZUrelXkCsa6TVPIbhBjmPfVA3TouLORK/0vCtM3/fWNknENWg9z3PracsAUgQb/AgGKq8Yb4mCR9LFBH4Am1O9KXLnM5Fp/gGkmKG9erACVCgY9AtnMzVELvGXgkrpVxGz9aF7sQCok9RSVyMs1VKUTqrdT4nIZPweG7dsghvso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753188093; c=relaxed/simple;
	bh=vcu8bugPUI9z+XsvO7fMENidEfkd5t/DoHjnKI15Uy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTal9TGHFdCaf8JbJQBbnlQwpm6vMXhMCuhvJHwXlV+chRaQa6DoUd8QUTpbOw2y4sVBJ26OM2xcu/xLXT4GX1x9wjADF8mcdMzdi9vv3Yx+UtKk12RUHkuAHQq1nB3/srSVgAB0O2Fp+B+9FR9c+il/SfG/NcYDv1ipF9K/6eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hApQCgri; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7JaVe015646
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HPoaxvi/5bO/h7eZRr8RStad9S7OsZapYBjDAZ9z2vs=; b=hApQCgrivdspZnYY
	3OERPstgvrzphY/dKNp579DQ5dYZPAnwmJqrCMvSkEwl4W4eHhsTJaToolr8zHqk
	jDGQvPJUFULQ/6tu14rdMZi1Z03vW0C1DXIypjeTuB0greUXJTUznDHVh6bSu8dx
	9SbMC3P6C/CQUTGSwvg+sGeXYyDuDL/Wzgj4t6ekEG16aPS5QcaY/uQqhln5OMFg
	SctF1KaauPW328JGVJ5sjps8vfMfScEX5mN+UNpx9qySgJEkW5P5QMmJTaPCp8Gs
	Cy4AHFzviMAySdPyS4LnKrs03avf+8RfncCl/CFOOgAD8AUup1jysp1KO8BXeFB1
	F7eThg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w2j3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:41:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e2e237fb4eso960839885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 05:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753188089; x=1753792889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HPoaxvi/5bO/h7eZRr8RStad9S7OsZapYBjDAZ9z2vs=;
        b=vLbzjGt8hkvwHEBcx5qaV1xaMeiUwavEDeNn7CmYzUHea0ox+tD3fmKgEuBIWNmpax
         s5q6jdOCHIedQ+OqyAabakGoXVZ2/ih0vxA1P0OpoPutlGnSt+PrJlPNghow5vmjhDSU
         DLi08ryDZ8HXz6fzvT5QaPBquKscHiqgHS91Ycln+t4agvb/kID/uCR+bvLQi7okgSsr
         KLaHkxjL5KViNW8BEXk0FFTeS4iONoUyWTITQYiC9pWEl/xqeIsNVEVoYABsaM4VkDmF
         n/GkkqhsoGfW7n+BpipmAyJqQ3JSNde+XcZoJdTndZIVj8xq56P0LVfhhyVfaUjAbMpi
         HPdg==
X-Forwarded-Encrypted: i=1; AJvYcCUsAZIC145DGIOgsWryuShCt3RrMDmlCDFdsVLtnwGDHbUbtaVi/vG1AlscYAx7najuSPRTuKqw9wCiXA0+@vger.kernel.org
X-Gm-Message-State: AOJu0YyCmRzWU63xdzq8qKjOTvhQ5bh1show8kq3AuUmcLt+I0Mkx4yq
	KXBMnYFV2EFQKvianKZkzfoFVxlMelD5nBB5PNKuFldrEVdfHLW4GNz2pNtNv+uH/RXG5+G4nBm
	bwucZCPS1Q+usUUZOh2B/LiBDxRpFbDNiO9YG7camcJV6ZOuBwXDRNrX2mk6ja9Ac/34K
X-Gm-Gg: ASbGncs5rlvKo6YpfGrswSLD8CZwNXGKQxLv+XAsUuE3epbMdvHJVS+C7UBmZNYQ+0M
	muYk4hcw1PGyo/QL6jiSXyv2wIbFXUNSYTtrEaEGy5VYZVRKT4ZIZzjyXjAXOY/2pfkmGM0Ak5L
	Jt84G5aYEkbKDl2MgfcEEgWk30yxNR9FNHn1gqJupP+4cCogH1PFErSOHDI11AKVwuCmtiOsMAi
	rB9m2Ku2O4xAJdKQ0bPMDfZ7LJC9rL/FwQaBrysBbn1gw8GO/xDmM4vVZLFGtOvuwqeOV4SqceR
	GoPOArBf5kUQXmMbVYQzR7GuZWZOgxElOOJtEDeUKImzzHnOEkb6ddF893u/xJ73rQx82zwHSd5
	ZCw1naLS69SftzwdXZe/58AJYrF9l7V0CuX2vBogdXW8a02o6vp/6
X-Received: by 2002:a05:620a:a111:b0:7e0:6aa7:386 with SMTP id af79cd13be357-7e34d8fc169mr2764102585a.19.1753188088870;
        Tue, 22 Jul 2025 05:41:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA4wANK0XSCQTa2429llOZl1wgDzsnRsA6lFOrCo2WksXeOi8CYcvEop+soj69BYJ4tBRyrQ==
X-Received: by 2002:a05:620a:a111:b0:7e0:6aa7:386 with SMTP id af79cd13be357-7e34d8fc169mr2764096785a.19.1753188088259;
        Tue, 22 Jul 2025 05:41:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a35b5a7dfsm1746438e87.227.2025.07.22.05.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:41:27 -0700 (PDT)
Date: Tue, 22 Jul 2025 15:41:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        konrad.dybcio@oss.qualcomm.com, fange.zhang@oss.qualcomm.com,
        quic_lliu6@quicinc.com, quic_yongmou@quicinc.com
Subject: Re: [PATCH v2 02/13] dt-bindings: phy: Add binding for QCS615
 standalone QMP DP PHY
Message-ID: <w3rwao5wbmstdyics6qhp7beulbbp5ludqkwpfsmevgqmzz3d6@u2e533zlitkr>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
 <20250722-add-displayport-support-for-qcs615-platform-v2-2-42b4037171f8@oss.qualcomm.com>
 <jemfu5sy7k4a2iar55im5bhyhxzlrwpftmpqmps3b2tco7r6a2@oodls7gi45yy>
 <e673a3a3-6924-49db-9040-e34b82199a43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e673a3a3-6924-49db-9040-e34b82199a43@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687f86fa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=Oh2cFVv5AAAA:8 a=EUspDBNiAAAA:8 a=O_WmNVlCytCE8eSXzh4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEwNCBTYWx0ZWRfX6xACxqKWVLb3
 dvZp8a9z2DDwcTKBravBEJhmv+DRZD4UCTju4hj20sLGadvaN9b7vMg7Y6wmULfptVFsRvIOcbs
 lX6mUFV1SHOME05GnBFbBKV3PTLd+xNjuSzrchGlDvW835K+sycJbeQsIetg+7WB8TUWm59HSHd
 hOn1Tam4jESAYgwL5p3ts0HZ/dopA1cEXLrgDn6Dn43j1ru3MXm/BS6cwKrLRJQs3FeUWKrLuB8
 xy1Ucw3hMyOj60+PNNoq5QVsVu7rEzzYMizteEdVkADWHLR8Kt41E8VloDDSidp73o+7pcrIVBa
 0FuKdLSzrAhhZxViFHc10uvAQj9+vOQ1A1RyeEerHjseuSeMskpt+IgxlcqUw+jEiwmL9+XO/er
 KjYtTKL5JDgS+2IbiwiCMMB8BEJOlRaiDxhIr6rLeqkenQA+VdiSwBe3xusVKkSRHxlAq/Xb
X-Proofpoint-ORIG-GUID: 6TpRW-FNWb0PQuRXHV6o22655h6PRI2D
X-Proofpoint-GUID: 6TpRW-FNWb0PQuRXHV6o22655h6PRI2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220104

On Tue, Jul 22, 2025 at 08:05:06PM +0800, Xiangxu Yin wrote:
> 
> On 7/22/2025 4:38 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 22, 2025 at 03:22:03PM +0800, Xiangxu Yin wrote:
> >> Introduce device tree binding documentation for the Qualcomm QMP DP PHY
> >> on QCS615 SoCs. This PHY supports DisplayPort functionality and is
> >> designed to operate independently from the USB3 PHY.
> >>
> >> Unlike combo PHYs found on other platforms, the QCS615 DP PHY is
> >> standalone and does not support USB/DP multiplexing. The binding
> >> describes the required clocks, resets, TCSR configuration, and clock/PHY
> >> cells for proper integration.
> > Simply put: no, this is not correct. Even if you go to the SM6150 block
> > diagram, it points out that DP uses the USB3 PHY, not a separate DP PHY.
> >
> > I thought that we have discussed it beforehand.
> >
> > I can quote my comment from the previous thread:
> >
> >>> No. It means replacing extending existing entries with bigger reg and
> >>> #phy-cells = <1>. The driver must keep working with old node definitions
> >>> as is to ensure backwards compatibility. New nodes should make it
> >>> register two PHYs (USB3 and DP). On the driver side modify generic code
> >>> paths, all platforms supported by the driver should be able to support
> >>> USB3+DP combination.
> > Looking at the hardware memory maps:
> >
> > MSM8998: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
> > SDM660: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
> > QCM2290: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
> > SM6115: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
> >
> > Now:
> > SM6150: USB3 PHY regs at 0x88e6000
> >         USB3 PHY regs at 0x88e8000, DP PHY regs at 0x88e9000
> >
> > I do not know, why msm-4.14 didn't describe second USB3 PHY. Maybe you
> > can comment on it.
> >
> > But based on that list, the only special case that we need to handle is
> > the first USB3 PHY, which doesn't have a corresponding DP PHY block. But
> > it will be handled anyway by the code that implements support for the
> > existing DT entries. All other hardware blocks are combo USB+DP PHYs.
> >
> > Having all of that in mind, please, for v3 patchset implement USB+DP
> > support in the phy-qcom-qmp-usbc driver and add the following logic
> > that also was requested in v1 review:
> >
> >>> Not quite. Both USB3 and DP drivers should be calling power_on / _off.
> >>> If USB3 is on, powering on DP PHY should fail. Vice versa, if DP is on,
> >>> powering on USB should fail.
> > I think our understanding might not be fully aligned. 

I did not write this. Please fix your mailer to quote messages properly.
As you are using Thunderbird, I'm not sure where the issue comes from.

Also please fix it to wrap your responses somwhere logically.

> > Perhaps this is because I didn’t accurately update the mutual exclusion relationships and test results for the different PHYs. 
> > Let me clarify my latest findings and explain why I believe these are separate PHYs that require mutual exclusion via TCSR.
> >
> > 1. About the TCSR DP_PHYMODE Registers
> >
> > MSM8998/SDM660:
> > 	Only one TCSR_USB3_DP_PHYMODE register at 0x1FCB248.
> > QCM2290/SM6115:
> > 	TCSR_USB3_0_DP_PHYMODE at 0x3CB248
> > 	TCSR_USB3_1_DP_PHYMODE at 0x3CB24C
> > SM6150:
> > 	TCSR_USB3_0_DP_PHYMODE at 0x1FCB248
> > 	TCSR_USB3_1_DP_PHYMODE at 0x1FCB24C

SM6150 has two different sets of output pins, so the first register
covers first set of SS lanes (which are routed to the documented SS
PHY), the second register covers the second set of SS lanes (which are
routed to the DP and secondary USB PHY).

I can only assume that the same configuration was supposed to be
applicable to QCM2290 / SM6115, but was later removed / disabled, while
the registers were kept in the TCSR block.

> > Even though MSM8998, SDM660, QCM2290, and SM6115 all have one USB3 PHY and one DP PHY, the TCSR DP_PHYMODE register configuration is different on each platform.
> >
> > Additionally, I found some interesting register documentation for QCM2290/SM6115:
> > 	TCSR_USB3_0_DP_PHYMODE: “In kamorta this one is for mobile usb. DP not supported.”
> > 	TCSR_USB3_1_DP_PHYMODE: “DP mode supported for Auto usb in kamorta.”
> > I think the reason for having two different TCSR registers is to allow both the USB3.0 and DP PHYs to be useds at the same time in certain product configurations.

Sure. One for the first PHY (USB), one for the second PHY (USB+DP).
If you check the memory map, you will find the second VLS CLAMP register
for the second USB PHY.

> >
> > 2. SM6150 Test Results
> > When TCSR_DP_PHYMODE_0 is switched to DP, the USB3 primary PHY cannot work, and the DP PHY is also not functional (possibly due to clock lack or other configuration mismatch with this TCSR setting).
> > When TCSR_DP_PHYMODE_1 is switched to DP, both the USB3 primary PHY and the DP PHY work normally.
> > I think "why msm-4.14 didn't describe second USB3 PHY", because TCSR_DP_PHYMODE_1 always works in DP mode.
> > https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_catalog_v200.c

Here it still programs the TCSR register.

> >
> > Based on these info, I believe these are separate PHYs, and only the
> > TCSR DP_PHYMODE registers determine which USB3/DP PHYs are paired or
> > mutually exclusive. This is why I have maintained separate private
> > data for each PHY and implemented Power on mutex control via TCSR,
> > rather than using a qmp_combo-like structure.

Still, no. Check the block diagram of SM6150.

> >
> > Given the above, do you think we still need to force USB and DP to be strictly bound together like a combo PHY?

Yes.

> >
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  .../bindings/phy/qcom,qcs615-qmp-dp-phy.yaml       | 111 +++++++++++++++++++++
> >>  1 file changed, 111 insertions(+)
> >>

-- 
With best wishes
Dmitry

