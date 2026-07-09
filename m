Return-Path: <linux-arm-msm+bounces-117920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DgL/MnRlT2q6fwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:10:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A91D72EB95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:10:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m3hwx5io;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f08hPR2U;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117920-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117920-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9DBD304EB99
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F5F402BB6;
	Thu,  9 Jul 2026 08:52:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CA24048A3
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:52:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587157; cv=none; b=HWUH+lIKRcWcWZdHoxZ1xnDYGC1YyX/1YSqksWwcvJ1HsFrOeQQuTR/+U/y5blYOQ78W2jE9sM2+f65VfBVqd/O8oeqi3xGcs7xmWBEcUcxuxYSpQRRgnMJraAoxfOx1D00a/LU3Hgk1NpPe1BTWV9RiNMjyz1Epny3Bhk6WjYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587157; c=relaxed/simple;
	bh=mz/vbKEa3auNVvUlvqCxL4e+N2IxEzAXNSVtBInwc9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MO85eYBkEuip/4A94+q94qhfxq4AQAjtUDn9PdDRSgeCCvyxWoU5Vp+zD9LlXiaiyklbhEHrxHPqV0VLillSmZzMu5L5cNC6WZRWcQPQlqIv5ibI8c6E4gKtUsD356yGzkQjxb69ijBHtF9AuLFfbYbbyr78VFkczhofnGCYqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3hwx5io; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f08hPR2U; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6696ktLR1021056
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=chKC2qFBTda
	4mWD3b3bzaYis3+uHKOcfz43VKRdNqNA=; b=m3hwx5iowjIR0CB3CCwPrF3cVl3
	l08+CNRZGObfPy93qerYZAWbk6dlr2QGEiZJKDE/7Z0I5URxUm07qLxOGLJtZHK4
	Ta8ALdSPKbQ/3wxnBgY1MeTj32Hbee8OhgcQv0K5RgNO95hA8ypAafrfMCAVw4+O
	LA3aQ6D3ztIyRImKnFbfuvDKtIHUxGBM3NzDWM2XYVe89Xy9JZSz9jV5f7hBS9xD
	AxxaQB/XvpnrOdY1fY1Qu8RgdK+rHkQJQwZPdlFoVWebiOrVqrVetFqHg2v4PWff
	T8qBm+XYQK5EMEEfzlMYrf4ryQotzRibocodlLZi47H18IK/2zc635NZ3Ug==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3rj65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:52:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso1242214a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587154; x=1784191954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chKC2qFBTda4mWD3b3bzaYis3+uHKOcfz43VKRdNqNA=;
        b=f08hPR2Uu5X0Qhn1YmXB/MULAKjl0433+qVkHyzJeSoIBEn3BK5Sit3tm08cQ1thTt
         V63r++EYFv+ApznQ0IC4+uSYOQFCgetkuEFPs5zv6uAZlA3iBAxksQALNq26QFS/HLJX
         afwxWMf5oD7w7RNhk+GQG7GFaIwL78WiecTWPCEKrvXWHvtFbkRdV5fnzAxCUAkDH29g
         8pvmgzQjhttmYsMwf+GdVidOb8JFEGwvOYcJ3Ua5uJChEnWN9IgngjRX3WiXiwGX+fB9
         MLN7DmeVk/o2mhIDkO6PuWS0Kmag78kc/TNH9dC1toaZCY5mtoVpD9WKrB2VgUO1VU5L
         daJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587154; x=1784191954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=chKC2qFBTda4mWD3b3bzaYis3+uHKOcfz43VKRdNqNA=;
        b=UQA3+CSGMdFmei9b245ko1pZ/2Ydmvotg0Lya/zQdpFlZXAKM0Vl9LqCB9C8G1vZly
         3GIPz9+KpMfaekw/tby+s5RYRdCc7CcTzSv/j07obqBfFG1UWByREF0H86qUgg4Ep6dN
         90qchn6PPmPdFU3JpAWFu80BTkmQZMKk0wrCsQeJaGj3ihmcKjxGJ81sWkuR+9oCZCeJ
         eu9CPU7z2ese+0fcQeSyD82gtzfozvPYVmPxOuKjnYndzYk2cszxb+gWGqu5a1URo9Tz
         e+Dpyqv3BDBc9BZtKz+tSMgPWjxQa5ls9j2GfIoeq6mGlO+1gnPPyYX+pUPr1REdpw9a
         Xf4g==
X-Forwarded-Encrypted: i=1; AHgh+Rqw6MYxpXezAjcFkV3BlyKiWbYBu+9hS8stgrq1lPhgjqmy/NLBkXX6Rb2hgkc/Y5nIF+nyhLtV+oiBfcxg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+2R2UWA4B6Jv6eVdAJztuGgWTn9ZFoxwRaNLRSW08uNTjLpTW
	7DfrgrP2I76YjveZFgPwBe7/GtzNiNxljJw4D0BTvFcdwoSOvMz2S6YlwiH4eS8uAOKy8InPUiV
	fiG5i4ucJpyIOQ2ZtVFYIklLkj02WldO911V5cM5Tiy/Fk3toC1YABN6YBUbnAz8VJQy5
