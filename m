Return-Path: <linux-arm-msm+bounces-87408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCB1CF31C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 12:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8CCC300751F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 11:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D513164C3;
	Mon,  5 Jan 2026 10:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuuF22yH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AqdmNbzM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDCB3161A4
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 10:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610495; cv=none; b=tfH3wc+5ARk3D/ZnQSnjsPeE7+XgU/d1rtJyvd7+i+LWALkpN3C1lZPAKBqkryCVJbFbPgJ3XSoauyvUR3w3EFULtC27bTSeeeWJsQEiLr/OhGgAEhoDeh5G3HqKPYNjk6JaWyrlQyAsuzBhHc2RJcUa2jkEbWiGzp4VTvzInKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610495; c=relaxed/simple;
	bh=bheKuwe46FSOJpmSrqqvbs0M1ivb9fg42MjbHLkVoe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIVz65ieGoCTMbHq/7bL363P8dg9lFKvEnHLIPJmDdJPlQz6w1uqLrs6sUWsjRB+71MZ1E5fO/cuC93Mw2lXF2E3px/fHSpesvgnWLJjq43gzdJO57pC58F5MUDrnyoT9GJ6BtUnMOAdlU37zdDMKOGo8KYuej9oAGOSUSE2TC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuuF22yH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AqdmNbzM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6055a8KD4032710
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 10:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MEkWzBbnfz8We3qDGpvoZp5+
	bJ/kryjzDFwZRQ2Ij4s=; b=fuuF22yHKXhKayGE5q3TviVOE4zUh9m9d15M/cFh
	w96XC4zz07sYaNe52gqWb0r/6gB4YaLFH5bxj6WI9qnwXAq49BwkCkuCcfZZ7HAy
	yFQ6FCergy6oNCELrZ4e0fpLzUxSsftw9BJokv2IVbysGtvNHO1msIWcVensAcvx
	sxDdO2TLoNV0iwkhC4aMu9igJ3WSIhPAQfQzX8wHytB75WJSFORtRXdWZgv0yvRI
	KDQCjfACHiHhDwYYqihxG0ljjIDbyw+5bHz0KdjxbUewFzPaV8vX0DNg5zF+2Qal
	C3cF4lCavipPRmzXHAsC77pySWQcjjkJ1Hx7VEvpiDEbDA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg79ngx4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 10:54:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so15367876b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 02:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767610490; x=1768215290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MEkWzBbnfz8We3qDGpvoZp5+bJ/kryjzDFwZRQ2Ij4s=;
        b=AqdmNbzMH4/AQJ2qahFnRxYiFpCogoDu8+70d6z2VdhgWqJtl3ZXn0Wnp/T8j+juLm
         +NcADlBibG/dR1I8gQJxspgBHsgjwSeiX5ZknWGrbY2lD+gTM8jMwyMa6siGTx8Qt70c
         o3bk8eBEC+KtfQYSqayPjMNX4bcp6UECiLsCXMImU7M5SNVFGzZK91f6VuRrWJONPE/c
         gDXztIluW9lN41XjXTdp0adJtzovfWWvTK8rOgI4hZGByiuXTXfKiLv+LTaQfNj2rNJj
         ZBPGq/BxYyvrT+YAJsaTVUD1H/ziwl3Itu2wXFrDjyzvd4lgEz9PZ9/KL4sQUWobN/Z0
         xf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767610490; x=1768215290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEkWzBbnfz8We3qDGpvoZp5+bJ/kryjzDFwZRQ2Ij4s=;
        b=UIY5mVN3jsVtB22eccfLx5YVjIALjr9l2mRbg9MD9M3+xaI0fkFz8QzdDrVajIMGgi
         RaxfG+XMXTgvMjkEC8iH8uXNf4l4HkSWZeWWfxB8lXJYB33V99NbcXh3GrJoNOunVSdh
         jlaOtYYpWIhzdcZpxRc1wJsRXzpE9NYC70EvoCAKG7qWYhTqGdOd5KF/yTKbKlpNVorc
         vFJ2OjWzTeT4ncbHb8/ALXWujlKvTXdOm0IkTLbpWNLAjXiR5qJYsUVrvcXkuOcSQ+Hf
         lfcy98fKEAKRnu7Q/N2Iq4TP/i4+5t2AMVt42EA4mar67SEh3basdyra4BXeCUuMR4OA
         XA5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0r/DQq9kKvgtGFK1RRnfNPnxjXxwG75lUPMBbAuxTXZQNYKiqhIOQIwmIBzifR0bmkWxefEVTJXvQyHD5@vger.kernel.org
X-Gm-Message-State: AOJu0YxhjiAnY01lPrb4bm/8108qM5UQFqLl/G4rjSspQwYPoBY+Uq89
	qlGRPjx9ZFOLmjZdYBx3A2tYlWbnpw8Ea/FLvOQnXMmawDqCE/sdPY75gfy8WuaLEWXaL83uyS8
	Gzho7SW1+p3uqguLyD4GQPfFf3e7GA6qFbx/6uXrFTNJ3GrWJykQM5GpsjymT9b78Mp9l
