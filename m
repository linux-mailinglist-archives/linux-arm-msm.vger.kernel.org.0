Return-Path: <linux-arm-msm+bounces-114149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G2WsKIFaOmp96wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:05:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3973B6B6104
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:05:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="WRK4/Mlq";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eETBDknB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114149-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114149-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7186C303BEBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7B2374E48;
	Tue, 23 Jun 2026 10:05:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B3371897
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209146; cv=none; b=d/v06XU1mCGtYDjffOaArjoE1YYwkD7/N5hMi6vfcFpE/KY+nm87rUNGLZBkeTj+ZplNsi4c8HjoC5mCGIZlTp+sBQRTh7tekOu2fMBLqIqEp8mkQlWG0r3eMbpacHxCJd1nnaEm5hO+9XJlvVCzimD1YyEmEXyfdxYHa0/gQtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209146; c=relaxed/simple;
	bh=7KFr550cWvHxKyQ9CcCG6oCAK+uV1dQAvp3/3+OTIRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AVWVXiKIuXNBXHiX2DVmZpRDK32dQoZTLXYUokg1q1cDSc1HM4kDpiR0lJLPQcxmtwo/QlaIgbj7LbG3xBqaiV5+wbSIjUieCHz8IvPugxzXu2+IJHJvRgWLg18rto+Beo4FQEXQXv7qdm3mv9OmPa4ClO7cAyuFfroGzdEIoLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRK4/Mlq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eETBDknB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NA4xLc4126408
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/N/vYY+Gi7+uGnuQk94OBv/y9moy0GB3wWdee/AsGE=; b=WRK4/MlqxndV6Vgn
	tBRNMAPZycj5cS5pQfSEN8Sr4r30jyqqSyYVoyQgvr/7bnLhGP5aGSyFPHQ5ZuqJ
	gJYYoNNproZrYvTpwfoXJFnPcSrbEq1sD0VlJmY6cbkTOaLwf6VJ50vTQ/I/TOVm
	E48y0oF5lMU0Lc6CvgsGLkkEYlQBWKo9kp8/jXNfGbAqsfGw/CIgQ+xZH3tpZY9j
	AGCepZxDhzXj1BP4FoYRop7FdmSXRLGqSMdB6yPIf9aR5xAj9JiOC3PIIdvSGkxm
	ZdgWQW20hTqZRaAjSPMQ7ththa+rXejdOnjf4vz4w1CqzjgalVEUiTUsQWqf8Hmi
	u9I9WA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr32006v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:42 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-138acbc0e69so20038954c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209142; x=1782813942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/N/vYY+Gi7+uGnuQk94OBv/y9moy0GB3wWdee/AsGE=;
        b=eETBDknBnNMD9IqIeHU7jvFEJlIUI4S+sIJ76i4Fwz84wn1E4dQuFk4QVr3RuoiPsP
         CMSjz2DD7GjiyzPHhMs8y8/CzqvS41tsX5Pwwaqufj/5dp7RPvxpSxq28Yj9Cb5aJq8Y
         gXuJ3CMa1CiyN69ayi7s81u1C/GNu/7bT5vydcBFs1uIyfv+5iHuQwwb3f+AEGsWMN30
         BWSs0fq9hglB8393OgOZyH4/qDkKfvtmjsGy1k5KUqSl5F1U5/VW/jLt+i0QdjVKVxoO
         y9ECF7I9A4oKfJKFoE/4txgOoAv6us6XqPXqTaYJcyNBrwzzVy/fijMgFgHqwiPyUvuZ
         5V5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209142; x=1782813942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/N/vYY+Gi7+uGnuQk94OBv/y9moy0GB3wWdee/AsGE=;
        b=ZIMC5emPLfOeZD6+LXHiQ3H6PU4j+Jaa4upRji0/9XYjPhijgjYOnOfU9VVZ4JdlDk
         o+Alzqy7L5iSd0xPDBG0Xd2pppNKoxK71DnZk/1KMsOyKceZL43wTCVXkRf19Z/UzSHQ
         RCO8nxnTCO6yY6xVkRrewRA7S/fHK9Sq3VA13A15vxXWoH4lwZmXJazIB38jfUAxJPIx
         RC8zv7w91xCWU9cS6r5YwuRnqztTDh7WFlbp980PURO1dqhhcGljflop1exa2hidstY2
         c7vDocrgbK4iD5vnLTDYvotnoAPN8OSWge1HjjH224U2IGDjyoeH3wfZ7J7Uzuu9CbOy
         ed1A==
