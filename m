Return-Path: <linux-arm-msm+bounces-101218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPAzIQyQzGnXTwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:25:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE2E3744EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1689030D143A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED97381AE8;
	Wed,  1 Apr 2026 03:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMenfcoJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wb2sokfs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4B437CD57
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 03:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013776; cv=none; b=eneQzm6tg1b9ZQPdnKO4b6bG6lAFs8U9oKblMFtvMlVmFfC/fp9tepE3vVrd/jJ6wjZ54rk9CngO4O7+5xzcqrGLxQ70I4JpNiuAAGHBWfOdVI36Rfi/nBIMpkBVWj1AWX8sssxYqvl1dCnXOBhXCxARsKuwu/l6cim7Iermvac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013776; c=relaxed/simple;
	bh=DOXwknPSO8kS4GpsjjcGsbygukGZn2mtQA+P9ZL0MF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SSoorwD2GwmHi32m1KdXkKJg4AP6jFyGiONiWj8eQnOGdQdNP4HZSWkw/ICYCq2JGCiFfqNXvIWcmKOsl4b22QJqYyITnHs+nyVRctfBxJI/fmk2tiK/e5lSxXKR2S2utp63Lm4Ir81TjRL/+8xBcFYdcj1FgJEmPopY62o9kh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMenfcoJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wb2sokfs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VN3f0h1831835
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 03:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0LgrG8m60aHTZivb3eNUz5aOlnco6nMtQPs6zLRWeXY=; b=IMenfcoJIRapS2Qe
	n+yzj1cIsgVDqE5Y6C0Ul1kvm1Q4NSqZjsVHnwXFqc2uBuZIrz8/UsIurwxeBZ7J
	aunrBX09li/n/Ex9vTeY8bzvevNdhJ44EP2T3OLaub700i6DNEmOTXosVv49aKpY
	RkbMal4uM3osJN28zhxV2y/boFlIL3/DU732TzY46rbH2CvBzjnLW9Dk31ixd5Og
	7E2Zn5E7jQK91xb7stuyVOY4W9XdBbWVZWYRvzQbyyNNsmN+8vah+NtgRbnYr/nt
	A9yeJ4kXUmvjGBH11zPZgHzIROXZzlDuDoPLYGmMCoSC0awT0cIHVWZAkLpBcXbc
	b8Vihw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equbmp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:22:54 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d7ec47eea1so23724520a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775013773; x=1775618573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LgrG8m60aHTZivb3eNUz5aOlnco6nMtQPs6zLRWeXY=;
        b=Wb2sokfsV9AG/8ErP1/plrRvU9a7MeSKj+7g3ngSsU94JLdfCbG74deGD5gvbprOIb
         o7fJ5SeAYvLiZOnU+ihqzjtVNlpn9Upg2WYux8jxpxPCYcC7/OWHPio2jjMi1sxs4ZHr
         8PLN7UZLkcf+B39OaI/FzA5tnFC6OxmNdjuyrPc5bmm+WkhOb5WCCrDipgqayFHKPggE
         47dF/bi8lIGqAjGzZQN9URnIptYq35f27E5W65eTz60EMam48651IS4bDjoxO/k7zkjj
         bs0ZwQjg7V+/2f9vzqSS7ipb2quVNTw0TaJzxf26L8lsx9w6yzwIqnkUgoJo/sOgpcFY
         viZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775013773; x=1775618573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0LgrG8m60aHTZivb3eNUz5aOlnco6nMtQPs6zLRWeXY=;
        b=qFLvP7GmuLw8SratKwJZpf0nJgnORPI7MJ26FZkkoVUAwz+9eO6y92rKI/+JvV12sT
         5c2L3ib3UPs4t/iWrbm8HnAD7VDg0Fcph94qtsXRiGbrJuq3VB8tCQjk5Zv5QFfNDyes
         Xdbn+F/l7q8u1DDCwrV3HsHe3cVo82PCpImYWCr36zLLmh5ILyyF5YrybfWfcVWxqSVL
         +HfRFcKJKbtbwnlDVWKo+5gY00DN0w3WEX9wW3Ps9yDj4zqQzUiQvrTmDmTS7L3DRbOh
         OhRyZwxjiqggj4uf4pOdIo3WLlITW9TQvwvbbWL2qNJi8wTPkL4JdV7ApYPPdFSRtKXf
         oGmQ==
