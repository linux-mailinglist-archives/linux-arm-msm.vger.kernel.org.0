Return-Path: <linux-arm-msm+bounces-116291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QjEaFmSaR2r6bwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:17:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDE3701BA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:17:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EPhF7ygf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gd3f23Dp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116291-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116291-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5DDF304BD9C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 11:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB5A3B5305;
	Fri,  3 Jul 2026 11:13:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D78388885
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 11:13:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077235; cv=none; b=EVWYvkKQbH50CO7cAn4sJnjogdnwdQaz/xqhFk6nrqjZhrKxl+txJQeKNDfrJbAZ7hYwhhWZEftjRExX6pbymkGiY33PH34OYloSRPYSqWN/xfyIDvFJPY0CP7htx3RHhN3aNPJIaIO+m1bVR7CTvz0r1G3S9vyCR0a9IrrCT/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077235; c=relaxed/simple;
	bh=wRupe0MlkZhOO85ibdOrqq9qaUIxoP8EJ+7uaavq9T0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eAPQQ+m2jCRs7jZ33H3MWu3p5CTahxszHH7AnJkovZmntmaMVce0fp8qPYz4RBVviGONg0Q/R/4uyH4gqzD7jGxcqZ2gC04moJe1681Gl5xlRbpsM5g8TcBwroBtVEU8I3dZtWp7hgdCCp1gUAW4tjBMKcwxbjmwa9XeGY8cIVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPhF7ygf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gd3f23Dp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66368Bj53053832
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 11:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5b3dZtJaNmgI8YPM0l57kc
	xxs4hl4jphTHle7WAXjSc=; b=EPhF7ygf7DppTM9gvuDArY/R1+Pv1vY37RNefT
	V3XCLnmogNFtR8UTkg017RBYMKE832A2RvPVUY/ka6ffougcvdGlVK+fXgWlvLXJ
	gVFWCPTCEa8irNDEeehfWQGzzNOCqV8hYYOwBQp3qedhBcPavgqdBJ22OJoUEFiY
	ZIMaFaI3KCPSR4ClDoWAg5IQ+zoXViomQwNtqRgYKHvG0V4dExzffGtkaXdT9UYl
	ezKp4fiUEMPnN9/6zGybLezuII9dDqgf1YoHDgH9KehoIAFsc+oNs3MZjEN5H2eN
	a3bhU6OsEKt67QhW8KL+oKZZ9xrZX+Y32199Q78OwlH6V5fA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j013wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 11:13:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8479b7c3adbso720849b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 04:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077232; x=1783682032; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5b3dZtJaNmgI8YPM0l57kcxxs4hl4jphTHle7WAXjSc=;
        b=gd3f23DpHXv0vmfBLdWFbB4Iz425C/6zlYRRbziaRI7DWg8JhAXmkXm9n+qV0D9q0t
         TcW+V6UKFLDIrLoUdKbiMlso8mFZ4marP9EXFwDUmwGBmne/TFnk50wUdzV1H1Px+fE7
         ExOtcM9azzEj9rPrO8CEw5Cgy1fixFvSaOkRM48Dk0gqVALVcgC+njZVZ1SqV6PWZxhS
         iNqzw1aufLnk2scdSKE+jpkaqgTFg5Wd8OX0QFx6Axp5GqOkyE0DoMo+mTRPZUhfI5nq
         z3B9HYkVMjXC+tOFj+v0uDI+lV0ZGwvYJWEb5bmEMxjKZfH4kbgrAQKZ765aW/WC8yvp
         GPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077232; x=1783682032;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5b3dZtJaNmgI8YPM0l57kcxxs4hl4jphTHle7WAXjSc=;
        b=OHb12K5+FRLpOtxdicX2MxZzjeUd9CPkRYJ4kM1CqCeX3OIXPvcZe9YpFd0K4Al0id
         wiKsv4I+WHWOYeUL8jgVWt5y1tUN/4IjJxZlVhmeE1l+tWWjuOaaLv6RiQmJ+TkE/2op
         D+acuR5A6SRv0tpGO2esbmpULAZTNSqJaBqOyBVlbkDkQQ2zsBK6ngRbTslO4dG0Be0p
         Qf1zmjyufI4OaQDSGr6pKiBm3h3LZ5AYkU39Mfmp/Vde/go/fgJH/ItaK3JPJF3g3UBE
         saOx5yWeVXjlh5hdNkxn9LkwUiWW6XVVXNgXlPjw1cqXsJzaDhAuA0++NJJWzDhK5OTc
         jjEw==
X-Gm-Message-State: AOJu0Yz539f+MaewtyCC/kMu9g3dQOkp2DKVhizBwQ4sUOvTUCAVzW4O
	1TWu1EOiDOU1nhhtuvRUKPywhpyf5vT0oCxcAV4HD8gBsn1/Y7I0ZnSLjODQqL13l39BocwCT+4
	Q3JLEWO4o73z/w9ojoI9W201nyYxvdIzTuielaQ3c92kXzJw64e11KfFR0mNPstV6gII7
