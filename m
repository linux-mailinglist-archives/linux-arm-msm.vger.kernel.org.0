Return-Path: <linux-arm-msm+bounces-108578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCgrDOibDGq8jwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:20:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B34582F30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14DAF30C26FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A35409125;
	Tue, 19 May 2026 17:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yg9oOiyi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSjcuV93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8811C400DE2
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210953; cv=none; b=rJAqZv99AvQYtTuNrGG0flvUyyn/yYNvN8TwRSYSRovZN5o4Vv8Aact++BbHdc50Y0nVn49TS7EF9kosqh13CdyA3KW9ShFUQG1VUJRb0zCdFEL5msGdKwt9vdYokvyVZzvNIQseHNhTNUIEQUGGBvsiLzF5jgS+d/Uudmnxsvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210953; c=relaxed/simple;
	bh=KI+58/ONAYxQ6op8vnR01ldyxV8090Z36iFsslPUisM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EAXRBBvjhvDQxdOvhRT+wcX/LzGRUXSsNxLPDLHFkhUQ8R2RUjjg+bpRYVjf3E/WyAq5duA8DRZKO/OjtIySZDhLQ5MdJuN1Jtauhwupr8DLxORiuG8xJGT0wJfeE2xrfIZEkH0EkoilJay3CBe81JKui7mqW953+3qIHMbuecY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yg9oOiyi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSjcuV93; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEwlob1636916
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lfKVHCmUtRu
	10BDgmOnebTByINr9r0sGsNkJtT8G/r4=; b=Yg9oOiyi+y5eLhnGUIJI5a4hY7T
	c4+gZWxznsB8Vf74Pyr0+59E922Ee4i+f7zqu3HiYK56EXU3DRVpTueDlRs/8tim
	c8pnDDshlnTfPis/zXQlyYMZ42R9r4rua1v1g1ljX3h8UzN2BknabuQkWdg5ZReC
	97FDoxX0UcEK4zQCG80pfs5vyGKpmHVbrKV/L6+laccCExqPkCe2K4ltiz+1JPsf
	f+K1eBSq9D/aJDmhBrLWzv+i68pxHmwee3l1idTou4NWzcAF3sZ2DmNlM+CmVe+W
	xiJxVKJ04lMN/Zd+Qtj6MnmeUzWRIaIVlzGlBgV7MB7rBR5J+jxiUeypYtw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3s8ntw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:15:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so2137857b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779210949; x=1779815749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfKVHCmUtRu10BDgmOnebTByINr9r0sGsNkJtT8G/r4=;
        b=kSjcuV93WQqxfDLWCQsMaJVcTjM35jocDwqRHeEnnCRgB0PMCj24GbQX2dEvFFraKj
         4XxBiBgBiJj2FInZ4pu0vnacMIMKevGNcDxz5vGs7UETQNcFnFc1xANPPleSWfJVgEdX
         ZB/YkxlKBaLZfU1hDhiFkKhu+A+DeYK+0nomgghLz2DV9N/pTvNSrZ4cG0CdObj0dDQa
         HgHNDc7WJh1kXzWK+oYjndPjkHHVzzNgD8XKFgCLenDq9brspYAvYtlIO6yNfr2LBjiH
         CehRqHypJf8G44UfbycsFGQc4YsKXLIXxI++V8+rZH7w8hrF+M2nfDvatkQrPNvfWqE+
         AfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210949; x=1779815749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lfKVHCmUtRu10BDgmOnebTByINr9r0sGsNkJtT8G/r4=;
        b=cHpa2cMzKSiwd0bJa2JNz3LwvwGx9xYLYCY9U/lce5lNA67O2QZCDhO+LF24SQljXo
         41bfVm61CP5peBlRV3fssogiM8tzev53ve+QHynhqZUIYeGgvyyadKK3h64rI+f7CPEk
         O9zUZmmbWsvDtOQGfOHNJM6d1+4GOrV9anETCHKLYLNEDOdNcELinVio701ajE6OiZEQ
         SbYOkwB2aqiapJFYX4TkuUFz2JYswkZw0Ve9s7qcghzYhoehkK7ELKkBvNa5ClyHNuf/
         CaOvllV7krFXFRKiPe67Un/2PXhdM4BCLuX6oOfLbjTcflaJozVb8bPOfDOV/hXTtHe+
         Zqdg==
