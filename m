Return-Path: <linux-arm-msm+bounces-87431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C16CF3C8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:27:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83F1530185D7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37B7328243;
	Mon,  5 Jan 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBGByWbl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbu0DIg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC63310644
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619280; cv=none; b=rp0/fOw1xCZDR82lWPJDdIWyzXb8m8SED8p8JydBKY5UtcbSgsV/F9g8Vix5T69PPEJy0R1oXRR/l/YkgSAODM2KkNvq8qUopoxeMXLIb818fIQmLY2m7JeiseBHv0KP3FOUXyDpEjt3K+01MWThjRDNQ00Ik3c+3Iv90vGTeew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619280; c=relaxed/simple;
	bh=FBTZ8+7LvoIsF+AgKhfu2oeaJF2Dq7lHkP4MR/E4HT4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cFbX4zhb/0fFeVFSYoNy3IkafxEjJP5J2oIVaLDmddJHx98XyYWYxAVw/hUDXvXdKF8Vj2esgdhgoeZA2yNadbv3WjQtusKYJeRzckd06T1DIeKFZquyC0Vt5FfLFTrd4Jx9vXxJBsoE7NIMxYWZwHLN1/9InOcO3iQnayvrthk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DBGByWbl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbu0DIg6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058NllS1058794
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MIjPXN/R7lTAMQyxLIdd6q
	T0iyatayMM5Bo760ZcfSM=; b=DBGByWblvu68QBi5fqcn+NJiF7P+mHkA4sSAcO
	2onqps4OJoZePc8gZxH1mcchA1a3TfSTGLtQjWuxd0mIBICI8oKSOxmwaw85qHZP
	osAIdIZNeRfgOYO7opTur0ewQXEU/IdddpKtm+SADVk3xCUibwvpkcyZOvmc3/XT
	vPfB06OpYpPlg5xIW5Mx7M6htfHFmBgTj5NYzXh3yzVM3Kh6JJnjSniZlyM3z6xU
	zaIJipO7Kbeo4EXXUnd8OBjo1mZiYG+o8OPRexvQixzD1BXBTNa6U2iiItPw74vV
	6GUemb9UjrmHmP9LjUwmTTnwvMh+GADEHJiVdFgzUK6/mShw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bev9hch3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:21:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34eff656256so16280395a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619275; x=1768224075; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIjPXN/R7lTAMQyxLIdd6qT0iyatayMM5Bo760ZcfSM=;
        b=bbu0DIg6qA47s6KleiyZRdxeRLEs1DkkX0m0XEExcqiDL5qDpcDweYDt8rMelAQGeh
         wS9HtCLHY1QcJEyUT0KM54auB/xyNwI4jHBjqk/d7dMwQPPPVLs3LQZvy2q/6q2aPvxs
         Kj/V+Gc8T5GNdXUN3/zlxsKlIdhVxekpTB9dfJwH/zSLYI7PWhvv+VxsQxoOHPteENEC
         sBKXAR84fPs4gMK0efSUfvQt4ayqiEgt8IyRKNGQbFg1ALjhbaLnWA8QBn0IM9UXiFaq
         k40616sQtBF29GrGfBYqITGKGr6WgomsUNycbTHgIBIkbHcrXAxYKd8qi9RaiFo2eQnM
         TBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619275; x=1768224075;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIjPXN/R7lTAMQyxLIdd6qT0iyatayMM5Bo760ZcfSM=;
        b=PRTTr/nubB9SeAxLxvNS5gYDiHi50kPLBIHw9tlceWjqnYNnyBcUYmQNyJiH5Bk5zx
         6OizNWUsAzTW1186BhbTaQm4V03hlSQXEjfL0I3wFEJlMXCzWrIt3INNk35QPNJ6sosX
         33LSRHlSiPoWQ3KQ2k8SwQFi7To8NCQXoMhfsFl6s0ugAA3yzCOHW5pzXSg/7j5BZtNz
         K/vNt7CIc64qSYIfu6P+oXdN1vuHgGiV505hAGwwHdtEZLNRO1K6L7r3ZtObK78TgCVo
         hSTOHgUd9kZn2PqEi2YJ54Q8JcjD9bqyWMkWxj310a0HjdBdjALiW0/Adwot4hMtAn7i
         WyCA==
X-Forwarded-Encrypted: i=1; AJvYcCUXfUyRTH0gwdy3SCAgJh5iq8EXOqD0FPW1j5Lm+odrCk4+wlYTGF4iTP2x4eGtqSH/GBcBn0J5dHE9lYjb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx19A/QuToao4p8sAJBYtZ3zqQ86Ia6Z5rKuHWeh/QkqUqs0+IV
	O3eM0DeQBb7/lQuEp31EnybIElQv8lK7ha7dVTrcQn7hV7ZTU7FZZA9Sjd9zdoRyI62QCyO0RWM
	pnJFmlWdSURJGe6g9ah8ZaIyt42kaRcaf9VszVU1PgRuKwsGl6/Cxj8hoYaPXjE9b8fuE
