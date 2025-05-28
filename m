Return-Path: <linux-arm-msm+bounces-59716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CCCAC6CB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 17:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D894B16656D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 15:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F33201100;
	Wed, 28 May 2025 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5MaYfzv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D651C683
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 15:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445328; cv=none; b=Qe+ukgpvXXaEVM9iLX2maohnSkmPUMhTCvHkL7MnKbEZZ9gOr/ts7vA/txUo9BPsyZT5MgXIyaF2y/Kjra/ziIERmQOZqj0sCXAeC7S0qbA15pade1VA4dCz4vInjMHj2poV/giG4lBe+vIZ9SbrA1yE2SuC/ZfORDxhXSHpZ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445328; c=relaxed/simple;
	bh=0QJxUY67yHsfAsC24Qs88W/sdKdUsj7n+A2R6RIw9k8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MCVGIPOKGa2ImNHco61XHa3gCsXL48VTOGKj1N2rdYy0DEWWKy6CW6JEwNsG2p3IRyGT8ghwoFbkTi9DpL6RUGhExNj1El2D5m0/decK73YVbEIIZvTECl1fQ7kYw/2cgtQ5YF0qh9sx181PHemip28N9LIcdOhWpS3CnllDDhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5MaYfzv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SDu74I029195
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 15:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MgByvl3ckepaF69BlogdaJiFhvkLD/m96L5RpVcp7qM=; b=D5MaYfzvKtuJwZvz
	rLONKXRmnr/g/cNFjxC7n6YCLI/1Xc+m8xKSaI5lrB7z3tS3QiKXZf+L+fkcuRCB
	m4NvPCotvqHQBQOvcFrVscHaVyh5+W6P44GhvJovyilLvwe6yBQYRi5ltXe8h220
	nsddoYvC5MOWtFKED9mN7zc8Vu6lgQISNji01QoYv6rsTpWMT6e9hcVT/xuM158r
	o0A4xdgXDhO0avKWDo0WhylglTtSNx+Othmqy4aNLmBWNJLD27ft3uR0Om+cVsyA
	xpF9OeVWnaSDxnbNHoE6vWrVcir/QEj6MSOWgtmmEkSSlnddsv8f9IaeflInn0CX
	DhrFvg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992mq2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 15:15:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234d7c0524cso7053735ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 08:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748445324; x=1749050124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MgByvl3ckepaF69BlogdaJiFhvkLD/m96L5RpVcp7qM=;
        b=K8Pe1Ge9jJaXp4R343bEDo9+IzCpMEbiupVVf6arRir9lQpXehI/TLP+YptIfIkYJ6
         h4vRSr74VEl2N0yBUFYFalTfvjRjuhF3gy4Fhu4aXr9FOEpw022VMOkP6gHto4Q3wZ1y
         eSf1L0WBRyi2tOIUYbegYh7ZsEmK/UTb+9Aeg/c/auIdbrCpNaG6FgC2sFRU2a+jCqUx
         NdoAj7gEHJGjTARSrPWhPJizrg2cVXmQxbY+uk0LZkaGVqmEiSoMifx2s6zLY1tEKyHI
         /Fl0OK/tPBIiG7c6typqrr8lXDpajIVDYHUVHN86Xo8rgv1YlMFKlLuctKgqDOv7ZSlk
         JHCw==
X-Forwarded-Encrypted: i=1; AJvYcCX5QKKuBg0Y6KXg/K/QOlJHmsvAyTMz1KXCfGO7FEXIx/r91RSzU0NFvUi4tl5lYb9pWZM8qEkdSdnunRGY@vger.kernel.org
X-Gm-Message-State: AOJu0YzM+aOFVQ+vDR0LFToUQOplufSGElzsSkQMpO/u1RyxhT+2kzfJ
	Hu+v/wZ4f/dBtj7DIbe16GrGUl49lcDXzS7hFgh5SjQaIYhhbJuvnfxpG6eNU9RYRlcfFuRA6vG
	v4PVUJab753G6cdj0PN4z/W8oYYffAgnx2RIHX6kwLgo2sfGVr4Go4hI/A80j0tp5VwBx
