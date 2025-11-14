Return-Path: <linux-arm-msm+bounces-81780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B04C5B5E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 06:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ADB63351F9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 05:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FE42D372E;
	Fri, 14 Nov 2025 05:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oeh7SY9L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5fdUeGf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8A6199230
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 05:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763097047; cv=none; b=cNcOc4UvS/I4B50u35Tk6MKCrhN0v2Iu07PnHoX07tGBr3O/e7KrpAdt+2CG8CMwZt8I7c44Ewyvo712nnW2KkQPqyCnwZf+zDuuwAa4qNFllikyrZogjMi+5CWCJ1aCCWJN6AgHfdbdByXnO5Hf8CFNun+6Df3kTA77npcslNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763097047; c=relaxed/simple;
	bh=Q4pXtV18r3AUILF84nAG0PwuH4kuF3wDS2SVxJhFg14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1bzNpWfW9vqhzXQAUU+KLdqIloIp+GU0z1lS0OfujWbo6DaC1OMDrXRdVh9E3TSFTMHMBzHEC21EeF/dpVtIOFHsCXxrZlJvivjcbQQsdb4elFLeMZ1AYAwm+foBYdfue5f4GMqCC/k3FVFxPLyV/n/tWasUdrUMdiLALNPrWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oeh7SY9L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5fdUeGf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMao1M1581110
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 05:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=44Ob5C/eoxZ2Iu9/axNE0sTh
	pLfy1097Mev4yzWFqq8=; b=Oeh7SY9LSjsB4E/J3e8aul8Ycz0iFAxs2afaa9I3
	3u2vK7s3FFheMWDDA5uCsQbLwSlNms6AkfpQ0A4jfiGQhtVU8WntONIcNdddbcja
	90chCVTHblcoE4B7lPygos6TOItlu/aX7qnnke0j4ZC2CPP1MH/Rrk5zoiMNtsnQ
	NkFv68mkDgh8zCDUkPowk6H9XbeLRQZEKx+BSdElk0SHZ42sobTGgrfbO5D+D20S
	4YPw9ycwcRMrQPK0QJ9cTnXC0Cn2416s172TsE3JwUcC3+zD/sdhaVYadt0SpHlG
	+ZI2UhnrkmmdCdq433zb/QsGJ5/GcLPe138YklXbAFU6fQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9frw8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 05:10:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed7591799eso44253511cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 21:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763097044; x=1763701844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=44Ob5C/eoxZ2Iu9/axNE0sThpLfy1097Mev4yzWFqq8=;
        b=P5fdUeGffAIQBVX0U5GzVRPr1XV2iX/iHn6ktJAQAJjGTvA3grkrZwqvsS4tTc+1y+
         TZRtIQfQFfCOBBBIDOh975HsrwHjlGTqAvw75B/odd1P6opYrleNtK7TtUpy230M6Vga
         oWkB29hYSmw70p98X3qlAj2UT28YV8amgvUf0zRngUMEhCDSXnSUyjhv7L358rq4LB+y
         SOFv+YcS0IZE/XB+z9AguVI4Dg25OI3Rp3/n+3Z4vNo3yTftUKdXG0wl2oVGVRhKQd6Q
         oPqUxn5m3Zl62BEWIlXgkuBmq5FJ8RXO2lcQ7upWbuVxUv5fzEhaMqAHlG2OXN2D6VfX
         aZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763097044; x=1763701844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44Ob5C/eoxZ2Iu9/axNE0sThpLfy1097Mev4yzWFqq8=;
        b=UK8IhULHj9HsVSJDgdpmvHmvhJnxL5jFiKsEaVCcESj/D2XcXA9RZoZ9asnoBPUNky
         rAXwmblnPz9sSPkGB9EBuyuTKmmfsjsALeeC83VCCsR7CZrpWAXVfQZW8lzQSbBJfMMm
         Q1G9s07jQPL8TmxR8uekKs+Ntdsq1HnJ9JgdK2B1l4RAChMbvkujQeyNjpU8nzmZGvpp
         a08AP2bBDFjRv4khNw+kgL+8EVhGGz1Q0rbJxYHYSHfhcS9HNv071h6/6BW6C2TTO3vk
         qPaxiOpy5q06l+8CJy/y9e/MuQHBcg8Ic+rUrkR3DFVLb++2Z4Fqq6VcXhWHQY6EkIq7
         ydrg==
