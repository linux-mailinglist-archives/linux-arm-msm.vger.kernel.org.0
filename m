Return-Path: <linux-arm-msm+bounces-82465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E8630C6DB08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 6E05C2EDAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2927F33F390;
	Wed, 19 Nov 2025 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lb6SkCgT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBT/9ZzL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A907D328B6A
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763544029; cv=none; b=R1gnWlAcwJVpzOiZNMFGjGjnu0t8uBAf6zknbNIguqA6o+gO11YNWVBP5/KZOMexbzdE8d3magYGSmJyVlllVJ4oYx92hbYcUdO/WmgARwf3/AJscKy4BAUtXFPx4Cgm0m0jv+Sz9oBYI+RObJiWEFd0aGa/vC2dj7kqqaaON0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763544029; c=relaxed/simple;
	bh=9fJPnNI2m4Mw0YErBLTK/xunUVSnJ8Sguqhqukm3oVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtooqQAZAFOHk7OXjdLp3QnA9uCrIMC2Y2xiwKHdxMpwXXKJLyvxLfYDxTjs2taAoO/2LRvZg6XpCXaE22t7kCzW9DjVAq4s5FtRQ7fQ7Fz2NfrVpw0FmXS9QUqWoJCV/LaTDFXV9AI4liE5stKFlcBzYdhSZRERzjSZXi50TAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lb6SkCgT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBT/9ZzL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7aBRU718634
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0oqujWEyH8f4p+10/5HYloF0
	w0PhJk2k7kxRCmoUJvM=; b=lb6SkCgTzCZF49CVkyhmn3O9IW8BOSOoQh7dumF+
	T4rWEs8ttUJKDLC9MdbGWsv7kapWNLCZlMoVFddeJXh8FUm7LH8JeZThA6Bc8atf
	B84XzMPqgGzabFKC3JCGKxBwWWph2qqtbpLuWWfDnFSfT/trhK2Kpp8Lu1zRbSCh
	iT21P7qjO/1tM47l82uPbfdsYOH/49RDLXFQmFdj8HMy/XvILN/uP60rdfCuF4u2
	5ktdJiCwmQrBLAMzpzT1vu8axFxHI6BrC7hEPtqzuB84cbMdLiuYnJcLpImj1oie
	PEMShc2NWp+xiQaYDF9MinGC4/n1GgM1PdG9xNgbPo+iBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9n0ragn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:20:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1d8f56e24so1794798585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 01:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763544024; x=1764148824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0oqujWEyH8f4p+10/5HYloF0w0PhJk2k7kxRCmoUJvM=;
        b=BBT/9ZzLDVnR8t++xXG0CCW+efVGR+GcVanY/RuVpx1WTIucLzzbKaADXVUpNjmWE3
         7H1ZzTold14RtCJScpntYDxlC4zFSBqaL/uFhwtvlaYo0slKOn2kOn1Alb5VvxXH5NAu
         fmluJaS72I/0v8W54n10N2zJ73iF7RmoNI/7tC3mRFtItrQBbNY/3FQWZ25NXAxJLrlR
         AnzcuAdm8Ov8Fa8/VW9RVXzldJ5k0vgJbiHmhLvqBPE4vr1XF9rMNeeTYnyid3O1R6aR
         UnvroVhjFx9uRgFfFcFFVjHLrblk/2aKf77/uS2zKRMmric1A86VPPkcR03BaisV3QgZ
         5iHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763544024; x=1764148824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0oqujWEyH8f4p+10/5HYloF0w0PhJk2k7kxRCmoUJvM=;
        b=cq9I5UgJZZbqH5tZW/rCD5qIX/51GiV7lcirRPUrECqo9qm36xfYFuji909RvWbTBw
         7BCnpZ7GZpM3yYmf6LmNqI+3M+Q5YjTwi34lW/tQrbaE7C5MGfIG4AHYENpvdOZ+Jkck
         FUGn+J/435s6mnEu/qbq81qpP4KQhVG9Le5ap6hGt7o72vXn/hwXjTEu0lKUud/Pj8T+
         UKB6Ws4gdFbeIPnSYCju3rhv+4REkpu2daeSkMnb1rmtZSAg3eh37nYaY0ufqr6i1zYo
         M2eFPR6EvX+DsL/FCYUSJm9CA2Qn8VTlns1RCOKB2AEBPnaynRUejUxnufUZH8fc0q9s
         AOiA==
X-Forwarded-Encrypted: i=1; AJvYcCWRuPpJDn8wm4XR1+sy4/CocF+N7WdnLSpJ/rWGccI2pv1m9GPCIQBMOvvs6vl1zqmfqJsngecoPjU6xhg5@vger.kernel.org
X-Gm-Message-State: AOJu0YzqSTk0ysjkR1N1du2E5N1GoJlxEALdvFdVehkA7DZjkxDjWWbq
	2ZsI4MO82//aqqy0qKOt3A1gUZNlDt8yYbCsd6G3bjExQg1PgkejqJlVgWV3KLFg6lsR/Gld75O
	NiNvWSa9I4CwgjNKuGZIfehRlna+ZgGIM56pPsqqUqIaiUwjVS/SwhBu5sQ15h/1PTAnu
