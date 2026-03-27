Return-Path: <linux-arm-msm+bounces-100507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EGWCOgTx2lUSgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:34:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9378B34C54A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D17B306343D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56DE3A168C;
	Fri, 27 Mar 2026 23:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZF7LbMiw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJwDfu9K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861683A0B32
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654165; cv=none; b=mB4dCpAukzbS+z9TNKTaMfYX98L1fKbxXe/rh2gNrIYrGkI1KjUFBvnxuZ/6nnvMFGVew5BtfLLOcmCUMIQi7gpWGHtl8+4IHrPjyhez2jeGkSz+3Lmo+iuw4fjtUKuJ7zBU/PpnbGXB3VFgbhjn/4oPFxa6NG6NyNybElpx3M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654165; c=relaxed/simple;
	bh=tosnyhh8DtswMdbD6EGU7YTtdFXnAzWlifAthWRXRV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9rEyPMn5UmyAS95Nea1l7n+OUZOf84ZSkfhjpSoOAaHmiUkql5LL2zQnNKWnH7Ds3zBIUQmRtgWvLAH5MTrwGUjb3BcDBTX1zwUJUwxV4yQ2L6N/dIwox2x6QKbiXIc+kHN+nm3ct90/tj5zxoFgcfDPagpl0/whysja6KUKKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZF7LbMiw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJwDfu9K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN3p0F2410453
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zAAZ9np3vSaZuqX49z75F1UXFOFKtBEtrhQT2MwCAZg=; b=ZF7LbMiwEIWTAXC4
	uET66UTjd2FfQFN/f+6QfhVeZPv7kCAqT6INm2CKzgWS2aAfHPbjEh9gLvH6u5rz
	SqeXeW/oJR/q/SSON3wifZ49R8pQZSdBZpBBsKA25UB8G740nViSgYEiLwKR3Ajw
	TGvDPTUfaZlpr+v1rvbhRVLZWCeAJkB1OWs+spT5PwUIiIYZH0atPAhbOnBtAL9n
	Ioe8RTrERxNqYUDbv7DZfgXQ0zmCtbnlItjacixof2f4FIsmhk9iD3oeOQdnxi/L
	OSr3m8TOCEQ1cyxqr88svMCM/oHvsTt5lO0wbUme+noo5kvg0tLvNM+O35C5/4dj
	e0rEqA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vvv98rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:29:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509219f94b0so29234971cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654161; x=1775258961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zAAZ9np3vSaZuqX49z75F1UXFOFKtBEtrhQT2MwCAZg=;
        b=TJwDfu9KPXSjtT9tamYHnk05IMovnBONh6z1Bn09ZnUUD5E5Px/QtOk0muSvlopOuw
         bY1pypVSiAweKilINQlN+cG3OOIhhZ93H1iuE25DFgHT8c+mURcY7eyI85W0RvkrC9Dx
         t7WP9ieaI4eOPI+3ZyJeMLKRceEbNQHYcY2ERAICCmx6NemX5WKrJPZ4A6fd9/QIhh7w
         DqzFg5rmZpiGA4WiUTLGIkyH/As4yk+d2VwiTzfbYqx1QiQRRXTkMAYJPFSc71FUc5Of
         TsYZTRd+rFF6p7mH4wO1tzXn4lYU8PBujxssv73/j6pQ1TB0raCF014iA0mkbcOHVU96
         5xNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654161; x=1775258961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zAAZ9np3vSaZuqX49z75F1UXFOFKtBEtrhQT2MwCAZg=;
        b=TtPVUa9gyWftNcAYBTU75RMzm0gyKVY2Vl4YsiDwo+PC5m9fSKIvfhASkRgk+xdTPq
         F2jBtVuxwIbiE59BzvVZrMuWoWu/+70tmnpPWx9dsh3JtmEu6Dmep1kDCSvj7HDHQz7U
         wieFZclrD1df7z6dya09upGjH/hzBmMJC96WdcN5B92bRrtcRXB75xNOGNwAoMoNayBB
         C9r4Xs3c6pH83D4qG9MS1NuXr38tG4ogaFc5eXCnNBRWN7yMNqILrotshMkfcOsaUXRV
         xZlaL64Vq6gPFhHuCkuuefevgSZLrHIq5bqZrB9RQZ1RbJASpHXiiilZrHfoDrSFZpTr
         MGDA==
