Return-Path: <linux-arm-msm+bounces-112225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1MFwHW41KGrGAAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:46:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F86661F32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:46:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=InrtumcN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UCkQu6uu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112225-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112225-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73A333293FC4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E1436728E;
	Tue,  9 Jun 2026 15:32:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39B48B370
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:32:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019173; cv=none; b=sfluswJw+QXjdVhra1aIebIPJMH1T1CD5IfXeIa49TloNE+AQ9P1bI2tFYWQlm1r9Z71vRsg1dZTbj1pukPvHilJExaR75+yh7k6uJ9Qt411b+yAC6VHzlbS8kYqF7NqLWJ9ey582hGYEO9yOM0LWcvd2f6oQbqY0DSdgKKF/Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019173; c=relaxed/simple;
	bh=YtkDqGD6pTPYNLs03sWSOZZV3ZbqbTsOJL3wyJ53BuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PasJZHbnuD9s9Ols1we05Juor+PZuvzl3V0Lk/TNDrN8RNaKbB83+6ekx5EQc6v98KvMnlx4+DGR/X3A7oc3Z9NuWKQFur1ME4hGtsvz4kE9QbPDywOp5827CcDZJW2VCOWecbGl27o4QnrGcGD1dHd6cSBQxhAm6SqO/1EvuVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InrtumcN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCkQu6uu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClZJO2706236
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxJjsAICW8MyuaCsBeQPeHdq+n5ERy6rvqR/41B/dY0=; b=InrtumcNAlNEzsq4
	i/jTth7Oreg9fzEbrh478SimQ0wa3xzH0O3TQ+z0qcQ+SY81u8ThnNqJH8pfxdvy
	tSuGdvLIKtvyX79AKEcG7rwxfN3xlo7UAZ1ZWnk2Lgl6sbHnhN9WiPzIf9hO80CM
	qJnpO3XA4A8MF8KmLTPebaaRA2ZaSuLBo5tIklD/XT4QwUqRJ9XWCGo10emzb+8J
	j2XTbI6QZz145F/BHhlQn1oA9rSSfkYzK72IitSvOhaWQtUZ5jVI25Jt58yBi1RB
	3KK7o7XMfNvxHOHvTTjtVt+StECF0khBZ5NLJBMuRK7OLayuvB2NEEMlipMwr8X1
	pD8dVw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt205p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:32:51 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e6daf5d8f3so1718537a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019171; x=1781623971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxJjsAICW8MyuaCsBeQPeHdq+n5ERy6rvqR/41B/dY0=;
        b=UCkQu6uunas/yWAjIlxG7swE/4Mb5tw4PtjLyLJYziuvpuw4go1sNW/FjdGA2LKvv/
         LjJSu2++j2zoIRxHxbWP/6RL3SVBwuj5DyWWRIzkNgUTR0nAUlHW42YzpYpBjxupF7dI
         5wHJajntJZLBVr0cvV9OpeS8czjOS8Y0j8FxBMxcIkX/2ZR56ASlsCbA4bavw6hn3PX4
         Km0hSusefx1mLyY7o6wxhPQgCDaI4jLfJ+PiRStLa6swoykPI6juVS9GKHfr0aaIaN+l
         aGtmqgcRJmhCPNtUW36F232k4KUYCJ0sKEdyAKShbKC3buGDqGtNX5ryI3Hpay63Jg5r
         cOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019171; x=1781623971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RxJjsAICW8MyuaCsBeQPeHdq+n5ERy6rvqR/41B/dY0=;
        b=ECy6wsVXXB6/Bfkm/WgIaocEGgam3UzD/ZrD4mRtkJZbm+TNtaWuh9Itxl41grUF5L
         jM8Mlz6jHqOVwEFFJjFGk368CJoKwejkNYXuqtH49vvhE2zWn/JsjnHUCgQmJLK8G7i/
         ZDLr8VuPsmbxGzBNOlXJmRM1TuK6hOGxe+OOLWSoyH3xY8kp+4OAP9aw2i2yFKWuBn4D
         WNkjEcj00tG/L3R1e1qws0uHm3eIutZ32Vk4oJqrv5j+phcwyzdVCk75Yb3ZEtM1iFfl
         /L20z4PA/0Zg6X1t/HnNuNkiiFf2BOrD9nu2W/x7m6ldNB1MGC5q6l75DYMuwl85WRB+
         Jvgw==
X-Gm-Message-State: AOJu0YxQBjleRa50WK3wpE/ThFR87NlJgNzszMOx9+aDcZSnGy43Ydr0
	RART3cSv77XGLHsRnm2gUV/EAS1DaVmkCF1rbBCnaVHGriGueZNf85uh0sdxKYHrdBmYfJF+P0C
	s1DNONZqm7AGvjkFfGKNbTGlmS7uAUs2cwatx6d05kL7bi9raBrui9gCs3YdHu3OPFXhS
X-Gm-Gg: Acq92OGIe6do18Uleva2kWY95kvI9JsRnCzSUT6G413+BjKoUveZu79L632pYlilLZJ
	EI9Z4xvWKWfo0LrUiC7U2KaAhODKaAVoPIA/0jKvkE057PNeMJuKnh/elC4Lkd7kRLMMJCaia2Y
	OZZP/83nKcEPVCdXlPlG2xysQXXESwVR9SszZidDPzA/srE4WOn6xfbCVIcoL32vjb44G8MSqQk
	rTSkc0QJta2Ujwmy7gTzDK7ZnWryKYeoTjVV98ag/AGXp+pFbZu17zYUa817C3AvspmjH+1aJya
	fgBHlDri+LU8JRVfMW20Ry+GY3mWldUyYAJ15Rpdw/S43pmy/jJYEPSFiOyIAfNazcGbvehAPPi
	m9t9OgMcBtyZGYWZF32jNbc8noBZiPaR6+WurbsyOlRJtr5vUBOB4OBUt