X-Gm-Message-State: AOJu0YwqJ2G12VagfKfRPd3D75paMtP7aPbYfACjaJ9cnb9asMkjz3t5
	3pjhYguqs91bJB7nJSNyO+b9qlJnOnFDRI1bVRzgorqX4DjOifsjCPh3hJNC79zJTS7tAwr3Qe5
	uoSZTPwOvyuWHyqwFJkcKQnur585OhHIv0hf8fgZjXFckwBBJ623uaWdnz7Sj/3gxo0bp
X-Gm-Gg: ATEYQzxcVkN7Yf0DivZ9gYmVMO0RWAZrn3PzjYG6VznoWfi/N1GN5kJndcQSwWg3N5G
	0gDlifT3cXIbmgylQwsbbgKnLrdIjfUkmiSphNmvBb/srWRVz0UNBYkhr2apU76Hy9+GKw2d9lq
	g4DQbzOdT6Ywz8sKO0pqCkdP2DpN3E3M67p2kgNkgqXjgz/XIMkrDUpXFgg8f0YJziwJk/c8u8a
	2lIAF7NeXconyvUXsH87C4ur6QYnbjbI0OWIyGl2Tbm0Z2ItgBbrzWkPqZ9G5UeCI6SvyJfEG1S
	x0he385dtrshDP22cw4snrA7FubF++ilGuo0IBaoJF7+xI4r1JdTIPkrLfNqcB6oT+ag8TT+nwh
	1aSg3x1t8pgTkpSd3+I7Hs7Y8Rc2HHZPJ0G2m6oEl1VE=
X-Received: by 2002:a05:6830:368a:b0:7d7:cba0:8b75 with SMTP id 46e09a7af769-7db99400313mr1420047a34.32.1775013773366;
        Tue, 31 Mar 2026 20:22:53 -0700 (PDT)
X-Received: by 2002:a05:6830:368a:b0:7d7:cba0:8b75 with SMTP id 46e09a7af769-7db99400313mr1420032a34.32.1775013772968;
        Tue, 31 Mar 2026 20:22:52 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336d73sm9589357a34.5.2026.03.31.20.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:22:52 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 22:22:47 -0500
Subject: [PATCH v2 5/7] slimbus: qcom-ngd-ctrl: Initialize controller
 resources in controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-slim-ngd-dev-v2-5-9441e9c8420e@oss.qualcomm.com>
References: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
In-Reply-To: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3643;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=DOXwknPSO8kS4GpsjjcGsbygukGZn2mtQA+P9ZL0MF8=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzI+HrkJvA/cP/LbBw1cuKuXWfEzmCGPwukqpw
 tjyQDNLDVCJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacyPhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXzhw/+Pj2aFY35QSvXe2eILSOyPrX3bhXmJo0jRoEqLG4
 KU3avOXDVvik1F//HpJklEYX7lcGpfhgyBMcEXrnBiCtHqXHXrd/4NchdaaLPWfnKrYx7qTTj2F
 BhjGBmK8OUSHbgVzh41v5QteWh4X8XUOBvhdw8jACcqtZRDLdooKzan52iYzEnSKFtJDtIi3JLu
 3h2VRNur9HRPt6SKOJ51nahfx/cQIy7JQNreHvny3Ee2aFQVvIXnzIoFfrCl1epwfdTdmA/eU3X
 G0XSmN8609KYyPFdh90ZwMiznaA2ZIHEECYZfLDngTuD+4tD35bYdhOXpJS1v5BjVwPkeTsjnNi
 enf4qSRnWn84iSzc4YEsd8SPqSi69jfgUo7CItciXzfXwUFqYyj8w81xEPnPJdevp3il7xatddP
 a14t3f7hC5+mzYw9ce4HrowQosVl5r7STF6JHiBA0Tkark9Y/2KLEjUaKhuLA9vkGZGOaf1tBpx
 aDduv/2Pr0EGJMd9AcZiEYIK5YzQmVFqP7oskAOA9l/Q0EpWRyLseejbwPJ5okwmFAhxrMZJrG5
 QQFBc3i4FM4Tr2M9L6eFcMB4nxZ5TJViE6DEhy0ba5hzjQ7mwGvy25Q2kx/oygWsnThfoKdw83+
 w4ElxsttFzlCp8db7MID7fYvsAVhnUfSHpVDBXdxKGwQ=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNCBTYWx0ZWRfX3DPE1EVvO4RU
 thISh/2J9IiH39fGbdzsFp+GA8Mb7Y9xXy34VgDKe2FkgHjn5ur3xNStybbpZGVYiSloqPKxBi8
 Y8z1TSY0UzN7zLnSd/p1fN29gwrk0UH30ck1Ks1GCPVl0FZlXDTQ3ejk6MYdm9WYAyCa3lrRcLE
 K0XJreTS9cPBD8/IuKpOHuClM061ZVeWj9TZZ2Ezz4CYgmVl8B7xdEK9DDL8c0fKP2vFjeBfFqV
 urF1Y9Uf0pJoV/zu+yiIYlvHVjm7jUYR0Yv8vpjzNa06XX+cyNV7Lo6WMwNR4MSOKzuj2GOQwLw
 cg0Rw/zlV4b5M8NoxZ9UkMdwrTHcgOWFJenNbf1aT6DfqL9c9xGebtrMP/PXbiGT3NzjegluCOU
 4Df5gc5Q4FGC7oGQtk2B/YrEwBOJVpdAdjE1lJb6CTzSbkmmPptwAZ+hZ10AxSK1HzEDX5y6FjJ
 Gd1FnCTXwpVK097tYGA==
