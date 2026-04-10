Return-Path: <linux-arm-msm+bounces-102724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id G8bCIO1F2WlToAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:48:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 285343DB988
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94B4830AB96B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96643E51CD;
	Fri, 10 Apr 2026 18:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqbTP2CV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NwDImg+L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DEE3E4C92
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846566; cv=none; b=nRA6XxYTChZYw0BoS6N/3UcbHl6fbmCHjdL6R1bNCKgqgA04D0jhZcobdhG0yMHO2jGKiV93IIPZqnpV9ijg7+aITRRArQx4wiuEzDotut9LQsArKdOX6ILucg9YrtcG4rQWEetG9ykDfkWJ38CCHF1qubRsp6GnAGy4KSLabp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846566; c=relaxed/simple;
	bh=tJxPPq56oTttVHJaPtRM4c9Qzn1XTxWpx9pHXI17Wa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rowuGAla9Xc0kc6tqSxQA6/NH9RRdz381zEr5Cati5bdR4HkfjzwahNwgrq7gRgVoutOCpp5ejjgSLWhlcG0zbkVwajHUq7y8UixaNFcmNJhDA9u2jDhb1p9WZgL6i7XjQyNgjg8hatciZlPXYrREDd2Dv2/fZH3U7/r2ruY2AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqbTP2CV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NwDImg+L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AHHdTO2047336
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PpM4/bNxVdS
	N15mNrhrEkh3wOregdIC6n4jDSJV4w7s=; b=cqbTP2CVIctEFenQtFPis5Bptrl
	NRjJ4aKvmRX//2TYdiRxbZrWIzT08BLHfJfoMsJyzG4cWDmRMrfr5ZcPEHrzbNH5
	13adiZZtyMv3OlmMgRIugAqCw2FqRzo+Zq+l+6TSUt2xpZtZiK6AMjFwpBPj0ID7
	4bk2tLmkmHlbbCuvD0FqpW6s7NlEyiUajyMHgbO+dGsKxfml2T6ZoGA3INViRgkj
	KW1QftK2BnDmM4WR4cx7wkDbFwD2aYnvxpR+GOGmgQyWStB/XXPRZ7GVlMJx7/Ku
	lQwyS7VDOjuVWYjKYRX2AVfpTaCPsdkzJpSPvDmKwmeunTLHVhFuhXv8Vpg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey779jb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9467e85aso2628444a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846563; x=1776451363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpM4/bNxVdSN15mNrhrEkh3wOregdIC6n4jDSJV4w7s=;
        b=NwDImg+LNqakqM215UTGgoCMoI4fgDyXqPoO0U4B8qypJrsCzgcLJIKyRA4hTk9k0q
         lNegm/AgXAFiHuyQUYBE9hDjnJl1NyXBfxfgWYGtsUeeywC/zYPzEDDmAAPGPXy1i3ew
         3ENv7tphllWoGJSaZHkWQZMNYP9+eGaV0TG0rT7Dvhl3022EUH2ourdhKLucSHqjNLMn
         gyvtYFULs6K07gXbhaw6fsuzRSKQxQVJhU7muqBCLi7o4GOmVg6paPVDBKs9kRevmxGe
         9m9WC84fbhTxPhus2PXqF1Td8ysVlygd1s/bpEB4+GuyHgEombJAml/M8OovfRefYmIS
         MXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846563; x=1776451363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PpM4/bNxVdSN15mNrhrEkh3wOregdIC6n4jDSJV4w7s=;
        b=VZ9DqCFHtdE2ysqaeUBIDEEKYePUj+57YkYES8oubGu86/PTyXdUzvAjTWAgVqasx/
         DuzzcjDNeq32LvHOiLGTvFxqMgr2ODRCbsYvGmmHDkHgzCAwXeE5ua6uZpxzO6rigvoQ
         zEMrV/YeO5730Y56ij6cpyTtlLLbptz3HMb0OT+yjn37wD0RNfPl85q5rKl+SbRza/2S
         II87YUr6pGEA14ycvnuWWjpWOA0Ths5TlYu1pglOdFRtVsRWuFAl2WrkeWtWO/eWRwWE
         U3a4gV+iXXUybo/8Gn6oxWQrJKNxEBjORhryTwOQS1/u6TNZfjM6pRrg+Ws4Iv9NobLY
         3Hhw==
