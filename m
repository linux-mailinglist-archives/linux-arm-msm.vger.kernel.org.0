Return-Path: <linux-arm-msm+bounces-118435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6cgZAeHAUWpCIQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 06:04:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD387403DF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 06:04:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZrSeZKIS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="b+U/RqSU";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118435-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118435-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 521F830182A3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 04:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C38262808;
	Sat, 11 Jul 2026 04:04:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8653A57C9F
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 04:04:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783742685; cv=none; b=n9QKpfNNc4xOw6LfaGBqQ0iG9W2Pk3l+bDNb4aUWM7vq+mTsba5an6emVuvKTJZGbABYKv8rD8TaCQQkvaXEmAYtbUbrqzxHYs2TahXWsbOKYpoSkJ0epy+r/3Z9wVp4Yg1m1DfU91Oup1DecU2cY3tf2st1XS4BekosSXNTkRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783742685; c=relaxed/simple;
	bh=HpWBYzWHYiYkBzSWN/4r+9mOgVQY27kP6NIPJIN3Va0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qo4giXIvb3xJx+FPD5Eitx89paiWNcrlGoRdttMkn09Yp5mZVCafxjLSPYeGVnvYOpAIrzkxRsKyf0V6hCBkMiWmfpJ1yqdVdoffpd/4fckrHd7NQG9q/49ObIVE+2my1rqJon3AdMRJrHKXDE3EcuG8JFZ7eyiWqEmJBMTsOCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZrSeZKIS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+U/RqSU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66B3tV8c2809528
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 04:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cy8uSUWvI/4++ENUPHrBjw
	xaVkdkSIrZafK16KXXntw=; b=ZrSeZKIShCtcmpT4mN79aoGKR8f7XUePGW6M6Z
	xFmZXJn+DMPDQRyiecc3hhZNoqO/+qpDuTXWaxEgVwBKAo9V0JOyRT+/IRiluVQb
	aZWXKfKwowCDAA9NRGsv5zXyS0xu4LpJW4VC2FnIX8FZtFWtMJc2KsyFqApGw6Ra
	QmnqT8F87tc9GIhuTacKl2teZ2lrbLCSGSe4J+z5KK+DDq5QEeOsX8x9LY1uMcdk
	SdA+rZ77CS1RtXODxprX5u+gzehz0EnwRwlmQ6j9Ov/2yCLgOuHjHMRqSShWDtJh
	pnK+nrM0LgG+6N24gImxWTyCHu8UUhwvojJuZnwm0QnqPHJA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr00hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 04:04:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88ab059052so1457096a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 21:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783742683; x=1784347483; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cy8uSUWvI/4++ENUPHrBjwxaVkdkSIrZafK16KXXntw=;
        b=b+U/RqSUKn1RaMXu+wgRZidUGAgfcL/bL4QHovp3htTzMme0RsVpV2RZAfIeCTSRg4
         ytZLVE01EbCYY1kjSUqPpmb9LbpIGgZ20k61laotY1O6Ju3rseSscP9L4qj33xBDhtrA
         roWPuMu4nZR7P+lN5e4oVTjDz9bfKKuoAY/Lf7K6X/aGCRAlFKJM5DGUITvja+Fb5WJ/
         g+G0X9J49NVxx+djXBpzHktd+C6ZIthbVhcYoVRdNqzUItDF4S7yUOJIsEks/jSUO/oF
         WbN4rtTgrqLJXmO7UaA9AbZbSqh+wI7OgZnehais09T4xa3KGM64WTLnjdKQu7jD/z0q
         DFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783742683; x=1784347483;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cy8uSUWvI/4++ENUPHrBjwxaVkdkSIrZafK16KXXntw=;
        b=WbJElNvpsPueiuPMK98E0OoJpghjXS1M1uibAJaUgiJbi/rvWKx1ZVLfcnUfHJpIzh
         wFXg4Zit/58Kdok9VNlbT4DLvumsZyY9Y53xw8isbkG96p9QAZkcAgZHoQu9zZXG2cRC
         Dj0u4zvPw1EvIEtX+H0Gltyw0e543neZHbZEjui5YKBwaGkO+TkCH6qtnRWn++fD97ub
         MTMqYDaWPbkovMeF0kDkG7nAYpejbv3iQR/t+OAh7WNdtmQ1RVZ4CwJysh2Z2lKqh+XE
         PKhoVbSdnqhIjvrEfwyrMXB0Mi6lp/r+49RTBnn6UJXuiMlkyk4X024cTstWRz8yn5KI
         8/gA==
