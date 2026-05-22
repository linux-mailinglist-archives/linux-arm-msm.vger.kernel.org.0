Return-Path: <linux-arm-msm+bounces-109411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFRSFS61EGohcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:57:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FAF5B9C31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B43E530237DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6827383990;
	Fri, 22 May 2026 19:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bhCON3+G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="khvjnzQp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164C2383308
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479690; cv=none; b=bCzxCazHJlB3mPR3ehUzqNEcUY3yykYy/4s0E0jIC0t52u1Vo5UhWi9ysIfQhCV0twSr0OoYOyxndQJ2eD5/jQSy1h1vGbjGj5e5+oFIU941DhjwWAligcrf7A4x1Zc1R2u0Q2CDAx/u7AIw7YwVpm53flqOM+oYcryh2AVWPU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479690; c=relaxed/simple;
	bh=amq0ZbYpF3TaS+9zy66LuC0aQiC4BW3YaXzcg8RvkxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Idz1lb2IsIhBHKuEd3YsDRp5ufdUET20/mTMynV8K7qdnLqX9EL07qGNRHi1+1iIywnPW/pMi/iHc6SvyInZWuKjkPjlvje3x23CKLcNK3MKm1kFrmnnXDbcTjitdvWwanq7zFO8gFYc2HPb35F4TvSbrRvmZK1Bcnxn3gz5/5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bhCON3+G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khvjnzQp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MHgIij3602336
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vXY5rKiBwoi
	jJd0uYXGkLB53jCJA8VoI2wc/O5Xwf+o=; b=bhCON3+G8KO+YfS1CetZ7tMPxqx
	w8HrWiwQP3OAC7nG2IA8Z5BCJ014yJ3ggs0E3YGQ0qNl0tyouymWB++jCdzOM1mn
	CGJHG8NJsvpzT0/FX+IW6g0QiSibi+xWV1z+bJoehLGR+xTUm+9z/0iHVTnI0x4j
	PhEKCBO2eBr+/tspUnQUNCxf/gZe+u9tNzl/07M2nBrIFImr5AadFoimK43N3RKI
	a2OKjXGP7opJmTln4AFw3gYmdXi9YpBbpS6pCEf0w32BimSSqfdGxVJCAnvAjmoD
	5PnHu9FKUFgp4JunXXXg/g7DELepJ/9kkuz2dU43xw9u1FnCJJcsW0dg6+w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaury0duv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4678c6171so81796585ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479687; x=1780084487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXY5rKiBwoijJd0uYXGkLB53jCJA8VoI2wc/O5Xwf+o=;
        b=khvjnzQpKZGvsoa/rsI/BdIdd1BMF9rJjqQFY1sXOTrdFk7Rr3t2hsGfGnEiJ64baV
         +WDFgiUGDWpZmFlVLj+dApLFMfLudfTj1p9Vda9mRIE92zAcF9aKC8yMwxjrBM6muA2b
         TIv1EOGoGRk3E1kLn77N2mp1nUH0I3LK7ihjDxtUDstr3JKVuaEOFx34rB8DYgAo/jKQ
         ci3LYdK7+fIH7SvYX7fA6xDxPlBUT2RNqFsiLIJC/tv18Djyj7+RUBaESYfnxI8iWNeB
         kA8TucMoA0D7M1IhfLr7BV151/JHMphz1igHze+6id0JGIT/KPx6Ggzonf2uIsX8qTlh
         NrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479687; x=1780084487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vXY5rKiBwoijJd0uYXGkLB53jCJA8VoI2wc/O5Xwf+o=;
        b=eCIoMf1BDyhRQTXyjGoEKrR1O5V0/j1DDbTj9eYRVAkl66h34buyLF8N5Gd9N4Hp9b
         GW/wx/A1nFs/Ccg7IrAm5fX1T73BG9nwSTtj82IkhH9PS3v/Aqz8BD1n573lH8sNMOTY
         qcH5zQd8e0Bk7LIvQ8IPIUEIB5zheqKdm4NNco6r8uYcUWztwV265s9ftKQ/04FYLco0
         hCu+T67zR/VyEjlBM0SkD2hiqnrsXfEg1Vb/WfftebbbWXBQaAf+gPi1K034nGEdAyq/
         A5rjCRrBBQyMNj5dqbaRvriUag9ri/7cUffCvPAuRLmBX3fu6//xLZYqStrbtRRdnNX8
         1VNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IKLgZzi8IY+ryvby4BZJ0vn8JfsRKy/KNT+H6PQxpUsnkYcZIHWDCU652mCVKAeHNnU6wsqPZ85JkuhKV@vger.kernel.org
