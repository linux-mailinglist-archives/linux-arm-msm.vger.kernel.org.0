Return-Path: <linux-arm-msm+bounces-104785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KdDOMWe72nwDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:37:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F31B477BA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DF8F301063F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813593E557D;
	Mon, 27 Apr 2026 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T12Xypqn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G51w+DtG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192C53E314B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311397; cv=none; b=Fqn3rmSd90g3lFIsi3EE31P/tI5L0mIPxSnjQTHh/Ht8z4Kd9EnyvppuS1ZaqN/NsA+jQkDOsdzW9AD1gf4yK1lAFXGDgNs/6YF15yh7qh56EXv4It2+qPbK4quXwtw5UVs8jpRuEDjl/Z3tagOD0Vs8UlEersuo5kJg1NINO6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311397; c=relaxed/simple;
	bh=fNH9qCYe4Y0NmzftG8HGe9p8tkk1iIJgMKEMMVyfJQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dTHMyyJUskmroStjqPvgvvHVTxzIlMlFhGr2KFwo0hiDB4kjEn2zU+aP80Zz4nU6oufzIYci5SX/cJjeuLS2vDJ3QgbRUO9t/YlkJUwqpFNIMpcNtxCyRAVZ0fC1v/j0Q0ijeAIxBIXp4zlJKVT132Jseoh0C4k9DA4bQIFUzyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T12Xypqn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G51w+DtG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RFLGmq440351
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTylmpgaZ0jhgYjEQvu43uNWIUtaitxie7wYdhQCPmM=; b=T12XypqnQnquQ8mC
	ng1tcHHYGf3IDDJ0HFnTlGkA0m4XQU3DRNKv8t+IFWYJJSaA8EYdx+pQKyJgIkkb
	QYb+aTcPHcmLzZMN/+saSCSmi8+bAa5wu//Xvpq6sECD4pgbLPw/zBavv6wc6AeQ
	gojy27n40JkkXRLDuqf/HBrVM3HGIntDvAeyAdTDXGF5OqEUSez/FB6nR/5oOGAA
	QEt5bTJ8XiTvoLLXBQ4sMF8QVFf+5tuL35rJF2OjSvM0jo0QDvJfPZ9q1o9VFnl/
	rt5RZYkzo2NJqlxK38YECYUl6WzlrGcYM3z7ESuPPl3YHQPUjDnqaaGUNg/jbFUU
	2WCB7Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac40gtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:36:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2d0c1ead1so195302345ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311395; x=1777916195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTylmpgaZ0jhgYjEQvu43uNWIUtaitxie7wYdhQCPmM=;
        b=G51w+DtGXpgr2IRfLK5sh14rWA9WA6HeA4S9y3oB284//VvJbjt7ZtLYq/iodw8W+t
         cnumyhcC2pQJwwvsvwN4UnwAxOzwHYkgYrxDp/AUl/ZtCKD4+NpOHmiKuHd8VrwR+s//
         Mj/yn3cOrV3Yg829+NC1CNMDLw2JJEErJqq4F9IHryW02+/+CdDYUVS7cPvFrOiztvK9
         93TBdcrogWD1zcE1+dPDtEHPkdwzk1Td4NP6qU8PBFoJuOoJhXpGBfN+s8N5WoGM1+ai
         HG1JvPknZp68McIp19SuiRuknhGrZqHJ9a0Jl6RnErpeQ+5TDVJP2ePlDMnPoW45dvWe
         EyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311395; x=1777916195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mTylmpgaZ0jhgYjEQvu43uNWIUtaitxie7wYdhQCPmM=;
        b=O2SJdUHScWY9gdyenrR4N72OwlkqCtFuGkSgHTQcF01qlCrs8zW99pnvjDv64ek1rb
         C347VMySTAAU8XmffC3DombkC2GQkG7Xg4zFLTh3CkLNGpdDpJ8HHrqRxY8lupetawNW
         kmVKK4Kw/RbCLki+SP/6wxZ+PZ4A4FEinQLRqiaoJ339aqteZAp1bUQaPRlbMN69h5/W
         oKd5rneaAjk8XsxCoLNsq6RG0LF5qP2+f8hEp1i+FOewmAkWAzyqBh9l+ksrj/ah5zYe
         Nr9TlneoWMt7Z6NvT4r4HK9qknv9OKbKSJtjUhceqFd5rY1HYjFp1tihgPYEKLxBWa+6
         cjEg==
X-Forwarded-Encrypted: i=1; AFNElJ/BE7PGfgf1XJ5o+YpmHuTS7AhWhqh3B4LKgXEZOt0XQ/tx21xleFutvdB2vNlDoztbpn3BAiiKGrHFjrqB@vger.kernel.org
X-Gm-Message-State: AOJu0YwqxcyauukTs1La17jzchHFXPYiMlTYctN/mLqv994pfXQFoCKH
	t1df4sRNc1hPpSsosrfaDJxPiVKce2AF4/GVgmLlpS9eR50kjJhVOR7TtVSGqsMHLUC/O+Smnlj
	lXiO5FJ6qlymjEDFTLOdqRPHDUBTt7JdYdarE34pc4LLdHuZUD6YNvjwR6Rs/21I+44Oo
