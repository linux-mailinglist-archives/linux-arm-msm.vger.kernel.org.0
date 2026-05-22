Return-Path: <linux-arm-msm+bounces-109417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBCiHCa3EGqFcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:05:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6EB5B9E3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B855302D538
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B497385D76;
	Fri, 22 May 2026 19:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqerWLsV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOE4yUrl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9697D385D89
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479714; cv=none; b=YX0iY+fuAIzlm7dh2KkcUfai+5NLpSmPNtauQIOA50BQqm+HlVJMVW9QXd0URqRieMS+vEhZ6lbFbdIMnHFZ1li6cVdD5zVnwdd7KmQ9i0SYF+oSQclKOKJeNQjfL+R0xLTR9IkdX5uqSMSIcjmZJlvrZnm8/NftGy2FZcsr9PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479714; c=relaxed/simple;
	bh=6CDMXyktl1avhKseT/l3D8WHvKV06vYs4Dl3eYzR81M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lox3QdVejvHS77llgxPMMVEhQ1Ehe7IKMISvKD4M12sOvn2TlcI0z8ehXTtOnwsVYyzXBHiQTXRCeAXQUXkDDBJ2lwEekn7C6hR7KR21DLOhT/b3mKAGyCx9vsOZReiAQ8Pppiy6ShD8/fAxJVa+PYUhUNhhCEPtXi/S1ukNzFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqerWLsV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOE4yUrl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG0hjq3477048
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oPXMCoG5fsV
	njzHE4626TGyS0PRH/4mTNQAzDdiSDaU=; b=WqerWLsVmBabMEyCBgtZwUckFuZ
	pacs4xu3aIVTIJzssT/fFzUriO2CWTsbUOBlLWI4+vx5Xds4ZXzNN+NVO+meSUL3
	m8u/1wdywZRNJpeFCo+0E+fuJdr181FLglitmvb3dgClo8SSXJGhECHXEM40sXFj
	wAdtw919J540237y2s8NJIx3Y4157C9X4DD48ReS+1TpPd8OPYc0y/wsIS2qzeEk
	ciW+xAlbKzjLx/lUh1VlpzybNnbXEaA0x8PqqA0wzWBwE92p/tButRJ3j7R3BLm5
	RQazdZhP5NC/VE7CQ+eIaNwt2u6auOYFiwhzlho1N2uRaJcIt7HYSiIufFg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eat9r8t5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd6aeb3637so186200535ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479710; x=1780084510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPXMCoG5fsVnjzHE4626TGyS0PRH/4mTNQAzDdiSDaU=;
        b=WOE4yUrlYKBSfwQ7Adp4yHBSzO6bgzwG5yPY7ya6OfpcwuKub2szv44+8ZSM2kHEZt
         VIyPeZf7BJ/FDRSdEpjfygDRGKQh2Umx4IYdKZrsmBGajpWeY00SaJfQK2D7yTm+rxvg
         4HWGOUY5JoqEn2GsPcXmLqekwJY2pXAW/QC8R54iEo9WR0pB8P7oQSucmT4ZY3Q+Kq5s
         gwJQnaIw2KXqrG9r5ggBL9orPmLGwY31wcsUHT0nMjMC0w6DHzrbS42UlpFV13ZkCztc
         dcN5yuLP8VE72LtcBGBv196pLKY1rO4ckJ0X5SCwXTMi7qNxCcQ4YSl3z7T3EMxC3UP5
         FxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479710; x=1780084510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oPXMCoG5fsVnjzHE4626TGyS0PRH/4mTNQAzDdiSDaU=;
        b=FnEbvyoV9ZjwNP4FYrQVXrtFsScwuZ8XHisi3NPmFmvvkL+gHNBnQW6Fvlcv8boK5e
         JT2qtUOT7MEQgVtAuI9XcODnGXoIkz6ako0OxhOnv1NAaRHqOaSrqt9Un+yQFyZcs86A
         nBvfed2RH7+QKabFWwPPEYcQJICzYwD32Um8A152o4GI+SXcUR+zU+0VSTUgBM7d5qmL
         woV8IN1fjWb9uuXO203VaHXfr8pOj47ubnBFfnmLziblBwP7mK2XkF0ExazngIQxPP5i
         LXxZHH2aM4FYo1Zwry3qr2EENjOFTHaVgJU+J1riPWAyUx+bh3ArLfHwJd+TRVtY5M3e
         0yYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XdqaZ9IAaSIc+K+6v5yAe1zJLS3XGUEeX3tJSYyCMHIbyrWEH6Cp3ifHY7+N3ilXPwoVYM1qkJJWq0pvs@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn4DZu9VIikh57hhe9OSRXrua8G6gY2MpA9zcX4mtmS2uWHi2U
	F8EEFtaoOLw2YL+fPTjdAUsQlMkqWEhWn/6of1EFWkXPemwVBY20VeI4GwCH6pI9b0jYDsnedHZ
	cBe3lMjy0vET09jkylkG63099aq2/k/AjjIn8dHM2EabQoYrp5ouO/arqlCNBBRX2yiRG
