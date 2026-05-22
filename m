Return-Path: <linux-arm-msm+bounces-109406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KZMI7e0EGoUcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:55:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B45CD5B9B93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 061433019015
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B014F37FF70;
	Fri, 22 May 2026 19:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0sK9n7n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcLOwwXa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433E537DAD5
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479669; cv=none; b=Qt2vT5Iks9NUga8cWFJXVqTMztQd3oihA5P3cT5PZNUxQYXVA3P67EmJPpKuocD+uw/dEGOxe4m85EnV8z9HL56j1wXtUh1m08MC11XPBH10y33/u8occHD4Aerfj1rtc4JUNk34+0VrFli7cDJHJYeytzD7IXMg49ctjBlhxEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479669; c=relaxed/simple;
	bh=i9MBdFzrI+T2jk0ViJKl4zXMKLNv8x91iQqzdHJ4fDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9hz3Ss3V0h/P1IgHtkabQzLMjVpYgN2PLwR+dZ8nCga6IuuFsJSwgDiJWoaxxnamUyzI3cj5AW7JwAVC9otvwsxsHFWDzahDZfhnqHgqQjDOodEHG40Ac8h//Ls6Q/F/p/1GO3DOuuKj2MFWpvWZm+ssCReeS2aEnhRT3PZORM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0sK9n7n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcLOwwXa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MHJtTi1800725
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NcJPHaxHIA1
	QngimO518kdxRKpQYY7oqTYXRYDZuXK4=; b=a0sK9n7nxq6gR1BWr6Bo1FUhPPE
	oODNjM+FObahbT9jy5+tjBMPtixMxErEwfh+76MQ8XABcYNUTVwksN5jizl2OiF8
	LZYyfkK6HVgaFG3JZF9kIHbbvqDhzMI8DKXHidiwgZsh90nJ861iwI34aChqPGFh
	W84h3aypsD9x6ZAE1CuhrkdYBbIkn4GOgoavRl/t3WcVZ88gGir/KY4GSwpVtb0E
	8qVTpWYgojdKLAAwNw71xZrYNHVohZU30qmfD6RVcV1Mxhxz7Iex/LGW5KAEtkiR
	yh67lwRs9FgD2t42Q+dFpK8MjbQjkUK4Hz/XCRItqoYx0sUHyxjEWMJlTVA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean9g25j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36641bb3d97so4672171a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479667; x=1780084467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcJPHaxHIA1QngimO518kdxRKpQYY7oqTYXRYDZuXK4=;
        b=NcLOwwXaNTiW3zw0mJfwddqLi4XGDbmnu76yrTmh+J6anwiTw6O553DN4DAnIVovdn
         1EzQe5q/1Nvl1/vJB23i8/2/dcEDTMwI9FrCgrsN5OXIh4Ei4ytfnT2SK7znZiJALUx3
         VS3riy2OF34bDSi4nta+zCJ3LY4jA8a6xa3zPPEvkdBChYiHqR8r/5gaj7zKui/MDt96
         YaCMvilXLhOt43/8Faw1O3bAfbKCfF7sSrYxMStDhoYhtBs6hv4HHnm7Z2wzMAxMBgvN
         FRuGWdvIiCu4qKhQFfLB8j1v7CNsMsgw+Xfc5tnU/nMv6m9kzk200GqhPQtPp5SpTPkA
         TaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479667; x=1780084467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NcJPHaxHIA1QngimO518kdxRKpQYY7oqTYXRYDZuXK4=;
        b=AEbd1IjoL1JQ6Hlh3O226JetN4jbje0ey08lom+Cw6n4ADGE8uiYYgGxb+L1MnDGnE
         swaBUBFz2Axc1q7OjPG4VI0Cg1YY7mp/pTlQys4V+vTwUGhIWIUyK2KOnvorPSxqO9jy
         IQOEN3D6MeK4Fe/wnhB30CsmBJigGwyOL0L3JN/A9xPA6qaTIsgBMDUg9WoIJoIY0wcL
         tFzPxNhUo1InsOuM87pa/UMRY/lHygG1ERKJfz/pj4WfnC55TvrtVTzOk5kq+Bik3796
         CPnJzPuI2N2GTCG7bkb732O4LlcSARWd6TI+XzK4SsDkHNZc6WZLb+1g9o+Qx1hapwIV
         FMuA==
