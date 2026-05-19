Return-Path: <linux-arm-msm+bounces-108562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO3NGeaNDGpCjAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:20:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D74C65822E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F78F30BE888
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E335134040E;
	Tue, 19 May 2026 16:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1P6Y08L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qb0HOnRn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6745A340403
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 16:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207009; cv=none; b=jcNsfyu2oT4nQ4vsYpChOl2XgfIihDSu+1PtK/cWWqy3R7NvFs5XLfrOZbhBBDwS4iub1TiMNLWi4GdrmYFnrap5w96h+W7iK3PUBoTRB1I8h8d2IV23NebUUBecEBO/WC2ZTCaQG+2OxUJiMwZsvI7ZarKXEPkqjRRD2STagvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207009; c=relaxed/simple;
	bh=IYElup4ekCon9UY2aedkshAhRE3XjQvOktiBaogwXqE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GyWyKY4/QzCR7PQHDdVWu3TqCpIfmcZ+KGgkC/kXCL8+ncB99UUJDUVgUz3aDnkAxAKq+097jNt9b8kaUqXcyj6mJVT01keRiH7Jp5Qt3ReAxcmg29vs/pBcP9B9ZE2e21EwYp9Rxd19wzLfDDDBIAcVLpXYOf0Z3aRABqZIGYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1P6Y08L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qb0HOnRn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExLWG2984348
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 16:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lZKj7eUJow3lctx4K3XGUm
	tqHkymP9JpVwthbn7Qpro=; b=k1P6Y08LBPqojlPrEVm51zDtBSdfYyv10VOemI
	OmYkHCUCNr1jFopm6N/ZaUcyny01GNoQjuyjK3p9k8mUXMB7MUHgOk2lf3RdgXaK
	+v3obpaxqH1daW9Kp2/mD26S2f/gQg01/xLVDCGW0QWIfke/0tbRtzZS7zOr1iAU
	weAA+qFmgEM7EupXHu5/mH9uSnC8dgcJmmS2uXvkyWvVzOF5FXb72qZdEMMdvy4y
	1I1Tg1Tx5AZUOBg5DR2D4vJv8WsrUbfls6dTWgfbOjpu+op5/sME5Si62ggG81f5
	RGOl9OQIAEutxqvZ+vtzMkUP+hYvj17CiFK/exTpcLISUEfA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t0ayb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 16:10:07 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f69a1a9f5so12406396e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 09:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779207006; x=1779811806; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lZKj7eUJow3lctx4K3XGUmtqHkymP9JpVwthbn7Qpro=;
        b=Qb0HOnRn+dKHsm7gsWzp/qfJXZKhfHBY6JmC9ac5tCEsAUMYvfGeqR6SiyZ+ACG37f
         050QmbYvBeM0FennYt2wJkmMLogST0zZy5956dPUUtaiLFNiRfDN+4uY+N7b/LIc8Bxc
         tqZmCdNpm5hxgQtBN1sEVLPufySbHAzNgNl6AC0XoKwN+Y/sGbTV46aOwXxIEgCQ3E63
         EWzFQ4p9nDpWepAobsD9zUwQPLTlWpV/UjpU51xAQofsv8WXa2CysysmGmamNfznZRGZ
         j6uQGyAA81ADP4i4JG6MCMf379Xo/hAfwxjU177GPeTsjKdqvYrwOFsne0oFgr+VDux7
         c2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779207006; x=1779811806;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZKj7eUJow3lctx4K3XGUmtqHkymP9JpVwthbn7Qpro=;
        b=m0xbQr87AL2fAs3Zdi14RWYUntn2FIZw9y3+eeiOZm+ZlgkaVbczoKXU2uVo6UQAsk
         35FHfK+IuPLiK5dWJcBV0Akbi0y/DvR+RJCVF1QTyGEO/Tk8C+fNYr23mFcba9FPc2rN
         3uV+YnFijxr174mDjV/yjNxvgKm6W+hU8fPGy7Xv79JDIXoE/tWwC8EdCwe8ligNVahW
         9VYR5X75KSvWUJoDdlc4LtQNG9bmvobjt0QIRsUxAwF033Tp1BY3fMmI4ou6G9IBZ5WL
         19dDBsarnTO354wfb0SvNCFHaTSZUp+lm5o98vfocRi++hfX/bgUqoinkJLl+Gz3md74
         aPBw==
X-Gm-Message-State: AOJu0Ywzj2G7FXk869jbUpcx9Fz0YGnbwJhA6nvupYRyKI/ZJqgTzd43
	l/Js3Bo26y3quxClTI8XrYbPQu9j7kvBbGF4Uu+124eD/k0FR0TX60nwQvDo6Vlw6YEqwCFT+lg
	wQPaWPU1Hcl4SilX5td5IiU+n6uUo65Uj+e7M8jkIMeQXFQHbAP9T0zuMVpP2Yw47RS7a
