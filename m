Return-Path: <linux-arm-msm+bounces-112085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DjwuGW3dJ2p63gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:31:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2DA65E5A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:31:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dGE7nyv6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YRcP6nVA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112085-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112085-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4CBB31A025C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB0F3EFD27;
	Tue,  9 Jun 2026 09:22:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A503EF0A6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:22:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996956; cv=none; b=ClE/iclOO6Ksyp5BdWzlz32VTYWVOLMKjhtVz2M38/QecDK+J8IM+BvATD4T+A3FJBP/ZpKPZuH1RIk5K58Sk9XsU4NAf5+ChUq4gmm8a5nKcoySomzZYkDJ7ZxDlkNSwTovGC/LHp98bZVP9VCRLt295ndduD7E8cbPoqOE+Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996956; c=relaxed/simple;
	bh=oEPhubjWBInIHQQra0g7O6nsTv4zdj3w2noh4tW0nCg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RYuipi0B1PBLYpWV2EFAI3nYvLtz8F/ph33BUPlhhf4jAsZgcX/wO3tn41O71kka8MarLQdkCAXMTgel5P/CSDD96wlm7iiI3x8jZC9ze3KlOqNeA3TGzjuQNGRFFkfaKpQ8osKeK/0knolM8Bc4N911nlWFLHXkwRvHFB3/jKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGE7nyv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRcP6nVA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599J9cf1815837
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oLk9QPedDkL2uCX+n3ZKHm
	PgbpWGF63huvolXEqxgzA=; b=dGE7nyv6Jm2Y29d2xm4CPI9j07RBzl7fB4bKvh
	hxP5vbQ5E6pBUulCSMaRttaLa2r371y8DOs8XJKndldGkLdkk1g7dAa0ZVNliRDC
	rsxrcaFaY4nu6qOJ5w4MJ9fh5gfnICxBgoCCL2Fu8fbR65DjlMI3OJ1TxZa/8bq0
	8RFc4NTkmRS+3Dq0WondAsfsMDCcmQP5p7npV7oKz26XKK4/XuJoYOglRtDNZ2ZE
	7Ub3ZCIxagz4nm4fKNxSkKv8lUYe4UJSprtRPOBeh1lC2U7jYu47usEfE76/ljH1
	MFqOuBq8mX9esKhr9AQGkoi+ZhqwSbJmHnvGmJ0HCts2dOdA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jr1er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:22:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422382178bso3598231b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996952; x=1781601752; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oLk9QPedDkL2uCX+n3ZKHmPgbpWGF63huvolXEqxgzA=;
        b=YRcP6nVA5qsGcqKxTcuGIM5T5ceVyYG96UvXnRMXMzQcpXVpjjku2GVOD9K3mYkKKM
         uBQK+iugD37C51Pyg0gBIO2uVsldOSTfOlclgzpMClTRD5NzttNPvaD7PWi+f8nJ2PfD
         JXL7qTtJKoASBrDdxD2bDKrrwtxYSZ9JLa+CRsxs0dXUObN8eY8wfmFXf/2Gn5AGd+Hj
         L5mwngiju0XYHjAlAnGYAqwdw3YX9GhmFRi9eBuCLuhsEKfMvyWfQKAoIfZ0X1dKXrvN
         rgsRTyPwZw0NQ8FJh4cE38v0aPAM0Kb8Y6EVwt7QBKqMHlxqTqPSPKkfamDxsinkmti0
         4cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996952; x=1781601752;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLk9QPedDkL2uCX+n3ZKHmPgbpWGF63huvolXEqxgzA=;
        b=beH6jWt8LvilzNtzWWVRtOICvwudEMeR8fthNHXbinP07FtzmNW8X4iZ3ydg0tjybl
         uXuSZNU1datBP08jhYnr5VEdQcuS3lUcxwqjCKuCbCBRvrk1bAWSmt9xXFK0jLjZk6Pk
         DhKUP6uPKK6PxOzgT+C8P2Z0hYWexY66ltb6IhlyvwjU3hbcvCAGxiLron1Qb9t/U22r
         UVDQZhclroRs018hadM/Pa/wzy7SG0Io2LGCBuW1ygZSYcmf3LQyACDYeTNTzVGHRWau
         k9ADqetdtqUy7+wmK5j4hMJBd5sF/3+lRpeQEsrRYl0qwD2blhacq7QWE/40bxqaff6O
         nX7A==
X-Gm-Message-State: AOJu0Yx3CK2DC7R4hguRvzNM1WJ4QPe98dXv9eJKBPOKbXa+N+9B5qZ6
	VcYgdBJD0zoC7RWKry26W0O04jGtml31vtbnsL9WqyIdG8TBIY6w3sPxuahzmft6zekqHGWu6zM
	1x0l4cU/l5a3JSBO/HhJONSy3Ec3EpxqvuCx3uFRMY48RauNoi0L0PK1Gt2WnD+Xkrr8K