X-Gm-Gg: AfdE7cn24WwkBITkhOoEEHYbdmiSFGxlIwrvMnfQJ8tXdgHec2P3Ox4VkyK2y3HzN4R
	qufEUfY9dcUtyy4Zqf1Uux+3gD67XKTwVlehMWzVUMgEbLV+w6bVPDyzaoCU8A2r/63T39zalz3
	b739pvwIB7bhnerykf16U0WbGI++nZQWk/34Zp9LhIUBE0HwFNo+hFUQlRJezn+pmffy+bc62Af
	iYodyVFhPUAvkb81ihcw829iM/9ybeRljIjYqqWZ0pPW7EN6JGmv2GeNRxu08jklXvV/vjCQPMx
	7iB0nkubleTuADpOeu4fzKYFaiNQx70dlRo0iy7iBSn1pgUAxDuOs9h7bl8oXWedC0mZewY5PVy
	x+o1pIOK9yZRyM+CrAN61vi6483ctjoBU7vdrgYbt
X-Received: by 2002:a05:6a00:21d2:b0:845:d274:bf88 with SMTP id d2e1a72fcca58-847c08d9f82mr9555461b3a.49.1783077232301;
        Fri, 03 Jul 2026 04:13:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d2:b0:845:d274:bf88 with SMTP id d2e1a72fcca58-847c08d9f82mr9555425b3a.49.1783077231825;
        Fri, 03 Jul 2026 04:13:51 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2729490b3a.33.2026.07.03.04.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:13:51 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH 0/3] Add subsystem sleep stats support for Shikra
Date: Fri, 03 Jul 2026 16:43:40 +0530
Message-Id: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGSZR2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyMT3eKMzOyixPjiksSSYl3jNAPDNENjs7Qkk2QloJaCotS0zAqwcdG
 xtbUAJDanPV4AAAA=
X-Change-ID: 20260624-shikra_stats-3f01f136fb4c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783077228; l=2593;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=wRupe0MlkZhOO85ibdOrqq9qaUIxoP8EJ+7uaavq9T0=;
 b=UbhsjIma7OzoziUiDCicRLirdHpWhpjGgmZR/dd7Yys5QDkfNDXjiIYzqJjEBFeDpP1gi3h+p
 44NNXp+L/ZdBFcSCHOdpwAIYXJJtOKxJfmRKm4d044VBMx18U/Xqmdu
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: t5PI7kns6-ujEUwtShM90oefCNE8wfZW
X-Proofpoint-ORIG-GUID: t5PI7kns6-ujEUwtShM90oefCNE8wfZW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfXwI5CPLFWDlsM
 Rryw1dVg2JN9QemfthVqRZVvoB6i8OQDws9zUova6cQD5Sh1kY0EX8xMeWGnSzkD1SLTHISIWjM
 iAOJJFxqZAuIpx/3lQSbiCGdlPIipEA=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a479971 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LOzubwnR8LFJbqqV4sUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfXw4wGCTx/uq+L
 9UnDTEjqzGJzEKJs5jDG5RucC5Ri6CL8VjADW+ofh94eHrXsp/+zl4B+gq82QYR/eb2db9U+OUt
 Ts5pA01ZEBIzT8GIS0+0OgKjuDJ1myfGS5FZSUxEnbtdJyZ+n8jBJrlE0du7CPrjSoRUQvma2Py
 06XVDn++voYZFxVOXeN3AUgrkcQVbMTWe8VGsmOqZldjMTqvuUzo5IRO+HVVa+yeYWwbLVQO9YZ
 1AGmZ4F3U2Ji5wRI7g7N1HrFmoDqX/eqXxskJpgfDBy23TwXO4dKQhkJa0dETlYtK1uPeZk05pa
 Kn+GoLtn8H6rdZhlkRpcFIePLFXkFX//u8lyGkIgfgLzyFh5HHO4u2M+x6RWTGjBKu+UHUpTQi5
 h9SNjK4v7NYcL2TXaokopCPQcqD6gXENTwEB1Y1yUlrq6azJLOD29drpNTzai7ShSMYXqDhT5H7
 Li4dK+zEBvx1hWUmTQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030109
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116291-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FDE3701BA9

SoC sleep stats are present in RPM message RAM and subsystem sleep
stats are present in SMEM for Shikra.

For earlier targets using RPM processor like msm8974, rpm_master_stat.c
was used for subsystem sleep stats since those stats were populated in
RPM MSGRAM.

Here is a brief summary of previous targets and their stats
configuration, along with the drivers used to display them.

+---------------|----------------------------|---------------------------+
| SoC           | subsystem sleep stats      | SoC sleep stats           |
|---------------|----------------------------|---------------------------|
| msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
| msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
| sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
|               | (qcom_stats.c)             | (qcom_stats.c)            |
+---------------|----------------------------|---------------------------+

qcom_stats.c supports both the configurations for shikra, reading
subsystem sleep stats from SMEM and reading SoC sleep stats from RPM
MSGRAM.

A generic "qcom,rpm-stats" compatible only reads SoC sleep stats like vmin
and vlow. Add shikra rpm compatible and config to read subsystem sleep
stats too along with SoC sleep stats.

Below is an example showing sleep stats for "apss" subsystem with this
change:

cat /sys/kernel/debug/qcom_stats/apss
Count: 2192
Last Entered At: 5498618336
Last Exited At: 5498708046
Accumulated Duration: 2046572620.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Sneh Mankad (3):
      dt-bindings: soc: qcom: stats: Add compatible for Shikra
      soc: qcom: stats: Add stats compatible and config for Shikra
      arm64: dts: qcom: shikra: Add LPM stats support for subsystems

 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi                       | 2 +-
 drivers/soc/qcom/qcom_stats.c                              | 9 +++++++++
 3 files changed, 11 insertions(+), 1 deletion(-)
---
base-commit: 4c9d9db1697a873f78d236b4ce304272206238ac
change-id: 20260624-shikra_stats-3f01f136fb4c

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


