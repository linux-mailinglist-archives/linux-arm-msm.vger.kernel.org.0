Return-Path: <linux-arm-msm+bounces-96924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONndLiE8sWmAswIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:55:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A672616A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2302E30B6CFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4744E32AAB2;
	Wed, 11 Mar 2026 09:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZqfmXmW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8Ec0JVQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA04E34CDD
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222356; cv=none; b=pTbWsyKfFfBPafRxIEk0T+MoP/xl9x0gFEQoIM1QGzwFGRgoP/6hV2J+D+hZGzSRH3Cd2Tt20erpOBitXnHVsy1tOs+9wj9zdHctB5cPmK9BTgroNGEJeVt5KZFNNhcTRrfCHOQh0faSgUlHvRtmOCsTWi8xAN+CR7ZtN/MtIeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222356; c=relaxed/simple;
	bh=eviXIYp4+eDp8HGG0HEzP5fhxPOfHlKuW+1tv7onERg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZHOplU1IiqGYGklYu4lTqIxvrlnmWlNvtHOjQ5++Zc/b6hVOcrEQ9MU0OoNN9c1fy2fuz1zxMpgaPRtENXlOm3yJdXMutGq0qUM7c9HV9uDda0KHSFfo9mh+XdI7oEOBK+eYwX3umvacy6nEEbaXxAwpOhR5x7GL7T4DmRE/vE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZqfmXmW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8Ec0JVQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B7brqp1265877
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2tXyMSW1oEmLQusxgSGNZX
	zPqI8wrzYcRuxPzyxCXjI=; b=iZqfmXmWFV14MX6cr8QujjBQrCTNQy8NP+KawW
	myNRn8Wsd34MB+mujsBIwpy+N3Yw3hjRX+bXlPo5QdQtNB1aSXgumGg9bIqLIZf8
	o1hb5XtrSxWjuD2w+VhPp1XZFB1e022vSxIfVnOERVF58Ya7hyuzk3zDqz0TwqMs
	RbRlhmrRbOhkvy24w3ZacOXtT4xSS5YmiILzTYTzx02uoSsGUKmGoghLjCaminLj
	BKo57SiNYPD+NcqsBbJlMiFBoFh3lKQytyO+B1lUfJ7jeTfvfhGSEOoLDy/nwtLp
	vw7Hv5bMLnZHCJwh5KuPtW56sVYsT3bav/fGeWo2beulkleg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfkbbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:45:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829b20cc6faso735367b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222353; x=1773827153; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tXyMSW1oEmLQusxgSGNZXzPqI8wrzYcRuxPzyxCXjI=;
        b=b8Ec0JVQGyld3JJjBL6OcbaiMfCxRpcFMXkUBGbWLQ6QsgAtparFQ5dssGfXXkzrvG
         pwfMqTv9OhFdlRZSgOpKx2tVS2lbyR5V0v5c9aotG8rAhFosTOqognCPFu0vHGDwcnMe
         GD1335FFX+pnuisvaCHzxHw9O1SobJXSuNkZRRC62ihG75n2yIuBy4/QHUHdhDqznNtY
         cvyQ9jsgfnAuWbZylGqyIAhShGKYvpjIDYsxA4MgZKuHPC8ti/dwXnN/CxAO4b6aPFGN
         xxnQUVWzRdyyP+4LDAWL1er/GSpSrU71x9y5u5hIknE0XrHv197TKquoVaKKqTxa1flZ
         aWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222353; x=1773827153;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tXyMSW1oEmLQusxgSGNZXzPqI8wrzYcRuxPzyxCXjI=;
        b=dH4qilKkTzctJGUtHjaiSz6iMPLngPkqFmzzFBuBf3kA4s+2TGH4tTW4AI6T28QyNb
         UTMonjqqDMeKwDoqpfsLIaS6KXJ29p9C4+5KJKuzaJ4dtxz0nfOl8tJZbOnAliHcQ17P
         D9fxkNNPNww63U7PEd9PqtIUPGZ0+eiT0vzmzRwik/B/RQRXcSVjLXM8xPQYPe8sJm/E
         w9WHOocYraIK09g0AA3fJIf04EaIPPJ8cCThNpJ/0Epy0uowkFieypev+uePKYRIoUNS
         /6nllncIh57KKO60VEKVkplRCoJI1vm2UYeepMlCjIHo/xgS1Sxj0sk0RmBmpSb/K8j5
         U35w==
X-Gm-Message-State: AOJu0Yz8xRupEFJvM6r6eKzdhzQRKzf6aBFNLvACYNf07kHc4pxVBUMG
	3x6jT4hLGnKqzoxo2PxGmlhuiCvFERRgs5R1bQCiVAuaBI1m1sIbAjLzLWJ/LZvaU+ZmRFK5Loh
	g0ihekvfadOF0FtiFkOL8qG9YvKOOqt1BW7sh3U7zUd1BOijZxws981Ac3W+oKm93gFex
