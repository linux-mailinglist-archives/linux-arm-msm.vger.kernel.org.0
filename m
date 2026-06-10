Return-Path: <linux-arm-msm+bounces-112413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y8NDJmZJKWqmTgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:24:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 417D3668BB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:24:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E+PxSRty;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Cr8iA7zh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112413-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112413-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D43CB310692D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCD43DA7F9;
	Wed, 10 Jun 2026 11:15:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AA53FF1B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:15:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090132; cv=none; b=DDVlKvkLIdrBlBJHQgf38RN8ggpzSiVH3mlCCPaqI7E10om+k4Xy9rQe5X3P/p5MCjvPrkaUc0bAYFnOUNZDhNXTXY3E2JKUHG0gnFIdJ/AtLctlCasMlg8t1JROLeg267mXkemMVwJMJfEYWe0RM9PP9bOoCsrZJXx7SFA/Lyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090132; c=relaxed/simple;
	bh=x7+Fsm5Jk2Yz0bMc4s75zpL4JuFOmFGRBBISbD+XDQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J85EQ/YGCBpggQOrjCHBqJJaQoWd+/Uwv6/ypY1vrv19aE9x3H9thg7FgDBtTPGP1kGj12ewdkI2JaJyUklHWKgbJBpq93eueuofNmhCCuVYQib8DZigJ35OXCAo+tV2vYjecMaKTY2RTUlb1JER2jHcdVAn/41l4t0LGTfU4hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+PxSRty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cr8iA7zh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hrga531016
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YB44qVUGLtg
	M3HmQQf/FZNIA7iQnBZopEsXlNXuQCUA=; b=E+PxSRtyvg7d2Mr+JinMSAZ1qNT
	MnOEITKL8dKrtRr6532f2FyM6eQ9A/fxHSbEVDErHt+P5ZyoEBIRhtKsYkVt8ujz
	inJSJsbbeRP2OnNW3wuCwHj93oAv+M6u8fUNC9gT8WK4GRtZiNi8Ra6stlb5Dgym
	dYf51xMAEjo7OocXY+fajId0+lLFMu0ahGEFdiuX7O/Z8RscbnU60C8KcMEjnBxu
	7yHFVBKeHGaXnr6kVMnReRf6Bq7+xQR75bJnvk7fmCrBcc3PtyInWHAtpUI98XTr
	M3xXG4dtJRQ+DpNqz2/6wv4APYQzhkU0CibPBnTOlLtzPoE3s8ubPMUHTRQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh27b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:15:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso68390395ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781090125; x=1781694925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YB44qVUGLtgM3HmQQf/FZNIA7iQnBZopEsXlNXuQCUA=;
        b=Cr8iA7zhygxsbzXH+ygEFXZkBFOuXKHWcGsLdTn8viosvpm0p/mzHRLjUElxZHWbre
         JeddrYdpFq9zWL7xeqBGSa8zPpWesP/TRALdCfLA16Iy/wPphSkQ9qnHjczda07gWyCL
         5bnge5YunuzST881v9qLL3h5LgF/ZHsJ5fAM8gnhJMnExvvBec5zccjVptiG5liBn5kF
         ZnrI6xJYFi6EG7isEDWZpX8V8dNkdnq6hM0VuA695hwa2T2c0LJwskCFSWsXFj7h7bC7
         BQcMM3a+s1PdoW97PlZxGXKxneb80mu5Qtl73BEg7cDIaa/6uEsxt4DRx2CBDceS48aP
         LLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090125; x=1781694925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YB44qVUGLtgM3HmQQf/FZNIA7iQnBZopEsXlNXuQCUA=;
        b=FuHygnOYQIeAlJ/Jjq2R/XKpEFMBH87boG8PPq8nZVHUK8RNf6A+JBh8icm8qDV6v6
         SgTbdInGNQkQXdMsVzacFC+fGJP5mjAFqd6Nca5hFw/4cXNp0xbyPd2y+ofBm4HiCVLF
         osBcV9hTJTp1tl0n/yBj4l6b2df2PbwwuPPysWUZUCHtmSKgDrj/fgLIvvoBL6HQaDmw
         OiS06ttDVd5MeXut0cbdXVuTm+22Ca7dhtAlUt0SBA1PtGazVrHcet6eX535kFSvSAiG
         xdJjZ1EbK91eVBw52ruxnJ7oZcK4wg92tleQdYwctkgc/YkrXh2OqLuHr446wFCVGPyc
         KXFg==
X-Forwarded-Encrypted: i=1; AFNElJ9M+plw9ZkEqVorDlrRVIOcZeByZWl7/7UnTi8leJATkUUu5vF2BzeXXYxK5q3dTXEA0rElnqZf6AUOXN3G@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0zU8AOc4OYh+uQ9tT5Syd9lc/kuUL3wl6TCMn+LJDrCVh082P
	06kgzNI1s19sulBc9XTjv0jvr/f+vj3XEv70OyuIlMr7/YGg18AqCaPIGFWQMdfsnkRsEt0sXlc
	QVypMUwmp2VH4dzroM5HfseitD63RSuuJlrE1aq5m0H60sey0CfbCG71McN5FTm/+Si8k
