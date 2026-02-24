Return-Path: <linux-arm-msm+bounces-93982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNN9EkSWnWnKQgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:15:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D96186CD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86B4630ACBE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC63D38E5DB;
	Tue, 24 Feb 2026 12:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="napQBI9S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+SYpoI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB5838E5C6
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935229; cv=none; b=QWD8xYUnry0Zu/aSIoIt0H+te5rLxfCrGc19RzKZwNsZPKZHl6UV4rHPjc8dGITty2y1KMh8RvuDQ1CWJpvKqBGWVzC7ATTkPmyX/Y9Xqa23XcDZg6zN1Bu9Z4EYR7XzdOPi9aGX3kp74r9EXQihWFi+4k6y4m1CTcYfziUQMrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935229; c=relaxed/simple;
	bh=KrfsDkJ51crOag74tDuDJuwn3X57aIfLRX8FW1z/WC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TFwcF6iYH9doIExvYwoMSuYIQ1SHC2PY7SG7mqYXylhta8B+AGogLdzs9Z6aNpBtVk74iOaPwHuvYoekQNV9mVKVcEKOYpnwoYTzTIKKKR2nSeP4xa7UClHeVLkdlEmfQ94dNYrOcRaYTgL7hbRl0qQ0QkjxXptEWpFS+9R3274=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=napQBI9S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+SYpoI0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFOuB3884272
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rsf0DqTiAeAvFiPy4XK71YO1/e1ldijVpIAeRbQWK3g=; b=napQBI9SK9ifmBYG
	zXDc7gN0ZMJb9o29qRMBQcuddDCwQ5A//kRTQvdwN4U8h8ksqwB1xAnchvy8UBI7
	OpPqs95jwbVpCBkhX+SJAmKluonfNOuXEYev7X5FcrMk78b6PTo4yYSN+uX/qwMI
	VoGSnlWG0BZ5oP2q+ur3A4hQWlNA9brUlPsGDeH5LQoZ85ETxQUm03ekaJTRTdUT
	KGP6M4KltxFF6zFK4dwXVi60J8dNGo8FkQErNcH+bWgRCilFdLgWzx0/XpWaM/k1
	WL5Gu8snD0oxGxI9cVOLY9KN0TRo1E/OtBjVD2K2OdI5G/TTGaosJX7+d9Pe2XJw
	9GO0FA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8u2jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:13:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4b8e9112so481975685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771935225; x=1772540025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsf0DqTiAeAvFiPy4XK71YO1/e1ldijVpIAeRbQWK3g=;
        b=b+SYpoI0iGNfc/2GUA+FsIBx7pNpZvBTtYtTXascqJndjLoV8q85vRAn6HDtX08GWL
         EWjO5T7lnvAW321D0Q3PZ37pc0eh6AJCm4Hb8KnuUn3RZD/H72MDtnKnvkVhDu6aw5L8
         4eBy7Vou5G03wGMsCij+FUKiJpmoK0xO5p/jSS/tyV7T+2mhKtXPikG5pR7hP52BtxfP
         cU6Oz/3wEVidmjAzdfa/nSt1U9lwMn04tvkrfJpnwbQhH4cleQBMgZGdkruM5UsIhXlv
         qR7o/4KIz9w9/dIVuR+uiLObA9IJYcUVBxzElMIi1wSYFymLeSGin7GSW4jKkwYM4sQT
         abKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771935225; x=1772540025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rsf0DqTiAeAvFiPy4XK71YO1/e1ldijVpIAeRbQWK3g=;
        b=W+9Nf+sPqmVcEVJ4opgIe3hbhoFPOrnPE1pHHR1Nm5IPY6Fdb5ddU89ziDcbFa8nz8
         L5CN+XIjrgQzJ015QocgwIcNcp93Rf5n7sFa8l0+MFvungJkm+XH2KrsN/B/Nt4S/mDC
         jU+z0njcuoUKGEeA2UYhcHfU7wT71COy3Kc59lG/NW2+HLf4FmJACA4aB9tZyIKKZK0A
         S8RhR4J2K4Zig+NABbec7A2laZqnApr2tdQFbowk2kT1pckPdt2P4a0Mo3x+Uqy7U0SN
         A9TO6mf5UnwGvS0UoNxlIwE8b67KTe5F+5ww8yKGOR6p2r5kaWJml9nwSSpMo3RLPWvu
         QvDw==
X-Gm-Message-State: AOJu0YzCNjPSqiEYk3whfH+GqauOHW2zDQyOKTRF2KB6j+TJUPWBOpJV
	TqWePFkzTQjWb/FvIwcX8L3XzbNWwE+cV+heTxMeoZyKk6hWU/n9S+rI6oNgXwsYeHStUEVoJ0X
	0PknFGfxZDiPEeZWJWAYS7PlSRZ5RDEAblsGici8B6xqE20Hh1CV457U0tt4Q7rdj2NV4
