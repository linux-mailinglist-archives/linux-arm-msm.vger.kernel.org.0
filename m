Return-Path: <linux-arm-msm+bounces-109420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sV8pN7C2EGqFcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:04:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE945B9DC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD7FE3094383
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2861B3803D3;
	Fri, 22 May 2026 19:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MiUUr/OA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W3kQk+ko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C555237FF44
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479766; cv=none; b=mJd8UqpclQ41++MXcjK8o/mbPumhDhsVmnk3sAV2N2u8TRu92TkmXZqFwh3q3Y7NMxKQG51SXBR+nN6CynDTQhBjTNzlHnuBXJynf9cxz5tDNn3gV+ygSKYGMQWTb5Pyq0Xfayb3c/6ZkxYVbwjWOrLf935s1p11fu/fF014L2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479766; c=relaxed/simple;
	bh=xohVw7WqqrOOFSZP7YKJSgmiB3NaZ1IirzBIZ89DlB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HHIOhKXrI/i3JroH2xAVhUE3h/wE2cYGADY5iSuTHITgOC67DRoFpiWOK8UKIP2l79nxP8NHCH+ypYR87EO8FYyONr//gQtsqGjct6DKjrNOYhEVxtT92psBSgC7jnioe7v7aoZolxOXUCsQl7UweF6m6YaNG5dXos8dKXJMjow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MiUUr/OA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W3kQk+ko; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MDpVIa2125155
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+C+Bsa59xkFVu9xkLSE2hBWtbA2batft1uO2tNDaWbs=; b=MiUUr/OALWs4OXuO
	hjI6P+X3H9h/PFFEl1TA++mdfKDEewgX2Ni5d7YOLOhYwtgAa1EqaKgXrEPFCWOq
	wQilzonc4cuq1J7SH0ldXAkijnaN8nP8WppjulimEz9Mend0+7K7Lv576oP0hDCr
	LDv359dxstzvTj0y/+X6YVSbRhntQhdICLzO9hfSf+3xEHbG3c41WYkhLYmoUYX4
	9HQudYnlLxc+USsLYlR1vXCZfnqIsEHo4XT6sl3GST6SfzyneplUQxa7SLqdAM2+
	DMatdIVZdFFIuMzz1mK8f8CI38HzuM3e13d9IaB207h4r258XMGVqVHYLHvzqQVk
	e4St1A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eard89fjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:56:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9b8137828so78284195ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479763; x=1780084563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+C+Bsa59xkFVu9xkLSE2hBWtbA2batft1uO2tNDaWbs=;
        b=W3kQk+ko1G1KH1IJQfybSgHsidgBQNA8nI0gh3u7vup6+JkHw9jKbKYozbeQfkFfe5
         FNqe4i1ldm+ysx3RH1cy8R/+Mm7oaeFtk22Nex0y+ifYMJ0AFTdgiFnCCrD2pG7i1C84
         MGAytM5YaJ9d9IGzPmvdzo9mUMf0taOBmTKdXYeGdlPl5wkeffuZ3/7GV4qS3N7n0zd+
         YUz8CCtZME2X7Lr+AQsfIU1gWuxC/UnqSCWQDIupKwWjh9dH9etfxLRH+sGI/jLZlrk8
         Bm1AOTrlHnX4I+stmI1n182ME8GfEgYbqTWmeZhj1iS2f90dkxjYqNjal7KLfRaDLwwC
         r5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479763; x=1780084563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+C+Bsa59xkFVu9xkLSE2hBWtbA2batft1uO2tNDaWbs=;
        b=b1VX48RrT/yW0BybWtlcKBnaC5hprZoyTgY3klepfLhcoiWS0lBcf+7HHPOIHsP1df
         erRSgMfUbZn3vI6IeQM0FFVq091LPLRvSK2WAdKGoPFOK6LxqFQeSrbP5x6cdtohRBLU
         fUb+jL5LIKPHmo/xSq6tlJw9RgJjTY5EaGUe8B29VLVB6vG5q7+DBIi2MU0VSiEhGqOI
         4V0015kvjPxiSULxSY5Y7wlYo4ME+29pjIai2kgeKkKlj4b+UO4OuI8gKf9qaZJ3pwyL
         25IiRK+hWUy3xRQQ1VhyBb6QWbTkIvdYLX3zhjfITbPB1ZlZifKF5fuJoFka136Eu0wj
         AWXA==
X-Gm-Message-State: AOJu0YxodWr3d4QFLL+brIngpIbA08cN+waGuCbiXQ33Uj2abxfE2VBl
	NSWmcQ4aMPj96k0numshPAt3ZIHvqv03g3ee6cMVE2tj3Y70X8g/Q58wkVXLtd2I1M8kn87wrn2
	nO/Fzd/J2X8VYv5P0Y0aGRvYc6hW0VHg+IGjIwdDyVR8tpC1gcpkx3/yJh0HK0jJc1lEi
