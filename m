Return-Path: <linux-arm-msm+bounces-76105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E279BBF288
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 22:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D494F3C224B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 20:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C00280CC9;
	Mon,  6 Oct 2025 20:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Roau5oA/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCADC2343BE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 20:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759781538; cv=none; b=YXCWoeqg+jSWBoE8j7hNJbGM19lE6fgYup8p21lNCcPBLC7vBnqUUANlB5kRhSzwhotv7kwCba/aV+r16WxFQ84o13gexew5R6OKImvxF882I5k976i7Bbd0CDBu2psz3UxYze9g0skz++0wEbZ3p1P41SWKmf0QLc41yk97IZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759781538; c=relaxed/simple;
	bh=fbWv9VHGBvoHkljFwepv3LgJ3nAI0qpJCHi2CcaVi4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IT6jD5f+rfXJIx0RiHKk1p2hzZdMQAA0qkS5U+OTezNE+j87xbVKn0L7dQIUhWdzdny//D61sX+9/wGMWjut1aRxNarmXT7sEDa+BEyJQKp4oik1GT03FIPHCJ4CPPCF/9NPnntN9Emk5yWp6oUr4MQy3Irz5Kixacyliups1GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Roau5oA/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596EGIro020199
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 20:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kzzfGKAthQsK32eoN+vctDu8EkjUGMKdzeqRRipQt8E=; b=Roau5oA/f0BJNXOr
	awk9V0RkOdRYyBe1J1CGjENsMDsihPoqtkgqE2o4RVm+JIZ1bJ9ldraBXh0/M8kl
	Xl6z9I4RmamqqMZuH9eQ9MHjDhWMbMYWjCnfnpE79rv0gv1X3vVb107ls6Q8qztD
	5/2ydVwNIV7uhLxQ7sLLxpp1mkwBmhpS5wK/QuYeRIzr6eiHl4rDizC+xVKSey4K
	cCKZ8e1DNRXLdXdwaRe8Jckq/pK93bhdA/e/1u9gunIGh2JLU4tANiD6xF2PZC5i
	SjQgI5wl+u81Uk3nUPB9/vu8BynD1H9/+YF6NyT9+0j6Zp8Ty5BIMHa2HdYox3cr
	zlS1QQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7muys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 20:12:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2e60221fso7663774b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 13:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759781535; x=1760386335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kzzfGKAthQsK32eoN+vctDu8EkjUGMKdzeqRRipQt8E=;
        b=aCJtFBN0798vbMIsDJ6EvVJGF+uTKvhOOcRbdX3/evEAM/unrhR/4A2mJJ0VqGm7iF
         6UsGSqLwK6JNap3mCpxn3ceitGky7d3IRJpls8LHxMKDFDPMJyk/5i2T0yVGET+89Sdt
         d6W+bwRzGbAi3rd8VPNyTVeRdlyVLcRFQ4ZNGM/A/J3MVJT+LZLpnRj/VH9335UtWvpf
         HdDBJY68vA8rKs8hTdolW0A2B5a6G/Ll/fYAuG9/ImvwCuzaeo6x7CkVA9Wbt0Ex9IRe
         o7EBDWA4SP5q7j3n9Xx5EETcBgSJXzWLl/loOfXElfB08uDcB3rs4wTh4DuuTCPrKqZR
         /9aw==
X-Gm-Message-State: AOJu0YxKruCzRgB9W+tugxSfJPe0MfOxUzcogu+RJ3SnOB5YeKZ6zGRF
	lPpgwWUQ/nqTtOBbB01z923Xo1pKzmtUGXNnFXt74lsTXQmeGzhbDfCvu71CMWGKmoX4OxvSiGN
	ArOe8ZWDJbuXo8mmYhErX+a/iruOHwNAjM0iX5YgVm3hGpp4plyke1BcHh4vHhmRDoyks
