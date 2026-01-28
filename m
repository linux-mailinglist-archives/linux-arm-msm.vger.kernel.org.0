Return-Path: <linux-arm-msm+bounces-91005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G3LKqH/eWm71QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:22:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBA9A126C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09410300AC28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63E9325490;
	Wed, 28 Jan 2026 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgszGs9V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqKaNgmy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5682F60CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769602973; cv=none; b=sOVnUc3dQQtLwDgjvbEIERk+BC6WWW+JDupxio44YVTEB4umuj9HKbclAYvYYHnH2IKwEw7istoM0ajwg+JgExEpnULgMr5+nNQyD7f3G/JoJXaHcu3LGnxF8WLnb5ihPNuPwXdlefJoSxeACPgWBPfLds1QQl/hvQnFmrxdxic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769602973; c=relaxed/simple;
	bh=4JMdE9NJQVFXpuxNLlszdXNC+CgVssf4XKGlXAmp3zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dFPgcNPpZfolF+3PKQ8qzt2AvykkxglcGBoYt6HiiHpn0E15lHDvfWqN1mCr/Z1yOOt/ZGUEoyyMzUi0zk9rrB3cLebrFHo76CNypWL7Kex9mVxzxvuJOYh8cuMOTvqIWGzJx+AOTv5ZCUmPfz3Y5T9gzXsB3mXo3tj/YcYpwa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgszGs9V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqKaNgmy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91pTC3442331
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/o5W0AU+AT5/7iehDdb36k
	TbaGoQ5vrsHDFBVhX5e7g=; b=pgszGs9Vzxsa66dMmFUb1fv2phHV56HYtNAg2y
	ZZ/u/vEWMZpM3UTFAhLrKRB17y7mudFJ4e2B/rQI2J7ScUpvMBrZb9m7kLkR+mgc
	CS04+U8l0/iyr7AHPyRCJ33nEpUgQU6M0tEaCji9K7mM1lOzSSi34cXnhmUgcOIS
	FFD+ndBgfIC916sfheDmAttLFMl+frZXvN2RV5evK1HRvI9dDRad9tvpZ45EitkA
	gDw0lNtXozS5JGoS8bhhOKMOL5qvIuz/2aLsxm9RAecOWJTK+jXBVjmzBeD9SzbZ
	Csgo3pZBk0A+fK3lA9dAfAkNDEcfdCRz3mx/bypTIskrL6rg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byanahmnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:22:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso122118715ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769602971; x=1770207771; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/o5W0AU+AT5/7iehDdb36kTbaGoQ5vrsHDFBVhX5e7g=;
        b=JqKaNgmy/jwWPh/BwzqFDV1+bmCIOqcqQJkAFDNH9i9NRAkU+b7resvAaUgxjpZW+2
         4sb+aWTI2JhKKrXbESstmNF/Dpb8ss5Nfy+FjVr2X9CObjezdaNYqpMqiash4avi8Hww
         QQlI4IBkup4oKmeVL0XNdvTWma7s5GayfBe5OV+sp1zld2UYwZPqXkRaMzTzGgbgLCxz
         87QSqOHo7qz66kWGih1kmxvsdWpkn7TuKFyeCRfVbCq95nFniTqmsG6GCH+4l5ym9XnK
         b6q1UnaQQpvlbBMdqWgnJBcTOzCxNAKnxyus81Eze83PU34yX8CflX3g2S+yR/wiI/G9
         QeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769602971; x=1770207771;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/o5W0AU+AT5/7iehDdb36kTbaGoQ5vrsHDFBVhX5e7g=;
        b=QkmzErFqSLhyRKt1vH1q2BOmrQdOxrBaxoaWw2NbZX8CeZJzKczoaunxsiHaCSXLMX
         rmevEw4WEVBI/iBh1N847sd+5ZKXJ/OtIUz9oZ+eCmF3msu7OwOKz35tpGg+8Lq/3mgX
         fArtMRgnxUZ2RstRh9tBOVlH6H5hcJrCAZ23Xwmtqk6uqj+cjFi+yxRU9WAINzVFGcgq
         tXTNKxbuA52oVfEFZtkAFGlwf435SXX/nlGniJlHHW3eIpSt0/ETFyCaW7iEH6MznvHQ
         Besvgad4kKufWEfdZPUi4wEeIz4CuzzpLM1hajdxUHUYBM+kqvof5xg4ffz7vdzqGP2/
         onpg==
X-Gm-Message-State: AOJu0YwHGanh+2PZMtYq9XwWBiWgIRdQVBWv3RFcJXPoQdBLIsMCXkmt
	WAPv5CIvwaYY5DpvNp+DRx0aTxtpdN+WoZUsq8S34eNDKL84arn6DlfXeX7EQLui+Hf6TOqcTid
	0Wa63QPjbyAJhyqcgclYnfCgH4leFayTHMeGjHARYVOjz10O+dIYzsg3Ccu5dSWv7kA3Y
