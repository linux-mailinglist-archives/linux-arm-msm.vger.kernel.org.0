Return-Path: <linux-arm-msm+bounces-113093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id apzpIdOiL2pFDwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:59:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C1B683FBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:59:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="BmCpdQR/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dsdI9wWr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113093-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113093-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35269300B465
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 06:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3301C3B3C14;
	Mon, 15 Jun 2026 06:55:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DFD330662
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:55:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506537; cv=none; b=XHhv3s4Lv02U3ffysKFsYKnm88xfa0cdcK+N8vrH5pAhQ+juuGzsv/m2dXXAd9J+/7PgSP50Wp5V2CrXGSWsgq3QfpXiLExhr7pAj/9BqZR7T+u6hQRLQuNxAXWBMOeyeUpioHbGkBdMJH21fUpE+k3xEAo5wuKPdT1gXqKDcpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506537; c=relaxed/simple;
	bh=iBGkDzUSPzYK5sbtqV4KNwdIHGoTb3GNAtpbIzMSbsM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=igC1ctBmAqiLlPrNDGqNwRb2x25q65cu/RkyU48NW/Neu8mwt4+jqFblQ5rGtBa8g0z+Zmn9mM1vqMJrE5GDPQs1Ib7xCzkF+87fs9rvNwjiR1tcR4VpEut/C6obtG7UsCBcthvGwSEK9+d6nhd6Xng3CM+pPgktDFsmm1WznM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmCpdQR/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dsdI9wWr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6L5rL3828339
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VSYcYAJursS6ImGFSxYvrb
	ZBVrmINOZ1ay5tGACvxXQ=; b=BmCpdQR/WSjWM5AMaqNO410vppeKMg4NObseRO
	V4ezUQbDdRjNWsgxw/8hPMRfgY5yJUpP7Q68hvQGsyHu3uLJtmXuWgHx7K5I6j9E
	BFltSyDlzmur7L345c03O5cKjdzPL76RezX77+aO3nARvOUXI63+78iQ2uUjQ7R4
	n6x2s6EmkUlWP4gNTbygFAAvMmjqy0WcCAbZs105CDdZtLy6ntUCiYP3viFurKub
	fOrT+hwVXS4O+38mgOEm5mhdd5XSyVI5W9VKrH9YT+zyW05rqydRlTWboVMtfgsr
	NwFgWos4HT1lRX3gsGZIJB7bYjmj54+5T1NeeMrF6GMVDMQA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u628e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:55:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304d8613efbso3608716eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 23:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781506534; x=1782111334; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VSYcYAJursS6ImGFSxYvrbZBVrmINOZ1ay5tGACvxXQ=;
        b=dsdI9wWrsbSuQMe6xkhhFxyK99tsQwxAJy3XiLqI8R0LAutQzm1YaQqrc0VvuZl9sg
         383+S0KjkZqlYU5/baJ1h24C6zqXxTuZGvtvtPzQML8NxYdjukVmxwg0UhVTMMomDY8H
         eby2iWP8pxyLNOG8KqbyCV997hSGHsPURya95gnOIQxUOP9MU/pnfjPAM6rRtZeD784a
         N7i49GU7/k++zqXAlJWf6qiVMc0lVeSwju0uk/q7TcAx5u6FUObW/6xXWSWgGc2pNZw5
         DmaP387QL6+njR6Nuw9tb0Zn/VHQX/YOGP4l+DbIdm5jyqCk6EGhdDTlmubQfz2RUPo5
         osfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506534; x=1782111334;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSYcYAJursS6ImGFSxYvrbZBVrmINOZ1ay5tGACvxXQ=;
        b=i9t9Xv8zL1Jf0EktuKvlCcS7awbNKky41lA7RMfFSKhYrTOMd0XIQGBVWAMpiRWyYt
         v3KaxbuxnasP32fXGIWoqJ5h4+Qm78hEIoIZ362C+lhAxe8zGw3F8Gp8lzXRzrq4zDJo
         6SVY8Nd3c2zwDnnlTXr752X36zLkqC/20I+0y6bHGoHEuQhq/LPpga73hhaui/V3ksoc
         MVAIJTxiVxDN/GRXf0JHdk5Dx+iqhm1LKwbXr7OWTUzmldsRysl5D0brRXki5C0ysjY+
         6MtuFhrg1iPGieC9hHtdJ3dGF0qm8S1If73f/Ah7V7zOlI1u56uGz+haCbGxD5Sv/dO5
         LtTw==
X-Forwarded-Encrypted: i=1; AFNElJ+VucnwQi5z/GlTRBYvprmiRCEzhfAHwbQPO/jMzU8QlQSqX2HW0wa6zj2+J4YxW9O+7pFxcPlEXLmZgNQc@vger.kernel.org
X-Gm-Message-State: AOJu0YxAQa5ruhT8YEa9R/Hx72rpdhzaSM2MDzpQHCPIcEBFpJV38gC7
	zO4xFPHQeQlj/gSBimf68g3HD3y0mnfK9y2QwwhYUTStiiNstrf7hFplLtnASU/b5/FwudOOCgo
	LGKo9+/OJ64xg4S+5u3tqHv6Tl68+6hMmYFnb1P/tzWaEzsLazMOpfTPyL3e6UaZ6JAfL