X-Gm-Message-State: AOJu0YwkT+Y5UAYMFJP/NAThNv/dsN2SPPTumuFEjYx3qDmJpdJKu9fU
	HD7kyzEmLlWCl+AZQevmpIPwFvHpL4MzI6uwi2ewM21NDgOWxI8vAioyvqiydeXInzO6NeDiRev
	QZ8mqIdciqGpan6s9BSk6zledMBnffHIRJ9pUSoz29vk1jDNHcmCkO6G1zgMWulcW2rUs
X-Gm-Gg: Acq92OGUZFhxFeLGjIn67iMlYffR3aikV+X9tyG7XFFrgTFXkfWGg0iujcwioMK9p1x
	rr9m+BmNWsF/PkM/KGlTKjNyvp5Vwd3cE+YDLQkFYlD6DJUVlfG/0IZ/Ye8pS8mJmfJ9hCSqwqn
	9PpxcCTT3LdosSmYkmmlQKkaGI9N2jsK5sU+CcJ9L/AcPYeSuUP2RNwzrGx9xfby8SkkuEjMat6
	K8WAEYYO/z4xiyJEOZ34yqFXrvAdNCR3panBzp6XOLAbNS6g10GAWjcCLn6QFWwRvbvBdfhIx6G
	M8i2yS4KYwa1VShMfEK1JpenEKebg/331Gs++RD5aJFUFL91KrGNcct5+pGCtb5Cnet6HcNmBG5
	EZ19MaBMO8Qo2k8g/RKDlylPO6dUpJcL9gRl9rk5n+T5rmuCX
X-Received: by 2002:a05:6a00:4397:b0:837:8ae9:6c30 with SMTP id d2e1a72fcca58-83f33d8c21cmr20246544b3a.29.1779210949128;
        Tue, 19 May 2026 10:15:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:4397:b0:837:8ae9:6c30 with SMTP id d2e1a72fcca58-83f33d8c21cmr20246501b3a.29.1779210948532;
        Tue, 19 May 2026 10:15:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c77822sm18634720b3a.41.2026.05.19.10.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:15:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node
Date: Tue, 19 May 2026 22:44:42 +0530
Message-ID: <20260519171442.1582987-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE3MiBTYWx0ZWRfX/3CGvguTKe9D
 //oQjH0ZlV19UWfL6k2CsQaPPm/IKLqldDPp0b7VAyl5N4MU7giLCgjRCYORZMPzbKLsxIsW7m2
 bsanNPspbVRK006e+MPZcZeoDcBnmZUGGaEh75v3T805s7Ui4IWcyxdiHuCCIaZcdLjNMtO0Wa9
 gyUhEdFHeCTO44e76FVRFG0Hg7YZPUL0Ufvz66OvwdVB+uIt8rp+mPLTJ4i347WpHcpIhVVLQGG
 2GBxpRIYhMUFILv+E2EIc6+TEfXGKoiRFv1au6+gZUAx8phiauRzhXfQ2vj5eFAqJcc25Tc6AHW
 Kgv1ojM5DE+Mx6VYfAX0F+LWNMQT6R3gNioc3ijXJjMvuLY9Z0xi+I0nv316klW7VFa7ZftCt80
 erhRxhFkJ8tUTGWZjt2wiRsUSooHMuTCKpOjL/gyFWKs5KXfunyHe8uO4763HMslZ4FryoQ1P+K
 qXpoGpytvC/AJL4szbQ==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0c9ac6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ZJQsJAtiAu0WCEyc7p8A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: hjB8hOJkVGay16Fp4A9UcxuCpuyr8iYb
X-Proofpoint-ORIG-GUID: hjB8hOJkVGay16Fp4A9UcxuCpuyr8iYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190172
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	TAGGED_FROM(0.00)[bounces-108578-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.223.255.192:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,94c:email,1c:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94B34582F30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index bcd1cee31356..425b532c53be 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -224,6 +224,7 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
 		};
 
 		scmi: scmi {
@@ -5448,6 +5449,10 @@ sram@14680000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-sram@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0


