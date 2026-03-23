Return-Path: <linux-arm-msm+bounces-99171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFszNFUOwWk7QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:56:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B012EF7AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29A94301779A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDD0388364;
	Mon, 23 Mar 2026 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCE01tvS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T1Idk/yS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F47C38836E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259427; cv=none; b=Nf0xMw1kfnmn4hawSbFigqCyUuU4DQVLWQaNB4x64ZRo2Xf2qiPeJ+8mwVBHWehA5E51S+UT72h5yxyQL7Di/sZqvCS0WLyMnbWoUfi/6M0oAcB6Kxw3Of0WtSrM/OS60NYkY9Tw4m2ylt39vBNteFZEciohsaBzAt9jrKecdR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259427; c=relaxed/simple;
	bh=0MADiRxGeDkPQDc+D4cOyR9YpPfqVXFTQN8hJDo+rxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=USMmiMt6B3zff7DWkW37eT8U8MFHFpbHLGLr+da/6jvcN+phYGOn755WDHU3bv7o4Qz/e+c8Ez5d1/iCJAMGIcTB08XaxTlqrX877i8PmU0FsoxhxC9iZhov0u4OzxInxwRtzPmA2rsTVsqQiuscrHEs5+y+GRP3K2aVYWNd6tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCE01tvS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T1Idk/yS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7M54e1200685
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=; b=bCE01tvSrWvcPg6l
	QuWF1UhU6fkcPrb2rKKR2EyuZkD4TsQAcY9qe2Yha37rHrs5yUofLu8DkCiEvm9D
	dpq/HOeVA3/pGFXTpbZabPu1ne3iJCZaMq88hau2VCY/41xPdzuvvQACaiEyjF0v
	5AP1YjbsHd1KLBaQGtPyVs8dWduEk7k5CbRooViVNu65UXnGj65y1NbGOAr5WjhQ
	Mv1cGL5UWu1zlKcAzMIuAqyakBqTnuaI+s7Qloi0oj0YKazRT8pPjQkTO1SzVKB/
	05t+3ZEjxQmuoj+0J8YrODDp5CVEdmEmz0eLNY0GCfUKxjysUrmxs2pGeNIkzGZw
	w+EYnA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5vt33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:50:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7380305a9aso3315110a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259424; x=1774864224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=T1Idk/ySlpQtRVHZUaKcAvTBlJ6pCx2QkL2145vxiiVZHFlwSP94G+Figmd0U2/QZZ
         Qcrnd6Mwwx+zBtVyt7ch+72nW7cL1l/IZGywwJCtr+we1bvoqLH/9OZAOR6aeuROt4Oa
         adSYvNicptwttfu3YEou40U8AxIfA/NPZsmltVH6flZuHagmVZ0S1SrCXth/7VZBZYhv
         GhWWyuW4HLkXIWTcIT0r7ygsGLFNiAMHAshxMdpT51UoV3Mv6PInR77QfqvQ2eHSSJbu
         2175HMGO9uv17SxfGrikGvAP0qtr9jl2WIVNJ4kfUdqTi7+fCQBwx2NWa7ByfXYbcC5o
         RbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259424; x=1774864224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=ZYlKJvyh2pNem8fEwGuTW+liccLK66Faj0zyU0vHxhwuHc5CVfn5unnN7c0aZxMuuF
         iux2uBOYflR02O0W/VAs451JNe0kDZWVrpgzJ8x/sapwpWj8jy7omQFmXMBoom7xsZ+z
         hisEvC3dMw0HVFQXst/rSY3Hy1YZEGW4GzkN73GPQFANZy5IM+eimQIbot81jcVeEnoP
         3pHz3tcw4fSc9TgnYNdRSkRRHGRaLWIUorBJ44XAXxYveEcTGbm4LZ9+OA6K1dlyva0p
         FaXSW8r3lr3YJF1VTbvenKsg8pvEXUvbYpui82zLmAMZM0Q+NqGOpTwkJyDW/6dK0jex
         fQCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVYDsGTAADrZrbKlf+6OX/DUJXH/0akxONxlMQQyHldrPu4iep6I1hxQCCKkiLKkMlXih2S2vUzqJWHkNB@vger.kernel.org
