Return-Path: <linux-arm-msm+bounces-117862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SSW1KwtCT2oRdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:39:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3011A72D3F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:39:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T6ljj75+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EcpL61lW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117862-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117862-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A0103066B65
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 06:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA383C2788;
	Thu,  9 Jul 2026 06:35:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885AA3D47C3
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 06:35:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578949; cv=none; b=N35VT2fV12JtzTIpeNmR8FLCXoYmO40DogI6LNTDqxxwbuXKP3XWg8VnOUXXrl5ByJnxTv7O9GKKfaRISLPRJIQU2YU9lLUDqvJcYKTEWI7xgoBcBsZRK5tceNN84cU9FCyWnzNNraD2BTllCKpnA8ZwE3dX/QTN69bCQfTtGVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578949; c=relaxed/simple;
	bh=QG/qBYGp1CFoAUEioBOEm/0Vr40BG+zvspOBhc0KLXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bLPjWP8o2TZ2SRBVNmNkvKIOumC9Him+PkUFrdZ5Th+eSIxH8UsIwmwWtqfyY1g2kSlxCUKk/8WPkjho6bYoDMhFGlpRBPnvWzOHlUnjW+EC3Qr1T7jJ65J8/pVgnYdCADtYLieJQQ2qgAcxCHFfNnHcmZIBIUl/LWZq/+4pnZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T6ljj75+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EcpL61lW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Gka887939
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 06:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z0EqAPxjwdtcQIJ6xwVHlsStlD7K7EQBa7wviyRj3cA=; b=T6ljj75+RZN42Dol
	W6WaouM4UXt/sxxgAwcbLRB2jhkpunGtATTnog74/YcynuGCmDpEQo40NLhg5BB/
	kO7LNIJfvahRMtSz2vC8+4kTy/NV0Z+0iOZPnQBbDYebtoJxx6IYo4RGCzZZaXpc
	pB+PczWr4UPWrIrMitIgHF3yFD/2JCYcp7OfOaP+yO0blVduJ9+olZqP0+keVrIz
	GJgzsH4zdm4Osjs/ywwBJEGSVLNkaGmg1Z28elb4r/u+LosstnXAlvTVGgSpxnST
	z7hBeGeRMk1bLIzlUnMblPuyUB1NpXgI37nL1rxl4Fqxguv+clKh05IcecbZYMf9
	4Qy3Ow==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq333j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:35:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1294387a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 23:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578944; x=1784183744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0EqAPxjwdtcQIJ6xwVHlsStlD7K7EQBa7wviyRj3cA=;
        b=EcpL61lW0Wp2K3s6pqkX9QPoJ3BzYt+AAy+JCBMCB7pKGW1m2zPv+FUIl/1RDVTEAI
         s9/k6u56jsHYD4osqdtzaEQR4xGQmUdEawJi4ztSpzmBCSbisqaD7MZuPJN5pgFeb+YN
         A0MMxAXJVWgqjebh4vwTwRoMLT58RQStpK78rEmDwe2PLMi9srbjQxew2SYXscIs/tpO
         W3nmuSz/INpk++gdl4N9k7fyHNqvSnPvZrDTR3DZyEoKf9rFSJdIb762HOS5G3CvMJ6V
         BTfq8NBQaLgmgqhZsg+8LppeYMCgAukSJkdqLQioJOjYBvrZK4+kh+3G/dtuDK+sJ8le
         NAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578944; x=1784183744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0EqAPxjwdtcQIJ6xwVHlsStlD7K7EQBa7wviyRj3cA=;
        b=KnSZAO4fj62dDAJ5IpGnCRDe9SaCp16+YbT9oIyyTfrNfZGQ0EUS8sQl8UESDVHjpt
         DDgfs5ovviBUbcZBD5jdWdUd2if0bVl0oE4TGhEg2nUkMtooD3m4303/EpeFZRsvf9Iq
         NQqa31SA0PTUxM7FWo+M/3ZMfSyJLNaVOp72b2s+CsejL/Lv/vBgvk2nmiIuCM8bIam/
         +nzIaEzu68yR2J9EtUMdU3QFD5kDzKikQ7wj5wyKM4gbilGyPp3rGdXsFIND/FI8TlC3
         XqbjQ7B5V5vTXKDZttDxW3yY99HcXffIzhaol4DV+r6hyoeodbe+VqTOJQIVuoqwYwR+
         GY+w==
X-Gm-Message-State: AOJu0Yx5cJsa0n2oP/t40p86S+NYlZAg1HGJLlrBuI/0XbnAaqyFbc85
	7Oe54IyUtxIiGQRiEMF5UDqaDYuL2srAvyShoD1+Za4tomtzIhpQfiDvh9/VcoY/t+T+BdH+mDh
	q8vUbZXVejhgD45BFctqVgCWhl6npkaMrcjiyvDnxqEtvO5ftrbn+qxw7BIcrsHpsTeDp
