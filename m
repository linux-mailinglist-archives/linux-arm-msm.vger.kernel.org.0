Return-Path: <linux-arm-msm+bounces-101434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CFIFiAKzmkwkgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:18:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAA63845F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80AE13085EEA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 06:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF1C37F72F;
	Thu,  2 Apr 2026 06:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MEYDbtSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERrKJG/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CFF3115B8
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 06:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775110597; cv=none; b=p5QNxBLJsxV3gLiVzgUE4kbc+l+sM71Z2Xg+CSaOIR/8vNFyPF1liQU8PHXUdZnWhjd6Ljmyz9Cd6oiwb3DbcLxrPEk23RWBI6Ry8Y/h4Helsg+i4Hwg7D595OGilyWTyMOJsyq3IjzXZf0M0X2LkfE3hbptkOhirumPqB7H/A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775110597; c=relaxed/simple;
	bh=R64Ez9vA3597UhDxqN97/swYHqLmJxydRguMqhBH2gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bN4FKretI5Sli7NkxTFJJu7k/h5LNrmnddGGvrnNtGup45Y/THxJ8W9MFzEM9iGLwA+ywGw3aNV/uVRkrYmcHY5BhRVzAG+Oe4gXj/B5QojiF8z7ieQQY6bpz30RjZ1ZBQlcxVhfDtGt+CoV6mU/oV9XMLOK/AabQHtMsJ5olbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MEYDbtSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERrKJG/V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4R6a548295
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 06:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jtKBguUI5hjCUI26jN+AsfCrHHhyzQLyh5wfQp4gvJk=; b=MEYDbtSGilz9wMoT
	Zcphn6ThY1sDZliWaqMgsmU8iqS8TFLXw9wCyvr3psIIo+CfM6glJqQOA+8qklD0
	TFDkA4U8KuX2RWjTup8LXizyMTeJz1hqpiNDyFTwCtpz+bKs2wlLEyCv4o8HzNyT
	mFn8T46lk4slWHX/a5WlmqMDf0xEe0FUHGpmOSQ4CkK3TTTmh0+tppWgyM8XyDmv
	o8Fx2JZ1LzD2g/hJVLZewIWCPbxfA9jSfzU7Wfj5sN+bYja4xTF3c+wOzId2t0M5
	6ulrhCKEZ3VIT2a4OpfylH1Qxn1wZ8y5Xk6EKOHQQLLMXsfrFck3pUfUUVwqJvnY
	ulCQtQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d94vvk7uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 06:16:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b241be0126so15295535ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 23:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775110594; x=1775715394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtKBguUI5hjCUI26jN+AsfCrHHhyzQLyh5wfQp4gvJk=;
        b=ERrKJG/Vjz6p+u8fdq7j/vPwR2gapvd6FVJOI7vbITQQ6NwHw43EFyXjzN0GI46/05
         FaQPtoYIB1n+vzPYREZBRwuQN6l8iBvxj8ScFnDjeTR/T6qQ7VU11scIO9tbmRCh2dpP
         463j+CnBSGiCHDiHAIx1nu/CwdJzgEyDAdsfcQgGu6YYJgbe8364j94dVFJv8wsjucRN
         QbWmtJEEyHtrDV1xasCI4zUFNbV1hSpEZXSOUSRH+xj8o89gp/AKCMe6vutG00ZeBYT0
         9FjF7SkIF/PFT9MMSMxeH7T4dswTfehuqJT70MVunDfvNIhD/Dr1GzJIBstcB08eB7y4
         jDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775110594; x=1775715394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jtKBguUI5hjCUI26jN+AsfCrHHhyzQLyh5wfQp4gvJk=;
        b=LZKBlEHEmiq+jciFX8w5PQtAfAZo+DeefGQa48Hqz1H1YWHGy3670kqbIoJtfB1fzP
         LBH6ld9aiqQPFvyOkfwoMH4kKZJBLcNDaQT58MWYx+FhD9zb/fp+IPPbWN0+mRSiEOZA
         VXqv93xRljnOaCaZJOOBccPRAPadhFlgz18O+j0MqzlwGDSqFPGitn2cEj7ToIrNhMt3
         EZl8wHrEw7q5H98jH9vEgAohWaeO26VaFlhQVrJiBOEezOv0L4cujACrMfsE33mN0bew
         GoCYakle+AtnTw6SXPF6HPDTGmf53+2JFJfhkjWE+gYhz66iMqM0N103SeiaFXRzX3eq
         l72Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwbDI0yB8V8gFRWdbiX6hN47jtYSlVLWVuMbC1+XHUWDE6kLbQm2Sqzs6QHEAhvUHdgNRh3GQyYg/gTLMy@vger.kernel.org
