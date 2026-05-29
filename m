Return-Path: <linux-arm-msm+bounces-110287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBeOG3mhGWptyAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:23:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C1F603783
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3872301DCF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE443438A0;
	Fri, 29 May 2026 14:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jbj71kyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8p9ydvr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7052833DED9
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064624; cv=none; b=H87Df8dBateuwzvrEMlItGwM3BKpWciYlwv2trYIx4ucOmFvKJE9qjoJIldPnZal9d5U9pSB8bMgXZHg/x8lJye0lAdBdg6Xr32ZC02Eg8xdPeynKa6mK1zsHmTVTAPe4SAaPI0GQj744ecMqkKjmTtBtUlMpGe6gRhvJOR/mJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064624; c=relaxed/simple;
	bh=GOKSOFwIdS35aYputVHpifn9pnftZnjBGzZCN7UANlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AuZeb5Bzbv44oFDHzv/1V9GhHZmiOZw6h2hCHH1JKOes8WSpTmLOD34DtD4jALiCRODZhMSpYK67/eNNAeX44SI8/QmF1xderc5ZIhmHrAQjrM6HiQzfaLdwzvqKn2UYRAXShBz0JksdLPHtdoi6KaLj+1EfS60/MN/++HXdeDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jbj71kyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8p9ydvr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDKrHO3845207
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+i0x93dM4hcUsHjMMZee7ffFLN7Mi7pIpN+pXHsXMss=; b=Jbj71kywTW+TffbU
	HPMgpH/6ar1Yw8rEzD6lXB4eJpl6I5GKVa/hytETcn0UByf8Sh76RJcV7KAU22b0
	WH1kxUIDwLFKCejtMQCB4W+jph6nBnePjQBIrD83RFK6OVS4CAZuNg0/KYb6oosV
	adOUigt6RmcCJrZNx0BPH4KKIeF6tbvnLcyRpku6baphTVfAv0wKB746xCZRToGP
	3o7NQAwFSgC7wrvpADNIYgllVt7FM/134Oafko4xCmABFbHzeaWLfMUYDVvRLyEL
	2GYu0GEF1rUVaVTaGKsHw36CUNz4HsHnkXLD2tnh0dAG2iBj99lteDKVYTdq0/LH
	QtxKAw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m3pe4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:23:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b458add85aso155748755ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780064620; x=1780669420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+i0x93dM4hcUsHjMMZee7ffFLN7Mi7pIpN+pXHsXMss=;
        b=G8p9ydvrHYHO2KD0Wc6SUtXv13OmU/uO4PQkHnpGBAwzmr07NCh3QqACWkizUDhKYv
         SZrPp6UNIjpJhMFHwuSToEJSfmt5DZw9gx62HcVnajKl+WQjJvDTKRK6Fp0sOgMr2fot
         Vy6LWs7lV2ZpohhFqsHZz1d4UuEJg7lBerb4ZGJI2b6BOzctXLO/wgAO4pqWmRC3FhHd
         Qmol3UpomLYTW/XWNB80V2KkFhfQJlKdnMesTP4PH/KjT+h4qvoG6T3yZWE+eobhVlZF
         AeHhpiugcdinHcZkngO3TBIasiQRH9Qg/T4DSa5qAvKSnhlI9FDinFHf6aqFNIs16Jmx
         YbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064620; x=1780669420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+i0x93dM4hcUsHjMMZee7ffFLN7Mi7pIpN+pXHsXMss=;
        b=hC0JAV6RzhDcbVZa3VjM2obIOuxgPhumcGh0zah7/Kmtgxk1G1zNe+DQd1Q4+xaEqy
         odDwy8BXL1svVhHyHP8VXxu7Bnw86qv5VavFtf4fFZZr/HkjJoMmR8PdErw/ZTCN9TnG
         +N+GiTA3MR4rDF3SI3Tmy4YvTmO6e1AmZ4ZMy22EoVWeQFAKE9JWRqFwTvHxoznzvhTK
         ZwA4JcAvFxY4MVhpohY4f4bc2Ee9zZBpuDIGb2GKeE6GY3tuvJyjwvkNDwVX1o/N9N2D
         wwr3I7nG8rOriUi+eW5n6z1C8MMsEk33JSDlE6wN2yCo2X/sKWdZRIj9m6pXHDFJo2S7
         xWwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uzYLbPROYTtbg4CZtbQULfnDzO/+Mu40xZ/7OA+YKUByDk2rcOXFfkGdUBc9l+sOseNMzJYnFAPUPNwYY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw19coIkwvH8aeKbTBV7oJbZwbXSfaRBhD7VAPiYXZSH2LEKqK
	4tXLkCXrGZXWOpnCsMjDWkZ1Tl9MBPBDjQerQXE1tOg5cw5puZS7URBBSORlCn/TM7yozLD/TsC
	RQd23imD9o4ZMa4YTxVtqSabkpMcv9YTzRJy7XnG76LA5ontEIfetkFMOUIf2F78wbkmN