X-Gm-Gg: Acq92OFXhsJhqo3wlED9UGj2dAaoIGtQiIXeaJzLMh+KUMDmV+iT1VY25wbyqSgzzuH
	7jDVK19XNqk8afhLg/Sf6OfWzq0nMSriZvthSNC2ol2ONJX3Ruvaq2GirF81s+U1pUKUOe4g9Pv
	cL/DTEWeQFMBL+n7T8GCk871A9Lb7w+6PpDEeYUjw39PurU8UClK5H5lY9adwQ7Fkw37flW7Brg
	/7aAV25SjAM4EymHWZYnIINrbai74o/UD9inOxgCEiLegx1wTc7DsmMkfWsZW4TrRD+u/Fa+ke2
	ARcrqAOXr2kvQDp7LYE1qyWhe97wDu/rp99F4GFvugQO6mEhADKOOBeY1IpHf/ZRX5si8F6IsGg
	YLfSfs2AASzFsSObvYSC6+XxfGLv23is0vHtuIc/k20y4NABklLJQzOTDc/w=
X-Received: by 2002:a17:903:138a:b0:2b4:6d92:b002 with SMTP id d9443c01a7336-2c1e820e32cmr259826265ad.37.1781090122570;
        Wed, 10 Jun 2026 04:15:22 -0700 (PDT)
X-Received: by 2002:a17:903:138a:b0:2b4:6d92:b002 with SMTP id d9443c01a7336-2c1e820e32cmr259825635ad.37.1781090121898;
        Wed, 10 Jun 2026 04:15:21 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa213asm256052545ad.35.2026.06.10.04.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:15:21 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin <ssachin@qti.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH 1/4] arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltage for SD-card
Date: Wed, 10 Jun 2026 16:45:05 +0530
Message-Id: <20260610111508.3941207-2-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNyBTYWx0ZWRfX+1K1WLMRmXtW
 so/8EdOK4+1vIn1UV/4I7jwz2/9oi739mz60jrzvCFChweY2MgOVgVBRQ9/DNO0RzOh7UZ1GwcP
 BDtl0cQR/dDmRKbIgcnZn5rlFv200jeb1arxtE1U50QCxCHDLHULxBCckgveade1GwuUZndbbVL
 dnE4noMy9/2yt+XcsmK/zuIA0yHGmOv79Og7y4/zqkzXeQMwOPyvvJ4hR0MHS1X8t5XrCcOSlzc
 oE6mIXNipyqdl02IbYU2m2sSOa12jfraby5wymce1pWJv0mnIM+WiYkaiYfNYc+kMGwy//jk5Um
 pNA/4uinNvnm4pRuau74+OzIokb9EBJ1QuFgQ9fdzMZGe3F1jCJHBNzpyVzIameUGSS3HESHppk
 cuYb7ksqwCVDaMqmiOda8+GVa+xGbnXmQT11Q6eHQ3esKkPPhfvMyNjVNSvd483LXDxKpVmyCeO
 Z4BLOdy3M1N8iB6ejFw==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a29474d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=RbnQZSTpM6gPS1NYG1gA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 7SaMIHC33hYA6reLrlu2QyOnsEJQIpAJ
X-Proofpoint-GUID: 7SaMIHC33hYA6reLrlu2QyOnsEJQIpAJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-112413-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:ssachin@qti.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 417D3668BB4

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

SD cards may need 1.8v VDDIO also to be supported, to accommodate this
requirement reduce the min voltage to 1.8v for `vreg_l2b_e0` which
supplies to VDDIO pin of SD card.

NOTE - Since this SD card is the only client on this regulator, this
change should not have any side effect on any other clients.
moreover, SD card driver takes care to explicitly vote for the
regulator voltage based on the SD card detection sequence.

Also for stable operation of the SD card increase VDD voltage
supplied by `vreg_l9b_e0` to 2.96v.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..af6f42cdd39a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -228,7 +228,7 @@ vreg_l1b_e0_1p8: ldo1 {
 
 		vreg_l2b_e0_2p9: ldo2 {
 			regulator-name = "vreg_l2b_e0_2p9";
-			regulator-min-microvolt = <2904000>;
+			regulator-min-microvolt = <1804000>;
 			regulator-max-microvolt = <2904000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
@@ -247,10 +247,10 @@ vreg_l8b_e0_1p50: ldo8 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l9b_e0_2p7: ldo9 {
-			regulator-name = "vreg_l9b_e0_2p7";
-			regulator-min-microvolt = <2704000>;
-			regulator-max-microvolt = <2704000>;
+		vreg_l9b_e0_2p9: ldo9 {
+			regulator-name = "vreg_l9b_e0_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-- 
2.34.1


