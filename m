Return-Path: <linux-arm-msm+bounces-79275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A19FAC16B42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6BB924E969B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 20:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E2A23EA96;
	Tue, 28 Oct 2025 20:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzycHZfy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVHRQf/+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB49234FF50
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 20:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681611; cv=none; b=WJaF92hujmIaK9pcNFFLqqFDk3PkOymaaaLkZPGX1wly7ukoQpEl2asemMNM5V6z0DHH6+I7wJd/HYTwwdFQJ+3OLZROojAT4v1P+AXGNk88sKSECPdA+T5RMw0fXb5VW4yd055Al0dYP6jOtWHb/jj8InOoWFlKFWtvxl3Onmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681611; c=relaxed/simple;
	bh=3PXbwVmfbb8UXIQGow79HZxdvB9q0pyISYMOz45a6Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rn2aUTMw/eLVkFd/5n1YKLPoIqRz8gKMHY60Hp8c+qlWCqwahTV+F3Ig8bdFMxZqhEtxI05ElSnplNkOgTBMK8yKrKG4eJn9TrtzBO9jvDav1AP9d2YYcglefemvqBnf0lC2pAly9HaRyPKWj7jFdnqicqc5NeWqxUWE1lpz8Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzycHZfy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVHRQf/+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlQT42539338
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 20:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V4roZFbJyz4h3LTg3OYpA/rr
	jgxznf7XEnG0CMcM7Z4=; b=FzycHZfynrd35FGtx+2WJpQ3s9APtJZESicJKxHF
	2uKj3LpBadHCj8Yvf9aQjS39nZKVKdXwyFCYOhs1dlp/99lSNRgO5ymcNCFDTmT5
	hBy/FGHn0j/kppmpceiujkfCXT0cOCqh27p6jwpgl1IUzh+U7KjHBix7w/oRd6c+
	N/60sgCzSylbB2wtGCtuXzEQ0JmS0b8dC5/Hweg2UGZOZIfBG5JlE5wr9GNapDPw
	x4BkBC98mmhMpUIOEn9VUt6h2jFDD9WVMSt4F9hp4gn2IkE6jrVGA+sdg+o3AV4i
	zLj+yifHnwmsVJGB3QNsZvf/tK5vEADGvYEwj+yszjyFkg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1g0uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 20:00:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e894937010so179327881cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 13:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761681608; x=1762286408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V4roZFbJyz4h3LTg3OYpA/rrjgxznf7XEnG0CMcM7Z4=;
        b=ZVHRQf/+E7MhJeoKzkzw8BbDiWt4AqkaiZxjtv3BfFWQqh5jfp3+H2NSO9Aj4lJ1xv
         USFrHXxWD447isdGYWoEnElAImlPZx1DoeZuHq1BF3R4XEd0+IB1Y4W+87YlWCUim1y2
         mNM5cosiVRW9P4qIsuhdZ6/3Sc9xljq7SbzAsN2JYVZyrXE++l/Br4NgowVwy9+UOXJq
         bYz/qvmhqgmoZzxyu45C6ls5NIzNYSpXh7eQnNkfghwnr6u76GHpt9RWgxfifUdUPZZ3
         8sD49kjVy+23oxUAU1BANL3fryIxma+v2wsU0AxhxYKSiIBUGUxMTmmDLDw25pZcfrZ0
         IKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761681608; x=1762286408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4roZFbJyz4h3LTg3OYpA/rrjgxznf7XEnG0CMcM7Z4=;
        b=G9mATI2vN1Ah1d0AbT1BS0COrJc+6El4TOYKTBvGtHECLp3PTPp4iAKvS/476aWadF
         JDL5Weiq6OCqpygy7sAW+Y2pV7zapmHq4TbOPaQ3CTs2vfRiwwxLOxnL5AoZBY3TLQRN
         c6s95/atpzTc6vteBtURKh/55XoPVomjd335f2ewuEypMUtCzWsIBIjDllwyxJL1omGD
         P17NdxWFZic8y8NZcUaz5OPYjg/KOiEK0ru3IjcwDy/eVq7Q6N5zq6HEeYjD4m6y6tuh
         I8FcpLSjUt3lnhfSOn1dtKIO1FIPNsl0JxLHzRy+9ub6SQ5ZzKeMPAdISjr09eYQj5+I
         RKZw==
X-Forwarded-Encrypted: i=1; AJvYcCV4y5dZ0WnNaQhrIrsfTpVr0u5/spvj2qZNWvnrIOiIq41luwRaCTEC0AnUEyNk+lxGhHlm7JkSU/zoKLJV@vger.kernel.org
X-Gm-Message-State: AOJu0YzQnNKc69Ug5VW3ldbA/y9Ulch8qYt4ERviH0gCwUus/BEhoWKs
	rVCo2jDq3Fz81cZKtiPIg+AODqWFeJ9ftJ/Au+tepi6RIhIBU3Rk1h92DY+DMP2svKp97W8iTfv
	jhfooNdiRQ56fjQ2OP8zvtmOhyzjyTYRN2h+8Pg5ImjpY6rcOEQBxozRZ3D94L51p2yRE
