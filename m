Return-Path: <linux-arm-msm+bounces-99768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9ivfJzc+w2kFpgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 02:45:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D286831E631
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 02:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D351D3041147
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 01:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A50526F476;
	Wed, 25 Mar 2026 01:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+taRgVT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cT3DU2bk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964391A3157
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 01:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403124; cv=none; b=uQrHw7T5D40box4Wl16nCihb56cY0OTdKu/W1VXVeAK+JAA0xJt7hvIzppiSxSUG9Czr1XXMgv/u+vIQP9lVfykxLJQ+WM8dZ4iSVjxjuHnLbW8Qaj1W+lHoRjwTgV3TwbhlQimRH9HFL5En6Oo+b44PGsQ+Puc9FBZKBl42cDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403124; c=relaxed/simple;
	bh=sedttDXyuXE9uYs7PLyXHQ0et1sdnICphN++CAapsuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OLPfYWxn7Bo7EZ9cOqnYQnOwlEx8oK4L0y+jcXFyMUXr2kVkMk/Yb56slKT0b/6MeYzm/LS6GeTq4WRIxFcA/U9UrE7FcMNOwJdxH1vukkoLSn/Pk47swDiH+jgoEPWAz0IASbYoP6fWD14EafwTaUgtDZBi2ZsgeGdWy3plihQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+taRgVT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cT3DU2bk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJDlsF3984586
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 01:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o5yMmtF4VCeafjNbzr1y30
	pbjKn/1LAEEmBkRSuiEK0=; b=a+taRgVTH/k+D7jHixJpsvyg9cUlgBF41CIWLX
	0XuP6/8rR0Ui1a9e5TExLpAzXLb3dKc5XiogRp4A3F7AW0e6al7sHqylPTP7+241
	kGC294j7sCu7iDcwcoj7yVUBogLNA0T7/b34JElQtHu4PoxrdbQg6EPKR7HDbMYG
	u9GT0JHELoaRqu6R01y0KAQ+MAIr1GoltaF81aaZw1RJNpot++O4NKxiC7Gty4NN
	+xiLBBBSUqPrQJSbBCgxz+eHv9FLgyzXHgvkrsIRoGJ2C28mZ79phNGEBF9qNfeN
	EH7AuDyNetgG/IjCcxKtviXdBmtAlPtWNbQe2d0Jd/YjB0xg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p833r7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 01:45:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50911c94db1so89427151cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 18:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774403121; x=1775007921; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5yMmtF4VCeafjNbzr1y30pbjKn/1LAEEmBkRSuiEK0=;
        b=cT3DU2bkKgM4MtttQXDjbk8HkfiNww/07Ce/vY712XJOjOZiF7eL8432zQeqDm6y3h
         TSWwIea4hZrGDxnkywPC4LTdx4RgQYiYdWmn5PgMTzjc1UYddRDh60dVXw4/mabBmoLI
         diLUWtyZ1J4VpftfrxdN0Hq2zF8nYdNwFbmg2lfIBVHzCLL0bgN0BtavnE5d61KyIM9Y
         3T4p5aes28kEUTqcUHSBAjvNCcYCl/ZDyF0OQv7UzZlNb34mi/po5MFNeBfDa+8s1Ktt
         IjRZ5zqlqwYZiXKQ6RpLnLw9+SeTz88eAJr4HlYdCBa3BCeYaNmpvisP3StKKtYEwoDn
         T3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774403121; x=1775007921;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5yMmtF4VCeafjNbzr1y30pbjKn/1LAEEmBkRSuiEK0=;
        b=Zf2SAYKYN5yOwQEgP91/ch11hqST13suSxcbpHG2vTDVbkRD+kynH9RgyVpHWxGm47
         MYxCcJHcBmLEvrhhN9THzz4doeJtZDqGC/Vhas0qr8jfIf2/T8MF7NhkIQJ490OMhBHI
         O2bTg6mHPHTwIIM928eiK9hqWm/lwvKzptGdOgh0HPdatuuiigN8DSWQqXsX3pdqW7Mw
         XRC0dCA+EbWIvhQZHeD7FpQy3OCT+fysWkeJOmOlmL5GTLiwkslmuear7muY5WqrxUtg
         Lv2hvUu5+E6o9SM7vA+wOFyuKw0S+ZxyS0Mc9/rkFca+t2hc1YUUsODVSknr8zR36H8H
         7JKg==
X-Gm-Message-State: AOJu0YypIHZOnf2pm9ZhyjPX0f4gygwAbWi2okOXzMydJCixEmP+klqq
	SjyjpYDlokjHpjTjhRcYgCDKnqOUUwahbnLmXme8DGUK1RQij0uFKoSZXyfIcVmIZBRL857Ig9l
	p3cPP2Ujty7geuEpyfK1hHs0tlaM1YJOrLygYwrp2rAOM3MBvxMV2NVffLOKk+p4GvYuTnEUfnr
	wX
