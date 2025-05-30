Return-Path: <linux-arm-msm+bounces-59928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB95CAC966B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 22:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80DED1C074E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 20:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278AB1465A1;
	Fri, 30 May 2025 20:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfirfARK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E97725228E
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 20:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635992; cv=none; b=cl0kEu65VnMTkuPqPbCqfvH+4Z98RHj4EoCIpgg5dtlkQyH4f15w80JrEw7P9r/k1Okzyi5nc5GU2sWHMGu8AYxptOvDleiuYGPjY/8CGvWFDn6RUvwaITUCrJcFAQRfxBUjxQVuoNIVVRIlypVUuaI76j+A4QkEOcEZrmZ9ZDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635992; c=relaxed/simple;
	bh=hOe5SI0lYjyBYrLnsonVjJMdxbf/sFZk7MQhcKj8NC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eac/JHodb3zeVyf+iicSK2kq8ELoNyYeSeyQWNdUCl4srkWWr4dY9dHC6vmYJciAZTZ7lk0YtineZ2a0ucsTIc+IQrOg0UVuRpq++c17U9cve504uVJXNzqj4jWlfZdTibf7jIWgFxxwajUe3Yfj9pSLvgTieDdtIHrL5IHv0/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfirfARK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UC0p48011691
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 20:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OadsK1rEyJ0H/6UeuCVG3zTO
	8HatytaJI7W16ZL8R1U=; b=cfirfARKU95wLmTLhM1DWv+6hCK9/XU6ApM7UDVy
	/MfEZhGslm/IOaZTSrX0RSap2IMua3gcVB8bpiQGgwIuaqWpidbq7kcSPVdtgxFe
	Q5/8GWxXK2tj0oWHgLVqg8TIzcjbyYZcp74YKStItp1gQSL43zmZb3jWvNJmY8YO
	AlwXClASF304pV8ET2tDoIN/C49C0TmXVgslCkQ+OANDjhqs91g4shygvwKBBvKL
	oOX16ZjdGC7ufWfbwWQY/oYI/6UOXDv0yuXMYuXHYpfzFqMYimp+50gefeLgBRw9
	AjJIFW/lHOULrVJ2tgGJt8gYXTv1Jv/tbi+YX7GpiHSn4A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g9afru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 20:13:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c9305d29abso381421685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 13:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748635987; x=1749240787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OadsK1rEyJ0H/6UeuCVG3zTO8HatytaJI7W16ZL8R1U=;
        b=wn7cS6K9o9TlHlKWpYaAh3IaCnfATK0dLy+hbIiAE4QDDFV5M8nYRJQ1/9N83O/f8l
         MycjzqBbK7iiiXZOfWR58mka4MyggRjaMVL3+vmANROKbBhYbnSbVSQgDTO7if/26DnM
         A0rYs1I+3iMjCXPl8aFD942uNQw7hTjQLjpBVTZmvMJZ7UI6ggHze6XQt8Ifwqt7HSDb
         ZXkWi0w3HB2Cma9/Mjxyl+kNqQhJjllWYx+yM6I9eW6upqnTFQdrLGFg/x8+TvZ3DSMt
         jhbDerupJfpxga1LKFCnGO/pp+Tp6jmuzRJZ99FCBSnfL/h2lsxyOc2P1rEtydXjBWLZ
         jTvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhv1Blvf6ZO18n3s+EGE2hrjC7HfZ1vWkmx3DWM8RV+Q1h+tgr9acX6S6tiHMheDlorOP2TUG+5jL1V3TD@vger.kernel.org
X-Gm-Message-State: AOJu0YxYpHDoNA3z+GZuJv5mmLRdDPDEENG65rbT3+z7Rasw3w42TGtR
	M0zzJBXXmElm8lIkfdhxfkDeETWs8dK2YB3CX08ie5uD5FfH+FuxIdt8r94AC0hbMlczRv+710/
	kw2zhbpNjwq3ouXjRcBieh0mqt8LSnDHm8cPj+o0LF+0rHURrAYuHN0lwPzNc+qnq3QW+
X-Gm-Gg: ASbGnctfuUhRErPFzGbJJSqfzLGhkCdAf8HziFg0+vuavRz8w95MkfchRsUAgiBWXVj
	TGJ+c/K2qgj4+xu1XTR+Bx4QW0+WbUb/fdEZhmhPOt+EQjHlQxP7sRRsL3f8sIek9GoegF8n8WB
	YvCxMewDx4IDD5BcdTvVeNest0kwRC6xaQSsieHioIuZeCtZSDs7yqwQ4AEvEYgUpyTV2EvIq0g
	X0kqn1gEQOkMoRsJNHHso3xfIn1jcAtjKU7G+tzKc5WQwuqPOhZICKkQqltfjBwF3fy5D0pPwr0
	R1lSD+EwuUXLNePxDnViIuIaVzu/PIQJ/PN+RXEPXC+pn1Jr8aT+9kMKUCKvxsQ/bYF0R3hNpAg
	=
