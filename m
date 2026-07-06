Return-Path: <linux-arm-msm+bounces-116659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4SISI55YS2ofPwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:26:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 863C670D825
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:26:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ARM+D2OI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ut0fJxgk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116659-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116659-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63C4E307B179
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7D24CA276;
	Mon,  6 Jul 2026 06:56:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E86C3FF88C
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 06:56:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320995; cv=none; b=gnZos0DIrzPDc2ed+yJXxGy9jVE4QOZXOLxIL5cVeD2n/AkLrsFnAWzzwsAaYxAG1smpvCf3ot0IRXvvNX7Ih1XQws37xOW86EoSaD//fPAYMnYXFcboOY664eUNwO032kAy3K3t96XHJYWEEg8dS2j/FU6T+MEbyPTisgHFcDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320995; c=relaxed/simple;
	bh=T6SxR7G/mTyHQ04HDB9ImIv3sNQZvFckcGEYXzgtnjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tCG6nJLTAB1ZBinDW2RxvuOmdmsZNiG0DyyJZL7Lo6OZNzMEEu8+YOnFKEUA2UAl1+/Xn83IRpI8l4lhwGdTR6NTIE1QcdYIshx5TUTL88lwbAoshU1bcwAxqzJzOrRPHCttM+Mzz5iHGDugvszq6A5BcLMUk7wXEuuDnyX9Qe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARM+D2OI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ut0fJxgk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641tms3618051
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 06:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3nXe+cX2WVLfAzs7rlgGjg
	7fT4mfc/Db8bo5IZZ1ZD4=; b=ARM+D2OIoRKFT867up3UZgzv4vdOSAxQCsXo/X
	yD2DVT9M8S/tkUeOSYckWBX0hAi4tHGoS06S1FDQDiJOmP+v16jsO1qlIkTwEHpw
	AwvsF0+rc7+u6ikqBtW8nZtgyNWrOmYPBQs6Ph+paAQJkQyJJHk1RiXonXzQ+z7v
	GXJlokwtQ9k8j2URMTn2WbgOqnCvL5yaF3lyItZTLALR4vg7RZFdPU/p4bMBH8mb
	RLDfSgOtzUpEN6oKOGWb4PX1R0n0Z1lNJYuICpBcfbya3VLgs4hRN9UnAsZ8x2qe
	SJ+M5FpL2jav9XN1CIe9vGQvNNwbVXPGOdcp63S2Xpc77k9A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64n1g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:56:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845a29d8c1eso4239936b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 23:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783320985; x=1783925785; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3nXe+cX2WVLfAzs7rlgGjg7fT4mfc/Db8bo5IZZ1ZD4=;
        b=Ut0fJxgkHnWvveWh+Eqid+ql7QnZPZGvE1wcU34PogJk01t2CcMuaEdCEr7JW8GH30
         K41G3fjxFF7/zaqfSTL41jCGPwhK/UVHic0S01ScqF22ZuU7ZN5EyZ/F3XutwLALmlYu
         lfpuPULW8Mj256OFNk8YuqewVuJyOJu57eaaKsySBz11oTQm4d84T2j337xfc7/ZXdQd
         6bixrMnLtBnE7XIqQ126mqDfDLFQENd4FZcmikqmxrvdApYcJ7jaE8stz0JvFlo0+kct
         hcW3C4w1qrSx3Ju8l1Qi7ZO8Q9kqwsl7LT83zqcRshkNqQfpKqKCtXqvbAQx4eQDcdOh
         MGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783320985; x=1783925785;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nXe+cX2WVLfAzs7rlgGjg7fT4mfc/Db8bo5IZZ1ZD4=;
        b=goIhrA1j0P6TCyKep/cDP5TDdyUl3BEY2XJcAnaUqimiJuFIbDHqJ/v85FKK19Muj/
         CMDDlXyrWniZZxxGWl5MB47Dr040ol+K5KMAYguUyhfVHgCkO2+F3LCjIjN5Ase0nxiO
         kTja1Ez02L5kZECDcnv7vz08g9XdGLQFgJ557RxuqUIk5RuPbUOn6KbunNX7tH93LhB0
         haF+SowA0uV7mXgp+W4P75YcnMTvDn9QfkBt0W4bfa/PXItTNrIDpUDBtkxMcee/oLdp
         9fWO2IZvGQ7N0bsG6wJJiNvL6o5FnOvPDaxVdaiz/eNSkcUhIKZNw6xDrMnUZ6F3AdHb
         nZOw==
