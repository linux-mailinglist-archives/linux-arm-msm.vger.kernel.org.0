Return-Path: <linux-arm-msm+bounces-109407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCElKMi0EGoUcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:55:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF115B9BB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97A4F3021652
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1757C37E2F9;
	Fri, 22 May 2026 19:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6wojpgM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbOS7AI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F8A37DAA3
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479674; cv=none; b=Xh5CAiV7QU3ZK+nYV5rlipvnM0n9Kag53x3vAixeqFe4nnFwOh+279dJK/AiHOundBK8OjgC7PkihCph7l0+2R0UdjBwXsMv1Nv8KjU+1seUxyd5C9GFbkptHYTQT12u5GnMS1JzwRiVMaQpOwWAQZ8jsuWqb7ntvAAwx4Nu6Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479674; c=relaxed/simple;
	bh=JXUWuqCkZu7GYMQoQ69purv+atgQKu2aoOG+jHJfnik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+FsZVtecznkLIhP8eV3XO/U9AEyJp8d6U1vCasnjmFWxu6aSewqNb8zmhaO/5V/V0upVGY9QhScLzGvbAX8Qh6fEsFawTnMRQxEXlCdilRyY7DOD2QXgOAlXZzSa/ogmjLXYcA/RwflKnzVzF/lGjUbZI9sgB7xZipK30r+tNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6wojpgM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbOS7AI2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG0bLr3476962
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZqsC6K45RuJ
	1t1Xk2IH29zk7EoLruxipWMR0nOOkL7c=; b=W6wojpgMHFvodO2bjTqfpy+xS9x
	wH5ynEAWt9H9YO2CiKkkCU1Hchj5q589fntpEpq4cQ+1Q07t9NiG1hxkm+q6WPPC
	tdhgHs6pkJZumjkxsIXTyvD3qJp0mfWa6b0/qXC+3bcFtS4FV0/mOloiEovj6zSa
	Iqu0mklgDG+y6ygUv2SjboRUfJqZtBW06KbhAVXilNbigt0EPP3g/IX5eF5emJlL
	GwPDwJkujw9HPgqbdMoN6zsLBMPfn+RUQUiztUQIGBbJdbb0rRj6uDtUZ9oBj6Tc
	eJLGeIiKuEuuYzhVRa5Q0zwsDYAHWUP5BP8zB8XRnx0hHsyOK2dIw23Y+kQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eat9r8t2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baf7748d0aso75910505ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479671; x=1780084471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqsC6K45RuJ1t1Xk2IH29zk7EoLruxipWMR0nOOkL7c=;
        b=WbOS7AI2+HtkqTZpQcDQ64BGtLl2i1tRnAUGK5axzUw1cig+2U8kKvoPE4VzcM3wHb
         M5a4bYC+eASgzUiOe5ixTo6x6F9i0hIYe5yMMJRc5gZdGgBV5H5AmGbF9NrsCB9QT3gu
         IT3+06vnjTHvljQeE2jD+iihS6GOKT++f5j+JlfS0WvR9P34PdR0nmu89GGMbcqPnPPN
         KNetzPai65dRroUZq9uh9FfdL3099p/5U48HLkDbvR0gp9kEpCTVdewWKkoVw8eNeiFi
         1C0SZLqJrdvCJVWmFxtlG6ncYiRhCjHm8fbiQWhe7m3JA11TWLJ3ZSAFTpf9GTJBcSwu
         o+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479671; x=1780084471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZqsC6K45RuJ1t1Xk2IH29zk7EoLruxipWMR0nOOkL7c=;
        b=LXhu6GxZgOz8KrTtFEzeYHw0C9zijy3zDZB+SNExmOpb0oSjn50jDJU+hPjArhIo3v
         OJI6/7T5Kb1iS0ggmoCL7EYP9Pba86kxKeoSyolLd1tf95df+PJ8XG18l+Ea3ByShyW2
         d66TCriVvD4IkL2WlMb9PC3Ig/7wPbLFx5sfkGBRfy1hsqERCA8p6i19w8MRuRRiAUVI
         NKA7X4DUew6fBGVwiHaLTck1qVCJd4zr4japmlrrRQYTw6dtzHgq9WnTNt6AXa30OASe
         MauaCt7VNS7BO8NmVJvPJzns4wDsKKghmEgDM6Y6iRcYkdV4IRRuv5eZnrylXqQvwWsO
         7y8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/NkCzkATHHhbEalCqbKdJOQtCuPe3xYYrIcFqXCjAdH87PPsteSnGi+JlFjdUmtWMJ6QuigvzyUZPOncMg@vger.kernel.org