X-Gm-Gg: Acq92OFsGRaWw8FdCRHm8mb4hNp8kioBpxk/DzYoVry0B8421pQ4ZUpp6+Y/1K2JeT5
	W5eQG/DeuF3TG/HGhs+z3+R1wmK45rVqylns1YHIWXmTVkavxEer5XFJQv6DDWIxKP2D7eyrXxq
	uit/htbhTTu6HqT2buOj7nYv0D7Dg34hw85zbSgP+QAhUkwMHkTYJaKnc6xVm8WxWjzndndEH2G
	BeNpQa+TRLSmPTBl3Aqdw0kI1yjydPl2Lf1AaNQJBLAW1Vb8ghX0JePqKDNtjMyLSIHK3r+HT5r
	3XQB6HyJtK4Ohdkl/icp0oqzpQ0a/K+oHfH+M+HnxGBDtOrilGM4rz2s+QI5RSyay6xZEBOpvCl
	TO1PkBlGFEwN4RwVdawRuKMsva8EK
X-Received: by 2002:a05:6122:8010:b0:56b:942f:b870 with SMTP id 71dfb90a1353d-575f5476d83mr8121605e0c.0.1779207006293;
        Tue, 19 May 2026 09:10:06 -0700 (PDT)
X-Received: by 2002:a05:6122:8010:b0:56b:942f:b870 with SMTP id 71dfb90a1353d-575f5476d83mr8121572e0c.0.1779207005585;
        Tue, 19 May 2026 09:10:05 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab7c5sm357874915e9.12.2026.05.19.09.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:10:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add Eliza CQS EVK support
Date: Tue, 19 May 2026 19:09:51 +0300
Message-Id: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFCLDGoC/21Qy27CMBD8FeRzF8V2XuTU/6g4+LEBtyRO/BIU8
 e91Qlr1wGWlWe3MzsydeHQGPel2d+IwGW/smAF72xF1FuMJweiMCStYXVS0BLyYbwE6eJiVB0x
 f0PS0pIeWsro6kMybHPbmump+HJ/YR/mJKixC24XDOeZn4XlGpPAIyg6DCd1uxGuA7eGq+OckG
 1vWnBebD6H9BNFLaLFnksqiV5R3qXrJYs3m2w6/MYyfLuIGdamRq161oiq6xF+xK8r/Zc8BQaO
 MJ4jCBRCjhsE6BB+nyeZFLyT2XLNSadUlRpYezsYH625r1YmusTfl6kWriUIBDa0PumkF50jfr
 ff7OYrLUtM+D3J8PB4/mH0QqsEBAAA=
X-Change-ID: 20260514-eliza-dts-qcs-evk-7f1419812659
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3224;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=IYElup4ekCon9UY2aedkshAhRE3XjQvOktiBaogwXqE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqDItTS6YYBuVfzVHpex6M/W+Zt4GWEr9eI/Jps
 OOWtxxxHbaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagyLUwAKCRAbX0TJAJUV
 VlKiEACyDrVdZc+WIqXL94EflPcLB93JtgpKMOo7h80qomedxuatEF4QuaSgFJPGi7lUs6i/F2j
 ksqwk7HQWElanI19fw0UlAEANEjpDRntqd9mk6f4/gD4Xp2aXLjEsSEDqp7UZeKjXbpF+i0B6OG
 TerQ5h89UU/8Id0YW82NvJ81qANC/BgDLjQL5owX532VDqN3vX4ZNJA5uR6hoOS0QGEz0Pq2vbx
 im0IfLqn4ziDm//lGfrXOy1/GtgY8v+O4kltMSEKnSVo1Awz9tH98i6HsyOTOrg2nSSCyBRVyPK
 SJ8xge7xZd82l+HC0LC6qPKkgOhao644V4CDGu4ZCDM77xIdua1hU+rnuxN2k6iLwvZxxwTCItI
 rQ140UycAT6+oAYak3uWXOok7jAnnjgJ3wOmkMj1yro555+Z9dm+TW396VMMp0Ajt9uUjtlXoaw
 Ys2HpPBWKaB4/5oc86o9kS6zcpOpS+nSLut79I3nlDBq8sA1JYhKK/M5R0AwAAiUq2arpuwzRq8
 PDWcoVgIYSz0j6aWlW/waOAqw0Vi+ung2cl6J30DAvSRx7Ee7vjy6babr31CGq2KAw31U8/l3mz
 b3yZwUaln2a0XPUwgtvw+uZNYSLJpFBdUrLEmXE7cdll4FSR+VD9F9vTCybVpsJtaDmpynEV44l
 US7Imm0jHOjXJSQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0c8b5f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=uut1gRGHU2sbG-ATfEgA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: uolusmL6_tq3naMF1TCRAMejRcXAVUfC
