Return-Path: <linux-arm-msm+bounces-115511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hV/SFfzuQ2oLlwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 18:29:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DAB6E6743
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 18:29:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="mAlJ/J0r";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FeTlWSWO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115511-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115511-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24FFC30687B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A083E3D96;
	Tue, 30 Jun 2026 16:25:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561C93B9933
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 16:25:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836719; cv=none; b=ZVTD60XaLW3IwO2OIWNRl8S5DcpUts1KRZ05UIPrBp/X1YGsZWwCR24o8fph62cXIZSNs5SoVYt5LqfzTVQCmNKIxfJokJM6ZOD9gyrrB2CsCA+8XT9wqc/N3ErCDkkCHOzFZvz9jUblmN6IabsKKQO00m+iUGL3MF4rowwcn9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836719; c=relaxed/simple;
	bh=LJM1IPyNPNBoHNOz96SqVkVqWhGlMtd/1O1Nu8VZHCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uT9eB4jmOsAk2Qv2iyK+e0ctxnAoc5ctFXL3kcbu24z2WqyJ1dva4GiA/bT2F2Gxn7HUcjl7Xy9nisF7RhAZ14fot/hp9F89A4MBpbJbnEWacWT3ZLwQT+KkZpvXe0MBo8QuOaABI+LLoeb1BWsSde+VVrrFABsuqulD8zE0Lo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mAlJ/J0r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeTlWSWO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDBhn2199035
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 16:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7JztesSv1vX86J3T/3JDiPpZ
	RdmAAa2v8q5Kg0ahOoE=; b=mAlJ/J0reKFE93bZc17lfsgMcVn/nf0DbOQdsz3b
	OIqUvd0rxnkq+DCrLEMHOYdWnVDTuDulHsAqfUnB/ppPstFoLGSUzDCgUBlDjpZI
	9FQXHvj6pOkWcGvL/qsWT0qYQtWAVGw4Hv/qR0tVdL875FTpll+V5fU5ZxkqRzPz
	ohNSmWdZS6VfcPyGtFfRja5q0a54G3dpk/dUtDYL0jzOxKT87Ctng5HLefWs7zBR
	/TDm2MUXtX907ovOfOrVP+YHl4QBBV0Fk82JYL2F3q1DEGN/PVcMAUICTU/ldLTf
	QnVIIIKaPXbQzfR6yK+zSkltegC81laLaByXbiH3vMixbg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc08kjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 16:25:17 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-138acbc0e69so21561227c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782836716; x=1783441516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7JztesSv1vX86J3T/3JDiPpZRdmAAa2v8q5Kg0ahOoE=;
        b=FeTlWSWO8B6P8wAUEnZ8r4ePnzZe17caJDZrpR4k4M6J1qOXMkCge208iDN0va2wIt
         Y5nmXkFIyr4mvM55EhQz66WD+JnECiGDLsYHlZQjZbtfisHJFzZz7i2kdAw7+nov9StY
         6vKQ5Vkhf9dW4POsm8YvqpNvcZUvIiIRWciKFWxKnSW8ssT+4ImPnir5dVt3ko/Ngev/
         u8+3J0E2d+44X0b64BAfJ40cmNqCLVUnAV5lPbqIJzF1b1ZVZ3XXZ2/q1/VVB4BRUkmJ
         O6z3DbMf38PfV70waZBF1Tv0VyAZtuhY+KbGAXX7oAW7We5SRuXwxUDvw7+HQJ0jeFR/
         8nSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782836716; x=1783441516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JztesSv1vX86J3T/3JDiPpZRdmAAa2v8q5Kg0ahOoE=;
        b=C6IAZWMFiV3onDX5tn+03hO54vbxqpKZ6ex2SZWDh5cVVSz/bY2mRGeEOKtwbbMbOp
         K5wa6RmfGLJ2d7LLcPdViT/gXAknDkgmYdqRtORbgWBXqN75y4NH8BXkfhqu4U/tw7I3
         HTzJq1z+GxlIgeX5sal0vGS1pvGB60P51ENeknOeG0iszdBYnIGS04n0JD1IV6U6DN7y
         iMPDXkZakkM+nYggxZ9jJAGtIogK0DoKE36hD/d2x+dHUdYEKxy4uYvjOtPEwazicWm1
         X1R8ju8WJmzySoI2j+rMFY1yk9XNzWv/CqSTXVSRcO2LJ+1iAmxFSacxGWVIJ3xPxmAD
         VNiA==
