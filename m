Return-Path: <linux-arm-msm+bounces-90481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL2oAhnNdmktWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 03:10:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A60EF836E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 03:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 442E63006143
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 02:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B33B2566F7;
	Mon, 26 Jan 2026 02:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WM3+tfEo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fi1JMiDv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8186822FF22
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769393395; cv=none; b=OK0AnhR5efVnR44LpTlaqs3drJdXluxygmcNzu9M0KvItQnNYCMILT2lCTUTr/p54Ayf37oHx0k2i5X2rcw91LxNXA1Ki3zY4h0foF6IS3BmXd8+KZMXXljOYqo1obLiObl5iPLo+/MmdK0TGDlzwvmsvClaF0XjS3DEDnB8yo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769393395; c=relaxed/simple;
	bh=ORuGJu/GYm3ysLTNkCgLVjQpY7Kb/lBszYo0stjQqf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VeSa7LiqvvRQgVajkUdtNdGcKKFiTYOfavSA6115m1NQEVfaeu15lpZBcUqrGQCGhb+Q+VxXU3Cl+YDWdNU7IluP2HaszCxrf/9Nap+Suz/UqEiX+ffXT36yPrUpCjJyqzHh+H3muaKOZh/ROshlq3UFa0mRx8+AhRAg8GMKDlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WM3+tfEo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fi1JMiDv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P7pVXs3575046
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j/zW9gokZY/MJ8KbPgs9FrhMrPwOjvcqW0w4aTXvpFo=; b=WM3+tfEotiwK4gai
	Yot+Mq7P+ULEMhSUcLTPM+YTk80pTYz4DNf2OIPUapfKnEw5NNNvqcOoGMYhqIUR
	DqIFzWi/kA/eSF9GxUMbl+gWTzZRk3FAqJUoONDAZ7USxIVJazTMclR/5YGzxzhg
	5Dcb2t5KuwlCMmKyRROqzCRnmWNDxdruHXZDBsEalO+ILW0EtAy6LMiU4ZEi5dqq
	mrE3hs2YhCf5qQazzxY9GtqzMrZLVBQr/ku1Inz1CJGnQTp+awcDJcx6fPkEhwhd
	TlqFPXWFgpJh16uBM5pdTIOpJMrMZqkKjGNiYd5zuLsO0Ry+YEBEJrsHgM54OfRX
	326gUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvwtyajaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:09:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a289856eso1319044885a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 18:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769393386; x=1769998186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/zW9gokZY/MJ8KbPgs9FrhMrPwOjvcqW0w4aTXvpFo=;
        b=Fi1JMiDvXuvuAp1HeVS6M1HKeXcHHUXZAOrGQ7fFel3NZCHQUqykV5VPN2S1lfxr0N
         1YzR0Oe6ueRPbZikBzTxYR7ZMajYl+caNgI/NwfXKn4Nao6eUudBi2XopG9AC1V4chLi
         sXvrnwSOOFyvguxDWbjGt4rtEl4ZtZoyPrtQo+t3elCvnlV4Dik5pbrK3RO3YV7JqMN/
         /5RTFqU6T7wTpU3HU9CdiTO/GE8SXvbJ7h0IMuH5U/C8iQ1ZD5kdIxpuNC9gAjRraoPl
         7oKTGMvBAqVT9uStcvIE03KDFXkih3gkhHB/9wfMYu7WjB9xQx2d/R43HNCgzAiI8R8c
         bbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769393386; x=1769998186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j/zW9gokZY/MJ8KbPgs9FrhMrPwOjvcqW0w4aTXvpFo=;
        b=UWagV7h+3bq582qTlxZQXKcbTk2gYwONwfp2f1F4JLfsMUUFai8lEo16dyyV6G4Ggn
         O82Jnu2e17jeJ0Yz0w+u39IpOxPMn7s1DdrcqDvBTt1ZOkmsL5CzwTacT0b+0Kn6q1NG
         wNi7qFlETjISRAyeBZKk9AJbziVKMFkpK01aiT48zsulIvimVjJWpfAzI+vYguoIVsGx
         ZxADI3WMNO2AIufppiuVMM2Fo8IF/Y2C0Y0h9HmIUxxwXCG+qvxpDDnGCGZJ/JRDva3T
         ovxumy7+bp/H6X8HFr9IOicOByqn/fDTHQWyWSfkcgTyMPievz68P0GdFf5+DYp7VKvh
         abrw==
X-Forwarded-Encrypted: i=1; AJvYcCWJwaWjUouSHF1f3qjdO+hC1r8VUzPq2rk2P7Ku5CzchE+2vj1DtdjSy8er0FoKvmX244iwcjUnfkQ1+EdU@vger.kernel.org
X-Gm-Message-State: AOJu0YxeRa96dxbkpBtILi7MECV0KjaPnR+31oLIkChbs46uUkHJgpe8
	0M1JQ6V3V5f/T0Jf4Q7YYVBoyBJUOrniAoZkSwySQ/xbS7Dik0hSiw4QNI1UoHakdVLBF1+Vlo6
	/957j9cdqAEtQd1Y58ILy/W5Nf8CLjW7WyKYqyMQ4pOg/ZGdXZNR64fENx/xomkJllAXu
