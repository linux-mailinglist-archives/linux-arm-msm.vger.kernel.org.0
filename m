Return-Path: <linux-arm-msm+bounces-86524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 363D7CDBCC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B8F8304484B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4535833120B;
	Wed, 24 Dec 2025 09:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqQvfRUs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aUczem5S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B821233120D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766568478; cv=none; b=i+58kxjdItnNfh2paeTInL7/5r/PI5aVxzYPpdxpKYqjMov6EfaoEKDWRywcAyTxOlP898jfo2aB+9TxQerr059lc+DYKCdPezCevILOK7kyu+Lnk27BMpM2NzcKLUUhujUTdBibQZ+8jp1Fpb1T2NSOS8+wZ+21WErSOmDi5eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766568478; c=relaxed/simple;
	bh=a/s3y3Iiv5oAPLDxq5bPT1pt6M6xjhDksBLf3bIhK5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qx3l/kupAiZo6ZYj4JXmiicivXTWsB5CnrWCIUKnM0YMzC20YjuCCOZGkQKHC+KcVoTd8e3pP9ty6iTOAzo1MUYE6Trp8x55WCgH6qHoQXZ3x4u8UAoT+Ify7IOvH/Huug2MOl8bN7llKoWvx974pqjhjVwGR8sxWutZnqJDSgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqQvfRUs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aUczem5S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3vJQm4133945
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7FHghTX3uiDklouV4gc1+N9CvHPdPtpOY8FSlSz+qQ=; b=XqQvfRUsIhTVgRB8
	j3FMZpBxGMm8um0aRY+tQdnRSQKoj5/ihDN1vQR4Vvz70YWnfzXBFS/RzWHcWV75
	21Y1w60Jo1mcsW0yxa1UoHWeLz+tEr1La/tHrWq3YlX8RuOvMwgquwyZ5u/JLmPR
	TTYGZhOLxZrESw7ksblUWomzqdEmohr+5EQtHr29Tk3UU2D1Wq+8XxSevJsbPzNz
	kWRJzv8w+fDPV4JVtAPtZIBxrQW1ajpVG6dG2Okfot4sLhWdGayiI6k3OMrrh5/U
	043s+PL32KRK0BBBijtnkVwphN6yvWuUersPZ931d7VsyRaPQdsZ0XVONSAbL7VI
	5FCZNA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46tm3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:27:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee09211413so144349941cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766568475; x=1767173275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7FHghTX3uiDklouV4gc1+N9CvHPdPtpOY8FSlSz+qQ=;
        b=aUczem5SGNzAgsRqhskkgpqWZQXPAez0nMOsemaTXoXPm8HiEYzN3Yxd2VRoRgCoDp
         immddfY2hHovmxoTgr/rihby3pV6iMYlrZ9uEfBoRuHELqqnd2eQCOAsUhhEHXzMNIPy
         P8iGXpK7qGvZK7UkWbK1e5lqqK6AdijnNOID2Prbja6hPSTVYWtoiKiGjV0bQtqQ2KR3
         cIfbmYrw5i4xJ7WwELAth0CZqqlOM34HnH2pPsMfiv04YYW1xXOQHlllJRdJdgTQnSRa
         6EyXkNfB0uNufjS3if1Cun7vjmf5W016jHC2/nBvCFqfyw+J5BxYKO4GlCQZFFtk8dJz
         7mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766568475; x=1767173275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q7FHghTX3uiDklouV4gc1+N9CvHPdPtpOY8FSlSz+qQ=;
        b=kML5W3z6c85lLkhGF1JcoBqDe5MZ36Lq4mZlsrqNL7Fr3T1gnt1hNRyuqqsSbOg08C
         4HK2Inlth2unZhBEFV0LDMSON59Nj0UadbEOdR/ZkP7SzwfFh23C5HNO3OPqGN4C8B8z
         xCdUyHonah2ZNbV0cXOLUyUzpAj2RAd+EnragiMpsATjyuE996rKRQ1PtOsByEjdsm8U
         ygzef17RHQa5zExM3mbKnDqnOJf22eKWomVV5/GlxNJEvYAYaJHs9Gy+vO5wlr79UX0E
         HtUljULe8vbyrx8fjT2FDY1uwdN2BR+p2Px+zJbYzlFZHtkC635jEIguggVUeYa33lDi
         8H9w==
