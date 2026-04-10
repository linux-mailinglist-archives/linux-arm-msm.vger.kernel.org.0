Return-Path: <linux-arm-msm+bounces-102748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMH6LJRH2WmGoAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:55:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5EE3DBB0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D591930A85E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC3C3E63A7;
	Fri, 10 Apr 2026 18:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkCp3LzY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJB7jdOi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA1B3EB80E
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846660; cv=none; b=oG9faWq7o231U568sB4spSPOcw87PDJPscFsAyt/ZvEeqhyGufyCpaEb/5qu4HF5LNeVnHSS+SWRzYbz9oc+Gq3urJ8lZiV1TqwvhG4nUmYkNKSwtVx/1cLMifIuSvsu+svYzy9ypVhMKVbR6NJRq9bxWXc1hIVFHXQBRJZ7VyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846660; c=relaxed/simple;
	bh=qFbU7Ea+fTobclE7SUAMxeb5FPSO+m8vGpecbrflMi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSVceT13DjE4wt1wpAPM2oO9VnO/rOUGqEu8Z+oCPmdeT/rU38XYaAdJyUU8404JlyyHsAudhZLn4S7UaFgxxwRcEMFzbguB3oW+JvrBO4sIUyb9z+cJ6DOEWQYVvB8NkFk/BcbRnMOL9AAhG62wOfaJv1abefjHEUgzhl4vW3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SkCp3LzY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJB7jdOi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AIMlek4147281
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WM7aKDnSWoS
	kecYzbNFu+bvRThloLi3Ibm1M/DGnquw=; b=SkCp3LzYH08a2QAjHF8/ExtxX+P
	+5h+OR5su98VHbYM80ISEaGjTFZx+ghkei/nxu3LPbhbuczoF69fbfni7EAnPGeb
	9IDHaSvMBlB4fBUDzZvxAO+uMVotfSFGi1D+JJXAi511grilY88efzTPTe93gHtX
	0lQOWOgMh73VUnRjlZD3aT+/KXHgicr0Gh6ATMC+U+kYN2OpzmX2mGpxSwzw84Zp
	dz0u/UsBoZaw0HxeJ+Egluqcgh3EfYPOh+YnSWWGJIsOra1bM/zp5XtMfKEiYa3l
	dDoeXI8Q6XgnlpkGPkriG9PaUzsqxb5HyOSr6uwRk5nB3F3uTZRZnqWLy+g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudgjhqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso1821028b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846658; x=1776451458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WM7aKDnSWoSkecYzbNFu+bvRThloLi3Ibm1M/DGnquw=;
        b=NJB7jdOigHNYNTcxU9TIEv93GbVslwO50D2xru6eX0E9Sm716OQM1qFV89I/qumnTK
         a2npUYJ+x3Ww6pSo6W5YVETNJjXPP8tml/z1N9M1y99JtU2QwTvTNQzZVCYVE5aagwWC
         Z7HtxYn1spzNv2CSmaUEOj3PIzvOMSH9Xzbkl2LFBUemtnqtwDKoPHMLHMUho4pHr7zJ
         4fLaUVjDkRcUjOlRaQREDt5VLiiivS5yia8FmvOmzH7kdNl5cLM1DGmNso0z8vlPaas5
         MVA/ziebYlAkP9Jn+QGPQ3z0/iL6Id70GGCxxT1umclZR57PipMhWxYy0DzcjRhy33sj
         Kchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846658; x=1776451458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WM7aKDnSWoSkecYzbNFu+bvRThloLi3Ibm1M/DGnquw=;
        b=TL1O3lkc3QBgKdk9UGXfh8Ou7rfi538Ruby3muuHdokhS+LmSOxrPvgRrK8gck6gcb
         mVXD06ZxDJoz4gW0m2IdTL90Ip5gV4PPJGz7fxiKedlUi/TO2MqckY8py385kmQRrNgb
         ywSYJ5uiwqDOUJgTlPG+AtBoqQUqi/eqIExVtmEa95rL+OoEx0tFjDG7ZSdnUb3sb1FS
         yXUWGhGusFKidQuEjtg9RRzZD65f6dx23tkkKEzdC06kgA2YqZq/9/gfRPzDMa4ItOaT
         dfEjQ71sskcsFjTZKFbOqFOip8utbRDnuadDsHD4QUB3+DuB1+3BfsC82ojt+az1mwED
         O+sw==
