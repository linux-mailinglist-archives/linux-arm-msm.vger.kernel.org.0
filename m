Return-Path: <linux-arm-msm+bounces-59735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52184AC717A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 21:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF92A1BC515A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 19:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E7421ADCB;
	Wed, 28 May 2025 19:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhTYe1pv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066D021CC79
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 19:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748460223; cv=none; b=afARJKOzekZicZ+fHNDfWWUZbe6Vck4z2UaOLJyfu7L7qW1NdA0rI0OLQBGyLA0HyicqN9Fjfc9P2lcRFyGw0OB753Coz813vHD4yesto6tmDxwPpiixF1G7cZLztEdqMMPkfjiwte2zQnZoNDw+vI81GMeQPSga/9yGamJFxbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748460223; c=relaxed/simple;
	bh=YtbJtZ9j42kmjKldmJQf5mvGbou/uTiDwtCn4zRVBzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUgUK+jNPle8fR2ZFqV5Rv1c2uAqMjcPE4KVZ4Gcbou/dmy+/5qQ4mxd2LoOaTaIAqUC9eyvepHDmoxK2Qq0v5iW6/Rb1yGlFbUelLscouKKmQdMARuwXmo10FGUOwyOE4Vkyg6AL01ZCbrvuvyXA5OSKnrgy3lR7CyASsMSwpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhTYe1pv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SIk5Qp020171
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 19:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tGIelMzb7anlOtz8UeqEqZt+
	4i8vYbVYnWcSqbgsCCE=; b=lhTYe1pvmICNCmLlgitNFi8n7jkEBn42BKSOuozy
	gH5q8YtAam5lLMoB0oEU/11m93Iptsqgb59u7tPaTCkLI7YllyONTGKVsOkzZhkQ
	dM6Ort9SaBW6z6lxQFCTxpFlKOsRe+swVpMccrmKVQN/YGJuZF0Yi5YLFbmPVud8
	/MEJ4S+ATaR8SZb11UXlyAfHGjjO5gX6ym06MU2YCs8j3DSXVVkgwFMGhsLpZCvc
	pWEHhYU691ynpJkDlOwmP9lF4XrDDwvMQwLVk8cj07ycyp/CRvsjzQpZ9XqumCL9
	TrhK3XMbNaJzzXu8jw1ljUbSNO73KRJdwCUEesepO1jnww==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqbh7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 19:23:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fac4b26c69so2250426d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 12:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748460217; x=1749065017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGIelMzb7anlOtz8UeqEqZt+4i8vYbVYnWcSqbgsCCE=;
        b=egyo+M9u+4XuUydfpkLDXqYJOMvXo47DRvGzfI97GyRUgTgAIUkRs+lY+LXyZNpEvr
         AGsqgCbP3JFFHe1rue4TFYHfFD+a5JDApQsJOU8uKwpdUftZWhUo/1zIKTSCBm8VRUrm
         z3G0OQ5hj1yarShYCT0sstORYoxV2IyWTpOgMnRl2RYYg7wOaRgL2BfsHFdPmy3QK4T7
         lLxssNa611LUGLjKIADbJKbnsh7ZYH7kj4naE6jfwDHzgj3i4uzlRXQdPojeqc9Onci0
         lBrb+dcT34uSiJlv/EKm4DF+XzS9G/KcN6ZgBUAm1qOZIYTMIrVKi86dJQ7Dl7HZnl0A
         MW3A==
X-Forwarded-Encrypted: i=1; AJvYcCXBSadW788FAWOIsMhP+Bc3NzXzkQLgPUlf85pd8TgX/IU5VEwWQuh18Og/0C15wXeId8y2sLMtYLesoOx0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5EU7/M9tE79oE6P42pKdpyC54zjeIvJ/JMmUJ9xc6UjCxYn2c
	pggEFFqzCDbeaXrT6LJKiVbuQpVqCBUZkArGXlTyMAY/Po6WIebTPcL0KBBk1qs0xceHY0+wbFz
	i669KX48KZCAB98SKW60fVHAzPaNF1yTinYnah0t/zPVAg5wFPBGnRe+5SyvwEg/q6Rpo
X-Gm-Gg: ASbGnctz7TyJ7XzDne5S1yv4X+yIL8GI0zJ6fvA8N77tCgs3RbccLPNtsPDWwrtc1jJ
	g8rnPV4im9UcGX0mopFDhV/UwEHOxDsMdZ96qdXZUtGpd8e+eEgsn9VXLLA6h6lqu2tx06mx4f1
	5/qE5w8y1oXLFCWbONm/VbgGyMgfF/X7YmDHMBEHYpvJ8/DQIzLZdqTwt5HXQkrChHgc2e1shNT
	fgb+QzAGct/2OdtWGUnvfUmMy6GUYbMO/tbVe+GC/Tn5qxAyh8WEGo7GOJJRbPoqpZs+tJeSYob
	K9QevKb/Q9P+PLkSRfTDHtUAYxh37xqDo3ji4x30Jd9N2V3op1Jhyp7Y/nV/C5g+m1vXBTuq5f8
	=
