Return-Path: <linux-arm-msm+bounces-118547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J9ngD7NyU2otbAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:55:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3984A7446F2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:55:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=O9m1b+1k;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=edClhOfm;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118547-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118547-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 738383001CC2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 10:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39B839E9DD;
	Sun, 12 Jul 2026 10:55:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54971399D0C
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:55:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783853741; cv=none; b=cwin0ZqXhpxFzu6eXz4v1UMAkWfb7mYV6wLtcvxXic6ytWXyxPINtRxNEVwPb4dlxrFBY7csrockPV6G9SLhbOQcpHeNDNhSoDYttgP9FrYMlB1A7jJ99ltCqhGpYG+544hiWx6sGvdBktPZvJC/J8M7uEsnSfK/bTZS4fui4UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783853741; c=relaxed/simple;
	bh=B5bRX4I1g9EeMKYp+BRQIiMRFZSDScWqhhuAGNOP4sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJ62FiJRxuTFt3WA4aQZTaQRveDZTC7F87eb4E5Oh0AvrYvsATlh3ZOQpN/QpMtnjorW5SP3GWDeafnvZGlXVOAVwregBC58P0FF7Xmj+vJMMWr/6lQncq1Y2B+0mvl6gy4F268uj56j1SbA3pB98lt8Kq8j72ixZlvvuztiJTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9m1b+1k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=edClhOfm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CActhd2196146
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=auFn13uC31yp9UcYtu9hmPfT
	LxwSp7w1fsylGewneOo=; b=O9m1b+1k6ty2rzLZmRjvVmojaRI22qGhHfUpbc0O
	4/CORof1ep0kJAlM0oxexNVXCrV4g9EPMHBwF3RfExvQIYpMNXjYPuQwzKuuHLZj
	HAyJ5D7ococJhk+O2LuP+kN7WB25xnNcO9TIDj0o1GNhN+pKzg87Ohkc7usdihTs
	usG1sd8uLn5HYRI+CoEV2XQPoyh9ulsphj9wfKeZPznBFJyeWoi3uV/kZWij0anA
	wGH05YGQHYRqjetok6c388B/iuMePlNlFeAojN0i0MzuwNWD9ZT325QLc4QeqohT
	/BDg32An9aMvdcVcNkwyR7VmPViPyLMBrPEd/uQA02pXAA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9jpfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:55:38 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97556ae34c4so72285241.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 03:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783853738; x=1784458538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auFn13uC31yp9UcYtu9hmPfTLxwSp7w1fsylGewneOo=;
        b=edClhOfmrFCZ8+SlHES4llhsxfh84/7loyVMzm9U3b4IX/ME2pvBnljuAv9dUxzNCH
         Zi6SpcfPKIl0mGCin91FyiNTpBpotHJfLC5qq4LEDSAq54PLJWhJXz2x6c6gpG6I2/ef
         9yNSfyvFz4m46PPQsM7Eb9BMQ7m1XKt1t6ApSeUwMyKoqFxVZx/Fh8LtW0F6xAR/I7Oy
         tQan4XW/LtcTwnsJRt7FgbdAg6D6vzdi/I0dfcFBIwNi+qWJ6KeaOQ5sQE5oD4nsrtII
         WYaWRuRfpGNASAYxAsJLQjZi45diAnVJ6DS5oWw/i3LmJ7quxTc3esGY1QNPJFdoNTfJ
         U7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783853738; x=1784458538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auFn13uC31yp9UcYtu9hmPfTLxwSp7w1fsylGewneOo=;
        b=MC1ihxx/y5pglRBGZiM3nwelDMsWQeO2JUb8X6BqsPOuKQGHbeoX8Sd7TAq4OHEhkz
         UCIsokNLLA+u54TOU9psAV+Ord0bzc+CuMQyBkIAOtZiFjkYoXPIXJ5jBH8pcrOXI3q2
         gHDB1ph+AkM9ubg0o1/JbdwFqss7gIii7q7zbl1U0G+1U6lUMpD17CzZpz7+3Ib2M91b
         rF6csDAhdn0XypTyNdOsH+RJ0bDT1YMVibkatTDVHVPjqXpilyMWU66gMpdA6oM7I1+U
         SCS+DKS1nKsejoYFtRPWZpDUpN1OcMXRzSjmnYSvi40eHbCULvryevge3x6ti+zvR4yD
         g36g==