X-Gm-Gg: AZuq6aIuF615Zzv3YdKPrDxN8UDgqn57wksSJr6wKxlrKzSkZUM5928UC7xlGV25iDt
	txnZyFmudq23ARQaWXME35VNHZP2R0jCvX/z1NyUpvFIA/H8qV0pesb/OsjQ6CCymx9UxUSbp/+
	CL5DXhOU2vvP5+6FsWIETjvdZm292SqWngd9vQ8Rt2lqSet1zZRXIXkwwRs6Mjcz3Q5cynGYkpe
	UaqMtP1qa4K1DrjkSn50v9GD79GxMvWZuI+/lbL5Y75iyQIILbaZLeeNAPQQvyY7rL9WuMSiDK3
	z+qt8Qtb4tg44MBIs3pZK2jIr2Dfvn9//E0sH3id6aZATWg6DsefdiOmhAKypLHWuN3PgLytA8z
	6HI/nkZi0PhxjDmM4LIyoQMsvuRS7xmya6Wl7OSIsbdeQIY3nKzVOCHdzk89qSw+jN0kCat4gx4
	TqZav+9uq7qJH6YZ5ijMi3qTk=
X-Received: by 2002:a05:620a:4489:b0:8b2:eefb:c8ab with SMTP id af79cd13be357-8c6f97f1f17mr301985385a.19.1769393386291;
        Sun, 25 Jan 2026 18:09:46 -0800 (PST)
X-Received: by 2002:a05:620a:4489:b0:8b2:eefb:c8ab with SMTP id af79cd13be357-8c6f97f1f17mr301982385a.19.1769393385804;
        Sun, 25 Jan 2026 18:09:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9faed52sm22778201fa.2.2026.01.25.18.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 18:09:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 04:09:38 +0200
Subject: [PATCH v2 3/4] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-venus-iris-flip-switch-v2-3-b0ea05e1739a@oss.qualcomm.com>
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
In-Reply-To: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ORuGJu/GYm3ysLTNkCgLVjQpY7Kb/lBszYo0stjQqf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdszkpTr/VPHkkuT9HcCfpMxBHxaVhafAYwYFs
 K1tScWkbkWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXbM5AAKCRCLPIo+Aiko
 1WSBB/4nUNFRz9f9fzYxkkloaoLvcfg/AJ4Q4pjsvQEWS4vEztUQzw3AD1cMxerJdMJ26VvWB2O
 +ak2D5cQKLMpOdfc3oka/bS3fPqylm2BgyNftcMlbxG9RIHsVRCNYJd6a+zhOvrDQIOSgnWhzUe
 fxdLb1f70R+mmshIgz0DMKoRXKTip9RqCQ2Cvs2vcDXb6EdLa0f6rSToL5hj+P1wAAMpIY6rtgi
 YER20nm9M9C8cwYHSR7Y5Zug6Ajj00KJ631AJD7jFADt+m7bzLS9S1esEKouVkoS63nT+4hJcEF
 pQwLM+lTaVpnS7y8bWK3/QO7hsopPpij1DeGSqHKzmCEJFjj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Z6MCk_QPsKy98tMpTBbfaxf2v2vuCags
X-Authority-Analysis: v=2.4 cv=BteQAIX5 c=1 sm=1 tr=0 ts=6976cceb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yfaF6CmWL1hJmoVWH6AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Z6MCk_QPsKy98tMpTBbfaxf2v2vuCags
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDAxNyBTYWx0ZWRfXyDvRPFKDiznx
 khl9JdSv7eYLIty6SiL98cB5utuG16gctMGooI48Kgb16sfwPKLsxRPpu8oCGHJRUkz8XhWPDq3
 oQuyrbf4NDn+W19hZDCHChNfNgiVY9+aiTizRaxWLZZd+GojYRWVi5EC9VQwVF0qh9kYRCTGd7o
 eBfXMkt8PL770jHauSUTyaN3qj+bwCV1qoueJQTrgD/mLtvmmsBiM9V6UxCCEUnqtXRtYTY6Km6
 AjVUQ6PNbkr6RUHuvwl2J+hsOB6bsLZe5ZdYgRAry7VlGnbsLxXCev0twqA20UMSl5wvKwEAuCu
 J4rtU0+bhNUABkChpLH0cMR4z1wBzwzTRbWoxoCggsjFpz1WPWQ1jts0gwv1q6uut3x41X3PPVz
 +7W0uj4VvcYHXg2gERNj/X/t6j0Jkjqy+e1OyA61UkipCYqDXkqwKriwkzDnm/8i0Dl+tq1NkqT
 ueP/UZY3pSDe/N1HsTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90481-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A60EF836E6
X-Rspamd-Action: no action

As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
uses the video-firmware subnode, move its definition from the common
schema to the SC7180-specific one.

Future platforms that are going to support non-TZ setup will use
different semantics and different DT ABI.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
 .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index bfd8b1ad4731..b21bed314848 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,6 +91,21 @@ properties:
     deprecated: true
     additionalProperties: false
 
+  video-firmware:
+    type: object
+    additionalProperties: false
+
+    description: |
+      Firmware subnode is needed when the platform does not
+      have TrustZone.
+
+    properties:
+      iommus:
+        maxItems: 1
+
+    required:
+      - iommus
+
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 3153d91f9d18..59a3fde846d2 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -47,21 +47,6 @@ properties:
     minItems: 1
     maxItems: 4
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - reg
   - clocks

-- 
2.47.3


