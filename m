Return-Path: <linux-arm-msm+bounces-103342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPYBEPia4GnokAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:16:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D2540B696
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08F7F31ACE95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 08:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9879D38C438;
	Thu, 16 Apr 2026 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ik4oc3ay";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzPnVhLY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1295338F656
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327046; cv=none; b=QW61VVWx03F7rD/22VlLs3vZQAOEsUmIDKGWP9n2WmgBopEjO59Ov6UVimyIFTKXu3eX1gnd0D1BYM1+xx+Bj69XiAXnh1Z7WZZ8XpTN/uXAw67MX5BFjc3RMrpccne1hGye8Av9j6t2jb5pW63EQ/KN1WtvroAtU4CTbxDiTkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327046; c=relaxed/simple;
	bh=7Mz5JA1XciYlDzFD487VZZnQ3bm+WLPuAB7kEsEf1zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpKak0TbAwPVb8TGsBPS5CLk6doaixaOspj7S7xCo0XeDvoXjRA7gXnfUqhKHQ+rbZi0KgEKDq91urN9Fi6HSrfJmhy2kgxHg/mjw4WrbIXZ4/IlfPx6sGrt6QG74f0QKAkodzsTwYpenEXjbjlAnTIDReOysD0baN8gv+B8mmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ik4oc3ay; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzPnVhLY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G4TDmU1553076
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7f66angE3py2UobQkhzAnFDK+vHqTZqF1z/zyf+TXZM=; b=Ik4oc3ayUmMPh3h4
	LvMEIbUQoCvudkzQHX0b6EdNkaS02WMAHvPPxRdVSanSAKGOm60+9yX89oi+4/X4
	2upCggN2hHPmV5MoJy6oc+mrb6Dw9h5FxI8cR5yui4i9/QwJO1dglpA/nmoME2eL
	J1roOcETUyyOfyppGEvxFE1HBcU6mvt2Kp6GOgHb0/X1lkF/pC6pPMphKuDewjtc
	h+dbZKZxDVd8GFD1r90YvmLTfVI8a1ORlxo4gPYYgv+3gXFx4vAW731MsSpO+di6
	H1RybZcbUkSJI70azjmdXk+xQGJCV9RohSOTZE3rOI19o9n1S1N6c4Oj5aN4rkO3
	pS9jrg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djrsn8pbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:10:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b34223670so278109021cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 01:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776327043; x=1776931843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7f66angE3py2UobQkhzAnFDK+vHqTZqF1z/zyf+TXZM=;
        b=TzPnVhLYd4dJHXaQc0yAtFAtRpkNdJdewOg0larvOjVyjnhncqL10O1KX5FNdT67xH
         iZvHWK/yxOgr9VCopSDq8vZqkaHx4PcX5STg5S7hEiUh7rbWms3l8djBHeWcTXcKY24v
         FJEXZGJTBYCSwZ/Yp7FvgdThFVHEvFwVOPtcTQWi35x9asqhHWX2tt6Fi1uLn/1js7bv
         kMjQ+YkLBBuZfngYFD/WK9OnW5b9JWsEZiZRfZkd+2UYm5x7J2AwvZkuiJXUtsuH9QFl
         s+U0C6fUgusuagmdX40HDHoBsX89SQ87fQI+wxLZwZg33RaxsLfLnGwprwQ9g9ntxIKe
         hNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327043; x=1776931843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7f66angE3py2UobQkhzAnFDK+vHqTZqF1z/zyf+TXZM=;
        b=ri38hNwx/4t3BFShb1GiwAxpzS/mi9/rSpZJFsD5JBvUxE79HXYLt5lRR4fzEd8ZJm
         UJZtAyG8S6XA2FnRW8nij3i4twJAKa3o/pYttIAOspIbm6w8HlgJmuDY9n0Xh42RL6vk
         h0lRCoZKOOfGJ39k+JfcGL7DDubts/G4qY6b9n/bVsMNK1NdkBJLbYiiHiRuJ3VnHUUi
         0AlwLeDgmw9tw8gI0W/GHyCdLS9Tb83KNf/KzGdCC1qZZ70pqwspiVWP27Hp6rCFEkIb
         cX4NnpFiAOC8OatAIkoXsQxcZTP0hDL84epEXPLRAiotSMQ60nXgIIopt10qrSMu1k/d
         dk1A==
