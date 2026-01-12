Return-Path: <linux-arm-msm+bounces-88481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCB3D1132A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC48C3003489
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920DA31194C;
	Mon, 12 Jan 2026 08:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lnqoxx1S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCmC7cPo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85B32D46C0
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768206344; cv=none; b=ibVvGmOf3O1lU0DyIxk6M6JGAZro8qXPI0rLWvCyAcQyoHot7RV6oJ44FGMh/Q2g5bn2uebfUWIdH/dTac6CWpqQs89B7vqq+0XYLGQDK7W2XJAR7IHzf4HZHPE76Su30z0rN8eclYhVFn6SF7pP3PQCeuC3gF4cfz6HEGhYNEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768206344; c=relaxed/simple;
	bh=YDFYO8/l3n0oxQNk7p0RI1LvdMlklpic5M4WrwRChhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l99mPIlgPO/Nbbpq9x0s7rQGq+LvlBEscrbhKPNXrafSehcGIBvJUgvMarOc1FFQATT48jEqKyed33IxAQaBxjKb//mCMw060spGRJ1G7nM4FvVTpiFb9Gqzicz32acYxR0JTJURzDKFBIcqCFjoEurkGlmKEVbiGGu6yJnHVY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lnqoxx1S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCmC7cPo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C2OIKw114368
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7eUOrm48pVIkwjT7mhYkGDB3wIt6XmnD5l2NmrqDlFQ=; b=Lnqoxx1S/lwnqyKi
	m82SCGrXOVPKKD2qaEKwbbW5WY00DKcikxm0YPmyGCYFfHvSScI+vb8O1unbwVo+
	HUC14QfGbwTaVlc3K+Pi9TyM7yAhgNLsfDdN3S8O244EBjkZ/n3cYmuxskNhE6xO
	xTMuNBQbyuOg87c5Do9u6i1jII9WquIf7KSdakM57JhJxNwabWDbM1dJo82ec5RK
	b/Uyj2pV6xbPVQINVocDMkwic0xBpK6JJEyl0ori0VYqXK3nAEDBNLGHgtl9WQyJ
	7ZoI5NJT/VidImJKLup0M50pFttvW/ODd+jIxtS481K30Qfde9dhWIBMqNGAdxVp
	d62SsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4ugyxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:25:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b6a9c80038so651837085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 00:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768206341; x=1768811141; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7eUOrm48pVIkwjT7mhYkGDB3wIt6XmnD5l2NmrqDlFQ=;
        b=XCmC7cPo2RAEgsTzAvEiiPUc/g2+0NfjhahaMAQOSqmlAcN4GQcKGesCfhhNlflC+A
         dV/f/oAPha5FHFXPnlaqGC7amnMX9E0u39iMs+qSjTDKpr8hKvDdmdZtSlcA7BCx3rE5
         Mm7Gc2RaVWd1L8wzxdZmBYnQhqttxwtbhJ7urf7GVf6njWyF/EMvVxWLSnwwM02QL9l9
         718Cr728YyfUL00e3iqVWoVwaKRQuVlWtOluzt3087FbBmlDVz2zlpqMPIRdpU/TZKYu
         urVVKv3jGmGdarHX1VXCZ63b0XgJy3Kdy7wD/yx0/mJd9aCP/v606gYVNyGxXwsnPwVz
         Wwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768206341; x=1768811141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7eUOrm48pVIkwjT7mhYkGDB3wIt6XmnD5l2NmrqDlFQ=;
        b=C/CToHthJlwY/d4ow9GvalcDvBOGga8a8TbZxkFV4yjrISxv8XaRkYGTGQoEeutgLE
         S7AVCn9zsA1vSYIGKk0UPDQpaM3GSldgd5pbX1QxxyRNMYo0JtHD9FrbLsVD2keWIiis
         GjltHtYJMf2rSbO3Ta2a5a8DJVcS8+Qnoe1k+IW013j1RN2yxuaJ2RTt0J+YFbB8+8OB
         kVfDbnTCtQ/cp3iqS4v6gRGH4KEKGqdIP3I7SWMd8VFfw5+5upaCB5aObzEprW4jS6I3
         siZSScsCBCPFA16N9todEaQuyrFvgT2wn+HoZJOc9V/MCzKp0Wq/YMXAruqKD2crGn9N
         nFWg==
