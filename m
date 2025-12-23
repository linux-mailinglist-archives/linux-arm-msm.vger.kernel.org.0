Return-Path: <linux-arm-msm+bounces-86416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 185CACDA602
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41D983031353
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 19:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5694B34A789;
	Tue, 23 Dec 2025 19:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpmL0u2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GVqWQM15"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A24719CCFC
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766518375; cv=none; b=BCN7shUm+Rl/+c74uLOYlTylyjPpLvoS7DSpVWDOUn34m/kwWEudoJLTEjMKUo8YUGBOo/K1erpxUp14NduEiT+vuF7tv0ntDcNach6DXl334X8Oc1T+lPnhlpGfN6MMQSaON6jAdCspXdT+Tt3APlsPdi35orKz8I3EOUJRfqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766518375; c=relaxed/simple;
	bh=txybQ7weehVWbPl0FoXHYLBEWbqUlpKEL1gbCygHkP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6W6Du9o82x4SByUmiRwnp+vGoNYaRR99jhCDcRJuvjqpfp9/cKjq/VOjS6xkM39ZYaE57Jw6MFV0Trm58PmqZHqcl31MAIXW7xFq7oURxJyrSk1YGHctGv1Cieg09zYd4xKbDUlF644mVDzbMdphqorN9uBk7HWKNMM66VWDRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpmL0u2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVqWQM15; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNApVGS1356368
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nO+pMeT/jLArT7HxKp8kUXyA
	qUmwO9NbZdYFn5mIfdY=; b=GpmL0u2svASRgmmu3jFHfOouszZW8/gxURQ6lSFW
	GtPR1qW/mws0dbdQMfoxqOkoXzf1tEM4sCiN/hLsOLe7HqOULpOl4CI7rq6J9JDM
	AoifpQ8/L8WNXfgBoCZF5pA+AsZMnp0cIF8W6vnb7wnz70wAFQ9gKGqZP1ulDSqU
	Htg7ic6rtK9Xf/tIqKYVo1hf5c4zJTJiIxYrw294wfPV/7mhNj9TKJiSSLS3tkvH
	+nMaDR7qBs2qvMmZ7xbZvNVJlKAdZEZiRBckzSM1RqeLtsZAKgfGsKpZSvgdc7Rg
	5x4YoGEHXZOF7xG6v78Y1nyXphSMBmdEhLdok1VuCclXLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc4eka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:32:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b17194d321so673325085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 11:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766518371; x=1767123171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nO+pMeT/jLArT7HxKp8kUXyAqUmwO9NbZdYFn5mIfdY=;
        b=GVqWQM15h2GsLQCzMlDVXEVuE/ps5OwRA1cukULH0xFs2Qe7oSqpYLg3M5H85/a0X5
         3eW20PDy2vatKxIBIH6Zw/gQraXZXW+0R4D/9WpOJCCuhTpaskUiq+0xHNaI9eBuoUNQ
         xKqID9hBI4Lrrzy8ToCRilVNAFapJrYWbuXONj2JVp7MUnWf0T20eLcsvYQsQ6x9gcbg
         nIO+m+LPHRnWRg6dHlByF7WzzCh+0SI11btqZbdvyFsFah1dfHaETJQIgVBcwNwlnqJz
         iahP22eF7ob9MkZ8Ik6z9DUvcFDlpQ/Ab1/+DKfTRcc9Y2/k7ZWF7Ds5/oUfD9RSpXIm
         B7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766518371; x=1767123171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nO+pMeT/jLArT7HxKp8kUXyAqUmwO9NbZdYFn5mIfdY=;
        b=GLdrZQwmgJGi0kihtkwRS86P7PPtbnhyfP5n9xxmH9kHT6XWsfc/poMIG9GbqcgLit
         LffmLe5UVwQ7Cx2y0E8DJ9rp7RmXvTOV+v54Ft1BFQBReRk1SClmRUAE2J3ud2WZFehq
         qR17V+rI2dTtOof6SzMRWzy991phOq9wCQxIudQPeNkVRd07IB47BQjA+3D/MVgCBuku
         eIflgDVLFeHFQxRUj9+LDYjFEaqB3q6LS7u+WcQL6/VZ5PTuVYty99bGX4RlQpyGuywX
         3+nMJjNHAJ9CcjcEQEu9hHH+fpPuBdRAG7bqv9k0GmQZwiAqjYnrn0pWi1HVt8XPuHJa
         xRWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG1Cpc8Vrf173iWOrqpOu25woO/WgMS58tFxEto6biTSn0KmpV/Tjk7OrpXW0ScWPImT4TcLmOWbuxC0wV@vger.kernel.org
X-Gm-Message-State: AOJu0YyfIs5wgN2KqpOM/BGy/E3XCtrsjAQCSorUBkhOLyc5MCJ0UaUK
	/BsPP61fT/FuMbN1r2vY6iOwWmaf1I+GFQYTbZClgBJeIu2IHAVplGUtflTaMHnxsB5VKM9Jzxd
	pzs9v0YhW+fWna4THDkMNjVzMzYSzMurNeV9ModJ9pNUj6ZD/vMPu6YDzcOp9R0ngDIJd
