Return-Path: <linux-arm-msm+bounces-101272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBVtACDjzGmjXQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:19:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 917D7377742
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A6A0305000B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D3D3CF690;
	Wed,  1 Apr 2026 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eye0V7bv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9J66q48"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E608F3CF667
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034941; cv=none; b=iZ25aCIcadz5YcweaY2G3lLNTehIXJPiALNGN2esQdGr+D1JA9SNb1icMHPhq8VbVsoXm7IvNispWl2XKZRRw5t6TDOYICUIrDjVW8IFRTU8E3C8ZdppoZXier5nexgtJdb3bxZyTLO2L8zRwvp+PYq9p2qQTIqMthpzwCbngIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034941; c=relaxed/simple;
	bh=88dvcps1dv2WXNE+TIBwTsSm01dkH2Ji1OH6My5vMKY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J5XqnwsLLhFRj2bz0FwnmE5ePjUeB/OcRBg291oisoHSaYyvL0cj8goSMQepFG4l+kWFIPl2v+gnyqeYDpav89veAb9l5p0YxBFTiYZpEQQ73kN9cgLR0+njziOAl88+4Wxst3lMWmmyvNp0cKEEmBbKwZX+HdmYrhx34LQfl2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eye0V7bv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9J66q48; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63172qo33103854
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=23oAQOYzkD0eXYAJPVUK8k
	5oiGtDoTeViqweGnAixQ8=; b=Eye0V7bvN2hi1m7czpS+vMwOyIWUTSJoq9PwFM
	TwwQ9phl8kzBPFZ5BLSWtabbpWWzmo0taNzcEoiqgNTIB10H2j/YUpCyDH3ohLxO
	hAC20VlS9o8nVZrXJv1Wz7kMpGPaUE+gMNXQ2NmGCtayZ/g4XPL+asfAFbsqBb/s
	mx1+06rikr4llLfyKvPfvwyiv+KkIPk2qc0C1KbTQjjLj1EE7tAlXvmZpi149qdG
	1J9HQ1l+DwhVeqrq8WTqnAlBJvYOz0eTd3pMGDvc64R3SZ31IukQ1JyflFR+wsf+
	Y9y+a5A8Mbc4/rae4znIS3jBXwQR4jQDUuQOb6wp6JJYqa8g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js23hyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:15:39 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-127133794b6so7771273c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775034939; x=1775639739; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=23oAQOYzkD0eXYAJPVUK8k5oiGtDoTeViqweGnAixQ8=;
        b=U9J66q48mKprDzcvy6asyZeuZCATlEbxU9t1SIT1wpr6A6GYnmCFY3zzXblEVSxS/X
         371m5i6WI7p9FpD7Tbm18HOAvKbqsFou0B7GOYxrt6d9UWeN47IkhB0lNCVqC/KsBU1N
         +X7T2amvtkM3O1xHHR8Xlh5mXxl4AY25ajPue8gNribDaP1NldZOPnmq98x7d88bPvRw
         b8efK9xN7iyCEFSloPdfCxeOuui9zQWWGZXBggEXzUGxlNlnQLkYozwa4DwYItLD7N/g
         dKeGVFvKU2jUJyoG3hn5JYfp3J7dl/Rk/gvMKTw1Szx+wXRBxcwI0YXnGoC0HbsCjDLx
         SJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034939; x=1775639739;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23oAQOYzkD0eXYAJPVUK8k5oiGtDoTeViqweGnAixQ8=;
        b=PKMadjQnpPZx3Lzy+D5Ke2lLGpDM+lP9Z87yPD/lrZapqSe19A3JqcLXaNQf98apu9
         pes3r6FuTDLc+QvFbjYyrcqg2t74P+UwaPq+qVkEObUdCpZUczoyJfC38jD/mUDfowt2
         JX5v1FJMfMq1lQYgxpXRI76mNqS3M+9NI5fzstFYq8cSZe6KjJ8FBfgybmPKzqrsrBdq
         VY8qO0vI3rCnRDqRSOt/jJwr1JDCI/XjRubkWvoWHFNLYzQ2FU9JHYlqITrM5r1MLb8q
         XRz9k7yo1y6V1RM2UnrV3P+fy+5BpSFrjbFmnOQzY1vrQ1kNp1l3NHuBY63azw5nSwR2
         KCmg==
X-Forwarded-Encrypted: i=1; AJvYcCUn+IEo8rW3F+fFpizuW8duoHusvJaofldvITOfzRcRQEndL961ncInDyWEC7Rh+vw7Gn1lISS6i2Fjn7JV@vger.kernel.org
X-Gm-Message-State: AOJu0YyMWH0zwipigVx0CfvRWexQXlFkgPyGnQK69qgzuOxTNmxtvWag
	UUj2gU5gdIphT+PEbDQZcfxK8Pqt0d8e+/pNDVNC2Fh922f0xOfTEuM2OSmIuYl2IjpEl/vmqsp
	8Q1nC8Dx7qawOD74rudMPRzObhDin7NNd7uzs23BJ6ZQf77m/12KXhypDxOtLiklD0zni
