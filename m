Return-Path: <linux-arm-msm+bounces-65273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 819BDB07912
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACFD91889071
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F145B26739E;
	Wed, 16 Jul 2025 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="at6/24Ga"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B3F1CAA7B
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752678042; cv=none; b=GRc89hukraM9XULOHe9nxn7FqPjxg1QGtBZMf9/QGfdNYd+P7icxB8OLUIduLcxuB+b71+MKlajbwnnW/X8XKWHA+zBbdgoXAJZpGdYNO3hMgLkASzN7mO5MKw9Z+eRfC903b6qUQAzEvJFZDIpSg5RckbyzC65/r+nxGMsH9gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752678042; c=relaxed/simple;
	bh=MHIyHlqoA/Uqj9LXN2PMXeXEUCUsJxys4641D1GX0Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHkDaaXC+HzWJVI1MwnTHP/Q7z8C1mCUJrdsskVo+rQsJ8a3GeXSlvPcdY7rFSDlBgo6dKQwbwKVwIM5WBHJSEPaKWx5gVHe5hpEuKuFjqfpZC6RVX03ADB1O2IdH90hOdWpqCJZ5YAgOSpsBYYGaDazT811PX1dXT5UwGO8hiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=at6/24Ga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GETJAC017609
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jF52cvUSvshXb9p4qQS6TK4m
	/ZISonXy0nEmQgM1hBo=; b=at6/24Ga+F+8Vvdxi5MQ8Z/aKzQ+QzS5eKU482hu
	9yw7KL38x0cl/MFRl1/agbWUDihD2bPPA9Z3VLwiNLilwY71acLUupABwXtBJDEX
	Q/99juCdVfXgVkrAUnnQ0xK9s/rY46PtJ5H3pRN4ACywXoxJsB5yL8Qlubg+xtJ9
	qkY6T2OCkn6b7Ded9apRS8xBXeXIzJjtB1VVMnjzpUpXhL3K5QwQMRexB9FKn2Kc
	YlTxEGxEWUaA3DeYyR42WIQwgaQ4M0DR4VTYG/b8+NpNyHSJP2MPn4bLVkqDb8bV
	pHwiLJAUN6BzzUv3YRl5q2uuLFCspjpjsdcWswkPVvayZw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8c7sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:00:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e1fb57a7adso348113885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752678039; x=1753282839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jF52cvUSvshXb9p4qQS6TK4m/ZISonXy0nEmQgM1hBo=;
        b=lgZN8uFG8yoc0LCcocR6ED/wqUbVyFqsRtoxasUomz9cs7oh5lGxWtxo/HCZbs46RD
         ecKSqbbPyd3ycU7eZGr1xc0C7oyyq394Y0A0aGVSjKtoeXFvDSAZmo04oCY1LCo515Zr
         A09RiDm7iobiTJC1uF1ES7RU1wGgomxFCXxyuHUn1QNx7StzTKNYr/r95PoAwKVZLMkS
         istwNPHuD5PN/U0CQE0f/M+DtnsvLdp4oARALSQH3uV4OgVftyUNQvC+W3MLiA1zkk0H
         +t2IJM0DY/GhzNUnmUDxpiEOoNBz6OH9sLNbM9rXbOsxUVUSRqpJVUq44RTQlB0K6a/p
         ztKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4iSDfZArcA7o+MP2UKnnJkFKQFjfv833RwZweIarszVNz33M4ukmoohBfUn5YCq32s4yZtKP7ygXgdZ3Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy+RqJUkMboJEipCqteu3O3icqXN2nzeEYqFvDvhOPR/FfYWZL
	rdAl90FTC8JJ/aI/aNT2hAR9V2y9bRo0jYij/daceCO+EXPjzGHxtr1CmFSH4nPiezp6mqE3jyD
	S25jecjWjbk99YPrpl01nk4Nsz/Uc2R+Ia8SmwNr0KFw6NhQ7Ed5KGgajsjnlgNjjCSRw
