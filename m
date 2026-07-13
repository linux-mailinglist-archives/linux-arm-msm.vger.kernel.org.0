Return-Path: <linux-arm-msm+bounces-118720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q2/rOni9VGquqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:27:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AD3749CB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:27:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aTvVG+u4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hZD9K6A6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118720-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118720-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 714713038951
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496DF3E7BA9;
	Mon, 13 Jul 2026 10:26:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B833ADBA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938378; cv=none; b=C+yPzW3d3hD/KZa7gReWEmlO6GY27cObVTH58e54myITIb9cS/KSDyWeRQ6Qj0xrvWLUWXMtqUHnDMSu06QC88d/oidDrT8TsqnDkZBw822IZDTVcEXc2mK5DiTRcOOU2Kzu4KhwCcLxlhNLO8PL5SY4ZjmB58Sp7uk0kmHcb14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938378; c=relaxed/simple;
	bh=QnHhl2+ObujLedzMKhxPMg2g3QqycowdwM1ogFg7MiM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EFNfDIKx0k18UyOKhEPd04E/RlgW/4QVUy/xis966LN9oaNUsA/N5gUAsBlqx87Ob2JcWefPstB6znrtftnXk+/8bYa5HAQyStw+Gfu+D18E0WLTidPOZrbJHLgb1Ui6yYejNFVUY4Kk6qcY/x3SS8GwMiFME8EGiUGTtDNbcSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aTvVG+u4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZD9K6A6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nklo507299
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vig6jlHsHMAwQCaPPXnXQE
	Ln/O+A5Dm0Q6KI4DyTuck=; b=aTvVG+u48HzYrz/Fjqer3VogI6VikWRwVTJb02
	yZpVWewzwoz3q83S4MbmpElnctoA4q/xWLfhzgLmq+ZGB7KdsczqBYyaVHihyzTI
	D1e6zSvuaJxr/KTQAm6GdkbjpqH8Ks/lotropQcqHiFe9WnlB9nAr3nZ2LBjXbIa
	Eoh5KdH2IUPZg4euUiFYv5kmOOozXxTW+yVddyQtGBvuwesGnH+W/zP/xgiY+EuP
	UAcCQQPqYberpZU5SCGhCroydYn1UxfbukMYcl1EMTYrC8F4mNu1LnAg5jM4+RnD
	hUrGhsz3lxst0zxvRGlEF5rLMJNFlhcU2DDJ3+/6XichgnVQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8h1p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso2797387a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938375; x=1784543175; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vig6jlHsHMAwQCaPPXnXQELn/O+A5Dm0Q6KI4DyTuck=;
        b=hZD9K6A6T75loq4/LRlfxG8K5zno80hqq+ej/oSNTVn8tFB3tQJF35LVV3pi3nOyCy
         gcfBQ2tiliPfdz5iYXIFFCE/ziY7R4Nr31eZnAZ6EEeURvRIB0hqkAMLuX4k9E4iOLa1
         z1dDqsN5Hf+PU+lewzD/Gsl7FjGnBvIivKg57wArRwJnMV0G328RjQ3328+VTXRRkIbf
         TlxbJPkofGCWY1OQrHJ34gxBSgw3OUkVgkY9+Abn8mp7tLkz3Bq66K8y6foL00ZwwNed
         4tLeWpUufRytG+2NQ3cy3PTWvUdow1EYp5/15up+IgsgkpaVzj+CWkqob1IUTiiIAS8v
         5nSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938375; x=1784543175;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vig6jlHsHMAwQCaPPXnXQELn/O+A5Dm0Q6KI4DyTuck=;
        b=DzQgNm8Y9cGhIinfo/ae4E0nu5agW0I3WA9+NPMW0z0h/CCdm4sWv83J9Q+8D+qEZH
         UV271s+YWwuGZ7SJFmREoYDgjYX2ZtlIhMTWv0MKRb1A0teQK+oSVVkS+WPXyrPnNIyA
         Y9fvkbV6kJU8ZfCUQL4Km5R3wvSG33F/KL5dsWP/I1cBSajA2aFfGqoaHCGhfb1seytS
         07CHzYodpYUvrXnmXr9Zk60CaQ/YiM5QZsSFYTet1fX3qW1i4z4SybK5dr+wC6E7Liow
         jQr58KAPgs/Aiijigd7JFE5EpQGtOuTn+HT9h7BKVt7Xv6a5WX3+qPZjHnTwgHe8LxiO
         tN6A==
