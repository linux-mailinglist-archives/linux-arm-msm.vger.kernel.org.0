Return-Path: <linux-arm-msm+bounces-109074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A48HH8ID2rqEQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:28:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE2B5A5C3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAD4D314515F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8983F2115;
	Thu, 21 May 2026 13:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjOyjEmr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hi6CYhk/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9CB3F1AD8
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368836; cv=none; b=c4FjBZUJuQnJZaEQrWuYHL9PEdBYR8/Zfbk0BjQnHquRr3xK4miU6U/Sau/0653HsmZKi5K8yvWsX4n5I+IgPo8psbryUkBgpcsPIWdZaPprA42YZnEg/CqDBT1YN3N+WvLtUfUgRKaDAIS1glZaHUJxnvH1TGdEbnLu4HhDr5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368836; c=relaxed/simple;
	bh=SnFemOqaJpb3Bo96e1V7TzNicDBNZ9REneIaHNVBH9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jG6lCXtdImGK946YlQFH35pRRhL1erg3dY9jFfbsediAjQ+hWE0/QMKVZ7NjGEqyBT52r+vHacnubgea6ostyn9tRusF5IUlgiG2hrbIQqxvjAMq0jfhlBD/5V6nekKUJ4adX9lhM1BaUsyaILxb6V4nrVOK351cYPSlEXZmhek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjOyjEmr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hi6CYhk/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99xs53528303
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdqOy8M151/0bGRhRV2QiiKDAnKhEQ31U3u1FbotUOY=; b=TjOyjEmr/mEgZ4iY
	4fH9rflGvTmahhdWNdY/mDh6R+mO5QmA1+epkJlSnX9fTLFmSp3cV2JzETAp2GY9
	dU6ifiKgY/wTizueaS3AdZkOJHPsnfER64T7zcrV+iCV8IDDPLS6Anvy0DGv8+Rg
	98Evc78tdJ2ah/sNy1toVUTLOBqn8wSTbgS5edCKlZX2FKLoTUmjr98k98AYaTTj
	mX//0KkaWbYWXcbNj9VcCrPMiyG9wGkQ9PIs3ivxLuoOczJCuav/QWiW6LSPRewu
	PyP6WkDCkySeUBf5cHQAaToVukeiiTBSJM0H2synupIOKXnZEpuivsn979Q2Hh7X
	9F2gfg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbhpde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8276c91addso3424301a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368834; x=1779973634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdqOy8M151/0bGRhRV2QiiKDAnKhEQ31U3u1FbotUOY=;
        b=Hi6CYhk/zY8x8OS5G0BZkbaPTQ6KETsE+UljXZF5VK2RGLJ2n1S3MN4ZVZZtXDvb+K
         r2X7RMpEJWBlObMlxTuxRU6m2+sW3rtNlQi2jw6Vmd82s3UBW+pXhpD+5W4OJ7Uu/2Vs
         UjD3KBPsSxTOObK7I2YgHhSEYXlLVltnG5R8XRsoUW2kjFsHdme2RniyK1a04S3ilRB7
         IFwg/DcBk5bJv8gFT/riieQWWq7FiZP+qUKkRp17QZfzmb0o+aA2LzhppoLT0bb1lZx1
         vdkDMVp4s37iXslisHZJoDQnqJzONP2gfRoQARsf41kJ9r+LJZnLCY/Kk1XrXz1jswbw
         7pMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368834; x=1779973634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fdqOy8M151/0bGRhRV2QiiKDAnKhEQ31U3u1FbotUOY=;
        b=jDpFbMRHbLIXL/GAxHcgU88yo4cbX3jSTvwhEiPziWLdHDTGtoFKRohplp2zPiiL87
         SbpkIIPRWZTHH/3OZbhIT1uwOog9euzKzQFtncLXuRQ6I9OhZ6HcJh5N2orDQrnUVXKv
         EB0CRw06GW8X3IGMYK33c36uyNf+UdUMMlu98Bo2/MkxB4QxwPTEnVWIld3GdesoQSSf
         QZ5Zo2mLnbq8I/wOqXUxFx8RhD043DBBi6+mGaZ0kRF0dlWNCwmLtEy1jhXrg3RhsJZC
         211L/1Al6MXqlzb7bXiydReWal6kaBzA634xC2YXrXmX+9/INo2C05KaAu7OHAcpGdy/
         n3ZA==
