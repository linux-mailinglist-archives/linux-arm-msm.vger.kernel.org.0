Return-Path: <linux-arm-msm+bounces-108873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDziC9kvDmoK7wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 00:04:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0B259BAEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 00:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8E1A39BF1E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB774407CD3;
	Wed, 20 May 2026 18:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fs+HKyDd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rr3S8kfg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F327A405C4C
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 18:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779302998; cv=none; b=GONjYNfjIUtDaaFKoUFB0df6RopEOzD56eJTrr/bVB6zY1Ry2c0F02sBKYZRPR0sPj9bOITcQY+4w4tvsjtNZnRCVJt2vr2FYxbte1QHPBHyI3PRFT6sAvb+SULGMgLymJhhcTdNORrnMWLDDpMIglY4qDn/91JK7kffnuQQKuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779302998; c=relaxed/simple;
	bh=FhLKN0G59flNMZn/FwygAvU+2rx7TbCMEf8i53MwUC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G4YfYN8EX+GpgV16MAuXGmij7CMbWvW8cx5mb16UyuECfa1C/UXBfqp3ngavm9Sp8CGWOjLOWvQ//eYXlpBCEzaERrfZdapp6+Pfn8T2p7q/VRhCew1tEuFqpBhNXMLS70mptFyKX1TAg9DIexJFUOxeSBYdt0EeO2kfFaufpow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fs+HKyDd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rr3S8kfg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDXisr1798416
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 18:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DZNpBzAiTwb9zplejH0iPsSqnNfp8+kmLru
	Xm4txizw=; b=Fs+HKyDdYfervsABLhMp/4PzQoWAM4EDxv/DlOqtXxIwTVwgVip
	14OIJNV2PHcj+9B53aW4NJiHC5sA2sPMjsZp50nrwqORs/UUnxcgx+rt5246g7X0
	ALkI/RMAwTC569wkT8+x1BIN5Fv2P5bCnfXPmD/GAZ9oXtdqRPUcbrw5ppH9NLKL
	D3IuNOUbhrCFhGQ9YW8HNcxuEbjC08yaN57+3BGA5DeKk1B3dkcJrv5FfRktvGQE
	4C1wvkyXlGY47nZul0g97kYZeoDwuoEvnsNX+WgscKXV/HNVXJGwEQXotd7fxxE5
	kd67d1VbdEVhDiL+u8mTskMprxAieRnvtJg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu1bae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 18:49:52 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6443138516bso8702951137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779302991; x=1779907791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DZNpBzAiTwb9zplejH0iPsSqnNfp8+kmLruXm4txizw=;
        b=Rr3S8kfgMFRtBOO/ifHDsjUM0kv9Yg2WXCJ/zk9pB6guaBQypHfy7DjPEhpJZq3BCN
         ia7fXsMztxxCHvYG/GSTg+esUfxa4LrfKtW/I21bG2YZyW4+GtJ+NmON4mYc7qfs9SQS
         nRqfBCGQH5f7TrHkyIVneRAmY7DNepDxhbl9vUU/XpP4Fv0P9FDglvZlVEBIPBE0oJas
         rXD1Ka4kj5rWxdMVcNZuDpT/EqF+OVPuD+JOR4AMh4F45bwzgjocyONhQ+hmSN12Z8sq
         HL975KELtvT04kreU621p5DF9o0u1hdcB4qJxgvMG+i2KGqbx4KdLqhZvjEGST9cBHXF
         6vMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779302991; x=1779907791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZNpBzAiTwb9zplejH0iPsSqnNfp8+kmLruXm4txizw=;
        b=FTugEILNkDmp4U7TAr10+0xKNRus1o23lqHSQPrr/U6x67deTcDyTHgVAON7veLDre
         XrAMjvZXRq5owfXG6oRZeyYXoMRkJQYoQaXJnrgDFhuYeH+s9SPw4q2KR6nYCiMETphD
         qIELpuzgnSb8EsCZAd2Wh0H+JsU7zqp6W3mejzNQsgda9g9P6EiKJ3F8eKJjkK/FlhPG
         QHuXLwYzHeIpG6H+hnicjd+SXJZKKpVTPXC4uP5E+DCNoGtK3N2baQIT/vmYunYwutdu
         49QavU5uHk7WZOsvphoCtcXQwh9ljN8IQ6s8uonFOljAkdGKjVM+5NaBR0gQbda/8BAu
         IqhA==
