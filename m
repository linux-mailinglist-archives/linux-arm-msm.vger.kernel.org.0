Return-Path: <linux-arm-msm+bounces-92733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hsW2IIs7jmnABAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 21:43:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD33130FC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 21:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A40E83045010
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 20:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F33326951;
	Thu, 12 Feb 2026 20:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hRjfpfm8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cajQSbRa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8553318BA2
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 20:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770929031; cv=none; b=RU0Ayj6QQbvZWd8Pv9eCKkvgDtNSm+XBqLCbixDHDBGznaxeHRoalMcKrwQ9KkdVZ2g0M00Wu+cFc6SweCHjE1RdF6xwSaS6aR8yJPurJGvjxtPX1FeHSluaBKIHYMf1EqikHCY148l57t/92D1FA+9FNPyK19fgs3gnl+w2tRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770929031; c=relaxed/simple;
	bh=cRXaesaAhAhF/ZqEIC0EeFKf60Yw//q3KSETfUZVBz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HBE5Y5W8yepVzrWmj6apizrmlVwlJ/gAnjU0vSkcoEK/6xp+xo8mY3MEk1n23Du+6OQQO6oFjputaA+RCvI/YV775uSM3iQQaPhZ4z8GmpcNt5SyB16gUzo5+rCx2U+fNu6k2LpPOjzWb2paOEyp90OyR5LLOogsTHFIT1bojgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hRjfpfm8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cajQSbRa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CHI7kc1845190
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 20:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TL6nqhX9d0txFRQftxiX53
	bFVkFUmsqtQS5ykz32nE8=; b=hRjfpfm8e2WoQ3W9CymdjPGLXN3R7s+n7VYa2u
	sMpHQ7rvTaLVAsDRFBIDtSEMUbvsbjhFjKyNM+RdrOWIv/e0awKNvMgTy66F3f14
	t0WQTY0QS5aeNEY502iDiIaGl37QN6HL2Io745PwhfYvN8VTAmhSDKbNgau/Rj4d
	N/tju+24Wav/Xww+0KkIFlf43SARci2ZJur4D0LL66klDmUL7jOWVQlgrzb2KyUK
	Ha5aM3+cM/43SNk3x+6Qw0J+HTMIgfVePnL/gjTQpJqpNKJ6KH0VdxmJiQ18+WCh
	RQgP58pzKypemKLXqN5eYu7ORamyyfzWEVD2g2hxJ6yuiz5w==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9k4w8r15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 20:43:49 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d4502a80d0so1521221a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770929028; x=1771533828; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TL6nqhX9d0txFRQftxiX53bFVkFUmsqtQS5ykz32nE8=;
        b=cajQSbRaJfzGxlA8qiAGcywdXtXi4i0YFkc7c82eTey+MDu1z5jeZSoctqPVSd3CQj
         oLk3NuC2Mxh3+NmkuTBULuWxRAxJrzlTlHefd28CVarlWMQaRPYdrZvIv3LVzr4hxEcu
         hwY/df2JUU2pAGPLZrNFKGXaQHB2PpwlJUy4jVlr+jVbVXs7X3fKqT/qB1KoWaaL0ufn
         hvRLvILJ5jkuLs1KPjhnnLc3IS6xJcDoawIL3eJcCyCUn/XR7RS2mUdk2CPaVL7TMarn
         PkW6Ay79gEJwrND5kMK0MNAEH3GUHmdjI/OQtCtAcOZ4ucnhYIsufQwDSZdZDOpNvrxV
         Di6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770929028; x=1771533828;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TL6nqhX9d0txFRQftxiX53bFVkFUmsqtQS5ykz32nE8=;
        b=tJOvAscw5J0L2YgplRNpU3hl+2ZSDs4gF7nQarX6k4JS04NtgepfYa0XlnQGyO6QJM
         yhFLKetFQy0Rpy3nVqN0WZXrbxywTCFs8qaKu6Fmepr+f5qHrVFsYHkTOYjYTjCSaOCr
         Rq9bkdCOFbAbjbGuNlssaMYz5iYIcvQ/OiQ8xVW5NB+wecHqRYnGtCw81AcW7mo0caUt
         THtP+DL1a+Ch3qRBOSpJniMu/y2Gkhu4wa4kGYVLPTKy0aVg4+RgroFwO++1b5HPp5l1
         WGGfHDsJ7Wgmwl5x8bAiI3dPfR/uaKL1qMRbyj6zFhUqCAuTpu9YZ1uW43NOfyQETE1u
         Ehbw==
