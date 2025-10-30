Return-Path: <linux-arm-msm+bounces-79743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 825EDC21ADD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0849189095D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B454022AE45;
	Thu, 30 Oct 2025 18:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gx8gZ6Hq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikFNQUEr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DC51DB127
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847513; cv=none; b=RfHpt725i3J+nnZQxNe+3gQpcHZOGZU23DTGLwcAdIyS/H2oYxUbaTiu2AA73XBN2l2PqvKikpKiITVjMaU4JV1rid2+pET74nIeKiHnOPlEqNHof8oxJrT0HUx5b1lLW4xtjX1fdaud2hBAQfRfYWgVXIYB3OqRM4mzbMdDq/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847513; c=relaxed/simple;
	bh=tLKvvDXOiIjktVsG7VkBm/4wb0nODQheuhDFrUhCg2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siJEdrLpSs55Sc9e/VwF4h3Hh9/SzfXv83fftEWvDQ1jEb/quid++MddFbQPFXX0OZ6vgOgy6lnMYlu8QnVGNTUwMlAkMlp2K8mRr3AvWU7I6mTjpzbELxNMr2uMzOyzYi8eLWJGqRh+BG4V8EGJCBS0tdmI7M4FapzewraoD8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gx8gZ6Hq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikFNQUEr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UHZwuN3115587
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hpNzVsUmvobA7lIT4TbTwiLz
	yOdc/tSke27DY7ldyFQ=; b=Gx8gZ6HqWOMBNy+5o5c1F/H1BM468lUL8C5s7jXF
	ddMnH/KTbqp4wovULa7lxwB/mo+gReXt79A1Me2YtHlMlFJWVAanAXOceF+xDmqD
	8Sb2JHkATKruHEvU/8q1khpclepcXCE6OCpd6Oc/ZEWH07BEdOXA8QVureLjpPaw
	c+FStGuplxeRwgK7gkcwkhma8ma6/fqDq7gl5aTyI4pyab2NkFSGq4Tn8rxwAFWO
	QgWUNHRtJZaRTbXxuLoG1C9mvrR3BmP6hMWncO38YLXqnNSJ3saA95vs3BaVitoR
	gsd1a8HxOYpjvBcLUQPi578hS/xMRDP/wMlkoCdMJ/aDqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45b41gu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:05:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ecf72a45f5so43544631cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761847510; x=1762452310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hpNzVsUmvobA7lIT4TbTwiLzyOdc/tSke27DY7ldyFQ=;
        b=ikFNQUEryrPhdOouCc23WCWp29XH6cn2fAlwP3XbTMY0Va39qLD0Wb8BS00DMLZiaV
         yPLEXUAEee8ch09WCM/ogsZSALgctSCkdxIpvRFOGl9wt4gvfQHRDzbMPaOVgUSr388y
         9HfyDirsun/KsET6bSM47O58kL3GfSLrxxnLRmnzXDOyQ+eay3mKJrw3OsLXUSuleU7G
         XxjhKSNQSZldCSDujALlmbgWO7as11VMfe3nkkL9JEbH0zKKeb674LwtpuFbBXaUrWae
         SUKFDC9LpWQLIavtjUscRpNiGdG1O+bdAvG/9jflBl8isVdJzu05HMHSWgtFSWVhycor
         A9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761847510; x=1762452310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpNzVsUmvobA7lIT4TbTwiLzyOdc/tSke27DY7ldyFQ=;
        b=Frf/CltQYOoVDTeJLhM8l8KMujGDLVi9tdqHDiMJxXz+zgb8SWWYB8tOWrb3vb5cgC
         42BDt0opjvGmPo1g0r5PZgQw+qhDxnwKBxK3Y2AFO2N5ITxKCY1nZTNljvgzIkmK+9oG
         hsKPKoMCHrkp+zTaNK/9hcwPxguCGqiwccjxb9IcooMP92qG3+Y/iefTNHury6V0pZk9
         TlzIYuC5Shr6bGI0EjvtFnlZvc+NVeuu7D125bcFN29EBI1CpnEb7Y9yluEaUbdP4eyd
         bsbuT5YoidmB5xGSYjyjpYuTrqMKTwtwHDNQucGRhC1Ow96lLjfMNodFU/zkLmRhDJlJ
         DiJg==
X-Forwarded-Encrypted: i=1; AJvYcCVqkEKNmwS77eLtk2PQUs4M1UpKFotsvjILWvWiV1eJJYstiwI0/0a6h/7eDqEo/gLV0wMXX1Rs+OzMF6TY@vger.kernel.org
X-Gm-Message-State: AOJu0YwK4m09CNmXfZwU1gtHFZORL6vZQ5Ib+bicmTrqOZ3yJ/zoXdZK
	ygZHRP2VVt7LxJV75rkr5ZefSo9md7EV6mFMmA1twYQFRZKqpa5XffVwHoaBq0NF+1m5zqoLGCG
	3tBA40a3OExqfvdxLfOOyB2ZI9oeMQHXsCzOvbR5uuBx+JyUG+DeHW/j3hp3nlAob332K
