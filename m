Return-Path: <linux-arm-msm+bounces-88816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 984FFD19EE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC40E3022B05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F673009EA;
	Tue, 13 Jan 2026 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXl9sfUM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVAvab/F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ECB3090C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318327; cv=none; b=MErGMutixe8ZyXCQAf0W7YXHdbyghz/lTxHfWitw8BHIosYwPSBbEBfl3m+5KqH93oud1iPoAeGhCI4QzuASXUe10g2Ig4gXRajmLV/wUVjFP3HAo3vIo9pVrfGlZL0XYngemnAtREt0Da7dmg+NxPV7+DnrhPnpwGaHfv337cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318327; c=relaxed/simple;
	bh=pzb4n9kTdNmTjQBVJsD9zbv9nA8yjNDcG1fjBwljgE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qoZEx7j9cqsxhwSCKwgiFrTmzrGezOseQQ7rJWxqeh/EluYa0RsU/NGHQiXwzP54OknyU6k3Zbbca7rERTPrx/DXaQMtWTtWcTrIZw9YGBt0N+rnAaROPewqkRDspcc8zPycRCN75gSqno+2mCQTNcHRUwVM8BL6Bi2FY0N4F48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXl9sfUM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVAvab/F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DCwj8L3868837
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ccl5y1POfshQ1u62vw6ufJB9tUYIx6XdcUcwQWB6apQ=; b=TXl9sfUMemknR8Mb
	76dTHbqO9lU1cgVVu25AZBNFAbO8f29gSh/HSGavmO6E0Q0Rch91BuzQZsgedaac
	vMghU0Nj4JHCnjyJj/rnMYLr6FDzRdvMSfW2YqPTpIYYnrxqwJrWNv0iMrarGHyk
	vUrMKq42wnUMobiK4oNaBFsu7zptDat6068H1YHfNuAo3BUm11WIcFJgJmEJxlbM
	a1hvcOBHqJBclj+OB6BxxwawEB4gQJEaN3UtS6uRvOxvJafc/eP7spLP20DG9VoG
	zEUIdTWtuyTuDhtm22YskqAjLFLxcXQ5PQQCjd8dUtKZ8sB2hwopcVG/1wG1ZACE
	46ytWA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk9tqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:32:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5efb28afa7cso151751137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768318324; x=1768923124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ccl5y1POfshQ1u62vw6ufJB9tUYIx6XdcUcwQWB6apQ=;
        b=EVAvab/FCxSReVWkpP97h94BUNrw+Nbv1ewgRJNTMqMgvPupGf/kPrt9qIvgRKy4H3
         9qOMfbCNqe5pG/ssBZ6jVUDsE5bAJsAmZVxGLq9xHGtkUwp83R610vlTEap0Qd5rY6fC
         4IyZi8EYzU2zWuknZrmDoX1rUU2P5AHwKpR9ENgwchyTCanlOF8BYxqT1aLmcol2e4ny
         foSFCr10A7wfL6coeqoQT0R1PVBqWTeEwqFJTrhJ3QF0fyBo9YAfCrnrGpYOn//fM7cS
         0/mxMMB5j0PfPvf7ePblLgadzgSi4zk1b2O23hGB7trzb44HA0GK1Aqa0C7DycO/Kvjh
         8EkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318324; x=1768923124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccl5y1POfshQ1u62vw6ufJB9tUYIx6XdcUcwQWB6apQ=;
        b=Weq8+aNV1ctufNQxXYE9Xo+GC8rZHIihQt9jYCTOkKyGnCiXXUnfUuuXJE01KzKLV+
         xT+KxXakePfNk14N8GlwxRSkx4W9YgAGcu68GF5R/xZZXQZkGNmVLUQBfFthAtV+kIV4
         +wYITdPxfwPi3INq/7S2Uk6tbFwKNCWJ1cfgrFnSg6T1JasCGNPJdVMVzHuW/mcMzMrs
         tDV5Q+BrawjGJbeLt8OWym6iNmAV1eqSgzqAKuSECDww/w6R2r64TGBwlAYTb9pPVfEr
         n7AhOQSMLhHWI+4O87P7mRVoGniLRDV2H9K11h6FMV5Oua4fTdSf4u5XH8UR/YCSgKwW
         nLRg==
X-Forwarded-Encrypted: i=1; AJvYcCXX+C9/Dm13FhtluZIe0NcY2s3bsY4ucr9ui1zO1OMl4wZDRmoN5WadCzfVU6ko6AFG9jSMIZVOAu0txVOf@vger.kernel.org
X-Gm-Message-State: AOJu0YwYg9X42Hovp+Yx1jGMa2M1R3+Y4MAG2tGNWWvFLBQjuZJIkv+3
	+dMsxrR6yj80c54Ug944S+O6Rgz7SlzKnNnEBWwyr88ud1PsFtTNpFo6f4tZ49rLhCiJtGsgXf1
	Up1yFGdlQn9cQglzTvSWq8Fp5eCQgBRHmSXzyJ2dViiR8UKuCFWlBhOXYB2zop7Mz55hb
