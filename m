Return-Path: <linux-arm-msm+bounces-118724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 28n2JbK9VGrJqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:28:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEED749D06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:28:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=c0F9oPzx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ol4dxnbs;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118724-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118724-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DA303039894
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867E83ECBE5;
	Mon, 13 Jul 2026 10:26:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF943E7BD0
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938387; cv=none; b=eRALHQNbOU5wjYzgJVwQIVoIZo9nOzaF8lqnoV5RWOVj6A0N/yDI3VHnMuJ5cFCYkd8Zbk32oiRHsG8jV4HTFNIApz89zfQUVTqcaN+Ylp4L8fw1dYePT9xjGWjVVXT0DMnWcSaHGo62FE4+BiZ9v0UmNRyGLN0GuKOzUTRxOH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938387; c=relaxed/simple;
	bh=SZFDJokNdX4kC5Lbnvss6XlIgiOnp3WhX7fQ87bL0eA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WrbwQxld0CA9kHBp9mHptMyEggJjVQ0rBCy4o7H9xYJBI5Rg6YJU+R6nrpiyMNeCKQTK28X7CiN5ZXAoK4amFzYsgYRIzoAp5fOgxGbG8QpWNVLQKDeEGBCFYykGdsIbJ5ovREdjAsVaER2LE2UyEVZ20XxoGHDb2DG+u/g+QeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0F9oPzx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ol4dxnbs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9dWnd952929
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0pxVTSV9NqQSxt2NKcMsD/tFtm1cvcFlvB7qlYNgl44=; b=c0F9oPzxxWedIJOK
	PlhyvTKweeAO3871iAHHWfvNYlhkTZxZlB1lWyTZxMAaxmCKYk5AoLNj4VnYH7Z4
	6F51sPvL5kDKpw0xL4pU/pNSYLpZc38VfeFWC+y7/MRON4anYfxh6AZg+dmsSUzc
	gWPNVfEdWjxFus2RBZeHldWUtPHS0UccqHMOJPehCBaxIAvHQ65hrPXPVF03ilkp
	c69T+CSPMHPCE0mgd9ceJIWkXzjuTkEFEOMlZolxbsYFDr5kNBzKUxvP1nKaW4je
	eogU2zn9s156w9G6TZs2kG2Yq7yzFz30+BgaMI1RWFb/u7vSa3khLZsZ7P1p+85H
	hgmRag==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3g5fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8894570b58so2248095a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938383; x=1784543183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pxVTSV9NqQSxt2NKcMsD/tFtm1cvcFlvB7qlYNgl44=;
        b=Ol4dxnbsir/QE7iGZh1qOkYsxvfhLaNq8mkNlblJm7bHuW/A7jS++J9CEKUr8f3Nzd
         sFwTQkhmRaV/r+ZsNeXhM7TikbrM+dZneF1BCA69RqHsO4sxUFTR53n2v8vMUmbOp8xM
         KpU7XV/lTlt2CZyOVjXDlFVuN52kXWwH1E5qKWdIdlNb0eA9tr8bjyrXOiR6kkIITdx/
         ibr702pX3R/NznKW4paay6JSLjZ+BxeaummPmTfUCM3YSm132PFUw035iyE8nmTZ5K+b
         oKXtdHy4d62szH4nGUBnK3L6Hozh5LABuAmJZhmWKdPqBvVPMuyGaiDPUGuF6iMObgTx
         Fayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938383; x=1784543183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pxVTSV9NqQSxt2NKcMsD/tFtm1cvcFlvB7qlYNgl44=;
        b=S/Z8Dc+USb4JvxHZN8mn08oE4mOm4x4RrDjzBp4mzeQbLjEY649Mx1KXFMQSEMCot3
         1yBWvvCK9CRVhNYC/x6AZDw/wTQanqRZLpxJ8iwSBENXDlRuDEDbT+zec94XyiyLjGFp
         nEc204Q70bP/aMJwRZBHtNuXRFCPWCjwMZv5j82uW5JKmJrldv+zyWwyxv5IM0WP9vDl
         WW2iCfQrO6zdvsLfC9h2uv207PQ0/JVX6pmVynNR7WoUiCmskEG00FJ6c8IqRgqsvbS7
         4ipuHyWlVJraqYgfatDEjzfQzOjAYRiGjQn05a0qurCXWQebEGUA7WWPxfiDaB8Yufu1
         Y+cw==
X-Forwarded-Encrypted: i=1; AHgh+RpsDogCPtMqIlvSA5KlWnNhwKZ0py9pVa4UngSaQzmxXQaoyDR9eDBOoe4T1iVfHxhwGlqyhtYfsTiMqyQD@vger.kernel.org
X-Gm-Message-State: AOJu0YzLjtHSJfG1bFDZgqRRlII42Vr+idpY9Jw0xZ07jGCVog+amjlh
	ZaE+PKJclTqjTCOss4t2T/mcdIOtFXr2CTa9rPpw52d7FufxBWZBMjPQ6f/yyoEWDKiqii34Qqi
	MiT87hIORw2yRWWjpCTFT1CEdZ4HRzt1y8bEJHDd1MrWD7MNTnqjJb94o4ws1Zlw7idVq