X-Forwarded-Encrypted: i=1; AJvYcCWk/b1EDwY+TehH2gW6MaRwgohCFRC8bn2ebVn81uBXfrIlpsdQBeyt44ud2EcuhYtEA282wVybXHzMVN64@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2e7AW1U9Gy0nWqQDmrBoSIhMO573rNWIoQIZBwHDHXnKJ3dsT
	PwjtW4utEz2OLOKx8TL9TephcAMPfY440d0FFWuBkd3/f9nNBS25wx1Xkc15eXPnoC9KwoF2XmX
	mA7v8qeWIhVOZq7z7BHMUu+hhPiAda60ybvgJDEFrpJuHTP1vJ1haDEtKMV+0dzzNcFZW
X-Gm-Gg: AeBDiesxxp+JPkQBmlzsfA7Rdeh+cj80QEKj4IrKKLDQzO6abpDY41qkNowhVORibk3
	C2poB9qKTSQLScAQBYf4AY4rwr0zmPkO+sIqPSpZwLavoLU2rJhxh98/TemA4d7mpGFO7LPi2Uf
	K8G/J1HRYyuKNaJbohdPKI1nFSRGEpz2RjPQNjpyq+6MoFbgUYza4sW5GRmMhC4zMd0PGfPdY8+
	bA0/JW9InvFX0vLLPiESPgQdSSHUzNLS6to53k+EhqkUY/VgCDMZhZ0astbbpEJeG8nB8JfhKGL
	sJ+llVrxLORxQ0QA4BJeCDwQbQDJR1uPf0VpiPXb1nlXgAD5pjSXXP1MbaK2j0Dr+oLUsfXBD0f
	/PIB2oYNiU3g5bCJmlhjRrBepXtFmYncPYl59sRmANX20oxBv
X-Received: by 2002:a05:6a00:244d:b0:82c:dc9c:e770 with SMTP id d2e1a72fcca58-82f0c3a6878mr4502698b3a.40.1775846657694;
        Fri, 10 Apr 2026 11:44:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:244d:b0:82c:dc9c:e770 with SMTP id d2e1a72fcca58-82f0c3a6878mr4502662b3a.40.1775846657046;
        Fri, 10 Apr 2026 11:44:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:44:16 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 34/35] arm64: dts: qcom: sdx75: Drop unused second PDC reg entry
Date: Sat, 11 Apr 2026 00:11:11 +0530
Message-ID: <20260410184124.1068210-35-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _jsYAxsc7dWmhoxhYW8KndrRe-YKGuZY
X-Proofpoint-GUID: _jsYAxsc7dWmhoxhYW8KndrRe-YKGuZY
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d94502 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=3DyYtJV8JKnA5jZGLM4A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NSBTYWx0ZWRfXywuyOKuQRTw1
 YtVe+GEanYns+y1slNbTyu5hCAGpbRtAda1tVbty4W2I1Gvx0gXqu7LdlNb2H+bGZNgqBR2Skk7
 nl0pfuGlWJczbbI/j65WH4KNddLXTwmphbEcaVNOY/bQ2bdjfkmtx/h+hefHrlxYIarOqV97u+x
 6HThYgRBjnLUtutc+3c2m+pOiUQDew/4JM7Kj5xdED/0El22ApqsrZ4m8yj8Epz2bHmzgNdxxE3
 YiiZl5TCHlNA74G7XxEjG3VPPyZDhISj9NGN4v5Oknf7wLoYf/Me9oVkuaU9yj+SflQhAy1V5WE
 6hGEnANf7sMnwCr1TpGXqZtEVgvRObHoiTVllCAgyEToCDk8/KjJKonSQx5LTV/ANikWMqz1Xw/
 xUF4qWDXEf9LDLyE1Tva6qgOcXqpjVdzet7nEQWZrQezhcXliVVHA0Pt9ZsfCVTxFFqlM2zJ6m5
 OE10EbI+V8eY7xY6/Bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100175
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102748-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,b220000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C5EE3DBB0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC driver only maps the first register region (APSS DRV) via
of_address_to_resource(node, 0, ...). The second reg entry was never
accessed by the driver and can be removed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 82a8107f2f1c..e740e123c1e4 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1100,8 +1100,7 @@ usb_1_dwc3_ss: endpoint {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sdx75-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x10000>,
-			      <0x0 0x174000f0 0x0 0x64>;
+			reg = <0x0 0xb220000 0x0 0x10000>;
 			qcom,pdc-ranges = <0 147 52>,
 					  <52 266 32>,
 					  <84 500 59>;
-- 
2.53.0


