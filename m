Return-Path: <linux-arm-msm+bounces-105545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMMxGoXq9GnpFgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 20:01:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FEE4AEB06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 20:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB8663013794
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 18:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541862D949B;
	Fri,  1 May 2026 18:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfQIWVTR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kLnHpBX0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25662214A9B
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 18:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777658490; cv=none; b=WHb8XTD87pBnMqEx8t+Q96tg+rFO7Hi5jvjWEUp4zOGMfKx48gfY1j2Dx70aAFXy3AXps9SEEibomSiq8s7VEUFp9lSs8ZLthM+zpv1k13Hy2reV/W/Ns1W4zPEpZqzvgkwYzFFA3/GpBqunC44qQaahSZqto5fhUdsa4dygVD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777658490; c=relaxed/simple;
	bh=OP05IAUM59Wej7gcym76Ho7xceQ8TlJ2QrD84Xl71zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=syQN45ynv6YcJnQlcjIorg/vVSNo33qWGCjAWnjKtugj1ITJ4hAbmM327VX6xdg0fwuxf6fHK5AGBaLDFZOjUEby/O+1JHkTf87jW2bqgd8NqR/EXvZwTi0w8zpm20hOcPBaqMOt8MwKoz4PIZMt7IZh09rmYFx0rYgq81ixP1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfQIWVTR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kLnHpBX0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLn36196096
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 18:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9AbZcZJNw5UFLCrZpEV7wX
	j++1pImbrGRuYCS4jZiDQ=; b=LfQIWVTRJvrVX0URLBGkvnv9iP5CbRyrrVZr+t
	pPv6tcFXkqJV9JNrWrPu4+034P/XXFG12G7N4hMRWvvp9Tw5hS3TdVc7WHOuA3hG
	cNKXyjdx4CmuqojZS5/smYDfIcd04MSqTS3V1YYC7OKDAXgPgIvZQuLAcjifT2/r
	g1aQjT8BdL+rvB8SC2kB3LxRdJCryRx+nUH2Uy7EtUa2ovlCq6n9nRpmO8HjXXyL
	1xl5NjhAbxVtkTVkzi3/z/esWRGY/oj3YvCNW6W46hmTdE/FDn1VmIcSRpAQOZCB
	NUhQG2V7zWuHcmz61gNDEk4m3BOBPoTarGq62N39G3IoU8Bg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvj8m2by7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 18:01:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7c904d476so18225315ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 11:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777658488; x=1778263288; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9AbZcZJNw5UFLCrZpEV7wXj++1pImbrGRuYCS4jZiDQ=;
        b=kLnHpBX0z5N5Zt/IoexToClj8nrISgWsZf0NyWORFDWtvFtvGwxbJ3VKV5lQA7O53T
         xcNO359qSOAye2r7zw/oQJbvB8Hkf5WMoOQS0zzzJHN7VdD/5L/DmWiZRMiuEaDc0EKe
         E0wgwiZc4mPHeSagLfshFDPX7OxpZvQLpvfI1U+mLm26kt+XHh4EfR/e/RhwNs3IDkhT
         Q0VXZ8FFeBp5VIgrmKmN+0UT85OtVPcG8tbtRldroPsbxx1JxOzekXM72b02+ek5DMTF
         LPLQ4egS4WqTYi7cutumrCgOwWJPHnk6WQ1/oGciXh+oQKl9wh2n0w15uZf5MYNs1UhZ
         j3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777658488; x=1778263288;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AbZcZJNw5UFLCrZpEV7wXj++1pImbrGRuYCS4jZiDQ=;
        b=sXlfZ+YPMoee2bd/DCz08i4VZbWiTvoXRHakRuxIOabQs/AAVhcpwRuFVJe4H+xKtT
         EXoGcmgGrnTGF8MKk+Vzvi2D2PPQtb87mcsrLXuXzncgQlQ3dACVzRSFbUrOHJKk1SUF
         eHRKivB2KkpraoWm+4xyIs5t1u7CiIeDobkh5JtFUT2cRzS2HOgxsc198wZDm6JzU2zB
         DzwtV0s14XnaWrqgPQZfsEz9A89wvVrmcaqGBGFbjKrUsiXcEbWMMl9GWPdDe4AWFkyh
         a87/T11MNCQLNqvpoCLO2/SczBK/MUFObabD6hnFG2cOb1k2oP7wUo+DZVWELIQ0NfzI
         60yA==
X-Gm-Message-State: AOJu0Yzug9306cJ6oG6HSmcpAQ+ItiUlIz9oKcxzlVIdvNVhUraIj4du
	nHvG+WI/fweBHFZnxRqmR6xLYdjHJqg6Kdqq8KM/JJerV6OGm0optuJzQVGkIZcWU8wJqNlNB9m
	/RKZ3EkuHkvpoQAuEhw5EB8njiT6XbtZeDMamaMa4e5S1XhjbJYQxxYOpnIRcY/YNV5s1
