Return-Path: <linux-arm-msm+bounces-63074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B1EAEDF7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 15:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F9381894EA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 13:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A75818CC1D;
	Mon, 30 Jun 2025 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/x7GnYP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEC62BB04
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 13:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291182; cv=none; b=LGjIQP55eJMZ1upsZZ4DJQA5cOEusWnf7uB5UHWbmk1poRY8AkTTvnA8/CwXad10UJa32ODKPLqIipsaRfDvQeBM7ZQCK/M12dIsW0U3z0bwDB3LBYCn06+bRKH3UEr3uVCA2LYYlXmib7QUCg+L3R4CJ117nWuwk47v1AnJQ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291182; c=relaxed/simple;
	bh=kFNJt0XYPtU4pD5AfSIvYtEE9BPgTXWPKB+BM9PyUcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hobFWgsm6o4KzGaYuXv2T357ZvwNQiAH3pi3WImrG63afP25oUkkHfi4Nzgaxs06+x742byyIJ4+PqkgfdjRxkaY73+SjD9PWiJA1dkC7TFFDPY8TePL6muLMOwrDl69FLjCgs7PGEZqjnpb+iIsVNZFTyGJcA779gcfUKZ8/lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/x7GnYP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DB0Z028446
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 13:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=+sYnLgd8EuSPJsu+25KS1pMeFZ2cMLM0v+K0r09oi+A=; b=d/
	x7GnYPjDfc5+P3s5A4GfdW6ZT7EzDKVz4SYgw21z9BPf71LWmPsRJC1BX1vXebAH
	7fJoLOs2hTPImwXK8p0PwzUvPShJTt6yDQasSoTPdNJeMfdk7o+xhsC5uMwcs4mz
	wUhSYYcWfDXf5QN3iN7OwyvkrIvdEV4AmJsQpjdZ79pCqCJNMOqfixPZ4pybcn0k
	JFkpUWjZm4L6AcNOaMmmjPVsMvzYMgMwelxCKqSOGCDghqNDkQS+dw+LAy46u1lX
	PhWqFei0v7GigR4J5/9BWhXi1lfQGAmyQ5gIb9a+5TP2DwD+60bhavkmiS9GAXt3
	HgYSX25pl1EHBQsQbGUQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvmyut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 13:46:20 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-40b6a97ccb9so562974b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 06:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291179; x=1751895979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+sYnLgd8EuSPJsu+25KS1pMeFZ2cMLM0v+K0r09oi+A=;
        b=JzhTpXh9MEfBVkPKa9m6WiO1PHmrZVLbgLr+IRzRQ6lKCV6haM28b3IMzWX8HgSHa5
         D99ieGHplu1az5WqDKrlKDOUkyJ6y8A8hRAa46MXBo/Bd/BnQUGhfrIHit2JpuKRnV3P
         p+ABnMLibKnFQ6wjwhNOQpT8Y403LLrfhxEd80JquqQlcA44SUZScAu96rO62qyMtoAt
         mILysZA/pKbLBTlUSwgBclKXtX+2jY9b9vzufvLaOs4CvpN4OT2mfEab4n22JLgdlxIw
         6ci1jllYn5awAodVJi5+4Ww6WfOxHBd+ihqmZdfMypSjY5EwMb+ldn66ICGuy17jrokY
         Ip/g==
X-Forwarded-Encrypted: i=1; AJvYcCVB4wFpeYwcRjgcJo4xDOqo83aCsYeGOYs2cYeVBOgjChXGxe9OZ0s/Dgcss+k1PgAMwSRNJhZcWvnLd+ii@vger.kernel.org
X-Gm-Message-State: AOJu0YxT0oEOYwdnURu+/2z7+7Fg5WBemF6Ti+XbefT2O7P3X5Eviqvl
	Le4Iohkfde9hxcm6lQjYkcmhhz57+1588jwOZ9blzEVKD/Vfz3MWL/Rfe30k53Ce6SZw8WEasTW
	cpX7HJ3/BwHG7JHYgNLHT86FujB1bVsPglGvovfABlN6VbDYIsPJZMEC7Nj8/2pRp2sxljVQqcF
	5xLLqUmkDejIUPHJt1NA1L5dd12jn8VoX9QZacgd7w5oo=
X-Gm-Gg: ASbGncvUgSZTrEwYA/4nHLCAsF1X56bdJLn0PHrvkgCX090psBTgUywzIZqRB5jRzMa
	oL9bGY1D96qaDIHNL4mVk84khCakjt1G7H2QuvGQdBpPzyU0IYWb2EdRkAVKXBQBFH4GC9YKMBw
	DsayCY5EWxhD4BRlrpy0JAYe3szQSfpZ3hBgQ=
X-Received: by 2002:a05:6808:1887:b0:404:e0b3:12f with SMTP id 5614622812f47-40b33d8ff56mr10677507b6e.11.1751291179443;
        Mon, 30 Jun 2025 06:46:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC/ZONBovjaxT4as2yCPYzH6bLcayS9bEQ9eiCn71Z5acFjEn88qadQUxBV/FIurbHxcQ5liO5UIZuHKwhFlA=
X-Received: by 2002:a05:6808:1887:b0:404:e0b3:12f with SMTP id
 5614622812f47-40b33d8ff56mr10677478b6e.11.1751291179085; Mon, 30 Jun 2025
 06:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com> <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
In-Reply-To: <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 06:46:08 -0700
X-Gm-Features: Ac12FXz1ANfzhNdQG9PbXKs-9CTqnjt4T4STXGnoeX_oH1xYF5iTCEgVXLupVM0
Message-ID: <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: rCqN4YEhX_gw_uXgHFbkuW7AiGMP9hnO
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6862952c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=0RMLDebWjREeJsuOEsEA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: rCqN4YEhX_gw_uXgHFbkuW7AiGMP9hnO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDExMyBTYWx0ZWRfX9XRASo96BmM/
 t1K3LFWnAv3xH5ys0pz66D7yqgZ/i6u6lhEqi151qhpcXDZn8TvvqVKGq9Y5Y0gFiMQfN+B85CL
 oZwiPkQ2NOxOzv9ZLONI92F6Htg9V5s9ShnozKYcYPUnUmt2IEzbsjEr/ecs6O2WnGQh3fW0diC
 k1NlwQUq8u8jqqP++0MPePqQrwgRR9M+5K3s7yNHAjaJ+/2Q8nz7DoSP6QL/YgU9leoErHFa+Bt
 m/IwMngqe00M5yywtrS45shXUVdDDpRg1CboKt+SJtBAs2O6grDB1EcHDXeeSreseYMhFwuzNph
 YZO7jBFqpkhKCxt807MCTT2T7HSMQOnI/8B9uOSVkGabSYFOsuNBZ9UtOzSAegdtwepZhDKu7rW
 Z6PaI3BHP4elCi7gTC7RHcAqwuFENqVwTAJSClijxI1VdNadhmnYM/h7f0nm2XlD2lxwGoA1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=724 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300113

On Mon, Jun 30, 2025 at 3:34=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
>
>
> On 29-Jun-25 15:58, Rob Clark wrote:
> > These runners are no more.  So remove the jobs.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> Do we have anyone using cheza at all anymore then?

Probably not

BR,
-R

