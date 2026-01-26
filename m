Return-Path: <linux-arm-msm+bounces-90610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE8+J+m5d2lGkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 20:00:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 058288C486
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 20:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F35D83019113
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 19:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62F2268690;
	Mon, 26 Jan 2026 19:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpmTm/e6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gi960qNA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C7320B810
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 19:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454052; cv=none; b=lYXsoXkfvslEx38v3ULCRqTRi+7XysK2gZ0w6XyBzXWXPXOfRFTxVeAW2sViVWoF/gQWAVVOiH1hZlKl7szeGJCTcKnV9q1eg6is812/IghbBCwGGg1XUqhqswvLa1TsIAm+8kPzdfh83jZPF7T5Q170K+ZLvUSvUfaNlxHZIBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454052; c=relaxed/simple;
	bh=alv7oD3Hs+zvmds7ajNwnK2W2ZWvaWeZjwZgZo6fLPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XqOw3rNG3BYN4reHRcjcGASMfNqtXizWW7b8wypzAk2iFM0fSCY9SRkLN7IJFIuj56wQG9Pau1/wz8G9FAe+SnCCZMg138LNZLsJ6b7ELX/+5Jd2DsG1eGaIIBess2AqM2/8Al8EsifRnTMIM905ySl4aXsGa7xLeZ3oyrMEORw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpmTm/e6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gi960qNA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QImK3x037512
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 19:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RqfsakIPHTwBzETcZdpTqje6
	xP/4nMqp2xVshRQ/NMc=; b=lpmTm/e6ix4LNQPm1ErA67hrm5bi0+CXYTgXGVEB
	5F0JLpjpAhOtHSCDG4vdrvqC2JGo3hCvrEr5e8iZ3F9xYh0FL8olLDjrVQF65e6G
	Jz6c8yof4G15xtOR3MjHdtgW678YRnjlvURa1upnTFISVavfQoASqCblKnTtGXk7
	CM+kgUBwOBUVdSilX3vK7TBANL+8OdtuZXecKObrWvfEeMHye2ytT0PANsdqFpf3
	G/BnHS+NdT/I+N3PgV+FfLkKiUCRrcH9g3LwvfMgqxShe8x4RRsXcgAuNqSE3d4c
	oTGRdGsnap2WRIrzi5qf71AfbPBKQ8X9VO3abyLsJLK1AA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdva013t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 19:00:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a289856eso1488135585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 11:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769454050; x=1770058850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RqfsakIPHTwBzETcZdpTqje6xP/4nMqp2xVshRQ/NMc=;
        b=gi960qNAdjFBqp72mhwUXh5OsBxFEuyuRwQNa8ZmEXKpYXY5+jWh/fT8aO7cnnhHL+
         ++ZTZLB+DLIvcl17vvdWKqG/aE1vq/9pUggswxsGD6GtLqdZQzJfpwvnOhMGGFUh0wcj
         83CNehIkhZKUTABLILwCsdsn3mP2SJAFYGF8MbkDvSbeuYpCmRhlhhQwjC+VmEJ3M9Pv
         pI/GjlP9PBzQo07J5hrfG7onZkxf0X65sQiBp0TJmBziHbjpCm0LwpyxTe4sQyTRJtUD
         1hXWN7IRK53cJo2H09sryWQLk7uA3FsZ2E6C1BOXBmhouSJfyp5BR8OE0Uv0ast6m8Q2
         SZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454050; x=1770058850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqfsakIPHTwBzETcZdpTqje6xP/4nMqp2xVshRQ/NMc=;
        b=Rh8hacsMjLO5cb7uAHI651veWkKNnUiVD9T4tv2ONEIgTFF3Y+hdK7hbN+E98+9I8J
         4PCVuT9Uzxl5QKQX3bpiFdBfg4IshAamD1ynCYaoDInYbGGXaJrPcrqj6MQHfiRgh0CM
         dHGU51/ilfo4W95vejVp7FQ+5PT7eLRbr/SOF/A44MjTDYIw+r7RZCzZNvFixprcQSc1
         0VDeWJLhSIcNnFcmWDBVyQpBfibQPRUy+Dq7r+8mO+5H7BuYW7Ve7dCcy+ZbPoKRJlD6
         wfixmpB5r1PhJcD8NZOd16PFNYw6F4YnLQ1v6IFW9mEjpraDg64ROXUyufP9S/TRNssE
         MlpA==
X-Forwarded-Encrypted: i=1; AJvYcCXP9+ggXVdq5CM/v/WqaGfRDAwX/c9gmOutcmuP3AilAJlHCMUJUYxW8jsPs+MhzogO7lwvQy199UcHFZBD@vger.kernel.org
X-Gm-Message-State: AOJu0YwK3dfQfi5JR5Kp+WPMP724GTswJL6ObwiRnACgBbo9D1BsRw7n
	IIeIMIjMVQXXGpaOeXHkpIbdXn+CZPBm+Pa/9UfDjkBTLDOiJGKxuezYmWs/0lTot1oHfWuMUoB
	UXbKKat4lhTz3kzZpnO464i29LnqBOe2xl30zorQTb6huNE0RUhymbBhJlMrgZ8sCeyxb
