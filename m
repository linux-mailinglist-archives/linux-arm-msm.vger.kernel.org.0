Return-Path: <linux-arm-msm+bounces-102749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDGfL0ZG2WlToAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:49:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0B63DB9EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5942B30371B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6953E5561;
	Fri, 10 Apr 2026 18:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pyQ+RSKz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRau8+eI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACD43EBF1A
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846665; cv=none; b=LIvXk08punc4aom623pr4Zq2oeSn0mRxMXY2WbZ4npvlXXPQbF1Q9HaPsgbqs8byz9omWJzTp/0TMirteEpHBoe8VqSYpMYnPzae5Uqpr13XYArw2n7I9aXyAFgZr4NTdBzNhoUWmH/GC9Tzy8Yc0VaEQQp6yqwcWv5GYNJZDsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846665; c=relaxed/simple;
	bh=QxOLV8A7ASktDil4I4jAuFTNhNuyhy0iAPJv4gkYYis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAGsimiFiLiMuu5z5LXQsagf6Ewl+P/Er6LnxdRIBT+w7qz0lt1s7gaFj7TlIlENqhD5JRw6+tDFwjyhQHqpRrwIR7psqyNjWzPDMxtyv37RhLUSodpmkKUnSlGEQzhjH5XNIwyj+HpTQTEJ4ra8qKlril/JEDCPPFXJvzMI66w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pyQ+RSKz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRau8+eI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AI9iFG438777
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qW1upb9r60T
	xszm0mEGMzfHL+nqCwza3235dvciAB5g=; b=pyQ+RSKzZI7Q6F0ltbMR6oeqM6I
	zdpWaWRri8ivWDS3AmIFdJW19XcBPJdKNNtHyRdun1KGWDTbgC4D6wVP+FF6zYmn
	ONW6e0/x6Jb2DHC+/vLOHlhQB5upoPLX5jn8ThgyjJGlKmXjsuaobY+L7MJ6gw6U
	FNy/p7RBXFWu9Qebxdfk7AcP93MIEMWs7LZRG2Hrd0YnM0xahP303iYifbQBysal
	+i4Gy4dXQQttNW0PiATd5AWaNgMQI3nvHfAzWVDKl6bIpV95tOk7uuPyNTRI6pm6
	ZKnUxur30qWJB9p/5A3P89sRPWzQSBJoTPAS4051SXbd+8seo+ql2thOYWA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9semu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82ce0a9e125so1277268b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846662; x=1776451462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qW1upb9r60Txszm0mEGMzfHL+nqCwza3235dvciAB5g=;
        b=SRau8+eIIKtAOmiKOxjG8bwWANNFXJt56Xwmevf48lhdakdeU3n9vYzHPBy3HF545K
         0AVo6s9yYjVEnFWa/jqijhWMMqZQhlQjUg+XjUM1+edsw/r9tgtkpRzwWvs3WqxNUgSQ
         ss64DCp2pkulHVhixXxrv0xwT6gbMZAQcDwOm9eCpmVCKdOeSnwwlBMmQ6fqbr7JRMMR
         1QaOxVsi8LdGYbU/0Ecj4qX+ud5+2HrSBvNhEBrhjqnuCPUOYNzFftM52oJF1AlHOebu
         evRgcVFqjau9vXvv3dVFaAfzRJ0kg4lH3nxC/qRSyRV9zhwg0BHTHsOu1lGVRK4jHMtg
         MQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846662; x=1776451462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qW1upb9r60Txszm0mEGMzfHL+nqCwza3235dvciAB5g=;
        b=b3zmQ9Dk87EEmpuDbc5dV9e2GteWeohDDDu2fh1KKXTuPbh6piS4/tMBKsOks35scN
         S+Xu8CmVwXZVwWI19fLObBKaJjo/MNy5STFJ3c4BC2YzQockJYMUN7v88o5Wmt5aDIIk
         ng4SZNPENzmrX5zTwKX8EuNiGvsEY1EoKUL/YP0OA7Lak2O5rzX5RUxAsAC6llFR5XkD
         79DVaQYl/kuEdGD4X6moRs0qo/w4gapIfaJQL3gGC+9F95Br3iD90q7DpVg03FFY2HzG
         TPsFTiUXvipREIivovkAMr/rvSTomkwP+ZeBPHNx6vcX911QphQzi31ZsnhFfiajU8Zh
         Rv7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjz75W/PMtvg3BLTQdJ6l9iHRkiVSuDiyDanPp1BmN/QqmZievAEaaOZLuicKJ0BjBs/VNLlINrNsj7g81@vger.kernel.org
