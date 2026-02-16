Return-Path: <linux-arm-msm+bounces-92908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMhkKlLgkmkozgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:16:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5EE141E21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37D7F30209F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945072C0278;
	Mon, 16 Feb 2026 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKWTSkNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ES44KAEM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38CC285404
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771233339; cv=none; b=eti4SkFw3l8lpMDExJhBBflMown53Hbywq6wPtYyeAMqEsfedA7HdVdFi9Rgdy47pp7PJxiCH5kZeJdu4agiN1pFa4Oyf3QBcxcZPk76ZVLz4quwh+6nhzoGyYWlz7qFeRuCBCGC4OfO+cb4Uh3BWeyhjw/nn7avYBYFRrVeAJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771233339; c=relaxed/simple;
	bh=JmSUF6nzeFIiMbbktm7w6KIxnSf4YOjIhjN2zIzdL9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JXtucIYgWySHeJ2bIfmQ0O++jPxFIOVq4Jko8TeNX92ZIeHjWTVyRxzjQV89B7iHDtHia3MLT6p+FTKhQwDxQT9x1/6UPuUYRcZ4KwinIedVybvz2QmoZ9ZaoYxwv8rd5VOQQ4jgc1ax96FSrzDcswlhO5QNaISWO6r13eevIwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKWTSkNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ES44KAEM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FIFrYC2550111
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vzLHoWueb5L
	H4XMdM/4ZuLuh6B9f4jYT8Gdo7eblWVo=; b=hKWTSkNBvI2sYVMVgIQtriRZRxz
	Gw2M9e841jBvQQeJ6LBxjnMyw+1Eyk7EouG86gZOkopPnyFo2qdMtKGtQQOPDK6U
	QLxp+VMnDs2JgbsY9y1XAarhjP3OXprnqHywyz/0OW0mj9EUSW7R6zxOGCMKRDKt
	SJSDm0xrh70e0QEbphisQvch94wL0REvlvNCSAZq71+fd4WRDbHwevij2C/Ao70y
	ivOZWvLwXCon4xR0wK5lH3zSFPTnvqk4kXErVVbUNcGYbfC6hge4/hXeoyomoICa
	BXwH90qMsItokgZPqc/fCl8iqEhi8cIPhrFegv9zDHpqWruzfoImrLwvAVw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah4sm1t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:15:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4b8e9112so150192885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 01:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771233335; x=1771838135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzLHoWueb5LH4XMdM/4ZuLuh6B9f4jYT8Gdo7eblWVo=;
        b=ES44KAEM01c4QIXL+pJ+MxDQZjtUFscNvsyl/k7/29H4gT/g+YM1srxVQ6myFqNoSv
         tX/v24FdqdlXjtGs+OWkdta8rClVKHGg5vwluS3PrMwumwOyzpgvY49yynqk8WQf5+2J
         LfWkl2V1jHLn97GN+DNM7eXf1AyNi2gn0b0RjTbGmN/sOzL1mc2ROXFLyCRt/hddBTML
         M0QoYwdmRgdDtwSfLF7Uq75ScTPDoPsZ+6GG8L2KMM/POZrxC98v6pIJhXew0ywv7Z6y
         BjZx0+cNdsOJnTVZShjuWDtG0L2pbCQSoTEevddDcwZXbKSnIlouyJ7P2M+WgS0DA6Jp
         x0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771233335; x=1771838135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vzLHoWueb5LH4XMdM/4ZuLuh6B9f4jYT8Gdo7eblWVo=;
        b=QiZ+UsfDGicbhXaq2ndaPQ2skjajqJLbjH01fe1Ng2rbredIFBNrlpsfNy0aFBKtkX
         lKE6iGNtHc87aOcUhAhAi51NWas+plzGLQdafH9CEkLwoSutbmxsebrXkxux0qnsrR7u
         j38I8hS91nnYTDqdgEyXkmYSAcU1Pbfehlmyf2AJjxmNn86zcHATeeVIa6WICMsnk3u4
         NhFi5dopKhK4iMB4sQm1XE1di8CrV2icRZnJ1nOJxOQYjpyeLrGkCme+fmf4MM8DXzKS
         Kle/qQjcr0G+xNCl1z1PUj053J9Dq5OvzZsWEz4lAEWQY7h8A54k4vJGLABpdqf2KOTQ
         bePA==