X-Gm-Gg: AfdE7clos6EzfHYXEAUqs+cW7y3ctcu4AO0MfWPMVDfHRwoRX9YUm5Hnerpw9EWiduc
	Vu68C/XqugVFeHaOS6cmMafgeqCrZ0cROSZsZGRiVjYrvw/EYzuB8eh+mn1ZoNIgbgfvsRZFCvJ
	0W9/3lrqjDxieKuYsFyFq/xMXbZ2ZQPmosJwUq3AqDB95JZsq9nci+0yfDX4sA5YtW5xilZjsij
	hy8vM4jg1uMQIefhy1RZkUd1IUaoUsbXGCLGt1fNA0AegryFK4WUMr55aM6B8J52K561a/K82QS
	nA8piG4ZE3H5AMkgVgchX2hE88zRaenUyrCzjCgt2qImJgnXo+F0zszjmEeADVQq5zrsN7Y0KB2
	tK9lHiuNA7s9TGXMEofwDzuFbMGLHG/ZLH0LTYAplRVOfyEO8UCZci3AUOa0dqWiDEXfPG40=
X-Received: by 2002:a05:6a00:3996:b0:848:3ef9:395c with SMTP id d2e1a72fcca58-84842efccacmr5786506b3a.27.1783587154316;
        Thu, 09 Jul 2026 01:52:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:3996:b0:848:3ef9:395c with SMTP id d2e1a72fcca58-84842efccacmr5786481b3a.27.1783587153747;
        Thu, 09 Jul 2026 01:52:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b25204sm3460027a12.28.2026.07.09.01.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] remoteproc: qcom: pas: Add Nord ADSP support
Date: Thu,  9 Jul 2026 16:51:49 +0800
Message-ID: <20260709085149.4072181-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
References: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wujhAyu9pBKlQUtjNC-McQYCe05_hUOY
X-Proofpoint-GUID: wujhAyu9pBKlQUtjNC-McQYCe05_hUOY
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4f6153 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=qFrpwd1egEKAg89pRWwA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX5cRMkR1E1jFD
 4GLShRvjguY8/InLumS3swckh32TABDxwXhDxgSGFmGVFs581kJ+WqhCu7ArJ9DUDJIUGKikxwG
 Z7WLOtHHz9geqHAJ1hAIApAmpnB7zVo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX/m1oDedX6Lyf
 KKsFoFAxmFtXrgXGDK1sxngCWQIIYuXv+c1Tx2Aqz+gYCXasHSIoIzZTsp0Str4zlrsPqEEaL4I
 z8Y/XMTssP6fiIZuiy9pM0M7YhVA07Y2ECP8CVRYL/Rc3ItZYIvAqicQbTCLCq37ZlB+2DXn1Gu
 elGTKkSMYC9rV+m0boQb2TvOik7DdqIuS2rXnQbnU8JIgDdBgnN6yWopM4KYnhuQVXpkFLV5jAw
 2PJ8TIqZXT7JvNaf6k6yOt01UPOcOlgG5ZR79+EZUkFhfIX5u+JG9nssEB3EPtRTOe2EyBfCUX4
 bui9R1Lv9RumQD4UZJ8TlKB6hJQ4ElYdTIBXGAR5QDyCBwTskUd/5xn5wV2S0r7sV6vgIRQLBRJ
 ZQ6fSW69KeC2Q/Vxnjvn9q4GMQouvFUNCblAfDl1S9smWgBl4cUfAGCHLHiIwD7fFc2Jg9iEqIq
 0r2mS4pfAIyiLH+kbSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-117920-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A91D72EB95

The ADSP (HPASS DSP) on Nord SoC is pre-booted by XBL before Linux starts.
Add ADSP resource descriptor, and set early_boot flag for attach path
rather than a cold boot sequence.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 60a4337d9e51..486d08e75cab 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1422,6 +1422,27 @@ static const struct qcom_pas_data milos_cdsp_resource = {
 	.smem_host_id = 5,
 };
 
+static const struct qcom_pas_data nord_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.dtb_firmware_name = "adsp_dtb.mbn",
+	.pas_id = 1,
+	.dtb_pas_id = 36,
+	.minidump_id = 5,
+	.auto_boot = true,
+	.early_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+	.smem_host_id = 2,
+};
+
 static const struct qcom_pas_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1664,6 +1685,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },
 	{ .compatible = "qcom,milos-wpss-pas", .data = &sc7280_wpss_resource },
+	{ .compatible = "qcom,nord-adsp-pas", .data = &nord_adsp_resource },
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &msm8996_adsp_resource },
-- 
2.43.0


