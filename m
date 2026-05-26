Return-Path: <linux-arm-msm+bounces-109707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL5HIa0XFWqQSgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:46:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A235D071F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F365A302C0D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 03:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C517C3B6C08;
	Tue, 26 May 2026 03:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jETTHJ8I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXMIE6lP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3A92E5B2A
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779767195; cv=none; b=OZnWFrw4Bx2ydip0sVPzamD0fgsunQaDTbsEtatsCqG2G5AchKhb0+153fRD5EWExH6OlcsjMD0EbDIpCdJaYhEhO5Sgr11lR33EftyYhQZFIE0CZ/3Utzb7yYnwuwVOfi8g5nRZrbVhbwiHY/sMXzxu3FJp7vu3MjvfJXsQahg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779767195; c=relaxed/simple;
	bh=TaGuHrdQEmaPBnA/CUl1CYmu7x8Y8fKi02IHnxAa4Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rw2ryLKwmhJHLgOtdAjMTZgUBQzXewgAcVAEdEUeJcH+YG1t0xc7jGo20YAEgjZaMueaXr1cqANYKx0kcpCjhQvsdE0wIV1DYkarujhftdITTJnVYJYqVqtsTaXx7lVfqFb0oEMFys3KPjcIFIrTXIVzmjPbWHtywx/PjrsiafU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jETTHJ8I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXMIE6lP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q0s05K691689
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBqNg96OP01am6zFjoma6HdtE7tav/kzE5YD0guBimg=; b=jETTHJ8IYLv2fjmZ
	Z7MZfcPqCV1iaVSA01sz5DOjVeDK5zNw4I6veOi3Ivl8znANvIKhrcgXqgrpftD5
	8pRnLZ7+ilzL1+Yk3OezG3lEAEK4cGRpukXfvtca7bkVJFdPEx6vf5sjXJh+XxAL
	OtfjqnivHK7doykQq2wEQN8+qdyF4fCzW/jCDaODdMaroJKeH9SpidSDGZA97Hio
	byjkMpu1X3pZB+Mc/p8NeQd7rcNRZF0+IvCNktsNjo5gTtisSMgTUoXVV7EKTZP6
	9+vAGT1CRztCUCwhVi/34oIJq1Hdc+NkpuyyMSBROFKCOr8CHX82upYTPrwqzPK1
	WnM+pA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2j5w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:46:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304448ab58cso2086693eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 20:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779767193; x=1780371993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBqNg96OP01am6zFjoma6HdtE7tav/kzE5YD0guBimg=;
        b=YXMIE6lP/HLQy1nhzsb4ggc4kxBQu8XQB1AiYsFgNSnija0n0/50+V6aQJH+99ALj4
         qW6gQnmJ7fgvgPBfflpCTeNEqpH4Myh9tYagdcoWnEN6XHnDcUzr8xD9m7d4YQw1rHLu
         giEfg4vRWWazPMpxpCH+MYmHYeOLcQUsPFYE/5xaGKyCkz4QZmir4iZi253V8kjNOIwr
         rzi3P9LawHE8Ta0Qm18D9+n/tVJJ/TaQCPLN+OQtxtvvOReej5xOTzQMdwAnIrTOJBa1
         F/t5aPwoMkkR06FNt+aSqu0pqiTkc1wspm8W54BR11c0cbx2nFQJiqLxbIaRPqMJHj+l
         FmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779767193; x=1780371993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fBqNg96OP01am6zFjoma6HdtE7tav/kzE5YD0guBimg=;
        b=Pt3gih6ePjavxrNJyTiLhsxSvdgrZuKyu9iy2s0gm2NsIbT1eB7gbbLiog5Ym0pcaR
         2wZ1HNix00UDSHrt4rzeGnDgTqHAwi38CjjqSyagLYeSChs8pCT6pNqXAWRKnDXPyOB9
         LNjFX8y/iA0dHmZ4fHj3RtWuy+mVVTpuiFLFin8WBcSDBpIq7EYbtrlbQMI/RCYhBIU2
         eRy0bQFRQd3nz+vUpTvZ018lf9T9Nrbq3BK9PyEAwUtClqSpZy3Q3Qt2wuCj4c7zDzE4
         g5ziDg38qHlzf+LaWlgy+cPzKWoQv8l6ocxfc2ZVEiO/gcfRVV8IsidDrzxSmQDLCc2+
         hVPA==