X-Gm-Gg: ASbGnctfdlEVF/JPNn020UKGYOuTzC6USKLVe24spUgQp7QfbAl/Wv2i4fVeA3Clpfc
	S136bCXyIVyIxSS/IRXxCrZjvU+J7PY6zhQXWd8cCpXgbhJkce88Yqh59Wp/OU5rtH+z3kIZGG/
	+iGGLFvmfcRcQHWgrTXn4XIRvGkigK5GIyo9IMwXk/dj99YmW7r1JqJXP4mTrxTUfMDNo862X/s
	DCPjmC5fXPhT3AtWRiufvA7Mw70YDLyQx0ZLLRYsj/MIVZglV/5w3v6rS3w5B2mZ6R3+EZ+IWEi
	ajDF889JA0BYxtmJV7F65N3fokuzXrNFbvfav2MxeycsNSHPcDBSKLUwTzzUYldAsagyjM1OjyO
	9kUQboCk/BYLCr13bLD+XSy2c24WW6XSgq1PgLVmil6MK/30u4CSgdAH61ErubVBZeX/4sQZoD9
	HBHSETtYj2+I6G
X-Received: by 2002:a05:622a:1aa4:b0:4e8:9596:ee6d with SMTP id d75a77b69052e-4ed30e159f8mr7797471cf.9.1761847509942;
        Thu, 30 Oct 2025 11:05:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElDt9l0NR9/vDPiU5LTv+UBt4T29PKNjIh11r0yOe2hphXbziVzZPIVwEal2E9S0jpWwC89Q==
X-Received: by 2002:a05:622a:1aa4:b0:4e8:9596:ee6d with SMTP id d75a77b69052e-4ed30e159f8mr7796561cf.9.1761847509253;
        Thu, 30 Oct 2025 11:05:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f50a6fsm4714062e87.35.2025.10.30.11.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 11:05:08 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:05:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <g5oia3ndlitxrquptsvalfesjujjtlfh7gvrao4vf7vqaqzxvo@5q3bwz7ubmrb>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
 <aQF98RvLuOlJZlFi@yuanjiey.ap.qualcomm.com>
 <38c8e26c-08a4-42d9-8f6d-93969af90d50@kernel.org>
 <aQLOaI3ngjswi7kd@yuanjiey.ap.qualcomm.com>
 <7c1e0cb5-2483-4efa-be52-84cbe5d1a4b2@kernel.org>
 <aQMOz4P2/WyjXy1b@yuanjiey.ap.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQMOz4P2/WyjXy1b@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE1MCBTYWx0ZWRfX6V0xE/6xdO/i
 kUj0sgDY/TsoBJjlm9AOZgHruAfEiwPeR6WsMo1AzPlHZ/T3WZiyndVQVcMMTz8jyE2A17fk+p/
 1HY56bfjWoVsjPz/TV7dYH9YfjEUaTFbd+QRfol3EZVna77+bHjGma7RY2T3As1nI5kaxWEktsD
 5SRX0mhfc0q6qp+m70UHipN4I84CKPWm5ERUrqu4m+eeYuGGeU+9yhNgUlAajX2zPBoUBSFP4vB
 w8RNjvvRMgpN4j9MiV1MrkLd4qzUrHVRCDWxSl99MuR2mOmIJ2mtg/BdNGHA9RIuT6RBElRItxb
 /O8b5biAnVcoPbHnLUYggZolReNrSb8sZuUH8gbZUf8v8+3W6ahmZhlPWq82gCn5os9+x5b9bFI
 ujgKCCNzWlQttNsQxp7mF1fM4KgTpg==
X-Authority-Analysis: v=2.4 cv=KePfcAYD c=1 sm=1 tr=0 ts=6903a8d6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=59EQD5k8VZCOn1K0OjEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: wvmZU4MYvg17EDJ_UJoDfIHx5i8fZbTD
X-Proofpoint-GUID: wvmZU4MYvg17EDJ_UJoDfIHx5i8fZbTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300150

On Thu, Oct 30, 2025 at 03:07:59PM +0800, yuanjiey wrote:
> On Thu, Oct 30, 2025 at 06:37:40AM +0100, Krzysztof Kozlowski wrote:
> > On 30/10/2025 03:33, yuanjiey wrote:
> > > On Wed, Oct 29, 2025 at 02:05:20PM +0100, Krzysztof Kozlowski wrote:
> > >> On 29/10/2025 03:37, yuanjiey wrote:
> > >>> On Mon, Oct 27, 2025 at 10:51:23PM -0500, Bjorn Andersson wrote:
> > >>>> On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> > >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>>
> > >>>>> Build the NT37801 DSI panel driver as module.
> > >>>>>
> > >>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>
> > >>>> You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
> > >>>> provided certificate of origin, then you provide certificate of origin
> > >>>> and send it to list?
> > >>>>
> > >>>> Please correct.
> > >>>
> > >>> All the display patches were jointly developed by Yongxing and me.
> > >>> So every patch 
> > >>
> > >>
> > >> So two people were working on this absolutely trivial defconfig change?
> > >> I have troubles believing this.
> > > I want to say these patches I am first author and yongxing give me support, so
> > > I think yongxing is second author.
> > > 
> > > I want to express my gratitude for Yongxing's support in every patch, so I included
> > > both our names in the sign-off for each one.
> > > 
> > > However, if my intention causes any trouble for maintainer, I can remove Yongxing's
> > > sign-off from this patch.
> > 
> > 
> > Please read submitting patches to understand what Signed-off-by means.
> > Otherwise I have doubts we can accept your patches - you simply do not
> > understand what you are certifying.
> Thanks for your tips, and I learn some tips from submitting patches: 
> https://elixir.bootlin.com/linux/v6.18-rc3/source/Documentation/process/submitting-patches.rst#L524
> 
> I thinks below sign should be true, if you also think it true, I will use it in next patches.
> 
>  Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>  Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>  Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Does one-liner need two engineers to co-develop it?

-- 
With best wishes
Dmitry