X-Forwarded-Encrypted: i=1; AJvYcCX2v10gGBu3cleDhmj5LwKOrAk7kmqn+96rhK/jbnw2KOgmS5Y9rOmlb+qXzrDS3F8c4TLL2k9ugBswCz7W@vger.kernel.org
X-Gm-Message-State: AOJu0YyB0MmpAZcpbKx017eWS61Ft4BSBsa1sNUmZ0HeaRtS2iHSXpd3
	YwSd+/KOg44LooqO5E3CQDSB19UtJrjce72MGfr5yLIvX+RQy3ADM8xteciHnJchJEThBsEMHHA
	HDbq0AVncgZzzHLFHAiRQYFpsuH1rfk/JMlSQcZcemjZjnIdDpz4Bavgz+0mgVt6KBdpH
X-Gm-Gg: AeBDiesAq3X6b0B4YAE/vuqe8lqIJQAxC8xanXbaM7VV/wJS9G9OVjLCyPAi+N7O9cH
	TLqKR4lrz6/npvuWTSnokAY1TE3ivIJ/H+K6jScOpInlpAve+RlFuGGEGg/t0pM0PIJOuKkbz9P
	lDvphWdai0GJ0o6prmUIq5JgogXpC7J9GAgQnoXYbvpgYkUtYJBI2muBSbMpkDvTsg97tqFLu8i
	h7qf3+5agRG3cCkKeAKbG3tl59Nui6vAJQDQkKLbD9Xs8OSCMdySkM7OMbSX0Bfa7GHL2xcdOkh
	Gtbhcl08k96JDqWhds2251X5M551HWKLyDskTD79LDpt3KBaSKR9jcm0MrZ6Dl729wt/3L63FSM
	pOFbqaUViG9Rqq1qD3Uixd/RR9xjXTFOeBlKRuPxDeAhE3lml
X-Received: by 2002:a05:6a20:7347:b0:399:12d:41f with SMTP id adf61e73a8af0-39fe3c92b30mr4885015637.7.1775846563358;
        Fri, 10 Apr 2026 11:42:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:7347:b0:399:12d:41f with SMTP id adf61e73a8af0-39fe3c92b30mr4884974637.7.1775846562709;
        Fri, 10 Apr 2026 11:42:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 10/35] arm64: dts: qcom: sc7280: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:47 +0530
Message-ID: <20260410184124.1068210-11-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: zszBSM1CYdn8ohXa9ErVPx4AMeBtXkio
X-Proofpoint-GUID: zszBSM1CYdn8ohXa9ErVPx4AMeBtXkio
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=69d944a4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX0pc96AxhS2MD
 fxnjdZBCMAXdecEbBZNj9Xa/YTiaO0ERLdonPsOpxWKEyTSLgVgf9H4vuMWXBUpuFCnMjlla9Ts
 OYMlfmee/zkNbNxRWfjWHlbkjGotlXc4v+U+PRZjf9e7lysZqb1S23+ZHoZvmfgowUyxtk90Tr/
 mUY6Dl/e4mXRBv87A6+/67a0zc4T97PRwny0z323DiNg78BMxJ7x9aPurJ9UjzP9wcRfm9z2Wb6
 PfkoZRX+7ZCeT/6+wbN7juLjgMcJGBh/EHzkYGGMvblu/WVpHOpUGDv8RTzyK5f+yauMvQJDqks
 g3p5zZ2i53aNFr/lwBFDfbOEqoqqSUDiKm9TO/hS9G20bvLKZDKF12RoHlgDcYRAnfgvLsCBeKF
 fyj+fpczLqPJLTAnWFaQA9j4yuHiweG+sD0IBAmUgRLjv7SWVAmcjksVSxzQK/y5X4G79Kl1Aqj
 pLV4Z2WtcL56b7NIhhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102724-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 285343DB988
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..e3c0c876368f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5629,7 +5629,7 @@ opp-810000000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7280-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,
 					  <55 306 4>, <59 312 3>, <62 374 2>,
 					  <64 434 2>, <66 438 3>, <69 86 1>,
-- 
2.53.0