X-Forwarded-Encrypted: i=1; AFNElJ/oJd1wwhAVW6G45rvzVl1pfrtTceFJO1KgXkvcGALv8993AzHzYli2kWe1H9uQkzsu/NF7QTtC4v5J7hV4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6qEbVPPwWAr52BueolqYkbf7CJyy3GvxNTvB/adp8FSfBWK+B
	HrzYRh8xyIGBgAcg36yeL8n23wg6uQRm10rCtp8PqjIFpMa1zrEONFUneYMLN0jw/vmD0u/5tov
	2q7El2myJ+pXBnYwZOKhcJr6anaewObDcUrXukJ7wk4ZNeS3nGzsgcf9q9eT9n3Q1kHjO
X-Gm-Gg: Acq92OFyJpGii3Z/mqviDdmDlVz2nFJdBnq05usSfBZBfCdc4ujU8QQ+BmG+DHtl6Hv
	RTzZ7p3VIf7+SuO569RkpodktqSzvKra9QV91eTHRQj8KEZhW4avQhxhq9XjO44leBkE/VLQKxC
	YqdQIHpRjRdy3L/Xw56Im5ccCemvT1kJ97aROTLb3XRGcoaYx6IjgR3CPco5ck8IkC27Rq4EXAa
	uO28bhyzFM+dAdJ2WYb6IFSf7otdluNAsg0g/eSiWsxr7S5EogN/haXxdLuYgrxJSdnuhTfCc9e
	imD6dofhDPNNkEEyYvMw+k1kgDywlI3kZR5bM/TIu5KOC2cDPJ4ugM/fc91EEhFWBm0rZWgCROX
	cCZ1jhu1itKbbg7xtRURoH6qa6Sef7nOXZNZ4
X-Received: by 2002:a05:6102:94b:b0:604:f155:9374 with SMTP id ada2fe7eead31-63a3eb8af18mr14705134137.15.1779302991150;
        Wed, 20 May 2026 11:49:51 -0700 (PDT)
X-Received: by 2002:a05:6102:94b:b0:604:f155:9374 with SMTP id ada2fe7eead31-63a3eb8af18mr14705078137.15.1779302990344;
        Wed, 20 May 2026 11:49:50 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb8d838dsm139584905e9.1.2026.05.20.11.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 11:49:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] interconnect: qcom: x1e80100: Revert ABI break
Date: Wed, 20 May 2026 20:49:45 +0200
Message-ID: <20260520184944.182148-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=27716; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=FhLKN0G59flNMZn/FwygAvU+2rx7TbCMEf8i53MwUC4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDgJIDhaE00TheSimQuDIf6ClYp0FKETqqSZWZ
 aL1PzmI1xCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCag4CSAAKCRDBN2bmhouD
 19vdD/9dMTP5lTQEwC6uQ9ell3DKMFIym9InfL5/TmuUbQOr9VzPe9WiZGwMBJ7OxqTbtSRHknU
 03dFF9FSglP9cd5R4E2C6yHqtqiQs9g1czY+9z//yvqJNUOsokqVQWubcIfibJYaHpxq0iVu4Ir
 kcoDWbmYFAXtsYLnQD037YDaEHpryhlkpU4bGZwCmLcUu0yQvWWCZQEukEX8vQGDYDpiD9BCsQj
 NLNmDm7fr0RPC3QLlibhJnqzBY3nFh4W2LLRZzyjqrmw3flBb3A36gfs1Px+SAPvodcu6fuUw7J
 8Yks3Jsx5z60NEHd+4Ddij4Zr0/lNzeVMUF05hxykNXxoiuJat3q+0sgdxQ4aBOEbQIoJe6OmOf
 Ja/iU5KSdlsvTtOPOIYtRZltnm/KvEVpq1Oq7c7hdafQwMP80rx9PNL3PSWfx9+ldFuYIiIkP1Q
 ffkWuafJwuMK+dQ0slYEyL2ry72oYELUlN7juZ8f6u+WEqZMugpDSX3dXIgh5oHp2Gf5sZP7Evr
 sQwECedqwlCrbhSKEEFoCO1h2jBTrNJRAH83jd1beCS9duiBYaMPEdCVoNR4nBmJzSe8Mec0HDC
 xs1b8cZVoh6Ba7LluMa1dAwRi50IrQye7SbpZKziDvLiIIPT2YLpME+B3lt8iiqn3iGloeN8A76 goNy/KrFrj78s8Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE4NCBTYWx0ZWRfX7CMwvboE9CJd
 5FpHhgDj5DJrADowO59LglgwS3abdSjo2fbsj0A2DbaC5uZhDHYRY/uMQqWpRUR79HdTMZDd6TB
 CXeq7WctaoLkLMbO88xqL1uVJLdiipqJH0Xz2dB/xtF9ZmRU41rpP6pUPW4TGWhwoCueR7Nc9F/
 Vtk0xFwHEdAnFMk64mrWHTrSpevqo7ZVKVai2UgS2xksbUsdWbyQEKpB5hCy/T6VOuQiUqK5sTz
 vUBA7BrDqfQVfbnOH2CNgS+wD0v5b+q2QM5BnhZlGmgd+c13MwzuPPLOHoZEx6hQFFW9hJCWOWf
 CiJmh7QN/Hhxh8J7lJckV9hTnCA00Bs7lYatMXWXL1mnq4S+PECeIPWvtnh5xdseh1rEdpBg5wI
 O2k3RJCxlDzYlZ7WnO3VGovZFNy0KLq9GBu287S8UoGA9pG/flDaG4SszI6ujJLs/Kl4d5vRs6Z
 1cgqQyowX40CP+H5RdQ==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0e0250 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=Qe6B47XUAAAA:8
 a=EUspDBNiAAAA:8 a=5vypnDYfi1zF71tmcu4A:9 a=crWF4MFLhNY0qMRaF8an:22
 a=QWPKR-PWjQKaio0naagv:22
