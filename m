Return-Path: <linux-arm-msm+bounces-116093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZJRGCUyqRmoVbQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:13:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF7E6FBE25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:13:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="PD/G9MX6";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aa+ibTxH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116093-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116093-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D915D322EDC6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 17:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4983839DBD4;
	Thu,  2 Jul 2026 17:23:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3561A396D1A
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 17:23:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013013; cv=none; b=g1y3/kXMD+eBrALSsp2RcmOEj2APJhl59nCkoWIej0x84FZf2Iqcp3brg76Z+EmlpKQRnU0ESg18PxrDttLEHDxDUXRAJE+JlsTM7X9wbKUbG5blj0lz0MY/RO5FoNVwKLVAoXtY7mrEd7dTTMpZXCqnvuKZp3hkaPJsZiY+eTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013013; c=relaxed/simple;
	bh=f1kW0KfbOBwzfyvSB6qRsv0wRsKse0k48GBqyG+Gu0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qNSmbyAQXCzVSqss3zRiv16szyhkQqCPE+Z5wBCBLKSfKfRpTz81Xg6x2rDa3IQHqT8L6XPF0SnDiH1cN6y978jFb2/SLl92e7S9aBQ3pDX/egCK9AXwWlUF8p+IS6Izp1/qHQ9uYwS0izyps2YGJMni7oO8wbItU2wrM619Vp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PD/G9MX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aa+ibTxH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3KMB661916
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 17:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4LjwJAfGIMwv4JvSBnxIJgWfBxcmgUQORx2Zd1CjIe4=; b=PD/G9MX6RYrFDIaY
	iKo0vYuQdqDFW3yDhh2meMjy1DPJkhVv5WGSETjk1F0NfjMwfArK3u38fL+YKzzX
	aLgtqeESvTbCrDJvZ8tNyMVjBCmYv8dOK/S5kbWI/lM32rwyyo+bcoSfWdg+xLpr
	tBmELcuEiUmpSsauDhiLxNu4p99cy5gg2D4sZhtiuRp1ugH3azLvNPnHtkeXJ7xR
	qZGt5dOIMg02UlssOkyEhtZMpclxfVkNgfmR0HwW1kI3O/g/yyqJSfD2z3WMJ0Se
	gOIRMKO+vxrnA8kaziAV7lgJjocaM6O3yZXaZlmJVLeQQLsi2V0mchekjzmjsrP1
	wBSIlQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp9efk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 17:23:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so3102047a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783013008; x=1783617808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LjwJAfGIMwv4JvSBnxIJgWfBxcmgUQORx2Zd1CjIe4=;
        b=aa+ibTxHvMxHUro+87PX01nYss19HbAQQxOFQ2dJyv1OlIEUeQll3ndk3SF/LHjnan
         SOt3MFL+ApMkqRwHmUSdQx/UqGg5pchV1GZg9yAGwYEEfBCQmo+3nV+eH5DeQ5nMLnml
         grTJ6v37EMg/QHMd4LkQDUeGmTS4SMnprQaCZkJMae5mnTtiqSGJmBXhjV/nNXJ8Kylu
         g/iVTLWl8JuIZVeGq1L4jQdqqmmGqLRNihvjdBnR3CqdIPGzLOYXBA+0M+q+r15LV703
         9c/1Mw+oO64qs4hkXS5HPmYj9/Olea/YinY7+XFADvrsLgcuE5eKXd80bZrD7ij34ODz
         5RIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783013008; x=1783617808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4LjwJAfGIMwv4JvSBnxIJgWfBxcmgUQORx2Zd1CjIe4=;
        b=sD0huHynjIgXQdKky4g4ZGE+KmCpJrJRIZQIydDBYQlLBxAKlD2jSp7XuxDmYGwG3q
         DTOMb0boDNiOJQ2mfkJ/mHBbQ89Rk5wBY6lYEJJae1HjqkeQAIrZnCxcBtFX0P5kcLr1
         Xx0YCzTKgLabgNCzpgwfYCaYfHIQBPU4BMdik0ubzCxjKkpZ9aq3NSJ3LvALxS6BQIgv
         +yAQUqfxV+1L5uYXB8eSS9ZWDtQYgtedYb10+K4NAkiC9Dp/IF6SjB2LrH4Dq9jOSbqG
         +7cvCBEG87NXHnVCvdLqa4aCB0C5qafRzUvEklwJncegFXTRABHOKTRBRMkT0fYGF0nH
         o3rA==
X-Forwarded-Encrypted: i=1; AFNElJ+fY8bgYMdau/TZd3PSrfbg5JSkLBENCXMSQJXx+1xO6635+83gnBDe2v8PDHNLvEossHu8yqByzZqV3AyI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0z3q34I9g2cupcQalswBo7eB3AdbDMsNMav+Y+nf+m9CEdwTa
	3NsVgpoNc2jBFIz+7VyWa52PYl0mPC47qeWQGva6Y3oPM3u2eqwDHqmzXkvF5KTwwjrYcmgC3tv
	nuNwkC1OJazp360JwuDJCvGWRvN+jzdZhdHvFOFgBdieveV597Rx17JKN0ws/tr5QN+Ta
