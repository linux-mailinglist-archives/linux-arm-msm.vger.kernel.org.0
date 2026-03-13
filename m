Return-Path: <linux-arm-msm+bounces-97289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGxRFqtqs2mPWAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 02:38:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AB127C469
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 02:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69E533045C28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 01:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DCA3093CB;
	Fri, 13 Mar 2026 01:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxGaIXB2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiKRdOUV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45A12F5328
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 01:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773365924; cv=none; b=iR8GjvX5UFjY6nkyb33ckESjBxa0YnhZF6zVFiGl/QNFX4rtaBoFTsRug2aWHZYxKkXkQEfKpnbkCviqooSV9fwPAWmJu9eJez9MlPuvVpy758HDPjZG30qHxNwAgsK4i5PtVvEeWvv6cd7kDhORoWeASU9vPKiNksqOqkr8+dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773365924; c=relaxed/simple;
	bh=GLob0u5xKuuLs0DGQuGN6+IFFGI/IP9n+ODAc1i9IQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sh8zPjJzmv2c3jeGJGuRl+i3XzdvvVI9CBqj9CHWFi5BwjE5zHgZ0LDjRonJlKJ8vNS/dnbuglWAsUv8Yg1eeSX9C9QW8SJJFMYdncmdOp1naFV4VPUfv/2ovqQW7Jgno3wIsIGFaqWAU/n9grlc137ANCSoILT3RS/rC2C4sRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxGaIXB2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiKRdOUV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CI2Piq4133000
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 01:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rhgqpEm6QAvqoZ8IZ34kN0BV
	yk8S2ZnXkaehv1CjtBg=; b=gxGaIXB2Hm1Mhq52wg8eVm/kgVQZlWLd6/e9SxZJ
	JB2cUtjYX0bpN/46g+2GFSE8peRm/OY1q2kzrInVbHXH1byixb1clKWr5ZaEGllq
	tSMvWd6+M57FbVMI6fmVbWx8RDk3UHu3/9KeYTecIcSeT+Lg5vsawOJSi+4TJkvO
	v4xXj9QFaA6VkoxKttjx03HBLaL9BlY5yvqqhLweVREmJkOnb0lbSSJotjb6W4dp
	Xi5Kf8brKqT6mg+Af3ZRA3UBJ3yv/X28OpMkJH3ARG/84nRKM3RkGgy86F7ppf/D
	LUFRkuk9EkZxv+ms9x6gXFQbo7UO+Lfeq/CslvP4k8UKzQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w42d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 01:38:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cdb995a1bfso126952685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 18:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773365921; x=1773970721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rhgqpEm6QAvqoZ8IZ34kN0BVyk8S2ZnXkaehv1CjtBg=;
        b=YiKRdOUVmrGUbA+MxC+bmTWY1iWN5jdS+QfxPNTa/U0w0eDHkFbe3w2nlTGsh3lJ6X
         pTAT2dw49hAnI3oGjruy7kUJDB8QgvReMSfrDLVNcKgep7tff2cXpsZwOxt1vdj7dGSO
         3NP/Xyncn+/mwtcFdKR+L7C2uZhUyEKqX/6sUtotoiHb8h9OoQ+dY+d2QWeMhtLjQjSg
         w7DCl+FGSwnyYhSGcXplO6lt1/BbCR3F0IGcbPIaSNiqlOhXjPsbVgwCtDEfJ2QpgIbc
         UDPJlZS5cIH5/lkugpBPr0zeP+GmErapS/FRoD0BAknqJEHcelujptKuMpWJ8UMGHs0k
         BGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773365921; x=1773970721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhgqpEm6QAvqoZ8IZ34kN0BVyk8S2ZnXkaehv1CjtBg=;
        b=VXcGjaPdEEKd8w8cma4evFMtz8G6IeKanC9f+zqMQa7EgkMBi5Dkxva0a/jUv7Mwti
         w4BqrtDpg+S4rL6V6oK5Q6nRF8Mhdtu8fActZlDl42UTXM4fV07DbdFoxMVphw+EaH7M
         jdSEKGKaO50qHWSbTTi77SLI/eh9howCGIRPsMv6cKTIjNYrQE4eGXpWuyp1ywQ5uAdc
         TM70aePmIWi/VN8akVlKGl4k6sHIv+H2Wx/PWaeEUKYWYCIqfLgFUrfeMlEr3GGmun/m
         1hakank1HgAHMx7yLwtJHyn7724/8OLCCmPUnZc06x7OwydMkLyfPNXmxJThLA58qIzZ
         BOsg==
X-Forwarded-Encrypted: i=1; AJvYcCWLoShx9dmptyrC8XmS1h+JqbRTBU7HgjOr2IR7oEEo6SN9JOHp1xkpxvBs13t251Kt3TMnhPjRznpxqzsF@vger.kernel.org
X-Gm-Message-State: AOJu0YyZSiOGfipEn3eLVMbGsI2Z7mO+xqxALNJqEyLv09/YHRX4LXYB
	GgjUTdH6honDrB10lJwa/o0BRh1M+fouRpTou9sMdF/5rd7YdVUy8A3MO82Obi8abiddMGlvNCo
	rCeez1Vj5tQeDvJn/5uUJy/zkUchTti/8JV5VI6zD5I1d8uQZunHFGLw2mDV1w27fD6Gs
