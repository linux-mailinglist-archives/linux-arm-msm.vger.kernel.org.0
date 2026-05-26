Return-Path: <linux-arm-msm+bounces-109718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJ2OMdkvFWr9TQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:30:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 127345D0D1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA9673018AEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C743A8722;
	Tue, 26 May 2026 05:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzVCek8P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gx4JvDuo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B8D175A8D
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779773398; cv=none; b=UFeQ9nAF+vT7YIcBHthY2XuPTNwZGqvYXYmab9xlkJd3yeD1n6TG6noW6oo1MwUX/60Bac2Qkg4E3aBtXal/ZUz0YqdYH6yNketR2X3wDuoqkYDT/T+YvMSEYpnekvR/GQODItN3EUdGKQoMZvixBnWnH/Dw+TfbPDRCXLbTDDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779773398; c=relaxed/simple;
	bh=RDv9C8vo882b7grqcNEBmysk+rZ5aRPE3/o5s+kdDtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u0O+98zV4FfXockpKrVMqMAjkaklGtPgTKulQKOCaOaQoSuN/kJAGmqZKsGwdF3EQuJwnVCRNtC9e+cRKv9BrOpk0xxQWQ+CJK8eplZlLgF+BIhsbi+5QADWWnCaGlt/wwQhVwDH8vXKvmVjR30cYx7FW9/xT2bOF4TBNBPFXP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzVCek8P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gx4JvDuo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PKtQRW1580322
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AMn6ZNqovB2tg0uVljWWvF
	cE+D/UKXK4nk5ckLii3Rs=; b=OzVCek8PAyzJSsFP3OaXRyT0ZKKAwZjVwg/1gs
	bdVE9YcM4F8bXndBaEMJ9iaY8nGTAycODZ4I0t1J6MNozzX6aDpkL5oqX0silZFe
	If2QitzRW9E9UdvO+5O8Rv4AByWKW+6bQXHhvUVZOCumIIxYUXTqryHMtdONe1et
	bg+voXHjamUgSEm8zY/nzLDoa+TLoExD8dx08fneW52YjGcKO5apQ6uz9F3+n0ke
	B4xkfleG/7e1qQyRvAbQlpiRr+/I7C3NaRBD0KNu2ysRepT8z2OXzk/IcQzRgwck
	aHHEkbu+g2G4KG027GHsClaqcm4VgWRq1JeLFwCXei9W1kdg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckmab381-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:29:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc977e6aedso107008095ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 22:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779773396; x=1780378196; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AMn6ZNqovB2tg0uVljWWvFcE+D/UKXK4nk5ckLii3Rs=;
        b=gx4JvDuoP5dcPvOpzvZYFmGfdK3b7SgcecZJZ3Zi2eff74DaGU4575CqUHI49UygtW
         20wC4y3SdoWmJoGWM0OfNBRcqkF+fMSawvXWYS5/0nyj6NSrkD70jJHSQqJCvxR5P5jO
         xLDHoDk4zfB5UXnq5xPTC+u8C/xFchnMsGplpCQWC/4WM7tn77Hsk1/R8WA/d3Q2GxM+
         l7sZB3l2RddzGLOieJfacHGgLB195GP4f3rlxe+QJTIj2ZEaI1WhWAmsdQvbIhi9znkP
         TvAfeVrUl1F4gHDoAVyEDtTvQnnBRN5UitTY1Te54SR1pakMHl9Bx5zwl1iroMqcnj3m
         GReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779773396; x=1780378196;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMn6ZNqovB2tg0uVljWWvFcE+D/UKXK4nk5ckLii3Rs=;
        b=r45ekfHgUjxYy29PhbjMj5/uJq3r4q7tc/PZE3dYQQ6sR3DIEYy1TiqOflsJJSFbWM
         qN84cGGzlgnkzI9+MXBWfxuzVJdS4tFM3mFK51fdBgxrYTpTB1VFvprcCfJi7aP64Umk
         FWsFlCvvmxDXf6OP8FSbnMVoH7KhUdkpGuUHxjHHxDip62TcjCXgGwHwnWZoqtwslZrb
         3OJoMZSNJZ5h0Gx8Ab6Ap5sEXoq7+7nlSXsxLfcyS+nrHsp7/1971oEIOX/zhQSpvEso
         rvVL5Htu2KjvbrrHTKgNHFJGmRD/4cyH5KhwF8M5yKJAINT3Pqq/Tmnws/MtbZe0kRgz
         wlww==
X-Forwarded-Encrypted: i=1; AFNElJ/n8kMboMXauwGDse5n41zCPCnn2SeWGxHWNQSajlXNAsB8XozhhI4i2q4QJeSXdSjaR2+Di3EM/q0ONup4@vger.kernel.org
X-Gm-Message-State: AOJu0YxFSyHokeIQ3n88Qo9vGWo5pFkn3gCXIIw7cpOmqmmdWzuScW3n
	nkVJw6fYtEd3zi/qIHJfbb1lnDri83jbCgwzXVM8J5uci6XHdNSAmjpz7WlznDOr3p6SinunRL5
	HhpcV+pM2imsJX7dJ8RTn7evDbb03BP1QgbKMq1YGceG0KfDwr2erUpeamDyt+R7MH7RIpWRy8d
	8H