X-Gm-Message-State: AOJu0YwIEvnxXHPUR8H1fwzmIt1A15OKZUwPWdusN7T6r88UM8vFbxS1
	IRjMUXiHupyoaEQ/u7dHIleKWw+bUWxCmvPovbjmfUTCCEJ67PulqysMbmNdQu4XVY9RZuB4ofY
	2oSJK61b1kR2IWa2EbJf2A7+JvrdTQXMVLVycJ1t9ndmhuK7YGqbYV1OVlZsbv2Myxfic
X-Gm-Gg: AeBDieui4mZx6rHNufCrUUX2xWTbfLH71U6gFlyLiUnrsoGRhutG0jnlNDKUmUwjmkV
	rEkmlXu/bHzXRJKOVvIJg4b/FST659UM9IXSgC5lO/cR2SFEXE7nDveePcr7pafqKkgFeJP09f+
	v/i7jLDq86M4aQUtQF+eVvGcgWnwUjJg2NHfQS8aXf+FJN2taUPzeAGq3WnDHMZL3rKwA0ng47d
	xuhRK2KPeVIYbXygNw1P72k/UgwYC/BIYT2TN+OLQfxoHzX/CjFAbHpVQCcYwXRGFmXGyd+ZuTt
	MwH0XajI+zTMY4VKSBUj5ao7VLSfoGdTDu4Ari92WQKkSBdO0doPAg5gJjFgclE1L9kAtlcaBL/
	Kd1snhXmBFq7ua3emCsK8ZPf0QQE5ub0qGyJ2ESjQAxXlgUZn
X-Received: by 2002:a05:6a00:c8c:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-82f0c131acfmr4865601b3a.9.1775846661538;
        Fri, 10 Apr 2026 11:44:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:c8c:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-82f0c131acfmr4865569b3a.9.1775846660973;
        Fri, 10 Apr 2026 11:44:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:44:20 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 35/35] arm64: dts: qcom: talos: Drop unused second PDC reg entry
Date: Sat, 11 Apr 2026 00:11:12 +0530
Message-ID: <20260410184124.1068210-36-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfXxVtPBZNdJfnu
 gWb5MutWfXv4KO/6lx+fJjatw/aVC5A7uxgGTcjFFG+HnbecwGgf9rzu2EY35OTxjrVVLxxsmjt
 0AVYA1b++V8WhGu5kZZEq2CMexp3tJMp7+nkd1TZalo4MT2BYwhgpoufgrLRydsQftTcCAl8jXx
 6BV5s9DZBsKeboiBeiJzsMgxGUiuq5lcQUl/AhHrH8nBIxcM2eaeBJhsnl8rBBNVmxLxyc7K3/H
 p6usV8DfOrcZh5Dcp7U1j2s1u4Hp6EFF+XYsqoMp7o0hG7i4tISlcyispMPYpRuO89HBilJ/XDB
 YuwNMqOed7b4qpR5RHy+AYiGr2UGgsU7AcjS4yybqFRi7iswtj/+QdsGDzYocQWbLl0l6a1qVWl
 dDzrx7QVbz90p+Ay1auMjiaq56kf9A8A++rkkF/3CpMAjFaeltpM+P1YEdUuRjbQ0xv97iryreq
 6t172Zmm9zEjfMyJQSQ==
X-Proofpoint-GUID: ZzJVXqL4P3Ko4cJUhiRZbFUM3TbFB0-x
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d94506 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=YXOZx5_nuN5cFopkR2oA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: ZzJVXqL4P3Ko4cJUhiRZbFUM3TbFB0-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102749-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD0B63DB9EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC driver only maps the first register region (APSS DRV) via
of_address_to_resource(node, 0, ...). The second reg entry was never
accessed by the driver and can be removed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 4b038fb22071..e825ee1b957d 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4080,8 +4080,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs615-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x10000>,
-			      <0x0 0x17c000f0 0x0 0x64>;
+			reg = <0x0 0x0b220000 0x0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>, <125 63 1>;
 			interrupt-parent = <&intc>;
 			#interrupt-cells = <2>;
-- 
2.53.0


