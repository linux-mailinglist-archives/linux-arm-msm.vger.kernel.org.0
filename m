Return-Path: <linux-arm-msm+bounces-107282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEyOD/tvBGprIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:35:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E378533162
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A75163018778
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63944421887;
	Wed, 13 May 2026 12:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I43MYmtQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AjXkG4e6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF734413240
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675694; cv=none; b=EfCKE6Mgcsqfc2287Q1pZFILfMFB/qeJsA98SoVw8KZwOXqo+9Owe2WtXgnM4JqAbBS09YVX2mUOw2H3WMkxmHZtM5NUfIAbGjkArL4AAz0OY5JeN+K5QtFGFhSbeGvSCzdCM+OuqTBnhkkYAjAVHgkSRKDYZn1FGqTOx8q5Y+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675694; c=relaxed/simple;
	bh=QYtKt3xVT767f/e8GatW4qi1b551mF4Rul2GLUG2IWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qJeTsG0uCoS3OordVtJowZB/bB1fJONfGRkRmzfXrh9vv8F6LAxOJgfq3wNAzYaqhHme7khfjtx1gkySyTWTeS6DcjeopNKmzDGqKA+n2QCPZ3LITnhjacTud4USxMHGORJrbj/kL3qFHMsqn/d7WdOJKKDlR0WiFQ+etCdspcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I43MYmtQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AjXkG4e6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVQAw3430275
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZkPfJy0UESjSRY5ynRNQIxd5SdMCMpmKmDZo2BYGsVI=; b=I43MYmtQDcvGEFsr
	bItGmK/3BjfJ+sown/zP4syTUUTvr7VS++Ev/oTzo7bDrTwbnYoKHwSP1xulns22
	e9u5sHN9en/phQMrfIACbm1OGAahi/dyXaWQxUUf7qHWXeLJjTRinmFkVp2jmh7G
	6O7Butt/5kGBEjS6li5ef1omanx1Q/pvb5derpUzj6Eo5H8p1dsBLyXSUuEez4FJ
	AGjC8WNp9FAvuNlBcaDiypOxjzEgw7AGyqvd86y6vtMzwMcdLVrm0O9dV3x3i4Uy
	Vyr4Ejrue650loSYh2YuoQVVB6K+Gox1qSyLONT6btzd+pC+tkRibA3aPQkuea18
	/uUAwA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcgdnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:34:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6329c1a6710so2240197137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675690; x=1779280490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkPfJy0UESjSRY5ynRNQIxd5SdMCMpmKmDZo2BYGsVI=;
        b=AjXkG4e6YgSm7h+fHK5q6EDGQNRGfLsQ9P1TS2fqIS3IBN6PgNs4hI7PW6Ix2D/ZvT
         wDeAELx3xkqHcerUKupW9LwtjwdJkNMQY/opTU+EMkKhZONAWcpKLd1zT5+shv5uqvlT
         yrhxfKu0OI/P3OOVw9pZ6xvjshGjrWEFEWLD91RpeJeVipzQGEe8WjgobRKRpfPiUoYN
         NkeMeYchqoKbqdjKH/AmxSmRuMGwbFMiWkIo1ZF+AM5qAaMa/0GyF0bW0hXUNPmz2Lbd
         evqZCaDU6IRnYD7AEPG31D14Jl1X2aaB+T0+W8AzbkwF24PgRTy/a1FTXj5KBWDp7t13
         o9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675690; x=1779280490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZkPfJy0UESjSRY5ynRNQIxd5SdMCMpmKmDZo2BYGsVI=;
        b=LSFneeW4+G23djMlkxNzVs7KHnkYSmWmVnRspXIoU+jZSnbJNeZIHEzkW7WzdOKXbh
         sqrIf9IYVIS8ZellVfW5q4B+Oy0Wb41hA6/xZ4n2RlaUNVmwwjsb/dT2zbP9czYP3CeX
         v+tI7RfUIiB3QfO726BsVAJcCeQNwP86zmY7Pj2+l4F5Wj2GlhiUCLOkwvtHcfOeTi7+
         sLvqfQc3XG9cibei0w9GtDEkixtalqk5DG9kZADWWST8jxTYrOU4XjmyALw4xXE4ge4s
         RjU7HgDEuWyigdgo7QFrYk7zjVsv35KFwxqxqvEa5plcK6u1u190wmcrBbC1qHVi9PoU
         9wxg==
X-Forwarded-Encrypted: i=1; AFNElJ9jwxcElwk4hk2UYugqwPdL+pQNJWfpvGSQn4A2Hw5hy5gf8qiVE7FFOD6zBW2drtYY4ju2xj2cf12phGW1@vger.kernel.org
X-Gm-Message-State: AOJu0YzxfTd2TkyMYa5cRosKxrsxvLeOmbtCen+X/YUs7oTNpxLvx+I4
	oPprJH3+lIjYTomdygPNhRZt/tpifRFl1y18bP2LOfl6+zypRSLbncYOqwiDuv8Aps00K5W1WvI
	hkaa4vDuIha1RHaYezBXASW6t7iq/lWpQYg1BtvbLp61bkzLlIAs1WgQJkzsZk0OhfrQROAx27m
	7p
