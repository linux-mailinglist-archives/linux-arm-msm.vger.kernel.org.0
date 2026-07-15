Return-Path: <linux-arm-msm+bounces-119132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 19w5HDrzVmquDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 04:40:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0470475A167
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 04:40:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZiI1gAuc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jXdHB8j1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119132-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119132-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2563D306FDC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8003A8757;
	Wed, 15 Jul 2026 02:40:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC90F207DF7
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:40:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784083249; cv=none; b=QeCMvVUla5Nt9u7OhVzck1AhWaxjwJTDopV7VFRvDYVH/my1bN1euWTt4ElNhHdMjnGNoMRACvJUpH3O47/UV1nzv8pnn4Vhj5IF4MHHKx7juWydq8VxcR6XSRXrwGeHUZv0KlRA765CpIqiyIQdcFj/L7c85p1PWCa7JeeP9q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784083249; c=relaxed/simple;
	bh=mXE25MOD7qAGKf04cw4pAOdDRL3qCpO0EcAqP4avX7Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=awd4JUB+BAsoi3ozWUXziVeP1/9RR7vYCTqr8g/bFCqpEPPARQcfb4kAyuQ6HjQG1ejmhZ2arE1KjY8UlxEq273ErYQFmArTeYw0KLKDpilRgi3AfRNC+6FCkaW/xQDxm9u7UtBKWnFJLjo/p864o97mKoF+EYNMhDy8XE/VUNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiI1gAuc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jXdHB8j1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IQ8N2171749
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/UHdTXmOh8ctZASNscRZZu
	MjOo0xTkaamL8hxFHQpWM=; b=ZiI1gAucpIsdWYk0WtbO7j9sRZ0j+wp5i77/ns
	TVR1WX4ndljoEWGmRQMMSLogaqrnd1ggzSd6UYAv/njUdFy/q4XjLLEt8OwIyA5h
	RgWAZhizs70FCK0WwiWbDg5Dmmo4z+Et4+QYw/FnqvFzzMz2eW50c3wXKb6zH9K3
	SK5I23bSTfXvSSiFcJQH0DDpr0KWkCYebk+LzFIwJ4P2hHPoik4ZyXRkxfYlrGgs
	GpP3qlr+BfjH3T5beyC5Dcq2U1RpJXPMjg0nVTDPaE5v5i5PokmwuAvOqgWye3s8
	EdQ9+XKPauU64zVHTqR+DCkGTGTY9BXzCTAxIeIQZsYuhuFQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqtphr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:40:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8895156101so4738487a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 19:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784083245; x=1784688045; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/UHdTXmOh8ctZASNscRZZuMjOo0xTkaamL8hxFHQpWM=;
        b=jXdHB8j1TJpLbi5acEOvZ5ygR77y4NCGaYOuUJ2NboFYpjrZa67+mpQa7t7cRs4goa
         r6gymYCfmouzgu2oMZotnrhxpkm4mbVDfBasZt6dzDRrpH5PxHCzdmI1f0YkSa0CERy/
         u+HYoHZyZvKdkQ3YvjaAaCvu7dpDyGxc/VPau3gQGWK0k3QYbNrk9tOvsm1XQoqYoXxO
         EPVxQyxs7D53gQ3YJccx7pgzV78TsmbqU6Ep8ien0pxUn7o7rc+kkW3hRTKygmdMFm3y
         BfBQuGO362NBydGrwAM2xNT4Cizlh/z7lk2Ek1tujfjcUdQ7wOb1hb8Y5+p0SRxOZIix
         +jjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784083245; x=1784688045;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/UHdTXmOh8ctZASNscRZZuMjOo0xTkaamL8hxFHQpWM=;
        b=H4P+6pJ5gvzglYwPvL7jNwO9S24g6nEBQzc5/hUddQTyI7cHbj6/s/Qywuume/NMdH
         fgmvSu9WBWaZKsft8gso4MaR7r13CS1HL0gRxcv/96PwVKxsOLQc+zvu7tOsh93GG3Nn
         dOBuxxCCbA46KjU3Yfx7EsKRCIWOsfUws9dIui6MSn/RvGyxbQDoE5jXsGPT9TFKZ4Xy
         Q/rh6a539BuSLawOx1XDeiz2oRBviOiHQAUtHgHAzo1Z2H5LO9uuP/oT8h7zzGKg44ZQ
         ZywdM2/kMcd3DTgGz5kGP247+RTW7DFI0FZWEETt2AoRemttCDyfc/VsIf1emYSKxint
         baag==
