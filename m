Return-Path: <linux-arm-msm+bounces-79884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C60C24EEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 13:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A00D1B22B3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B0234A3D5;
	Fri, 31 Oct 2025 12:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrtbRIPU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5o4IEfH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B19C34A3A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761912466; cv=none; b=Db01eR9WZF/WIALj8+4pTu2qHGRZHqLPLzOq7rEIul9Qsq+9Uux4Yv7RcvqOXIQIkRZwEsSCV20aGS5FFd3MC14Sr5fgfb1YnKThuHKFJAlALSgkEVyyNXV5MlfFy+kfsGVomnnuaHx+bY7IG1/FCFsl0/jpUwzBi0GgEebGK5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761912466; c=relaxed/simple;
	bh=Af1tMCfkDQ1lQfRQaKUsYRHlEVRdIg23yVqZC+J8rAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qju7bXPVYJUzf1JswMZr92XMlCkPg0g9HOQzXj6k2Hsf2TgrcA/M7qbRdWERbHRynP15/35QJzqtBNeIL0W/5l8hUwH3GhdqDZb+WXzPi2LFjkdDB2TJxTTTD8CSqiuZT3cgrM+iN6WAOFTz8riyUENuahhUh+V8IdWVfxOx2ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrtbRIPU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5o4IEfH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V9jGLr1417233
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4E/WBBGg3Ro
	41UM204RDH20wPcFyThixToHapyaAtXQ=; b=DrtbRIPUjVvDUgoTP0uCtrh9CuI
	1IyG17YIoo0TcBrD74kFtD2GfA5Q3eLPYKgL5ppJ29mRyvvkSFY73bqBsDBfzF+N
	o/7wC0BjfrNbAQ62+U1wPbBNRND9N+Mj0FMoFcx3DHCw1TwA/yjnjLXzBMHz58cR
	IHxsqFzQSOiHfoBdk0SCFo5l2SPzsF6I/UaHRnAkn/8kxMxxIDIUBOwAjZAtyFnn
	K4SeK5iGNAmpx1bVyysdH9MLb8NrJ/Wa6jfrUMZkeHCNv+3cTjWi72uS6bmerl67
	tzKHaSLDjuHNUuB8PYgGZiE/khIWT6GiNgsghaaSDY0fMyi1GV/dXOov5cw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69hnb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9351826a24aso116819241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761912463; x=1762517263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4E/WBBGg3Ro41UM204RDH20wPcFyThixToHapyaAtXQ=;
        b=K5o4IEfHMoNrYTye+aN9CjacNnCH+K0UFpkjfNUyIQQjLDXVSL2DYXjVgezsOeR5m8
         iAzJLbDXtpwCI4JhIMMxV04mw7nnvBy8bT7W5fnL4t1HYmwIzpMuQu4W52lXLK0t2W0v
         RJgNCMQMdsWNOBkJeAIrC3fw20ti4kCWcxiWUtk6+0kHiMOb4kR9c2NQi0j1qlFpgUj9
         8fdzmZ4gLbPykxo0GO7Kr8fg23mD2tJo9qVhjcIWO6VHbC1PNngDxxuYXrqLt84lpv1+
         sON3DqFc/OkwrTiACrQyQjuPaWSH2yxtYE7ff2Gat0TWClkjmCIYHMtYLIYr71mwOt/c
         TkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761912463; x=1762517263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4E/WBBGg3Ro41UM204RDH20wPcFyThixToHapyaAtXQ=;
        b=SuHAAq+e1U0UMD7quolh7ez18w8dS0WYoGmiiKDPGB3m7ei9k8ugzYEqXEGXeA6ntO
         O20Kdu5CprQRjLCx0Chh0WiosekVLPVA7QfS0guFFY1x0ZIfd1tsNdohsjPEIMkshB4A
         tf4AGa1iv2RocfYxpm5IXn1RWq5HKmtF/0ccspeoxUnIZT9o3ahv5PJ2CDWCBJgMA5hL
         2qR44gWv28qXD1VkPklbzT64v6/mA/BNkdFz3Ibx7QhbPm7jYHqf7XDhrzLN+gFfQu62
         DTXWW3QPnJNe0+rRMsqVjK7gjZIBIKRoj1tTmuz3HG/aU1IbhZFlakXJSKunKwY2Sg1A
         tGxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEPDZ6u7kf7efP04taJFKZW15ShzNWlGgNRNkfn4oBP4Yuil3i9SBHacNX1KspndNesrFjz/dEmrYFqEgx@vger.kernel.org