X-Forwarded-Encrypted: i=1; AJvYcCWiYAXN0voM4KdIq5IdKTkKH6g7tQM5p0XUPNQkgeKdsOcqINFZIgtzgZBDpc2RAWd4V5ejgi7BX2+S9S65@vger.kernel.org
X-Gm-Message-State: AOJu0YwD8T9C9W4KOTKPIfFz3kGuvhp8+LozzuT12ytzyKM3G3flBsCJ
	k2KTypLgeqbMgmdpgs1nX4mPmgxLU2skjJb5eq7QhJQNE14YlApxlV8B+QEgCJFSzvDBm59KHHT
	98VOEckltVCHUXnQSIU1Dl6/muGGCUHrBZZWCfepVd5MVGWpsBdLZ04DgIvo1751CDz6X
X-Gm-Gg: AY/fxX7BiNA760fzxQoxIx0fGV8W0dudnv80Fw98AeaC6uqh9qb+5JPyEHrQ0MThWWa
	0WsIfno19l9OXUeTW0Xa7rh/vZ3lIrv5nQaNYnhYcLhKVUHoVzO9TE/FynMwi/z8z4/JNvNF+oj
	qe5akUcoDpIOpQx5SXvhGGsl4mj2Uc3jQmj0T0qFn+IbJ9A67f711yHRAv8perxAbjKodSE4Uvt
	1VkucprU4y2pRd+k0Lu40UORl13LiVQAf0z48j1hbKduAq+rrsyJb6ZvCeCYUIz1irFlkmZqkHy
	25acdOFMplIXDo0FB2dGLFehMC6ilCW/AQHA0zThfkkWQO6B0lTlOo7SctrJbbtGr4ZeL08Mk2p
	o6iJo/PhzpU0pL8bxlAjRLXQIv5YSz8luEq2ALD7vpInsLv+eUydm2ngyEn9vv9iH/64cTKc=
X-Received: by 2002:a05:620a:4143:b0:89e:a9ea:a374 with SMTP id af79cd13be357-8c3893e042dmr2325403685a.67.1768206341081;
        Mon, 12 Jan 2026 00:25:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqUgoQ0GCP62X1wdfQgILxQr4zc6ioMmvxHh5zsjlzgNHwrmBI204t3AI/afaZeiXkQyR08A==
X-Received: by 2002:a05:620a:4143:b0:89e:a9ea:a374 with SMTP id af79cd13be357-8c3893e042dmr2325400685a.67.1768206340519;
        Mon, 12 Jan 2026 00:25:40 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f544674sm1430752785a.54.2026.01.12.00.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:25:40 -0800 (PST)
Date: Mon, 12 Jan 2026 16:25:30 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2NSBTYWx0ZWRfX8+032iONIi5n
 GMBS9kQ+bNunRvyAu01LQ1wphVpEnJ6ClPk+GGJKBBgEcSvi9rw5poSYxtVP0mhkVv0GGg6QyDv
 b7AIB/8pY9DE6PCilctMkZro9Lzxv8EWpDPY7Y9HIdmEJEqfikY3ajOSF8lxsOsbLeMVcVNqSaq
 T5H3KonVfZess+woxxWI6yp+Ye9PissIjinvSkRUsc5Eq3Y3yHw34Q/uMP2/OgO1DLDtt8EMHIr
 tHOKBcM1zuyAAkdj+7BQpNJeusgTmJMkXLbP9FUoFpcdI8ejM5Ls6q2JZPrRsf/h9Fs90jTFxpO
 wYTk037NHzqPMiJxqx3j1gYhbr86z4WbSPbAigtHxJUfcHNHGEVlmIy1kzm5WEGthDlb6DdQUBs
 FCehupsjt4/dlJfw+iU+YYkbiA3K7W8ZtuglNLO3FzIM2S4rKp2lEwUGhrYGhpOh5D6HbOG5U9i
 I951jknU8u2xqnVQbjw==
X-Proofpoint-ORIG-GUID: uqYCByFgVSiviQqwv6RNVw_FXRZXKbc0
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964b006 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=b9kIr6_pAvzuZN9lwc0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uqYCByFgVSiviQqwv6RNVw_FXRZXKbc0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120065

