Return-Path: <linux-arm-msm+bounces-104039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCEjNsaI6Gk6LgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:37:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE92443894
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8AD9302E3CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441293C063F;
	Wed, 22 Apr 2026 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2r3S5JO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7pGIeML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD29C3C0621
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776846822; cv=none; b=oVicj0FDcvuLeIbOI/sAPgFNxjG+JgdFOPwWjMpmFy8GLIaHaUcnzXpA6hCY6+rEP/Sy+6ML2r+sG9kO+CALVe1UoUmOd7txgGOMBIQPUjqW7kDwKzQoT6geJagxVMZxJOw480wmPQn1259LmpV8iDy4oSDMvduKiozDcOhUffY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776846822; c=relaxed/simple;
	bh=EZfodb3V9xhPDIXJ+omKEw8OXKrA8oHNo8LouqMb9NY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I2/ZTruXi5OkNjlnzY9eYFsYl/o5tcX6HMlLctxeG4u+We7JTeUqjzcjI1R12qmxbXWxCjYkhVegV/e99R/Ik8mWWrbQ3LgiuiTubS2OMVBp/YMJD0pIijZEPcB30doJzU5Mu++Ly20dbd8hmjMtP54LFnba6xD/XrPXctYc1cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2r3S5JO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7pGIeML; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M50jhc2000973
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q5iZv5/Lp+zXQTNRWA2cAlbkpTK2f0JjgEP
	2tReXIyY=; b=G2r3S5JO4U+Qram8VCjo+bb4Oyz5GgUtTchUATnUP2cFhWJIvTU
	NrFGInx0S9UAXhM4lsl3cFlTVEHcOwoIB3SZu8kkDqfOAIuGsGCRHEbqnJkXJLaD
	Io2+OmRtpCdwl+8l3stn36PKJ4dyRemDqtsmqTInLSswvPXphQRK/URXY4rYlIJr
	dIMVW8/A4BUAZ+u24VRx7Y0UCRvlVB1VmQ230Hw0mYf/lxMQ+TyGoIk6ZLnpF7rk
	536SGIIbGxGrQKmvnxSBxUDFVlPzgyRu0UTTw4hLh1TlqoVdSCEwpOFOqHMqiJAX
	DGcJPFm4Ipo7EoLl0CJS+Ta6Q2YXQlWKYNg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfaj2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:33:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5d1c2289so114127951cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776846818; x=1777451618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5iZv5/Lp+zXQTNRWA2cAlbkpTK2f0JjgEP2tReXIyY=;
        b=G7pGIeMLBcwBEIgoy+gSQajgwF/vPVd32kiLIaBgUKof6Gh6KWsiQHN0AeWY6CNk5t
         tPUGKYxMVHawGGWHb7bHApt41RJyLV9NCekgT/KLGAmaDgifam/OdvfXWBQscuisVDjB
         jte2naZ4BMF+z0qL6+BwwcDX7s9vJqOj7Eyid5XglhUgFz7aYiI3sKNIz22tiwc7ekQl
         jPUD/dxXANKJ/xDynisKVCXWKKVMaioSEICS4Pi5GYKsh/sJXrAvdlHaKRjDiaibjZ3c
         NtNzVjLGko9Lm2GTAjdGx4GOcyHE/UZmVN/5JfnAVGAYYz+PpRoFmPuLNnbX7rOyYAUy
         v63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776846818; x=1777451618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5iZv5/Lp+zXQTNRWA2cAlbkpTK2f0JjgEP2tReXIyY=;
        b=APa1Svk5D3Lv1A6v9BOMneYpw4SD4hSR76SWJajpoBVgk8fuGAU7hTFTZP0bqr3doV
         0DLu63ozoMiunLUCQrB3AhpdjSPew4U0+aghwQ6loReS3D16ZMu0vDfBV4z2Agc2e/T0
         WWhYQVu08XGMx5iMCmUeAIkZ1uZlbY0zblfxHeU8NShJe94pVMGfFkITDnn9islbJVHR
         OIVI9v8YBswf8JoYMCOPl1eK0bm8bEWsUqQUPh75FxD/Q6AL2Z5MGqNtoPW2C5l3+SXb
         oX89Vk68e+SaMKsKrqjM/cl+a3so5oe25ufOpUj6byomC5F3nKUfg6fN9fYuuBHwAIzX
         bp+w==
X-Forwarded-Encrypted: i=1; AFNElJ8TOdd5fziOoW12tWzJ0+XvhDhNCMFuXi98NkYIYKfOrzBKG/1Y/cRJj6MY4EZABBYd+FPPpkJKmfYAsDI8@vger.kernel.org
X-Gm-Message-State: AOJu0YwCq9rtPwNrJdRdK1ft5A1O8JM6EqoN9vPmpFyxEISpdx4aWKAp
	MbFgv/RwYrJjCHx/zXFyqBkwj7IAMM3JCF0NyfDWsZwxXQMmhp+TsJQFkm7SxkfPmx0Htw6B9xv
	oJr3maZn/41cVxTSXseX1BdGEBDLXUxubTOCZPxRfoBbbnOaoP4qjjNwGvPs/J7Quhz3x
