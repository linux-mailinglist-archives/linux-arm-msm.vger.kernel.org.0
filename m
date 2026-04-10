Return-Path: <linux-arm-msm+bounces-102725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GEyL/tF2WlToAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:48:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 445F93DB99C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6D8330AFC63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30FC3E51CB;
	Fri, 10 Apr 2026 18:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RoCUvJW5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAYV/Mns"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862533E51E6
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846569; cv=none; b=uJaoz/w1/y6f9ugYCMrONi09V4dNQyLMlBI5TW10vGHmf7jGUvny67ovIVId3xiS4GzgR3anbLr0CYxZTDwWOqWx3G2aqQW9eExQehBOdloH/WVmS+H9jYauUZmkb5bM07404oh/wMIErL+fZrHKivpnz29dghjOU06cWicL6kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846569; c=relaxed/simple;
	bh=JM+iAspZzS1P9NSkiE0IuayTYjc5337vba18eqBxpDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CQPfi7Ynv4/BLmxc6KyQlrbQ1LAUE7rma8bQvlMHCstYxZGjMNtjhpOVM8co4gMYCOPCDC1egOKSSyA4kECAbuCRFdB7KibRu9lmmT7T5yGIShYxTrwudB4yiwZ3V0S2ZUOm1snP2Nk9AAAYFnAywbTzKFtfC3zBL8xIhTMdLks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RoCUvJW5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAYV/Mns; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AHJPiV4147982
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3029K6ZUJsw
	xLAFWZhQegntyU5RPU1LZo6umua+P11U=; b=RoCUvJW5GPWkhFvhQMCc0LAJmst
	ggWdNe40EXpSY5hJvVwugcN7Ivpw5pGX2pGIKW2YyAAwxToms0b66RlPEl5ZaSqS
	8Xq70bSAQyNwusjsgB45udMa5LBZJCpcy0Byf80n20qGvXxyo4nnXF/t5lVPsnSR
	ungmvIA4A3JQ9zjG1zCGnDgQ59mNfkgEcTaB6dPCgiijzRLd/DZp5YG0+jsYZo7M
	N87q+KoDBOhF907/AglUhbnmJkh7mk+vwDIBanzkoYP8j0K+hVpk7SnT0U7/IEkm
	xZkSpglFny7W39h+ayTY7Zmhibiyqczkr31rEQgYNRKHQ8sXxi7Kv4tOG8A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudgjhgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a88a2704fso1116142b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846567; x=1776451367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3029K6ZUJswxLAFWZhQegntyU5RPU1LZo6umua+P11U=;
        b=WAYV/Mnsd1RNaQU1utP6dX3dlliHoH8Q3+ikS/c84WuhCcbX61p+PGMCNmpZZ1pkui
         rV8P8sUb4FBiIf+0d81LtAZLOjwQwi2Zu0vdWx6Nzz7femAZyDWRYBleuiyfEA7zAf9V
         rJmm+tUzqEWjSxCc18zwdFRWez8enIKt/i1DD3t2jcWum7Vh1CIZ7LMiVZVF2Ltn14cO
         Gb65vSl0w0fp/qtDy9yMLPp5IhmepZ/F92aMQc6ZjkQwoLRSoU3aTs0nFcZdNmGyNdkN
         oyDeKYPZrHm0+9SPky8VhUTi5PGFg8LIGjLwColjGSEtr2I/l6i5cgGTIpEJuHzn6FYm
         6MUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846567; x=1776451367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3029K6ZUJswxLAFWZhQegntyU5RPU1LZo6umua+P11U=;
        b=FoQKTKyrGAF29rFV2HhbEGipSKs7xvVN3q6BPj9iblvOxr0tNHzsa3j1qblTF62LXj
         +5PdUd2crXdcCf+F72faIfSAzlk2Gsz+vCaSJ1bSM9k2SjaAsVqBp+hO+tu2XonjMr0n
         farG17I7MCEzEDef4/JjJ6ejWuRiku8b06ZaufLzO5taVIJIaseQMej/74ZX5ljCzf08
         V52nJP1iLSuYH+BLkMZZpnjPiOn5uQWFtNx8bv6IK0LAzJkAfzojJqMl+jJnR2zEPwIu
         atsujfa5WsjsvYiYwPwCgS362NeWrQueNBnwHb2fFDIw4jhusagvspJEGhP7sBWVDYF+
         UShg==
