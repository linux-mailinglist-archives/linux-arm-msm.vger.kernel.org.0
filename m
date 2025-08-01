Return-Path: <linux-arm-msm+bounces-67414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAF4B186AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 19:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 925997B3BD0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 17:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA2F271443;
	Fri,  1 Aug 2025 17:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idHTSgLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BD81DE3CA
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 17:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754069269; cv=none; b=C2t15Qxgvu+D9Y9CVYdiQdDZ5mS+DQ9/L7/CLlMF3kPqReQtuv8jQIUK/F1ffVhZTQqLETiado/2u7STXtM8HcUp+OrfYcPa2JEmXVo1zCXKMDOXEqzQDlRD+5HkhsW2fJQaNHPx9ivOaga6PMd9FSqBCB5rwQ8iBkoo1C9Mzo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754069269; c=relaxed/simple;
	bh=zCP7/k6pyb4TLYoeEpsHOm/q6g/zOt2WZnx53fht74k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/rC+H9MzLQ5t0dhsvUbbwtymziooqgTmg8fH+onEzCb3P54t9UIcTe0Sp+G1GARlkKqSsQ/Mr+kTCyA/zYlwAJZ/gd5BALpDEvt+ysVRpRl/KgY2BOuY46n4u/xcLW1htqF0PVPCM7RTGldxhdJphkWdWAevhPKcCfi+rmQy/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idHTSgLd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HBXcH018764
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 17:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gd5tstYh6LT7JlYajYIuF2uaw6f0VMBgSMWAmmjiMzk=; b=idHTSgLdSsf3gy/P
	WE2JzdbJl5keVKsOWti+0V4R/3nAloLWTwHHWW1FOJRen8YnWhwf+jav5mq1rkeB
	vjtW0lLmVs+xnAckXieRYc9Ba97F91RPCyhS8I3HCP1wqVUiI3lIi5y670g0kob2
	VVf3aC1TKBYY0UoYretO3ZxsyHvIwuu74iea5obM8pjAKfg1WfdBNPH09osIyNFd
	jFS6xHAcUwRevH/c8ZGbQddvYcd1dRYdmeh3+IS0f/rs0JKXNhRWIUIhzaScqQYl
	hhixvbN/TJF1v6sJN2uqr5idbcJxbGP68nQcV1hDrFKCWwfCO4ptZ86HDUK8Vwkg
	m1lIJg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwgh9s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 17:27:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4aef237945fso37882741cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 10:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754069247; x=1754674047;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gd5tstYh6LT7JlYajYIuF2uaw6f0VMBgSMWAmmjiMzk=;
        b=FYnIjrR64VrsAzQwgK/dJf7RCf+6KDVhaLla9184tcBeARtI6ViLXM62uLZLIdETGT
         VdR4r9WMCdXBMnLEnGbFws83sC+q5VXZw5IadNloE48IyZ/vpBe1hv1yIZg0I/j2rLQx
         7KdoZC3X7VBLgCrzp4MKtuohVykRr7BA8ML5BGnJ0dNImVDvTxXynbIgm73uqffCKsML
         SUHBARWvklId6/uzAeuKudti9YL+NixkCkysqrPyms5zbCDs4QQ3hQGZx7rjuziEYNRe
         Xk+Z5zxdpVkzY3wtN/wKVXLLBLj/DWGGbYa/PWurr+LlemK7+7hNQv+w7dd94X6DhzH2
         V/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCX1yweRAFUhWK+y2kzNGzYbAwdKZsvF9DiDazVc6shCOYUY9W+6O7r27vzv1KlHgRGvmkjDqL35MJi82rZK@vger.kernel.org
X-Gm-Message-State: AOJu0YzhHIAJ7QUXTBjRQRGHmldgYZgS7uU/e61+pKCvA6VxkGAV2KlN
	jpNY3PTm4cgOpO+zmVj1uNS9kvd5nmulKffVWRaHUrZaccISm+zv1yTT8KPMtsDuXOQ+E/ITdYt
	rwYGpWkSujC8IptF5FGAoJwQOLnOhqZNc775Pg/0z6sbSNDzRPZZM2dd3z8boIYrt6No0