X-Gm-Gg: AZuq6aKsJzy6f8kcfIV7nQO7iVAyMIXkSa9kSjY+LzCEZ/xhoRFjmV/XLVoqfLsz46h
	t3S9hm+ar4H3E7H7RQFznkMYF7UJs3B34vBQiHvtjRj6u3pK+leI3QODoE0bsSl1ae4lZpsgvdg
	L/0SVrRlAyWrtdGwYGsBy5yB3b+ztfQHkl3JP21npj+AWNqxDzlYtIHzEKi3j/1TS35x1HqsxCY
	y6zt8XYGk6ikAVX6tETDdL0OiIKZa2WVCAHQFoNqnta/DkRf6Xxap33iNYI+1lSxnl7LgNjEx2m
	/CP803spBdkeapn3rvRPzpRs4YENl0wuYcDWCHxdzb7t7yLtfpozpqF8R1Ml+PvSs/9h1uaqbCS
	DI7vkpKCPjGJ6hjvm0/QpCYWvX4NV8w==
X-Received: by 2002:a05:620a:7082:b0:8c7:f55:2062 with SMTP id af79cd13be357-8cb8ca82021mr1388727485a.61.1771935224816;
        Tue, 24 Feb 2026 04:13:44 -0800 (PST)
X-Received: by 2002:a05:620a:7082:b0:8c7:f55:2062 with SMTP id af79cd13be357-8cb8ca82021mr1388721585a.61.1771935224149;
        Tue, 24 Feb 2026 04:13:44 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9cb4bb3sm262741255e9.14.2026.02.24.04.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 04:13:43 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 14:13:27 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: eliza: Enable Eliza MTP board
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-eliza-base-dt-v1-3-54e8e3a5fe43@oss.qualcomm.com>
References: <20260224-eliza-base-dt-v1-0-54e8e3a5fe43@oss.qualcomm.com>
In-Reply-To: <20260224-eliza-base-dt-v1-0-54e8e3a5fe43@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=12311;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=KrfsDkJ51crOag74tDuDJuwn3X57aIfLRX8FW1z/WC8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnZXv8ho+WfREbYuqFug2OBHc5NXYPEqAaEmzF
 um+vuDEpm6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZ2V7wAKCRAbX0TJAJUV
 VqPxEACIYIQgSCmYgQ58l+lpcjGDGo2k1klVnwCBaptLx4de12zKeKQRo2CW5DizegqMwoKbZcx
 zuNADyLBugdzueakwnjPQHvuhpuZO9lDlFVdd/D5QGdDx/dmQv/mfzKtdxMpNgkGlNYwqWGkERC
 dzlcDz9XEai2osXqzpYw8x1YQgmqAQ2NMjh9w7JB6iO9IvHtylmItQXTb1jmkXkmMab6CKG57F/
 x+pkgWim6HdCvXI8m3Eht8Wjpqii9M9XYHXgJmiF5z+rTr2c692UCWs272VGAn1Lzemvd1tULfs
 tspgP5O7iNhmxJpxotBIhdLdADhGX94ZWK/JuahF5k0v4Guw0pQYVd7VNWz98ZhIZA5AprD7FYD
 7faXDpjh7MjGqhswXn4LZeVJpNQidODYI+MVvqYPa/RqoUxb0ysKTSBCwWaGxjiXbP+iA93IK3p
 mdDvH20SuK2TcHP+ENRH4dE9jO0oO84OV1ev8rrE5G0z6fcu8Yq7ju/teMX4jvTO9BxbhsOsHag
 2g0qgVA1XGaCC9pwjSD+oVog/eV/+lht8OCiMC5/4da75mlv8KQ6jzm3AEVEF15/x397wcHPtWs
 f6pOAWThqOVtDAwKNrnO941KLm0H4i5GOh76/zlV3Mo/pBZPkTmDiTsMewviQ7ogns5Q+8dMQeB
 pH07U3ckYOSo3RQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Igmm9Tz8Z_zj0njrDiDzixEbQ1BB_LPa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA5OCBTYWx0ZWRfX6NwDddvQvweo
 faz97KAJ4RDsucTgRCAlPK3oIjWqN0gWG4h1xEWW3txAZBdkgxxs58QYGYFRRX23CbVGd8lpjxD
 O4+ggcZgevWZtatOewGrShJhpA8v4v8oYNIBgZcxlOF1sDZtw5RcUUGDAUqyImVLTg0N7WFZWpn
 TbLD+A2/glnhA7HoeDc8uG5DCYVeHTKZcOXFL6zNVWcdmiYBDxYPsKyFyleOonUpUT4jRdPK+gQ
 hHemGRcNURasHVUGCqslqDru8Q6ZS4f8XAm1rHHZ5qO+D8SDTPXwIxPkMCkc+TZ7RlwLZhdgHiz
 5h86LQSWl4/vXrmchtBTYerLBiYlQHD7UOpEGdzPKNW7k/fka5WaqxtYx6zonXwtbSR3uYQMiKD
 kCEd0vf2KG5FfFUf18kkuKKcGE3iB6OSAXrDIPNxPg57NlTW59bh2O2ZKKjfggF2izyEoP2d8xc
 8n1pETHawOQv+Gy54Hg==