X-Gm-Gg: AY/fxX5W5yuIf5K6OddeEKdgWKvDPLeFsN/ZX8k3hpdfo1EBPNN98YQuTyzpqnx8eBh
	68KsLWbtIUpsMSf3by4Ibhs38qv/j7i+EKA6qTMBkMJKzsn3ELkPCETqkJG3JQcipe/FcZv8Mbk
	CzZRmJvwmw3VPOKx9pJuKdQEpzyrs1tPkzdaTLFdvOZVKCBaxL6LySg+nPCvGN5IfpevealbuV+
	xKzxPG+BfaPutCwhs+tRL10Stu1M8HF1q4m/2XiEZjxrOa1vIVbViqV5RPoRPfqbHi0KzTcf94T
	tjDto1NYvT6BUrvZPryNZhx1i2XtEr56wg/lGwhyUEGT/iJCpZxk15RVDfN10gYpETL6q0rIQzt
	5K2GogPK5Vv3JLFLhZR1vN4lHr0Nk3mhyxdQFJq5qJou3D+e0zisD8JiGz2ezHDoSytYEmsKAWg
	==
X-Received: by 2002:a05:7022:6290:b0:11d:f440:b758 with SMTP id a92af1059eb24-121722de94dmr60838008c88.25.1767619274615;
        Mon, 05 Jan 2026 05:21:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi7wwgXlgpNSgQhXunkoDlw8+l1BKCGdKng7r815BSVKW4edu0QNsj4YCyHm6NQU/E1rLaaA==
X-Received: by 2002:a05:7022:6290:b0:11d:f440:b758 with SMTP id a92af1059eb24-121722de94dmr60837968c88.25.1767619273931;
        Mon, 05 Jan 2026 05:21:13 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfd95sm165866042c88.1.2026.01.05.05.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:21:13 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: Add Mahua TLMM support
Date: Mon, 05 Jan 2026 05:21:09 -0800
Message-Id: <20260105-pinctrl-qcom-mahua-tlmm-v2-0-7ac036f700de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMW6W2kC/4WNTQqDMBCFryKz7kgSgy1d9R7FRYxjHTBGEw0t4
 t2beoFuHnyP97NDpMAU4V7sEChxZD9lUJcC7GCmFyF3mUEJVQspFM482TWMuFjv0JlhM7iOzqG
 uqlrr1lCtLeT2HKjn97n8bDIPHFcfPudRkj/3/2aSKFBQ112l6cWtVQ8fY7lsZsxBV2aB5jiOL
 /ffTifFAAAA
X-Change-ID: 20260102-pinctrl-qcom-mahua-tlmm-433644bae64c
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619273; l=1372;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=FBTZ8+7LvoIsF+AgKhfu2oeaJF2Dq7lHkP4MR/E4HT4=;
 b=115sBtkA56uB6xtdPLDa0Fre12/Rff8ztKCWNYacDhtC2p3j5bINgRfjWJ1GvsizPqfOXWikO
 4j0Iaa2BDnjDGSlpFn9Ncuetp/r67wSYyZt4DacZbMT3MRv831R4mJp
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX6l2aiwfmUtNQ
 D5JikamPtNSamykCcgFDzJWTqj1UQocohWw9DQtQIN5Ea2RiXZA0LR0zDM9mZxVIoB/NfwvkMqT
 qdKAzA7rtRKkmI5RYmcsTQ1yz7TOfG3XvFkTkq39X0mvxW3nWs1/V3ZTPksVrxavCF1c0Rn7V26
 5s2UN3c9dxAOpFeILEIp2nRG+fNIyz3mhubKKYRiAYYFcYZlLrERsD32QsWNESMtE65R16OWHbR
 Q2rVrItBEm5ELsxyXczs0vmcVC8jcXCNli2SYlgUGQkhjVF4HqNXxhVndMVI+KfoXVm9cQAGWPe
 7ESmaaGZlMsbaK4by0cG36qHOYgwdoMgYzHdHAsCQAZkeyruly67AMTcijJhqSQQBCOPpE7JVjC
 59owUXSwx9FwBI2MDEtl6G2J/NLg5MSNJqdomFKTc/fY3oIya2uVo5vkYiuCOmcSh7u0tCSRNHX
 td1hMbSpJEco0mvFXzw==
X-Proofpoint-GUID: HjP7wM48XMEj0rtXcP8nFqE3xOC8JCYQ
X-Authority-Analysis: v=2.4 cv=RrbI7SmK c=1 sm=1 tr=0 ts=695bbacb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4Q-EQNNWwN3BBnYOq88A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: HjP7wM48XMEj0rtXcP8nFqE3xOC8JCYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050117

Introduce Top Level Mode Multiplexer support for Mahua, a 12-core
variant of Qualcomm's Glymur compute SoC.

Mahua shares the same pin configuration and GPIO layout as Glymur 
but requires different PDC (Power Domain Controller) wake IRQ
mappings for proper wake-up functionality.

Changes:
- Add DeviceTree bindings for Mahua SoC TLMM block
- Add Mahua-specific GPIO to PDC IRQ mappings
- Add mahua tlmm soc data
- Enable probe time config selection based on the compatible string

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
Changes in v2:
- dt-bindings: updated commit message based on review feedback
- pinctrl: drop GPIO 155 from the PDC wakeirq map
- Link to v1: https://lore.kernel.org/r/20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com

---
Gopikrishna Garmidi (2):
      dt-bindings: pinctrl: qcom,glymur-tlmm: Document Mahua TLMM block
      pinctrl: qcom: glymur: Add Mahua TLMM support

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml         |  6 ++-
 drivers/pinctrl/qcom/pinctrl-glymur.c              | 43 ++++++++++++++++++++--
 2 files changed, 44 insertions(+), 5 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20260102-pinctrl-qcom-mahua-tlmm-433644bae64c

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


