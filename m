Return-Path: <linux-arm-msm+bounces-66344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B8CB0FAB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 21:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CAFE540BB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 19:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D35C1F12FB;
	Wed, 23 Jul 2025 19:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1hsHUTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2722B2153F1
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753297508; cv=none; b=djl6A+iQpvEv2T57sYvCOPSVEiFbHNzzcq0d7Rf15BzzfjJaXDm+S2S4eMhUFIsPD7W5nxdjnR7aqOMvjyY1dZzMZLMYch+Cjx+tsNA+EW2SWC/rviZ2KjnAcWiG43qUckJ/EJpgpCW3bg/e25H49s2UAOPqKvDySIbXVZuHesw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753297508; c=relaxed/simple;
	bh=yuRgU9ho4OYuBDxZyBu1mHslN88EoGKlcfGO9z9njaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FS9NEcB9/XG4P7VaaHVsD6rRSs6vgymLOur4SBpfqJy6YJYtn5DccUMeEA+e/rMZmSb/r2psrwTk7lyxqTtrWKNJ3HvY1HgM6H/ejH+qUZKyGV6eeQ1bKZG/gaXB9HGvYut0cy45rbz1BKNyLP88lIxNeawlbF9Zx3sb1AAGVbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1hsHUTr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH6DMW015991
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LlwxGzbxOFLE6tNUdLnrCDcI
	n1YFSoVX4yc5JSgu4+8=; b=l1hsHUTrgTE7qd/eAxzIIAPPwarGjdXcx56NN52j
	F+j9zlJ6VRNZp825RrlRrIUojTEpFyP6CU8DHN3zQj9uhORUL9BRsCaPaGL5OQwg
	Zzat7JfrFHTsTWFHXhub+YhJWBF1s0tOXv6vkP9YIST3k/Aulb06J2NhkND3lg5k
	1Ttuwtd1HB+WuEYWXcwjGJSxatj+yu7GnHQfeaPBGwGApIttVhUPQ/hElc+DnSL0
	sktYR5LPlavblOMiiRdz4Xvkq5+mkNq229iK8Ux4j1Qgeow4CKqGcy3yo0IBDvc7
	Lbjo9VLg3MAVDp2AgV/+NRwpvbybNozyDgyLdZ6KFSVjoQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vcmy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:05:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2872e57so28800685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753297505; x=1753902305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlwxGzbxOFLE6tNUdLnrCDcIn1YFSoVX4yc5JSgu4+8=;
        b=f6T9+W/cohyqumW6eIomINWYSSjVuwZ86AHHLmYV41+iao+IDvOGQj3XyiFlANWMTF
         42+lAyR00WKC0Ij9TSuTM4ZmR1WPeMEnrfnlPbRNzMgy7TM/bsV1xx+xArsi8BSPJ3LF
         8rpOZo5fqvdu6IPu5+D5rI0ek/3WOtyTDRQEZXPNQsWmJTnCw5EDlImPPsse6Hi0uGC+
         +7nG9MFDK3SUnsZS2eVQZ1d/QbFPUhNcEoeFbr7RkiTyB1Mbjci55iNCGK+U+0nAego2
         culG+pc77aClbqznAiMH/CQn9qwzZV7nWU/dTuDWKisqfzWvkgdJmUVCxxojR4+f30Oy
         KSTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5E5xIsY8nEJnvElGpqxcJWq5AFqY0vKQlCnndwD/NBpG4BgibkkWrcHAxK3ANjTM6vE4U3wJlb0gU6/NM@vger.kernel.org
X-Gm-Message-State: AOJu0YxGngJg6leA7hbFqkk6yhKDjhGNQubeXaQzPUuOKpOK4LO0wTWL
	CrgHrmbyOAIbhVD539uJRlkO3i3N7YWkS1UHlX+SwWxM76XdpXAxlrpjzbsI4T5t0q44sMg+rZT
	TBh9qvwMu3R+NG6SgdgkbZRMw11fGEbAek6O2lH1KtRjI/+0VZeGP8mT3OyAOXfs9x6MO
