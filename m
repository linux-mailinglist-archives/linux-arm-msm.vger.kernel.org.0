Return-Path: <linux-arm-msm+bounces-105318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOJ6ESsm82mZxgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:51:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B694D4A0353
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AF0E3055EB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4433FCB11;
	Thu, 30 Apr 2026 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cupf8YAg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qq0QSOvG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E3E3FBEA7
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542340; cv=none; b=KeMF7AUzmi7LjP6xA5Xek+Ryxeo6bCUuJJVgZAeG96kcIvlYHu0zSXaVAEqcg3et9fYYGp2r9vr6hpzMAvmgqYSY0YV8+mimwuRHOErwi9W+WjreI+DQMt+kHmi/q4j2liaiT2/b/EDxjAM0H31vA+u5LB9VAC+p4gAnlRM6088=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542340; c=relaxed/simple;
	bh=u9UYAcBfPm+Cjij/4yHsiT59K7r+ruo3k0BHpFBTT3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h+zIO02fvO5PwFXnIuN/tyqarM88mpf//Yfvb2hNR/VFI7wLaCiBW5q0qTY44TRPFFZdPGO/6h0am1jvQyW/rknpwP0SrF7kC8I2V7efE0h8h9reg3vMCPwd72JrwWW4h5xDaLyQN6Vz+4i6MNQo4so+8rgW1ER/nvpCQ+/R6D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cupf8YAg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qq0QSOvG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U3HBiN3729389
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=; b=cupf8YAgOKOePClH
	8c7dK5mQvmjcxfWxCE//0zxHTCh4u1qdO6dqXRVwAk11ZeExUaBIMRnG/jvlD7lE
	mqEI7QaNBCTbZIv8OzSjsQrEtGaLq8CilTt/KwN4ovaZRFtOrIJQpfNiIkUzO5wy
	4KTRiCv3Nx0W/Gzf3mtkn9N5JVUCGriiVYv0cJ4xlfFMFhtP3fSrEtHLzl4jTGp8
	kj17Isly+JSvFjnrshd96MRjENf8IWe+jvggdVYKWwkjtl56w13VfnZR9rpHHDnm
	CYUyNZtZdqQ7gFBTnl+PV9SgfqJMexQyotpowsfwinHV4Ntmi/Wp1HA07wZ+Bq+w
	imFnqQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duy1w99q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:45:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so489907a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 02:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777542338; x=1778147138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=;
        b=Qq0QSOvGJZ0nVLCUOHs6UZWE89lGBj0wm5hhJ8Rd6KG2igvPOq9iMKok+OX1XnciK9
         vyuAS8erSAkHjUWih48Nd+/hahPdjip5C76SuDXvF2A69+ZjIh83JrIGO46DghROSmyx
         diykMMUs/niDJJiGQrLHENmS80o5nm8n0oJj0qUS4u8vlQscahqQea5hE5/xcMPmL5no
         q9quKuNxT+f/EX7LQLHhtLKWjecF6ks/aI10wW9AQnRtx4vMMpP5wkMkSC2/l29EP1C/
         YQNhaLSryiHYzWoKumW8oEt6MMHTBjPbCXNorrMZM+0Oq8P3jNTqFo5yHTNgKwnpnmVa
         4w4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542338; x=1778147138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=;
        b=AJYtFLenbifq0HAqum/solVlFzFpR3uZa+CcQaJ+cRbf6tuFlcsQkmio8EMFw+MVCs
         GmfZo0FIRM3sLsSNKVXTtxG0asn1+ZBOkLhcOjcO5bO4t2tdxIh4e5gcRXXXPW8wzAUd
         HjgG5+Lsc3Z2+nUF29ZR7SLbtbMWd/WGK8PoRxSMziWooYu/YJgXWHierZQnMbZKrJk9
         bBjP3TnMPs11JObKwcL0fn6ctGDa/A5NeEUBNJxgtQSV1m4mHk5rf7K3TVBS9CJwTir7
         ww1i9pzrL2oZFpzzcS1/SAW3o8oHI7yjXAh9nyTBwsPXclGDQF4eKEm5fh7txzMEHOwM
         0cuQ==