X-Gm-Gg: AY/fxX5rB3Nlr2BzYY7kUjIMVvWlXTeDTmjw4077BfWGt2IZ0t53Gi+PtCxgwWOIzqE
	kQHlOFWBGAWNfTerQsmVWkTh9s+u5oup+e3wNVuSA08uB6+NX27Stx94qtEEE/IkFdyh2Me3ki1
	gMybTGHNtVeJ0pQvHyoeYBVUVa3X1yaWekxu9rJMwv36v57nmewBGAIqapp5dAQ6NlTWFiPOE1P
	nmr/1Q1bvBIz2IkVxz9SOZSjubUBDRpOoUp1y7uOLHOQh4QxhX3ns+WdgmnLViBALMbTEqeAf54
	jmDgHT2P5G7Go93IK9WjoJYtWhnvD5Y/ZMWI2Ou2A6zv3WUTDEtCtB0DSpGRsII1sNRFYe3DttC
	VG1o/brNF/pMjGgyfqpi8ZD1sfryUFIzLKSyw5TkAyLQ=
X-Received: by 2002:a05:6a00:4484:b0:7e8:43f5:bd3c with SMTP id d2e1a72fcca58-7ff66d5fe23mr42311656b3a.40.1767610490145;
        Mon, 05 Jan 2026 02:54:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAITuP7fdCdESz0ZEvgIRpDOtfsj9uOLwGoYUIF8cPX5p7VnJeq0LMZkYIVp8Nva6oZtar7Q==
X-Received: by 2002:a05:6a00:4484:b0:7e8:43f5:bd3c with SMTP id d2e1a72fcca58-7ff66d5fe23mr42311636b3a.40.1767610489638;
        Mon, 05 Jan 2026 02:54:49 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f300sm47905161b3a.54.2026.01.05.02.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:54:49 -0800 (PST)
Date: Mon, 5 Jan 2026 16:24:44 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: SMP boot issue during system resume
Message-ID: <e71b9bc5-42c1-4295-998e-4a9d71d84b25@quicinc.com>
References: <dfa19ca7-c4c6-4386-a54d-44d623c8d3ed@quicinc.com>
 <aVfhhXHfFE6lzlzp@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVfhhXHfFE6lzlzp@willie-the-truck>
X-Proofpoint-GUID: 1r_9WvcQoEkeJ6g1JC7ZgIFywgO_mqts
X-Proofpoint-ORIG-GUID: 1r_9WvcQoEkeJ6g1JC7ZgIFywgO_mqts
X-Authority-Analysis: v=2.4 cv=Y8P1cxeN c=1 sm=1 tr=0 ts=695b987b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=JKDgdTFgQULNwJHYBRAA:9
 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA5NSBTYWx0ZWRfX2GYnzjt9gUwk
 zSDzuBao6jZMtBcZEFF+whOFzAVC6WI/jzBrE7xuoaIOGc3gGHMvxrG8mMj1zZqbYHL3d3DzWko
 mOU5Uk1ncd5RwFC0VneJhdT8pKlf0VdhMnf57VkXV2XcZ6J5IPdf/G12xPgmA2/iVW7CoORzcUG
 ef4egbfiwXMUG50sp3lGnui06Xu/rWFqQela3BKK9NG/4UjTS55XIOkAWlzsrQ4Or+vzkpNWxCv
 CMP0/EqkNxvIZeYXk0K3riB6oVNLpRSjnQhapR9cjS2df/oRg29nYLUKrW+uzTRIL0pQSHdHoHI
 LQPClQd5CO2eaMBNIZVRfWx/IeS5Ius584at3B/aVvEJAky6gWnxkIEQP+Ocj8j9gYIgADjKJ6c
 osKisik2aVY7Mlb+jRGxYIjxoObaMIt5ZjafvgMgGixEW/089KDyzRl1OQGoBWz9bDM1FlW8ed5
 PvzvqtDhzlaeDWHbp3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050095

On Fri, Jan 02, 2026 at 03:17:25PM +0000, Will Deacon wrote:
> On Mon, Dec 22, 2025 at 11:30:19AM +0530, Pavan Kondeti wrote:
> > We are seeing a SMP boot issue during system resume when CPUs are brought 
> > online via pm_sleep_enable_secondary_cpus()->thaw_secondary_cpus()->_cpu_up() 
> > on ARM64.
> > 
> > The _cpu_up() sets a global variable
> > 
> > secondary_data.task = idle;
> > 
> > and wait for the secondary CPU to come online. A 5 second timeout is
> > used here. If at all, the secondary CPU comes online after this timeout,
> > we expect it to loop in kernel via __secondary_too_slow(). However, this
> > depends on secondary_data.task value. Since we are bringing all disabled
> > cores, after timeout, we set this global variable to the next CPU idle
> > task and the late secondary CPU thinks the value is its idle task and
> > does not enter __secondary_too_slow().
> > 
> > An earlier attempt [1] to fix similar issue incrased the timout to 5
> > seconds. We could reproduce this issue in Linux guest where vCPU
> > scheduling latency can be higher under heavy load on the host.
> > 
> > I would like to seek your inputs on how we can improve the current
> > situation. We would like to avoid __secondary_too_slow() spin even when
> > the CPU comes late. This is probably not a desired behavior for other cases like 
> > Linux running bare metal or some guests. Having a Kconfig option or
> > kernel param might help here.
> 
> You probably want to use the parallel hotplug machinery (or one of the
> interim steps) for this, as it avoids the global state entirely. I spoke
> about it at KVM forum [1] and I have some old hacks at [2]. I can dust
> those off and post them to the list if you like?

Thanks Will for pointing to your informative talk. I see that your patch
depends on PSCIv0.2 extension to CPU_ON (context argument) [1]. I am not
sure if this suit our immediate needs, but it is good to know that we
have a plan for parallel vCPU hotplug.

I am happy to test if you have any other patches that address /
workaround this problem w/o depending on backend/firmware.

Thanks,
Pavan

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?h=cpu-hotplug&id=6ac1e52f7cdfc2437dbe3ea727bd01df342a0fbc

