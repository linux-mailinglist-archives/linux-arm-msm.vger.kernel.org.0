Return-Path: <linux-arm-msm+bounces-90878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NCVKJsfeWkQvgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 21:27:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C98249A5B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 21:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5352B3003721
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F16636EAA5;
	Tue, 27 Jan 2026 20:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OlEJLz9J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOoLhlz1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AD736D4ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 20:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769545623; cv=none; b=MpKFrYW7RCBG9wgl72diqMzz+9fgZ5Hy4Zm/9rertb1gj4Exub9YR31/P5KjDKwXn1UZF5vPk17SgzHfwFsPkdvzvXEtEmstYfLMYuSZ6kbtL68ubaFpsgCJxXZhVmHs01qPbZ9pN/P+QBhByJYjHeNNGEU2Ho7z73eA0MHR7BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769545623; c=relaxed/simple;
	bh=kBBwiGdSI/w94i3onB5fy1oZpsbMHQ2208C7jqEO1ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQk230j6wgvE5UYDAi9J619R4Y3kGh/jXnk92dM8fS5GZwwtH9tDWHLObP6+7ZuCySIBHA25+b1wcuUKun9bkL/rpcOFYmmA04HEsenpuoILYG9wqZGn6TgnEcv5KWnV60Ln2Xwi0qs9QAB6evAE7MmhFqSh2HBtCjaE5Ci4zoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlEJLz9J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOoLhlz1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RFwwnx1714603
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 20:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R7u/+GzEYAjioDYmkQxOY6xs
	Cw+YDBbFVfBMYmE+PTU=; b=OlEJLz9Jts4JCKDA2sUywDbOlEwV13u5StSD37uO
	3jZ2LqLmnkOlj3tENXxxrto0rqSvazhIxACvFa3vg9Lr0LTfmIGoBSKKWVw7oxiA
	Ygi6pAvHAHWzb6RO4xH6d0S62SdvBx5ZYlidlKngSSWsM9rethdRC2pSYUcDiBTF
	T5FQSQLRcDQhV7oEF8GYAH9Gbn9OVoQhUGC0n7DrBSDA+jXZdZ2uyp0KnpDgA8Sm
	dROwvv75q9PROWNOhczfWpFsK3gmh3eR87eCfuCL8Yc6qCOcag0QIWk8bnEMl7E3
	7ZVSIDQJjUzuMcn7KtzSEzu5NNF2rO7f5YkXeibASpI4Sw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by0g08xj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 20:27:00 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f5256bfd3cso6146263137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769545620; x=1770150420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R7u/+GzEYAjioDYmkQxOY6xsCw+YDBbFVfBMYmE+PTU=;
        b=jOoLhlz17P7K7bmKugG1p3SDTKjE0C4Ity0KfiE06lH36eXjzrx4L5L7l/gFNGfrTE
         Cm+PJ1XmOy/Wdc0+uXq93B6i4hB3J9srSHgDW5kiGx/4FDm5gkiXAKR6YXEYeJlkEPBr
         cCWe8BEL+JeOhLhb1U1Ya7jrO9XHhxE5n+NVqOWhvqdjJasi7iq623Fn7PskAePQRIuH
         MDA1Ccs77pcTfOfN3Dtzq8U2bwWOGGYo6YNXYXPVYOoG2uFlMq+jufbHe7aTUF+PkjCW
         0Ujfb8eoYjGAF+UyXGyPlQshFpUbpeRqbVqtO+v4VuC3fl36dTI0I/A8Fp21y92VtyZS
         6WOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769545620; x=1770150420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7u/+GzEYAjioDYmkQxOY6xsCw+YDBbFVfBMYmE+PTU=;
        b=jEQ7o8IjboSiXn0vp7EJTMMMVW16YjlNBABywNo96loQsFnsCdtIQRciTOrh0QtxRc
         yZhQLNBgGVKlulzbS4c95Lbt8mRaFs10NgcNhPVUI4AU14UD80gLWgO0i37iwlfkyx5V
         GXvjuuLgnYpb3neS0i4ge3lksTUt+GkBuExp0bIPGfxByh7PCE2gJjadwC2Fb8R4v4kH
         ulQOys+IHXdAIeqHCBo3ojyNn4fbz2nBuVotdIL7KbH+qAQQlbY+p32KlNRPoZqOubER
         HuIvS10r7GJkW+A74qAYiO9+HSwOEOapwa4kIXUzY+IU+2Tsz3qoiyo0RmwjTiV2YdVj
         xe3A==
X-Forwarded-Encrypted: i=1; AJvYcCUrgjCXLHgNGN15igfIGPE6Ei5/iHlNCWOgoL5+JljZUbkjIW8BS05+hV+MZnQAop5Q1puPHF8vwA3U2Myo@vger.kernel.org
X-Gm-Message-State: AOJu0YzKrjMGZJNZTesK+L+mJHNyuznycnvEzI6uXIT54wEYIIB6Fkqr
	UlfPLQTPqmjyJnYnbypop0gHLgbVqnNqRMZCiTTibxSNRx206ux4vAEN0BsaDmenVDLxMvK7Z/Z
	Qektk8QlEbcal5appOw59SepPbhj+LeTUv6eLfR5cWc8kSYHbuq9XV45lUh6d1LQZpKKz