X-Forwarded-Encrypted: i=1; AHgh+RppNZ4Kr20zdQNhGYFLs3yY5ZG2CZ2lMgTQRavAtXoaQ68y82rWQ8WT+o1ykVnywQs4VD/geFk4ejjqHlQ4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq1tl3ssSBzMW2hRw3w9jWVl4E2a8M62PhpIM5XQp7IBeDFRvs
	Am6yFAUN/vvJVUoZxEguhqxf6w8tBwDcI2HE44OkIAqkbTPFvljoAh/YYqwTTBXyViroVPsK5Nm
	b1lkptwk4fRo7sNILqDVO+sZYXigprqxpJKggvvDnc/EMeGa8yBzJmknw2x++HTVK1E+v
X-Gm-Gg: AfdE7cms5JSL55AnxWPWBAw2UfruVpyQOMr6t0Gzf4xQ7vSZSrdGx7DO5s8BYQkOqyz
	osDLh7x6yLCW4LzuNkNsSh659LKZ3nyPMaeLj7oPMMBSl0bLythMIz7uDrI7DQPjlL9+ZbI0o93
	CZ8iZchRA+cly1otSemWYhswl40k9pDR4/k4Lh3CiVLlnM4BrR2q/dUVC81SCblrR5C6tC+broO
	LMhNtkZMNPaUylWIW7z6oZm7GlMXZOWKqtiepy5GRDdPzyG06cfAT98okhPhsp+F8L0lpjqZOQ+
	M40HbFdzRpLXeSYR7tstZYgQd3pFiD5+dRYzHdjcczi+f2uhO/KM18/deqxl8kJ/TEXZ2uURdaV
	eWk96bN8ChVcMbt8eqBwDFLKY019gIE1J3xXd3w==
X-Received: by 2002:a05:6a21:700b:b0:39c:235:c5ec with SMTP id adf61e73a8af0-3c110a0fb58mr9762225637.34.1783938375087;
        Mon, 13 Jul 2026 03:26:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:700b:b0:39c:235:c5ec with SMTP id adf61e73a8af0-3c110a0fb58mr9762196637.34.1783938374548;
        Mon, 13 Jul 2026 03:26:14 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311950eb930sm48465704eec.8.2026.07.13.03.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:13 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v3 0/4] arm64: qcom: dts: Add display support for Qualcomm
 Shikra
Date: Mon, 13 Jul 2026 15:56:05 +0530
Message-Id: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD29VGoC/22OQQ6CMBBFr2K6tqQtbRFX3sO4KLRIVah2oNEQ7
 m4LMW7YTPIzb96fCYHx1gA67ibkTbBgXR9Dvt+hulX91WCrY0aMMEkkkxhae/cK6wGve8AHTVl
 RmVJQLVC8e3rT2PfiPF/WDGN1M/WQRIloLQzOf5bSQBP38xcb/kAxwZyXikemyDU5OYDsNapH7
 bouiwOlmsD+ooJsPRpYFAnZ1JpKURrFN0TzPH8BkSVANRQBAAA=
