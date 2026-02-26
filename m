Return-Path: <linux-arm-msm+bounces-94216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yuVvCo/Rn2mSeAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 05:52:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 823D51A0E68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 05:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA21B30234EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D3438A29A;
	Thu, 26 Feb 2026 04:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VncQMYd2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ArID8JuC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1C5376BCC
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 04:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772081547; cv=none; b=USJU4FIHl62DqfQLKaqqsOc01VxfFqHcK/P/v2H/damXxewzpUmhNF2Bh1p+2Yan2Q5Xl0G1Hq3Ysu3hOoSd7YC45gRqn8LNJoYXF99KKBl5RyN8qzrVulPznXnJFhhm7fKAPgMbcYN4FsNkYDBiU03bQnmVySUE+PjdK6QWJtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772081547; c=relaxed/simple;
	bh=tFhfD1nC84Tm9n1pRJ1GG8pmTOb+/85gGuxTTClLnxY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GPNaQETWq198CtZXOnfke64Qrgzx+G0+pKeSgmrDMYGPM52IbDS7fC5KeMixSgb1xDlJ8RJ1HqxUeplJRoCc+lRlyu5u5FTXcE7wssN0aAIVVa+B68TfWjHiK/4Yxn7DayZKzV9iB/woQFQjTm7WtNn2Nd+5uzwtiQcu7MQD5xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VncQMYd2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ArID8JuC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4V2Ph2617918
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 04:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Pi8VbryZGymIT3L0cdj/sI
	0HElQ4oLryEmoHyL/4ZbU=; b=VncQMYd2+pHWrumPqwLrXGzw+7UZcELGEhNHls
	WQW0jhMktIxRzAFuAM9bMb6tl6tIJj1GUCYmaU5ahxsKj/wf3siDoNodoQlKdH0y
	7iOi1aIuafcw4knYHbo3nIWp8K7FMZtGwgWoE57hf25EwUCHByAsR+KW+Giy75hu
	ep0h3shVa6ql3H2BsZJ6b11TkpED5PZq0BQjoZnfekyqJ760FM4NtrFghswG2iSP
	DzDXlsXyT+Fr22eJWOwjG1iVONhF+MzwPxgXbb8u3ghYcDsqvvbXW7hjzs1Z30S4
	WKFqnGi78QgDC8CdmNkcEJhsuzAG5kOJCuowOMSyBZDejOMg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj559hs7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 04:52:24 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d4c6bb79a5so1958747a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 20:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772081543; x=1772686343; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi8VbryZGymIT3L0cdj/sI0HElQ4oLryEmoHyL/4ZbU=;
        b=ArID8JuChApfkCg/XEYYrYGgpqdYQZDUK/BYrOrVJk1G4H+RSpMqo6FxDKEQiu4ZTJ
         kK794YBxg3wLCSlZJb63vH3Ir8Y65ZcKdsK4rupXCJ3FwSBLOq0H8gmgKhcxgGKBtsKH
         aB6qOmRobIThVNQYDXPvHcvtb2/9wPCRVasvwOM8nzX3lmvwaKzvcBKpNPuEpIM3hOk+
         blzTOwVO8d0YbYXYx7vYSxpTarfoeSk0c+Rq3FecDMok50+FBBHKfr/F70JhRBZaDNNa
         ZkVxYHu8raBUi2CbyioDVoGCIvSSNekTisUbv5BJ3KGjlvouOzhY0IpKHGVV8J7DeZo/
         W3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772081543; x=1772686343;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pi8VbryZGymIT3L0cdj/sI0HElQ4oLryEmoHyL/4ZbU=;
        b=ISqT+k4nSm+dyQMoHAVdGVMH/zsNyA7HF0Mcx0RUAGr1PKeG5lVZojJkd92PrQvx+1
         HsyMjXh/mJmYUB1T21fvLRXYSDcLwt3JqMrnJ6QvlZwWyyEqzcSpEEzaiihFWhh5FnTk
         /p3g2FOOpsjBIQVV5RaCpS6ukdRDyZafY4OqYwoPpoP54BG/LyWXKz7CMe2S93HqyBvd
         IrU+cTbwk7+3P9u2YG+cTEGQ2F0qtjO9qkP17x0RqeU76hHJCTp6ImlI3oTlXxi/aUjd
         PzR7FaUJTz8TkT6lYosRvwYYWWE3pATai4eJRp3x8sIzkQNO5/SYWEiPu8a+2HUr3S0B
         hK6w==
X-Gm-Message-State: AOJu0YzIr03u+YG7+i0ALaHzQy/9tBJRFVQD1DkC5FC4HxI/KNt9H2x2
	Q1jSd1LZJ32IV3v20lQwY3yvhLXEo0b1ZG2AzK6mZhvsdefDOSO5TiCC3kyjIYdrQc1hiOtEHKF
	gEWFO8a5SgBoYi38kBmq0lZjULYzUaxP9dl+R4/XADa1AeWrxv1wKriZlmJycVIxbrx6t
