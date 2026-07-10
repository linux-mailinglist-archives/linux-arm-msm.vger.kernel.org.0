Return-Path: <linux-arm-msm+bounces-118227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UHWTGhzDUGrG4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:02:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D406F739629
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:02:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JH4UsoJa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z61Sha5x;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118227-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118227-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5B82303CE0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D5F3FFFAF;
	Fri, 10 Jul 2026 09:57:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7A93FCB39
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677468; cv=none; b=UWQqWqGoQtMwWrFhTyRr4TJz0LrKIMEMGfHV001Qd/S4nVScJwvcEtFcuCQiNaBM6NB4GPteYEqs3r4D433XRRiIzANVDLRZW9C3fmxjV9n/4oZMrDCqRE+1V1NFHiidbLCIBYYjEbCpqDnAiHAwDVzJzKLR/U+gdv7P4Wwy+24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677468; c=relaxed/simple;
	bh=2FBpwvvQE75I5khIUailuHtmF+KaL1qEU+l8PSLJfdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=at4BG6pWGl1VdrKL4OJFJm12UtQP76bVrV62XqBbvJoWKUdUHHcGcu+JU9fdnYZYH1Qlew+bv8WSTBwEtIM8yI0FESMLQFWH4v/Pa+700Z0gyq1m3WmMeUG1Kp0Z6oe/z00ZdsjypS78BHQ0P4JdfEnS8xmJ4qmPzCStQVrIACk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JH4UsoJa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z61Sha5x; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dVWD235319
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hRa1V0rI3XaAjqfNbDQPKrOYUHx+ncbEbofR/K207A0=; b=JH4UsoJaIxL9Qnjt
	EDqt7UIvTRB5R1k6fgCRhtToC1oYoDSqCv+GjTm5MEd7ej2Z5jDAmIUWkIj+6+qU
	lim9C3adByloFraelPCK2neFe5Gmr4HaFA41CM7W7WqFEXO8pnDMnr8fiB1pGIcX
	w3ONI6cP9njcHc2Uln7Y63nl8B2DaBvD/MctKrnfv0g1jvQQEET8EM1+LjEdIA4P
	vW53GtNes2rbLtve+HR/v+R/Vuu5Vt/AlC3OMVewk+Fto1X02rQI/e3h+lALOn6x
	MScoikM+O2ChKkNm42YUYoN4AgHw878FRtMMv8rdwQXBlYrXmvkiAyPoX8xQxI2N
	m0ZR6A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3kwrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1c7f135bso13038481cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677459; x=1784282259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRa1V0rI3XaAjqfNbDQPKrOYUHx+ncbEbofR/K207A0=;
        b=Z61Sha5xuv+KyJpfvYsi0L8SRPDwV2+t0cuzTNY9K4eH5rnUyaz6Gr4A66yeM547id
         MK8d38lbM/frxnF2NnWTiUnYarhgaxdQTmGW9rgLOSpf34PYAm+hjiBHayfdDBIvSEi5
         KoX+KEJt0y7WGzTP5+aRNLrZUI3ixlM0KX4U1+0qOtG8iny4GZV+LkUExXKlpmElOYYh
         0g6PjYmzMBtZb4kHaGVeH3UaABBgM7IE4jix8OKzjuDOBiOoVSGDBZwxgZ0o5UEWiPZB
         oVUj0/CCAAjysBTY0KIA0EbbJhZ15w9tPqoyRFbOfSDBCCxUqhbQuOr+VeCyT2Dw7dDh
         CtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677459; x=1784282259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRa1V0rI3XaAjqfNbDQPKrOYUHx+ncbEbofR/K207A0=;
        b=peTqbC+XmmvD3AcRRqzcNfZaILqCxrqa3Bot55EoqGQ5pLAQsFbcL3QCpkDV5SB/KN
         xc6KQ2BeaAm8pyStgMmI0dSxj8MfiGKuHDbgAXUC2UujJXaW8S1JB5YEtcDX77hBApAI
         3v7wgG0dRuFyNYbtN6l+Gf6m5tAGchiBlMWKJiN61zkRiTlr5l9Mw/Vwrt2JeVh8mLeF
         u6qtslUDS+eRN4ksUa6m2GHaZKgWmgEIaND7AkBQDX/XAG1uFX9rnQAtvqyzYFFU2L/c
         Phl6h/azvp9HkdpkNv2mSRsHSXTNVyeCB7mWercLs2SCcCPiTwGnARpAtoKrh8/FOxjg
         ii7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq773+XeZeOz7pDdnZfASK4/XCDs2jhfab/VAohr9+85T7xwUxJI/i3ItbGiLlX+d0iENbZMiKEer7o1K0o@vger.kernel.org