X-Gm-Gg: AeBDieshyML8Qz6cVJAeXhomxRirS6a7bUCmnFN/VgC4Cti9XpYUdEvDcMm/DdIOIMy
	tvMa/HgSpjm4Wq5yC8tIeFG7BlNxJMCb32GGYevc+G1u4/MKJK096+AYqtV3w5qrIpAvelll5OS
	UNL1tyIE125+Yl+rJ5Md9sEJzabsRnP1HYKrtq8CWc7tfNnzTPS8aXqnHON08ySuvdznhzCxHGr
	nt2vtiM2K5EF6iprY87rVrk152jv2YrXXO/EgBP9LweYESI9QAoJz7gplXWMWVL0jjfNY60hWQH
	RRaDJ29UYJp8TLBsiOnbhq2ox8XIZxhK9NWe6RA50lwxNCSm2AubS3kihXND4McLKo78JrFFkus
	jo5Fwcfi28+ZAc0L69n+HH6B66mcb0talWF1iyEg3xS/eg24=
X-Received: by 2002:a17:903:4503:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2b9f25bb248mr1527765ad.16.1777658482481;
        Fri, 01 May 2026 11:01:22 -0700 (PDT)
X-Received: by 2002:a17:903:4503:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2b9f25bb248mr1527485ad.16.1777658482018;
        Fri, 01 May 2026 11:01:22 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae15fabsm27287345ad.44.2026.05.01.11.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:01:21 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 01 May 2026 23:31:17 +0530
Subject: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGzq9GkC/x3MSwqAMAwA0atI1gZa8X8VcaE21SBUSUSE4t0tL
 t9iJoKSMCn0WQShm5WPkGDzDJZtCishu2QoTFGbyljUjXeZ8FpUcObgOKzovbd121FpugZSeQp
 5fv7rML7vB3oWrUJlAAAA
X-Change-ID: 20260501-shikra-tcsr-binding-fff1689e4097
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777658478; l=915;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=OP05IAUM59Wej7gcym76Ho7xceQ8TlJ2QrD84Xl71zM=;
 b=T5OUNSNH4adZUB+GGAsoajCL0U7a2J1OIzjFR60q3qJ0Kj4xt/XLxsDNkaARhGHQqWBqDYyFT
 M5crWikXY/iD0aJndkTEOZW4/MzfY+Xn/rv1oJplclzkNlMRi6qdLBS
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE3NyBTYWx0ZWRfX9+0dSjsKlxdU
 3M34hCFxMjyiFJG40FM6kcAGnB/Sty1OjMR+8lIG7lJJvkq60SXYErjZ2oTQfTTGikkp3iT66h6
 97YOXhJQKcwTAfKTaQH7CiQleGufF01gyKliIaprJnpalN2qoZea9DRUA8XV0YENaBT/iQehfVn
 cG/OQI2Apd4UEZZRdfT0Pmk4+BHK6c3/9i+RKCJbOLK0yYWOMsV+brK7CC/WK3cnqt2lOv5TEyx
 Bj0nc5QsskLg9A0W4K05CsMZ37Jxa6AczngeRPk65roVrOLlIFcoXMUIc5PWG0MMXHsQs+SjkxL
 fV683of1ZXZAsVzDcTwPkQ16ooM9+BE++yP53bAqgzFqtbYuYGUkknDngLqQSJPNLfF/mMuXqIi
 7mkhoamRhL2oxTgXEWr7FJ8suQnY4nDFm+pJp8iMPYEYeOuF/tAC6k4mNSgd6xkV5AyxUEkuAnJ
 aDo3gnLLxIHP+oK+MLw==
X-Proofpoint-GUID: ulA1QC2JHm424F_tgFcxyyvOvA4GNMb5
X-Proofpoint-ORIG-GUID: ulA1QC2JHm424F_tgFcxyyvOvA4GNMb5
X-Authority-Analysis: v=2.4 cv=V4ZNF+ni c=1 sm=1 tr=0 ts=69f4ea78 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ouq3su2OFfx9W6HEdV0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010177
X-Rspamd-Queue-Id: C0FEE4AEB06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105545-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the qcom,shikra-tcsr compatible.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..51d0dcab5706 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,sdx55-tcsr
           - qcom,sdx65-tcsr
           - qcom,sdx75-tcsr
+          - qcom,shikra-tcsr
           - qcom,sm4450-tcsr
           - qcom,sm6115-tcsr
           - qcom,sm8150-tcsr

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260501-shikra-tcsr-binding-fff1689e4097

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


