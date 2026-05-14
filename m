Return-Path: <linux-arm-msm+bounces-107657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPS9HDfeBWqjcwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:37:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BBE543427
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4914E30B5527
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF9A3D9686;
	Thu, 14 May 2026 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFaeiy8z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAgjo+sR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3373FA5F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768913; cv=none; b=TFUCSc12XCBQKOH0fALseFQ8mdO7wga3lBhh6DYnuM4gIfLNY6xZBzPYIwhhs1dPtzVX8ccHTEfS69i+dgGIlmBEqzFqA3QhSSB+QgE2AN1zOeh9F2svDXMEmMWz7OnvbBmppQkDJUDuZSXc5GXZgSV3AD9PED7wP1Oo0tYcF8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768913; c=relaxed/simple;
	bh=qY5ZcIM5rzFihKNnoujQTEksmxgJGl5ic/lCFibX6G4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y34EvrqLWJqYXnLn3UH/WvU5tEiFccGtjH1Jy4mL3tHLaUd0MKDBaVlpNbx0s/vKP+3ZPYUf/poo+HyHPYQ8aDkOeg/L+41h4/daAMr/yeo7UcTke+pkHUaZixlEvkl8V7wddZy5WCZIb9I7jGBeGtrJMmmfDlJ8T1wvim1//8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFaeiy8z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAgjo+sR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeqgp2261920
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oWKxom21haWgZdoOhFhN3R9zZKeJdr2nkwKtgHCCEbY=; b=hFaeiy8zlR5ONugv
	1yPO1AkOPlVK1PSqAn6ZLWegn7vvi0LDcPXk4qyjoohpMiPJk6sh0vokz/1dhUWc
	NpKYv9F0SEo/lJDeP9xIefhisryqZoJlcYZIiJroaZGPy5l6MVtRTtvm7A+hfIFK
	4I2s82PHoqFxC5fmy+n6p7zdb98YBeD39VqWeQ1uV46PDd2myJc7+t7YFCbL/F/S
	vBVEJ8TOFX4DkUpPsiu/SPYRIaS8f2r/Dh5EeGRlrzjYtfZzwo+RXv4BVQRXRzmH
	AZ7Ulka+e+QYjD2gxqcfwHlIde88BozUDHCWRUoXoZ5dex1HEZeBgOCxEfBX9E6P
	zJf5Sg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hj7qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc6899bfb1so67385085ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768910; x=1779373710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWKxom21haWgZdoOhFhN3R9zZKeJdr2nkwKtgHCCEbY=;
        b=ZAgjo+sR3H8ibtbzZ0vhmwDzdt7vVmW3q6ZraZYfNHlUgXtLuAQ46kYSYeE7BEFISl
         gUQoAJovk+iYxpZ1a2uAiwro4fGVzdk0xfGmKGNpYQ/06cBAo1Ruzw0AfmdWiE7e6f0E
         DfWMnoKeWFe2hgw6gZ5sRjcxNxH1p+Odq0yCFuomSnOha2RPw6JbqHjcsOpELEVrSGEb
         dZaxSdQQWr4huFGfyFyETkkFPwdiLJfScICzyBoDUCkcNBOGzDQGbDgSqybIEK1SNk7K
         YwOYYed0BEZLe6WxequlamvC/3m+suXWnVbvaTVQjrl253skuuXgJWdk+eWTsUlFmVAs
         Shzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768910; x=1779373710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oWKxom21haWgZdoOhFhN3R9zZKeJdr2nkwKtgHCCEbY=;
        b=C467pFJfveYwHbCVNnibkqKZ9DNhwei34HceNzfwv3Wtz5PIw0yQ0BNvvk9dM1tYEf
         5eF1R0zL5jvpfjTFdFxh/29+Q/WgOxHlNyRm3WPyYspgivn1B8jB2enbHyrNuuoREWXm
         +Zhg0kCbNaux8+8+oZ95V3gxdz6tAW5psxttIDK/Pa/FYWsTAJmBr/g9cRePjqZLowhh
         RjmaMqoow83BRAPBPvOnB7x9R8QvI61fZl4U9qGrAYI2oVF88Eirh/5YM0Vtowk2nDvc
         DWaZn1Xy4gBKuzm8m6vmz7vsE6vshjU+rOeA6mEXzTv15by1PWf0YOi8ruNgGnEYGr1f
         2LWw==
X-Forwarded-Encrypted: i=1; AFNElJ8mH5jx2C0IYar8dqOpF2uJUWIH0+zNKni7kdbsFLsvA51902f9GCjusUpl9ULcIdGtDMt1bk/Vwhr8cE8S@vger.kernel.org
X-Gm-Message-State: AOJu0YzDiwKOY7KrAHI8dRK7hHW/BkTpwmsKED3oDt/mpe3CsPD9dEpw
	BbLfc+hlCxKyIOo2Y4mzxaC0ClQXtshYjky2USUp1Z+1nZXaRgopXozW+rf0QmTK83KiEzyoyHv
	9eFGQeydQJzqjwsmLZBZdFxCsg6NWgjXYCS6sBCSsOfgdChJAi23i1M3xWepyr6PkROLs
