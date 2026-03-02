Return-Path: <linux-arm-msm+bounces-94793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG/yKT1KpWlj7wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:28:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 260C01D4A0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CCCB300A7F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 08:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1577C379EFA;
	Mon,  2 Mar 2026 08:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HE8oc1t0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g9dvTJHD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C07317159
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 08:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440122; cv=none; b=nfpAEY/6a6wJ1oWkmyJk9rGJ3RRZdDoiISIXLkMhQjTohKVQNibgWz7xV+BDfsygWCvdLdRFnSoKgny/AtrQDTHUSy+yN2nG5Fo3W8MYl6gjz8eCzqqdg237wnJAhLhhl7GZg0JrTYixdeqB2+G0a/nx9yCRi8wNS92Q3gU5llc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440122; c=relaxed/simple;
	bh=Y5aDWPMKW2ZYmyIHMW0epLhTCjFZ5jh2nTzoMStbjRQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A6XlCy+BE7y6kmt28cw6eiLQvAlb1mWC82IXVkDc1mHhy1G5Soj1HdSxR23KOlYENzUsPGcqbZechDHZ0Q5eL34zC/LYnE2dhAnYbln8lrPt68LTG9YuZFTrdCXBCPXMxdoVsPvaH4EoyvrGOVtzo1PhaZq7f6QXCY98wpVqxwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HE8oc1t0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g9dvTJHD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228DJ6F085747
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 08:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V/IVakVW78BdWNeieKZ4TK
	ptAL76VoMJvEg376hXkcI=; b=HE8oc1t0BdZpj13HBTKph0+bsbEHTwVso93VoM
	Fdj91+dDjiunQaY8xrcm/30y1q2yMiibRCYs5+iNmEyeuN8lWxLehNnhiE4ySmhU
	5g3Aqkni897b4V/csiD4fPhOgHtzYCElpKizwIPifQ8404JEy4LFEGk78652Ypm9
	RpuSNaaQ34LplldiwkCyCFJdlbGIT8vxz4naQUevsQs8y1plmGN3CR2l4o9zi8O8
	Hyddg3LjV9C4q3eLT64ER8aTPN/869/iv2mErfbtaENUAQqXBCkjVnnT1Rsx+R4M
	h8W9cDkM9MZ8uA7aAhIV+FZdztmCtM/nRv3Pf+gHf4s3GU/A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6mnck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 08:28:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899c4a7c6c4so557867916d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 00:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772440119; x=1773044919; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/IVakVW78BdWNeieKZ4TKptAL76VoMJvEg376hXkcI=;
        b=g9dvTJHDjDeiBb32XbL68iIcUw2ckXSHAzqio+b0lq1e8snKQf2BPahoY5BI77QiY0
         Vv6A+1MM4m5m3Fkwlgl/3A0M9/YoGd7dcki6RoTZo+nm/0y+PYtltI/frOmZmnEb6w3H
         kPuBqLRpyA161+LHTb9yUqGXGC2+OebLHzFdztMA1LgF18RAIHttz4iMElefnDC95tyv
         w2UoNEOGjpuy83oOdpvXnmzDZ6Q6PO4L/Nlv1H5jbCtTOgnPr6mcbE1JcQOSLRplLHsx
         x6wzalEBryGdoLyyfc+9peR0NQQfwY2STW+Bpo4diTGqwgomCQT7AEC+RkWYh4fMWROh
         UFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440119; x=1773044919;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/IVakVW78BdWNeieKZ4TKptAL76VoMJvEg376hXkcI=;
        b=DZLcCSzkZFO1xyqcDcDNVN1SrV/J4UsfjkOrEWXzXBb5Zii3dxflO7WMq/jTKteJqL
         yhgiVSkSWl8JOqZaUASk3j67h7HAkHx/2RxGcgzgrGi0olqHz2zwwX2Fdfgru/4btvR0
         830kvzT6RESItzW0izzCwlVJgmkLpEOgDarBpiT+n0JbtKCqfuiKS0LMoeAkX/DknUXz
         G7i9TbBYJukMjM6Blno1icRZpN8qDoO5+7zBXyAaoMBMpBwxndTybDhdwiAdFGQ2HWHE
         lSU3QyjMVFNS6Gv82l/dmP9NnW+RojoLzXB0RUzaglX5hmJQpCchP060XK4WWDkxAJAH
         cGqw==
X-Gm-Message-State: AOJu0YyVAmlbLjK8RmdRh+eRI+7LpvPq8jncWqlF65RjXymq4y47X0/j
	Du6qN9U2XAhXdvgpM4BgaBInsMjePJ6kjT71jYBmPWaSiLd+JkQldOMqqmD1xcQgm32LgJ43EHW
	rV3H1dBsy2k9wyJaS4gVDb8YxE+jZ/zQNRB9Up1kppXArzQKcPl5+LiQhXF7wj+Tlctzv
X-Gm-Gg: ATEYQzxYO5rRXixUPFHRnT/79y1A+0A9kRZhIK9eI8w3NwIei+Txuoj9anqHyYcVogM
	AtpexKNIdRUsEmBdKra/GDhes/aJcLdaqPXo/HhV15Zsi30BDbrPqGREoJ7HyRnu+cJAN8iYBpd
	rG4I39mDhkBrWfm1+2GLmYYiyxoYPZZGXw6HaezDUVHNtvKD28vbFdXswNLfKJ9WWjBtRarWQhL
	As1QRnz/Zt/DOEBqQ4lNr/tge98/UkLPVVbzk5fBDEfNtgjcyUBxxaY793tEcESK5vST47zW2Fx
	iAXmEqbAHDC1mxvOikO4dO9tAYw4UgbreiZznOpPK4Z1CCWqttOWAmi0KclaV2YOfBMoOU/YIs0
	jO96nO9XjNH/qHgir0kqm3Z5qyQApdnKmstUm6Fkt5zxpBFMjLFDKoyoY3fmZSUstv5xJIEKAye
	hM47zhato=
