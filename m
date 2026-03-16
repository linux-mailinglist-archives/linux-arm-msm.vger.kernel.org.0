Return-Path: <linux-arm-msm+bounces-97992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOHfLXs7uGmpagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:18:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7AD29E002
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2AE33120FEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 17:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9EF3BA253;
	Mon, 16 Mar 2026 17:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/cKhH7r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KiK3fJDl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BCF3D0901
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681207; cv=none; b=IRaPXPfuwDaqLXCDwJx0ZKRZbRTVectEI53M1XrGfZpUJrrB/qG5yKJ/Pn0oUDBlRe4qBXqxZV+hXA5AP/wvLNFP0cEk8E5PecSTNKVNMAyZDxPeYBWAenjzbQkL8GZi5dlDY08weuvB9Y8G8Eh4K+Q4Gh2nggWbxhkmo6rTfZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681207; c=relaxed/simple;
	bh=8HbCc7c0C5DysXCtId7sfS7vRYa5G6xxujIpvExCz4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTTXZh0q230ORrL5J02JOGzUj4ynmeZoZ5IgNf8deTd6lcwDSNAAPbobLYXIv8jz81+RSYsSPITIruPvcyre2EQYAUPah0xm5b3BcQYhVkwTxKeyp0FlNDFUxcKTgmCySXfozmInFXQOBSuRhmJxykzogXxz58BtdAP99rMx960=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/cKhH7r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KiK3fJDl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GG6dN84022427
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oN5ilBs54NMY7s7tXbD+WAaAkVxOjXggBdGOFWu0Q+I=; b=W/cKhH7rnwikR4GV
	IWIJF6BrIYRQ66UxaWJFzHxCpC1QmNg2fiUMPpHPwa7hQBEl6+DBpz08qoif+ayl
	G8N2u3yftkvb367mYu3tMHliCr8sukkphyeGKsTG8FRxUEdVmSu8jXqXvTamZSr2
	ipAOci3VLCqYv9gl3ICTwB+Cf7DEA1VvvDZRA+dcu5ZP8hhCf85Xn1a5fg4HFvh7
	FpUXCSMZMfw+UyaIET9tWyxGwE/X1yeyKuVbHsEapfWehEMT958hcxpMwhJUMGlM
	XmLQXVNZG+iksENobEijIA6du8gr0uo7ZRxZ2+sBwge150xjHInCQPJLwPD94yiU
	ymT5Jw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fg8kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:13:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c3d3f5799so219323036d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681204; x=1774286004; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oN5ilBs54NMY7s7tXbD+WAaAkVxOjXggBdGOFWu0Q+I=;
        b=KiK3fJDlQChKDACYAVOiDFIvtLmuFnExlZqpYvOGxYyBqQ4vvpHixIXwgHB9ntsaOR
         P2JzK6foPriPBU90BGVXiDjJ6/PAaUTZvOndOWqk7sPWg2t+8Z+gnfsZFBYbFFi3MSt5
         mcfY/zyBHMJe2x2sV5Zvyb7Lj2whl5AxfFO/fii8t1oEpFyecPjql8gacXndA1bUNgax
         xoZy1dla3MBbDkcFw1LeEgHZtQYDZ/sV7aGTzE3MwnDUX43fXfYrj2yNjuVzG5IW795u
         ao2S1GUtf25/hL8C2rNXtklUE8SemtnKEVff5HLmoXR01f83sG4O/21uCAvq5kWzYUmq
         w0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681204; x=1774286004;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oN5ilBs54NMY7s7tXbD+WAaAkVxOjXggBdGOFWu0Q+I=;
        b=TXiPjBvJ6fGEQJQ2NV4QqYoegKQFkC7f5UNjG3Dr4hpuqaPe+iIjDYDgfAXM75E8Z9
         2iDvOvPZHciZTLHBAp6BpS497J5AcIBcjUu0MzgGLQ2qfxzNQuXWpF5VUA026DP2o2rD
         EB8fk4HL4RckLaVqwk2XEV4G8IkJ6Yd923iDscnimvvOIbmfa8Qh+Q5dPh9zC3zaFd+O
         RsDR6tXOLDwjxn0e9Hc+X9XW+cdWSLkd6d2byXGyZuLDxgEgu5xt2HCwlYBT9rsahz/h
         HCuRo1u5NhsQvLR4a0misng1HNFwUYO9g2isrimyukp8+UzYCDkDrAguKgV2rN6RH9Vd
         SV1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXK6EkEq0xIeWho39BBaQUK76aYy7AWRda/+gE/AWsifi2dtbIl6qgltR6J9pcJ0TUaHNzm+bUI/ZcXVkK3@vger.kernel.org
X-Gm-Message-State: AOJu0YwXV9faSUJ6o5lONl/yMNUf6+RFrZ5+j1ClMCOb0Tecm6tOanvt
	LyoIFWPnMxTNEeRj2YVQ+CeBSSFsumA9btGenT/PN+dlTy1tgp+IttbpkmR11DmiPWdctP+9RS3
	VxwmzQH0v713Zo/5bCCtIIMkTa6GhzErI3pG5L7MqdxlA1rU1xBppCUA8TtJyVzXidv24