X-Forwarded-Encrypted: i=1; AJvYcCUvn/cRYTsTtPMXOfcbR9qdXyfxMllTuWUro860ZK+Eau094NrgAgkJG3fH1uLLYTYi131A4XjEg+ZAVDw5@vger.kernel.org
X-Gm-Message-State: AOJu0YwLJUMVMKYpwcSetR7P24PN1e+XyxtRYIFYk8i/Vds/kJ4odm4L
	+zo67ygShfl/tuZvxX455NjwCfVj/l3titJuPViu249yRHnYs+xUucFoMGWGGDQC9WnFE6Q0V0Z
	yWrQ9npB3hpNaxMI1bHCqkagIjVdRvAaBOQ+H4M0nx8tdQnU65IxiFHD0n3Uu7MpO3rJ0
X-Gm-Gg: AeBDietHEGayg/eKfufyUWuHmWbsTx8rArKphPw1hdbpsAEvexIap+RpJBPLJY143a0
	dJbRAaSyI1vOPvupBEBrn7AvQ8Vh3jJrGgsAhKdjUK2HiaApsuXEpG18lxHFrlo0SviloEB1TGW
	DPmUDk43hOQYOf4mvJgrxIX+/ikJmRdzumq8jIPYU2T7evGisyUzLCHtk5gfooPzmuB4mxBvpTx
	9bj8kV8xBonvR4jzuQqEUo1pYSmeXJeSATRX0WytyRGg5D3s/QAkAqHC6Yb9ekKgrTCDfDRYJab
	aMeG1BVkfemSa1LzlUXIsjCZBqfNccB7v9v02XDaP4pVm51HEcQjeSKaO30oYJa9LdB9sRCKRQx
	MFb7esQWeULL6ITKPNf7rTNQ0JoS3Ej8iT+VjYODddGDVS7Ch
X-Received: by 2002:a05:6a00:4c08:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-82dd8a88f10mr7750920b3a.13.1775846567226;
        Fri, 10 Apr 2026 11:42:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c08:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-82dd8a88f10mr7750898b3a.13.1775846566690;
        Fri, 10 Apr 2026 11:42:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 11/35] arm64: dts: qcom: sc8180x: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:48 +0530
Message-ID: <20260410184124.1068210-12-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 7RLs_2A36MZ7EdZXTvbM8YheABPm-EpW
X-Proofpoint-GUID: 7RLs_2A36MZ7EdZXTvbM8YheABPm-EpW
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d944a7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NSBTYWx0ZWRfX1McdJr+4hwIs
 sfu2fMJq+YQoWmvSTu51b5hKpYxYQliMEvRlUiwxuoxOug7Iu1SHb9S01QgUGZaMipNFlLis0ve
 20d9wVu1F85jW5hrguTw2aSe740miKqTlo29X0t5xAHlEgkWIcIKBWz/OXXTgzbbLsK2BYLlyqq
 ET8LU9FMI7uZ2K/kwa212gftyGolaEQSxtTRFGDdiKObKfVp9ZETrcZVTwzq7bjwy8IEBmdxtm4
 tj0+fYmTkQp2cletuiMbl6jhowQV1RIyF8RxDmgkdfk/2xoRCZQt/iZ94GcjaPFCYA7mBroo1pi
 Hf0s7GJ8Pagrlxq6uQHu6V7F4Yq5rNvakZ3RL5Q9VFskX5zyRbz1y1uq3tCBVcR5Ma58zj57Qyb
 HP6Rp+MXfhREz4Q8lBBrAUpYxetnsUyYGT/d80MYoOk8UmENFIaqI26w/bIfoed55pvz9VHLGCb
 +mtsnFn9z8dS5reEdpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100175
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102725-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 445F93DB99C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 8319d892c6e4..319b93c66107 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3554,7 +3554,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc8180x-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&intc>;
-- 
2.53.0


