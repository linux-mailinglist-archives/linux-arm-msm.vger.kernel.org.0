Return-Path: <linux-arm-msm+bounces-64792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5311AB03B5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 11:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E84A7A877E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 09:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652C1242D86;
	Mon, 14 Jul 2025 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3B50jnC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30062417F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752486680; cv=none; b=EUJo7DPlTB87NIaDwPUoz0F/ZF8D4NW3osL6UkZI5hsuH5OSbubM4pBtL6YJC9cDp5S9kWQRZJlTRBX0yk7uIm6h+r7SgV9iQmdvO721G4PUdRfFaendy67VpM9U1DNp9ebiMMlwdlgncLofHX1JnKTV9MQ7+k4cU8qDJ5uYb48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752486680; c=relaxed/simple;
	bh=eCL4qmLWWL/3BTkqkRoJIFUw/Ktyc5F3Dazz+04Rh6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pg0KY/Dp+BEAAo4N1gQ5jXp1MAb2AfHSeRdWi9vJvTCDeGDew5ytqGhrvZblV1qMXjA0KX03j9pgrWN3QMTg2jiXePR4mTksKxlkSYjXC5Ycst4kgCh0JmIL/jF8xgYoIgt9Zdc4+b9ytGiljobVRdFTguvbICkrBP25F5ITigE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3B50jnC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DNBqMe016114
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 09:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zDAy+8JMXnCcqEc5qlHAUScV
	Nrras9+1OoX2usFWe5A=; b=H3B50jnCqK8QLLJLJVMXL6ZuFgcTTQX1Fi8K50w2
	azX3au9Qgv8MnqYGs6H367PGBzIVsbppwVjCy70j/thcmif5S3YHFHJMu5jikwWl
	wYuLBgFxnnxQ7rBAT5wekaDhGOyHDnximS4OJPDDlFKNyeWAamHWl3nWisHvHwGr
	i/lzIIr8EGqhb3sxmwtHK3yiMZt7FEmpvj1310xZ7WYQ0Ac80xy97oPvZp7ijTZT
	uc7neMDNg0iuqwBRWmbg8OYFBkqYma8gaZcOLFS/iiUwk+6PxSwFbT6G/1nBq2aw
	OuEr9Rxa4ID+YXYd370CiuGy/0wdhxvgZCC2OVQnxcts/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugfhc3vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 09:51:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e1ac3176ceso232983385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 02:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486677; x=1753091477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDAy+8JMXnCcqEc5qlHAUScVNrras9+1OoX2usFWe5A=;
        b=QzFUwEJHongkY4qoOXNtjwYkin8q9cBZFq2mn3FqmT6D/YFpTFC08i+UeJ2q3obfKK
         KJDZXdpa2TvordJfyF8b+QNzSvsHOz9/ltyTsOK/IelzbN5yOQ9HFUco/3liag/9BR38
         ZXG3NghEobalACmmm2nw0xCsuOi+rinXKMHgTYu81LD/h23TfKjhJXwVNqNHxA8AQTqd
         +d1iBAKLmQTEg/UtduZ92TPh0kGKKpFHNuzE/sP1ekI6oA0cLzKjoY79OzAg4ustfdst
         VKYpfIW88O/eN26XCIfdTAAO4J4es51KFzRl5s7fQuTvqRI1+FUp6JsanwRM2DAKa6iK
         WApg==
X-Forwarded-Encrypted: i=1; AJvYcCW30PQ3UH0YwD1LjtyEnJVGFmJCKHkS5e6NRYr+ppp/XJ8lMSb8IN3baynAE99X08ZvH0D95keQ/u1l0VBr@vger.kernel.org
X-Gm-Message-State: AOJu0YzTbsc5IIswDxEPz+OT3Lb9PXpVkwGpKfmBUTnfZlTfetUyetXO
	FE6z0NoVeXw4c76Ful61ul1mw+tIAU0PBxhQkLRWOjxzdxmkFXmy0ldl3HQea9b8efNgQijopSo
	mTEVthSW8wf23brLM2ZH7X48rsHLFpgxvLTF5tx31l4O2hiIc5hwF3xmLLSLOLEfWK0/f
