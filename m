Return-Path: <linux-arm-msm+bounces-66588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CABB10D71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB371188E006
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662C22DA74A;
	Thu, 24 Jul 2025 14:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILfxjR15"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001D61E130F
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367023; cv=none; b=jlOFto6NTPplvh3JXElbtknpuEucxb1gZ7BzHXDRAN3Mhs9Bwmbinx2Fu2fdltRT2LldVfj4rRNWsip1HW/B+sNMMUBxfkjQjCN9PtivB5ElYLoFmMexZMubHGlJRgbNhxxTpn5fYfx4cHG51gSxbpo7ItiDVGsA9dsAvgxocRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367023; c=relaxed/simple;
	bh=WvyN6qjNgv1yPDJutX/kmce+hYMmWcbroxxMeW2zB98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mazyvgyHvlcyr3WjcEW1ORux6nqsm8vXPNzIJLPX8UE9Jbxwsqxpo1wEUgte2qrcAQXtPgiqy/NH06pNIsnIyc09UvwxL2pyN1jrbWZ8iTq6C3uZBMpbF1gBX4ZXKOqVMSchtlrZGZ8W5HLXfdinxd6IHojhTvI1mhYLjbke8/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILfxjR15; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9oZEN031241
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EFOidjaJx90ia2Zk8m3/+Y4Z
	rTzQKZq9KqbiuEHtDDI=; b=ILfxjR15jwCUi3M1R+fDS5ml1CNV83noBUt0MZs5
	byh6gmEMOeSC8koxy+Byaev3OxYkJHmvxHaM1o2oEAp4SgxJW3susPClH6bPs/I5
	63KPEE9thB/uFCitK0IJ0e8Bv7yxwgtsNiYDnlaYRFYTI/UHuG/WtbfuP7UD3YEX
	CdvA2Qzn3ozZ0xZW3DWNDM+NLp8rdAVwYhWqTvOf8B9Y/KnsUy3uzbHzNjijDZDr
	1iyq41DeRXfaraNaAkJOGWJqIVVeINHRJsOVnr4MBNzcK/dc0o1yvum2RRtIIBn+
	n/JntZnMc0rM+73i6qVLMwhZNLgFVSn9bn7kAmNE5bgI6Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vfcg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:23:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-4f9c2728439so328725137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753367019; x=1753971819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFOidjaJx90ia2Zk8m3/+Y4ZrTzQKZq9KqbiuEHtDDI=;
        b=n5GKePWhFcCQlJqe3Ccc29vKoNSTnjCis+eCniUGhhopnVA/3KF+BJZX4iYm1cSyXY
         1U1PZ+k7VRZRhsoHIZTlHi3m2y0AFeNrJM3w4T45UB9cecsFMzCIPXbKMb7d1yJhNCKn
         m24DbZz/bvISwc++hM/LQs+qHkR//2CNUS/RLj9yAl7L0gZBCXK11y/3A2153VkCvnAi
         UBhWHudezRk+Oim22fV0hajvJBK1TDbN22xK4y+cYv1GKyJ5gc2r3Q2U+OOIELc+te54
         SCoMjl2G+D6axCqPEK7iCMGhWSW1T9ObB3/Yz/fGzW/pf0i+FTiyP5Efi/wpNOp9oZLL
         NWKA==
X-Forwarded-Encrypted: i=1; AJvYcCVSlvQreuvfNqZZ+qG//SeHh8rNnFEd77xyjsYcS8yde4nZWNrHCQHIdhJlNUp78TgO4ekZruBSoHG0IIis@vger.kernel.org
X-Gm-Message-State: AOJu0YwUKUBNeKQ+C7lVtgy9+OXs7uYsogqMKsmoOKvoMMFafcyO8dqs
	vBbIX7MOWwbHI1EUPOGtLK7cbADSEJXSpZXsBj5NFWTze0oPTBkMnzA+aZk8bATO4X9LpYTCtmo
	JEm7dFsYpeEgT0WatzfoO/rgPX8mFhGNKzq+Y6e3mIQxGKAPOAWOFDXqRtNhcd9gLtthL
