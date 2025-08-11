Return-Path: <linux-arm-msm+bounces-68313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC78B20587
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACB4418A2408
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BB7243954;
	Mon, 11 Aug 2025 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa1OArYr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC5423BCE3
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908423; cv=none; b=Mc7pzjyEfpU9c6CtZZSaorZ4jxRpvKIrDnzBKQv4uG+BGhFgrtrmrJtQLNrlR5tM3S5dxPwU8t+F8v49jXJ2z8TuYIxbEFHG6HMkma2xkyIOjiL7STzzroEndk2Zceue/OqmxIIf9G5+vVEAMi5yx/1H6SQN6cVeCYBKiJZJC58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908423; c=relaxed/simple;
	bh=n6bYWBbuvYgd7Of4AkNGNr2HVdrMAtKaVoR0TN1D2LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RlE0/AQxFIWRPHOdnQVkzPmY1Wu94WfluhJjbbHXv0dkw4TH5yxS35OsEtxE6oBZEKGYy+FeTTThfqKZSZAX5qcmTTEmA3nahiAIunl/QMmwL5AUR32b/5KsghlcCZLJehe8THOb12fz/1ylLBRzp5M6yQEIQQC/ypbt91xOWm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fa1OArYr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9Ge000605
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=fa1OArYrsMY1cNmv
	6U5JEBininEQETN0UrxidHl7XVnaDk1pndGlmoG23MCFUxED68xnDTNCSFHJIoSU
	ZIPwylxia739ZMNH8Q+CRQUzLNK+jVU9M9ux6Cvxy034AnLh7yPwJRzmMV4k+kT0
	1tqtXQl0X1XLW9KSZtgGRL0FmUFs9kNo2eMOVUzEzhQaVnNaOf+txkpqqpVJFLUE
	QDIsKSTgiY4a4JwpzbQisDLiDH3mLyYaeATtMFd8khcUsIKrsCZ42+Z6enisuDJY
	etaHEHFzHMotOcB+HuB7UIY0rf8xmx+IGGobpkQA5wxETZ5MyMyGRf08VgmHOPhk
	ZJXPMQ==
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxq6uypj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:41 +0000 (GMT)
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-e9052c3be40so633442276.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908421; x=1755513221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
        b=KwL1O34IFhIclieX06X708/sr9GMqiKY84kpg/qdfgvxQvfP+DHxJmthFo7+pyLc6d
         Cb5uB3Lp3fqeG1JGBdd4t8rQXxZJcQKW1fWWG+AeQviR1PzCDyfBkFkjaiKahTT9aNvl
         52sg6R/eBaG8XBsraOkZA/ejn30sfFCBQspZgqTKClvXKJb9C7IMUV7KEoVLttjLcFTy
         u1tLBq60D1XUtnB7spznh7w815NMI0QDJUaUZ3MvHitg/kIg7SDeFLy5wtHQ6irXJmjj
         Q57mwtHR7ZXn1kmIRwsO/qOjljvf1t86YE0YvFWbRH1Ehjtq+LvQTUNSFEs+TToamZXS
         k/jA==
X-Forwarded-Encrypted: i=1; AJvYcCUxZP2+zBlZFGiq0MuORUIs138FLOA0/jYU1hy0tNs749vDa160Bev7zgCERSuwZGu+7AvbvCpLCe457ko7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0s87wOjF3y05VhMt9Vg7OzT1lEcYWDLgVZKm6ycaEzSxPpnwt
	cIyu6NsUds7FzXXtzVfcJBydPaYQovZUkm/hFJE9WJtDSJRhrbpdfVDicV4tLwL157Uo6V9DjDJ
	BoQp9SovRMtXKdqd/zj10zhRYl8t4giHGRFR5G8dlAXGLhFi1vCSjD5MG8DcjbUGj2YSY
X-Gm-Gg: ASbGncsi1Az16lUz5DwAx5oC3s2OGbFr1L3rxnxuafmjJKbQxm36kTmV59oAV2SS0bv
	6WjPnRMNj7r5YC2NQJVTy951Yu5nxEn8B4sB/+9Me3hY/RL9Ulnku5eiviSSK8EGuf7GjC3Jjhe
	q1BsGmeFM81Ltx0Ij+RbyEASZqEKJKqR6aLRZU87srPYvKuxPvVfyM/Po1cAVFB/y0PSIFg0+7k
	8NqZfMfq3gcYLr/MxqGO/ggfEc7Jn9E8P7DT3im981oUB8JQb8Fi1k56pTbxy0fYfPldEx0hUOj
	UZOmbrmqktT68l2155v6OFqkxGSYKq+0fZO5bVaeyAzzPHFYlPIFE7qMRNUgOBpCzw2/31rvOGH
	uE8RBvmXPrpz+/vwLow==
X-Received: by 2002:a05:6902:1105:b0:e90:569e:8a1d with SMTP id 3f1490d57ef6-e905c530befmr4533771276.0.1754908420437;
        Mon, 11 Aug 2025 03:33:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEntP1C0STH3bZ4zJOHqYgn5Z4wBvYvhRLLkeSBhIq4vihJkw/i+kzn7lwfCsqCq1ZHC74r2w==
X-Received: by 2002:a05:6902:1105:b0:e90:569e:8a1d with SMTP id 3f1490d57ef6-e905c530befmr4533757276.0.1754908419897;
        Mon, 11 Aug 2025 03:33:39 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:33:39 -0700 (PDT)
Message-ID: <238a18e4-43b2-438d-9ca4-886806b77002@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/msm/hdmi_phy_8998: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyOCBTYWx0ZWRfX7WqXvFJirFHr
 lh0EiftHA5DSXeLHzcA4jiMu/unrLNcmWEeRZ+AFwW56QROw1ht3MDV/RiyRA4yIrpq2r0In+td
 Z9nvEg52XOXSOmVfXb2jNA6BfQSfWA62ttlbLvHn2X2KVVh/r7j0qbChCxtxm3SY/MPA4TJ4Sjj
 gHRa/v8LepdQsYORnmcsICoR++7mOsJDSW/rjKPm1lgFUI+/JR9iH9T5eZNpgJ/b2zhDfFoxack
 EGaFz9zySN/btSIFezYlcBqMj7VXPLI0x0ZA0HAOzA+r5fuMtstuBvzleOVw/ssp8xbXWsKU3ji
 zo/cZOnk9DwfUAR/LEKLfqTGAuDZT4rTMUPm8p34ACu0sWj274XUY5XdydBHfTSM0PeVLd7A7c8
 t2foWYUm
X-Authority-Analysis: v=2.4 cv=QYhmvtbv c=1 sm=1 tr=0 ts=6899c705 cx=c_pps
 a=peiObFy/9J5zY6vzkL/ViA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=uSskPZdq7w8du69dlLff:22
X-Proofpoint-GUID: n-kbzz0wzo4q2NsF5JKJr3eSgK9X1uvS
X-Proofpoint-ORIG-GUID: n-kbzz0wzo4q2NsF5JKJr3eSgK9X1uvS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090028

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