X-Gm-Gg: AfdE7ck+zRd5mUPBmOWAYuUOZDXG2d4QwNit9KRKXOozyYcK5ayRFguINIVnLqYX5Md
	SfQW0m57iEzLikBDRYGsHqshrtodk5Fg1Q7d0XJTLvLGiGInLJDd7wiGQW+arUru0NSUo/aZ0k2
	IbP3Z6WB7MO2mK6nKjynCWUK8ILY9edSMakGuiKEc9Mu54gJhAXlLRj7kUwZ8bpMOEfImuidvI9
	0KpTIP+oqCXH/WLJUjhkro5RC6VhHs4q9lWfg3X4uKVvpSqv4OAV7risuH9J83+UrbSAXnPr5W/
	JGiZFjlnJUIf1q6wa+960KieBQDtZZ0toPG9P906VJoenU1pnpsfDlyY4TZ8DpbIUDaxzP6RmjZ
	0nn0BJnO/u+J+vgHAnzHLw2PV5tP0NFj4NKOanw==
X-Received: by 2002:a17:90b:2d4e:b0:387:e0db:bc29 with SMTP id 98e67ed59e1d1-38dc77d79e0mr8147455a91.41.1783938383021;
        Mon, 13 Jul 2026 03:26:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2d4e:b0:387:e0db:bc29 with SMTP id 98e67ed59e1d1-38dc77d79e0mr8147430a91.41.1783938382587;
        Mon, 13 Jul 2026 03:26:22 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311950eb930sm48465704eec.8.2026.07.13.03.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:22 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:56:07 +0530
Subject: [PATCH v3 2/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-dt-changes-v3-2-15102fca9570@oss.qualcomm.com>
References: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938370; l=3523;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=yz+vhdZtFiLKHn0F27VYcm96BraHz9XPOvOgkzNUaeU=;
 b=mbnJc1Dzi8lAdpemjrEulZ2afDFqdqzAi9TFXVzlfqGsvjxleo5utowXJ4g+gb0ywyldxzi/N
 h7gqRHsBY/nAstOEFtJO0mIKRsJ7A6wslC+LAiA/UmMp+JozA+/AplW
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: JhghTK15LAWenpU8qHB2kCFLTXVp3kQ5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX2n4nhwzGQYYh
 MB8EbXprbCQt3OBv/spd155/WM72EfeOOxqwxKanKma1vqfOpngGEEsKafC3uanrrrYKibZ0qKu
 24NrqmayfwQ8Qn8YVTf4OHRt5nFDK3I=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54bd4f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gJpjwWOAGh2g_eRG5xwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX5uLrrnZwh4Tr
 jvMhG+I83vTSKKvj5UDsC3mgXA3gsMhvgR+7m9RLk0N4FyP6uCM238OBrVIHBEmOXLk1+I19xRK
 SKQnzZKaxNuHS9EuPqUD+AvVuEZvBhZnppsK4Nr+o32etpbv2YPmXB7HdmTXQD1pP1oyNUN42UZ
 KkfInLPXfNBNbHAmemj5UyuFX7CtYIatd0W2A4JUKSxhnFw0ANIPjtV5Czdx51bzNnomkRvPJX4
 SULloIcHIbNKFQOE6rkN2VvplkgGoZOUZxrKdXkDjihFzavOJsjffEdEgsaztqhhtgeCTHMCgth
 DqkqmGwsrRtWfOKeuqOterimHaAvHUgaG4dioDELbSDnTuQg28B2Shl+t+jtacdn66aZlSNgRcC
 rqbrIIz7kxYanH17msw5SwONNeCWlJdkb2uKa0txnER2diuLr4KpBIuiFP5LxqwXrmCD3GSGHd8
 7ZPCwiHYk2TiieMJjHQ==
X-Proofpoint-GUID: JhghTK15LAWenpU8qHB2kCFLTXVp3kQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118724-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BEED749D06

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQS EVK
board and add the DLC0697 MIPI DSI display panel node.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 118 ++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 26ff8007a819..e2b4f3ac7feb 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,31 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	lcd_bias: regulator-lcd-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bias";
+		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_disp_n: regulator-vreg-disp-n {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_n";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
+	vreg_disp_p: regulator-vreg-disp-p {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_p";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
 	wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
@@ -60,6 +85,53 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&pm4125_l15>;
+		avdd-supply = <&vreg_disp_p>;
+		avee-supply = <&vreg_disp_n>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;
+		pinctrl-1 = <&panel_rst_n_suspend &panel_bl_en_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm4125_l5 {
+	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -95,6 +167,52 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio86";
+		function = "mdp_vsync_p";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_bl_en: panel-bl-en-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	panel_bl_en_suspend: panel-bl-en-suspend-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+		output-low;
+	};
+
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio151";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
 &uart8 {
 	status = "okay";
 

-- 
2.34.1


