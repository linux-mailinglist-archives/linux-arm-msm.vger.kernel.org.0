Return-Path: <linux-arm-msm+bounces-104133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMVuFa7Y6Gl7QwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:18:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1DF4472AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1E903005D27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8A922D7B9;
	Wed, 22 Apr 2026 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BisgEYBY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnkKGZEV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C1C282F3A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776867233; cv=pass; b=gKuCoNcFtypO0WRihra6c6DyMvYIY5Ma+PfmhWVmXfveYEfMecO5qxdAqP5b4Gspni8ii7KXRRgmZniifDbrsV9xGU29hPr+14fK7V0dUdJm3SI1nyVwg69HqWbFKHJWMWzLP7yVykmPc2DkKikiNvj/p0Dhxlj07W9ETaOroh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776867233; c=relaxed/simple;
	bh=0GodiRON+t1jn5lW0go+epW2UjbZgzwIF8nrw6iCbSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMGV1+8dhses37Lr2I8EdGlCf/2W+gk2HlxzkkiPWh1hFyTcdxHG86UH2ZZicguk/XgdXSb8/XkBdnzjtwTcNNeP4iGnddC7w3+Le2ftXB3k2y6HxuJsppneFR5JQ2JIpbujlS3ZJizdRBB9pLOYEn5CYf+7D/igKWt/DQsTwRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BisgEYBY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnkKGZEV; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAkQoD976176
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=bywIrjYAD8hJ/KhIAamlaAGv7hCjyo+6YSetWuvA6bg=; b=Bi
	sgEYBYoORaLG2UREwtJmRVwIb8pFARss5l0mUaEvIkaoFEL0ZIDuSXKGV9pQzRYj
	fF8GSW+ioLF49SXcQUvE1YH8GYvgw6SJlFxGRTrSTVgPBEEr0zs/d54AGrksVrLm
	i3uPKy2fsZyNgmSaBkihDEKe3JjcnN3/XM49ecPwHqmC3nzoa9IQ9QBut2r6fpuB
	TqAPH8hEWg37To8WJeCGoNhJAOMjeopBfBZ30eXSudD0ONM14xRyvaqasmpJZy/Z
	MLC+21LnmvONXi/2tkt/iD3gQ7wqJdPm5gihJ53BRCOWHKcdDhfiMjlExfRSxvc7
	NJIR2htIuViM0FQctjfg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenebtk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:13:51 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-42c07b2f12aso3405814fac.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 07:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776867231; cv=none;
        d=google.com; s=arc-20240605;
        b=bJXFuielAI3PMOPT012O9mNW1XJKYusXK5cKqA3hnzYOc5dCbYWX+kpqg0dZAeOWcy
         8XW3eVX/D5qjxaTAQC8xbdLbOG+VDB/0ZihX685fWNkVkRmsvKpOp9tgT0WRzJptOGzG
         S3Oks8qak7fvdqQr/xFcjhM/RQeRZl7gHVQD9PYg7wSTjOxXgwjI188hb5j9dSmHmCFT
         YOHdB7Hkmh3HEZwR+wRAjHifGmiaqEgKcteFVylMvpiRyh5taMHm1hiny3nBZUNq4l1s
         0tNSPoqgZNIp2yE1862ok3UTvIyJwWFpyZ2/DzeJopU5B6oO01VMFvGQZnjB2ulDBXja
         o2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=bywIrjYAD8hJ/KhIAamlaAGv7hCjyo+6YSetWuvA6bg=;
        fh=7ht6Ct/ooE3/SQ2Uxcp12LLHb2xP1+I1fCQCjNQQOao=;
        b=Sr8pslx493TrwRUWTbtMvFGVgqt836lXKktct1TpjCs0ueC6pXZYt2K6r+c2BqCT5+
         /MkY0hIRsMs8RcBUDh6Uws8GHHeFdFT5uyH2UYSE8+FgCsh3e440heJ1itGJkJz5vBiX
         202WzbV4ZeGya28S4B19gkFXb7SkgNSncP1JuvK463S9Bypqb9oMRwTt/ZEw8YrA0/O+
         G40h1Jzck1yEl9gI6ZfMez2EaAZMcQVmgEZGjbMj21AtktUIa2QwOIaZRPwbZuOoNWfd
         CSLPNyz+mJQPjt52qC/g0YRd06KDVH6c+Nk4tgYybJDggsPyKABUP8t5A9ldRZZf4Vbt
         R+yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776867231; x=1777472031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bywIrjYAD8hJ/KhIAamlaAGv7hCjyo+6YSetWuvA6bg=;
        b=bnkKGZEV7lh3oORlCgnFnpXeqGzZ8b1ZNe5h5hPUaPoB0dMEi8BUqGK5/q8rKq9h9s
         B+MCZA+Tg/WC9QWhl6JZNAIma/qFYvGGM9RDNw5cL+svly9G6dfdLiwytwShWDmqwOQh
         wwsQQP+RNmrZvnn8pvc9cDSPU4bE05vdK6QcOA4/n4Y9w6t1kt5K66yngMm7elY1cni/
         Jpkw6fVSFTRsJvoG4e9IztCQVG/wstgTTjBfux9GqiT6seNxn1Q8JZhaEcHSDFgUPLa3
         JKqugYk7+vuYjTethGEdP6TwdRASwbedAUtlwsXcRojove5w55yk8lxHZ/E12ssd9Csm
         nHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776867231; x=1777472031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bywIrjYAD8hJ/KhIAamlaAGv7hCjyo+6YSetWuvA6bg=;
        b=sxwAR+Fp/azr7Gb5TB6hV+6vHzMA5USf3f/6iQKMRxTmX9jDoLXKMWiJoOyhK2QSzG
         p5K2TM+rdVQNoDynjYzf1h2l7bh+LOVIM2fnHAxKTfm9yL+KFYFBXNIx63pdQ8Yz7SuF
         fqyUK++7HvpsdksssqeSn1g/5eoIH3acoYUnFcm6shem85uaPEPc6iC1MwST2FYK+T3f
         1HK5eJJqaopx/gYoZESChHwfdmfqa79yMs37kw2vyjE5+pfUm/92Z/ozA7vlkTfHyRrH
         st4jIieQ5DraHQmCqG4trRcrnnd2RXUzmP9UOIjtwOI6yCnRCv6KU3ZDAIDRdAiSlH97
         jP3g==