X-Gm-Message-State: AOJu0YwlvnCCdo8elznF0o3gy1ishOEy9WknurN6FKSdMvI25zd1GkTL
	yAzcPOjL/bvMcAIxDRAbXTXGG6nhJBy+JYdjDeCzOlNV/Ps0qDSujVxSFGzyJKJ9/QRuo+19Q08
	mYzYplSHOA3IcYLMTRqTNnbC1yXO6TwdUXyELrgz8UmZC9zl2CL2nJHcFxRmQ8Ktq5q+c
X-Gm-Gg: Acq92OGEm4KGm6LwjSduUoq3Jfy6V+qxAN0ENmkUYt85iU6kCHx6GD+gRKV90jkJlY4
	b5VKyDAoQjP68l40EFhsq6lAsJUDx96bJg/+AfHCAwvlLoPNe33RbZbuCJb6VTEnPhfZORxgY/f
	AeKi5zzPeD4Rsk+2zGU/kh/IXJltSJMNuLRF+8iPFJa1zGkEWUVXPOUb1BrTcUFS+H2PMANIIVB
	+rBOHyL09Ns6/oUKRwsl0S3wGvxVDieUoJK0n/iqP630FgP49vRVtoQHJsd24xOSzfNUYikmCd+
	VPAjYzM7sGj0gfheEzk4CABbOPayLStn9bYGDw93VQD3AJzEBIhkeUrSc9m1Nk5dwrx1HYM4SoD
	xBOv4JRBWgcd4CSynF0Pi8YG1QaUfBGVD+A5S4baYdB3qDUm8
X-Received: by 2002:a17:903:19e8:b0:2bd:b6f4:4500 with SMTP id d9443c01a7336-2beb038c123mr54734835ad.11.1779479670765;
        Fri, 22 May 2026 12:54:30 -0700 (PDT)
X-Received: by 2002:a17:903:19e8:b0:2bd:b6f4:4500 with SMTP id d9443c01a7336-2beb038c123mr54734515ad.11.1779479670216;
        Fri, 22 May 2026 12:54:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 07/18] arm64: dts: qcom: sa8775p: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:19:58 +0530
Message-ID: <20260522195009.2961022-8-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=dt/rzVg4 c=1 sm=1 tr=0 ts=6a10b477 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Y2DO1TD2eDIuzSEqJuEA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: fKf00URsKg3Gwk50FZleDuZDJv5-xwT_
X-Proofpoint-GUID: fKf00URsKg3Gwk50FZleDuZDJv5-xwT_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfXw5kq+Ip+u4+J
 pHRme8iz0PBOsbJQ5FyJc10vR1uRFO8LDcXlKVhYOBUZbeFdbcfDp91NFyvEyoz6zyxkNsdgtcX
 ztDMqkMRZ09ywsB2xZx0roHPpdvgGmEIXwkX9gFktLEWGa44AETeDxGa7cxDv8Q3aNDkWwa8KFO
 L6vuTBfiHTbNabwtRqJ/sjmwp1kqcaaponus1w1oyQ6BrwgX8ZJV2BncxiXudQjQkCQx0VtyF4R
 jhdeo9q6xqmx/yOAmJBZk0iLkC5sRmvBEvQuVYH0akc70sOZNfnFeT8ctAcNqHkzzSkXGC+CmCP
 3+7Kckr3rV86/XOsxSBiED9sWEEBeHCAr5g0D1G2/cgwUDx1OC9LBlnSojLJmq/NIkb6vtJ/7EE
 wV9dMvI6xUNEbx0FSK1RAd05EEzBPSmk0srX7n1OgOeUf73wgANtB3F79J+6Mja8XC9lUTluUFo
 Epc0zqRgIWfZmp6D+vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109407-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,1c:email,qualcomm.com:email,qualcomm.com:dkim,94c:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.986];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1AF115B9BB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index bc7b4f65ad5e..634000fb22d4 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -524,6 +524,7 @@ firmware {
 		scm {
 			compatible = "qcom,scm-sa8775p", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -6817,6 +6818,10 @@ sram: sram@146d8000 {
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


