Return-Path: <linux-arm-msm+bounces-81776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 57680C5B3EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0C545344E0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DCD26B77D;
	Fri, 14 Nov 2025 03:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgEEV9dv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcB+Dytx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2662A254B1F
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763092279; cv=none; b=m6lqJzCB3OcuaGL9HtAbIogINmCuQSKe6g87AtFzYVi9tUI3vVMkAiIWhS4LAIR8p01WftNNr6SYxKaULUpnQQFq9a6tuq5gt5EWmGy3Tem+3hYTDmnWPZhvUUi+sw8GHvIn45+RJNbCT8FLy2NxV1MbOyreVnjJ8LwKxhsvrEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763092279; c=relaxed/simple;
	bh=JxiSen5cCIxQYPY3v1OTx2nSNNdt3Kjhi6LAWhcE8+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+GhPnm1AvIkFKe22TPaVTXB4Upbdjvma5FG4+jKI2siqhzn2BdCI3bzsJTbzKE097hOJqyIVh9QEXCPl3Ze2kOmUsGedJSZwy5dMFU/PJeCTITzDOLjJb4ZoorKn4CeoBGW5qz8PA08UFUR3JxpdmmyOOGruhm5ke7M84cve6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgEEV9dv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcB+Dytx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb9171498581
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WA8Pr3rs98Cbnt7QTDamV871
	sv4DYRXzkpojMhmqMxk=; b=VgEEV9dvKW+QCdwH8pegM62gA6GJZWJc1GLg8aeA
	CrqQlVMH5qtq5SK1slbIkPHJX92pOqrJc2iVUC9oqIo07mu1k7YaeFTdAD6+QPjw
	Hju66sMzCVEojW8XdZXjAzgJWX5ye1fZFj1eSt/1XmteeM7XwNBf7FpcbVNdgeBf
	Prhop8vht8mY+2m5eHvrZSV551UG3CigtBbq3DU1Wxj7lkPsBDdtXFNfwTj6uKKl
	2RLkoBwnt33uFSUxHdZghIpjVy9+BHEamkkbYmTVyn32TnchRemeqP3jf4EQNttt
	SzHoSvBhqbYKARVvZj2JWAY3NeLh9FCzgG6erFNSoQTYAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9drqdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:51:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e89f4a502cso43434451cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763092276; x=1763697076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WA8Pr3rs98Cbnt7QTDamV871sv4DYRXzkpojMhmqMxk=;
        b=gcB+DytxK/7A8g0fgqYz619NA86FRhjuEQW7Z35mlWP5lmoHEu9o8W8S59xjRttzo4
         vWzyYiP7BnwpOafOZT2FdBW5O+QEC/rEMCnbFigbzVX4LMKzBwyUJtDYOh9Xuj0JPf6B
         khd4LEggCyIsm4j5gyhtXzNsoI3U7PHxIzKsbOfG8BwoYDFkbi90bxz9d91mXQlwCWb2
         OzY0ibtwbkhFm8yW+a+70Voh0XCYKVZmUjoh8qXWjMqAoo76XJEfgriu2I/fWnzar7A3
         AcZ5GQXP87Ar07HErAQzEcCGzKrKkP3zMBxJtofqmhsKlDWVHc5hyEKKfPuKFGozcwTz
         PwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763092276; x=1763697076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WA8Pr3rs98Cbnt7QTDamV871sv4DYRXzkpojMhmqMxk=;
        b=kmejzXpcc/89oCi7n3606/D6/+PMFVAvSL/kSrRxOQlG5fEQhHvQi0mxLdNcr2GwuA
         yjUUAYnnHyeoLKMBvw5AnNtbnaHiLIRg6a6+SBPDShPsrxH92vTuMxbMn+v+poLXIjPZ
         Oue5LYVMzpjkEb1GtjVyw9JPd6aKV1rcxOxtFK2vWaajVWB46yV62oWYLK260SMD8RjP
         79WO/umOGyedrQ3+4xivbUZo33xlbD4MboXHahGWMwCl10pqMGzDWa7JwRE5NQt6F8Gs
         8gwasusfgNpai3cSztzagISDgPZ7Xn3ZQYvfCq1KfO+TYGoa+dFqLSb93/0zfb460ZcI
         PdLA==
