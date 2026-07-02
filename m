Return-Path: <linux-arm-msm+bounces-116021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YKv8F91dRmpuRwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:47:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8796B6F7DB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:47:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=K8Wm4OvI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B9sePVfT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116021-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116021-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B3433035D7F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81822E8DEA;
	Thu,  2 Jul 2026 12:37:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC43A420E60
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:37:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995838; cv=none; b=ZpXorebhc6mYY5FBdxgJtipz9kiVg6IiJ8SgaILobhHuwmN38fLkx6cgqAFKGFlNutf3U+fnOx0DtjF0ozyRHp82Wcv6xjbopgDdtkqmOAlqvfq7TKt58so64D/1LeCUS385fkzpnzxzGMVRZtiVCst6ayAgPFojFOVTN8+yVQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995838; c=relaxed/simple;
	bh=2p39y+I9Pp1uDzDAUgLAKbQdS1hZWGBJToVkh0bIbeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gC9/y6vE8GSlY2A5pqd1Rk8zIzI3pxlIn1U6wFlK1qyvChU641PnZ9E5HrvFA/xJK+h+zZa8tozOG+nUP3W9EYsCPrtE3lxsFKNluvL7zMeC6g0gRg8R5y0wCa2gEvFn3C+dZYFSNd09tjUQvENrtK8CrrBzD/9OyXw6ils/vyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K8Wm4OvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9sePVfT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628sNxn4172571
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/gkd7p4t6B1GFo8GZ/Q/pEKv
	RUF8yp8H3VgwhQak3W0=; b=K8Wm4OvI1acux7DGfhKQkI2Zkz/YliMAnqjEAehl
	byXQ6YGe7fj1B1F/JA+PVUOI7AqL3qxRIIkUsPRFx5igfmSqC4K9krMF1NhewMg5
	VkJEkrRTQlwqcHn3LSKynk9WAX17ZjPgJMolbdJRNCrrkkSaOHrxdqFHfg4usg1h
	HhPgLUnnBRipp1mGS0RAe5GTRR6rUl93zeLqltNNAZ0uJtvQEE+EAzHempYFmex3
	Wsy36yGl7MkU6Pq1rkNc0vcmUrJtEjmol5EHJJeAYslMcvPymU6sHE6Q7BJ7Z7if
	I0Fr01qG0EmDnDDRrw7tXdWU/PHmNSc9UjLo8lX5YmLDfg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwruq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:37:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so206602485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782995836; x=1783600636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/gkd7p4t6B1GFo8GZ/Q/pEKvRUF8yp8H3VgwhQak3W0=;
        b=B9sePVfTusVC1yYDum7zI+i1//y8pg1onSg16KqXC9BdM+NfA80lUXQOXp+qJWPRs8
         AWGXiy+mJH56TFV9/dex2jgclA/0eQYlOUUuu98U7Tk5GThO+iRxmSINchroUs5urBL5
         bv0T36h+X7e58/2MpYkopJSEa55sIDL7Qk3jdStB3ndhVUBYXT7OqYLs9F185kh6K2uo
         4Ku1nboK/k87PzbCmuXLona5b3Q31sukjBi0KhakYijWWKRMgnnty75nzZ6bRpW0DUOR
         CaHLCUaydBEIIFbNTPeEdNSbeXA/qtFnR5FO62+Os1Hcx0ZU3eR+SG6YdbexXf9VsTU/
         3Z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995836; x=1783600636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/gkd7p4t6B1GFo8GZ/Q/pEKvRUF8yp8H3VgwhQak3W0=;
        b=sMIv96nHqtHFPKJj9+Y5l/tOgSlkdchZSz0fKXe1QElnlmkHVSH0xXO5zYbfJkRSrk
         ijt58qLcPirsJ43AHzcvDBmchMcnpIv9jRxpsSBhSFFmPiXaXrn38oA398sm8l71lEAU
         IG3tld75+ZZgWn6Zatg5FGkmrSeX4OrNj8tFfZOBx2FeGFecu+bQVthrcoCw8TZJf/UW
         lLiAF/7jnqY5drXMdWZT/kXr/06YJHbWZ87Moqrm7O9qN01ESuFZe7IeVJQH+J4kJX2m
         hvtHWYsG+QTxUbTsvn3iT8crJhiQmdXP+WVH7hWzJU+9J9fw4dXSUXEbWG2PFEMmdF4J
         a/uQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tuY3ARLqjgEbZZVsm2aUVw2enkZ+/h6NgBHhd8+XDxPUKhFETuDDSBfVXmCQguYx8AK+8KPIOqEPO7Ys6@vger.kernel.org
