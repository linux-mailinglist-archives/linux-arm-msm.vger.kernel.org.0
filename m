Return-Path: <linux-arm-msm+bounces-89277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D64D28A0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 22:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AB2D302FBF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CE4327210;
	Thu, 15 Jan 2026 21:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l13oVhuM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HoDrXGR2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301DB326D75
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511158; cv=none; b=aGlRCu3IlompYk7YRg9dc/akZUgR7FvBYsfa9qErDzTH4wptwqQEYGOT9n2jQKGrA8XPpMIsZ/jWlm80HymJ6QYxKRv+DpKET7ox2nohuHsGrPJLl2pQ2WPF+Tnr0xXLG/NaSOeEXvnrWDGVmopFlNKEIYoRNr/oubeo7Zwmv0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511158; c=relaxed/simple;
	bh=5RKXFxtT/VqfxeXZRvOKOi5lh5LAaosbKx9LcDIwqZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oBQTivHiQW/iskiNFwrh3hAF/Yzh9VPwofCpu5EJ5gyi+csUvLACThIb/i43wGlclS97deR3MusMTw1IKFX4kv9tIiHodhy+mxk/mpo120uWLoqxE9/N7E10qNCmUZwJurLycIj+QNkTzZ/l+0Tpjiyw7qifsz7XfVdEeVqQHzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l13oVhuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HoDrXGR2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYAcd1722628
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jC8lA6B0ipWoMHR75M2AQCJx5qPi+JNV6zZXo9VKefg=; b=l13oVhuMfVG9bJJC
	o3w4j4Dcm0fBhXvn/AW1LW9YGKandwyzAVGNoUQ+UDhD4dmAjY+hp07mdC9S1fCk
	tAWdHZRNFtvV8YjYzEPhMhZ2EvOLvKTWgNW7wu/Vj3ofVOrkNnfDrFOo3w6VocS4
	gBQGUxTl4kw1R3etUcDHof9VLHHrRAYtAu9MC0dopweshkNjAeEBUHBBltr4uF8V
	qxVH/iUYv4FDWbYFYtAFXAoW8IgNeVAt6X4YL10bDJjGojxo+i99xmiCeTMn4B0P
	cfur3HRG5GThOS/DIrNEjrXPGtwUx9kpy3RVld6F8THH9cLvG/8H7J42G9pSPFXL
	YkShlQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna2fm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bc4493d315so385545585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 13:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511153; x=1769115953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC8lA6B0ipWoMHR75M2AQCJx5qPi+JNV6zZXo9VKefg=;
        b=HoDrXGR2Fkk9p7NiteHvyWIaA33okKxrZPjpfLL6BXjAPAQA2u/eTMzguYRBF97xIv
         Iuu3ItjqGXMysqTIAKjY2Ny5Cw8xQztwjugCuGh6SuYa3GhYKZp0xRLGzNRaRgLagcQV
         1YI20pwxMlBw0spW0kmAyYrpz/nYPgfHcjaQqszJwdPj9umq+id3C0pS4Sbu5s67ZuTW
         W+F2sUuI/VXc1tydupI8bqaroKIqXFCo2qKFwau16XGXAzO27bEpLHauaYOgqZ+Y3HBs
         Ei1ASA/XFr2JWZ9QZsnBCaUejUCulcI2i4PDuinK8RZqQhD1WyajDmQn9mY0LW8nkZd7
         XVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511153; x=1769115953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jC8lA6B0ipWoMHR75M2AQCJx5qPi+JNV6zZXo9VKefg=;
        b=G5YbsV9+hHcZt5RyNAxBu4mF4BOXwH95LBYCQvGyXKYPiaflGjyMqmgZpKzgYHaHDF
         fCMRm7H43YTWiB0O0etKftyWH5gn+oJiR5TNPmzIHqKVwFT8HV7R8fK+mJ9SgqR8IPQv
         3tkhyzH4h0rSDccfwg/z6DxAlhV1gzXElhyG2DvaR3RTl0NU3txDRL82OJz7OX+uPbIl
         UPN6Y5vFtK2yCoh5wyIO3gAXrCqJfgB4KeB8Vuov5W05MGTkTKqGDXaXbHHYRBVY+iTP
         WqG2nVqn8JtlTipcZUoH9HbDvm3PsZAB2UtGHSjyu4Tuh3VFZRM+axEG72vfDUBLZemD
         yBfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQs3ubOV3pWwuCEiY8EUFAzY3IGG/wp6Um2atN+aIJhQMlo+S7cMfYbDZFjOM5piTAV6u6S+Qu8cfFLGXB@vger.kernel.org