X-Forwarded-Encrypted: i=1; AJvYcCUMp+LLKHQSuIzl8zLBX47VVhhK7AbPJxw4mYpFJ1tjT6J5okXe2yUxM4Ai+J4//xGKqWxU3NhErL3KnoAO@vger.kernel.org
X-Gm-Message-State: AOJu0YwSDCjGhOcwfrDjFvSsXjK7Ygf9L5Ci+Y8a7vxdRcENZu/twRCL
	fy9yAoXv6zrX5ZhXY5A1w+y2chv0MrUn/jN7BaWYYFQU3h9OZ7p0ioXZD9b7phwpS20CVv+M6CY
	F7kSihKC5nvzt6qOrLYmWN16TgIUnFviBepZNraCTjGDckL4em0mWGKGUcWqr8sFeH0yI
X-Gm-Gg: AZuq6aIokUqYD0ZiJxDd80IVg6mhDlAv5GzdaoDAcdImHvPwZ7KssUjBB7p48ZS8NOh
	vKmX0MZuwFRkhtXCvqLgAOb1G3ALwH7wVKYIxMEU0t2UUPH8zOcwbDQ4jkDeq/qpFTMmBHFMpca
	wGEis0oqpFFdtv11dJZHRJ4lHFLgF5nG8Vj/s7W1LlnWXPuRaRKC5d8GoUTKvEaHGPNm3/hsKr0
	xizMvWNqeiVzfczKuymdHH86sA2VgB1X26o9AEbchSDoxzwSi3ZnuKLIrX6xDjGAeZ/Q9BGZmCj
	siyiRJnfAX8PTch9wOS+D2+PFaDQRrASzxzyxeqSmUyAZqb5ZYYf/UGtMzVcSxeOhSYV7fXr70f
	DS6EVpELF/ive7Szt51OCx26GqMo1hf8Ns3IkFA==
X-Received: by 2002:a05:620a:40c9:b0:8c5:3067:903c with SMTP id af79cd13be357-8cb42263078mr1203605885a.11.1771233335121;
        Mon, 16 Feb 2026 01:15:35 -0800 (PST)
X-Received: by 2002:a05:620a:40c9:b0:8c5:3067:903c with SMTP id af79cd13be357-8cb42263078mr1203602985a.11.1771233334593;
        Mon, 16 Feb 2026 01:15:34 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acf5b9sm23110552f8f.34.2026.02.16.01.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 01:15:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/3] firmware: qcom: uefisecapp: Annotate acquiring locks for context tracking