X-Gm-Gg: AZuq6aKEiJ6RclHn1gWh6PCJ+776Nnn6YBEfpnp65NTrc9SZ1MLb/FgNG5GaKxStIhg
	y4mJEwKUJ70QxuvPXw3FctadAVd/U/7fCnIx3ih2Jl5thrKmKHMJ4Gwj7U9LT4OS2++Z2W6DIT0
	f4y1otPWwTg3TAJw3W5y/5Bq4LNPYWtlqV+L3fHBdyCFFewCwkJzUpJZj3J3/jTet//sSr1FyWj
	dfMKTk6lPFm2Pr1yl/mKyxz+hJTRZGiF9adxtCcuhJWf7Vi+iZUil3bHX8yErU01dsvbvDis+rP
	QLdLwGsUQApbYZwpKYezBk9fiTgMYsPUweH/F9TaynJZvS58KfH1AfcoqOA3xdTYgEoN3+h4cux
	iDzs25SHJ6JDq4MWSSeuzQMLgnFaqMMgR25kGGeukrvUWOMRf6Alq/dqz/Pah6eKhVW4qMHK1Sn
	EVo0E34HXZ2WfYXfyCgul9MKw=
X-Received: by 2002:a05:6102:290e:b0:5ef:5387:ca85 with SMTP id ada2fe7eead31-5f7237d2386mr962050137.39.1769545619905;
        Tue, 27 Jan 2026 12:26:59 -0800 (PST)
X-Received: by 2002:a05:6102:290e:b0:5ef:5387:ca85 with SMTP id ada2fe7eead31-5f7237d2386mr962042137.39.1769545619368;
        Tue, 27 Jan 2026 12:26:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481b72sm147447e87.11.2026.01.27.12.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 12:26:58 -0800 (PST)
Date: Tue, 27 Jan 2026 22:26:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 05/10] drm/bridge: refactor HDMI InfoFrame callbacks
Message-ID: <6p52srrxddazxiwqfqmjpef7k4bbpzojxqiy57zmhqcpqa2bum@gv555pvqrige>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
 <20260107-limit-infoframes-2-v4-5-213d0d3bd490@oss.qualcomm.com>
 <47619a02-c667-4fd0-afa9-f6cf7aba8dd4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47619a02-c667-4fd0-afa9-f6cf7aba8dd4@sirena.org.uk>
X-Proofpoint-ORIG-GUID: lGC6hEZUkZK0i8OglpSkW9vNREwXjZIT
X-Proofpoint-GUID: lGC6hEZUkZK0i8OglpSkW9vNREwXjZIT
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=69791f94 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QCwxOkPKupwELJ-03vgA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE2NiBTYWx0ZWRfX2HzcdtrPXQJD
 bdqsyD9FwusUr7X1qzG7NLIkHcaxt9Cod/zN1QTXaD0Ha9stfA5DA0EPkejrBeBrT69NHBAowRA
 0AWy5RC1sotLNNHvG1y4gQvg5CiqtWUxXwq8otkFevGZmOn0mCvm20LPFbNnh2DK3y4PnI2vISh
 Tt+26iqpI++nAF8HZJzj2WTKSztFxffxmHJAe0L/svucwbAezJnLe/r0ToDkNS2RvGHtSss6QnL
 2u9wEip4QPWyaU9wRYyCNT2qKGkZETW1Clu55kj/dwvsLRZvr+TI6JWIALsVlIsXYhHxmuPmTxB
 FlWL5JJ+LJFQ2Nn8txvkQEqbqv0dPzEIj8cdQnwBgde+suIlnTXm7V+eYXq4n522mfu1m3n18hz
 wA3G5U+o3jn3x2rKFxi5tD+85BPTxcp2Lr5ZT+K7LKyZ/fGFdPL6bmsoXX4iO44X0rjfncTmQRO
 F+e2UlES1b6kq+w9jGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	TAGGED_FROM(0.00)[bounces-90878-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,raspberrypi.com,igalia.com,sholland.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,nxp.com,pengutronix.de,collabora.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,arm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C98249A5B1
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 07:50:25PM +0000, Mark Brown wrote:
> On Wed, Jan 07, 2026 at 08:15:02PM +0200, Dmitry Baryshkov wrote:
> > Having only a single set of callbacks, hdmi_clear_infoframe and
> > hdmi_write_infoframe, bridge drivers don't have an easy way to signal to
> > the DRM framework, which InfoFrames are actually supported by the
> > hardware and by the driver and which are not. Also, it makes it
> 
> We're seeing oopses on Qualcomm RB5 platforms in -next which bisect to
> this patch.  Looking at the patch I'm not immediately seeing what it
> might be getting wrong, though I do note that the board uses a LT9611

LT9611UXC, yes. Fixed with [1], fix committed to drm-misc-next-fixes.

[1] https://lore.kernel.org/dri-devel/176945413960.1492466.3261759749688865592.b4-ty@oss.qualcomm.com/T/#t

> which is updated by the patch.
> 

-- 
With best wishes
Dmitry

