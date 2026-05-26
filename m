Return-Path: <linux-arm-msm+bounces-109852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOLUCzCzFWpxYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:50:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0AF5D7EF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E728305099C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F014028CD;
	Tue, 26 May 2026 14:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ow2REcvV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RcHkpcJR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866C3402424
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806548; cv=none; b=HXwRT2yT6WuupmmtmtKEeDeX2NwZTQwfHzX4DM5GJjWw2UAEhk2yWJ2HJA8MkV+oL/6xR0YTQyXWaSQB0iYh+4S7f7IJ1UP/zeZrNcyjJ1iPflfTb8bjYZRyWKOlaoKXZeo0/EqPzpY49gurkYc30TRjQj5wYAYM48ehPtKczjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806548; c=relaxed/simple;
	bh=PUiL1di5z0y6rI3EPmKa71j71HOBjYrvAPS2lyn5wcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NxuEf+ZyrXJS+oJbQpV2F4M0+SDpGcCJqoynfX9FSRSQ1hscvEp0wrFFObBEDxcqYq1wQt7MKtv4w3e7ybbp9tVfqdE0eqL2ODVp5PH6hSQQnJo2BEk8E7T5FQLjB2tAnlviSt92pV8eZOJ0Lwxjb39AfGJ1bZ9U/L9mHah3KMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ow2REcvV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RcHkpcJR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsUSn2882469
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DT19M6pQKyGnQLXpjshESdaPdBCoE5uHW9FdeRhlQs=; b=Ow2REcvVjz6jJYV0
	+/mToHCztuG2rvHawhNLJKSbRd6Ky0UQiP9f9cau83gCW4ILJS3JERFThYAYxvdw
	+o+xs6UNuixwE7fyC4kGaIA7eFmKV+kLRCDdMJa245Hdifn5JaSHwZAK1E8gpPuy
	Jsv7QeI8XAhBLZ9FGY6EYttPm+7kw6UAOKsaERbbLSKp1senvUjDSpEfF5NFYJMm
	NKbIyxhbPB0U7pps9EQO5vE7uKLZE4wLKzJJPIZ5Jp0dsS4/szXX5KHjvTuRLF27
	4B/XkjOFDA1/qJgYH3zlz9gxUtD4i3uoigJ2dI++hTRvGfrh2B+T3Y2LQR9I7g8T
	1B6wPg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudcqcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8525f0807aso5058396a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806546; x=1780411346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DT19M6pQKyGnQLXpjshESdaPdBCoE5uHW9FdeRhlQs=;
        b=RcHkpcJRDAgzwKpenWaia6c6NyZalUi9d01tYbEI+CqZrGuJVXCxPc41gLZEl/zhS+
         +e1v+ah0ZChrAq2yaoigaS8ZeuB+pRZoMHb4kRdnIst5CVM5COaDx0NjG2yqUHORK88m
         YiFsyxsVut8MQx/zydovr4N2xcSyuaYilHKq+HXJF9YTJYPEjkKcTJJlAcldc22sYmDr
         TUJEgPnMgVYGLku9fgIh7ZwmXzgoZPZp5WkP4AJyg37YOAsFvOb0gqyN8lh3fJJBZNM4
         xzgqrxaDr+Fr12B6CgnbMw4Bti6SIUQV+1/uXeZoaCQcRMuoZ69qwjfMaoxbkntTdN45
         a0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806546; x=1780411346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8DT19M6pQKyGnQLXpjshESdaPdBCoE5uHW9FdeRhlQs=;
        b=C1VWHIKWRGtHGMhlQTOaJN40I3b/H2FFj3DxBcDSge4dtOWgFmn6nO/pMFdX01bm6t
         8jt2OcEFLpLIOcWUk/tbL8B/6N2PyOrnbjrSU2gb8U7StpGJ6Cdsr4Setfej/5O2kflz
         TMdrZaeJv8A+VUaXUl0pkCp6wgvbSq8b3euk0685yfIPu0gAmYU2uQmTHz4wKQL0nySw
         YGKu/nlZIfk0mJxzft0lN8jw1Z+DQQkqW4WYPKN7YwlM298DSBxJ/89QfcsRGbWEb4BU
         xMiCrCG746sXYFcoX/ZFyZl5fZtJ3LTgJ7MCBttmrYQHACoSq0kDexcykClpSTGFzKqz
         FXsg==
