Return-Path: <linux-arm-msm+bounces-109081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJSfGwEJD2rREQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:30:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DBD5A5CDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B72C3255EEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7793FC5CA;
	Thu, 21 May 2026 13:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aepdikLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sv+orFkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567A13FC5B1
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368864; cv=none; b=k8On1M/kJ+roCUjCoN6KqfAhHDBJPbxWmlxSF2/2mxhzmtPKPYvgj759tu8wKvtyuEsWOLttI8srHnng4KdtX+eAetbEaJOpr2WzJyGkJ7plPh1YDbbnMlLG2MzNJhaO2V3cfUShGmzGDkcjCHyYvODAOLG+sGhBHx3pgcuVD8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368864; c=relaxed/simple;
	bh=MB0nViV4TvVTTFohe7gXC325DBwjVk/OFHUgRfGnU0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBx2hJgQ18n2d9Jn+lAOb919XeNnVcH8gxZtBjpWwLHk6hABMYD+ZtlMsc1o5ZhBxDPMGLgJzKOPmk1YTIn60kMgvqtUI66JAlfclq5GMzyFVq6t0pFoP1uMH0Lft8ONqNh7xj85LcjA8XQuDhX6+/M8gbMO5eHQK1YpGkgedbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aepdikLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sv+orFkH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99ntG3009474
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wUwDhg3dsVMHGU8J81+cNtN8Z1vmBifp1XZ8s57MQU=; b=aepdikLX8jKqBTo9
	w3F0K9CoJgS7K/9rETNBB/djHaAZYjFNqA+wny0jvuOI9bxjHan48CzF2P1d21gJ
	xdbS9Jy/ebNQXXs2+QshvReprP4iL7zfCwx/Mv0wXK2YqnkdgVXMStCHQ5dvpcXt
	7oftRMzHVpwyo8P8FqziTLF5W96Cf6R+clVYQW1Keq4ltLCjIdGkQ1oyykw9iKL/
	E4wvDmRA+fseRYExE69+DJoFDCWIw8TlwNlpB/hdpVFVMA1Ay6kZs9eHdV31H+wO
	+j7wvWi67MupeekVsnSOK0GvOg2DB0+RkiUEyHeS8JaraMYt/+XnwFa6RWYRc9oW
	z/PDdA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr329sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c709551ec08so9386966a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368861; x=1779973661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wUwDhg3dsVMHGU8J81+cNtN8Z1vmBifp1XZ8s57MQU=;
        b=Sv+orFkHhvn+Fbc/kRz6YLQN1E299Jy90SDXSfjQBcF6/8ksJND8/bUGtP13rDW0qL
         NbhEd7Z9DNYEPg31K/guKt/PwJclr2weoVw3KDLoAtWsSyNwyBoH8UlJR/dzTMOQn72w
         fJcc+6Fq9B8u3pYvxJBMn38qHlhbgJntrSfFSjxPD2UOr5k26y7CzW+kf+rKR39CHVmS
         sGj9HGD0gQJcGrEL4KlD5hXjrK5PddQcC184qtS3f2hips37350xcHLH4uW8SoJeTBTD
         qST0RvY2y3+chuzbxvDhgR9fApsAAW+fLVDIfH9JoWNfGWUva0wlzucFPoVF4KF/5lno
         AnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368861; x=1779973661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9wUwDhg3dsVMHGU8J81+cNtN8Z1vmBifp1XZ8s57MQU=;
        b=EXiJnG3S3O3Uau4BHGJv7RAFoFS3w491nJ3yMuYIBW1H+Mwd032Bsff6cnruFKGXsi
         SSwyXWac22+IPM9o7m2lqlscdPwP3tVhRbvcckcZB+SuFLwioG7tLrfjVwDftKNeZkyW
         LGWYtxHcq1Co74MKDdJxNGDSeq8+YgkHsZeYKa5SEs5LUfP4gUoJCSp2cyu/Rroctp2/
         5mayMsKp7GiIPDiuL8W8N81cHYXHpC3gWmekPTDzhYBQPubfj5CmEAEx0XgS/36aRlQD
         FJUJAr+ls27pS1dAIJO9CN82Zb9ivCNCS25rx8aSLwIvEQLnyV4dHw3zZmpMpwGwS8jq
         4uzA==
