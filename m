Return-Path: <linux-arm-msm+bounces-103857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEBnBgu45mli0AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 01:34:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 854FD434E15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 01:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B1EF30209DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 23:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B42F39A079;
	Mon, 20 Apr 2026 23:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzQXAuQd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZeRIRVa+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB8C386550
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776728025; cv=none; b=MLDY2NkDv8ZpS9AbA2bMfVxBZqEO5VkyLx8KQPy7cqsQtiv4Itpt9pBTZXdbIGcFMoDvX33bYD+/guonuJEmulUrhnIjPbWBIkMEskYuaSP76ixPFe2F4N+D5DjZdp4Wa+LR68Kp5DTtYJI2WfOicruG3ykz9wW+CR9CNzP6xTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776728025; c=relaxed/simple;
	bh=lnVODOLTo2WpHrvqFht5FXa9gKD0IeWSjwE7+hKxwmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PHqFzPPvzT0hGJ3w7dkcocnbQipdOL6BEQreQgl6cmahm46MELAdpo4lNHrbk1KKAFmWwucXFp/dADMjzx3gJAPGXKuR4AvhCBya6WZAhq1frKnSZ+1AItqFW1/AAhm4O3vfwv649rdEf1zUxlCNk5s1h2nJlhyi+Je71ptm6Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzQXAuQd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZeRIRVa+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KIEJZH1598128
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=; b=dzQXAuQdlW4iR2ry
	TsRnz38gOK2mtMk6dIx5AT1dACjOU2lDQez6DPEiozt9Gn/gNZG02jTIjV7nI7be
	4pwYs2jhKOX3WDX2gqYOD5OpLVtqwoLEv9X6eXs8YvnsQWFaU5BYH6tMU6Hijngm
	9V7yU1tKDtnxZvdxxcxRmxNnYKEzlVwQcI21op+XmRfwka+KUllAJR4TN+yFmprl
	P9ArwTDdJcD7wHcha9M/4AKPegHBcq2AeKhLwqjsLvSFOp+QGxwxsbN0MMBGo/30
	W2PARFyHCho4KV9vIJ2RahcfYEC99h6Kte0oyOwKf7QtKl7QlOc/OTIWeJ07B1Bx
	+HsMvw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnkmgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:33:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da529ff48so87829761cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776728022; x=1777332822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=;
        b=ZeRIRVa+NDtENT1r7cg6kWVvvjAwksGKa6Deh1DhczKHN4LoEUIVmGuGYamOFNqYYQ
         uaFv8Cz5+aV5gqN4X8VQg8k9yngE3gSziDItuJBUtxpRzmgmkcDoDvg8nf9/jJBP9hes
         /psbdSk/NOaGzCUU4zjhVIVFhFUwwShGhUuwdymLEXnf0+cg1wzCbjxROGXhn+wFUfRo
         qY5A2KImCJe1vKUQhvYjaM1SzLPcP90utgURSezrNwbc6Se86kVZODGBzEtc2jqBd8/W
         LXCHt5Cw724t/GCOoxN3Sb2TqWlal1FS1Yi5+xTrodpZTKMvUVptCwm7EIifyhQEMhsT
         d1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776728022; x=1777332822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=;
        b=B0/nTFTdO8UjD//dbcL2GDpz95u72KYrZjqpOcJIKEq3FWW20vneoxnaYFqAyLkpDd
         stfSxOCvBZQz2+BvH42zBSfjQEZ7fuHN5S/m3sOGWDZfulR70BQza2WS1z5NtlphW2LL
         lG0QvwmzWrZ2J0Aw2Qxdcce7mJiuB+mAA5K9Gkg+R2qXTtGyPvBukdjxT58vQrjfNZFm
         ybfgkGQRq7M6oDZkXfCuC2kBcvgwgxh5Cc4nMYVNmw20HkHAZtVpGp5slEQsediMBHxi
         JNWy7PkrwA2KqjDQXecGmXt92RfKtS1D1bYFJ5tQeLFEcs2C7F3JdZrVkw5H4ks9NE+p
         4s4A==