X-Gm-Gg: Acq92OEhsB2vY+/LtcFMAh8ztQSl/glRgcf+SnYuZucw7mckl3Yrz28giQlJcVZcF2c
	o+e4U+rw6pj3fOtw8C+RtU3b889Dnhr1g2rnkwscJ4D6jjNTkF4ftaL+0ZUvTcB0vYZUjCZScfj
	wMQ9QrLSpZ3BGr6jboN3Mnyfb/WrGVK7yVeuHdQtScGCm5NKX+ynSEZ4dN+eDIIzatOWUQcqRRY
	ADrsMK4wMPKr3K+VyKmhDE3zs272h12Lio6eEUgm0p2NlO1zIoSP988tX0/wjmEdBsOilNUOm68
	dMsLVC4uuN8Hd1+OoctT7K4L7YM9UxG/NaAdFZFDf0u0zGndaic40y7fTUJk/Qeo7Owq/70Ik8p
	PJMjA8zYlNpjDiiVaQ1kz9kcST54WAlDwMw2lxtMAwyEF5uNM4XV864jSGg==
X-Received: by 2002:a17:903:198c:b0:2b2:57df:264d with SMTP id d9443c01a7336-2bd276d9763mr89889595ad.33.1778768909601;
        Thu, 14 May 2026 07:28:29 -0700 (PDT)
X-Received: by 2002:a17:903:198c:b0:2b2:57df:264d with SMTP id d9443c01a7336-2bd276d9763mr89888915ad.33.1778768908917;
        Thu, 14 May 2026 07:28:28 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:28:28 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:50 +0530
Subject: [PATCH v22 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-9-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=2150;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=qY5ZcIM5rzFihKNnoujQTEksmxgJGl5ic/lCFibX6G4=;
 b=AsfuP37SwpufjnSF40KcN6LpuME+xnY+R0MQ14SYIMGvMHlu2Pwe3lLn3lm1X4iWvkci3GH2i
 IRF/AV0XpY3D8SsYxoOayVLFsJWfiPo4qH0uHWQ5tiisSVrbhHY/E5V
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: Py3EPRqlGDhnUf2ZsV1Egbe9CoT13cKv
X-Proofpoint-ORIG-GUID: Py3EPRqlGDhnUf2ZsV1Egbe9CoT13cKv
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a05dc0e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wFQm1DtpZAjkPzv8fpkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX3aPonGio7A3Q
 B+9+8HI6fdTQ12X3o/7QaNLt+cNxSz5UdZN9bTz929W16zvPNx1mJ24RRWGbGdmogSBX1Qi2cd2
 mcFthy21h7T9LbAX7gmIi2EKwPCqvqoKRB1VVlFXHUtOg2B32eF2WwacbstOyMx02n5y8Zydv6v
 kqDPVbGk9sOQgMDBBM8WEwKKfnb7JUnXcVV8zcPC2NGnffdaETJ0VAGHEM+TslxjE2SDtwzizt+
 Bj4tDDXqi4oC0MfaYW8FIOxKS5rp4Fey3mHY2E/l6612FEVsrdASaOax48AtPa9BPrbqYm4vHX6
 9TxVxt65qCNYMJLwavN+8u2cRmXfwVSzllCCmzSNlBh8WMv7h+5FokzxgQ9p8cryCUiXWYEuYZQ
 QEsdmubl/94P0VxjFQvItR6zcnJlGSFIvOVo1EBO730xFxS9U7ZQ9T0NQhpJgHXcHeXqLXafrpz
 PCsu+NLmf6JsKMM7meg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140146
X-Rspamd-Queue-Id: 15BBE543427
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107657-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The PSCI "reboot-mode" node does not define a compatible because it is a
configuration of boot-states provided by the underlying firmware. With
the new firmware-node based cells in mfd-core, this node can now be
exposed as a proper child cell.

Add the psci-reboot-mode child cell to the psci-mfd driver and associate
the reboot-mode node as its firmware-node.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/psci-mfd.c      | 18 ++++++++++++++++++
 drivers/power/reset/Kconfig |  2 +-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
index 7affd6bb09dd83452664edeccb09290fe4f43186..852d8e294a438d4ee6789c556d16a83739af2013 100644
--- a/drivers/mfd/psci-mfd.c
+++ b/drivers/mfd/psci-mfd.c
@@ -7,11 +7,29 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
+
+static struct fwnode_handle *psci_reboot_mode_get_child_fwnode(struct device *parent)
+{
+	struct fwnode_handle *fwnode;
+
+	fwnode = fwnode_get_named_child_node(dev_fwnode(parent), "reboot-mode");
+	if (!fwnode_device_is_available(fwnode)) {
+		fwnode_handle_put(fwnode);
+		fwnode = NULL;
+	}
+
+	return fwnode;
+}
 
 static const struct mfd_cell psci_cells[] = {
 	{
 		.name = "psci-cpuidle-domain",
 	},
+	{
+		.name = "psci-reboot-mode",
+		.get_child_fwnode = psci_reboot_mode_get_child_fwnode,
+	},
 };
 
 static int psci_mfd_probe(struct platform_device *pdev)
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index d9d1f768b8691abc3b32f2675519f2ddbaf19b84..79559206d5852ae5eae4c8eb2c390901cea7531c 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -350,7 +350,7 @@ config NVMEM_REBOOT_MODE
 
 config PSCI_REBOOT_MODE
 	bool "PSCI reboot mode driver"
-	depends on OF && ARM_PSCI_FW
+	depends on OF && ARM_PSCI_FW && MFD_PSCI
 	select REBOOT_MODE
 	help
 	  Say y here will enable PSCI reboot mode driver. This gets

-- 
2.34.1


