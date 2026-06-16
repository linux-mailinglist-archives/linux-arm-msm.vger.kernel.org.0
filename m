Return-Path: <linux-arm-msm+bounces-113373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U0LoMRQmMWoCcwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:31:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 793A768E51E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:31:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="gS+Ila/Y";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BuUmyAU1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113373-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113373-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B34EA30A0E78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7837A3B7B6B;
	Tue, 16 Jun 2026 10:27:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB3443C076
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605652; cv=none; b=HdB7XsXqGn+HI0BWBuHSf8azJ36cO+/QSBQxzsnK39y0PlIgDyqUE5m6v+zSUeHOUsUpDXKV7BZubkwG5iy83ZfF0Rdl5wUG+fnWzrLYIoMFfYf0saI/wlxMCafXY56BR0HMZQZDt7Uda2V4BWIAHeuLtGeOL5ct2s1GAJH+q60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605652; c=relaxed/simple;
	bh=lZzGwcp1RbmXBuhxY6qnZq2nvbiemlZxoipH7l6wYJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZnYSXQnFs1xo6A3aePQH68BxZDYhJuYteCH9OxeL2QNvW8E/TaiBs6VVyWU5aBqfzhR9ksjd7hzyxac1JYzR8FOoqkl+CNcRxhN5Kpk7g+/UXlbaY0d0VEXzoC8cYHFXgbAREEy2/q9/V5T1cF3bqGzYFlY5629HczN9zxY9Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gS+Ila/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuUmyAU1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9V5H2894197
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qldGy+HqkY53uavymykAUk/HfKiP5fsNYXFtm5E9aFk=; b=gS+Ila/YfQEtzyYY
	E8KZRSkAzocPvQoDgMDQugJnXMm1bVvlgrBwHGYSwJJ2pV9CQXEzbdSLzmtMMktG
	RkNVhgYdHQ631N+IfILIC6Uzm+pzPBO2dS2mgZ2gzhnKYT6tkcKdn7UqXTIzUs8+
	zgAwENhvjMVrjVQuqGy01IUt7AQA8EpemvapVg74v3pdYwfw72OpVs49CuWx3AQz
	Ow57eqsQJqwTDGnk/37UuaFkHcVlYXLJtD+zRQUwbXsdgz4eKCH8JVN/XpV3CCHe
	fjNouvxMHUus3t545EWveNkm4XtyTFE+IjAeuRNsR5tUQqnLO6PpE+kkDdZtAeTW
	xvQrkw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253gqm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso4315216a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781605649; x=1782210449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qldGy+HqkY53uavymykAUk/HfKiP5fsNYXFtm5E9aFk=;
        b=BuUmyAU1W6O7oh0RBWTU0EmD84sNuBP4RzMH812ore1M1ULL9YW7qOJ7Kcku1gJtl2
         XP8vdV9H7dERFdYGx55hk+6pMqlYKU7SeEZzQDhInbOLB781Cq3+fGsbVji9O6wl9me0
         R2DzbRZ8yQQnSsXS3f6r50XSfr8ywHDUzVf30jUZcYeIzrWqMJRxajjM9Ks/Q5u3JilV
         Vmk32WDIHHvgzbUsDkhUtB4c3zAieZ3a4Xnp7nZ5xK/WIKpSqOiFBCP9VC5JJnhXwO6m
         p4QR9Exttz4Mjgff097ozyzE+Y8IixWu3fEuvbd+nryRwJRr3ggYXghpu5Sh6d/2SeWw
         UiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605649; x=1782210449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qldGy+HqkY53uavymykAUk/HfKiP5fsNYXFtm5E9aFk=;
        b=WOzN4ACN3SRuHtIWVy9gyEcJbbkdIqc//xaQ0CkROiAGKkRzL/1f2HVAE4x/L/ICpF
         Y+1rDb4gLyEdam8GChFNKEoEKgIDauNVTS/A6JcD9vSKkwt9iF/7oXWSz2C8iwKmIhRs
         3pFxNJB2BBWARjeFqcEdqUvy96ixfetG7fKQlaSYsc6vzhYXQAW0/e5PoN+nZ23BuNI0
         NCLh19nsGKsxDv+YVkKspZ7SOV/O9aZsZ/Voks1fcd+jkYsE48ozYWmQp0qYIQ6QDYGr
         LLFv2W0ggEtnjNUddj2ksFcfqLbB2GnIXHAaTFSyhRuFsBkdL7uu6A3mTh6t6dVPIam9
         5hYw==
X-Gm-Message-State: AOJu0YwSk+Fr94GZYQw8h1VrYb8nP49ufx/IoASW5hpbiZfzA34cf0//
	dYKfknMd79VhXalm2NXneFsba119jl83gYLbVPhu5ygI46HiZ7e315hHEEOGViDLI+EvZPc5WEx
	yAyBB3KUtzH528FaS6j0SIUVpGlQ1r26LIqXLvBVYy6PaZjjuIdS97sLbtuBamOJNhxFx