X-Gm-Gg: ASbGncs7DakRs85dqzVktf67ITNJWSu94IXwzRT4sxqGZFGKVlnNyLRd4p/LQ4pBKhP
	6I8LCpNfH+JGol3bYLEU/DrV9L+rc9YBEQ44ltD4iU8NJmn86w7Gh2+4nMB/Yd1I2wrF6sO/lq6
	41XzBL+rcUnA8cVyLlSeRWM8KVhE6JjhR7j9OQJdZho1mcIPHSIvnXlVEil2FPmz5ozJbKl0bkP
	1uZa5XN3qhf7WhrEzv9sLKSUD6VZQjeWfwnbo+2KQ9Hp6GQPU3yZaqRBNDjKAxXE/9TJQyueNId
	LTnpPqja6trg3+xOt8vjwMbhgl56yPW/DD2SvrZl7dA6fHAAIEepcWWJGpNm4lsKFUQWFj9uBPD
	u2yNbn73Ur+VOkMtfgEaEmvSN6UoNAiDzrXIZtPXEPSXB/584ylmp
X-Received: by 2002:a05:620a:284e:b0:7e2:971e:2d4 with SMTP id af79cd13be357-7e2971e054emr438467385a.52.1752486676761;
        Mon, 14 Jul 2025 02:51:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHthfPAqTZotjtRDXjX6wM2Y7J98pizOgCzVKNQFLOI4EXwa/DmQvYD7qXZd4s2ubpszugA7Q==
X-Received: by 2002:a05:620a:284e:b0:7e2:971e:2d4 with SMTP id af79cd13be357-7e2971e054emr438464585a.52.1752486676122;
        Mon, 14 Jul 2025 02:51:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b6077bsm1892665e87.152.2025.07.14.02.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:51:15 -0700 (PDT)
Date: Mon, 14 Jul 2025 12:51:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v7 3/4] misc: fastrpc: Cleanup the domain names
Message-ID: <ocmh535z7oaew6wkyeukadwlu5ublwixfbl6ljxtbdtwn7om5l@jeysqqphcm2w>
References: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
 <20250714054133.3769967-4-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714054133.3769967-4-quic_lxu5@quicinc.com>
X-Proofpoint-ORIG-GUID: Chpws_98MCJuMFCoEZY4nxN8fqcqqq_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA1NyBTYWx0ZWRfX+/SONHeCyYDc
 1KxCmXoe6/BOJDfMMBhr0GM6AEvMiv0Idu0pX0aEoFRAR0gvDMAchNmGhGxHwZt6aSJPQwDt6xO
 qoS3kfoIlcPPivW+WucvvZFZkprP4jkfbj+i9+V1KFd16DyaXekaBm9EFIejETNdpSW0jaC0R6p
 Oo3zizEBC25vt4htH/e3AU0BurnNi9HppU3KbPxhB9tmRhmNivCTsqFd7T0bwV9u6gonNFtfLMS
 YxYMQfN/8djWfMw1q8wGreTvh0juz8toMJeMbwDyi+B0Wg5jPC0fTf142i+GIUY+Hr39e56IVvG
 UTuPN83wNvf2o9wk9Nb1ERDoKgLLFKFtWuBEL7UG0zZcR3VTc11Hlgany0CVflEMYLAMNWptoTW
 Cc/ZSh6THOVOwOM8jwdZ1ooHM8+dlVOfQdWOsIJsd0maHGNS77bINku/PriN+eD6dCTTe96w
X-Proofpoint-GUID: Chpws_98MCJuMFCoEZY4nxN8fqcqqq_a
X-Authority-Analysis: v=2.4 cv=HYkUTjE8 c=1 sm=1 tr=0 ts=6874d316 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=YNof3K1rMo2TS1Uk_EMA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140057

On Mon, Jul 14, 2025 at 11:11:32AM +0530, Ling Xu wrote:
> Currently the domain ids are added for each instance of domains, this is
> totally not scalable approach. Clean this mess and create domain ids for
> only domains not its instances.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 50 ++++++++++++++++---------------------
>  include/uapi/misc/fastrpc.h |  2 +-
>  2 files changed, 22 insertions(+), 30 deletions(-)

Please separate uAPI+fastrpc_get_dsp_info() changes to a separate patch.

-- 
With best wishes
Dmitry

