Return-Path: <linux-arm-msm+bounces-91099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOWuFzWwemk79QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:56:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFCCAA67C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BD6D302AE20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 00:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EAB2C187;
	Thu, 29 Jan 2026 00:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fx0pyN6I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d51otLlU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99580258EE0
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769647667; cv=none; b=hanWwcn0MbAgZ/652fTg5Y7HtoLfmzU84ylDdGAAp/rueQRwONVTAFm6W9of5zbnsCPphQvNDjcHpfK5216wZHXzao/9AaotStomcIPCGxc2aQpV4aTaEtLhrrd+bLYSouTMj1/bzmf2L2M1ZNYPy3DyaGXl2MbJS3UKH5zYCQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769647667; c=relaxed/simple;
	bh=tYazlBYdm9VwYHKviLexDeTJba+FzJJr1s5Kp2FfwRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXZhZ2+eBK/PJ/y021+0KrwE7/q6jHdKtR2lmFBAIaSdUQ7YhgJihJSGqMmSUQq4aznL3o7ffVOGkUj+3VRCphHbJ3HqWD7LpAwQ6asVh2tAb6M/NuOqn53lBE98Alg1R35kayhCvXPVe2enIWylac3MPVIU7BxCpzU7tsAPm/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fx0pyN6I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d51otLlU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SINvRI2081887
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DqDq1cvCNyW61HnnmnGzvOGO
	SfA+3QT1Lq6O2dEG8gs=; b=fx0pyN6I+XTIjRFqz2AlVAmtwnzbW9KP9iddaPfM
	9VnzJeIoTsS4nTuv5K1m+D4WKK7pHoeYj5fJsVGkV1XBLDC+GRo0psfrv1J1154K
	cKTTTCJygpvTI9sEERdEySqQoEZwo7TqHtqPo2k84xJ8JeTNQbO9k/ljNvkvqyTx
	iKxfEdG467JCS6xYmxOCfDXhzFceu6+YNiB4nEcphrYqBphrM4BVDOvZeuEnZuJl
	gYMCYeNBBzRiSekY6c7b8eC3+SuBcn1esSaEYhfxbh2hnBgJoBM+RfDIyBpU5ZQv
	ZdURWdDc7gdWCBx8z+An1Wu5J8rnJ9VeGdEsZwrPCfAj9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byqpxgwqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:47:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ef98116so90207785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769647665; x=1770252465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DqDq1cvCNyW61HnnmnGzvOGOSfA+3QT1Lq6O2dEG8gs=;
        b=d51otLlUcDMc+sqOamT4zTdnxKanOqIZg01kWXyTHFinx6+DHjJ+gy+sHS/pQ8YayK
         Abt9Ojg5Fi2HsLmTb/Lkx6Y1JJoV9zDY5QxQ6c3oOtk9SIqaPckOktg2mgmsa+A5ddQn
         GgeZQT8TxgYldyOLRXA2KzEEzh4DSuB6k77Bo1Q6a9iwxRtlh2yRl2ygb/gLUgzD2hGM
         cAMviR8bYOC4tuhim4Bxigd3DXcXqU2e+yw6LE4VTaMW0z0Vn5KDZtY66iUoUSQiFSwj
         L2rgIAQRDADb7y56LjQWXCMUoy+fYdDqz/8Qxw7b/rCa/Pos4N5UB17MzYDiA6e2qTdI
         +mDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769647665; x=1770252465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqDq1cvCNyW61HnnmnGzvOGOSfA+3QT1Lq6O2dEG8gs=;
        b=hqAMMqMO2nwLBhxzFdhjeME5dSQ+u8ogpw6dd3lWlrPglTxcicyuC8ScTLSkYizbEi
         JyiiLD1VWHQqbJ3S0cldzOzXEJAxbf9XBMekMTJ5cZoIY0QGj1AH6nNBwGqNsjLqBLFq
         pONcWDYbSsv0QwqiGmKTNQSQVGUwHWOzA0kszvhpoJ56xe02y4jPtTJgcovpUChUfIq8
         67yWEWW1CmCzMMmGE3RXBr7ChA/EH0EqvGHUsFss+jmov7JhsmKPqMOjQQWfduVw68EP
         B/KawkT1FcvU51t/dFnvVxrX318kbkeTvdumRJt+OVRCnfplRIbY9Z0CI9DpCU1zeX8t
         8zZw==
X-Forwarded-Encrypted: i=1; AJvYcCWBksNg40XP+dJ+zSmZmV6Wwtr6XfUSRXZ0+zOWJJnJMk9WnkIzawFcUZHQVECjfiZdkzEY0LragfhNjE4n@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdf8jR0jGghThjhZeY2OrGcDdWH6oOQzJTTK30aIC41k5nBbD8
	cIHvTdh2Bbss8ImLaz3aBWIdmWfzKlr0zA3eP/lqWnAfeJt/hZKDfnXEb2cm8xZboPqklqXgbJh
	Q05swATQrR/y9PRBjlbVb/4c7ocwzwCR67x9bZ7BBVxpEcRxU4PZnIM4zIYb/YnTaf4La