X-Gm-Gg: Acq92OFJipPR07FnYAvwHW4+7otL/4FBb5tlZoGctSRNFTmHxDhYMnF+R7KNVwJ3bfX
	y4z7WJNb/pqeRobmu3pwvAHwbZZ3u1R6ZLHSeDFrWCNM2XoLhHXcY6iJsDt4h2e5sIUeRuQa7tI
	PK3mA22pQe306v4QrpDd05/5sSvh/K4OloU1T/eleL6JXw6YMVpMNIygKX0VcqzoIEH5EKzUJ1Z
	JuO7+sOVCOvuS61rCpIZYT8vcQ8Wcw8TABEb4zpISN6VhHWKa0Nl0gT8lYe8zeHNm6QNnvTXOTg
	C6hcwr7jYFRkLsP6QVDuWLY4uO6V09g9laPpwb2ijEWc4GYRIOy5D4p9hyOrm7yrFnXVNdTBsu2
	p6ioPfpfMOpx5JkJ8XZIp7mztyRdW5yZjzpkKTQ==
X-Received: by 2002:a17:903:8c8:b0:2bd:8395:feca with SMTP id d9443c01a7336-2beb067455cmr53984385ad.23.1779479763514;
        Fri, 22 May 2026 12:56:03 -0700 (PDT)
X-Received: by 2002:a17:903:8c8:b0:2bd:8395:feca with SMTP id d9443c01a7336-2beb067455cmr53984165ad.23.1779479763007;
        Fri, 22 May 2026 12:56:03 -0700 (PDT)
Received: from [10.213.96.151] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5914287sm33389355ad.79.2026.05.22.12.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:56:02 -0700 (PDT)
From: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Date: Sat, 23 May 2026 01:25:37 +0530
Subject: [PATCH v2 1/2] dt-bindings: input: hid-over-i2c: Add reset-gpios
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-1-5c333051e5bb@oss.qualcomm.com>
References: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-0-5c333051e5bb@oss.qualcomm.com>
In-Reply-To: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-0-5c333051e5bb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com,
        Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779479752; l=956;
 i=pradyot.nayak@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=xohVw7WqqrOOFSZP7YKJSgmiB3NaZ1IirzBIZ89DlB0=;
 b=y/GGlI0SWnPsoGz7xcS5FgDUZtghMO0rS3iCgRwi9o4ZbxViOwnjuEu8Y6EuSZsqs//lRr2+u
 xnSIUax5iwTCuPgmDuVxvPUGEMGC45tMkXFiTRLId0fWTGA3rxkuu2D
X-Developer-Key: i=pradyot.nayak@oss.qualcomm.com; a=ed25519;
 pk=ZAwwH8thDSb6bq4dCgFHWr80BqB7MmUAKogkd9BsiXM=
X-Authority-Analysis: v=2.4 cv=Fus1OWrq c=1 sm=1 tr=0 ts=6a10b4d4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=V4nsfvEclF_xFOw8guMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: yQo0ZdotuFaFdQleR16hTM7usrWZqWT4
X-Proofpoint-GUID: yQo0ZdotuFaFdQleR16hTM7usrWZqWT4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX/sl/4MnEGH9m
 ZwVqJ+APMx3fdI0K/IhuI4QDqumPzT3D2hvPghNpfw53/+WNaOs+IKgbmyKKW7DB1HYbjzjVGZN
 dRUPVkcE0FXJD1w60VsTLLsJT7ZEFcUeYACJU0KrdWnsc9B3kAYqhv0O8g7OerTvJlQi9LIL4S6
 xThK1XWU7hYuKwdpih+Kqesyc7kE16ULkHwoa0T/TMejm8UgeDidN0FYp0ur0H0DliL8ZBGNTqr
 573tZYfc1d0SH0d+mqj0i87Ot5JOwbwTwvlwhIaReF1gMaHl3REkTBX9NpS703D1FbDmNtZ3j4+
 kgbOuM+Dir6FFVC4d9/r8mz6MCDUG2f4j8wJXib6UONZcJ0fMkRNTKnxi3m0RJSvHvZOBmaJ2db
 +/spsNx++lq24wNLt2kuULIfeVZyyn7etCmB0YwTmeQRoN2PURbsLNdwuqmOxxjHRg5myVeVlPF
 +m6JKF0HaOlmH66YcbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109420-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pradyot.nayak@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CE945B9DC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document reset-gpios property for devices that explicitly require
the reset line to be de-asserted during power up.

Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/input/hid-over-i2c.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
index 138caad96a29..fe0ec4fce673 100644
--- a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
+++ b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
@@ -50,6 +50,10 @@ properties:
     description: Time required by the device after enabling its regulators
       or powering it on, before it is ready for communication.
 
+  reset-gpios:
+    maxItems: 1
+    description: GPIO line used to reset the device.
+
   touchscreen-inverted-x: true
 
   touchscreen-inverted-y: true

-- 
2.43.0


