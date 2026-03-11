Return-Path: <linux-arm-msm+bounces-96871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOyDHdEBsWkzpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:46:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DC525C87F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7AAB73037264
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B369527B34E;
	Wed, 11 Mar 2026 05:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erMPqiE6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A/qQSC+6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A1E34752B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773208008; cv=none; b=WLqipiOUmvtX/cDNrY+Ywe0hqa3Di8rCs+9tqqrl4GgRvoVXJDoNYEu648BYjAGFBsNol+S1qr2GEqE46dHj2yQV9WEsLwRX3ed8PdtYE8RWWoJcB+u3NLW7STT2y8OyXGcSf76lXZHKSIo0PaMM5+RJD3EoGIIw9C116b8qjsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773208008; c=relaxed/simple;
	bh=cVVG4MkyscY1qtPoUsoyn8mWMRvlJbKMwxOJCEj7VLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=olASfNm4wZ2lZLO2eephXQ+UeJgGHJBYceVidBF4fXtI0essz6+hQZdMlR79RCX1S0hHna0JJ/t4MhGFWYwIidlTXQVv8mOaGuDJ80VZeD/3iicAJrgRtA+PbSKDCSAEZFrE3WEIrASYqq9kcFV9YffZn2ZHDmq3EdtlbueXX30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erMPqiE6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A/qQSC+6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B5ObnJ3296538
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RGjJZDCOw/JM7x4VTsDtjQl0GpiD3yXd9P4Ux06z21k=; b=erMPqiE6z4nLBgSL
	YYh5dZelzYYFOdO7oJN2sicJ2NDagoQsRCMGhRVO0o1lkux18AMWeyD0fL4yQJ44
	BsxtfMTgeZa+NQAldjqcauT1dHZ/5F4MZyslGwfA73fs5exfSdufXq7UI3/+GuWL
	sGIcjBHTIZxVYG6UHgPp+HPXjhNQIQ/bNhi9aCtYbqliODHfOpmRBabprjjXEtgQ
	TDtIrMQS32W7HmGwIu23vMdyrf43yDHmxy64WBrAEj/XR1tntjAyCcZ8p+JCq5MR
	5joRlSH8mT9zOb4AuIf6LvJYgSwwNilMp9ii2cC6wmiUbGahugEpyP5fV8P4GLfo
	4D52OQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mv5ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:46:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829fd367abfso66081b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 22:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773208005; x=1773812805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGjJZDCOw/JM7x4VTsDtjQl0GpiD3yXd9P4Ux06z21k=;
        b=A/qQSC+6IxQeSuJCPWEiVG61B/CbY5Qr1CoUU7YgZdXhrCNtkCwiZPFrdj0bdiEVOc
         owosN599LcjXY+4126ilPnOl8Tyn48ce/If6qhhWUrAX74Mj6Vvqqwp6KBVVOwuyUFSF
         Id4kAU46kEW3mitJ5edGzuuVpACWCkMA9QicE1mLhP2ctMzRA2APszQ9sBfBCZVL+CXH
         7ztieUWCyhasv0lcf7/1S2O9BNzC3sUp8kZcjDGsD5wT+pvitsLe/K7Za16tXQ2sDXQS
         lDV/DrUy37seESE+JzwVUPot5GDp15XychWV8u06/08oX/xG88DGa/YP12L+6my8kfw8
         AdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773208005; x=1773812805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RGjJZDCOw/JM7x4VTsDtjQl0GpiD3yXd9P4Ux06z21k=;
        b=k3YwFKdTnVBd0U4nHjt+6lA20usIST9OCpez8NwU8NfU+we9orC3CqTYDSbk3sgYxD
         cduZ16zJ3Dm9MBrcJGKHzq0UCdZCmXubnxsBzBztiu19+u8wyqAseK42pdt1oH3tJotF
         SLGi/tCcpu23JNBvF9TIO7lD6CHGpQt1O40+nLOMPTMazRYkITifPsrPgdTYCfrMI25W
         S3Ry2VI7zAm4CNGyj4mouDIZIcyeeuQ4vkQGytEt31G8IPiTkjiVAvrOnw5P527gExLk
         bSddt1W0yN+7+dcxpK9uYBYjIMTeTYXV8WtadHPSkMo9pwlyk4lVViPtZ3KrKOxiYfje
         MFew==