X-Forwarded-Encrypted: i=1; AFNElJ821cpN7JVWZXRDFVTzw+Yz2AcB+li+HfGk6AYViorkt8ji7QdOUfei9zt0l+outofVLSH4u5adoW4IqUhf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl74FoxtsJ2WpdEBFrbNUGHsWbososoFKW8XUG4QUTHEtZ6x11
	gDNLfSmr0xp+/K0GlTPTz9DaLUINXDXUkGbOcj6KWGdE6ig+E2rceivkmuGAH1FrTax6FGY9Ntk
	MXBCJ3xpiP6psaPUA0Goi4JMWrQ2M6EyYHsvHLi8a9JHc1q0pkvxpKgF906GyLgrMAPBU
X-Gm-Gg: AfdE7cmVjWChriKuGRipCev7r7spX9h+CQ0XnaLHBPntWGnQh4ECaM+kxLZN5dTsIMq
	ITfIea9/KKb2ZE5iHw5g0/ts9YyIU0Efm0RD1LYKTH1KAA5cLI27gpFdTd8wtxYsFVnXHUXWmII
	YsYy5I4K/E+YZa0T1eSX8zmBdqtoPyXyd24yy9C+Mu4acb55+Cr0nRNLurzc6nmMrDm8B0sZs28
	po78/O5LyJ6VEqbuL7+5/AbChGCxGe9Y0YxAMmY3nDjSGdzSliVtLpy6kyO1xEwAOE+hjbPRwPm
	3HttdajdWO9onty+CUULa/yXxCH02unxR9F9Hxp5CS+xtzCmw054CodjO4s1oG2UetVsu6h2hSC
	sTHK5AWF1PoGCIuZJaeQ3zXP9hyAfETyW69MOTxDQ0ZTaIQf5R+6N33gZh0qrjQ==
X-Received: by 2002:a05:7022:3d83:b0:128:d4be:7438 with SMTP id a92af1059eb24-139ad71294emr11455101c88.30.1782209141821;
        Tue, 23 Jun 2026 03:05:41 -0700 (PDT)
X-Received: by 2002:a05:7022:3d83:b0:128:d4be:7438 with SMTP id a92af1059eb24-139ad71294emr11455072c88.30.1782209141317;
        Tue, 23 Jun 2026 03:05:41 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5824csm11607495c88.10.2026.06.23.03.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:05:40 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 03:05:21 -0700
Subject: [PATCH v7 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-knp-soccp-v7-5-1ec7bb5c9fec@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
In-Reply-To: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782209135; l=6724;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=7KFr550cWvHxKyQ9CcCG6oCAK+uV1dQAvp3/3+OTIRU=;
 b=rrZTqCfrp8XYG0OoeNmZgHiyJKHYsFvB+11avWSy8lfhAKFi2Khc7PP94S6Q2XySykpdKbDIY
 Rpbp4olJ/F7Aoj+ItNQXo6PnySbpEDLGUCocbaB9D+8Suu5zo6bdkm8
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX5r4c36PdJrUP
 SCxbJo3R0+TIU4XxkhvzozgQNa+Q43F8j39Zo//KxhgM1SYB4IuSzdU3v7oYeN32OoqbDpYNTX1
 IS4rLJmSfQfM86juL25Ln5hoLNPk2Xg=
X-Proofpoint-ORIG-GUID: SidtvV1-dnD2rZF7hkK1E1cHYnogNXMT
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a5a77 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KEoK7t2FL3BCqjfwJwAA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX7oG9oK3HIubM
 KGwahEPCB+Noqr88yw8IvTViFOVpoKgLbLFO2fG2TRcRqVeQ0YdS/yqjvweJuwdGV6AiY5/lpBc
 5Co+P3e5MHKpNfrHb+2sqCFi6LqE0LOys6FG6n9chOh5M1TVwffzT592COlSlraDXBPCXH2jk7d
 7xAQ26FkTzdG+E7Sm/h7OC2dSZEkVNyCln1aWh9ggx45S2hNs52wdOiSfd7jHZo/EEbSgKnJ+ve
 1+VrjxUu/RTBwHLkf1qPyIDt6VImG2D7jsHl9UjXp+sHeEiEVFVhtM4SZB5C6NfC16luy/PkcqO
 ZZg4W2lqE9fuMW8LKe2r4BONtvi5TaO4ZHjBekNvIOSEiNngVLOe0D1z03vA9wqbtKJou4LqUs/
 wq1juXWV6MJ87kvc+P5lS5BWQOKzl7yKK+YH3sjZoiMKBxq6pIbGSgANHXeChPZQNRL+X/QbjT9
 89bakCxaqzdBlkVuuSA==
X-Proofpoint-GUID: SidtvV1-dnD2rZF7hkK1E1cHYnogNXMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114149-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:bibek.patro@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konradybcio@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:gokul.krishnakumar@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3973B6B6104

Subsystems can be brought out of reset by entities such as bootloaders.
As the irq enablement could be later than subsystem bring up, the state
of subsystem should be checked by reading SMP2P bits.

A new qcom_pas_attach() function is introduced. if crash state is detected
for the subsystem, rproc_report_crash() is called. If the ready state is
detected meanwhile stop state is not detected, it will be marked as
"attached", otherwise it could be the early boot feature is not supported
by other entities or it has already been stopped. In above cases, the
state will be marked as RPROC_OFFLINE so that the PAS driver can load the
firmware and start the remoteproc.

Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.h   |  6 ++++
 drivers/remoteproc/qcom_q6v5.c     |  3 +-
 drivers/remoteproc/qcom_q6v5_pas.c | 68 ++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_sysmon.c   | 19 +++++++++++
 4 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
index b07fbaa091a0..b0e7e336d363 100644
--- a/drivers/remoteproc/qcom_common.h
+++ b/drivers/remoteproc/qcom_common.h
@@ -68,6 +68,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 					   int ssctl_instance);
 void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon);
 bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon);
+bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon);
 #else
 static inline struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 							 const char *name,
@@ -84,6 +85,11 @@ static inline bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
 {
 	return false;
 }
+
+static inline bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
+{
+	return false;
+}
 #endif
 
 #endif
diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 58d5b85e58cd..a11d8ace554b 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -202,7 +202,8 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon)
 	q6v5->running = false;
 
 	/* Don't perform SMP2P dance if remote isn't running */
-	if (q6v5->rproc->state != RPROC_RUNNING || qcom_sysmon_shutdown_acked(sysmon))
+	if ((q6v5->rproc->state != RPROC_RUNNING && q6v5->rproc->state != RPROC_ATTACHED) ||
+	    qcom_sysmon_shutdown_acked(sysmon))
 		return 0;
 
 	qcom_smem_state_update_bits(q6v5->state,
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 808e9609988d..8a0bb4b2e71c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -60,6 +60,7 @@ struct qcom_pas_data {
 	int region_assign_count;
 	bool region_assign_shared;
 	int region_assign_vmid;
+	bool early_boot;
 };
 
 struct qcom_pas {
@@ -507,6 +508,67 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
 	return qcom_q6v5_panic(&pas->q6v5);
 }
 
+static int qcom_pas_attach(struct rproc *rproc)
+{
+	struct qcom_pas *pas = rproc->priv;
+	bool ready_state;
+	bool crash_state;
+	bool stop_state;
+	int ret;
+
+	pas->q6v5.handover_issued = true;
+	enable_irq(pas->q6v5.handover_irq);
+
+	pas->q6v5.running = true;
+	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
+	if (ret)
+		goto disable_running;
+
+	if (crash_state) {
+		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
+		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+		ret = -EINVAL;
+		goto disable_running;
+	}
+
+	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
+	if (ret)
+		goto disable_running;
+
+	if (stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
+		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
+		goto unroll_attach;
+	}
+
+	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
+	if (ret)
+		goto disable_running;
+
+	if (unlikely(!ready_state)) {
+		/*
+		 * The bootloader may not support early boot, mark the state as
+		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
+		 * start the remoteproc.
+		 */
+		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
+		goto unroll_attach;
+	}
+
+	return 0;
+
+unroll_attach:
+	pas->rproc->state = RPROC_OFFLINE;
+	ret = -EINVAL;
+disable_running:
+	disable_irq(pas->q6v5.handover_irq);
+	pas->q6v5.running = false;
+
+	return ret;
+}
+
 static const struct rproc_ops qcom_pas_ops = {
 	.unprepare = qcom_pas_unprepare,
 	.start = qcom_pas_start,
@@ -515,6 +577,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
+	.attach = qcom_pas_attach,
 };
 
 static const struct rproc_ops qcom_pas_minidump_ops = {
@@ -526,6 +589,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 	.coredump = qcom_pas_minidump,
+	.attach = qcom_pas_attach,
 };
 
 static int qcom_pas_init_clock(struct qcom_pas *pas)
@@ -852,6 +916,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	pas->pas_ctx->use_tzmem = rproc->has_iommu;
 	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+
+	if (desc->early_boot)
+		pas->rproc->state = RPROC_DETACHED;
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 913e3b750a86..a0830a48b1f4 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -736,6 +736,25 @@ bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
 }
 EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_acked);
 
+bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
+{
+	bool shutdown_state;
+	int ret;
+
+	if (!sysmon)
+		return false;
+
+	ret = irq_get_irqchip_state(sysmon->shutdown_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &shutdown_state);
+	if (ret) {
+		dev_warn(sysmon->dev, "failed to get shutdown_state: %d\n", ret);
+		return false;
+	}
+
+	return shutdown_state;
+}
+EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_irq_state);
+
 /**
  * sysmon_probe() - probe sys_mon channel
  * @rpdev:	rpmsg device handle

-- 
2.34.1