X-Change-ID: 20260626-shikra-dt-changes-8d127be951d5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938370; l=3341;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=QnHhl2+ObujLedzMKhxPMg2g3QqycowdwM1ogFg7MiM=;
 b=1Yfun62PqPkuYsztT2gQtEwVqrrNsl/zg0aCfJ6KwmbEmL9+FYHaNXCqxe9E7SA146jJnUrGf
 RxkVdOnBw2rBvCXb8ooT075p3Uvp3G1kUMRzOGqwr9GHF05BwOVV8YN
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: AL2l-I470P_T9f_UDaUNcunwsHSU0JoJ
X-Proofpoint-ORIG-GUID: AL2l-I470P_T9f_UDaUNcunwsHSU0JoJ
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54bd47 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=VwQbUJbxAAAA:8
 a=hOcAhXLu4TPP6eDJ8ssA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX2OPmqr2dBGwX
 bN4xa2QqcB42bper+nTVCstpX17N/cjNAuTXLsnhTPCIFtqNfvo7ZL545hzARvIr4s1u//c+jo4
 fHBA1pnnuZ44fIr3XuJ5hIIdYO0ONq8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX+Zv46slDGqCV
 UJSOeFezd0wspkncUfT1/ksQaSBt6VorEJAHhEvxIR3QoibKEauPW16PTXeskgW7q5R8tIzb7XW
 SBLcbxDY3beNk3YsbuF+lsBo7K1GF18y9n7O9tPheIpSrf9KeJH9cTu+ekiJLaOof7qP6Bvh6t2
 ftTeMGuPFRvybP+wGNdzUI26xSH0LAZjPACW0AZFk7P8iLoMXYMk9fSsbZrDjGDIc95pKPUVr8W
 nezwm6fgla+jondinQ0bMmUed7m5CwUo1nHU8PU1AqsVSy3/dYo7P5sZXhPbXnOVWrG5dgQme8C
 QGYqGjBNS2t0TCJbT24neOo4iSS5oiUDKBCWwMRl5A/HOR5i2Xu3pOP27+eEFlXf4iIH9xjoufK
 QOLaLe7+LayZBAX6WOU8SDgSyKfpFK5FULR+04RDQmDJrx6H1jav00NsFPotgdKytnpGYOtbJtV
 BFv+xoX/guaRBLHj+yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-118720-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60AD3749CB3

This series adds display support for the Qualcomm Shikra platform.

It introduces the Qualcomm Shikra MDSS display subsystem support
at the SoC level, and enables display on the Qualcomm Shikra CQS
EVK and CQM EVK boards with the required DSI panel nodes.

---
Changes in v3:
- Drop redundant vph_pwr fixed-regulator node (Krzysztof Kozlowski) 
- Remove vin-supply = <&vph_pwr> from lcd_bias node (Krzysztof
  Kozlowski).
- Add the new line between the last property and the following  
  subnodes in mdss block(Konrad).
- Link to v2: https://patch.msgid.link/20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com

Changes in v2:
- Replace QCM2290-specific RPM power domain identifiers with generic
  RPMPD_VDDCX/VDDMX macros in Shikra display and DSI nodes.
- Add missing blank line before status = "okay" in &mdss_dsi0 node(Dmitry).
- Split avdd-supply and avee-supply into separate regulators vreg_disp_p
  and vreg_disp_n instead of sharing the same lcd_bias regulator(Dmitry).
- Sort tlmm pin state entries by pin number: gpio3, gpio86, gpio91,
  gpio151 (Dmitry).
- Add vph_pwr as an always-on fixed regulator representing the main
  board power supply, used as vin-supply for lcd_bias.
- Droped the 5th patch "Shikra LT9611UXD support". NAK by Dmitry. Once
  the hdmi-dsi driver is fixed then we will post DT changes.
- Link to v1: https://patch.msgid.link/20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com

prerequisite-message-id: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
prerequisite-message-id: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
prerequisite-message-id: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
prerequisite-message-id: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
prerequisite-message-id: <20260618-ili7807s-v2-0-b3f0c109b102@oss.qualcomm.com>
prerequisite-message-id: <20260508134009.4582-1-syyang@lontium.com>
prerequisite-message-id: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: arpit.saini@oss.qualcomm.com

---
Arpit Saini (3):
      arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
      arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
      arm64: defconfig: Enable ILI7807S DSI panel driver

Nabige Aala (1):
      arm64: dts: qcom: shikra: Add MDSS display subsystem

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 118 ++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 118 ++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 206 +++++++++++++++++++++++++++-
 arch/arm64/configs/defconfig                |   1 +
 4 files changed, 441 insertions(+), 2 deletions(-)
---
base-commit: f28fb4ff0d25819c58341fec6e3953f1ebb1fc2e
change-id: 20260626-shikra-dt-changes-8d127be951d5

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>


