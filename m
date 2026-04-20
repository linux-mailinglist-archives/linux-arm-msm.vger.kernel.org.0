Return-Path: <linux-arm-msm+bounces-103864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM4YNLa75mkW0QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 01:50:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3296B434F47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 01:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33A50300B991
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 23:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6D734E744;
	Mon, 20 Apr 2026 23:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqgpgIvB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="km6t+0+G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8321BC08F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776729012; cv=none; b=k0SSROH5Bw1oKkJEnO6onSlaTfWG4SPBTkyjJn2BJHNH5R6dMnxlhlIVpGPLU3LnrnofgXHe71nutmAeDVn1nnHtpMpVLRydm0DrrTiTfQHldHS9EeFmyusfDJewUJjUS7a8uEIz5z//LG8IstxinB+hLNPG9p9iEUyNIMU8Dg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776729012; c=relaxed/simple;
	bh=WB/Kg7RJ62ote/pQax5FoOU2NoBmyhNe6FhG9MIQevc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqdb+PW+utysF+R5fUoagujf8aJzC87k3OwxCB7wgocLS7zvW/WbnBUNjTmvYNgqJAi5+P49oPeIOsN3ozFhgozld+ShHnbIzTv2M5PDz2rUmPvasyzBM2qh4uNANtNF/96BzqEMW0dlytl4XQaMUlDgBnBUiSqExt4yAt6f66Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqgpgIvB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=km6t+0+G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KHt6QK3015208
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lFeVto6DtjU/NMUp/BHqlwRu
	TqkDdZTaowkflqaDISI=; b=cqgpgIvBM9otV9/ZJ4c98JG6Y5U9PrWnFJd6cTSj
	V2jZ1ygHqbMkTU8JhGrsVFY5lkKDNs5/OI+RgvHgFo5uXI5Wr571ET2tCCFR6ogv
	eErNrn5RTje0ywEw9JfM5CSkVcAglkJsPrLEBVI+Zmc2ZYoifidkcW2r0QEiQckI
	wqJ38bc+atq9Bmn7Lg+gWWSTTCKKHwoDAOW5IqRBftrV9ppagSDNCFqy+uXU+V8s
	RI9lySZvr61vThZoWwskqh1F2mJYGWKJ84srhfYB5+huZ0uNNv8AtF1PgPfTXArc
	jNALR1o5PLKUIwNKxk+HtKM1ZXmnWCKZlvxqZZPxccw9LQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjukthuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:50:10 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94ad0ada31bso8063531241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776729009; x=1777333809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lFeVto6DtjU/NMUp/BHqlwRuTqkDdZTaowkflqaDISI=;
        b=km6t+0+G8REDy/XGKPG/qwmtYAh/gThC7/QYZxoA0lk0xbcRdkqZEEgKNV6psR1UUj
         lZ5Dq5vih6cATljS3IL67soSyOB+xf02gTSBSTDOS5CThw8QCfcD5FeZF/Dodj3LMJFd
         kOZm03IWcuiC2HH+4+hqlbUkeyE8CTARoFTu6XvPY7ndfzKEELyG1/iBn71uxfPPaege
         ll76006Lo21SYHoFyjFMSYzXNNPBRA6QcHlxWcyg/GaOfGbCpvta0Pp3jf4dSfmBXnGQ
         rgsFISYgLlI1/RoQjv4bFjYvSG1bQFniapEdnA0CDEkfzQO7Q3T4NAuuEwwshoRjKaWz
         C8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776729009; x=1777333809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFeVto6DtjU/NMUp/BHqlwRuTqkDdZTaowkflqaDISI=;
        b=dAp/MGHx0VfaIgxPdO7PiK44Yk5mq4G02ztKUTFoUO5wagfgOA9rhDXNfJrbvn6US4
         OP9B2f6OaN23hdBVr83ACa2vIJgIPybvU7ZVRUcBCvEAZel5ekwNMqhrCSuUbXZQ9ktv
         ii/l0yX7wGYjLNVVj3UK9MAx1lzhIT4z0DmHig/V4nEqIFWaaORap06atJRbJwFKW8c6
         lOl0kfpz2UZ4QIzf5lrom2il4sedMWfqM9cdFNSbnr32gE7jv5X8bWbd2f6TsADdws7x
         V07ftAkFFGztLVRlLz5QH87v6X5EeYMoio1827a8AD6KRz8RWHyjGjTjiC902J2vVCUR
         A5yQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QB7ZP8AEXkbBDK8d52n6m+MJbRz+XoSeD/mBZAl+60DKgxRqUwElanF5sKA5zbLlmDYLfv+6eJvToWWCu@vger.kernel.org