X-Gm-Gg: ATEYQzzGzovZwIBUM4ZkxYUcDOmO+17bhbIRD98lJzsRbTE0oxpG/SzzIzMm1q2XWa6
	K0KExAgn94KOyOJVh6bOzo4hhT6ETwDqtXlz70WttTDxlMO1nXGqCZBznYC/0BWDMw3hkl+NXAC
	y25SaFTUu0CqTSVWKmhNcdiFClqv1gmIu5Y4cvYApKf++FmiDMAeL6ffM9Gh6yRAfTw2XiS52L1
	Fxrl9l3QHRKJ5smCisteOkkpkNweSYI3gHOb8rG/106NDxN/tGdFcKrbe8KWKs1bILRVxMl74in
	ucRw6lGLDvNKgA4sjm0sE+H/3yKrcn0uEe4+s6bVwVQibPW6Bq3AYoiH/hYgWh1izveP6B0Cxba
	BN2tMBqXHBZSg38aR1m99u4/N2gWovp9/SzDTU7YLhBhFToPGzcmyVfeiZyqO3L6PFevBm6u+wg
	==
X-Received: by 2002:a05:6820:81d2:b0:661:1188:4b99 with SMTP id 006d021491bc7-679ef7ef381mr1385846eaf.3.1772081543037;
        Wed, 25 Feb 2026 20:52:23 -0800 (PST)
X-Received: by 2002:a05:6820:81d2:b0:661:1188:4b99 with SMTP id 006d021491bc7-679ef7ef381mr1385824eaf.3.1772081542481;
        Wed, 25 Feb 2026 20:52:22 -0800 (PST)
Received: from hu-djaggi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160cf239e0sm978431fac.1.2026.02.25.20.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 20:52:22 -0800 (PST)
From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: Introduce sa8255p platform device
 tree
Date: Wed, 25 Feb 2026 20:51:05 -0800
Message-Id: <20260225-b4-scmi-upstream-v4-0-50cfba9e6a0f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADnRn2kC/x3MQQ5AMBBA0avIrE1CU5W6ilhoDWbRkg4iEXfXW
 L7F/w8IJSaBrngg0cXCW8zQZQF+HeNCyFM2qEqZSimNTqP4wHjuciQaA3rbWt/UxmpXQ872RDP
 f/7If3vcDHItZaGIAAAA=
X-Change-ID: 20260224-b4-scmi-upstream-c979c51694b1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772081541; l=7383;
 i=deepti.jaggi@oss.qualcomm.com; s=20250501; h=from:subject:message-id;
 bh=tFhfD1nC84Tm9n1pRJ1GG8pmTOb+/85gGuxTTClLnxY=;
 b=VIcIE1ljQoet1C5k9FDCTFwoR6R54zwZXQq0pqZaPykHue4EDBBcDk1eAyD9mRO796PgcZLyv
 t45a1O2aE0MBnNVV9MRdqYQUV0rKQE+29kvitYqpuD6a5MaDVTWsrrc
X-Developer-Key: i=deepti.jaggi@oss.qualcomm.com; a=ed25519;
 pk=+b3H5UC/u0pUK5+btJ+35nW+6vKwJV1CfjJ1CJWuOZw=
X-Proofpoint-ORIG-GUID: U9RdU3BKTI66SI2N3H3ftjeF1gzF3kpF
X-Proofpoint-GUID: U9RdU3BKTI66SI2N3H3ftjeF1gzF3kpF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA0MCBTYWx0ZWRfXwW/5IMhkY1MZ
 E4WAb/mA0vmiGIpJDU+QgIFAnW9d4W56u90IrEqpKDOA9UDKQNuGVarlih6aVkImaaGNjlsfCrg
 5t03af5zXV6BJ6ZA9HEuZyRp7ejBrU2EyfRh9ttJBw/VKJXXq+PT8SvdQQg6MUFg9hB1K1IXp+E
 92vFY3kSiT3uV8JNHQUC0QnY2S9ssS9O0mQidOZRB16JuvvoFtiGAFrDQwQYsVN4PKu5jqdFVjO
 N7127qzLg3T0NMFe1BkSxcowvU0BHudGxM2gfe8pe/9Ky5VDWQSfo7yMzc5deegfYiQTlydMJ+O
 Dhv8WS4MAnHRYo/fu3A8Z9mkNW6dIjJXOzs7asXjMoaQFt3oo6iNCsro/ABam3R5Cf8HN4JzRy/
 7HFWljS2djpi8W82f5H8XDDFf7MSPNVlBbwS95m3QM7Mafr9b1yPs6BCb6tcdUiuXLP7EEo796p
 niavm7qhlIpNH8mFa2A==
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=699fd188 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=OqDjb2b6Uua3qTf0ZKoA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260040
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-94216-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepti.jaggi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 823D51A0E68
X-Rspamd-Action: no action

Introduce initial device tree support for sa8255p Qualcomm's automotive
infotainment SoC and its reference board: sa8255p-ride. Use SCMI power,
reset, performance, and sensor protocols to manage resources such as
clocks, regulators, interconnects, and PHYs. Operate the SCMI server
stack in an SMP-enabled VM, using the Qualcomm SMC/HVC transport driver
for communication.

