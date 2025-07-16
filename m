Return-Path: <linux-arm-msm+bounces-65195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B39F0B07238
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 11:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B53EC4E2496
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 09:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81E02F2347;
	Wed, 16 Jul 2025 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K8G5rT3V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2A62EE98E
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752659638; cv=none; b=OJD8g1i4Ou5wXggFLBbxMSP2RLGDgfwMPtRYLIuAdEwyPMVNQpGbK5sEf5xo3/M89te/bVD90N07EeOjo0OsaEhFG5J3Nhfuw0rMbNGIvv7wr8puW7yNqLZ1r/9Wha90krUmlAueD4PTxqWxKPgDXwKjrvKWRnFzNSIXPjMB/fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752659638; c=relaxed/simple;
	bh=IPPey8+CpGab2N5ogg1wT1lI6yYs8EVO5/Z23H9KTs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hv4zoUAQ+IypkI1VYtF1hGYSyA7rAL3dWJIRC8FIHZaOgqPEQMICsd9rq4RD7sVszjfWzOUFAhdG20Oj5RfsZ2bJZLQoxCW9C3eHySFBSGDlKYEwgH/peBp2t/rUz6kmMhIN+m5uKfFlbwGQASeXosmbMcTVs6xsB13Cywpm1/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K8G5rT3V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G61Hjd024486
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BrRuWIrtJJsRpQld/wY76CeJGwT/OepkhOwph9UVdAc=; b=K8G5rT3VZqEf1Xsz
	L2slA5Scj2znACUJCnn1os3ea0JrtuofpHDS1HGmWV762DG14K0RBeW0OpHrlJG4
	/8zB7xOEFC6ER+rGOYjiFJX1NF5GTwCBe3ckDzwMxd7d2uiuXZ2ESduVj+NGZPsc
	kZygABe/78Kk3d3e1lkcIu+HLNpZhjcd9dsipjdP1HzyFGZsKk0AEjyhm9GvynDi
	zhK4bW6VQsRF350uyZ3MrOasq9Do3YON2XMkEd+7PHGRFxxoo+Do70eqbGyfjZ5e
	jIbooR/RsXlpQ+KkKhdFNJhuY2oY2PfGj7cjNoR1QUuOCoeLCESnryhNi31gfmTH
	DdbZtQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpebe3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:53:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f539358795so17536266d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 02:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752659634; x=1753264434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BrRuWIrtJJsRpQld/wY76CeJGwT/OepkhOwph9UVdAc=;
        b=vff3H4oW91FnnNRlEhJh4bIQtg2Y7TAXWGRbWiZ2hIiItSKNceQr/zYHqX87mMk0Mh
         SeAiQHx6GNzlIS4SXK+VvU0/lAKRUetrUR46x33Qxwh4KEaJBJM4ZHkvAegKCIOGSASE
         40YCzB74VULp5cq5qdOiAGdsKm+tKUVoivGHZuzI4d4hzwu7ui5MBLOeIj8aLhuayraT
         zLiZJKuZZk6wUTPMb6xyvOKKl6S5szW2eINe38ufb+5pKZARPFT8NK8DQikqGxWGlD0u
         2K+c+GecH7JvZqdmS5CY8jRPAzH4QRkt4PXuO8S2Jxn8O0KslBAd/J6QDLaQzn8EVmxW
         dwtg==
X-Gm-Message-State: AOJu0YxvqeFIJllUYPmNlP2bFNeMlm+JiZkgcSvKVpyrG/o3YfrYQpQR
	jSrpB3p92mBdHln9Yo8KVqHPvezGFR6oSwBEe6j/e6rUXWK979xTkIPDNOjS6GSMPuMD7MfKqQ7
	x8J7KkknClLfkW/98SD6pBl13FV8xzunC6il4xxEH0HOpIuP5Hs8/ZOIi+dysAq6eRSbiS+XoIv
	YS
X-Gm-Gg: ASbGncuoqnZPShfOtFkC7RgE8NgMm7M4d6qIHL0Z0lLDUpntbkGrag9IrZv7afc9MNy
	3FBUms9kXHEhZrJJb24eASajIHNERjcp3rybVZlaRJXbkymILEyvsMExC8460aFneIizNRS9aan
	yZ/szYJ37dp3gbRz+RLkpRkMHbY+yZd9UTd7w4HADNLriQxewz0NWVVZ+Mg+ecN6oA1vxJKQfHw
	gZ7xiAOJnMp2Unp10/UsGenltgtlNbAXkA4kXHIgVU7cMPKwejr/8aSGmi0YIFfuXYDe1nURA7/
	unUUasn6fQ9f8rSFjwWthFcvpLBcZUrdOEh8MhZI91G3J6bQGTScm6pbjIdRA6CIkdo9Xxc5xlt
	1Zg8h+QO08ouSSRcBhTVo
X-Received: by 2002:a05:620a:2949:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7e342b5cf66mr131697285a.12.1752659634393;
        Wed, 16 Jul 2025 02:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkLEZzcnbHfPM3SUr928KwExQhJl+kNQoZGqThwXwhpNJlenla0nHYpg95UHWVYUVk0gHrQw==
X-Received: by 2002:a05:620a:2949:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7e342b5cf66mr131695185a.12.1752659633784;
        Wed, 16 Jul 2025 02:53:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82669cfsm1147729066b.83.2025.07.16.02.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 02:53:53 -0700 (PDT)
Message-ID: <273b7fd1-2554-4466-baeb-792fd7967209@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 11:53:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: correct dpu_plane_virtual_atomic_check()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20250715-msm-fix-virt-atomic-check-v1-1-9bab02c9f952@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250715-msm-fix-virt-atomic-check-v1-1-9bab02c9f952@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA4NyBTYWx0ZWRfX/iX06o0pooKN
 7/Dl15H1RbqZf+yKSB/IeBfckvQRkhKTqpOPn7FCsqEW2lRfVd9XxjH1YyHTDuhW+2yh2P1Mz//
 to2pndR4sZfnS8s4x3uIuYcew8wvgPTU03Gq8faRGCIgGlAuHEWX2qJ3W+2gF8YLjM2e+nNVxwP
 /QirvLtrp1PeL9N4q9BqFTwruq+YzzoiktGUltasVI7Fdifkv4nqiddOMeh/mnrDJ1rt0OL/aiv
 8bBhCAzlUbQs8sACSZg5iftGueQGTGNK4IPAMX99ODhOTYCM4i1okf5xwOThetm85KFRB5loagj
 2nBUjJwRK/623oGUhQUU4JmsFEe1CRVRFRkBandcNbHX11XRlqvozrVf5Lhevq8eyKgu8JMIInU
 uQuA9+x5/+uvts8NGqFF0KLayRyQyhknFGSDXCHwlHOWO9V0cDdJgMPEUvkWeUxSKMXRChPp
X-Proofpoint-GUID: pi2pcNV7h8BPe1oN4BokRKJLjs_m9wU_
X-Proofpoint-ORIG-GUID: pi2pcNV7h8BPe1oN4BokRKJLjs_m9wU_
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=687776b4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=GHZGt2_Oay3Cuwp2bz4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=532 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160087

On 7/15/25 7:28 PM, Dmitry Baryshkov wrote:
> Fix c&p error in dpu_plane_virtual_atomic_check(), compare CRTC width
> too, in addition to CRTC height.
> 
> Fixes: 8c62a31607f6 ("drm/msm/dpu: allow using two SSPP blocks for a single plane")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507150432.U0cALR6W-lkp@intel.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

