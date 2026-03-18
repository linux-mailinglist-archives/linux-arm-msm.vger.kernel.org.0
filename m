Return-Path: <linux-arm-msm+bounces-98546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHtQGo3hummdcwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 18:31:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 126502C053A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 18:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B69C93024EED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 17:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07F92F1FFC;
	Wed, 18 Mar 2026 17:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ej7I1v6m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hk2iWOMp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A7C2F2918
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 17:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855033; cv=none; b=cdD5+y1fcp/VKFg1PQ42tBmoI61h+CjvIUtAJ0/4mDDMNwQZDul/3Y17T2fI0Bvfd/1SFUAXkrDYJ8SSSo6pD1lLFyV3pSx0fsOpPR5GVfVxEYwL4v8MB+2lM/oy1+okC/voBbsnWPgmHtBTK1PLpdaC0+y9rV6cplYvnwjOpqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855033; c=relaxed/simple;
	bh=QpmnyPKSYphBXQ3BNZGR9v1yJh3x6rWQPcykMSvpr+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuwTuP+MvQn72xFuxQatkavMNvBCBMrhPTBd0pFgaYndSvakaZuQu5SYAAHG+UbEEkkWDCjoLPY/57VYpcaCkyw253OJkx9D7eWEm7ieqY/d1IuUMYp1CJidM/ZdgVL4cyrqzz/VysyD5X/zfJw+xNpoza6CdWh2y8Z2gBt7Dgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ej7I1v6m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hk2iWOMp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFh0uh004173
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 17:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsdUjT6QXWGlY4sg5HjzvLmam34NpmSGVzMoRHEEyJs=; b=Ej7I1v6mQDpfU1RP
	waImumB5aDTkym3zLDGgpNoG1h+qN92Ky8LkPVPWTAqYdNjvdDNJxKY6fKygfj9P
	cfjHufbQz4W7+jEwtFVwxQ1dtOJZSNJTCrTC8EulOSDa1xGonv2A+3ToDKGqIFbv
	LG8/9pgIgHYjWpp6pQC1/qmlUT2WvaGNdBMg0qhPJnO67hC1I3Hg7WdpIOL8jXTR
	I+1cdFbkKUjXHeTL63N1ReVqoN2J5INqLyzeuDQu7zynHYLKMCx645fon02qgoZS
	VXFTeiG5wqc08EBkMx0sQ1e2TQHsnYDW9G+uuIL1Zfh1u5et14CHIHS4Grcavh9r
	inyCsw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb1v9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 17:30:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509177a915aso2320531cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773855031; x=1774459831; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jsdUjT6QXWGlY4sg5HjzvLmam34NpmSGVzMoRHEEyJs=;
        b=hk2iWOMpCNe32zvOoxtygQj7LbBilbM49dGteu+i2K7wdvJH9biFRGkMaa8QRGR7lw
         hZ97FMOlTv1NKpoG4k9mlDzrxbqCCDZZEu9EjHeZoS71Ot5JLrStXK1MPDsaBbQF/XLH
         /6aXLF0pPfdTsr1uc8sTjJLA8Gk3P84x34lhDmyYs8S1Dz9aCmlpa6SfSLZEI3ojpLWT
         Qp6yzTjRmJUFwv+BX2vJV5VabdQfwOtmkZkXP1mRyB77fFZIcb2yGpk2l87F6MaVaHTS
         9Qi147DREWdzp5obSELfjq4qavh9Y9Tz0G1Dr4hTvAVnauHF787Q5tc+MZSrMkMbGORb
         wXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773855031; x=1774459831;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsdUjT6QXWGlY4sg5HjzvLmam34NpmSGVzMoRHEEyJs=;
        b=Pnb6rYtcMKWV3xvLvUpsCCnD5Uh8xA8zHgWvTzL6gJS9pl/eHn654Ly6FNDLya571t
         n0UpSGm8X+djc7abOn7SUq6U8uF/im/zcvaX1P8q4SFDxLO1Px17jQA3FkX5kTN3yEze
         7BbzgGQWs4EQ1tdPrSEziZbPijyyStM0MENgpDF/hIuZ7kxlRCxfsm6IKMlLF3rgQrZc
         Ss6I9NSzr5yQmZLnpWhu6aIbuOKtQvVuZMJMrbWtbC/6cFc1OxxIXESFsHbfFVg5bedw
         vL63ym+DuwjeZLTc4WNlrZvNQ1Rhsu+uPhaqhwPiW39JMqpt1aFL0Zidzzm3ypRo6iON
         1ShQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJK5ob8eU/7L8fnFckFAkYe3X1lR0zkk25e4U09O1z0crQSTiZ3RtlE8oQ9boL7BxGAH2JGqQoXk1BcUaU@vger.kernel.org
X-Gm-Message-State: AOJu0YzHxTGpCnu8n8ZHIev6TIHOm7FTtHZdNTsUnxElpZ64DlGNkMgY
	yIrD2eGXSjADNvs/gqU+Fyecjnoen5HLrMGmxvzAQ5SHp5RaE7WiCcJIWRzHByuclrvYQaDwVE8
	baO4NcgwWqdBjVXlgun3gVG8KXaWofTev52WVQqAHgR5vXtTfjomvmCJ3jR+73bc//VaZ
