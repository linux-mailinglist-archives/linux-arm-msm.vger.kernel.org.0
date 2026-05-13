Return-Path: <linux-arm-msm+bounces-107232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKhwDS8qBGrfEwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 09:37:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D30252EC0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 09:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65692303428C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8452874FA;
	Wed, 13 May 2026 07:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcFh27Sg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uncjfpli"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E213D1A94
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778657570; cv=none; b=oUuOpTx4qe4VuEKD+VlWSjOxuXBeo9XQAwRXLHUfvAUVLkP2OEBg3K+Se0E79WiC/WMlRNeRg5WiCyfmOZb9Pl6XpZKuaSoXiEaUAb0gNf4sUTpTzdjAEWtpiTto1KeFBpOOqIyxc106XFR34YKo6BVzjMmvl+hvPzogPmeWN5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778657570; c=relaxed/simple;
	bh=pQgU2QaXkdIwBkCDq52VnyGH8FRn7TE/3ABrJD9FCLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pCD1ua4Y5YVqjZItNNTgaBJqQUFw0/GIBVUUopZYfSExb8/P6u+XU4vVQ0JuGqbgp+BblaeNWgcwxveDMKQNOIyyLFXiwiAozIhZWFNEdrFHG+kFWmJ/uTqmA0vFm2+g3HYGHBiGRKaa70QQDq9ovto3Qo2NnE/0Q3KWJfRvxII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcFh27Sg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uncjfpli; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pLaW2321427
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bt2Zs/rfUd1yin6uGJnZlg
	C47x1PEKUQc5qaZ41AcQM=; b=fcFh27SgdkzknXKv6j2hqH2Om6RiHnkguZzWCW
	91yotlBTXCkJtes8gfeK2Q/llkXnbDkvg/ujG4MlbUN76ijp9vs/8qj2vqLV3c55
	UziSCXNsCaTzdkgDRXsYCqBVX8CftxY3BdkI94DJFcEVOAPW483bboMkfAC0/B24
	wjuQKfn33raP6bDmR2hhvSkxpEjLvoq5cIb96MT14ix20QJ80VjHexbyMePc79Ml
	O7kHY0u9W3GWj8KemdQADC3/bBuyo8Ld9JPJglkbopB9l20wVywUpXw9Y1whtkB8
	bkKtNf0N1pYM8Nn5rwUqo7lkXZhrFpDBVqKr2TwGevshsYOQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgu8ta7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:32:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so4180725a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 00:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778657567; x=1779262367; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt2Zs/rfUd1yin6uGJnZlgC47x1PEKUQc5qaZ41AcQM=;
        b=UncjfpliARL8ObkxMJsjt9+JiaRqMbd0+qv+B81smh6szRzsEqDGBaE6LjLp3ouOm2
         MamDK1/L00uOOzBGmnZNGrpst9hiAIGNUth3XI04+EaFdK83KhnU+XHTNMnq5OkDIav5
         csniceV4ca3Znx23UsML4mL033oWsDbfcuFSHC9ZCoY/TLt+od+gh7mFidraYJk2kx/C
         s955L2Yz/lDWtrwjT8/lqf3PQSRhcNYgNeuf5TVaLx49dLzUp6au/1UiSNuoYvTKmRG4
         NklgF8ALkJFlivY/T/jV6GV5gaKiDplsPy5FriAzmRMjsgJwMXC6BvvQGJApWsX5NBt0
         CUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778657567; x=1779262367;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bt2Zs/rfUd1yin6uGJnZlgC47x1PEKUQc5qaZ41AcQM=;
        b=E8dIEnJMV0d4G9aG2vwbkEtDZLKM/RJhFIXGapWIghmZhOVs+a7NO/jB0J/e7OR7P8
         mBVIvYXMQPzwQaPAHPtRVvJoDf8rkvz9MnYqJExab3TQ+TdgAd7btxNPRaekLFFYQIop
         XMKR4u4XPi2glTc5CNSKJs8ZalK0MIuyr8kBKwXj9dl3iad5x4su2O4z02HiaZSNGn+M
         w+9mJ0wkXate/IH7PLY2XYWNGQmQ6zw/0aUeS3BeCYVH69LoFvv/Ol5C6ReQkE5hQ2hu
         nozsRpcEC6iWFsJSFUYo2jnBY6+Mbn8BIkrlZp3LJggbZ3Z0S1+tOQ7Si+OrFsK1fpOd
         NCfg==
X-Gm-Message-State: AOJu0Yy1MX4gr1XqwELrkHnv+FKZiqdYXF4OIbOKOc49ZIcoR740v/qQ
	59K5RbR3mBfTDbPOkhKpP1YOOsNoQ0PAQkqM/QxVXBofb8lLh3P2N2lG0gCgQJnvjbjEcE/H76G
	FM/srLMfFo7Alap9NF47IGoHk++1c8Qz3rD/5IR+sBVOhldVoWfnGKHoWT/7jZgvJrZcD