X-Gm-Gg: ATEYQzx2L6+Fjc6uoiHobfNO3a6MX4pjKJk06TVnqQo0QEWfKjKHYytT0mYgMVoEHB9
	YImEKlOPU3FaPKhH4x41WzBp/DffMINRl9NjCGOYr6irMzMME75w3jyt32epkPPuljHXwP3eL1t
	2JT7HS+cGICVmebiQPXV22JGcy2NieSutq0mP1MnRFmUlif1UIoch2ZBeO+LB456pYwbyHeuoi/
	6qkh4NR5b2LgqcN7s6E58KVPqYMRCxP7KusI1SMeN9EfpySH8EteDC5Zwpavo9kN2gR1Ybx9f/+
	psTUeNsr6nPR6t+ym8EM2j8HWFaYFB+4xZysf8LXt9+Tm7P7K+Zd89rY7Ei6wu0tmi/0yUpEpyo
	O54oAkvbIULmCp3g8j95T19A+FHFX5DYAdhriTTRLgHxw8Nis2g8Niq1noEUa7+Z4CJfn+UQLR5
	Dd+rX3EtpEyRUt7JlK5cDMK3DqKHPMD2AKhUs=
X-Received: by 2002:ac8:5888:0:b0:50b:444c:e268 with SMTP id d75a77b69052e-50b80d2c161mr27668301cf.19.1774403120094;
        Tue, 24 Mar 2026 18:45:20 -0700 (PDT)
X-Received: by 2002:ac8:5888:0:b0:50b:444c:e268 with SMTP id d75a77b69052e-50b80d2c161mr27667851cf.19.1774403119492;
        Tue, 24 Mar 2026 18:45:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207365sm3517017e87.42.2026.03.24.18.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 18:45:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 03:45:12 +0200
Subject: [PATCH] ARM: dts: qcom: drop apq8084 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-drop-8084-dt-v1-1-a0255a404355@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACg+w2kC/yXMTQ5EQBBA4atIrVVSyk9wFbHQupiaBdLNZJKOu
 2ssv8V7Abw4FQ9tEsDJT72uS0SWJjB+hmUWVBsNTFxRziVat25YU12g3bHJyTANPJXGQkw2J5P
 +n13Xv/aH+cq43w84zwvLKotUcAAAAA==
X-Change-ID: 20260325-drop-8084-dt-930b20a2f5bd
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=23227;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sedttDXyuXE9uYs7PLyXHQ0et1sdnICphN++CAapsuU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+ZhO10DLu8GRZuTXRnbzkxTD7dmjPV4XPnJIoKj3qMw7
 C+nxt9ORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEzE6g4Hw6ZnbdmzwuUnPhNZ
 eeW8uF28702550rOjRFfTE/clL+jXP3heWlZZFim0NN3RlrqqWmzrR+FCSmeTdJ5HlxmE+C/6fv
 fJ3ZT2DS4MtruPDmj7KLLL6J6wCb1y4YXlvvXXY7pUcwRWO+57N8Wuc9/Dz/5PvG9yFy2JPclTx
 jalK3tn+3PtjsYzCd78dz1LYtCcnJn1Ca+2MIUOUuDSe157Lo2wUlXlt9kTJnLn3Vjr5jTpMMHX
 ut6S3DrXNFa+0viw61HbzQuJrjMKWV65RDVG8a4rUiiap0Zs0zi9B6bhg6eBbEXtcsihHTU1PZ3
 BdW9+ccZkN53v/LXPGMTnqbWw9Xza859/bMhyPTCyqo3AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAxMSBTYWx0ZWRfXxlKyPTeOHNXt
 rP27rWfJdgRTuTd4crtoGNh4sOFEDFscwPJP8zss6ltaYV2yte0Nx4Pk4z9YV2RRTCaeWBpUXdc
 0GBnGOa+RWLRgEQVcJ/bP4OBagf+VPqninwEXCvnx4CcFROIUFtzUxCtfmjod6DQL6PveV3ONaM
 wGNziuSzqUT6/oFPanxL95oNuWsLCpJjUvBFL7J9Lbw6o+eeVehosxM9VaK82Z2/aPugIpSKA9V
 UoC3IGvIlKoLwrup+fJgSO2ho03fOghdv87tGmqZMVe3tjJN7TP8GFxd58BVWb8qApA20n4ngd2
 Sua/PMCt9PlT4+I1hXI01UuRVoZlwL7YvdcEi7gP6OCoFt8cqLFE5JTVGXN5fJ3szu1wVydLQig
 k+MZyBJAq3SU+0ulGhwY0OtM7b+SdeXJqB+8XSPJUseaQRgNsQMFb2X/91wcLAYflrnXJpL26Sp
 FMcWkvaCW3jybo52J9Q==
