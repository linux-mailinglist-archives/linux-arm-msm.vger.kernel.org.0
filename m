Return-Path: <linux-arm-msm+bounces-86420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B8ACDA6DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F5E7300A9C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 19:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E832634BA49;
	Tue, 23 Dec 2025 19:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvQqS6Dc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C/g6kxMx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B66B2F5474
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766519720; cv=none; b=YfrYCL4tRqXQVx6KDlH0F9GUiFlOJBXDq/DOuAyO7IFCfxvEuXeGt2r2isVeh0iA9sHKkDQFl5rEiYq5pOzNcdCyohGnLO/tOQBuCSm0i1dUDaJxEU6iwHgFMAipYlUHUM/atXyZecbuJfCQbHsmnLMZPZo5Ihk49NJugOSRBI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766519720; c=relaxed/simple;
	bh=JeHtUOzF6q/IAIMn52nRpNimmQWWVnXvup3DxfBJg60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtzPewHskWRwSiZtbsnRMryxAhgC8OTLoK3+CLEpV5jO/z3DNlQavYiJMcQ5dN6tjjmfMb816427hByqsunv2blzl6JzpnrN+YCwTNl9RI9DTbUdFQeC8a3JL3/esj8s0Ir/aPLkFU6tpmS/iorQIxVNmdhCrUU5qVdyIPZ5Tfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvQqS6Dc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C/g6kxMx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNCdjO8560003
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+5BStTVKjVSt3rj+EAQ8x7sv
	1areOLZbU4gP/y3s9RY=; b=XvQqS6DcJadicDp6PjCqvfHdxaGbi/zdbR/XLKdV
	g9DwJpw07Mh56S2rqPpKQm3tCFn9ZaEO5m8N/lZ0unpNo0OGWtII7B4kLgPfo1JI
	FkEBH/sTqSj2q3B0w3biADdYKnqt/FGHwHUtXI+q7/B50m1vun9Mv/Iu75bWoarW
	BQp7IIIrUgnlS+FYFZoGfVFJ1VAe5GMJ/9IpdqQKOsYQanJmUa0mTiFBnipGkh+K
	F2/0KiNX36cDAVMkmnHYqsFj05IREPUu+4/c8vxxQ7EjMZYob5cyUK3+x4S2O48+
	aQnRwyl4I338dSgi0lHPH06B1qS27XwCT/ys5aZoAIXTew==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cs94s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:55:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee21a0d326so28127771cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 11:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766519717; x=1767124517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+5BStTVKjVSt3rj+EAQ8x7sv1areOLZbU4gP/y3s9RY=;
        b=C/g6kxMxtZcG89H2/9is+50jEDz+RuBqk9KY89CnT/qnNpS6t6V9isQ14BJIqoNDf9
         OkpEt6LtPhSFYgETRR3IuVylFfTM2TBDdAQ/DyayAbFpsVqCb1L+ZqS7nXZ/2WeOVBhO
         wtzMg2ykkIiP/uYTlHPDjVRCGN1LY/HbZIAOPAqEILNG9QwDXY6hgpoN6iqo/t2y659q
         KMmeEY8cj9SOFfGunDw6sYM1+49+CMCvd1EjG0UBWpcTPoZnKLf32qXZdu4ttufhCfsf
         P5ZOGiphU1B7Qoe2N61RbdodmbUlq8nJwTyBZW8BgW68NWWCg7TVwr83SIRpLm8Rsnat
         Ag2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766519717; x=1767124517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5BStTVKjVSt3rj+EAQ8x7sv1areOLZbU4gP/y3s9RY=;
        b=II+I0DgxbsyZGUnHsEt6Cff8IoGNVO0PscIufZlN9qpKAZUA62SndUfEGo8tMW69Yn
         56ul3Ulhzu90eJiDwv1y3Gh/pMZ8rjOMBAy2JJtS8UoIiqpMlGEm8Aoxj394uNmDo1+z
         H1L5+qi8QEYCd/eM0opu1eQIndnLiEkXmULTuESXV030D6rDe2XOFE2spFoZQUSe80f/
         37jDFrhOH95LECl0uI8bJ0m9EE7khTPvatqlDTxI0pB3G4s97zT1GXj8I6ChOQPG4CYv
         2Y/hGLrJVK19WSpCNbWZLu3s9l7HRU1IYbkyf6KUOULy37K+Yw14AMNwOR1ok53vJ5mu
         lejg==
X-Forwarded-Encrypted: i=1; AJvYcCVOGF48VElvYwh0etbFJzZ2PCJW2v0froQxan3xGh9bJubLdLjrpCp+rzpVfr8AiVnmrfNYoJBbvOKpz/if@vger.kernel.org
X-Gm-Message-State: AOJu0YzE3HgePjbcVlbIO3gquWPvDFczGKOuy4GpJT3qXOwABbydWOAy
	aKLewIFHsZz+kw0Qt+KSKef1GS2zARti/KRkDhgY2zzjjk0J0Ed3k2mKICbpVOwYlb0nfWTpQyT
	4JuP/2PQuFQdpwuKG+VHle0Nkxn3nHvstaEWMH50Zn0M8knfYXzdA3qxGlg0KubnjsoIL
