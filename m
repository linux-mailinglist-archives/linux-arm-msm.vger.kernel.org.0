Return-Path: <linux-arm-msm+bounces-105828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IuOKtM5+Wni6wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 02:29:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3B54C561C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 02:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4525B308044D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 00:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0596A279355;
	Tue,  5 May 2026 00:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUtVquDF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OGZ+QNI4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFC0282F32
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 00:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940752; cv=none; b=fHjXbqtme7BtV3d3rI1MQddjJ9BveweuAPFgb5qhMYtfw9lSgq179dj2STZsGWXGLy0W16sbaLpnCDOwFjL/u9xlKIcbsRAPX+dXww7GVuRF2gMtqf3A3zgasbWZpuLtj9SfgP10dfC23+w+2OLRIPCtZKMp46qFNutW0jYONYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940752; c=relaxed/simple;
	bh=6KkNpyC526rgMVIeY0D11Z3gyU75WDlgdpp2dL9pdq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChM6g2NCIwWkXYt6EhaxPrqXtnF8GCv2ATp6nl5H5vgvS+ERjGvqXk/EWj4dNJsjVQYwjxpRBxYl4sxTX6Ke0WxJ7cl5V6ayJ4EHc0aCAWw5c5cLH2+QbW7He8ckh0q/wPDSozoTbs2SuSVaODalZPvbOOuAXY9xJ2/F71fhw6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUtVquDF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OGZ+QNI4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644LN93q1960442
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 00:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EaIMgG/IEi5Ad5NwXbrOlQk4Ovs4qDGmtqlsgR815SE=; b=hUtVquDFHwQK/Amy
	CK2IO4oqJskCVkQCdGS6GgZvVjCj7bIi6gjp2E0fxdx2PemFTnNgmEylzjFpOEaI
	DxKCFgm/hWvTwtTwitPF0BYdxNVpmOh+c4BDR7PCBeMl8ESSHuvkfcM/MMTY+Rm6
	5rpvt7dYkSbDSFs7QLYUUS+GVLp93bUvaKETydmTFjmalxOYXJDEWZuaZsEGtRbB
	vuPA41+2NZp67/I7G7qID8MK5RGtt+wL22rBu1pay7UP4kjipoN07teT2WPp/Mmq
	uVuOdUvSs5MhkghRyGNCu8UiYQtlrNzIzItojWjjTswYcVSYb2wg9Cxx+40j3NwX
	CnPZxA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5dt172-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 00:25:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50eb8bad331so9505521cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 17:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777940749; x=1778545549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EaIMgG/IEi5Ad5NwXbrOlQk4Ovs4qDGmtqlsgR815SE=;
        b=OGZ+QNI4miq51Od2GInJJfly0/WbtTj5m+xZ8c77c8O5R13QyHONYvpZIzEdfGjgG+
         XbT8xi3bqflw3Hxgok7r74uTGrnn+Of9s6OafVro6wVdLSHB9Rz8zkcpD1I59pJT78Ms
         uNyM610T/rYxLcfLd2eK0zj5F9oCW5pvE95ndjjcMG51XKhwl3WuHnAsT5E9ZGzE05Bi
         3MdSgsnO1JlCR+gmGj/RXPFLwwsFjO9btpuERWcMib1ZNoYlO9oDypdC9Tmrs8A2nzqT
         gS9iVoKxA7yTwJYwN12F5iWXI/smJqhK8gLFiSJfFOiF0Zc5C0N7Te32joKXXBrVrvTv
         bcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940749; x=1778545549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EaIMgG/IEi5Ad5NwXbrOlQk4Ovs4qDGmtqlsgR815SE=;
        b=ZTqB88qwFGb5zsG5rTXZm9X4gKLAbWO4J0b4ZWqVHhDJNOveSH7YGUpqGM9M5LIA3l
         nfuUiX2fSaaYABcndY3BmPd2Kwj+Lch1M9XRO5+WkH1VkkopF9EPjEXFj1r8Ejx4bR90
         JGLTJeAVZjlbLfXWSGsX3lM35KU56E8DS7bHqa1hFGsfGB9vGNHigWC9ZJw0oT434RJr
         LtY1tt3mS5r9fVPkEnkqd4W1Ba7FMRFCDQr3hHHpsWDcJdHmqkRi3UKPuKeDAtzm6WnE
         OVDYZ7CzzaqMqceaJld9Sl+ESUGxi2yHBNWsGgXls7SdPgQGL/dQc4oLFNiK9KyeVpeM
         bVtw==