X-Gm-Gg: ASbGnctQ9Rkuw/Qb5amojYHJV1zgfpz3yAqzKyd9xbw4Nd5wke3Ne4yLWBuhicJF0p8
	D4+P0C9SeLqdS44seBiwGrgxr3im1iqoXs5SsdAlLMv6aXWngqzeSh62lZuJ6u4c0GvYpxzOqUX
	6t2TsYRWaD+Efx7PlmpDWnBnwW+H1PfpmhoVUVIu3af5cyfXX5inkBr+3BEyheQL3yQdLBc7mFL
	qrG6xSGqm5eP5tWmRsj+96Yx3eT7U/n+OLBaGJa3R4xYy64x+QSaXuDeYgacGRl3smLSPHzL8zp
	Npy/XU/XNSdWMhMMRlvFx+32MevNfWkKRG/fAHQ0qukYybLb7KmRFJVDnc3ZBKYho98IcATGUwp
	/VXrHDymVWx0IG138tOs=
X-Received: by 2002:a05:6a00:1746:b0:781:17ee:610 with SMTP id d2e1a72fcca58-78c98dd9621mr19310697b3a.17.1759781535062;
        Mon, 06 Oct 2025 13:12:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAZFG8hgyCdPxR6zWs2eZUlAvUOkgVWHAtpD5hAmxgbNzV4Q7WaKJn+d5pIr25u8O4YLH65Q==
X-Received: by 2002:a05:6a00:1746:b0:781:17ee:610 with SMTP id d2e1a72fcca58-78c98dd9621mr19310669b3a.17.1759781534579;
        Mon, 06 Oct 2025 13:12:14 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0206e50esm13321566b3a.62.2025.10.06.13.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 13:12:14 -0700 (PDT)
Message-ID: <ee526600-05cd-4ead-88cd-ceca776ade80@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 14:12:12 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/qaic: Replace kcalloc + copy_from_user with
 memdup_array_user
To: Thorsten Blum <thorsten.blum@linux.dev>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250917124805.90395-2-thorsten.blum@linux.dev>
 <20250917124805.90395-4-thorsten.blum@linux.dev>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250917124805.90395-4-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX4nZrz7lJtTR4
 nT9inc4Rl0LoKa1WlTkM/wC8Vm0Dmj8M5MytegD/ncUHyXbcRMvXV3Tafpc1mREEm7L95dsHHCP
 gOMyTMTICx4r/wb8ttaVo+bxFGcVtCWn3cdx4RpqvnXzcRyCK4TCst6rDumyO3pO/x+oqMO6ADR
 DReBxwquyCKBEsfhIgoAFRyDUfXdTXs7evbt70MsarflApGU2wp7a0Wm9XW7uClmYxUgWjsAsOF
 gsPmdCPdw9l4iMORAkC9ik8RXtdFPOVV9BGkcrO0Fw9QFq2XValsUn37lvY3ZImsABvEAjBDYEU
 uNKd301MhmzoOTOwaJlBrS9RYVy13SBz0wXbOXul1PW9Ts6RPKW93vqOqkqfTApk3/GyBBarJPx
 fZlopLDwpXVI8WORwqiyjdwqHAgdAw==
X-Proofpoint-ORIG-GUID: nc_MmjoGHKvNGqJAdH07sG0aFcjdxjjh
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e422a0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=MFX6GGzU5ss6K9bJXPMA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: nc_MmjoGHKvNGqJAdH07sG0aFcjdxjjh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037

On 9/17/2025 6:48 AM, Thorsten Blum wrote:
> Replace kcalloc() followed by copy_from_user() with memdup_array_user()
> to improve and simplify both __qaic_execute_bo_ioctl() and
> qaic_perf_stats_bo_ioctl().
> 
> In __qaic_execute_bo_ioctl(), return early if an error occurs and remove
> the obsolete 'free_exec' label.
> 
> Since memdup_array_user() already checks for multiplication overflow,
> remove the manual check in __qaic_execute_bo_ioctl(). Remove any unused
> local variables accordingly.
> 
> Since 'ret = copy_from_user()' has been removed, initialize 'ret = 0' to
> preserve the same return value on success.
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