X-Gm-Message-State: AOJu0YzmwfNOWpHMwTwekcFCVgrHRpF9BIJiBFa4SsmaCReLPk5iMeya
	axqGf2m6an5EipKlEk+VkyPVjBu00Shqe3DionlI4ncJUWxDpa3z5z/CUhy3AqQy9fhRVB53wCs
	DIngkoLSuDjD+ILT6thWQwjM4ZXnkf9nRz8u55mDG76C+sGmhTmOsf6u/LC/m0qLCSu48
X-Gm-Gg: ATEYQzzdcr4eXD46co8bpRl06nJ5gdI7+Ym8S7Q6FO1b0PyIF/TUzYEu+bf9xmYk9M7
	RYftlRxTa02UQBUZzEGX9IPoJuSNvY79h/v5ePKygc0qCejr0Hbq2coqlSpi1a/OQmP1A02EBk3
	7XvFjZfEnkecETGyfXdy7uh084i9HaOaFAYgYw+LNcEfDIx+Glmj70LL/jmKJMiMDC3UyRuMKtf
	ad/fj5efsCEi1sadlxjPDqamDh/+sujWp4FTRcpAhOguCEzreG4tmSMRzFg6mNTn1LA4i6AE2RN
	QiV2sQIeDL0jZ8eMqeiwXRhRQjqxQJyfaAi/0ghBoaGHbBDgZIOxqgfJFkEGM80efeqahEa8R22
	E32gWi/O8KpkmmFPJ0TQt39HANLGt7dBifD52vX2au7sBMVJKGDH+K0o=
X-Received: by 2002:a05:6a00:f04:b0:829:9ea2:3e17 with SMTP id d2e1a72fcca58-829f6e68c8bmr1376791b3a.9.1773208004751;
        Tue, 10 Mar 2026 22:46:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:f04:b0:829:9ea2:3e17 with SMTP id d2e1a72fcca58-829f6e68c8bmr1376770b3a.9.1773208004254;
        Tue, 10 Mar 2026 22:46:44 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6eebf43sm1114108b3a.39.2026.03.10.22.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 22:46:43 -0700 (PDT)
From: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 11:16:30 +0530
Subject: [PATCH RESEND v8 1/2] firmware: qcom: scm: Register gunyah
 watchdog device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-gunyah_watchdog-v8-1-4c1c0689de22@oss.qualcomm.com>
References: <20260311-gunyah_watchdog-v8-0-4c1c0689de22@oss.qualcomm.com>
In-Reply-To: <20260311-gunyah_watchdog-v8-0-4c1c0689de22@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15-dev-dd521
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773207995; l=3227;
 i=pavan.kondeti@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=Ixc7jFfJtf3sYdNbi1DoA+ted+UPWdZsOBlvyEIVFtk=;
 b=kaXDlCTlXIpFBqcbs0fuEmRqJ3g7Ex/Y1wLPSAa8uN54wY7kFMvphZCwNmf7qDdPkUBkzq76F
 yVhrewOPHYYC5us3GUJDdJ6gN6r24Uii+rqF83sKb7nyUvFg50bvPPq