X-Gm-Gg: ASbGncvg0goGgeePXEpms41ev8KE8IH13SUXUtsJOxwyJ/SoxschrtBwXi4GMgmafAA
	OEICLc8MIgC4hXUKMAAqo6/NYNCSzwQRrTSH91WdbEd8HmVwSHtawuni7/5UusfEzTOw/b4NQSD
	PnZWeOJ7KkIDgPkHUnzDorw8Sjf9m5VPBx5uz8PJVAZISmN+KpfNyXflcFHA81ydmAMT8/O3Mz3
	s9qKPxWkJtuHculdwytR1QLTcjFZwJ/weGL9xyxddjZP9jvL0W9wP1K3a+As+bwiQlYXmnzVh77
	JmqO1mfHVRju51N69mAjQbIxZCFM5kjWqHRgIfFANfTue7BZcZOig5LAu1Iu1r5iW3G3AhedeD4
	bPHr2mw3XzbhnaL1Rup/AXeVzD1gVJ/kF7YV6lvrTrX128tNF92pq9m4ZThhrgXKSKJBFSqtT5s
	QYHYVcsv8kC2oYlXMDhkHmgCE=
X-Received: by 2002:a05:620a:170f:b0:8a1:426a:2cca with SMTP id af79cd13be357-8b2c31c19b4mr2331069485a.41.1763544024380;
        Wed, 19 Nov 2025 01:20:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwau4TOofaMhlSnertNBlaCy1ih9htw4EInhnJfyfk+IyFhhOlEaMeDB1ZwfqAWXI+o957Ow==
X-Received: by 2002:a05:620a:170f:b0:8a1:426a:2cca with SMTP id af79cd13be357-8b2c31c19b4mr2331067585a.41.1763544023975;
        Wed, 19 Nov 2025 01:20:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce1577fsm40665051fa.17.2025.11.19.01.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 01:20:23 -0800 (PST)
Date: Wed, 19 Nov 2025 11:20:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        netdev@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Add Foxconn T99W760
 modem
Message-ID: <p3b2wmi2kzpeywu7pavmve4tw3esfvp5ltuzr7lbbo4jbqc4ow@q432vndbmye6>
References: <20251119084537.34303-1-slark_xiao@163.com>
 <aqhkk6sbsuvx5yoy564sd53blbb3fqcrlidrg3zuk3gsw64w24@hsxi4nj4t7vy>
 <7373f6c5.8783.19a9b62ad62.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7373f6c5.8783.19a9b62ad62.Coremail.slark_xiao@163.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA3MyBTYWx0ZWRfX/elu5oOpi20G
 0pIJSR3SjBv8UTj95t1HTGIiEqT2LINiot9HBsI5/TqQVdjxtoVyEkCmyrMrP2VMrdO057pHqGO
 dxFqoqzThThqMUb6ORjw6l0alI5PAcrGZcJWqvnSxnxDIqwekan1DJRJ4b272+wrG7W8P29EUn9
 Iv+uExmKkAVpkQrea0dQax/Y2fvioHROxZjORpHa7OD63advzjnorJu7BQ/iHvGCPq1Dl0dqB+i
 f6M7ADclzQcJH7fN6YpNJeGZSrs8ezQRmmhE2ExHP74GXPcyBIsWa8oi0m9y3RBIISShWrLEfec
 Xp9yo6UrM9pvcMJWEZ2E96zHsSynSUBrzbm/laBWMbcm6cgkwS9jztPBJv3wLbNttbEnd2zvVu3
 MZ6mWsC8xxiSHb4LStSr0rMbJ/2b4A==
X-Proofpoint-GUID: viTSa4N1r_lq6eppBrrgIkNhF0V3naHC
X-Authority-Analysis: v=2.4 cv=QZlrf8bv c=1 sm=1 tr=0 ts=691d8bd9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Byx-y9mGAAAA:8 a=G7VRq2ROR16SoJa6LKcA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: viTSa4N1r_lq6eppBrrgIkNhF0V3naHC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190073

On Wed, Nov 19, 2025 at 05:12:06PM +0800, Slark Xiao wrote:
> 
> At 2025-11-19 17:05:17, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >On Wed, Nov 19, 2025 at 04:45:37PM +0800, Slark Xiao wrote:
> >> T99W760 modem is based on Qualcomm SDX35 chipset.
> >> It use the same channel settings with Foxconn SDX61.
> >> edl file has been committed to linux-firmware.
> >> 
> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> ---
> >> v2: Add net and MHI maintainer together
> >> ---
> >>  drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
> >>  1 file changed, 13 insertions(+)
> >
> >Note: only 1/2 made it to linux-arm-msm. Is it intentional or was there
> >any kind of an error while sending the patches?
> >
> >-- 
> >With best wishes
> >Dmitry
> Both patches have cc linux-arm-msm@vger.kernel.org.
> And now I can find both patches in:
> patchwork.kernel.org/project/linux-arm-msm/list/

See the thread as archived by lore:

https://lore.kernel.org/linux-arm-msm/aqhkk6sbsuvx5yoy564sd53blbb3fqcrlidrg3zuk3gsw64w24@hsxi4nj4t7vy/T/#t

-- 
With best wishes
Dmitry

