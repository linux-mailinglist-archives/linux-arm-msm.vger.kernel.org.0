Return-Path: <linux-arm-msm+bounces-98684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kItoOg/Hu2kooQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:51:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA0D2C90C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF57E30D643A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E18E3B6BE5;
	Thu, 19 Mar 2026 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDwTTRQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGPAR/EU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58653B6BE8
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912250; cv=none; b=jYsrj8C6Bjz9hTJ79n2Mo9q9ZdHewKdyJYpvJniickyR8DrXOlUUI6rA3HUqSIhGXLEa71QLKC1BY1HyVt9DPJYYTeJ+1rv2jrulhzy10eQTuuc7PUcKcDipVOb2aLqLUEpy4iRMDP+dKQRqw6A/QbLXdrWma85PdEusYYuAHhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912250; c=relaxed/simple;
	bh=r8Tgvpa2d+Xn1Psyxnelj9bMdjEJROkkSXYVPZse0P4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KH1G0yQiTazLW/fMY34pQp1GYqXZuee0WIgvJUaO5aE1cZkpejD3cvQR/yzwjMYVYYUMbhDs0bZRpX3oYfXyTtX6eEP1cZ5GT1iY45Tvzn3VwhMdlaz4+SiT+6DxZ+3AIj/edcP/k7VbnCGoHbW35kHzU72vkU32BDQXHIKqHj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDwTTRQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGPAR/EU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J743OJ1998875
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yeZ2p6pnbvPRS5fxuEOq9YZdbLaM0p/9+jaxW+EiW3c=; b=nDwTTRQDMfsYpwsG
	hW6isvuWGDkEQfJzxqsIczWvsn5dbJ1sSsvU/IjRiiWf3QrbEX+GPmd3Veq5um+G
	D5RsQLVzjMLnaUNNBKrHFwfcEHgLKNnAzACUbdAQ/mJ/Hg+WQk/N2wYjmJfK4sPk
	+GqqJJZJk0NWnRdSopbnwwVZmrozCErDsCE9Kc/mGhOiZ4It9xhFIZVIO0DJDTOx
	Xh+KUzCvdQ0ETMZOn2l+g90GCHwlC8OP8vItDxLyyR5aWXyJSZIRmHEOsHQLuTCY
	I0/bQnu1k6LdGQpNf1YQbCkotsjXa+F5QBv38/vaF8B63Xh8u9I/8/YUM2rx+pQC
	NM2WfQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb4e0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:24:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b06395b7a7so10336665ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773912247; x=1774517047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeZ2p6pnbvPRS5fxuEOq9YZdbLaM0p/9+jaxW+EiW3c=;
        b=fGPAR/EUKec9pGeQ6AGrv4K3T97heIp+SzKNiX99sjWe8uDnOtoegJnLhq0o5zPXlE
         bjviEtSuwAsmBRh8CaCQHWbJiC5hNvy1MHuZUyymSjp9+/ls2VJrL3D6Ohb2dl3KPNpe
         R9u/M7SNLSz0lJ/vc8t18tmbzM1VJDGg+eDUgQZUj2ElXVLGQiFfbCVqEhUKnHh4SYfl
         857MKMH8LXn/Ky80fYMLUsaVshfUU1/ZgbU7Et8OlVbdzUFFlkmXe65u7hUiQ3ElNF2y
         4ZTx9b1B2DY7M6YQC/vyO9fftYErMouTxJjvrLadDgUZ6D7cLyDFDQmyK11pK6thSMD7
         6ADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912247; x=1774517047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yeZ2p6pnbvPRS5fxuEOq9YZdbLaM0p/9+jaxW+EiW3c=;
        b=OrJWZMLHCRZgtGCUeplLxCWZqkf/nzrGk+TJobV/MExidzSczbUChKjkfc2N9Iab82
         plb6P4/OliW3j2JTLV0P4IcYYMik9HUvMpOhz/EuVyoEWANH7mUiuWx4NVTAdBaDwDYw
         9lssxnx9flPpO8T73oLYmXqOMu9HVkGUKik+Jk5tLXgIwhdBcA5MRQhIiNPcZA7OO9jw
         gV+ssl3CBhyhCyEI/IWJYZ6IYnZn8SACNvgXvH85viy5fj3j6LlawzEszF9jilZ0Mlp5
         i/I6Peinxu0yUGsHJPZZIbP8FxSXJDKKP6JGg+MkZ/RxGy6z8xk9cGUzxxKdd/dY2ECx
         Uslw==
X-Forwarded-Encrypted: i=1; AJvYcCUXFHRNYHqgNiviv7A6xtMDd1JxDHnXoQi/7ahSnHpAQWhINGj70mah35DN5TL1tB589IXVBGctJtR0kFQ7@vger.kernel.org
X-Gm-Message-State: AOJu0YzH8T7XTntPJcW1Hj6Ger3/uAssD9QshMCUDh/D8bG/JGWKsrqc
	EzyNX4EGR00BTN785VgHysw4KAQBzD80Jrh8HF5yeDpU00kjV+tnXXFReSRObl/nguOe3ubOe0I
	qdHsFmbylmYBL8PW/TuLZA/vZ+EZvhKCGLyQ6+uLxsxK4sBykEficXn+0m6JjXs71c6aVQMoIe5
	C/rd8=
