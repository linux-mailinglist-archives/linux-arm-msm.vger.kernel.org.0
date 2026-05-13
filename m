Return-Path: <linux-arm-msm+bounces-107337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKpdGliIBGoJLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:19:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCCC534E0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B74643067DEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1922E2F0E;
	Wed, 13 May 2026 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUQsVK94";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGVRQoLE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1017B2E7165
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680828; cv=none; b=YpYm2f9XUGIeoij0l7Ty27MWp8VBLqr3tT5H4/rrrzwzDQsUhZxZrE8Ygfz1pErCNiBywGeeCHHYv/lBPjoccLVY+vOX0ngCyzyNHLe/kmgLijpTuHAPtvNDe7VqJgdOV3SDMgBCBsuF8y4JmCGkglrZPXII8oAFUUW8nbbXiW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680828; c=relaxed/simple;
	bh=aKBc3a1reObJzPxjVObMzeIy6B8figPxC3rY/NQYiOI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UhDLHfdhfU7VipwXGNnU3/R6FKIWyZykxLgQpx0Tmp1N1wOG9Rsq4bnT7AVoypNakoHMbzB3BbPtjoICQ1BjnMUVk/vK+cBu4AguxI6ZHhYEx9VKiOSSQ8otb+Tu/Kglku3llPruKvLGLfJGCB7cWjp+RESJ2hNwrenfyd3PbrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUQsVK94; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGVRQoLE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8wn5E4159600
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/qCpThYaxG6jHZBAd7Jq5rIBXmgO7auE8lO
	iAizRneE=; b=BUQsVK94BJZxia7E/1VGse4RaqNzYTxEQKiAqZc5b9sLqPd2Ipw
	08rbwhVNAF18K68/OlQbIMpJLS6D6fHIXuR0Q4tYt8qZ5v51PN7Jb+XDZRfIyBKd
	fToIy1EAlv8rDtxdqASMgWQrmHu3bu8XcGnqvBQKCgWATm9l32IO+SjnXhtl3Aoo
	4pP7N6+6NEiReyr9yiXZcnlkjtoGMUroZOTu4/FwqzUystR7BwpZDdxAlk1aiLz3
	T+kp+neiHbh4jlvW4gIfaO0t4WyR/LzS4Jx2sTjw5pav69bXvC41HMqUvo1u/vvv
	DkzCpXSH/hKdCUxg07ktXNIYiMJsrevSHkw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91s4g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:00:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba268cb5e6so60796235ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680823; x=1779285623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qCpThYaxG6jHZBAd7Jq5rIBXmgO7auE8lOiAizRneE=;
        b=FGVRQoLECjqkB2F6guR2NkBZm9KCrE4OAybpBSRJmwbRSZ6eLb5CXK/C8eft0+dpRY
         AL0coiwaj1K2ALRON54aCwgyqDw+DFdikSKzLLwOze3LH+NMGuRN9Mmid+33rRiXcVcG
         c62Ibo93S7/g0kYXr/fUTbiT4T5ohOd3DxJ5W2WMpNUoe+1e8ODruIM7S+nV2ku3bseZ
         GoDRBQtsCZS2BkuSyhupN5DtgFuMvhl2yuvFzDgmFy/aoh2Fk2+c2TJ9Fh7n9gat6qRf
         wq7PmY9SMf8Flu7tYUkzYPX1xk/cnpX3nHcKe0dJLdwlPlUnUF5zdj3F2rQDAMp/dhrh
         wwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680823; x=1779285623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qCpThYaxG6jHZBAd7Jq5rIBXmgO7auE8lOiAizRneE=;
        b=HbgVgzRtc0fNq9qT20cA2sppEJWUNfZrXhhoLQSjkL9wLuTloloC9P+Gw3WNm1tdtO
         P35bvLG+OtCcfLT+cJr+2DdgeXdDtWTdsasUIYgXBFxZjlttbfzlEVYy525mhB43Zaq3
         8V9Ntsy/Jo5QzYdJCgqQLVsLUA45JcuSvlaRYAeqkbg6vogYdVzXvP+/aTtdp6VQSyF9
         MiwZWNIK/r8bwaBXKgAD/5N6oPWnEm9XVjbZkKCC16+qHdEEvb0BJ2TYfJDnbpSO+x/E
         btyF8E4K37Op1ge3y36dhbKKpcjKjUFfRZ7zmcY70VHXau5yp4d0AmkdfqN2wKLro6ac
         +plw==
X-Gm-Message-State: AOJu0Yw+ENtNKI+WeXShP5tI3nfqrPHUg5frzmIK8ASaASlX1QIiuEWd
	Ydmm2wEkHPS2Qi7pfSnRBNOgBPLg1YXsU4ggLT5dScLtpGpez1vMqvFD1SSnds/eHXzJ3nsWhrs
	78V7GHR5SxFt0CDv0RDM5Ae/NESzr+b2OrzZS+Ygn3GowNqq3ExqfKIgu+BwOvL8fTUrQ+T24rY
	k3