X-Gm-Message-State: AOJu0YzyjRt7mewx0XJ0Nxt+IgEh0PPT5gCwjD6iIxdadE9GzNDb63S4
	wCbP6bd1kjhSvvMx8/jR9wq7CkXjmn7+NhqsazGTQgCez7MzZ0I9NBnIkDeqGAVECmrUNH32Pkl
	TOp5s31dmPtdP0U1UFjGtT8l9iySLLdnvc6tOEGf/xDHSVqO6Hvi8amx7gl6pcMi1HkYW
X-Gm-Gg: AfdE7clhXirQDw08ZfeyP9rMTIK87JPymIF/xTSHY3Vx7+LVAoY+wMciMke6dzZy32X
	a/C78jX6hGxg3KObE8VrEr2+Q1Bw5DwkxLQR4dw1G7H4zFYFeoon+L3Rh927ksvJnnetf+vQt+3
	JiAaQ+RLsKZSzNSQDRYdajWkp4AzfQXt564E3KwRDQq2o/W40vdMMeobigAQfDfBGiuULtq4+Bw
	IFTnB/Ud9Sxgi6xGAEple9Ywcw2STbcfAiDZOl2P6qFy8lNoXW0X7n1MCwjbqwk8av9APyJgDNG
	4g2YJH1h3BW5wJ2qIxl6ynlPxYlgOE0cvOatJM5CATq2alRZUjrvoxwjmY9xASLZVfEUyNkKx13
	0cUZIKIR4zUO5skgD9B7CemVM7K/0jdTSx7Pxe/9WO0bwFQqJNIk8LVYjbA+ilaaNkpmaynW5Jo
	+6FTZ0WJu74l20KST8/oP+A8I2
X-Received: by 2002:a05:620a:19a2:b0:92e:64af:3e59 with SMTP id af79cd13be357-92e78530f8amr830690285a.67.1782995836043;
        Thu, 02 Jul 2026 05:37:16 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:92e:64af:3e59 with SMTP id af79cd13be357-92e78530f8amr830684685a.67.1782995835473;
        Thu, 02 Jul 2026 05:37:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b37fc4952sm6393931fa.23.2026.07.02.05.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:37:14 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:37:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/panel: visionox-vtdr6130: switch to devm
 panel calls and drop remove
Message-ID: <aw7zcgv27nl5yckge7jyh7kusz26d6p3ku4a2val3ugx52q3vv@pu4sykok6ycu>
References: <20260702-topic-sm8x50-vtdr6130-dsc-v3-0-db881a3fc026@linaro.org>
 <20260702-topic-sm8x50-vtdr6130-dsc-v3-2-db881a3fc026@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-topic-sm8x50-vtdr6130-dsc-v3-2-db881a3fc026@linaro.org>
X-Proofpoint-GUID: 8YByWz8e8LL8brR2-Uxzigit7PJ5CWtK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMiBTYWx0ZWRfX1IeYVnqtdyBk
 5Pi1urAkSz1ZJsJz7BSNFSU1h9HkeEwzIJAEzrxRT/fG4PHqUw0+cIxBCJp0TX18A1TXBj1ULeg
 cYYxd7eRjOaexmAO8ekEPgFAFWPk3fP9IxLJzAPmoJXEV/gloOyrvf8NMSJC6GUZop2+8JZiHyR
 ybdPLkVrSlpo+ELkRD8heX5mc2iL0ms1IxC+zuoI57MzFwiPHLXr9+YDTQf/AmqFYKhblhNIe3o
 LRgXocHOnSLHYyPKAxL61Sqy18kWi3tMVu++smIA9cbCORvEMtKed24vFd8JyIrIB/PVFV1ytU5
 STNcDIuqA8pgeQX7sPZ2hpd87WxUmQrb0YXOAGFYEqn3TlUQ9H8QkY+5DwC7cUPhTYUfWu+cVxt
 cn0ncY16MnUAU0MvX9CrstULxO9tINBzFKBlbPnHSLEimvUGabbxMxAouxd9us3rC9PRu+KefZN
 vjs54CNaFGQ8nu+yGrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMiBTYWx0ZWRfX4NEODo9dEo9Z
 0DdlDzy37iz8bHiSSH/CZxwe9Nl4we17teaB3vtSHg03VMZH1EwH8VcPhEGZQQ/Kxti1dJsop+W
 EuTqy/Lfg+iYMfOKFzx6mbnd6nYD0Lw=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a465b7d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=gy4a2p5Hswq1fkLbpqgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8YByWz8e8LL8brR2-Uxzigit7PJ5CWtK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116021-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,vger.kernel.org,chromium.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,pu4sykok6ycu:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dianders@chromium.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8796B6F7DB8

On Thu, Jul 02, 2026 at 11:36:10AM +0200, Neil Armstrong wrote:
> Switch to devm_drm_panel_add() and devm_mipi_dsi_attach() and drop
> the remove() callback.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