X-Gm-Message-State: AOJu0YyfU2wwO9tIqyb10WReienD/lanSHhv/6tkbu5gLUkk4HAJuQCh
	pDI6GCmPt2QikMi1wxozjE2qoGlP+xUBFbflUKj4MFiQuaM9VFuA4kprwhgZxEDdMrZfahdyNKN
	oCGY7IPAvIqPcstUa+3ViPhErHtI+GnbH9g9A8IAKh1/Jebgwz9YPi7codVtWHdae6KwZ
X-Gm-Gg: AfdE7cljMuXc+VjUbLm6bdRVYIfmjGM0OTOoFDmleGMZ3gwlJLfvEIiEsxXwyPVbyge
	gM/pr74XcmHxBXJ91+ryDexYp+hkzv/Wp8MHDBdSd8H4u0z9xEDg5/Il1Tfo5JNJfyBO6/okRLb
	YEC+9oll81J/99VrtLkV3DnIoWStufZvAFrmNC1dEE9xLMbwii/hIY2C1Hx6Vs3G/mSJWHbh+wK
	WfEUeP6yw4kjXlYQxqi0KjfzL0IrdfYud/vvGT1V9J4n+Fe0ZBKXFkqY4PAG+955+2ZSoCi4kk9
	UvfuacXvsE6bYjXaWk+tqiI+NKueVqVdcXs3oasMreR3PhP6RiPIorKyk7upvQcDmwBfhmAqRLT
	ZHvc9vkiU1RFotVhPqJL5/qfNjY7WyxLl/7uAyl30xkYRKQJHupelMX7M3UMMGqbcYwaPH/OBCe
	c9VpZn6K4NVFCGa176+x5cxfR7m5yld95ih9RZdgAQ9KNzE3kAk/WVofwaVy5+dISukkXL23NIg
	aXDCnYLB/RLXgFfJCK6
X-Received: by 2002:a05:622a:55:b0:51a:88f8:bef2 with SMTP id d75a77b69052e-51c8b3daeb9mr118302911cf.28.1783677459287;
        Fri, 10 Jul 2026 02:57:39 -0700 (PDT)
X-Received: by 2002:a05:622a:55:b0:51a:88f8:bef2 with SMTP id d75a77b69052e-51c8b3daeb9mr118302571cf.28.1783677458821;
        Fri, 10 Jul 2026 02:57:38 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:38 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:57:30 +0200
