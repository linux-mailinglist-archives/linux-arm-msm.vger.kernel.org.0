Return-Path: <linux-arm-msm+bounces-102715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ9pG55E2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:42:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E333DB840
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5871430177BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526493E3C4A;
	Fri, 10 Apr 2026 18:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npxzrkmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SoX6w14A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1459D3E4C84
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846530; cv=none; b=KFC9T2M3TOhM4sAwO90cRpsE0rK8r6EhaP6Yb5C+QGmB9taUSfTZSJrwgjl4AQcWOEm+K5sTZhKYN2S4x2/HtqlAQJfuqIL+7xN4qmQgIzOF274F2YBr3K2eRfooFrtCKBuH1FGK4m3Lsm6EwjVBY4pkHSfl0uTkQNV/XDaWKJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846530; c=relaxed/simple;
	bh=W7txMlJqcSc1NHGINhI813e5ruK7f1b9bi7+SZufbYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ALRuVycybfi0N3Lo4KwD//6YwA4NGWtU8fFEvOJsanSWRNGILeAu88o8LblxPan6tIMcXPiYDs/cXMYlt6a5ux08emUqCJea9RzlnsC9Pj9lNfJZR+u28SdKcX5NrbCm1bcHa5v/38oSy+Ar7D00AZFeHs0jU7Mc6psK/NMy/s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npxzrkmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SoX6w14A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AI9a6S3742959
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=958kxvmKTRE
	TUo1aV7I+Br+WwZHSYmix/XOrNEJRE+s=; b=npxzrkmdoqxFhBz5+IcZudoEpaX
	OOtStrEcHlB3Eq644oBOhtuqb97Y3sDx+4U+BDLaPzpEDQvQg64GH8yjIvtNChFA
	iz18eCI/BTTvPl/hOlSvDG6BWr89cZv4mMXdmSo2kgxyqfunMkVPs5P++b9VdySN
	8LdewWDfWhkP1jHrwUznQMH8u+WgttgoEkbKSbna9suoDpesOt2bRt3K+6ktDKrk
	VxPu2FsJPc21a6sjzXms5mHxQoLja1a9H6lVS5aXhBk7gLlT3gX5KYm9AIpRuTXc
	bKEknq+8TiFf7IrQCyfiihpa+UE5m56C99V8zQhxELNIcrZ3zDa7iHj21bQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deytnhdg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f07078ff0so1095895b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846528; x=1776451328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=958kxvmKTRETUo1aV7I+Br+WwZHSYmix/XOrNEJRE+s=;
        b=SoX6w14AWRiXbR0jn+WMd2+N1urKk4M4iKhuff3E5D8BOBn6iu6Q5ov/sjLBHS8XmC
         IXZa41Fnv2h+jdrQ54cCiRUvnpO8ivr89RKbAbPgk+KqhwT16RDluPt7lMegx+f+3+en
         8h8TiFD0kn6Oo9cXbswDnMnXZ7pZxnKpwWR/X7MaK+oUqGkux2tWKQNZ3FUVqRhnWYot
         boHDWrzhUq4vRChDtpXujv1CDjH88dZeVNzcx0Mqr12XrPNYr/Dk85ZSowCyq2+C9+EB
         bibL4578SQas5Bxk4jsCUUBN6dia7trhNTTixzC++aYGeYXccS1OFBBuB3L6Cq8nuZyS
         Hh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846528; x=1776451328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=958kxvmKTRETUo1aV7I+Br+WwZHSYmix/XOrNEJRE+s=;
        b=lS5RtKEk3mt7HWHe2U6oI+bsPMKF7gVccDIvWLYlCCOVMBCZJL8JcdcUms2aMBednE
         oaWsJCoOZJ8PXXnG7kOgnqb8/XpawHJabMLj6X3a9Y8WDrZDgtQg/dtvJiZBBpCqUVfw
         j0YfYKt05KZUkmBf7/H07wOO0oPQlhZPvgrlwoBKGQmhC5dqYhS6XNXU9NsETJqe9Ufo
         ZDM3h1+98ndD+dtYDfFeFYGf9wE4StLHun0HEClLib9fDEpJDTD5pAAQkuxzWsZ1qY69
         qGq4/iMf2D3CMn7Oe9y5yPjelC3UVhfPP7Sx0rf2bUNkgAoRkK5eofjPqIJWNsZlqHCo
         XFkw==