X-Proofpoint-GUID: uolusmL6_tq3naMF1TCRAMejRcXAVUfC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE2MCBTYWx0ZWRfX7OZg4Hsb8A4+
 6IEq0Sj34ZCeNXFD97VEAO0/ipujZWzgPOaCBWEAobfW7uKXOAhw9/znWXYnSKNnxksKOTVaaHv
 KWrHX8vwwPB3kQnOFENnR7mHJZlaCeCn6bWginUsnVsIl/3osHnAt0bvtcpM1IqTYkHxw18pYdR
 RM0tS+OpCU9+Ve0bMxlXjnxEiQ+IAqhL37zJyYzr3b55MFrKXTo+0xSRljbPXuXypbkwfsmUgxn
 P90FOjdNLB2+1UIh+DBgYyXP8GmvQe+t7TCJ9p+I1Y7CWalDsW/C7Zzu15Ou5cH90XBzY1eSCOR
 gdzyqgLfbEWzFc3V7oMurMXhrL7YTkFy57rCCOFdzpOHxxUrpLmamKgCnZtofcjMUUXig4Idn9d
 YZDDZZSf4sy4D3ROxnciL6C3qlN0TDFE7poAe/RLS7CoLTyAyoeDN6De5ux1FbvADcDxhFk4FL1
 83pciK9lIfGe8JHNHmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190160
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108562-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D74C65822E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Eliza EVK platform is built from a reusable base board and an
Eliza System-on-Module. The base board provides connectors for external
peripherals, while each SoM variant provides the SoC, PMICs, LPDDR, and
eMMC.

Add support for the CQ7790S-based Eliza CQS EVK. The series introduces a
CQS SoM DTSI with the board clocks, PMIC regulator supplies, ADSP
firmware and eMMC wiring, then adds a common Eliza EVK DTSI and the final
Eliza CQS EVK DTS that combines both pieces. It also documents both the
CQS SoM and EVK compatibles.

Do this in order to be able to boot to shell with rootfs on eMMC, on the
Eliza CQS EVK board.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260519.
- Added missing qcom,eliza-cqs-som to the EVK dts.
- Added in the bindings patch, as that should've been part of this series
  from the start. Also dropped the CQM as support for it is not being
  added. Also reworked as Krzysztof's suggested. It was initially sent
  separately here:
  https://patch.msgid.link/20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com
- Link to v1: https://patch.msgid.link/20260515-eliza-dts-qcs-evk-v1-0-7169d78a33e1@oss.qualcomm.com

---
Abel Vesa (3):
      dt-bindings: arm: qcom: Document Eliza CQS SoM and its EVK board
      arm64: dts: qcom: Add Eliza CQS SoM platform
      arm64: dts: qcom: Add Eliza CQS EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   5 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts      |  20 ++
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi     | 388 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi         |  20 ++
 5 files changed, 434 insertions(+)
---
base-commit: dcd3b3004d542eb57b4acbe916919336e9aaba52
change-id: 20260514-eliza-dts-qcs-evk-7f1419812659
prerequisite-change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13:v5
prerequisite-patch-id: a457d339aa64967766ea88eb05aa65a4747e1022
prerequisite-patch-id: 04af1479b04d515ced835504144cf09381471b85
prerequisite-patch-id: 480c23fcf537d5ae69214f0aabfcef11418d37fb
prerequisite-change-id: 20260327-dts-qcom-eliza-display-64de3cfc8a50:v3
prerequisite-patch-id: 827ce662558e6c9669425d70c563a44f0f89675a
prerequisite-patch-id: 9c102d9b419548ec7805fe87bfa0ec52272166a7
prerequisite-patch-id: 9190eb29bb9822ac57b9f3a2d6ca20200f8fc9ee
prerequisite-change-id: 20260513-eliza-dts-fix-debug-uart-and-more-support-fabef3d24cdc:v2
prerequisite-patch-id: a5535fbaa3699a133dfd13cfa9a2a74b18b46dd0
prerequisite-patch-id: 1b4e40eb33adf28c8b6105f25f6636f82239a962
prerequisite-patch-id: 480c23fcf537d5ae69214f0aabfcef11418d37fb
prerequisite-patch-id: 827ce662558e6c9669425d70c563a44f0f89675a
prerequisite-patch-id: 9c102d9b419548ec7805fe87bfa0ec52272166a7
prerequisite-patch-id: 9190eb29bb9822ac57b9f3a2d6ca20200f8fc9ee
prerequisite-patch-id: 2ba90a6d131ef9f0065aa7d4e855cc93d1e97fce
prerequisite-patch-id: 7dd9c4f27c461e52a096ceca08427a724c8faa6d
prerequisite-patch-id: 91a4f29e0cf69b9cbaf243ac312b9b2f34596c78
prerequisite-patch-id: 4792ea10ca0ced5dc906080f571d54d6f4cac526

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