X-Gm-Gg: ATEYQzwL8XzKnTCMLmdbx4zBz0giUxdWA9zwH/LPRnSTCmPNk3uUvHVrMjOHmHo9Tzz
	ausB0aq6jQxiujd1qk0SOqnpsT/XFZV/12OvQ5pxe/OgmrbcYNpaDwU9fmkeRMCBU947QuBF0SJ
	i7W4zQgk/6s4uDkbPeAZgPbBfiGnWhnjvOio9AU/he9zobhAgql/PB4KwWBR83DByMOOcl/CI0k
	/vf2hX3lwGgGxT8JvtQx3h+fBcwFbelRDOVf6fI3ME2rOxMcKvpF7zrH//uY4Yl1cZgjlA0OKzH
	AueBY22AiFitUidGq2qOJvBU8F63Cgda+EnmfGPJaDgYrJxtYQscz/+6ksCkvO3dTeAPjnzgiMR
	1IsFwphpY2nuj1H7whDZ5zPInsftHXvq/iBmv0aAbKZO0oIZ81OoPn7dLCqVMgSU3Sw7lfrhAxF
	zeP1n5gO1lZVzt5Uh6KbYI
X-Received: by 2002:a17:903:4b47:b0:2b0:64c4:34a0 with SMTP id d9443c01a7336-2b06e320b56mr63912575ad.10.1773912247324;
        Thu, 19 Mar 2026 02:24:07 -0700 (PDT)
X-Received: by 2002:a17:903:4b47:b0:2b0:64c4:34a0 with SMTP id d9443c01a7336-2b06e320b56mr63912155ad.10.1773912246761;
        Thu, 19 Mar 2026 02:24:06 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0704ccc67sm48391035ad.15.2026.03.19.02.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:24:06 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 17:23:53 +0800
Subject: [PATCH v3 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-enable_iris_on_purwa-v3-1-bf8f3e9a8c9c@oss.qualcomm.com>
References: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
In-Reply-To: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773912238; l=2030;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=r8Tgvpa2d+Xn1Psyxnelj9bMdjEJROkkSXYVPZse0P4=;
 b=/3SUyIFkuit/x/G5/ShYlCum1wBPDyEB+nxkUSRDrjJgjHV+r+aMur2hIiq5mV74AF+1c33O4
 mz8Io5FtidDAc73G80ktHlv3w8dndZn9UCA4dtdu3u0xHT00jiVy4cC
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: SCgKy-szgyHKrQVOn2QPOB-yNWyG_wMU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3NCBTYWx0ZWRfXzuXLwRjQuIOF
 GyXrdpatAjJkbW8/LXStf5u8n6KlySgtoWzDC2dMaHdVngQB+Y76GvEBPioKST0M2i81qQ6LnCM
 F4cDCBE5RXOvDchfIUb7WusN/owx+yMoVb/pvBhTI4SFtiZ3QYLv7hLSUjhAKW6FbIo7vOdSZJC
 WqazwgLNGrJYOduEaJdUiqa0YSRDpaOl1cAk97uVsGHufkZDoh5ZU1HPvGm1RLL8orhp/dUHJPS
 30sgkIDGulpvaBGgSmYgfIRpdqYMRhmk/J1JM+dz5Q38jzjmvhIDcegI3QOLO8O2GtmlA1//i/Y
 OiPstz+UWRSnIZGnjJ2N/bkal/y7nEqxik8m+8Pycx8wfc+E0ICKhcgjKqleuRIeRfQSg7EZ7js
 yGCDU9EIxlf+3pHA0t/qFBdZFwoLF8sF2xo4Tx78wgwlTwqHWdvFiFg9+67mXIhEZOMuPK/XoIy
 niVvsKaTuD45I5i1IJw==
X-Proofpoint-GUID: SCgKy-szgyHKrQVOn2QPOB-yNWyG_wMU
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69bbc0b8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=TePBmaU8FEUBdnlTSP4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-98684-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDA0D2C90C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the new compatible string "qcom,x1p42100-iris".

The hardware shares the same IP block and binding as SM8550, but is
described by a separate compatible string due to differences in the
clock topology.

In particular, x1p42100 adds an additional clock for the Bitstream
Engine (BSE), which is not present on SM8550. This clock requires
explicit enable/disable handling and frequency configuration, so it
cannot fall back to sm8550.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b50251ac467ad44a366689260bfc0d..0400ca1bff05dcef6b742c3fbf77e38adca9f280 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
+          - qcom,x1p42100-iris
 
   reg:
     maxItems: 1
@@ -41,13 +42,16 @@ properties:
       - const: mmcx
 
   clocks:
-    maxItems: 3
+    minItems: 3
+    maxItems: 4
 
   clock-names:
+    minItems: 3
     items:
       - const: iface
       - const: core
       - const: vcodec0_core
+      - const: vcodec0_bse
 
   firmware-name:
     maxItems: 1
@@ -115,6 +119,23 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,x1p42100-iris
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
 
 unevaluatedProperties: false
 

-- 
2.43.0