X-Gm-Gg: ATEYQzxPyjhDNjTvUAdcUMmlPxzJIbwKOGZH8mqG4slseuXt/7Q29I2790s9bkFgANB
	jtwrmcJ/xfqagF6RP6yhjah60q6RVqnu6DunBqD4d28RFMzRKg1d1StaGoiz/3ZkU7tSy7lgFX5
	Re5ooRpvB2yG8TvnWqU7NI5RI8PlGETeYtIICbcPt1Ul6VwLxugH2L/TeZO4aBb5UlJvidCZDge
	tddBnQH5fVX5W16tgovaSy+3P55PfdQADvqX4hzfWOo0GKLaHoTUN4F5+8Z8SKWiKF+dWSJuobi
	tC2il5O+8c2i51jQ7oVGgCHUJKJ+iSuCawRE7eWbI5ZupDBgl9A43m1zwZdEQuw7g2pMZNEyyR0
	tKy+sG3Csb6m7f29d6fwHXTZLLq9Uov7a+ucR/eq7Y2rGojkZ/H8J27QsBu1vIxxnNp9n6v5aiR
	0OXVQv/smWvCBrFglnIBUVQ+S7mv+iCoNNtFM=
X-Received: by 2002:a05:622a:612:b0:509:2231:977a with SMTP id d75a77b69052e-50b247666c6mr5308921cf.30.1773855030566;
        Wed, 18 Mar 2026 10:30:30 -0700 (PDT)
X-Received: by 2002:a05:622a:612:b0:509:2231:977a with SMTP id d75a77b69052e-50b247666c6mr5308061cf.30.1773855029880;
        Wed, 18 Mar 2026 10:30:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c2c11dsm687273e87.22.2026.03.18.10.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:30:28 -0700 (PDT)
Date: Wed, 18 Mar 2026 19:30:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?Q?C=C3=A9dric?= Bellegarde <cedric.bellegarde@adishatz.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix vblank IRQ registration before
 atomic_mode_set
Message-ID: <rydbi6teluxhmilj4bn47ds27i7uqsjtv4bd22s6cxpxcnt5fw@c6b5e6r7cxm2>
References: <ubxvfyx4tugfliwffrrlbe2oliep6nhp5dbpjry4vmamldz2ow@qncsubi7heex>
 <20260318171700.394945-1-cedric.bellegarde@adishatz.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318171700.394945-1-cedric.bellegarde@adishatz.org>
X-Proofpoint-ORIG-GUID: 81LKkxpI7fcgGEVwjWQsaLAVAQsTZ6fS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE1MCBTYWx0ZWRfX6STg1FTRfH9a
 9g6mX7sc25mOQqYrzd1F9/OYtSFo5KXvEPVS3cqhXhBBdGRnQPiHZSZ5/hm9F+HbchHnQ4WsSjB
 wFAka9EivJ99+eX0UiexT+E7BqaBWKSGTPPU0gABIZIHS/Mh7qb2CK1y8QjXN0GTMjgwTzJMHjq
 KgrOKH7vSEaVMDsEsSe+NlowjzS1QwbqPUPiV7U3iJgsvkRj1S5uwZNCCGjdq1mGt/O2uoS4i7N
 A7wbv0rhpB5wch4NSe2RzoM++cu6U2WbktoZ7dkqx54jyQI8/c49xZ9bL1oMYO3zzAkIWviisfY
 5uKd6HD5wg7IEgl7ivBurozKhWrdyq4NdknOYkcXa+lHowZvlUqMipmzTpOMTKUV1NEOgP4Rz0I
 gWiypZeFbAjlSYlKAgVIjTIgNdm30OClhSi5IgEHbQ9hLMWWOcXV+HLHA2gkZ/k1NwwaSZiqjjb
 rHEy63KetWlyym5svpA==
X-Proofpoint-GUID: 81LKkxpI7fcgGEVwjWQsaLAVAQsTZ6fS
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69bae137 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=LCWlJkpBAAAA:8
 a=EUspDBNiAAAA:8 a=h7vFti6rFQqOaJsGGxgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=dawVfQjAaf238kedN5IG:22 a=z1lahxahPt366DkPXCx7:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180150
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98546-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,adishatz.org:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 126502C053A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 06:17:00PM +0100, Cédric Bellegarde wrote:
> dpu_encoder_toggle_vblank_for_crtc() can call control_vblank_irq()
> at any time in response to a userspace vblank request, independently
> of the atomic commit sequence. If this happens before the encoder's
> first atomic_mode_set(), irq[INTR_IDX_RDPTR] is still zero.
> 
> Passing irq_idx=0 to dpu_core_irq_register_callback() is treated as
> invalid, and DPU_IRQ_REG(0) and DPU_IRQ_BIT(0) produce misleading
> values of 134217727 and 31 respectively due to unsigned wraparound
> in the (irq_idx - 1) macros, resulting in the confusing error:
> 
>   [dpu error]invalid IRQ=[134217727, 31]
> 
> Since irq[INTR_IDX_RDPTR] will be properly populated by
> atomic_mode_set() and registered by irq_enable() as part of the
> normal modeset sequence, silently skip the vblank IRQ registration
> when the index has not yet been initialized. This matches the
> existing pattern of the master encoder check above it.
> 
> Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

In future, please, don't post new iterations as replies to the previous
one. See Documentation/process/submitting-patches.rst

-- 
With best wishes
Dmitry