X-Received: by 2002:a05:6214:5013:b0:899:f39f:b884 with SMTP id 6a1803df08f44-899f39fbb42mr44298036d6.9.1772440119004;
        Mon, 02 Mar 2026 00:28:39 -0800 (PST)
X-Received: by 2002:a05:6214:5013:b0:899:f39f:b884 with SMTP id 6a1803df08f44-899f39fbb42mr44297846d6.9.1772440118576;
        Mon, 02 Mar 2026 00:28:38 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7193227sm101354696d6.21.2026.03.02.00.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:28:38 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v3 0/2] phy: qcom: edp: Add DP/eDP switch for phys
Date: Mon, 02 Mar 2026 16:28:28 +0800
Message-Id: <20260302-edp_phy-v3-0-ca8888d793b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACxKpWkC/2WOywqDMBBFf6XMupHJS6Wr/kcpJcZJDdRXYqUi/
 nujXXYzcIbLuXeFSMFThMtphUCzj77vEsjzCWxjuicxXycGgSJHgZpRPTyGZmGcrJFUY6EsQko
 PgZz/HKbb/ceBxncSTr8nVCYSs33b+ikVkMOyrNDqohAmd4XOpSKtjJHKaWfRCIuKW9hdjY9TH
 5Zj5MwP2d+emTNkQvKyFFXlpOPXPsZsfJvXXpmlA/dt277nI38L8QAAAA==
X-Change-ID: 20260205-edp_phy-1eca3ed074c0
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772440115; l=1579;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Y5aDWPMKW2ZYmyIHMW0epLhTCjFZ5jh2nTzoMStbjRQ=;
 b=OZ8EKpW3QxKtd+ZR7RvubWubP4PytrhWZXyB5nSga4Da+OIr5xCShiLPwc0PjJIW8Q0QYTcG8
 TSW8oFDVxSMAPVcnFIYvGAIvu7j317wZS+BfL+zpqRrStJjMta9PGPA
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: x5lq_CjRO-aTlSi1K1LNFfQLsZec4KGG
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a54a37 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M-2OMZX0rM6BGFiE4MwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3MyBTYWx0ZWRfX0LRJjGI+DddU
 cjcOJVxwqSGQtY7q/K/d/Qu9qxT1JciSH4nV+2LdhM1d59+M/sO2zj5jxOS6CfZ5TVGvD36ARHP
 2lSEreyeRpoSvtXfXVdOzxAQbLKKupLx2imMFQ1on1yO6WWFjfvvbPNy33jndOGHTrfeR6gLoHk
 D80ljAghIPbBDue0W+Z+bto2Z9HMUni5fnBAP4VOiqQMqZCszewu66PBJQS4NGHjparE2d2F8/V
 3GpUUuvFvFOst2ng/RYJSietQkDw0YsVQaoepHkvKt0sv71LzHMDoGwMkpXwbHykhjH9TCEP3og
 PGX5WSXvuXkG/zsCr/T6ATVw2N/m2OA9u4b38PiwjBiA0JvKYZ8f36TE07XStjSsjzsLl1Y6Sdg
 DfR8UWre7nG981ittxvuDJOh7zT0jdpyo/ZNk1KNO0trH7JBFf8GXPnBwLe+6qpUEWnN2+6ySOg
 d0XU5v0cDr0dEwTEwmg==
X-Proofpoint-GUID: x5lq_CjRO-aTlSi1K1LNFfQLsZec4KGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94793-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 260C01D4A0B
X-Rspamd-Action: no action

Currently the PHY selects the DP/eDP configuration tables in a fixed way,
choosing the table when enable. This driver has known issues:
1. The selected table does not match the actual platform mode.
2. It cannot support both modes at the same time.

As discussed here[1], this series:
1. Cleans up duplicated and incorrect tables based on the HPG.
2. Fixes the LDO programming error in eDP mode.
3. Adds DP/eDP mode switching support.

Note: x1e80100/sa8775p/sc7280 have been tested, while glymur/sc8280xp
have not been tested.

[1] https://lore.kernel.org/all/20260119-klm_dpphy-v2-1-52252190940b@oss.qualcomm.com/

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v3:
- Rebase to next-20260224.[Dmitry]
- Only enable TX1 LDO when lane counts > 2.[Konrad]
- Link to v2: https://lore.kernel.org/all/20260213-edp_phy-v2-0-43c40976435e@oss.qualcomm.com/

Changes in v2:
- Combine the third patch with the first one.[Dmitry]
- Fix code formatting issues.[Konrad][Dmitry]
- Update the commit message description.[Dmitry][Konrad]
- Fix kodiak swing/pre_emp table values.[Konrad]

---
Yongxing Mou (2):
      phy: qcom: edp: Add eDP/DP mode switch support
      phy: qcom: edp: Add per-version LDO configuration callback

 drivers/phy/qualcomm/phy-qcom-edp.c | 176 ++++++++++++++++++++++++++----------
 1 file changed, 129 insertions(+), 47 deletions(-)
---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260205-edp_phy-1eca3ed074c0

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


