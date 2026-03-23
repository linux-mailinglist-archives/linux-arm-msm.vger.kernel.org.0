Return-Path: <linux-arm-msm+bounces-99106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAv+JRvewGn6NQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:30:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8CA2ED125
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 794BD301CCE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 06:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583452D8385;
	Mon, 23 Mar 2026 06:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7UjFynT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MO3stffu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226172D73BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774247270; cv=none; b=oJ5EiYgVsflHo4lOEtDi6fwvDzbNN3e1zGq1IwvXYxjWkBM2HwVsrEjf+yzBZf7qa3hN6ji+BPejIvmgBNMaN9Osa3NKRopd0EO53rD0fkw8IY9y5i2/b8v3qbep8uN+y2kn4d99+W/2gUpV4ShfRMWyRlBiF2HFqfHx2SQGE4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774247270; c=relaxed/simple;
	bh=pcAWESZqAAUcBbHQyjnnp8rAW1WcS4UvO2bffi/okbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kl2FW52qI7/TSHNc97GbHxmFFnH6g3uu7/drslKRNXz1CfPZwTlBvOdUOk55Ak1FLOmpsBl1cAEKjlzkQF6bPUsg5UH4tGFERsG7gVsOEz+OPzaj6usMxRcBBmsfeXt/HzeUwuU06LrnkjjKecd4OCdJQ40kIugdNAAlf9+fDe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7UjFynT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MO3stffu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLt1oi2513219
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hfzF2zCkp1A/OqUrbsHrIJ
	XlCBjWVKNwLtnSjwHiiZ4=; b=H7UjFynTLbiIoWvFpOJmjucD+MpVdQmxSMx0Yk
	A3tE+7sC55FXZSxVkd490UT4hC2Qvk5OG75SqOFlon18Q7xN7Ex1tuS8pZFKWkqU
	n4IcB3+Poj+N+vd+KNqdd06pbqvWwDxB5i1uO7UxSoVmULia5kVh93eZ1tkch+ja
	/4G4fCAkJ/pLFm9/HVwflpkSslu7sJ0Vm/H11uDz8oDPjTWEJGMwpz3sw1ME7tq2
	HOvoO1C3yN2Eln3mJ9DJyDgyOj23sr5x2oERxn2N8Ne+ZNWBspGlRI+r6eDXq5eu
	fUFKhs1ms072SWDZt1mNRdniLCyZ+ITlU2Q4/rKyry+h/yIg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jb5m3xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:27:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0fb39b41aso23875045eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 23:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774247267; x=1774852067; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hfzF2zCkp1A/OqUrbsHrIJXlCBjWVKNwLtnSjwHiiZ4=;
        b=MO3stffuIMJe2q7aIF6jCo/Va9CqDaba5VOIUX/Tcnkn1bEm9zcG//1+wDsDq07s1D
         T5t79mZc6MjV7YEkO4tsU2Jmg50mkrjJq/gLDFrR/RBeVgvLhPwFJBDrkJh2yGK1cZv2
         9A4zgS+u27XE7MIvcf3WGNschBlnuLhJV4YFCJgSkUTPY77RZmz3LQbBYIHWl3fSMZV0
         h8Q8Wy6AoMVqmxG6IKWLAgOaBMZpa5V+WIM9JY39x1F++CsygWTwNvMfafFUhAUTNS/Q
         dthgx0s/PiyHR/9nKPZSCbDB4VXrj3uVfZlQvVHLSRM/tcTLqAzoS27NkBeOfKm81U6d
         ++ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774247267; x=1774852067;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfzF2zCkp1A/OqUrbsHrIJXlCBjWVKNwLtnSjwHiiZ4=;
        b=astSVHViz6UOTT2/qZVtWRlQVc1WKXHYQbOlAZa1VxTU5mqE88/VRSMGHIDnvQhB3d
         Ath6hJUju+DRElO0WC97rSRsjBTulNEY++d7Y+kQtGNwhfxYpxpkONWr2NNkUNmI3m63
         KfyOzp2Qxi9cURFtK3rWtcWayVFsvGa586Of14cwWG2CqX7NZ7FLMOzRzIIa4D+QdyV+
         JCNc4u//8HzIzitMkn9rnN0kfLB5OAwE2DUGxHvt1zmyc7YFp6JCPGzOrquA+1yKASZF
         ktmYy6wxKUF1UFcYIylT1SMSQpt5md5c+OPnfK3mv15NaNOxFwR32diBAgg5XSIzf/MZ
         EYSA==
X-Gm-Message-State: AOJu0YzuS2PfRFdE+XFyIZMgBP/FEnqqU20fts3ThGHxihlWV9rcHYWL
	rhqRJ+JcHXG+NpyUxp85zmGZKioKzvC2HZEbNgOEzw4mA4XqMIovmQ6fvxl7r0HrMclERK7ZZoj
	xcqqebzQkRzB5P71hSnloV+vCUh0UYNhVoXDQ4E35mPbj9TRArGt9wz0DhZGQJa5ObkYkaWrH0I
	Nme7k=
