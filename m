Return-Path: <linux-arm-msm+bounces-109958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP2cI4u9FmqPqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:46:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADE35E209D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2F023086932
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440E33ED3C8;
	Wed, 27 May 2026 09:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qj8XQtL6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZpPrX3Fw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939853EDAC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875042; cv=none; b=cqGuT/MJ2L0zVx0f7LnPOiMbaXQlMQQLJoTPDdn7V+6dWwCreFTN25I03ZuZzXt4SlTZ4TolER5sCmW0f3T08iLJuS6RWN49VIqNcwpAE/Aw1KKxWIrcvwOb1D/vrKwtjSEferEWa4TLQlwos4M+CiXQw+Hi25cVj3n7dTmi+Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875042; c=relaxed/simple;
	bh=ITqlLQ9Udo92Y7Wrxr3GCxCb4jJWWDsjKmMjYs/NfFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DA0R2WtFaiirWVXobEFYsZ0pFwbkqtw7XL8GWEyGusW55JbfpEO+Lj64/5rvDBbZmpCILiasqTEF+kWDdjlPhtIF4jjIlGiYV0KDY+OtrsCAgZb666Q3CQ8ybKsuR1wht+z/2uxGYT0g0V2bqOaAnrYfoukjnzURWC7C/mBL0DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qj8XQtL6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZpPrX3Fw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mYxF1350626
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ezqTdwQnUiN
	4UNQQ5cBICs2ytt/GCSpOUwmXcsbrcV4=; b=Qj8XQtL68Gpdo0ZcBVqZ0c5v3ez
	v1trH/FIS73Hlre0XyLEqjFrCJ9k3xga318bciIn2N+RNP0GeLw5xD1IdUcA1sjh
	gzntCLVPn90ioiAz7DgutRxTia2x6fXy9+BNZxHaD7Vri+7z+54gbk9/MNztbmAc
	4oRo1xl2mY8RbotsJV2vQNNutg9jIlTLPCfLCouNbYAmzwyS+DTExyjpiPbISM5h
	0rO4bankJ5w7Bvwjum2ATS9bxcwUmTW5TsvlO9o+jH852jLRw0qUWB91xJPpqdJ6
	VqU8EyngxozZiH6Dti6uydwk0rjSHC4X2QnbDtGtMfQUPdG/jwtQTt3CzSg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edentkdqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:43:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba268cb5e6so122267295ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875038; x=1780479838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezqTdwQnUiN4UNQQ5cBICs2ytt/GCSpOUwmXcsbrcV4=;
        b=ZpPrX3FwEkeHVid18vZgjc8jRYo48YD8glZAlPhfgHYB5RPoN8dh01AdaczGKMwtEA
         Dc2W1AxDcpmttYYIGcUY3y9tjahSDksDCepBkW0rAA5M/VvyW/cYowEdRM9u1NV5x86z
         vJjCQMSSDBtmx3djkMCZYQB+535J9WIqLIgW1rfRLwrui3Xdq1rDjHpueY5lw+1ByMiD
         iUK3G1Fwyp2EBFU40Lvi2Afvy7rtwukXXnBdCxTp/7l6D11JT9L9ZqfIdCreBbNy4lYR
         CfpM6Ts/CrUwCBBVRFhsLIzYEt9U6PZ0kPGCXF/hr0a9gwac4j5CaEb/atBXhcuvLx4V
         w5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875038; x=1780479838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ezqTdwQnUiN4UNQQ5cBICs2ytt/GCSpOUwmXcsbrcV4=;
        b=nBXg0Dsl2gEOMFDR3t8/AzV43TZlUgN02q4y80KDsATfSWU25FLKV3gHxH0sBvr8wQ
         xaNWVz5uhQnfv0W+j0cxL5B2qaGIt2cDTOl/VYYhtoHy+cOicJajUFuhkT3BM9Ou7yrX
         /IBpTvB5aUHJjcuhSS88Ved8INVavOsx/EBlZIohCk+rPLIdvv84ssmKUUU+LtjeaV8K
         bnBhSrG0g8QDQxfdlytdKDDkwmXzwMqmHcfo3jvbV+ruxoaxUNnoOXTXCX0nyKYGg+ob
         W5G66TrgyLSQNF6450GmINM6mBJQv3qcZLGN5TWxj+p22cYWqZPaorlcNNQtOT08NIub
         6EkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mTMq5w9bzHJ6elUJmbiFTZf+eFCFaJsDYqOHAc/fLWZRpZ804NUK8k0V331und+kbRg6zOUOcmE4GWlzs@vger.kernel.org
