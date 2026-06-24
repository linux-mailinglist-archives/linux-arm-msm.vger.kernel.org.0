Return-Path: <linux-arm-msm+bounces-114400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OPi/N08sPGq3kwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:13:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA3C6C0ED0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:13:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j6lx8NRQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ceEXDh/k";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114400-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114400-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 235BF302B835
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9155B345CBF;
	Wed, 24 Jun 2026 19:09:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661B4370D45
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328181; cv=none; b=i+qzCJDZFoq/7U8p+Ok3XoGEX8Mo6Jj7N2Y0pjnvu32xxSDQrYl/LBM92qNlXT2h7gWUNzV0jMhZAUjtDAcU+fb/6/nJWOlVsP7Fg+ulYe54TOFWU7QzDDPer+ynSyaSHiIAsg386WpN/N48JIUkR/8NMdefdVex5C4ek3RJroE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328181; c=relaxed/simple;
	bh=q2M6sUMBFnSwf5l2Kd0WKx74C8Cyzd8OxTdXY4egw70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nIPAihVqGz63Nne5mSVNa4nc0RQv9U5edaIGFS1Vb5V9t6uzUwj+krFbm0czMZpP6kGvvMvHPng9s21WgMhY0yIrDrRvbX3z+PRLwTJn0hyCNksmf71BdlerWmfwT8QcwxmIdhKgSrwBkBEzAlEgOsKy+cOVOnbsz7LYJ62fnWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j6lx8NRQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ceEXDh/k; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OITBOY3666190
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OYV8iEEBqUQ
	eGUzP6iB+0ywG0zlXq6EYDd4qJaeKUho=; b=j6lx8NRQxsk4IWGl0cLaFo4FlLU
	KA7XQ16KuedlLF1h2Wkvpp+XmSMXowIuKa8id4ONikoY31t6Wc7vPrj7PCVKn73u
	xXoQ43s2sI75IdfgQZkbpWr1tLj+WzlPrt0LAi61JWAxvSQuhaXpgsiqZuY8j4Lo
	0vVBlexst2en2RUNRW0IGbXi7iX+RXZ6ovqUftvEXNAXy3ntFJRtRLypA+OVLsUB
	yRGq7s+99p2I8pnRCCT8lAfLOEIvCgyQ1ZjRIcbMzEUTMWlfg7/AqK6moVzk0Uq+
	0UfIYSBNX8LXTntKWwtX8KDHsAuoSdBm2aV7n7nDAxG0fNB5F29liCG3AZg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbr56w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845319bb97bso1119504b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328179; x=1782932979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYV8iEEBqUQeGUzP6iB+0ywG0zlXq6EYDd4qJaeKUho=;
        b=ceEXDh/klZ7MsZHgQ1JJHlbaGLIdCQGrM2dE69g5hhIntjDKoqFhipFxT9qCcmpNA2
         fOWuOXa3KDFltgLe8G6WfVzn156lBP5s6UMCFEgfO3zn2se+wu1+AGfxvLv2WPtTDg+1
         FoJJfzU3BVOSB6SVdt3zxyv3IVTcmGkgZb3Abzl771Qb/z4x68Ty2eb+q3U4tLqXqPqn
         CTTcjpyT/i11Ri38EMocJCS6U/iilRaZst1oMBxQnAUqKMLxaDGNcCQmpRcmGW7ZVmqj
         wg95/+HEVbK1fsR3li+PzeASJbdqjP8ExToRw1wuDl/55UEvjw5eF4B1BX5AnVf9vc94
         7XlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328179; x=1782932979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OYV8iEEBqUQeGUzP6iB+0ywG0zlXq6EYDd4qJaeKUho=;
        b=OoE24XQGh7IQZVundqkGTu2ARw7AySACFu4kOLo5TiiT+me4aWdwfoVU9QsM8nCHlE
         93LoxrT2EtvppotdlWOcw/tNaWmW2wQHCntxeYoWVV9F/owZsWuPKY2y1TA21axr5jst
         9cLk8ojGAK5+m6+ZzeL8lIwwwgCkTQcTtr6ozlhBzxcLtLToWe3swTTOnnoh4uEQg7Ci
         yZXORcaDgFUgekQ6cO9tJctmvfyQ12HbYic8Q8HMWMKsGvhfXmZQ4jHVCD9nO+TbcTIT
         zDSJQCxrnY35lqv0Yk21SYPbQcAcLaesmb/iJ0ZsaFXyBHNltUYw5f2uEwPkt9zE/eXT
         nvgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ejc8oqzAnUP/MWbIgVKfrgPZykl9kbgrpA/8GyW3qjqMfDqSi5g7yeDzXX7NsRz5QQT0pA5gLfAjfdGXm@vger.kernel.org