X-Gm-Message-State: AOJu0YzvPkDP5juPIy68ux87diNZXsTgH+GYUHrgWKcIa9Q12Z1Fpnpo
	9lM6bUy0NraMZFGX1scXqNXbewHPQ0t8ArdivnaTmQgQCNIojuv+L+vGAWCj2idksqQvmhnc7ef
	uNEjAClnGbFLQEw1adWqROw9LPCKYS1+hTfdDZH2mbv2eTVohjnxEIzMgShcbVukZjsdJ
X-Gm-Gg: AeBDiet5NuhztzPwy5KVdJw9xKeEXUYCO85wC5lXtvhxW6BRETFdQrR1jWdjYX9EWeZ
	3RJbywrjnVFrnKyB1eDMi9IPEljpNFjrbV8F1oYey3G60kro0yFEkdRyTndWFD0x+k7WxtVNfpZ
	sXrZFp5xW5KRh9NQFvzjTsXtBDsvI9Pv/u8rsI94tCxsXwzSzzBIH/NbT0NoMgHy+rOlkqxtGvd
	XZLNMKtnTj7+DcWGYozkMiUeASop1bNHTzxgDOWFxJ5jLFHD/ZEkW2Ix7y6LrrRtsAlCwIZFZNO
	XkcCQPpwkZ9zYXYxMM0cB+ztONQemjKTeCqDZmrOiZHwG8RT15g6IVzgSRoku6Au8HOrQUQeFdH
	/7LQ5K2zsmiF7V+NYN2kOeS43WnUyzsP766Ab0itHmLLy/0bRyuFdfh4BP3fcED00/K0qVYDmRm
	r+Bn6KpAfIt7It3hWOvXvF6zeMHHVx2uV1BtcCCDBwsNRtDg==
X-Received: by 2002:a05:6102:5e94:b0:610:347f:9f3b with SMTP id ada2fe7eead31-616fb8a0537mr5184444137.3.1776729009492;
        Mon, 20 Apr 2026 16:50:09 -0700 (PDT)
X-Received: by 2002:a05:6102:5e94:b0:610:347f:9f3b with SMTP id ada2fe7eead31-616fb8a0537mr5184428137.3.1776729009057;
        Mon, 20 Apr 2026 16:50:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5012sm26460691fa.3.2026.04.20.16.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:50:06 -0700 (PDT)
Date: Tue, 21 Apr 2026 02:50:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
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
Subject: Re: [PATCH 02/13] drm/msm/adreno: Sync registers from mesa
Message-ID: <yc6istybrtnzwft7uyl4bjfruapcfsso2mvfgnhcxrzntoi4rf@bubhdghwswj5>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-3-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420222621.417276-3-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: Rm4PuSvuAWjXRusyrgQ2mVvheQM9_1bG
X-Proofpoint-ORIG-GUID: Rm4PuSvuAWjXRusyrgQ2mVvheQM9_1bG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMyBTYWx0ZWRfX+Y4nQnhvWpgc
 kuQKdLG80QfQjeHg1LidJa09ufAX8vM/xjzCoZ2vcTQdCao1CtpySbAd6vFNfxy2jnbf49tCrBE
 498gQ9GsxHZtLnj1dFX6u6bN5FrHis/p/JRZ2c70Yn0rsSYb3u5q+kKUJIZXjpF5osrQncjjdjD
 HEQQ8Hk23WSVnuVoHp/dhzo8GEpW3NDMrsGoBEKFMSbQvp4qdax797Cl2Z1sAoVUPRN18ocVObJ
 jleR3J5y/LQK5M7nXSfInUF0IOEQmH5yl/wCUPn6PNxmOeTgEuo1oU3AXjgeR9UEhWGFX0K4YVr
 jb0aoRrjlJNJOUftcEpPH9zeMeoGR+OP6hMO+gfcCCRuD1xoqgJc42LlJF7+kRATO0Gw5TrC2qM
 l/Ywa9OR6lXB+4JtyyLorxnNr6eu5L2rRZ0yTJb88UNpGAwDTS8z0qBmGFT6QNIl3SR3y9sV/jb
 s6QzZfbScxfKNtUpRmg==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e6bbb2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=YSpEM1VExy63LNwymm8A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200233
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103864-lists,linux-arm-msm=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3296B434F47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 03:25:24PM -0700, Rob Clark wrote:
> Most of the churn is just reworking the usage attribute on the mesa
> side.
> 
> Sync from mesa commit 4d4a951ac622 ("fd: add a8xx perfcntr countables").
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