Instantiate multiple SCMI instances to support parallelism and assign each
device a dedicated SCMI channel and Tx/Rx doorbells.

Group resource operations to improve abstraction and minimize SCMI
server requests. Apply the design as presented at LinaroConnect 2024
conference[1].

Features added and enabled:
- CPUs with cpufreq
- Interrupt-controller with PDC wakeup support
- Timers, TCSR
- Reserved memory regions
- TLMM
- QuP with uart
- SMMU
- Watchdog
- TSENS (Thermal Sensors)
- PMIC support
- IPCC
- Random number generator (RNG)
- UFS
- PCIE

Architecture:
                                                          +--------------------+
                                                          |   Shared Memory    |
                                                          |                    |
                                                          | +----------------+ |                +-------------------+
 +--------------------------------+                   +-+-> |    uart-shmem  | <-+-+            |      Linux        |
 |            SCMI Platform       |                   |   | +----------------+ |   |            |   +----------+    |
 |                                |                   |   |         |          |   |            |   |   UART   |    |
 |  +------------+ f +----------+ |                   |   |                    |   |            |   |  Driver  |    |
 |  |  Drivers   <---+  SCMI    | |        e          |   |         |          |   |            |   +--+----^--+    |
 |  |  (clks,    | g | Server   +-+-------------------+   |                    |   |            |      |    |       |
 |  | icc paths, +--->          | |        h              |         |          |  b|k           |     a|   l|       |
 |  |     tlmm,  |   +--^-----+-+ |                       |                    |   |            |      |    |       |
 |  |     etc.)  |      |     |   |                       |         |          |   |            |  +---v----+----+  |
 |  |            |      |     |   |                       |                    |   +------------+--+  UART SCMI  |  |
 |  +------------+      |     |   |                       |         |          |                |  |  INSTANCE   |  |
 |                      |     |   |                       |                    |                |  +-^-----+-----+  |
 |                      |     |   |                       |         |          |                |    |     |        |
 +----------------------+-----+---+                       |                    |                +----+-----+--------+
                        |     |                           |         |          |                     |     |
                        |     |                           +--------------------+                     |     |
                       d|IRQ i|HVC                                                                  j|IRQ c|HVC
                        |     |                                                                      |     |
                        |     |                                                                      |     |
+-----------------------+-----v----------------------------------------------------------------------+-----v--------+
|                                                                                                                   |
|                                                                                                                   |
|                                                                                                                   |
|                                                               HYPERVISOR                                          |
|                                                                                                                   |
|                                                                                                                   |
+-------------------------------------------------------------------------------------------------------------------+

+--------+   +--------+                                                               +-----------+
        | CLOCK  |   |  TLMM  |                                                               |    UART   |
        +--------+   +--------+                                                               +-----------+

---
Patch 1:
Changes in v4:
  Added the patch in this series.
  Rebased on linux-next
  Link to v3 https://lore.kernel.org/all/20250423003845.3980330-1-quic_djaggi@quicinc.com/

Changes in v3:
  Removed the patches from original series[2]

Changes in v2:
  Added Reviewed-by tag

Patch 2:
Changes in v4:
  Added the patch in this series
  Updates to commit text
  Sorted clocks in alphabetical order
  Added dcvsh interrupts
  Hystersis value changed to 10000 for soc thermal zones
  Deleted sa8255p-scmi.dtsi and scmi nodes moved under firmware node to sa8255p.dtsi
  Changes to scmi shmem nodes - removed from sram and added to reserved region
  Changes to copyright
  Added address cells and size cells to interrupt controller/intc
  Added dma-coherent property to smmu
  Added pcie and ufs support
  Link to v3 https://lore.kernel.org/all/20250422231249.871995-1-quic_djaggi@quicinc.com/

Changes in v3:
  Removed the patches from original series [2].
  Added arm,max-msg and arm,max-msg-size DT property in scmi nodes.
  Changed max-rx-timeout-ms to arm,max-rx-timeout-ms in scmi nodes.
  Updated commit text.
  Reordered range property for qupv3_id_0, qupv3_id_1 and qupv3_id_3 nodes.
  Reordered vendor property(#qcom,sensors) for tsens* nodes.
  Changed cache labels to lower case.
  Removed unused i2c,spi and tlmm nodes.
  Updated reserved memory nodes.

Changes in v2:
  Removed scmichannels label and alias
  Modified scmi node name to conform to schema
  Moved status property to be the last one in scmi instances
  Changed to lower case for cpu labels
  Added fallback compatible for tlmm node

[1]: https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
[2]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

---
Nikunj Kela (2):
      dt-bindings: arm: qcom: add SA8255p Ride board
      arm64: dts: qcom: add initial support for qcom sa8255p-ride

 Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi     |   80 +
 arch/arm64/boot/dts/qcom/sa8255p-ride.dts       |  161 +
 arch/arm64/boot/dts/qcom/sa8255p.dtsi           | 4861 +++++++++++++++++++++++
 5 files changed, 5108 insertions(+)
---
base-commit: af98e93c5c39e6d0b87b42f0a32dd3066f795718
change-id: 20260224-b4-scmi-upstream-c979c51694b1

Best regards,
-- 
Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>


