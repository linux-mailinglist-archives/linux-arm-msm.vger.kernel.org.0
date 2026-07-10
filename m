Return-Path: <linux-arm-msm+bounces-118339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2zPwJDQwUWoxAgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:47:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE4D73D1B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:47:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Xm+N4F6L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="kv/Eyly0";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118339-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118339-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5A1E3010278
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 17:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DA63603D3;
	Fri, 10 Jul 2026 17:46:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148892E413
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:46:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705617; cv=none; b=qSPQe4CyDT/ymiTReLC8/gZn29ClrtM+Q1EoXVQYEu84N8YraiZ5nZeE5Xr1ApOsgJQ3cfc+/L9XzDXxeB1j0qAHxqJRD4yD0cfV6nmyTsnEsQXPjV5BgLS5MktDVnyLKr2rzHJCYOFChLctIuD4CMcPu9JXqypLrwHcwj8M4Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705617; c=relaxed/simple;
	bh=Y8JPCXG0ZhSLrMqKLkgn2ObmahE6GfacoqYF1bj80OI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iZqyjwZqDUwPJrhmoaOh/oYxSM6Mlf5ZyRfuAA+bUK5X3aHkOikshByTeCL8QeYmWY71tzcg9aK5BGfml7vjD+lqIm9hzXgyQmKS0nzvKDIh1UpMpxJbuaUcjOzoDSs/3z3NBIN3Lg8JiEi55KXP3f7V343ckh3OddOibd8J2SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xm+N4F6L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kv/Eyly0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3cQ21502096
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mlfY5KW2Ubph8SuUrGt9q/
	dW8huEOfRAa2uT5hWsy2k=; b=Xm+N4F6L2DAuL2F3+Fsixh/2+uQPBknj2boS4L
	XLEboubLolcTPHdFENet6F0k/mE9lHPUVvWaQJRwL7yMpjR4O0VPgnniBT1KDNYg
	nvcAbBq1D6qRmRJzJ7wV+G5ne0Ozim+vnYrMiQ7fZmK+WMOM/ZMPX9cORfScQy/Q
	qQ8EUR9aymM9W+DOUo91roC/6OwPa0Iy4KVo5axEP6kzPM0H1JqEtZ9S3wrjYBEN
	LbA1t4J1PIqtUcP0TqKsbTpMJ/m+fMMc5b16yeVq/jX89ePOi/hPoAea+31guCq/
	UPJzEzsAPlsQ7+S7jNU3FiMlyEAVK3yzjDasIatW8ZbP2mLg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb3xvrbuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:46:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so1084875a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783705615; x=1784310415; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mlfY5KW2Ubph8SuUrGt9q/dW8huEOfRAa2uT5hWsy2k=;
        b=kv/Eyly0l9cnA10DzhHkHxLJfxaBdV92S14kFoF+yJ5cu11YySFkQ918rH/c8NwV8Y
         E4W7GfaqsLkOowU2wAxqfWCkXSN6lnkzP2BHk6eXjoqnT1UycI1ZUzrV5XMHwbnAqGre
         1MvSxV5GbkJEFBtDZb2dqIUxRnSbXjqvz8Z31jSQ+NVCP5AWZHdAYoJIlrtNKMVmTrfp
         cuafqIgXg0Uz880KOtswbHC+1WOn86c9OmAFFk50h9zegE0prsuQQ3dAsHSC2I2C0GkK
         2mbhBqKCNAD1ORVQ8SDnXtk+0Hk6gGa1aw+l7twZkIFA71RPrI/cXonvdapRQmmBF04r
         h51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783705615; x=1784310415;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mlfY5KW2Ubph8SuUrGt9q/dW8huEOfRAa2uT5hWsy2k=;
        b=hR//k3Wnib3dtwqMp96ZC216NeiUJTRICkB2jl8PKMcUYpqBcO8v5j/n80NdMxRZiC
         9KnMdW6UJINPxWpLRdqN+BwqqU63A921+q0BVHddyqz9RPdyzNL0oMd/K1ZG6eHl0e9g
         p5hgLogalgMck7GPsP7Wue5HzSeIgVllTCRvYDib4fDbPDka4ZLW8vU0TEkzdf1EtpuI
         1b6mu0zD9U0TvuoNCjSoGoRuO0daD3V6GTFIgcw0H8TZaIdRA9Q9vx7KlTyJ3RdDlUOy
         KiregmRuUrzplX3sTvOujHhk5brs3AutA0P4XPqsXi5KIWpZlBm6copujPXKcoVJIGtF
         HLEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkdQhKOJuErguw4eai1HIlX+kTzw7uIyrjA9kf2rUR91KT0ElseibmuwE7kwrq577vDZ9rdk25oeaXBfjp@vger.kernel.org
X-Gm-Message-State: AOJu0YwS/9cBKSKfzm4xVPutKdZIHRw2P1ikgzg9a+gmajG1x0Zb5jNX
	GZZgzMQjiXLa+rjQ4GNbYU/l04Fwhcr7C4iadPFoeFGNNaYLBxTX6bm88v44PlhAUUjCLkWclOU
	N3C2CDsIKYdWnPI7ggjaTl1xsNcnZ/M9QPuB9wvNvPFC8c9/9yvvZbCP6CkOd+FV36V7l
