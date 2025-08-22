Return-Path: <linux-arm-msm+bounces-70361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 115F0B3158E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31AC71BA5BD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5BB2F532B;
	Fri, 22 Aug 2025 10:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NbJHNySp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1E22765FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755858890; cv=none; b=OXSQxdYuW5B0BKBmD8Xi6/MksnlsjaqR2NgocKWWiu0Ta4hI2oQm5BeOPs9AOODzOh2zLLX/iRSoSsdhD777qXxQcEYcWt5OLU+EO04ojV/IhA68HlwZf6EZkJIGTr6xgEP9WLPcvNvKHBHCfzFANZnlxCjLYslxZbQw9904wLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755858890; c=relaxed/simple;
	bh=cNc3uQTBlPMD/fIqEi+w2U9HdRDuV2p5IcMHEWL2ySw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQJhZBn9jUd/HHRuYr851elALImw7WvkuUDNqIp1PMePczR9Z61fLTBrvaXQ3oIlKvEW1IQWeCl6p3CFj3yqlQb+L7SeoXRpF6KdTjTt2L3c+rsj4OAexhDHwMAssw1dJZQQpuWm5iNhsy3KqTa0qgqkCrQVy45NSRD8EFf+HUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NbJHNySp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8ULQw021779
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kveQ+tzxSixYaW9ElHHUjKWE
	uXQ0n186XTdsODdNbAY=; b=NbJHNySp6cGBngKyWzHr7So4mttf5+9GBE3hYVFs
	ZEd6u2yMLX0GIOPRWpZg0P+mTOKlZC69c1twVJFxi4UZ4JMTDfEl1CbY8IKOuhQR
	/azdpfol49X2Vyx6kaZwaxPr4pe1g3MjDloys9oQeyikt/r2p36HX/r1Wmjek2pZ
	RCkZafM7HAjwxsvM15rtswXP1qsP6d6FhDBKHDZuGQoYv/TkuipsJLcNIZ/slQLq
	3YCyx/mrbJCQFqrXw7neMCIYfEVDm92cZR0Lb29VLbOlcvAfG7z98b62y8iEbn8H
	M87g89SlpvBZQBzuoUogJ7QyylEaPwQPASW/1ljOS630iA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a8xgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:34:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d7c7e9709so51712356d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858887; x=1756463687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kveQ+tzxSixYaW9ElHHUjKWEuXQ0n186XTdsODdNbAY=;
        b=DkcwRk4w615qZJseY8J5AEROGreRm35gyEJtWyUqtBvE6D96cnS/H3par67969vmhO
         HAYP9zIMAlSdE1/nJW8jC8196mYx9Dwof7icw94SzPE2t3iO/XED+d+uNLTPC++bWch0
         2AwexrOyaz7+2R1R/lhsqBdw58Gr+YSqXB3f6OUjRTB8Agas3aZbYOVpE+fesGbhHeB2
         Hfip/QzIPFx9ljnekI07GVGPBdR6OoZ0pR52DwORq+KswsspfyKUBIPqKGIbSNQ7WCmz
         AGMBmRuU5YKvjhPf/tAw6RCWX+1OeZmyRR9JNIVbWQLhLGKve2y3Mgz67CDImh50isR/
         J9iw==
X-Forwarded-Encrypted: i=1; AJvYcCUiz7BjkToUzgNbDelyEovUL3nBfLXP+sChPECfWZDgVm1On4B4gpGMSTLeMPk1+jSSeRLG7cDyKBRT6uD+@vger.kernel.org
X-Gm-Message-State: AOJu0YzLe8ciYRZanvmkvu6v92cCkDbF7ahH/3eRFeXvFAtayRs6xmPr
	bJH+gHgzvGStGzbLj/pLMr852BVYFbRW9Wb2JU9n3OEgMu6OBkdTLpHI2V4aiUj28eEuNDr7kSA
	XC3u78i3figqZMqc5NcLzrAHrb6RYt02ehHoTTSjURFyGxN4uSb8+HhzGmMsLu7aHr3oA
X-Gm-Gg: ASbGncvc1Q/XOkN02a2FQswnS2ygz6PK/0NPiR11DZBbQZ/8/DOFTdeYmtQ8Vg6XtLt
	2Jf7/h9YVKJDAZErAGJryciy5FCC0WWyEepK/i1UL2RLYJNQj17zOCZIjKBOqNUReS5eL6FHXzl
	ifWKFFp1dQjsvtURQvWwtfgv7ww9RJSiz1Wi7X9Rr5rIuTgp9a2z9LA6CTUDZaJaHiuupCqGW4N
	jcdfJoA+Q+wWtaXmqgGmWuGuaJUHXlowdEnyGYaf0MG6rOBtrLXRIh+y+4dUN3lU/okllvzOc60
	n0xfBpt0UNtrVL5I0rOpY4b5ih+89waWUc+HybF2FhgJSf3ajOB7B490gZd+DIYlp1kSVESuF0g
	LM1S8S//X7rwHQKFs24QJY+PP0ImGToUNyDnlDsq48fQk7DlYFYPf
X-Received: by 2002:a05:622a:1a27:b0:4b0:65cc:f64f with SMTP id d75a77b69052e-4b2aab3c33bmr22432961cf.54.1755858886955;
        Fri, 22 Aug 2025 03:34:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGitENoH3QIhDfrMsc85KABpbqP+cmpwOZOUhVCbOkZutTUgU8nZ46PieBebtYJ+AhzzSGsfA==
X-Received: by 2002:a05:622a:1a27:b0:4b0:65cc:f64f with SMTP id d75a77b69052e-4b2aab3c33bmr22432591cf.54.1755858886489;
        Fri, 22 Aug 2025 03:34:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3513c9sm3554851e87.29.2025.08.22.03.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:34:45 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:34:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/6] drm/msm: mdss: Add QCS8300 support
Message-ID: <iza3iyj6ztuudm5rqfrxtalwxfghzsguf3pieulylebdblq7sw@divpjvwwvmsg>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
 <20250821-qcs8300_mdss-v8-5-e9be853938f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-qcs8300_mdss-v8-5-e9be853938f9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a847c8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=PV2lBtblPjvqxubg-rEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: yVTEGnQ5zGQ2BAJOMcHpJwOj3I7DUt2p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXwvbXeN3KmQ3v
 s057SlUePQ+SlbqzD8dAi32Rtg7O8F+6Odad0L/J1JSFDjKZLLVNL7XhaZAwY3gB/ZUq2UopZLm
 dTJRWSmGaZEJs5aOmTVbTC5oxCHLIMT5IwFANhyYgzuKMPrvxBKe/otwe4f6n6PVvupuCmegMvg
 4qhfeddauaBu4kLu9ADeaL4qqS3AsbqvNzrEzns8DS6JZeUViWmfxcNUPeufGwGz/ndGFL1d2vU
 gLAVJUFGxBB2cbK2wRBisyDTH9+m2H6tIeXz968ddxbxDCyJWdic9KshyFw27+FPG08+bHJvI1d
 vMVl7dfJlCrNn7sMU/srBUnUxRTn1YK5PylN5V/lwFZaFQ/Eg+jrINhOQZyeMcjzJzSkkAh110H
 W9BJvjjZ9kGUGVAyJC2HOIbPNz3GKw==
X-Proofpoint-GUID: yVTEGnQ5zGQ2BAJOMcHpJwOj3I7DUt2p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 11:36:00AM +0800, Yongxing Mou wrote:
> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

