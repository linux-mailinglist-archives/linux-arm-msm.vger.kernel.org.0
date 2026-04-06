Return-Path: <linux-arm-msm+bounces-101985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Hg4M93f02lxngcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 18:31:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 450043A551C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 18:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A640301C931
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 16:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388D138B7AA;
	Mon,  6 Apr 2026 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lkjqwO2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fchLS1qG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF03738AC9D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 16:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775493060; cv=none; b=sejqRJHnUzo/2eoFJh5cTLH7XVDi9LIE0ugoP9ECMUL2RVFkMaffZxyldjhFDAhj1u3FQ7S+3WcHd+GmAhLwGrIK0yGZsMjiQdlUo5FqdAfaY73qujgTp7r5uLT2daDq+704OX+5wd8aiqZoCrWk0daV5N7I2/QKAiMXED8dMXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775493060; c=relaxed/simple;
	bh=0O4aepyP6ITVXhCI2AvhxaG+mr4dh+c5BNy3TUrWQ/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ORPReesTmjNVKwmlny8JgBNVvaKnMYHL7+pwN/QPBhEsQo/kPqOxm+tiuOnMnc4mJOvaJMVZuZFJJkf4GGmuwqWZSDdDAl+K/bKwzfeOxqBzyGLTZsZbEH973q/o+H0jC1xgdJEsI2zUNxXjkhjwL1SG7tDbWXonpiAzqtJDDoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lkjqwO2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fchLS1qG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636DuZRW2420741
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 16:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7WNsJdwOeAQU09bnlt62Zl9zkqT9N3yBl3pCySz9UtI=; b=lkjqwO2swO0TmwAT
	5RAAzzhXaOTZ563CGQNdkUkXqPPDKfcmvP749V0utvbHaPNHiHtcAxUtg8B0jJjp
	GRmrGYkqCu6rhW/QimMyTcqvN0j1f8puK+sr/kdBKCz48/puQ9LiWmxRZXVnH0SP
	gaiEfqI3ZxFpkKzj5nDv3PWKpWv4pGvn01R7a7mSKsrkJ1Tqq5dGyOR633VtwwR+
	7/BrvuCTE+TbYvpQF4xbYRgKnrCAEKT//o8jWM4F0s+UNUsndVdLnGdPVv3llgz0
	CrvjXvBv0qXPMguO9UxpLKCfDx9FvfA6L9JpY1Pt4TVuJ/z4Xt8LMiMHBbEY+IPL
	Yslb/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dce5jrh5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 16:30:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b258636d16so43138385ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775493057; x=1776097857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WNsJdwOeAQU09bnlt62Zl9zkqT9N3yBl3pCySz9UtI=;
        b=fchLS1qGNmJZsKpZVU0mrHFSrbzaAz6WErE4bqqFhBD0oXwSP56oBgzfrdD9Vpi1Xq
         NHYiFIFf9whdVmMudL+AHVr+ZojS45CjusUnYyfaVef0GwVsUmvl+sRpHv4gGiNhiYaI
         wzVgwbJJxau7XMd+1ThmjE0rwL2MGSo9zc2/g6P+856iqAHN3DV9dYP0uw32hRPVZLCG
         qKBpzz4jbM4WgFpVvjzM08ETXZf+XY+QAyGZfaNoog8crxtCNIzmpTZCCG0DP6xYyCcR
         VFBrnZ+xrxjPglCNrSfK0ijtOliFkuhpAUIQ0fhUEBJttMXiDFDUnUWyCABjvH/OSfWm
         yzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775493057; x=1776097857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7WNsJdwOeAQU09bnlt62Zl9zkqT9N3yBl3pCySz9UtI=;
        b=k9mNZWs/9poH2LPPeqh7/YPwkPW1vbXt7QExhgqcNUxJzRmTsfqLvyiQeYMtmQeFC0
         P7s+4RmN3JNLLRSl+dQyeHra6MvTRGrDr3E02EGzs9cN06ocN9Kna5lq/VHOM4a+fFsB
         8MYk6ctViX0Fx96S/ptzxGnM4ax4RoM/2XVWNA1vD3FTEMRGIARLzRHrA62Io0gQSFyM
         /JdOJocsGZ/ADiKNJZrV+C9fus4d5GLQuKHGW2O6ZwMIydcle+7XjLNDVwDTZrR6rP00
         HWyt5RgKiPTGSQa8kUNN0TED0uqIMmywoKeEVnUqxxf1lK3wOvP06nng1EZpMuIeo9pL
         uoug==
