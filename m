Return-Path: <linux-arm-msm+bounces-89622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4AED3A6B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 086DB3008DDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD773101DB;
	Mon, 19 Jan 2026 11:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cK9FqWXf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KmRMRTWZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB17330E0F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768821832; cv=none; b=PoIYo/ivWMcUpw+m9/CMOn1q74lqH5xfmF5pQiabhmW23a5f2aB/qXnlg5imQK44gtOSODfTKyLGu2YBXK1L0BtpfmdblH+FaPX7ttGncfNcseD3Rkm+8eUqmG6nNdg5QD31hKDLzIh+aHk9Xg2DN+/vP3vP9uIVbH/Ia9Fa6rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768821832; c=relaxed/simple;
	bh=1MfjcyjEorRmsekS27aI2ZLCbB3LRVzyCMRcbwN2Q/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTCFl1AwrsIyeM+/jQ+22EtlaugL8fB3bbxD8i8BcGNjr0G2dq9FxNmHr6FB90z8LtoBAeT+ymbdbRcx2TVE753Wdc3yzoaIE1RJ7All9KV/1fhB/2mx0dwhzy9ErWBQrWZ63n1DdNqWHZo201rNI6Pr4EJQazXKa1ujVv78ebo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cK9FqWXf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KmRMRTWZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JA7UKW597647
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Og2bNnMCiD+Qnx/yVwl7sa8q
	3E6jkBERvqpmHJS/OCs=; b=cK9FqWXf4YEzqdLtmjNxnI+ZOiB0a/BMinmgC5Nz
	A0AbGvNu5UOyKvZ0hNbB+39/iqnS/I12vuN96XYXVwIRHGFUFOuz/rWprlsueylL
	PQWRBkbUldWASFJjRUr39tMwOY6OkL4gvkdkJtFpDllq8yg0kJyY59jU+eUPomoF
	lXiiuN9bladCJM/XLOmMXcieoD/v13fH0X+G5EAgaeXu2Ig7SlYnwaj1rC/tYYEn
	iJJ4BhxhpRJA6mc7SDHc3fhCK2n6XbbZhTYUYz77Pc8cFSPmycdxwd+vaToy5vuV
	hgOJrzotIgsyd/6Qa1l7mqlNyzpXFhycJmPvnVadcv2aOA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7g7q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:23:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5296c7e57so1528274285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 03:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768821829; x=1769426629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Og2bNnMCiD+Qnx/yVwl7sa8q3E6jkBERvqpmHJS/OCs=;
        b=KmRMRTWZ92jDUPKCwxwNYRLxxR/Ly2EZqQa6+vxrpyRpaJfjVVd8bAe0smQ+qqlxRF
         8fOCwMD5Ol4eWjOMQCDvIT+dlbBgQduE6BjqDxBOHWI6OpAJcoOyLz8pO5178g5po3yz
         QyjqE3vs8kkcM3Z+kRvvSSyNFmQfZgfXc9tl8qS3N8CLm2LsTm/2k9wtuMGzthT+kVAv
         LQvCSjNQyrABmO5JvuBG4qu0IM6MSXMZ7JkaoHHvT0BKjKVNXPnnLYC3a+aLNz8EjTm8
         2mW627EOOixjM6G/zjbEBkakUnY3+GP6UoCS5R8WTQjhv+SJI8lewp+Ht8JrURsK9jLb
         yaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768821829; x=1769426629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og2bNnMCiD+Qnx/yVwl7sa8q3E6jkBERvqpmHJS/OCs=;
        b=r2iKJyRb9JNH1xxPlXG4QBLjFmgj42+lkpGIiWQ9FjQBmCzswn0aPDsmG/u3aUTJzM
         ot4y+5XKy4u5E/B0EN249b5YVdTG8b6od8k0Hu50RQC1JZ+ZFNhkoA/HKY2uKqyS+uQS
         RQKJ1PvZeWNdmIX4goP4qNbMsl17UQltTWOq0bQ80BxsKwvaiYxhi5NeHWENxCLd19qN
         Nv0qxJ9cHuTzBFgXpvTUd7Gz81E7ihdH7g3lULty/q960sI/xqbq69ZgTnW9j67LngRY
         Si1PpxYWgIdjec4Z1eAoYaim9qvMpG/cpAlzk/Cyg5HK4X4hXQaaqBxYqOYW2Zgpo7pX
         giKw==
