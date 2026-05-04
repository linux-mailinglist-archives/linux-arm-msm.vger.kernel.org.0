Return-Path: <linux-arm-msm+bounces-105688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHG/I3Vx+GlCvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:14:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FE14BB84D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E1753004219
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 10:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE2A388E6E;
	Mon,  4 May 2026 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EhbFlrHB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VUtywDKS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62AE35A3BF
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889455; cv=none; b=nnFZjYlE8lbR/HIxBLti7fs05nctirMfQEnOOpu0oG2Qz9dz+c0G55TiG+7TnptYZnKNisehZHokxYkpzEBRJfDb5rVXxELGaWe1c8Cnt1eBn3GLThuHednFCpGC8zZ9wnLM3gSaKxE3NFIWXT7fW+pP2Nof2oonQNjQ5RlieDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889455; c=relaxed/simple;
	bh=GqKdSI51f1em7M39oQYLwVmjIooU0kDc3AYhR8hdk0M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EEWvjEiLfbTmIs1cLzkaIy4eyCnZbS9YWyypepWADB8hGmJ+g1RZHq5m87UD3H5yPqDLbav6LrD74rn9qN92dKRMSwUGdTKZfq9B91vfx8tqEUirgjkR6JK5Fb1LIx7Wm2kK5YlMklVVwkXbXhwhJ6pdfpF800zwwW2M6hsW1RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EhbFlrHB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VUtywDKS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fRmO3824443
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 10:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PzBWqmaWx3NGD/Y6Y+6Ly+aWxbhG1VBBgUk
	9Lgibhrc=; b=EhbFlrHBm50qfs6nzI061a5gu49e2e4Y1W3zoyJ6bozG6IfWNck
	ZEeF1nPo3mfQ4AIRJZFHmfVyX/2m5/tQvscCDkpDJEB8VjwhCunQTvndU3tJXQWl
	H7KSHHNQ2+ph/ZtbGMB1Ngnb5m+kbcXzELPONpN18bhNcDFAg1ONK0Ueus7XCC6Y
	Lf57p5IpJBWERCRFCs6kfrnln4X7Fbp+A0Pju/eQ3fpSXAkFq5XJiC4vol5//dPN
	5Rkscj5RQXgVm31vnPAFGBjoM3/PRLycOtpeG7uKUjOFUdKGrFsw9RjysntH830T
	AqE0BCtxZwEsS04P2MWmRw+qZJ1SzOc9tKg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9g3n8v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:10:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365161a9de4so1662718a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 03:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777889453; x=1778494253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PzBWqmaWx3NGD/Y6Y+6Ly+aWxbhG1VBBgUk9Lgibhrc=;
        b=VUtywDKSpSxsJ/qlEncgW+ddb7JS5QJbqlGvx/mGOmNm3P+0mFZvU0F0bChP7uk6AC
         zedEPS4i18Mr8NsS0hbNqoubr8YoQ59656c8bi311z53qLBXpCEBXMbHTlc4FUx+x4B5
         DpLv9dgqB6GLSUyN/6kE5EsH79q8mP18c8uY0Fr19qWcm413ECrO+bkgVaS09Zuwz046
         fg1HKBnDLBy4V4XYK2w4McLJokm28qwtnzK8VJ/njADi9jeXgzJQ/FW+haZZF+MXzedm
         L0/NipMGMxxlpS6d6KQecwi8VXSZOYQXYrcwQoN1SZQQf8m5BJaqVUqqggfQKoKxt0R6
         nxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889453; x=1778494253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzBWqmaWx3NGD/Y6Y+6Ly+aWxbhG1VBBgUk9Lgibhrc=;
        b=ISJNyv4WeNm6lehVfm6l7BpJO/z+yg79oCPp03vE/p4icCnSMSsBz2WQwNPj0z1L5Z
         pj7fuCgIkTe2FN3dOn5uacD0hiZ3JozZX3iMNJXZAH4B5/rEe2DFfezg7+l4DVV2ONsN
         xVm5/Keal7qpYv+eyFjTIIcJC8Bow03m857+BLG/LBmRWzj7f71syVXTxlcK9BJ8vKO1
         lB+pGBn+UtmtN7iMCx2INsGcf5CnYSFdIOQa/4j7vkClsT5NEMcQE1PP1pWh2nVx5Vmr
         RRKO5MY5stswzfoRxd758IlV+LJ535imnn19cDKEO6r2OdwaD3LZUg9znLMM7GsSYBzo
         mCVg==
