Return-Path: <linux-arm-msm+bounces-109073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFn9MWAID2rREQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:28:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCE25A5BFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F40CA3234A96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FC33EFD10;
	Thu, 21 May 2026 13:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1M28wTS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XN8HdX9v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63CF3EE1FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368833; cv=none; b=JOVLSsYdRgvzcg0mFxod7xcgx0cTKRMskE5sGgMpxStDoWijAvjFPXqbatZeJXqqsm2EdWw6YceVFjA8iym2Gx98mB1fEQATjUj194qb6vvHqVi7LwWG2RAqSOjavCxf0HNo0arndgBYJeMFHHRMJyjcgoAoyRNq7NHanOZcG/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368833; c=relaxed/simple;
	bh=B60gwn2osJeq63y28HdBWkh+E7Nc2abnJm78Ob1pKEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zl+z9Nu55BEibv/rBfakeThQVRa+uYpFjA2jj73jaDxoX1yGin8DO0hrJu1HdhsPr8gKh2x3GHY6G9eLpvzoKefgivJYhgfyOOMaqQOQDn+Oxef2eULIzPmw07Grw/FCCWwfir2QJeFE52FOtN5P6Fejb5RxAdiPOdGblJ9mhkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1M28wTS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XN8HdX9v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99ogb3009536
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkgSGT5vmcjvJZV7Oqxtgx09DTrYAdxe+rZl4hZ6XJQ=; b=F1M28wTSK6SmswJf
	u6wUjr3pgFOPWYe7pUJysGd7jfbZRYNwViVVNKlm42Lzvcd7fkeO4WMEKg6NsHVX
	lswr7EKtpaLx1VoKwacAxUzAIk6NMLuRaI5RveAD/SnZO4peCHPJLMofmDmfcCvn
	41Kk6kYsCzRQxdOU0jiQA9qoeGU4UdJuFZ9redEz5aWRbJ1v/UPM/0gPSM8d+3Cd
	0QGhHU8CJ8xTQun3Z9S3NzAqoWTIMxR5DNePFNGDBXVPvvfgpfvma2aepcL/JJFb
	cdw8Wv95Qk91xeMiCRGjrC7iLpKW1vKVLbFSajxqBEvXf/1ouX4T2RwJ7iGSNvtN
	uiJyHA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr329ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c709551ec08so9386475a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368830; x=1779973630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nkgSGT5vmcjvJZV7Oqxtgx09DTrYAdxe+rZl4hZ6XJQ=;
        b=XN8HdX9vHM4phcrr+3/b6rzhCNskkoaRsnbCjrTJ1SR8HXiJdl7QRsOQt3sivQfMor
         yGf2V/Yeu4KqCKRHsQ1Mvr5gWrJFYV7P2Zknqx/kONSp6ZoM1ezAQHIhhWVDt8Ug5T1j
         R/Vkucrs/l2launNFh+eGqMT2AO/LZheNw9l61ffBx9Fj6CRZm9qECZRFUUWVuDaIvwb
         EfzUlxQZRu6XgJG/4YVBP09tZ48vGyi67TmIhqIq9O8RXACVnnowOto5tkbxy3cNZ2U5
         A82sZEu0v0yA7CxFWgPpr/n3E1zwuzCkNj85XVBDcylWaLohn2vlXxvGGyaJokA1Bhnj
         hylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368830; x=1779973630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nkgSGT5vmcjvJZV7Oqxtgx09DTrYAdxe+rZl4hZ6XJQ=;
        b=Kdgn/bQC6RI0PDN6EFXYOTcsPxzm7ryso4UlLxrMCPyObsaSRzHM3mTOi3BZE46ZJo
         w2R+LRJ2a4qaq+ntt43Zdib8SwnVtHLiq4Hajj51iSGS1Q+B7NzgNks8p+GehYDdgTWb
         sFy0mhVdSBmv6B0cs5eEQvRZWLpBJxiR1ZWNchKNzFsuw9W0TRR/KFKNpOBPnqpKWkJV
         K8idQ1IroDwKggNX7GkkGcPiBaAY4QNmgIzI63+d8bfYhnuxfpwo5diZ7BAnVog4+K8O
         c+NNC+dxFa1XG8W4LEPvKYt90nzZKdd9Y7DAI0zB4Al+rZgQH9mWNj3MlmxJZ7KMUuSP
         +Lqw==
