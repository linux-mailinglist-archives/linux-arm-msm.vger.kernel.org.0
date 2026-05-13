Return-Path: <linux-arm-msm+bounces-107387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MK3M5KjBGogMQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:15:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 312B0536DFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6884C321794E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B3446AF00;
	Wed, 13 May 2026 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHRYaxAV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="as5uOz4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AA043E9CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686553; cv=none; b=QrN0q9nTbR+ljI3Zt5JiLd1ssHtL8QV/l9mNz+EdiKxFmBNftgJ4H4Rxg/iR8+eggUqmB2QvGodtDtQ8B47tdvbCECJenL8c0ZnXHoqTGxdmE3eZi93w53f08RrbGoU2o5V9ygA0TBeveu9Jw5JIwtrv5qCZq0IA5+Rsr0GaxA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686553; c=relaxed/simple;
	bh=tYHEyC60vh0yA+ow9iEUUDHB3KRZUf9+w+HPXxDH/0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SYbKiDhrWC1rLRTKGbuuCT9gla6A+MXiEhH3YoXAgRWApOQr1BDWPSrffuYHl3SKBxu6wvNEM30IK9Q/G3lQISd4eSNSdxYQVpxCyilQqPGt5h+3POSTuJxlHaa4kwzme+sdWP++BBgLxrKQZYDsjzbG6vHo8hyKVSt7G8XWmow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHRYaxAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=as5uOz4U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBfWLJ3324795
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EB5VNQudI6X5U1pX5BmnTNJl0oywZ/20uRk2m9TAUpY=; b=VHRYaxAVAMY1TQAB
	KoF5y+Ky9JKEUnvGQjKAT5Kg7FXK8S5Ya4JqVzj7g6A1UJ+Si17SRc8B+R6Xpu4Z
	r7Ach50hKc7OP9DwS2hYCsb8WM2qAfNpVEH6binKZqqgVA96wpp206b8LX4QScYv
	O4IpsTJoBjHmhOCrRj7YkBJ2XFo/qZn+U/G6vyHi3ihGb/Cov7dGjXQ2RjMoMDsb
	ZaWqvkdXGrPmJu3GImVFCorqkOlKxXnbJo4jyXKRsfA7bPHHAisVWRkcqzx2Fox7
	ySY8/k7+nm8sJSjfOuR7NKqYmJYnnVMCCo3xP6XnNqxFu/PydPquyyS2pacZhMEa
	tb82TQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvda6v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:35:48 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95f6b47ad17so3786949241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 08:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686548; x=1779291348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EB5VNQudI6X5U1pX5BmnTNJl0oywZ/20uRk2m9TAUpY=;
        b=as5uOz4UklYPq6mR5mp1E97UozG1848i7MMdX09c5g38d/rz2alRwc5Faznwt3auqR
         8UtZN4HFJozPQ9yMVxmD4tsDx+0dUSDmOLXULr930fS4Ij7crjFnXAdHort4l3xFkwbK
         dg00gEN7YM9uNbYAonL4qN7A8k4Ux1t7+FBVJSOW7qjYbarIb/oDfx5eXQMXy2qIM5TE
         hZYoMWSiXKSitZ7hKQx9hbkhSQyaFg5R+YoFykC6N1WWaPosHaxbuZcMr9Fk7bs6U42J
         kJjZ/yWVGHm/M3qccq6ayoIKnO3mA2HwQAfEi3DFWW2gJb/TITz7PoVjZZQhOCGWkvIm
         pl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686548; x=1779291348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EB5VNQudI6X5U1pX5BmnTNJl0oywZ/20uRk2m9TAUpY=;
        b=Qoa0yNxQX4+ptr9/eSX7bmEZTyNqSUjP/ifMxNWSJouLOUOQZTn/QorBNSUKnseG9O
         DUCcphA7tKCqKJYtNXR9O9q2ofExHyqjEYUywnuL1eiPXkER2ZcH38pB3PtFt9SWX4gR
         TmXonWGFEk0khB3K88rJMmwe1nKzhC/jl0hCJJjgSEvIiD0BdRD8EUm8NznzynMF/jun
         lOY4C3+glZrTcKv1RxnX/CKlvgJIYCrEG8qMP6kCqoPagyxsrzkUrnRzz5yFG0DxgImJ
         7D857z7NMLSuO/1Ld8Qrq6aGYDBg9v/FLmizSn/fT6ARXQB2AD3jIYJ6JoyifqtgOl9n
         Wb7A==
