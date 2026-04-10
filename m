Return-Path: <linux-arm-msm+bounces-102726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HreOs1H2WmGoAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:56:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E4C3DBB2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F0E1303F7D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38AA3E5573;
	Fri, 10 Apr 2026 18:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UuYGhYmz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dsPY9SuZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D1D3E51E8
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846574; cv=none; b=tIyBXWaR5WJELoa57XGmMZrgwxGWlVPxBG2HCKKXuuVzuncVxXumpngpvNG2u8H/BVqNIUloaBRt3mHq4dUGvM7RK28wKYCDQ6rAOTMlTix+1K4JsjI6UlFcYzqg3qBhGQ80Pl54fphTi/x+sKoBZPGwLr/VhDX23twF8fI8ub8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846574; c=relaxed/simple;
	bh=P0TktDlmpvOKVPYvrh8bHrNhgytWsjfjJ/V1q+3Zeyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPu0rmmw7GRwSzyYuWRQtOx2rhbzsCKRTi7HADdYhcWzro9qGNGxA+WXnJwAsicmc9TNdd6asNRQJPOlckk6eeDkuMQyLxoPVko9mtM8VmQ71/3kFRZ3Iwl1X8xumU+n+jC22gk8de4eYpNHROstlqyoS1bYLVgk9g3hC2Lytic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UuYGhYmz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dsPY9SuZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AGhBjm2047092
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4k5QJXqt1gM
	fbr5kaeKxlBrbdF0Ve4LiwaYRPuKNQT8=; b=UuYGhYmzkehYnTC8ZMquGbpjhVF
	Z/WXp5mNt/x1s3FAKmA3g4jN6Ya8LhzxrdSgtOMA5tMTaQwz9mcYQw7855XFKpP+
	rhfnPq+qQPIxlLaCa0Zj1reDJquMWW+r/X1esxlDQLjbMma+nZab6D9ICBJig93c
	v2gikeU1W2DmDb54lxDSuH7VKqQ0QBNOm2pQ74jfzvbw994ZTwIx8UUkpeMfpCqw
	GRBpML6IFvpld5Q8aDi1p8C4QlFWVR6ktqsVSqow9W6heJHdf74azrL4BwVXiT+e
	/6B3il9bjQgqQPhWcW/xOmhAZcVUKqmdzjguR+6VphDgOYxdN4mJaN2bIpQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey779jbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82ce1c395ccso2642741b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846571; x=1776451371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4k5QJXqt1gMfbr5kaeKxlBrbdF0Ve4LiwaYRPuKNQT8=;
        b=dsPY9SuZOiU3hP5wT+DWe0BEuEM1TgdmTMgbboRsQ7mrs1MHXASi3hizIoyhZHhftN
         qRPKgNaR1Ymtnm3dJfzNfiOVvMBcIEK41irnenR0OnGYiniLcF0iR5/oJth9OvcLHIWk
         7psMGL1WsWfJ1rZBV4jeuOXptJzjIACN/GFKBuWLWl9UsdORntABkUFTluSESyQp21xF
         hVkuVZXJTUZclyjGn6/h2gQ/yn+SrcTniSm7ar2QY3+T/E88+m+TZd5fkJtqwRkreV6z
         vOZgNM5A3BRXrwIGrGqUlCmAIdaMP0caDNU5qYgvI79w9w/hokNABiqc7fONgwnu5443
         /eHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846571; x=1776451371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4k5QJXqt1gMfbr5kaeKxlBrbdF0Ve4LiwaYRPuKNQT8=;
        b=m3F9CAjFJpVF7e4e2KiqtOtMh7naVx1pGCijWvVX7FpZAGvOarKSBVkxpli8kWBUAr
         UAAxz1tduPwU7sL69gM2HgkEu86Gx75Yw2RSqLTD6RQzrq6rTewv1n6vLtjQHtXHCy4t
         QZcScdk/cqPCkR9opu3DDNKBK7hVv3IuUlXljb3J1nezI2jrpwsWhFcqgJX7RnFKaO8m
         aoF8oMbzMkm5NhpmBybO+lYTPhWiWfstqaKG/LSe8h7pZ+QieP9wUQl9XPH2lzzkgayv
         Mdgz2oWzGqkTupjvVWP13DYUSIYE7MHl0vJ6hgIuoazYmMrKifLjBXGonVxzYIk4HUBK
         oILQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSq3JPQD7d0rGXUuFXjnCS0bJ/Ls/kSX/S8E+zPem4rlPvP0wtGGasztBCnEeaq7YxBIUGLE8gLGmlEPMN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzn0/42A63iJW7KO4QkicyVGGnjmXzbb+TUSYgzt1AAY8KNzRu
	3tm+tbNI2rx/FPTUoLIxML53tcYBH8jX5yI3vysvFsb0D3mRMqLHHDpxlKtRQBlsXjdI0hrtvyH
	HD4QBODSsl4ghaY1QHoNTn9KlmsMb1IiSsDT5jBxYzprRxV2K7ILTMOUCsWuVNkXfnC8H