X-Forwarded-Encrypted: i=1; AFNElJ89E3lPu7bQy+px5mFLlLdcKEsqguxgddFzKlCTxp3fW+10O+XmYebpcylMG4x7ILS+no3kfy4pccD2m+lZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6nym1cuWvxIgrcwANcqc0jEqAzonBpqsdrhBkfqA1OOqQxCYN
	UYAPolsmPijFpRcbCu7AttqEqeH7zCmXtw6wGjfGWYjTFaP+yEPYTSjjCURfAXGLfnq2Uu5gv5Z
	xHJ2ROvisMGNXzVrhoMyHDkgQU4NUFSGMKgSJVegXXAWIboQoBFPK25jMMfzvdmP16p80
X-Gm-Gg: Acq92OFDuaLCCvpqadhY2t+cIunwmHzt8bMmCvnSqSTR1Aa5WxvzdfZ8lyxhCVqHv+q
	yizEWrU6S5MsPTaKYPJ1ymFO6tw6T4+6gIImg0Zucp2/r1vuP/0wkqZI1NuM9OUPZtDXSaz98J4
	qv4um51YKXJuX5Bh0XAjQuGFQ+fWfzh0+fZg9V+JnxVG9azoNO4iw1iPCOsMlBSi8/XDgf4eVcF
	uyPFgzrUjNg1WdHQ+4yqI7R29yrj43KgT/z0ihzCaBhqBShYW1IhOJfyuJG6K3qJf4ZbiAN0/wq
	5SyzILmjIDxP4xPRiyLfFGIThs60heGhNHor0ffScPKCAfW4QlNsCg52OeG/Z26QKc0MkeopQ6m
	KnDD+tyTriLFmbETecxFY7+zYOL63NBzNuro44tqTvCssFVlc
X-Received: by 2002:a17:902:f603:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2beb07b8947mr58130055ad.21.1779479666773;
        Fri, 22 May 2026 12:54:26 -0700 (PDT)
X-Received: by 2002:a17:902:f603:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2beb07b8947mr58129785ad.21.1779479666146;
        Fri, 22 May 2026 12:54:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 06/18] arm64: dts: qcom: sm8450: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:19:57 +0530
Message-ID: <20260522195009.2961022-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iShdbyYxs9LJWrSGeJiByBb0JS7zWcJ9
X-Authority-Analysis: v=2.4 cv=B/qJFutM c=1 sm=1 tr=0 ts=6a10b473 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ih2dppi7jw4BXePuyMoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: iShdbyYxs9LJWrSGeJiByBb0JS7zWcJ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfXzdRFo6/FcTib
 yPrD0FP0Z1QkXiZZZmKZKwD32FZYZi23xOg2IoCNZdEceAVzQXIIfzGhDE083yK7kODQ5ISHMcz
 S0a9ArbJ4d+g1j5PCUyROziG8erbyWD7J0RVrYfaurRZAozIy16ya/l0LumkPcAZnJtOrNkBEtp
 4J683XfQJcZSXgalhQqlLz6Kf3nN3nbhAo8IOt4Jnv9Np+p3Idywrmp3Ir4arGxl2GhSl6X81LL
 C+dNKV5zs2hhB2I3RdhL15HkJzXd1bEKdAU85mJCM3aPAdrdbj2LpC/4A1DlLaoHmqk+gwYe0/u
 NL3fUhhdBkifnkOBGtMiGtJ18PWVUJKqNpctmzryaF6roSv5TOx6KH/TxPKcL4QfVnY0BEiulJm
 shvujUGix345gAT4TU2BmyADBhuK6SKx+F8z/kbJGyNfE+GdA/fZ8oMMXCyurdC5lSU/QOyAEG4
 7dQNqbwKfr7a0R/lYlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109406-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[94c:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.986];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B45CD5B9B93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index e0c37ce3042a..d1fc5ef63a78 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -479,6 +479,7 @@ scm: scm {
 			compatible = "qcom,scm-sm8450", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -4978,6 +4979,10 @@ sram@146aa000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0


