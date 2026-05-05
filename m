Return-Path: <linux-arm-msm+bounces-105827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOjGArI5+Wm46wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 02:28:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA394C55BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 02:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FEB3306B0C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 00:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C8F282F1A;
	Tue,  5 May 2026 00:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+r1w5Fc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fH8WhMTz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5235E279DCC
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 00:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940747; cv=none; b=bt18s+9hfrO0GwYOEH1gTS30a2N7GiMt68Xvc/N7zyqcSovJKCxHIzk2OAKqEWPwqw5LYetpGfVA6nSSuwFglnsi0QNVPN79/okf1rb16dy+fSyuTBXH3d99nkCd4XsavQoK7KqZy9QJamXjP+ilu+lH1MBmvR8f7CuMHM5g/3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940747; c=relaxed/simple;
	bh=behk6Tmd7pmo6mRIbuSh89UzpPSTMpSIp59mKcXVLLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=REpQVkHAbESaxaNVMPUhekBKpf9/V//WiGilQFcJC6SyDaK4WOcHR12q0l5U5FyJRChzlr0Vvbl71BFp1RDtCP6rs6P6H/sGPAAb+aIxlbM1oD4W5v/a96L2UxLdNejQZrbTR4xPbecQE7M0PygDkMOaXNDjfqmZ8sWSRhQQ75k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+r1w5Fc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fH8WhMTz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644JTTlx299492
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 00:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGPbsFRj9AcR1JhiLP6QveYjBGQn12/jz6nJ82TmXuY=; b=E+r1w5Fc2T0hs60s
	cNktpi4aZrq20ghx+ylb7uEN8/txOPRbTfbZeykzOQepXSe1dnnn71jCxqXKncyM
	bGyni6FW2vBRohz4rgQw4qIJOFm3F4KuyZ3KggFuWWefz6xIpTuqJcc3fZUpDLYf
	NJCQEXtW84cw1b3BwbseCxyIz8iU/DG0+oNjflW8+TFFZ0Cn8aesJvXR8nARQYHW
	Lo1YhQH3OllZipvbbz6vdQWGxt6KUtLmNDJS2A1rLpP1gYU4hdF4rZdLUsa3dvQj
	b8opRDVa5Uc6RP4Ftv3sEdktaPp8GTnywYb6qBl/8CnzJ17YaGA9bd9b2wu6wbHS
	YV3ZzA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvnda6v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 00:25:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e2592ea3bso47442311cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 17:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777940742; x=1778545542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGPbsFRj9AcR1JhiLP6QveYjBGQn12/jz6nJ82TmXuY=;
        b=fH8WhMTz3Hz1ILjDHEUPzttu2C5OYmCN86JSlT53Nie1iem23je9n28fUvw/JXVKcL
         3s9QqDytHGYbbDuYCtdJTo7RN0cpr095f3hxzJLb+gMRi64/dV3APQTe00W0IoImQw8S
         letpXp3+1KPqEfbyKF8eobYF+lzjTItsnWeN/ychqq7JJ8M5goqssSligCArA/+Dj8Vz
         IomLBjJqEudVeLw2SNHh5Xz5Odgy2Vuhm0pu3fx20+CkygbpDno7IEiE0z09DRrNmstA
         TupkCL78GRBzxUKSZlHdf4Je4GZ+j5It5miCwgpXgClGCx2Qpb4LeV8yhzOYj3cZAXcD
         OKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940742; x=1778545542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IGPbsFRj9AcR1JhiLP6QveYjBGQn12/jz6nJ82TmXuY=;
        b=CMp6mPhfYt3SF3TBixHOlDrWDFKc2g5U19cQDYEa0Pk7GHzz8x+p/ljUNavAKU8WFR
         MXneoW50Wgod0hBrYe/1Bi5T5SkJpkdwsYba1G3tGQShsXAdM3Y8tlK/d/qzuTiXszrt
         6q0ln3nNs2mcfXUUB/z/0t4EcDVh+k621sCzwHvRKwv/drlHsvI5PLZVtGFTKUeI1IXn
         /ZItxL1vjha4WbRzt0HbueES6sILr0645doCo86Qmf7Q2TwAnzPRHRCn4W1NWMUAGQBo
         C9fm348vEVIu9/JXGJ5lKaXy9IGkxF/m1CUUQBI91u0UY8UKfEBVbF5zuE5lYZmUa4iD
         LzbA==
X-Forwarded-Encrypted: i=1; AFNElJ+ISUKiiSrQVYd2pO4P3DQENmBNeBVG/I7skMvCV3Yj1dYzuPJOwRwNMeu1AH3TB43fECgDObi7gafvFvdl@vger.kernel.org
X-Gm-Message-State: AOJu0YzlF5lvFA1WRJGMHcgiZvpY2iqRTYlxIOmJoZgO1gnBG6vsGwqB
	fH0AtT6nazuiZB8biZaRjxQudiXOfgHQU8XyTUYp6Jb+WzeZYsLav3Fp2hORZ2w3c6Wknuff6iR
	i4x5/798217w16V284acbJ0uhlhjz3CEgp/V2d7YXaSrrJpy2ztMwZSCrC+kdXtiWLtw0