X-Gm-Gg: AY/fxX7MjAgTfDbZHZXVSFQIhMuwfbq7zhnwE3pophaSNsohofWRTtJKDZwfrdnxcHL
	dxMJfaMi/d3VLKACD5xrHYgZuhHzquKpuKFy4ui/JQ5dSAakQWmG1TIQrTgI2xZIqQw4KDPX49I
	xOj/j/qdykQuNKbnR527nzGa+3wzan4Il//LYVjRQSfH1adOFEqkD30yFtDKt1YmYEiaiN6Ma1Q
	1bVoMxX6o/ZAt3G7N3jOgliXrsjwhwHnlVsmONWMmhcMfIFaDQhaMmeUr/ju1CsNegJF2Wm3b3b
	TnlH3O2dE/LzgFRN4X5W72T7WQmEFBaa6qYBK/CY5PvHWf6FcvwhqhHDcElYRIZA6tdMMo/m3eJ
	1YhgTD/7YtDPkXLU0VuLhHcDi017dFeZ9sxHek9MP48/RxulOEWaVV3T41j7vHxqCE/30+lqikf
	4IXaNZoKr4MTcqJGk+uqsk0cs=
X-Received: by 2002:a05:622a:1c11:b0:4e8:83b8:9e7f with SMTP id d75a77b69052e-4f4abca8385mr232796801cf.14.1766518370755;
        Tue, 23 Dec 2025 11:32:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1yf+DpzB1G7l75A3XEZ5rMlwIkdTZOMS7bF9LhL2tmqhpkY1WNpmB5BLfcHBvSA4tJHA0bw==
X-Received: by 2002:a05:622a:1c11:b0:4e8:83b8:9e7f with SMTP id d75a77b69052e-4f4abca8385mr232796311cf.14.1766518370173;
        Tue, 23 Dec 2025 11:32:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1862836esm4370503e87.98.2025.12.23.11.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:32:48 -0800 (PST)
Date: Tue, 23 Dec 2025 21:32:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        konradybcio@kernel.org, amitk@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 5/8] arm64: dts: qcom: Enable cdsp qmi tmd devices for
 lemans
Message-ID: <24kf4zyigxhlfzmjynu6pg5cbdeoe4mlyrqdfsxegctifk3fih@2ayxxckbeuvu>
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <20251223123227.1317244-6-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223123227.1317244-6-gaurav.kohli@oss.qualcomm.com>
X-Proofpoint-GUID: Sp4PFc4KBJjk05PNguq2H6mzRTruhWGu
X-Proofpoint-ORIG-GUID: Sp4PFc4KBJjk05PNguq2H6mzRTruhWGu
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694aee63 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BUufrYYXWdKzIi0LhzoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2MyBTYWx0ZWRfX2ROdAmITJZme
 BHfTx3QCShsluzFyjCRKxqOWq458hZE/kDtXJ70TjWJiks/FVt1rIn8kYX1SkjSVYZhNWA4+vOG
 REZfZJSqX6Ybj2rnGy3w225uiMZQ+mgCfiEI6LhcyvaP38HLiVC8Mdw3Sn57kQAYsOFG9DjXEMf
 InEBuIslLnJfrg+Yj/MFv6OWmwvwRi0COigD1QQ4GoS1fyS3zQlR5GMDoESJMB60LHDnAfHzRJh
 HFSsRwAbRRvqkPqSnAEk1RVW2l2WEw6qBYKQoAKW67VKwfDU4uOAr+I+Art/gpYJEHiDkfBSm7J
 Y2khEqbnqiKrE2mkmMszAYh5/fCKhoZ6Zll+EzXMOUeFgXe9T/xvou0rrjgHlcnh8+BH3t+5mHT
 H0GcGMMZQO69ccZZAZaH0omtGL0nMYVjF1fCOtHm7CgKNzNoUTfsX613u8vBPqr/MsEICGUsawi
 hmbX1YzsioiyAas4lXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230163

On Tue, Dec 23, 2025 at 06:02:24PM +0530, Gaurav Kohli wrote:
> Enable cdsp cooling devices and thermal zone cooling map bindings for
> both cdsp and cdsp1.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 138 ++++++++++++++++++++++++---
>  1 file changed, 126 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 0b154d57ba24..68cc4badaed5 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -21,6 +21,7 @@
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,gpr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -7018,6 +7019,14 @@ compute-cb@11 {
>  					};
>  				};
>  			};
> +
> +			cooling {
> +				compatible = "qcom,qmi-cooling-cdsp";
> +					cdsp_sw0: cdsp_sw {

Please fix DT formatting here.

> +						label = "cdsp_sw";
> +						#cooling-cells = <2>;
> +					};
> +			};
>  		};
>  
>  		remoteproc_cdsp1: remoteproc@2a300000 {

-- 
With best wishes
Dmitry

