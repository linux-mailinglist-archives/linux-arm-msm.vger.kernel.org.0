Return-Path: <linux-arm-msm+bounces-93125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MR/B85OlGktCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:19:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1D314B424
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAEF83031B22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BCB33031C;
	Tue, 17 Feb 2026 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k3PSiT1O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JBSYRqzZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748132ED58
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771327161; cv=none; b=T8wtdRPfzLY1jgVnBkqg6PZ7vv9KY6Uo0zLDutUEGK/ug1d8MNx8PV/VApxBFXm18km43k3mxqe1P6huYPqt8ioG/m9aU1QRsI9BP89PtUds5sZVo+HUhjOyZRGuykykWDIsil/BLO7KnU8WNNp9j+GlICpky6IYuc9c8IzQLco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771327161; c=relaxed/simple;
	bh=5VNrPa5yioPWFjGZOM4dXOcXPUPcjXAmODnXjn9DUOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQhM6Sqax/A9kQ1eOcv2ErP7Cri8ub1TQkbvMcOZoNvvcluV1aLETIrl4XNisz1iXeD0IKbKMe7GwEbgiWQru3dreDi1/mgD1XDh8/58RdRwhAKwk4qK53JffUygkQJ1dOQhNBnwQam7viArI2XiXzHOesFsTc/9HrxLL2U4Lyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k3PSiT1O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JBSYRqzZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HB3his1942880
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9eiqgaf+oSJpBj2Bn5wVQjCwa9YYEJiu3YTycJF0zus=; b=k3PSiT1OjH4lMZsK
	+eJStrLWQNnGTjQxrrzum5yleG6R/pbRQOk3HKjaeliZR8CeCGIHWhqw2z3k3bYQ
	USF5E9nG8AWGv8jlmj93O8aRkJRjeLizSyozjlleznp2+O9b3yv1saqmxrQMg2FC
	N/qkrJsVwYHeYpmma7tFZyYhMV+K+BsOaegRViSUHbouzg+5vtx7oRV6drSfvvkm
	zdEoZKS+YE3zzc/oHOlWZsbx3cqOBTzHNeTWRzf3YJj6/gedtas/TksQzm51ougC
	4Fi91+ydf5BraeTdIcZiprOoH/Tta2VJogy3Fg1u07M5CiAqeBA8LKju4wysg1uA
	ACfM7A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g01f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:19:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6dde310601so2668016a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771327158; x=1771931958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9eiqgaf+oSJpBj2Bn5wVQjCwa9YYEJiu3YTycJF0zus=;
        b=JBSYRqzZtutqS6Tynp7c1jNmO9DlvFE8zkXTo+oUAsK3SprfFWH9T1qjcUjNKUQEjC
         6lbPwhLr6FlnzmFxJCvtY5KEUz4VNtajVsIzlo/fiybBX6rjRy28X/6BnOQV7o9vivsU
         66OWxe/BVRVD8C8l1Ddy5qngGxH4yAg/GQUQ0PU6jhKqu9GuDA1hQAt/zhFR6psAtOqd
         uMR5OeI9iptNZUxQs65Qa9Sm2Bvg9Mqf03g8U7r/iq4caXturqKr+/3/tw64u7tL4zvY
         qaaS0zsgd/qk4+t1lGlR8Q/da4fKeUEjSGUbIn+EX0skMgpCwN7w+KJhva6/mCwMsgIQ
         iY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327158; x=1771931958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9eiqgaf+oSJpBj2Bn5wVQjCwa9YYEJiu3YTycJF0zus=;
        b=YHI8XtQd19yelwLUkg3W7MNyJh/oKRJF3uzxoe6CrHAniDgnozC9WCTDJCu7p5Oq2m
         msDnmzlM1mboIlBQOnekyNrPwxsRYIpFil+BtVmUGUsRMHz0u4Gm67/EsvgRUC0hsSmM
         60N1lgTDD7mrrxYQ1nzsaOeQRrx4MbOdDhC+V6RqKsfT2/a2zcENoDhh2Eg8T/GMo6DX
         YxhjsI0+BdxNNeRciFndEVj4TFigntTUrE5mfuYRIc6tOQUWzW9X0vp+lIiQaPwDDENe
         RhsB7h48l7KuAxmNGX7wWGKPxMUF2sODxLzDvcGp/Vz+VWyZFcU0T0g4Uq7mDrFnMAZC
         yUdg==