X-Gm-Message-State: AOJu0YxdPLUxcHH7ZhOFeTik8ffJ95UcFuxFXp9qaxpFJ7c3RQFN2aPO
	PZP6NZSvytcIx+xCGS9f3C86M3J2urRMc6/MTlAokgemqOewmDDXHFFXy0uVtpNzsK5nLHVQwuj
	U3JrrimZHymba7Dm3cDlH/rOxBRQKIqeOzMt/V+afnw+cZMat3NvyUqHDw0QKL1md6HzW
X-Gm-Gg: Acq92OEwPal7SqcDwnqzH5PsPr+HdhX7hEPeEXHqoJJ3/ciiZs9WkBgt6T3ExCsH8Zq
	B8ls10i6AoMXudZ7mdvORLZeisFy0Vp7qzxDRMr5u7sUYcdaCSSCnMJyuFGVk2AxjhUlkjkSMxP
	6jVloMsN2pTt5JzHoKy/+RHNLGzLe8wp5ynwb7ALlXbjIlGNP0BeF9Z2mE5s4Iu7IFGsaDp3eZ7
	TBuX9mVHhjj3hLBg+mH3OE2IeqLB4DDdaunDYHzdFxqz3mzyRp2GnI6p180SQDV4FJt/kz+kHg/
	rJuWfjEpCuZPP359fFjXQkbUynfhEU7hAzOjAewifF7UEnMzjJ+GaYyh5SbIGXTL9e2bTgEi+Cx
	mhlb2WnDCJV7GX/wnnPbSCKrJDOe7HOIQEFg04lb/UD9cCxl43grMjK4m
X-Received: by 2002:a05:6a20:7d9b:b0:39b:8dcb:f36d with SMTP id adf61e73a8af0-3b308a97c2bmr3433060637.35.1779368833633;
        Thu, 21 May 2026 06:07:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d9b:b0:39b:8dcb:f36d with SMTP id adf61e73a8af0-3b308a97c2bmr3433022637.35.1779368833138;
        Thu, 21 May 2026 06:07:13 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:12 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:37 +0530
Subject: [PATCH 04/18] arm64: dts: qcom: sc8180x: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-4-d822567be258@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1599;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=SnFemOqaJpb3Bo96e1V7TzNicDBNZ9REneIaHNVBH9o=;
 b=XVDSW2Tc0N0Lc7PQYaG0odmr8Qc8A4QelWCH9Vs5sbNENn6BMgcY+xGM+ScIRVzWupYsWq77X
 pMj69hJjypECdpnTZvKh1ZUbzWKw1Gg0EXyXSlcPoYZ6Qb61pdyF15U
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX8A/RMpLcffWV
 IaU6FBFruVa/02Txk7Y6nfAEzHLgAfdcu2aQN8ysyvvYm8uNaTAsRTl8q6d+ecpTqDu/YvM78BI
 IotaxZDCuGk95e9fXmPYyDaCD6r261b0c3WasJBdG6nZvgNxTstCBVk2ec8pPoUs+Jr96CmjUn4
 BPe10FBKu1EDxNTfiDz69JSyjeYv438eFm60ar+qTY4Ch/DNtB2IdfV329EOQ+ZEV8mslPzvLUh
 1AK5qZTKSQSh3mfc/2gKMelFSXDXuD4dCV0Yay3vPeWpCbSE7WgaFD+klDvojUKh/fUxK4tkCZg
 RGSMiEplkzAHbCQbwtD/prEBb0X/YN7QQnYB03V3Oh+QcRC6VwRU7lhqaI4WVG4SMykTUeXE5qR
 kH8MtB9oe/fmMC2/Bi7csqiAj4zUdKPBhBdbqMNvUsyEjhFS16+wuxxpv5yN5qhqTErkTSUzFx+
 nx705q2ZTjOIPPKr42w==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0f0382 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: ffUrX1PGjuGHTIZoa1ZsOFaeIJ77gk-T
X-Proofpoint-ORIG-GUID: ffUrX1PGjuGHTIZoa1ZsOFaeIJ77gk-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
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
	TAGGED_FROM(0.00)[bounces-109074-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: CEE2B5A5C3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index d86a31ddede2..44bf3db01d3a 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -458,7 +458,7 @@ &mdss_edp_out {
 
 &pcie3 {
 	perst-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 180 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index aff398390eba..a4644ecca536 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -559,7 +559,7 @@ &mdss_edp_out {
 
 &pcie1 {
 	perst-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 177 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_default_state>;
 

-- 
2.34.1