X-Forwarded-Encrypted: i=1; AFNElJ9gua2bKv1wLWpO1BVROTHFKZkPpsfygMGjfbQDYReFsEcoBRMD40p1n5w1hHfZRrfvTAb2scaZ4yGuaRZO@vger.kernel.org
X-Gm-Message-State: AOJu0YxtRy59LgqqnwiuDVMAJxcxTBdhTCo5E7Z3mNgI7eUW3wxK3l0Z
	TNYxDS5peJG9PhBn85fYVeyUc3W9I55TmD2OGarzmRetXwFBuj3SphtR/CFF8iuI28h1wz7U+h1
	2tAADx4uwrfenv8kALsuOGtAwWOJVgU+kRVvOqwiTLxQj9LEP+sdimC3InI00kxhMW3UMgKyytL
	Sx
X-Gm-Gg: Acq92OHkh2UrZ0GjMQ0aAwxYLIY43AytwdUHOZvL7t4f9nUODc0mDHooybnSHbTDVx+
	mMRBMz79fVwLltDUp0lD4iVE8VAe8To/LbWleyilINkxSjwj1W6jPMK/BNotAsVl6u9J6l9tiJ+
	kC226bjVTflU5A9g0yO47PhhAmWqdp+8WxbQgUIQeqDRO/Xc1sD8DoFBjYRqB/IyjFXTqFcCv0u
	8VWBqZg9+K9hxtKxoMwOed0m27bzsQknj2+OW+fvY8B2XdlLV4uLVPosP2jQedq2AYJOAbsP5Gi
	l4BI9Hikl2OhdgYo76+1VlREPTNIp5V3cgXKmVJpA8yVHdTRIpS17yQf1vn+uc+8RAkuqkh/QUN
	ttrEPwmt5qjUEVTyuMwexFirMb5TR8c1u/U/tFWEjpVIbe4AlycL6eEklxxdfTKbzMFwxBhuNzF
	4ofHTWHtg/uY4+t7Nm
X-Received: by 2002:a05:7300:ec11:b0:2d1:299f:521a with SMTP id 5a478bee46e88-3044919e0d3mr6994966eec.26.1779767193050;
        Mon, 25 May 2026 20:46:33 -0700 (PDT)
X-Received: by 2002:a05:7300:ec11:b0:2d1:299f:521a with SMTP id 5a478bee46e88-3044919e0d3mr6994948eec.26.1779767192523;
        Mon, 25 May 2026 20:46:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304522547fesm9792271eec.21.2026.05.25.20.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 20:46:32 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.or,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 4/5] dt-bindings: arm: qcom: Document SA8797P Ride board
Date: Tue, 26 May 2026 11:45:56 +0800
Message-ID: <20260526034557.1669007-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
References: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 44dQh3cyg3r3URnffuKcN6SWd_DtXyjW
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a151799 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dQQo7YwDhi1l8iBccy0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 44dQh3cyg3r3URnffuKcN6SWd_DtXyjW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDAzMCBTYWx0ZWRfX4lTiyNJMISvN
 meXHFvos0YHovtSHNt392OcGKFRf6EBjsWduPGgi5WZCMTz0PrAyrAAi0E2TzstR7CqR21m1jpg
 oXW70hkCZ1lZnc1le3I0QmRDxJnE/0LsfvpYqLEPSOCZ7BYoOM/13ToM9Ay7SU25ww6FPlZBtG0
 gJ4zhT2OjeAdpC6wjjvBbZRkBk70dfYbUId6pWO9zzzAZrHTDxk+7ErWGVCk+AU0eprzSOa68VN
 xIiuYTDRB1PTIO0nbUJcQQMKPjbaIXEHi03v5GpTwmnvaG+tzLHyKbPziQTunr18y+h0VSiyunz
 3frxwncttfhSjeNrDAo7KQFw16+8Zc8JDi1w2fBoZku7qFe801qXV4Cz3lEoa19FQFuPeTB3wZ3
 iEGSwXe8gUcr1ktnlta34Y8WGLBhZn91iAzRuHrICaEC64/ynlEyWXu1gA3D5DkU+gLNV0mCvOW
 c1mfoj7AbUW8uG200aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260030
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109707-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E5A235D071F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Nord is a new generation of SoC series from Qualcomm, and SA8797P
is the automotive variant of Nord. SA8797P Ride is the automotive‑grade
development board built on SA8797P SoC. Document the board with a fallback
on SA8797P and Nord compatible. The SA8797P model compatible is added for
distinction from IQ10 model (Nord IoT variant) which will be supported
later.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..b10383ddb899 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -303,6 +303,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,sa8797p-ride
+          - const: qcom,sa8797p
+          - const: qcom,nord
+
       - items:
           - enum:
               - 8dev,jalapeno
-- 
2.43.0