X-Gm-Gg: AZuq6aLEJmCUfGSxNjSAbUJzTVYonzyfJGGx0s4EqLEKmSlZXv6uXMsqzJOk6R7Muo5
	wDvkA211qkNBnIxd4s7y7UqsQBash0id5usC5N75xhHbJl+qNm/WalQ0cNOnPU/rUq23fOHA4y9
	9lABtyaf+NRM/2dlEY+xGQgqZ4DWPmKs2C0eJAXtEWrTRWLIksS5uGi5a/nOgzJsZ9nacySGk7/
	0Jb9Y68a9FVh0wJQ3m0W86crQzx1yT5WDOv5VR+CWWV4b6hcNY3nq7Gl/F/xdIg5hWTp+zgVbCy
	QDptgOwkDFwUdS6qRzKma3KdPCgEa9lo/gWjSUKb6kU15QZ2pKKEw2zrk4ozOJHvSO/g3xksmDM
	caWJAkRWKG7QYZoM1yXJsqucwNQMlDcjzcmwW4/I8qgJPntw6/Qbr/feFrXiVPEw+x554b0D3u5
	RTbnlDCBYaqIPgXH3kaNBrfLA=
X-Received: by 2002:a05:620a:3705:b0:8c6:d309:212e with SMTP id af79cd13be357-8c70b906af1mr934999085a.63.1769647665019;
        Wed, 28 Jan 2026 16:47:45 -0800 (PST)
X-Received: by 2002:a05:620a:3705:b0:8c6:d309:212e with SMTP id af79cd13be357-8c70b906af1mr934994785a.63.1769647664493;
        Wed, 28 Jan 2026 16:47:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c74bb2sm7270041fa.17.2026.01.28.16.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:47:43 -0800 (PST)
Date: Thu, 29 Jan 2026 02:47:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Roger Shimizu <rosh@debian.org>
Subject: Re: [PATCH v2 2/3] drm/bridge: lt9611: Add support for single Port B
 input
Message-ID: <xlo7l73dzj2eah4skge2pc2uo7lnoqfyikeekazyrklnybdab2@37tlfbz2zqiw>
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-2-ba51ce8d2bd2@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-rubikpi-next-20260116-v2-2-ba51ce8d2bd2@thundersoft.com>
X-Proofpoint-GUID: XP9A7tEdjzy7KT4qmFGsUhC14mQpkTRs
X-Proofpoint-ORIG-GUID: XP9A7tEdjzy7KT4qmFGsUhC14mQpkTRs
X-Authority-Analysis: v=2.4 cv=dfSNHHXe c=1 sm=1 tr=0 ts=697aae31 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8 a=EUspDBNiAAAA:8 a=A0XAqx3_xGthHy5t7UgA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwNCBTYWx0ZWRfX6lrMUQAQ/7l5
 sBLUCShPJp5V9djSgaMLY2PWc0iw7fAy/FaNz0bAiOuekm3Sm6+m2ADMl+HfbUkp8m4PUWUdVUY
 33SgO+e6u7oWbC1fkuXcQRSeDq+5DDnluBGXFmUc9hB7A+sw4kBoCGhMIRq89AnxqHSi9iiK/tX
 Z6UFGJoN8F/6C99A6rzj8AXMWEb5nIvQMC1LtUhmIi45qR00OalinucuY9Ee8apUWhw8RFGXMs2
 yhX9aNMQUhfJDiiuqMEcb7eeHJyzYkk0Wy25XXV97Sao4FcnGRfyf96L2doQIQZdYZZp3o/zdb/
 0KRMmrnjTtYSxCPuojQBnFBhjwwCd3jx/AXnMwTmTEG19l4TR4VYbN9sxveT6E3fzxhNcswTXW/
 6i5PeGXn4QpL0x6Tzg5sU/27a21DCfznYIVW0zGjZjQu6xjvA2NxMjT2H1jSyfMyPM1EuetRnS2
 B/52ytk/uwBzkZMHoNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [9.34 / 15.00];
	URIBL_BLACK(7.50)[thundersoft.com:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	TAGGED_FROM(0.00)[bounces-91099-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,0.0.0.1:email];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org,debian.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.697];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ABFCCAA67C
X-Rspamd-Action: add header
X-Spam: Yes

On Wed, Jan 28, 2026 at 07:15:46PM +0800, Hongyang Zhao wrote:
> The LT9611 has two DSI input ports. The driver currently assumes Port A
> is always used for single-port configurations. However, some boards
> connect DSI to Port B only.
> 
> Update the driver to detect which ports are populated from devicetree
> and configure the hardware accordingly:
> 
> - If only port@1 (Port B) is populated, configure port swap (0x8303
>   bit 6) and byte_clk source (0x8250 bit 3:2) for Port B operation
> - If both ports are populated, use dual-port mode (Port A + B)
> - If only port@0 (Port A) is populated, use single Port A (existing
>   behavior)
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 46 +++++++++++++++++++++++----------
>  1 file changed, 32 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