X-Gm-Gg: AY/fxX42no40ugaUu97Pq6iBrsFiZoxkIFRvmZfkhIWopw8JDWiPvmT1cH9LLX9KYAU
	6hsmwaTIECoEqnrrKBHNYgDbRetiTGFiKz8if8qXu9tRGXvMNGGhqvMVOnhTP1YOLspbxpIDrr0
	xJWwhTbywQjGFduknDtQs5CjfwWIRzisIUJtPIEEYLvdRtaGcEdeivq2dyafHjfVX9c4oP4HcoZ
	CbtFsFIz87rB28LDA1eiuWzDvi3PMSEDUDVnl+afVVZa4qZ41tKYI95cQjpsneJUOpPPMe/Y7pf
	mGPIgrbPgg2URyGqM+3tWAOrSnVxslfldjjKtk14vPfX3lxFD/o28KcyTTz5uctDMJIJAHOyhsq
	9GA/P39u/UTNrfwDABhB0fp5zgOfF6VCHCbMiKBiP8rwV+0lYgnD+TzGpwV77NiG3v8YsMXJwnF
	5o0kZrTEQ2Nf/GPwbRpMlELus=
X-Received: by 2002:a05:622a:4243:b0:4ef:bed6:5358 with SMTP id d75a77b69052e-4f4abd1c647mr227535211cf.21.1766519717600;
        Tue, 23 Dec 2025 11:55:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyl53CTvCy3DtDwqsEpaclioPGQPPivQcHmL7nD6zQOqdsOLZVeuyyrrHY4JSSia3f121UAA==
X-Received: by 2002:a05:622a:4243:b0:4ef:bed6:5358 with SMTP id d75a77b69052e-4f4abd1c647mr227535001cf.21.1766519717172;
        Tue, 23 Dec 2025 11:55:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b2cdsm38445331fa.25.2025.12.23.11.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:55:16 -0800 (PST)
Date: Tue, 23 Dec 2025 21:55:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: add clocks property to
 enable QoS on qcs8300
Message-ID: <n7ucdvjlvst23zbbcwenp7umhn4wgsznqp23scpknwqnd6tcep@i6lhp7va325w>
References: <20251128150106.13849-1-odelu.kukatla@oss.qualcomm.com>
 <20251128150106.13849-2-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128150106.13849-2-odelu.kukatla@oss.qualcomm.com>
X-Proofpoint-GUID: OJpA4YChtsZ2AKAmaC8rPHlxp16Fv2or
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2NiBTYWx0ZWRfX6SokhdiBnC/u
 DM2W3XM4sTwD/mbkFG6nDtyeRvXlSkF13ccVxFex5b47/nzb/ZMN4QTXKRkjDmjtyBSvRdJ3NTe
 KJe8PPO+Jzdd8lkQkQ+zjQGnH5+10NVnFZQxz1EcmqQzylL4MmvyYlD70AZnhom5fzPjJJHew6i
 RVPkypGeTrkJpKkW9MkT1fILcrAeC/0R7gOn+hOLkNvjH2AOYIkwxzdLpg//FlQTkQD2exC8SB6
 dD9roKTL4fqc9AIeZjkO7j5pUzfBdwfjnT/g+J0sjtZ0LQOm54N7/dXN0l7/9exDP28MeTvypQS
 ugsCr4AZ+QNCYTaXDOQp+NP2eTacSFZmowIQl43apjNAdMbnfUscn3lJkZQ2hccN7D/RxX7tS/u
 G49MJW+8hi0dMQjq4auKjddjCLYbwG3WfBOyQdulsKFDpA0ZXGCuH/OT8u+2mZ0C66+Yl+sZXcq
 44IfMuKbplbphHk6cWg==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694af3a6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dhCFs6qcdUbYmOXzIwcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: OJpA4YChtsZ2AKAmaC8rPHlxp16Fv2or
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230166

On Fri, Nov 28, 2025 at 08:31:04PM +0530, Odelu Kukatla wrote:
> Add 'clocks' property to enable QoS configuration. This property
> enables the necessary clocks for QoS configuration.
> 
> QoS configuration is essential for ensuring that latency sensitive
> components such as CPUs and multimedia engines receive prioritized
> access to memory and interconnect resources. This helps to manage
> bandwidth and latency across subsystems, improving system responsiveness
> and performance in concurrent workloads.
> 
> Both 'reg' and 'clocks' properties are optional. If either is missing,
> QoS configuration will be skipped. This behavior is controlled by the
> 'qos_requires_clocks' flag in the driver, which ensures that QoS
> configuration is bypassed when required clocks are not defined.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---
>  .../interconnect/qcom,qcs8300-rpmh.yaml       | 53 ++++++++++++++++---
>  1 file changed, 47 insertions(+), 6 deletions(-)

As a generic feedback for Qualcomm interconnect drivers (please pass it
through the team):

Please ensure that QoS-related clocks are defined in the first driver
submission. DT bindings should describe the hardware and it's not that
the hardware has changed between the time the first patches were
submitted and this patchset.

I see a typical pattern that QoS support is being submitted several
months later. Why is it so? Why can't QoS be a part of the _same_
patchset?

-- 
With best wishes
Dmitry

