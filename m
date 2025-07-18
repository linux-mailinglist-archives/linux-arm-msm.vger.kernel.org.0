Return-Path: <linux-arm-msm+bounces-65617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B486B09F41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 11:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8E6D189232D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 09:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E63298255;
	Fri, 18 Jul 2025 09:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQSZ7BU5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07A423D289
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752830561; cv=none; b=nNOF8caaGHij2t+CDHn/3jNQL/KASpd+n8Ojmw8E2IQMvqqz4e21kiuWCh1G6DXplLGG/uL0TY2OdxvKVsnY2XBC5YB0kKdDCyGYc3OjgwHEIMKtzDI7yyUCjltsOJBxaNylOIwcMzk3kU3EfHbeEsg9I4UjwcYKIR+JAmgCHtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752830561; c=relaxed/simple;
	bh=T2YmR3w/2YekVQ2iASeRYYiDqahpxzSq3BmLEA+jZe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnqiMm3izVhvXWhbMBRkdqOglPABtWI0/HXgy1o2NW4IxhIkX32zh/QeP+yyyaYIOUUckHO92OsiIxUIvX5h0slQlySpzfEvHd2vbBIyWk/dAzwgkmYHV1HCP80o2Z7Wl7QfNfOUKzikjNRpmD4rHNdcg+1W6eFFW93emL6Szxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQSZ7BU5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8TpkN015642
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l4Bx2iCFIl/1j60UCxhXPVtp
	Oq+pJHhUuf5UW9x1N7E=; b=XQSZ7BU52GlkNRUFI3zB8w9KISomjNq9e8VNO+9O
	OaLWR3EMlPGzhlPyBq768nfk7kh5ojgNwhbwSze/WYH/WjiurDGyL27uRy8FkJHa
	PAQf6JcbzbbYbcATiznllfJItn2xgKGWCQvLOsZ6MtmV0Kk6XLa6Xkjn3hrqAhD7
	882C0NfHXc8f+7TrpOGdgAaMpr//Q4AheeE8R2QFAxcqA/Ab89ddRgQ41jF5XTya
	TnO2pGwaBlIyPB2ATlPRG29Gw0nKA1U1mi4Hs7BY+ZGpkIPAIcMkne8QY6czK1rl
	e3e3uBNYD7ORFnFJQpLwxzWscuJkZyRtXQxLFjCsb32ptQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyww0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:22:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e1b7fe85b1so310867885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 02:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752830557; x=1753435357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4Bx2iCFIl/1j60UCxhXPVtpOq+pJHhUuf5UW9x1N7E=;
        b=EN7Auz23wYRMMN9EcxGJbwDs4CFCL5u3CPcOgESu8bROqK6ZpPZ+vegeZUWMQZIALq
         ov3BGawpV4pc92y1a8nSwZG/aiyUY0u5/1i1GbRiEppgJKmx8wVxOX6vToiuKPmahuCz
         XgEXw6syo+q76ODVVUWrvYJD4Ti+ScDW5J0qyX36XLs5sKyR++0KIjpeKlAMnMBxBg6k
         Wy03crNMTx2MpJ5+6k0LVTv6P5d+UjpYx+RJAAdwLyZihpG2DjTBEcZ72SGrvfIhSMVg
         R4vYzzpzqQAgCvILYiNtp1NDntXE2MCDGhDXKfTHZgfnRztjphWqUHHSjqvAlSSJvQ7U
         qj8g==
X-Forwarded-Encrypted: i=1; AJvYcCUqR9tMvQdx8VJ5mWupflT3n2LojsbFy8hArJ0qsj9lS/3mH6cmXze5c6Ioi9zTWQFsJA0E7RIVUYdD7nBG@vger.kernel.org
X-Gm-Message-State: AOJu0YxitTfEgnPqKqn/ZPHRcD4TjB3MKvFVb8mOoFIn81OpNYWvbnTv
	CLqUQ1EPCsfv2LUA74k+kmqA28QEE1oNzEjo3jEFysiN58EHkUZInOJk9tUKw7k8PDrd9JgWW53
	tvQB8JHvveTL/MxTfKhYnE7/DLaYHJitUNogArzFaHPNBz48EmYuPxHv5KqQWTf8567WW
X-Gm-Gg: ASbGncuCF3lGcvqzYssWTskYyxkxSDhmZgflowe44+gOG1J+wQrm53H2C9NuQuTYv/n
	Y09pYF0cUuPM/A38bz55XuSIUA20Iv3Ruw8FYL/smIXE/qK0EPasREcDkjum6sZMjqvO2e9ohnE
	m/0mMPNjyx+dYO2yr3UEfxHmxVw5KVqmSyCmlFXWh+AkSOlngEVKbCzFL1VJSajqd6WlZaThwvG
	aHnVUpOz5etpffZgyIzgXF/4F4OVAHDVzHs75v3KsIl5KHeLkBAAcvvshHme65JxSRCqgIVPUwp
	es2+yL1Lcbg6dEUp1cz1SGVhgsel2iXy1dvGxLGlnjm6k2xFh2iFvVmAWCBdmksq34Vopf51FtL
	oFP66kQl0TyQgoCUxlxHZ5nMpH3uTPQqE7fQt7zugrwNSE0MZNGOR
