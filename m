Return-Path: <linux-arm-msm+bounces-90462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ9dFNU3dmmTNgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 16:33:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF12C813B5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 16:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8B3A3011BEA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 15:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6303254BB;
	Sun, 25 Jan 2026 15:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L1V+T9cB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnaMThGN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0CD273D9A
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355189; cv=none; b=dkzlXdzZQ5uFU/kH1h0TkfcUT38sFWJu07mzXMYMBMkYboMmRjbEIcOwmk+Rv95rz6zCKLeYi+Hnmz3g2eFksi078LC0K6Pg1tA1nNz9zSBf52sBjAuk6+kruWKKru6MeYfWd92eADRZ9DMS/ycYjEaYKJEoTeLPgCWcDY5nuzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355189; c=relaxed/simple;
	bh=hLnX9O+jNkWp4eIwqeLrNV1GLUMHqOPIj1AAiPtuF4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f0FjmpJrIXCfXMViayP866HYXe5c8jFOCuvkuBKRlKdflkJEvWUu7cYMajRa9fsrH/LU0roiW03FK/Mi+1wSVIESmLcvrcLZuzl4EEUijMT8RjUzzfN1QqOqRBEINfMWDxNFZim0Tvp9jkjBbXd0nYzAWtOPca4frjhy7enP5/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1V+T9cB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnaMThGN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PCsiHu3231235
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AKNJUo95dhWW3QqNfHAa9QPKochcB0AESW4u0Ff6SDY=; b=L1V+T9cBMR8tvw7i
	s4+IrQgBp9IDEBXcIZA1/CZZBu6GjvSMWNULIQNZqlFyMrNE7g4aGN0AyGTY14bo
	aKWXL6h9uS7LNii+8kLJ2vB4ikuDQfIRWVgd8vXBnZRT2c7IXHQ+FhI1z6wS3b2j
	VZeFMzJaapKMuFLrbOV69Oe15dHYE57tOvPJIQUCNK+qUUXVJjtidNheWTYgyC3k
	aUuj8Vjfi/WhJeXDqWD2q8C83TI85vdrFrp8Eyl+Uq73CQsZPttR9nFnjyPABtRW
	3rUujqU/ehPV9VrJoTNJLWUB+kRicd8BkdokHELkRTAifofZks5h20TbSRLyhNt1
	ZmxdOw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvw4wst6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:33:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-894709fbae5so117137296d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 07:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769355186; x=1769959986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKNJUo95dhWW3QqNfHAa9QPKochcB0AESW4u0Ff6SDY=;
        b=SnaMThGN4UpZUPQuBPzHy7sov7dWUP8YngvJJ0+WGqo+fxWiT8XMDE9cmIRFsdfFHU
         8mR7Q+ov6PiT/S1xdpDzkQM397jKjw0t1+ItdCHiz3jihUzB8hmZXWknCPFgI1K35RHN
         5H2jS73DcheWEdQfzN5fSe7KcCabAloR3/8yZWR+/4g0b74HXelB7/WVXqwE4I3bhKdH
         NQhQ/1HpuqfD7n5o6MRrNbDUX6uQAH69nPwlQExyTm1RF78NVZsfaWFagDlDbjsKNxwO
         zFg7u8bVdF1O0r5LKsGi7eLNf53EgI6zgOL+uw16i+WEnWtwB2rIxESK1yunEcuukI6O
         pFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355186; x=1769959986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AKNJUo95dhWW3QqNfHAa9QPKochcB0AESW4u0Ff6SDY=;
        b=ZcUaRsfFPy/VJQqrDH0mSyZScpy04FBPnysDZfcyJy89cb4fQc4PxHwyDTkGfsrvR4
         sqNgzdRDuH7QWltiofoeKgbCd5bbkRcg8fDX4yEr6JzO5J4ZpRl4gOB8TE67O1di8kR9
         nan60/Lo6iakaZbsr3jlVbJ/txRU9V8YmZBM5ZjKiURsn+J0J8ff/Iskob1ghfw8DyJx
         Fc6M82FDHKbjgBBrvGqzcpCSYBN9i1zMJ3Ceia2Y0szIi7Pnn9RUvdX2lVOnKcVtPUMj
         SssgS/3ZpTW2A4E+VU9Xba03cmDOgbDGIN3LShEULiY0lNbawvjenMkDBXrEQQd9F0ir
         F5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrHTdbbpak0npLUlu43aT4WbTcC4wvRn++chx5vOhKRr77uV6iFta+zueyMKXsbtXpJhS2dXOJ/oWQCsrB@vger.kernel.org
X-Gm-Message-State: AOJu0YzK/0Nj1X8n72duE2TKZksub4G5xQ1Po0STFsV7nQ22bIiM44FB
	cAedvO6eGB0KMgQhGrhEozG396hXMgQX/o4JW5JnU5M8AVh0s1nd0ex44C6OkfD+mosHYf5TQUp
	otgMS8lLIubJAKgz1LWyF6CSjufrPb1o55gA+7fWHuf4E0nDn15WGgSv6/PdcckVATQaRm7FGoI
	WJ