X-Gm-Message-State: AOJu0YyHe7LWGuM+lKG5b5wphgoUW4Mi6oywezIW8Z51ocnKUFBlEolF
	B82q5bEzV809piQ2C43VtdqYNVCVZrxdRFaOtrwkfk0LBfElaRM4aCjvslwJDb8uPAV4JFJYXEn
	gBWjLyrfpY/f6KuRP7mY38G0JghQuWjNHBHPMdUBhUxzvIzO3sgR5GtmmlI0QZqB4R4Ja
X-Gm-Gg: Acq92OFwFSK/3T+ibAUpjWrAm9xp0KlUrd7pUYyICiNzZXNuUMQG9kf8g9CUJt1bulB
	hPcwxh1+F/zMbZ2iJKwcfO87WLFl9f8R1rofqFolz7vO4ZfTnRoU0zxZFO3esJarV+P3RJzNLG1
	VWrPbbDquxfpKNuM7aTd8lqWrwpK1lBlRmhDqA80uLtf5flybmIZD/BY0LSKkTw20mFD6yr06K/
	2yJVmnVcUpCpsbBUzbT85f+iqCkyfBFjcHtuh2NWkzqXCAF1oolorkm4/zOc3Vy5wMPnkbozRZN
	PQiUqUg1/ZWuuNX5YTcmaRCQyulRo6QNmm8FYn9clPOFh0xtFL9bE0Wxmzs9jWoymzWGA9XR+FT
	lXRt1xuot5DKCeD4dtiDJo6LpFC1YomrJ9oIs6Bo785ni+s49
X-Received: by 2002:a17:903:3c6c:b0:2ba:6bd7:8f00 with SMTP id d9443c01a7336-2beb06e9eecmr50964955ad.5.1779479686517;
        Fri, 22 May 2026 12:54:46 -0700 (PDT)
X-Received: by 2002:a17:903:3c6c:b0:2ba:6bd7:8f00 with SMTP id d9443c01a7336-2beb06e9eecmr50964715ad.5.1779479685972;
        Fri, 22 May 2026 12:54:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 11/18] arm64: dts: qcom: sm8650: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:02 +0530
Message-ID: <20260522195009.2961022-12-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfXwaeMhfugATj2
 FfLCoMJt8KB9nIxDsBV1Qg/0cW43Qi/SiFV8ofTPHYHbwxLVs1VtRGtlPlxpsKWN/Kg0ocbqOgh
 WpFsF7GdYwPdCVtD8+sA7QBFU/HYx/NCYnAoR2gqr5/QJ1Y4yqMG5DGhFbjK+tIn1E3SHk67Exl
 tGdB9tlPrO6vyH3ElniwZ00HPhH+3tweF5JxYCjcSCNmViS5ExFRU1SHeDKM3z+w1vMwHWJVAxE
 fSAIagEX7+V3J9EkR19eUbno9Mf4oZkw2L5eXPeQwmqFyTrCyjLd13+KXUob/8FebpL6SCJ15CS
 AZMYVvD1xJEXACEOBUoL9kw284Sc1mWAF3cl25L0jt0SrckIuBggM6KkH1aJ2Gr84h+EkLI/f2d
 aBOTSsYHWHMx0U/zCUP3EtSvWX/zwJRfrHEPNW5NvoTKcUDGPOg7Wbq4/fUqNilDwYBRrcosmyo
 39qAdtPlrunVzG92fCw==
X-Proofpoint-ORIG-GUID: I_Ji3Sqp6hEBgly7HY3ECYIx8mN-lWvZ
X-Authority-Analysis: v=2.4 cv=d8fFDxjE c=1 sm=1 tr=0 ts=6a10b487 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ZJQsJAtiAu0WCEyc7p8A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: I_Ji3Sqp6hEBgly7HY3ECYIx8mN-lWvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109411-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,1c:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,0.0.31.64:email];
	NEURAL_HAM(-0.00)[-0.986];
	DBL_PROHIBIT(0.00)[0.223.255.192:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5FAF5B9C31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..cee4def3c51d 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -645,6 +645,7 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -7087,6 +7088,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2c000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@8000 {
 				reg = <0x8000 0x2000>;
 			};
-- 
2.53.0