X-Forwarded-Encrypted: i=1; AFNElJ8YuVrGEsU4aSnL/qjpqDlw4z/5JSYe7LabPt4wEPN97B4cPY1x+83Qcu0wnw0GoCD+84VSz2J9En++edEN@vger.kernel.org
X-Gm-Message-State: AOJu0YyjYXqLu9HEhrcA8u5SgBu51FBtbN2tptX78zUQH4P63IkkIIvB
	aL6god2qshImELDiN0ptvA/1pAOJVyErnLr2E+NWAYCZikvA3xkg2BM8Z0ycZtBRKv9XaRAEMBw
	HimLPHR8CGipoiddzKHy0gcQN2DGxDG5eNDAuKoJsNB/c7k/SPAx3cpdOEM0YI5BdQla7
X-Gm-Gg: AeBDietIDBsapQSkZYUsMYfld2fD7tPy+/FLBzxtk7Qz6Oa9TSOHRo80w28dW6/Ds/j
	wOCgS6A41EP9o1H6uyiaeEX7Pe0NrL5/Bd7MvTuto88bs/2paNvpaabSE05LfWgIU7uP6n4LhTy
	KRiEOMQYN+labGO3JQrR2cuKPQVIAPRSuuH6wpdpZrcZeOPgo5ff3XknnAUBc1+8IpxmDC1/ett
	OMX8H6KyFzNa7/0OhP3Fj7d3qx4w1cYx7Njv9tDWnjsAd2wWA+lNNwn7de22wTkRmYngcoCOFqd
	CAyrX7g6OOH5GITAuLcIaHgcGMquk8XUVfv+OZdE01b52ppXGR+J0VwEiBN5joytlfb1Er721pn
	4ymhbyYQkmuxYN9AjEyPPj47kqksyirb0KM/H08llidmFhhmnZi9maF5m4bg/EU1Zitk=
X-Received: by 2002:a17:90b:3850:b0:35f:d56d:1c45 with SMTP id 98e67ed59e1d1-3650cd7ce74mr9551602a91.12.1777889453363;
        Mon, 04 May 2026 03:10:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3850:b0:35f:d56d:1c45 with SMTP id 98e67ed59e1d1-3650cd7ce74mr9551558a91.12.1777889452817;
        Mon, 04 May 2026 03:10:52 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf54419sm14516503a91.8.2026.05.04.03.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:10:52 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, praveen.talari@oss.qualcomm.com,
        anup.kulkarni@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        viken.dadhaniya@oss.qualcomm.com
Cc: Aniket Randive <aniket.randive@oss.qualcomm.com>
Subject: [PATCH V2] serial: qcom-geni: Avoid probing debug console UART without console support
Date: Mon,  4 May 2026 15:40:45 +0530
Message-Id: <20260504101045.1084672-1-aniket.randive@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwOCBTYWx0ZWRfX056FUS6v9D1s
 iaTF+IAjVSCiJiPjpVM834PoAXze/MpNqw3+EW4bGMfyKoDvflZngHtw6K79S2SZFi9lP+Nr7LX
 Q0+aI8H3Z+bjeeWhBobNps/Z+u+xdL0kfohbUdtTIyCwiUqkyhrVACxTjsByk9raWwN/gONqgre
 Wdauq1gqjTF/7kN5nXhwHgv40QAemb+he9Zo10N7sQnoIoQfSFRlfg2Ah3YGCnRTJE3COtjkoEW
 FebM28i6wd8EJXk85Opb7MDlJ/CCHKmPI4afLBF7f5z72XtXU4OeAsODw00bW/dEcmAlwxQo76E
 kVerZGpqIIM6B4WtOArXouVr8wfLEFsA1JW9YDaOz79G0e4jZTyuU2gROpEj+DhokIsn0IMnHNG
 UPxl70NH9J/w/HuLyfToeFKMDOQ1/pflAtMEz6/BYdMbkc/qvKzzJDCgycSCck+wVsBVxpi/KCd
 gB6z5AvQIQhGorShsGQ==