X-Forwarded-Encrypted: i=1; AJvYcCUI+KEkjeaqaVN2wNemQVDXK/zCNl4QTf8gM189UsvK5Hem6PuQ1DMhG6SNHEoyoJYiDuFWE6rW42En1tYk@vger.kernel.org
X-Gm-Message-State: AOJu0YxJsFksBjFJVpNAI6JOGHTf0i6pfow/Ut9neXEE2Q6sDza+COFJ
	GCPJlTePPd/UoE9QRazvtPee9RKCCYzhaqa+EZcgCtTJKOBj5wBE9ZMQy2c/uolNBAJXGImXYaH
	wdPSQihXn7DFoSaxLcKiUtHPkTCAsbsUxV+yfsJ0JmL0iaSDIQIoHrTJWNFYkfKDlIyiF
X-Gm-Gg: ASbGnct1VKzCtAbeMfarLXqPzkI2+nTbY0SYmJpt9ZYwP7D+o5jcf/KKahhMRZ8C705
	BqKPazJZKOXMOsf3osdnfR7DZ2jg6XQpqx9N5wZfH7aUyvyvj55gg8UIrJ+2rM/W4Ch51tP+HKe
	t9bYyQctUFakrPmhVGDncdM0gs+dGX0SPs8/HEadtx5NmqlALnFPTNYZJ26r4cUpWmA2+f6bUOO
	7p1zCaT/09nLDamHYxkU5FioQQxZi75O3L+sMYFXCn4JYgNzcGpRyoaRAq8IQN5aEqA/aykqIZ2
	4Ex448OVWmLYYM4jdckuswtmKT7biVg4R5jP3ZClMRRdgkGZjdpwcDjXe2LBmtdDqBmhv2iBW3x
	0Jd2/M/aAv6f8/CqFnzVh/SAh3zCiCclYGcHltZsrKSqkxdxmepjX3enaEw3+P4ZU3cjnaHPuK7
	M9BgaRKA/mBj7G
X-Received: by 2002:a05:622a:10d:b0:4e8:8b15:3180 with SMTP id d75a77b69052e-4edf21647ecmr32176951cf.70.1763092276388;
        Thu, 13 Nov 2025 19:51:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGglGhnKyfb4md0LOfiFtq5AkSBtaC8cwHdC1+0NXzOVrGMGqvfys6xNubxOq9fdeveH3rafQ==
X-Received: by 2002:a05:622a:10d:b0:4e8:8b15:3180 with SMTP id d75a77b69052e-4edf21647ecmr32176781cf.70.1763092275932;
        Thu, 13 Nov 2025 19:51:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804056c9sm797010e87.90.2025.11.13.19.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:51:15 -0800 (PST)
Date: Fri, 14 Nov 2025 05:51:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
Message-ID: <3uwuzwxj5elwpciensgvcpp5vk3x6f45jy4qvnysw4p72uanx2@x3v3lesvuewm>
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=6916a735 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=_rVczFtdL_8dPuQia7UA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: sJPCIVMnf_CNQwGnQ7pqJUHwVN3MRN25
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX58Y9o9id2tjQ
 g8JYjnj68Kz5lkjxOWoqUFbqQ/FRH79RSdoHM/mD98FkbjacKiK34eKB0b9Lfoy3eULng6m9buy
 67AbG6mxGKmG3i8mW+qXgc0C9ARt99VjMzWIR6MILRn2YBKIKvW0ridpSbf6jlMPSBlUppx0ozt
 pBoDz55N61Y9OZvsl+qyLvmc0KeWFLGxFHqdFyfrNZiSnCqdEwPnjECEk53tlenVQsaxccQTvLC
 2INA3NWC6PNl7G760wN9mW3WDYcrnYd069UYE4EniWR6m1cdNddihgq8DzFO4JhHK7gcTPzETsk
 Wi/1KTbo/PD/8OIyhEIYVGJ0N4YTjvR8LX5koYt/GXC28LH4MSkTu/sC8Zu51wkFOo1YEtac2To
 lhlk1KU+PfgwLmXEj1pduwgSKzSa9A==
X-Proofpoint-GUID: sJPCIVMnf_CNQwGnQ7pqJUHwVN3MRN25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027

On Thu, Oct 09, 2025 at 10:09:32PM +0200, Christophe JAILLET wrote:
> 'mixer' is only zeroed and is not use. Remove it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
>  1 file changed, 3 deletions(-)

Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")



-- 
With best wishes
Dmitry