X-Gm-Gg: ASbGncssKicppCMZpqnZbWZMvr+YaX4Hz+muWcOvrouG9Dsz3Ct+9IvAVlGT5HNMKqf
	1a7atRwaesB1nGB3Uw/ANnK8yZetq2UtV2V9X4Ee62JAmSAtYYsHdU67toOOA6lZrj8Hg5r0e1M
	8s/l8Odpi3iQj+/TKUVJh71Fir233kt0gEwgCVHXYYQ97qWQsks4tfmE9V2tBH7MM7CIgsuj6I+
	BafAPG64ojNyebZd9+bK57k8/OaLfhMvi3W+UBZNE/ugBdKLRAkfFDopdNqBSBYDjUs5ZhZWhsI
	p0OlqsWdNkz1pwOEbdR74uPKB5NCK/1kRRANG55eF2NtqsLDh59xDjrfwBwj+pfdrecJiAKGkow
	s6JFGRgSZhY0STyRhQJ56WG4JBKzhhQAxIs1idSiGS9xPRKMuiSSm
X-Received: by 2002:a05:620a:688d:b0:7e3:3019:e16a with SMTP id af79cd13be357-7e34356f603mr435573185a.17.1752678039066;
        Wed, 16 Jul 2025 08:00:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxt4H5FXg39a4tOdmD3AP63qnFyd2IRuTr09Fx8yHgRyZMJ6icisMhrFI2Cre9KzAr64FPuQ==
X-Received: by 2002:a05:620a:688d:b0:7e3:3019:e16a with SMTP id af79cd13be357-7e34356f603mr435563585a.17.1752678038354;
        Wed, 16 Jul 2025 08:00:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab9134b5sm21435371fa.102.2025.07.16.08.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:00:37 -0700 (PDT)
Date: Wed, 16 Jul 2025 18:00:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/5] misc: fastrpc: Remove kernel-side domain checks
 from capability ioctl
Message-ID: <aepmtv6mxlzhpncwcwlmgfrb3m2c4xe2edl4y5qsnjpxmvivla@gwufrh37y473>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-4-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716132836.1008119-4-quic_lxu5@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzNSBTYWx0ZWRfX/GZC+YQSHPbG
 QwGvNqTAg3Nk8zskQfA6RdeNicqTTncci/w50mESHi25TxfZFleL4DnIMwOdCiDm7bsrEXcb+lD
 BqV0VuHWjl0eU6BtwsyCN8qGCV8aaqGTxB48hWusL+pMVZGO6tz4pLD8C011/J1HVBX7p6oaAxp
 ZS+cWKFRXGolnNfDkjT/YE131rnhwn2Hrpwu4FlR5UPMO2a31SrL9OsLYOTZu9cYbgkFN8QHJCm
 UZB7JTRJcX+nyOTDj4I7zGYP+XBVJ8VebmhkZb2T5MedcrhuYmPp6QL0sGDpwarTUofJC43qMDG
 4H0iWfRGgQBm4zfImIkjwr9H1YQLr9CFJ+SpmdexwPcMa2rC8Z0LcNn5C8D4GQPpFCd3Rboxwex
 I4XXY3oy0+LhyH1q090qrJ+tgOWBkgEF2+RwJJMQPia4jMTWc/vQrEAF3X372nX+Yr2Eoz23
X-Proofpoint-ORIG-GUID: a9XGw4XBertZTwsMEXOXy9ROeNJzZiX0
X-Proofpoint-GUID: a9XGw4XBertZTwsMEXOXy9ROeNJzZiX0
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6877be98 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=lc4KdpPQecCvDiYUKO0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=736 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160135

On Wed, Jul 16, 2025 at 06:58:34PM +0530, Ling Xu wrote:
> Domain ID in the uAPI is misleading. Remove checks and log messages
> related to 'domain' field in capability structure. Update UAPI to
> mark the field as unused.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 14 +-------------
>  include/uapi/misc/fastrpc.h |  2 +-
>  2 files changed, 2 insertions(+), 14 deletions(-)
> 

-- 
With best wishes
Dmitry