X-Gm-Gg: ASbGncs6I/3bS20Yer6+KhwGBUeYPbPhX3wt4NJxUs8HFnh60ZLrSvrr/Gw3AuY8pIZ
	DmuL2p9ivTRbfFOb12dc5X5CrYgXkQB5q1oLrIX1rXNO3n3KTMq3WEoaGiuZ4BpicfuGo0Jxk+L
	EOXIm+wd8teQkvkXQBJVvAGvQhrk4GtD91kl7hVYwrAvx1vGUC6Lh9geecuGUlNVenoqp2iMM/M
	oQNMkmW2dwgehWUrKYwCF2axdPRFEwatAxhOI049MOCsP86XNLwa+eaCHfFp6Gd82//FYyhNlUM
	t8sc03/904J8Vmt574hCuNlbIsuRkkilXrabwgC/byFxcClT4PH127Qnm3qy0Huil8Lo0IQPO1a
	zKZMMuWpI4wKeqqvgcY8hB2Q2DEca2mUnaNPY6VDVNiw9VBKsLgpw
X-Received: by 2002:a05:620a:a201:b0:7d3:f883:6047 with SMTP id af79cd13be357-7e62a19e6bdmr438161685a.51.1753297504550;
        Wed, 23 Jul 2025 12:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVikEHzskkn5r6WHCg2DXMAwpPQxlleG1dXDP5Na0HIBh6BhiLe+Oy1cOXXzmZ/m6sol52RQ==
X-Received: by 2002:a05:620a:a201:b0:7d3:f883:6047 with SMTP id af79cd13be357-7e62a19e6bdmr438155485a.51.1753297503926;
        Wed, 23 Jul 2025 12:05:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a4e0338casm527398e87.190.2025.07.23.12.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 12:05:03 -0700 (PDT)
Date: Wed, 23 Jul 2025 22:05:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        tglx@linutronix.de, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add a null ptr check for
 dpu_encoder_needs_modeset
Message-ID: <ciawdvjevycjjuowmykfux2v25lvr66kzey4jklq7t5cjzqalj@qfcva77k2bvr>
References: <20250722211740.3697191-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722211740.3697191-1-chenyuan0y@gmail.com>
X-Proofpoint-GUID: vP43AoPQDsVTOKtQ2Xcifb_fcu8Pluko
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=68813262 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=_XfERVBWgaszTNbD_PYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MSBTYWx0ZWRfX2bSjw5R/k+8Y
 zZ9/LfH2yCM0Xn5fxnP06siAORUdPPMZF7bFkBL/wITKikqiCXwLE9JU8vV56BTKUZzyh4u64gM
 k6tbsUPOuv5ZRCWQxOx3DYjH2WL0EKbPX4BgH8nXbxwtOWUb5fVD8D1C14irPhLRXdMPySathsT
 kNoxrwqntZkSl0xY5hIOAjT0RgtqNnPsgYPdiHkQDWiwTQiva6FWxHW+xFoCXDMUEc3l9GdR1XB
 CB6FeVtySnkcMjy0thLVT2xzN1POQvIF2NKi8uqfJyjIPF/0S5Fo/z4mF3PIpVHw8MlKQyqcDYc
 nBjLIF7Omz4hTE6wfGkfIY2MM9HEJSQDq1I5gghWprCpga7mQBKdzt5VKiBdsArNn0piTNHUdg7
 s++9x2qaB6irf8bHybA/j+Ykb5FluPes9NZYwOS8LD9BkG7g+76VLD6EQio2PF1kDOOFyeAu
X-Proofpoint-ORIG-GUID: vP43AoPQDsVTOKtQ2Xcifb_fcu8Pluko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230161

On Tue, Jul 22, 2025 at 04:17:40PM -0500, Chenyuan Yang wrote:
> The drm_atomic_get_new_connector_state() can return NULL if the
> connector is not part of the atomic state. Add a check to prevent
> a NULL pointer dereference.
> 
> This follows the same pattern used in dpu_encoder_update_topology()
> within the same file, which checks for NULL before using conn_state.
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 1ce69c265a53 ("drm/msm/dpu: move resource allocation to CRTC")
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index c0ed110a7d30..4bddb9504796 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -729,6 +729,8 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_st
>  		return false;
>  
>  	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (!conn_state)
> +		return false;

Did this happen in a real case or is it just
yet-another-static-analysys?

>  
>  	/**
>  	 * These checks are duplicated from dpu_encoder_update_topology() since
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