X-Received: by 2002:a05:620a:2796:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7d0a2016d83mr732916585a.43.1748635987442;
        Fri, 30 May 2025 13:13:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAE89MTxPgWdO4i0WDxPat+2lBREnl7QdMY9f1fr5cgF/Pe+0swZFpwTEUR+ykqh7B7ZTwzg==
X-Received: by 2002:a05:620a:2796:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7d0a2016d83mr732912785a.43.1748635987070;
        Fri, 30 May 2025 13:13:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bc507csm7159961fa.71.2025.05.30.13.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:13:06 -0700 (PDT)
Date: Fri, 30 May 2025 23:13:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
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
        Danila Tikhonov <danila@jiaxyga.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: display/msm: add stream 1 pixel
 clock binding
Message-ID: <lrrq7cj3kw5sk7y4wjvbdvjf5qu3cwbhreod2twttvejcxtfzd@eygjcarxxd7m>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
 <20250530-dp_mst_bindings-v2-4-f925464d32a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-dp_mst_bindings-v2-4-f925464d32a8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=683a1154 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=s_08DJon4HIwgivb4r0A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1N85ebFwFkKQ-LoK0Z7tZGjJ89ibUSCm
X-Proofpoint-GUID: 1N85ebFwFkKQ-LoK0Z7tZGjJ89ibUSCm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE4MCBTYWx0ZWRfX4goNSFDGt3rc
 jqEgMNfwjvwoY98+D29WmQyNS1hPnHYdKUqjmTUVzs+m06u6OCp/QkS59BUO46yHszzWTKcSbvG
 q0oX/2jvuVHBedElsV+3w3s1MpiV7QOvMuoSdyoKVWSh9lmXDUvzVWmJBqIsi3ixeuSJo0ZZea8
 WFDxoDmfh+vDODfYOkMIpSxNPUm0ukd/n0Hr8z2rjwoJa+gBnPFLgVmzbjDujdEciqbnMF0ZAPD
 tgGrEspAIn7iaelJg7moF0+EnR4ZgUd6y7OfknHiESuf+UP4oC6SaNdOFLNvQxkElup5C0X/POy
 sNXmDorU2rm4SFMWHTkFvmcpmPk8PY9NILYAYECuQQdSWryt2tDKxLmFua32NT7BdvSO0lj+DgI
 BcqWe1xNn7UL00iJ/Jy2fXgz3ppDknD7GTLVRpZ0fIVoj4EglScM98n8AX6tsjkCnapawclf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300180

On Fri, May 30, 2025 at 10:47:27AM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On some chipsets such as qcom,sa8775p-dp, qcom,sm8650-dp and some more,
> the display port controller can support more than one pixel stream
> (multi-stream transport).
> 
> To support MST on such chipsets, add the binding for stream 1 pixel
> clock for display port controller.

If I remember correctly, some of these chipsets support more than 2 MST
streams, which means more than 1 additional pixel clock. Could you
please clarify this?

If so, can we please describe all clocks, so that we don't have to
return back to the topic.

> 
> Since this mode is not supported on all chipsets, add exception
> rules and min/max items to clearly mark which chipsets support
> only SST mode (single stream) and which ones support MST.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 36 ++++++++++++++++++++--
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  9 ++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  9 ++++--
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  9 ++++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  6 ++--
>  5 files changed, 56 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index a63efd8de42c..81ffc141e00d 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -54,25 +54,31 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 5
>      items:
>        - description: AHB clock to enable register access
>        - description: Display Port AUX clock
>        - description: Display Port Link clock
>        - description: Link interface clock between DP and PHY
> -      - description: Display Port Pixel clock
> +      - description: Display Port stream 0 Pixel clock
> +      - description: Display Port stream 1 Pixel clock
>  
>    clock-names:
> +    minItems: 5
>      items:
>        - const: core_iface
>        - const: core_aux
>        - const: ctrl_link
>        - const: ctrl_link_iface
>        - const: stream_pixel
> +      - const: stream_1_pixel
>  
>    assigned-clocks:
> +    minItems: 2
>      items:
>        - description: link clock source
> -      - description: pixel clock source
> +      - description: stream 0 pixel clock source
> +      - description: stream 1 pixel clock source
>  
>    phys:
>      maxItems: 1
> @@ -174,6 +180,32 @@ allOf:
>        required:
>          - "#sound-dai-cells"
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7280-dp
> +              - qcom,sm8150-dp
> +              - qcom,sc8180x-dp
> +              - qcom,sc8280xp-dp
> +              - qcom,sm8350-dp
> +              - qcom,sm8450-dp
> +              - qcom,sm8650-dp
> +              - qcom,sa8775p-dp
> +              - qcom,x1e80100-dp

Let's get this list sorted alphabetically. Also, do we need to list all
those entries? Some of those use fallback compatible to qcom,sm8350-dp,
so it should be enough to list just that entry for those.

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +          maxItems: 6
> +
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5
> +
>  additionalProperties: false
>  
>  examples:

-- 
With best wishes
Dmitry

