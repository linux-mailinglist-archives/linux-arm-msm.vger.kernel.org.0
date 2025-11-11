Return-Path: <linux-arm-msm+bounces-81235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B457C4D916
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2C87A4E287B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFA035771B;
	Tue, 11 Nov 2025 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n349Cc3m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K4eXLc4T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97DF355059
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762862353; cv=none; b=bKMVS2zhjxEFtPpA9PPi12Z6H+gPv3iVbsJEi2q5KZ4H1wdXbf+CxTa6ztuhaSavveMUoafvxnraZGUwK12dXDjdkHvZK3JJ0JxZFEnK96ZjtuAgs+cKmTOKXvE0r2hOUvkmO+M5Q5+lyyDutG8EklnxlI4kaLYrSshoWWmKpJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762862353; c=relaxed/simple;
	bh=2tyNmgAdN9f823e3Kz6GbzamElb/UkJnLrmBlr+APfo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cp3i3zukk+eWQhtKp+a90FAxv4T/mplMnFP91S9rMCrJD3zxAvJj/F4ncGrzh7cqrY8TdBOR2ml+MxZ1Hj4j5l2IIwPJPq2IjZfiQJsC5wjQVe3FpETtxPQN2rtu9NsIjgJXlbBibjj0olr/FzzPKNMTivv+e9bUoXVBeR6ELQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n349Cc3m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K4eXLc4T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGjJk2118480
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 11:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7RDTG2+S5HXj9tZ0cdAAmx
	3IwsRpLcACPoswBy3TaNc=; b=n349Cc3mZRZBcXFGNGX5bWc45WSPpnJbQPYsgB
	9orl2kaUkPItVJBru6zG7KakuKsY+4X7oTdrSkBugHNw4dwCPdDXMgIFPbl76XQd
	hHoFnj95k/+0YYn5y8VGJDt1GYUhsAfFFqAcyFDJoPzczsB+14iM8G3/jWty9T7G
	tNlEtv80vru8lc+wN69a9ALHIhGT5NJUjKc05uo0i+W284oBvPk2pSgmmc+jh5rI
	j06Y4GzyegQw3Td9bVoxyvJGOHPe0yU0V7VvGi7sk4TzVqxGiOlYN9myglngMYGF
	XD9z3/SZhEsRWp8tKVumU+g3xCF5cSiCA2XlSrmTBdW/2Diw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abpy8j9sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 11:59:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b92bdc65593so9236313a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 03:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762862350; x=1763467150; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7RDTG2+S5HXj9tZ0cdAAmx3IwsRpLcACPoswBy3TaNc=;
        b=K4eXLc4TuOt5rdFHXK041RK3jNFPRd+8E/2W4lwQ1H2dt/znkRltaMlkdmfjFoR/cD
         P0LQh1iRZ9plYkIrNpHqdxYL5slXswpiwjeFRdV5hCsBmzdJC/mX1BTlQ6u4LjnmLx+f
         DNxj40mnGnpOlWNChOTcMGlV4krHniPDWnrIYFPVgXN4XZKAIFkpKjCrTSbW7skC6KXE
         65RC+pPt8wiNn+r0T3rQCREznUzVeLggPqreqFZl1ubcKvIIIsUKrv5v8YSqnEmyQXnV
         svgUmYtSSlcytDziQIjx7DlNCZghiCI7hAuDPYRnIgyuXaGuucrg+dl136xPSS1arcOg
         EcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762862350; x=1763467150;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RDTG2+S5HXj9tZ0cdAAmx3IwsRpLcACPoswBy3TaNc=;
        b=RGxttHR3fFPpS3I/OF0TgNGV3iQKcH1hulG/N7cEH9bsQLxODNpng8eb9ureU8vp/w
         i1zYCRnE06GM4AqK/0Qhu//5ClzVv8eotgCRvOehI+F8q9mDllXSLXQncYgAScknyFKt
         1g0yX5i7tgWKGgpRTSUozEe+C3JMVX0wiu6wnoj8PDQqDgXn3AXHMerXOIBg7YQQ9fd+
         QUL0qD8Rx/FdkWG8qZUU8fevE3uVaDoX5IRJl0Fk5DW38BFmQzpa7IdlNuKzObSmNEiV
         QEul3qj1GOwRLYRRnw/BvMlSxpx8XJhnvK7C0c7Qo6i0bKT1tZROWWmL/y7hdyij/SlO
         KVQg==
X-Gm-Message-State: AOJu0Yzwb5KHXYBPXriKAcvHsStXdZSW2//lj1bIXNagTvX62hil2ra+
	hlqBwd8c5Q8KU/CYwbjDnGtoWijE352ST/XEPquxScCF4eG2cIqR2+wSiU55xyAal0kt8aPvFX1
	mLJcsBv4GpTNt37YJm00hWyZReV8IO5WTSwRdxj6Jt3HwTIUWkKYsRJdiyUGS6H9w7IV4
