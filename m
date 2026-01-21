Return-Path: <linux-arm-msm+bounces-90036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIJNIgLpcGk+awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:56:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF5758D2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 46CBC749E42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0398F3A8FE2;
	Wed, 21 Jan 2026 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ao1CWFBg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="by0s3hK4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF4E2C2340
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005721; cv=none; b=JeF8rlMqFZLG7wdQQQIhuen00VYGzw7LamK6AK85Iu/xONzFLSFu0JrNhYlHMsnCr8qQjxF6DcAPkW1n5oSoSvPg9tOgcTPs2ZLpfUoV9lfBrb79k/nPjT421XBC3SPplgeKGDmJQBwwrrQQHksf8824ZGdoyK1eOSju+x9Zk48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005721; c=relaxed/simple;
	bh=8PIwfRUER3djXnm3EAAf1LNSIZj5ypn/i70BJ5FvV1U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rkj50i7ks7HjC72xINAtvG7KtOtVAIB4SQkYtP5wljUtDDpU2ea1PY4Jrctr2pSroT2dolBWA+OjxIz5frupaoYNtoop4BeLefXXHoBmXC5dodBl5T1UJKJsFQFDwK/vBSIYMJT3nrYo3+556Kt7ssVIAshnZu+hvq8miYLVRPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ao1CWFBg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=by0s3hK4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LAEHLn3229089
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dLZIDtswwT/
	chM1OAjfGCiNb9WkQTQKqia9C4XzX8r4=; b=ao1CWFBgMJGVzNn/WMG7quJHkSv
	gZxE8nOmjDWgU1woE85Bjn1E9wSxoiPe0Ywor1EZFr6diop7j6qFY8mO6p3NZ9tw
	GO71hJRuPzFYNK46TMQoi8jaoHmtSM5On8n8Zlq33qgRe88MVHS0fZ0tc3/BoQzb
	G5qGcDKckDFLjX2CfywKmTddomhDDNQlmXDBpo1MtcglCQjl7vnWkfV+sgCyGDrB
	PA40ox/v7byInTJvWGMBet//U/Jvt7Spn1jVwtTFpVrNrP3yKV4EYSFEtOP+ph3P
	ZzopI/8OnhHcJNDnmBAPUlXg7OnO7MKXojX/7VOF/jT+bRD1iYLgKo4Flrg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btqvpa24x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a7fb4421so1202259385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 06:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769005718; x=1769610518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLZIDtswwT/chM1OAjfGCiNb9WkQTQKqia9C4XzX8r4=;
        b=by0s3hK4S7JjwJHMVyq1IdWeq1f0uy/2pn/KUgO7J/fEO5ysF6VssDDLhJ9q6Sa2Ww
         wMA/D7cVfZChQdNMTcpB1uA97GrM11198U8EeN1+wGKDibVeuU5cPKohPSRGyWddLLOM
         LnbxR0jpn7NRoPz2eoggkLFqGnGo+IJ9ZOENTIIX+njjFKtY+RtPESiXwK/8FTY4rEP/
         VoP+41JNuUtA+89JYGUw7pJ3wjcWkFDBPFQ+SN5s6StqkONu1dUp7DRhOTxuXNwcP/+Z
         Os3+TWiK7k24Nr49/slk7dsuO/CZlamDL35bhypPHpb66rArkloADdshsIwvEKf4g05x
         4wmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769005718; x=1769610518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dLZIDtswwT/chM1OAjfGCiNb9WkQTQKqia9C4XzX8r4=;
        b=YHTX2hC19acp//2stt1DwGZbwuD1+uMdsn7BzQ8IqJmMsPGNmD7BdT+kk8YKnKLymj
         iuRYQhPqTIXMOLS0res7q9J1s88l/oo1zh4V6ABHpJxLtN9Gpr/iwleq6v+lnE5OlP/1
         IakvGcKxqYuLYWGOAxWsBZEnz1xGP166oRF/4XYHDmv88oBoi+Yx1/l23I46lFo/pnpT
         iS8Xo8lqS6qLnsjOw70HWZKadAg51MwoGXaY3QtmaYNFO0UFKY7m6vJycuUdo5w5vZft
         KKhKflmuJFwWS+i2O4zmvvFPVPjouTk98BIS8yvj9zQjvvLTNfG5ELkTKWJcdwu3Ff4W
         g2CQ==
X-Gm-Message-State: AOJu0YztDlcBlQNv/C+QUqK35UPCLtqtcD0/b4rR76AvjlsyBS/HsTxa
	1FPSE5bgOYzhJoDdMUqgaIjHSel8pxZhY5NaRorxhcjmVwQSb8Vlp+ml6e63kLV1tuWPYKQP1Qk
	u9JhN/a9IJPSh+7e6K5kJnyxqLH/NwurPvTSK6vzbDxx6z/L/1cdBWcojbOt2zNQkioCR