X-Gm-Message-State: AOJu0YzXO+Y+yDaHdKPgfSpgUFpC9M452gh/2oWL5vLTKnVC5009aN0h
	rY2Xva4VcSmoLlhQNbMOe2pm9aBPzCQ2XmVRdmEfwliORb5ogZ/LUENkeTZRF6IKUerlgn87WXM
	dUQP8Tr3nQAYKHY857hi2HfBiEqW/Tk8QAFbb/+zAKhWN+mO9KMkZkRz8BPDtCm7sYcAq
X-Gm-Gg: AeBDiesuhu1J6628OoV+Hblmj2nUounz3KxSPadtAO7bDmTpnktlEoFJp+G3WcVWiM/
	wMivYNbHFtm6p09Rptvev/kQDw+BZAAQOofaHUDzjJPZ7DRE+f01pwUnnMNYWNCgXa8GNlRmw0v
	kXzMx6Z3cDebdBBrvo3GVHmjIYgLaBiWavzPKgLQY7Jof1Ezhc5nXn7dfCCiJ3t+mrWlstGjUcp
	TMLwSLfvpdcD1HPvQtiCsAoi092kEo8Qk0BTpvMwrJIaNAgXpC3Ul+t8aKno5GD0Bdn5OYLO+Qj
	eOyUZ4xgBfN4kh4IbKqP0ETJgt+ZSp+B2EWiBQRUI6qzgwxJwx1KbaabN8jsh8Wy/vCOTkmKyXM
	swEzFwnoZ7Id22rf5oTScmMAtke1H6TmgIlbA75E2WqE7a5Ss+dHBIVkBYJFozg==
X-Received: by 2002:a05:6a00:92a7:b0:82f:8332:4933 with SMTP id d2e1a72fcca58-834fdb078a3mr2596484b3a.3.1777542337723;
        Thu, 30 Apr 2026 02:45:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:92a7:b0:82f:8332:4933 with SMTP id d2e1a72fcca58-834fdb078a3mr2596438b3a.3.1777542337108;
        Thu, 30 Apr 2026 02:45:37 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb691sm4718937b3a.48.2026.04.30.02.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:45:36 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:14:59 +0530
Subject: [PATCH 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra_mailbox_and_rpm_changes-v1-4-61ad7c57ef27@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777542312; l=1107;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=QPOvZ4FdMA2wnx84lf4VqyIVMhJ9E7QIKahaQXRd0/E=;
 b=mq2VuzLxRAGP9zg5b7p4sZnxYqzSs0QHgyWzhLlX2DOzHvOMgBxvjykHYlMoWtnFwY4cTgUkF
 8B9sCbEtFThBlWzoY7kS6dOIHJvWbMBxxPEznqr3jUev3FowOQTZBy4
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: R4WOqB655hC2SdhZHmb3WnRNFTx9WnwE
X-Proofpoint-ORIG-GUID: R4WOqB655hC2SdhZHmb3WnRNFTx9WnwE
X-Authority-Analysis: v=2.4 cv=DPy/JSNb c=1 sm=1 tr=0 ts=69f324c2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3n6LiYR9N_aqWDaFmTgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5NiBTYWx0ZWRfXyu2HQQFZdooZ
 kTls86pqlJzz6I7NdxnFy1M/w1bJTglY3UYnuiMENdFSBzj5fN+VbkelxLZsBpc5u7mAD8TidIo
 Pq/oHt4tgUwJJObet12BVrJyxAHIFquQ+oL5EQGLLtERPrPzhCPTKbkXsOxCh7rN1lTj4DhSZ0/
 EKHqaKHZv2DvU//FUmFb6tbGGmRThaqwvG236pffrEsPKoTdAXVjptmRDDf+qzrnPpxrgHHGV2Y
 LzBiOYBw+Ezle+iGwmC5rrbYNp+um3ywPYmk+vGmUSx89uAgVnXbNd3TgHZXfDiJvDNw8TCgyeT
 B8j4cU/E7DT4KaZJndV4mPQvmWZTqsfVyi31/SEsPjBYdZiBzHxtJpH2DjObBmBBJEQPtwh6Yr+
 tW6i3UL0lWj3B4jSE8FaCbNtdUavTpIDdZWs3jCjsk6tBokICsJ3gsbo/HEIF/hf6ksC6gZ20Ud
 fVdy1V4da98cbIGCGTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300096
X-Rspamd-Queue-Id: B694D4A0353
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105318-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Enable Shikra APCS IPC support by adding the compatible.
It reuses apps_shared_apcs_data.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
 	{}
 };

-- 
2.34.1


