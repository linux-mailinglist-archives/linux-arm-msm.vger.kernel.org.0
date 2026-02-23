Return-Path: <linux-arm-msm+bounces-93712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCBpNW9qnGmcGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:55:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB6B1784DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E77E230DB770
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851532609FD;
	Mon, 23 Feb 2026 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQuS9JoO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N74RCf7E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3253223909F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858479; cv=none; b=mfSB+be/NLjj/xrv4EELwPf/3nsH9nKtnDS7HYVmIHww+K73TLSd1UirZCEniYore00EeWnhF5mM69LU4mYAKQxOkTHqhNrlEX68dBm0Kyh0I37Dj9nHLy9EPPXwp127n1Wyzw8sl9XqZVqOimkE+/Z/YujCoinkoh5vYhhKfmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858479; c=relaxed/simple;
	bh=ERKw1P1SrPsBSKsfIVJM3rgcT17mNX4/TLRUGVAThZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NUKQZmGLo1NUrGxCvFITu5tcnGDYUQdz+jBazJPKL/ZlUJPR8qUIF7LZgAlv21qtx27oePbcqVwSj9UhP/1tREMYWA0kJIX6+nGGiY8fFsHja+9vzB5UibGYd2R26HKXVHre8a1unMyNiOfgBnJcECpNVRNCOeMvp3SChzFHpdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQuS9JoO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N74RCf7E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9xfwv1776702
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fC1IUn6KwB7cE9gbM8OK08WkwcHY3uHqXimME7FWq80=; b=JQuS9JoOubMQYBcJ
	q37W9TjodepMPHm9JpnpQimjGZ+UTq6aIH27RqzplUPiXgOuUTcj8gMG49+uIYJe
	Ic9ob3+yDahafMlL7uTSWYg/xR1MlUzEnCciGAmnz5SbdZd+bija7b/PD74kkmVS
	xGGHcA2EYS5RSaS8IeN6OYQ0JH2uZFnFDvLQjt/QHVj0xY3QYLXBRxc2RdBFC+1G
	m5b44S/xebpX+GdoB6yhjlcuHsWgUZIhdYyIRZs7ZA1vRSWzTTECXvHaWAYeu1FP
	cCnOatH5ClQeWJh5iCsbhCcIt2ua4geiyPhTkm1KgTa/9497l7ujSFwk2qU4xrzn
	6g+SmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9w2uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:54:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cff1da5so3596111685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771858476; x=1772463276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fC1IUn6KwB7cE9gbM8OK08WkwcHY3uHqXimME7FWq80=;
        b=N74RCf7El68aWTAAaESpafabM1A/DWRnr0qFZs1ebJax316adTatGhey3h07L6knhm
         AyviOyV5FJYkAiXjI79wpRznkFpkCtKgVi3GBXWwlRkwC/elNtZT5cGQfQTXy2SJsf0h
         OtXAKJmL6xOCUq5YC6wyCYaOYqAE4VJSmfB4UFv3X6rNxlicCLHobRRjFK7/herBrUNZ
         O6RCOTiTkwNZ6AzoTkdP9/mPSMml3mXMk7ZAYRDAkq6FS8KpIPmWYjwUVH4+K+PsZG1t
         +bni63CjB+AnxfolRcJgRPyARq8DWysZbFX9bKraKBDRg1gZtrJNoYdlJHMgpLh2M0Rx
         bQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771858476; x=1772463276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fC1IUn6KwB7cE9gbM8OK08WkwcHY3uHqXimME7FWq80=;
        b=uQUiXEkgemqCxshRU1yEUKpg/lu08vSgd5/F7JN8PXiR26nLpTRFVyySM4SxoQqWoG
         iloUSrMwdMgh2Lgz0GUXwUB3HJHAsND/yFuvImGnIDKTJDFnGS9aTULhal5xD/cVudZQ
         mipIXSB/Tm6AOT8TnAr/+JuObk4JHNvEWlnpPcvHREs2KZyfULXvys9WDQF6xIsbK0cN
         zg6bTKjzNrpd5hfCIKMiQ9zy+E5LVGbeNkWTCcuSq/NYYfe+YuyWZx3eBuz4NoOhOQUu
         Y+B3zKUN7sIpYgE2B04K58Y1ao5ypjyIkgBDQNrBIZCljnsZ9W1tk/EGbrag76CwkYuU
         d/Lg==
