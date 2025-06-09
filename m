Return-Path: <linux-arm-msm+bounces-60654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFAFAD213D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 16:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F89B3A3F45
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0666A1EB5B;
	Mon,  9 Jun 2025 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="diua22Nr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834518F40
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749480348; cv=none; b=OhJMTA8lss2TZHt+Eo3oDHJQKumyek1Vt4axqfdboFqpf9kkC3jujxwBhmlnZuKF+s7Ow2L1urCi/+MYVC2kFJLeF5mdwaTgOOHI+8UDkrrEOW+HbnIkur9pLm/OBK8iU6T0PtDnZ+iR/wN86R554F+i7OrEmNrwZ30cRW+vieQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749480348; c=relaxed/simple;
	bh=i1NyMD39k9DlJtgfivY6zSvL9uXLZMIxx+VNY1NgDEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgiFckzhQ3U26e4aaj4Zl1anEvpbbnlJLsKWPaMZ4Io3YnPmqHHWvngQq4xxXFaUY6UB980gFSHD6KY0G4kc9d5hv0jD5TQARl1InIJZPdw7r/VOjq6YdylbBdjib22zsDamObqCbFr3B9y0mzYvEt9z31ayySkt5DC1H5S5PHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=diua22Nr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599RBEF006381
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 14:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NBT6vmPj+KP/UP2fTnvuSaVe
	UdJIIkjYpa/Jy0VgFCY=; b=diua22Nrrjz2KtZChNi3CJHaoZfxHmKMpnF2/8ac
	6Rw6LhOiZVXiF/TSccUgnd+psfzrBGQbNoNcgoHQRClthbOfTZxU6uvHmZz8rSJ9
	S/37AYyD+P5ek5YVCw6K2UlOVIOS1UXWFYpnqFI4JKa+3Ntoiv9NS4wmW7g1N1kC
	wcQ1ZQFv7ShlfzRhhAL3ycdOJSZfYrkCcvLEOR6liAoNl2c8+DOtkOTs1+rJWTXb
	gNVyWXs2WRvYEekh+J9DDYAvsD1E7JGAo8kVJw81IdTdOuBR8P7xhmqXNM96hMID
	ufegKKs28t7faSitGANf6SQy9Fb8+vSM1Mpk6LonITL1Hw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6je5dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 14:45:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097fd7b32so1078513785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 07:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749480345; x=1750085145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBT6vmPj+KP/UP2fTnvuSaVeUdJIIkjYpa/Jy0VgFCY=;
        b=UHA9DPEOKQTCpVLh025krCxNzeAFxRP3AXrU5qAhzYeWqYUjpHzegsMYVOwwVe4WHb
         OG827rsPI0JNJop1oRY79BHLCdcL2i9XWV8ijI3Wu7FNit/rg2E/3KKNUPNwVbtobkaX
         i62nozBrkKUAiRUqnI40/24hAUGDX8S1XgTN6AEH9w7A7tf1zITyPENu+5ai35N1j13f
         +yrrn0eA90YIEJB8qG7U442BE2TTTMd2A+psg5TwVD93L5MXOt9bcQCUwRgOJK9iPIAN
         xzHWSgpFFXc7OlWXwlcMTdHOMSBkkNxA+CREugwu3D4JSVXplQxKOz7VtzBMUOR1k+Hp
         84Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXMPZ8HbfDbWJ5KiBXB54yRq3sDi0CuKlwpXct06QN3OGIGzYrKCXjcXtBG/VlWIdsfGq0VRQO3T0KmRuH2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4vZOQlxzjryEmCZpmhL+D1eguGGk+O99lKfcFi/m90WdeWHJl
	MlVdf/rIjvH+hJprGKOQJjG2SQrikMXF0v9fTrqNbXjm4vvOurLYQbTSwcFMiY0TjvO8KTo/PeV
	s0v+f1Ph0jCR+Is8sCJiC9hxFDh2qW8Up+oqiYR4zbYKu+KL3EQkmnlEoUcxOTGY1UGXB
X-Gm-Gg: ASbGncv/YjH+k8mwffG3vwHER9Ct3LFE1dsmNb6I2dOtdYm5Zcs5bUZwtEfvB6Afslj
	hJcK30Zv6oROauDy7XoApXMOhsaQcF63jiuIQVOC8NCpWMGMap3YWSU2WY64BvvbtVMDWzmCKsQ
	ccmsPiICi9i+QQAqRn4k2xQs0bKw7FuDfL3iZkB6yMzdvf7xfEBKcmy4MZJQdSKueOeFKYu5ip9
	6/vDx0mJTJIjQKyCltmDlCe+BNp6nFsBhOYRRUmY9a28SUrYoxYv3KykyG4lcx9MKhXjIg/+QMy
	5idYF8SqH6xB+B2FxNlCOJz9aEP6nxVWIE2bNm+v2MKfYaJung3y6BqMK5DopWKT5T33YrUyDLo
	=
X-Received: by 2002:a05:620a:1921:b0:7d0:98a1:7aba with SMTP id af79cd13be357-7d22987fa6emr1692497885a.17.1749480345315;
        Mon, 09 Jun 2025 07:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGd4u+n8gacssqQ0c7Zyx/dCkKu8dSHgSYT8DFdFzuA7K5Hkq7N50B9znPiIOhz5RFhpAO/w==
X-Received: by 2002:a05:620a:1921:b0:7d0:98a1:7aba with SMTP id af79cd13be357-7d22987fa6emr1692494085a.17.1749480344848;
        Mon, 09 Jun 2025 07:45:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d7796sm1188959e87.81.2025.06.09.07.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:45:44 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:45:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 37/38] drm/msm/dp: fix the intf_type of MST interfaces
Message-ID: <kbpq6edonoorgukf5mybnvz4sm7aiefqhogp7k5cmyhy454wii@bk3nw7ivssjx>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=6846f39a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=mIDvE2fUgOR8az-e3JcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NqB7lfRa7pPFOK7D8q1TuqAebXyelGBd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOCBTYWx0ZWRfX5gxZHQkOp3Zz
 l2fOCZ1gUpyoJwT4o0eKVNcQ1knIYM6z5+TVp4UXViITmNocxlzzLVoTlRqg+bJQVA3CPTPU7IX
 hH0Muma8VtKQyAblnnryoZWJehQtliq5zGZ2HvbyIiHKpxCi4E/oPaVuR9chmuHN3XHy4V2t/AT
 8G1xxvpECOnGZ/Dt2etjjLP9IVRyL7eqRYQv/glQbg3lSVS3ibdpXXkQPXnQpgGyLqKKeuTVjCf
 pQbJug2FAcw2Qhqz8ytnQMlkJANJkKAqII2BN2+Qot5JCcesBWAu+LhvPV0p9qK7YsWwJDdF07E
 bRUxCbuOB88nslMO0Usn+84S+Q0G0klyh+1GUz9n6RG5laV/5p8r+9234LSWPLtnh8ntqw3K4eQ
 M/jQ2DT9CIDj+41fNpqCYPn/OuqcHeLhic/eKHDDVHaOfTMoWUYOexJblX+k7FaNhhyBdb6L
X-Proofpoint-GUID: NqB7lfRa7pPFOK7D8q1TuqAebXyelGBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=793
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090108

On Mon, Jun 09, 2025 at 08:21:56PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Interface type of MST interfaces is currently INTF_NONE.
> Fix this to INTF_DP.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Please fix through the whole catalog rather than just touching one
machine.

Also, wrong subject. This is not a DP patch. Please fix subjects for all
your patches.

-- 
With best wishes
Dmitry