X-Received: by 2002:a05:6214:234e:b0:6f8:b4aa:2a4f with SMTP id 6a1803df08f44-6fa9d00777amr236028056d6.11.1748460217321;
        Wed, 28 May 2025 12:23:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMPfAIcdcaS91SNuuMoIA5lDePhcYw7vO3zvie75YA1Cd8oqTW+ZaMVMUi8YvVPpHABq/2ng==
X-Received: by 2002:a05:6214:234e:b0:6f8:b4aa:2a4f with SMTP id 6a1803df08f44-6fa9d00777amr236027826d6.11.1748460216971;
        Wed, 28 May 2025 12:23:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79eb95e5sm3635891fa.30.2025.05.28.12.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:23:35 -0700 (PDT)
Date: Wed, 28 May 2025 22:23:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: Johannes Berg <johannes@sipsolutions.net>, perex <perex@perex.cz>,
        tiwai <tiwai@suse.com>,
        "kuninori.morimoto.gx" <kuninori.morimoto.gx@renesas.com>,
        lgirdwood <lgirdwood@gmail.com>, broonie <broonie@kernel.org>,
        jbrunet <jbrunet@baylibre.com>,
        "neil.armstrong" <neil.armstrong@linaro.org>,
        khilman <khilman@baylibre.com>,
        "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
        "shengjiu.wang" <shengjiu.wang@gmail.com>,
        "Xiubo.Lee" <Xiubo.Lee@gmail.com>, festevam <festevam@gmail.com>,
        nicoleotsuka <nicoleotsuka@gmail.com>, shawnguo <shawnguo@kernel.org>,
        "s.hauer" <s.hauer@pengutronix.de>,
        "srinivas.kandagatla" <srinivas.kandagatla@linaro.org>,
        linux-sound <linux-sound@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        imx <imx@lists.linux.dev>, kernel <kernel@pengutronix.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <mpj5pvugs6gz3rhjtntshvbwbtmi463zg6jc4tatmvh5uuljhe@44kbv4di2b3s>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
 <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
 <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
X-Proofpoint-GUID: Dya1sFdAst9veSX1W4uHNar3UDmdy1BH
X-Proofpoint-ORIG-GUID: Dya1sFdAst9veSX1W4uHNar3UDmdy1BH
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=683762ba cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=3idkMoHJoOCuPmDIWoEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE2OSBTYWx0ZWRfX8v4GPzN95C8T
 A9tuFlmGZff22I6QTockBzOlD2dJh/rq4vvZbRuntJm1oJXOUazaOZpk7L2aEUdvpZvTnXwU8kr
 pjU8/wEsnnGwjWZq/EX2OWG8Qnfi+TLT076P4oIFj+uPP3WMZ69ezplXY1epUd9Tsbo5DnJ/Fte
 SR9cruvXieOi/lTNNWCQRlo6rG1uvHrPxIxjcanSwNXV9KAKfXJ1VXpxF1oMFXgAzlZrRyURBIh
 NuDrV+rVJhrzLgZn3CMZWSP8Mb9cq7YljiCBfFJgrIfaYqxTNjWDZpMJ2BgsZFEyZahTStRXxD3
 dvVDeWiT+Q3QT3MSr842Ydf7QwifpZfxzILKaFEtfZwZ0gEtV6HhbIcI/PKefZ8JD4Kay9I58CB
 4gdk8VAiqEcOZY5AYUqPZZQL7FZjwSxw6zwbfwHsAHG3eVJnaWGRBTjOcn12DNRvy/Z9gAVK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=434
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280169

On Mon, May 26, 2025 at 04:20:37PM +0800, Ai Chao wrote:
> 
> Hi Johannes:
> > > Hi Johannes:
> > > 
> > > > > "simplifies the code" is no need to callof_node_put() .
> > > > Fair. Except that's not what you _actually_ changed here. Like I said,
> > > > either it's buggy before or after.
> > > > 
> > > In the function i2sbus_probe, it not return a struct device_node, so , I
> > > think function for_each_child_of_node_scoped is better than
> > > for_each_child_of_node.
> > You still haven't explained why it's even correct.
> > 
> > johannes
> 
> The for_each_child_of_node() function is used to iterate over all child
> nodes of a device tree node.
> During each iteration, it retrieves a pointer to the child node via
> of_get_next_child() and automatically increments the node's reference count
> (of_node_get()).

This is not complete story, you missed the second part of it.

> Each call to of_get_next_child() increases the reference count (refcount) of
> the returned child node, ensuring that the node is not freed while in use.
> for_each_child_of_node() increments the child node's reference count in each
> iteration but does not decrement it automatically.
> If of_node_put() is not called manually, the reference count will never
> reach zero, resulting in a memory leak of the node.
> 
> Best regards,
> Ai Chao

-- 
With best wishes
Dmitry