X-Gm-Message-State: AOJu0YxxmVQMtBBckIRil93GJdhnMovhz+5By+pTR6dnkW7m7EcE/IZ9
	MaJp6JBJGnE5Hjz6kizFQmGtg8mOpI2dyZ461jxL/+/yzabZI4C5n1LWTMPhbM5qx8PeT0hEO72
	oQ7OxxqTJ67WR9hjpHk0pCrh0U68MP+W2jRn1H0idic4uUTqf9515zWsNyLt22ePtZt/nqkXKW/
	UB
X-Gm-Gg: AfdE7cnNz8UOWh4m1oDRuuBXJWPvL/mJ8kvP1CpQXRvrBn9zE0TUFFPSmI6PKU9VicI
	KiVQ3usH3hgTf7PvyCzpIfiKaCB3kQHM2/q0Neq4BEmBWycaARY37/1uih2owJZceahHigK9hyv
	XSBlonraRO61ohzp9rAdfLi7GzCswdOmdZYUFHeTqmPqDaNP20IW6BsMfnnkM39c5oZ92/L2PEp
	N7GoccSmGSmn0Rt2aRv2yLf7ZTRp8gDSUWgJKvc5MD3c2uEkWexvHHunkQ2ohxOSoFH7gg5KHfX
	+WRXXNGckKX8MS2XAhlCcrphY7xp6/Vy5Ob9m+0nuEGBtYQv8Co1dbZFVnV0ZaxR3aohs3n2u9G
	VRBs88kj9h8Z4/GBVfLFKtxyDWumWkyr5GdecVAqpFh6XYrI=
X-Received: by 2002:a05:6a20:12d1:b0:3b2:8674:9830 with SMTP id adf61e73a8af0-3c0f093fb96mr7270320637.14.1783742683059;
        Fri, 10 Jul 2026 21:04:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d1:b0:3b2:8674:9830 with SMTP id adf61e73a8af0-3c0f093fb96mr7270294637.14.1783742682612;
        Fri, 10 Jul 2026 21:04:42 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm43386913c88.15.2026.07.10.21.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 21:04:42 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 09:34:18 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_pas: Create platform device for
 BAM-DMUX
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-qcom-q6v5-pas-bam-dmux-v1-1-1e9231143b79@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMHAUWoC/x3MPQqAMAxA4atIZgO1YKteRRyijZqh/rQogvTuF
 sdveO+FyEE4Qle8EPiWKPuWUZUFTCttC6O4bNBKG2WVxXPaPZ7mrvGgiCN5dP56kKpGu9bUpDR
 Bjo/Aszz/uB9S+gBf6MDWaAAAAA==
X-Change-ID: 20260707-qcom-q6v5-pas-bam-dmux-a182d965a02a
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783742679; l=3008;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=HpWBYzWHYiYkBzSWN/4r+9mOgVQY27kP6NIPJIN3Va0=;
 b=6N8oRQRiYif0XgZ6p8CYRebveeG3YiPeAUfm8/EZ1dUKnphWtiIyzFDv8eZKz6rVD8Y6SyOYJ
 tlKfUwFZVtcAV0zDNk26sC3vqV3eE4mbMwA4EjgH++gVdmyR0w1WxS4
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDAzNSBTYWx0ZWRfX3Qq/LW5j6Nb6
 w3zeq6MxNYnH1cuD8bCShm4xww21TLlOhvKnbG8hRWXPIBsRV/p1VumHVsKPRBawMx5DIxSTcSR
 xV+k4u2HvFSP1NXGS+xaJ5i7OQ4NAW8=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a51c0db cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nxsA-RlP2EFdYciYeb8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: xZ7ZleMKKjSBZ55im0N5aMfVh_X38SEn