X-Gm-Message-State: AOJu0YzA+u16N9DUwzKRSGOhjsFWt8bGavJpUlvToPP/+NijihRlxjNy
	jdrrSCDORQXVWFJQhexXpYqu7CEziIlRntg3+hR26XmJsM3xelWueUUkfOVm8OZTcNIB6b/ruZA
	DfUZadE+mqfhBI6DaFjgexCUSceWx4S80pimZUte7vHm/egPOP9iBkW8vJlMAceen88cW
X-Gm-Gg: AeBDiesnlFRRWeILxBrqVSzuD/gUuU5WeBTD7izQ5nefqsMyaZN0CQhZx677tbw6FYa
	713+ebLGsbWhxFrYCM+vJ7Sw1YTIePjo2LKBCVxO7mwXdD8U0adzxEOykdpXrrhijkkF5VuN5Ri
	INYHBWUdiLbU/NBBrL6e4X+sQGYr+4XPE/B9bzVUNoxoGE90cW98xngYFIN4Y25ZEg851JyW8dU
	FXzS0ANJ55RU2TD5HGlXKz+KvAfVZG4J+1TPrdObk0QFdRTC/tyz9OcO/v03Q0gcctP1F3+a3nW
	YA3TV2areOfdxNgH5RvCR0iwx5nYdO/T9gDf4TUeXiF69ksPaL5U399xR9rESNU7pWBOTJ1j0I9
	M43s9cOTALY64OMTly8Fpz6JymYp7WfzPzrP4HtvdySIEWXUjzDs9
X-Received: by 2002:a17:903:1105:b0:2b2:5515:6629 with SMTP id d9443c01a7336-2b269d00094mr66342755ad.30.1775110593893;
        Wed, 01 Apr 2026 23:16:33 -0700 (PDT)
X-Received: by 2002:a17:903:1105:b0:2b2:5515:6629 with SMTP id d9443c01a7336-2b269d00094mr66342455ad.30.1775110593402;
        Wed, 01 Apr 2026 23:16:33 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbc58sm16538615ad.78.2026.04.01.23.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 23:16:32 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 11:45:46 +0530
Subject: [PATCH 4/4] arm64: defconfig: Enable CAMCC driver on Qualcomm
 Glymur SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-glymur_camcc-v1-4-e8da05a21da7@oss.qualcomm.com>
References: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
In-Reply-To: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1MyBTYWx0ZWRfX27sOmEuzzZLf
 ukePc+IaybQECSrKZgUiXtRXZVFUVyaOl03hM8dulsH5ARQ6ATgUDzPywtAUvnpWNtO9YZZiEs9
 64zbg+5LoXDnJ331BojsCcbT5+wNi/ooiMSTYwDdl+5QsQ7z1PvX7wVRyil1CHg9sUUeAG83dYb
 IIsy4qwHB7waNfLQiJhiQ/sf3SY2hEeOBHVda9PA/7BVpBTBXh3bbYfGTKhP4dW/lLKzXzZKkvN
 sOU43RwV+PDwUv1KOkbAp03nPYciB4OL4VKw6MBeqNlYDq7bVNPFxFyRC5IkqhEcoHzMRPRfU2u
 4LTcczdA5yq8usFrYDzyjens5HtMyzi0rK1M3+8IA2KKVd0fFcu/bSJTf8Dj7Bm2ONzFYUlCcrb
 FDAT+pH9f/kuBXpY+mSlP4z3WWSFlpJz4s4kLdUQvx6YKWtYj1Psb4ooTsG41C2HQlMs/tM0RAT
 9LfFBk758IMhr6qR0Kw==
X-Authority-Analysis: v=2.4 cv=DJSCIiNb c=1 sm=1 tr=0 ts=69ce09c2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2tOI7iOMnFxh-ToW9usA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 9GvL80PyzUhD_Oe8rrT61mJ5_600yAD1
X-Proofpoint-GUID: 9GvL80PyzUhD_Oe8rrT61mJ5_600yAD1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020053
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101434-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AFAA63845F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable camera clock controller driver for camera functionality on
Qualcomm Glymur-CRD and similar other platforms with Glymur SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e44e83bc57812aaed21bff1b12d36ae4a373ce11..f5aa905a6feb48e7d65dbf076f778bcea54aef02 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1478,6 +1478,7 @@ CONFIG_COMMON_CLK_QCOM=y
 CONFIG_CLK_ELIZA_DISPCC=m
 CONFIG_CLK_ELIZA_GCC=y
 CONFIG_CLK_ELIZA_TCSRCC=m
+CONFIG_CLK_GLYMUR_CAMCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m

-- 
2.34.1