X-Gm-Message-State: AOJu0YyG679aHDA5ilZgB4PrjEHunBpD25iwt4uZ4Tt5PGfzOv8mhmsY
	AglnnYFdxpA1g6laVryWKMHt/NnR3tg/rVbxakzyM6+VFjR19yZo43q8NA24tNvgW/OoK+OdB+r
	U4cSpb1LHIIwWQpg6H2SGEBG708Np7P9XbjlLk0YJ4foZs7dq7fMj1QXZLRhH1XR0KcJH
X-Gm-Gg: AZuq6aKwiSq5Fa+JdhsE8lWyfheV77cxlN2qYaPBbFGTcv+qy1Qy1Js3IeFUNrghPvl
	sdXFxhX1CVBklD1qTrOQO1TQs0mbOtHs5sG8ZW+fDNEdHF+HrQLllVFeA/mMsOkMw8B2U7+gZXq
	nw2cm53VNh26aO2XlA4gq6VwJKTHOk3dqsm2ehNxMX2LCaZgYLEQnhbNolOgsN8Fo3I/WyaBV0j
	xVI4/Vj/93WDTUVwpmNqo6ONPZ4O4xHw1ognCG/PW622vZUViXE7JK4jIaYlxrsvnt3fIo2Wowa
	AgmTM/c+kSSRo4RPRPZE7bcvm5fNq+bKAtqIf88aEuVkFoRzpQMs8eVKQgQDYwM3KBvov4WN7Z+
	RJLDKWbUKdm2vfIbnCF2l3w08/CsbdBNT20q1bcHqPeX9pHZ72/ny/Nvf848tXrFjfWbb7BcMyW
	Byg7O19EdVsTQDDf8rPZnr
X-Received: by 2002:a05:6830:67d9:b0:7ca:e8bf:8c4c with SMTP id 46e09a7af769-7d4c300c4c8mr166544a34.12.1770929028139;
        Thu, 12 Feb 2026 12:43:48 -0800 (PST)
X-Received: by 2002:a05:6830:67d9:b0:7ca:e8bf:8c4c with SMTP id 46e09a7af769-7d4c300c4c8mr166519a34.12.1770929027615;
        Thu, 12 Feb 2026 12:43:47 -0800 (PST)
Received: from [192.168.86.59] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a754a764sm4425862a34.10.2026.02.12.12.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 12:43:47 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 14:43:46 -0600
Subject: [PATCH RFC] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260212-rb3gen2-upd-gl3590-v1-1-18fb04bb32b0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIE7jmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Mj3aIk4/TUPCPd0oIU3fQcY1NLA90UQ0ODlBRzI6NUwyQloMaCotS
 0zAqwodFKQW7OSrG1tQAFPiffaQAAAA==