X-Gm-Message-State: AOJu0YyoGslHpAb5BQ3NJ/vEdok3JCsQGymDhSSNcre4fTrIgx5YF9gD
	Idi/zJLlAQqGr7NJDB0evVmDiVswTsKfXEWuzV2F96oDL1E/OPnNz+Gig0hg2S2W/O490MJdZzc
	g9lpS+VQXK+EScTf3eRDYFV1m+Blkja28GKux8ZDNoNLgcfUG4jjqKC+eRrQ2SWnUnFMi
X-Gm-Gg: Acq92OELxUIY8Ll2RQZIZQX8ESi20rZ9HCexhrfbnpZmnG3D9lK6Cx+dJhbxI1K/9ft
	NN+KX+AyC9ALFPs6NYztyUi8IxmAv7USDLUsSg3BpSxVUJPqZ3+1wKY48lS8Xz43OGIpSNG2ph7
	HzWUFHlLMMEx3+ig1Ud3r2IZrUE25MkAdk38t3j0PMA8Gm9gI+ZkajZf5kdKyDV+cPRt46TXQ5t
	mqK9BzBSla5mVaV7Vmj08YH0mOsak8dHSQw45Y3LUPBzKEJWT9oeKZ2qwcotw7nGUsndbztVSgw
	p/SPtZ/Ieq4mKg52zNDxNcuHlSn+x+j3/9sVTEQBXjy2Xg6tbU71OySdW1bjKmyPut14kEV4J0H
	h1E9VyntAnIQ2kkFWZ+8W6s2S3bF3XHw7b6hDy0riQDhk/VgikBLVyEVmRgQ=
X-Received: by 2002:a17:902:d4c9:b0:2ba:4eee:6c1e with SMTP id d9443c01a7336-2beb037693fmr242316295ad.15.1779875038480;
        Wed, 27 May 2026 02:43:58 -0700 (PDT)
X-Received: by 2002:a17:902:d4c9:b0:2ba:4eee:6c1e with SMTP id d9443c01a7336-2beb037693fmr242315995ad.15.1779875037938;
        Wed, 27 May 2026 02:43:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:43:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 04/24] arm64: dts: qcom: sc7180: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:09 +0530
Message-ID: <20260527094333.2311731-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ja+Ma0KV c=1 sm=1 tr=0 ts=6a16bcdf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=tDF5iQw9XjyWUVTH6D4A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: J6d8iZNtbN-XAxK8-ima-DyKVuaFvd2c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX9WKwuhTBJkrm
 yRKOXqVet8kE17m1ywrDFLYDtAbQKD+gneUEKvnGJMu36UYMdqiuz6vvOvKmK5IJVWxSohMnLbD
 /Na8yF2R8LMvBlEfzq8SpHAZxCZY5j+cNQZHI/Ce70p6OmA0L/xHcJPEXQlCI3i/YLSou71MoR7
 sU+IuaBN1/7OVPxBEMfcAf79thyuvozr1bor5Dy7hA7MZymZRABR0LreTg7mqz6TExZgHgVyOjv
 yp/0ipw2i7rQ4ACKCcyh0BpD0NI+5C4BGoeFVgconJabRQlaXdDCKpB3tSu4hYYD8ccVdpQ7mSH
 +21Ned8asoOCZ/mrvPgEH66nMNnDK+g87Vsy7QEpTZ+lxb5Lrqa5qAHa7cuHo65l7nka+n9TqKq
 Y9ueQkG0wDXdHGamB9djAKcCXc0ZxkM8RujgkVFgjT22uPhe7mXybfdvOOqLwldwJwLWYFadxcJ
 LAsd6Gd0oIHgKdLOhMQ==
X-Proofpoint-GUID: J6d8iZNtbN-XAxK8-ima-DyKVuaFvd2c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109958-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,af00000:email,b220000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4ADE35E209D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sc7180 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 8341a7c4a4c6..5d985a48a62a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3510,7 +3510,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7180-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>, <125 63 1>;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&intc>;
-- 
2.53.0