X-Forwarded-Encrypted: i=1; AJvYcCVm8FMxqDPFr898tBhVIcTqp9FcjQ8v7IZRARkPS2rEBDdFbZAxOARbvo6j+n5pdp24NtLGExR1tdGqvH+a@vger.kernel.org
X-Gm-Message-State: AOJu0YyURB+Hv0QJlWC+wVyGQtdD3JSXNQuGxDTsk41tf7fxj8XutEip
	dqIvoiW11OIitzODeVsXxfd9KuRBp4rcV4UhXjJppbx4cMZ2c4j7p19XEcttB/+AI1E5LpSbREe
	cSY/b3vpGFytBxSM4vQR7IGffx1EuSCvyzp4tTjSJprlorxnvsi2gMJalCHT9TuLJadK0
X-Gm-Gg: ATEYQzxRnRVLQG1PPGFF4k68i0dC3p29ZexCuoP3xbgkgmRP73GO6N4GmR89EXF1c19
	DZQh08HtEr6uSwt40b1FR39K6W/5Kspesa1S1VeF37kPj/iSv8OVuF3D+6+L2g4V+nps7gMU6xt
	dQOdCgwBXXsA2q8ylXXCz45GjS+eq3kxHGiGCZ2MS/aoUHhZS6hdhYlFajU0q/A3leySm4k8sFO
	L3MiQ/WRJfQ//PBaU29IHWucokkKe98jZvF0f/CpBuknhQUGsxLZNZIucG2U9B+XDn0Owr0K7Zu
	F1AuJEnbNsxEtpmGaWsu4X+44ABB97bO9ogT8srEBYI9tz2/sESNVB2TcQzYd6d3BKyRyOQsIPw
	wfsy4S/jmv6/Djr+MmY97PFOfyiGx0zGm5ufsi0Mgedi/o4u6bdqZ7OLnJ/CboIFjyn3j65Nl65
	8Vt99lyST5Uzj4O5f1t2kIWFfI51ClknCTfAk=
X-Received: by 2002:a05:622a:581a:b0:50b:29f0:299c with SMTP id d75a77b69052e-50ba393eaa2mr68083581cf.60.1774654160949;
        Fri, 27 Mar 2026 16:29:20 -0700 (PDT)
X-Received: by 2002:a05:622a:581a:b0:50b:29f0:299c with SMTP id d75a77b69052e-50ba393eaa2mr68083331cf.60.1774654160465;
        Fri, 27 Mar 2026 16:29:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83729522sm1177991fa.14.2026.03.27.16.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:29:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 01:28:46 +0200
Subject: [PATCH v10 11/11] media: qcom: iris: extract firmware description
 data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-iris-platform-data-v10-11-46b92bfe7b52@oss.qualcomm.com>
References: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
In-Reply-To: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12526;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tosnyhh8DtswMdbD6EGU7YTtdFXnAzWlifAthWRXRV0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxxKpRlhJX4rfp+Vq7KdTmoWr9BA+9M3leZX3B
 3zJ9PanK8KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaccSqQAKCRCLPIo+Aiko
 1QTZB/9ChAlgKNgSaGngIWIaE1Cg9NLwfgnOHvNEDqCIn3l09rKLQGlLSuqIFBa2K68rqpzx4fU
 ArE+qN5ZjUBGjEhC8tE1wwo4ioYZ8TbMid+j2d2y8+4hvahe1/1k68c68i72A3Fqnzu1SG+FHNl
 GFcI66RpS4yLecr/JVpj0QHX1aoRxZJK6IwoUJ/PQaYZrmq8lHdK/Q6IEOVPJ0YN0RREKMZTUUW
 gKQc5qfxHq1JhFb/UjvszWU5ETjd2KgixWGQ91a6X3g5+rfCr4wV89KR7FYcW5METx80khN1YbM
 +eVJYcs1mKsPzPq42AJK/6sKbRkdqbIogYSqFS9FMNIPFjAC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: wb0tG4FYbSYqiHGvhMXv-mOnFKqc-v0O