X-Gm-Gg: AeBDieuUmiF9US/uu0POx31GXs6U/9LKh7GWx9IBHlj0ocTiQ88KciQbZEQdlRf5Brp
	yOzQmtYM31uNl45x8AwwJmLZnqfVgOApwLCw/xV7k5PpGibqWmUHW7cTnHLQXMmrygw4/h1CLLP
	32BktCI02sLMFbZNz0ZPhThNLocGqEA5V8qZeyi7x1wvkDwKP2HOjD6gj61Zf/t7B1DdIqetOLs
	W/KX8mqktnMU00KuFp9gq2Ay5QCTyXbqGgrTzC2C6y+Lr0rXQ/gp9aHEVvCaFQppcNKsNI7iaSi
	xAqsEXC5HaIRINiwgP7/uMu/R/5IVrfDqbNCmMw9igTQeRIBrAWBAxdF1O1Svoev/Bn+a0V5I1v
	dSly/BE2lAiUfSuwpxm2QlHfR422PkeY5XLoTnG2J7QVoQNsY5ZDXfGhFFIJUwa9kZnnY
X-Received: by 2002:a17:902:968a:b0:2b2:5091:1c0a with SMTP id d9443c01a7336-2b97a97d026mr1052295ad.41.1777311394468;
        Mon, 27 Apr 2026 10:36:34 -0700 (PDT)
X-Received: by 2002:a17:902:968a:b0:2b2:5091:1c0a with SMTP id d9443c01a7336-2b97a97d026mr1052025ad.41.1777311393841;
        Mon, 27 Apr 2026 10:36:33 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:36:33 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:48 +0530
Subject: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD
 cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=2427;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=fNH9qCYe4Y0NmzftG8HGe9p8tkk1iIJgMKEMMVyfJQY=;
 b=ZRQqaXwPk9eM6B4nM1bogpDoTT6JjboYi/afKdttQA9pSYuU0vd20Tg8Ykkl7Zc2sqmXOR127
 TjkQY84p39bA3wuq+0W6rtvlHbI8XeqZqvU4Lvz1j5Jn7/SwHMWXP5G
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: JMghgFf_bR_p8f8gWCk3oJ0e-FuhgHok
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69ef9ea3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JnGLTex25XOQSkTSfOwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: JMghgFf_bR_p8f8gWCk3oJ0e-FuhgHok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX069aGBisL3Hw
 l4x9/Q9AQoFYg4qkwknzUMVFrBOUQszFGBhHeYqANFKhXDLEc6cxUxf0p7iS/yjRgBFc53dS/8C
 8VhxZxlR3BSaT01dMwOGhqNsGMAyjBFBQRzRPqNwAEhS5RlxJwusmLXoJ/YdAJqJY/X+/nNOTTv
 rLE6w2aH+PUtLCwA0NE7LccrKE2gE/RLHAdF7QklcMCgUrTh+m37gy6UAk39IppuLENGJjSBhcq
 riumz0x8lKgwKqIx4hzddBwQy00Ocne+FT4SQzCZ6e6lK1+GgKvGM/MTzdPd4HJ3MgtcaO4vsve
 vWyVDUjto3mkTQD2RdCqb+8gKNmMHMMY+NhzGVECQzOTB53HWDXrd5zgeP9ob7I5QGF/AYkzeMX
 x/KCVupqZupqYXVp+R67j1XoSU5WPIld4f6pqNm/i40wlttyYy6fa28L6dHXg224ScaGM5Zat/b
 L9mteSaDSI9SdGQTPfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270187
X-Rspamd-Queue-Id: 8F31B477BA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104785-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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

MFD core has no way to register a child device using an explicit firmware
node. This prevents drivers from registering child nodes when those nodes
do not define a compatible string. One such example is the PSCI
"reboot-mode" node, which omits a compatible string as it describes
boot-states provided by the underlying firmware.

Extend struct mfd_cell with an optional fwnode pointer and attach it to the
child device during registration when no firmware node is already assigned.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/mfd-core.c   | 10 ++++++++++
 include/linux/mfd/core.h |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 7aa32b90cf1eb7fa0a05bf3dc506e60a262c9850..d2153d9b6dd75a5f55d232ba87bd9e4abc93c8be 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/acpi.h>
+#include <linux/fwnode.h>
 #include <linux/list.h>
 #include <linux/property.h>
 #include <linux/mfd/core.h>
@@ -224,6 +225,15 @@ static int mfd_add_device(struct device *parent, int id,
 
 	mfd_acpi_add_device(cell, pdev);
 
+	/* Use explicit cell fwnode only when no firmware node has been assigned. */
+	if (!pdev->dev.fwnode && cell->fwnode) {
+		/* Get a refcount if fwnode is a device-tree node. */
+		if (is_of_node(cell->fwnode))
+			of_node_get(to_of_node(cell->fwnode));
+
+		device_set_node(&pdev->dev, cell->fwnode);
+	}
+
 	if (cell->pdata_size) {
 		ret = platform_device_add_data(pdev,
 					cell->platform_data, cell->pdata_size);
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index faeea7abd688f223fb0b31cde0a9b69dfe2a61ff..8a461b43fac360672a489ffffeb8d0e1acd193ac 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -50,6 +50,7 @@
 #define MFD_DEP_LEVEL_HIGH 1
 
 struct irq_domain;
+struct fwnode_handle;
 struct software_node;
 
 /* Matches ACPI PNP id, either _HID or _CID, or ACPI _ADR */
@@ -80,6 +81,11 @@ struct mfd_cell {
 
 	/* Software node for the device. */
 	const struct software_node *swnode;
+	/*
+	 * Firmware node for the device.
+	 * Caller owns the pointer; mfd-core takes an OF node reference.
+	 */
+	struct fwnode_handle *fwnode;
 
 	/*
 	 * Device Tree compatible string

-- 
2.34.1


