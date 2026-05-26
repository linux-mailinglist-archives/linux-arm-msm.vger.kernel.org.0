Return-Path: <linux-arm-msm+bounces-109702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FvQF+0VFWptSgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:39:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 636A15D0660
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7E7A30069AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 03:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D973B2FE6;
	Tue, 26 May 2026 03:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wwn4S987";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSUisT1q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40567313534
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779766698; cv=none; b=kY1hY59BeQl73x722w8NJLXXdF10ClKlPqu0bbREb4NBUDXeUWGngPEB6paW6YrGpKHVPHHIeCKKifwXmbuqxi7435sQf6ZNAlzpiJUYGJsikaNdpfY3W2wWG/3tlgv2IkzrGVpCle1PZZS3etuXP2l6LPWIL5ANU61W+HMxLNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779766698; c=relaxed/simple;
	bh=Qyws7gbwoJ7c3ZhvwwCtWaiedRgo9Ev2LjruL6ANdV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GvsOzl05xoYB/5TFDGf7RGCVtLTuGbok71NipNPX+27reLt4OnRNhWd2zUzw0ZPQJWsLuSY4UFN3Mxt4xgMqF30Qerkai8xZKYiy6DRQi+eOKhYNzlyVJiEnoFnli2mjU8yzfCPCeOVkJ7/WYOy0DG289w9Pb3ZvAsa6qMEJCrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wwn4S987; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSUisT1q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2WdZx4117526
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ir8G/BMDgVsCfnEzJpykKt
	cmZKiqz9uMWhBpl8ib1m4=; b=Wwn4S987VEmJJVblObJdboOhJIlTiyrMDTvA7z
	gKiBZYbzDALOWGFxwTT+Ld5mhyTHJTX16bq5eTR+BTRY8EZbTbgbR2arjn/+NpIi
	r7VKwsXjBpNNTC4rAG8NOVGZDuuJXs6Bmj1oO4bqf7+EYuu8lw40+sh3Sn4TDBAs
	/xvJtiLNBZ88K7Q0PaO8zpPB39QBhqkSiPe/xG1jJcQU4lCyxrIAGZCSmH6tLh/h
	v0zZuHZ4c81CblFleDMvmxiz6Dtt25iRnur2TDJIxCqkAjcvwMvifzIqFA2p/bZJ
	49GY4Q3o88+UGCpg+AlWwo+gOP0ZKbZ71bL3o8YTVhbxlcbQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqud9xag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:38:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so106375205ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 20:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779766695; x=1780371495; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ir8G/BMDgVsCfnEzJpykKtcmZKiqz9uMWhBpl8ib1m4=;
        b=PSUisT1q2w3dN5oub7uUNREfpicHE1VDW3BKaFB8paE7ue4KJgTbJsI9M83vb0M8iI
         GerBWCUz+wITJIZCDeQBcOAw02Kx6gWaVferlbJkGz/KaNQhHwYkB57Qs7tpOLrsJm6W
         S9bD2wbIIGOAl4TN9BHiFhcoNBmunXDinERpp6o+n+OSTMDgd4dqPc5fuy1SsQm+uzsd
         W3adVUlW15XlIA4Cu93UNkWx3YJf2bpMou00iFj4MzDTDXGXl7DNiRl0w+VjzzzYkMAm
         YoUoVs5zadGRXliJuDkBDxzaJKKIFDGN4B504l+6EFwo18JL2y3P6Jf2E+8PI4gHwOgX
         SB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779766695; x=1780371495;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ir8G/BMDgVsCfnEzJpykKtcmZKiqz9uMWhBpl8ib1m4=;
        b=fuNwlIthjTVSyiKfTkl6OlF7aYb9HbgFtwIGSi9gF+nRjCBMfd2naoEhvJE6kwrCuU
         4wDDgYe61skCOtqatxH32bZVRRt8MLj1BSYP2UDDF0uf9t/J+heXfCEIKkLRS7VpPmr4
         HsdabXx++3DjWW7hAMu+asVpIMr6DrTkwisu4qjDbAGQbFfse+0tiP+af6KVgsztTHAs
         D27Txe61P+l1avFg9UIvOvR4O1uLaODrbc32pr4WmOOI8/DjoxHNvGOGR8rHebcDlbH9
         fItjSr9FW9ZO87fpK9s5e7GVNihlEcU7+oFXy9dfBIcxKgTFLRk55Bnw0a49NM3R64Zj
         YJsg==
X-Forwarded-Encrypted: i=1; AFNElJ98lDkZNbLkdB0xms/eGJTfhBZCsK30dMuewEjMIWOsx5OH1y6z7lvdghzCw1ju2r52XYEBz8+lEbAWuMmp@vger.kernel.org
X-Gm-Message-State: AOJu0YyKF0K5DYOaPMrT4pWy8BHFSGE91ULVEATFjb5x15H1H+7GEiq7
	IadiUCsyAzdHvOHMIRjWCLymZgM2aaGzy/oeAFDdLl1y5Rl8Qn7Up8P4iB4V+u1I2jSC8fq33CA
	OjPVN3xsFgmoV7rdWkc/dQiAksJGLWpE4kOzzLC0SsyUPYX0VLyhfmQH42v/wvi1V+nnk
