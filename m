Return-Path: <linux-arm-msm+bounces-100955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Fu6JHB6y2k3HwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:40:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E613655D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15E5D3008C16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367963CEB8E;
	Tue, 31 Mar 2026 07:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFQ0Wlje";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EHgkY/Z8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8453CCFB6
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942814; cv=none; b=HVjQSLhxyIxWP9V/8Wmy1TZKvOrUDqrW70JAPUvYjfBHrzD81A+E0a76G77KabrxbH6YHsXP7oN35LI5Un1uctfc/TzILJdVw+2778h7vQ8PQJhPPrJs1V/zJ5KgSWgGl7d/lFEqvJV759JgLs7a056/Fv7i5viUBVq6XsZVWHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942814; c=relaxed/simple;
	bh=o9pxdPoJfkiELITVw7ZSpLtjExuHdSfKJ0n0DkpmG+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ItXQT7O43GdofyggqICR5zdpoeuJ62zc6OCe3sVfS9JBdyDQkxGW6uwefJm+WPagGqrkvPLlNs2tBFPRM7DLousntAPfJyQMYcNb/A1CXdQEoyu8g4+F5wU3YygNV7tKxoc6r66sGkI372F3YpStN0ftpOeZ9irf5L+Kh/6bksc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFQ0Wlje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHgkY/Z8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6jPWX2391623
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vYxV75Z4wnjwOVaThSDC96yl6BuVtN/GBJ2eo+yQEEk=; b=mFQ0Wlje/IjzSQAV
	W992CMCSf63T67Bf71/26I9KP2l0miWOncgv21NoY+yIr7e0hg1L8Fkyc8oer9Bl
	PMrdwVlOU6Tl7txy0SxUqVmeK8Lix0EPQ7Q/54EJLTJBJrpdWmOeI3kWCrL/iOFJ
	n67fFZKF4cv0Rw2/rzrgOQ2q/fQSvf8UT2XVgTEP5PdG/kogsjrzbrwts0VwG2DC
	IX9kA+6dmUxINtlis3JRzGT+jS/0+jIxcnEFdVEQ/wj52JmVz/droI0LgE0SnRdL
	WxZi0oOwtxUgilB8E+EAaVE1CfCh8+A8NxAsTis/vE0PQmo6FeQoYBbcXUlED+w2
	D1EO5w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7kbft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:40:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c44bf176so6988667a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774942810; x=1775547610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYxV75Z4wnjwOVaThSDC96yl6BuVtN/GBJ2eo+yQEEk=;
        b=EHgkY/Z8QGbf8dG0rOK8MtfzdgO4hdQqs9TMQYc+uOekj6dGR7P6tWLMAnFenh6tFj
         Ovn3lpmfU0IwcuAi3+pBux062e2kRj9JAzUZhku8gjjQPgmyy9rxRHHCa8PCiLaH7OsO
         0V7b/OxH2SPwHQdINU1YAyiFMRZw4h0axxM6M3nDUMetINql5VjYHP3WUrzBakjSXNTm
         QMFLE70IXMH8HUNYEKmOtUazKBNNQbYB/nSHOXegVwmv5o2+EpU75Wi3EFkF6aIrF0GH
         f4QOEXmHh14iJU9SSbJTXZqNH0SbhWs+u9gMoiyHtjrNL6YBM5vuFEpK8Mo2M1jqIwoL
         BkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774942810; x=1775547610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vYxV75Z4wnjwOVaThSDC96yl6BuVtN/GBJ2eo+yQEEk=;
        b=tDEDGp/vdJv4Ir3zHp6/bdKjwXGq887sYF9rfGk1lLeGtKwqRu4lSqD9AU7ufnNNGE
         aG9n8V5GZhF1ZCWUV+Ktn/7VhsKQ4xT0fnc/fiC5E33wiZqWhzhLYEyMEq7YrX5TYxdA
         tDC4syFNY9hB/FuOY7/w2CZQ4qVRMnAgZbpt6JpHu27M++B84xdqBNoKne+gLcl3hDPN
         spefyI1AhjwTPET7U4HiVulkH8GqWJgTxY5vEl2hHRv9brmNXqivs4bS3tZyfl5R9WdV
         FvKMUIBk++y4Brv09YAzA9MwUCkLyihqBzuOEGO5dJZuZwXXimbq46e5rqDjup6gQHpu
         VlHA==
X-Forwarded-Encrypted: i=1; AJvYcCWWJ87OyG+TFuIlSJADYXD8vlZwOkJQ0v+7pWijHWbLE62V8bz+1SuRtVn9Cp+QwMsOwh0hIrDSZY2iXv3K@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjyq6d15v7KVkHoihCYoCCNVEnKvfgWiH+uDmIYNdZs7T8SS8c
	JOcHflfgnCNAR6YCJdGs826Ny3PxeDNHQc+ouNg3EhcsA6ZOMGRu31INpYFKCk1ZigP3e3wBNgR
	jDSnKAGpJqQkKXI92q0muB1ab+s6KSwj+wZRfh20LRX6alLpnLEJs+a79UCqS+mNOJPYI