On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
> >
> > On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > >
> > > > During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> > > > the MMCX rail to MIN_SVS while the core clock frequency remains at its
> > > > original (highest) rate. When runtime resume re-enables the clock, this
> > > > may result in a mismatch between the rail voltage and the clock rate.
> > > >
> > > > For example, in the DPU bind path, the sequence could be:
> > > >   cpu0: dev_sync_state -> rpmhpd_sync_state
> > > >   cpu1:                                     dpu_kms_hw_init
> > > > timeline 0 ------------------------------------------------> t
> > > >
> > > > After rpmhpd_sync_state, the voltage performance is no longer guaranteed
> > > > to stay at the highest level. During dpu_kms_hw_init, calling
> > > > dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
> > > > fall to MIN_SVS while the core clock is still at its maximum frequency.
> > >
> > > Ah, I see. dev_pm_set_rate(0) transforms to  _disable_opp_table(), which
> > > doesn't do anything with clocks. I think we should have a call to
> > > clk_disable_unprepare() before that and clk_prepare_enable() in the
> > > resume path.
> >
> > I do check the backtrace on kaanapali:
> >
> > active_corner = 3 (MIN_SVS)
> > rpmhpd_aggregate_corner+0x168/0x1d0
> > rpmhpd_set_performance_state+0x84/0xd0
> > _genpd_set_performance_state+0x50/0x198
> > genpd_set_performance_state.isra.0+0xbc/0xdc
> > genpd_dev_pm_set_performance_state+0x60/0xc4
> > dev_pm_domain_set_performance_state+0x24/0x3c
> > _set_opp+0x370/0x584
> > dev_pm_opp_set_rate+0x258/0x2b4
> > dpu_runtime_suspend+0x50/0x11c [msm]
> > pm_generic_runtime_suspend+0x2c/0x44
> > genpd_runtime_suspend+0xac/0x2d0
> > __rpm_callback+0x48/0x19c
> > rpm_callback+0x74/0x80
> > rpm_suspend+0x108/0x588
> > rpm_idle+0xe8/0x190
> > __pm_runtime_idle+0x50/0x94
> > dpu_kms_hw_init+0x3a0/0x4a8
> >
> > dev_pm_opp_set_rate(dev, 0); just low power to MIN_SVS.
> > And freq MDP: 650MHz
> >
> >
> > And I try change the order:
> > from:
> >         dev_pm_opp_set_rate(dev, 0);
> >         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> > to:
> >         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> >         dev_pm_opp_set_rate(dev, 0);
> >
> > But the issue is still here.
> 
> But which clock is still demanding higher MMCX voltage? All DPU clocks
> should be turned off at this point.
Yes, no DPU clock demand higher MMCX voltage here. But next time pm_runtime_get_sync
need higher MMCX voltagei due to high freq.
 
> >
> >
> > > > When the power is re-enabled, only the clock is enabled, leading to a
> > > > situation where the MMCX rail is at MIN_SVS but the core clock is at its
> > > > highest rate. In this state, the rail cannot sustain the clock rate,
> > > > which may cause instability or system crash.
> > > >
> > > > Fix this by setting the corresponding OPP corner during both power-on
> > > > and power-off sequences to ensure proper alignment of rail voltage and
> > > > clock frequency.
> > > >
> > > > Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")
> > > >
> > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >
> > > No empty lines between the tags. Also please cc stable.
> >
> > Sure, will fix.
> >
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++++++----
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
> > > >  2 files changed, 15 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > > index 0623f1dbed97..c31488335f2b 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > > @@ -1306,9 +1306,14 @@ static int dpu_kms_init(struct drm_device *ddev)
> > > >     struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> > > >     struct dev_pm_opp *opp;
> > > >     int ret = 0;
> > > > -   unsigned long max_freq = ULONG_MAX;
> > > > +   dpu_kms->max_freq = ULONG_MAX;
> > > > +   dpu_kms->min_freq = 0;
> > > >
> > > > -   opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> > > > +   opp = dev_pm_opp_find_freq_floor(dev, &dpu_kms->max_freq);
> > > > +   if (!IS_ERR(opp))
> > > > +           dev_pm_opp_put(opp);
> > > > +
> > > > +   opp = dev_pm_opp_find_freq_ceil(dev, &dpu_kms->min_freq);
> > > >     if (!IS_ERR(opp))
> > > >             dev_pm_opp_put(opp);
> > > >
> > > > @@ -1461,8 +1466,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
> > > >     struct msm_drm_private *priv = platform_get_drvdata(pdev);
> > > >     struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> > > >
> > > > -   /* Drop the performance state vote */
> > > > -   dev_pm_opp_set_rate(dev, 0);
> > > > +   /* adjust the performance state vote to low performance state */
> > > > +   dev_pm_opp_set_rate(dev, dpu_kms->min_freq);
> > >
> > > Here min_freq is the minumum working frequency, which will keep it
> > > ticking at a high frequency.  I think we are supposed to turn it off
> > > (well, switch to XO). Would it be enough to swap these two lines
> > > instead?
> >
> > Yes, just clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks) to
> > disable clk is OK.
> > we can drop change here.
> >
> > > >     clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> > > >
> > > >     for (i = 0; i < dpu_kms->num_paths; i++)
> > > > @@ -1481,6 +1486,9 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
> > > >     struct drm_device *ddev;
> > > >
> > > >     ddev = dpu_kms->dev;
> > > > +   /* adjust the performance state vote to high performance state */
> > > > +   if (dpu_kms->max_freq != ULONG_MAX)
> > > > +           dev_pm_opp_set_rate(dev, dpu_kms->max_freq);
> > >
> > > This one should not be necessary, we should be setting the performance
> > > point while comitting the DRM state.
> >
> > No, issue is during dpu binding path. And in msm_drm_kms_init driver just
> > pm_runtime_resume_and_get enable power and pm_runtime_put_sync disable power.
> > But We do not set the appropriate OPP each time the power is enabled.
> > As a result, a situation may occur where the rail stays at MIN_SVS while the
> > MDP is running at a high frequency.
> 
> Please move dev_pm_opp_set_rate() from dpu_kms_init() to dpu_kms_hw_init().