Subject: [PATCH v3 04/11] power: sequencing: pcie-m2: Report power
 controllability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-wireless-v3-4-46253587af64@oss.qualcomm.com>
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
In-Reply-To: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX34VXN5FUhxeW
 4WindRd/HDy3aHZTuzqNG5lgHa0nVJO/BuTcEPP4eeaGOEqWUuVz00PPVHNb9Xlr1koS0xQVwOb
 ijXsiUs/TXWMk9tZdwo6Jy1eAlCrQuAbqka7U5tkRbfwNN/jBo1Fwm49yhJKSBgHuMwCHgVfCMV
 FBVoFBgeEDQad6Jq/cFw1/1Ibf3WoA1ma6q2youKYmZTKo5wxHwE/0Q6GvkyjnGw18V53XtKc3l
 otWK8MluO1bY1T+us1ORNFBf/+dbmKbgQIhuvWHfbqsbm/0RPbErDmn1s3Pvvx+NtKPREBk4Z4U
 9WHZ9xSm8N/Beev4gG4tD8JkCSFfGY4QPJGXhMNF1zCvBh0koai8GcFdxmsQ2L5qI8+0KwYklFN
 oVT8Eein4liuem0L7hJdi8nAEhX8BONcf5HBFArhKhp62MfnmmXlX65ohswG22n41yCgqLuT/AE
 OmskT7E8uJLF/qeoH0g==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a50c214 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZbPLKLkBM29APCUVJXgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfXwBKMoPX3R5pJ
 QjmK9EqH22Nw+HdIxwFfN0VLfMm0+1nAtMHj8m8ZmnzzTbUWh8E9GQmlaySovGBypuzT7/3Dgr2
 J+MNs3aN4Q4PjibcxwDNYfpm7qwCD+s=
X-Proofpoint-GUID: w9HdZFm01f7aVLwjJNvUY6vw4KnUFVsk
X-Proofpoint-ORIG-GUID: w9HdZFm01f7aVLwjJNvUY6vw4KnUFVsk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118227-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D406F739629

The M.2 Key E connector gates its functions through the W_DISABLE1#
(PCIe/WiFi) and W_DISABLE2# (Bluetooth) signals. When a signal is not
routed to a host GPIO, the corresponding enable/disable callbacks are
no-ops, so the host cannot gate that function's power on its own.

Implement the per-unit .is_controllable() callback on the "uart-enable"
and "pcie-enable" units so that consumers can query this per instance
(based on the runtime presence of the W_DISABLE2#/W_DISABLE1# GPIOs) via
pwrseq_power_is_controllable().

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index e3ba9169144dabbf0c553c0a4302c3b511fcaaa1..4bcd5078609da1be966ab30c73cffae5e578934f 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -84,11 +84,24 @@ static int pwrseq_pci_m2_e_uart_disable(struct pwrseq_device *pwrseq)
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
+static bool pwrseq_pci_m2_e_uart_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The UART enable is driven through the W_DISABLE2# line. When it is not
+	 * wired up on this connector the enable/disable callbacks are no-ops, so
+	 * the host cannot gate the Bluetooth function on its own.
+	 */
+	return !!ctx->w_disable2_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_pcie_m2_e_uart_unit_data = {
 	.name = "uart-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
 	.enable = pwrseq_pci_m2_e_uart_enable,
 	.disable = pwrseq_pci_m2_e_uart_disable,
+	.is_controllable = pwrseq_pci_m2_e_uart_is_controllable,
 };
 
 static int pwrseq_pci_m2_e_pcie_enable(struct pwrseq_device *pwrseq)
@@ -105,11 +118,24 @@ static int pwrseq_pci_m2_e_pcie_disable(struct pwrseq_device *pwrseq)
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 1);
 }
 
+static bool pwrseq_pci_m2_e_pcie_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The PCIe/WiFi enable is driven through the W_DISABLE1# line. When it
+	 * is not wired up on this connector the enable/disable callbacks are
+	 * no-ops, so the host cannot gate the PCIe/WiFi function on its own.
+	 */
+	return !!ctx->w_disable1_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_pcie_m2_e_pcie_unit_data = {
 	.name = "pcie-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
 	.enable = pwrseq_pci_m2_e_pcie_enable,
 	.disable = pwrseq_pci_m2_e_pcie_disable,
+	.is_controllable = pwrseq_pci_m2_e_pcie_is_controllable,
 };
 
 static const struct pwrseq_unit_data pwrseq_pcie_m2_m_pcie_unit_data = {

-- 
2.34.1


