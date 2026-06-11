Return-Path: <linux-arm-msm+bounces-112609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OypJHP1DKmq7lQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:13:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0383666E70E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:13:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=moYNqrWG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XlTsfCPt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112609-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112609-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 527313087D11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6695936A379;
	Thu, 11 Jun 2026 05:01:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A7A392824
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154073; cv=none; b=uJjj1XBV2N1YSuqDM2/ni3WxYwb8tLlNC1OOq8mH/+z/8dkXszBJIIGm41ytIMzERQ+pViShxk8h8c0lN5XmDOgZgcOBb/Dj0KqXVXO7k7ZeD8JCrXG6ibORd6zRAKZcnacub9AkOSr2LLjx6FFjizK0xrqjYZq+pnlXNqhvuG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154073; c=relaxed/simple;
	bh=pTME4mQxfefQUXeCFQz1c35/zCwqiALApnOdQUDq+nQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pWoZNJyFtXdXc0ZjreYEAtqGCtTwN671N7tzpfZ0EXBOmSc70DiUJx220Xcg0FZGoIr6k7UHXlbAxGFsRCQk2QVbfIgFWqlCRgbrwCzy+75JsNwnZEjhqzUu9AAHgZvyIDPtLEdcQR/uSOMBIec+ZM+e2YMT8fk6J66dqMksXXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moYNqrWG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XlTsfCPt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NOOj3183585
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/m4+iSCo/KhQKCaob26MNMXAVQNntzuOFO6J64O0I2w=; b=moYNqrWGTwhAi3h1
	vyXU3i5OFGsXJ7biK/u3JobVS/Zem79svjEKOCjQz6I1MCS9mxFGdVCiAuGAmrHE
	6aOooseZt0MYOPamqLOik9E1cJaSC2PvKXp3vLnyKJ5tNjBTGYZKoOpGQ/kp7VJY
	AQOZBdnxLlX4CgQ/VlnXI//L4UF/D9jjq2uOlMPQ680Q232engYSJ5yNxc2CmJBS
	FOJIsmuTU24G4ouDpUxUcWrnNuG2gDDu+dwPObE4hNF3dFnE4m0EkGn7bLy4zykd
	hB59RNLTxbEkx3MK3NLpXzKfRMe6o0GSrmqhoeMVEpW2Ii8Mayuy1SGEdYHU8IZw
	ByTWEA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1nqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b9d265308so5646785a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154061; x=1781758861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/m4+iSCo/KhQKCaob26MNMXAVQNntzuOFO6J64O0I2w=;
        b=XlTsfCPtC+hbRX+R5KlTtXx3yusnQ2kPW6D5qL/TyaSRzqADTAUB5jW7t+Nf5KGgfg
         ZkBQmB759yRj0pQb2TMCtYCP0VYjRXVpoG1pnxNndverhxqIBjRWWQ3YeKJIj88xJmNU
         Ilt7Nebhbs5d69/tea3lwJ78Jra3BsLdxGPbeokMtVnItdmOl4XZqLwY004w/dhJqz12
         C8cZ+2kSvVJfzBJZpqc437TtdWyzX10f2/kLohkOmb/3PAAAyy3/cV48syG3Jn12GIpu
         t/FQYEVkYOtnp9B3TQxYBCfOYetSyHfJJF9WCFlMPj0ufez1ioPvH86GXR4FV/v/Ucpb
         MkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154061; x=1781758861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/m4+iSCo/KhQKCaob26MNMXAVQNntzuOFO6J64O0I2w=;
        b=eQrh2+UIZnxV3phBWpSE6Skqm4YPTdigOhq5Qo3sp0wP5aD4APumyq1Q2ChnPMZVle
         EN1qFU8WLYwVmGn1N980WahWPnvCkZdgVUi/CXEsThol3H3yxMrN1GFAu1S99Kr/sUSN
         D5zaXEzxXcjJY5YhLzAH8E94djShqLnerhoQEouFQxSoBmks33Kog++aN16zF/WWlu2J
         7G+FrfXeaGtKVAsF4HIl2CQkR4fyuBV/zKaSWgJ7y6n1+xvDQZxxUqxJsxA0I06E+M9L
         tnOz4gWhVebGKz5ICZTFCKMT/0GaBFz0vfQnjqDuswBTwy9dvZxDaB4X7o4sNLT/Ab0M
         1Tqg==