X-Gm-Gg: AZuq6aKHTOxpZ92utrdr/7lPQ0YqgqNZiDaG7eNNKR4p7PrxCdcmcDQ1JLIb7FK0Ws9
	lBZTKuYhZt/Cw688YjVFgOAql8CrTj6Smv4T/d+DmwaG+HJ0UYUglQS1Q7Ic6lfORIG7WIhRiTg
	HsglyElQT8DG+jeripRB+YS0DvmztQ5aYuaaRlEUDKLo+9BFg97uUHO6MFhrT4qSiMfDbjNDhVv
	s1Jw/DxAHTzzW9gNC7m2o1eN3KTQYOCMXzGRFwLzstn6/GCVji1cL07J5QVZVCD5XK/d7bMeXle
	/2CFf7LAMl9M2qHLLoZYL/oBziCpRdiduqvzoYL6Fj1MBvF5kXDPizgZCx103ljtClX5goBvOxN
	9FEQ3XmWx27yCo/baPz9BSQ06uGUNanJ5YLVxmISESL23
X-Received: by 2002:a17:902:da8b:b0:2a7:d7dd:8812 with SMTP id d9443c01a7336-2a870dbe96dmr50894255ad.38.1769602970958;
        Wed, 28 Jan 2026 04:22:50 -0800 (PST)
X-Received: by 2002:a17:902:da8b:b0:2a7:d7dd:8812 with SMTP id d9443c01a7336-2a870dbe96dmr50893915ad.38.1769602970368;
        Wed, 28 Jan 2026 04:22:50 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6ed92dsm23358975ad.93.2026.01.28.04.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:22:49 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 17:52:42 +0530
Subject: [PATCH] PCI: qcom: Prevent GDSC power down on suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-genpd_fix-v1-1-cd45a249d12f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJH/eWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyML3fTUvIKU+LTMCl3jxEQTQ+MUy0RjC2MloPqColSgMNis6NjaWgB
 e7N5fWwAAAA==
X-Change-ID: 20260128-genpd_fix-3aa413d9a383
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769602966; l=1865;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=4JMdE9NJQVFXpuxNLlszdXNC+CgVssf4XKGlXAmp3zo=;
 b=iT65jbwLJOP5XGBDzhM2tkLuvQr9kJYCj+Jh9tQqitACgbFyv9ZReugFb2tePaYavuGxnDtqQ
 /SwDtuigjTOAqN2RvKZqeyG+Pr4CObKjntChHdFG2E5KQ3XjJ7lRkBn
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: IabParBXMZPel0WpvWg6pbC8pDymdQ5q
X-Proofpoint-ORIG-GUID: IabParBXMZPel0WpvWg6pbC8pDymdQ5q
X-Authority-Analysis: v=2.4 cv=N58k1m9B c=1 sm=1 tr=0 ts=6979ff9b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwMSBTYWx0ZWRfX479JtnmzHtF3
 FIsIgFJnod24R2g3lKJdzO10ZGWsip97/FJ1xIG3qggcN1Tvj9UT2mkIzJ1T3z9Q8rv+C8k9DRl
 Gk7205r61YUsH6oRc4hPBzvbXchaqectkXGpMEAbqmDJ7O0w2HEzLcqRiPRrOV7L+zZGr0kngLn
 JeQDFiJ02bc+0LYyEY32IjJoapOCpeKZLeTu2PdvsPftyFQyp49M9OJp3sppYBaRhunE2i3rp9P
 +DIm395EvyCqmxl1Lj1qDI2T8AufS16VAEiYg17zY4vBM1XW/lyIm5xb1h0DUKp7IMWV/xc8AYb
 kGtt1Zp+O1abXsXQmvIB7aKCwBz8ZiF6C+EOaetzPg1iGmCnBfQRBqAdiQ/PuuPzFfFRyq7PJiH
 nriju/y3rOIv83NSsin6uzp8DHWpS5xIZoiflI3BdB725tjZORTzcBs4CyObOQh4fom0PGdmVm1
 NtYdIqhrUDNbDT7Bf/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91005-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1FBA9A126C
X-Rspamd-Action: no action

Currently, the driver expects the devices to remain in D0 across system
suspend, but the genpd framework may still power down the associated
GDSC during suspend. When that happens, the PCIe link goes down and
cannot be recovered on resume.

Prevent genpd from turning off the PCIe GDSC by using
dev_pm_genpd_rpm_always_on() so that the power domain stays on while
the controller is suspended. This preserves the link state across
suspend/resume and avoids unrecoverable link failures.

Fixes: 82a823833f4e ("PCI: qcom: Add Qualcomm PCIe controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 5a318487b2b3f6c61d8f5b1fd5cdf2738a1f1dcd..314cf334a313dff35efaf0c023597e6eef483925 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -25,6 +25,7 @@
 #include <linux/pci.h>
 #include <linux/pci-ecam.h>
 #include <linux/pm_opp.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
 #include <linux/phy/pcie.h>
@@ -2052,6 +2053,11 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
 		pcie->suspended = true;
 	}
 
+	if (pcie->suspended)
+		dev_pm_genpd_rpm_always_on(dev, false);
+	else
+		dev_pm_genpd_rpm_always_on(dev, true);
+
 	/*
 	 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
 	 * Because on some platforms, DBI access can happen very late during the

---
base-commit: 1f97d9dcf53649c41c33227b345a36902cbb08ad
change-id: 20260128-genpd_fix-3aa413d9a383

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