X-Gm-Message-State: AOJu0YyNa+g+vUDnSzOSh2cngYgnJtKqDmkHgNi0ZgofZmqjUbs1h+36
	r8u++/Pc68NJUSZMZ9xhnT03RZ2mzIZeTiMQ+FHtZrrbPPK42cYvqM1pPVCkRdDu5EY4Oi/uiNf
	RFc/Mha9jBUTpvRvB7dhrXbMDtZFCDQ+gAcHEX+BjU+bnd543s9dRGdxAto6mZ6RBN92j
X-Gm-Gg: AfdE7ckOoPxv9rHNZpcEAxqT5xLoL3EkDo6UNf+cT1AMg8RwD7cBpqQZVUOYrzkJnC5
	9GqCt5hRtFhHc6i5KKUPAIwY+4oHfTUHXw831dD/A3yu9vk+b06OjlDuoUKe2wcaHB+h8kflXJE
	HC3uQJ7oGm7hkh7LeXei78I2PsmJgQO9rW1SrJ/IJA4ErB9XfWHAekxaCLpcLhYqrGHqew+r9hU
	RlkugeLXsfgMcfNnDhdVEW0Wqkk7DcEhJS+gbDc51wkG0dspp3rK6Ta7mDIMa52y8NQhT2R75y/
	bPenTM788tMwM1QL/2q2OqSfAGSj0gwRgg9qbErhy4bkU0KjExF4QDah0cO/KOjMwLtScGh6RDG
	PCs3/yFIhn6vTD/i4LZBq5yeuezI=
X-Received: by 2002:a05:6a00:b84:b0:847:9d87:5ab5 with SMTP id d2e1a72fcca58-847f6f385a6mr7432691b3a.49.1783320984495;
        Sun, 05 Jul 2026 23:56:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:b84:b0:847:9d87:5ab5 with SMTP id d2e1a72fcca58-847f6f385a6mr7432586b3a.49.1783320981491;
        Sun, 05 Jul 2026 23:56:21 -0700 (PDT)
Received: from [10.213.96.151] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6952a0dsm3312998b3a.0.2026.07.05.23.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:56:20 -0700 (PDT)
From: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 12:25:59 +0530
Subject: [PATCH] arm64: dts: qcom: glymur: add CPU capacity-dmips-mhz
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-add-cpu-capacity-dmips-mhz-v1-1-85deced44b20@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH5RS2oC/x3MMQ6DMAwAwK8gz7WUhAKCr1QMkW3AAxAltIKi/
 L1Rx1vuhiRRJcFQ3RDlo0n3rcA+KqDFb7OgcjE441rTmRo9M1J4I/ngSY8LedWQcF2+6EzfsGv
 oaa1ACUKUSc9//hpz/gFJByt5bAAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783320978; l=6492;
 i=pradyot.nayak@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=T6SxR7G/mTyHQ04HDB9ImIv3sNQZvFckcGEYXzgtnjA=;
 b=Is+Ya/YOrFuLzbRXGmxYljzgD7OpaP8Z+qZM2OnKCuog+EJlTMlKfOHqOEta2dubvv62i5wDz
 o1tdNjYwlbRCKwB56ON+oR5/8hhwDRxlKiFIsUSWLrT/5eBhwyfHIRW