X-Proofpoint-GUID: Igmm9Tz8Z_zj0njrDiDzixEbQ1BB_LPa
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699d95fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hvA-L96QmkH1ykFoo1wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240098
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93982-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F0D96186CD2
X-Rspamd-Action: no action

The Mobile Test Platform (MTP) is a reference development board
based on the Eliza SoC. So add dedicated board dts for it.

The initial support enables:
- UART debug console
- Ob-board UFS storage
- Qualcomm RPMh regulators (PMIC) and VPH_PWR
- board specific clocks & reserved GPIO ranges

Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile      |   1 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 409 +++++++++++++++++++++++++++++++++
 2 files changed, 410 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e8..1e91eaa2b12b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
new file mode 100644
index 000000000000..fc0659ea7d41
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -0,0 +1,409 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "eliza.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza MTP";
+	compatible = "qcom,eliza-mtp", "qcom,eliza";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart14;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7550-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3b>;
+		vdd-l2-l3-supply = <&vreg_s3b>;
+		vdd-l4-l5-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s2b>;
+		vdd-l7-supply = <&vreg_s1b>;
+		vdd-l8-supply = <&vreg_s1b>;
+		vdd-l9-l10-supply = <&vreg_s1b>;
+		vdd-l11-supply = <&vreg_s1b>;
+		vdd-l12-l14-supply = <&vreg_bob>;
+		vdd-l13-l16-supply = <&vreg_bob>;
+		vdd-l15-l17-l18-l19-l20-l21-l22-l23-supply = <&vreg_bob>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "b";
+
+		vreg_s1b: smps1 {
+			regulator-name = "vreg_s1b";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2b: smps2 {
+			regulator-name = "vreg_s2b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3b: smps3 {
+			regulator-name = "vreg_s3b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4b: smps4 {
+			regulator-name = "vreg_s4b";
+			regulator-min-microvolt = <2156000>;
+			regulator-max-microvolt = <2400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b: ldo2 {
+			regulator-name = "vreg_l2b";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b: ldo3 {
+			regulator-name = "vreg_l3b";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b: ldo4 {
+			regulator-name = "vreg_l4b";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b: ldo6 {
+			regulator-name = "vreg_l6b";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b: ldo7 {
+			regulator-name = "vreg_l7b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b: ldo8 {
+			regulator-name = "vreg_l8b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b: ldo9 {
+			regulator-name = "vreg_l9b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b: ldo10 {
+			regulator-name = "vreg_l10b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b: ldo11 {
+			regulator-name = "vreg_l11b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b: ldo12 {
+			regulator-name = "vreg_l12b";
+			/*
+			 * Skip voltage voting for UFS VCC.
+			 */
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b: ldo13 {
+			regulator-name = "vreg_l13b";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b: ldo14 {
+			regulator-name = "vreg_l14b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b: ldo15 {
+			regulator-name = "vreg_l15b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b: ldo16 {
+			regulator-name = "vreg_l16b";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b: ldo17 {
+			regulator-name = "vreg_l17b";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b: ldo18 {
+			regulator-name = "vreg_l18b";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19b: ldo19 {
+			regulator-name = "vreg_l19b";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20b: ldo20 {
+			regulator-name = "vreg_l20b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21b: ldo21 {
+			regulator-name = "vreg_l21b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l22b: ldo22 {
+			regulator-name = "vreg_l22b";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l23b: ldo23 {
+			regulator-name = "vreg_l23b";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s2b>;
+
+		qcom,pmic-id = "d";
+
+		vreg_l1d: ldo1 {
+			regulator-name = "vreg_l1d";
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s2b>;
+		vdd-l3-supply = <&vreg_s2b>;
+
+		qcom,pmic-id = "g";
+
+		vreg_l1g: ldo1 {
+			regulator-name = "vreg_l1g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g: ldo3 {
+			regulator-name = "vreg_l3g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmr735d-rpmh-regulators";
+
+		vdd-l1-l2-l5-supply = <&vreg_s3b>;
+		vdd-l3-l4-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s1b>;
+		vdd-l7-supply = <&vreg_s3b>;
+
+		qcom,pmic-id = "k";
+
+		vreg_l1k: ldo1 {
+			regulator-name = "vreg_l1k";
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k: ldo2 {
+			regulator-name = "vreg_l2k";
+			regulator-min-microvolt = <920000>;
+			regulator-max-microvolt = <969000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k: ldo3 {
+			regulator-name = "vreg_l3k";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4k: ldo4 {
+			regulator-name = "vreg_l4k";
+			regulator-min-microvolt = <960000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5k: ldo5 {
+			regulator-name = "vreg_l5k";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <931000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6k: ldo6 {
+			regulator-name = "vreg_l6k";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7k: ldo7 {
+			regulator-name = "vreg_l7k";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&qupv3_2 {
+	status = "okay";
+};
+
+&tlmm {
+	/* reserved for secure world */
+	gpio-reserved-ranges = <20 4>, <111 2>, <118 1>;
+};
+
+&uart14 {
+	compatible = "qcom,geni-debug-uart";
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l12b>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1d>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l6b>;
+	vdda-pll-supply = <&vreg_l4b>;
+
+	status = "okay";
+};

-- 
2.48.1