X-Gm-Gg: AeBDieudST2rkAjbZ1Nrj6vlwQ12JsER+XD0hfX1nyPbEnkqah+jG/yGof+RJqYAwev
	fmCs1ekrwpUVj/wZhjhz5QHWpMLVstdBqQ3yoSdSaLLTT07mx7jU7Thf6fGw4++oV+uDymZ/r3H
	C9dHtDyfEr8mh9uaCcawKWIEDXFVhCuUKDwu83wYDzunUaGMbWNIhTh1WV5mJWLe03If6M7wtG1
	+LJ+jfKEimJUsQ/79xKZtkwX0fm2zwViiWFPnPw7ykPJj9lZkTzZxg9hqY5Xt04oj4KIkEgAieQ
	yX6d7BSIndZuN1jBJcnHvrAc7Yhf0nvQrv8tmIo6KwRFTMtmi1gdhzTMeSyb28Oz9FZdZSRriy6
	RRGTgGKMhe4ktExjiUnPsDUWTUP27rj4pDVTHFdj4jhQUK8SNnH7hUfYT6Ws0/KrZaIwbZIqxun
	cpWT4J7wRRmgq1r5zZwHIRWDKTYrf84oMQTvTc8bhQgW9WkQ==
X-Received: by 2002:a05:622a:4cc7:b0:50d:a56f:6085 with SMTP id d75a77b69052e-5104c000210mr174310021cf.43.1777940742407;
        Mon, 04 May 2026 17:25:42 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc7:b0:50d:a56f:6085 with SMTP id d75a77b69052e-5104c000210mr174309381cf.43.1777940741886;
        Mon, 04 May 2026 17:25:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610ba09esm37132781fa.10.2026.05.04.17.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:25:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 05 May 2026 03:25:03 +0300
Subject: [PATCH v5 6/8] drm/vc4: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-wb-drop-encoder-v5-6-42567b7c7af2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=behk6Tmd7pmo6mRIbuSh89UzpPSTMpSIp59mKcXVLLY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+ZPiztPJkmE97W+e+LKVL3eX/tHS8K9KXwCspM/Py2PD
 3xwcff0TkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMREOH/Teb8FaWgNg3Tkw7
 RfgfGi1h272T4ff3+AoF322LXy7SEe7+Xr3paDRbyT32HIuj93W+Fp7ye6qwbFevRHjRkwM1mx+
 sTY7iuXvpo0TSPdUpv+bUhn4WEVprKuEZoc6YUrCCKc6mn+G82yr39Yb7ipJeNSr8tD6xyVVxgl
 7V1w3e6amXpe+84V162jB+8wvHSy17lHl4Lmz28ZUxt5uV5ykYfXadk+E9LWctrYoDX86+zY6Sr
 fm3/0SVX3wYs6+HgErvpvrcQK0t91QDn3Vc8z73XU3Hr2VXo2T7BR31zBvtOotmMct1OF233Npz
 besv8adfMtoT1KboFsTGZFpLl1p8Px+x/On9KGe/r+0vAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: j0oewNRQn3zpIP70fZ6RM5GnmXQ-Zy5V
X-Authority-Analysis: v=2.4 cv=d9jFDxjE c=1 sm=1 tr=0 ts=69f93909 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=P-IC7800AAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=YDDQE0DzCl7hcZedIR8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: j0oewNRQn3zpIP70fZ6RM5GnmXQ-Zy5V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMSBTYWx0ZWRfX+BGNC4ywtusQ
 Oz0roGmHPXTmU1jgYshbcdNLW9cQfiiDh7j+A7gPIHbHgjHNsBSoktNsnaBLoEpZZvSI3uU26aI
 lfombjPqY8Q1IsrB/xYpVcMaE1orxtIr+kcH02DYK2agBafD+9/k9xsh1wXLXLBHb3rjZtI3JGC
 lH7eXk7rKJpyUopo3uXF4ogF9bkrGHtaEhlR3Lbdhw0QviyPub856Tmvc3Os/wxdYaatGvWEDFP
 O9nIL1oLK9G610ZpzmcOIzSptGPuA4/DGMTjCqKiIoWAtbEvFq17Xt7PspQ3DGFe4ZuFsRi4Yeg
 8meGBMWgd4YDkiwlK1zB+djgQOzJgYE/NTQ7A5sJLPqQXE2DCILrhvB2917wkk2ZxTQyBx7lgfa
 lgIs+NqpOBRn1uJrUXe3SlUJRbSmUjoUtNsp4hPVyKdZwYy984NS1IwDqsTdlBe821+BUTyTWEX
 KSMSuhyetJ/MzDhCU8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050001
X-Rspamd-Queue-Id: 9DA394C55BF
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
	TAGGED_FROM(0.00)[bounces-105827-lists,linux-arm-msm=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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

The driver uses drm_writeback_connector_init() instead of its drmm
counterpart, but it doesn't perform the job queue cleanup (neither
manually nor by calling drm_writeback_connector_cleanup()). On the
contrary, the drmm_writeback_connector_init() function ensures the
proper cleanup of the job queue.

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 9082902100e4..befdb094c173 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -378,7 +378,6 @@ vc4_txp_connector_detect(struct drm_connector *connector, bool force)
 static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 	.detect = vc4_txp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -602,10 +601,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_connector_helper_add(&txp->connector.base,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init_with_encoder(drm, &txp->connector,
-							encoder,
-							&vc4_txp_connector_funcs,
-							drm_fmts, ARRAY_SIZE(drm_fmts));
+	ret = drmm_writeback_connector_init(drm, &txp->connector,
+					    &vc4_txp_connector_funcs,
+					    encoder,
+					    drm_fmts, ARRAY_SIZE(drm_fmts));
 	if (ret)
 		return ret;
 

-- 
2.47.3


