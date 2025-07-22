Return-Path: <linux-arm-msm+bounces-66152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 528B0B0E3CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 21:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8201D173B51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 19:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF1717E4;
	Tue, 22 Jul 2025 19:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gyhtp8el"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72748282F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753210950; cv=none; b=XszgPPxh6b9CiJqjE5HdHptfxyLwVDOxu8RjUMw+EFY5Kbfd24WZmS7S656nONjsvaWG+u2cTnMfV/AIJSl2VcGCnfZatQq6V9e3dWWrBCM/rp7UHEqb+8LrfeB1ByzpzOKB8KUrzEKPWJVOBXVfemwn/zbCqxGWrnbbQvDvLgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753210950; c=relaxed/simple;
	bh=1jW+AQBLmrBwT5OqSJctwQ/2tI0p4B8L4gpSCTjZz20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbcfwG9y+t45jKiOHOvW48SW0P3ZRLs0Wrzo1lEI8qaURM1PrzKskljMM+oIH9rxAoksuROVqHX8WKEtCITHZOXxIwq7T/yhe2XTwouWn2byMnEbDmr9HE8T0pKGRXysDpMg+bpk+StWSIYbnIYGVldLYz6iKxZ0KCOjKa1j0r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gyhtp8el; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MCrkIr018206
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eeNJd288lALWCAPcNkFrKeWB
	uzWCZ8l6rZ+MwXhFjY8=; b=gyhtp8elLmKM4dYCBMpPzjGY63U1H7BqaIPm3d/V
	iuhp8iqecnu34Ssg+Ellxxf4780WhBLpFkf0vGOi+IrmadgAMyyR5N0NO8O2Xq/H
	YOcsSfOgJg3dUuyS6FUsPrO6MBFYV+A7UCBTUpKGbz3CjI2GFSg3omVv1tZ/6Fm1
	aHXhIhM3Ls5o+d8EFry9Bo8vN1HOuEwJRGYVRgMS2KPRlilyXuitfggnQk2txLOY
	YnIXvrJ+KD0rShyIWHR1XAl/yglCuuHj79XtqxdIcR4UCsoAT+7ANPS6FF68Kv8g
	Ucql98aRd1srlKnGkvac1UCcQgj4znjRLvHQjjnFnc0/wQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1u954f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:02:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2349498f00eso1578215ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753210948; x=1753815748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeNJd288lALWCAPcNkFrKeWBuzWCZ8l6rZ+MwXhFjY8=;
        b=dMEvQWFiWbENPvNRc5NdRnwK7osTSdDH7mnD0XdA6KQxtOOtIeoBxVz/0WTFYFNl1Y
         pDGg8OqwdlLa2wruMLgcTOnG58LPT9v6gRWrx8Gl0FdKMcothzTDbALMHhnGkFrJjriU
         20HRC/bOH2vVaIY7yGBcwItLZlcEt68/xRVlQw7xuTe2Fw5zrvdyA1gPnHalBhVyBfZV
         wKNiaE9lxBCy0BqFMYjOxmhBbmVyPJ9PErs2PLhGdSI75tnLpga7uFPeXSdQnR9UX9hD
         WyCW5mdGCN/BZlX0Ot2xR4TFfEzuwRPGIsvSb490a8cYKEhC+6fQGcki0Agr2+x+9+7O
         g+og==
X-Forwarded-Encrypted: i=1; AJvYcCUuqN5osGXxFAu+hl1/YLpKe1LzIRygHb735+gG+4RGJBEKVw/YF4F+aBz5odRcgGKon6eqvph5u9ZPgyrj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5lLQzH0NVuzUneNeT5xG+679Bvmzij3kDCccJpBVKoByaapx1
	pnxiSs03z+5JsLrMIpy3LVP4Dhia9JAtdxKxaYhncGngDVpXAsl2RtNPmk4JimbcaYSQdDaaLHC
	ERehmashJeOujgOkGlVAUENt+UiZQzxDc0n1IgrpdXHhmnmrO/AGUvFYSFLgY654/5BvA