X-Proofpoint-ORIG-GUID: mEgwLH0jc3J8dnfmVLE_7KgRZuZbRe7u
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c33e32 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ZGa7GEyFjCgo-S8m2JkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: mEgwLH0jc3J8dnfmVLE_7KgRZuZbRe7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250011
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99768-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D286831E631
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

APQ8084 is one of the platforms which gained very little interest
upstream. It doesn't look like the there was any interest in these
devices since December 2019. Two devices supported upstream have very
minumal DT files. Start forgetting about the platform by
removing DT files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
... and start dropping APQ8084-related drivers in +1 or +2 releases, if
nobody objects.
---
 arch/arm/boot/dts/qcom/Makefile                 |   2 -
 arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts |  34 -
 arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts     |  23 -
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi        | 852 ------------------------
 4 files changed, 911 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index c7873dcef154..32a44b02d2fa 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -14,8 +14,6 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-apq8064-asus-nexus7-flo.dtb \
 	qcom-apq8064-lg-nexus4-mako.dtb \
 	qcom-apq8074-dragonboard.dtb \
-	qcom-apq8084-ifc6540.dtb \
-	qcom-apq8084-mtp.dtb \
 	qcom-ipq4018-ap120c-ac.dtb \
 	qcom-ipq4018-ap120c-ac-bit.dtb \
 	qcom-ipq4018-jalapeno.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts b/arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts
deleted file mode 100644
index 1df24c922be9..000000000000
--- a/arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts
+++ /dev/null
@@ -1,34 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include "qcom-apq8084.dtsi"
-#include "pma8084.dtsi"
-
-/ {
-	model = "Qualcomm APQ8084/IFC6540";
-	compatible = "qcom,apq8084-sbc", "qcom,apq8084";
-
-	aliases {
-		serial0 = &blsp2_uart2;
-		usid0 = &pma8084_0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	soc {
-		serial@f995e000 {
-			status = "okay";
-		};
-	};
-};
-
-&sdhc_1 {
-	bus-width = <8>;
-	non-removable;
-	status = "okay";
-};
-
-&sdhc_2 {
-	cd-gpios = <&tlmm 122 GPIO_ACTIVE_LOW>;
-	bus-width = <4>;
-};
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts b/arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts
deleted file mode 100644
index d4e6aee034af..000000000000
--- a/arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts
+++ /dev/null
@@ -1,23 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include "qcom-apq8084.dtsi"
-#include "pma8084.dtsi"
-
-/ {
-	model = "Qualcomm APQ 8084-MTP";
-	compatible = "qcom,apq8084-mtp", "qcom,apq8084";
-
-	aliases {
-		serial0 = &blsp2_uart2;
-		usid0 = &pma8084_0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	soc {
-		serial@f995e000 {
-			status = "okay";
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
deleted file mode 100644
index cee0694ef127..000000000000
--- a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
+++ /dev/null
@@ -1,852 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/dts-v1/;
-
-#include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/clock/qcom,gcc-apq8084.h>
-#include <dt-bindings/gpio/gpio.h>
-
-/ {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	model = "Qualcomm APQ 8084";
-	compatible = "qcom,apq8084";
-	interrupt-parent = <&intc>;
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		smem_mem: smem-region@fa00000 {
-			reg = <0xfa00000 0x200000>;
-			no-map;
-		};
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu@0 {
-			device_type = "cpu";
-			compatible = "qcom,krait";
-			reg = <0>;
-			enable-method = "qcom,kpss-acc-v2";
-			next-level-cache = <&l2>;
-			qcom,acc = <&acc0>;
-			qcom,saw = <&saw0>;
-			cpu-idle-states = <&cpu_spc>;
-		};
-
-		cpu@1 {
-			device_type = "cpu";
-			compatible = "qcom,krait";
-			reg = <1>;
-			enable-method = "qcom,kpss-acc-v2";
-			next-level-cache = <&l2>;
-			qcom,acc = <&acc1>;
-			qcom,saw = <&saw1>;
-			cpu-idle-states = <&cpu_spc>;
-		};
-
-		cpu@2 {
-			device_type = "cpu";
-			compatible = "qcom,krait";
-			reg = <2>;
-			enable-method = "qcom,kpss-acc-v2";
-			next-level-cache = <&l2>;
-			qcom,acc = <&acc2>;
-			qcom,saw = <&saw2>;
-			cpu-idle-states = <&cpu_spc>;
-		};
-
-		cpu@3 {
-			device_type = "cpu";
-			compatible = "qcom,krait";
-			reg = <3>;
-			enable-method = "qcom,kpss-acc-v2";
-			next-level-cache = <&l2>;
-			qcom,acc = <&acc3>;
-			qcom,saw = <&saw3>;
-			cpu-idle-states = <&cpu_spc>;
-		};
-
-		l2: l2-cache {
-			compatible = "cache";
-			cache-level = <2>;
-			cache-unified;
-			qcom,saw = <&saw_l2>;
-		};
-
-		idle-states {
-			cpu_spc: cpu-spc {
-				compatible = "qcom,idle-state-spc",
-						"arm,idle-state";
-				entry-latency-us = <150>;
-				exit-latency-us = <200>;
-				min-residency-us = <2000>;
-			};
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
-	firmware {
-		scm {
-			compatible = "qcom,scm-apq8084", "qcom,scm";
-			clocks = <&gcc GCC_CE1_CLK> , <&gcc GCC_CE1_AXI_CLK>, <&gcc GCC_CE1_AHB_CLK>;
-			clock-names = "core", "bus", "iface";
-		};
-	};
-
-	thermal-zones {
-		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
-			thermal-sensors = <&tsens 5>;
-
-			trips {
-				cpu_alert0: trip0 {
-					temperature = <75000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-				cpu_crit0: trip1 {
-					temperature = <110000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
-		};
-
-		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
-			thermal-sensors = <&tsens 6>;
-
-			trips {
-				cpu_alert1: trip0 {
-					temperature = <75000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-				cpu_crit1: trip1 {
-					temperature = <110000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
-		};
-
-		cpu2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
-			thermal-sensors = <&tsens 7>;
-
-			trips {
-				cpu_alert2: trip0 {
-					temperature = <75000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-				cpu_crit2: trip1 {
-					temperature = <110000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
-		};
-
-		cpu3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
-			thermal-sensors = <&tsens 8>;
-
-			trips {
-				cpu_alert3: trip0 {
-					temperature = <75000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-				cpu_crit3: trip1 {
-					temperature = <110000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
-		};
-	};
-
-	cpu-pmu {
-		compatible = "qcom,krait-pmu";
-		interrupts = <GIC_PPI 7 0xf04>;
-	};
-
-	clocks {
-		xo_board: xo_board {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <19200000>;
-		};
-
-		sleep_clk: sleep_clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
-	};
-
-	timer {
-		compatible = "arm,armv7-timer";
-		interrupts = <GIC_PPI 2 0xf08>,
-			     <GIC_PPI 3 0xf08>,
-			     <GIC_PPI 4 0xf08>,
-			     <GIC_PPI 1 0xf08>;
-		clock-frequency = <19200000>;
-	};
-
-	smem {
-		compatible = "qcom,smem";
-
-		qcom,rpm-msg-ram = <&rpm_msg_ram>;
-		memory-region = <&smem_mem>;
-
-		hwlocks = <&tcsr_mutex 3>;
-	};
-
-	soc: soc {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-		compatible = "simple-bus";
-
-		intc: interrupt-controller@f9000000 {
-			compatible = "qcom,msm-qgic2";
-			interrupt-controller;
-			#interrupt-cells = <3>;
-			reg = <0xf9000000 0x1000>,
-			      <0xf9002000 0x1000>;
-		};
-
-		apcs: syscon@f9011000 {
-			compatible = "syscon";
-			reg = <0xf9011000 0x1000>;
-		};
-
-		sram@fc190000 {
-			compatible = "qcom,apq8084-rpm-stats";
-			reg = <0xfc190000 0x10000>;
-		};
-
-		qfprom: efuse@fc4bc000 {
-			compatible = "qcom,apq8084-qfprom", "qcom,qfprom";
-			reg = <0xfc4bc000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			tsens_base1: base1@d0 {
-				reg = <0xd0 0x1>;
-				bits = <0 8>;
-			};
-
-			tsens_s0_p1: s0-p1@d1 {
-				reg = <0xd1 0x1>;
-				bits = <0 6>;
-			};
-
-			tsens_s1_p1: s1-p1@d2 {
-				reg = <0xd1 0x2>;
-				bits = <6 6>;
-			};
-
-			tsens_s2_p1: s2-p1@d2 {
-				reg = <0xd2 0x2>;
-				bits = <4 6>;
-			};
-
-			tsens_s3_p1: s3-p1@d3 {
-				reg = <0xd3 0x1>;
-				bits = <2 6>;
-			};
-
-			tsens_s4_p1: s4-p1@d4 {
-				reg = <0xd4 0x1>;
-				bits = <0 6>;
-			};
-
-			tsens_s5_p1: s5-p1@d4 {
-				reg = <0xd4 0x2>;
-				bits = <6 6>;
-			};
-
-			tsens_s6_p1: s6-p1@d5 {
-				reg = <0xd5 0x2>;
-				bits = <4 6>;
-			};
-
-			tsens_s7_p1: s7-p1@d6 {
-				reg = <0xd6 0x1>;
-				bits = <2 6>;
-			};
-
-			tsens_s8_p1: s8-p1@d7 {
-				reg = <0xd7 0x1>;
-				bits = <0 6>;
-			};
-
-			tsens_mode: mode@d7 {
-				reg = <0xd7 0x1>;
-				bits = <6 2>;
-			};
-
-			tsens_s9_p1: s9-p1@d8 {
-				reg = <0xd8 0x1>;
-				bits = <0 6>;
-			};
-
-			tsens_s10_p1: s10-p1@d8 {
-				reg = <0xd8 0x2>;
-				bits = <6 6>;
-			};
-
-			tsens_base2: base2@d9 {
-				reg = <0xd9 0x2>;
-				bits = <4 8>;
-			};
-
-			tsens_s0_p2: s0-p2@da {
-				reg = <0xda 0x2>;
-				bits = <4 6>;
-			};
-
-			tsens_s1_p2: s1-p2@db {
-				reg = <0xdb 0x1>;
-				bits = <2 6>;
-			};
-
-			tsens_s2_p2: s2-p2@dc {
-				reg = <0xdc 0x1>;
-				bits = <0 6>;
-			};
-
-			tsens_s3_p2: s3-p2@dc {
-				reg = <0xdc 0x2>;
-				bits = <6 6>;
-			};
-
-			tsens_s4_p2: s4-p2@dd {
-				reg = <0xdd 0x2>;
-				bits = <4 6>;
-			};
-
-			tsens_s5_p2: s5-p2@de {
-				reg = <0xde 0x2>;
-				bits = <2 6>;
-			};
-
-			tsens_s6_p2: s6-p2@df {
-				reg = <0xdf 0x1>;
-				bits = <0 6>;
-			};
-
-			tsens_s7_p2: s7-p2@e0 {
-				reg = <0xe0 0x1>;
-				bits = <0 6>;
-			};
-
-			tsens_s8_p2: s8-p2@e0 {
-				reg = <0xe0 0x2>;
-				bits = <6 6>;
-			};
-
-			tsens_s9_p2: s9-p2@e1 {
-				reg = <0xe1 0x2>;
-				bits = <4 6>;
-			};
-
-			tsens_s10_p2: s10-p2@e2 {
-				reg = <0xe2 0x2>;
-				bits = <2 6>;
-			};
-
-			tsens_s5_p2_backup: s5-p2-backup@e3 {
-				reg = <0xe3 0x2>;
-				bits = <0 6>;
-			};
-
-			tsens_mode_backup: mode-backup@e3 {
-				reg = <0xe3 0x1>;
-				bits = <6 2>;
-			};
-
-			tsens_s6_p2_backup: s6-p2-backup@e4 {
-				reg = <0xe4 0x1>;
-				bits = <0 6>;
-			};
-
-			tsens_s7_p2_backup: s7-p2-backup@e4 {
-				reg = <0xe4 0x2>;
-				bits = <6 6>;
-			};
-
-			tsens_s8_p2_backup: s8-p2-backup@e5 {
-				reg = <0xe5 0x2>;
-				bits = <4 6>;
-			};
-
-			tsens_s9_p2_backup: s9-p2-backup@e6 {
-				reg = <0xe6 0x2>;
-				bits = <2 6>;
-			};
-
-			tsens_s10_p2_backup: s10-p2-backup@e7 {
-				reg = <0xe7 0x1>;
-				bits = <0 6>;
-			};
-
-			tsens_base1_backup: base1-backup@440 {
-				reg = <0x440 0x1>;
-				bits = <0 8>;
-			};
-
-			tsens_s0_p1_backup: s0-p1-backup@441 {
-				reg = <0x441 0x1>;
-				bits = <0 6>;
-			};
-
-			tsens_s1_p1_backup: s1-p1-backup@442 {
-				reg = <0x441 0x2>;
-				bits = <6 6>;
-			};
-
-			tsens_s2_p1_backup: s2-p1-backup@442 {
-				reg = <0x442 0x2>;
-				bits = <4 6>;
-			};
-
-			tsens_s3_p1_backup: s3-p1-backup@443 {
-				reg = <0x443 0x1>;
-				bits = <2 6>;
-			};
-
-			tsens_s4_p1_backup: s4-p1-backup@444 {
-				reg = <0x444 0x1>;
-				bits = <0 6>;
-			};
-
-			tsens_s5_p1_backup: s5-p1-backup@444 {
-				reg = <0x444 0x2>;
-				bits = <6 6>;
-			};
-
-			tsens_s6_p1_backup: s6-p1-backup@445 {
-				reg = <0x445 0x2>;
-				bits = <4 6>;
-			};
-
-			tsens_s7_p1_backup: s7-p1-backup@446 {
-				reg = <0x446 0x1>;
-				bits = <2 6>;
-			};
-
-			tsens_use_backup: use-backup@447 {
-				reg = <0x447 0x1>;
-				bits = <5 3>;
-			};
-
-			tsens_s8_p1_backup: s8-p1-backup@448 {
-				reg = <0x448 0x1>;
-				bits = <0 6>;
-			};
-
-			tsens_s9_p1_backup: s9-p1-backup@448 {
-				reg = <0x448 0x2>;
-				bits = <6 6>;
-			};
-
-			tsens_s10_p1_backup: s10-p1-backup@449 {
-				reg = <0x449 0x2>;
-				bits = <4 6>;
-			};
-
-			tsens_base2_backup: base2-backup@44a {
-				reg = <0x44a 0x2>;
-				bits = <2 8>;
-			};
-
-			tsens_s0_p2_backup: s0-p2-backup@44b {
-				reg = <0x44b 0x3>;
-				bits = <2 6>;
-			};
-
-			tsens_s1_p2_backup: s1-p2-backup@44c {
-				reg = <0x44c 0x1>;
-				bits = <0 6>;
-			};
-
-			tsens_s2_p2_backup: s2-p2-backup@44c {
-				reg = <0x44c 0x2>;
-				bits = <6 6>;
-			};
-
-			tsens_s3_p2_backup: s3-p2-backup@44d {
-				reg = <0x44d 0x2>;
-				bits = <4 6>;
-			};
-
-			tsens_s4_p2_backup: s4-p2-backup@44e {
-				reg = <0x44e 0x1>;
-				bits = <2 6>;
-			};
-		};
-
-		tsens: thermal-sensor@fc4a9000 {
-			compatible = "qcom,msm8974-tsens", "qcom,tsens-v0_1";
-			reg = <0xfc4a9000 0x1000>, /* TM */
-			      <0xfc4a8000 0x1000>; /* SROT */
-			nvmem-cells = <&tsens_mode>,
-				      <&tsens_base1>, <&tsens_base2>,
-				      <&tsens_use_backup>,
-				      <&tsens_mode_backup>,
-				      <&tsens_base1_backup>, <&tsens_base2_backup>,
-				      <&tsens_s0_p1>, <&tsens_s0_p2>,
-				      <&tsens_s1_p1>, <&tsens_s1_p2>,
-				      <&tsens_s2_p1>, <&tsens_s2_p2>,
-				      <&tsens_s3_p1>, <&tsens_s3_p2>,
-				      <&tsens_s4_p1>, <&tsens_s4_p2>,
-				      <&tsens_s5_p1>, <&tsens_s5_p2>,
-				      <&tsens_s6_p1>, <&tsens_s6_p2>,
-				      <&tsens_s7_p1>, <&tsens_s7_p2>,
-				      <&tsens_s8_p1>, <&tsens_s8_p2>,
-				      <&tsens_s9_p1>, <&tsens_s9_p2>,
-				      <&tsens_s10_p1>, <&tsens_s10_p2>,
-				      <&tsens_s0_p1_backup>, <&tsens_s0_p2_backup>,
-				      <&tsens_s1_p1_backup>, <&tsens_s1_p2_backup>,
-				      <&tsens_s2_p1_backup>, <&tsens_s2_p2_backup>,
-				      <&tsens_s3_p1_backup>, <&tsens_s3_p2_backup>,
-				      <&tsens_s4_p1_backup>, <&tsens_s4_p2_backup>,
-				      <&tsens_s5_p1_backup>, <&tsens_s5_p2_backup>,
-				      <&tsens_s6_p1_backup>, <&tsens_s6_p2_backup>,
-				      <&tsens_s7_p1_backup>, <&tsens_s7_p2_backup>,
-				      <&tsens_s8_p1_backup>, <&tsens_s8_p2_backup>,
-				      <&tsens_s9_p1_backup>, <&tsens_s9_p2_backup>,
-				      <&tsens_s10_p1_backup>, <&tsens_s10_p2_backup>;
-			nvmem-cell-names = "mode",
-					   "base1", "base2",
-					   "use_backup",
-					   "mode_backup",
-					   "base1_backup", "base2_backup",
-					   "s0_p1", "s0_p2",
-					   "s1_p1", "s1_p2",
-					   "s2_p1", "s2_p2",
-					   "s3_p1", "s3_p2",
-					   "s4_p1", "s4_p2",
-					   "s5_p1", "s5_p2",
-					   "s6_p1", "s6_p2",
-					   "s7_p1", "s7_p2",
-					   "s8_p1", "s8_p2",
-					   "s9_p1", "s9_p2",
-					   "s10_p1", "s10_p2",
-					   "s0_p1_backup", "s0_p2_backup",
-					   "s1_p1_backup", "s1_p2_backup",
-					   "s2_p1_backup", "s2_p2_backup",
-					   "s3_p1_backup", "s3_p2_backup",
-					   "s4_p1_backup", "s4_p2_backup",
-					   "s5_p1_backup", "s5_p2_backup",
-					   "s6_p1_backup", "s6_p2_backup",
-					   "s7_p1_backup", "s7_p2_backup",
-					   "s8_p1_backup", "s8_p2_backup",
-					   "s9_p1_backup", "s9_p2_backup",
-					   "s10_p1_backup", "s10_p2_backup";
-			#qcom,sensors = <11>;
-			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
-			#thermal-sensor-cells = <1>;
-		};
-		timer@f9020000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			compatible = "arm,armv7-timer-mem";
-			reg = <0xf9020000 0x1000>;
-			clock-frequency = <19200000>;
-
-			frame@f9021000 {
-				frame-number = <0>;
-				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xf9021000 0x1000>,
-				      <0xf9022000 0x1000>;
-			};
-
-			frame@f9023000 {
-				frame-number = <1>;
-				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xf9023000 0x1000>;
-				status = "disabled";
-			};
-
-			frame@f9024000 {
-				frame-number = <2>;
-				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xf9024000 0x1000>;
-				status = "disabled";
-			};
-
-			frame@f9025000 {
-				frame-number = <3>;
-				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xf9025000 0x1000>;
-				status = "disabled";
-			};
-
-			frame@f9026000 {
-				frame-number = <4>;
-				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xf9026000 0x1000>;
-				status = "disabled";
-			};
-
-			frame@f9027000 {
-				frame-number = <5>;
-				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xf9027000 0x1000>;
-				status = "disabled";
-			};
-
-			frame@f9028000 {
-				frame-number = <6>;
-				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xf9028000 0x1000>;
-				status = "disabled";
-			};
-		};
-
-		saw0: power-manager@f9089000 {
-			compatible = "qcom,apq8084-saw2-v2.1-cpu", "qcom,saw2";
-			reg = <0xf9089000 0x1000>, <0xf9009000 0x1000>;
-		};
-
-		saw1: power-manager@f9099000 {
-			compatible = "qcom,apq8084-saw2-v2.1-cpu", "qcom,saw2";
-			reg = <0xf9099000 0x1000>, <0xf9009000 0x1000>;
-		};
-
-		saw2: power-manager@f90a9000 {
-			compatible = "qcom,apq8084-saw2-v2.1-cpu", "qcom,saw2";
-			reg = <0xf90a9000 0x1000>, <0xf9009000 0x1000>;
-		};
-
-		saw3: power-manager@f90b9000 {
-			compatible = "qcom,apq8084-saw2-v2.1-cpu", "qcom,saw2";
-			reg = <0xf90b9000 0x1000>, <0xf9009000 0x1000>;
-		};
-
-		saw_l2: power-manager@f9012000 {
-			compatible = "qcom,apq8084-saw2-v2.1-l2", "qcom,saw2";
-			reg = <0xf9012000 0x1000>;
-		};
-
-		acc0: power-manager@f9088000 {
-			compatible = "qcom,kpss-acc-v2";
-			reg = <0xf9088000 0x1000>,
-			      <0xf9008000 0x1000>;
-		};
-
-		acc1: power-manager@f9098000 {
-			compatible = "qcom,kpss-acc-v2";
-			reg = <0xf9098000 0x1000>,
-			      <0xf9008000 0x1000>;
-		};
-
-		acc2: power-manager@f90a8000 {
-			compatible = "qcom,kpss-acc-v2";
-			reg = <0xf90a8000 0x1000>,
-			      <0xf9008000 0x1000>;
-		};
-
-		acc3: power-manager@f90b8000 {
-			compatible = "qcom,kpss-acc-v2";
-			reg = <0xf90b8000 0x1000>,
-			      <0xf9008000 0x1000>;
-		};
-
-		restart@fc4ab000 {
-			compatible = "qcom,pshold";
-			reg = <0xfc4ab000 0x4>;
-		};
-
-		gcc: clock-controller@fc400000 {
-			compatible = "qcom,gcc-apq8084";
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-			reg = <0xfc400000 0x4000>;
-			clocks = <&xo_board>,
-				 <&sleep_clk>,
-				 <0>, /* ufs */
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>, /* sata */
-				 <0>,
-				 <0>; /* pcie */
-			clock-names = "xo",
-				      "sleep_clk",
-				      "ufs_rx_symbol_0_clk_src",
-				      "ufs_rx_symbol_1_clk_src",
-				      "ufs_tx_symbol_0_clk_src",
-				      "ufs_tx_symbol_1_clk_src",
-				      "sata_asic0_clk",
-				      "sata_rx_clk",
-				      "pcie_pipe";
-		};
-
-		tcsr_mutex: hwlock@fd484000 {
-			compatible = "qcom,apq8084-tcsr-mutex", "qcom,tcsr-mutex";
-			reg = <0xfd484000 0x1000>;
-			#hwlock-cells = <1>;
-		};
-
-		rpm_msg_ram: sram@fc428000 {
-			compatible = "qcom,rpm-msg-ram";
-			reg = <0xfc428000 0x4000>;
-		};
-
-		tlmm: pinctrl@fd510000 {
-			compatible = "qcom,apq8084-pinctrl";
-			reg = <0xfd510000 0x4000>;
-			gpio-controller;
-			gpio-ranges = <&tlmm 0 0 147>;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		blsp2_uart2: serial@f995e000 {
-			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
-			reg = <0xf995e000 0x1000>;
-			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
-			clock-names = "core", "iface";
-			status = "disabled";
-		};
-
-		sdhc_1: mmc@f9824900 {
-			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
-			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;
-			reg-names = "hc", "core";
-			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hc_irq", "pwr_irq";
-			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
-				 <&gcc GCC_SDCC1_APPS_CLK>,
-				 <&xo_board>;
-			clock-names = "iface", "core", "xo";
-			status = "disabled";
-		};
-
-		sdhc_2: mmc@f98a4900 {
-			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
-			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
-			reg-names = "hc", "core";
-			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hc_irq", "pwr_irq";
-			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
-				 <&gcc GCC_SDCC2_APPS_CLK>,
-				 <&xo_board>;
-			clock-names = "iface", "core", "xo";
-			status = "disabled";
-		};
-
-		spmi_bus: spmi@fc4cf000 {
-			compatible = "qcom,spmi-pmic-arb";
-			reg-names = "core", "intr", "cnfg";
-			reg = <0xfc4cf000 0x1000>,
-			      <0xfc4cb000 0x1000>,
-			      <0xfc4ca000 0x1000>;
-			interrupt-names = "periph_irq";
-			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
-			qcom,ee = <0>;
-			qcom,channel = <0>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-			interrupt-controller;
-			#interrupt-cells = <4>;
-		};
-	};
-
-	rpm: remoteproc {
-		compatible = "qcom,apq8084-rpm-proc", "qcom,rpm-proc";
-
-		smd-edge {
-			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
-			qcom,ipc = <&apcs 8 0>;
-			qcom,smd-edge = <15>;
-
-			rpm-requests {
-				compatible = "qcom,rpm-apq8084", "qcom,smd-rpm";
-				qcom,smd-channels = "rpm_requests";
-
-				regulators-0 {
-					compatible = "qcom,rpm-pma8084-regulators";
-
-					pma8084_s1: s1 {};
-					pma8084_s2: s2 {};
-					pma8084_s3: s3 {};
-					pma8084_s4: s4 {};
-					pma8084_s5: s5 {};
-					pma8084_s6: s6 {};
-					pma8084_s7: s7 {};
-					pma8084_s8: s8 {};
-					pma8084_s9: s9 {};
-					pma8084_s10: s10 {};
-					pma8084_s11: s11 {};
-					pma8084_s12: s12 {};
-
-					pma8084_l1: l1 {};
-					pma8084_l2: l2 {};
-					pma8084_l3: l3 {};
-					pma8084_l4: l4 {};
-					pma8084_l5: l5 {};
-					pma8084_l6: l6 {};
-					pma8084_l7: l7 {};
-					pma8084_l8: l8 {};
-					pma8084_l9: l9 {};
-					pma8084_l10: l10 {};
-					pma8084_l11: l11 {};
-					pma8084_l12: l12 {};
-					pma8084_l13: l13 {};
-					pma8084_l14: l14 {};
-					pma8084_l15: l15 {};
-					pma8084_l16: l16 {};
-					pma8084_l17: l17 {};
-					pma8084_l18: l18 {};
-					pma8084_l19: l19 {};
-					pma8084_l20: l20 {};
-					pma8084_l21: l21 {};
-					pma8084_l22: l22 {};
-					pma8084_l23: l23 {};
-					pma8084_l24: l24 {};
-					pma8084_l25: l25 {};
-					pma8084_l26: l26 {};
-					pma8084_l27: l27 {};
-
-					pma8084_lvs1: lvs1 {};
-					pma8084_lvs2: lvs2 {};
-					pma8084_lvs3: lvs3 {};
-					pma8084_lvs4: lvs4 {};
-
-					pma8084_5vs1: 5vs1 {};
-				};
-			};
-		};
-	};
-};

---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260325-drop-8084-dt-930b20a2f5bd

Best regards,
--  
With best wishes
Dmitry