X-Forwarded-Encrypted: i=1; AJvYcCVjEAFHwVx/5wvvrFjtQP4ddZ09B4ZtkgwgIPqnnVExAhwnbG7waRejaseNudocjBxE2AK9g5QCe4k05I+K@vger.kernel.org
X-Gm-Message-State: AOJu0YyikrA0qF+Uj3XniklGxrn7N6OCSAUw1RXneMrM3lSV1MBxQWp+
	PgGxEN4U3wDxXnNoXt9g9xUKcMyD5XYHEfRikHBuWIP7QbVtaYt8C3Z+dxSQPfURpLfVYQYfuBV
	H1ZUZhEwSDQKGKQZFtibEUoZo0adUtOdMoPEZhFhODK8pEBt0mP0In9IRfiHO6zZlOq/a
X-Gm-Gg: AZuq6aKuiyOR6XBPDeeI8lp8eNpB6IVyzzA9qGAywlq8RnNZKuBWthKTHwCniQ9y5jg
	qNcUVR4qHEASRKyVBD+P6gE7yFNivOu+A9gaIJ+OPSc+wR1rJFeEiwf311o1Bd8eHottoAvtKwY
	m5+4+XiE7ellQtNaCRrnDktHMl+P4VzbZxyiojI6Xw2cV1OzcRQGknbSpuzFYn7JHMRGBKK87m3
	D1FmhyKLuL6LwuGSsj/2nLdqOsmURO9UriFQXcYUKSGd4T+twGZB7Q8vNZje+SWCwgFZkGEt2Sy
	pFMGNqTo+pfje3EksTdmRItvsy/KooSxShr6O+W0Ve5zE1Jd2wY6Etf/Wioc0XUj7TUKbfnYctJ
	J79fZcn9l4sXoO1m3CstrTMfhInmWhyb9VbhBzJU94WJEb6MorzpDczL3
X-Received: by 2002:a05:6a00:12d7:b0:81f:5ec1:8bcd with SMTP id d2e1a72fcca58-824c949ad7dmr11646625b3a.20.1771327158027;
        Tue, 17 Feb 2026 03:19:18 -0800 (PST)
X-Received: by 2002:a05:6a00:12d7:b0:81f:5ec1:8bcd with SMTP id d2e1a72fcca58-824c949ad7dmr11646592b3a.20.1771327157470;
        Tue, 17 Feb 2026 03:19:17 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9a661sm13181914b3a.50.2026.02.17.03.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:19:17 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 16:49:06 +0530