X-Gm-Gg: ATEYQzxI7yRqWDDax/balaXAzNg/hoGG9qSQFi0HE7zHiWauLRZxhrSgUNl/X4WbC4T
	BRzmT5BlJNZ/ROxnv2qbm2apLSdy6vR53sn/pGF9RnklcsRtqrBfsFuA0T1EDfZdZSWX/sjGi2v
	2o6FtnM3xTpbnIzsTIZvT2FQscMWY2gqnpOeMgbRMhHMZjICpqpM0spffEi1L0cTBNSAFetVBAk
	3sBqbeY0An7UkXWsFiH7cPMEenF6X7ypNUs3enVvqxkzZxp1DLn9LlYVQaCWEedlIw65W81x4JL
	7xzdlY5fW6dgodCcHq78+xqQDrfmXi/lOWlcczytIs9ZGbxjCjFUvRUjwBsAjWE5EHsAFpQGW9C
	haYuM3HZc0FrP4lunYhvplla6CBnEj+zBAmcQwveavy7GOXthdyWXKEhl+x8sjvBWIWEo2HXFqL
	+B05yegg9cVg==
X-Received: by 2002:a05:693c:2c0f:b0:2be:8907:b03b with SMTP id 5a478bee46e88-2c1095a74f8mr5341758eec.2.1774247266955;
        Sun, 22 Mar 2026 23:27:46 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0f:b0:2be:8907:b03b with SMTP id 5a478bee46e88-2c1095a74f8mr5341742eec.2.1774247266445;
        Sun, 22 Mar 2026 23:27:46 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b31bef1sm14655394eec.26.2026.03.22.23.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 23:27:45 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 23:27:39 -0700
Subject: [PATCH] firmware: qcom: scm: Allow QSEECOM on Mahua CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-mahua-qcom_scm-support-v1-1-00c50db332ee@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFrdwGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMj3dzEjNJE3cLk/Nz44uRc3eLSgoL8ohJdAwtDs2QzQ2PTxEQTJaD
 mgqLUtMwKsMHRsbW1AITMubRoAAAA
X-Change-ID: 20260322-mahua-qcom_scm-support-0816c6135aa4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774247265; l=1064;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=pcAWESZqAAUcBbHQyjnnp8rAW1WcS4UvO2bffi/okbc=;
 b=kU2upody1b9AIU63nqABIQ3RgNGkK3y2lqO1OewVGM0k+dUXoaPBhv9BS/vzX0NFTuZy63nv2
 Ukjd/PQRubFCDzraiPuse3DuB9yMCUYiZW1LoYh8u0T9TNmzGEiYJQw
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=aJv9aL9m c=1 sm=1 tr=0 ts=69c0dd64 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Cb38RhMvbhhEqzyvLo8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: OkjXb6cEnQ5QrWiIRk-b49y-fnbnf_WR
X-Proofpoint-ORIG-GUID: OkjXb6cEnQ5QrWiIRk-b49y-fnbnf_WR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA0NyBTYWx0ZWRfX9o5le1qqU9rH
 WqscMOy97ZgLne/oj0b+UFaaChnwBIRh1Y+hVTxABXWD20cyQFhjCluaX4cK0fm4aeNe57w5N1X
 NloIfuHHzwrJpmQebSMW5EzovGqQ0YngJZ4VJKrzVsuM4kiBC9SfCUhilcITJXSCRRJZVmFoz7n
 JdyZ2Fi4yb43h7Nb2pmjC8t8kLSvG/tPuzhtNkfdFLASCqOzX7twO7+Bso5dZPGHNfy4Hc3S0Mv
 yaEAzgNLV7f4/hAbGAbY+Vq8NPRkcJ8JF0I5HYeaCU1ZyRTRToiLhnKXH9ohe3F7Qnb+h+LfsKj
 IoytZhUdPKqZvL2nxsEbhSkL1eiAjF5sAXJ3Ku12oNeIOlXCf8SLm7fh+/Hc+T0hLU4h3RKpWB8
 soMD5HPneh8ebZPMgaiBFes2RPCQEM4Ofc7bOq5s0oNsfd5dyYn+XvYXHtvWUC+UvHjm3Asmupv
 VuerodNfgBm/zoy4jKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230047
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99106-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF8CA2ED125
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Mahua CRD board to the QSEECOM allowlist for enabling access to
efivars and uefi bootloader.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 33333384ac81..81a0271d887c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2312,6 +2312,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e001de-devkit" },

---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260322-mahua-qcom_scm-support-0816c6135aa4

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