X-Forwarded-Encrypted: i=1; AFNElJ9cQrzoC3e9179qYV/9YXZJYeoTJKLOKWJm/Qh1/mnJt4G+wu1NM+T6KoYNHOh4s4NAX78wQXI5f7czI2GR@vger.kernel.org
X-Gm-Message-State: AOJu0YwdPW8EKDfvMOBz4olojXfOt+0izTaxbEQNg7qmcFtA8ag5LdQ6
	Q0mtUH+FthhAJ1gxE426XSoPXcog7d8umbtqWw8BRL6l4NOwCLXI2R7CnE18vWo56mduemu3jnu
	9Dw36cGSKSpp8hsguL7I9e5FRsfqb6zLdRmHawaTQktwGhCqQMtf2PhccgYMIkPRSv8N4
X-Gm-Gg: AeBDievSLfLrQIl1mgg4qx/7/XaEgsXxuU0L+HIYW2BJeNpzWsmvYtxe7of7bChW9oS
	1VPgXkCH2lAsQWmPlNjZuY2ZtDn0BTB8Xl0QKOoikg+PZs5COVHXmwyiRQ8771lWjlxsUfOa+JL
	Cpyox3hSiZbmXj2jUdutg7u+Q4pQfdAIb+LVtZOeVGq7i+gXGn4HX25uciTvLUiGAqcgNct7wNv
	UbN3HlAJ4e8wOFNacrIYkzYwtbRNA94DhNKALa/SMM9US/bGD5nz4OMCVWYVL9ucbpZsrP0UN47
	oyt5WkCJSTHZfnnRug/EqVVRR0vN0stT9OvRtGiHa9oSj+c8uIa0Wqg6vPR53JlpUodave1dIjs
	2I+o4vlbYjFgYbWvDdzlf7ZYodS3OThMp+i9DKO9smWwsda1g9Z/NhrAUmxE8NF9dD4EpIwdwBo
	cgT8Po9aQGRV3UAcmhBX3svVIVuXg/K8oZfSWol+socIvyGg==
X-Received: by 2002:a05:622a:580e:b0:50f:bdc1:3bbc with SMTP id d75a77b69052e-51306aac200mr14477001cf.45.1777940749076;
        Mon, 04 May 2026 17:25:49 -0700 (PDT)
X-Received: by 2002:a05:622a:580e:b0:50f:bdc1:3bbc with SMTP id d75a77b69052e-51306aac200mr14476621cf.45.1777940748538;
        Mon, 04 May 2026 17:25:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610ba09esm37132781fa.10.2026.05.04.17.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:25:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 05 May 2026 03:25:04 +0300
Subject: [PATCH v5 7/8] drm: writeback: drop excess connector
 initialization functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-wb-drop-encoder-v5-7-42567b7c7af2@oss.qualcomm.com>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