X-Gm-Gg: AeBDietXsT75VJmLfk4cLzuJNI5bUHAWRwXuMR7EfAY3CMDQDMzRIBrJrmeP3wB2IM2
	xOF8LJzq3IME9a5ckNwpW+U/PWBIy7sAdyUx9u5VdX36cNbl3nmoOMgflqYPg248IHiW9AGsGJM
	/AR8yfQbkLp0cgUgeT8ORWhiYK0ieBksu7NKomsJnk5EJetaMIdCpzEL54hyhaHugP3idYwwbVp
	53YRYiH73H0HgqYz8Nrr4/0RKCV5JblzBt5dS9mXzQ7qmn/vPbqqqj2Ax1wl/pULFUyVhwus0zp
	/G11GT+hiffYkENdDWXQw4MZ5lo9hWAG+8cK7ABZkp5v5XJjTrJXWrxcalU4SsS6c7nvTyRD9UV
	AtiTKvvw7iBQ8JthC63BTCPiFIVzHQjzvMsI13WQkyzvcDlRF
X-Received: by 2002:a05:6a00:35c8:b0:82c:e83d:a9b0 with SMTP id d2e1a72fcca58-82f0c21952fmr4708611b3a.21.1775846571173;
        Fri, 10 Apr 2026 11:42:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:35c8:b0:82c:e83d:a9b0 with SMTP id d2e1a72fcca58-82f0c21952fmr4708583b3a.21.1775846570594;
        Fri, 10 Apr 2026 11:42:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:50 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 12/35] arm64: dts: qcom: sm8150: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:49 +0530
Message-ID: <20260410184124.1068210-13-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CR0EwuQAvf9xDWo9QRFgEByKEEUlfFED
X-Proofpoint-GUID: CR0EwuQAvf9xDWo9QRFgEByKEEUlfFED
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=69d944ac cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX+1X3606WJ7wN
 iNXMYS/NCfmVdZCtUhsBsp267FfylFIe6dtHdr4NuaCIbOuuki+U8PPJXkAHGaXu06VnMhTnABf
 GutSNAJgzusgQCXwHzBsPsMAg98Upfpc5xfziSs1TdZIRA8j1k/nVwoFA71IwyWGSGMOIfr4Yef
 sneeEULlAk/y1YaTGFzWzsJ+NMR2zhAlHiVgpmL3CFnuZvqtd6I/lb51eE2EItD+E/PWJPZNvsw
 6r8NySfH92zXn8/vO4sQtCyE9ojpUzMYuWDGvrNKVd+O/hrPhPJkqLRSf3SFLyzo6xsa6wQnQjY
 Pp641SmYj4hOIJETQqaWY6Tf9BWA7ChKp2qMe0vvNWbSyxXSNsbHNXy+UUDycHgqcA32CbifPfA
 uDqKRF55VkXabdsOZ4SaAy5tGmiHHwOOIekTeRJcpe7vWDxIV19xvaUljuk+5aumFrlt9/2pZt4
 LxjimMlTTwVdc9ZoRjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102726-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,b220000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,af00000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48E4C3DBB2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 97ca5275d740..805fa76e6647 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -4174,7 +4174,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8150-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>;
 			#interrupt-cells = <2>;
-- 
2.53.0