X-Gm-Gg: Acq92OFcxss8dxz3fJZKfaDbBnV3M7uwon52gykX9cLbPAVvMkS3iIH6UTaNjy9XC8e
	nHBmGBFEC6UokcNoNFoc3ME7W+SrGUeWQqqk+VA03uLzcsdPQQTM7ZTV3+aOUTeID0eQKS32Q4x
	iw4P00E/74G9y3AV+fRi0NHGG6Ts1y83fHfdOJzTndDmUINe/c1DqZ5e1oANLbbZVJbCatLttkn
	8w2WAjzzPJfK1JCUoU0mlZrq8M4IftcWiUv0Lehx4WQeUpN/fSKU9/vXDJjgIYI53xIPKFMELYe
	9c2w3BUgG9QSAsCiwP0C17/O6YtIq47ZWR2ETF9jqMlPjlpc8wgwZNyUAU20ngrbcQaRXalgJuz
	adfCBCuI4HNJhxjLmo+hkJsyDNxMSeE/erI9HcxMLilRoc+LBmd2IC9ORhjt6RrqsPgsDarS5JJ
	drMFAz+BbufQzmX0t+YUOSMPlFP5wV5MNYPIU=
X-Received: by 2002:a05:6102:370c:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6377239d295mr1216065137.6.1778675689755;
        Wed, 13 May 2026 05:34:49 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6377239d295mr1216053137.6.1778675689222;
        Wed, 13 May 2026 05:34:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660c1sm4132610e87.66.2026.05.13.05.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:34:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:34:43 +0300
Subject: [PATCH v6 1/6] media: dt-bindings: Document SC8280XP/SM8350 Iris
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-sc8280xp-v6-1-0d11d90d3e26@oss.qualcomm.com>
References: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
In-Reply-To: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
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
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QYtKt3xVT767f/e8GatW4qi1b551mF4Rul2GLUG2IWg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBG/lDI25XetRzV0C0illHa2FiXU20q7jvnhcw
 BJbZhxV6g6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRv5QAKCRCLPIo+Aiko
 1SwJB/44JcZ3uKZR5+uHcBcVBeGWzwezV76GM0FPxWeqoH4LaF1OiZVndsrxR2RJRoWeqENFT15
 1OKoWa/fQYjIA8gOlwaLB2CH1q7PQxXIi6ozu3OHuYe77zvpRp3IQV28GK7ACzqvUu5PEwzimTr
 mE+MSSL6j4kMdbaYS1RG+JzKTIvmEOSuI0sNV9M2tsnJBa6aWQw5Zh/5IQTWUI/7y3a/V8tJxHG
 h3P0jOEhwHBykhFNxZWV9SuqLo1Ze8J1O1ePTR9R3vLiUwgHafukQoRrUABpL109wrMqmGQu1Bo
 E1R0TKj3hEYTQEgaPT36CiIzWUoWdvGHC0JSKCPxcureuC2A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Tl2k28lmKBG9N53Ayc_n0P7oXNY0RPdl
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a046fea cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=DuJnIZi-_EB7d9bgGRcA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfX7D+dNTKPqVTI
 2W6gJQAqdGlo9lNTo01VAELnUBOVGsgJN+XxRtD3cbfqyhCMCUuseZ6Qim8T9G1QV01bK/18XrW
 j0uX/beOQA5ZuGfP5t1SJM31wkr8uOJJzFvu8ev5fA1QvIWBnhh0m9yXYB+4yEE89NpXHFKLwcn
 tj3h+J+LIEaJ66EpDz2PYWG/74FEmzZ18ay2EZhlhNkGfDFaSL2mN5zTwWtrkUVHQ2bGLdfCQVQ
 5tuivtK17I/4CGxBRAYtlEXvcd02zTBFScWL9Jba8BqzItJpvr2dGEB1BclDE8JnG+obf08bXRI
 eM4ZI1JJdE6pJwCk8vAAf+fK33kStJdJ+mZ7sYFXzXAIcNsBeZH0sCL1JAPPpUQlY/S+iP1Iwn2
 BHzMnsyQo6sN1WxHqtjVT1xMHuLrcftDRXcPII67kPXphI/Dm2PlUmPUkfzcIE3GENNj526q8fV
 T5rsfgONneRY25wVFvQ==
X-Proofpoint-ORIG-GUID: Tl2k28lmKBG9N53Ayc_n0P7oXNY0RPdl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130131
X-Rspamd-Queue-Id: 8E378533162
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107282-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Iris block on SM8350 and SC8280XP is compatible with the Iris
(Venus) on SM8250. Describing in the bindings that the block is Iris v2
and not Venus. Document SM8350 and SC8280XP IP cores, using
qcom,sm8250-venus as a fallback compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-venus.yaml         | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index 43a10d9f664e..aca748e42aca 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -10,15 +10,21 @@ maintainers:
   - Stanimir Varbanov <stanimir.varbanov@linaro.org>
 
 description: |
-  The Venus IP is a video encode and decode accelerator present
-  on Qualcomm platforms
+  The Iris v2.xx IP is a video encode and decode accelerator present on
+  Qualcomm platforms
 
 allOf:
   - $ref: qcom,venus-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8250-venus
+    oneOf:
+      - const: qcom,sm8250-venus
+      - items:
+          - enum:
+              - qcom,sc8280xp-iris
+              - qcom,sm8350-iris
+          - const: qcom,sm8250-venus
 
   power-domains:
     minItems: 2

-- 
2.47.3