X-Gm-Gg: AfdE7cmDj5QaCVDrX9o3MdRgH0NpVmgsHseaoeWbFEHBKLche9ibS43xFlnVvuRC5dt
	5A/S14ilSyZU/N+PzeJKNGBbsAmZsf6+snbP+sTRHZBxvrCBFC/4AJPQM9jGpTp8W1igsLX75V/
	0hgn21rhLj3+9H4OqT3bGRztnPW2SSaDOl8jm2TlHz1LisY/JO39JSCWyylY96ChCKbyBzqPgLA
	BkMd5OOb1wdpNBl07eIr4K/0S1Nlb+WEDfVOACJrMfuowgBSqf67e4oiF7K1BY5wHPSUJhtBV77
	INa7PJypSGW8qUDYxE4IFW1tPsf6t91vTgr4enAlSVEG2vkpEOyuzJ3xWEokIbvCt9QBdHRijvE
	rtgBXfNAMK/ID7mJsHw+BP1TE/p74kuXIAt/nBNgNb0SpgQ==
X-Received: by 2002:a05:6a20:b40b:b0:3bf:b9de:854d with SMTP id adf61e73a8af0-3bfed2b3ad6mr7932458637.23.1783013007748;
        Thu, 02 Jul 2026 10:23:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:b40b:b0:3bf:b9de:854d with SMTP id adf61e73a8af0-3bfed2b3ad6mr7932404637.23.1783013007223;
        Thu, 02 Jul 2026 10:23:27 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3ececfe4sm10564289c88.8.2026.07.02.10.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:23:26 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 22:52:57 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: glymur: Enable SPEL powercap
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-qcom_spel_driver_upstream-v3-4-434d50f0c5b0@oss.qualcomm.com>
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783012984; l=1091;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=f1kW0KfbOBwzfyvSB6qRsv0wRsKse0k48GBqyG+Gu0k=;
 b=wmK6qDX3jahgYWIrKjsQYC/RtdfcAAJm1MmeDtfPeAyOAiPjjOoPupWkQkcyQnN+kadpTsN9A
 OvcQXq3+n3EDEwVxHdkDs3UBzJBsu1Pj/kYJXmhPg9T20ItLaz3aIBg
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfX78g4bCKhTeC6
 SDVgMxK7ttwpmLBEpb87ijhL88j4CZhc1hjVyRey/vgD0U5PvPXurOAkb5RQmXytQDl7aob8UyL
 wLB+Sxcls81Wx0SC4bZUS2oahWQE8/Y=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a469e90 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mqSRqqF8xmN81XtCacEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfX0uZgCZrRfS2Z
 Rkk6714rsunYZc470FW//LrKuu52twSdn4o+yb+1M0xmqrOScrkvT2DuAy+43PdnUMmFyn/1oJE
 2oW/5UD2lryFYPdNmHkeIsbbBEO/7SrM3KNTsq/kzi/jsZarpmnU8BW+RpcBhzU3mQ6I9QQmzZG
 Uaz+pjaenVlmax1BGfVhJ22fbyZluLJIPe3OG7ygqIYr1nu1LoDMhYDDco3Tilq0IixywLwj29H
 n8K6Ek7uaz8j2yY2luKL3Rq4XiIGqQ9WDV8GBWbeCqdhGQTa0IfGuqWMcxL8vVu6iLkZx1vy4fw
 rPN5nbdw4mIqrWbbYz07QuL8vcKkNJt6VzJ0ZahIVL7CYoBdVbUBzs8AwiJpFrjca3E6dzWo/Zv
 3lXBS2zhbgoSxugIME3Z3N6dYNEeOlc5RtrdDw6euTa/wsMBQiUiPSewsNDvACqedE0j9tp7Wri
 59VynmnvdpFY5QSAxCA==
X-Proofpoint-ORIG-GUID: 46hK74sp7K8CxxZCfnlMN_5BBo87xjlU
X-Proofpoint-GUID: 46hK74sp7K8CxxZCfnlMN_5BBo87xjlU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020183
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116093-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FF7E6FBE25

The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
based power monitoring and limiting capabilities for various power
domains including System, SoC, CPU clusters, GPU, and various other
subsystems for glymur.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..9c942db8c824 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5045,6 +5045,16 @@ spmi_bus2: spmi@c48000 {
 			};
 		};
 
+		power-limits@ef3b000 {
+			compatible = "qcom,glymur-spel";
+			reg = <0x0 0x0ef3b000 0x0 0x1000>,
+			      <0x0 0x0ef3d000 0x0 0x1000>,
+			      <0x0 0x0ef3e000 0x0 0x1000>;
+			reg-names = "config",
+				    "constraints",
+				    "nodes";
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,glymur-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xf00000>;

-- 
2.43.0


