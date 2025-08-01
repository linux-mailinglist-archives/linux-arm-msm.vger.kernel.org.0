Return-Path: <linux-arm-msm+bounces-67385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED086B183B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 16:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F6D41C836DC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 14:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5479F267B02;
	Fri,  1 Aug 2025 14:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mv0TcpOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBA226B770
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 14:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754058376; cv=none; b=KLQTVkRxWlJng1hSob6c8OMBu2kUsFFdG4J6VHQzwTVl69nVhkmM9L/4JkFX03JTHVeK3FIPwPPdVtC+Eh58np+ZexH8IaG1W3vRDP4rN+/MC1WxkONhBki5oDZlmpQKL1gb986YeamGfbE5upO3jVUexLhNHSlBaRo8hlGfksI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754058376; c=relaxed/simple;
	bh=7Cf1qA07q7PwBj+lCp1VPG920mv2XnQESOpVI60ySdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxT+o1FFgnTAsETUO/wefnMMbAQx3ucPk9nt3PDFO5597Pa6xxYGpX/H25+G/R+vPl304G9s+7q2JN567qZs7hRIVRS3HAtupcA0JUE9wgWkjK85bS7UBLL3eFFrfPhV3E37YCo6FSeRDpBwk8oG+wAXOup1ZLzhQ/fqjKAh2xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mv0TcpOl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571CLYAZ001961
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 14:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EzvS1jMX5x8+R7F+NrDMwwT/fTPAvaYvo4kcmEWAh8w=; b=Mv0TcpOlW2B6528l
	q1fFdZ1HJ+9on7dRfi5X4/XNaFJsntPIpJbuj0G2513OWO2znFSjc+t6b7uC9o+1
	VgWUXg9WvZZN5zxQjlg0gTcchFScz8cc50Dt+K6fXBUL1DWQe8SaQzTWZTus0YGi
	R1qWeSYfHYHAirPrNlyE6VVp6RxqURJjpo+oKRp/rQI96e9dbpAuX212NleLRLP5
	KXuCWlVaCRpuW7bOfFIIHcqS23A7Ustp4WgBL7ut775P+EUW7F2W4DKjVJkigvXW
	OJMvoAuo1MT8bBv4Kw507RcOT9yjfguAMhUasvajj88LiKLnUvZGs+PziHVdqQCW
	1r5ToA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488wgrraqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 14:26:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-4fd9730dfa2so13191137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 07:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754058372; x=1754663172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EzvS1jMX5x8+R7F+NrDMwwT/fTPAvaYvo4kcmEWAh8w=;
        b=tsq6JNykPPX1RSomVJCbs9cu4hUiNcHUr6ZBkQdPWOBboIE0zf8pibTKMQVXUQlflW
         P88cpxn4LHlQlcyyp5LeEam99uX8JcepU6WuAMvPQE/W+t6WjrN14KDL532V+iPb3IHI
         4pzw1yzb/S7G4sh/Q2rWNHX3YQ/OMlFZ2vrzOGnAfHim+ydTaty+AGOa/kfSjf+P7xZ7
         cAkOx9q+ziFd+Jzy2HDuXwZFQrQqoinzm0K1JiVq2sQp8gwlYpbYtc7nOSD4Yqsyfr62
         g5wHb/bNBAlLtU6NPiyXlW65ELRmpK3oMM4pKGTj6eL1eU0wZ27MN0GstbMVg8+oPrQw
         F2nw==
X-Forwarded-Encrypted: i=1; AJvYcCXcvykOf5Vy3fUddOq+UWBUP93sXm7YtabmfNkvTg3F83DJgSeeKCMcbc6X6sNSu0NoKC37IqP/aN+CIMIN@vger.kernel.org
X-Gm-Message-State: AOJu0YxbtdO3DUlyyKk8dZdtc2R3cym1Jvizec9EBkBHY4TSsBRpixci
	7MRMaSEMFhDafnh/xQwtVFKcg/CCFGFDt5ns0N3UMvzaQLy7ICnrePyny04Je6UObakvKLZ6gKj
	cPLuPZDHeWwYif+qnxgDsI1Haumidz0eaj3DFPurOlsbhAJsFd1xoZzaHaD+Zw6tNV1F/
X-Gm-Gg: ASbGncuQoiIB9yjGme2FmcPY9YDc6+e+CuyixyMVSTxpmCejrOzJ3rhKyQSATypMrYY
	11efv+i0qayd9EtmnEyBhB+cySGqMc89GVh7HdqnSA3NW9VDhi/xXcB9XvlFehXtC4wO6y5Bq4w
	R/lkPA0SvlmBNnG3VWjlPBugKgKJnkLJ+dbSspaPkxo4h2l5MFEhHt5FTTCsradTedkftMlpfYD
	/WY2kg2LQqrFOIMWroPuEw0ZAeqj44vl0zJAFuJnQP5Rjfv0bI/itmzDo9VQzQEFslY3M49t2o6
	iCUGpHkJ32Q85cS7ShXe5L/RkuGW+aI0NhnCdkBecJIF+jbtfrsRwWewjm2hmmMDIIBZ9s2VwRc
	eBS0gh07KaFmJ/Z+3ZMWHKDvLXy9VqPtW1eZaxbxVWeZpUWC6Ho4iwqiLQI3S1kbgr0gr6553F6
	ub9AG+Z1/ZX1s0Z+AqZS0bqA==
