Return-Path: <linux-arm-msm+bounces-78589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1717CC010B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1415B3A9ABA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA422310777;
	Thu, 23 Oct 2025 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWyxHwSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE513093B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221782; cv=none; b=THJSgbhRcMv00eT2yxpOXYSTxG/byfMDP8Gt/mV7SKF9/1BouR2/Nc14u4ORGq4Io3pP4T2Zaus+2giDHUXv/xI7OYDdK4JzQzmmS9UIe4CjXHvaJrh5Qz14PlT2/8eaXrwJdAikaghcOlTMo0EzBONzCqum2EijcDKvpBIGqs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221782; c=relaxed/simple;
	bh=0E7U9bIPhzHcbtwkKPPc0NskDg+3yPSeeGrKpQZ6wxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paAu9xGlUDdTd1Xkc38FpsMOH76SB2jCNV+0fIxiPjnPWo+VDhvRMlgviczLPF1fp00PfJ3+4SKjvnpwl9jSQfttzOpZ8bQNKULu+IiaVEerjq5DGVLM6K9mHQVxJl5as4cam6pMOylMnqnbTJSzzaRFt1brIXdco5gzqphtbcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CWyxHwSj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7FCk6011761
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9bI46L/4oozpzEJG7ZAsQNzK
	TAJeVoM2mUGb1Do1MpM=; b=CWyxHwSj6udPgRngKWzY6aHNz7/y1XRW7WFZ6w9l
	RlmrmFeJXWPk9aG/2XNfqZM8YBfzklf+n9SJr7RRkaSsv12WCDpt1572JVHPyPNA
	IOK0kiy5iDQPG8RZiKZ2+FsXVkhoeZsj+BXvjQrb6npJj4YU7hfn4W8zMbzmkQzN
	DE9M6ZeGxXhBcKy3MXnVFUQNHTae5VtByMP+JZZU2mIjxT8m+BEO25FlSMkwprtL
	CIzHBGnsmD0tzL6tXq8EIMgFxg+5+Mr+sfOgE1JsafAAXEMRkEL8AzJeY2gw4wI0
	xJRtB8R0PEmJNV+CF6mtBm4wdldEVpLfBdjyBg1LMqMGKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524ahkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:16:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8bb155690so9810001cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 05:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221775; x=1761826575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bI46L/4oozpzEJG7ZAsQNzKTAJeVoM2mUGb1Do1MpM=;
        b=iVBlfnMGBgPBe50y96LB60UCDMfTs4WlgUBaLjI+3hc1+T7Jtpd9CVhcibUngVz+Gt
         5GoSqAYCecjEWuvEklzW5jXkIO21s9vOixjVxUuiXsoMaoSxNcA5waX9/cK4lJb79ijr
         aODW4YeBG7/wAcJtsuNzSR7O45ZM4fLHSjK6n4LZGSMmdy4Oj2r/1DQjo3ham14eXP1y
         PyLKci8BVQWajsLSWbrQYccPsbaEp2VINESgGXpWlXvQuThz3ANl4x5rr0WUdNoBR2Yf
         r42NrQnlyxGauoSn2E+FMF1zC/fH9iERxpL8HGta7gtIdmZlmHL51l/7nlKtyNk7v2Qh
         OrSA==
X-Forwarded-Encrypted: i=1; AJvYcCW2BpNzw0uKiNuD2X8Lk5nShoL1pwNuDeYSHGqXix4fBibQ3JwaTWQWn6mbsHWVZ5dW9mtf0OjxoDFZmpZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzBkbINOtKqK/E5fgL5L7US0bpYczzYE5Kn4FNX2eZwBcR6P1vA
	N7aDwrvsA6czXbVikh5BgKxugph89QGlFZNCkuf+JyQ3+Nv36Yd6mg3/yKUXGEmAE18cq2D9Yna
	frpwJyi7EG7lzIMOE7ovl/P3JT1tFuD8yKXeFizyO2zDkL6BkybS6E/qS4hr8va9htsGs
