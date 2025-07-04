Return-Path: <linux-arm-msm+bounces-63711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E07CEAF9540
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46D6E1C420B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 14:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196AF17B418;
	Fri,  4 Jul 2025 14:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSt9JMbd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40F01552E0
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638698; cv=none; b=VsPrY0nVNBcziTfdsSbXTW7UbH2N/ET5DvftTNQg06+FieirCv2b8uU9IozTrKGfLGBqsnBWaPOpyaqV60oWcom7CkFg/O9XHm7lliMeBcUKL+BLx1jvlurKFhK+nlsmswZO73oga+35P18zth0kRO5LIiGMS++39czfKg5K7Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638698; c=relaxed/simple;
	bh=7Khl+Tc2okM9Yl7n5jd72UL+nmmwtHnAzlrm+YmIZFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxH2r39YuQULgDqScj7O/1U5NVudUkTSrL+w5Mw7mPUAEpnWkL3TmnjjAZT4+zJtKn2DCUhbhkF/jMPT6ENHfeta28sh/xVMXFx5S1Qv705kGgyUeNa5JL/4tr7YbGscPRTH6tCbbkqpMkUuaINZEB3x2+CyCOJXZ+GpFW5/clA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSt9JMbd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564CqqHH010432
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 14:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GBBzmHljWXgoTLIZWSViaVzM
	iA3PILweDxY7boLYrzI=; b=bSt9JMbdcDrVUARY0tqf+hwxdl+8IL3meMTSMAfj
	d2Xdo81IhelAIgOErpvRgOkU/uBOA1Q8LPq30+ohYlA6/qs8vROKVhNWerPKm2ds
	gt2uRFFFyxxDqH3ZtEK4rorDDjpVdMcNU5/pq5I2wtHZyNg7ct0F7b14Xn6M5sXb
	haR5WHx6cSr2pmpU7CA9I68ISr+WHS2cxBU2aYydto+zAP+ZCu0njCIwz+MpinBN
	DyVKilQgS66pA7sTiTpBq4SXWjFkEzlpe/JnpQhfYM3ciBrTOeHYq3ZhpasyuFRk
	0vuQktiy94Uc7ukA6DqZT6Ow5IxSAjKPS7yBzFiFURBhBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30havu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 14:18:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d22790afd2so131181485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 07:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638694; x=1752243494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBBzmHljWXgoTLIZWSViaVzMiA3PILweDxY7boLYrzI=;
        b=UQIuZGVldrQwbDlpfhVBP+9Osb0395HrESzGWHZI/N+nB6SvCZ5ZYIq5A5vgjkHVxG
         yV4tUghRSTGYzidoxy4CBWdEexeGiY2CxAOEvEEO8K8fOip5sp8BYASBGUQoyUOwn81s
         sHZdgZXLNYn2+NAysVqvqbQqx6KDQzVMNNGMIT9EESJNR1+CIxH8rNnpmW+QuX6D0sZz
         ksJp2U2zrlMn1D1Pxpq6krD+xvwIkzB7Igp9NQ0Vw/myWR6JG+bRyWSdaehIhLazti0X
         tWtxyhZiWTqfuSaLalYApqf1NQW+/xtqk0AJVP0SRuN5aqRn7/xypSMP6HTivw0c1QDR
         z+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCW6U95DxSDK2+dY5CoOOOcwdp2UyFNIBHcygDXrHe9a0hygMiFgnlIdfCFb7niWv/pPKaoud7lgdLibmFAv@vger.kernel.org
X-Gm-Message-State: AOJu0YwJah7ILJPgTw9mV77juL4jovstWY+hZTSJaO+cyzwWc6b44Mzc
	CkRPQUIL9aDa7kiGbDjt/v88sSmcMdXvawAV6ls5U8PeB+YXfU4CbVA3unHIGqdvYPmnH9/asYk
	jcKH3sjr0aPqLw1GRCAgazAsUJK9H3ZYwqs4h6c0bZtv+qfHmoVVtpaXuPoC5PMTSummq