X-Gm-Message-State: AOJu0YyJT99a79lYyoJ5DKWj38FDKs6PnuyCxzQ6jNDsett8hbVTTYDP
	9wTbKrbfIi04C75CBAqrfed2Ei+/AaNyfNne1qybWCqspb91DMIVLHyJ1kEOMw6iwdNeNrWFNIN
	o4zBVBw85nZZqsZKnZHIJdwwNVtbHkL9Z2ggNiUskV7uEZPfAS15r+wRN+UFqXEpSmLyU
X-Gm-Gg: Acq92OGcmM35hO2r3RFHwTKiDCMe/UPM0EaVk57UJ5m6CkWcvWBLnvuFdeT9kaTtp8l
	8JhjOxqpRf4YsBSkWQjVcVHKzXiZG+OSuejmW9gB7B9pUANcg1e6sJpsJTO4GvNgMXli9wkCYV9
	MVSiJ+rDRoLwFTZS2WsxofPWGy7MYMSPU8AX5g1FOsbtoSf1h6+iKk9tar8Hx6yWUxuRDJC7tEI
	gN9yFjagHqdVxxfFZfLxnyJWIvqmeFx9kdnFzKNue3Ugq1yLTrT1DfcEdzZGmrnybEhwNlSvp1l
	HFTBWUqiqxRG5ppPKIwABjPhBO4JW5qeSNPFMFB0H3COGTgB0OXlQTBFsDmUDWWXyNpaEEKSAXI
	sjDTRWJfe3lFvev8oL4tUSf3eOfKUasrN0w2ApVCdZxp05N5/WlrP1jyn
X-Received: by 2002:a05:6a20:9389:b0:398:a1ca:7a2a with SMTP id adf61e73a8af0-3b308b40bdbmr3593501637.48.1779368861256;
        Thu, 21 May 2026 06:07:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:9389:b0:398:a1ca:7a2a with SMTP id adf61e73a8af0-3b308b40bdbmr3593462637.48.1779368860772;
        Thu, 21 May 2026 06:07:40 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:40 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:44 +0530
Subject: [PATCH 11/18] arm64: dts: qcom: sm8750: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-11-d822567be258@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=MB0nViV4TvVTTFohe7gXC325DBwjVk/OFHUgRfGnU0M=;
 b=NMg8q7aCUe7yDl+w0GgJbutm+iiQhagL49JPvlJpCs88tTgOzeMn+o008tq56Ynn9IaQgWCoQ
 T0v89kHRikeCeOwzuGotAL7kyWX85M8QtyOyj3vtGjMUwG+TA3jrzFw
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: detnhvJkGIl4HWD7pGcsPtqWLMQCaKKI
X-Proofpoint-ORIG-GUID: detnhvJkGIl4HWD7pGcsPtqWLMQCaKKI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfXyyhgta1CFd7v
 9jhYWC8Rkswf1+1xWiAZoORhuESzaUYcijlebazQYhtyEx82N0/NUvVUETSFc5vjSMZk+3ZCsxB
 0lVg4tWhPlYmey+jOBn3FTC2PRm1+JpGYVY7cF6oJvpZPif+E62o1buX8cU4V1BZuxvQq275U6O
 P6D9qeyBCRoEmAKUYGg/XSULT7Vgc9kXdmFRoRKJYYCozMx4IQeyx1bDlUfX0x9g/F9Gwu3vaOk
 TDEEqD8MBQESAFuSnZn6P+TFrsE3RhHmx9U+mUiqwSlPRpaO817ppkdhqPnW5CQeLfgkIlT9TOY
 GvxDBH6HYj2acCj3Ag6/hRT12ZVligHP8VCN3rHxzive8+DKlw4AYl2EokpO8lojyQi2xT0g4vh
 +29gDtS39sWwm6ipP3BTn4awKqnEfmzwBE1d7EGdKpR61PFn3q10JVvZ5+o1PnpwojDq3uq1oWX
 1RMmKY4KK3H+27VjefA==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0f039e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109081-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: C5DBD5A5CDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3837f6785320..2c2753683c69 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1119,7 +1119,7 @@ &pcie0_phy {
 };
 
 &pcieport0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1


