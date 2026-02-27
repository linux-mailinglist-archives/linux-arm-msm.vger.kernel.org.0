Return-Path: <linux-arm-msm+bounces-94500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAoNMFbcoWlcwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:03:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 125E01BBBEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E53030FDBFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A44369218;
	Fri, 27 Feb 2026 17:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZe9bpVY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnUQNOmQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802B9364EB5
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 17:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772214985; cv=none; b=qVhe/ciPYVTWxw9hD0r625qs7ix8rRgg2arDdZHrBuQdUxUCFHLQS6SWJAmuijU6bppku1UTAOgCQNrHCRjZk5B2nPQp7DT8IBtTTaYD1YCculSqSfkz4qOTFNKeEgQ6MXrDtaPurzapjUrhiRYu+wgdHM4RHRKElWs4bMAr9/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772214985; c=relaxed/simple;
	bh=Co+HjJGDekltxs8dXUAHWF7SDFihEvSTV6CiwBQM03s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XaJSLZDxn2Wp/qaDxpqC7XnTKXsR0txujcHHTE8JJhzz3Ary22ypmgMkS7NMTztPXhtbmMJcHXKNfWsSsCl8fTu7udAjAI5ErckYdfmWkjy77ZLUYbzp89xSlYDIwK0/7Nmoo/zDElpY8PMlDYXexT6+gNixRwm3mpBgTvAIPGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZe9bpVY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnUQNOmQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0FJP1912402
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 17:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gO+uSNLp/ONsMfGWwswhZBBJXa+uSXXT8Xs
	qELhEHZk=; b=pZe9bpVYsrOOmYgMXGql8xEgUNoihHFhaQ5OZ4rR2t8LdgHPVoA
	1Ur2unsI4QLHEaye7g3b47VuZiP92eLJlQVeRi1rEp0tYipRbs8TQsGqvbqyESc3
	TVIUWfDfezDM3DzyIiz+jVRuUZ6d8av9iI1rHN8v+kT2x28Mow1UXLQa/y9Z/e6v
	qOumekchomvd0hsIkzRyp4dR0dS6Snmgs1kAlHfDPujJ2jJlZp74z5Vjig+5UGSu
	4aLhVynQoRsM1402wm7vCaxXpADfPGST8G+sQXSZeTiBZRLFdGUKAsYZhBG7ajUs
	LVI0s/EFiUzBn7qumBrMX9TbYxOmL2QRhIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur40rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 17:56:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4d191ef1so288576485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 09:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772214981; x=1772819781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gO+uSNLp/ONsMfGWwswhZBBJXa+uSXXT8XsqELhEHZk=;
        b=TnUQNOmQe4Oslvuc97z2m5vWRW5Pp21i4uSvdSkRrdc0VqUTnsUj9KNs6+0/BIrHPA
         0/7vU0u+1fpANl3gb4H4I0uJgpB5QrX0w+RlnNOBL6RLOuKHV8TaLRhEYTA+I8XkHE9V
         ZcnLvX5brkaSLH7BuTFTF3rrTubaA3e6EPJLQYcerrNdauLUo93S+2JhtXlwkdpKJZtC
         Y+oazFfSn5e8gljig3bI82Vy6oBOuXFFGd6ThOvkRYatFyPdWn9zo/5WIQJwA4JXSSYm
         n9GTNe9XlBxUbFHE88X1rjZdLKYwguX2T5z9Ys1xPOmfiwpMW7D32xCto+F6UuBWMQBA
         LRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772214981; x=1772819781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gO+uSNLp/ONsMfGWwswhZBBJXa+uSXXT8XsqELhEHZk=;
        b=JyAkGJH9XajrWZYdS70PKI75IXlAs7T3hzh23GaT0QahWSBQrp8qjeEDUcpj1ViWUI
         raGaNu3jCMPNR8P3hRyOF6Qxr6wbl13lTRJDLyUzFH9/XIA2KUpm6EVrIWdbqyCMhrcM
         an1AvlRDdDfi8n7C5wAxJdv5KfBdHU0DXjYsNKEv4JJf2RQPYrzvdzk0t08vTMf35M5A
         wJNzyfue+OTu/geqnTNqFSnSQqQ2BoHHX0YOyEg2IA0ysrCEWrWKKvTaOnqB4n5xNyP8
         hQMVvX5qYDwO7S8kWdeVkpohgKFUSq7xP9vdfsOJ7gXUrXPGZtWsfnt84bhnq4LG67nM
         AIJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/Nsj1p+Ba2mBa1AiHd7QR7eEWAEYb6NaCACP3IQt6OJxySzoKPr4LwNxpeR+1GZrhgIz7q4vivLXmoGYs@vger.kernel.org
X-Gm-Message-State: AOJu0YzsniZMGaquO5L+nE9LqBQOUdkFhGY/6BSpigd2ON944s+lUhT6
	El8FKo/WuGNzcIB4aHPVF2mm+9aCYLh/ybswU+3KtAYwuSM0GGRULO2ztciekzg8R+ImeeK9fCC
	MthyJWG0b9V8CjhNxpJDzB4xnU3SJ9AwimMRclPi25ykFgsYYA5Q9FaWV5WoQjVBGpmK5zQipfH
	4M
X-Gm-Gg: ATEYQzyEYYbU8gQwq9jM+yO36DuSuTLOEL/9TBoF3EA4H2IoNpyn4fEkfYQXTFapfIz
	3nSvg//Q0nhophF7hb1/2XwxvVVfWp4cfzqqhcGxjhqJzIf3dTHNvK1EaI8+Kdjrp2c4UzNLZgI
	nIBzT1ht8BnhRzoTxvj2ayYUitioQk+1dGe6sMKG5P91U0GZ329TvbNoo4ccUaZy0WcwOG1XY9T
	nYeLLn3Ir2PHOYxeVM4aJP0yEZuZcEQrer+OpLWvA/0a5VfaAT2NmyMBko8RNM5eh4PWBObRaXE
	RGMW93nXSKqDaiYwHaJt/R3fnnz/94RLQLS8UsfVjIa/Sa1wWKLAe/EeSo3EEyQ4rMZHwuuOsN+
	M5RDsUV1agT1n9BoxOfar1+XGXmR5S+J43VbQNg==