X-Forwarded-Encrypted: i=1; AHgh+RoZ6SJA1s9L9d9lMQOBh3ehXkVWWhTmqKidVZIU/3BLbGBGkLRciLq5RH25YOdi+mbTydJrKjVeKdH8cHNW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4fGBCv1zd+IkeS/wOBsnHtVJrggRm4lBytQIIoqhEAJEVGaI2
	7HRprLUY4numJWMGmt+CawpBuq3jsqYuzRjTwrDSwjB7NudZnVk6R8OW8ESCymEImC6p2cxnE4m
	e30Re1UPwNrIUwQIhACtdJ6qn7oh4iG17gfFNpNCyvNOaV+59VKDF03xX0m21PmlofhDI
X-Gm-Gg: AfdE7clQFAcFL1q45jo/zov+ftYeAY/iL84+jaX7a+BMLQ4IyOqnjapk3+FD9IJXCMY
	tpvGNh3LLiTcWIIFmAVEq3e5XuuOSLjAFK7yYksmrlopwUqGUhoUuEo1ej66rsCCm2JT35QzxpE
	QLB9PdlTBpVdSe7Q0SLxe62WL3MxaaD4ztcxemM6axJP+QGDVj2BtrwDpfTbkG+YfUyzDU8ONxP
	UoqUOKtZ9tfYE4hgWMXO2eNVDrk3rsSn1IL95AFhdZ2SkrYF7ubB8bLdlmDJXyJBWMGjkSFlgkx
	ekjYLvjX+NkMNLDQcDZxL3OJIuo9bdcH6uoqsI5JJzChHP6zBCFkIrG+4K/xIPgYlByPiu+lszw
	9wJt+qOIPPhYFKlmkv2KrwhqSCjN19XRRpZ7QhAJnTBaV82hlvP7zqZpvvMUJMw71+Szd59X5Sr
	tZsJnXHlDz29n9DSvAAk6GzdpV
X-Received: by 2002:a05:6122:65a4:b0:5bf:a181:d46d with SMTP id 71dfb90a1353d-5bfbf09b771mr2585502e0c.3.1783853738063;
        Sun, 12 Jul 2026 03:55:38 -0700 (PDT)
X-Received: by 2002:a05:6122:65a4:b0:5bf:a181:d46d with SMTP id 71dfb90a1353d-5bfbf09b771mr2585485e0c.3.1783853737547;
        Sun, 12 Jul 2026 03:55:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849180ddsm20446691fa.3.2026.07.12.03.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:55:34 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:55:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 4/5] drm/msm/dp: report IRQ_HPD as an IRQ-only
 notification
Message-ID: <zmnftag6s6mxvnoqdzouhpdcbwscm6sfzrqkzgwrcptgbr53cx@jetw2gtov7qp>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-4-646a10256233@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-msttypec-v1-4-646a10256233@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDExNCBTYWx0ZWRfXx9rKvEA+NqFp
 FRb5tM8DJJEBMmmXpWi3Klw8UA26JUX1loBGjU/VOFpic4MkT5CjU6YM1Wo1pxBNlAeUhRRHl+a
 zhDNL5Cczf1TzF9Mj1r52uPPfgnOdTc=
X-Proofpoint-GUID: h-MQFfSRFfRawGYu2guwVcp9YFgWVn4Z
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a5372aa cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=byx_Kl4d9wP9hOeXrbAA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDExNCBTYWx0ZWRfX0DtP7c2w77B/
 cpI7Du+3oZOtCzlTWqk4ar/JNzFqBfvZdIjwhsUMt+Ekzz3X+7POZw/aQeP5uLCHvMeCXuc6qF+
 iVvBz7FukbdTEkspV6Bmq2xpsRp44B6snHzJ5qdWIMZ7BcdanwBY1htEKAcsmtkuAQ3IbOAi5Mo
 9XFfFTGqAuLbKePL/MjGjyBeQOeIeZ7VtLNMpmkyjbIEeDQvdKNj+70PVm1GT/MBrJ8uigQNAiJ
 lOA4Q0ejdxKAIPVVfBcStTp83gDOv6GoJGA0BpDobOmYMUCQKkk/aaKxqf0ZEgJxzSe1+OQaPYP
 jI8bzZbzAmxn/N9EhXcDacIYuQ/zMNI7oCRnWTnDD4sO8rxXHWjFnt8NF6tM1Nr4hl/QbC22JW+
 1ABvVfZa0M5tQpEguDW+jJmjyVqTZpyILysjoyR+44reXuMgX1VsvEomge/b460/D3+bvVhX0BC
 85TbrDbyhd1dRUltpDQ==