X-Gm-Gg: ATEYQzwGyuk32Q/KAHBEveYHGA0M/Rjul90Ol0okx1WPK8/61povbLLBn/f8Hh9IO8D
	Wkw6VqDpL6RD/sP+3TYmUR+ln305FffJB9UAgRJMc29wTtKTWElqWsU6jvFeY5kSyvzAqWjfF0i
	rCqSza/gVi+ab1ZirlrdANThB+iV/aL4zA8NN67HEK84S9kDn8CCi/sM+NiAACJSenaE1FynbWJ
	s+hxLYINB6Z5+7Ju8WWqE13HNn4APkzRY5TvD/0qdfa0hbeeq4zTQoRqcQ9TtSWeBe4Dh2DIbzt
	6orwiRB38i6a2EJOW4yQPdwRsZVoxfKWOZJF+r1Ts8BxPmm+3I306ix9magG+1DnPkXAtfi/Cpa
	JErZSeYIIc9gp6SXLrCSa00HIUlXtFMYj7vkAXr/Jc9MnzJL2zrmB4pGapYAHCKWqL45So5a+gs
	B2u4g1CDdAAXK5vWma+Bd8uVN2/e1WvrD4q2nifQ31p63Ua8mahlNWIsvp
X-Received: by 2002:a05:6a00:2e21:b0:81e:1b77:9e61 with SMTP id d2e1a72fcca58-829f7aec3b9mr1907953b3a.25.1773222353522;
        Wed, 11 Mar 2026 02:45:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e21:b0:81e:1b77:9e61 with SMTP id d2e1a72fcca58-829f7aec3b9mr1907936b3a.25.1773222353019;
        Wed, 11 Mar 2026 02:45:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:45:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/9] Add minimal boot support for Qualcomm IPQ5210
Date: Wed, 11 Mar 2026 15:15:42 +0530
Message-Id: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMY5sWkC/x3MTQqAIBBA4avIrBMmS6OuEiH9TDUQWSoRRHdPW
 n6L9x4I5JkCNOIBTxcHdntCngkY135fSPKUDAqVwQJrycepVY52cC7a6GxYadtkWUyD0UZX9Yy
 Q2sPTzPf/bbv3/QD9J+vpZwAAAA==
X-Change-ID: 20260309-ipq5210_boot_to_shell-43db656579f0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=2640;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=eviXIYp4+eDp8HGG0HEzP5fhxPOfHlKuW+1tv7onERg=;
 b=kJs9VJObKPcudpWltfXd1Qb50PPNBfrTcgJEEIC/F6WdErLIWUhwc7572vvZfrOYf/oGpK0TP
 y6Eg+2e0UH3Cgz9cp5pAmGiT8REVvYfBr5Lb3xFC/Nija245CtfnUOA
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: 7cHFYzayGVle9fDO5c3Eu7YdIgzGUnBb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfX0jbM3Vdcjo3M
 ts58znX/tn3KTHsHq2anBIfGcMwOp1fsYVP/dnqd4PjPuf1vTLEUkLIxYsV7ZpFVUhD96yaf0ap
 KKEOIwUBbZCiY0PAwSuvsnCWy2wHnclcz2mVJndf7ENmE6Ln/lPchM4C29pFjYEosqRir9CIe0s
 ag+7PZM+dT+xdoeOD0uhMudWBX8ZDgzz5gggTmGl8x0uB7W9Xk4KVH4IVbc1rKeB3HD30osi/Tn
 eN/yc/1gOV2JGBLQzX0NVvpnA/++3RPSsCLdrOollUSbrf8pQRA1A/EdFE0mnYfCsMqeLx4Y85h
 GF7VFvEfFXaQyZIm84sQ7ITxW2FunWdbmIEHhhKDNQlDYTcj4RT6tuUPTPwIe7RvKieDIeVhcVV
 lZCy73Meq+w4p9cSROz9KlARslZc0EssIcF56lOAzAupNeP8fZQrPBPGab3vwzoc204OTVUlunp
 pyiOnyD4koE0hEM1MMA==
X-Proofpoint-ORIG-GUID: 7cHFYzayGVle9fDO5c3Eu7YdIgzGUnBb
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b139d2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iO1PHWQBdAPoGl4AmagA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110081
X-Rspamd-Queue-Id: 48A672616A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96924-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points. This
series adds minimal board boot support for ipq5210-rdp504 board.

SoCs based on IPQ5210 is shipped under 2 different marketing names such as
Qualcomm Dragonwing F8 and Qualcomm Dragonwing N8. The difference being is
F8 parts has the Passive Optical Network(PON) interface which acts as the
backhaul where as in N8 parts it is ethernet backhaul.

Qualcomm Dragonwing F8 Platform:
https://www.qualcomm.com/networking-infrastructure/products/f-series/f8-platform

Qualcomm Dragonwing N8 Platform:
https://www.qualcomm.com/networking-infrastructure/products/n-series/n8-platform

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (9):
      dt-bindings: clock: add Qualcomm IPQ5210 GCC
      clk: qcom: add Global Clock controller (GCC) driver for IPQ5210 SoC
      dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
      pinctrl: qcom: Introduce IPQ5210 TLMM driver
      dt-bindings: qcom: add ipq5210 boards
      dt-bindings: mmc: sdhci-msm: add IPQ5210 compatible
      dt-bindings: firmware: qcom,scm: Document ipq5210 SCM
      arm64: dts: qcom: add IPQ5210 SoC and rdp504 board support
      arm64: defconfig: enable IPQ5210 RDP504 base configs

 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../bindings/clock/qcom,ipq5210-gcc.yaml           |   62 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 .../devicetree/bindings/mmc/sdhci-msm.yaml         |    1 +
 .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        |  141 ++
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |   93 +
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  304 +++
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq5210.c                     | 2641 ++++++++++++++++++++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq5210.c             | 1156 +++++++++
 include/dt-bindings/clock/qcom,ipq5210-gcc.h       |  126 +
 include/dt-bindings/reset/qcom,ipq5210-gcc.h       |  127 +
 17 files changed, 4678 insertions(+)
---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260309-ipq5210_boot_to_shell-43db656579f0

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