X-Developer-Key: i=pavan.kondeti@oss.qualcomm.com; a=ed25519;
 pk=Pdl9NnQpMlqbYaAGGkgBGpURTnZFe2de5LRZSGHkbHY=
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b101c6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=g8_2rFH-n0ZcawzQyqcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BxxB313qbl7LPM9--M-fxA2LjuJWuBsN
X-Proofpoint-GUID: BxxB313qbl7LPM9--M-fxA2LjuJWuBsN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0NiBTYWx0ZWRfX6k2W0PwlOvZs
 c0H0H40TDK1mHqcRXEaXsuT7FA9cwaVMF+10V5HIJs+OHZL2190Cr9soQAfMUfYr71OLKprzCbV
 9gdkTL4dzbMsmyN093xtO7unL0/KQJANqAVXdhc2dgXZXYykmcO/kOepUGQCDLgabNdPhyRiHv+
 SvTo2SMGp7JqsM3UtU48SSNlz7OOUtF3wfWLSTMD+dmIoj6+gYzNzM048RpJESTB0t9tUsZ4abv
 G00PtrQ9X/SD11crhYxJiJVfnDvT89R+YZVt37wiYpoUX7IZeGqWxWeMAbPRZzhYhuVt0jSlXJN
 iK/Lvmve5GQDzKj8wV8gZ9kkMywlFRubLMv/9QT8u9dFgP9CYCcw/nGJshD+GL/ngOys3+tH0IK
 152HUehtjwWclDmWZzWqhcEz2HR58RNghUBrViQ5/jEjR+MVK7OLHyiAlzC1DYluF+H2EB6sHFC
 a0QCi10MaFGjrmxDnKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110046
X-Rspamd-Queue-Id: 19DC525C87F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96871-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pavan.kondeti@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>

To restrict Gunyah watchdog initialization to Qualcomm platforms running
under the Gunyah Hypervisor, register the watchdog device in the QCOM
SCM driver.

When Gunyah is not present or Gunyah emulates MMIO-based watchdog, we
expect Qualcomm watchdog or ARM SBSA watchdog device to be present in
the devicetree. First, we make sure we're running under the Gunyah
Hypervisor. Then we move to check if any of the above mentioned
watchdog device nodes are present, if not then we proceed to register
the SMC-based Gunyah watchdog device.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Signed-off-by: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 53 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 8fbc96693a55..1611e1ab3a31 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2467,6 +2467,56 @@ int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
 }
 EXPORT_SYMBOL(qcom_scm_qtee_callback_response);
 
+static void qcom_scm_gunyah_wdt_free(void *data)
+{
+	struct platform_device *gunyah_wdt_dev = data;
+
+	platform_device_unregister(gunyah_wdt_dev);
+}
+
+static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
+{
+	struct platform_device *gunyah_wdt_dev;
+	struct device_node *np;
+	bool of_wdt_available;
+	int i;
+	static const uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb,
+						    0x92, 0x65, 0xce, 0x36,
+						    0x67, 0x3d, 0x5f, 0x14);
+	static const char * const of_wdt_compatible[] = {
+		"qcom,kpss-wdt",
+		"arm,sbsa-gwdt",
+	};
+
+	/* Bail out if we are not running under Gunyah */
+	if (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) ||
+	    !arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
+		return;
+
+	/*
+	 * Gunyah emulates either of Qualcomm watchdog or ARM SBSA watchdog on
+	 * newer platforms. Bail out if we find them in the devicetree.
+	 */
+	for (i = 0; i < ARRAY_SIZE(of_wdt_compatible); i++) {
+		np = of_find_compatible_node(NULL, NULL, of_wdt_compatible[i]);
+		of_wdt_available = of_device_is_available(np);
+		of_node_put(np);
+		if (of_wdt_available)
+			return;
+	}
+
+	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
+							 NULL, 0);
+	if (IS_ERR(gunyah_wdt_dev)) {
+		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %ld\n",
+			PTR_ERR(gunyah_wdt_dev));
+		return;
+	}
+
+	devm_add_action_or_reset(scm->dev, qcom_scm_gunyah_wdt_free,
+				 gunyah_wdt_dev);
+}
+
 static void qcom_scm_qtee_free(void *data)
 {
 	struct platform_device *qtee_dev = data;
@@ -2811,6 +2861,9 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	/* Initialize the QTEE object interface. */
 	qcom_scm_qtee_init(scm);
 
+	/* Initialize the Gunyah watchdog platform device. */
+	qcom_scm_gunyah_wdt_init(scm);
+
 	return 0;
 }
 

-- 
2.34.1


