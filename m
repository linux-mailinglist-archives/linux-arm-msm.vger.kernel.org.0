Return-Path: <linux-arm-msm+bounces-115948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HgKaB3BGRmpUNgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:07:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A81236F66DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:07:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=c4Cveg5L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aGiMGdmv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115948-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115948-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18A393015709
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EF73C5DB6;
	Thu,  2 Jul 2026 10:55:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ADD357CE1
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:55:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989741; cv=none; b=E+xSt2CmO9HbBsR5j6oUW3bdwoDtkOK5W79Jhqavndre7+9SmNTVA4cWZPO/BkNaFFTzfUXRR6Jgn3IAO9RMu6YZA1NLrFZr4nrEkBIrkLseghNZmJ4pqMGo3o3DIibSHl6Vi1CO98T8TtcMfIqlwXyzeSfgsKxBNi/yCo4u0KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989741; c=relaxed/simple;
	bh=qkawMr8/MmU3oMMEzEEVlcijAhnSqcI0l2JKK2tRDtU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dtyo5pcx3Pkg8siTgfVlxrufcRSCAm3a9kqllD6h1tiBzuDTj1gEWAaoPmMIuqfljEBFxNP87MqO2apqnM7grJNykF+ir0msZl7pMDbls1sKs7bChly7eXp8NiWDsp8/ffrOT50o75myGhMIWGSroWYDNHAgiX8nxjzk/6kRBO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4Cveg5L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGiMGdmv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6627TsD03964225
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Sn9xvt1KhD7
	Ajj+DR0s0lrMn/sMU9I+kltfIT2sKm+U=; b=c4Cveg5LEUeateSmfvvEzMf2IXu
	WOkEyDMuHFTLchbJ+oUUrYFXk+wSm8WEZtwaEEExQtkvTlgwiaM46Nt18aBO9ako
	c8Mci34LPINCcY8/W9awYRx531lNzrCSiyWwK2x23vnx3VnbvTtdjXfKJEpX5SiZ
	L4ByIiqsb6hiYAAbjuItL6MoL4zXZZl4vJoHFFoN9Gihd7UoEAFz4d79WnD9qMPV
	2SjFOhXa9pFQNqpXe/IWd9pWtyvPSgUNkitVulMKpRylVgwdc4VnCeRDxKlssxYr
	5FDzF8qZ5hQIpgiOoVl1iJHYJ6cB1lV1TdHNGyrkMv5jI6pDAePj0qXDIMg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc0sg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:55:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88d7a75507so2340375a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989739; x=1783594539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sn9xvt1KhD7Ajj+DR0s0lrMn/sMU9I+kltfIT2sKm+U=;
        b=aGiMGdmvfqwEs3jXdxrFhYzjOiBh+az0eFxmdRKWjziQ55yA1qlaE6eSnpQ0yrRpXP
         akdouSTYA7sIYgbi1ZxFsLeDWwgyUexarSUDc8IL0wPslXpavwu7/iCF7TzWoHpJo08n
         e367BlC0tEzNPWq0REXiQc1m1xOg0sNZre7Mts1CLY+AtAoRGcYeFUU7b9G+IIVelB/g
         C0NUwCeSHGQY1M13fPQL7Mgu0dF6kwxUrXWLMfEf1gx0naOFTrwxwCJp4Iz4cooowXWq
         +Um1ntIxywVGXDeEy1AU59qaSWff62x6l9xukehZsz+sJErh6oFgO7pLqzMPWmjAzZFy
         ro+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989739; x=1783594539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sn9xvt1KhD7Ajj+DR0s0lrMn/sMU9I+kltfIT2sKm+U=;
        b=sYf3IsXvICyw+XOjARI6sHeRm45Hwvm3Nd/02EcQqH4ZJhoau5AvtqatGZ4WBztzuG
         zugiQVj9Mc6LmD+vGkM2cXjlDFcF9ODA3q3DE+/jtjTIPuFblemdJ9Fpnit6IIxku9nU
         L77+l1FH5ZS2Mg5GPaIngqQN+gDZMUp8n4eNin6VGnTsOLAcs21viBobPn36cQ+bAIox
         0Yp3aYzez+u/FNUbxo9sQlx0ldLqZO6nlAVGeH1N6xqsMKzh1kQHELJiGu3RJcPJGA1b
         YkQ41scpEogcuCnCtXjldWGB5D1HUO8flh2Rw26dMHlDnZstJgJwip1Er1+LVxBBpoSC
         gnPA==
X-Forwarded-Encrypted: i=1; AFNElJ8eMYBtyNxk5i7QMzSSSxR703B9JtJRRf9gPeVe1BLV+ThMJyjNLKtGV10DFmfpYRWt81+yaXezaryO8QMX@vger.kernel.org
X-Gm-Message-State: AOJu0YxAFdIEtfqoR8/ASKM2HsjE07/RjpLtqOhUeh4IL2pH849yCay0
	klGhUAftBvhtPlOeow+7dRRh8Zxn61bF9LAGJvpIKWM/Ww1JZeVhciNngR03z5bVNiizFGE0Fii
	mwiMATPdKh6XGQ2eWJcdi8z9X6ghdFVPj5HeCjg6X7nfTArLH52gadMBRTMWXfKwK98c9