X-Change-ID: 20260212-rb3gen2-upd-gl3590-d110dd722e1b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6051;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=cRXaesaAhAhF/ZqEIC0EeFKf60Yw//q3KSETfUZVBz8=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpjjuC6rAKT71NAlJ/tfUeZSGLE5F6enN98hf/7
 lnlmelBaXyJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaY47ghUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVHTw//aCyVdiZfg7i99pU5yKSyNK6FR3pw92KmKn1Qb3+
 yvLgDzs1mI4FoXke0NTeEYrHu5RoG/B4kpRKp8ypxyVw/BTlVgPgBWz4jdVV1cxkg2Sxnoeqf1h
 0+pd9oI3/yvWhx7tCcvAHYJg5dqwYREapJO3QjLtT/Jjqnuza3PsBJtHfKwOUkNJOEWVyIB5pzV
 EmuZrJLg14k51EGGgd9YIrroZf4JWh6QQlBFTMR1cHJ9X+4NyS/qkJVaTD2vgEBANV4KVjvBtGG
 si/gyHPf1px3oYl0K7b9SHl//w7po2eTMUt6gTdn8y2kiLrUHbD6ew9dzOLKh/HOmRFbxHQQ+Ab
 FFIsAgltDrIlGNH0x3wJk4i+zOX9dB3XgwuDNzYkfn94Q/fSxvoj9AJtiIHJyKoYVDSHoCB8Pg2
 bUcfD6wZmnmciatXdQT5eEHi3tAdxvjytXX83REQu4bWm20NaRGo//u0ue1mPVz4MsB/pVFwYO2
 J/s7lzW71WOHVbwWmYqKBVHnsPs3MNDp3gqLGTk8ImUVpngz1c70vJbJaX2SMmrPkz0JeOQ8dtN
 mmjgq5K9iAfmXTMX4e5RlKdKWmL/HY1QoISqPU1O0zGavCuhjeOMsQ/bzoXvNthl+zz9LJhQ1Kv
 rWkU62MY/s8Ne1MCX3GSzmkNlhMhhoLnSrCCWeNQVeV4=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: SSfXKysKjqEwDQjbYvzlKXae-wMOAKJT
X-Authority-Analysis: v=2.4 cv=bfZmkePB c=1 sm=1 tr=0 ts=698e3b85 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=wPgX_SVg2nzTS3YuhroA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE2MCBTYWx0ZWRfX7WRXgyJI1fLs
 9aCyDx0k9bc4GYj94zCDxlnXeS3r/tK90ljNXuIGSuDabMSfEZxt/PTV0V1ANwpFz8plsvyorPA
 gfVzUQT6LMw7x7JWAS06ivbN7SHHyi4ReEIMqftwtQl48x7fbPdwdR89lTgyxndBxAegmWjv3sf
 d+rqWmuxSw06SVyHVKifuiDthg6qWvQuX3NE1gDGhVzPQnOrKg1WDV1uVny4Y5OyZ0gF3KroFSD
 yW6cQlert1IY5Fj1TQejw+TcirvivqiIxf1ocUZ79tUXwtkn6VlkgNKJhHv27qduPOS6Ijxm819
 6x4kxF85UZXc7Hl6ancdEaeo3ll54Iq7iAu9BsjE2OhFQ5RrX3kJ6NshgJtevnjXnfqhPX27Z7V
 5ODZw8FWtET9HYTfrQRb+zAsCzwx2g+q26Iuu7XwyMs8nVdCis1gOWgypojpS1sHnKOjbEGaia0
 2m1tHgdh0zObU96VGwA==
X-Proofpoint-GUID: SSfXKysKjqEwDQjbYvzlKXae-wMOAKJT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120160
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92733-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.3:email,0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DDD33130FC7
X-Rspamd-Action: no action

The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
interface.

The Renesas chip is powered by two regulators controlled through PM7250B
GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
The Genesys chip power is always-on, but the reset pin is controlled
through TLMM GPIO 162.

Describe the Renesas chip on the PCIe bus, with supplies and reset, to
allow it to be brought out of reset and discovered. Then describe the
two peers of the USB hub, with its reset GPIO, to allow this to be
brought out of reset.

The USB Type-A connectors are not described, as they are in no regard
controlled by the operating system.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Posting this as a RFC, because it doesn't work without some hacks in the
PCI pwrctrl code. It depends on Neil's work for μPD720201 pwrctrl [1],
on the GL3590 work by Swati and Krisha [2], and my regulator fix [3].
With these three dependencies, the hacks in drivers/pci/pwrctrl/core.c,
and firmware for the μPD720201, the primary ethernet lights up.

Then in pci_pwrctrl_create_device() we assume that anything in a PCI
device node, with either a -supply or port/ports property, should be a
platform_device. When the USB bus(es) of the μPD720201 shows up, it
again registers this platform_device. It seems that
of_platform_device_create() saves us and does an early exit, but by
"accident".

__pci_pwrctrl_power_on_device() and __pci_pwrctrl_power_off_device() on
the other hand, they happily pick up the non-NULL drvdata, which is of
type struct onboard_dev, to call the power_on() and power_off() methods.