X-Gm-Gg: Acq92OHkfGYboDQrUGV+rvUyTGjZLMFMkt9eqwz9OqIVBjTVxYCC9tvLSIhqr2KX2kl
	Qi5N8mQzI9W5vG45CVpM3JkPw5IceSztmyeJvXUpFb0O3lQW27Hw7YcdD8KMVzxmbifKN0gjmtw
	UNGWUi0oLlTdxQ9AaI++x/Hj4WFV6SNP6r25x/iHd3aUTtsf+bQSORowrOhY2hIlNwHTPU4yy9J
	6ZWh7w2JP8cpYSwpRKNpBJ2iGa/tsmRBIratrtW0IhSXv4hCxBY0zKObjd/ro5H7OoXmi/wrY25
	5qa8QFDnq1D4u237yY4l9dfv4HYXuOsjGB4qYJ+gArMEn/SP1+4PoojNSMB1ABkLF0Uy6Zfifao
	hu1cPRfGwbP33K4mFxL7NQ+kfMhg6LJrbpV19AvU2NsZOGlPBzWw=
X-Received: by 2002:a17:90a:dfc4:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-368f3ab22cdmr2570543a91.9.1778657567196;
        Wed, 13 May 2026 00:32:47 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc4:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-368f3ab22cdmr2570509a91.9.1778657566715;
        Wed, 13 May 2026 00:32:46 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368edf90fbfsm2607593a91.15.2026.05.13.00.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:32:46 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Wed, 13 May 2026 13:00:58 +0530
Subject: [PATCH] dt-bindings: thermal: qcom-tsens: Document the Shikra
 Temperature Sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALEoBGoC/x3MQQqAIBBA0avErBPUMqirRITmVLOZwokIpLsnL
 d/i/wyCiVBgqDIkvEno4AJTV7DsnjdUFIvBattpZ6y6BFnmQByJN9X7VWuHbWgsQmnOhCs9/2+
 c3vcDGEv5mF8AAAA=
X-Change-ID: 20260512-tsens_binding-9af005e4b32e
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778657562; l=993;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=pQgU2QaXkdIwBkCDq52VnyGH8FRn7TE/3ABrJD9FCLs=;
 b=ehkaQAWg+f+hsPihEsHpu2HbcnWnsz6CDtGPXUH3dexDiW2aNTepnWEolarGnoT5ZfPV3bpLY
 e1I0b39kCYaDm2GVpbj3CvYjte9MCTTtsw2Q+P9ky1QWX3N1mINslxe
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04291f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FISNJrs5UlbpyYEJD7IA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: sbQCATt62kS1OwynjerAIqC6wRRGQRI1
X-Proofpoint-ORIG-GUID: sbQCATt62kS1OwynjerAIqC6wRRGQRI1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3NiBTYWx0ZWRfX7OKmoAkFy8ei
 62yen7nzet9rqi6B4eoqA/hpmwDGxwgqmV9iWnSyoRcUiDvUmJ2DRpE3zOzmGTvkVnvic4gyWiI
 vpRP3DB3gIVCR6TCaO7rbFebYsREsmduRHdFyubl0m5KLCBfLAiEAmLSlweudbiRQX07Slw07NQ
 n6wdvSzTnylNNtj4/Ce9vdYMjUS7l8YZae9iJQUG/lYO+QADVn8jth/8FVQ4mRkfBchwrrhKCSM
 xGHVHWqBHIlZmysqaOp17KqGkrsmY0ZIQ5fM6tf7YvqQVESOB8mliH/fYn9WjRolNzjhlXTHwZl
 ma3WCH0q1YrvFcW8TX3B/E+lJBZAK9HXWJaC0UkYLz56zEzMBAAojBcmvGJM0irFbhOeg9HxS8S
 7Rj+w9DcZC/xxUB/KZ35rJLt+UVhguZ2KgFffahLiXdgmdCCX0pwQgzbTyXMSry9sWpiHA54t5l
 YgSb8t66cWgncWdmxoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130076
X-Rspamd-Queue-Id: 7D30252EC0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107232-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the Temperature Sensor (TSENS) on the Shikra SoC.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 7d34ba00e684..a986fdccd52e 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -74,6 +74,7 @@ properties:
               - qcom,sdm630-tsens
               - qcom,sdm670-tsens
               - qcom,sdm845-tsens
+              - qcom,shikra-tsens
               - qcom,sm6115-tsens
               - qcom,sm6350-tsens
               - qcom,sm6375-tsens

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-tsens_binding-9af005e4b32e

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>