X-Gm-Message-State: AOJu0Yzx1AVO5dsg/xU/nTcOIsqbyoWkn62Z1dYyILXVhZiIwvlixWxj
	ZQItP2gpf6GQYtzVwivSIiURJ1M9vROqconPfAAI8p2ESsiWRU/GJEjcQFQhYuNA82Gnh8duQgM
	rG3S7qalvCUXsH5rNDkJy7lTYjDD0Fooq01k2kdyXo602hWbCjrhffoVa219e1OtOduPr
X-Gm-Gg: AfdE7cnq/injo/sMmFl6EClmdOlG+Cw56xHzX5Q1BSshJwOxf+adVFwMLIkg6V7fNwh
	i3zR3qleY7LEYE4H8mEYfRGrVqwcLZZpAG6xPmjyQiK6c+yL5IQU6xpHmKnZxrp/NQea5hh8Q/b
	I+hNpHdYvxNYKFXRbJL7o7ZF3NkSoVpBP5DhNZOOUj/6sk88xYcwY3MwboLe/xf1s6WneqZe1tG
	8iAXQYKr12g3a3zgKLPgKG0F8BLmD9L3LtwmuuIECehSUjpCY/OumrqU/E9kbAF/BSwvzSmjKZn
	rxTcPSy5P7USLcYtr+MaO/R9OOeGKY6L7ba+6LEwLxypYfmGZEaqShUSyYNBDT+8VC1x6Pje6t9
	N5emgOA3WapRUTtdmRQpzMmhgPA1oPaPT3Jkzz5pyZkRRscSfxJk3jrr95CO3k8dm0Nw=
X-Received: by 2002:a05:7022:23aa:b0:13a:363:ff6c with SMTP id a92af1059eb24-13b2a1acac8mr2861675c88.24.1782836716128;
        Tue, 30 Jun 2026 09:25:16 -0700 (PDT)
X-Received: by 2002:a05:7022:23aa:b0:13a:363:ff6c with SMTP id a92af1059eb24-13b2a1acac8mr2861617c88.24.1782836715418;
        Tue, 30 Jun 2026 09:25:15 -0700 (PDT)
Received: from hu-mattleun-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab2dc1fsm8426555c88.6.2026.06.30.09.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:25:14 -0700 (PDT)
Date: Tue, 30 Jun 2026 09:25:12 -0700
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] phy: qcom: qmp-pcie: Add PCIe PHY support for Hawi
Message-ID: <akPt6Na523IZXYX/@hu-mattleun-lv.qualcomm.com>
References: <20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE1NiBTYWx0ZWRfX7G52jkVc+I60
 tn19JaVfPR8mOTqdZZTI8SOsfMRWYlQrfx5JTCXVr4RxibS+8NtAK1wMAlmyirz89seWtZGh/+f
 SWcq/zxbPJZ0zqFkBpgiBoZyTel4Ed1PKf+p0WMEgFU7g7if6Gf/Es2yTGKX4empLjhFCa6fcyR
 gWQrG/9ikBAAAyUZB0jNaDSzMoX9QzVN3tfaRLbd6MICeqXJ8W14MJc4ycO73TrVWTqAIUgISLF
 wH/23YDOks45CKw31YTkhvqj0Zxy1ziozb+BLqQiPxIF9dyK7cdKXXTPsaMQiIjzsQ6uDrHf1GE
 IFCwQFnmv+eFiuW/zw+KHfqGhvcesqclVovmZ3TqLgsI56lPO6Ma3f79r4uR3KdeDfvkFrddlbr
 jfacrUidrTUWRAhVe+RabAtkVAv0FQY/z6JszKHJqHT7N9yxdMsyjI46fBL3TD72B3HimAAGDZ0
 g1cQ+Q+8L5qgax+tp7w==