X-Gm-Gg: ASbGncs0RJrXAnlBETFGXJ3kPRY3IV7fEYZlBj1+JOlHTlnF/Voo3427g1g782WcHwe
	lwRL9hu7RIx6qUajyiFFE5CdLQZGycYvDPm0G6cCbsI4mDAZW53WqY9IZwj3Lt0K4kPTQfNnAnM
	zLAevFyBU05bdhMboPZVmq5BrWTYRVgKG/L7I6GYNiN7Uw0iBXUmMZTVTms3Yvkoz8GdXIjerTY
	hsEc9eqx8fz3arCFgE+cWlZv5YbKMLCSQ82qa1vW1kDOR7x8Qn7keYL3SQvX94T+Cn07uugSM1D
	HXGeJCrvvNsaxW0HuDn/HDb9zjKpp41AhADKmZx9tRH02Neo9NicwWRMILgIyh7gn2zD+uQsns5
	DbCYAfn7gLbfQgnX4ZkJ8N2J3oS9K5sy2KwDTzL7NkZeYAgrtLfMxJ9a+BsWu73XiFOM2LNZWwH
	Aev28yQLOu5fcX
X-Received: by 2002:a05:622a:4c8:b0:4e8:ada0:450a with SMTP id d75a77b69052e-4e8ada0a00cmr197924091cf.45.1761221775034;
        Thu, 23 Oct 2025 05:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeUhuoseObWTvRgOs3Xxp4Tq849T+csVGpql5BFGo9n/VmAM+rZHain9nu6/6zo++Onjyw+A==
X-Received: by 2002:a05:622a:4c8:b0:4e8:ada0:450a with SMTP id d75a77b69052e-4e8ada0a00cmr197923451cf.45.1761221774525;
        Thu, 23 Oct 2025 05:16:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d67db627sm4204351fa.39.2025.10.23.05.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:16:13 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:16:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 11/12] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Message-ID: <binhwh2sb72ipt2qhqdmnid2hygdnjx62mhzn2cl4v2do467gz@wkmsvroshkcu>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-6-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023080609.1212-6-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX7D4IdEDxUFFi
 lkl8XZxQlkSR0MuhZBs6CtT1JqB+Q4fTa2oDoW4QrtPU5kj9Orp/5jJFYTS/WD4rHq1BeMMxovC
 aPXrJgxG7gBK4QpD/HB1qJA5ZLH9YkFLJylt9GweMESgMpHegEMJHI0PMqj5/JvJyN20VVFypYp
 LORzLUZWH0pJGt5jnGxv+BldA4nkiNWEBIV+igzT7C95/42PO7WVpjNRDxz8XqK7+0W/jPZIhA9
 cjv4Mhl4J/ZwnQy3RRuIjWFArHeWoFwHFeYIGZxKuFdQTITS/IP+cOpK1XZcrlYxtn2ZDZ6ilRA
 nWB51s/xpIJlUiRhmd//BP2SpODvxGOve8T1KLL2inaqR9MhE/BhgmhmEcSuWudKPSIgyZHKr6j
 oanIHngx3XOfDyQqvw9ZXWYuH6g3qA==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fa1c90 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=yQNLmfnzQBnRYO31l0cA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: _UeiQI_zvuDP-h3WIYsMplIuOL2nGVXy
X-Proofpoint-ORIG-GUID: _UeiQI_zvuDP-h3WIYsMplIuOL2nGVXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

On Thu, Oct 23, 2025 at 04:06:08PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DSI Controller for Kaanapali.

Please say something more important here. Why do we need new compatible
for this platform, etc.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 4400d4cce072..536ebf331828 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -15,6 +15,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,apq8064-dsi-ctrl
> +              - qcom,kaanapali-dsi-ctrl
>                - qcom,msm8226-dsi-ctrl
>                - qcom,msm8916-dsi-ctrl
>                - qcom,msm8953-dsi-ctrl
> @@ -369,6 +370,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,kaanapali-dsi-ctrl
>                - qcom,sm8750-dsi-ctrl
>      then:
>        properties:
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

