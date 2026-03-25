Return-Path: <linux-arm-msm+bounces-99901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHcHNvEOxGk+vgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:36:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A263291ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5E20306E621
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C313F0753;
	Wed, 25 Mar 2026 16:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZU7byQW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iR6P0qEo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF243EFD27
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455733; cv=none; b=MS9PcxAq3HBlTj2SiHDK5JPpYp34kVHgLDhSomumSbJjpUbKD+Bgoz0JEIQpycvCvvl79qo/CMhTIC0TzGOS7jZFFwdCpJDHcGlLZFf1xtlyvtaGQvJfT3V4DTNaa91X4n/xQLZqArRM9zQi6ZQo2yCAypEPSH+Vm60e6Xw7PVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455733; c=relaxed/simple;
	bh=/tAVcWhVjzz9qIGzMcaNacJ2+0y7se0EVvVbLWigg+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MxP+FAIDLm41vLrtKv3UBno4TKrHxtlFuN+SMnkBMJo1UxPkXQU8KNubLVD7Zq4j05Wf3ROhWLNOJnR/Fsvd+Im1EImYSrm7YCTglErt8HJlRTtj1QYMCBZmyXx6n6GhDfnUMROJV2VOq+Zgi06RMj3GOq94fAlVrSvLRm+WFnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZU7byQW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iR6P0qEo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHFCj2162001
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 16:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c37CSvjP46taUJnNNUK7QMfhl6NdHUcX65l8UjR3634=; b=FZU7byQWcbXQXeSp
	NSnDvulXgrsDr/JOwzH6XRn05IdL5scA1We6I6XTzCWTEt9d574At0ZqB7SeY49s
	4Zc2Sn/nDhJGEnpzPgzoVERCC3ZuAO4w8dlniMbN42mmuMRkKK+HYVjiNRBilIVh
	Vcu57MUtl+NzVFOU8z4M/jFE4djsPGCPe4ZcqFeC7NN+1HYGcw75q6QkTD7TgufO
	Wy5dsYp/wxOaACHcWzq4VPXjhEYT3bi8V8CsbE+Pp0vm7+uyg6Z8xEMdSuNymOK9
	JnqqKfGMrUS0kSC4yCWynPEwMySG7cpvrNDSvmOaS7NcduDgKfoONgNLGriX2MLn
	hk/Iwg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489wjk73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 16:22:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76666c3ec2so68541a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774455730; x=1775060530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c37CSvjP46taUJnNNUK7QMfhl6NdHUcX65l8UjR3634=;
        b=iR6P0qEoyFpmxGuJCuQGX/CGOH2keg8dCMf2lHPjFWOzVonMQQU68wSQE/x1AhdHPW
         +x27uNH0MaTefU+0kYquzCRibiG98N8NJ+3rWbZM4YSZZh61alZ4tnrl4pMzbtZnPliH
         4q3tlCS/+mnt4AkP2ug3I9FyLuJnrFVHbfOIIRfoSUCX/NXoZF2qQD1fJkccpRI0AdVW
         yXaAuGyh4GKLDEDU+x2BEzo0bEyhpoJJOoCkJQsT3uYTbMZ8IK5UIFY0zeFNQzqS+hN4
         giT6CHNkJiMcMwVWxKy84vj3hN13Mk1/nF4yhJhYrHsFDnY+r9h0T4snG2Be1sYshira
         DXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774455730; x=1775060530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c37CSvjP46taUJnNNUK7QMfhl6NdHUcX65l8UjR3634=;
        b=h2yaWmPIf5JMnfHgEXCMX09/KTwkqudHz68CXKmRV83FCiaAgtXiX5j6VpSAKdP3Vn
         TeQoIlB/JXxyXbKi1UXyV+o4AyEBM73CXwsNrP/3QTCcqaeRUEK9dy2r1NRS8U40asVO
         ly7OhEjuUUWcW+8el2z2ylzC4V9Z8HowMQobS1eQK/VSA8sopkFz6BPgm990uWM6L1jg
         0SeqB6u8AxvjfmS0lBAJL+ZzI4gK1oDcrvIQrTsKB1WpGgzdHTNxxv9LSfKPuDZfheyW
         5iEeb5jHH42iM2+V9JA5Z1NOUZQH3muNB0pYBtoiDri4M3+KubcawU2gQJfjE/E87ADp
         j0kg==
X-Gm-Message-State: AOJu0YyoqOm472meN9mkfLe+uTKnkDUrU3uPQm/ooFt/TNhGPvX0ZlCi
	kdIrqJcl80AcDtrJhCzgyVq4fvCwD+2R8Ao21EIgbYynG4PqgcnOUKILQUykNZxK0scVaTqB56Y
	JoWzZfmk+PyAHDPGYNLCCXmL1vpGyP8+xP3bALpZR1ao7h4Ep8cvnt1qij92MwI3anrju
