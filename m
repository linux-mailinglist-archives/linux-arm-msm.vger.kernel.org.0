Return-Path: <linux-arm-msm+bounces-119140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5otYDt8LV2pbEgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 06:26:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 856FB75A73E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 06:26:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mD2zyW2H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NkPnTSzk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119140-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119140-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A0813050DB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 04:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B98238D52;
	Wed, 15 Jul 2026 04:25:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B296B399892
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:25:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784089529; cv=none; b=dHok8suIrWfHaUPxEgcOCQpEGOiFbqSUXO2NU2201Ae52/w8m3WmkWJ8ckpQOxr4bl0Xd18Eg70GbCDsE5m5nCptsyAHWejP5CcqgAtaH7trsFhXylMgLFtEw19MvBxewWCZs7K+Ii/00nEafa52SuRBp16owGl6K+son1izOos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784089529; c=relaxed/simple;
	bh=isgiWVv8eg/ry/KcN3nqJ0LarhMHhngG7XuTjJOZypE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dx688FQ9zyyukTwRCTjQrxtooPXqBPQMz3Pnjg2yJa+vyy+27lGbFBVly57ZMkMOXnbYw0RdBTv7lLaSJywNoTXYreNHtitV6KSxSqBmfGka/fyUSqXDn35uHF91iWbAiiG/BT9kW/sg/VWkFaYYc5x4NIMnD1aJeAdfPHoHrcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mD2zyW2H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkPnTSzk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l47g2679676
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o0bZJn+gd5gr14r1blwfsd9DGfSKmSKm7GbYkCSyCzQ=; b=mD2zyW2HgatxMajV
	NJmn+UpwTYMg27cdlJxG23lx5EX3tEUa59xgi9ijC2eDL+DmBJv9bem5sy8d2jnN
	Psvjwp/qCMLe98V5r7wRstJyPQEyzYcIsEPlM+9WW2vlMwOA+itJCTel6nq55kfo
	M+JNTB8Mb4fIFiaSoAMWoZddSgpqBGppOdt93T8g11aRRdWAF587IPiK8GRdWqse
	3aYK3OburKT8SlRbyREabOP5WUNQc8GhABI0ooeZ3Z6BTVpHWPz0lEpDsZ1hfQAn
	uSZNqRGaawS3m2/8EXuK4/lquAC4XpK71Qawol1Bg/IQsY5pDWM1pDAPo6AsoPcV
	WF+XFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnutx49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:25:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cceabd70f5so38864215ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 21:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784089526; x=1784694326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0bZJn+gd5gr14r1blwfsd9DGfSKmSKm7GbYkCSyCzQ=;
        b=NkPnTSzk5eSrz721sp5PT6qHnBcA87+ZgDwIGPFvW8Ryfdo3UGIOYxJY+Mz3e1SLJK
         AVst36ubYHwCLxhYTQtJPxyxDvkaxkzG66iEcJCuq4gUcieftVlET0jG2gQkgagyHajs
         D6njs+l/Jx0eMyKaL0Nvgvr4FtCrg+ndlQnkfElVJCpTexphwTl/OqoiGva3ks/bT18t
         6cssAyBTotgEF3zMTOQecmpoOAScnIBZpDFqD4LTx+qYdTg/3w9weq8PROMzSV6FRT8s
         SlHbJvcCxdi/g8HiTIpKlE/c2IutG/XiEULLSjlDAB3WZs482VXnuH5MyPhMMfZ5a0nM
         KKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784089526; x=1784694326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0bZJn+gd5gr14r1blwfsd9DGfSKmSKm7GbYkCSyCzQ=;
        b=P9bcTlGXP6yH7Q7OEYMX7XCHpZ8IcFHd35i+7X+XsuLqz9yPaWLl3ocR1+fsk1UDJt
         DTeqoW6iCpKoUHDpiATZuTMRDtYycTTp6XnHBk6FP4yY6Pl0eCYkGGZ2tapsmls7Vy0f
         ns8Y0Bs9jpTXe3/6miVVygzVteJ3FD7QW6ARHqVsnFJpiWbUFNjFPynjtCsjX+YP9K+0
         8zRD+ErdBkLFbRm0SBrmn5ZfrbaJFteVj0wmcZct/PYRfvrqYW8GbSuZ/dBQYyj0u7dF
         zccFbydl5vyPGGopnfr+/mlvqZuOgPGuWQKQSlm2sqh/WgBe2glePfYAT/ENtPmQ1RTC
         isMA==
X-Gm-Message-State: AOJu0YwgmuNr/DH2HX32zNW6FL6tt7k7fQNtFVrgVoYbe1GhgBbncVJY
	aX061kLd/j4TV4rC5F/hu4i2SpkhswABO2gk8aijlXuzbtERZaKPUxyx+SfbU4aWYzLmiwr8R+Z
	luFQLS2Y+lz5Dm9WCGVU9oSM+Py+dGlhhOxjA2tDlbCO1YBr0GMtrTJofkGSZY5NamL3h
X-Gm-Gg: AfdE7clUGXXYyDofdFeXYRrZRxLlnqW9YN6WeDXoIaAnAPzd4s8PvpMjvsv01jjJzk/
	9yHF1y4C6F8vGCPqAdH4OyLSV89Y77u78dzyhozKQogWRW57qOlKsAf8sFsdg6+VvX5M5jZymNR
	CZ3vW+2O6fjqbvE9YkNJ907QCWY1yOW5xM1sHHHQ9pWfWYIDHLboWSxtCN8yKnPEFg2WN0RooNn
	4SbYt8HnmZFHxQYxsnFB5hqiTsp0yGauybFTiHuPNyhP9V79gyf2S0QqdBp8KXkJswaKWfMWv0/
	TpNXcg2AZjqTxn5oJEQ4HqetSkIlNcwFZk43C2hWgydr9ks0BOgD2rqy4QEdejZGVQwCI0CQ21D
	nkXiEykzuQ4iVDwsMkW2yt+Pw+VWRGu/QkHrMRcynq/da
