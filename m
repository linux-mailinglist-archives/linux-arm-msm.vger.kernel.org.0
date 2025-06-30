Return-Path: <linux-arm-msm+bounces-63128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAC1AEE9DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 00:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABCEB1BC0D39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 22:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F5B24336D;
	Mon, 30 Jun 2025 22:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="et1/w5/J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DE823FC52
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 21:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320800; cv=none; b=MVeepU32DVHAwp2J+YO/B848poeKA/Wstugx5kO/kyOKvmT3eZ8+2V9YUS+P4wm/GheYILKmdlAbjWqrTXMxlyc9OZ6hJbi51BDddbc9m/eFa0jnBVFojRxHS0YuBfy9fj7kKoUh/bv7ft0fNjz2cumul9EXYQbc7TJmL2jB3DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320800; c=relaxed/simple;
	bh=zuloaCZER//BFJaKOvxnCQbs1oE1h9o1l00traZvW+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtYH4NPt8SpSsUJT09CeagxpcHxjkHJehNaxsP+cu/4pP9YCEI0cqWhJftH2kgYJ+176E7jitKBXK+I/bdMrzHnR6dlmbjKF6JwyGUUBoCgZ/Cg6T/P3uT9oZ9prWn2AFX0H4vB1BP8xq9b4rJx+22ADMU6/R3sY2FWJVZgI4vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=et1/w5/J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFT8Kj008152
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 21:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j5Bn6WtEbimwKYIt4/ZjgnbS
	pY9GsCsqCOMb7LdunEU=; b=et1/w5/JkJ7dXjXHYCkG8PGJ0gnTKCmfuMUAHgEo
	HMusIxEdMGHLVJMBvRXcHeFJ0IU8yHu338YA+kKlJ8zoqUKay/z8lRaXyYA5xXQe
	TvnFe7sGzVvRjLokMOAw9kZDHFwXOY0Y0VWk5XtDY5ivwcpJOldPKRyo0jsu82W1
	67+g32o0eWSyLsW7C+lEHxRGzbCq8ncj10DBJcBvDfY5E/VHglRmsaJDBguRp+s7
	tcQINy6lXufuwmV5jYBFBFKJHeiXSGnUQYng1bF6DrIdzL7T+BseAAMVuz0GKOTu
	wwQiYhV6I7cl5nv7Eb2HThnTgr28MTwHHOVMFmYjdqxN8g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmtx87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 21:59:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2eb60594e8so1636723a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 14:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751320794; x=1751925594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5Bn6WtEbimwKYIt4/ZjgnbSpY9GsCsqCOMb7LdunEU=;
        b=u3TLsGrAZkTVo826RjoKlhdbjs5PH9TSkTtpx4P3y4zQkN8jMUmRla9yfq8XIUf9u+
         OlSwozsFHWHDNCiAw5HKJ6RHilJPfVAYIloOvdNchoqnrStUb70s465SLOUUqlQWhoZl
         /2Iu7fy1ioPXM3M0hh7zjLQvAAjYCgcsR85GvuKT0EfT9JkttxfsDjj5H+AViXhvaqxt
         DETQOfpcTwvVIrZ50GdJzl9y7eJBecX6NLBqH5OxKxsMHF+Ap3AihQr9UMwKLnY1o6Wu
         f5pvcekyVljNwy7KfoQ8w7kGidUsHaanmKRRXPlY8/myvfUSFkjMiGgtZYL2z40JA5df
         QiVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoOwg9PhNLTmVucOWO0HP34Ad72byTDaCVAPIOXSDeNlKsZl0xd4qwvcXMku3QiATFBfIUO7sdwq29pIuL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Sg/3nCnMfw25+yNsTbuC8+q5LNv7Z+M9K7JxLGOta7JeKKkW
	bEzijcp82x4eFcpIKZArQ9Flxvfr0E+3vBPUBpGRL3zqT+YCMfRaInV4WUAIMBMo8ZI61ngf7ks
	AfvG4vFqT+ZNQKMTb3yal020ftVqtjPe4Vr1/MZcPxsBnxZjPHFRmr7nG2aop0jZY8T5C
