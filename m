Return-Path: <linux-arm-msm+bounces-115847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FVM3KFIWRmpaJgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:42:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B306F44AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:42:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D2Dqq7GO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dXEJYYpy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115847-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115847-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAADC304E43D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 07:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737F63921F1;
	Thu,  2 Jul 2026 07:34:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5C13921EC
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 07:34:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977647; cv=none; b=GIszfXb0L4I6F1g0E81IZ2I/3h2ZioVq7CmmjrLE692gIGpVQE251nYkA4LmVJZ8cuT3pX3I6J5z/evCh9SxgNMOf0XNQ5ubNUuEGUetFLb039PB7VGfV0VnBzhDbHANecrV45OfVRy7i9AzjvmdJGQE1tEjv3AOEO8yfuZVTiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977647; c=relaxed/simple;
	bh=8qei+cZyradtd50ScPvFXNifDm9xbNX0s48ZSZ8pEik=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NTXV5DYzGlUq7cL7nJJrgeA3rtPripPitL9H6Q3Q2eTyQkRulG5oNmxVwEu1FJEMKqMW9SSWZeb3dzPivOEkqzEV9x8v5rheHpa/c0/UpX3Mw+TSi2WliurZ7O+/4VkHJIpxfvKiwRh71NyuXUOcj9QJhamzvTgHXUc6dYt1BXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2Dqq7GO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dXEJYYpy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KMFf2960158
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 07:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JEalJ388UV7aZKSYSZMD52o4Z6quoMTRP0H
	R3KK1hG0=; b=D2Dqq7GObUQmDZrEuyNcw+sMOoDXzbQCYrE9zdrt1dq0GecKXnj
	YSbZYrfD+zPPHqxOPJHxF4qwVPvA+lXloYjhI3LqnSMTI5pAZmsysYHJNbzEjlmY
	2NsbKSsfPygvPijz00X9DDQAt14QUu8p7bJZpSAMR99HEzciFdh6gtehS1ftHr9Y
	/YnNUwpSs4MKxefx9tkpkwSx7RZrmEy2SyGJCwzLDe6vG/2Nh3YZ4vdFuvqbhIPr
	qYu9lLzpca2ZrubueJBhFWEHBM54cOKDWAqrxwPnZKRTDejstq415gJyQA4ME8cD
	40zQ5U9jVyPFZDJ9mATWf3ekDWEc7Cc/WlA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563mk0vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 07:34:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so439284a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 00:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977644; x=1783582444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JEalJ388UV7aZKSYSZMD52o4Z6quoMTRP0HR3KK1hG0=;
        b=dXEJYYpy9MiWy3Bulsnyg4d9ZvQt8Sqzqn0qjvx3X1/yVpwQb2Q+xMvDcM3QGn7GKP
         74BkJsFvi+N87nl8k+7kTqDZz0xB/uiKbrs0jrQyliVjDyVHZ6JzFwbJg8AIbTilsMmv
         ZwTVV79Zemn5kJ4YYm2W0dc+KfaPIRTr2ztd3ZeY4LsM+9kaHrkkRkcXtV/Vstfzwk9y
         o1ojKYj3J50f1e4F7lp+Gt4th9rV1BC1j/ImetV1rfNWXp2ZmFpRN2RbQqMZxNRzx1zt
         EIwXX2ZVZhdj2kK5AFBnL4oI/How6SW1LCYZzEKEMk7b+u2SKJ3pLX0Lgm1pg0RuPn5J
         J1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977644; x=1783582444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEalJ388UV7aZKSYSZMD52o4Z6quoMTRP0HR3KK1hG0=;
        b=jyfLsBgpIr2EhIduTfWUgJc2UtHp4W2tjrKosiHseyvMrWTAdEoEmXsBSg3x+8pgqn
         7mQ81aO31r9+kWk5m5XK9ref4a4nOdCE9tbmxjMH6nlhtZA3d9+JVwDFPKDHdTs3eyLp
         ObHGw3as+C9vkBMpBVF6oBYGJbQaEb49w9UcOdeHoXQdcW1NrARxWQ9l3jaHl8esE0ad
         0b+JgCPaEp1LlCUDWh4OeHB8wSoxNX1lPTx7AZcbG0Fitm1DNgXQ1svi0yJH887CQ0SU
         U9X5PIMuIw8b1mTq2QJO2kqpn3EKAiGGxk8/twUvoDNEwRmcZs4cX3VU6yATwXT3p+kz
         brqg==
X-Gm-Message-State: AOJu0YxwXNtZa66v8+Yq+Bc9sBLCIR7Ef/LcABoxTHiQzD3Ufjyv3PKA
	IdDmlA8SIJmu65U5N80eNJ+lMmO4SDafwHKAGNdj0+jfkczrB9ZVlWSLrf1/KP/TrvWk9Dqd8Pg
	3hC6MyKfrhJpDU7PEqmLYILwTCloeYKSxCTEWDVv2bE2+FxhEb3xwSRQ2eQPxPN8cxFs8