X-Forwarded-Encrypted: i=1; AJvYcCXeqWi6qXSyKCPP9qrlPzV63oRxz3FIGp8xeAClz7nIFuSeQ8ppk3sC6dNbNZ0T7OrWrwWWtlPXJKnf6Oxw@vger.kernel.org
X-Gm-Message-State: AOJu0YzBw2aLiJjj/B84NBzzFaXRqUhIrOEW9LwIahVD/Amxz8dj+A3I
	bX1T3N6tpLSwvViSoe59u49GXEQpMj+O7IXCov3oj0cmrxJOHQJ+ZdbXzT0ag1XWbGGjNI98ijC
	QFNJhMNVvwGzxUer+i2zPeX7GXnvLWRgmyH9RV8wmUv/I+4NXkLMLXUeUxfByMH/bAn5s
X-Gm-Gg: AY/fxX7UAcrZkT/dFTK+tDgKKhpucD747TRtVZoaLmu8r7rpWKyhIoDwIyPLS64CwuL
	xTWF+vdcQGk84+Gt8cs8fc5c/juGRvYiRVNpl9UMGzrSgbhTkxRByiQChgx/xvNXgeKTEvP4VK5
	ml7QACAum/Lr0DqPbLgXf/7GgJ5y4vZjx8WO+eXbUwL8wgTH6OP4xzkfAsscz5VRkMRE+tRSUDc
	2B+SmsbAND0HVZoilWTJ5rpfacum9Dcp/1sygzw8cRIjLMrjnRd1TdArKu+S/z2gD81HeJsz7as
	iDWNibvYkJQvXa44fV3vNqdUWpI5mZWMmNZNtkEs6qeonUHPu2qjddpUacEYVfngdFoI433p+XD
	ZeB6TWrBtGT3SeYqB8ICd3k6dVFjHhTuTdqGTr0FstpuMxQB1lNYgprL6Y5meOUifX0VlZTnsuv
	VNB0Zp0JnJo19S9lUKs/s2sVE=
X-Received: by 2002:a05:620a:1788:b0:8c6:af59:5e2c with SMTP id af79cd13be357-8c6af595e6amr1169569685a.18.1768821829110;
        Mon, 19 Jan 2026 03:23:49 -0800 (PST)
X-Received: by 2002:a05:620a:1788:b0:8c6:af59:5e2c with SMTP id af79cd13be357-8c6af595e6amr1169563785a.18.1768821828488;
        Mon, 19 Jan 2026 03:23:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d8d5dcsm30685941fa.15.2026.01.19.03.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:23:47 -0800 (PST)
Date: Mon, 19 Jan 2026 13:23:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Liu Ying <victor.liu@nxp.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/10] drm/tests: hdmi: check the infoframes behaviour
Message-ID: <yj3r6d3azwwfl5g5yo5wj65qy47f5hzrio5tvfmxhgzlc5bezo@ij4dctwhswls>
References: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
 <2fb910198a3be542215592ac3f22d6b2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fb910198a3be542215592ac3f22d6b2@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NCBTYWx0ZWRfX8lbQ7lfXtYLt
 cbOXJIvDNokErrx8NbYDibwhDSf/tPNQgyHqc6r+Yw33oa8sQgHuSuyx77DQZGJd/jRG5Xz7VqF
 bwRKpcCFDAtHl6di6zjbqyQ9xbzy7Lk4XMAOI/JYAi1nBTP2WgYV4pESz09A7HcauASP4kL75oV
 oOFgx4UGsTtND1eyzcirQqar++7hW6BpUktRHShXwxP3jbkFWBsxaOynE/2eCydc8uorL+CNked
 kmtaz1RhGoOZynFbZEMBQFzWfxS1/MCE5tsNB0zsAb1/mK5RqmIuA5AT11zWo3n+birAH0UtxKL
 YS1RfODPMfHlAzTvyzGz8i7VGWvX97xy0fG6Oy/SB78J0aec8DzwQ9LK1TgQvThi2pG/e29nQi1
 gDp5BPLEdi6kQicvdbgJQEcmm0l2kwVEfyrBBNnMl0xq6WN5JbTDYQyAruckzKuKDtkXEdbBvzJ
 K4BH/uYFoYov6SMB7TA==
X-Proofpoint-ORIG-GUID: 2S1jUEBlZGV44GVuk9VgsyGQwxMa3g0H
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696e1445 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VxRmli0-OQd2mcn04XsA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 2S1jUEBlZGV44GVuk9VgsyGQwxMa3g0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190094

On Mon, Jan 19, 2026 at 10:13:43AM +0000, Maxime Ripard wrote:
> On Wed, 7 Jan 2026 20:14:58 +0200, Dmitry Baryshkov wrote:
> > Verify the InfoFrames behaviour. Check that reporting InfoFrame as
> > unsupported doesn't result in a commit error. Also check that HDR and
> > Audio InfoFrames are not triggered if corresponding features are not
> > enabled.
> > 
> > 
> > [ ... ]
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks for all the discussions and the reviews!

-- 
With best wishes
Dmitry