X-Gm-Message-State: AOJu0YxexG1D5BdUYvMr3gz20Qty6bOZfITIGrK7yyCJc7CEmlgnJR0A
	0uKtipCu0zPlFd2c2iqdVpwtu4bMdHFoV14v7jYcszLAlCyjYFIHEVQg2uDHgZFNV0QlIgZ4jkk
	4ull3I3qDgzirqg3+7NN+APlzmRWdzj50Rj7IXoBXHH0zfKgUhiglV1Y0SfO/0BGj3Hjh
X-Gm-Gg: AY/fxX5cAd8EqA0z30I9wFZsy3EXeJd0bR9JFaykDnc1OtxFEe+8TceFXVhkezolv6s
	25uXYEaSGai1AC4ffMUNpg2GGaDhS9m+i6dMMcd7LvAZiJ+Fqeo2DoVm2fxweTQKx3/27ywKB/X
	PS/Mw2QHvQnrhWa3P4tmLZKaX3f4nyZOt9RAmy9OmjgN9J7a+7OtzUlsTbQ0tcNgEoXQ/aImwFt
	ONmKvmLFnq6N9g0xfQmqeoykJCnoLwMBSWvlhVTc4ykvtsCOPoJcjmJyncpW4hSznJcvEKMqj6r
	oyrlEa+PSimU+36lciBxOgZ/pMwKldNuwcpTNIC5ROu7baSpvJdJYEH59/WFbe32qR3HmAwF+Ab
	fdEbX37Mrazv/0Q59nqNbg4oTiwqBdR+5hbvF8xj0nVz38yZOQGXhoDiKjyL1FZ//0JVpFmQusE
	Sje8/dzTQgO1RZerZjoqmj9DA=
X-Received: by 2002:a05:620a:4610:b0:8b2:ed29:f15f with SMTP id af79cd13be357-8c6a68d9299mr104180885a.21.1768511153491;
        Thu, 15 Jan 2026 13:05:53 -0800 (PST)
X-Received: by 2002:a05:620a:4610:b0:8b2:ed29:f15f with SMTP id af79cd13be357-8c6a68d9299mr104176285a.21.1768511153011;
        Thu, 15 Jan 2026 13:05:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:05:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm: remove some dead code
Date: Thu, 15 Jan 2026 23:05:50 +0200
Message-ID: <176851027323.3933285.5242543959069807337.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aWAMIhZLxUcecbLd@stanley.mountain>
References: <aWAMIhZLxUcecbLd@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: P6MNw6TiuepdbiNpy7g3T-Gmu550zeIl
X-Proofpoint-ORIG-GUID: P6MNw6TiuepdbiNpy7g3T-Gmu550zeIl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX/YvoebozsCzY
 4buHnLNjqw54Ejq8XXcHbhqPSuiE9X7Ee01A1BPck+kQEQaZuH/hpmW4lhj1ML1g4rSJ2uDV4H2
 uRzKP5shjdUkis8UjHbZrNWRmNqKUAlx2/snizvzPdEZNHPHQBt9TmEf8rkP8uOXKQibCKEGqOn
 NPsDeGkd6SVC+aUBtZPuddAVBMw89RDiPt0wBxC4PwAm5YHSRnYyZ4DObyVBrucZ4JbeLX7C7DK
 OvLtewVeuRDUBRpWe7iN4sAgvC1y/MWm68V/3H4RqEWwQS1oGP+LdynCvHx1W4uEVOjxLOy0Czh
 w0lj1y4fKNFOh4a7vEX/mB0Cqx08g/aImcIxBMGUbl7NFD9SRrnBNapenkdnPFOQJhW7jVrmMAO
 SkJ14YZvjMCqLvlODlQ4LOWQgT3wDg09I21MysKi0PIZ4x3bkpgvaXp9y2Tz3wkG90S2s0DUoNG
 nAJ8U9w6xELynLni4hw==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=696956b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=vfcw8cltYcJMyB0lYhkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165

On Thu, 08 Jan 2026 22:57:22 +0300, Dan Carpenter wrote:
> This is supposed to test for integer overflow but it is wrong and
> unnecessary.  The size_add()/mul() macros return SIZE_MAX when there is
> an integer overflow.  This code saves the SIZE_MAX to a u64 and then
> tests if the result is greater than SIZE_MAX which it never will be.
> Fortunately, when we try to allocate SIZE_MAX bytes the allocation
> will fail.  We even pass __GFP_NOWARN so the allocation fails
> harmlessly and quietly.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm: remove some dead code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/37d2e108de4d

Best regards,
-- 
With best wishes
Dmitry