X-Gm-Gg: Acq92OH9GaAWRKEPYMW8WN2FugOUiogiuXHeb+0hwUnk1yDjo4Yx+ag3YWmSPiZNIBk
	mFivHZKFYYIHmtJT5oxxGUSS+4Igcft7o9DdTJpqbGltficv0xsIMxsQVJ9KWul/S2/zL0c1Qze
	WwFt39OpLpbxbzw4tSlIcXYvkcps/5cy8Zf+8Y+SS6thouyls7r0Mbyld5h3yNwqleVXbVif2CD
	4GeYFP/cDgHxI7aBiupd1kd3shhSD7yMb1sqgJR1X2kcRNDRaAAlzbizHkGYEMt06imvGAVnJwN
	JbxeS8x051RzPoEr5p1bduJkH9Y0W6QhPS8w89mZOttsRU9d+7Om4ZshuMo5we4HlQqSs5gs3WF
	R9svwtv+9Dfns/jEJGlI5ooX06yQDM7CZly+bFVNl0RtwBZ2O6BFOrKvoJmDZEHObjlLx
X-Received: by 2002:a17:903:1c6:b0:2bd:9c0a:32c with SMTP id d9443c01a7336-2bf3683b78dmr261785ad.19.1780064620389;
        Fri, 29 May 2026 07:23:40 -0700 (PDT)
X-Received: by 2002:a17:903:1c6:b0:2bd:9c0a:32c with SMTP id d9443c01a7336-2bf3683b78dmr261155ad.19.1780064619786;
        Fri, 29 May 2026 07:23:39 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c57283sm22013095ad.81.2026.05.29.07.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:23:39 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 29 May 2026 19:53:11 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm8750: add reboot-mode support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-1-1964ebf1924c@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfX450LtkvWpEGC
 OrNFTJz4vKdjwx02IbIxctUzjS7lpp8ETgp85xtuITxeMsnIikt/p33i5suDRz/KUsO9CgFT0Zv
 KxB+au6zKlqapiecl3RtNmlpA2MR4a5bhrDJAKXXLEgHzSYxYDlVG8qJN+h+SrsW/cVmf7ea9rS
 PnSXR+zLOsKDImHPERSIETctaJgbxOVLZqULHx02WwAjsBdDZsIGjqAtg5F5tGEyOhP9KEH6cWv
 mYRG2FpnTkTEN0F677vdSF2pq8V9MRON+Gg5WqW12Jqgwng3JiF2wC6AaYlPIhmGc2pHQXVUewe
 ViFQEryylIYVKIff3hJQw9oZr9gRmR5qe3B1gtppkU7MuRGuqD/Uh0Ihvt7Azk3Pmjm+ab68S2E
 RSWtnJ/RuGQGmLZaJRx7861w0eDsO5VFix+qS0SD0nsmfXZEt47ao78vQ3kRdHdCRMIYQiAmIDu
 Jhbv6IjgDq5xZ22cl3w==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a19a16d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t9eHAnW7oJswSNK9swEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 2AA2jAGUntexfP9yfPUzJADdqSUoNKxc
X-Proofpoint-ORIG-GUID: 2AA2jAGUntexfP9yfPUzJADdqSUoNKxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110287-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[anurag.pateriya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11C1F603783
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add PSCI SYSTEM_RESET2 reboot-modes for sm8750-mtp and sm8750-qrd for
use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index de19b4dc214e..e5e2efa2218c 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1425,3 +1425,10 @@ &usb_hsphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 801c46d55602..795d0d34e47e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -1154,3 +1154,10 @@ &usb_hsphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 5d6374a23e3e..58ff34e91893 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -261,7 +261,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.43.0