X-Received: by 2002:a05:6830:34a9:b0:7e6:f362:eadb with SMTP id 46e09a7af769-7e70c686601mr13282225a34.9.1781019170750;
        Tue, 09 Jun 2026 08:32:50 -0700 (PDT)
X-Received: by 2002:a05:6830:34a9:b0:7e6:f362:eadb with SMTP id 46e09a7af769-7e70c686601mr13282184a34.9.1781019170359;
        Tue, 09 Jun 2026 08:32:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:32:36 +0200
Subject: [PATCH v2 2/7] clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-clk-qcom-defaults-v2-2-0c67c06dca11@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YtkDqGD6pTPYNLs03sWSOZZV3ZbqbTsOJL3wyJ53BuE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIW7zC+FYxgJVwNs9HQTPPnHHlpOlHCcmh6h
 WNNd/OayxWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyFgAKCRDBN2bmhouD
 1+LPD/4qIVn545TDv/HkING9KBTX4lrvRehwV6UWHWi1HzCMZzxx7WKJMwwFYNCt6sszp3/XZHq
 xa6w2ZVHoTs+2YoGIMQnYNhnjvD95dgPoGiYqhP14llzSkg8PabaBiyDQCtbMmipbS33HKHO1bA
 pzciOAqB/YdUAVOCQNRnHdE5B1v3yp+9/k6oc0QflELucB9YgXwx3zvLf4KocSlvjUgd7141g2L
 becStBzYTYnYrcp9s1i2FHVSw6mRSy04X7ZdOcwTvVVga8Hc4G5v1YsHUBrpIAbJM+ufARJuvB0
 VAXKZ0tbTxQgmTQ/lrLyS42DoMbn4wwB1aSf2dQ+e0C2op4JM2Q2Pm83+/QYJWr2b5lo+AZbw4H
 Iszyk8k6eOwaxPwnmOIeyIo4CSdRiT1T+jrlDxDppdj35HslD6k+JnvA49AIABwwzL6SXt6LV7m
 gUr4iV2tIrsblpwfuLYp7Q4yP8VSZXgktGkb5KMUTPT/3zCOP8vwmp5KInAHxMOynFWjoWwuvqn
 kgZjJJSV9vH2oqGvXSi8+IOGCaed65XCSAf4RtgFLUAYM+uJMFDw8dyGc+LuIi+S9fykVyQgktK
 qVnUusVtQbYQ2sh9vaOW4/oemycEz0Eqg4RHiIIUuYrSG1bDKQ2vjFqVV7VypU3C43riXlgy7eX
 gBOnloTVtWRUhtA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 5e1yIWnEmAVneiT8MN0nkwW-0XU-i6Oy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfXyC8tef0x3/nB
 22rT1a1H/wm1qeCzinWU8fnupYU+IeLO3hen+SCST4cwPzmS9dXuG2pDUNMPhp8pnKO/7zFOjmF
 YMed9A51Kb8B6QNu8zzKDku3D/3vBsT+uRo21OFvlczds7523CB+Rh5jZO/m4zePqxWAZ359lEc
 u32uwpbn7Pjpay+EMmAf9WM5uXN3ep3wC8YvGUxEMpmXKMA9WKBcHAJPVSlMecI6Vi3+83k2soS
 52nj1EdQdYjgVWMKAC0avWDgbS/N7uhIRCWf6ZMgSzy1wvFP2JWkPRqWzHDfWIWzbbcGRcizn7a
 IOD5jS4kuOnOtfQ1A2MMf6ExiLZv1d8ghyNqXQSaBL7NtfLgJ7wR+FdnnutKbHrequeGU+Lk7K8
 0cShXCyoXoXSB6SdKCM9Zlfy7YZdTt3bu8QDK2GcQya9eBvHHKe+l8/21rKqNQvHtp9rOW262pF
 HEeAAdZO0YnDb59xYdA==
X-Proofpoint-GUID: 5e1yIWnEmAVneiT8MN0nkwW-0XU-i6Oy
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a283223 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZSuaVHzWtUHH4nz7hFsA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112225-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15F86661F32

IPQ4019 is ARM 32-bit only SoC and QCOM_A7PLL is used only on SDX55 and
SDX65, which are 32-bit as well.

Do not allow building them for ARM64 to make built kernels smaller and
user choices easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 drivers/clk/qcom/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 799de35c5ee8..3b8768d80d89 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -228,6 +228,7 @@ config QCOM_A53PLL
 
 config QCOM_A7PLL
 	tristate "A7 PLL driver for SDX55 and SDX65"
+	depends on ARM || COMPILE_TEST
 	help
 	  Support for the A7 PLL on SDX55 and SDX65 devices. It provides the CPU with
 	  frequencies above 1GHz.
@@ -374,6 +375,7 @@ config IPQ_CMN_PLL
 
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
+	depends on ARM || COMPILE_TEST
 	help
 	  Support for the global clock controller on ipq4019 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,

-- 
2.53.0