During dpu_kms_hw_init and msm_drm_kms_init and msm_drm_kms_post_init.

There are multiple places where pm_runtime_get_sync(pm_runtime_resume_and_get)and pm_runtime_put_sync are called.
And each time after pm_runtime_get_sync(pm_runtime_resume_and_get) will access register depond on MDP clk.

Do I need to add dev_pm_opp_set_rate after every pm_runtime_get_sync and pm_runtime_resume_and_get?

pm_runtime_get_sync
dev_pm_opp_set_rate
"access register"
pm_runtime_put_sync

pm_runtime_resume_and_get
dev_pm_opp_set_rate
"access register"
pm_runtime_put_sync

Thanks,
Yuanjie

> >
> > rpm_idle+0xe8/0x190
> > __pm_runtime_idle+0x50/0x94
> > dpu_kms_hw_init+0x3a0/0x4a8 [msm]
> > msm_drm_kms_init+0xb8/0x340 [msm]
> > msm_drm_init+0x16c/0x22c [msm]
> > msm_drm_bind+0x30/0x3c [msm]
> > try_to_bring_up_aggregate_device+0x168/0x1d4
> > __component_add+0xa4/0x170
> > component_add+0x14/0x20
> > dsi_dev_attach+0x20/0x2c [msm]
> > dsi_host_attach+0x58/0x98 [msm]
> > mipi_dsi_attach+0x30/0x54
> > novatek_nt37801_probe+0x13c/0x1c8 [panel_novatek_nt37801]
> >
> > And I found a a similar bug.
> > https://lore.kernel.org/all/20220915205559.14574-1-quic_bjorande@quicinc.com/
> >
> > Since the panel driver does not hold the property power-domains = <&rpmhpd RPMHPD_MMCX>
> > once all drivers that do own the RPMHPD_MMCX power domain finish probing,
> > the interconnect’s dev_sync_state is triggered, which eventually runs rpmhpd_sync_state
> > and starts dynamic voltage adjustment. This is when the issue occurs.
> >
> >
> > if do change below, this issue can also be fixed.
> > &mdss_dsi0 {
> >     ...
> >         panel@0 {
> >                 compatible = "novatek,nt37801";
> >                 ...
> >         ++      power-domains = <&rpmhpd RPMHPD_MMCX>;
> >     }
> > }
> > But I don't think panel driver should own a power-domains = <&rpmhpd RPMHPD_MMCX>;
> 
> That's not related.
> 
> >
> >
> >
> > Thanks,
> > Yuanjie
> >
> > > >
> > > >     rc = clk_bulk_prepare_enable(dpu_kms->num_clocks, dpu_kms->clocks);
> > > >     if (rc) {
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > index 993cf512f8c5..8d2595d8a5f6 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > @@ -92,6 +92,9 @@ struct dpu_kms {
> > > >     struct clk_bulk_data *clocks;
> > > >     size_t num_clocks;
> > > >
> > > > +   unsigned long max_freq;
> > > > +   unsigned long min_freq;
> > > > +
> > > >     /* reference count bandwidth requests, so we know when we can
> > > >      * release bandwidth.  Each atomic update increments, and frame-
> > > >      * done event decrements.  Additionally, for video mode, the
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
> 
> 
> 
> -- 
> With best wishes
> Dmitry