X-Gm-Gg: ASbGncvFh5JdMVidJmvkqsebk4/9jups6EMwk08Ir/lLlNuI7J4OJ0/Oi7BwLTyYjJt
	s1gPTpfb5fraodoHldkwwbKhI7e/GHfyUrO9UWU1KhigDzdC4EKvZF0mhGII5rK6rPiQNJIYD32
	Nti2UyoTpEWjQWM5pRnJK6KnNfxT2CQP2ry2PHJzmxUcUDwzUCmcwvm4USC3le74WxkDLbvP/06
	T4wygS/BpQuEVS3MIGKYaOYuAQTabSVJBiaAd/lXSB5aNaKj9tCCo8kEAEjwxyMCIhCRc8pzsx2
	siNKP0n0g63jvs3vjRCKgtJgwhAOe1Fvj3dHmMbyL/zCYhOMTys64nqKFFi39uQA0IRyMw2moqU
	k/FuC8FNgxqw4x6TnTRs2OPKdvEzQkHW3Zks=
X-Received: by 2002:a05:620a:4403:b0:7d4:2515:6aa8 with SMTP id af79cd13be357-7d5dcd248c2mr370970685a.43.1751638694140;
        Fri, 04 Jul 2025 07:18:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLHIXjNSFpNrcbwpOUhUE81GvbckTMere4MIy6Edcq4yoBKqpL5QpPb0hH2I887hahpywyeA==
X-Received: by 2002:a05:620a:4403:b0:7d4:2515:6aa8 with SMTP id af79cd13be357-7d5dcd248c2mr370965285a.43.1751638693499;
        Fri, 04 Jul 2025 07:18:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384cc5c5sm261767e87.241.2025.07.04.07.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:18:12 -0700 (PDT)
Date: Fri, 4 Jul 2025 17:18:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] soundwire: bus: add sdw_slave_get_current_bank
 helper
Message-ID: <jl2i62jhzfetyy3tc4lmo5cdvjn5xakawyhja3tpwyu4z3ksov@k7ahrflfmvqi>
References: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250704121218.1225806-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704121218.1225806-3-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=6867e2a7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=hef_X4T0R7yqAl_WHRIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: DJfuQjcMQgLX9iEgcmP5Yhx5dxvQmFRr
X-Proofpoint-GUID: DJfuQjcMQgLX9iEgcmP5Yhx5dxvQmFRr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEwOCBTYWx0ZWRfXya7JN5+M0/tN
 RoDEM/aZ1U83cm62/hYNro8WD7ib2Jvkq3P4SYctjG9Xy8XJjXSMpcwviSWM6lFrxIJlgg3Aox2
 nQdyCb7iDNNolh3FNNDBQKfj48ZtkXJZjVbpHjh212VMjwkUkSK0urL6f7dCWPROzUm0fAWHE9K
 b3hfRdiAmNF+mIKebN1yjR3mpxuApEoswGR+sj4CgqbxyjBxmXcoVRnJjPsCbBt8vFixuK0T5UU
 bvaMMxwGSNTdBDGoZqSRiCvCQZL7YBEtRDHtOl/79gR8TDpsjQ4vD+laHbAZbAbb/nNsSxHMHAE
 9aQR41CLz82Tt6I5k19k9zk/j4o5EJtqvnmvsHhSHURbmGD15M/eg25JqIiTixNJjUYdysVErob
 AHHduSUKtrW0wjPRGlV0VJbLiInm9HCWIC2rTvGGKxvLCoV09WQB8PJOGKmE+SlG8wmKfs6w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_05,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=672 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040108

On Fri, Jul 04, 2025 at 01:12:16PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> There has been 2 instances of this helper in codec drivers,
> it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper sdw_get_current_bank() for codec drivers to use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soundwire/bus.c       | 12 ++++++++++++
>  include/linux/soundwire/sdw.h |  8 ++++++++
>  2 files changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