Subject: [PATCH v2 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-d3cold-v2-1-89b322864043@oss.qualcomm.com>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
In-Reply-To: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771327148; l=3861;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5VNrPa5yioPWFjGZOM4dXOcXPUPcjXAmODnXjn9DUOc=;
 b=eGsMoCR3RnwpV+cX/R2irzRnKPCBzeZrOnIZldX5d22y4OrPn6w5R6++P63dUeOwPgvwRrmBv
 y0NjhBhmG0cBIsIOV98eCu70NW/22EPqp6zbz0CTKFQknsolsw+70aE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NCBTYWx0ZWRfX0ladKm/HcPsZ
 6jStyhSVPNzxPWduoDejecNCu0rz6GM0vtD9v7LEaJQwbHTgbp1gZ9iTtQnPgqjhI7sPg3lBVPG
 y4JuFJ+stjXxe2xMN/algvkubJC+cgvOIRbnw8mDtr4v0T8lB8tBqXCiABVPlPyC3ZY1eKXnB1T
 mEUxemnoq3w6W2L8emDVIRvkyhcH9I3kbGBoX35Pkw9E30qVGPGlr83yYIPbZ2PTuZv1ZQiwLdw
 edzQsM9wf+F3wJ4ZLvXTC6SAPci1270L5+JWh09WlQ7GdvKFq64WQejcoCr1vvaChKYka7Q2aBB
 iwcS3LuBp3nhnh4xwFirQXqP/2RUEiNPrJoy+8W3QOP/m9H4bNbqnauOolrFWxbdvnoMwrldy06
 92DR6A0jVsTWaSTaf/hfYA3uRAhVVMinVDyJjevolfIgLeszk1pV2KSUoMamDKywa9EawVAAc+K
 YREbet+yJiM5sRu2e1Q==
X-Proofpoint-ORIG-GUID: 6_7KBHeAHU9VwC_TUiOJ0mZ3C5sJhmGd
X-Proofpoint-GUID: 6_7KBHeAHU9VwC_TUiOJ0mZ3C5sJhmGd
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=69944eb7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=R0UKu0mhgHHlQpweOhEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93125-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F1D314B424
X-Rspamd-Action: no action

Add a common helper, pci_host_common_can_enter_d3cold(), to determine
whether a PCI host bridge can safely transition to D3cold.

This helper is intended to be used by PCI host controller drivers to
decide whether they may safely put the host bridge into D3cold based on
the power state and wakeup capabilities of downstream endpoints.

The helper walks all devices on the bridge's primary bus and only allows
the host bridge to enter D3cold if all PCIe endpoints are already in
PCI_D3hot. This ensures that we do not power off the host bridge while
any active endpoint still requires the link to remain powered.

For devices that may wake the system, the helper additionally requires
that the device supports PME wake from D3cold (via WAKE#). Devices that
do not have wakeup enabled are not restricted by this check and do not
block the host bridge from entering D3cold.

Devices without a bound driver and with PCI not enabled via sysfs are
treated as inactive and therefore do not prevent the host bridge from
entering D3cold. This allows controllers to power down more aggressively
when there are no actively managed endpoints.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/pci-host-common.c | 45 ++++++++++++++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h |  2 ++
 2 files changed, 47 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index d6258c1cffe5ec480fd2a7e50b3af39ef6ac4c8c..b0a4a3c995e80e0245657f0273a349334071013c 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -106,5 +106,50 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
+static int pci_host_common_check_d3cold(struct pci_dev *pdev, void *userdata)
+{
+	bool *d3cold_allow = userdata;
+
+	if (pci_pcie_type(pdev) != PCI_EXP_TYPE_ENDPOINT)
+		return 0;
+
+	if (!pdev->dev.driver && !pci_is_enabled(pdev))
+		return 0;
+
+	if (pdev->current_state != PCI_D3hot)
+		goto exit;
+
+	if (device_may_wakeup(&pdev->dev) && !pci_pme_capable(pdev, PCI_D3cold))
+		goto exit;
+
+	return 0;
+exit:
+	*d3cold_allow = false;
+	return -EBUSY;
+}
+
+/**
+ * pci_host_common_can_enter_d3cold - Determine whether a host bridge may enter D3cold
+ * @bridge: PCI host bridge to check
+ *
+ * Walk downstream PCIe endpoint devices and determine whether the host bridge
+ * is permitted to transition to D3cold.
+ *
+ * The host bridge may enter D3cold only if all active PCIe endpoints are in
+ * %PCI_D3hot and any wakeup-enabled endpoint is capable of generating PME from
+ * D3cold. Inactive endpoints are ignored.
+ *
+ * Return: %true if the host bridge may enter D3cold, otherwise %false.
+ */
+bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge)
+{
+	bool d3cold_allow = true;
+
+	pci_walk_bus(bridge->bus, pci_host_common_check_d3cold, &d3cold_allow);
+
+	return d3cold_allow;
+}
+EXPORT_SYMBOL_GPL(pci_host_common_can_enter_d3cold);
+
 MODULE_DESCRIPTION("Common library for PCI host controller drivers");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index b5075d4bd7eb31fbf1dc946ef1a6afd5afb5b3c6..18a731bca058828340bca84776d0e91da1edbbf7 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -20,4 +20,6 @@ void pci_host_common_remove(struct platform_device *pdev);
 
 struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
 	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
+
+bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge);
 #endif

-- 
2.34.1