X-Forwarded-Encrypted: i=1; AFNElJ8GEycA0GN+KlMnu+HV+byNbaBWPmARzIf7NQZkE1jIQM1xmPHI9LkCa0xALHNAQ1qT9B4Hra2o+YIPRiZf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/RTgcWYsi68E8IfGNOFK1Fqu6l7wPvtTSMSYBQ49ZBA4Su+xc
	9izYDljxOtLXgSg7B64f+6rMFpESDgWxttmCm4ctNnjJ03bWHPKK06ZQJIUMGGemmtqBFDuPTAd
	g8nVLKldeF/Bh/s9PnAWXZQHIKVVKXctsFCB7z5nm2k7LmDQYJp/TdanSYUorUuzZxi/F
X-Gm-Gg: AeBDietn3l0RmtifctMWhC2PtHG6LlcOrIjhMfCnDadDXVg9E+lvrJhwO1FUBt99Y2Y
	4RzqfjEMXv/hT+aeNZ3sVBPJss2jxFDAY/n33XZOU+vWcW5jepMy3FuKNcPMdk15QoWR5qXGw64
	kQ7hpkEcEa7G8ffOGFjj4o2R6s26MEfX4RAvSoQXINCbf3sBEKzL+f9m44bKJfaSPJ7LE+EX+vQ
	tsWijRPJgeRXza6KDEssd0r5dUhX/ZkfH5xCQ1e2ZmcrCk+Xq3CSs93ssJnjU5S7ZHjATqGjt70
	bPQokbXVQqM37mLoMcCUBX3pOYvkV/rCP78lv4DRL23RK8HgpXVG0C6toOlb/xv/6WNbkSCpZQI
	RPv8NwHJMeEjYWd6nSD0S1Dl9V7eUOeZjAXV/YPowYXFQCSZrA34eKyMzR2+27lIXfemIy8br6I
	4K/LXqJ48m40Y2v5JrZzQWOTRaqmud0sPYA/mqrwthOhGtTA==
X-Received: by 2002:a05:622a:11ca:b0:50d:41fa:80fe with SMTP id d75a77b69052e-50e36c74d5amr235550171cf.53.1776728021592;
        Mon, 20 Apr 2026 16:33:41 -0700 (PDT)
X-Received: by 2002:a05:622a:11ca:b0:50d:41fa:80fe with SMTP id d75a77b69052e-50e36c74d5amr235549691cf.53.1776728021109;
        Mon, 20 Apr 2026 16:33:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc627sm3320714e87.29.2026.04.20.16.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:33:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 02:33:31 +0300