X-Gm-Gg: AY/fxX47y8XkMfhlaYWNIOha9c7rIt7Y9wp5RdakKMx5bK+7fmCGH1oFdRYNnI11Tk3
	1E07N8H/KXAuDSuRXj54vZWIFm64K0VM6V5PKYSaLbux5XcnBXm+rMbEwoYz7Avg+9QjPTjIrQD
	v/fJmUVL8SHYEFMrt08k0UEw4yUYTKJ9DsT9AQ5dcZHAdGNd5uWmKi8efj62XYZoPaLys22F9Bj
	H3mP3bKHasrq0TfeCM+1QplTiTT98/aSiKgAgAPE24fBBmeak+XaGFxi7pVMTKYf4CUeoC8EvVY
	uE+I/XTtzxIaqbKkUb8qTfplLURIcHUOsJ2gVvrn4esgnu/iD4t5v0TZB4JTGGz8jTB+GwDq5jk
	f9zwXUw+dj7aIzOmwlEsFrrTuPf34e8/hG7YfM88wEURzTSubwRlhvXBTTqSRaBnRFaU=
X-Received: by 2002:a05:6122:9003:b0:563:42b5:457d with SMTP id 71dfb90a1353d-56347fdbc21mr5167771e0c.3.1768318324037;
        Tue, 13 Jan 2026 07:32:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDxp+V1DqoIerolnxPkbDym8KjSTKMypTINzAGYcZIuAStLsVttNXF1ApjLb6xX+Kb3BXSCQ==
X-Received: by 2002:a05:6122:9003:b0:563:42b5:457d with SMTP id 71dfb90a1353d-56347fdbc21mr5167689e0c.3.1768318322712;
        Tue, 13 Jan 2026 07:32:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b872152ee10sm534347566b.34.2026.01.13.07.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 07:32:01 -0800 (PST)
Message-ID: <0f786783-db0d-4bae-b3ea-cab2ea85223e@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 16:31:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nYyagKLmA1mru3RgMRWPJ_esunw0Yt1J
X-Proofpoint-GUID: nYyagKLmA1mru3RgMRWPJ_esunw0Yt1J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyOSBTYWx0ZWRfX0GdPi+xFAgQT
 Lv8/A9V9yG2PI5ektGzaJxBZ3s2iwxd9WBCEuaBJC2vEPe6rv9Yn2/2ZaqLPHUk/tQr4hx00Ep9
 O4XWKch9Ok+NqZlqq3w47jkU1i3wkZzhhhrJYJvi9Vjt79eGhLNuwWUsDBe6XAFx9UmtvI41h3j
 Y9497X5V0x4eVSZXaSeTprXYCmAOz+89LERUtAxB7l1C446OUH3HQ6t5y7cEsmKM857Ye8wIy3U
 NyIokCbdECceFEHn0j4LOxuYjV6s0aEnYQhiTUILwG1gpJjCBXWkNNbHgq0x4LK7z5xnN8pJ7cC
 Fr7GS7nu0ULsQGZZkxX+QXDtrBXuiM4IHLqEj+AiOI6OYQlGuysR6QeBAW57PMsD0AcAdYWI0fZ
 Sqyf6ABIc61PPHYHbQABvQWn1rYQPNJ6aeZbMEyA/lrwptZTK9RKJffUmUM5h8/BKYkcz03yzsC
 28dCGlwWC8uklw+46tQ==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69666575 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zvAHPaQ1O9Bprg_nwmMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130129

On 1/9/26 8:11 PM, Connor Abbott wrote:
> On Thu, Jan 8, 2026 at 9:22 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> SMEM allows the OS to retrieve information about the DDR memory.
>> Among that information, is a semi-magic value called 'HBB', or Highest
>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>
>> This series introduces an API to retrieve that value, uses it in the
>> aforementioned programming sequences and exposes available DDR
>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>> information can be exposed in the future, as needed.
>>
>> Patch 3 should really be merged after 1&2
> 
> No. The HBB value currently returned by the bootloader is *not* always
> the same as what we use currently, because some SoCs (like SM8250)
> with the same DT ship with multiple different DRAM configurations and
> we've been using a sub-optimal value the whole time. After all, that's
> the whole point of using the bootloader value. But patches 1&2 will
> only make the DPU use the bootloader value for HBB, not the GPU. So on
> one of the affected SoCs, it will introduce a mismatch. You can't
> change anything until the GPU side uses the new ubwc config as its
> source of truth.

You're right, sorry for that

Konrad