X-Gm-Gg: ATEYQzxhC2k2zsHlvKtYtV9Gt+ZccZGQ/S2DonVAUYJ6SgTPp5+Z8M85frA/mQHY6CP
	o0s70HrzBnpRopbEuEFXqBGufDKuqnxDt5zGHtUWqLdY3Y3v6PWHYeEpxWH3DR6fzyk3xywRdjs
	QZCubJ+mG9Y75gk6KLw901n9WxPhWXqNogR6NrgD/DU9VDOxja4WsY8CUbaunZgkvJKZg9qWD2a
	RcWaFsz0Fe5dnPOpucrVht/T+498SlX5P/me3PJdgo2hdLOc9adgdFZlkvC59CxaWvYuIPh0teH
	Q8lW1fJ6H2azbp2ukTFjdTfXtdBFxu9qvFrXmsNyKc/0j45yB7W3NVl836G/3rPDyETBMvKUIGc
	JuTOKHpPJ90vK/Shrc4boU+N3IsqNIU7PaPhD7hSlZmu97Nzne7Bq15jJFIk=
X-Received: by 2002:a17:90b:2d90:b0:35d:a2d3:5c31 with SMTP id 98e67ed59e1d1-35da3e1da37mr7569998a91.29.1774942809785;
        Tue, 31 Mar 2026 00:40:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2d90:b0:35d:a2d3:5c31 with SMTP id 98e67ed59e1d1-35da3e1da37mr7569935a91.29.1774942807799;
        Tue, 31 Mar 2026 00:40:07 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916baab6sm8013076a12.2.2026.03.31.00.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:40:07 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:09:56 +0530
Subject: [PATCH v3 2/3] media: iris: Initialize HFI ops after firmware load
 in core init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-kodiak-gen2-support-v3-2-958296fab838@oss.qualcomm.com>
References: <20260331-kodiak-gen2-support-v3-0-958296fab838@oss.qualcomm.com>
In-Reply-To: <20260331-kodiak-gen2-support-v3-0-958296fab838@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774942796; l=1626;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=o9pxdPoJfkiELITVw7ZSpLtjExuHdSfKJ0n0DkpmG+o=;
 b=YhtbDfKazact3rpzFkaBQzq06718OGM0mYT7j51SsFDEOAsb85TkzJJMAyBJqhlifjdvNbnzq
 FPqawSWsSJPAdr+7wH1zOVEs8s14fC4fmIHnWakO2ax8j68xFelT+Qa
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3MCBTYWx0ZWRfX/86gPbbst1Pe
 AM12uC3rQgbLKLpwHh9kHzldT7t5dMpEJCaQUzOJa2TKRDBqWgB3s6L3lZKftrn2Iz0u1SZXw68
 OIF6bqrcbvEtTucEvj3OlG/uxeBrT+4K4lAwI3HXIOf7kxxLgSOhFhxXXW+Pmyt/ho9AL9GRWHM
 1cc9mwkG2mq29MaLMfbs243zgHTCoT351U7bvz13EV95pLdApqMJYX7PsPCUyYFyh09et8gUlsf
 +PC6uCd6Yx2Vpa4Osrx+QO1C5z78H1E/GoRnECwnsjSJkVLob1lgxjI9Q5zkRIFSwOI/L7hqGHY
 TaLXR45lpOse4VehbgAdioyrLqW5jz/3SV3ns4zfbgVB1zellS1ladq65uG7GnowxsZ6eQ9UaFb
 cJlFL4zc2ukQqdCeQIXPTYRv4eQNxaWNPyNNSd1NfexiWAk9MK/1il+yKMOL5JxH6VMNqD9WK4/
 BTqCYxaTwdUPIOpiBFQ==
X-Proofpoint-GUID: JrIRcCOmFQmLhv0RBBhtTcsSouhGt_GB
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb7a5a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=u1mmxsKKFvk7TXqck8YA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: JrIRcCOmFQmLhv0RBBhtTcsSouhGt_GB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310070
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100955-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50E613655D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The HFI sys ops were previously initialized in probe() but, we don't
have firmware loaded at probe time. Since HFI is tightly coupled to
firmware, initialize the HFI sys ops after firmware has been successfully
loaded and booted.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c  | 2 ++
 drivers/media/platform/qcom/iris/iris_probe.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 1f326f696d08014f5ebfeb0b99cfed70665fd6ab..52bf56e517f91e98569ee02986183971266e1c76 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -78,6 +78,8 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	core->iris_firmware_data->init_hfi_ops(core);
+
 	ret = iris_hfi_core_init(core);
 	if (ret)
 		goto error_unload_fw;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index d36f0c0e785b7de0e3527e0a824942db0fb79133..dbc15edc602b72fdec8bb2d8d3623676afee728c 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -266,7 +266,6 @@ static int iris_probe(struct platform_device *pdev)
 	disable_irq_nosync(core->irq);
 
 	iris_init_ops(core);
-	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_init_resources(core);
 	if (ret)

-- 
2.34.1