X-Proofpoint-GUID: YdRxx-Z1f6aJrEcpVDG3OEfcJHlgOXYl
X-Authority-Analysis: v=2.4 cv=Ge4nWwXL c=1 sm=1 tr=0 ts=69f870ae cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=MZVvZoSPHoyeMB40_KMA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: YdRxx-Z1f6aJrEcpVDG3OEfcJHlgOXYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040108
X-Rspamd-Queue-Id: E5FE14BB84D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105688-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

When CONFIG_SERIAL_QCOM_GENI_CONSOLE is disabled, the driver still
advertises the debug UART compatible strings ("qcom,geni-debug-uart"
and "qcom,sa8255p-geni-debug-uart") in its of_match table. This lets the
driver match and probe console UART DT nodes even though console
support is not built. As a result, the console port is never registered
with the UART core and uart_add_one_port() fails with -EINVAL.

Fix this by only including the debug UART compatible entries in the
match table when CONFIG_SERIAL_QCOM_GENI_CONSOLE is enabled, preventing
the driver from probing console UART nodes when console support is
absent.

Reviewed-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---

Changes in v2: 
  - Fixed kernel test robot warning (no functional change).

 drivers/tty/serial/qcom_geni_serial.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 9854bb2406e3..d2287a8b1d54 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1992,6 +1992,7 @@ static int qcom_geni_serial_resume(struct device *dev)
 	return ret;
 }
 
+#if IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE)
 static const struct qcom_geni_device_data qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
@@ -2000,14 +2001,6 @@ static const struct qcom_geni_device_data qcom_geni_console_data = {
 	.power_state = geni_serial_resource_state,
 };
 
-static const struct qcom_geni_device_data qcom_geni_uart_data = {
-	.console = false,
-	.mode = GENI_SE_DMA,
-	.resources_init = geni_serial_resource_init,
-	.set_rate = geni_serial_set_rate,
-	.power_state = geni_serial_resource_state,
-};
-
 static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
@@ -2019,6 +2012,15 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
 	.resources_init = geni_serial_pwr_init,
 	.set_rate = geni_serial_set_level,
 };
+#endif
+
+static const struct qcom_geni_device_data qcom_geni_uart_data = {
+	.console = false,
+	.mode = GENI_SE_DMA,
+	.resources_init = geni_serial_resource_init,
+	.set_rate = geni_serial_set_rate,
+	.power_state = geni_serial_resource_state,
+};
 
 static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {
 	.console = false,
@@ -2039,6 +2041,7 @@ static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
 };
 
 static const struct of_device_id qcom_geni_serial_match_table[] = {
+#if IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE)
 	{
 		.compatible = "qcom,geni-debug-uart",
 		.data = &qcom_geni_console_data,
@@ -2047,6 +2050,7 @@ static const struct of_device_id qcom_geni_serial_match_table[] = {
 		.compatible = "qcom,sa8255p-geni-debug-uart",
 		.data = &sa8255p_qcom_geni_console_data,
 	},
+#endif
 	{
 		.compatible = "qcom,geni-uart",
 		.data = &qcom_geni_uart_data,
-- 
2.34.1