X-Gm-Gg: Acq92OF+oZC6Qv9oIKiTFSnh6C0yTZvnr6mg+w2ODS6cI3F3LVRFeSo830lQ3vYkyus
	izVRKH5x+cV2+/3+JwqTAC0BBgWAzclT8nbqG3MtfYfm0MPI44T1F+ec+VHsBU1Lbgmn+KhxNSE
	0fM/q2p6UDPajOZY62h3ebVIqDi+nKDocS2cJScp+4/YdM/9HWq1ZPxcqYH2joD7S/OczhMiVuy
	0iG7QCdjTCb+OeUgR1uqtCH1KLfVWzgAxNwSme8ASuJYJkcaVw2RKlUIX1sCaZnsGg4toNQdbi5
	OIvDQSHYiYwURRCmppTwKvse1UdzrRb8XLcvRC+npPg/R3OPtuv0AQbOw8C08DjyxEe+Jr0lGUU
	N0RPF7Z/APhqTFo1GEA9G3DUMpVx3MocIBk9LKDBxdrmlsw==
X-Received: by 2002:a17:903:2c07:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2beb0631a41mr173092705ad.26.1779773395583;
        Mon, 25 May 2026 22:29:55 -0700 (PDT)
X-Received: by 2002:a17:903:2c07:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2beb0631a41mr173092265ad.26.1779773395067;
        Mon, 25 May 2026 22:29:55 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b7920sm114088995ad.21.2026.05.25.22.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:29:54 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add EVA clock controller support for Glymur
 SoC
Date: Tue, 26 May 2026 10:59:43 +0530
Message-Id: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMcvFWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyNT3dSyxOTk+PScytzSIl3TJIMkEwvLxDQDYwsloJaCotS0zAqwcdG
 xtbUApM5BXV4AAAA=
X-Change-ID: 20260525-evacc_glymur-5b0b489af038
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a152fd4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ECThnQJB1zpBJANexocA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: kjoBNpoghUeSigBRa0n2VrKrcE9H-1id
X-Proofpoint-GUID: kjoBNpoghUeSigBRa0n2VrKrcE9H-1id
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0NSBTYWx0ZWRfXyRPaIeCREjbm
 Wn2fNoBLaJ9o2vrPCZ2Q7F5DpzOrc3sDUqvMtU0kIYTjSSRiB4HihBUTVvIjVknuPXBWldBiz9T
 u8TQM8Rx3HSQmodtemr6gqB3MYeD7PN7WRQVYAh78w7f15mWaVkxxARbVQhxHGVUMzwzsvTj4yH
 1bEtAQ7fAV470GobWUdCykBfGMlUVRn5pUEfVhbgyJ2EiRz4TjvNFXwmOAUpVOQIsEyP3d46cJC
 t+2NF7TdsmgzxbILciGMLCMJ7drFw26NWNqiR8U8A+K+A+pUoeNK5vKoQls6uHiQuGGHe8Rj5Bg
 0jeATUHJC7SXh3iazDH1rIXKu5GqW3sNIIZY25OME2KKC7aWbKOCrY8IzlSFQeZVCfIjykXWfiK
 es+SfiSnGVrPSvLPOca+jOEi2jWjuez2ipkFbOuHI6BucMpXvyATAzZAb5TC+8wC91EbRU/YaBS
 tI5Rgmi/qIDopYIZsig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109718-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 127345D0D1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for the Enhanced Video Analytics (EVA) clock
controller on the Qualcomm Glymur SoC.

The EVA subsystem handles vision processing workloads and requires its
own clock controller (EVACC) to manage the PLL, RCGs, branch clocks,
GDSCs and resets.

The series consists of:
- Move gcc_eva_ahb_clk and gcc_eva_xo_clk to the GCC critical clocks
  list since they are owned by the EVA clock controller and must remain
  enabled during boot.
- Add DT bindings for the EVA clock controller.
- Add the EVA clock controller driver.
- Add the EVA clock controller device node to the Glymur DTS.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (4):
      clk: qcom: gcc-glymur: Move EVA clocks to critical clock list
      dt-bindings: clock: qcom: Add EVA clock and reset controller for Glymur SoC
      clk: qcom: Add EVA clock controller driver for Glymur SoC
      arm64: dts: qcom: glymur: Add EVA clock controller node

 .../bindings/clock/qcom,glymur-evacc.yaml          |  76 ++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  19 +
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/evacc-glymur.c                    | 453 +++++++++++++++++++++
 drivers/clk/qcom/gcc-glymur.c                      |  32 +-
 include/dt-bindings/clock/qcom,glymur-evacc.h      |  38 ++
 7 files changed, 600 insertions(+), 30 deletions(-)
---
base-commit: d387b06f7c15b4639244ad66b4b0900c6a02b430
change-id: 20260525-evacc_glymur-5b0b489af038

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