X-Gm-Message-State: AOJu0YyKsIlRAqNxy+MKmLAYnuWS7YuqcoYzc9gtfJEUpdmvPAU1b2d0
	C6ZZ3jxuL+n5gRcZHwvoHrExZ+YF4guDfGIlHe1eN2h0ZAFeNhHmeL/UEr/Ho0GyIXlRZxXwEGZ
	bWhoN3AeIJ/0TG4jcTrYOZvfPC/D3baLDJ5CDlzb42h7pBsSoUgTXbCLFnl5gW8krXcdf
X-Gm-Gg: AZuq6aL+v3pAdVxghaOTrAsIJdFzA47z8GfbFSzbtDmduIByR8UDTu+GGlr/PcUDa1/
	YyIoiLYghhGjNOalJuNrzqTEO4642C4/gcWwzPsdsSUqLJdVds5V+qyXfrs2Z5HVdi0NG3vbBBI
	RtuVCT8dQ4/w5qlZCcKF2n53dnU7C+Zd5tVnrFkZs652hzv8y/kVhDdqajxWh/W+NB4cNX5GSNp
	YsPq/PKrH3LknfoOYK2gP5mO9jqw9XOWcnPQobN4m4Zf7ipgMRCoVmb7j0y0QJQlDl4GA/K3Ksa
	vxREnPjKBs14BK5iVLON5wAdJBrpCkJtRLfwYYGZbLAVLrx7Qu6N7vVLbxtZK2fAr9J9dQveWHG
	1yCAwcFH+CsY48oWPKxuGMn0WWMNuL6Nqm6w6Bd8eKlDMtA==
X-Received: by 2002:a05:620a:2946:b0:8c6:a628:8608 with SMTP id af79cd13be357-8cb8c9cde50mr1094338385a.6.1771858476518;
        Mon, 23 Feb 2026 06:54:36 -0800 (PST)
X-Received: by 2002:a05:620a:2946:b0:8c6:a628:8608 with SMTP id af79cd13be357-8cb8c9cde50mr1094335285a.6.1771858476000;
        Mon, 23 Feb 2026 06:54:36 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb0b88esm1646629e87.8.2026.02.23.06.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:54:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 15:54:20 +0100
Subject: [PATCH 4/5] arm64: dts: qcom: qrb4210-rb2: Drop redundant
 non-controllable supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-qcom-dts-supplies-v1-4-f90ac885b3fd@oss.qualcomm.com>
References: <20260223-qcom-dts-supplies-v1-0-f90ac885b3fd@oss.qualcomm.com>
In-Reply-To: <20260223-qcom-dts-supplies-v1-0-f90ac885b3fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3211;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ERKw1P1SrPsBSKsfIVJM3rgcT17mNX4/TLRUGVAThZA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnGoeA32FDTHUwlaw+hf9vjQLubqHb7+VKEgrN
 16gw5LleXWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZxqHgAKCRDBN2bmhouD
 16ndD/9HA3cvh3f286RPyIaz1UQkMF8txX2KaGyzGIRwHLOWJTQbxcbUJf1sS9F3B9VOL+dMu+c
 bInwe6ChA74RTSi56wZ5IExb+e2Q/RpM/foLZ7vzc8sm7VLj+cerCCuWfeReIq4RAIZC2LygXoy
 OuD31wDPQyV5nIW2hD+BgxXePQre9z2HTUosNDuDUGrZBb7zl0DDrspl13seSsOeGtWniYVF3J4
 CzTR51cWGr2Tjm5LK/WuItzE265VMsxNdWg2/PpV30QG3R9f0kbqKzgvL1d4OmlEz+HFoVUaqF5
 Q+o0iWK3+D3kBLwd4U2ewPkXqMVIsTMVXE1TaM9P1vHW5FwsnX09i26cLDus1Thj2Jlv3HMkJCd
 Pya/cU5Ey+JSbbhXK4CSFOL/o3n91Gb4OBg7B4yxoiXMT273twbXZReouvTC601YKsNwcSQnlP2
 adxY3BrzAquNodXf1xtjaZbqql9Ew0JW2QduLQr37fnasuYFnqsW30HuAJPFqMoh2HiI7bpFvr6
 suurRWwM0QaTV1cTpyKvuAdauhnlGQ5tF7zQXJ/6VghKSNTuDeT4LvJ+d4pChnEcZBifEwTlfUf
 59BMPJjo3q0WuhrV8Of6/ZqWY4yV8nZaShHWt8tqrYYF/bVaqVcIl3eiyjH7/nkuOIkZaLEglMj
 QIMIswzQwxzLzqg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEyNyBTYWx0ZWRfX75JQmXF/k+Ww
 FfPeQcDnPOhgJcR/hToaTGGK+Vs34dKWtKWW/aLQsfu8GjhT/3wgCfxm7f96u2jJY49/06rfn+c
 dt1dh+R1Wl3H8tZ0C6lKdVHjJxFiHk2PnWdjIRxvgtjehJPsschsFH20oKsOEkvcYgfgY//0W2a
 Kzm7A+dUmoIcfX8JU4Ff3X+QFcnV8P1NCptFcqRFjPNf7egWl/osLGL+siQeBcCHMzRrpljvMHK
 sFtMZTzY8cgGqBwJZ1OZQxmwuysMx+AjcI4mMpp51jKxFoKqXZnIvQwPvzDrUMF1uDuddWS4ovM
 6bYwu3hmU5JnLoGA6QFYxorHWIi6br3uu5LE4Vkqlq5TjP6R5P8hsJ6I3ZQLVzXouT5c4GB23bu
 0C8Cm1PDydnyJSicVV0DYEDm8a0dxp14nAhAqGtOniPFrvKAv/doln2rYlRSpGYqvwKJ9QDPlY1
 jazvLWtEsiIYRzCLPOg==