X-Received: by 2002:a05:620a:29ce:b0:7e3:4a25:7fce with SMTP id af79cd13be357-7e34a258117mr1168180985a.10.1752830557293;
        Fri, 18 Jul 2025 02:22:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH82NZy4Ihot0adWViWUtkoFyw87FgT1XTtuLHusFtAO0oAmIf+unxWzarpa7mXsBrzakAEoQ==
X-Received: by 2002:a05:620a:29ce:b0:7e3:4a25:7fce with SMTP id af79cd13be357-7e34a258117mr1168167285a.10.1752830554782;
        Fri, 18 Jul 2025 02:22:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a90d4f6esm1477431fa.9.2025.07.18.02.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 02:22:33 -0700 (PDT)
Date: Fri, 18 Jul 2025 12:22:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 0/5] dt-bindings: msm/dp: Add support for 4 pixel
 streams
Message-ID: <lekqhgqzb4iimsu44y54cvxbasux264lbuqsbssj5nd66ocvji@nfuxnyukujjy>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TtnunhVcKVn4pn6WQIk6FOiRJcBj2oxQ
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687a125e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=sO8KT4aWJjNtAKDlhegA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MyBTYWx0ZWRfX6s7PYcIWOQUk
 E12UP+t9yey2yQVVj1b2JWRleZ02BMQDG6gC763Ihioo0mcGzCTmOv4A8z3VlLhfTLNHiV0jDuY
 3HhW5ePhfiDv9Qbsb3eBAyVtRs+0D3t8YSS7FbhfhS2EyLCO+FGrxqeJfwHmyLNSBSWzH4qSrpL
 96uBEMwdvpZX4giZczb+O2A0z0T+S82c0wJeCrjOXAyJYBJzMg5IyeoY+sImzNqXOIHA2hRe+rt
 9SQ6xol6gzEeHvHQYKbBf75r3uuuUhg4zZ/Fqeq/zaARw52WXTEFovvOAuTi5GwpKnCy0BsOC33
 4WdDRu1pqjVM8rs0AYcrSwyiTlcdOE0BDf2C+Khr7HDP/uYUl1fnqzjeLHTLVtIm52k5Q3AnHAZ
 YtJpFb4EEoy8hjnai9wqsaowT+DPoWLu9pw3OmEu1YyAGHk9y8lrYqicIMREXBoeX6oUOGkA
X-Proofpoint-GUID: TtnunhVcKVn4pn6WQIk6FOiRJcBj2oxQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=902
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180073

On Thu, Jul 17, 2025 at 04:28:42PM -0700, Jessica Zhang wrote:
> On some MSM chipsets, the display port controller is capable of supporting
> up to 4 streams.
> 
> To drive these additional streams, the pixel clocks for the corresponding
> stream needs to be enabled.
> 
> Fixup the documentation of some of the bindings to clarify exactly which
> stream they correspond to, then add the new bindings and device tree
> changes.
> 
> ---
> Changes in v3:
> - Fixed dtschema errors (Rob Herring)
> - Documented all pixel stream clocks (Dmitry)
> - Ordered compatibility list alphabetically (Dmitry)
> - Dropped assigned-clocks too (Dmitry)
> - Link to v2: https://lore.kernel.org/r/20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com
> 
> Changes in v2:
> - Rebased on top of next-20250523
> - Dropped merged maintainer patch
> - Added a patch to make the corresponding dts change to add pixel 1
>   stream
> - Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
> - Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
> - Updated dp-controller.yaml to include all chipsets that support stream
>   1 pixel clock (Krzysztof)
> - Added missing minItems and if statement (Krzysztof)
> - Link to v1: https://lore.kernel.org/r/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com
> 
> ---
> Abhinav Kumar (4):
>       dt-bindings: Fixup x1e80100 to add DP MST support
>       dt-bindings: clock: Add SC7280 DISPCC DP pixel 1 clock binding
>       dt-bindings: display/msm: drop assigned-clock-parents for dp controller
>       dt-bindings: display/msm: add stream pixel clock bindings for MST
> 
> Jessica Zhang (1):
>       arm64: dts: qcom: Add MST pixel streams for displayport
> 
>  .../bindings/display/msm/dp-controller.yaml        | 53 +++++++++++-----
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 14 +++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 11 ++--
>  .../bindings/display/msm/qcom,sc7180-mdss.yaml     |  3 -
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     | 12 ++--
>  .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  5 --
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 11 ++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 21 +++----
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 34 +++++++---
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 10 ++-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 20 ++++--
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 72 +++++++++++++++-------
>  arch/arm64/boot/dts/qcom/sm8150.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8250.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8350.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8450.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 30 ++++++---
>  include/dt-bindings/clock/qcom,dispcc-sc7280.h     |  2 +
>  21 files changed, 235 insertions(+), 133 deletions(-)
> ---
> base-commit: 7a88d609b069b7d2f4d10113b18fea02921bedb1

Can't resolve this commit either in Linus's or in linux-next.

> change-id: 20241202-dp_mst_bindings-7536ffc9ae2f
> 
> Best regards,
> --  
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