X-Gm-Gg: AeBDievCKGksfvYnbYd4Y+FQVeXW9UojkyXsuMQZPbgKh2zsctRCvDKdsMwPpuckrnh
	kxbWc+toBz6P8ocD1NnpL/qqslJZjW/ZNve5JPiLtnivPGUmtVMk37ZazzQZmHg11UMCIRjSt8v
	X2B6C2sIxRwyZRzq0lx32ki35/h9ehK4IZDS+igXv1hLhLEspZnUTloWpWwcEQPkBEMNZG3Jh+t
	Ha9zimpGL7aGDsOXuW48lYwtjQugwpaBfspqAv/XWWoTU3L11z5Nq7Fife2eA0vnVD+xni6bm5L
	FPg9kWzwP51CFj+/Rb4QvdJEnPedYgj8iyOUQ/esVJ8Dj0WUjhzWuhFQKpRwKh9kqh+5n08eOzz
	lta45m+NVzRnkc/ukgxrVxiinllkiBLhskRvWJ1wScn1Jym4=
X-Received: by 2002:a05:622a:10e:b0:50d:6ef4:b3ae with SMTP id d75a77b69052e-50e3681eff7mr321417471cf.7.1776846818277;
        Wed, 22 Apr 2026 01:33:38 -0700 (PDT)
X-Received: by 2002:a05:622a:10e:b0:50d:6ef4:b3ae with SMTP id d75a77b69052e-50e3681eff7mr321417081cf.7.1776846817828;
        Wed, 22 Apr 2026 01:33:37 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc177dafsm531454115e9.4.2026.04.22.01.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:33:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom: Unify user-visible "Qualcomm" name
Date: Wed, 22 Apr 2026 10:33:35 +0200
Message-ID: <20260422083334.84294-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1198; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=EZfodb3V9xhPDIXJ+omKEw8OXKrA8oHNo8LouqMb9NY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp6Ife9nxoQ5sxaZf5yynx+iMg3mP0F/S4VJ23V
 TH5Pf4fpnOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaeiH3gAKCRDBN2bmhouD
 17nwD/9MlQGTC62fXav7Fogkt1NHdQfseLH+Htd0raylM4QoSglfMYnur6Em3g4CuNts9U4jKog
 5uVvLIiGMKTxbqSwAuz9i0w5sr/Oo3HQohR+e2i/d8Fp6eXvXDdoci2gWimKfEBCTQY3suVqpBo
 xm5E0tHMAeC8D0CmRdxvoJp8cjrV3pfoArS9btqNEkV9qpFj1wtT2vNNIHaisjvDmGeOsgLq76b
 VZG9vEnZ6IZvZWtSQjuzdD5UWp8FDUJLD5n/8BA3fmbpZ2qRR47v+cXZcUqqPloVtaN/dSTzKQ5
 OFKJR+uC9szV82zx9JoRbkmimHED2P+j94LOiwfHF4r+8B8ZlvCWKoxgpf2MJ9hsjAwOLdZn75N
 /vJmZ566I8baT+QpqZSMtWWAmLN5xBpy0zXAK8cOvftPuJtB9ooVyhybC58FiJ64/knWnOn/i2o
 zzUAMCODHapCAksH2zI0zdHjzW6yKBWiC6zh08RWNDMlIZAAiRxXJKae/gpIHZ0FzCdf99+2Y9l
 sxwccH18qGlxgPUnj4LPOxAteeMxqeOVnkmaT8vkrvOtNFDduDj+5AV7+EXYwRQVLzdng9UFaGv
 uD4j3j3PIDoy/UX2dCyuXJkeT6T/7Yntasl590b7FJcfa00/yjmrjVOZU6V54zAVXRm/U6+FcVo 7YWaDuUA4qHzS/A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bsQYtrM41i4eOAc7RKlp9wZxOcABLgac
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e887e3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jZsdTjkLNt5nVvcnXIMA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4MCBTYWx0ZWRfX+8OKZI41svmE
 hVWPx18dtStYKzEJF0PnczKawwprkRX+pugpM0LrZD2q0tjdcJ8FrWZEGILU4xZajnGYImeq5b9
 cqHEJDHqJGpRtnysFB4PhHAZoNEA5hMsKNi+pE40iH/vbfGwlBjgsNPdr4vhfHWgzkgv4VwpuYy
 U6vAsk/5LTLcVoUvozfTD4reslNeuy2FLydLQ96e30l0pH5ILk3ALVYpChTUWQKpZ0BuUa1CRN4
 +U0wBGjtKxiwv7nbDHGxk9tGmSauleNNryS1NXUX+65z6rQSqbugA9qZYniYzhrxOVjVPATWcKy
 /q89EFwIrvURqExb2238mEvDIBxNo4Z6lLxMfBqEAYcHcG4sdIhfwMXWd85twpjTJxlYqMuDFTu
 rBCpEmsPIFaN4Wb/tIN9bU3uKOrQ7u2V+SyVbGrfbog8Gz/swxB36RRbDn09Ov0c139Ght8AKIp
 sUKspshX6GJVL1spQiA==
X-Proofpoint-GUID: bsQYtrM41i4eOAc7RKlp9wZxOcABLgac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220080
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104039-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8BE92443894
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/remoteproc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index ee54436fea5a..6b4104fe66a6 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -176,7 +176,7 @@ config QCOM_Q6V5_COMMON
 	depends on QCOM_SMEM
 
 config QCOM_Q6V5_ADSP
-	tristate "Qualcomm Technology Inc ADSP Peripheral Image Loader"
+	tristate "Qualcomm ADSP Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
 	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
-- 
2.51.0