X-Gm-Gg: ATEYQzzlwamoAVE2KQoh8ZvpVb4P1mEcpJDh6JuSJZGVeBfgYtj8/h7C5Ny3SLuDLuT
	hgTdnp9FlGM6/bTff574vV4eM8GbGVN26q3dpbyHxDROAat9wLJFtIlT6ugTbHMqdX3sWbeXz6q
	N4EeIiAJPQc/TzDqaeHyhaS8R3WMgyAxxcYUOucpuYjXysAdNoCSzP+Big7qbl/gDqzJHdtA6Ep
	fvnorAYPdosgOegQ+wRBBu0xO8rejHv5T3gb9Ee4g9vkNwiUkdtWUy9bnfOgZlW2C1Klpb9zPNe
	3ciz3UmAJHrW/ARSPzXsFGWvdwxaan7uaoAIGPZEM7+Qalm9Bec3FduGLbBu4MP3ng84wqtkX/o
	GXa5HhAgB3LGSE8ANjhfeP4Q//+22nmHQDxj0lnlh57+vTrsAjMM+D6vZUp4YzsSkX59VECGrG/
	06SPRu9+9d+Sf+RYfj031jLARNg9Xf5GpEuOw=
X-Received: by 2002:a05:620a:40d3:b0:8cd:97a7:a343 with SMTP id af79cd13be357-8cdb5aa4d3bmr258278185a.36.1773365920968;
        Thu, 12 Mar 2026 18:38:40 -0700 (PDT)
X-Received: by 2002:a05:620a:40d3:b0:8cd:97a7:a343 with SMTP id af79cd13be357-8cdb5aa4d3bmr258275285a.36.1773365920508;
        Thu, 12 Mar 2026 18:38:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156034364sm1241907e87.40.2026.03.12.18.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 18:38:39 -0700 (PDT)
Date: Fri, 13 Mar 2026 03:38:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: remoteproc: qcom: move interrupts
 and interrupt-names list out of pas-common
Message-ID: <i57ns2ythkhvizdceqks3zaojo73rrdbscjdat2fgeajwkuvyd@rqmvt5b4enyl>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-2-0a91575e0e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-knp-soccp-v4-2-0a91575e0e7e@oss.qualcomm.com>
X-Proofpoint-GUID: xCGa5ZhaH_kL5o8-IdREm9aneaHo9UWQ
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b36aa2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=OrQAJtSTds5IMfG0T-4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: xCGa5ZhaH_kL5o8-IdREm9aneaHo9UWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAxMiBTYWx0ZWRfX2fGkJyjfmIPk
 aBKdOZ9fWmZHnR959J8T6PoyDuf8n6fuRjhjynGxQATPdYk/FFjleyQfqO4hChoClIFwZ7r+KRv
 pvd1Gc7ZPQxB0AneFaVoDq+UHPDhtX0Di5Itpu7HhYUZZKxY3283w/M+vMORVxsDDDzG6bV41LD
 3RtT8OHRt9AGa4jw0dhTwVOIObhEIXJCRXdBNyVtF27JT5ZXxlqtgptxNUxvp9XDHyvLao32whF
 B+AyMBzWDCW2icnk6wwUjVBubMgaPWCXfP7v/BtcVlwsoUhCrzQkEZmNYfjTSf2lZ4IjvKgHGVJ
 XxdH+ABSY3Dw8umnCkbJiAgStA4DpX0FAeZkwan7jzgHCTDLX/YSFcWH1lbQEuG7vMtlfOTbMIs
 irf/m/2lwsEQhg/xqK2tx1PNQSzgyxCDjzEslaPb50zdngwyw5virkHkHn04c5RyZUk+fc/Oyny
 CeSXIB82uZJJXy9dUAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130012
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97289-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F2AB127C469
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 03:03:18AM -0700, Jingyi Wang wrote:
> Move interrupts and interrupt-names list out of pas-common since they
> will be redefined differently for Kaanapali SoCCP.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml    | 14 ++++++++++++--
>  .../bindings/remoteproc/qcom,milos-pas.yaml          | 18 ++++++++++++++----
>  .../bindings/remoteproc/qcom,pas-common.yaml         | 16 ++--------------
>  .../bindings/remoteproc/qcom,qcs404-pas.yaml         | 14 ++++++++++++--
>  .../bindings/remoteproc/qcom,sa8775p-pas.yaml        | 14 ++++++++++++--
>  .../bindings/remoteproc/qcom,sc7180-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sc8280xp-pas.yaml       | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sdx55-pas.yaml          | 16 ++++++++++++++--
>  .../bindings/remoteproc/qcom,sm6115-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sm6350-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sm6375-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sm8150-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sm8350-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sm8550-pas.yaml         | 20 ++++++++++++++++++++
>  14 files changed, 226 insertions(+), 26 deletions(-)
> 


> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
> index 66b455d0a8e3..cb0a61fc301d 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
> @@ -48,6 +48,26 @@ properties:
>      maxItems: 1
>      description: Firmware name for the Hexagon core
>  
> +  interrupts:
> +    minItems: 5

Initially I stumled upon this (and dropped a note in the other email
that I noticed a problem with the series). This minItems looked like the
underspecified property, buf after checking it seems that this schema is
written in a way that covers DSPs having both 5 and 6 interrupts.

So... most likely the schemas for DSPs might be reworked / optimized to
cover modems separately from the other DSPs, but it's a separate topic.
Let's settle on the SoCCP topic first.

> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +      - description: Shutdown acknowledge interrupt
> +
> +  interrupt-names:
> +    minItems: 5
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +      - const: shutdown-ack
> +
>  required:
>    - compatible
>    - reg

-- 
With best wishes
Dmitry