X-Gm-Gg: Acq92OFzY19/0TCvUUnzAEjviz9psWDi0t5M/wv2eOZtqTF9uO9MpqzTdVw1fssZX69
	/Kq/SNEHjX97Yqnu6mM58bmK8IAnQwbWUTGrr4y/q5VNp3ZdyBhKUu1mmTDQPRPlZjT7D9rdx57
	dpsAfwdIYIuQJQrRidD9Jw+dicArB6PLbCGkPnOTJ23zCoWOHhncYVa0uphhkzOJvgSx+gK8fW1
	uCila9pzD84QO3uYw6+xfli8Z1XW6oAVjWNaEOBevg/GwNm3jbhfiXscIJCrnhKrqB75neiHI2f
	gbpiynexy7IHw6TjNPaKzzZb8ao6rCvUvhsOx0J4VUlb9yhIq5w5kgj00MZFLRkKRK/jjIso85O
	TNzvvAeEeS2snjGXYchsg5gpB+Go3lYBhSQWdgfgKQOj9yDtcNw==
X-Received: by 2002:a17:903:1b4c:b0:2b7:af0e:5942 with SMTP id d9443c01a7336-2bd275cd001mr36539195ad.26.1778680822999;
        Wed, 13 May 2026 07:00:22 -0700 (PDT)
X-Received: by 2002:a17:903:1b4c:b0:2b7:af0e:5942 with SMTP id d9443c01a7336-2bd275cd001mr36538565ad.26.1778680822277;
        Wed, 13 May 2026 07:00:22 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ec232esm176189555ad.81.2026.05.13.07.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:00:21 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] pinctrl: qcom: lpass-lpi: Switch to PM clock framework
Date: Wed, 13 May 2026 19:30:07 +0530
Message-Id: <20260513140009.3841770-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MAa0ltwo99DGPaycMAfQTxzq2vr91Tqs
X-Proofpoint-GUID: MAa0ltwo99DGPaycMAfQTxzq2vr91Tqs
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a0483f8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=AVCyWFV1gjYqDRSFLWIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MyBTYWx0ZWRfX5Hyq+6gOGGp4
 pjDNK0ciLqcDGKpFWRhsKnk4OYU4zl3Jut+eThMHfLI8CfYDVUHLh7zeC/HIvgA7pgH/rtJjKXm
 t5+1JIusnZY7OdQvz94G/82FmGemiGOlUBREQN0AfKoXOQIWqhxoKGVVi5hVDNmeUraMzwdv7HO
 D/QQPVl/AOwlajVs0vDUTgMmJF3/7t22lTz9g1oqCvXx2KY/x6qG/8DQYsX+faqbkjAM/gcoPy+
 /ecLkvyv5DhEjR8a/qFvPC3QcVZrJMvD/42nw/plJoGBwzisv3PYmIC1ixYhQhAO0j2V12LhPER
 Cmzd9jPkaXKjRK2Cgyyg+nyqrpmPv0TTQiAcKTpCD9PNk9XCwky3SCDdoi+nMgg7KBP6b6IddeL
 NWVqxfNOr5QmOL96rlZFbW4pnv8CMC1jSKd3cXHh2rha5Bvsgr4DXlojLMA8mwBWh8K53WxpIsv
 zbY0hPp0ylRwPC8i5uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130143
X-Rspamd-Queue-Id: 0CCCC534E0B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107337-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series converts LPASS LPI pinctrl runtime clock handling to the PM
clock framework and ensures GPIO register accesses runtime-resume the
block before MMIO.

The series is intentionally ordered for bisect safety:
- patch 1 wires runtime PM ops in LPASS LPI variant drivers
- patch 2 updates the shared core to use pm_clk + runtime PM access
  paths and completes sc7280 wiring

After this conversion, LPASS LPI variants sharing the common core use a
consistent DT clock flow via of_pm_clk_add_clks() together with
pm_clk_suspend()/pm_clk_resume() and autosuspend.

Testing:
- Runtime behavior validated on Kodiak (sc7280).
- Wider runtime testing on other LPASS LPI variants is welcome.

---
Changes in v5:
- Send as a proper standalone v5 series with cover letter.
- Fix indentation in newly added .of_match/.pm blocks in:
  sc7280, sc8280xp, sm8250, sm8450, sm8550, sm8650 variants.
- Simplify pm_runtime_put_autosuspend() return handling in
  lpi_gpio_read(), lpi_gpio_write(), and lpi_config_set_slew_rate()
  in the shared LPASS LPI core, per review suggestion.
- No functional changes.

Links to previous revisions:
- v4: https://lore.kernel.org/r/20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com
- v3: https://lore.kernel.org/r/20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com
- v2: https://lore.kernel.org/r/20260420123135.350446-1-ajay.nandam@oss.qualcomm.com
- v1: https://lore.kernel.org/r/20260413122233.375945-1-ajay.nandam@oss.qualcomm.com

Ajay Kumar Nandam (2):
  pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on LPASS LPI SoCs
  pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM

 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 114 +++++++++++-------
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |   7 ++
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |  19 ++-
 .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c |  15 ++-
 .../pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   |  15 ++-
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   |  15 ++-
 .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   |  15 ++-
 .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   |  15 ++-
 12 files changed, 176 insertions(+), 67 deletions(-)

-- 
2.34.1