X-Proofpoint-GUID: K52gLa_Kr3GVeh-MZ7IcqAqPV9H0hC5H
X-Proofpoint-ORIG-GUID: K52gLa_Kr3GVeh-MZ7IcqAqPV9H0hC5H
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c6a2d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NIZTJDHS3Er4oJbIOtwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93712-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2EB6B1784DC
X-Rspamd-Action: no action

Drop completely redundant non-controllable chain of "regulator-fixed"
supplies, which serve no purpose except growing DTS and kernel boot
time.  They represent no added value and because of being completely
transparent for any users of DTS (except the bloat), they should not be
represented in DTS, just like we do not represent every transistor
there.

They were added to DTS without providing any real reason ("The board
hosts a whole lot of fixed regulators. Describe them.").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I really wish people say in the commit msg WHY they are doing things,
not what...
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 45 --------------------------------
 1 file changed, 45 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 5f8613150bdd..c2142264ad79 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -158,7 +158,6 @@ vreg_hdmi_out_1p2: regulator-hdmi-out-1p2 {
 		regulator-name = "VREG_HDMI_OUT_1P2";
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1200000>;
-		vin-supply = <&vdc_1v2>;
 		regulator-always-on;
 		regulator-boot-on;
 	};
@@ -168,39 +167,6 @@ lt9611_3v3: regulator-lt9611-3v3 {
 		regulator-name = "LT9611_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vdc_3v3>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	/* Main barrel jack input */
-	vdc_12v: regulator-vdc-12v {
-		compatible = "regulator-fixed";
-		regulator-name = "DC_12V";
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	/* 1.2V supply stepped down from the barrel jack input */
-	vdc_1v2: regulator-vdc-1v2 {
-		compatible = "regulator-fixed";
-		regulator-name = "VDC_1V2";
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <1200000>;
-		vin-supply = <&vdc_12v>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	/* 3.3V supply stepped down from the barrel jack input */
-	vdc_3v3: regulator-vdc-3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "VDC_3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vdc_12v>;
 		regulator-always-on;
 		regulator-boot-on;
 	};
@@ -216,23 +182,12 @@ vdc_5v: regulator-vdc-5v {
 		regulator-boot-on;
 	};
 
-	/* "Battery" voltage for the SoM, stepped down from the barrel jack input */
-	vdc_vbat_som: regulator-vdc-vbat {
-		compatible = "regulator-fixed";
-		regulator-name = "VBAT_SOM";
-		regulator-min-microvolt = <4200000>;
-		regulator-max-microvolt = <4200000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
 	/* PMI632 charger out, supplied by VBAT */
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
-		vin-supply = <&vdc_vbat_som>;
 
 		regulator-always-on;
 		regulator-boot-on;

-- 
2.51.0


