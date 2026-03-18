Return-Path: <linux-arm-msm+bounces-98409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNqnLOyAumldXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:39:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F822BA0CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C7A7301116C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE3018DB26;
	Wed, 18 Mar 2026 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jX9JkzBD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFsUSyqv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6498F373BE4
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830378; cv=none; b=CqsvnHJ2y1h2XplsP7K+H/e+ZWMisO94hctuPWgYQVCjA+2dFSh8HkF24NNBt6sWkQ4C/dicbJY2IjzTZAw0HT8xR1amapQYVTEyj4WNI7ncdrFkvy2sldWUyxioJvJjWDG9si1HXYJhOLDsFq68qkzBktP+1T/1evE8wLSLKXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830378; c=relaxed/simple;
	bh=401D9kEmKTyHpPqYAg/Z/Qf5C2yosiphgkzy42eCnGw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Da/rTHloneCcotTzUl7XFlS20luLQS0XL65lm1fyr0tMrauW373xjxH8aTY9T6n6vu1icUvI8i42nBD9AP24fbJwLWb6lbs7Ghrv0zxueMCdktGaEMIl/fFTT/koxN11vqBVI+yTcmMfM0KJdF5Cd+GsKsib3rhpZMXN7eNzNWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jX9JkzBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFsUSyqv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9FkfB402681
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NOT11fLBhg8AQfpgLgkRFQ
	5ibPvIj5FtpD4Ln8bl1q8=; b=jX9JkzBDUNbkDtRL+y0bw+dF1UVhPzIqRopcvg
	xIeCiitkKkzTv7d7pEDYR9DwPZwnfX6I9VMfLdsT26FmlZM5Qd9aeE1bXw9dfQyA
	kk2n7STSl7wpp+1P26wKnCqes/H1zIvzBW9K5b5vUhgpy5lWwMxP++vRfxbQaA+Z
	K8r/LqwkvlUlnhaqIF3a2on6EdCv6X5dEcLB/lWhLsNtheOee/jVBQ3TGwdpOMST
	Hwe8mcLqO0u19y1hXn9fwv11HLTZGzVOQ1YgArxoluPNqk/qOmneE4qZ+LNlgqHj
	msKQ8QHIl8xIwInp3XCktwLQF//Pt9QlkA8JPtrxfk5V9zzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4dubx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:39:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094ba09affso4432891cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830375; x=1774435175; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NOT11fLBhg8AQfpgLgkRFQ5ibPvIj5FtpD4Ln8bl1q8=;
        b=EFsUSyqvI27imOlDc8pgqlzTfAzan8JqPTOyxbgg6XCrmY9N81ejyElEpRaYsmncg+
         5lZjUf0XQWnnOC6ds3iZxPrrMEl4oqrh6g6fo8zoMpUjV1dV9ajbmvg+Xx9MJ5Hn6bEY
         4RJNzpXg1j+n0bdFQGiB7MiISapmH999ep2mk1U2e0mIo7Cy5H8SW8L0de3ZCUjHs6/G
         NheXcFmwGj4ZuS2/3/XUfCen6Oj3gy/pTKkVV3RbQXkbsAQbNBTSBusJjWuIyyz9iXPN
         eU6ksDa6DhqVv8eLQFbOJb98qNWjUVn5l2wa7yXrfcy++bTaZqM/8bXR822t/sc81mjz
         fKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830375; x=1774435175;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOT11fLBhg8AQfpgLgkRFQ5ibPvIj5FtpD4Ln8bl1q8=;
        b=Vck+v2IaMoDaaW3ZQ4d4sgkbWLRod/apzQ/j4flM41EXLynhyW4UZARs7UYP2DduG4
         08DMzALVNZ85jMlXrdqPcX023s3iUw1ENHw2Bimaad5tlREV0ZM9y3ndEs2fs0cs4szs
         Ked3yPE4XaxdV8pavKsqqaNTqP8Ecz24Pg5S+wbkb8yJD56j4gE3H9u65HaBJDNiRWOJ
         lFrBL31rLUIfJsLz2UpqEWbjUxB4XL2Jn/FCjsp+sqpvhCztePoK7KjGtNx5KZ5Un8jt
         a2Ndw3gnwusZYsi34vGsahCErccuz3NBQXjyTdbWFjDyQkRRc1oRS2ld4CNg59rbfRZB
         OM5A==