X-Gm-Gg: ASbGncssaTvUUleGWwLGZp9Szgc5W5SvrorVtYG8EU/OgoUDrDuj06HVQu9mn26LAsD
	blMFTtjPC+BVLaXLTmoFhe48xKC0WYRiLeWA2vp+HFMrIdEl37K0HNL79UcqNJZdxa77/yum1BJ
	YdBlnGQzbukY/xa8W1VFGVlvnD0nDvJDa7PfHZ5rL0V/0vr8GiTyjonxbQkXFVswyJDnDX2uhKc
	RoS2htq+k0ckN/QdWeZWbtnEI+Orexa++SSebUZ9u9fWrQAZGat0D6JedmlJzERGY+nBa6D9lQX
	bbUFti2Z/QQCZnT5sCuLklVuTKJUyuSnZJR2+cZlIY8FEHQU6po+EgAA3Fn3x+jIdoTP3qzQIaH
	Y+onFPMhDleEufLUQDGCxD2Zzvkcb8ZAo3eZgnpDc8ZdGqhas4omR
X-Received: by 2002:a17:902:ce8f:b0:21f:5063:d3ca with SMTP id d9443c01a7336-23f8acb16f9mr66352925ad.16.1753210947584;
        Tue, 22 Jul 2025 12:02:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTaRg7+RT9XmmVIQa9Z5l3X/9yEYapn9SUbtScQ0vSYOHwQTYMt6q/ro/+Isxq9+wASsihpg==
X-Received: by 2002:a17:902:ce8f:b0:21f:5063:d3ca with SMTP id d9443c01a7336-23f8acb16f9mr66352225ad.16.1753210947052;
        Tue, 22 Jul 2025 12:02:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d7c7a4sm2038313e87.130.2025.07.22.12.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 12:02:25 -0700 (PDT)
Date: Tue, 22 Jul 2025 22:02:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: ufs: qcom: Document HS gear and rate
 limit properties
Message-ID: <6yhnlwyuimkrlifmmdihcsuhws6qkdjzmjxdupu6cevu24nmi6@f4vk5dffjie2>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-4-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722161103.3938-4-quic_rdwivedi@quicinc.com>
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=687fe044 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=rRQ5tug-ufnQS7fofaEA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE2MiBTYWx0ZWRfX4cT+wd0Fbalk
 HDgVBzQMTMTwcRToKiQQu3ofdqRR3TFpTsERjxZUUDanxiBwpCx0aOvSiHQpjsbSfJXFNdEsuF+
 U5d/O/zZUoJRQ+QDZAeoQ9p8NcXEAes4qOfcUrDYjxo70QDGQQWyLbhCqwea7xxjrZh5KbRkOPE
 Rrg4Ck7kFHqY1e65sXa+sH+bHjaCckYAQ9aONnvT0JC10idzIEN4rilm44/6FR7MLaB5QiniUlK
 p7vJEeF/fKVXmuIw+BpRq7RSwCLk4dLJgAcIJlvnlqp0PRMlYuayFZyvRFxDLlDVsGs8Vc8pn2v
 PZgJhmn+jgfKt8QW94XfaA1S40xvpaE771WbDbQzc+0zPLlpkNGD8i4CACcsXdr9eSyJ3v669xV
 B0YDAO5JmdBKzetE0ii9u3BHD+ZnTyUAUX9xd16ac3wq4h28ntlGKTUdOFq7h0Rl2ekDOWnc
X-Proofpoint-ORIG-GUID: 4CsV8OUcfl8OyFxA24sGRtosP5QlVsSk
X-Proofpoint-GUID: 4CsV8OUcfl8OyFxA24sGRtosP5QlVsSk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220162

On Tue, Jul 22, 2025 at 09:41:03PM +0530, Ram Kumar Dwivedi wrote:
> Add documentation for two new optional properties:
>   - limit-hs-gear
>   - limit-rate
> 
> These properties allow platforms to restrict the maximum high-speed
> gear and rate used by the UFS controller. This is required for
> certain automotive platforms with hardware constraints.

Please reformat other way around: describe the actual problem (which
platforms, which constraints, what breaks, etc). Then describe your
solution.

> 
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> index 6c6043d9809e..9dedd09df9e0 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -111,6 +111,16 @@ properties:
>      description:
>        GPIO connected to the RESET pin of the UFS memory device.
>  
> +  limit-hs-gear:

If the properties are generic, they should go to the ufs-common.yaml. If
not (but why?), then they should be prefixed with 'qcom,' prefix, as
usual.

> +    maxItems: 1
> +    description:
> +      Limit max phy hs gear
> +
> +  limit-rate:
> +    maxItems: 1
> +    description:
> +      Limit max phy hs rate
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