X-Forwarded-Encrypted: i=1; AFNElJ/KzNBDRQ2YGJnm/zcikndFpnAfbVLFfNs1qVKTF35DWtQWVFCpllOuz/aMZJMf5hdlWtI1Bo0WNLLyWmVD@vger.kernel.org
X-Gm-Message-State: AOJu0YwKhtuVgKT6d8CZurQSQz3BKrErlQogb+z4JBkNecR0Nt7unKCJ
	w36TLiX37L2MAuw+KcNKJddVRiUNwZe4BtaWiNWS3xiCALqzNc8thqGXrIQaalsBbN5KBHQHDMY
	nDJZifoK3tpKYMt86Z5n1g4TwO+rFWUsP58fRFqC12WZ5MnEEi8EoPIMEu6FYMGaHj6UCASvit/
	6aK01e3r3/2VvHmBTf44XSX8OHQ4Qv6mANWQJ43yeiEkg=
X-Gm-Gg: AeBDievUHDr7qoh87eUc+vONt6OlbLMucuGm+Y4XSF/srusNNSrP+Gr/H+2RH/GbLa3
	TR4Mmbvz0ywbLpgTe2H3y5c+uNlVGlP47XoQZeb+pffwtR87Eo8OxE+5xaHzeZKPMvXhwvC3YJN
	VXIGTLDK6i5amx/FHhJE0gceasxhYuysj4+WEmOX+oJQ7SxoyAIOlRytIKVuhWtBQ9NuzrsGMg7
	xS/lP9uqapLttsQhjzZ79UJ6AhMySCBSwb42XOIs7Lvd7UM
X-Received: by 2002:a05:6870:2155:b0:42c:12b4:37cc with SMTP id 586e51a60fabf-42c12b43a35mr6673327fac.36.1776867230733;
        Wed, 22 Apr 2026 07:13:50 -0700 (PDT)