X-Forwarded-Encrypted: i=1; AJvYcCVBRVgKoEuxT1IY/7LTUNif3Lx8uRT7Fjk2YOKlJqXIq7ytp3T/zAelxQVdKwaDWEEOWDOHEVmGVXVVfa8A@vger.kernel.org
X-Gm-Message-State: AOJu0YwwW15zXP9K2mAxuhdJPaGKVR9Y5X2HCLfbbaYVPY8ZOFEIzZtp
	WfE7e7W9cb7apa+bp10kOSvg8UzOLRUPjNTVBehaqyrpqOGY1dUBTpHKbqSwUKVdavxOmkw9N26
	c/glMm/11m2z2V1sx8i9/enFtx7Un/oZ/WsHY2T+cbTEDYp2IFQwx5jSXPpcToqoZx3VA8sDBzM
	7C
X-Gm-Gg: ATEYQzz1gs8VpHlPRqj08ff5HkAwMr3R9+vaxiPwiVsshxciiARidQM8MXAGpPVq/5m
	YUW0V/aQ9sTuGducs3ooxYsAKBaWuhjD737TGcWsc+GhZm1RZHn1+SYMFW+U/HFqc09zSKMBIiq
	/kKZdr7Dz4qEik2M5DkbSzo+P3eESmJCQQAIhMZF1C/2UDI4Ot1L98SatY1rNBq1d+phquDnKpD
	oHY/d4Wa/7Cx5OvBvmy6D6WpM7V3+/N56cT6BhuCnVlJnUa7B9kqpY09zfJCVs1gFULlITTxk04
	Zu8F+4DE7vkE33qLsY3GGcPNbQfhgSa5WK9NbfmbSkbNLJHUHQU7FP8vhcnR6I+Bf/FPPCKRufp
	lqqgqKlPWTM8uLfCeeoXrYqcv3sv5zrA662QQfFmS2hD5
X-Received: by 2002:ac8:7d4b:0:b0:509:39b1:d4b3 with SMTP id d75a77b69052e-50b14894384mr34921111cf.47.1773830375618;
        Wed, 18 Mar 2026 03:39:35 -0700 (PDT)
X-Received: by 2002:ac8:7d4b:0:b0:509:39b1:d4b3 with SMTP id d75a77b69052e-50b14894384mr34920921cf.47.1773830375195;
        Wed, 18 Mar 2026 03:39:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm7300906f8f.21.2026.03.18.03.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 03:39:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] clk: qcom: Add Eliza Disp CC
Date: Wed, 18 Mar 2026 11:39:08 +0100
Message-Id: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMyAumkC/4WNQQ6CQAxFr0JmbckwoCSuvIdhUWaqNIIDUyUq4
 e5WLuCmyev/fV2MUGISc8wWk2hm4XhXcLvM+A7vVwIOysZZd7BlUYPvbzD5OEBgGb0H6vmDEEq
 Na8Q9htLo7Zjowq/Ne26UO5ZHTO/tzVz8tv+McwEWWqpaSxW1rsJTFMmnJ/ZaHXIdplnX9Qv/t
 pmfwQAAAA==