X-Gm-Gg: AfdE7cnuSJaLbL7Sl6oz0K4kjcZshFVOYZFHrTeyIZiFgbtwsEwsjAMz8TXVAom83rf
	xoaRgEGI9K3ZJhY/VdPOyQyIcge8xApur6xRKWvZVH7disO3OgKyQgPSIkK++xzRBOkX1OWotmu
	Pjf+9EbGT1jeda5R6OFB612fLV2gXIUzfv7CmHF2Xnia+0FA/LainFek8gNp651uM7NbDZle1nC
	CA05Zg1zyISneIGtsz3DZLwZse8VYO5YqRzGNjHImjkSuLT2Q+J4R3q3j+coC9Qx66NWSnnnBfI
	nAraMjtI/IZ/Bb9vw9t5C70Pg8fgpJBhzn/5MQS3XKcxmB48jsRhStz0ZEBiHtL41TMEyRSjWDY
	wSkoJuE0matR+p7SszXW18dMyNSp5kkfhrTUHatUtLTiTg+13rsLv7QNVRpeRCFvGKIyoSB9RlI
	c+bECTly+uflW1iy3MEhWvhxAQe+f+SKzHdH8y+ASdlTb+iA==
X-Received: by 2002:a17:90b:3943:b0:37f:9ce1:735a with SMTP id 98e67ed59e1d1-38dc7777c02mr2429a91.27.1783705614705;
        Fri, 10 Jul 2026 10:46:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3943:b0:37f:9ce1:735a with SMTP id 98e67ed59e1d1-38dc7777c02mr2391a91.27.1783705614218;
        Fri, 10 Jul 2026 10:46:54 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm33008273eec.9.2026.07.10.10.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:46:53 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add support for the QMP PCIe PHYs in Qualcomm
 IPQ9650
Date: Fri, 10 Jul 2026 23:16:39 +0530
Message-Id: <20260710-ipq9650_pcie_phy-v3-0-ef6018818d33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP8vUWoC/yXMyw7CIBBA0V9pZi0Jj4CPXzENsTDIuKgIbWND+
 HdRl2dxb4WCmbDAZaiQcaNCz7lDHQZw8TbfkZHvBsml4VoKRul1Nprb5Ahtijsz3B99UFKfhIO
 epYyB3r/ldfy7rNMD3fL9QGsfnr9q+3QAAAA=
X-Change-ID: 20260521-ipq9650_pcie_phy-60d7df32581c
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: kB5k61bCKthpFK3Ph9uYxtrd3s_jasUH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE3NyBTYWx0ZWRfX91aL+4f+vVzO
 sreeUIIHrDVhCXMRPyVmfINkBqnf7UcpQDDM3ezEGNsRDooYJWjS2vb4VoJLppDK6/XL/xcc6qE
 SMpcXN6qQ58REJiIc3DYZurE8r3WQnBQGqrp9/w6ROFumzRR0Pg9PVGDW49RyvwImtDblBA+3J8
 XlF+w+HPeLdeBbhVqlrRy7GIsrEF48++Ne/XISv+CvB4WBrH9c7sbVa7oOIq5QrTNnmJd5OLLZj
 b5l8l3AeUTuxyaGomHUYk3PqCDZ2dXZMZ8Ax7OJ7NzRYy1RIuWk1VsGmnlZ8YdlOlTDHu2FdTFv
 k8BqA8FWe7IE/JFfy6gc6qlfxeg+AzhLNvt9bD/xeB29Zm7B/RPKx9vFLYtOg4iQbcRnRLeIdDy
 z92bFCD5fiQ9tAo8dUaQ1gvbmJ79AxwZ5MHEXFAUHY1Smc7wNkOYuTJgvzuOobbZMKY7UCeWaeR
 e+rlM9ioEO+avSwOK1g==
X-Proofpoint-GUID: kB5k61bCKthpFK3Ph9uYxtrd3s_jasUH
X-Authority-Analysis: v=2.4 cv=HInz0Itv c=1 sm=1 tr=0 ts=6a51300f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JfrnYn6hAAAA:8
 a=_lxU6AF3MxErEUeOnbgA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE3NyBTYWx0ZWRfX+pYZXYktFfqq
 e4USCV89SEEEbOPNYRSsJ1YAClc6OQrScsOYccZNEPjEkaYR3ahkpWHuBe7+emr8F5PZd+zOJFa
 B5Dysze4MGqNZOiTYMTebtXLqouN4/8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100177
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118339-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEE4D73D1B8

Qualcomm's IPQ9650 SoC has 3 Gen3 dual lane and 2 Gen3 single lane
controllers with the QMP PHYs. Unlike the PHYs in the other IPQ SoC,
refgen supply is needed to bringup the PHYs. Both single and dual lane
shares the same HW init sequence. So reuse the tables.

Document the compatible along with refgen supply and add the phy driver
support for it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Rebased on linux-next: next-20260710
- Pick up R-b tag
- Incorporate the link stability issue fix (QSERDES_V4_RX_RX_MODE_00_HIGH4
  from 0x35 to 0x3a) recommended by the IP team.
Changes in v2:
- rebase on phy-next
- pick up R-b tag
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com/

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Kathiravan Thirumoorthy (2):
      dt-bindings: phy: qcom,ipq8074-qmp-pcie: document IPQ9650 QMP PCIe PHYs
      phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support

 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 220 +++++++++++++++++++++
 2 files changed, 239 insertions(+)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260521-ipq9650_pcie_phy-60d7df32581c

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