X-Gm-Message-State: AOJu0YyP0g7+SioSQPcCD5DLWMqqcvgNnCnsRKUKRwGei6kiZ86hxsN4
	nBYRmkFReYwsJdq3Noyw3en+JEIVKyBcvXCTqlOBGOxVrk7NFuZ4yBOtdo2VZmsltQO8AnpLeX7
	MQijIp/Ii0zbsdPIDjUZIfo/GqX28vQEwwAwHlKN+/ZBb/OWPU+yqEZmgTheylxDkTFlu
X-Gm-Gg: ATEYQzwkl9UPdeZD3QGFkfGHq23fs3eOwDd+pvTkn6KRn7ibYdl2YPReT2X3xgNoegO
	98SAtioReprOp2B5CqpEMtFCdF6/kOJlKcI12vQHASQmLrZ7Pnyn7VepJIQcxnFW2Ro32lk9Hlf
	4m2JEwcZkiVQeBSyE3N3rc+V2HmBN3M/pADxHEkzCaFckfxAf3St0Lge4HG6tGJ67a+gmC8Ldv1
	Yu+Cnr8kirPI2yFFaupZyeeWwK/5DrIaHYHKgUk/ul9Azq6B3LMXT2YxQxK3LouT2KwltHMEBII
	F/+HnMk30FiQSunVuDFDSVLn7qXJxOT2xK+2GLWt1n7qDOilHohIkerati96U3XLezM2D8FFDq7
	Fno3CBUWiL2H+Z7hixVye8UzgAfU2c41sg6WLkI0W8G2zCwcF7MUslAOERc97IOVzhLLtZZPbjQ
	4zLFHc2WCe
X-Received: by 2002:a05:6a21:e082:b0:398:71f2:59dd with SMTP id adf61e73a8af0-39bcf0df18emr9614574637.9.1774259424618;
        Mon, 23 Mar 2026 02:50:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:e082:b0:398:71f2:59dd with SMTP id adf61e73a8af0-39bcf0df18emr9614550637.9.1774259424127;
        Mon, 23 Mar 2026 02:50:24 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:50:23 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:32 +0800
Subject: [PATCH v16 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-7-7a413d211b8d@oss.qualcomm.com>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259384; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0MADiRxGeDkPQDc+D4cOyR9YpPfqVXFTQN8hJDo+rxc=;
 b=kKXIWKhLADAUr9KJy3p82eIWtpxUIV/8MOu6/roEzWF1+EwFIeX1+5C+emzLimc1QIZOOYu3/
 wo7Qb6HSAkUDKSzCHF9Nr51Q9mEUiuWPLEJIqUF/83MMsnHZX5bNQgP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c10ce1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX3F9qaPcqn/7o
 41OAX3AGenfobnzwzFi60uMR6GsGKhQ+7pFZ3H+P25HWFwGEGuKXg7kFp2wOpFMzFhLzSPoi5D9
 nTnVGpnV0EQOw+QpjNXfdqxR2fuKsiZtr+Ml0JAW3l1XC4aHY2YpUiglAJVoP/WE/Et9SpzwKeH
 EWAATXoCBzLC/pmFvObc5hW2sXTgNAkIT4t3kviS8msQ1kL6/7VPjqxWwKSZNxdqi483dEvRko1
 d3fyvNLQRKyhQPqksXwuVjdx1P4N1aOr0eSaoAMr4chew5+r6frPR99kUSyALmwOMxy8Cm7uUdF
 I5ykq/IR65uvjWf7KPWCXpK9/G4p4xJH4qOj9idZnpgXp6Ouq0r+jVioC58wf6GqoAatTSmMlut
 8I+pFrTl8xqE8/h78hhvYOlaJrc2DlN0WtvQMK0kLvLscRF9a/h65cVPHVIeQI3mDSLCVNl0mrU
 Tt1pmrNSNMXPvuareww==
X-Proofpoint-ORIG-GUID: DT_P91FKvSMATk3qNDie8NGYSuBCA8u6
X-Proofpoint-GUID: DT_P91FKvSMATk3qNDie8NGYSuBCA8u6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99171-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.61.12.232:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46B012EF7AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..e8a20789cd58 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2800,6 +2800,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