X-Gm-Gg: Acq92OHyN2cn6rFqusAd3Vphf0me6OZq9p3GToIsqT75wFHb9BS3l9ZzpRXYYSU0fap
	bEumlFfrdLzcgJSENAuf+xB7OOSLCG6uJHbQBu+e4V0hkAORfkTL8WjlVHxU5FR1t1tns39EZUm
	to8On9RZlPuRjC1fGWr8XLQ+tetxed1mLzbwXT8ryiU2IWvLlWRu3x/o+4Mp5zdH8LiQShsFPVz
	7Q1Zvai9x+k2B6xDzAeitDq0GyueFVwS4EAFevJzYsa0T2jPYgvgQWzQQ/mrbTb6lVNP90SYvi9
	4lyeN/aQ6an0g4Smsegvc7zH/mzXYc0l+jwAR+wedj5rOU1/KS5nALBbvjWDoWjQja0nM43fS2Y
	M//MKecpSnxWfFSjj6I9uTHixc80lwGzZZJprRROj4WmvrW6+
X-Received: by 2002:a17:903:1247:b0:2b4:5d51:ce96 with SMTP id d9443c01a7336-2beb06fcc8amr55332325ad.24.1779479710080;
        Fri, 22 May 2026 12:55:10 -0700 (PDT)
X-Received: by 2002:a17:903:1247:b0:2b4:5d51:ce96 with SMTP id d9443c01a7336-2beb06fcc8amr55331995ad.24.1779479709577;
        Fri, 22 May 2026 12:55:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:55:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 17/18] arm64: dts: qcom: qcs615: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:08 +0530
Message-ID: <20260522195009.2961022-18-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dt/rzVg4 c=1 sm=1 tr=0 ts=6a10b49e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Y2DO1TD2eDIuzSEqJuEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: BfEfnAqDrdN-E-ttgH4XBhpD6E5MpTC-
X-Proofpoint-GUID: BfEfnAqDrdN-E-ttgH4XBhpD6E5MpTC-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX1vfXEp8WkVIW
 8d4Gp4wRYj5ctJbCD05UUJ1h0HQVQ0+xH0Jc+7LKLxHsCbahDIxavCKgNAAoGQOYpztCM+Dyghu
 zBmRF2c1cXCBmtHaO0yxMK+F0/TgZWXncs+QsIRTlxOpf2uN6uxlOc3gh8rvGbpu8uUvKVD42/t
 dG9Zc8IuDLdIljC+ap/Guvr7PXn0Y2LS86lc6Ul4u0YyFIbBLyDS6aGV26bvlfCP+mvjdceyaKp
 aEVrsnBf5pce+eUPLERKvoofIB5kyOPQYnYSaX5Ca3bxjYJIQs+gA1n9nR/nz7vzbOIgEOEZvRj
 1jKjFv6Zh/lse70hXe1dP394WB2BShIrH2b7BqGCJx5+HFIE8WZhfnKodYJm/oGg72t6eW/SE3a
 ZtPql3KFbvPMiQsuOvMp26NX+3GVxo/T8oPeCkU06F4Vit2l+4KBmbuV9cxPeDa9eiuMTXAPUkq
 8DhmUxQ+NsIuR9/0hqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109417-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,1c:email,2a94c:email,0.223.255.192:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.985];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B6EB5B9E3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..a358d5441fa9 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -473,6 +473,7 @@ firmware {
 		scm {
 			compatible = "qcom,scm-qcs615", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -4654,6 +4655,10 @@ sram@14680000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@2a94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x2a94c 0xc8>;
-- 
2.53.0