X-Gm-Gg: AZuq6aIHwWNYo/Pn1W/22mjkGTa2lU9DdYgHIkmXEoMIZlk1nt/D64upnho1j5vpu1H
	1nA+jNl4Z16BQP8XyQjHAIQdr9WlgMoSWGcHfi+UGJLhpXY7yIHsAnRVrp9Iz5MgMAm/+5KnjqO
	e22gnWTRbEHUAEOKfCpxDn7dXX+puk/Y7Qa+jx8pdgfD4BYdurXLwtpfnEYrwBTSwXcLmPZ20Hu
	BTUfwve0pQpXGJKDxg+C1lbwaEVPGFMd2LcMuCevrzPtJbWA4KGM/kQSWnoLeGW3W1tdfq2ktVC
	tsnaviuk5/U/988D5UAz0AyTdFqQdGqSp4c4AN2TjwhffE8Uf+ZLivWpAq7366+qwmH0a9BQYkZ
	rqnrvCLQGSLBpV43wYsUV45i8nf+joZhAM6QuV/d6xBPJG+KnRzLIgNHjPyi2WEX+nL1IeWffs6
	vKKUsL
X-Received: by 2002:a05:620a:178a:b0:8b2:f892:9136 with SMTP id af79cd13be357-8c6a675b001mr2368541985a.42.1769005718444;
        Wed, 21 Jan 2026 06:28:38 -0800 (PST)
X-Received: by 2002:a05:620a:178a:b0:8b2:f892:9136 with SMTP id af79cd13be357-8c6a675b001mr2368538585a.42.1769005717985;
        Wed, 21 Jan 2026 06:28:37 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a0d:3344:10b3:c488:b09f:b54c:1120:95f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435996540cesm6098180f8f.43.2026.01.21.06.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:28:37 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 2/6] phy: qcom: qmp-usbc: Fix possible NULL-deref on early runtime suspend
Date: Wed, 21 Jan 2026 15:28:23 +0100
Message-Id: <20260121142827.2583-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GwwZLNLh3ZT9uA8hzqRBYh1neDKc8WeX
X-Proofpoint-ORIG-GUID: GwwZLNLh3ZT9uA8hzqRBYh1neDKc8WeX
X-Authority-Analysis: v=2.4 cv=cdPfb3DM c=1 sm=1 tr=0 ts=6970e297 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=qE5JlSMSJaPhyfYheT0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEyMiBTYWx0ZWRfX1eIVE0hmPU2A
 2wDFltp7Fy3czIee07crR8TCQWaberQNioYi2cnGHBRnq/DjLXV+/1HKsuhRaNKjuSATn3T8h5Q
 zu5/x/8bBgkhOdDoMwrhjct6QDSZdvt7y/ExdZSJlmYXtX+v2BM9PMTmqQRfw/W5TIYa4YMxRcV
 CX0nG5KZ3cLUKUg2dPslxa10ADiBWex1VKNz1CjzRLn6XcsZYqVSqxZ5kLeVxzekCnxEnATAVwn
 jSZUw0720OFlMhP2f7nGcgcThVkCj4NUe4HDj8KSEQKiQoLwQ0HNlOknfARgIcoH5Olelrs+NpG
 bCpGF3qrLvNiMGh6GtHcrEQZuXGhRNLpPI0l8zeaIu0Cj/sKkj/4wtFY9ucJXYNxKnweujLx4V6
 H6m+9RR/mcm/PaPEDCR74IyKH+g2rNXJ0T5Jaom1JQ+YMYmbhOpqP6C7LEm1xCpf0H0fDFxQVz7
 jD7qODcbkvbVZXZpcHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210122
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90036-lists,linux-arm-msm=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CF5758D2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is a small window where the runtime suspend callback may run
after pm_runtime_enable() and before pm_runtime_forbid(). In this
case, a crash occurs because runtime suspend/resume dereferences
qmp->phy pointer, which is not yet initialized:
    `if (!qmp->phy->init_count) {`

This can also occur if user re-enables runtime-pm via the sysfs
attribute before qmp phy is initialized.

Use qmp->usb_init_count instead of qmp->phy->init_count to avoid
depending on the possibly uninitialized phy pointer.

Fixes: 19281571a4d5 ("phy: qcom: qmp-usb: split USB-C PHY driver")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 5e7fcb26744a..edfaa14db967 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -690,7 +690,7 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->usb_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -710,7 +710,7 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->usb_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
-- 
2.34.1