X-Received: by 2002:a05:6a21:a346:b0:3bf:9e25:1a19 with SMTP id adf61e73a8af0-3c1108c014dmr17974645637.52.1784089525938;
        Tue, 14 Jul 2026 21:25:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:a346:b0:3bf:9e25:1a19 with SMTP id adf61e73a8af0-3c1108c014dmr17974621637.52.1784089525426;
        Tue, 14 Jul 2026 21:25:25 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm62395491eec.24.2026.07.14.21.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 21:25:25 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:55:14 +0530
Subject: [PATCH 1/2] serial: qcom_geni: Add shutdown callback to quiesce
 hardware on reboot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-add_shutdown_and_panic_notifier_serial-v1-1-23e3787c7109@oss.qualcomm.com>
References: <20260715-add_shutdown_and_panic_notifier_serial-v1-0-23e3787c7109@oss.qualcomm.com>
In-Reply-To: <20260715-add_shutdown_and_panic_notifier_serial-v1-0-23e3787c7109@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784089517; l=2248;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=isgiWVv8eg/ry/KcN3nqJ0LarhMHhngG7XuTjJOZypE=;
 b=S5lzLJH9S+DrJtBka7ar3f2lcL0ZYQmESc1NUaGbusqnVF+KveRaDeZS4RfYpNeTqsyTrqkZ1
 ZEdjky2QGUXDvYxjvSxivAem6prHs0971X+eRg7VgQARgOmz8jLnLju
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: O6xa0NC1_s5qB6oGcm8_dARgFp7qn6CT
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a570bb6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yFGuIqwZ_iH4-3sRbD8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAzNiBTYWx0ZWRfX3vNpkPVXdQt7
 Eivub8qB5RE5e1F3e93D9TSGCe2XhQBnYamMArrwQcoWK7wdwaDCUZpDQmofLG3Sd7lev5aCmq0
 fN4FutWPDby37aggvnR1cNm8PYOfrTSrJJtr00vSPot0lZ711QACALnIjfn74dlCbLejAnPH1UZ
 gdZ0Qfq65pnWoAYFyZ9IT+vuSFiP0pJvoZAQ8hvdlJpBjvP1QvEGdyRPIrmZvQfD0M9VSxclNm/
 kSf0qB8+sdOBHPSRS7BIeKjw+nLtI5GMtiQUtHVpea8afh5yvIDkot/9AeiaEbkpbx5tBcyoj1D
 EmUb+lkQHVU7eCkK9GN65Xc1TOZvjafUadQ+07VlugUORnXEsAi34slqysfgy8akERJZ+/IHkNA
 5VATQkJVem+vER+9+zjoax2uooDn1zzKigvpA67f07NmQpX5ua6SD6Yn4nnfkfuOgM5smQKIWoM
 zQkBUVPUrGOfT2o08hg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAzNiBTYWx0ZWRfXwsSDkLgJ95Ji
 Y5MNluPGAdHpTxzw6ZpzUe6QzN4SbJC7537Sls7N6giK9gCBl3/E5QZPaKZKcmjW2JkYpRJ8RcR
 ZCpeDDRqBP9SJ+QugD+sJK55L+8xoTY=
X-Proofpoint-GUID: O6xa0NC1_s5qB6oGcm8_dARgFp7qn6CT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150036
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119140-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 856FB75A73E

During system reboot, an active UART DMA transfer can leave the GENI
Serial Engine in an indeterminate state. On VM-based platforms, if a
DMA transfer is in progress when the VM is shut down, the SMMU can
raise context faults as the DMA engine continues to access IOVAs that
have already been invalidated during VM teardown.

Add a shutdown callback to stop TX and RX and bring the hardware to
idle before the system resets, preventing both hardware state corruption
on reboot and SMMU faults during VM shutdown. The port lock is not taken
here since shutdown runs from process context with the device already
quiesced from the UART core's perspective; instead, the runtime PM status
is checked so that TX/RX are only stopped while clocks and resources are
still active, avoiding any register access once the device is runtime
suspended.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 7ead87b4eb65..21ac2e3bad81 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -2049,6 +2049,18 @@ static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
 };
 
+static void qcom_geni_serial_sys_shutdown(struct platform_device *pdev)
+{
+	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
+	struct uart_port *uport = &port->uport;
+
+	if (pm_runtime_status_suspended(uport->dev))
+		return;
+
+	qcom_geni_serial_stop_tx(uport);
+	qcom_geni_serial_stop_rx(uport);
+}
+
 static const struct of_device_id qcom_geni_serial_match_table[] = {
 #if IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE)
 	{
@@ -2075,6 +2087,7 @@ MODULE_DEVICE_TABLE(of, qcom_geni_serial_match_table);
 static struct platform_driver qcom_geni_serial_platform_driver = {
 	.remove = qcom_geni_serial_remove,
 	.probe = qcom_geni_serial_probe,
+	.shutdown = qcom_geni_serial_sys_shutdown,
 	.driver = {
 		.name = "qcom_geni_serial",
 		.of_match_table = qcom_geni_serial_match_table,

-- 
2.34.1


