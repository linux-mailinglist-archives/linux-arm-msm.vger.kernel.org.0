Return-Path: <linux-arm-msm+bounces-98412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPoNM5+BumldXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:42:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B662BA180
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0997306BC20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F264396564;
	Wed, 18 Mar 2026 10:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9J5c/QF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqHTT2G7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A41391E50
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830403; cv=none; b=KsNfpmduJhco9oxDFztq3OdI9zpST4J8i6QfTJ2JZcWWnlEUsVIozOutsoG6FpO5tXXhcJIGWVwM4YU7xst8lgz1iqNqmIeOWd+Sk/WcKy8PKpSwnjKo57KW1/nB4mndnhIo32Dc+oycz1VsrpW2gIZQImebydj6uy4uuk0PO6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830403; c=relaxed/simple;
	bh=A3N1+tnyJZLZIgVmIYE+gI6nMkOe77STPu4RVjcwzT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WRHN8Z2S1xxA3H0twv3bE7S+HRL+pzPHgxPB1DzKoaEFq01PiySDgbkp5xLJaHKtwYJs7d4ykti3b0+Sy8Owc8q42ClSYVW7nPXK6wTi0GPjdPI5+s+M2Erb7y/c2HZR/gMf8dhPY38CsuW/C4ce6VE1+H6YVyG37T13MyDRJ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9J5c/QF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqHTT2G7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8mDkp1145393
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqSDo0DYJRx2fW016fpGE0fkJqX2DpM1Fs0eS6o1cMY=; b=j9J5c/QFjjLKbJdd
	xz2+7zNoSsUcedzwliV1uqVDyQAZ6pCPWaSamrpWYOtgviCd/LgDewLoU7cM2Xgw
	iDod0XvLz0swFKEbACzD1ZXVeCS2g7uoFr56zt65Pqbl683XwLPmGCJIiVaeb0ae
	IQSPLIKzTeycLUwYlxkAuCqH9GeF60qlO9pQGuygrJ53nulnSNSQ48wO8iStpyuO
	dbgUA9mnjWVdFUTq7+VWaKpsxjoaFfeKI0sOdAdPLXUBy9x2f6QxyIZzICPFwdJM
	KSPEovnp01remFUbnc/nsTmkaWbbdFE5wbYeAxPEGzkt53t5rJjXh/grUB5lWiva
	s4gwJQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3uu5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:39:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5092efe29dcso47257531cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830381; x=1774435181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqSDo0DYJRx2fW016fpGE0fkJqX2DpM1Fs0eS6o1cMY=;
        b=gqHTT2G7JNJnELxOkJafCt+CBUFl4nZHeTg6D4iINCufBPEHtcyBpdTfgkZgz9j2IJ
         dp09Da448chtGEKfrKwtaMKYdZqktpDHuLjjrRiEm2al4MUPMe+kYma0W8bU9OktU8XS
         k1P82kvQOP+bSGGixzcQotdFVdvWE98tzFOuPsn23/Mm0akOXqJ5loDKcyWfSZFWg2WF
         MkCn5ryM11n3xfEz5OlZ2G4qtZIAmiwVkVo8ncxTNwBC3voyUVd77dGZU5jAsU9Tavc+
         WpFIT1BKTEUxvgz0kz33gtHnC/pmTMW+ICijD265nvB6P2Zt8EZbmjG/Frj9yZSFk8Nc
         ZR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830381; x=1774435181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dqSDo0DYJRx2fW016fpGE0fkJqX2DpM1Fs0eS6o1cMY=;
        b=beAZuwuj8iwVwjGJpSxEiuspHqWBEwZOOVYSOa0DicT9U4B+aJJoG7UUj/zCWbS4AU
         RSaF1XatxGfaikinnl+OkiawLO0KVP9B4DJ3xY/aNulNXJ0BGka8kNl4ZwpeeJTwvQpQ
         ZxuMAPzMc4NiH0wCnGcrOzF92pe7OvR8CURF/PhhkwNGHY0RGB6w2AFh9Ms4b3U+NrmS
         ODTL0+D7noLlkMONiU0F52vAON3xJZy8KSEQ+4fEgf38935JyFC/yKdUkhok9YYlCduQ
         nn9o4TliELXnzaLrXzklyJhWUaYkeNDVbFcFQ8pbNeH23leg/+Ih6PS++3WWGfR+FHg9
         4TLw==
X-Forwarded-Encrypted: i=1; AJvYcCU/mpQ6rD4t3LlSlhmWIf/45dLFoxWxZmU19NIICRC7NMTRNet6yPVZDQeo0pyDdfM9TK3M9YO3mdt76rN9@vger.kernel.org
X-Gm-Message-State: AOJu0YyZBcB0iaIzb0X1S2Ktb5ojtmhGVXCehP76iraCk9bbBx2V0XKO
	Z34HLQLy6MemN8LThW9I+hfP8OLVUqPfGNd3pmFxzhy1Pxk/m+PXE7ldaZwleaQZBvIajSK3Kcg
	V0z9PL/bHtNeWlDZwlCBgRmvyXOrlli6EYtDADznMPM8mKPAOfMe6nrwee9y50tjfNIoV