X-Developer-Key: i=pradyot.nayak@oss.qualcomm.com; a=ed25519;
 pk=ZAwwH8thDSb6bq4dCgFHWr80BqB7MmUAKogkd9BsiXM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2NyBTYWx0ZWRfXyHLtIQkDbADk
 Y58GYq6v0D8KhU1IqqdCb/UyfcXumQv97pz9d+/O0YYEnYOuS3oEoswutnydG6CgL4uNlYZFmHw
 Egv+ParonbVpUYGhZ6/NW+5Q7igRgvOzgXNEMvBoTHZT3kXsCEZE5ADtfHSM8v3DSCU9rRqfIgU
 uY82qQREZhsDPhR+BPe6gNJJyA8R8f9FUe+tLa6FUWOeEq5ZCioG/hFFsxAOB3iUyvl51Ifv+p8
 //VQAzXKCLmF0Qr0PgXRnGs6o8c7pxVlrxzUZvUF0ZIxgPpxtVIJ6UOE5eVfW/HVJcupRsRyfvL
 6RoXQWOFbsZl1WYW4a2feVNK+WF66ZXtDHNGE7VJo1vRvKaCR6VZdwoLQUpdZilGHz40XqsuDiS
 DU+TixNLn5x2XGeqYn0TqnJKzt+zrrj+2SVyP3z8EH7eNeHvDsgo4xFUoI/gmIbsc/zvOypGFNW
 ZoNK7KrSgzwLGxdMFfg==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b519a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zLzZgYUx58GfyaoRtDoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: a_yrqb5jrarAN1BiLoOOXdrHin9veo3x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2NyBTYWx0ZWRfX2ZQeukWNa59U
 XzzZaBMmJx7mwkM7f8gvXJ9/cSWzUKz7dbAvX+ybCrCcoiWw3YqjNrCU6SvT0iY9sgV6sEtW4Z8
 hOkWayEY8zmbaoWNWjyOx2HM/7lDO+g=
X-Proofpoint-GUID: a_yrqb5jrarAN1BiLoOOXdrHin9veo3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116659-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pradyot.nayak@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pradyot.nayak@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pradyot.nayak@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 863C670D825

The Glymur SoC has two distinct core types within the same Oryon
microarchitecture generation:

  - qcom,oryon-2-2 (cpu0-cpu5, cluster 0)
  - qcom,oryon-2-1 (cpu6-cpu11, cluster 1; cpu12-cpu17, cluster 2)

Without capacity-dmips-mhz the Energy Aware Scheduler treats all 18
cores as equal, leading to suboptimal task placement and frequency
selection. In particular, heavy tasks may be pinned to cluster 0  driving
them to maximum frequency/voltage while cluster 1/2 sit idle.

Fix this by using distinct capacity-dmips-mhz numbers.
Values are derived from DPC (DMIPS-per-clock) measurements at the
825.6 MHz nominal operating point:

oryon-2-2: 1024  (normalised baseline)
oryon-2-1: 1372  (ratio ~1.34x vs oryon-2-2)

Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..1b5b2ed93767 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -39,6 +39,7 @@ cpu0: cpu@0 {
 			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
@@ -56,6 +57,7 @@ cpu1: cpu@100 {
 			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			power-domains = <&cpu_pd1>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
@@ -67,6 +69,7 @@ cpu2: cpu@200 {
 			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			power-domains = <&cpu_pd2>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
@@ -78,6 +81,7 @@ cpu3: cpu@300 {
 			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			power-domains = <&cpu_pd3>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
@@ -89,6 +93,7 @@ cpu4: cpu@400 {
 			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			power-domains = <&cpu_pd4>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
@@ -100,6 +105,7 @@ cpu5: cpu@500 {
 			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			power-domains = <&cpu_pd5>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
@@ -111,6 +117,7 @@ cpu6: cpu@10000 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
@@ -128,6 +135,7 @@ cpu7: cpu@10100 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd7>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
@@ -139,6 +147,7 @@ cpu8: cpu@10200 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10200>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd8>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
@@ -150,6 +159,7 @@ cpu9: cpu@10300 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10300>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd9>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
@@ -161,6 +171,7 @@ cpu10: cpu@10400 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10400>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd10>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
@@ -172,6 +183,7 @@ cpu11: cpu@10500 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10500>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd11>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
@@ -183,6 +195,7 @@ cpu12: cpu@20000 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20000>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd12>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
@@ -200,6 +213,7 @@ cpu13: cpu@20100 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20100>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd13>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
@@ -211,6 +225,7 @@ cpu14: cpu@20200 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20200>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd14>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
@@ -222,6 +237,7 @@ cpu15: cpu@20300 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20300>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd15>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
@@ -233,6 +249,7 @@ cpu16: cpu@20400 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20400>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd16>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
@@ -244,6 +261,7 @@ cpu17: cpu@20500 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20500>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd17>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;

---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260703-add-cpu-capacity-dmips-mhz-2095d25c411e

Best regards,
-- 
Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>