X-Gm-Gg: AfdE7clK0Rf2pZN+2Z9Gs1Q1GAnWa5NEsQ+GDPpqU3uaU+7jzbtv0MGF9zeoyk35mXf
	bjcbZ9nkjpHAZRj5+Gaw8KYjma5qqxzpkOg2rGZ11WWSC2q/7qoBgr5aIGTYxjgQ2k7ERrdiJGj
	i4USDdjsP+5t8QFOcbeKic3kDL/iBiAEdXYwd2MFr/lzjAgADEUMo5b1b+XngQqhBIfvTxASxAD
	LyzgyOex/Ho70apaOz0zkPeoGWwhArbE7c298gTfc5DagC44IF93fhv5GPgJGZIi2EPreAvqLek
	ADV35TZnDI3Lt2L4ksmB31amjtNRC9sZEDSfGMbHzlIdWwzOtrE1s2Cita/6fPHvMe5NgFj99tT
	6UoB/CMz097HwReXrpdrzFHqc4ymMu0cFSxCdOuafJJWq
X-Received: by 2002:a05:6a20:a107:b0:3bf:6c08:fb9e with SMTP id adf61e73a8af0-3bfed5a7961mr5952176637.50.1782989738619;
        Thu, 02 Jul 2026 03:55:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:a107:b0:3bf:6c08:fb9e with SMTP id adf61e73a8af0-3bfed5a7961mr5952152637.50.1782989738199;
        Thu, 02 Jul 2026 03:55:38 -0700 (PDT)
Received: from hu-sarata-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc38e5fsm7903148eec.29.2026.07.02.03.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:55:37 -0700 (PDT)
From: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Date: Thu,  2 Jul 2026 16:25:09 +0530
Message-Id: <20260702105509.1360340-1-sarat.addepalli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2qlpabzpyvjwd2siwkpcdcjq7geyzj5egu732dg775asn2wtbq@tcbj6r5ti2o5>
References: <2qlpabzpyvjwd2siwkpcdcjq7geyzj5egu732dg775asn2wtbq@tcbj6r5ti2o5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rq0aiouriUo8zGguTwQSN5PlYsTXBWTZ
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a4643ab cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4Ty5MVTmxNGtU14xyboA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfX4Mlh5cuM4mlH
 8k6YtcAT7EpzHBZEOL5wEedq6WEX+oE/j3T0WL7dMoztSpJJC08VRxPquANik7ob3WBtPSW40eE
 GjCFQbwL6OaNC4d8xUXZccHk6f/H1d2JpPCPwFEej+2n9LyXHlwFUWHH8IROq0xYeFRy4Fuz7rU
 FYZkCzrm+OQOzQmT2rl1KGZNUwe35frM6zAbuOM0+BMMFwGy+d5Qz4samXLYFCZOfiaXA73xLSh
 RlECVzATa/+0VndfeZlkTPop8+oIuhGmcb/Jslo1E4+vOWDTdWAh98w3zclkpuoIjI9YLwodJtj
 Wylsj9/ngFkWyOj0KjIVD6HyS88/RzWdjJoJhiHTCG7wYrozK+iVGDoQVzHSsNklBGCCDLhjG6r
 NJRuQQJ/FfB0gnlcQJJ0rN7IPx2lCk/iDZ0NICKZ3F94RpaWYFg2zgUEYh7CjeyoVUoNyQ9Q86Y
 csuTQp9bNCmg5XuL9cQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfX6p35MAgL+Wvc
 YZZPfgOrIYCU5/B2ZItN7eka1jK2O6Apv739NhZcoRKTjeDlWMOSYK2l9ulI1ANu/kh74N1HMMe
 IZuPzH8kXq960+piGRnRnVkG79UcnFA=
X-Proofpoint-GUID: rq0aiouriUo8zGguTwQSN5PlYsTXBWTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115948-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarat.addepalli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sarat.addepalli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sarat.addepalli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A81236F66DD

Add IPA nodes for Qualcomm qcm6490 board.

The qcom,gsi-loader and memory-region properties are provided by
kodiak.dtsi as part of the IPA property consolidation work, so only
the board-specific firmware-name and status properties need to be set.

Link: https://lore.kernel.org/all/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/

Signed-off-by: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..d4f96bdd3a90 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -619,6 +619,11 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm6490/a660_zap.mbn";
 };
 
+&ipa {
+	firmware-name = "qcom/qcm6490/ipa_fws.mbn";
+	status = "okay";
+};
+
 &lpass_rx_macro {
 	status = "okay";
 };