X-Forwarded-Encrypted: i=1; AFNElJ80lq2fIY4N1AqvRcUIbDw5KnEd5T9sdaFhJ26Hqnn2rN4dGQn3nCmFNb8ypHzGZc/hkjTrbop6LdL9NNCe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/DDvJTnWuNKVCrp5JiimJksjaR5u+qfCpEQaKyfVxP0B13hh1
	ZGt2zMOU5xVCFT/lpLJKzyZWdPU90zdpbUpVLgCPJuZZy8UuJjFR+pFucSK+/wLADlaaFY3goFS
	ml8bjvvy8UOpGS1ovvX0FAcVcQtbXwcj/N8xNl6KVDuQrwiHkwjOHo1gzz7GCMnwLwyZK
X-Gm-Gg: Acq92OHMwcotelvky8NBQt5s7hwIx+vBu3or4F8T4OTm1OvJx52T7h59Jnnc/mjW/yN
	LM6xjf8enHRC5tM0+vytnM3OstHG1RCskkTiw+GfLIj24P6soABEl9sOonJXfh/0V1t0UhChej9
	ZszQPZagWcoZE97D0t6R033kkfC8vsltfhDzweJuveG8Kq5Uh4D2TbjPZ2y/cR5ZFYIzzfbFBl/
	fl4t2YdcL3n8Refi5vrOk9t9D0F+PZAcnuZlA3sStFZs8DBAFIXQMFixhKe2ymUk1ya7KgmQsW5
	EMAemU8HuYuzGgHyKmQJPmatb4UYuQjHzNvmAdqMtiFfjs7vAhegZEgYu6ehOj86DE83xHTURu1
	SEM5Jj36UVklrg2Vhn+W0rLbPVS8NFweJsZks/UHe3Hz1OAsGOqO2
X-Received: by 2002:a05:6a00:1f11:b0:841:58b0:82c7 with SMTP id d2e1a72fcca58-8415f0efd10mr18388712b3a.8.1779806545496;
        Tue, 26 May 2026 07:42:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f11:b0:841:58b0:82c7 with SMTP id d2e1a72fcca58-8415f0efd10mr18388677b3a.8.1779806544992;
        Tue, 26 May 2026 07:42:24 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:24 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:04 +0530
Subject: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806527; l=1054;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=PUiL1di5z0y6rI3EPmKa71j71HOBjYrvAPS2lyn5wcU=;
 b=qwyYNob3QeroNmM+O1jx6rx5POgtChtC5hM3Hm5uGPCBB2RsdsoypthoZmgjsMf2N3zHCsl/e
 Oftw2IUs38qBTANvoudZtqGM2uTv4xEXg5SKwkblpLX5wNzNwyE1z/g
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-ORIG-GUID: 6kGw4Ovy4oX_BOOO0u8W2OfsDXRH53uw
X-Proofpoint-GUID: 6kGw4Ovy4oX_BOOO0u8W2OfsDXRH53uw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfXzvqX6ri9GNIt
 WvsBbccqwdf4mabXQYdgJYNWjfWqGxK8DDS9pqUk5Zb8T4aMkkUSZ1Wt3W+b65B7U3sSI+v03zD
 eBBF4atJH4VX/tjH4pk4I0GPazG3I5FS3mWabHhlqp/3HyeeCSEOGJRu3xmPqk6JR0iYnNPHSZK
 VzV6Pj3zSc3SSWpNBTeud7zW8SB5z3HxkJnGdx/NX5DBhMeROJ7KxOMmER3G3uMl5TOyszihqtR
 4Ew9ivS5CTBaVkLHUn9vLeAvUFfwLH6TE2gMfrncGyGwkjX3f+bJGmzKRpibg1z3qGokaNbGyGc
 khcbMPy5gHtorlqUniLTXXkDR5865q57Q/tDzlDOVf2LHbWfuORnVRZWZ/IrtVMGHoolEJxmfjY
 IDw8PW+GRVMqeUVnCDKTB24Yl7rThlHa4tIIiLkINBwgeC6jYO59dlQHI2s6qlg/CtAd8B3sg0t
 mXLgxUqoCQOyPpC0AzA==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a15b152 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wmxX9RSyIuGEu2EnybwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109852-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D0AF5D7EF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gfx_0_tbu: tbu@3dd9000 {

-- 
2.34.1