X-Gm-Gg: ASbGncvuQ5ZdASHQHiBQ81AEJeLMXHUZ9WUUbqC2YE3JzCE4SFgYZsrEfMGaGPKB1VG
	LXvfSoWZCbDSmyLiDDOk2mqVVrRD0EpkKd1fOOAOCMa/993wq5kE5c1PYRI6bfn7Ny05mPZxCZm
	4HZV9s05UZwqlx+ei0D7dMX9i0E6vZrgvMQyatgzWgOh/gAPYOZeLGJDeCJ2rzzYQDiL+7Lr9OY
	k1jef+uFcX4U7A2CAaVJOY6xEyJNadzIeTnRWMZGhxWtxlDuk62eGtmWY5A45ZozRUwc/fueH9i
	0uSqfRDOAu0oKAiR/fQiG4NmVNElPxtKLGDkgANTUBlFSLKI4yYPxSeM++AABVeoXHcblVeUeG1
	XiZNlXHtxIzKPW6YS4H3fsVN6g95N7nSNtW15LjwNksMlqVpIF3Q7sdG8C5mee4uLx3aFF26tQK
	rNJW4qBXDt4ew5
X-Received: by 2002:ac8:58c8:0:b0:4ed:68a:abba with SMTP id d75a77b69052e-4ed15b7dad0mr5278441cf.37.1761681607466;
        Tue, 28 Oct 2025 13:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW5aQI+Mi4P7TXLTknhsG3o08YzSTL6vg6PtZtW0JsBzmgyHQTV0m7A4A017Zn2nx/4LIdQA==
X-Received: by 2002:ac8:58c8:0:b0:4ed:68a:abba with SMTP id d75a77b69052e-4ed15b7dad0mr5277611cf.37.1761681606708;
        Tue, 28 Oct 2025 13:00:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f5c33dsm3249487e87.53.2025.10.28.13.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 13:00:06 -0700 (PDT)
Date: Tue, 28 Oct 2025 22:00:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
Subject: Re: [PATCH v6 2/4] dt-bindings: display: msm: sm6150-mdss: Fix
 example indentation and OPP values
Message-ID: <ggrtehmzg5bajbglcjhlf5jynhwqq6vztc2fqwxxgip2q3vmip@t72qcggza2or>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-2-c4316975dd0e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-add-displayport-support-to-qcs615-devicetree-v6-2-c4316975dd0e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Nu/cssdJ c=1 sm=1 tr=0 ts=690120c8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=oTxB0LKMmMN85w47ZbAA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: uHS52PI_-dUWbqWzliqSigfm8NxcHD5J
X-Proofpoint-ORIG-GUID: uHS52PI_-dUWbqWzliqSigfm8NxcHD5J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2OCBTYWx0ZWRfX8rZC78iX1Glm
 kuJM/bXc5bSKkRDNoQwIgz12O2KTJq0k+UnJr/9CcOeQ4acpoJZaCgG6N+JqHSzrwxPPcv4mmZh
 3B3yo0VU1aIaQyTMwDgqzCL3tvpT5e7Tr+Xhb2WBIZ+oO3dinx5IqIar577LNZYoWttLmIJMVyc
 +UYD9+xeHncWgzxn7STQfNhnIPebnH8bxWet68jI3uNt8YgzguKUD+fIt9t+SZ1OYZRTJLQJTm4
 mIFiT7SWQhw7ASB5w+K40Bju2W5PY+UUDKijTI0yos+TbHMjDlQmSq0pJP3BIPh+vxvQiD535Lw
 PNQCReP5rbr08LeMqxqMYKwImwhJMWrwStHz3+985uF0I5P16DZnqnKLMLlqabaLxEGj+I9t0hz
 kJn/jAhncmRG74zTcLr58ELG73aVtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280168

On Fri, Oct 24, 2025 at 01:21:02PM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> - Adjusted indentation and added missing blank lines in the example.
> - Corrected OPP clock values to match actual DTS configuration.

See Documentation/process/submitting-patches.rst to check how to write
proper commit messages.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 32 ++++++++++++----------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> index ba0dea2edea98cee0826cf38b3f33361666e004a..80183df71cd9288f652dc42afeae101e8edcbe65 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> @@ -140,35 +140,37 @@ examples:
>                  #size-cells = <0>;
>  
>                  port@0 {
> -                  reg = <0>;
> -                  dpu_intf0_out: endpoint {
> -                  };
> +                    reg = <0>;
> +
> +                    dpu_intf0_out: endpoint {
> +                    };
>                  };
>  
>                  port@1 {
> -                  reg = <1>;
> -                  dpu_intf1_out: endpoint {
> -                      remote-endpoint = <&mdss_dsi0_in>;
> -                  };
> +                    reg = <1>;
> +
> +                    dpu_intf1_out: endpoint {
> +                        remote-endpoint = <&mdss_dsi0_in>;
> +                    };
>                  };
>              };
>  
>              mdp_opp_table: opp-table {
>                  compatible = "operating-points-v2";
>  
> -                opp-19200000 {
> -                  opp-hz = /bits/ 64 <19200000>;
> -                  required-opps = <&rpmhpd_opp_low_svs>;
> +                opp-192000000 {

This is not necessary. This is just an example, so it doesn't matter,
which values are actually written here.

> +                    opp-hz = /bits/ 64 <192000000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
>                  };
>  
> -                opp-25600000 {
> -                  opp-hz = /bits/ 64 <25600000>;
> -                  required-opps = <&rpmhpd_opp_svs>;
> +                opp-256000000 {
> +                    opp-hz = /bits/ 64 <256000000>;
> +                    required-opps = <&rpmhpd_opp_svs>;
>                  };
>  
>                  opp-307200000 {
> -                  opp-hz = /bits/ 64 <307200000>;
> -                  required-opps = <&rpmhpd_opp_nom>;
> +                    opp-hz = /bits/ 64 <307200000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
>                  };
>              };
>          };
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