X-Proofpoint-GUID: wb0tG4FYbSYqiHGvhMXv-mOnFKqc-v0O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NSBTYWx0ZWRfXzgKAjfWyyGA/
 GF8x+6n+oYLa+x3CRa32ItSkYZy25orgQ8sIQFA4MFWyCMJxU2rt/2znFF/j5v1qHnp+/TtXo7F
 nlwTwSn2GYPbvi117Izk22r9vLaALG2K0TUB8x9WXFSuo/8gp33YlHfgpG6AmLIEgk2K/zw3lex
 zj2c0PvFdNuIEC1v8/YxkgGA9j/fVqgKhrmYwV0NwtQTyl5GIMCVL5IvprS0sCWOojg4pMr2did
 g6/Gp0cjQqM4FlmpduVte+YKHkIvfAxXx6aiTPOckCwYZsyRpvZKGjOhPSSVbq/0m5mYWOGvp1V
 +AiONrWLjIjPNsbfz6e24fInr0B1Tg6IF2mpQSpumvfnfQGC+/SOfr+SZnd3f/8OQzpjJnw+A8B
 Z95Zy7qG0R61Bl5GqYptzqOvE18yKacMxAgZtMopjmo8FgQyp7yoIeEYMy+NJeDEszgd7MSt1By
 25yKcK29fu2Rq+tnR4Q==