X-Gm-Message-State: AOJu0Yxi/R0RCq+EQkNBQuE8cKyxkJ4u+GEpbUttlbaKB5e6OYxyuYHV
	mLh6j76cyRocCLmFB3ts1+Qod+Ev256d9WB8o+VA2DW7+tz4NVeu27/pKRg1/PI94qB2TriJFj1
	5Aa0hUeg5RAXh2Wuk4oY2BZPhJlUS8s50B5HzT0VyHTScGGfzilZD9fHpZ63+9ZkTB6Fvl9SbTe
	b2
X-Gm-Gg: Acq92OG/xZUprNGTvTqBWZw7bvCf7EIRuwSYrtkQkshrBj74Gd47jaEtX81FiA9apD9
	hK1grN2wTj7HF3Orsk73Fx4kAriPXJziPE5fxteeyrGZms6qpVAuqcNOqJsKd7Fym0dHuG5WUYa
	9E9glTnRSDTKgHzFK7AQki5VfsiT38cXwOWmJtetJ+m4XxuL6eVp9fkvHCcN2IK80M8y3/74gfp
	78h/s0MX6VnjO+t0MhvQV0tjpaDqpSL34QIKLT0VeNs+1HkAUdw8mF+T8P3Bgacw3c/MxP7fmFN
	2zPIaK3UJ6a8z2fSYhz9KpkPPBJIBixf2wDDreIHqi80H82eCdeiK5O+ENp1kxqryoDv6Aq5XB1
	1Vwesc0LMcxZswbN5PowRyE/q9jwPI2eGL0Z98CfZTVIwMtl9+Jqa7MYbKsncakWje6U=
X-Received: by 2002:a17:90b:570c:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-3779c56904cmr1422347a91.2.1781154061267;
        Wed, 10 Jun 2026 22:01:01 -0700 (PDT)
X-Received: by 2002:a17:90b:570c:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-3779c56904cmr1422329a91.2.1781154060811;
        Wed, 10 Jun 2026 22:01:00 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:01:00 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:08 +0530
Subject: [PATCH v2 32/37] arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-32-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153929; l=2224;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pTME4mQxfefQUXeCFQz1c35/zCwqiALApnOdQUDq+nQ=;
 b=yO94mPzZEqDXMt/eigSJDv2ayMRZlYv9XVBL1SpHLmOmRAj9PFzjAHCfk2igaAKH7jBqtWRFU
 enRX6F6cj8PAwcglgc46SeYQzWYDhq8r96ikEeYQxOJi3EkF5n9gmvv
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: oqlx0cayvwBEaYbG2RP5oNvAvpzxIoIT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX9afNfAGYv2B8
 gLTyXYSNuBOsML8mY3Tua9w0TyOSarmOETgYSgtwhS4EZc/39Iwu8QtruVYGbS5+Fplfw2xUpNF
 HQ6HpDec3mjH4FSfH7kdY3uUpLkgyQU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX9lzo9+2bZy7E
 ZS21Yl4jJM/fwDUAYzh1FWdZ5WX6KFGyDjIZCrkYYiRizB7i5Q2+ORkVJTaoX0OkifejQnD0bwI
 WurInOXD0Xz1bh0E0zOArlzHVM0QMjcmcPtWttx90lheTXDTE8wLlzxobc4CNCkm3QgmxAXjF8h
 yp5VORGgA+qUhqCApLMeXEUcQzjmVLfOsUiMOkBsqz2L+0SVAXwMoOTJq76dUc7mfJtCQvSGJUT
 zdY4zbpVQWChVw0KqzeRszM9AHQ+/7kixOQSU6FJtfHxUF3c/Th76i5HT5HkZl1uuIptqi69zEy
 VLgzoFbKE+S8gfvRv+Pcrz3JYv22KX0ji9308V9XyIgbPnbRivN1tiNB7+KsgSNAemF20mJKxnw
 n06TsJU0at1LIX+l5t03RCkELgo3PSscfOwSbuA4ctU0lnl3F4IgUBWBZsLwp/6BO3PtSE//b+/
 2/mmQOiY9Xtm38tEx0Q==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a410d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xzbAzJKGZiqbpjPgTfkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: oqlx0cayvwBEaYbG2RP5oNvAvpzxIoIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112609-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0383666E70E

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
from the controller to the existing pcieport0 and newly labeled
pcie1_port0, allowing board-level overrides. Rename perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index acb36aaaf20b..f5f2c2690311 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2031,12 +2031,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
 
@@ -2080,6 +2074,10 @@ pcieport0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
+				reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 			};
 		};
 
@@ -2196,12 +2194,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
 
@@ -2277,7 +2269,7 @@ opp-32000000-4 {
 				};
 			};
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2285,6 +2277,10 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
+				reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 			};
 		};
 

-- 
2.34.1