X-Gm-Message-State: AOJu0Yx48CdQUCFnFvS12krAEGiVle2gW7s6+sK16DBck/UhBNWWaE7w
	rAIMUzOws97IKaktyF+1RsnobNiueIhK+QfBaLcVvmqovSnA28S6H8a9KBGaLxONQbPGWUsyOup
	aS5XXJ6TCSW8ZRFfEoZe46blhIFX13BpuN4HfK9KJVteA1+du0P2zYarSU8QB0IBr3fYi
X-Gm-Gg: Acq92OGOsE5BAHkJ8NGtttlJTvuPMNykKRZ1oIy9njeyoWBBOtOhytClQ1Auhqgsqzz
	tiJ3YBhss2hnC6S47Wvgo5psWCYpZj2NjqMGLX3dPc91JycHqTZzRw2PSwdq365SSsKxFPf2pRf
	FhzdQ0IN91LDVX7x2F/42cqGAJ35fjUE8Lpsk1va5VNdmlC5nZVQVscZE3Bz6e4WZWDiaQOm//j
	RGez+4H/CTJvDlpgJ0BGqe5fNtRZjz0CKb3ka3e9VDMNE0O/fa/HWajHeD3dZfgZybv7z11F3SK
	SXHK5hjkLouV+gXcMprGrE8N6d0XJd5Dp3KeJU6eReTyDE/gytYYqAUqhYDFiOpVe/wmNGscU1t
	iPRWLPHr/Mgp3ESAspZywyJKfjM8zfYCkswKvthrSeBy1WEO8X1DJkCPM
X-Received: by 2002:a05:6a20:7f8d:b0:3a0:c285:e51f with SMTP id adf61e73a8af0-3b308bc8879mr3315614637.52.1779368829722;
        Thu, 21 May 2026 06:07:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f8d:b0:3a0:c285:e51f with SMTP id adf61e73a8af0-3b308bc8879mr3315567637.52.1779368829255;
        Thu, 21 May 2026 06:07:09 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:08 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:36 +0530
Subject: [PATCH 03/18] arm64: dts: qcom: sdm845: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-3-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=970;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=B60gwn2osJeq63y28HdBWkh+E7Nc2abnJm78Ob1pKEo=;
 b=X9dYaR03XEyAICIwGeKi8ad77vwcjMnK7jPQpjIYxb4Qc8gFEMzVWkbjlRQh541IZ2lqqe7Pq
 xYQsXphms4WCPi+k4+x4Rr+fao67AAkVrvpb2XpAagkq5IHGEF7Pwhq
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: giKrluRDAEkEmbJWpf-XoHaTGGq6PlzD
X-Proofpoint-ORIG-GUID: giKrluRDAEkEmbJWpf-XoHaTGGq6PlzD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfXwQTK2hKxsddl
 SZ3czzUozdN09ihcm7lJsjGspxLJPdkMY79w1Hzdc5wzXx1zxREVotNjle97R3MlN67oYaJJjeU
 uwB0gKZXMyXWPrFNPM66z7+/zVZIMe9ciKNxr7P4FKs2GRX+FK5zu8M0Hxz+e3EctUOz5kghb0a
 P9P8uc+/65kVGm14v5QppivrVuDjhR7IXas2PkMPF3Bm6hd9H67QnODLZ9pOyvrZdQ4Yjr6375k
 uaHyWEefUKTulGw53geNxVk3qiBDknQltj8VZYGXRTPjelg2IYqT0nrmG5KMQsM+CaBZT5s50a3
 I12+1e2SXKskhjYx0a45/OyO6sm0uR8g6dy2gFlaCJJl93f7DcJh+ucBF1iEirRk+ZicJLy4vR8
 xk+6Kl15iIIlK+yzu0tS3/yv6tYqsmc6vmvq9BJwi5gQOFUESfGDbs4ZcPaurW7i2UdcD1ZX/dY
 +W379nLjlAmbYJ2yCKA==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0f037e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109073-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2FCE25A5BFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 02416812b6a7..24c0e97bb122 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -619,7 +619,7 @@ &mss_pil {
 &pcie0 {
 	status = "okay";
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
 
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 

-- 
2.34.1