In-Reply-To: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4480;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6KkNpyC526rgMVIeY0D11Z3gyU75WDlgdpp2dL9pdq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp+Tjc4aI/E+fCVPzwdLRrDiVtx8WNLqsyYQ22J
 GQc9Z242b+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafk43AAKCRCLPIo+Aiko
 1W/DB/9RLlO/8FopwXYP5adamkOmud+2XRg16jh0MbN04hulZan4teex+3SutuTANIXHCaYmgGH
 g8jvk0RIuVH6PUAgayKAv9kdGe7ksmExonWNj3I4LW1MVlPG8y358RgdJmuyT4hwhh6f5G9G7du
 xdEI+0m79kNZ2dwnD6COJWW37eKr+/UYc66bDqq5Q6yT80/qyMnovBEaq1WKuUd7d1YOqRGZMJ3
 KBUXBWSbAwCYH2NglyobPQSIpZVi/3YlXZCHl1W31w9d0ncnavvwJiJGIRrxe8gVduiKcjyh7bY
 +FsLb4cp5zG7JIfyUghx1RSeAeNmI1X5D309HpKtjERxyYnE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMiBTYWx0ZWRfX1wH/0ibfihsC
 8wxtBDI1lfcxYE9QBV4dba41McaZnn4yW0J5fAag1gCHKXNTc+TmT9eQ9acr5Fek4bQ5IpxLbHg
 xY1SvrPoVRX4pwl9tc50jcSyOBSmXNPXshtunZhwbtjSfnvBKoKkwPMVrSMLeIvDy0fwiCyND3c
 h3BYA9uCV1fXyQ5nvJBLaFxqxvwjhig45afOpg/Rl8Z+oAAtodHdgX+vloSjHdUNpKUG8GDm4GE
 /i1waAepr9BBNfqbHN+hulP0ZG3YnEXBgRgpTVa3RyRNHgZEh1IjTdcW18Wo2EkbrIY+ZJFXx3i
 e9pCzyN8ISrHPoIqB00r4J0zGgnZwJGOlvkeAvAn0V9eT2upBU08Z/R0A7b03Y1KCWOx9kNd7Qb
 9c3kB/Y3HDHvSwd9OFj8fSGoC1z961+woiPDz84DY9WmEhvgK1HzoJtDoldl+Ggc7hCJqlC7N59
 yl6as8NkSdOZFeElEig==
X-Proofpoint-GUID: QLcT4RrbN4MDt6Kf9dp0znsZ4PsMcpVn
X-Proofpoint-ORIG-GUID: QLcT4RrbN4MDt6Kf9dp0znsZ4PsMcpVn
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f9390e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=3owybDqXPaZAjLikVYcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050002
X-Rspamd-Queue-Id: 0A3B54C561C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105828-lists,linux-arm-msm=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,bootlin.com:email,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Now as all drivers have been converted to
drmm_writeback_connector_init(), drop drm_writeback_connector_init() and
drm_writeback_connector::encoder field, they are unused now.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 55 -----------------------------------------
 include/drm/drm_writeback.h     | 18 --------------
 2 files changed, 73 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 4da5d6094721..9fc15168c34f 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -142,61 +142,6 @@ static int create_writeback_properties(struct drm_device *dev)
 	return 0;
 }
 
-static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-/**
- * drm_writeback_connector_init - Initialize a writeback connector and its properties
- * @dev: DRM device
- * @wb_connector: Writeback connector to initialize
- * @con_funcs: Connector funcs vtable
- * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
- * @formats: Array of supported pixel formats for the writeback engine
- * @n_formats: Length of the formats array
- * @possible_crtcs: possible crtcs for the internal writeback encoder
- *
- * This function creates the writeback-connector-specific properties if they
- * have not been already created, initializes the connector as
- * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
- * values. It will also create an internal encoder associated with the
- * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
- * the encoder helper.
- *
- * Drivers should always use this function instead of drm_connector_init() to
- * set up writeback connectors.
- *
- * Returns: 0 on success, or a negative error code
- */
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs)
-{
-	int ret = 0;
-
-	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
-
-	wb_connector->encoder.possible_crtcs = possible_crtcs;
-
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
-			       &drm_writeback_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret)
-		return ret;
-
-	ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
-			con_funcs, formats, n_formats);
-
-	if (ret)
-		drm_encoder_cleanup(&wb_connector->encoder);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_writeback_connector_init);
-
 static void delete_writeback_properties(struct drm_device *dev)
 {
 	if (dev->mode_config.writeback_pixel_formats_property) {
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index c380a7b8f55a..879ca103320c 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -24,17 +24,6 @@ struct drm_writeback_connector {
 	 */
 	struct drm_connector base;
 
-	/**
-	 * @encoder: Internal encoder used by the connector to fulfill
-	 * the DRM framework requirements. The users of the
-	 * @drm_writeback_connector control the behaviour of the @encoder
-	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
-	 * function.
-	 * For users of drm_writeback_connector_init_with_encoder(), this field
-	 * is not valid as the encoder is managed within their drivers.
-	 */
-	struct drm_encoder encoder;
-
 	/**
 	 * @pixel_formats_blob_ptr:
 	 *
@@ -148,13 +137,6 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs);
-
 int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 				struct drm_writeback_connector *wb_connector,
 				struct drm_encoder *enc,

-- 
2.47.3