X-Gm-Gg: Acq92OFlclqWaI8OTCYbc6QRWo5z5N4J5XiPaqwgsGBxRJPmfKTpgrmTY9l/oEhM5gr
	6ekxNdamjuK3/n1Yfg4j0dQLNAOYOZWWSC4P4d17Erl+elLti3yF6gaNjQ7xyjhTjLoJAO/H0QZ
	kN/zGScT/pkTi7I7PIaLRqczhK14NUNRwqS62HzLSXxMXe6atRm+8O7KFT698EYbGQwxTKZgCqU
	0Ca+8DWxn72kx+4115TvKYeaFqtZD0EEblSokdO7NnrLtP5goWJL4M4xxGywhR8/UMScLHtYFoY
	6+9j6nchReMMI4/WR6PtazMpdoXgz9fqCYOhauhx4nhPD0CM6S9eaBglNrEwBiVN0bTtxMn6RRz
	rhjHteHge7Lh6Djbt5cLZNMaCV3f40wxGRdGt/RNIXrjphhpstr3jLBmyASHwm+F5kcwmNE1PUl
	rqI9MCxxiBbzISIfjW
X-Received: by 2002:a17:902:d4c4:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2beb0711965mr167998195ad.18.1779766695235;
        Mon, 25 May 2026 20:38:15 -0700 (PDT)
X-Received: by 2002:a17:902:d4c4:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2beb0711965mr167997855ad.18.1779766694773;
        Mon, 25 May 2026 20:38:14 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202902a6sm8792005a12.3.2026.05.25.20.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 20:38:14 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Tue, 26 May 2026 11:38:03 +0800
Subject: [PATCH] dt-bindings: mailbox: qcom: Add IPCC support for Maili
 Platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-mailbox-qcom-maili-v1-1-1b689a42f33e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJoVFWoC/yXMQQ5AMBBA0avIrDWhiUpcRSwYgxFaWkTSuLuq5
 Vv878GRZXJQJR4sXezY6IA8TQCnVo8kuA8GmUmVFbkUa8tLZ26xo1kjWJRYIJIiVcoBQrhZGvi
 O07r57c5uJjy+EzzPCy8Z/3t2AAAA
X-Change-ID: 20260512-mailbox-qcom-maili-7c5cce6e672f
To: Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779766691; l=1073;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=Qyws7gbwoJ7c3ZhvwwCtWaiedRgo9Ev2LjruL6ANdV0=;
 b=uNUcVVF5U69zQSUijGcutz8aePs1JyE4N/S8vgaT2gXz2QRG6XDjh2xj2Nu8kGaI+gIKQjoa8
 dOtAeJy4+6QBD4nA69RlWIWj2MNCP50pX1iW1xLlHqE+8C8HtsdWlkL
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-ORIG-GUID: Cp3onDWgiwjciT8yTrzURLDx4Z9O5wK8
X-Proofpoint-GUID: Cp3onDWgiwjciT8yTrzURLDx4Z9O5wK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDAyOSBTYWx0ZWRfXzYPKomizJ/VA
 uehHbLgzD+ggsA6GPxC7AgwFaKtBAgcYUZFOIzk9g2YZnl3XQZRCY+R3ebHIhS4jwkE/4wlEaOW
 2xG3K2RjT7Cw72xdUZeMAqYjLdxO2irnX5doekYzYilZ+SL2XXzpzHpnQqeaLWfG0Qv/dNl0ZEH
 o2qS6Tt3L8BzJas+RcH9tu5og9hAQGKskTy7ewjOiqTy9MxfpKLXpk2zPVVLXb/D93ftEmRrFIA
 OfVmWFWExfsVYjC/g8JbuJUJTuHVsjKOzveQURnFnQ0enhb7CuyjNBpqcWcLig4+5+rMB34EYd4
 O9ycjLS6Vdk9dAGUKYRHlEpoSf1xgseyyyLNfzW9ayTWsiHBw5RmBdC3QDxJnKa0VMWIe0X2Nq6
 Ho/XOd8gMqbL5qAnipASMjQabaVkDcsh3+HOjc31ELKicqy3CYOO7M2YvYR8MRCi5UPqpk+CAlm
 H8GEm5nWq+GxACw9F8A==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a1515a8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hWsel0ni0XcR0EahnUEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260029
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109702-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 636A15D0660
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Inter-Processor Communication Controller on the Qualcomm
Maili Platform, which will be used to route interrupts across various
subsystems found on the SoC.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index f5c584cf2146..4b69a281971a 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-ipcc
           - qcom,glymur-ipcc
           - qcom,kaanapali-ipcc
+          - qcom,maili-ipcc
           - qcom,milos-ipcc
           - qcom,qcs8300-ipcc
           - qcom,qdu1000-ipcc

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-mailbox-qcom-maili-7c5cce6e672f

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>