X-Gm-Gg: ATEYQzzIG+NlbZBiXcQ3b0lPQEr+gQODHfR1c7uL2vE9Tkqanj39TN5ufzK3sbGayO5
	acmqq7XuOFT8g2c3Nt2hx6b6RuS79maQ/64mafGGvecUOLJ0qkRoolNIcJ21OpMvHCLCZWZD4VZ
	YlmX2IJeA72/+6UxpAJg0ounm4JpfZ5mUsC2blE/jqItDuDxIg3d6TBhOMji938GFjG+8wDfRuw
	TaT1t0vxDzpcwxdbs/g7xjV76/4hj+bHKEnrdvBdggCgNU8acSPBOTPELsZbUrb3R/f15VL9OzD
	isnmhFuq0tkTZ0ToKX84Q7xY13F5plJoNOEJhH7tV5EdMop+0HkRMPJI83gbOZz33sPmJsxkVzT
	3KJQXKznFCWC2qlXcx8Cr750uvGHtkrkB1pz9h6CAhqJoBItpUuyipvrm8TSG5hzvrB8CvKZYbE
	E0/7AiLEtogi9708MkVoyNF/S4r20rYmWwYrk=
X-Received: by 2002:a05:620a:4506:b0:8ca:41af:32d6 with SMTP id af79cd13be357-8cdb5b7cc90mr1834013585a.70.1773681204103;
        Mon, 16 Mar 2026 10:13:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4506:b0:8ca:41af:32d6 with SMTP id af79cd13be357-8cdb5b7cc90mr1834007685a.70.1773681203525;
        Mon, 16 Mar 2026 10:13:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15603407csm3596564e87.38.2026.03.16.10.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:13:22 -0700 (PDT)
Date: Mon, 16 Mar 2026 19:13:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexander Koskovich <akoskovich@pm.me>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Fix GMEM_BASE for A650
Message-ID: <f7k5azkvsxom4gspszulgmp2qpldrvzko3bfcxo3h6bzqwzkw4@iakx7hqqahio>
References: <20260314-fix-gmem-base-a650-v1-1-3308f60cf74c@pm.me>
 <2938aa01-cc1b-4dd8-a4af-45ff8354a061@oss.qualcomm.com>
 <6gxzcgwzvqoaqgynwnturjybanjrk2jmmsa3qh3r7vafyyzj44@dfzkd3vigluu>
 <CACSVV03tAeLuwuHRqnaSkSgtGj=nJ5Gt3bzLJZT9SXXRY7jvfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV03tAeLuwuHRqnaSkSgtGj=nJ5Gt3bzLJZT9SXXRY7jvfw@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b83a34 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=jTlme-6co1faQppK_noA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: XvDcDP4RwRuu9Pok1mvvJ6RgKo04Rvt3
X-Proofpoint-ORIG-GUID: XvDcDP4RwRuu9Pok1mvvJ6RgKo04Rvt3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX2PDuchmfijZz
 l1agG3yuWnjN8/KC5GBUUSUj8bscIjBVMMLM5ZJMF4+DafZx6hC8bPMDKVF15Xq6QrXR/w+1lzV
 AfszSr4owVzzU+3CLJSQa4+8MyeenyhefC3tqPTTE8VufjrwLFDel1NyAv2Hi1yrF48mApd2jgY
 PFPHvFR0ZwxtEkzkH8s8lOjdcArFuNjmD4teBG4QS99+Uy36rz3yYfmnJqIO5LGJV2188qxIAip
 baMLPszs0DnrieOTsHtTKkLvcKpSElZWNQ/KcRrJW6ihougu4ZNFQ8d7zUAcQmP+3xcZQ0PnMjH
 5RwudIXUJatRpBItYBnue6xHA+J57rs51B7z3ZzqwcnnV+OLlsG8ubVybItKQU1M+pCoMmoDKj2
 JAwlmuM+9nxIXcIVOPlaDOh5SkA2QoCn/INahATQuiatcS7R5YTpqdhnVlPxs8F6MjiPhs0gDA/
 tpJb0rmpotCdoPo51wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160133
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97992-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,pm.me,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C7AD29E002
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 07:34:42AM -0700, Rob Clark wrote:
> On Mon, Mar 16, 2026 at 7:28 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Mar 16, 2026 at 10:22:44AM +0100, Konrad Dybcio wrote:
> > > On 3/14/26 5:14 AM, Alexander Koskovich wrote:
> > > > Commit dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8") changed the
> > > > GMEM_BASE check from adreno_is_a650_family() & adreno_is_a740_family()
> > > > to family >= ADRENO_6XX_GEN4.
> > > >
> > > > This inadvertently excluded A650 (ADRENO_6XX_GEN3), causing it to report
> > > > an incorrect GMEM_BASE which results in severe rendering corruption.
> > > >
> > > > Update check to also include ADRENO_6XX_GEN3 to fix A650.
> > > >
> > > > Fixes: dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8")
> > >
> > > Hm, that commit also changed the value for A730 - Akhil/Rob, should
> > > that be changed back?
> >
> > I'd say, I'm also surprised about something being broken for A650. Which
> > path / stack uses this value?
> 
> Anything that samples from GMEM (gl or vk).. which could include
> blend_equation_advanced, custom resolve, etc.
> 
> It's maybe not common enough to immediately notice something wrong, it
> depends on your DE.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