X-Proofpoint-ORIG-GUID: xZ7ZleMKKjSBZ55im0N5aMfVh_X38SEn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDAzNSBTYWx0ZWRfX7sCRBvPflXDB
 cqYqU4qGx7wg4y+Uh6/tYbHPpGSNUi0CXt84abWUmfIuE6mOuHGJpsA9p7Rit3aXqDzYTc5HSD6
 7ydHZ1BAKxz89UCw/qdrdShfsQ8Z7jmehmPvKiDvM434FNtJKW0SuKstits0i7Sct+w5wr+fMJ9
 pMmN8gCilCZD7Fu8mIAYIQsFh2go++S/PvJoCnmzA6JdHLtYgnWMEcIzBXmadRdv45jwQPTpvbj
 Tk5VJmqhH7igOGz0yChCJz/QWhE57nudUtFePUFh7ca0QdmdADJeNdbur7elzT6dWhSM++dytKB
 ot7aqprurzpRD9/ZZmXJBKTqyTj0fl7vE/mDs11Pn/3nuJVCsh0GjxbW+gUhi/KASr+Oahfq52/
 fbM6frL9RjkPphrVNzlCM5GJZ15aql4Qxml1FE5SIZHKSgAP0Up0faHUD01BZv1fHiXid4nGATi
 AwxQ+gDxbC8LO9Qq8NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110035
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118435-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DD387403DF

Some Qualcomm SoCs using the generic PAS remoteproc driver (e.g.
Shikra) implement the BAM-DMUX protocol on the modem remoteproc to
expose network data channels. The hardware/firmware resources
required by the BAM-DMUX driver are described in an extra device
tree node below the modem remoteproc, with the compatible
"qcom,bam-dmux".

qcom_q6v5_mss.c already creates a platform device for this node
(commit 59983c74fc42 ("remoteproc: qcom_q6v5_mss: Create platform
device for BAM-DMUX")), but qcom_q6v5_pas.c has no equivalent logic,
so the bam-dmux node never probes on SoCs handled by this driver.

Mirror the qcom_q6v5_mss.c approach: create a platform device
specifically for the "qcom,bam-dmux" child node on probe, and
destroy it on remove. of_get_compatible_child() returns NULL when
the node is absent, and of_platform_device_create()/of_node_put()
are NULL-safe, so this is a no-op for the many PAS-based SoCs that
have no bam-dmux child.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 808e9609988d31ff9d18b441914f761192909904..53c839ecc417eba2c53566011f174f3bf811c443 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -114,6 +115,7 @@ struct qcom_pas {
 	struct qcom_rproc_pdm pdm_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
+	struct platform_device *bam_dmux;
 
 	struct qcom_scm_pas_context *pas_ctx;
 	struct qcom_scm_pas_context *dtb_pas_ctx;
@@ -735,6 +737,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	const struct qcom_pas_data *desc;
 	struct qcom_pas *pas;
 	struct rproc *rproc;
+	struct device_node *node;
 	const char *fw_name, *dtb_fw_name = NULL;
 	const struct rproc_ops *ops = &qcom_pas_ops;
 	int ret;
@@ -856,6 +859,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_ssr_sysmon;
 
+	node = of_get_compatible_child(pdev->dev.of_node, "qcom,bam-dmux");
+	pas->bam_dmux = of_platform_device_create(node, NULL, &pdev->dev);
+	of_node_put(node);
+
 	return 0;
 
 remove_ssr_sysmon:
@@ -880,6 +887,9 @@ static void qcom_pas_remove(struct platform_device *pdev)
 {
 	struct qcom_pas *pas = platform_get_drvdata(pdev);
 
+	if (pas->bam_dmux)
+		of_platform_device_destroy(&pas->bam_dmux->dev, NULL);
+
 	rproc_del(pas->rproc);
 
 	qcom_q6v5_deinit(&pas->q6v5);

---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
change-id: 20260707-qcom-q6v5-pas-bam-dmux-a182d965a02a

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