Subject: [PATCH v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-hpd-irq-events-v3-1-44d2bf40dfc2@oss.qualcomm.com>
References: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
In-Reply-To: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
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
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5422;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lnVODOLTo2WpHrvqFht5FXa9gKD0IeWSjwE7+hKxwmM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5rfN9qVkcYl9KlTfgDparsbRrCWpcXopk8vuW
 GUdzBXPSXiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaea3zQAKCRCLPIo+Aiko
 1d1zCACrM1rSnOWM/ansjd2L0dlEIFNtiy0HcCmU29ncv+aHHP/gwemRhujKNggpqM10Xv/vUQG
 Ye+SQyG369jmy5xs4UViG3QvpUxYP5IyWXEu8/j9E/YXe1UjYr4QnPO7M1bWNqxYcw7cQ7jvOuQ
 IVrlZf74JvyhWDOXkFAhZf5wtAKeLWc7+43FJlgw3qQWu8s9HHnNRvZuSSd2BtrnmAvUIjtjwZ7
 Jc7cF38VU8CFgmmWGghTzspdneM6lUl1VI0roh/CbwH+TdS1SrF3HdPe5GczhNCuZsqMRIh15FK
 5IfGYE51m6R2SPeO8rvSUf02COXnmuxI8QsXfNwmzGtedb0X
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: TnjYMg5nFvBw3fJ8eS9srr275klmciN5
X-Proofpoint-GUID: TnjYMg5nFvBw3fJ8eS9srr275klmciN5
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e6b7d6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-JEBqWJC5KD3P7x9m9UA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMCBTYWx0ZWRfX6d8GsD4B+NJ8
 MNejSBSeNHVzUtVyZST3orrcB4rDpw0LU01F33GXCeXXhysh2pjsx7vinRk1j3L9C5iVGXrLsr/
 Ll8mauf2eUzmITLnk/J+3eKuCQOg0cq9NB9slde6HG737CI+L87xtxkTtGMJZunUg+FhYS/FIUR
 MdASoFiKrvqVVetMwoEG/PlgJR0ojUaC3069fvUjaW/eCdtaxKFsxaxkqBIy9QYZlcK1EgUHhaS
 HgwJhEFwOG1AiUs9zHIBSmabcVeVx+Dab6f74Nj23Sc6DVVL0DN0OoLGMac1veY7P+3zFTaDIMF
 NBx9GmzXXL5KLUJa4L+sEIn8Y5Sn9q26Cm/Zf0OfAa5W4f/FgxH/lVJMxxmVj5P4F3ZAl1BN/iT
 QZLyQarHRS9kjBcshpemEgdGSrVQw3lrw52sQpuXTHGeJnH95rgSzbfzE152h7NqnBjAujnA51u
 ioAXBMiDZDAA/IyhSTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200230
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103857-lists,linux-arm-msm=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 854FD434E15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DisplayPort standard defines a special kind of events called IRQ.
These events are used to notify DP Source about the events on the Sink
side. It is extremely important for DP MST handling, where the MST
events are reported through this IRQ.

In case of the USB-C DP AltMode there is no actual HPD pulse, but the
events are ported through the bits in the AltMode VDOs.

Extend the drm_connector_oob_hotplug_event() interface and report IRQ
events to the DisplayPort Sink drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c          |  5 ++++-
 drivers/usb/typec/altmodes/displayport.c | 15 +++++++++++----
 include/drm/drm_connector.h              | 19 ++++++++++++++++++-
 3 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 47dc53c4a738..edee9daccd51 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3510,6 +3510,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
  * @connector_fwnode: fwnode_handle to report the event on
  * @status: hot plug detect logical state
+ * @extra_status: additional information provided by the sink without changing
+ * the HPD state (or in addition to such a change).
  *
  * On some hardware a hotplug event notification may come from outside the display
  * driver / device. An example of this is some USB Type-C setups where the hardware
@@ -3520,7 +3522,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status)
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status)
 {
 	struct drm_connector *connector;
 
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 35d9c3086990..7182a8e2e710 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -189,7 +189,9 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 	} else {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
 						hpd ? connector_status_connected :
-						      connector_status_disconnected);
+						      connector_status_disconnected,
+						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
+								   DRM_CONNECTOR_NO_EXTRA_STATUS);
 		dp->hpd = hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		if (hpd && irq_hpd) {
@@ -212,7 +214,10 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 */
 	if (dp->pending_hpd) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_connected);
+						connector_status_connected,
+						dp->pending_irq_hpd ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd = false;
 		if (dp->pending_irq_hpd) {
@@ -397,7 +402,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.conf = 0;
 			if (dp->hpd) {
 				drm_connector_oob_hotplug_event(dp->connector_fwnode,
-								connector_status_disconnected);
+								connector_status_disconnected,
+								DRM_CONNECTOR_NO_EXTRA_STATUS);
 				dp->hpd = false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
@@ -827,7 +833,8 @@ void dp_altmode_remove(struct typec_altmode *alt)
 
 	if (dp->connector_fwnode) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_disconnected);
+						connector_status_disconnected,
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f83f28cae207..e05197e970d3 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -91,6 +91,22 @@ enum drm_connector_status {
 	connector_status_unknown = 3,
 };
 
+/**
+ * enum drm_connector_status_extra - additional events sent by the sink /
+ * display together or in replacement of the HPD status changes.
+ */
+enum drm_connector_status_extra {
+	/**
+	 * @DRM_CONNECTOR_NO_EXTRA_STATUS: No additional status reported.
+	 */
+	DRM_CONNECTOR_NO_EXTRA_STATUS,
+	/**
+	 * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
+	 * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
+	 */
+	DRM_CONNECTOR_DP_IRQ_HPD,
+};
+
 /**
  * enum drm_connector_registration_state - userspace registration status for
  * a &drm_connector
@@ -2521,7 +2537,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 }
 
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status);
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);

-- 
2.47.3