X-Gm-Message-State: AOJu0YwOwn4OTv81AyCCkd3gQDbzn9lv2IXoD9unXkkhHf7aiJra9l7t
	BBIY3MMlTDO4tGa6xt4yojpJTf4Wpi+G/V2WlSM3cJQpjaFgffj2m+SClcZywdRSgKpYlliR/PE
	xQUl1lX7dcDsAMmD6/NC1hqkfy/9nDeIdEcS++QPyA7pBUD3PR6IMZDokUJAThd9SKlGnP59Hfu
	l0
X-Gm-Gg: AfdE7cmrIAKX4siVjUpoNTebkGl3W7W+Spsm0MqLVqP2Gj6cESo6X9qZgDWBg2HocaD
	sc2P+Yx0HdfnsUb6OxfpgnfRuAqbTvBZPu3ISD2cmWRuQoTzhY23hY6oVcOi52gcSaaKSNuggXV
	pG3ar/UCbS9xfWLYmTivB4Gf8enY9BVKmXiS3S9scdwVjRVAzThyrRKu5EEQVQyH1+UwwFpnXu7
	DtkLPAF+ghZ3By/0eD7KxogoyZeodu8VcggJYqxvH3YDYJmMfS1SDYDsZ9UbhUHuhAhFGzUgAwk
	XHqOAv3+5xFMensvnyqwA1J65yARkcUHNMU5LT8bGiCE9rzqF4dBUGQdUZyUjGfdvw/5QekSVzu
	/skiuwMRxYcB+8py1EuhowEk+O+bPUcb5mVdlKr0SJusvd1z/O0dEaS2JqA==
X-Received: by 2002:a05:6a20:e68b:b0:3c3:33df:4d9a with SMTP id adf61e73a8af0-3c36c0f6cfcmr1127048637.1.1784083244659;
        Tue, 14 Jul 2026 19:40:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:e68b:b0:3c3:33df:4d9a with SMTP id adf61e73a8af0-3c36c0f6cfcmr1127026637.1.1784083244200;
        Tue, 14 Jul 2026 19:40:44 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm155285746c88.14.2026.07.14.19.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 19:40:43 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH 0/3] clk: qcom: Migrate x1e80100 TCSR to clk_ref helper
Date: Tue, 14 Jul 2026 19:40:40 -0700
Message-Id: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjzVmoC/yWMSwqEMBAFryK9nkCMoqNXGSTEpNUe8JdWEcS7G
 3VZ71F1AKMnZCijAzxuxDQOAeJPBLYzQ4uCXGBQUmUyj1PRmX40erHs9eyx0feolXBpXrtCZon
 FLwR5Ch/tT/hXvcxr/Ue73DU4zwu5YSf0egAAAA==