X-Proofpoint-GUID: Tlne-L_zwTcP3pTBqT7Qqyk0zwA2kciO
X-Proofpoint-ORIG-GUID: Tlne-L_zwTcP3pTBqT7Qqyk0zwA2kciO
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a43eded cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8
 a=JfrnYn6hAAAA:8 a=jj8kymYpkfAu7g8d2q8A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE1NiBTYWx0ZWRfX2z+Ua43xoi9I
 ZqrgptoVOsg+9TXSrcj0LVyg8STpOrWw19tbw09zcn6rW6M6FBzfd4Kr4hishErJY2GzfMztSfe
 oNnGBmj+M+PBlTS878c6i+ia5nuRaGw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300156
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115511-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,msgid.link:url,hu-mattleun-lv.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0DAB6E6743

Hello,

Gentle ping for this patch series.

Best regards,
Matthew Leung

On Thu, Jun 18, 2026 at 09:54:35PM +0000, Matthew Leung wrote:
> This series adds QMP PCIe PHY support for the Qualcomm Hawi SoC. The Hawi
> platform features two PCIe PHY configurations: Gen3 x2 and Gen4 x1.
> 
> The Gen3 x2 PHY uses v10 register definitions, while the Gen4 x1 PHY uses
> v10.60 register definitions.
> 
> The series adds:
> - device tree bindings
> - v10 register offset headers
> - v10.60 register offset headers
> - driver support with PHY initialization tables for both configurations
> 
> Overlap:
> The series has overlap with "phy: qcom: Introduce USB support for Hawi"
> by Ronak Raheja (see link [1]). Both patch series introduce a subset of
> v10 registers (this series for PCIe and Ronak's for USB). I have
> coordinated with Ronak regarding the overlap, and we can update the
> series to resolve any overlap based on the order of merging.
> 
> Link: https://lore.kernel.org/all/20260508213234.4643-1-ronak.raheja@oss.qualcomm.com/ [1]
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
> Changes in v3:
> - Squashed v10 register offsets into a single change
> - Squashed v10.60 register offsets into a single change
> - Removed USB mentions from header comments; offsets are PCIe-specific
> - Reused the tx offset for the v10.60 combined txrx module instead of
>   introducing a separate txrx offset
> - Link to v2: https://patch.msgid.link/20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com
> 
> Changes in v2:
> - Rebased onto v7.1-rc6
> - Patch 1: no change (Reviewed-by carried forward)
> - Patch 9: rename QPHY_PCIE_V10_60_PCS_PCS_TX_RX_CONFIG to
>   QPHY_PCIE_V10_60_PCS_TX_RX_CONFIG to be consistent with the
>   naming convention used in previous pcs-pcie headers
> - Patch 10: update usage of renamed macro
> - Link to v1: https://patch.msgid.link/20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com
> 
> To: Vinod Koul <vkoul@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Matthew Leung (4):
>       dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Hawi compatibles
>       phy: qcom-qmp: Add v10 register offsets
>       phy: qcom-qmp: Add v10.60 register offsets
>       phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Hawi
> 
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 375 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h   |  18 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    |  26 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h        |  22 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h     |  23 ++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    |  49 +++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h |  55 +++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   |  47 +++
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 ++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  10 +
>  11 files changed, 740 insertions(+)
> ---
> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> change-id: 20260506-hawi-phy-pcie-283933b4113e
> 
> Best regards,
> --  
> Matthew Leung <matthew.leung@oss.qualcomm.com>
> 