X-Gm-Message-State: AOJu0YxKLiz1TCDot7DmtBz/gtzDeOTF+GUtLy9T3ECSSmdH94/v8Wjs
	egHHBMPGVJZcUZdrx2aXZ3eP/lYwphCSDXD8Hfl+BF6hTzW+jPCdaJQVOFrKHDp1+T1KZmE4O7A
	GFQZsbTG3As24Gx3nmNZT/EwFh7z8Uly7k8EXAz8YMTFbzR9YmJ679mT7uw8HkrDsW8jt
X-Gm-Gg: AfdE7ckKqcqF7xERffuuhWFH3oLlg+Rs0iFXqn7ZTUV4E6R2JSMhaSFUDnTZmrM8wTG
	nGfFfaa7BcM09VIpVXNbyBx0yMDRKL3tY+nwk8R/H+FBn0LSb/jEOM6OkPvJsEqk1gw+J9jgaDR
	5FpDGi/srr7ELTXzFhmqk8WQ0Y8cP3AX7exGIuwNuQJvFJqlP6HeI28KIHhZCaw14R7VuhDWmS/
	wnU+oXyMGDlTj6M0hUd1U8YS//7vpAQrmk27gkVDfkaNc4KB+geilI9qDGjcbniAi8zbKm45rt3
	PIjBnRkfCPoYaYFCZc4SJZMjvW6AstkJ0HlxEEHX5rag/bwYVZvZDbnzSQbHmaraayND+kc59ZJ
	oNuPXwFeYufzIphObz5lBAyTmIR/hrtPMX8LVcg==
X-Received: by 2002:a05:6a00:a383:b0:845:390f:f4cd with SMTP id d2e1a72fcca58-845a2c7d3f1mr6047085b3a.30.1782328178719;
        Wed, 24 Jun 2026 12:09:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:a383:b0:845:390f:f4cd with SMTP id d2e1a72fcca58-845a2c7d3f1mr6047042b3a.30.1782328178159;
        Wed, 24 Jun 2026 12:09:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:37 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 14/19] arm64: dts: qcom: sm8350: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:25 +0530
Message-ID: <20260624190830.3131112-15-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX2c0Q8iL/1AjH
 CNuycc7mwMGSJ023mR7KQnomuibX3pqtBxsaCcVfscxElIsZvS3gZ95vp34XfQ39alka5+QVhbI
 d4mGwbGu/vUc+MlNV6xCuPFq9ZdmPHI=
X-Proofpoint-ORIG-GUID: 47KrkOxmAt1UCgqqh7Ph0eNQCKNK630F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX5LlZ2g7Kga9Q
 nblywSd8OQfAHuoP58Lhl8KEqWtjOQbSyQOUx6CM1nURYpFU78HUm+wZM0dRH3Ksts960+f+Z3N
 vXJf0trhxODLrzcEaNr1Qk0PbitoDzDKL3vNAX09xSZuwRsCIMtx794NOqmxGZFRbIm2fHiRRuk
 CFLK1h+RL1wUCQ5F4XtaZBNUagaS2HvO2V9vz7ni2grA1aGpSbicc1xYs5zEtK7TumwfFyDFwas
 gTHmZJurit2hS20Os92WJdmUvS2hUUl2tDm5n4ioCGCYyRVDA/XO/0KkTjsE9b2JfNOx580se3t
 WluUHB10lMZZp/QkRrDG4NdrDzU+5+pXZeE0WxgHS2ZARIwNNuFoBy3QI4v2EcC4IYyzLrqbOPk
 /ypBZprN7uKz5hwCWwCGvogE0pEy8dbYjOJQ5ujAtVsQXns9i/qDgK5Lgpiux6ByUcL4WycUYQj
 4tOrgZcOLJAui5yV6Mg==
X-Proofpoint-GUID: 47KrkOxmAt1UCgqqh7Ph0eNQCKNK630F
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3c2b73 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=BqutWRM4iOSfELY9pvwA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114400-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DA3C6C0ED0

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..dea97330da49 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -293,6 +293,7 @@ firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm8350", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -3451,6 +3452,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x40000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@3d000 {
 				reg = <0x3d000 0x2000>;
 			};
-- 
2.53.0