X-Gm-Gg: ASbGncvi4mxskrpR8612zab57u/gWrho+QnUOsqQaztW8l40tbC9I5lXgiF6mLFSZj6
	pupn8VWVLjmGb4oQ+mOm3TmtXGs8jIbk1WTSq1MUg1xKUepExLRK6k+CW02LMdvGv0JK52SgQKU
	Zjwpp7Q61NXQlRl6YjROy/yS+8nSvv242ez20jhwalZRyUStqNuls5TKBVca7twVPAfSncs+uGq
	wrgfUfFrvOMcz9VBs1PYzpDArRb8jvzDvU5KEOm8s024UNDaMJoonU/N/iIk81KNQfqWSP+Xky2
	PZinOfxEw9zqHfU4CqAokdLP20rhRBPwMW+CKsPkV1PvHQGFL2Y4mgsLg4UhpDYWFdtLxVKlalk
	5YBCt97EXyuMi5HTqwEDu6c8WzTfcbWGpAfLhwuHnSVdFK2YLfBMt
X-Received: by 2002:a05:622a:40ce:b0:4ab:9586:bdd8 with SMTP id d75a77b69052e-4af10d01637mr8382671cf.55.1754069247395;
        Fri, 01 Aug 2025 10:27:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBw9nhdPsDlg5I3f4YQZl7JJAwjts+cyd9CulEFok5+KIfN5Gym8IrZjSAByTlzTyA0/sNlQ==
X-Received: by 2002:a05:622a:40ce:b0:4ab:9586:bdd8 with SMTP id d75a77b69052e-4af10d01637mr8382341cf.55.1754069246890;
        Fri, 01 Aug 2025 10:27:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33250b6beddsm1603171fa.56.2025.08.01.10.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 10:27:26 -0700 (PDT)
Date: Fri, 1 Aug 2025 20:27:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, aliceryhl@google.com,
        andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        ebiggers@google.com, ilpo.jarvinen@linux.intel.com,
        joel.granados@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
        len.brown@intel.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lossin@kernel.org, mingo@kernel.org,
        ojeda@kernel.org, robh@kernel.org, sfr@canb.auug.org.au,
        vanyang@smail.nju.edu.cn, viro@zeniv.linux.org.uk
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: Add initial support for
 Ntmer TW220
Message-ID: <t7fbgze3hnwbget5nkf3i2rd22pk5vufyimiiec5i7rblzb7x4@rtiuwnyfbmtb>
References: <de111b27-9126-4c03-a7bb-8cce9ea2780e@oss.qualcomm.com>
 <20250706034303.5404-1-mitltlatltl@gmail.com>
 <f2f0f25b-40b0-452c-ad9e-01b84b32e163@oss.qualcomm.com>
 <CAH2e8h6XWAz-pqmuvzK8JqOb=ggiDGb2U3TvAR2+43D_zdsZpQ@mail.gmail.com>
 <9efafa16-e6db-4227-9b47-5803f5933a7d@oss.qualcomm.com>
 <CAH2e8h5Eov+827X3W_EZSHRoaUHgP119fXJA+WEUdmdJ6f3gkg@mail.gmail.com>
 <0cf8f99c-a64b-43c4-a747-d5dd6fe28996@oss.qualcomm.com>
 <CAH2e8h6m6q+fq==cVGA-=iUJC7qxZvomhCqm904AtH9CceL6ow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2e8h6m6q+fq==cVGA-=iUJC7qxZvomhCqm904AtH9CceL6ow@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688cf912 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=wvPFv864gKbV9cFYEpcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: gkZxTHSbOIbin0H5NlmvNEwGPTbgRbDB
X-Proofpoint-GUID: gkZxTHSbOIbin0H5NlmvNEwGPTbgRbDB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzNiBTYWx0ZWRfX/CdKfX9gCXk+
 EdjgfdFYES85aX/mDV28AjAOxYueybFSDO1K1hZquSYSoDJkN1/r320dNJvK0gIw8Q+UKlUcUlS
 1sDK921UlhnRZtmSuLhnqXOsfPMswHPNyPBpxXquDJBZFZSkduPubrgA/KWXcg/9ByVDjlHSCli
 MO3/fzIQPr52Er+6+kupFHi9A4fkm3WYntF+yjGiybXeOaTdG9LMMvsh4wsfWuJxcVezLqGxNgA
 pxcFXZbnl82MaAEgzS4pA2JtBlJR6Ve680/QBM50Vuvhery5rTXFdbSZJ/ySykeDHZfTEnowFHI
 SApGP3LLn8SG4XzK/jG7rDGeRi1AMDKDinrpfQcCy7TTL8UhoWrduPzLPjlwlRCJq3zvlWTCsZm
 daQLjkx3bRzocmHB8J2a+d2300SJ2b8dr7srRlN5WDjQi+gnvMR0P27M2qqxCZHm2K5B4jIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010136