X-Gm-Gg: ATEYQzz+0JutZxncCskfj0iYmFsCxw7rOo86lSN2ErhXsLC/YyuYfaIwPcUwfiIFxuC
	/xoz8cwzdxKJFC7senwXFqX+mzD1ozQuFlOlncjHap/u4mG6imeCOYlAcUxFAanzUE0fR8evXFn
	6dwVA9dso0lzYj7pa+YdS3ErGPi1WIh4rOJIs36RuU7/gWIIPR5OcEShVwZQizrBr/dVfRRoyAK
	YxeBdx1Thv8MHEe+XHr2/HJ08L/2dX3CRhq+HROGzMozaowErMMkbyDabM/z8SPQnnrMPnF4vaf
	9FTqll8FeWUFrjEguH5IfKUrjFB36SPOYc0OGvkjvl//Qb33BsGDI1kn7WC6iVICUjJmKmpIS7+
	wqnb3cyDQFDyhZIbR8jyEU+QY4gJuPWjwsvt7sz6Yjk8NcOX8d1X9K4jVqvVv9gZDrLs26w82SQ
	==
X-Received: by 2002:a05:7022:609d:b0:12a:6c19:d222 with SMTP id a92af1059eb24-12be65844acmr1420605c88.37.1775034938516;
        Wed, 01 Apr 2026 02:15:38 -0700 (PDT)
X-Received: by 2002:a05:7022:609d:b0:12a:6c19:d222 with SMTP id a92af1059eb24-12be65844acmr1420565c88.37.1775034937585;
        Wed, 01 Apr 2026 02:15:37 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97efb42sm18285025c88.7.2026.04.01.02.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:15:37 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH 0/3] power: qcom,rpmpd: add RPMh power doamins support for
 Hawi SoC
Date: Wed, 01 Apr 2026 02:15:28 -0700
Message-Id: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADDizGkC/yXMSwqAIBRA0a3EGyfYh35biQamr3xBJdoPwr1nN
 TyDe29waAkdNNENFg9ytC4BSRyB1GIZkZEKhpSnBc95wrQ4mTWzNor1ORdFJTKJZQ0hMBYHur5
 Z2/12ez+h3N4DeP8ARAocyW4AAAA=
X-Change-ID: 20260401-haw-rpmhpd-b40a68a3ce79
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775034936; l=848;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=88dvcps1dv2WXNE+TIBwTsSm01dkH2Ji1OH6My5vMKY=;
 b=9+MNExvCnXk74J/zr3GV3FoGi7mn/Ee0Y4xIYHx2sYmYW0eiBPsh11qwh2hGCwneLPUa1rN1/
 MW1X8GbOrZEC2zatlfigBX4Ow2vkCsngcTxtxGAgHSJsurg55UiNqmX
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: gC6aJvykA7u3Xt9_7wb9yUyyW3V3Q6Us
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69cce23b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3hnM6S6pKqKzLZp0A1cA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MSBTYWx0ZWRfX9y+a4CpLm2QF
 shErbmp+PXwzdjbrc5kae2GsXBUh+jicTIfjhSgFsuRMCtv8NaLHcB/DTVsS+5wNJ7X3xBmMowH
 /ptkR5spFQ1kQOAGVPO0YxmQ/DTFgPn1JSXPrIF5kXrDdtf+17XDW/KjFgfPSxor4yy6XHAbY++
 RlBTncc3gm4sXqO0lxL9ALCCyN4wKtjHxv3MmFdlft9bnW/robKkhIlVNWhcv0MQ0J3V1BsRmIB
 7PG/sqjB9A+51sIu5qdAFvVnZkBX6hTUI8gUsfWnSlhmN/U+tCAaeEANLl2MLA+p7mBjCLNKMMF
 HqlC9PWJuStMnkSMzzhlQYLf6LNDIMxlJFi4McOd5v+5Wy1XO8zWIjHW5lGwv+M+C/KlhfILwXO
 9nDbXuUDpCWMAs7sA2Wt4hCPl/WYRG98LeczAuadqzuPvteqjkM7smVOppduZzj9iQhqHww4PDh
 dFFrmOlMj6Em0/t81Ww==
X-Proofpoint-GUID: gC6aJvykA7u3Xt9_7wb9yUyyW3V3Q6Us
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-101272-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 917D7377742
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add constant definitions for the new power domains and new voltage
levels present in Hawi SoC. Also add RPMH power domain support for
Hawi SoC.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Fenglin Wu (3):
      dt-bindings: power: qcom,rpmpd: Add Hawi RPMh power domain
      dt-bindings: power: qcom,rpmhpd: Add new power domains and new levels
      pmdomain: qcom: rpmhpd: Add power domains for Hawi SoC

 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                     | 38 ++++++++++++++++++++++
 include/dt-bindings/power/qcom,rpmhpd.h            | 12 +++++++
 3 files changed, 51 insertions(+)
---
base-commit: 33b1a2ee3a3df63e7a08e51e6de2b2d28ddf257f
change-id: 20260401-haw-rpmhpd-b40a68a3ce79

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