X-Change-ID: 20260714-hamoa_tcsr_qref_0714_2-d47bd9063ce8
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784083243; l=3088;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=mXE25MOD7qAGKf04cw4pAOdDRL3qCpO0EcAqP4avX7Y=;
 b=KBZvOTsOAl7n2Yky6iNI19CyhIxGgxT5jm09Scn9kt0NHmLd1vrhEq/KCgLEdsXcDFip3kinx
 PB6wylERg0vCRY3ONLh6oCHEtEmZ0xJQvBPKMvoC0zV0yh19L0nc9Au
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfXxgdVl5hm3ADY
 ubuJnF/++vddpjtPF8LDzAfCN7FFZHR6HYC+q2zu2vw3Nt8Ot4FqzFFmitK64K8CJCIhPfI1UwG
 ddORSpdqZ4nqLfUnP7wQq2jyqj6WJ4Kqzj5RKb6WZUiRpegFHhtM77DrFhPKZgF4XB+DXwIAu++
 dCsYIqHoCoYktwT3W0CA0A/aV9cwtgQhTZCbRGoWp9omnSY9bcOJG45+I6i7xPsmfpkcnm0XQ1m
 m8ZHSd52WNCjO+TZQlSRLR8D+ujD082snnqpE0CfwzwAU4C/EJxDeFMcEb2pn8A8FFheoUiEUWh
 OTtO3kQFf+gORpXzIbhc1vm/zztRU6OhkkAceinV+ve2ZDIELSn7FEOP2q6sA83eKBWjk+FF9/C
 p/CujOBVJHrmQEgvQEcz/iNnzsbC5zGJTxO1Hu3NAbosbiEodD2ZfDcPsj2l9pOK+tAR+UELVwK
 MHKIXB05qFaO1s09UKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfX7cYOoeMdAk7L
 dThQ53vsSxqylDgJmnldqVTQ5//54Ogz9thPSA4hMuT5Qm6Y9EZjExF3btHmkZ4Bv1mgIhR4CuS
 FaPt3NvqwvgjJD+eA6hZkec6GOywtYo=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a56f32d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eDrWBMRqIGSfgiUSBJUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: DrEYnQgrbrYm_vBUzU4EmWKeGFYUd6qb
X-Proofpoint-ORIG-GUID: DrEYnQgrbrYm_vBUzU4EmWKeGFYUd6qb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150023
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119132-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0470475A167

The QREF block on X1E80100 supplies reference clocks to PCIe/USB/UFS
PHYs and requires dedicated LDO supplies to operate. The digital
control interface for QREF (clkref_en registers) resides in TCSR on
X1E80100. This series migrates the x1e80100 TCSR driver to the common
clkref_en helper introduced for Glymur/Mahua, and wires up the
required regulator supplies.

Patch 1 splits qcom,x1e80100-tcsr out of the shared qcom,sm8550-tcsr.yaml
into its own binding file and documents the QREF/refgen supply
properties, mirroring the qcom,glymur-tcsr.yaml split.

Patch 2 converts tcsrcc-x1e80100.c from local clk_branch definitions to
descriptor-based registration via qcom_clk_ref_probe(), reusing the
common regulator handling and enable/disable sequencing.

Patch 3 wires up the QREF/refgen LDO supplies on the boards Qualcomm
maintains directly: the CRD, QCP, Snapdragon Devkit, and the hamoa and
purwa IoT SoMs (purwa shares hamoa's QREF topology, so it reuses the
same qcom,x1e80100-tcsr compatible and supply set rather than needing a
dedicated one).

This patch series depends on:
https://lore.kernel.org/all/20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (3):
      dt-bindings: clock: qcom: Move x1e80100 TCSR to own binding
      clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref helper
      arm64: dts: qcom: hamoa/purwa: Add QREF regulator supplies

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 118 ++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |  21 ++
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  |  21 ++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  21 ++
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi |  21 ++
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  21 ++
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |  21 ++
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |  21 ++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  21 ++
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |  21 ++
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts   |  21 ++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  21 ++
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    |  21 ++
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  21 ++
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |  21 ++
 .../boot/dts/qcom/x1p42100-microsoft-sp12in.dts    |  21 ++
 drivers/clk/qcom/tcsrcc-x1e80100.c                 | 335 +++++++--------------
 22 files changed, 630 insertions(+), 223 deletions(-)
---
base-commit: c69a5c0ea17c77d1e10aabf4827fb65776804972
change-id: 20260714-hamoa_tcsr_qref_0714_2-d47bd9063ce8

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