X-Gm-Gg: ASbGncsjrNM0S2BEUbxf8155t9xMe0PuEefuzHhl2l6zTGQs1ukJMqxaKhhjnMoCDZU
	v6JbSuphfFhDmSJ8qB7thlyAhK4uIaZmeW1e+Bg2bu72d8ziTZq4ZrjvzwBdo6EMjoBhUrhSmlE
	FQEWlotvtYKAgzM7hop6/nv3SA/MyU/47z0IldsGf28gz68qk4gu5wlSMd4StrxXb6xcZHenviH
	l7eLg8S3Yw7mjbKHxmYYnw3qMuQ6VxupN2AvH755tjHyET61P4ZlWE2KhPvd2pSBlBgVpHCGahu
	1Ga+kABjg2IbY9gZT+e7xo5hS1SIBdqCV9ClyJIZMJUIxtIKhB5C6PSQwa3IEDv6MrRgF/5uP0v
	xljyowLZJ2ykLZpjlZrf9x/P0wX+IW7A=
X-Received: by 2002:a05:6a20:9154:b0:33b:f418:c3e8 with SMTP id adf61e73a8af0-353a3e627c7mr15119224637.60.1762862350207;
        Tue, 11 Nov 2025 03:59:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyj3231nwHcjE8XT4mfFz2IeVyZv/w/7ubdP8SQ82tm4GpYD/HYJbaWIPYq0StrErAwIULmQ==
X-Received: by 2002:a05:6a20:9154:b0:33b:f418:c3e8 with SMTP id adf61e73a8af0-353a3e627c7mr15119189637.60.1762862349696;
        Tue, 11 Nov 2025 03:59:09 -0800 (PST)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba90307193fsm15420333a12.38.2025.11.11.03.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:59:09 -0800 (PST)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33)
 on SPI11
Date: Tue, 11 Nov 2025 17:28:54 +0530
Message-Id: <20251111-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v2-0-101a801974b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP4kE2kC/6WOQQ6DIBREr2JY9xuBWklXvUfjAvFbSUWUT0kb4
 91LvUI3k7xZvJmNEQaLxK7FxgImS9bPGcSpYGbU8wPB9pmZqETNedWADu5yhj4SrMY7GLXzGqy
 PgOkJOOtuQqAoJcTFgZ+BFss5GCVr2TcDKoEsu5eAg30fu/c282gp+vA5biT+a/9dTBw4qE4r2
 dVqMLq5eaJyfekpS1yZg7X7vn8B3zP7LwEBAAA=
X-Change-ID: 20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-c8353d7fe82e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762862346; l=1138;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=2tyNmgAdN9f823e3Kz6GbzamElb/UkJnLrmBlr+APfo=;
 b=69/mc8QFmAtDzIvrBLeTbUZ+qd4GufAd+bTsdCkQukKR8GcuBYNgbcWF3fdQaq4sYUYt+8ZQw
 LwFDyUblqbdAEXvri9/M5JqI74gRhVD8SJVCJ/tW0z5QpWeU3Z+OBjC
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-ORIG-GUID: nwmnA5KhUuieUmjb1_hRbnsEwCgqWCjq
X-Authority-Analysis: v=2.4 cv=AYW83nXG c=1 sm=1 tr=0 ts=6913250e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VnyvtZ2neWzYWFT5yUoA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA5NSBTYWx0ZWRfX+n4klYnHyuv6
 zkNWtyF0bzbCwHM/EPVX6B88CrpIxnEzHDh2p9+L8y3Ywo6Y8Xjc8kQE4pWxnp/0admFol7FkpC
 40Dc4rIsuMCG8bMqvT/QCQKJSO8zI4k8kDDW8G/fz3pj1eKUzL49rGKOlp8Oq8yMXJtjtTRFv7R
 dJziwnZnaMOF8eRkgSdJYndTbA/TQsFgvU4YoNdBHpuLXYMFVD56f8eGEL/rHcIv9Pat2iX4s4a
 Q/0GldACh+oLfN3AZLhdP6JRzw9SPPEtDcAo1f/HN726tmQi5fU9lf/nW28bq8UBTHqAe1u1bDI
 mLKZYAyURJH2ajeIGdtBH6cstX6iKuEseiRvP8dXiM4ftNa+cMOoiY63yhQnKpjZ6h+0ultyqvO
 JAf8v9gxnNFi/01/Lb4aVYO+YNm55w==
X-Proofpoint-GUID: nwmnA5KhUuieUmjb1_hRbnsEwCgqWCjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110095

Testing:
- TPM detected via tpm_tis_spi
- Verified functionality using tpm2-tools (e.g. tpm2_getrandom, tpm2_rsadecrypt)

Depends on:
- <20251106102448.3585332-1-xueyao.an@oss.qualcomm.com>
  Link: https://lore.kernel.org/linux-arm-msm/20251106102448.3585332-1-xueyao.an@oss.qualcomm.com/

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
Changes in v2:
- Use "tcg,tpm_tis-spi" compatible to satisfy dtbs_check (was vendor-only).
- Add dependency change in cover letter.
- Link to v1: https://lore.kernel.org/r/20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v1-1-8ba83b58fca7@oss.qualcomm.com

---
Khalid Faisal Ansari (2):
      arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33) on SPI11
      arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33) on SPI11

 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)
---
base-commit: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
change-id: 20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-c8353d7fe82e

Best regards,
-- 
Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>


