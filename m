Return-Path: <linux-arm-msm+bounces-55796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F53A9D79F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 07:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33E604684E2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 05:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB63198E60;
	Sat, 26 Apr 2025 05:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwiPqJcW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C057917A304
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 05:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745644010; cv=none; b=HCGxlIynlqX9DSXWw8demI4Urvyq9TPWPmEIQbZhr+05SxLmjqr66MtSXbE9OV/QRv9mWC84l5JB950uVKkE8gxos+GImt3ODIsp5tBlODAjFwi47Fi05cCIzAVhdwBdGV+hslj/tzlbFr7MZnwruBUyZQCt3nzBurrmGRtnbrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745644010; c=relaxed/simple;
	bh=Q1gTwKlCAG4xFRHE8zkb/zQ2XTPqyY5iTVOl99pSpFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rn6WtDJCpRnjoiZfnFWBTeKcZS88WvP434lBf1vAX9oJvhB+AVVlsTV05DHo9h7c/odGAmG5Xi/OzPeWV2U4D4K1TG+OM1eVMQFYwBTlH7lcjdLXaB/BAy6r4K0MrrHX2AqObV6EiSZ8eBNx5q7s/dFi+QvGUzL8vsJBNDkwSl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwiPqJcW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q4BreP000999
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 05:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eIL0w0SaX4fEgbdtMZSS99AU
	nD4HN81VW+RR9ZFL48M=; b=UwiPqJcWeRfXKGZLlT0agSw339wTDg3PCCVj8LQH
	yA5RINtNoHEdSVM1JsHflF+FPX3yiiaGkso7Zz9lz09vSwtO79HJQ50Qh+g8nZX/
	vHhrHJbs23P3OlGSTxLMtHWF3WGTZXU7YZ+MxbgrRvJBuW8D/jiwHBILVxoWvCx6
	oLpQT9fRf9hSZrYbtlFjcNDFg9gAQ7yGtliUCQzzTopF8pV5qpbYkxAYVK41hg2m
	SyXa3VebwcVirsIOEWrc4NQEOOZMmb+yzcfK/nWpZla4JSm/dGtOQbiMnTkGpME3
	T4poN4r+p477qwePiZpI2s5rXEEQNpwZ569C0nlIG8SxBw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hg3ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 05:06:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c77aff78so852601685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 22:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745644006; x=1746248806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIL0w0SaX4fEgbdtMZSS99AUnD4HN81VW+RR9ZFL48M=;
        b=LA1MUi7zHgCnX7hZ8TvW7Y++wU+SiL66IIWNkg7vUZprRn/yhIVPeQOAlEdSJitUFG
         dI4D62HnnqYo6iOLuD86uCoEemhNFChlSYhf7AV1iON9Dtp26ef8RJ5r0Q6L9lIpazsn
         j7GcDlIcMiU73aGuMwSzi9rIG94nXIy5sWNMdaX+tecCR+66Sdui5FxH8YBX3m0Bp5kz
         kn7w4uRzhhmwxTikma2WFO1uPZe/UzjX8g5yM0wF9MHP66GH9BBLdlJCoS7hPhIWO3/M
         DqwBU3Lo7M2RiWxl8IeQqYvQ16jLYNJDIM7p9skn8v5NxYlZDviiP4ElF2H4/UrqmL2/
         3SPA==
X-Forwarded-Encrypted: i=1; AJvYcCVwxPpmOszWV+UlPTeHzRUgBmA1tRrbc7iiCI4MhZHn4xDjKi9iW46WPISz4HFbxcq/9KiJoX8X11S0p76S@vger.kernel.org
X-Gm-Message-State: AOJu0YzUOs32TcBJTnA5MhpTonr8MgBJXdmsjLlBQak0T5+aNzTHJ0g1
	X2TDiVEgFZARhxV40hY1za8WXNDtT4X/ttZmo2FzaWfBVK5KY4aBowN3fzkn2MuwbvDH/m/P94F
	jIW9lJh0svO6XJNV0S9FdAL/yk0L47Zb0tTS2fTyM+PgGcGxk7Z0cp5KdE4BdSITM