X-Forwarded-Encrypted: i=1; AFNElJ9/T4kE6jCLI3o3RehnQ5Vx39PkXkjKfep/ICXrUoCa5Zlb381K8PknljZY7hzih5ctLZcQt12Qw6Vacw2y@vger.kernel.org
X-Gm-Message-State: AOJu0YymSUYmdVST5+B/WiXIiNzqSQF47dKV8pFqlLOnC27qFPOnuK8A
	1RHQ6CskUS/kVmg49G98rEcqYpYVOVWvFkqJo7h085ymMVmgjcFYYYqtFAiqDsO+tFWZaMnw7Wt
	6KB8/Ztq7F5MsUMo83XP4Y8uTQCMo68uF3AQsDDnM0BiVt/SlpnnLa0aqzKOPu6yNYwxtREUI1a
	0r
X-Gm-Gg: Acq92OHEDtmANjcyns70tgnWFzF/J6zfnID2Kohc1MT8UQa2bPP5CxxTHhYvZrv8NnY
	QDYsZ4ZhgnV38ynlPm6A/RQOXpSB83aUTIFYbPgEbKJ9Icx3NSHDPMR3bdMIVPCPZGNL7FXmS0f
	glesseWqK831K12ea1hB6/bgNx/x13j5UuXcPtUrnG6rvSlKisaS1UuEx4Z/fN2LjlK4M5Wt99A
	JIpFMmdDcjoL1kfHCz9BlxMkkl1uxjp+VXAk4zXsPoE7byhx5w14ljZKbFcN/uLC8omkFl9aPhp
	KMZmcgDlkwg+owFBpm4BcNXEsjlDKe45n4zDI0jhm+1pIny+CcUHCwAbyrP8MdNtxTtX4CY/kJx
	RgkQLf6P7QVfSzZVyFYYRFwWZvqVI57AMcZ3f95EBmLr/UHB5cA==
X-Received: by 2002:a05:6102:5807:b0:633:f7ab:6bd5 with SMTP id ada2fe7eead31-635d1f9e9e6mr4077211137.18.1778686547515;
        Wed, 13 May 2026 08:35:47 -0700 (PDT)
X-Received: by 2002:a05:6102:5807:b0:633:f7ab:6bd5 with SMTP id ada2fe7eead31-635d1f9e9e6mr4077196137.18.1778686547113;
        Wed, 13 May 2026 08:35:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f446ec6sm43165835e9.32.2026.05.13.08.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:35:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:35:30 +0200
Subject: [PATCH 2/2] clk: qcom: nord: negcc: add missing definition for the
 USB2 PHY reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-nord-clk-usb2-phy-v1-2-8eafcb2d5129@oss.qualcomm.com>