X-Gm-Message-State: AOJu0YyNEU9PaL/PY1ZtG1HUH0B0s/ezs9oR1ms0QU3dmAAoTAaP8Y5L
	Dwb5eZcJaqcd2yZ8umcgExofYbd6En7I/aAAvg1EMff8eJZGqfgxzkYVDAUvIcNgXW6x8hfHMSi
	Boj3LyMqfS1WuJyHrIuqxdGJR+JgE9cV5BhVqX17FA+6zBpcNbCcwFnlIRefdmV0fDjYY
X-Gm-Gg: ASbGncsNzkMwP5kPkFwfTLVxXvx3dJzbAFCi6FunGBH9lOOY877Fhg6UsTb1QHCH9rc
	0hPJrkUB13yeVye4mAleqYtjUSX+G6oPIR1bSDhxe8o+U1Mnsy8JqxtBwDd7PXvq/COW883TpX9
	0wIEh4otZLzZ/dUTgZ66tggBG+esK4o6S4nc6kXq034VFe/hyKn1xYO+/jjurZ0yz23h+IxIcNr
	TG0m9Blg70MTJbY2hxAhJByWgqJcVoS1AmpxdQAp3ABJc1aXKFC5uwF3Jcb7aR9eBXeFghCn26K
	e/gtt25sYsWSKz5mLQGxxPnUkE+gWcBPMvUE3o65c6xCUW8PxzrmgrnukLLtI+xtaO+1C8aDHCh
	v9KUdvDHYimP4
X-Received: by 2002:a05:6123:2e9:b0:544:75d1:15ba with SMTP id 71dfb90a1353d-5593e467f8emr1039440e0c.8.1761912462999;
        Fri, 31 Oct 2025 05:07:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmn3zvTc/ojKOR+bK9ywlieZ+Q+24hvli/i5RQ1FY8kSGgXDi2oxCTcFN1MlGAfHvp3RcDVQ==
X-Received: by 2002:a05:6123:2e9:b0:544:75d1:15ba with SMTP id 71dfb90a1353d-5593e467f8emr1039417e0c.8.1761912462568;
        Fri, 31 Oct 2025 05:07:42 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fd280fbsm21273995e9.5.2025.10.31.05.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:07:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 5/6] ASoC: codecs: lpass-va-macro: add SM6115 compatible
Date: Fri, 31 Oct 2025 12:07:02 +0000
Message-ID: <20251031120703.590201-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwOCBTYWx0ZWRfX5MTq5rzCFg0y
 9z2gBJj1qjNyBcxJLKALUPoIxYwt71g1VRVaZ/Kw0p6qSQX6VKV1Cm2kK70EwteZ7kMrMDSk1nh
 gcgrW8rn/Osx3QFV1nl172tYTJBLF+u8zXow2vPu24vnByToL6l9tlXgtFqnm3oSy5DYR4vTKiJ
 +kzvjLWDDFm7HxAELsRGirZZJUjlawebUx+advfONz4Lpo0RDBbO0nz3qVXYf8YnEowzqCEvMDM
 Kw4x6f6YqSWhe4K9ZIMO1cZY4d9LqNeVrNhTTXxeCosV9WHJhy7qXgceyOh+2BqOnJLsb4kHKUc
 u7mcdz6WPUn133juitTULbrACpWMp28pGtjyUDtK2BiIFgClk2K9IQiOYYrrmepvChFOlnRFg3F
 4l5c4449ExXLLu5XEMVN43tJAKYr9A==
X-Authority-Analysis: v=2.4 cv=Bv2QAIX5 c=1 sm=1 tr=0 ts=6904a68f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sAbSznBxNPymwqveVGQA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: VANVWOrkcn8H3kzF6i-gwNvt95c2PkZj
X-Proofpoint-ORIG-GUID: VANVWOrkcn8H3kzF6i-gwNvt95c2PkZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310108

SM6115 does not have "macro" clock, so its bindings differ with existing
SoC support in va-macro. So add dedicated compatible in both driver and
dt-bindings to be able to address that difference.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index fbe5ebeeaa80..902abc9843fa 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1759,6 +1759,7 @@ static const struct dev_pm_ops va_macro_pm_ops = {
 
 static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sm8250_va_data },
+	{ .compatible = "qcom,sm6115-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
-- 
2.51.0