X-Gm-Gg: AfdE7ckt+mUzYXjNTmEdKncEcNFLtNvwGE+u3EPwZcwb8TEFxZLgurbWRdiwArcwtzd
	jpdlQCMleg0C1EztgINYKpnioTHF01IqB8eruuZHGjnbnT96JUlcb39Gurt2Rx/hnFYtgebqzc6
	Br7WzYgOnNSdzJoG6rLrZ856j6Rb7gEWWN5JZoFY/Ug0EZdsu6h+QRXYHAScRFYDEWAa5se6Xeh
	jvNxqD1Q/Z8CNxkrXQ+UA3MBXz5M7tzmutYKnzoHrn7LT3jpnuJ6TxPWa3yZAbCfRxO/6YiD6IH
	RtZWb0kIHzdR/+xELBU3f7RFhnIJq3B6NPGuXPkloZ17yjG0++7CqgyjDrIbSUUPCBYEPU+onPe
	qZHhbJUuik4C1X9vHqUO5N8EHFddK5yfS79D2TgbtqV5bCQ==
X-Received: by 2002:a05:6a20:c998:b0:3bf:bdb9:f602 with SMTP id adf61e73a8af0-3c0bcc6a270mr6656544637.22.1783578944086;
        Wed, 08 Jul 2026 23:35:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:c998:b0:3bf:bdb9:f602 with SMTP id adf61e73a8af0-3c0bcc6a270mr6656493637.22.1783578943419;
        Wed, 08 Jul 2026 23:35:43 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm28304294eec.16.2026.07.08.23.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:35:42 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 12:05:17 +0530
Subject: [PATCH v3 2/4] PCI: qcom: Keep PERST# GPIO state as-is during
 probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-link_retain-v3-2-81a9d187bb61@oss.qualcomm.com>
References: <20260709-link_retain-v3-0-81a9d187bb61@oss.qualcomm.com>
In-Reply-To: <20260709-link_retain-v3-0-81a9d187bb61@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578926; l=1729;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=QG/qBYGp1CFoAUEioBOEm/0Vr40BG+zvspOBhc0KLXE=;
 b=ihJm48Lda5dcP9vNT/LESX/IJC7zDKsME7N6tASM4TbxgsiS59KnttAt8fxhcwoUzfu2ZuZ15
 wGw9wT+ApGhC8+FIcaD3nm6FkRbwQfRlCz+35C53uYonymK6P6GdDHl
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: SFXfdBFRVJTuI7ogaVrNCLCpgvFqnbLL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2MCBTYWx0ZWRfX57Lxl0QCagL6
 pOdHZZ4ogcwm7BXVHcqrNLPFaB14Ryalg7XVdMGHgH+iXlQ0znD6fwV89n+oy7UDIKSOub4sZX3
 QYWaF7kicd5mWBTvn6CoUdUsFpRBhbnALzwoXGMhOVduL3to9G0lsVzJASFPPag4dAxuQ9kfEit
 gtJtDv66uh0bMN9a2g6vStfhy2sghykVUbmm/cKvHgkot4jxwWfi/7r83jzKfrMYRqeeKSiwzvA
 hv82SFRphANqA3Ov0Nl7RnGotrb1ZtfOmVLMZtveJrD2jZX8+orCEag1UxVmWgsBjwNaxKBtDgk
 SQPI/RP1mRJvw6eg5wVjz9wkk2wL+wbM8jZ7Q69lGQrT1TyYmsjEzmGtEydRiiTDyqnTyg8Xfag
 h/ZkKTxLxjcmFfL3Fi8siakNhy67A0nLOm2rorbrIb2GOiBAgsVYByQP3FQu5z9CNEx7svkMNym
 Fbudo7PUhHmOkF23VRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2MCBTYWx0ZWRfXwcw37Oo2Xyqp
 WEPSurrLS+z7mHDKMKrPDo/kU7FQtIenlUM46+5SIUFnVAD21Z5xHVuQNOwtgCdwKDrXACsiv4u
 V6gJJLx8P71Qf/QY0Vh1C11faG6aEmM=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f4140 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=awRzx6-DDdmypIrTvt0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: SFXfdBFRVJTuI7ogaVrNCLCpgvFqnbLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117862-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:qiang.yu@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,pengutronix.de,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3011A72D3F9

The PERST# signal is used to reset PCIe devices. Requesting the GPIO with
GPIOD_OUT_HIGH forces the line high during probe, which can unintentionally
assert reset on devices already out of reset and break proper link
sequencing.

Change the request to use GPIOD_ASIS so the driver preserves the existing
GPIO state configured by the bootloader or firmware. This allows platforms
that manage PERST# externally to maintain correct reset sequencing. PERST#
is asserted explicitly later during qcom_pcie_host_init(), so forcing it
high at probe time is unnecessary.

Tested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d8eb52857f69..9ca620d4746a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1841,7 +1841,7 @@ static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
 		goto parse_child_node;
 
 	reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(np), "reset",
-				      GPIOD_OUT_HIGH, "PERST#");
+				      GPIOD_ASIS, "PERST#");
 	if (IS_ERR(reset)) {
 		/*
 		 * FIXME: GPIOLIB currently supports exclusive GPIO access only.
@@ -1918,7 +1918,7 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
 
 	if (of_find_property(dev->of_node, "perst-gpios", NULL)) {
 		pcie->reset = devm_gpiod_get_optional(dev, "perst",
-						      GPIOD_OUT_HIGH);
+						      GPIOD_ASIS);
 		if (IS_ERR(pcie->reset))
 			return PTR_ERR(pcie->reset);
 	}

-- 
2.34.1