X-Gm-Gg: ASbGnctoLdrOvtfiia+4h/bJkseG3ZM2CnwP1Z0AACjwhFREdapBfXvmESkOEXnj9sq
	cjri8T6rsH3Cb+uWev2L0nQImC2FP3Nng94HFgQ2alqIZaO9mXlbFy+0szHJ5QFsHWeaTcU/AFA
	YF0QdYZYr2MrexVNWbdF8OVSh36AMm0TR8QUk3KKhQtvsZrixReJ9bM1Y+xAEOD2UaJQH/ftf+0
	nv1S+M5mvaCXhVH5ed91Gfl9PzqhOkrC69faHQXFnuIuzbwNE9ZY10HozIpBU8+XFu/rJlQU4rp
	TPqtys9pO4IA/a3RgTuwq605isjaAbMYB/M61iQkcFZNiwmwfifPDRrhhsewz7zl+Bhgl8WtN/p
	8WBCJuyhvUiJ1tQYmJxcT9+M9PwED+UGicHJY1znkH3E32oREAOUY
X-Received: by 2002:a05:6102:50a0:b0:4ec:285:72e1 with SMTP id ada2fe7eead31-4fa14f8c61cmr3317697137.6.1753367019199;
        Thu, 24 Jul 2025 07:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrZKK7zJvgusO6fy75bTCT4/4c02uD5wEiU3AAJ6v0c53WXnZcDPmknMIWu2XnG0USllhMnA==
X-Received: by 2002:a05:6102:50a0:b0:4ec:285:72e1 with SMTP id ada2fe7eead31-4fa14f8c61cmr3317642137.6.1753367018745;
        Thu, 24 Jul 2025 07:23:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53b35cbfsm383014e87.70.2025.07.24.07.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 07:23:38 -0700 (PDT)
Date: Thu, 24 Jul 2025 17:23:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org,
        mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 2/2] clk: qcom: lpass-gfm-sm8250: remove unused gfm
 driver
Message-ID: <updct7763epzqvs5xgs37xsokb534vhefvkmt3rtjqvaceu2vw@jqsd4s3nbuyk>
References: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250724134229.103001-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724134229.103001-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: EFnueRKypYTcatG1Oq_Ya_VWJZMqAokL
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=688241ed cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=U1RUb5vHvPbtf-jDBY0A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwOSBTYWx0ZWRfX7/Wxn+QcK4EH
 IJklS3P2K5rFSyxydqVcv3qdGn0KrWDgB3RChWCH2lc7bpxeiA28BZEgFsFt2dlIco03JLyzmwS
 s6D4hq/DT0vs8k7QZP+Gl4WXtFlggsZJZK2tmHbDWuT90drJkdJf20NjQrmD0A8kU3hmapTbnxB
 2ec9RM1vjuVh/S6YE4KX9WsZu8HS9QZfS6EGVNUjl+QHISLPn80RukPJgUYfeCNW4R2EJhZpIio
 KaC8ZBee8gE+D84qTwXIrZy/7TQb3lMcjPq+GNzEwU/DsD1ps2HgSvcGuVQ7+4slZYuCXvrYt1U
 X2ZFzda0+6KLBE6p2fMsUZ5c0kjZrIWefOkx28lT1OtLdOQ9g575yFYfQvyBg6A8NOvywTq8OJ8
 8AEXCCaUkhDOPXeooWfuyDlWYiLhOkVWoKBHbb0qMUJjiLnxH60BOxgNnK/S/97nUgezG1HE
X-Proofpoint-ORIG-GUID: EFnueRKypYTcatG1Oq_Ya_VWJZMqAokL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=847
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240109

On Thu, Jul 24, 2025 at 02:42:29PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

I think this should still be @linaro.org, especially looking at your SoB
chain.

> 
> GFM mux driver for sm8250 is totally dead and unused, there is no point
> in keeping this driver without any users. This patch removes the driver
> and the dt-bindings and headers associated with this driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/clock/qcom,aoncc-sm8250.yaml     |  61 ----
>  .../bindings/clock/qcom,audiocc-sm8250.yaml   |  61 ----
>  drivers/clk/qcom/Kconfig                      |   7 -
>  drivers/clk/qcom/Makefile                     |   1 -
>  drivers/clk/qcom/lpass-gfm-sm8250.c           | 318 ------------------
>  .../clock/qcom,sm8250-lpass-aoncc.h           |  11 -
>  .../clock/qcom,sm8250-lpass-audiocc.h         |  13 -
>  7 files changed, 472 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
>  delete mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
> 

-- 
With best wishes
Dmitry