X-Gm-Message-State: AOJu0Yxr3QkeIBw/1kr7tEg6/1pbY4oTtsPR5/rcMohoPvBArL/Gh75o
	HYXowz7+8lqpjnC1wkYZ+nRiHNbl9tPMZwdde6h90Qrpw+rMna0nWUH2A5/5EclCPlzAj4eYtmG
	EdMYholyvUh5V+p+1nB52hivn2fCwiA+sx2DykrAJG+NSwlVhaHF8SZ5QidHNQDxorq7n
X-Gm-Gg: AeBDiesS/SVDWwez0K2j3ecKHGpMGQWUZ4EQOn7IkUWmmT1omJXYvx9rhKH9dHlvybA
	Kn7qZHQhLYOEoLOxD1V/VGpX1xDQnI7/+a0DyuCKvpGRuAaHqiukxWLLGvehciUx3OvhRSrtIFK
	l/+hYgPHHj2dyBl+9P3TNvh9448L1lp353dSYevMWu5V1vXZDND1CKQDBp+tPK7Yinl6WMLKNEq
	cwYjrl+/gwzB58VWF4NeHz9bLOSX57SKN1meg1KxFH3uEMRoiuhsOJd/6AdIhcejVs/nAVQiiez
	HLVyhEUSXoVsqhVeAEtlJjHhRGalloNlXbDu+EJz/tihb244hKj0mCMlRYr11c0zKc7098Pq0SS
	aC7nygoSITYWKUm7d+io42q9KVe3bWXgTxVi1P3BwiDU4ua34ukS7n90=
X-Received: by 2002:a17:902:c40f:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2b2817f957amr145952945ad.11.1775493056946;
        Mon, 06 Apr 2026 09:30:56 -0700 (PDT)
X-Received: by 2002:a17:902:c40f:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2b2817f957amr145952525ad.11.1775493056439;
        Mon, 06 Apr 2026 09:30:56 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cdc61sm145144455ad.80.2026.04.06.09.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:30:56 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 06 Apr 2026 22:00:36 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: kodiak: Add iface clock for ice sdhc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
In-Reply-To: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=R9AO2NRX c=1 sm=1 tr=0 ts=69d3dfc1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VpYg6FisGcu3jhjwBKwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: vBcpywx_254j675wlsynNsUMF75fKckO
X-Proofpoint-GUID: vBcpywx_254j675wlsynNsUMF75fKckO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE2MiBTYWx0ZWRfX/1ql+oVJtHOx
 zM9PcOaUhTftMbtoYIeE/VZKwogdSMrpfUshQfAhXdmMPluoJWkLD2C/NJO32uXyk5SwKvsWK3j
 412bV2dqYeVwA9bVTPXKj/TpG/dKoCO+yvoBV290W4gXJpW/2is1Vap+mbsX4U9ugfzBQwRYTk/
 C0lgILMTCPdBAuJMXySR65ldfit5z2UDrBzoPwJnKGslgRPFABsWqD9lFNDOtIapeL2cTOYGBYh
 lBhpr3YubH9NLr5FElqmsVdqf7OGhDGtp457SPEe3EACusm/gaabvHE2w1NoGrTYxvy4WGyKgVv
 s0TgXd1xKrFeKu8PQt+/DLqj1DK5tujyIQl1cTTDFvNY9DUxumjAdZb+fnTlNmYVw57vE+fVoky
 1JQJjheND/DnVIT/ucmsrKxlPAfEqE6OecNVuP9SRbQm4/syu8lJ3wtAlNzy436AnW6BoHa+pD5
 duiiq6qBE8IkdVHuD4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060162
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.13.187.160:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101985-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 450043A551C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core'
clock the 'iface' clock should also be turned on by the driver.

As bindings allow to specify 2 clocks, add iface clock now.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index dda4697a61b7..5e6b659e8719 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1082,7 +1082,8 @@ sdhc_ice: crypto@7c8000 {
 			compatible = "qcom,sc7280-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x007c8000 0x0 0x18000>;
-			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core", "iface";
 		};
 
 		gpi_dma0: dma-controller@900000 {

-- 
2.34.1