References: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
In-Reply-To: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tYHEyC60vh0yA+ow9iEUUDHB3KRZUf9+w+HPXxDH/0w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJpJH/y8U1Ax90iAVFo88ARvOBAlUepzPrrOF
 J1MStmY7aSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSaSQAKCRAFnS7L/zaE
 w1TJD/9j8QT/YDEs2oki5aCHPO08dOSd3Qp9f6Tvw5j2MVKCfLtGeQ3iW2LRUxV/IodcOV2B1vE
 qKMD/4qwFDWj0r/7J1tp2cv73+wEjzLcqfKUv1tMCkUuifXN+/JgfYQyGmrl7sc7chbgaCGCSLf
 vSECnqndKy1rUoLpZwWXR8O0XB6lAgGtmqMLBA/cU7z+n/Mhd4zYAYHKdhvDttIgl5X4d026lEU
 E51UxhdKsYch1QcKPru0MBAZUf1905RvilvgL28zZtIldE9uuOnm07GQlwlhGWRs5nfOJ324BhA
 ccJi40yK/xTfVv2f0Ec/UChSrsePO2eZCVbrK+jKSDMfH0djrOtUkhu6tTExXuaLVEEOOowf2Xm
 pxyYN6DIZaJqdyqJEgAKNivP0hQjiJHct5Q4atL+41aMeZTZMj6vFifYal0jYEp/llPrgQskaAh
 qB7DlibMkuvtKvPLLONZb970etIpzlypym23uaYHRo+meKMAfM8+ZR5Q3FbpVV4k9zktdqtqe/V
 kiK+I436/QQsBMPTTQss4KNqWBpAI4GJdgGnCSjrRImQJcyKgq7ps1UegNiX/RaRXjn21d4rPeF
 rGLCFLFfWxxLpYLh31g0QRCQjS8Jc1BQjxv96g7DDwGw0IukCfQ61wTXO81B+U6KQ9xUL+JFrqi
 XXLHe8/J+HxnvJw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 7Bq4vb9Amlq0PAik9wlMUqfhrMQ88mws
X-Proofpoint-ORIG-GUID: 7Bq4vb9Amlq0PAik9wlMUqfhrMQ88mws
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2MCBTYWx0ZWRfXzHN9x8jw3X/C
 mjy3XFH6NWhJRid4pUI7bsGDx1T2odyZD8vtI9c0ZFLYwjgHajK70psqo4ykLFoFlDBB7SHYfkh
 7E45KY97mTGQg0HFq3fV/6072rxoAAaNmfoH0DLe5AP+BjKm9oxkEAnwbpqMe9dNhEY5h3xYYP4
 /zwdmbWM7qWrlHVQEtuI04nZ85qQ5d7GdNU5vM9BWABnWS5l3eblfJkkfY2nDuJYeksT6eIKCAN
 bgLvRu5CkOvgi8WlAcv4tb4KTjGg0mDcWaSC24uaILlQngUr5LJiEohHqILiIIfShq0axl4hFOP
 DmxAaUl05666hXVHUVkhAzuMJgflSizs9etp6p41F6WWNNlbZB6FhsQ6pyO3o22vvm/cCgSCo/6
 2mxOWa8spP/rAl+JvXf3XkoFvvkoJ8314jARLIP6dAJfEE+W/VW0r20N2eeoUOKO0cBdeJxGgiv
 /t8jd95EZMtSYxnUyeg==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a049a54 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=JLQsvVesbaMn6kmgP5oA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130160
X-Rspamd-Queue-Id: 312B0536DFF
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107387-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The USB2 PHY reset definition is missing from the negcc clock driver and
its bindings. Provide it in order to enable adding the USB nodes in DTS.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 1aa24e2784e536e6b6e76f488abd0e2fcc435380..31442d39924a6f79bf39962ebb0de8d5c65fa0b0 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -1918,6 +1918,7 @@ static const struct qcom_reset_map ne_gcc_nord_resets[] = {
 	[NE_GCC_USB3_PHY_SEC_BCR] = { 0x2d000 },
 	[NE_GCC_USB3PHY_PHY_PRIM_BCR] = { 0x2b004 },
 	[NE_GCC_USB3PHY_PHY_SEC_BCR] = { 0x2d004 },
+	[NE_GCC_QUSB3PHY_PRIM_BCR] = { 0x2e000 },
 };
 
 static const struct clk_rcg_dfs_data ne_gcc_nord_dfs_clocks[] = {

-- 
2.47.3