X-Received: by 2002:a05:6102:3ca3:b0:4e5:9c06:39d8 with SMTP id ada2fe7eead31-4fbe7eede93mr8246370137.5.1754058372002;
        Fri, 01 Aug 2025 07:26:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtV8DSsj9RYUgiFZC2c162wgAzqi/wUqPBz85jhmoN0PI6WRYnMuJqyzF2EbQRO88PjZQP5g==
X-Received: by 2002:a05:6102:3ca3:b0:4e5:9c06:39d8 with SMTP id ada2fe7eead31-4fbe7eede93mr8246299137.5.1754058371520;
        Fri, 01 Aug 2025 07:26:11 -0700 (PDT)
Received: from ?IPV6:2001:14bb:11f:12ba:7035:8684:db73:a472? (2001-14bb-11f-12ba-7035-8684-db73-a472.rev.dnainternet.fi. [2001:14bb:11f:12ba:7035:8684:db73:a472])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238272f35sm6403761fa.3.2025.08.01.07.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 07:26:10 -0700 (PDT)
Message-ID: <7ea6294d-1958-4586-975b-beb3e5114a4b@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 17:26:08 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm: writeback: drop excess connector initialization
 functions
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-7-824646042f7d@oss.qualcomm.com>
 <b92e89d2-5bd8-4228-872e-6e5ae9b4b054@bootlin.com>
 <DM3PPF208195D8D03E1F9D3E7EB4D07C1D6E326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <DM3PPF208195D8D03E1F9D3E7EB4D07C1D6E326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fs7cZE4f c=1 sm=1 tr=0 ts=688cce85 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=CdbOqKgfPjM6tkZZvDYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: gFYPEV2niRKpck0PILRFGi52AvDqNzor
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwOSBTYWx0ZWRfXyq3/r3/b7kDe
 mDW1FBN0K5iC8OmhPb6McwnubdnIgPuTSjiu+13LtNk84b1hko7LnIEXJBhV7Eueed7Jmuwc0ik
 hIz4tfyCmx1CQHA1v+v9Wu8Gje4XjGqrA8nbzTBwZ1Ww1O/joUVqThDovehrZIJYGfURW0jEKdB
 7R0KtAi5mCx29FOolC/KjVlriCh7hxglIDm+KMbxZ2lYL7w6FCfqGLsPNO5XR1GKN3UIPpLsYgD
 f95w0vCNCEugPD6ZsWaZpcw859lb0B1DUv6NYRQUi2nXncFaNgzBZdYmBCNu0UYmdavVLrBwYkK
 NPj/2zMib8HB3/GUvoYBwXqQv6J9XN/dZw1ZKOtqqtLIUViyQvjgBk366qEOae/Nmeazdx6O/LK
 yaveNlKEYpYMxfAqADb5jOg3cqc0k0gJ4jfQb/9OwHZoE34onV1XxxBWfnvkL+iQ4ZlH9Rhx
X-Proofpoint-ORIG-GUID: gFYPEV2niRKpck0PILRFGi52AvDqNzor
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010109

On 01/08/2025 17:22, Kandpal, Suraj wrote:
>> Subject: Re: [PATCH 7/8] drm: writeback: drop excess connector initialization
>> functions
> 
> This should be drm/writeback

No:

$ git log --oneline --no-merges next/master 
drivers/gpu/drm/drm_writeback.c
fb721b2c35b1 drm: writeback: Fix drm_writeback_connector_cleanup signature
09cba36cc840 drm: Include <linux/export.h>
ddd147d91d50 drm: writeback: Fix kernel doc name
ff3881cc6a58 drm: writeback: Fix use after free in 
drm_writeback_connector_cleanup()
1914ba2b91ea drm: writeback: Create drmm variants for 
drm_writeback_connector initialization
2f3f4a73631b drm: writeback: Add missing cleanup in case of 
initialization failure
135d8fc7af44 drm: writeback: Create an helper for 
drm_writeback_connector initialization
02c50fa60ca5 drm/writeback: remove pointless enable_signaling implementation
720cf96d8fec drm: Drop drm_framebuffer.h from drm_crtc.h
7933aecffa28 drm: introduce drm_writeback_connector_init_with_encoder() API
57b8280a0a41 drm: allow passing possible_crtcs to 
drm_writeback_connector_init()
38d6fd406aaa drm/writeback: don't set fence->ops to default
b1066a123538 drm: Clear the fence pointer when writeback job signaled
0500c04ea14a drm: drop use of drmP.h in drm/*
9d2230dc1351 drm: writeback: Add job prepare and cleanup operations
e482ae9b5fdc drm: writeback: Fix leak of writeback job
97eb9eaeb95b drm: writeback: Cleanup job ownership handling when queuing job
71a5cb3eb758 drm: writeback: Fix doc that says connector should be 
disconnected
cde4c44d8769 drm: drop _mode_ from drm_mode_connector_attach_encoder
73915b2b1f25 drm/writeback: Fix the "overview" section of the doc
b13cc8dd5884 drm: writeback: Add out-fences for writeback connectors
935774cd71fe drm: Add writeback connector type



-- 
With best wishes
Dmitry

