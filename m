Return-Path: <linux-arm-msm+bounces-89752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BF8D3BDDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 04:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DE5643468EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 03:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E383164AA;
	Tue, 20 Jan 2026 03:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c0/kiv4j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NrTzu42a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE331314D37
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 03:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768878771; cv=none; b=GWv8YryBcpmiLadWvqnp4PQqmCppyHFm9AjSr2A5bpbWtCJP7oF7wUSo9a/nG3DRxK7O0rhQ11FGxL5p0cKuA63cHpSKNdPtFn72toy2BybVdFa9AJr5gIP4Ramn7ZDv6XbYVIRxnKNfvSmxocO5hrMWKlLQXVJv4wjIph6WnTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768878771; c=relaxed/simple;
	bh=MTjNB7ZJIahkgtov3KyJ+R1+wFsY+oYdvJjDcs1fkH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDB+pPvg99MNmMS6cNTgKwDUU+ViUuxgeKZZnnBsigI8k8bniDfKBaEiKrDE8pkbL5utJgWBfn/Pag/ZScNhxd/2PZCroIP3jjpWNZaUUl77J8iJj/jtXf0FzzQ28l7FyjFys0hjjoct0oHiiUOD5E56VCNEwFaKZFN5XFE8HzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0/kiv4j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrTzu42a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K2A1qX3177315
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 03:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dN6GrBjm9j5/FKfXJYdfLqyzUS7aQVthNgblFux+x3c=; b=c0/kiv4jXP4i9kD8
	u3m1KHN1KVFyQJV8+vuAQ+GeueFvEBfVcSN2cF/iTDMOGBZ+rQjjtPeP5v90gC7Y
	gpfLTI7gkr0mkZmLxboVFI7P6Lyhuf2qVO9UgCQiT5gC+nDF1HwO5OCRu+5VbVyJ
	CmDWn1DObZDvuvv426G0ZOuR/c/rbm4+gGDqEFzYyhf07v02r5jN0zENom9q3B2F
	NKeDyvRoYMZHSw+0kMwABAUzUAlnUR82BqcSXOD+oq2eQJ7mUWC3VN4nmWSpRf+9
	oymdFzhvDZCkEuniHlqCR6a0r0hfx/J9xXKJdzD1iqoQAFZrckCq+ouJdmiEau2w
	2JM61w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt0p2g5hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 03:12:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a69b7813so914624085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 19:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768878768; x=1769483568; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dN6GrBjm9j5/FKfXJYdfLqyzUS7aQVthNgblFux+x3c=;
        b=NrTzu42a+Z1vSopczYjJpkD4vSxOcQETnV+tWpWBaF98ejuaB66zDMAUJX+HB2bd+o
         3YJi0HWNw++qHwdKQlhOQk1ip7rWjacy8dyqZADtbGi/znp/0EaHfz20H2g+16j57rDm
         5W8D8XgdpwK6xElF2W4ek8HvU0puV3ofGCFokXKEdINZqcKgft27w1Pggcyg+QOyLrIM
         PW8lCDRQbu716qTaRM7yFHg3q8IRwnzuSojvXv1/FQaOuO7I2meJPRGenybZVprqx5nb
         eAFoO/p4mZ5+MbaBkMQv7Ka3SAuFgbCVsbn43+Dusn/msEBuo/jSfMC1tkPrxjrDmPWW
         vWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768878768; x=1769483568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dN6GrBjm9j5/FKfXJYdfLqyzUS7aQVthNgblFux+x3c=;
        b=r860y1BquZuLdmNm/df866/k4Lnbr+YYel40YRALcNH3Xoyfops2Rl0Ioqydx023JJ
         lUk+9lYorAoc891WPha5/+DZ7qP9TQqJhYnRy8lMspYKgcns3TnMMjhueLDdRcI4SgMv
         RpHmncMiWSe9LXxlrMvkIPdvUEwHe781WI8CVxnnZjYrft17A/vduZYZ9h6ieJdK4N1a
         yd91GSDumqKy/ddAYYY+26az39Lv571e9mqxfcDaH3AVhDcA0kSL6Kxn4aDX+0TtfWtE
         HQfXoHUl36OhcHJ1e95sP7BA6fC/JbQVajYt+LuYUS3/PHZyb17z1yH2GiXlujuegeLp
         gFYA==
X-Forwarded-Encrypted: i=1; AJvYcCWsObN2S94PpS1p/kqPXVP2uXO9ZYuzBO3/pmsAZvcOrv62fAHlR0Tg/plozYTur31Tm54CTYdUOWxMMuYI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/s8/sRVZr2eedRhi9WgPu4YLKf0IjK0lWZhvzGUhit5plfG2/
	bzz89//i7hVa5K7mVvlsOxIYzHFL6pWntvk41tyZpZcKBlPqTlIz9R0DGx/8PryqYHEgBXsx+de
	4wruA7+EPSWBqMztDOI/ZIqMQv4HutLlDV8vvnNhR70va9D6oler2pz5nKG+5cOfTFT3U