X-Proofpoint-GUID: oZ9dDNLztrR9Suq8THt8NRMqjYLBqKHG
X-Proofpoint-ORIG-GUID: oZ9dDNLztrR9Suq8THt8NRMqjYLBqKHG
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cc8f8e cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZDM3EJ2L_4yozt0j5AIA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010024
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101218-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2AE2E3744EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The work structs and work queue are controller resources, create and
destroy them in the controller context. Creating them as part of the
child device's probe path seems to be okay now that the controller's
probe has been updated, but if for some reason the child does not probe
successfully a SSR or PDR notification will schedule_work() on an
uninitialized "ngd_up_work".

Move the initialization of these controller resources to the controller
probe function to avoid any issues, and to clarify the ownership.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 38 ++++++++++++++++----------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 814ecb01b575984f0951919bba0b8ef4fc64a6dd..ca5c1c00fad163c69672db3b37bf225490e7fb96 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1582,25 +1582,8 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_noresume(dev);
 	ret = qcom_slim_ngd_qmi_svc_event_init(ctrl);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "QMI service registration failed:%d", ret);
-		return ret;
-	}
-
-	INIT_WORK(&ctrl->m_work, qcom_slim_ngd_master_worker);
-	INIT_WORK(&ctrl->ngd_up_work, qcom_slim_ngd_up_worker);
-	ctrl->mwq = create_singlethread_workqueue("ngd_master");
-	if (!ctrl->mwq) {
-		dev_err(&pdev->dev, "Failed to start master worker\n");
-		ret = -ENOMEM;
-		goto wq_err;
-	}
-
-	return 0;
-wq_err:
-	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);
-	if (ctrl->mwq)
-		destroy_workqueue(ctrl->mwq);
 
 	return ret;
 }
@@ -1653,9 +1636,18 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	init_completion(&ctrl->qmi.qmi_comp);
 	init_completion(&ctrl->qmi_up);
 
+	INIT_WORK(&ctrl->m_work, qcom_slim_ngd_master_worker);
+	INIT_WORK(&ctrl->ngd_up_work, qcom_slim_ngd_up_worker);
+
+	ctrl->mwq = create_singlethread_workqueue("ngd_master");
+	if (!ctrl->mwq)
+		return dev_err_probe(dev, -ENOMEM, "Failed to start master worker\n");
+
 	ctrl->pdr = pdr_handle_alloc(slim_pd_status, ctrl);
-	if (IS_ERR(ctrl->pdr))
-		return dev_err_probe(dev, PTR_ERR(ctrl->pdr), "Failed to init PDR handle\n");
+	if (IS_ERR(ctrl->pdr)) {
+		ret = dev_err_probe(dev, PTR_ERR(ctrl->pdr), "Failed to init PDR handle\n");
+		goto err_destroy_mwq;
+	}
 
 	ret = of_qcom_slim_ngd_register(dev, ctrl);
 	if (ret)
@@ -1682,6 +1674,8 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	qcom_slim_ngd_unregister(ctrl);
 err_pdr_release:
 	pdr_handle_release(ctrl->pdr);
+err_destroy_mwq:
+	destroy_workqueue(ctrl->mwq);
 
 	return ret;
 }
@@ -1694,6 +1688,8 @@ static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
 	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
 
 	qcom_slim_ngd_unregister(ctrl);
+
+	destroy_workqueue(ctrl->mwq);
 }
 
 static void qcom_slim_ngd_remove(struct platform_device *pdev)
@@ -1704,8 +1700,6 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
 	qcom_slim_ngd_enable(ctrl, false);
 	qcom_slim_ngd_exit_dma(ctrl);
 	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);
-	if (ctrl->mwq)
-		destroy_workqueue(ctrl->mwq);
 
 	kfree(ctrl->ngd);
 	ctrl->ngd = NULL;

-- 
2.51.0