X-Gm-Gg: AfdE7cmo31hupShM4rQQ2UYQJ02gArz2adFMoxpfnOFFUCoGvRuMegus+Ah4Y0KbTtz
	AmTPlTAts/YG/7ZhndD34ZJxWDvHYxhkmRIdpHifOEDoO3ta5M8fbm31NSqhQDBN4BxIhkTEfTK
	Aai2a2D9fzTSRWvFvvaAifum2oXQuTbKFGkC8FbxlPXfnHKCCAC0ayyGLpyex+7CCmmJC2QQheP
	RRm66Ae4EHWmVEuOWVqdgnx5T4rDidRmBO2CcVfNhDO0ssngWK2Ejj/1iKnLmtUPfKOLZP31c7j
	kcUB2n4kbmr3HViTscWbBEZJgB77QvEd4SPAW2jDqERrpWdOe3k9vb4Kor6mMKv1XwIW+EImiva
	JWvsHEArqjEL+JOS4kV3oNzB6pJbUAs8TLBh2GJ6ud4LumQ==
X-Received: by 2002:a17:90b:17c2:b0:37f:9e21:91d6 with SMTP id 98e67ed59e1d1-380aa1d5609mr4006120a91.13.1782977643746;
        Thu, 02 Jul 2026 00:34:03 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:37f:9e21:91d6 with SMTP id 98e67ed59e1d1-380aa1d5609mr4006090a91.13.1782977643055;
        Thu, 02 Jul 2026 00:34:03 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e163211asm587380a91.3.2026.07.02.00.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:34:02 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V3 0/2] arm64: dts: qcom: Shikra SD Card support
Date: Thu,  2 Jul 2026 13:03:52 +0530
Message-Id: <20260702073354.3641966-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: R8-6yGNzrDnAfKOpBKQb_BTQr0S9niIS
X-Proofpoint-ORIG-GUID: R8-6yGNzrDnAfKOpBKQb_BTQr0S9niIS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX06B5kRwmGRbN
 4qGqVj9ohLNk6d9lYbRmBizvPbEbyCrvDz8/HfCiNS0yVH/BU3xECF4mlyOjizYSzG3a1A31vrh
 bFq+Q9mPz3vdBpApNa7gvGfBvZwICaoMMmW+oVnD7R/QaorZ2SP+tUuqlSbgKaFok6Co8OGJWbv
 YqQ1xrjVWjbkGH7kBtSGiyf9AmfmjZU5VQNk/lrnB8mhEa8nehbmrkxh4C6v2UzG/pLfpEinynj
 9enrQ0bK1vEXzErrmXmYPSH0Q5NG784hB/C0DuQ4uAL04/kCVYIdOARE+P3wjse8tH2M7FxLNPW
 tI24AvbLZHTSPqaJ60Ze8BUKiXQ/p8KX28XRXCkufxUfGiNht27WX7QoxW54liXnywsBmSNbD5z
 oW3XDI2Oqd1nemQiRcTRdfPIhPRMaMW9cCUqCEtavfdwR55V5pFPI1fgUGm2Jk7uQfQLDcJN7K1
 mN6VSLaK45RbDV3w/wQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX9nxov6egGQEb
 dxg3oyJwJG1bwUnthAPXZtQYEyKHHeCXDrRVzpEQOWQ+fzdylPGVTGzVEls0qi3IytJjdFEZhEw
 PwlVIzvZ9QZ6l37fnrIcoHtQ+Svvp0k=
X-Authority-Analysis: v=2.4 cv=UopT8ewB c=1 sm=1 tr=0 ts=6a46146c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1w3StAHzAm3vCDDRDnYA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-115847-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33B306F44AE

This is v3 of the Shikra SD Card support series.

This series adds SD card support for the Shikra platform.

The first patch adds the SDHC2 controller node and the necessary pinctrl
configurations to the base Shikra SoC dtsi. The second patch enables 
this support on the Shikra EVK (CQS, CQM, and IQS variants) by defining
the regulator supplies and the card detection GPIO.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Changes in v3:
- Padded the address part of the reg property in the sdhc_2 node to
  8 hex digits with leading zeroes for consistency with other nodes
  in the file
- Moved the common sdhc_2 properties to shikra-evk DT file
- Link to v2: https://lore.kernel.org/all/20260630165700.1886608-1-monish.chunara@oss.qualcomm.com

Changes in v2:
- Rectify the alignment for clocks and interconnect properties for SD
  card
- Link to v1: https://lore.kernel.org/all/20260604122045.494712-1-monish.chunara@oss.qualcomm.com

Testing:
- Validated on Shikra EVK variants.  

This series depends on:
- https://lore.kernel.org/all/20260612-shikra-dt-v6-2-6b6cb58db477@oss.qualcomm.com

Monish Chunara (2):
  arm64: dts: qcom: Add SD Card support for Shikra SoC
  arm64: dts: qcom: Enable SD card for Shikra EVK

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  9 ++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  9 ++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 11 +++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  9 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 97 +++++++++++++++++++++
 5 files changed, 135 insertions(+)

-- 
2.34.1