X-Gm-Gg: ATEYQzzEOcFAIFD1OcaG323P9GgxbpFR/+dPTX4YxLd7jAW8BQ/FqGqzafeyKb7Ipfm
	6i+VJh2AIDf0OaiSHXALpn3T24AU/1djEhAjRolKjmFacVL5ER621icBl5prrDLNWffuCuXiwmy
	hVUWcSktecuKQTdFyZc73aw5DjB1njCqc2IsZ8F6PivrdO1A+e08w1Ufg8oXo7Zv+inGxG/83pk
	fPwriq0/E7M4Ujy7wz4e95QBOA+wHG5M8a6Yl5a4vQmV5Zg7EGF3q2TtTTezIjrau3EwSolwQdN
	5OG7z7LtUpYHp/4DsHEy3SwD5joD4qwpCUgFlAdoQLQnla0bRo5/B/iISvFeGDomED5zy0JaGUM
	3VNfw6SBA5rSl/Cb+aJ19MXZccVbtdKPE0JMqZ0vxVOV5
X-Received: by 2002:a05:622a:15d2:b0:509:35d1:ca37 with SMTP id d75a77b69052e-50b148333eamr34382301cf.16.1773830380140;
        Wed, 18 Mar 2026 03:39:40 -0700 (PDT)
X-Received: by 2002:a05:622a:15d2:b0:509:35d1:ca37 with SMTP id d75a77b69052e-50b148333eamr34381881cf.16.1773830379363;
        Wed, 18 Mar 2026 03:39:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm7300906f8f.21.2026.03.18.03.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 03:39:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 11:39:10 +0100
Subject: [PATCH v2 2/3] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=65557;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=A3N1+tnyJZLZIgVmIYE+gI6nMkOe77STPu4RVjcwzT4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoDjbAcLkegBWEyNBAn2IPbEw3Zw5jXSXNqx0
 FCb11tAYFaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqA4wAKCRDBN2bmhouD
 132wD/9dQAWRz+QIhBwoVnR4ZcEjhUSRf0UT7pwILZ079fcPdKnCUqR76824rUJIez1KcNg6Wv2
 1/eQDZAej5yAhQhG9CtChP+0k/ta3LT6wJ9WJHVn1/SBzocjGHomCo65hEc0sln0E2O0Dp+IEzv
 SusJz+1EcYzF67asoHgJOTKHDXQqEpVHOkLhRpCKSyaIHaAt2PHTMVhjhRCLGw8dehPcFe3A0ea
 NqHh4X3mmYKB+a4e+Dy5sC4rxukidjRAXJ5FEUOYn73kFsSUDGTWTDLjnucKhR1NZkqyu0NqoM6
 u1tZgQRL8gcdJ+VfOJSyGoiVQ963EoNJj/6FQIYLpwA8UtdYAPictZyegF8ScztQn28P/89I49h
 tpZ0PzNg62he+u4yjbydcRwv6P2cfflktcdrVr39wfUQb2HNpmUCEKTT5J68V8CSvHUrpXm4aiH
 FZd8AJGlxagNl0LKvlS1PI5fQRf3BT1lCMED22J0ob/CJ33s4C4DeDmXLkfVsWDvC7y6f1d/6To
 IboAwL3WtSVlwbwsyGOfTXDCrqdIpbSpzhHGkynRbtGsVeEBzytJEKzKd5P7VVmaF/Keu98XyX8
 hY2aRfvuft8+8NJowFS3tgv7aoCNfL3bwBal8Q68Nwo5cIKdy8SkYfE8xRd3f2jEX9hvWYim1b/
 5QWIrFA0NHTs9NQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69ba80ee cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wfTQ4-w1VviucuEUu7EA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: H10pbw8y6CWUhr539_RGf8npqFR90uEx
X-Proofpoint-ORIG-GUID: H10pbw8y6CWUhr539_RGf8npqFR90uEx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfX07B6UoF6ph4S
 yWYrqLsoRov7tPjTOt4GpPv+3g1g/IqTfg+ZpkeFsnFv0b40vbknr40MBs9BK/GfVbp9YrK28h6
 8vZKkJEgbmnSpe0lU4ivcH1qUnbOxY8n1w6JAvRVKhEyuFCnRVypDKZIZZjgbI00F+kr9PtWf8y
 zYFzQBMaQ/njGuf75fBok+d1gZ1Oq/op9mOGUSfrP3t3r3PPEACECNoJxorG8vJsPFeLPM1GcZg
 1GjekGw+qY/Kw43p5mYByjz6z/C0z90tWbwU6uXFS2/lqAHyin3fbA6ZG8+DwEdR7uRwdR1wcyj
 L2XgWLJeOqNmIRPKylOImdjEeBel9camz+CR2hd1JrRKE/1zT4NaXyVl2SqMhCqfPZ7mjVrM8LY
 Ikc+kqhdKx6nipM58QKAynXukr1m3eYCmdjYP/D+MNa8INCKuK2GWKikxmrjeYjStuahJA8fMSq
 2/erptnyp9zkpXZO7uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98412-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47B662BA180
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a driver for the display clock controller on Qualcomm Eliza SoC,
which is copied from SM8750 driver plus changes:

1. Additional DT_HDMI_PHY_PLL_CLK clock input,
2. Eight new HDMI clocks,
3. Different PLLs (lucid and pongo).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |    9 +
 drivers/clk/qcom/Makefile       |    1 +
 drivers/clk/qcom/dispcc-eliza.c | 2118 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 2128 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 87728f13f948..5e489dab5049 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -19,6 +19,15 @@ menuconfig COMMON_CLK_QCOM
 
 if COMMON_CLK_QCOM
 
+config CLK_ELIZA_DISPCC
+	tristate "Eliza Display Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_ELIZA_GCC
+	help
+	  Support for the display clock controllers on Eliza SoCs.
+	  Say Y if you want to support display devices and functionality such as
+	  splash screen.
+
 config CLK_ELIZA_GCC
 	tristate "Eliza Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 82c5c2ec968e..9441b2f994b4 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -20,6 +20,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 # Keep alphabetically sorted by config
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
+obj-$(CONFIG_CLK_ELIZA_DISPCC) += dispcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
diff --git a/drivers/clk/qcom/dispcc-eliza.c b/drivers/clk/qcom/dispcc-eliza.c
new file mode 100644
index 000000000000..8a78317e9485
--- /dev/null
+++ b/drivers/clk/qcom/dispcc-eliza.c
@@ -0,0 +1,2118 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023-2024, Linaro Ltd.
+ * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,eliza-dispcc.h>
+
+#include "common.h"
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "gdsc.h"
+#include "reset.h"
+
+/* Need to match the order of clocks in DT binding */
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_AHB_CLK,
+	DT_SLEEP_CLK,
+
+	DT_DSI0_PHY_PLL_OUT_BYTECLK,
+	DT_DSI0_PHY_PLL_OUT_DSICLK,
+	DT_DSI1_PHY_PLL_OUT_BYTECLK,
+	DT_DSI1_PHY_PLL_OUT_DSICLK,
+
+	DT_DP0_PHY_PLL_LINK_CLK,
+	DT_DP0_PHY_PLL_VCO_DIV_CLK,
+	DT_DP1_PHY_PLL_LINK_CLK,
+	DT_DP1_PHY_PLL_VCO_DIV_CLK,
+	DT_DP2_PHY_PLL_LINK_CLK,
+	DT_DP2_PHY_PLL_VCO_DIV_CLK,
+	DT_DP3_PHY_PLL_LINK_CLK,
+	DT_DP3_PHY_PLL_VCO_DIV_CLK,
+	DT_HDMI_PHY_PLL_CLK,
+};
+
+#define DISP_CC_MISC_CMD	0xF000
+
+enum {
+	P_BI_TCXO,
+	P_DISP_CC_PLL0_OUT_MAIN,
+	P_DISP_CC_PLL1_OUT_EVEN,
+	P_DISP_CC_PLL1_OUT_MAIN,
+	P_DISP_CC_PLL2_OUT_MAIN,
+	P_DP0_PHY_PLL_LINK_CLK,
+	P_DP0_PHY_PLL_VCO_DIV_CLK,
+	P_DP1_PHY_PLL_LINK_CLK,
+	P_DP1_PHY_PLL_VCO_DIV_CLK,
+	P_DP2_PHY_PLL_LINK_CLK,
+	P_DP2_PHY_PLL_VCO_DIV_CLK,
+	P_DP3_PHY_PLL_LINK_CLK,
+	P_DP3_PHY_PLL_VCO_DIV_CLK,
+	P_DSI0_PHY_PLL_OUT_BYTECLK,
+	P_DSI0_PHY_PLL_OUT_DSICLK,
+	P_DSI1_PHY_PLL_OUT_BYTECLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
+	P_HDMI_PHY_PLL_CLK,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+static const struct pll_vco pongo_ole_vco[] = {
+	{ 38400000, 38400000, 0 },
+};
+
+static struct alpha_pll_config disp_cc_pll0_config = {
+	.l = 0xd,
+	.cal_l = 0x44,
+	.alpha = 0x6492,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll disp_cc_pll0 = {
+	.offset = 0x0,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static struct alpha_pll_config disp_cc_pll1_config = {
+	.l = 0x1f,
+	.cal_l = 0x44,
+	.alpha = 0x4000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll disp_cc_pll1 = {
+	.offset = 0x1000,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct alpha_pll_config disp_cc_pll2_config = {
+	.l = 0x493,
+	.cal_l = 0x493,
+	.alpha = 0x0,
+	.config_ctl_val = 0x60000f6a,
+	.config_ctl_hi_val = 0x0001c808,
+	.config_ctl_hi1_val = 0x00000000,
+	.config_ctl_hi2_val = 0x04008174,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x0080c496,
+	.test_ctl_hi1_val = 0x40100180,
+	.test_ctl_hi2_val = 0x441001bc,
+	.test_ctl_hi3_val = 0x000003d8,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00e50302,
+};
+
+static struct clk_alpha_pll disp_cc_pll2 = {
+	.offset = 0x2000,
+	.vco_table = pongo_ole_vco,
+	.num_vco = ARRAY_SIZE(pongo_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_PONGO_ELU],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_pll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_SLEEP_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_pongo_elu_ops,
+		},
+	},
+};
+
+static const struct parent_map disp_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_0_ao[] = {
+	{ .index = DT_BI_TCXO_AO },
+};
+
+static const struct parent_map disp_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 3 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map disp_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP3_PHY_PLL_VCO_DIV_CLK, 3 },
+	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 4 },
+	{ P_DP2_PHY_PLL_VCO_DIV_CLK, 6 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP3_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP1_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP2_PHY_PLL_VCO_DIV_CLK },
+};
+
+static const struct parent_map disp_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP1_PHY_PLL_LINK_CLK, 2 },
+	{ P_DP2_PHY_PLL_LINK_CLK, 3 },
+	{ P_DP3_PHY_PLL_LINK_CLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP1_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP2_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP3_PHY_PLL_LINK_CLK },
+};
+
+static const struct parent_map disp_cc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DISP_CC_PLL2_OUT_MAIN, 2 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 3 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
+	{ .hw = &disp_cc_pll2.clkr.hw },
+	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
+};
+
+static const struct parent_map disp_cc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP0_PHY_PLL_VCO_DIV_CLK, 2 },
+	{ P_DP3_PHY_PLL_VCO_DIV_CLK, 3 },
+	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 4 },
+	{ P_DP2_PHY_PLL_VCO_DIV_CLK, 6 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP0_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP0_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP3_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP1_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP2_PHY_PLL_VCO_DIV_CLK },
+};
+
+static const struct parent_map disp_cc_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_6[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map disp_cc_parent_map_7[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
+	{ P_DISP_CC_PLL1_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_7[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &disp_cc_pll1.clkr.hw },
+	{ .hw = &disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_parent_map_8[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP1_PHY_PLL_LINK_CLK, 2 },
+	{ P_DP2_PHY_PLL_LINK_CLK, 3 },
+	{ P_DP3_PHY_PLL_LINK_CLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_8[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP0_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP1_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP2_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP3_PHY_PLL_LINK_CLK },
+};
+
+static const struct parent_map disp_cc_parent_map_9[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_9[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &disp_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map disp_cc_parent_map_10[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_HDMI_PHY_PLL_CLK, 1 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_10[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_HDMI_PHY_PLL_CLK },
+};
+
+static const struct parent_map disp_cc_parent_map_11[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
+	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
+	{ P_DISP_CC_PLL1_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_11[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &disp_cc_pll0.clkr.hw },
+	{ .hw = &disp_cc_pll1.clkr.hw },
+	{ .hw = &disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_parent_map_12[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISP_CC_PLL2_OUT_MAIN, 2 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_12[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &disp_cc_pll2.clkr.hw },
+};
+
+static const struct parent_map disp_cc_parent_map_13[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_13_ao[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_disp_cc_esync0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_esync0_clk_src = {
+	.cmd_rcgr = 0x80c0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_4,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_esync0_clk_src",
+		.parent_data = disp_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_esync1_clk_src = {
+	.cmd_rcgr = 0x80d8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_4,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_esync1_clk_src",
+		.parent_data = disp_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(37500000, P_DISP_CC_PLL1_OUT_MAIN, 16, 0, 0),
+	F(75000000, P_DISP_CC_PLL1_OUT_MAIN, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
+	.cmd_rcgr = 0x8360,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_7,
+	.freq_tbl = ftbl_disp_cc_mdss_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_ahb_clk_src",
+		.parent_data = disp_cc_parent_data_7,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_7),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
+	.cmd_rcgr = 0x8180,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_byte0_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_byte1_clk_src = {
+	.cmd_rcgr = 0x819c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_byte1_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
+	.cmd_rcgr = 0x8234,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx0_aux_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx0_link_clk_src = {
+	.cmd_rcgr = 0x81e8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_8,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx0_link_clk_src",
+		.parent_data = disp_cc_parent_data_8,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_8),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx0_pixel0_clk_src = {
+	.cmd_rcgr = 0x8204,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_5,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx0_pixel0_clk_src",
+		.parent_data = disp_cc_parent_data_5,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx0_pixel1_clk_src = {
+	.cmd_rcgr = 0x821c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_5,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx0_pixel1_clk_src",
+		.parent_data = disp_cc_parent_data_5,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
+	.cmd_rcgr = 0x8298,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx1_aux_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx1_link_clk_src = {
+	.cmd_rcgr = 0x827c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_3,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx1_link_clk_src",
+		.parent_data = disp_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx1_pixel0_clk_src = {
+	.cmd_rcgr = 0x824c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx1_pixel0_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx1_pixel1_clk_src = {
+	.cmd_rcgr = 0x8264,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx1_pixel1_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx2_aux_clk_src = {
+	.cmd_rcgr = 0x82fc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx2_aux_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx2_link_clk_src = {
+	.cmd_rcgr = 0x82b0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_3,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx2_link_clk_src",
+		.parent_data = disp_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx2_pixel0_clk_src = {
+	.cmd_rcgr = 0x82cc,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx2_pixel0_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx2_pixel1_clk_src = {
+	.cmd_rcgr = 0x82e4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx2_pixel1_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx3_aux_clk_src = {
+	.cmd_rcgr = 0x8348,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx3_aux_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx3_link_clk_src = {
+	.cmd_rcgr = 0x832c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_3,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx3_link_clk_src",
+		.parent_data = disp_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx3_pixel0_clk_src = {
+	.cmd_rcgr = 0x8314,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx3_pixel0_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
+	.cmd_rcgr = 0x81b8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_6,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_esc0_clk_src",
+		.parent_data = disp_cc_parent_data_6,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
+	.cmd_rcgr = 0x81d0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_6,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_esc1_clk_src",
+		.parent_data = disp_cc_parent_data_6,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_hdmi_app_clk_src = {
+	.cmd_rcgr = 0x83a8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_9,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_hdmi_app_clk_src",
+		.parent_data = disp_cc_parent_data_9,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_hdmi_pclk_clk_src = {
+	.cmd_rcgr = 0x8390,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_10,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_hdmi_pclk_clk_src",
+		.parent_data = disp_cc_parent_data_10,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_10),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
+	F(85714286, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(100000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(150000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(207000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(342000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(417000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(535000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(600000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(660000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
+	.cmd_rcgr = 0x8150,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_11,
+	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_mdp_clk_src",
+		.parent_data = disp_cc_parent_data_11,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_11),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
+	.cmd_rcgr = 0x8108,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_pclk0_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
+	.cmd_rcgr = 0x8120,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_pclk1_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_pclk2_clk_src = {
+	.cmd_rcgr = 0x8138,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_pclk2_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
+	.cmd_rcgr = 0x8168,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_vsync_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_osc_clk_src[] = {
+	F(38400000, P_DISP_CC_PLL2_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_osc_clk_src = {
+	.cmd_rcgr = 0x80f0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_12,
+	.freq_tbl = ftbl_disp_cc_osc_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_osc_clk_src",
+		.parent_data = disp_cc_parent_data_12,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_12),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_sleep_clk_src = {
+	.cmd_rcgr = 0xe064,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_13,
+	.freq_tbl = ftbl_disp_cc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_sleep_clk_src",
+		.parent_data = disp_cc_parent_data_13_ao,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_13_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_xo_clk_src = {
+	.cmd_rcgr = 0xe044,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_xo_clk_src",
+		.parent_data = disp_cc_parent_data_0_ao,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
+	.reg = 0x8198,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_byte0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_byte0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
+	.reg = 0x81b4,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_byte1_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_byte1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_dptx0_link_div_clk_src = {
+	.reg = 0x8200,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx0_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_dptx1_link_div_clk_src = {
+	.reg = 0x8294,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx1_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_dptx2_link_div_clk_src = {
+	.reg = 0x82c8,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx2_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_dptx3_link_div_clk_src = {
+	.reg = 0x8344,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx3_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_hdmi_pclk_div_clk_src = {
+	.reg = 0x838c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_hdmi_pclk_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_hdmi_pclk_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch disp_cc_esync0_clk = {
+	.halt_reg = 0x80b8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_esync0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_esync0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_esync1_clk = {
+	.halt_reg = 0x80bc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_esync1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_esync1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_accu_shift_clk = {
+	.halt_reg = 0xe060,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xe060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_accu_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_ahb1_clk = {
+	.halt_reg = 0xa028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_ahb1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_ahb_clk = {
+	.halt_reg = 0x80b0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte0_clk = {
+	.halt_reg = 0x8034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_byte0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte0_intf_clk = {
+	.halt_reg = 0x8038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_byte0_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte1_clk = {
+	.halt_reg = 0x803c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x803c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_byte1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte1_intf_clk = {
+	.halt_reg = 0x8040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_byte1_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_aux_clk = {
+	.halt_reg = 0x8064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_crypto_clk = {
+	.halt_reg = 0x8058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_link_clk = {
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_link_intf_clk = {
+	.halt_reg = 0x8054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_pixel0_clk = {
+	.halt_reg = 0x805c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x805c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_pixel1_clk = {
+	.halt_reg = 0x8060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_usb_router_link_intf_clk = {
+	.halt_reg = 0x8050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_usb_router_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_aux_clk = {
+	.halt_reg = 0x8080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_crypto_clk = {
+	.halt_reg = 0x807c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x807c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_link_clk = {
+	.halt_reg = 0x8070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_link_intf_clk = {
+	.halt_reg = 0x8078,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8078,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_pixel0_clk = {
+	.halt_reg = 0x8068,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_pixel1_clk = {
+	.halt_reg = 0x806c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x806c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_usb_router_link_intf_clk = {
+	.halt_reg = 0x8074,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_usb_router_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_aux_clk = {
+	.halt_reg = 0x8098,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8098,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_crypto_clk = {
+	.halt_reg = 0x8094,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8094,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_link_clk = {
+	.halt_reg = 0x808c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x808c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_link_intf_clk = {
+	.halt_reg = 0x8090,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_pixel0_clk = {
+	.halt_reg = 0x8084,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8084,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_pixel1_clk = {
+	.halt_reg = 0x8088,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx3_aux_clk = {
+	.halt_reg = 0x80a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx3_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx3_crypto_clk = {
+	.halt_reg = 0x80ac,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx3_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx3_link_clk = {
+	.halt_reg = 0x80a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx3_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx3_link_intf_clk = {
+	.halt_reg = 0x80a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx3_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx3_pixel0_clk = {
+	.halt_reg = 0x809c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x809c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx3_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_esc0_clk = {
+	.halt_reg = 0x8044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_esc0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_esc0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_esc1_clk = {
+	.halt_reg = 0x8048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_esc1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_esc1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_hdmi_ahbm_clk = {
+	.halt_reg = 0x8378,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8378,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_hdmi_ahbm_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_hdmi_app_clk = {
+	.halt_reg = 0x8388,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8388,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_hdmi_app_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_hdmi_app_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_hdmi_crypto_clk = {
+	.halt_reg = 0x8384,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8384,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_hdmi_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_hdmi_pclk_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_hdmi_intf_clk = {
+	.halt_reg = 0x8380,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8380,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_hdmi_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_hdmi_pclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_hdmi_pclk_clk = {
+	.halt_reg = 0x837c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x837c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_hdmi_pclk_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_hdmi_pclk_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp1_clk = {
+	.halt_reg = 0xa004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_mdp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_clk = {
+	.halt_reg = 0x8010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_mdp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_lut1_clk = {
+	.halt_reg = 0xa014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_mdp_lut1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
+	.halt_reg = 0x8020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_mdp_lut_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_non_gdsc_ahb_clk = {
+	.halt_reg = 0xc004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xc004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_non_gdsc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_pclk0_clk = {
+	.halt_reg = 0x8004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_pclk0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_pclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_pclk1_clk = {
+	.halt_reg = 0x8008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_pclk1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_pclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_pclk2_clk = {
+	.halt_reg = 0x800c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x800c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_pclk2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_pclk2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_vsync1_clk = {
+	.halt_reg = 0xa024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_vsync1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_vsync_clk = {
+	.halt_reg = 0x8030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_vsync_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_osc_clk = {
+	.halt_reg = 0x80b4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_osc_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_osc_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc mdss_gdsc = {
+	.gdscr = 0x9000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "mdss_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc mdss_int2_gdsc = {
+	.gdscr = 0xb000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "mdss_int2_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *disp_cc_eliza_clocks[] = {
+	[DISP_CC_ESYNC0_CLK] = &disp_cc_esync0_clk.clkr,
+	[DISP_CC_ESYNC0_CLK_SRC] = &disp_cc_esync0_clk_src.clkr,
+	[DISP_CC_ESYNC1_CLK] = &disp_cc_esync1_clk.clkr,
+	[DISP_CC_ESYNC1_CLK_SRC] = &disp_cc_esync1_clk_src.clkr,
+	[DISP_CC_MDSS_ACCU_SHIFT_CLK] = &disp_cc_mdss_accu_shift_clk.clkr,
+	[DISP_CC_MDSS_AHB1_CLK] = &disp_cc_mdss_ahb1_clk.clkr,
+	[DISP_CC_MDSS_AHB_CLK] = &disp_cc_mdss_ahb_clk.clkr,
+	[DISP_CC_MDSS_AHB_CLK_SRC] = &disp_cc_mdss_ahb_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_CLK] = &disp_cc_mdss_byte0_clk.clkr,
+	[DISP_CC_MDSS_BYTE0_CLK_SRC] = &disp_cc_mdss_byte0_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_DIV_CLK_SRC] = &disp_cc_mdss_byte0_div_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_INTF_CLK] = &disp_cc_mdss_byte0_intf_clk.clkr,
+	[DISP_CC_MDSS_BYTE1_CLK] = &disp_cc_mdss_byte1_clk.clkr,
+	[DISP_CC_MDSS_BYTE1_CLK_SRC] = &disp_cc_mdss_byte1_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE1_DIV_CLK_SRC] = &disp_cc_mdss_byte1_div_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE1_INTF_CLK] = &disp_cc_mdss_byte1_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_AUX_CLK] = &disp_cc_mdss_dptx0_aux_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_AUX_CLK_SRC] = &disp_cc_mdss_dptx0_aux_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX0_CRYPTO_CLK] = &disp_cc_mdss_dptx0_crypto_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_LINK_CLK] = &disp_cc_mdss_dptx0_link_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_LINK_CLK_SRC] = &disp_cc_mdss_dptx0_link_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx0_link_div_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX0_LINK_INTF_CLK] = &disp_cc_mdss_dptx0_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_PIXEL0_CLK] = &disp_cc_mdss_dptx0_pixel0_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx0_pixel0_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX0_PIXEL1_CLK] = &disp_cc_mdss_dptx0_pixel1_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC] = &disp_cc_mdss_dptx0_pixel1_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK] =
+		&disp_cc_mdss_dptx0_usb_router_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_AUX_CLK] = &disp_cc_mdss_dptx1_aux_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_AUX_CLK_SRC] = &disp_cc_mdss_dptx1_aux_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX1_CRYPTO_CLK] = &disp_cc_mdss_dptx1_crypto_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_LINK_CLK] = &disp_cc_mdss_dptx1_link_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_LINK_CLK_SRC] = &disp_cc_mdss_dptx1_link_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx1_link_div_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX1_LINK_INTF_CLK] = &disp_cc_mdss_dptx1_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_PIXEL0_CLK] = &disp_cc_mdss_dptx1_pixel0_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx1_pixel0_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX1_PIXEL1_CLK] = &disp_cc_mdss_dptx1_pixel1_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC] = &disp_cc_mdss_dptx1_pixel1_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK] =
+		&disp_cc_mdss_dptx1_usb_router_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_AUX_CLK] = &disp_cc_mdss_dptx2_aux_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_AUX_CLK_SRC] = &disp_cc_mdss_dptx2_aux_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX2_CRYPTO_CLK] = &disp_cc_mdss_dptx2_crypto_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_LINK_CLK] = &disp_cc_mdss_dptx2_link_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_LINK_CLK_SRC] = &disp_cc_mdss_dptx2_link_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx2_link_div_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX2_LINK_INTF_CLK] = &disp_cc_mdss_dptx2_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_PIXEL0_CLK] = &disp_cc_mdss_dptx2_pixel0_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx2_pixel0_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX2_PIXEL1_CLK] = &disp_cc_mdss_dptx2_pixel1_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC] = &disp_cc_mdss_dptx2_pixel1_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX3_AUX_CLK] = &disp_cc_mdss_dptx3_aux_clk.clkr,
+	[DISP_CC_MDSS_DPTX3_AUX_CLK_SRC] = &disp_cc_mdss_dptx3_aux_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX3_CRYPTO_CLK] = &disp_cc_mdss_dptx3_crypto_clk.clkr,
+	[DISP_CC_MDSS_DPTX3_LINK_CLK] = &disp_cc_mdss_dptx3_link_clk.clkr,
+	[DISP_CC_MDSS_DPTX3_LINK_CLK_SRC] = &disp_cc_mdss_dptx3_link_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx3_link_div_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX3_LINK_INTF_CLK] = &disp_cc_mdss_dptx3_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX3_PIXEL0_CLK] = &disp_cc_mdss_dptx3_pixel0_clk.clkr,
+	[DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx3_pixel0_clk_src.clkr,
+	[DISP_CC_MDSS_ESC0_CLK] = &disp_cc_mdss_esc0_clk.clkr,
+	[DISP_CC_MDSS_ESC0_CLK_SRC] = &disp_cc_mdss_esc0_clk_src.clkr,
+	[DISP_CC_MDSS_ESC1_CLK] = &disp_cc_mdss_esc1_clk.clkr,
+	[DISP_CC_MDSS_ESC1_CLK_SRC] = &disp_cc_mdss_esc1_clk_src.clkr,
+	[DISP_CC_MDSS_HDMI_AHBM_CLK] = &disp_cc_mdss_hdmi_ahbm_clk.clkr,
+	[DISP_CC_MDSS_HDMI_APP_CLK] = &disp_cc_mdss_hdmi_app_clk.clkr,
+	[DISP_CC_MDSS_HDMI_APP_CLK_SRC] = &disp_cc_mdss_hdmi_app_clk_src.clkr,
+	[DISP_CC_MDSS_HDMI_CRYPTO_CLK] = &disp_cc_mdss_hdmi_crypto_clk.clkr,
+	[DISP_CC_MDSS_HDMI_INTF_CLK] = &disp_cc_mdss_hdmi_intf_clk.clkr,
+	[DISP_CC_MDSS_HDMI_PCLK_CLK] = &disp_cc_mdss_hdmi_pclk_clk.clkr,
+	[DISP_CC_MDSS_HDMI_PCLK_CLK_SRC] = &disp_cc_mdss_hdmi_pclk_clk_src.clkr,
+	[DISP_CC_MDSS_HDMI_PCLK_DIV_CLK_SRC] = &disp_cc_mdss_hdmi_pclk_div_clk_src.clkr,
+	[DISP_CC_MDSS_MDP1_CLK] = &disp_cc_mdss_mdp1_clk.clkr,
+	[DISP_CC_MDSS_MDP_CLK] = &disp_cc_mdss_mdp_clk.clkr,
+	[DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.clkr,
+	[DISP_CC_MDSS_MDP_LUT1_CLK] = &disp_cc_mdss_mdp_lut1_clk.clkr,
+	[DISP_CC_MDSS_MDP_LUT_CLK] = &disp_cc_mdss_mdp_lut_clk.clkr,
+	[DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &disp_cc_mdss_non_gdsc_ahb_clk.clkr,
+	[DISP_CC_MDSS_PCLK0_CLK] = &disp_cc_mdss_pclk0_clk.clkr,
+	[DISP_CC_MDSS_PCLK0_CLK_SRC] = &disp_cc_mdss_pclk0_clk_src.clkr,
+	[DISP_CC_MDSS_PCLK1_CLK] = &disp_cc_mdss_pclk1_clk.clkr,
+	[DISP_CC_MDSS_PCLK1_CLK_SRC] = &disp_cc_mdss_pclk1_clk_src.clkr,
+	[DISP_CC_MDSS_PCLK2_CLK] = &disp_cc_mdss_pclk2_clk.clkr,
+	[DISP_CC_MDSS_PCLK2_CLK_SRC] = &disp_cc_mdss_pclk2_clk_src.clkr,
+	[DISP_CC_MDSS_VSYNC1_CLK] = &disp_cc_mdss_vsync1_clk.clkr,
+	[DISP_CC_MDSS_VSYNC_CLK] = &disp_cc_mdss_vsync_clk.clkr,
+	[DISP_CC_MDSS_VSYNC_CLK_SRC] = &disp_cc_mdss_vsync_clk_src.clkr,
+	[DISP_CC_OSC_CLK] = &disp_cc_osc_clk.clkr,
+	[DISP_CC_OSC_CLK_SRC] = &disp_cc_osc_clk_src.clkr,
+	[DISP_CC_PLL0] = &disp_cc_pll0.clkr,
+	[DISP_CC_PLL1] = &disp_cc_pll1.clkr,
+	[DISP_CC_PLL2] = &disp_cc_pll2.clkr,
+	[DISP_CC_SLEEP_CLK_SRC] = &disp_cc_sleep_clk_src.clkr,
+	[DISP_CC_XO_CLK_SRC] = &disp_cc_xo_clk_src.clkr,
+};
+
+static const struct qcom_reset_map disp_cc_eliza_resets[] = {
+	[DISP_CC_MDSS_CORE_BCR] = { 0x8000 },
+	[DISP_CC_MDSS_CORE_INT2_BCR] = { 0xa000 },
+	[DISP_CC_MDSS_RSCC_BCR] = { 0xc000 },
+};
+
+static struct gdsc *disp_cc_eliza_gdscs[] = {
+	[MDSS_GDSC] = &mdss_gdsc,
+	[MDSS_INT2_GDSC] = &mdss_int2_gdsc,
+};
+
+static const struct regmap_config disp_cc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf004, /* 0x10000, 0x10004 and maybe others are for TZ */
+	.fast_io = true,
+};
+
+static struct clk_alpha_pll *disp_cc_eliza_plls[] = {
+	&disp_cc_pll0,
+	&disp_cc_pll1,
+	&disp_cc_pll2,
+};
+
+static u32 disp_cc_eliza_critical_cbcrs[] = {
+	0xe07c, /* DISP_CC_SLEEP_CLK */
+	0xe05c, /* DISP_CC_XO_CLK */
+	0xc00c, /* DISP_CC_MDSS_RSCC_AHB_CLK */
+	0xc008, /* DISP_CC_MDSS_RSCC_VSYNC_CLK */
+};
+
+static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Enable clock gating for MDP clocks */
+	regmap_update_bits(regmap, DISP_CC_MISC_CMD, BIT(4), BIT(4));
+}
+
+static struct qcom_cc_driver_data disp_cc_eliza_driver_data = {
+	.alpha_plls = disp_cc_eliza_plls,
+	.num_alpha_plls = ARRAY_SIZE(disp_cc_eliza_plls),
+	.clk_cbcrs = disp_cc_eliza_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_eliza_critical_cbcrs),
+	.clk_regs_configure = clk_eliza_regs_configure,
+};
+
+static const struct qcom_cc_desc disp_cc_eliza_desc = {
+	.config = &disp_cc_eliza_regmap_config,
+	.clks = disp_cc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(disp_cc_eliza_clocks),
+	.resets = disp_cc_eliza_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_eliza_resets),
+	.gdscs = disp_cc_eliza_gdscs,
+	.num_gdscs = ARRAY_SIZE(disp_cc_eliza_gdscs),
+	.use_rpm = true,
+	.driver_data = &disp_cc_eliza_driver_data,
+};
+
+static const struct of_device_id disp_cc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-dispcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, disp_cc_eliza_match_table);
+
+static int disp_cc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &disp_cc_eliza_desc);
+}
+
+static struct platform_driver disp_cc_eliza_driver = {
+	.probe = disp_cc_eliza_probe,
+	.driver = {
+		.name = "dispcc-eliza",
+		.of_match_table = disp_cc_eliza_match_table,
+	},
+};
+
+module_platform_driver(disp_cc_eliza_driver);
+
+MODULE_DESCRIPTION("QTI DISPCC Eliza Driver");
+MODULE_LICENSE("GPL");

-- 
2.51.0