Date: Mon, 16 Feb 2026 10:15:27 +0100
Message-ID: <20260216091525.107935-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JmSUF6nzeFIiMbbktm7w6KIxnSf4YOjIhjN2zIzdL9Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkuAu+G/knFvTB1dINucrhXlj8FnGgfpqV057v
 G5NQ1QVBg2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLgLgAKCRDBN2bmhouD
 148nD/9FMmlkh6AOAHdnjguaVAg5YR2A9B2dbgOInHOG4PIufs+hpMgi5gtIAiuPXePXUKvDgO9
 qRZs84dHklxLWej696WvwPch1jWXu83xQl2Y+sQwBYALr5Ji06hCA7T5wf/5glnombTFjCMteAi
 9xBX69Pb8etq+yle9tJwpLH4yrzfWE/0iYkokX+MSObrouL6Hd1absxTRQ6GnA/vag8xRa/mgen
 jtjIIF9bND6Mqs1kA91eF/5xhajDlwbg6BwPj4d53NiB15hXxzY+qOkIJeKqwCzd+2BKXfsuFJy
 UAJKtJQxvQx9Am5y73eQdil/Vb5LlBWIqL1/H3fSjIN5M28FqYWm5oQ5CyU1dKkpH2VWdioswE1
 jh9f5znqp/uzfE6A8FghEUpLyx9E/8dSf/MRL8nlMpI7i03sNsKAMiDllrIhHLJio7ea3LegsKs
 c1FA6fQku/q+faXHUT2CLdGyIVtm84gkYYpZkTxIh1fV5MvMIHST2S125oS6WhUlWiXs0YdBKQA
 ote/Y53HBOlP4idnlh5KV8wOXdXMKbX7R+ofIKlZCO8NPnBH99Q/wwha5696KUVGRSrnHi/d2Mh
 7h+diAHNz0xBRz8CnKAAKfsxK59eDe1icuyGjq7jQIeDr4c3QfMK2nidxb8J/QG8deXtOyDsGWS NpjDwcjFYRgVphw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NyBTYWx0ZWRfX3z5kXo8OPvRK
 /eBKOEbOIHR5tjOprLoB1bVIF9vZoDqVGBOZ2XACHcjp++n7j+Lb6SP3XlTp6eQ5jJ9sQxo1I+k
 c86dfHo7UBFH82J6mGPahkwZbvHvjO/4YnaDrvszV2MdZBtjDDJ/srskUWDyqyUJ4r/4G2WaaR4
 zE1Hc2Pmn0Pe8fxYnROsAdPUUUzMPoYtnNfnF4Thi9eQhnXt/JsfQm5ACiOns0IGMlyi7LIT4O2
 EwuZn+wDkG8T9XzzbqPAgT9j1NeZrqavoXDfSKFnNu4VOz32JdfxTnrixymaw/LagkiD4o2/O15
 3EAJGybxp4V1TOVIr7iUAc67T0XhV7IqVEFP4kWSyvRaB6umiEC78F4r9aYfrEyXo2cc28Rpil0
 UO0+yRuBJ16Nz/HjQsfkt9vGXi7hgDGI/XnFTvkWQVLVLMP1ONm5dIbWUAB6Gtk8oRKyHk1gNaU
 Czy6O0gxfKQ/3qJjFTA==
X-Proofpoint-GUID: 32s0hKhRBEmlEozJkbKCZ3TsJq0TT-tA
X-Proofpoint-ORIG-GUID: 32s0hKhRBEmlEozJkbKCZ3TsJq0TT-tA
X-Authority-Analysis: v=2.4 cv=EbXFgfmC c=1 sm=1 tr=0 ts=6992e037 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=bn8xTXm29JKxWhvdH30A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-92908-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F5EE141E21
X-Rspamd-Action: no action

qcuefi_acquire() and qcuefi_release() end with mutex locked or unlocked
respectively, so annotate them so the lock usage will be tracked by
context tracking tools.

Note that mutex is tracked since commit 370f0a345a70 ("locking/mutex:
Support Clang's context analysis").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
Rephrase commit msg from sparse to context tracking.
---
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
index 21be447374aa..befa68d1dcaf 100644
--- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
+++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
@@ -710,6 +710,7 @@ static int qcuefi_set_reference(struct qcuefi_client *qcuefi)
 }
 
 static struct qcuefi_client *qcuefi_acquire(void)
+	__acquires(__qcuefi_lock)
 {
 	mutex_lock(&__qcuefi_lock);
 	if (!__qcuefi) {
@@ -720,6 +721,7 @@ static struct qcuefi_client *qcuefi_acquire(void)
 }
 
 static void qcuefi_release(void)
+	__releases(__qcuefi_lock)
 {
 	mutex_unlock(&__qcuefi_lock);
 }
-- 
2.51.0


