Return-Path: <linux-arm-msm+bounces-113109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iLxhEEi4L2pIFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:31:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0756684899
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:31:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hr5z36h3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kVrXm20u;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113109-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113109-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC110302837F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1B23C65FF;
	Mon, 15 Jun 2026 08:30:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288713BED7A
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:30:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512231; cv=none; b=b6h48RGZNpDGWPAvD0FaSwSJhcb7+1aoJtaG0K4cpMD2GXy960yaURQmJrZ1POebgMfGuBW6lohtCqiVx2wwuOqWKxthWoiMmLiGirlZqLV6t3ojI1VXAjgNqBxVHGzCL2rpSzYMxB/DNDOKnOB41bFNBx8gUweNRsSqJsJ5FPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512231; c=relaxed/simple;
	bh=psRo9I9LgYzHuhS0Zxp6rEDZsCh2X6Q72/SFi+8RLY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TuzNITuTG0Ubm8kSA8HxUwzBkpQ7g2YxMJjHIOdnNBHfbhr7dIt5AQe1F/8IFAWU2z/8P1pwsDIkvCrpMtxEYQKtqVliJRG5rHHFfLfs3+cYD4eXeSumAnqHN6zuu0YimegsSKsbuV04JnrQayXLMt6O25whXMuMLU9wGQL+384=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hr5z36h3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kVrXm20u; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J02L3344591
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F5N2j98u08uOVXZXP7ZVfr
	yLKThl9JN/WOEyxMeafXk=; b=hr5z36h3E5+yLOhiRUlpcU/3XQUWfGEHZYogG3
	/Wzgnq0J3ntzA8LO2kZbbBTwwJAJ1WAipYkeHN+lcDWuftUfbTmUbLJ4yXOM8VI6
	3V/7pGuWlfwmTRF7nCR9/dcdG6fd+b6+C97olHwRbacrh8oQ+7H/Lzxqqq5NDimu
	WrzbRPUZ8RRBRUv/g0GdKKJdPvq4VmcJEFklLd7Pv8JNu9rs4nPtUFYNw0zfq0Y6
	UwrD2wl5oQ7NE1EKa8qUMTf8jXbX91vDx8OQPhmRnlbASZfeSNkimsaV3l8HEQBf
	hqfWJ59v05mMOexJe2IBIu7zeagXKzZv7kK267iLC7HMjA2A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9fedyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:30:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c858e0cbc89so1580094a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512228; x=1782117028; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F5N2j98u08uOVXZXP7ZVfryLKThl9JN/WOEyxMeafXk=;
        b=kVrXm20u2Nv88NFAxdQthZP0gZ4LUrjoAO6Ts8uVcuGmTBImjabnE1GGMOGaen99lk
         rVdCLin+D69uXYqr6L3n8xJeHByFIC9f+1gpIZ+ixk64ZBhcAvbFSqSzRbnuaLbUZkrc
         SF7hGXifTc8wAa6VVvT7+RErkFZ0XRl2mEYLPOIi77O6orgc9oVX/xGabx3iTrMjAvaV
         tK66cFVaWgi3vk9gNg18zL7lkaJKbv/U7zbFF2qgIrVabP90YFyDnKQSutqE4VeqMbSq
         YDzDDWoPhf7HvDpgFbpiPOSULDFXqS8nYs73TYOmDYKHm1oG61htI2Qivk1te7PDddHO
         V3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512229; x=1782117029;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5N2j98u08uOVXZXP7ZVfryLKThl9JN/WOEyxMeafXk=;
        b=P0uT3DafvlV1+G3Jig7wY5NefIx+VQHTvD8XLtRE08lxH987FvCe61P9883FxZUzao
         gnTAVCnSLZUGRs6Dll94NXxYipOuKLqIi9GTmwbWPwM0TFGJVe2kr0zUSt80QHmCsW10
         ULJszuMM2pC+vOWK4Iz4hgde3Z2SQ/vgph5d7APZdTtg9DInDU13YCGv3fPei2x91y+W
         C1lRmFz/0b1ij1w2MbEI1so6Om841gaWavebG6l7nAnNOA3nFJF2gUgz2y1zP8TOUyZV
         5fWf/GdHMDt5qRSuBSPMYJKxf/93A9ZF7DEj4h6brcfK3iEkRQ7/S0heRRINmlcIaJzy
         bKNw==
X-Gm-Message-State: AOJu0YyEk5tGHrwPZqNe6srAhUw+UE7A/aowdbi/solMLWH46F8qqQr3
	67woKpqkJ3LqrcwBRhX/kxlKO95B2ZcgENiMIOidXlzewj3EUotnSdMVSyl2B4ep7WXUTFXLzR5
	Ri3a79IJ5d5rdB5slwaL6e0QrRPJeCf/ZaCBBSEXpYRHKWsFzbKd25Kdfwd+p1fjGOopm