X-Forwarded-Encrypted: i=1; AJvYcCVGAXGGfMSrWDiVJLNXk0tx+qf/qdbugnIvpCwjPKPLx2l5JbJ18fIhCIApqicPvmehuSut0ZSKE2o2pnbc@vger.kernel.org
X-Gm-Message-State: AOJu0YxUWKK9MTqfqEqw8UWg2PRNlaThsbPkEw0CjUDnVXDhyOeve93N
	cgYNmRXDH5chux4pK/PzuxTFwiuRdanIpSzr9m92m+zP3WIwWyQg+10y/atCvmQk80+4pUMA2FW
	q3GfsGmmt6OEbpaJGBllcDZqTuWz8ddy26p/SOq4DNClqwbarohkV17yciKWWirO4igse
X-Gm-Gg: AeBDieuLlQ4m68yc1+HU/l9bLyfCrkH2nmm9b8hODE/Pns5+3QeKKDMXApz4NHx9fuc
	6Wty7Wa2U14TTijnG4SPya2G2M7XXhfflMHVnPuW6Hnzg3LKhKHYg9Y4DCJJ8VG5Av7mTTY+8RQ
	/5vHD2bMm2T7qIEZpW+t9+L4TtfePYnPPyaYomlL1j1BII+a51gXj8EpXCBjleYA9OpgsaPumU2
	f53RRC+4B+QWBcH2RBVFz/xyD40SJ2o2i466gaYt36iALzyRCcl7mZYc626UtJqD0KCKRPzsFad
	71R6aqWse2Uk+xxNEQQ7xetCBG3EbSKgpQ1bsrsdnpqp38/4gdm7Q2awO7OTzmDoLpftY1heT8D
	CFPoR9CR/YDj6WSpsLtMOXrVBHFWM6s9EyZEs29+Rj3ee2G/e
X-Received: by 2002:a05:6a00:a21c:b0:82c:e9cc:f62f with SMTP id d2e1a72fcca58-82f0c26b9b2mr4774824b3a.7.1775846527465;
        Fri, 10 Apr 2026 11:42:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:a21c:b0:82c:e9cc:f62f with SMTP id d2e1a72fcca58-82f0c26b9b2mr4774796b3a.7.1775846526863;
        Fri, 10 Apr 2026 11:42:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:06 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 01/35] dt-bindings: qcom,pdc: Tighten reg to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:38 +0530
Message-ID: <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 2X_TIsTDLkVTDOEHz5OS3YPJW-JATm6p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX8wL5373ScHTA
 1Z68gYHQZLGFH0wLz7YsRLsNqs++LMVrC/btOO1FCrinycMqlWAqJC2q7JSguASHGCBHdMbrGKr
 4pnf3iFAMZtigjl8bOgruKpzNlF4neLThJyHyeE5iK40fJYpbzapUj+i9q6rJLJmVxLDPOWgug6
 ZMV2B1TPg1QSa0bMO7fId6dgHmoy9MW6AEiHLEbF+ej0x4NPwMsGdB814XfNpRFpcNczsIjeqyQ
 2++KMlmUGO5gIwVqgY5r7YXZ/IkzanOzyWav9u3tCz60NqY4i8v6SboGCt3smv8fOyWuBAlIAsY
 zIWTierjA9Ufmul1rrqR9JMBECC3IZu08jVS9C+MtBI2lrREGSRljE+Su9AyPwIDwVBVe1hojA2
 rnXd2cBU2cxUR6LGn5wLCoya53CZur4TDj7FQbo7utPugp/L7N74ajJjHnq1BtrYTxKNUeenI1w
 CUFHMb/vZnPc/frarEQ==
X-Proofpoint-GUID: 2X_TIsTDLkVTDOEHz5OS3YPJW-JATm6p
X-Authority-Analysis: v=2.4 cv=crGrVV4i c=1 sm=1 tr=0 ts=69d94480 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=oS0DZU9jGd5esoneP1AA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102715-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0E333DB840
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC has multiple DRV regions, each sized 0x10000, where each region
serves a specific client in the system. Linux only needs access to the
APSS DRV region, so the reg property should describe exactly one DRV
region of size 0x10000.

The example was using 0x30000 (three DRV regions) which is incorrect.
Fix it to use 0x10000 to match the single APSS DRV region that the
driver actually maps, consistent with the DT fixes applied across all
platforms in this series.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index f9321366cae4..786709f2d13e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -96,7 +96,7 @@ examples:
 
     pdc: interrupt-controller@b220000 {
         compatible = "qcom,sdm845-pdc", "qcom,pdc";
-        reg = <0xb220000 0x30000>;
+        reg = <0xb220000 0x10000>;
         qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
         #interrupt-cells = <2>;
         interrupt-parent = <&intc>;
-- 
2.53.0