On Fri, Aug 01, 2025 at 10:27:33PM +0800, Pengyu Luo wrote:
> On Fri, Aug 1, 2025 at 8:29 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 7/31/25 5:05 AM, Pengyu Luo wrote:
> > > Linux:
> > >> ae94000 20050001 000001f3 0000000b dddd1011
> > >> ae94010 00009130 31211101 3e2e1e0e 00001900
> > >> ae94020 00000000 05190019 064c000c 065f0528
> > >> ae94030 00060000 00000000 00040000 14000000
> > >> ae94040 06100006 00003c2c 00001000 00000008
> > > Windows:
> > >> ae94000 20050001 000001f7 00000008 00001010
> > >> ae94010 00009130 31211101 3e2e1e0e 00001900
> > >> ae94020 00000000 05320032 064c000c 065f0551
> > >> ae94030 000c0000 00000000 00040000 14000000
> > >> ae94040 00100008 00013c2c 9bb9b000 00000004
> >
> > 0xae94008 differs, bits 0 and 1 say that the cmd mode engine
> > is busy doing something (did you set MIPI_DSI_MODE_VIDEO?)
> >
> 
> Yes. I can confirm MIPI_DSI_MODE_VIDEO is set.
> 
> Speaking of cmd mode, I still have no idea why DSI_CTRL_CMD_MODE_EN
> (BIT(2) of 0xae94004) is enabled on Windows.
> 
> > 0xae94024 says:
> > Linux:
> > ACTIVE_H_END=1305
> > ACTIVE_H_START=25
> > Windows:
> > ACTIVE_H_END=1330
> > ACTIVE_H_START=50
> >
> > 0xae9402c:
> > Linux:
> > VTOTAL=1631
> > HTOTAL=1320
> > Windows:
> > VTOTAL=1631
> > HTOTAL=1361
> >
> > 0xae94030:
> > Linux:
> > HS_END=6
> > Windows:
> > HS_END=12
> >
> 
> I believe we can ignore them now, I found the final dump and verified
> it’s correct. Previously, I mistakenly halved the porch timings:
> 
> Incorrect:
> .hsync_total = (1280 + (32 + 12 + 38) / 2) * 2.

If you halved the porches... Is this panel using a single DSI host or
two DSI hosts? In the latter case you need to assign parents for DSI
clocks (see how it's done on the sdm845-db845c)

> 
> Correct:
> .hsync_total = (1280 + 32 + 12 + 38) * 2.
> 
> Here is the final dump on Linux
> # ae94000 20050001 000001f3 0000000b dddd1010
> # ae94010 00009130 31211101 3e2e1e0e 00001900
> # ae94020 00000000 05320032 064c000c 065f0551
> # ae94030 000c0000 00000000 00040000 14000000
> # ae94040 06100006 00003c2c 00001000 00000008
> 
> > 0xae94040:
> > Linux:
> > RGB565 (16 bpp)
> > bits 25/26 are "set RGB888 for DSI1 stream"
> > Windows:
> > RGB888 (24 bpp)
> >
> > (suggesting your panel driver is wrong)
> >
> > 0xae94044:
> > you may want to move the
> >
> > /* Always insert DCS command */
> > data |= DSI_CMD_CFG1_INSERT_DCS_COMMAND;
> > dsi_write(msm_host, REG_DSI_CMD_CFG1, data);
> >
> > in dsi_host.c out of the if (!video), not sure if it's correct
> > but that's what Windows seems to be setting
> >
> > The other differences are due to the current DCS command(s) being
> > processed
> >
> 
> It seems a normal behavior for video mode, for sm8650 in video mode,
> I’ve also seen:
> 
> # ae94040 06100006 00003c2c 00001000 00000004
> 
> These two registers are REG_DSI_CMD_CFG{0,1}, video mode uses
> REG_DSI_VID_CFG{0,1} whose values seem consistent between Linux and
> Windows.
> 
> >
> > Hope this helps
> >
> 
> Thanks a lot for your detailed analysis!
> 
> Best wishes,
> Pengyu

-- 
With best wishes
Dmitry