X-Gm-Message-State: AOJu0YzjJz6r51PPZUAjem3DinEURS7P0JFyhYbHlILTG4sH3VT4I0fr
	TcxDJpBoDrnW4Arc97HbJBftjDvLYnNf6A4gREEmAtro8kLieGbOqyDdVZiRROhIBzUWaslkws2
	SNNDeghuuEnlnyIynionNRJIj7xwsM04wJHigH5+Uz5OB8W/oVsJ3aPN/RLt1uPVi6YcjDFDLn0
	IA
X-Gm-Gg: AeBDieuK+9aLIh2060AXy+UHS/OZytbEronhDr/Blh7qrUjEPm0PqqB8VGzzfxVBAA/
	Ll8UsfpKKqSWicJWQJcUhIRvu2R8YXe03cwqk0Oyd/IFXDTBXbVZcXhl7gOsMDOJKBc4Civ4aqs
	LrGr6zNV8qLgjSnKS/AGG3PGzlTFJT6dEbynSlmHx1OtW1tEABkKZCwP7AFMsndEP8j8Bs9y3EY
	s1JWMChnaL1yk3sRCvwO3NQKFJZ+Sppk7waXjqOJKhW/Y2dAagHW/m1KKtlUxZsee7MvElbRvMD
	y0ewunVw2mA9kR19gRpyYd8w16jjlkXv4zRoA9Tot84iO9CMrDAf+pj6SbWH/scgC01LqQJYPox
	/diBYWdaaZjC5SwdMDSMpZKU4zP1mvvasQS2nWqteNSSc
X-Received: by 2002:ac8:5a51:0:b0:509:44c3:5fe7 with SMTP id d75a77b69052e-50dd5d104b3mr405145671cf.46.1776327043082;
        Thu, 16 Apr 2026 01:10:43 -0700 (PDT)
X-Received: by 2002:ac8:5a51:0:b0:509:44c3:5fe7 with SMTP id d75a77b69052e-50dd5d104b3mr405145361cf.46.1776327042585;
        Thu, 16 Apr 2026 01:10:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35bf1esm12059571f8f.16.2026.04.16.01.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 01:10:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:10:29 +0200
Subject: [PATCH 1/4] clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574, QCM2290
 and others to ARM64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-clk-qcom-defaults-v1-1-579e75c4cfe5@oss.qualcomm.com>
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
In-Reply-To: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3446;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7Mz5JA1XciYlDzFD487VZZnQ3bm+WLPuAB7kEsEf1zc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp4Jl7XxiUpc3vfcdy1VWDp6n0LIK3LawB5QH/k
 wPb7Onl3MuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaeCZewAKCRDBN2bmhouD
 135/D/4v0piLlmVCEzGWNDrrhoQ0RLUO9+mxByX05JZ27iFTOdM+4vPnjB0aEOV2FlliHFE5mJp
 XxNZfpsmPxmhmIN1WNvGOfa9jlU7VXAo5keTk/VRnCm0R3r2cOUfhYM5P44sQh9YpW1MCGbjvcJ
 Z4jbOtryD2p9Nj3MUQZGevq3JhWsvxo93Gg8gYMBrOzRP6Adz+2q7mjdO9528feSakm8srfH1d1
 6dwnNEQbRRqgDaIEaDhEEHsKZ+4nhhrCPhH3NhVA2Z7pYrvoeQPuxoHi9SM2rGVgtuCfcbe5hQ8
 58ivtBo5Lmu9PkUceyKBZ/OGrdlcFnMoRbQsH1DrUS8ignKrbsi4HJ3JowrkCHcJ5254S8rfY6A
 fHYGy7hu4S6/XyKnAvC7oduNnHg5xHdNDCGHEk2nnmKM4hyqLYo8BRtlbR1THnWMOK7+dllv+I0
 yPLSUk7fq9S6C0styEGkmWUj0VoRLhg4IwD1pnaV8iiEUj0Z+oJ7uJdfUim9aQATxEs4joX8u+P
 JQAqTD/p9g3UeXtGRV9dIh5UGcCHsiFRi1VY4HgMl0FpoTZkBEHkOai1mX0nuwtz2aY76cRIfIh
 qDu58XXTepu13ljMkXZcGuRfMZ0lZux7Hv89jX6Y1cKSQOl8Tg6SY+IXLrLi0uwFYJURJ7frZDr
 ZmLFRB3QGESYqQA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: K5aQ9ahdAegAZFbdvUxHAOJfyEYlNVtI