X-Gm-Gg: Acq92OEOkQNx6/KFkD2cZDh7/S06C7YpoWe4Eg6HVqm5eP30Y9NiDAAimRVjfY7kCZE
	bdcjG4fWpzJNZtYwnQrAs4S5+ANdmcMabkR0Z+xWbufaM/QAAdX322hz6SQlvmy3IHsClEPm7Ke
	XFNFv0iOFeoXe5sPePOb95V5CWqKG4ugovy1qcY/bVlxDwy5fH90SO11+EWw+xowWwiN0TvrjzF
	fUG8HdWzs8urFpYZhBVRegBk9abCGnuRKhqLCYozKiO6Zb7tyXkD87IMeqGQDAF8f8Idr9//qhc
	DtUKrMB2vk8geWazdcoyGb3Z3PPlGFFirXrehvMmL8Cyz7/qKGyfhlOykdCAgLsgY6r1vZWxRU3
	2rJebUNdl5Z61HoAC2Vtc/kwRHBnbAHjVdX2t34rWxcOJqJIha9KPD2Yc3FXVgYj4GdooEyORQ6
	3eIHJAIavMJFNFSdZXRkLk7nwGNXqhbL2HmK43XaOSi0qVZC9wmnW0/QhXidU2Lw==
X-Received: by 2002:a05:6a00:3d0d:b0:836:5c3c:2054 with SMTP id d2e1a72fcca58-842b0fbb621mr17711742b3a.37.1780996952106;
        Tue, 09 Jun 2026 02:22:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d0d:b0:836:5c3c:2054 with SMTP id d2e1a72fcca58-842b0fbb621mr17711707b3a.37.1780996951659;
        Tue, 09 Jun 2026 02:22:31 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm22861582b3a.30.2026.06.09.02.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:22:31 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable the QMP PCIe PHY present in Qualcomm ipq5210
 SoC
Date: Tue, 09 Jun 2026 14:52:11 +0530
Message-Id: <20260609-pcie-phy-v2-0-83bc80e79fa6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEPbJ2oC/02OQQ7CIBBFr9LMWpIBCpRexbig00Fn0VppNRrj3
 UXduHw/Py/vCSsX4RX65gmFb7LKea5gdg3QKc1HVjJWBoPGo8eoFhJWy+mhYsyUo05o8gj1vhT
 Ocv+q9ocfF75cq3H7jTCklRWdp0m2vkldCDa01lFO2rY50kjkox+SxQ6DiyO2lIOB/5Ia9ulwu
 lVCpGS5OKNRYRrQZpssd7a/aTi8Xm/Smwyh2QAAAA==
X-Change-ID: 20260609-pcie-phy-99fcf91a02fd
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 2AomjadkDMr70h9ZzOxr6eF_LGGNcnEv
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a27db58 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xdo0bYGMzzAWwOA9nckA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NiBTYWx0ZWRfX27OmzZel5GBg
 +M8LKI/e38m1Bi9txhtIqEDDiakLeugR0jZC0wfNpqODHT8g67R3v3zjircaubAKRekH85VOurS
 G2Pox9hHpo5oMPv8WZi8UNGX+AmPq5Z4jN6ZaqTTUAGs/6wxkzxPpJvOcfEWt8K6UxWUCvNm21Z
 Coe+wbQBrSe+5HRKQU6UM997rUqUO0wbSTZ/vD4ew/fXd6nXLTUUs4Td/iw3l0sJaxAdpXqBTI7
 YsnT3jnzHVB0ylge5dYDjeUFXULgw8GMd4QisvdpR/oSo57JeYUmv4O5+z9uqpSW8ChgIUT7H7B
 z6nJct7Hhx/YUo5WNNgp9t15LgzGR96iD0R/j3tWxSaTQbLPjfSHG48DMFWDh7UiiNTtq4FhHPy
 dTU7oC2Eu5oi+pvuKL1qhGqxRTkHUL7tx05BVYe49uhrgZyWp/3eQJM1gw4G2MseREh+mZOAziN
 Z7SpQeVIHEQ9djVYuuw==
X-Proofpoint-ORIG-GUID: 2AomjadkDMr70h9ZzOxr6eF_LGGNcnEv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090086
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112085-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC2DA65E5A4

Document the bindings and update the driver to support
the PCIe phy present in Qualcomm ipq5210 SoC.

v2: Had incorrectly made both the phys as fallback. The single
    lane phy is standalone and double lane uses ipq9574 as
    fallback.

v1: https://lore.kernel.org/linux-arm-msm/20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the ipq5210 QMP PCIe PHY
      phy: qcom-qmp-pcie: Add support for ipq5210 PCIe phys

 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 145 +++++++++++++++++++++
 2 files changed, 147 insertions(+)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-pcie-phy-99fcf91a02fd
prerequisite-change-id: 20260514-icc-ipq5210-0ab03f3a3e83:v1
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