X-Gm-Gg: ASbGncs9tfapdUWy/2EgfsmDK9ovQTTf/OFPuDiS1pJle2vNuPcOpSXrCwT64+S5hu3
	Luc1I306xhidoemjRwFDI+ZuxooDaRYheDlC7lqU04q7ZCLByFTDlQ4XIebeOlnUQqPbdtfZ1Yc
	mjRSqvLc9mm994mn+rAb68iX8X+TA26xfntxS6+sQ/zWz5r5wX/6R7PI1h7z99P31n5uHZXZrSq
	1e6cO6DOvmm4AiTy/J6h+hHei+wl5fZcjPZV84QunbuIlAUkpYXhXT+YpLDEm2Ou3IHE5BU55A/
	Th07Yi8OgqDYo7/oFIfZ0zEakuSV02K5pHi6r/xzH1aLA0ZjA6fPZZWvrCW6gQ==
X-Received: by 2002:a17:903:1547:b0:234:d679:72e9 with SMTP id d9443c01a7336-234d67975f6mr34198825ad.12.1748445324623;
        Wed, 28 May 2025 08:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+fHExXpmEQ68MffV+vPEWdglq/8jBdvplEo6II6kIixUdE9kLKmnfJY0nJ0aFhZ6ORv5X2A==
X-Received: by 2002:a17:903:1547:b0:234:d679:72e9 with SMTP id d9443c01a7336-234d67975f6mr34198595ad.12.1748445324263;
        Wed, 28 May 2025 08:15:24 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d35cbb41sm12929605ad.256.2025.05.28.08.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 08:15:23 -0700 (PDT)
Message-ID: <70ad82b5-19f3-4e05-bc7a-858dafc563ef@oss.qualcomm.com>
Date: Wed, 28 May 2025 09:15:22 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] accel/qaic: delete qaic_bo.handle
To: Simona Vetter <simona.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Carl Vanderlip <quic_carlv@quicinc.com>,
        linux-arm-msm@vger.kernel.org, Simona Vetter <simona.vetter@intel.com>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-5-simona.vetter@ffwll.ch>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250528091307.1894940-5-simona.vetter@ffwll.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEzMiBTYWx0ZWRfX6bj0IpSWdJ9d
 06SXeJiygRNeHuOH8xyLUpeM73v2nmvDy6Qea2zThD+ouIoG+FHfzZ4N+F/AiCZ5cyQRaSC7GEL
 ygIM6P8RwFp4vmR76eBQooc0m4XsxYBmXKgUeJhNh4NFVKvwlVVQiRA68DlZWJVDiZ31UEy2VFv
 tOltOfpvgc7JwqzXb5gtLRs1DqDQ0W8k95o+CraLOlaridNc0tE/CtSHCm6ldGzxkr5nDDK8ixI
 x4Fcvks21tROdHFjqgZD5TAFKwSUkA+PIgmqf7S+rLe911vDWytdkP+iVTLQdG4bgODUXC8FSQt
 wkwho6einly+CxDuJeuubsVHoafWCzg0SUXJ9oFChqKKHp4n5ze8JaTqFi9C8y/AG3FSif70e2M
 HGlYsIwfR72QEz3+JGHNY32z2fr0IoVnkhnDmMG+ZbIvMcT61QACmz4j7GPGag3HQYEKyKWk
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=6837288e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=k3QLI3o3WigVO6453v0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nFWtyovlUjSXVccB4rlMLpeuyOXRViZh
X-Proofpoint-ORIG-GUID: nFWtyovlUjSXVccB4rlMLpeuyOXRViZh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280132

On 5/28/2025 3:13 AM, Simona Vetter wrote:
> Handles are per-file, not global, so this makes no sense. Plus it's
> set only after calling drm_gem_handle_create(), and drivers are not
> allowed to further intialize a bo after that function has published it
> already.

intialize -> initialize

> It is also entirely unused, which helps enormously with removing it
> :-)

There is a downstream reference to it which hasn't quite made it 
upstream yet, but tweaking that should be fine. This is clearly a 
problem anyways, so we'll need to find a solution regardless. Thank you 
very much for the audit.

> Since we're still holding a reference to the bo nothing bad can
> happen, hence not cc: stable material.
> 
> Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Cc: Carl Vanderlip <quic_carlv@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Simona Vetter <simona.vetter@intel.com>

SOB chain seems weird to me. I got this email from @ffwll.ch, which 
would be the author. Where is @intel.com contributing to the handoff of 
the patch?

Overall, looks good to me. Seems like either I can ack this, and you can 
merge, or I can just take it forward. I have no preference.  Do you?

-Jeff