X-Proofpoint-GUID: K5aQ9ahdAegAZFbdvUxHAOJfyEYlNVtI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3NiBTYWx0ZWRfX+z3EHcws6P8w
 jTVXA4dfqN2ze0/FnshlpyToG2ZMek/LEYfMyDPmAqxCUYPz/6Tz7JAbxcHzxz/nisK/9/BKLtn
 XASn2HbzRkLH5LI5Ike/2Zr0RE/WhWpcOgp0sJfZcZBgYSVoiyhgeLnQ4fKfYGREmXZmUBt1mol
 WWtjk/jRU8qjumgoG7r2vAkiwqcrBbfGzWOgl2NpnPp0c5CIqc+w7DRcba75NaroznwI3a+hlOC
 RGOxF2dS7ETFEsrL7v4oKkDljImBIdKufxMPq4RTpYUD+hDBvfINIqxjcq37aTDmFt75Rgre5s+
 P+4sScpVU9EeWQQ+6ME2z/9jvBs8XBMtk1NqilsadPHgc+qdsPwFuorFBizTzQNktliYLkKOhir
 6QTlZYLFCOyk7Aauazwt9AdXQFvlEuzoMEKKqIjeLJgbe5O3RxqXF09OGT5aHqqkI8nyJeLwOYX
 1GfDcJvBkooynuGlcTg==
X-Authority-Analysis: v=2.4 cv=EojiaycA c=1 sm=1 tr=0 ts=69e09984 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=oh4px0T-8jNy5rkF8LYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103342-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0D2540B696
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some clock drivers for IPQ5424, IPQ9574, QCM2290, QDU1000 and SA8775
already depend on ARM64.  IPQ6018 is ARM64 only SoC (at least upstream)
so should not be a choice for ARM 32-bit builds, to make kernels smaller
and user choices easier.

IPQ_CMN_PLL is used only by the SoCs already having clock controllers
restricted to ARM64

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index df21ef5ffd68..62489ab705ae 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -325,6 +325,7 @@ config IPQ_APSS_PLL
 
 config IPQ_APSS_5424
 	tristate "IPQ5424 APSS Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select IPQ_APSS_PLL
 	default y if IPQ_GCC_5424
 	help
@@ -335,6 +336,7 @@ config IPQ_APSS_5424
 config IPQ_APSS_6018
 	tristate "IPQ6018 APSS Clock Controller"
 	select IPQ_APSS_PLL
+	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	depends on QCOM_SMEM
 	help
@@ -346,6 +348,7 @@ config IPQ_APSS_6018
 
 config IPQ_CMN_PLL
 	tristate "IPQ CMN PLL Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for CMN PLL clock controller on IPQ platform. The
 	  CMN PLL consumes the AHB/SYS clocks from GCC and supplies
@@ -394,6 +397,7 @@ config IPQ_GCC_5424
 
 config IPQ_GCC_6018
 	tristate "IPQ6018 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for global clock controller on ipq6018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -419,6 +423,7 @@ config IPQ_LCC_806X
 
 config IPQ_GCC_8074
 	tristate "IPQ8074 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for global clock controller on ipq8074 devices.
@@ -428,6 +433,7 @@ config IPQ_GCC_8074
 
 config IPQ_GCC_9574
 	tristate "IPQ9574 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for global clock controller on ipq9574 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -642,6 +648,7 @@ config MSM_MMCC_8998
 
 config QCM_GCC_2290
 	tristate "QCM2290 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for the global clock controller on QCM2290 devices.
@@ -650,6 +657,7 @@ config QCM_GCC_2290
 
 config QCM_DISPCC_2290
 	tristate "QCM2290 Display Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCM_GCC_2290
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
@@ -821,6 +829,7 @@ config SC_DISPCC_8280XP
 config SA_GCC_8775P
 	tristate "SA8775 Global Clock Controller"
 	select QCOM_GDSC
+	depends on ARM64 || COMPILE_TEST
 	depends on COMMON_CLK_QCOM
 	help
 	  Support for the global clock controller on SA8775 devices.
@@ -829,6 +838,7 @@ config SA_GCC_8775P
 
 config SA_GPUCC_8775P
 	tristate "SA8775P Graphics clock controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	select SA_GCC_8775P
 	help
@@ -1031,6 +1041,7 @@ config QCS_Q6SSTOP_404
 
 config QDU_GCC_1000
 	tristate "QDU1000/QRU1000 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for the global clock controller on QDU1000 and

-- 
2.51.0