X-Received: by 2002:a05:6870:2155:b0:42c:12b4:37cc with SMTP id
 586e51a60fabf-42c12b43a35mr6673314fac.36.1776867230386; Wed, 22 Apr 2026
 07:13:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-10-robin.clark@oss.qualcomm.com> <wfarxotu3lb64ncqmohysmyrdsneg7lgvq7kldcuntshtciob6@nej7bduzff4w>
In-Reply-To: <wfarxotu3lb64ncqmohysmyrdsneg7lgvq7kldcuntshtciob6@nej7bduzff4w>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 07:13:38 -0700
X-Gm-Features: AQROBzAu-fRTbmbSLiq3Y4iwzoXmrrYlIvDXXLyPf-5MPPV1EIVVwBhinppkxVQ
Message-ID: <CACSVV01AUx=1L0BpWQiECbPo1B+PBb9HoQDghUt+CoRuX084ew@mail.gmail.com>
Subject: Re: [PATCH 09/13] drm/msm: Add per-context perfcntr state
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEzNyBTYWx0ZWRfXzXzvBl3DCjaU
 +M/Hs40fkV9wvzoJN0+Zc+xfmbpY7cjVScXHDd4C0pU/JvsCwKh2l3Kr5sjfCLPlSx93jY5V1GJ
 vOA/TCJfpCU8LINEhPFerzHIEV0R+sJIde/pRv5gtB4sn6e/ZP0PTlVSdcNlVo9ru/0Ymd1LiXM
 qTgArre+SGF+c07hXQH7PGWTrt3sHEgk7AavurE2ZFALdv/ONHLhnm+3i747GFuWpVLYOMzk3IM
 8K3g1zW8nn3Q1C8KiV4IkaK+pyI06XCqRDR4cKyIV7dO9Q/KXEAj4ZPsesZgipAnMqFmG4sOVmk
 KafVu2Q/+he/1bSP2fe5IG83YJ0yy8p+MOgRlDZAv5X6FpHdIfLmOxAO5NJ+tTRTV//e5f7R6vX
 wzexuNwRx8UlXOdg8k+y/S7VwrR4O0ysHummIhcwYYdGd383pdy4hQibihMiK6XBnC7EA/mDaCD
 QT0k6BlKZRwpVWYqELQ==
X-Proofpoint-GUID: mki07Slw7KALVOMl-_In5q8a7f4JSjbS
X-Proofpoint-ORIG-GUID: mki07Slw7KALVOMl-_In5q8a7f4JSjbS
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e8d79f cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=STtiYm4I-wbpJ57UIjUA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220137
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104133-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: BC1DF4472AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 8:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Apr 20, 2026 at 03:25:31PM -0700, Rob Clark wrote:
> > The upcoming PERFCNTR_CONFIG ioctl will allow for both global counter
> > collection, and per-context counter reservation for local (ie. within
> > a single GEM_SUBMIT ioctl) counter collection.
> >
> > Any number of contexts can reserve the same counters, but we will need
> > to ensure that counters reserved for local counter collection do not
> > conflict with counters used for global counter collection.
> >
> > So add tracking for per-context local counter reservations.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>
> >
> > +struct msm_perfcntr_context_state {
> > +     /**
> > +      * @reserved_counters:
> > +      *
> > +      * The number of reserved counters indexed by perfcntr group.
> > +      */
> > +     unsigned reserved_counters[];
> > +};
>
> Fails here (Debian, trixie, gcc 14.2) with:
>
> In file included from drivers/gpu/drm/msm/generated/a6xx_perfcntrs.json.c=
:7:
> ./drivers/gpu/drm/msm/msm_perfcntr.h:130:18: error: flexible array member=
 in a struct with no named members
>   130 |         unsigned reserved_counters[];
>       |                  ^~~~~~~~~~~~~~~~~

ugg... gcc 15.2.1 seems ok with this.  I guess we could just add a dummy fi=
eld..

BR,
-R

> > +
> >  extern const struct msm_perfcntr_group a6xx_perfcntr_groups[];
> >  extern const unsigned a6xx_num_perfcntr_groups;
> >
>
> --
> With best wishes
> Dmitry