X-Gm-Gg: ASbGncsFepEDnbVAhet3GPhQVkJ+CFZ/FoSbUIOdOq/efe0JuwX5KWXGsvQilKTKCFh
	r82j0eLlUzRRulmibGfaaSysIMYxvf+p1m7QDa6CPaGdZHU/HJ7TWPHI2cOpgVRo/42pe+cle/1
	LXtJmvOLKMjLBkHOkMTSx8DfELuHTTvbq7UjeKeLACk2fIkGoOOLh/RKhnC14JAO6iQ9VjlLs2a
	vYoqaXRhSVBz4aMtCgbQ8w2dNqaGiQz/xXoVFT7Jf9S+tVa9/JOwD4WUukfYypaYFTr55/ewxvh
	cHHLpQkwtH0kShGL1tXOEdk0NQaVfYVFHsFEddDzeJX7N0sN2nEA9ayEHTf36x6pBu6InhnBQWQ
	=
X-Received: by 2002:a05:620a:2894:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7c9668cda1cmr346617685a.51.1745644006446;
        Fri, 25 Apr 2025 22:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMaVXLId8fuUgq9yIofTuCxPmggQOFvjAUGTOfOuo8GXCozhFMNKAnbZiG2Wbb5ZGjE45ggQ==
X-Received: by 2002:a05:620a:2894:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7c9668cda1cmr346614185a.51.1745644006052;
        Fri, 25 Apr 2025 22:06:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7bf9sm837712e87.215.2025.04.25.22.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 22:06:45 -0700 (PDT)
Date: Sat, 26 Apr 2025 08:06:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: msm: qcom,mdss: Document
 interconnect paths
Message-ID: <cmmongeaqwfsfnhpmwdsvozhjzkbdqncktiski4jvqgn5sjmsj@2lw4vesrcwjc>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
 <20250420-msm8953-interconnect-v2-1-828715dcb674@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-msm8953-interconnect-v2-1-828715dcb674@lucaweiss.eu>
X-Proofpoint-ORIG-GUID: vL9WcZk49Nl83HMHexuvg1K1XfC0Mwim
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAzMCBTYWx0ZWRfXwzRwPVe7Wuh7 WQeooQ0/bsk0sE57dQCmlra64lAJnjNxKU4jB83R/FCCsXMFm1/J8mvyb9/2wwfJTqhfaPbf7yG Eo3N7U+RN8YjXigrSQEvfOyysyfKJkQWDEH3cZ+flKKHfXqOjeSpdnOYqVuZ/rq0pm60ADEUMJA
 HAbl3mRltxsaoyHoOa84Vcz1gyMXfNsLcqZ9uIya/NwcipkV63CPz8mW06TH4TlbMZiTXqHT1n5 fHNaCw88yxt/LWfE7lQBceQAN/40XwdXQWS43astNOYYCcrNj7i1jOrBWJ1t/LA2fPI2QiEKz4C dEC+Eav9RbmoQSr8bH+cQWtlVs9DXiNAVzCGC/gojj6ESyORMRz4TxApJWfkEOQ9plrV4rYqgPb
 0CwsdnpMBUdGctsIWDOYsDAShBKTuRQdfwPD7eiLU+d0BP60fIctWyUwGHFWZ9yrXbiZRwNk
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680c69e7 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=z5yIEXyMNdJ1grE4PEwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: vL9WcZk49Nl83HMHexuvg1K1XfC0Mwim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260030

On Sun, Apr 20, 2025 at 05:12:43PM +0200, Luca Weiss wrote:
> Document two interconnect paths found on the MDSS on MSM8953.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> There's also some interconnect paths defined in the mdp5 schema, both
> drivers accept it. Newer mdss schemas seem to prefer mdp0-mem + cpu-cfg
> in the mdss schema instead of in the dpu subnode. Since there's no
> cpu-cfg defined with mdp5, I've added these paths here.
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