X-Authority-Analysis: v=2.4 cv=PL0COPqC c=1 sm=1 tr=0 ts=69c712d1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pn2aoerzR4tYcExiNNwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270165
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100507-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9378B34C54A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation to adding support for several firmware revisions to be
used for a platform, extract the firmware description data. It
incorporates firmware name, HFI ops and buffer requirements of the
particular firmware build.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |  2 +-
 drivers/media/platform/qcom/iris/iris_core.h       |  1 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |  2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  2 +-
 .../platform/qcom/iris/iris_platform_common.h      | 15 ++++----
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 20 +++++++----
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 41 +++++++++++++++-------
 drivers/media/platform/qcom/iris/iris_probe.c      |  3 +-
 8 files changed, 57 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index fbe136360aa1..ef7f6f931557 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -295,7 +295,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
 {
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
 
-	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
+	buffers->size = inst->core->iris_firmware_desc->get_vpu_buffer_size(inst, buffer_type);
 	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index e0ca245c8c63..7f36eb65dcbf 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -99,6 +99,7 @@ struct iris_core {
 	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
 	const struct iris_firmware_data		*iris_firmware_data;
+	const struct iris_firmware_desc		*iris_firmware_desc;
 	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index bc6c5c3e00c3..1a476146d758 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -72,7 +72,7 @@ int iris_fw_load(struct iris_core *core)
 	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
 					    &fwpath);
 	if (ret)
-		fwpath = core->iris_platform_data->fwname;
+		fwpath = core->iris_firmware_desc->fwname;
 
 	ret = iris_load_fw_to_memory(core, fwpath);
 	if (ret) {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 3fb90a466a64..83373862655f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -918,7 +918,7 @@ static int iris_hfi_gen1_set_bufsize(struct iris_inst *inst, u32 plane)
 
 	if (iris_split_mode_enabled(inst)) {
 		bufsz.type = HFI_BUFFER_OUTPUT;
-		bufsz.size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, BUF_DPB);
+		bufsz.size = inst->core->iris_firmware_desc->get_vpu_buffer_size(inst, BUF_DPB);
 
 		ret = hfi_gen1_set_property(inst, ptype, &bufsz, sizeof(bufsz));
 		if (ret)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6dfead673393..6a108173be35 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -250,14 +250,18 @@ struct iris_firmware_data {
 	unsigned int enc_op_int_buf_tbl_size;
 };
 
+struct iris_firmware_desc {
+	const struct iris_firmware_data *firmware_data;
+	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+	const char *fwname;
+};
+
 struct iris_platform_data {
 	/*
-	 * XXX: remove firmware_data pointer and consider moving
-	 * get_vpu_buffer_size pointer once we have platforms supporting both
-	 * firmware kinds.
+	 * XXX: replace with gen1 / gen2 pointers once we have platforms
+	 * supporting both firmware kinds.
 	 */
-	const struct iris_firmware_data *firmware_data;
-	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+	const struct iris_firmware_desc *firmware_desc;
 
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
@@ -276,7 +280,6 @@ struct iris_platform_data {
 	const char * const *controller_rst_tbl;
 	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
-	const char *fwname;
 	struct iris_fmt *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 692fbc2aab56..ff8ce078238a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,18 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
+	.firmware_data = &iris_hfi_gen1_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu20_p1.mbn",
+};
+
+const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
+	.firmware_data = &iris_hfi_gen1_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu20_p4.mbn",
+};
+
 static struct iris_fmt iris_fmts_vpu2_dec[] = {
 	[IRIS_FMT_H264] = {
 		.pixfmt = V4L2_PIX_FMT_H264,
@@ -62,8 +74,7 @@ static const struct tz_cp_config tz_cp_config_vpu2[] = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.firmware_data = &iris_hfi_gen1_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.firmware_desc = &iris_vpu20_p1_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
@@ -78,7 +89,6 @@ const struct iris_platform_data sc7280_data = {
 	.opp_clk_tbl = sc7280_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu20_p1.mbn",
 	.inst_iris_fmts = iris_fmts_vpu2_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,
@@ -93,8 +103,7 @@ const struct iris_platform_data sc7280_data = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.firmware_data = &iris_hfi_gen1_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.firmware_desc = &iris_vpu20_p4_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
@@ -111,7 +120,6 @@ const struct iris_platform_data sm8250_data = {
 	.opp_clk_tbl = sm8250_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu20_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu2_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index c2496aa0f851..c3b6cd6fe777 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -17,6 +17,30 @@
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
 
+const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
+};
+
+const struct iris_firmware_desc iris_vpu30_p4_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu30_p4.mbn",
+};
+
+const struct iris_firmware_desc iris_vpu33_p4_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu33_p4.mbn",
+};
+
+const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu35_p4.mbn",
+};
+
 static struct iris_fmt iris_fmts_vpu3x_dec[] = {
 	[IRIS_FMT_H264] = {
 		.pixfmt = V4L2_PIX_FMT_H264,
@@ -71,8 +95,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -89,7 +112,6 @@ const struct iris_platform_data qcs8300_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,
@@ -102,8 +124,7 @@ const struct iris_platform_data qcs8300_data = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.firmware_desc = &iris_vpu30_p4_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -120,7 +141,6 @@ const struct iris_platform_data sm8550_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu30_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -137,11 +157,9 @@ const struct iris_platform_data sm8550_data = {
  * - vpu_ops to iris_vpu33_ops
  * - clk_rst_tbl to sm8650_clk_reset_table
  * - controller_rst_tbl to sm8650_controller_reset_table
- * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
 const struct iris_platform_data sm8650_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.firmware_desc = &iris_vpu33_p4_gen2_desc,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -160,7 +178,6 @@ const struct iris_platform_data sm8650_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu33_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -173,8 +190,7 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.firmware_desc = &iris_vpu35_p4_gen2_desc,
 	.vpu_ops = &iris_vpu35_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -191,7 +207,6 @@ const struct iris_platform_data sm8750_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu35_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index dd87504c2e67..d36f0c0e785b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -251,7 +251,8 @@ static int iris_probe(struct platform_device *pdev)
 		return core->irq;
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
-	core->iris_firmware_data = core->iris_platform_data->firmware_data;
+	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
+	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
 	if (IS_ERR(core->ubwc_cfg))

-- 
2.47.3