X-Change-ID: 20260317-clk-qcom-dispcc-eliza-d32607aa5ad3
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=401D9kEmKTyHpPqYAg/Z/Qf5C2yosiphgkzy42eCnGw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoDfJUvaaPM9UNFdk/uOXkmcGqwHL3YOrdYOI
 eTEUwbj5IGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqA3wAKCRDBN2bmhouD
 1y54D/9zhxQDhsiAgKlDYSGau1xauRpkoR3fsRiwgGic5q2PAvGOyPnZLy3yYxrK/cbg4kzuQpC
 u5xPgALuIP/nM87VZeWOsSS8enOevYhEpGrFleQwkffJR3ftuWC4KQSQ5TQYsvS3GEmN7xNbCP0
 KvONS37HdTAaHJalc8akveeYjFgscYiXOoqAvqAgCpqHYUpSk/lNiIxrzBHY+3HtzVYJNdHoXbc
 3Mp6FuQr9QOfcTEFaxIiQRnKtj0euGMMh8/U05g9ndhYlPUvzCWxVG4iRMf3G/HjDVp9ZFbhjDZ
 IJfbtq0K1hehRDjK9XG/bhuWgp415yzIRRxXeTmXUhyW7DgzSX97EfJRNS1UxJcTKiojjRDRMuJ
 riG1Sm2AsyVXU8oJY3A/Re78dKc5VU8AW8s/834Vg9hv+hZx1sSSOZS2HuZZpNlwPqxgK6lISic
 5NWdd51Rg6f4fvqAoOmyF0K6cCegzLZnvb6DEDpFhvYXLywnluY+OCCm9E1/hjSPH33ApueKHy3
 VS+i2e1mVQ10y7w1sM5ZlrI8T1IBVVCQmIDaqLqem+OJA01czm0LXs6eEJ6CuMSoZKq4JRgZT0k
 YbgMCmD664OLFf63zSVvkESiRPY1rBcTcNRhhNsN0np8nJVkZ6o0kXf7eQZZyKrDtJAzEaCriLN
 BzUuEMh0PtyxJmA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfX5xWTKdqMUeP4
 h4meB77X4gj1UGgESla/mETxEumZoIYqEUNO7F3pAOSG2b/oSOw9UyxUl6rBe+78+nthSjhXjbj
 /l+aRd1+iKO1IKT5u9XcoOsIWUo8bzj0tGOGQVk5FKLOC5DPeuM2h10tHlP3FmQar5Xe74V/YeB
 SvTgELyXep1fbmytalfneFh5nHgDcNhZGTqNNcK17m6Gp29I+cRaGUsHpAHcQU2HtAztxVL6Rth
 BxTGYYNw+tyhs3ic559qJGDEZfqsYLk8dieGVgIMIhswH9i4ZZA+ym1bkSpUbHIS/OJ2wDXbxPB
 3T/i9UcPLIIrumKyELc3IpanHckKIqoZQ1rYCKqEX/21fFK2na1cMcc1JwU04KEGxxZcPZSzBhG
 YklISMIfVblinhwvhK0DaB0VYL71jGIexKiiaXpvatKO98ByLKX+EhgWCZ3UtS8HPcINPaQUK1x
 BhPBIo9/De2ZvD0cddg==
X-Proofpoint-GUID: E_53As_DBvzBWGHeBzZj8npUCwSHs4Lt
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba80e8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=HbYsRfoLwT6iNdaUn4wA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: E_53As_DBvzBWGHeBzZj8npUCwSHs4Lt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98409-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 42F822BA0CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes in v2:
- Patch #1: Drop redundant descriptions from bindings domains - use items
- Patch #2: Use new qcom_cc_probe() syntax simplifying the probe.
            Few style nits.
- Patch #3: New defconfig patch
- Link to v1: https://patch.msgid.link/20260317-clk-qcom-dispcc-eliza-v1-0-be4b0e4eb24a@oss.qualcomm.com

Add driver for Eliza SoC display clock controller.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: clock: qcom,eliza-dispcc: Add Eliza SoC display CC
      clk: qcom: dispcc-eliza: Add Eliza display clock controller support
      arm64: defconfig: Enable Qualcomm Eliza SoC display clock controller

 .../bindings/clock/qcom,eliza-dispcc.yaml          |   98 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/dispcc-eliza.c                    | 2118 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,eliza-dispcc.h      |  118 ++
 6 files changed, 2345 insertions(+)
---
base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
change-id: 20260317-clk-qcom-dispcc-eliza-d32607aa5ad3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