X-Gm-Gg: Acq92OHt2cbX9n3IZ/q3LsU3Wkt/KjAq4BG7JksqtkQpIXdQOwwfYVMzfZHYdWA3XDd
	1IPKpElSvx6oqNUOmzAZmGpPre3rKkom+BupfbxnNQU2B3YMWCNoiWP8A8h5MKQyPBhCPX8kdz1
	2z8wWV5g3ZpXr/gnHY5nuurET+WJnChLGfm/y8ugH0Sl5HxIAC2ymRf8AhWDPgtdr1P1gj+csiG
	um2EAzxsDdRgGCZN/cD87LcC7CEaAT9Xcb6Sp83M7e46uUbRXrOBSoY4c/1zQUTN0Va36biLlBM
	uAQAe2IIi0OTsP3ZVFmAFMjE6Pk7Smu1YfJL2IW8WtcvG4Ht3ajbbwwK8+V1Uo6skAPoscw+PpK
	Y1145R0JVWlD6S8H/sV92TM1gq3ss154hDaN2q/4HJRBt1InWea2TQEdOxE2NZRIpNs/a4mgn8G
	JgS08dqxRg5BgC2kU=
X-Received: by 2002:a05:6a00:22c8:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-8434ce42094mr14204997b3a.24.1781512228589;
        Mon, 15 Jun 2026 01:30:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c8:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-8434ce42094mr14204972b3a.24.1781512228128;
        Mon, 15 Jun 2026 01:30:28 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8fc7sm10075239b3a.37.2026.06.15.01.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:30:27 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:30:21 +0800
Subject: [PATCH RESEND] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Qualcomm Maili ADSP and CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-remoteproc-v1-1-67721b4b052a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512224; l=1901;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=psRo9I9LgYzHuhS0Zxp6rEDZsCh2X6Q72/SFi+8RLY8=;
 b=Rj65ynsu2FRjFpXQRmXgqWXaFD5ifNWAkaYnaY15Ueug8987ZtETacjkAjQ9TLfJHoV3n/baR
 YHGRA0GxedcDF3CJ2tbwfOJgTeiIG4KLnNXKCtBOYlLdhkYVKwWCSqF
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OCBTYWx0ZWRfX1Pq0JjeDSZsp
 46mfaoMZ6Aujs35ZpTnR9esV8XV3wCc32E1mlFoSSxzQRr7goNEht/w7NZHcL3HOj1hbhMufSOx
 gVnwVeXcUwk7SUcNh7VYMxfofgKHjwIyuazEu680BiZZbgiwLUxOyxCZm6p3NSjZlPNYvG+s+Mm
 Km3tGxT38MNPqm5i1aZ/B+gu5p7nbg/8fUhdt740ROylFZbxAXP//PDa4ctBRXj36IawsZeaidL
 QANyuMKfp8yORL0DrmSvsnJQMDd3zcOHOtY0PTLMh7hf0ffoWUB059FmAjFbkMsv+ibcuCMjmxh
 KBa1142GKp9HWr6UlBI+myToKldNFpksVOGxtFunhoOYEesoSAF6h/NE//zU23IB5g0tIO1cN0q
 gsv2MpVUd/u+mUy8XO7ry+lc7AIkaerrSRR3KQ9IxLjzV3WUPjrO+SapG+arB+HZLfuYh4VaKFf
 4ZHCKyDyL+xX9BMRfAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OCBTYWx0ZWRfX3KRoUJaEvhX0
 lmKCwbUuSXb3hfb/GWNE99Df7vos430dGe+0vNdvD1GP9JtysK9bDr2ihEATBLiLW2t5DSvWDS7
 bIe3PEe1aa5olRnyGGj1bVyxJsrCv14=
X-Proofpoint-GUID: lL5yU8OofeV1GEVRd5ciiOltvOl_GTQf
X-Proofpoint-ORIG-GUID: lL5yU8OofeV1GEVRd5ciiOltvOl_GTQf
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2fb825 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=NyR1cor_mINAUlzJR3sA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113109-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:yijie.yang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0756684899

Document compatible strings for the ADSP and CDSP Peripheral Authentication
Services on the Qualcomm Maili SoC. Both are compatible with the Qualcomm
SM8550 PAS and can fallback to SM8550 except for one additional interrupt
("shutdown-ack"). For CDSP, similar to Kaanapali, "global_sync_mem" is
not managed by the kernel.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 1e4db0c9fcf9..ead7a7d68f59 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -31,12 +31,14 @@ properties:
           - enum:
               - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
+              - qcom,maili-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
               - qcom,kaanapali-cdsp-pas
+              - qcom,maili-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
@@ -106,6 +108,8 @@ allOf:
               - qcom,glymur-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
+              - qcom,maili-adsp-pas
+              - qcom,maili-cdsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260522-remoteproc-9eca14b9a3ae

Best regards,
--
Yijie Yang <yijie.yang@oss.qualcomm.com>
-- 
Yijie Yang <yijie.yang@oss.qualcomm.com>