X-Forwarded-Encrypted: i=1; AJvYcCWC0w510psMROL8i3tLof4cXwTNtK8lTLPpM7NVNWzAYu85fTWlyLdfSl12dua614MD4dSmA59uARPTEqNg@vger.kernel.org
X-Gm-Message-State: AOJu0YwDzN/mJmL7HwuWqnTd1pj7XbRWbCD5ZjHXVK9azHFYRO0AO9Y0
	6OLBDF014Vw7a0Pheora5OFUZ8kzS2lnwaKhhrd+5ULn+sFTTkwEBmCMoehy6IfMdAMf8bX8CdI
	UDMEF3/5sd8Fm+Vy+937epgkntPTHiWBpxfk/faNbDAg6EGMe66Bn+SlmGmS0/sIR+nvP
X-Gm-Gg: ASbGnctLfiqF+Qpgaiz17Dwt2e+q1/DZbsSsUVuAi0uBMqZ60UEnH2r2V04hbfenXkN
	EJ0Q8K7zZhs6RlcvW0R0WSUrzq+4eun1jwG4M+tvGSVp85p17Q6aPJPmtGecz9EPpckYZ2RUpVI
	BipkeZ4CniIL6P6lLLNtBNN1rVanrWZ3+e+7D+s7XSYPFdhVXQf8UKMPXFlfjynRaSdyTyJYq30
	dx2BUm9DoBF1ogxhLInZ/bEejRQ8K38GzXM57TPnerbChcIwDKz7uH8zX/x0MO6Xa5MylLvyvgS
	bW48Pn1tk2rq1dOYcLmQplgGl4xT/jVXGgkdK6w2IgMWa1OWcMNNBQnr5afI0VSaUpXgEJcDn+0
	1gmPQ+qLLArajHtoGqjn/KDIU1Q22ybVFeeU1I1W4ySK7gRQ459f8jppHdMXMiqJJLtxMdj6Zzk
	lEGDdp3w1ZowUh
X-Received: by 2002:ac8:7d49:0:b0:4d8:afdb:1264 with SMTP id d75a77b69052e-4edf20e9f4bmr34512291cf.51.1763097043807;
        Thu, 13 Nov 2025 21:10:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6GjIlXHWYQldrxdWCXMS1QKmAQg9PVKQ1at1juGVNtZz0+QnY0nul8zlaGm4YiXDNCleLcQ==
X-Received: by 2002:ac8:7d49:0:b0:4d8:afdb:1264 with SMTP id d75a77b69052e-4edf20e9f4bmr34511941cf.51.1763097043256;
        Thu, 13 Nov 2025 21:10:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b9ee0sm818641e87.50.2025.11.13.21.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 21:10:41 -0800 (PST)
Date: Fri, 14 Nov 2025 07:10:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
Message-ID: <5gtcpea2cqjyagoy7ielhauetcqoo4b4dkfilma2drujn32oh6@gyaahiusmwfv>
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
 <55709a7e-21bd-4728-a818-d2739fa1a86e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55709a7e-21bd-4728-a818-d2739fa1a86e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=6916b9d4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RxLA63kN50J1D6vl5DIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: xQucUlPsTuyCQ-jL0BfH72rpp3bxPOCm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAzOCBTYWx0ZWRfX/aN57aNSQAos
 irPA/SHbkwg7LhH7XoqGh/vpNHRPvYvCHdGlfxtdlP2+OwT6VHpjeZBRMEsAi9ncGu3F/f8jW1+
 RJc8VH7mgeMSvncWEZhU8ZnNBaW7jUzHimensRKWlxYTj6X6Jwt7kEWbBZLdxx9OOWp73ngIa3a
 Py+foLCZzAn4GVkz4jSSamNwKPnSd+2y4BCanR0TeK6svYcSz6ZJSltYvP5XTGKCSbyshVFroGJ
 7/HGD2NI5F7BlvAQkdHLxlJaLmefSq1uStT7zYsWOki/KEKfweKOtvhbFqnq9N8YeyCx9TAHUBk
 M0fGKmOzy0/PiHN/geCKV4qpaAJLLjD9IDYm1o19Z/0ikSlwbapZ1582eaOLwEGnRQKnl0jyrR+
 bNv5/PKfvi9mTkEgliS6sVbNZSNY2g==
X-Proofpoint-ORIG-GUID: xQucUlPsTuyCQ-jL0BfH72rpp3bxPOCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140038

On Thu, Oct 09, 2025 at 03:06:55PM -0700, Mahesh Bharadwaj Kannan wrote:
> On 10/9/2025 1:09 PM, Christophe JAILLET wrote:
> 
> > 'mixer' is only zeroed and is not use. Remove it.
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
> >   1 file changed, 3 deletions(-)
> 
> Acked-By: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>

WARNING: 'Acked-by:' is the preferred signature form

-- 
With best wishes
Dmitry