X-Gm-Gg: Acq92OGvmIc1fwDRlhSe6ryZ8BqjNF1dKqYW3SaPJLy14qQ+RYSIFX26jLHK27h3Qwq
	Ju0w0A40BAGU4cja2P9VRfIjMCwA0Qb74k2C6j8baKPUD1gQ1Dp5kDMbzZcf3LMFI3/ifYWvPff
	SujSsA3gKDJsBURk9oQPj6hh3s+rFcKP/lG7PjvNmvYcBVP7iIfgoDBtbzn3zRviK93hfaciLwB
	Yjdn5hFWM1jSzkDZMDSk/FxUm8okV5PByct21MuQOyQK/3P7qAVqZUHt8Wqsgs3LwPeWhYI9EXY
	4KMqO9bxe50tVxHCQH6IOUlBrryW0gOvJ0J8TtBJwHT1rQytnKJFOqLhZuR7u0H2tqvUMhcV4aB
	bI+TuK3WH6lBip0SDhZjMcOEhJk8t3C0Nr/fHpG4WN5Ojr7ebbw==
X-Received: by 2002:a17:903:2f04:b0:2c6:95d1:3bbc with SMTP id d9443c01a7336-2c695d14508mr48138685ad.24.1781605649188;
        Tue, 16 Jun 2026 03:27:29 -0700 (PDT)
X-Received: by 2002:a17:903:2f04:b0:2c6:95d1:3bbc with SMTP id d9443c01a7336-2c695d14508mr48138405ad.24.1781605648747;
        Tue, 16 Jun 2026 03:27:28 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac79fsm118343685ad.45.2026.06.16.03.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:27:28 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:57:14 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: purwa: Drop the Hamoa workaround
 for PDC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-purwa-pdc-v2-2-8dda7ef25ce5@oss.qualcomm.com>
References: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
In-Reply-To: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781605637; l=1132;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=lZzGwcp1RbmXBuhxY6qnZq2nvbiemlZxoipH7l6wYJ4=;
 b=dPWpYEeHwQiDxSgLW+vou2TEli23CGbueIqAd/PbVx+MHfUG+xsU0LWQXTS4YpZZ859SLqcQi
 WAmuUpSZLZmCnwNcVtbhiV5xBcYoztuiAzeOvmPCW7DQmx4BGZE4zvy
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: SaXI7_AMtMil77pExGGoPeuQ-q3Cr9CP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX11FXDc6ydgPR
 EHuGLx8qK2ltpy/3B7dLdVI+Sz/yByg1mD/BdSkB0w9Iy5lHe6yFeeTh/Gb9rrXxJcu/NEXmeLH
 Yq/QyX4NwVv/CENQnTri34mkpNIeNFs=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a312511 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vCmKDeXsP24Y5dEMWNIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX1LaN/PzQJkHa
 4cCwv+AAHVlbdIHtBK90C/3zCIrJ7VXCKlm7xNtQagdm4Bgr0ZyAcddYCYZAszD0nlVmZQb7I1R
 Ua4EzcbZj7F6T8n3J8Vew3vP0JE8Pdi4aVUVw9ET5mdeSg9TVhIltSlrB4SifCmYBZmy0xiK+pI
 w7ZWfs5oWQj0UYy5nqFEVLoi7CE0+OnHdJmpxd3PlkkVaLMTJVWcwWDbn8ycWJ9nhT2L80nf9tp
 sqi9G7NGUEi4N8GmStjZgvjuBj+aOkguQcjz5C72/P587rHzGKvA4BQyWIFj5BDmPEPC+Un4ogs
 S5FfOwcJsY50cA+ZmCQE8iiVFC4tiPmxJYUyen6I6R4ezg8ytFHWDQLYDheQSVRL3Bz0gbUXk/s
 pXTiBUfPIMqnbqYwBYaBNY6xgijKIoYteSOGmP8uX5a53Hm6C1SxTLAJ69s+ovWym7bw0j3ehFx
 Ex6ifitpoIYzpw04Fmw==
X-Proofpoint-ORIG-GUID: SaXI7_AMtMil77pExGGoPeuQ-q3Cr9CP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113373-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 793A768E51E

X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
Workaround hardware register bug on X1E80100") is already fixed in
X1P42100 silicon.

X1E80100 compatible forces the software workaround. Use the X1P42100
specific compatible string for the PDC node to remove the workaround.

Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 9ab4f26b35f2..0db8c561e7ba 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -166,6 +166,11 @@ &pcie6a_phy {
 	compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
 };
 
+/* X1P42100 PDC is same as X1E80100, but without hardware register bug */
+&pdc {
+	compatible = "qcom,x1p42100-pdc", "qcom,pdc";
+};
+
 &qfprom {
 	gpu_speed_bin: gpu-speed-bin@119 {
 		reg = <0x119 0x2>;

-- 
2.43.0