X-Gm-Gg: AZuq6aJZMPPTn8CUojT70lPqQHeTg8CDpJQj52V0p7rvvyXw/CcCvaXkijOPV+DbzKs
	E9X4ai80joSmoYgchicpiYWdEp2qbmngkHWTs3VS3NpRZ7bPe5S2XJSKjLcR+NdcsUskm+cow3e
	GT3HsansfFaT0HBwG5oF58dW8eJpholxbC8WGkSS2qjR50QOPXlN/2nGP8QUG+wVo428PXbCpMN
	Zw8J+WkHMpSNSDHJnCub8QRalmcWmxsXrN3/vyY6n0s3pWxhNAP2DI35X3ZUnkjFDYTWOc9mwln
	6G7/Vp+pU/ZIXYNdVopTyoEeINBkmPaUZdNPGc+4zkf/figOdbKAWSngpS4VghHD7kXMpWU3zbA
	J5sdWPuAvHBw3QgV4UB0qFztVNCquryy1aD53ilsoUiqoqEl1El94zgHmjJL2BD6CGTRJa6F7m9
	0KKm3jwWE7kRiG6hYTsLdF/QQ=
X-Received: by 2002:ad4:5dc6:0:b0:88a:589b:5dad with SMTP id 6a1803df08f44-894b071a436mr23645366d6.27.1769355185444;
        Sun, 25 Jan 2026 07:33:05 -0800 (PST)
X-Received: by 2002:ad4:5dc6:0:b0:88a:589b:5dad with SMTP id 6a1803df08f44-894b071a436mr23644966d6.27.1769355185011;
        Sun, 25 Jan 2026 07:33:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1a0a45sm19154661fa.34.2026.01.25.07.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 07:33:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 17:32:58 +0200
Subject: [PATCH v3 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3992;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EyYfaE2Cufcr0C/0jDHR82fWre92I+G4XxMx5Yzq/OM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdjes8MYBCmo3Wm0lvyaJTzAclQ/Nl+tieRCkV
 oPuih9D6auJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXY3rAAKCRCLPIo+Aiko
 1el4B/4vr69MPVnkCtY9YDLjQL+XGXW4slJ4UWKCBWfqVJ5w/1GiILoudJezApXNF2QGlFyp5kH
 hW0m6qtYj231v7x60eDlRVXTYI5GhAgIpHY6TljBIApEWtZ1RtqObuZ217g1y4gZYCzfHHha1Uo
 hq1wcXpBDLNBamMtcvNd2k5YsYLFsyQYZLWB2xKJYQG9eVmdk5PnygYnUWRxRgJu8FxVscKLf8N
 aboJPmB8jQkMVK8+ilKl8giYK+nyMafBvT14lToIM15Xli+9vjOe2wIT7eTH4H43w7ClrchAVqM
 vsXjCyHnia5YWxuJaHxAyUhqkA6ZfwlGp4psfn57WgnXOL0n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 7dSLvJNKN3posX0XrzyN0LlPHRqyMFo7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDEzMCBTYWx0ZWRfX+WjFFBFORARa
 9H7LFtTWS5LWWeY/6Ynp7QprSLk9rlUs1rVx5O0OkoYEQOsdPIJ1W7lW13C4zs3DJ3KaK3pqtAn
 WloaillbGOznTjBvtDfCGabwZtORxxVW+WuSjI2c5rn65TjlzmiG61I7AeYAe9FxOAn3L6i01NQ
 0EgUzyiiZUcQieq+hJnkYBfNQN5NbzYhXyFuOBIizsC6hmUARKCm9gfZVg/e5EvSzlKWxaJhwbY
 oqgJe+NRASHDTWvEd6OyPpMHQyFkHY2A16PPSOntwwCCcwK1eNaB2zZ4rv/Bo42H/o07n5ITM1W
 LGfZ3uXGzfuuRpJd8QocjA7jdW0aH84FfsOJ2Obx0r81OAV0q/TPlixVQCoiCPcwk7lKgVIfumG
 STriEZtBC+g1S6HArXb4yusfRIWS4FnYm1beQX+55Sb+X1npQyrsYiee4WEM5xhgNht59UgSstR
 XjNan9X5fGCuXTqNwvw==
X-Proofpoint-ORIG-GUID: 7dSLvJNKN3posX0XrzyN0LlPHRqyMFo7
X-Authority-Analysis: v=2.4 cv=POgCOPqC c=1 sm=1 tr=0 ts=697637b2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gdo2EkX-Jlq9hQkSyREA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601250130
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
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90462-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,aa00000:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF12C813B5
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Both of these SoCs implement an IRIS2 block, with SC8280XP being able
to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
SC8280XP having just 2.

Document Iris2 cores found on these SoCs.

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
[ bod: dropped dts video-encoder/video-decoder ]
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[db: dropped status, dropped extra LLCC interconnect]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8350-venus.yaml          | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
new file mode 100644
index 000000000000..d78bdc08d830
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8350 Venus video encode and decode accelerators
+
+maintainers:
+  - Konrad Dybcio <konradybcio@kernel.org>
+
+description: |
+  The Venus Iris2 IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc8280xp-venus
+      - qcom,sm8350-venus
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: core
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mx
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - power-domain-names
+  - iommus
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
+    #include <dt-bindings/clock/qcom,sm8350-videocc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm8350.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    venus: video-codec@aa00000 {
+        compatible = "qcom,sm8350-venus";
+        reg = <0x0aa00000 0x100000>;
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_CLK>,
+                 <&videocc VIDEO_CC_MVS0_CLK>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core";
+
+        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+        reset-names = "core";
+
+        power-domains = <&videocc MVS0C_GDSC>,
+                        <&videocc MVS0_GDSC>,
+                        <&rpmhpd SM8350_MX>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mx";
+
+        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        operating-points-v2 = <&venus_opp_table>;
+        iommus = <&apps_smmu 0x2100 0x400>;
+        memory-region = <&pil_video_mem>;
+    };

-- 
2.47.3


