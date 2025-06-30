Return-Path: <linux-arm-msm+bounces-63053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEDBAED9E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 12:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 172BB1683BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 10:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE89248F5E;
	Mon, 30 Jun 2025 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBMmDasa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A202459C8
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 10:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279647; cv=none; b=VIAWrLm5rHBJQgkX5axqycfCUT8zJhluLuPeEc5bdjcijwqsysspKHeMT7lzNraitV4uFfWrpWVQWrvntAOxDRfLIugQ2IT01VuScUYBptCyhPbZUlprTymT1cZG1yj5ID0QANqUQhvvCmCQwyWTsJijBLUdZe8NRCcJuLSHRq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279647; c=relaxed/simple;
	bh=Glo95zkh8gVXfGqCSTJqjOM6U/pI6krDNu4cyFf0dT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XviBQZ8Y9KhKePpZujtKeg782X8oHuPLBOfBH2us+oV4g6IGeuV1RGtRNBAn2sO0Ol5vfH6i+nYaw7cp9d19P+7RvJulxBGZPj7spu8Svu5MUEl7twEdSC5mY5da4nCKKXuv7fSAQzS/uLOKrOntPAz4whJ+bg+cobpo50l6fsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBMmDasa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DABa023251
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 10:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/DSsMm2kVm97th9bVbLAFQC3F5AhKTQNEcJC1748oA=; b=BBMmDasa3kkvlduS
	e7tyBDj6a271BzJUI+pMBE2cH3olV3LZbKolDv2l17VWcRmzXTgvxrW+g81jE7x5
	rTiVnRCzQFLYN3hY6stwMh2dzbdjvXzu5Rr4XFrIUPh4DaxQtvpwnCGL7DayGvHa
	nC2ZlU6yE2u6XyxFxvWEtEUE6FjVEQDGaCOQaLorxT556tahwkfdsJqVSP6QKOCT
	hHUflSnBkAnRukLnnABsMSxTyLsLB0O6nRQp+zWU/fOoFSTWHtEmAmstLudl+r+u
	hba8y1lvE56l3Hbf7xLXdQ1pc+EJKCm3T3wDmShPGNKI0utPop46kSfNYmgedKZx
	Bv0gEA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kpq28fc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 10:34:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d41d65f21eso12995685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 03:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751279644; x=1751884444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/DSsMm2kVm97th9bVbLAFQC3F5AhKTQNEcJC1748oA=;
        b=lVt+TCWdsyF7xmwYPd7hj+DrT2EibZNq9ADVY93ZljfAC08KMMgbyar4zpwHf4fu0Y
         N4tUlnXnAN7Avaq6ZscgC9u4DKH+HS7jLAMQfkubq0ax+o3eylw2YDTDTXl7wPP4rZHD
         O5OqYD95+jQ0AkXXbpS+B7QagNfWUYPQCjR2afKp3fk1urLZAYX0SfdIXqzlVe0ZcPD+
         Z8Rqgc1POTWGzkONqYT3GYGGc9CmCyejWdyOvrdB4xYlBY6YOP1N5axhJfsNExHJdJWy
         DXpiI8WAKVvOXJmyTE29sAJbkrGF1gba4MAji05QW8Ql9P2gljiW+yQgE/8/ENeaTTUH
         0tcA==
X-Forwarded-Encrypted: i=1; AJvYcCWS93Hs00IFgBHY2xnCziGQBdXjBu1mKHc+j1gTWBD8CjvTQwMNNuUNo/+ve2qR+Yd01xkd0JweuDen3m8A@vger.kernel.org
X-Gm-Message-State: AOJu0YxBwW7zjZR2vUOb2c8QDvczmgiwEJtm1Ccq8qCtucKz0CaDk913
	3Npne1mh1YfcR1Dhi4sRKiPD+HFEj7L/LqAjWgW0WLX8ARZtsmF3Uzrj3UFA8C49US2R+o+dAzw
	ruioeS5MeEEtl6kd683hrCynhB3EcFUu7Aa274lebR0ZPWaKdRyEn89xxpUO9JLCrMvzZ
X-Gm-Gg: ASbGncuniwGQXhiEd3rDmKMg8ImWIdYzxaSkdIalWy/s7aYdfD9RccaKIX9djNycWFv
	2yugTotvsW2Kxs1oqAb3VvB3fGWd4gbBbnfWhdt0J9tlzPBVGVf1986zvDM3X0T7yK8mCeT1Szu
	6I0cF5GUaoRfPqGEbHtrUfm4biLXWkUCZwsHxgJB0nG0XIk6Z5RikyoA1WqZExRr4G0SeWSvFzQ
	V0ZPSJj5jclGvSTKyNQecxLSD1P4VPzW5s5LzUKkQuwF6v04mbpAeKHSSmtZ+D4XD/+AqlHNhGi
	FNrrTfkDJUNrKMgvkyZSV22Tzwp6WY7ii9oadYDqmcHd5ckDN8E4feA3BNlaRRAOIMu9oZDcWUg
	OXAhKlKAx
X-Received: by 2002:a05:620a:a218:b0:7d4:60e5:24f3 with SMTP id af79cd13be357-7d460e530abmr63822785a.6.1751279643641;
        Mon, 30 Jun 2025 03:34:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF14u67wYVOXU0dwFwQQCwd2FEAqwgbTauB1E2BpJpoGlhPPQaUrdj7uROZsLTFGEwJNwiJMA==
X-Received: by 2002:a05:620a:a218:b0:7d4:60e5:24f3 with SMTP id af79cd13be357-7d460e530abmr63820885a.6.1751279643192;
        Mon, 30 Jun 2025 03:34:03 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb7b9sm5684192a12.15.2025.06.30.03.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 03:34:02 -0700 (PDT)
Message-ID: <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 12:33:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G4scE8k5 c=1 sm=1 tr=0 ts=6862681d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_tQuiCBsMoVRMLc1B3gA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 91KHtgNd2nn-7C2Q1zuI77zHV0P9oYOF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4NyBTYWx0ZWRfXwkEIrKftQwFE
 ln3JN4IusvbkgheiUHSrJQMm8r53SR3Bne0Ac2excvYYLVuuzA9aBDsMQlutqCpq6vFluy41imA
 VDOzAJM+YqdX60JqUixhWVDrQryI6dnl/YOmsXPsad55Cvbe3Ssim3Vf6AmyG4bmgTJYn2yFL57
 fk6gyWYHPxE9JBRXUxLREuRvA0xO+EDNvNMxusmBKZgitGZV4p8Z8Ly1LrwN4dByOfGBAkbvzU/
 mZUpl2ECil/0k+IYGhu3LZiI9GODpAH8lxOxg7hTSiqB22rZyVh18sOQIO+3ZlkUkijw//gVw/a
 5gQObwMff3anM7sBfPeVXwaSc1w3+cx5GSZuGsK1kGedsuWpBbjNHx780350CzWCi0fvc0SvxCZ
 sKG0H6ag6rLSilDuGm3/6LPAP+PfLKafQZ3hCm6G+bmOA6kCoHZFGoY6EwvTu0WXcVf7CTgC
X-Proofpoint-ORIG-GUID: 91KHtgNd2nn-7C2Q1zuI77zHV0P9oYOF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0
 mlxlogscore=753 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300087



On 29-Jun-25 15:58, Rob Clark wrote:
> These runners are no more.  So remove the jobs.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Do we have anyone using cheza at all anymore then?

Konrad