It's not clear to me why the whole board resets at this point, but I
don't think we can assume that any random platform_device we find at any
level below the PCIe bus has a drvdata of type struct pci_pwrctrl...

[1] https://lore.kernel.org/all/20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org/
[2] https://lore.kernel.org/all/20260122092852.887624-1-swati.agarwal@oss.qualcomm.com/
[3] https://lore.kernel.org/linux-arm-msm/177091226767.237262.6699917364293122804.b4-ty@kernel.org/T/#t
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 94 ++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e3d2f01881ae05f17796f9c97f10b53cea50daff..e8d3588e67d0386150258d0bc28b4c6200920067 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -262,6 +262,28 @@ active-config0 {
 		};
 	};
 
+	vreg_pcie0_1p05: regulator-pcie0-1p05v {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE0_1.05V";
+		gpio = <&pm7250b_gpios 4 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		enable-active-high;
+		pinctrl-0 = <&upd_pwr_en2_state>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie0_3p3: regulator-pcie0-3p3v-dual {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE0_3.3V_Dual";
+		gpio = <&pm7250b_gpios 1 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		pinctrl-0 = <&upd_pwr_en1_state>;
+		pinctrl-names = "default";
+	};
+
 	vdd_ntn_0p9: regulator-vdd-ntn-0p9 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_NTN_0P9";
@@ -870,6 +892,41 @@ pcie@2,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x4 0xff>;
+
+			/* Renesas μPD720201 PCIe USB3.0 Host Controller */
+			usb-controller@0,0 {
+				compatible = "pci1912,0014";
+				reg = <0x40000 0x0 0x0 0x0 0x0>;
+
+				avdd33-supply = <&vreg_pcie0_3p3>;
+				vdd10-supply = <&vreg_pcie0_1p05>;
+				vdd33-supply = <&vreg_pcie0_3p3>;
+
+				pinctrl-0 = <&upd_hub_rst_state>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* Genesys Logic GL3590 USB Hub Controller */
+				gl3590_2_0: hub@1 {
+					compatible = "usb5e3,610";
+					reg = <1>;
+					reset-gpios = <&tlmm 162 GPIO_ACTIVE_HIGH>;
+
+					pinctrl-0 = <&usb_hub_reset_state>;
+					pinctrl-names = "default";
+
+					peer-hub = <&gl3590_3_0>;
+				};
+
+				gl3590_3_0: hub@2 {
+					compatible = "usb5e3,625";
+					reg = <2>;
+
+					peer-hub = <&gl3590_2_0>;
+				};
+			};
 		};
 
 		pcie@3,0 {
@@ -1198,6 +1255,17 @@ ntn_1p8_en: ntn-1p8-en-state {
 		power-source = <0>;
 	};
 
+	upd_hub_rst_state: upd-hub-rst-state {
+		pins = "gpio4";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		output-high;
+		power-source = <0>;
+	};
+
 	tc9563_resx_n: tc9563-resx-state {
 		pins = "gpio1";
 		function = "normal";
@@ -1378,6 +1446,15 @@ &edp_hot_plug_det {
 };
 
 &pm7250b_gpios {
+	upd_pwr_en1_state: upd-pwr-en1-state {
+		pins = "gpio1";
+		function = "normal";
+
+		output-enable;
+		input-disable;
+		power-source = <0>;
+	};
+
 	lt9611_rst_pin: lt9611-rst-state {
 		pins = "gpio2";
 		function = "normal";
@@ -1386,6 +1463,15 @@ lt9611_rst_pin: lt9611-rst-state {
 		input-disable;
 		power-source = <0>;
 	};
+
+	upd_pwr_en2_state: upd-pwr-en2-state {
+		pins = "gpio4";
+		function = "normal";
+
+		output-enable;
+		input-disable;
+		power-source = <0>;
+	};
 };
 
 &sdc2_clk {
@@ -1431,6 +1517,14 @@ sd_cd: sd-cd-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	usb_hub_reset_state: usb-hub-reset-state {
+		pins = "gpio162";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &lpass_audiocc {

---
base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
change-id: 20260212-rb3gen2-upd-gl3590-d110dd722e1b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