X-Proofpoint-GUID: kV45ZBgRuUMufgd5QDgWVeTze79At9kd
X-Proofpoint-ORIG-GUID: kV45ZBgRuUMufgd5QDgWVeTze79At9kd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200184
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-108873-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E0B259BAEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Revert commit c70f7dcd0921 ("interconnect: qcom: x1e80100: enable QoS
configuration") because it breaks the ABI without justification what was
broken and what was not working.  It claims the clocks are needed for
QoS, which might be correct, but QoS itself is not a mandatory thing for
the device to operate.

Fixes: c70f7dcd0921 ("interconnect: qcom: x1e80100: enable QoS configuration")
Closes: https://krzk.eu/#/builders/102/builds/70/steps/23/logs/warnings__3_
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/x1e80100.c | 485 ---------------------------
 1 file changed, 485 deletions(-)

diff --git a/drivers/interconnect/qcom/x1e80100.c b/drivers/interconnect/qcom/x1e80100.c
index 8075e0ff2059..2ba2823c7860 100644
--- a/drivers/interconnect/qcom/x1e80100.c
+++ b/drivers/interconnect/qcom/x1e80100.c
@@ -173,13 +173,6 @@ static struct qcom_icc_node qhm_qspi = {
 	.name = "qhm_qspi",
 	.channels = 1,
 	.buswidth = 4,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xb000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -188,13 +181,6 @@ static struct qcom_icc_node qhm_qup1 = {
 	.name = "qhm_qup1",
 	.channels = 1,
 	.buswidth = 4,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xc000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -203,13 +189,6 @@ static struct qcom_icc_node xm_sdc4 = {
 	.name = "xm_sdc4",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xd000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -218,13 +197,6 @@ static struct qcom_icc_node xm_ufs_mem = {
 	.name = "xm_ufs_mem",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xe000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -233,13 +205,6 @@ static struct qcom_icc_node qhm_qup0 = {
 	.name = "qhm_qup0",
 	.channels = 1,
 	.buswidth = 4,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x16000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -248,13 +213,6 @@ static struct qcom_icc_node qhm_qup2 = {
 	.name = "qhm_qup2",
 	.channels = 1,
 	.buswidth = 4,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x11000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -263,13 +221,6 @@ static struct qcom_icc_node qxm_crypto = {
 	.name = "qxm_crypto",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x12000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -286,13 +237,6 @@ static struct qcom_icc_node xm_qdss_etr_0 = {
 	.name = "xm_qdss_etr_0",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x13000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -301,13 +245,6 @@ static struct qcom_icc_node xm_qdss_etr_1 = {
 	.name = "xm_qdss_etr_1",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x14000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -316,13 +253,6 @@ static struct qcom_icc_node xm_sdc2 = {
 	.name = "xm_sdc2",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x15000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -407,13 +337,6 @@ static struct qcom_icc_node alm_gpu_tcu = {
 	.name = "alm_gpu_tcu",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x271000 },
-		.prio = 1,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -422,13 +345,6 @@ static struct qcom_icc_node alm_pcie_tcu = {
 	.name = "alm_pcie_tcu",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x27d000 },
-		.prio = 3,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -437,13 +353,6 @@ static struct qcom_icc_node alm_sys_tcu = {
 	.name = "alm_sys_tcu",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x273000 },
-		.prio = 6,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -461,13 +370,6 @@ static struct qcom_icc_node qnm_gpu = {
 	.name = "qnm_gpu",
 	.channels = 4,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 4,
-		.port_offsets = { 0x51000, 0x58000, 0xd1000, 0xd8000 },
-		.prio = 0,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -476,13 +378,6 @@ static struct qcom_icc_node qnm_lpass = {
 	.name = "qnm_lpass",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x275000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 3,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
 			&qns_pcie },
@@ -492,13 +387,6 @@ static struct qcom_icc_node qnm_mnoc_hf = {
 	.name = "qnm_mnoc_hf",
 	.channels = 2,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 2,
-		.port_offsets = { 0x53000, 0xd3000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -507,13 +395,6 @@ static struct qcom_icc_node qnm_mnoc_sf = {
 	.name = "qnm_mnoc_sf",
 	.channels = 2,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 2,
-		.port_offsets = { 0x55000, 0xd5000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -522,13 +403,6 @@ static struct qcom_icc_node qnm_nsp_noc = {
 	.name = "qnm_nsp_noc",
 	.channels = 2,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 2,
-		.port_offsets = { 0x57000, 0xd7000 },
-		.prio = 0,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 3,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
 			&qns_pcie },
@@ -538,13 +412,6 @@ static struct qcom_icc_node qnm_pcie = {
 	.name = "qnm_pcie",
 	.channels = 1,
 	.buswidth = 64,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x277000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -553,13 +420,6 @@ static struct qcom_icc_node qnm_snoc_sf = {
 	.name = "qnm_snoc_sf",
 	.channels = 1,
 	.buswidth = 64,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x27b000 },
-		.prio = 2,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 3,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
 			&qns_pcie },
@@ -569,13 +429,6 @@ static struct qcom_icc_node xm_gic = {
 	.name = "xm_gic",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x27f000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_llcc },
 };
@@ -616,13 +469,6 @@ static struct qcom_icc_node qnm_av1_enc = {
 	.name = "qnm_av1_enc",
 	.channels = 1,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x2f000 },
-		.prio = 4,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -631,13 +477,6 @@ static struct qcom_icc_node qnm_camnoc_hf = {
 	.name = "qnm_camnoc_hf",
 	.channels = 2,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 2,
-		.port_offsets = { 0x28000, 0x29000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
@@ -646,13 +485,6 @@ static struct qcom_icc_node qnm_camnoc_icp = {
 	.name = "qnm_camnoc_icp",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x2a000 },
-		.prio = 4,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -661,13 +493,6 @@ static struct qcom_icc_node qnm_camnoc_sf = {
 	.name = "qnm_camnoc_sf",
 	.channels = 2,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 2,
-		.port_offsets = { 0x2b000, 0x2c000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -676,13 +501,6 @@ static struct qcom_icc_node qnm_eva = {
 	.name = "qnm_eva",
 	.channels = 1,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x33000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -691,13 +509,6 @@ static struct qcom_icc_node qnm_mdp = {
 	.name = "qnm_mdp",
 	.channels = 2,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 2,
-		.port_offsets = { 0x2d000, 0x2e000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
@@ -706,13 +517,6 @@ static struct qcom_icc_node qnm_video = {
 	.name = "qnm_video",
 	.channels = 2,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 2,
-		.port_offsets = { 0x30000, 0x31000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -721,13 +525,6 @@ static struct qcom_icc_node qnm_video_cv_cpu = {
 	.name = "qnm_video_cv_cpu",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x32000 },
-		.prio = 4,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -736,13 +533,6 @@ static struct qcom_icc_node qnm_video_v_cpu = {
 	.name = "qnm_video_v_cpu",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x34000 },
-		.prio = 4,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -783,13 +573,6 @@ static struct qcom_icc_node xm_pcie_3 = {
 	.name = "xm_pcie_3",
 	.channels = 1,
 	.buswidth = 64,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x7000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_north_gem_noc },
 };
@@ -798,13 +581,6 @@ static struct qcom_icc_node xm_pcie_4 = {
 	.name = "xm_pcie_4",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x8000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_north_gem_noc },
 };
@@ -813,13 +589,6 @@ static struct qcom_icc_node xm_pcie_5 = {
 	.name = "xm_pcie_5",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x9000 },
-		.prio = 3,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_north_gem_noc },
 };
@@ -828,13 +597,6 @@ static struct qcom_icc_node xm_pcie_0 = {
 	.name = "xm_pcie_0",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x9000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_south_gem_noc },
 };
@@ -843,13 +605,6 @@ static struct qcom_icc_node xm_pcie_1 = {
 	.name = "xm_pcie_1",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xa000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_south_gem_noc },
 };
@@ -858,13 +613,6 @@ static struct qcom_icc_node xm_pcie_2 = {
 	.name = "xm_pcie_2",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xb000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_south_gem_noc },
 };
@@ -873,13 +621,6 @@ static struct qcom_icc_node xm_pcie_6a = {
 	.name = "xm_pcie_6a",
 	.channels = 1,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xc000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_south_gem_noc },
 };
@@ -888,13 +629,6 @@ static struct qcom_icc_node xm_pcie_6b = {
 	.name = "xm_pcie_6b",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xd000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_south_gem_noc },
 };
@@ -919,13 +653,6 @@ static struct qcom_icc_node qnm_gic = {
 	.name = "qnm_gic",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x1c000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_gemnoc_sf },
 };
@@ -958,13 +685,6 @@ static struct qcom_icc_node xm_usb2_0 = {
 	.name = "xm_usb2_0",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x6000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_north_snoc },
 };
@@ -973,13 +693,6 @@ static struct qcom_icc_node xm_usb3_mp = {
 	.name = "xm_usb3_mp",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x7000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_north_snoc },
 };
@@ -988,13 +701,6 @@ static struct qcom_icc_node xm_usb3_0 = {
 	.name = "xm_usb3_0",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xa000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -1003,13 +709,6 @@ static struct qcom_icc_node xm_usb3_1 = {
 	.name = "xm_usb3_1",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xb000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -1018,13 +717,6 @@ static struct qcom_icc_node xm_usb3_2 = {
 	.name = "xm_usb3_2",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xc000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -1033,13 +725,6 @@ static struct qcom_icc_node xm_usb4_0 = {
 	.name = "xm_usb4_0",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xd000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -1048,13 +733,6 @@ static struct qcom_icc_node xm_usb4_1 = {
 	.name = "xm_usb4_1",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xe000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -1063,13 +741,6 @@ static struct qcom_icc_node xm_usb4_2 = {
 	.name = "xm_usb4_2",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xf000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -1795,21 +1466,11 @@ static struct qcom_icc_node * const aggre1_noc_nodes[] = {
 	[SLAVE_A1NOC_SNOC] = &qns_a1noc_snoc,
 };
 
-static const struct regmap_config x1e80100_aggre1_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x14400,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_aggre1_noc = {
-	.config = &x1e80100_aggre1_noc_regmap_config,
 	.nodes = aggre1_noc_nodes,
 	.num_nodes = ARRAY_SIZE(aggre1_noc_nodes),
 	.bcms = aggre1_noc_bcms,
 	.num_bcms = ARRAY_SIZE(aggre1_noc_bcms),
-	.qos_requires_clocks = true,
 };
 
 static struct qcom_icc_bcm * const aggre2_noc_bcms[] = {
@@ -1827,16 +1488,7 @@ static struct qcom_icc_node * const aggre2_noc_nodes[] = {
 	[SLAVE_A2NOC_SNOC] = &qns_a2noc_snoc,
 };
 
-static const struct regmap_config x1e80100_aggre2_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x1c400,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_aggre2_noc = {
-	.config = &x1e80100_aggre2_noc_regmap_config,
 	.nodes = aggre2_noc_nodes,
 	.num_nodes = ARRAY_SIZE(aggre2_noc_nodes),
 	.bcms = aggre2_noc_bcms,
@@ -1921,16 +1573,7 @@ static struct qcom_icc_node * const cnoc_cfg_nodes[] = {
 	[SLAVE_TCU] = &xs_sys_tcu_cfg,
 };
 
-static const struct regmap_config x1e80100_cnoc_cfg_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x6600,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_cnoc_cfg = {
-	.config = &x1e80100_cnoc_cfg_regmap_config,
 	.nodes = cnoc_cfg_nodes,
 	.num_nodes = ARRAY_SIZE(cnoc_cfg_nodes),
 	.bcms = cnoc_cfg_bcms,
@@ -1960,16 +1603,7 @@ static struct qcom_icc_node * const cnoc_main_nodes[] = {
 	[SLAVE_PCIE_6B] = &xs_pcie_6b,
 };
 
-static const struct regmap_config x1e80100_cnoc_main_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x14400,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_cnoc_main = {
-	.config = &x1e80100_cnoc_main_regmap_config,
 	.nodes = cnoc_main_nodes,
 	.num_nodes = ARRAY_SIZE(cnoc_main_nodes),
 	.bcms = cnoc_main_bcms,
@@ -1999,16 +1633,7 @@ static struct qcom_icc_node * const gem_noc_nodes[] = {
 	[SLAVE_MEM_NOC_PCIE_SNOC] = &qns_pcie,
 };
 
-static const struct regmap_config x1e80100_gem_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x311200,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_gem_noc = {
-	.config = &x1e80100_gem_noc_regmap_config,
 	.nodes = gem_noc_nodes,
 	.num_nodes = ARRAY_SIZE(gem_noc_nodes),
 	.bcms = gem_noc_bcms,
@@ -2023,16 +1648,7 @@ static struct qcom_icc_node * const lpass_ag_noc_nodes[] = {
 	[SLAVE_LPASS_GEM_NOC] = &qns_lpass_ag_noc_gemnoc,
 };
 
-static const struct regmap_config x1e80100_lpass_ag_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0xe080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_lpass_ag_noc = {
-	.config = &x1e80100_lpass_ag_noc_regmap_config,
 	.nodes = lpass_ag_noc_nodes,
 	.num_nodes = ARRAY_SIZE(lpass_ag_noc_nodes),
 	.bcms = lpass_ag_noc_bcms,
@@ -2048,16 +1664,7 @@ static struct qcom_icc_node * const lpass_lpiaon_noc_nodes[] = {
 	[SLAVE_LPIAON_NOC_LPASS_AG_NOC] = &qns_lpass_aggnoc,
 };
 
-static const struct regmap_config x1e80100_lpass_lpiaon_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x19080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_lpass_lpiaon_noc = {
-	.config = &x1e80100_lpass_lpiaon_noc_regmap_config,
 	.nodes = lpass_lpiaon_noc_nodes,
 	.num_nodes = ARRAY_SIZE(lpass_lpiaon_noc_nodes),
 	.bcms = lpass_lpiaon_noc_bcms,
@@ -2072,16 +1679,7 @@ static struct qcom_icc_node * const lpass_lpicx_noc_nodes[] = {
 	[SLAVE_LPICX_NOC_LPIAON_NOC] = &qns_lpi_aon_noc,
 };
 
-static const struct regmap_config x1e80100_lpass_lpicx_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x3a200,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_lpass_lpicx_noc = {
-	.config = &x1e80100_lpass_lpicx_noc_regmap_config,
 	.nodes = lpass_lpicx_noc_nodes,
 	.num_nodes = ARRAY_SIZE(lpass_lpicx_noc_nodes),
 	.bcms = lpass_lpicx_noc_bcms,
@@ -2126,16 +1724,7 @@ static struct qcom_icc_node * const mmss_noc_nodes[] = {
 	[SLAVE_SERVICE_MNOC] = &srvc_mnoc,
 };
 
-static const struct regmap_config x1e80100_mmss_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x5b800,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_mmss_noc = {
-	.config = &x1e80100_mmss_noc_regmap_config,
 	.nodes = mmss_noc_nodes,
 	.num_nodes = ARRAY_SIZE(mmss_noc_nodes),
 	.bcms = mmss_noc_bcms,
@@ -2151,16 +1740,7 @@ static struct qcom_icc_node * const nsp_noc_nodes[] = {
 	[SLAVE_CDSP_MEM_NOC] = &qns_nsp_gemnoc,
 };
 
-static const struct regmap_config x1e80100_nsp_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0xe080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_nsp_noc = {
-	.config = &x1e80100_nsp_noc_regmap_config,
 	.nodes = nsp_noc_nodes,
 	.num_nodes = ARRAY_SIZE(nsp_noc_nodes),
 	.bcms = nsp_noc_bcms,
@@ -2177,16 +1757,7 @@ static struct qcom_icc_node * const pcie_center_anoc_nodes[] = {
 	[SLAVE_ANOC_PCIE_GEM_NOC] = &qns_pcie_mem_noc,
 };
 
-static const struct regmap_config x1e80100_pcie_center_anoc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x7000,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_pcie_center_anoc = {
-	.config = &x1e80100_pcie_center_anoc_regmap_config,
 	.nodes = pcie_center_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(pcie_center_anoc_nodes),
 	.bcms = pcie_center_anoc_bcms,
@@ -2203,16 +1774,7 @@ static struct qcom_icc_node * const pcie_north_anoc_nodes[] = {
 	[SLAVE_PCIE_NORTH] = &qns_pcie_north_gem_noc,
 };
 
-static const struct regmap_config x1e80100_pcie_north_anoc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x9080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_pcie_north_anoc = {
-	.config = &x1e80100_pcie_north_anoc_regmap_config,
 	.nodes = pcie_north_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(pcie_north_anoc_nodes),
 	.bcms = pcie_north_anoc_bcms,
@@ -2231,16 +1793,7 @@ static struct qcom_icc_node * const pcie_south_anoc_nodes[] = {
 	[SLAVE_PCIE_SOUTH] = &qns_pcie_south_gem_noc,
 };
 
-static const struct regmap_config x1e80100_pcie_south_anoc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0xd080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_pcie_south_anoc = {
-	.config = &x1e80100_pcie_south_anoc_regmap_config,
 	.nodes = pcie_south_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(pcie_south_anoc_nodes),
 	.bcms = pcie_south_anoc_bcms,
@@ -2262,16 +1815,7 @@ static struct qcom_icc_node * const system_noc_nodes[] = {
 	[SLAVE_SNOC_GEM_NOC_SF] = &qns_gemnoc_sf,
 };
 
-static const struct regmap_config x1e80100_system_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x1c080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_system_noc = {
-	.config = &x1e80100_system_noc_regmap_config,
 	.nodes = system_noc_nodes,
 	.num_nodes = ARRAY_SIZE(system_noc_nodes),
 	.bcms = system_noc_bcms,
@@ -2287,16 +1831,7 @@ static struct qcom_icc_node * const usb_center_anoc_nodes[] = {
 	[SLAVE_USB_NOC_SNOC] = &qns_aggre_usb_snoc,
 };
 
-static const struct regmap_config x1e80100_usb_center_anoc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x8800,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_usb_center_anoc = {
-	.config = &x1e80100_usb_center_anoc_regmap_config,
 	.nodes = usb_center_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(usb_center_anoc_nodes),
 	.bcms = usb_center_anoc_bcms,
@@ -2312,21 +1847,11 @@ static struct qcom_icc_node * const usb_north_anoc_nodes[] = {
 	[SLAVE_AGGRE_USB_NORTH] = &qns_aggre_usb_north_snoc,
 };
 
-static const struct regmap_config x1e80100_usb_north_anoc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x7080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_usb_north_anoc = {
-	.config = &x1e80100_usb_north_anoc_regmap_config,
 	.nodes = usb_north_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(usb_north_anoc_nodes),
 	.bcms = usb_north_anoc_bcms,
 	.num_bcms = ARRAY_SIZE(usb_north_anoc_bcms),
-	.qos_requires_clocks = true,
 };
 
 static struct qcom_icc_bcm * const usb_south_anoc_bcms[] = {
@@ -2342,21 +1867,11 @@ static struct qcom_icc_node * const usb_south_anoc_nodes[] = {
 	[SLAVE_AGGRE_USB_SOUTH] = &qns_aggre_usb_south_snoc,
 };
 
-static const struct regmap_config x1e80100_usb_south_anoc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0xf080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_usb_south_anoc = {
-	.config = &x1e80100_usb_south_anoc_regmap_config,
 	.nodes = usb_south_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(usb_south_anoc_nodes),
 	.bcms = usb_south_anoc_bcms,
 	.num_bcms = ARRAY_SIZE(usb_south_anoc_bcms),
-	.qos_requires_clocks = true,
 };
 
 static const struct of_device_id qnoc_of_match[] = {
-- 
2.53.0