X-Gm-Message-State: AOJu0Yyqk8wAtwortpLlJdY5RvWwrWrwhcq/oJpYAmLJ7yY0+7xa9Xaf
	WXZeC0yGfIYTsZ0klO8izI1PNgwDHj7SgbYNGwgtE0MgSexWATBRIgOTPlB0MIYlU/JhnusZvFh
	wKdRMBoTGl5JIPk6s1z07WZEEFpRIXBWrBQh0JIdEjr6iIfIP58BORM3MgFKZK3eRCD4J
X-Gm-Gg: AY/fxX5aElgW7r4RR7fl98NLl3vKSigj45iHF0MZ6ueYIE4JUSNDwL1oBFUdS3xVE6d
	WTKU78b88d4vHH9XFkGk2f3MmPQI5dd0pivCe3IRevRu5KNIGlGNX0PN5uE5ALOoERmTLpEqELI
	rWUX7OAWYsq0d+ogYsOj41EpNmSldcKnr8mYFZOaPYLWqC0rJIZpWMT69eaO73uypoiESijm2Pd
	+59QR/xr2GeSM4Mq9LD1516ReiuCOYLiG6FFCQWuRL5Gs+1W8gCm49EcHDEYh2yUp/JyHW+9JMq
	ykzk4WbQwRR/y9g6rGu+ybPpeE62pZLw4VR2UvPp5VX424h3LJxBOeC//vv/+XqpfKp03xM40qG
	Vq3u8jKvv/AztIDaa1wlT2XMuuYRrE5Igj3vfbO9xROak5S3IS8XHzeVDBpqyfcR6irR7RxlUJc
	4B7jpe0SCTayYZgraWPVSNkkM=
X-Received: by 2002:a05:622a:130e:b0:4ee:26bd:13fa with SMTP id d75a77b69052e-4f4abdd147bmr258958761cf.80.1766568474704;
        Wed, 24 Dec 2025 01:27:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFv8MKmpaRPfb+4/iM2hRiwAOTJVkTLovJm5R61nJTI1nkvDcvDs063ITmDJne8s4O6OtuTHg==
X-Received: by 2002:a05:622a:130e:b0:4ee:26bd:13fa with SMTP id d75a77b69052e-4f4abdd147bmr258958611cf.80.1766568474138;
        Wed, 24 Dec 2025 01:27:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de761sm43606051fa.1.2025.12.24.01.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:27:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top support
Date: Wed, 24 Dec 2025 11:27:46 +0200
Message-ID: <176656845704.3796981.11060457763537143127.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
References: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: a1343JRLTVVPDyBQjH-YqlbuCQsbJzeH
X-Proofpoint-GUID: a1343JRLTVVPDyBQjH-YqlbuCQsbJzeH
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694bb21b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=TLISOKiRIOAQD9zG33kA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MCBTYWx0ZWRfX/Ja3u+SMCS8L
 zBisgChvhz9Xd5YlreuPZ9VFoFooSLgDWo0CbXFRd+3I91U58Y5Mst3ulqpUWFUiEfPUcnV0c5z
 uY4a9SpuqbX8bWos/jWvgL4nQ2CGfXaHfOe0jP+u3J48PoV/rXzq68t+usD8CI9NJUoI4p6ynww
 vnb+Kbiqu8IIPVlXEDl08CBUZ6VcQ0BwBaIr/OMns5cn4STfn2ZkDWo9gmk3I4+cXl9S7y+DN7k
 pACQqUpy72+WcJLBgxOAw3nLYu2iJda2WWnuu1eYcSmrKNzkshd8ay+lJ2kVrZj6EeNHqmZUf9a
 BFjdRG6nknzeGXbVGzRzDnsgpwNsM0WT9m8GSMoWHGl0bso1/pZzRIra+/z4hNiGZNivaqJHdNJ
 +AFbZiNAN4EwWwArspqByVvObW/T+RAk1asw5Chs67LM1ue9e3mDQNjUmifsQGISprbOIEufD4X
 4Qm6D4Ieh1qOKMLET7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240080

On Fri, 21 Nov 2025 14:02:08 +0800, Teguh Sobirin wrote:
> Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> INTF blocks.  Currently all code to setup vsync_source is only exectued
> if MDP TOP implements the setup_vsync_source() callback. However on
> DPU >= 8.x this callback is not implemented, making DPU driver skip all
> vsync setup. Move the INTF part out of this condition, letting DPU
> driver to setup TE vsync selection on all new DPU devices.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Set vsync source irrespective of mdp top support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0a7836e1db9c

Best regards,
-- 
With best wishes
Dmitry