X-Gm-Gg: Acq92OEh4Xe1yrpzrzWBGkRZRK3so72z9yViYx7L2s8M3MljZPPNqGS4QmZ/CLqA/dg
	iEIAMS3BXOjgOYu3bZ41NXlbOYP3bunVHKVNbmTP5uwa65GHk1V56YAlwQQwpNSSm08C3TeXZCy
	QtYEPWOM4HBcGFyvoY0axHUfqEBTNwMA0Rm3d9hYKHvdjoP6M7FZgvtpBV2CbR+bcmGftRqwu6Y
	Ab4NoOIyi7myT18ws+B7cEOj87PD1hoIYZ5fFAV5NU58oLBX0MkzvNXjQ7A0wDaT4mqoja8BNpY
	vQ+tAASnu1xWTCK99WjZv4NFcVpLJvylMDWFs+Ibs+kehQQNcu8rOxQ4pou8PLgZ7e1jzbNlSAo
	OMPOMvX1KnWHx6uwOi4T0Wfe/nzN5YGFL3LKEhhTHv4ikUu4m+BGf/2Aj4fXDIAfA+0VXcRRY
X-Received: by 2002:a05:7300:dc0b:b0:2d8:7302:d3d with SMTP id 5a478bee46e88-3081ff72489mr7079207eec.8.1781506533837;
        Sun, 14 Jun 2026 23:55:33 -0700 (PDT)
X-Received: by 2002:a05:7300:dc0b:b0:2d8:7302:d3d with SMTP id 5a478bee46e88-3081ff72489mr7079190eec.8.1781506533292;
        Sun, 14 Jun 2026 23:55:33 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5cea89sm14915174eec.8.2026.06.14.23.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:55:32 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming
 Maili SoC
Date: Sun, 14 Jun 2026 23:55:02 -0700
Message-Id: <20260614-maili-pinctrl-v2-0-0db5bfc23d64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMahL2oC/12NQQ6CMBBFr0K6tqQMUpSV9zAsylBkEmixg0RDu
 LsFd24mecmf91bBNpBlUSWrCHYhJu8iwCkR2Bv3sJLayAIUaKWzsxwNDSQncjiHQUKuzAXtVTX
 YivgzBdvR+/Dd68iNYSubYBz2uyUaYJ/1xLMPn6O6ZPv4FygA/gJLJpVURutcdwVCWd48c/p8m
 QH9OKbxiHrbti/u0nN8yAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781506532; l=1078;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=iBGkDzUSPzYK5sbtqV4KNwdIHGoTb3GNAtpbIzMSbsM=;
 b=HPtGWZ7afcEj2XCWwLN0m7vU/oUwToPiGwlevkGPkSA7rFnUd7vgGehvA/QU1j7fq/zHK+Lsj
 qaySgdp8i8DB7F3cur0WqzC2oeHD50YmeseC8gfxq8DkB46mfnOLfza
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2fa1e6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=shj1PICiUaLHCvf5g4YA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: Av7eX533Po_QAbkyoonBf3K15GSJMMV8
X-Proofpoint-ORIG-GUID: Av7eX533Po_QAbkyoonBf3K15GSJMMV8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MCBTYWx0ZWRfX+El1LOsrMbIJ
 pOAe55fN2ncagAtmZsY5iLpWb4ng466eI8fZ51VaabSwi+d4NVGF9T2JGfVNNCREYmm87uVJEqi
 s3ZUpUTwXOyKCsk/yjIJ3ZDRlF1rLVRgYmD2fq7XEh6DDSCZLNp7u/6f/1VuTxJvESoHNH5uYPn
 RVRvJAkM4Z25c+TlyR8oBK0oen7ix/+1h/5/Gq77eD/UIJYeph1UFEdeGn/65jBVy5cS2zRRn64
 2CMAzttiFvSMT2lMCOOXsJP1sIS8rwGJo9qEfJ3T32ySa/8Fwwn7pmCQ5gXF5tFUuroX+PBWw12
 ZWiWAsl44cJiMg0y+Ucnhmg7aCRE70nzRVrd/JHV5Y3OXSmFR09Rl8RMrz5nq8OBU2XyjS8Fx5U
 OZ2gnVxEEKjmeFM+VVE71yQ8K0mUOirroGTiPMn9yFBoYzFDFGR+RawI4xU2CHKMK8T/3rIwpaP
 nNH+Kullig0RRKZM3xw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MCBTYWx0ZWRfX6yECBfTQ3eyb
 vDs3qEyl0g59BEgPvxXwXwMuolHvgKYd8Bb/5rV5Pn/ijhV0u1dRsXYqzrrmlt8bmOYWNFbMtfh
 rW8MYU3EYIboIa/MBeXISmqQsNKqOsw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113093-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9C1B683FBA

Introduce Top Level Mode Multiplexer dt-binding and driver for the
upcoming Qualcomm Maili SoC. Maili is the new mobile SoC, and its DTS
will be upstreamed later.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- Move MODULE_DEVICE_TABLE next to the table itself
- Update gpio function to MSM_GPIO_PIN_FUNCTION
- Link to v1: https://lore.kernel.org/r/20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com

---
Jingyi Wang (2):
      dt-bindings: pinctrl: qcom: Describe Maili TLMM block
      pinctrl: qcom: Add the tlmm driver for Maili platform

 .../bindings/pinctrl/qcom,maili-tlmm.yaml          |  120 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-maili.c               | 1630 ++++++++++++++++++++
 4 files changed, 1761 insertions(+)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260614-maili-pinctrl-230a8ce90bcd

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