X-Gm-Gg: AY/fxX6+pZQPznbaHZsSjHl3tuJYdPyeKimUMyI/fdmupObB6LrFQBEosQa9CMB9X+o
	uXHmwh/Xo6DpUnCxrkpxTd4eYkOSKY6RqVl5Fd86G++G/bNZBBDu/nZsXhwcC2yinEP0tydg7rm
	iIKqTfqcl3RTPqmBDUt5q6tgT468GmJZi5xd0a0j4ktzFFvxO3XG7HEbFyL9XaHRAoSEof6KW6D
	XWG2CiM+M1n/mBauQEiMM1ZIxjvRNzP7XozdqaWk7OY3GkYD6JJ5Jsjae6DvWwKreLmSnbUlA9M
	SMP4r1ot6Dl35y1rsz3dp0I1r9RYaRtiZDVeKXFwCDXp5sfyEib5Y26GzYMozgEB1Mjpei8+H2J
	TrClFJ0l2B8Mjxy3lrIXFCa1exNk1oBmbgbL+N+VT/mv7bR4dz8xpy1O0+PBWJhe3DkSwJGTRid
	BtgS1DXEx7B4+i1npgC2GMhS4=
X-Received: by 2002:a05:620a:280b:b0:8a4:6ac1:aeb with SMTP id af79cd13be357-8c6a69499a1mr1727922085a.74.1768878767804;
        Mon, 19 Jan 2026 19:12:47 -0800 (PST)
X-Received: by 2002:a05:620a:280b:b0:8a4:6ac1:aeb with SMTP id af79cd13be357-8c6a69499a1mr1727920085a.74.1768878767336;
        Mon, 19 Jan 2026 19:12:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c453sm3825512e87.76.2026.01.19.19.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 19:12:45 -0800 (PST)
Date: Tue, 20 Jan 2026 05:12:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2] drm/msm/dp: Correct LeMans/Monaco DP phy
 Swing/Emphasis setting
Message-ID: <5ytgf7saw6yfvqzqmy4gtjygo4cx52vomi7mwswc7hgedzz3rb@eiqxiqs2cjmb>
References: <20260119-klm_dpphy-v2-1-52252190940b@oss.qualcomm.com>
 <47skckagggxijdhinmmibtrd3dydixtj6pccrgjwyczs7bj2te@2rq2iprmzvyf>
 <749e716e-a6cb-4adb-8ffc-0d6f4c6d56c4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <749e716e-a6cb-4adb-8ffc-0d6f4c6d56c4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: MMl02YzwW5uiLM6KFiVLoPzk-cU6ay68
X-Authority-Analysis: v=2.4 cv=drTWylg4 c=1 sm=1 tr=0 ts=696ef2b0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=fMMN0vGI0iEnj70k6hcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: MMl02YzwW5uiLM6KFiVLoPzk-cU6ay68
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDAyNCBTYWx0ZWRfX5pxjOf2vLO0i
 9PhhMlwIEax5LRtUAuc6eAcDNsVkf+59vq1ug/8gK/3Bw+qyWpf4Azd5E00h4WO8z3nbnTxrpsZ
 9M16u4Z9ud0MgbNeXK0MQGlXJ7I0dgSH/Ki4Sekr9zNbD0wKZhvAQCV7eph7uApUyI30Tqjjjtg
 NBAIBepVpbCH8OS2OKJf62QJeZKItUPSrMOCW3k+DInmPe7HPX9wSZfNWilSgZY5o8azx1wKr9l
 otOLN2aludOnr8mgBkMK+d+htxqtOaGHF8jXjkr1mPBSwYccCPxC5nQaAL90ew9MkIogEeBHOGW
 Hg+NxpeDV29miXdFVnuq2cszU2pJi6icneuv13+/XyywgkfRFrt32OFyC8vEKwIORZ/td9GJAqV
 N/GtShxtBg8X8vKO5epRYWMqDAq4sK4ugYChtxw2DHtBWWXQu8TIGx4UGO1mcA9SH9DEhSSoQYv
 +i50o8wnnZ/OwCIr48g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200024

On Tue, Jan 20, 2026 at 10:43:46AM +0800, Yongxing Mou wrote:
> 
> 
> On 1/19/2026 8:55 PM, Dmitry Baryshkov wrote:
> > On Mon, Jan 19, 2026 at 08:37:20PM +0800, Yongxing Mou wrote:
> > > Currently, the LeMans/Monaco devices and their derivative platforms
> > > operate in DP mode rather than eDP mode. Per the PHY HPG, the Swing and
> > > Emphasis settings need to be corrected to the proper values.
> > 
> > No, they need to be configured dynamically. I wrote earlier that the
> > driver needs refactoring.
> > 
> Hi, Dmitry. I plan to submit them in this order: this patch → LDO patch →
> refactor.
> Since the refactor involves more platforms and may take some time, I’d like
> to get this patch merged first.

This patch is incorrect. It trades working on some platforms (DP) vs
working of someo ther platforms (eDP). I don't think it is a proper fix
for any problem.

> > > 
> > > This will help achieve successful link training on some dongles.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: 3f12bf16213c ("phy: qcom: edp: Add support for eDP PHY on SA8775P")
> > > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > > Changes in v2:
> > > - Separate the LDO change out.[Konrad][Dmitry]
> > > - Modify the commit message.[Dmitry]
> > > - Link to v1: https://lore.kernel.org/r/20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-edp.c | 23 ++++++++++++++++++++++-
> > >   1 file changed, 22 insertions(+), 1 deletion(-)
> > > 
> > 
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