X-Gm-Gg: ASbGncv5QZx51rKzDQY1TKSUdGb1xwT8Z5F//aNINlifZOhtRBUbs8djDAeASxPzvM7
	pNWDrZdZFfno0Wu24ky9ui3KDM2A9Mqn2bBSi3SF0iakRL7BQraBVlwCxhkDj3V6Q1cX8GhuHEU
	AaP2Pt5I7SRkDxfXV/WeECWG2DNXxB1FdGp69ty/iDHZ8GRyp37u6h7VRnhduL9nCOiRaRlaXzg
	qzz7PC38bBUFraFKembbsOwhQqeGpRdA8i/ZiC7m8Lazd4QsDsVSw0+HQsFgX9z/njHXk5M/MLC
	ri+9V61QXWbG07uLz3v5dkCsa+UIzug4hK1dW+QcXLXMB6Ty4srtL/5bklEI/FFp10EeoCwlmlM
	04AdCiQ==
X-Received: by 2002:a17:90b:268d:b0:312:e91c:e340 with SMTP id 98e67ed59e1d1-318c9283adfmr21494860a91.35.1751320793820;
        Mon, 30 Jun 2025 14:59:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb3EC+ajrtLWff/5gPWkKDnqD5kFdfXbHl7+2iA8bxSslPgNcBKF5TWjxSHHYgk8wAF+S2XQ==
X-Received: by 2002:a17:90b:268d:b0:312:e91c:e340 with SMTP id 98e67ed59e1d1-318c9283adfmr21494807a91.35.1751320793324;
        Mon, 30 Jun 2025 14:59:53 -0700 (PDT)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f542661asm14131485a91.26.2025.06.30.14.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:59:52 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:59:49 -0700
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: Re: [PATCH 00/14] Various dt-bindings for SM7635 and The Fairphone
 (Gen. 6) addition
Message-ID: <aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com>
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
X-Proofpoint-ORIG-GUID: GPt_hlBD1eQ69-pHM4PjYcL_jc2kTmGD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE3OCBTYWx0ZWRfX0EkC+mAfrwvm
 qeQvGYMiNGzXjRLofxaK1jBu1U684oljwTtg5lZTtBPLv8TviIO34EfoWktc+lwn/1srhbGIL59
 OE149V9VXd2CNEpl137ONpewjeXmchSrtlMDBeOxNrnfdjTnVkIqmilcBbtcAj8sW2oCFbxaYOV
 /UHlXNQ0r+Lviit9vY6h9q3+uFvB7/emWCg6oFF7g3HVc3SZd8jleWq8I/JJQfl6vpOyCZjTsQY
 4F4FQwlCwXSWq3FvRG7pmsLHVR1n5kfbN2ArM91VsMpV+Z1DQD+z00HzYjLWxG+76Cin2CM1IkC
 Xonvg4M8q8Jfr5d3lmf69KPkmiT1ATkRrMaMmi87cOi1f29rRThqFSFo8NY3T8Avzy6E3e7krkq
 kpACbT9vQ1w71U3qRIdgIlN2v8pYAvZ4RsGWsXuv9H7lkUUEYIYIvLCrah1vUjXe0X6hpU8O
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=686308dc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=ykmX_Yx8RuNhN3dvDKMA:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: GPt_hlBD1eQ69-pHM4PjYcL_jc2kTmGD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300178

On Wed, Jun 25, 2025 at 11:22:55AM +0200, Luca Weiss wrote:
> Document various bits of the SM7635 SoC in the dt-bindings, which don't
> really need any other changes.
> 
> Then we can add the dtsi for the SM7635 SoC and finally add a dts for
> the newly announced The Fairphone (Gen. 6) smartphone.
> 
> Dependencies:
> * The dt-bindings should not have any dependencies on any other patches.
> * The qcom dts bits depend on most other SM7635 patchsets I have sent in
>   conjuction with this one. The exact ones are specified in the b4 deps.
> 

Very nice to see the various patches for this platform on LKML!


Can you please use the name "milos" in compatibles and filenames instead
of sm7635.

Regards,
Bjorn

> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (14):
>       dt-bindings: arm-smmu: document the support on SM7635
>       dt-bindings: cpufreq: qcom-hw: document SM7635 CPUFREQ Hardware
>       dt-bindings: crypto: qcom,prng: document SM7635
>       dt-bindings: firmware: qcom,scm: document SM7635 SCM Firmware Interface
>       dt-bindings: qcom,pdc: document the SM7635 Power Domain Controller
>       dt-bindings: mailbox: qcom-ipcc: document the SM7635 Inter-Processor Communication Controller
>       dt-bindings: soc: qcom,aoss-qmp: document the SM7635 Always-On Subsystem side channel
>       dt-bindings: thermal: qcom-tsens: document the SM7635 Temperature Sensor
>       dt-bindings: dma: qcom,gpi: document the SM7635 GPI DMA Engine
>       dt-bindings: mmc: sdhci-msm: document the SM7635 SDHCI Controller
>       dt-bindings: soc: qcom: qcom,pmic-glink: document SM7635 compatible
>       dt-bindings: arm: qcom: Add SM7635 and The Fairphone (Gen. 6)
>       arm64: dts: qcom: Add initial SM7635 dtsi
>       arm64: dts: qcom: Add The Fairphone (Gen. 6)
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    6 +
>  .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |    2 +
>  .../devicetree/bindings/crypto/qcom,prng.yaml      |    1 +
>  .../devicetree/bindings/dma/qcom,gpi.yaml          |    1 +
>  .../devicetree/bindings/firmware/qcom,scm.yaml     |    2 +
>  .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
>  .../devicetree/bindings/iommu/arm,smmu.yaml        |    3 +
>  .../devicetree/bindings/mailbox/qcom-ipcc.yaml     |    1 +
>  .../devicetree/bindings/mmc/sdhci-msm.yaml         |    1 +
>  .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |    1 +
>  .../bindings/soc/qcom/qcom,pmic-glink.yaml         |    1 +
>  .../devicetree/bindings/thermal/qcom-tsens.yaml    |    1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  arch/arm64/boot/dts/qcom/sm7635-fairphone-fp6.dts  |  837 ++++++
>  arch/arm64/boot/dts/qcom/sm7635.dtsi               | 2806 ++++++++++++++++++++
>  15 files changed, 3665 insertions(+)
> ---
> base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
> change-id: 20250623-sm7635-fp6-initial-15e40fef53cd
> prerequisite-change-id: 20250616-eusb2-repeater-tuning-f56331c6b1fa:v2
> prerequisite-patch-id: 5c504d171a4d1acd9ec376e01e0dd0fddbad92b8
> prerequisite-patch-id: 0c97dcf5472fbed8ef4cffbd482f3169fe1e972d
> prerequisite-change-id: 20250617-simple-drm-fb-icc-89461c559913:v2
> prerequisite-patch-id: 1ce32150adbe39ad43d9a702623b55937d92a17c
> prerequisite-patch-id: 3562d9a85381bee745402619a7acba9b951f145c
> prerequisite-patch-id: f8447266657b779a546ecbbbc2e38bd61c422f08
> prerequisite-patch-id: cb9d07c82e73ab3691e0ace9604bfa69cdd6bb64
> prerequisite-patch-id: 18ab6ca6a024e5b8ea8138111064db593d72da35
> prerequisite-change-id: 20250620-sm7635-socinfo-8c6ee8d82c9d:v1 # optional
> prerequisite-patch-id: f1b2e11df96c271c9e3d010084809f361ee4249c
> prerequisite-patch-id: 1471abf17230db340c67a84b5a9009f1f2ea6e0e
> prerequisite-patch-id: 57bff00c4fedce1b78615375f12517b955dd1d16
> prerequisite-change-id: 20250620-sm7635-pinctrl-9fe3d869346b:v1
> prerequisite-patch-id: 43b88c44c6fc5b72a490cd3acc5d2585206e81f2
> prerequisite-patch-id: b3b6ebd4a288bd4abf227c939a1a92eafb2cf2c8
> prerequisite-change-id: 20250620-sm7635-clocks-7699d338dc37:v1
> prerequisite-patch-id: 48485e0e7e8a992695af1690f8cd2c09c227a4bf
> prerequisite-patch-id: 4685ceba3f900ad6d1d2ae35116d37f64a171d5d
> prerequisite-patch-id: 80f71dad0c0a77da98e5e66b592f38db6d81b4b1
> prerequisite-patch-id: 49a2fa1a14931d9143da232969e7487061466930
> prerequisite-patch-id: f5d1794f61488235644f78ffc28e3dacdab215d1
> prerequisite-patch-id: ab257573067ff09c94270e1fa6ad4de1480c06b9
> prerequisite-patch-id: 6608bd3f2e198a0780736aebcea3b47ee03df9ef
> prerequisite-patch-id: c463d0d2d84c8786ed9a09016f43b4657cbc231e
> prerequisite-patch-id: e113e76af37f01befaf4059ee3063cb45b27fd6b
> prerequisite-patch-id: 40f8b8acd07a9ff7da8683b1be6a58872250e849
> prerequisite-change-id: 20250620-sm7635-clocks-misc-0f359ad830ea:v1
> prerequisite-patch-id: 127f332296fced39a2fd2f9a1f446ba30ec28ceb
> prerequisite-patch-id: d21a0c8ceb06523c9f3f4ce569d28714878b3f84
> prerequisite-patch-id: 87029a8844ef174ab3e0f953a1d16957fe6c13cc
> prerequisite-patch-id: 095c767d7b7aa67d47026589c926636e57349ca6
> prerequisite-change-id: 20250620-sm7635-rpmhpd-dcb5dc066ce2:v1
> prerequisite-patch-id: d71fe15334032610c05cb55aeb28bfaa44e3530c
> prerequisite-patch-id: 729544e856b8046f7a311b719d9495f8b33c1e1f
> prerequisite-change-id: 20250620-sm7635-icc-e495e0e66109:v1
> prerequisite-patch-id: b387217215d6f83cbd50c380171b159a2f1406d8
> prerequisite-patch-id: bffd82274c35f6d520f524aa2a9c1c4bef7e047e
> prerequisite-change-id: 20250620-sm7635-eusb-phy-d3bab648cdf1:v1
> prerequisite-patch-id: c242c9b099d738214def29d2e464b64be5f14e62
> prerequisite-patch-id: 8c1eb426c08bc1ec9462e77139b3b64d5e1453e9
> prerequisite-patch-id: cdbc469ab33002c6bf697c033755b598dd1a621e
> prerequisite-patch-id: 6bb2900bb530880091622ef47d141fe1f5756a52
> prerequisite-change-id: 20250620-sm7635-eusb-repeater-0d78f557290f:v1
> prerequisite-patch-id: 5c504d171a4d1acd9ec376e01e0dd0fddbad92b8
> prerequisite-patch-id: 0c97dcf5472fbed8ef4cffbd482f3169fe1e972d
> prerequisite-patch-id: a618abb349c3de5b49f79b4b0f86d9ab502ad500
> prerequisite-patch-id: 09f91ff3a25c16a0375bdfec80604a64eab0b4fb
> prerequisite-patch-id: 8fca8b09d70409c5c78f9f1b77d0a4c75bce38cf
> prerequisite-patch-id: f5c2c24d2baefcd7ff91718529ab2f2c264ab99f
> prerequisite-change-id: 20250620-sm7635-remoteprocs-149da64084b8:v1
> prerequisite-patch-id: 3c95a20dd456dfee100f2833de4e9931a2073c7d
> prerequisite-patch-id: 5292d77663ea9c44346b8da86bda36e0cce3fe56
> prerequisite-patch-id: 015edcb2a69b5e837dc7edfbc7adc22145ba611b
> prerequisite-change-id: 20250620-sm7635-pmiv0104-34a679937d9d:v1
> prerequisite-patch-id: 8fca8b09d70409c5c78f9f1b77d0a4c75bce38cf
> prerequisite-patch-id: f5c2c24d2baefcd7ff91718529ab2f2c264ab99f
> prerequisite-patch-id: d7a06ece910e7844c60b910fe8eed30ad2458f34
> prerequisite-patch-id: e91b741c9cfc80aa149bfd8e43cae90ca58e17f2
> prerequisite-patch-id: 5ba4a49c3792cb208ee064a6ba13545e40cb70ac
> prerequisite-patch-id: 5bdfcbdd226f7223c04a65c1a3cdcc3ecad38858
> prerequisite-change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b:v1
> prerequisite-patch-id: f0bd6e083324f954b988647bb42d4e2be179fbda
> prerequisite-patch-id: 8fe1c0fc544e8bcb35522c5eba0b36e83bfd0c19
> prerequisite-patch-id: 525c9eb0087025024bb0aaec1ed1d7d2c0bc8f03
> prerequisite-change-id: 20250623-pm7550-pmr735b-rpmh-regs-06087e5b3a99:v1
> prerequisite-patch-id: 7360606a06f8fba3ea9a8f84b4ecfb8209e91ab0
> prerequisite-patch-id: 7a06a346abdb7f7386912b92f2b84af87e7439a9
> prerequisite-patch-id: 1e1a6eb9c5421812c07421f9fa7e3f16b26a42da
> prerequisite-patch-id: 224df3e4068bee3a17bde32e16cd9366c55b5faf
> 
> Best regards,
> -- 
> Luca Weiss <luca.weiss@fairphone.com>
> 