X-Gm-Gg: AZuq6aLyBJBvpA0LsXvpd5N3Dfb1b8pjKIUvsjdHSP/23iAbWDqPXbVjl0k+2RFlzEM
	D/2tAt5bTez38hDlnqSIO/FnydvXnPDMmBfKZ+4GFrU9Co5Ru/tNiK/J1JJ8K2szC5jsGfb46iS
	SExzvO8FS/Q4Wf21+RUmS4BBS8m679XHM13c3xyURsPcvDqfartq2k5JVRTSfKhHPMsMvl46dfp
	dsYKRL0ilcE9kNwm+L4gxrUHBOEKuTpwVIOd8sMTqiM7m3hFRWVEMm3asR3jBtw9/+mt3L/jlWu
	Y4c7o7X0rGMPZaZ9+WlJRYfWiVWKz9CDNTIUw4rXnOKpoREA3gbTtY0s6RzjlXXR+/uftOG3c4e
	RFo9uZIsClVd26i6rWP5foQTLs01ql2clhqRRLg5G3QSQwwZdbXQwzQTDwCHiouKD1nvS6DfG+U
	ZMV67gnrOo3Ms4Gtu82rAect8=
X-Received: by 2002:a05:620a:28cc:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8c6f98c08bemr619841085a.39.1769454049415;
        Mon, 26 Jan 2026 11:00:49 -0800 (PST)
X-Received: by 2002:a05:620a:28cc:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8c6f98c08bemr619828985a.39.1769454048666;
        Mon, 26 Jan 2026 11:00:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fae764sm30668421fa.8.2026.01.26.11.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:00:47 -0800 (PST)
Date: Mon, 26 Jan 2026 21:00:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
Message-ID: <jiq5ublhbfzuv3qsz3n6bve32wmto5hxc6mxppb2i2wagykafx@d235legi4r5o>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
 <20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
 <5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
 <CGME20260126174455eucas1p1f219202580a1033d3e881adc4f37f206@eucas1p1.samsung.com>
 <36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
X-Proofpoint-ORIG-GUID: mGueKaoePIbR8HyAB-F7_eNqWysZlpgH
X-Proofpoint-GUID: mGueKaoePIbR8HyAB-F7_eNqWysZlpgH
X-Authority-Analysis: v=2.4 cv=I+5ohdgg c=1 sm=1 tr=0 ts=6977b9e2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FNNbUphbDgaJBy-ozdEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE2MSBTYWx0ZWRfX+ABT9NSCuGpW
 /b1y5zO87qqqJ+E8mw5jLYQ7m3UkyoEJM7NmeE0WikXjrAeOybj2IXZh1xhacTWBkSLsKYMaKYB
 KAR+jEuoEI/e/9G0FC4PkrcPfIFfsu1cqg5s3gf/FSDrNaSSuxfUuwGbO6Cc4QTat6r1sMbHTph
 d67dXwI9WoSYbViHYH/j9/ZkZ5HkxLM2glLMtzKb+K7ujM1nABI6XiTJX2n/PpzzPbVvju4wj2E
 YeRHc6lauRcXjSeTyjiR2kezo2VjtBXpGd3BNdkg2ihQBVnJHZI1z9ucYuNyAXJdmjDGswpNDUy
 kam3Nt0exGPEPKKDdeJgUplquOUkvOyRIXPSG/ZtR3YRaZ88g7jl61JGwfcUnpfll8ehhDermiZ
 279ea9A8W+sUxumy+hHnyG/psVlfuNKzM9oXj9UgYw8XeWYXa3PA9m64TzDQJIhUBzezE2Bhxba
 Ep4Ub+cdFr9s9sUvntg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90610-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,raspberrypi.com,igalia.com,sholland.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,nxp.com,pengutronix.de,collabora.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 058288C486
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 06:44:52PM +0100, Marek Szyprowski wrote:
> On 26.01.2026 18:42, Marek Szyprowski wrote:
> > On 07.01.2026 19:14, Dmitry Baryshkov wrote:
> >> Implement the clear_infoframe callback, disabling corresponding
> >> InfoFrame type.
> >>
> >> Acked-by: Maxime Ripard <mripard@kernel.org>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > This patch landed recently in linux-next as commit 3a4ceb89a972 
> > ("drm/vc4: hdmi: implement clear_infoframe"). In my tests I found that 
> > it causes the following regression on Qualcomm RB5 board:
> >
> Please ignore my report, it looks that automated bisecting got a bit 
> confused.

See https://lore.kernel.org/dri-devel/9ebc0582b0f7990d7df992a07ec8ef7f@kernel.org/T/#t

I'm going to push it to drm-misc-next-fixes.

> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

-- 
With best wishes
Dmitry