X-Gm-Gg: ATEYQzyImuoWCR/zXGBwlDiLQhKfKunhdLe46kvbWGKP3hR+nEeLYaHaII5G1YZ4Un8
	7GVJ3ty7bCPaxtd7y+sN7Gx6PcmpCQWJxpjbJ5pfOzZBKEXLraqLcjDMXBu0cqLnd909zK710qy
	NEJnNuVFtlrFUuXoRlW/4aRF2TBv1Qp2d1M6vaNI1WXKgDnxBA8l4O1T7lKBBglyk8QfgXogFlx
	2fLUGVp0JX7LfrEtf5NvWj9fqxul1WnXBO7li+WI/MuHQj0bgMhJhn8EROCodHKetFLWKUcepKe
	PEd/bQbcvekmJEWSSUYsqfC1KrSiceNNobgWWLQt3HLQunDNoO6OSW0GYRv8suaaEjqdEnVWb+B
	ZVp+pm5UytVDV8E6SkXDc1V3vsV+5SRqkAqwOLo8ilePd8oMFdRXfCMSpaZEEDgP3+oYbvcKx2C
	HmJXkZcENoK6Dx2wlISK5J1Z8OdsBzrkles4g4+smEzyNotn50
X-Received: by 2002:a17:903:22d2:b0:2b0:4f82:74ce with SMTP id d9443c01a7336-2b0b0b2f889mr44454165ad.46.1774455729545;
        Wed, 25 Mar 2026 09:22:09 -0700 (PDT)
X-Received: by 2002:a17:903:22d2:b0:2b0:4f82:74ce with SMTP id d9443c01a7336-2b0b0b2f889mr44453885ad.46.1774455728988;
        Wed, 25 Mar 2026 09:22:08 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8e958csm2945415ad.66.2026.03.25.09.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:22:08 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 21:51:50 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: glymur: Add missing opp entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-bwmon_fixes-v1-1-9433f9d4c276@oss.qualcomm.com>
References: <20260325-bwmon_fixes-v1-0-9433f9d4c276@oss.qualcomm.com>
In-Reply-To: <20260325-bwmon_fixes-v1-0-9433f9d4c276@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774455718; l=725;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=/tAVcWhVjzz9qIGzMcaNacJ2+0y7se0EVvVbLWigg+k=;
 b=Peh4ArQMebk7fNnewzEjKB6ulukVDPzyFqZ2n5X8+NwZXUgSi5SWE1QhrMp1wSGku5JwJsyZx
 nGCzN0WXnOiA/bu2RjtRADzyPgkn0MGH5eGBuMpQ6+m1DCX3R1AZVG+
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-GUID: 2g7l9g70LfCTDFTVXbgBw6Pg-vcMVBzp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDExNiBTYWx0ZWRfX9WYAsjB3KLtm
 GKdL2qMM5M954F8nhBnzsC6Vy7eveLQ/lJh0kah0cvyDXRbFdiro4gN1XzoYt/xHoe/9EoKidnm
 +XmYxy7ffOBdbUYmP0LaQYfACNP/IJHArOlu8r6ptWq1X8Pk3uM1B3u6G/fbP1uKDczYFhWO0ZW
 sjmPI1Odm2HA9NWgztLxM/oY0Z3UTgdxpImdJW048W0uY02ymDANZwL9N+1lTo9mEL/ENlF3KjQ
 UtNaflNyurit+PHqjGnqIs4pzY9VWJe/XpqeH3V4lRZrnr/Uyn9ACv7y5jcj62AOIVqI/EKHQLn
 aE9a/FTQCPrC+OC7VmhUAAWaDznEpzWAXsIm96mv7jKdY7ZMbF/h92YGOgXTRl6AIKniraAWddy
 gPNg4oVgHjpSH+a91wkWDk1ylZErQfQqP07qYJxTjDkzL4dwfXwwkYJFsL+DBdcv25z8KnELSRx
 5dwpO1S4+teCxBm05xw==
X-Authority-Analysis: v=2.4 cv=e/gLiKp/ c=1 sm=1 tr=0 ts=69c40bb2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Brl5giRaLH8v9AitE4EA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 2g7l9g70LfCTDFTVXbgBw6Pg-vcMVBzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250116
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-99901-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 74A263291ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing opp entry that corresponds to highest ddr frequency
for Glymur/Mahua SoCs.

Fixes: e4945894c1cb ("arm64: dts: qcom: glymur: Add glymur BWMONs")
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 2c9d10f2e987..dc897fe1c8de 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2595,6 +2595,10 @@ opp-9 {
 				opp-10 {
 					opp-peak-kBps = <19046400>;
 				};
+
+				opp-11 {
+					opp-peak-kBps = <21332000>;
+				};
 			};
 		};
 

-- 
2.34.1