X-Received: by 2002:a05:620a:c43:b0:8c6:d309:f9c0 with SMTP id af79cd13be357-8cbc8e6b204mr416546585a.8.1772214981456;
        Fri, 27 Feb 2026 09:56:21 -0800 (PST)
X-Received: by 2002:a05:620a:c43:b0:8c6:d309:f9c0 with SMTP id af79cd13be357-8cbc8e6b204mr416542885a.8.1772214980970;
        Fri, 27 Feb 2026 09:56:20 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf8b6sm76088025e9.20.2026.02.27.09.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:56:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] soc: qcom: ubwc: Remove redundant x1e80100_data
Date: Fri, 27 Feb 2026 18:56:14 +0100
Message-ID: <20260227175613.164637-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Co+HjJGDekltxs8dXUAHWF7SDFihEvSTV6CiwBQM03s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpodq9LDxo0OsO6SKwnFHZga+TP3a57HEE1Ra6N
 iuyvgTlARaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaHavQAKCRDBN2bmhouD
 11ykD/0XEUY78LtxwcETGKtf5rzuK1j6iTsOW4uI0wxWnWbKU+zuJtNUdFSifEIF98pNV3Ds1pa
 ZMmk+JZl/9uqa6vEGYrj224jXYK8zt4p8UP4nO/bTqm6mKaam6Gw7CL87KtEUQp7ieCGDT31wjt
 ymqVPYLydWfUqF91QWEPFodcEeCL/OKM4Hw2AJkMm33ijEPeVi0Cq6RUVYVFTR+HQqzc1qEciB0
 iLu/nYWgMGZ6Fkr6LBDuJQ0m0WvtVQpoWEKT6ms/6iaAbq6oAvrjcQpJkjaeVUYks9XM8uI0ugl
 rqtl6rgjr/748kXRCxRNCcruyLlf6z1tZ/te/PVVEGE8/oWjZfxGCqpp+ari8RctXt62NhTBdr4
 Y6v8nAuSKucJQzNCwUWRbJAkuElB/n1SeFRHIGtT+zmd2BT+Rtt3xGJFOm4ZDmOzWVGkH3+VMnC
 +cG+isfC1snnkDX7gtG9hDA3wGkEzBExwRCCAkK6uaDCX6954phKez6pwrEhaUWcG8Dpesf5uCc
 ecP8sqp591LHp1CshAZ7316oRArkSbU+PxTI1aqoZZFeGn8AettDaDYMffLWlnpvRdSqPl9vmBx
 OuSIuA7GFCUu5VlTDvLReKSht1B27w3Dwe3VAzpyMqd0zW8VrkviEVyVzDDkbul82UdmgzZaANt 7UiSb7SnD+fWcTw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0O4VxI0RE8DKZ95D6K6-8Tck9CF2lkKb
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a1dac6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=iWbhb1SRmFaL8LoAFIoA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE1OCBTYWx0ZWRfX4WhheaWqNX0I
 g/3rx5xTYfTjXFkm7PINMrxQff4Nu2i6qv52eV8EkwEUa1y1gd4dpKfLANsnoe9JQmycsPw3a8b
 llUD5AC6FvB0vktVlUuq5WH4oRdHMV73rb5WaihZgLbSe61YVwNuG+HrSKq0EE3aXpp/n8BVHGh
 wC6w27vBMrQBcOKpl+plIKckuEZzjpG1ym7pg1YFWhdchmSYGBK1kffzdj+ieyo+rbD9iV/wfAb
 rm5Ua+KkRyjlniUlsJpBDW+YoiTR9NyjRfOWujtPWKRFCq8g2SxZzh7XF1z69gnHm1+28kEIimu
 2+cIcRUNwFT0CKZg8D4nk6vvhi0pM3I7XS1rlS/j0emTwX2sLuaZ+RygF4oLSXwEwy+SW5NMzFE
 edzt3NoKicZw1DjDXpL4LzOxMPvHql9tWevRIL9Icarjq0iaHmFojvBF8hHAx6ZQGjOwnJqg21K
 X6cSyJZ1gDi9RF3Tbgw==
X-Proofpoint-ORIG-GUID: 0O4VxI0RE8DKZ95D6K6-8Tck9CF2lkKb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94500-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 125E01BBBEF
X-Rspamd-Action: no action

UBWC data for X1E80100 is exactly the same as one for SM8550, so reduce
code duplication by reusing older entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c25aaf55e52..63e77fceb6b8 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -217,17 +217,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data x1e80100_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_3,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
-	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
-	.highest_bank_bit = 16,
-	.macrotile_mode = true,
-};
-
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_dec_version = UBWC_5_0,
@@ -294,8 +283,8 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sm8550", .data = &sm8550_data, },
 	{ .compatible = "qcom,sm8650", .data = &sm8550_data, },
 	{ .compatible = "qcom,sm8750", .data = &sm8750_data, },
-	{ .compatible = "qcom,x1e80100", .data = &x1e80100_data, },
-	{ .compatible = "qcom,x1p42100", .data = &x1e80100_data, },
+	{ .compatible = "qcom,x1e80100", .data = &sm8550_data, },
+	{ .compatible = "qcom,x1p42100", .data = &sm8550_data, },
 	{ }
 };
 
-- 
2.51.0