X-Proofpoint-ORIG-GUID: h-MQFfSRFfRawGYu2guwVcp9YFgWVn4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120114
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-118547-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:jernejskrabec@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jetw2gtov7qp:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3984A7446F2

On Mon, Jun 29, 2026 at 10:48:06PM +0800, Yongxing Mou wrote:
> MST reuses the SST connector bridge to propagate HPD IRQ events through
> the bridge chain.
> 
> For IRQ_HPD notifications there is no connector state transition to
> report. Use connector_status_unknown together with
> DRM_CONNECTOR_DP_IRQ_HPD so that the bridge connector framework treats
> them as IRQ-only notifications and forwards them without modifying
> connector state.
> 
> The DP driver handles IRQ_HPD events based on
> DRM_CONNECTOR_DP_IRQ_HPD rather than connector status transitions.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c   | 22 +++++++++-------------
>  drivers/soc/qcom/pmic_glink_altmode.c | 14 +++++++++-----

And which tree (and why) would be able to merge this patch?

>  2 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bc93b566fbca..4ee391cc7165 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1119,14 +1119,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>  		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
>  				      connector_status_connected);
>  
> -	/* Send HPD as connected and distinguish it in the notifier */
> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
> -		if (dp->msm_dp_display.mst_active)
> -			msm_dp_irq_hpd_handle(dp);
> -		else
> -			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
> -					      connector_status_connected);
> -	}
> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
> +		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
> +					    connector_status_unknown,

It's _not_ unknown.

> +					    DRM_CONNECTOR_DP_IRQ_HPD);

This should be fixed in the MST patchset. You should not be doing any
actual handling in the ISR routing.

>  
>  	ret = IRQ_HANDLED;
>  
> @@ -1781,11 +1777,11 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, status=%d\n",
>  		   msm_dp_display->connector_type, hpd_link_status, status);
>  
> -	if (status == connector_status_connected) {
> -		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
> -		    extra_status == DRM_CONNECTOR_DP_IRQ_HPD) {
> -			msm_dp_irq_hpd_handle(dp);
> -		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
> +	if (extra_status == DRM_CONNECTOR_DP_IRQ_HPD ||
> +	    hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
> +		msm_dp_irq_hpd_handle(dp);

ANd here you missed the case when IRQ_HPD is being reported together
with the first HPD event.

> +	} else if (status == connector_status_connected) {
> +		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
>  			msm_dp_hpd_unplug_handle(dp);
>  			msm_dp_hpd_plug_handle(dp);
>  		} else {
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index 946eb20b8f83..28ab8cbb5ef9 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -373,11 +373,15 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
>  		else
>  			conn_status = connector_status_disconnected;
>  
> -		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
> -						conn_status,
> -						alt_port->hpd_irq ?
> -						DRM_CONNECTOR_DP_IRQ_HPD :
> -						DRM_CONNECTOR_NO_EXTRA_STATUS);
> +		if (alt_port->hpd_irq) {
> +			drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
> +							connector_status_unknown,

And this is completely wrong. The AltMode driver (btw, you also missed
the normal altmode driver for DP) doesn't know if it should handle the
events in some way. It should report the HPD and IRQ_HPD as is.

> +							DRM_CONNECTOR_DP_IRQ_HPD);
> +		} else {
> +			drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
> +							conn_status,
> +							DRM_CONNECTOR_NO_EXTRA_STATUS);
> +		}
>  	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
>  		if (alt_port->svid == USB_TYPEC_TBT_SID)
>  			pmic_glink_altmode_enable_tbt(altmode, alt_port);
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

