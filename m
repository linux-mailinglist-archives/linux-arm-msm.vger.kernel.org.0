Return-Path: <linux-arm-msm+bounces-108412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMB5KSglDGpWXQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:54:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC8057A904
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F93B30CF9EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4C83ECBED;
	Tue, 19 May 2026 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCl54PNd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IGhg7dht"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AF43DD53B
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180439; cv=none; b=Itlu7nYsOMSq+g2cHG/CULPsqZHz/FHKe4LzzvtBddJVGZYQup7rNQODNoUsONcUEilyRzuOB6XhMqxBTqXAw/pMz1Wt3qJrT/QiDpGBuSB4eNIIozDJiV8q8obVbaRbaHILgceII1jvfp7tdxOP8McAGK+YLeZEh7OiYG3BpRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180439; c=relaxed/simple;
	bh=QIwfsEFy/PkegK5poQuZTixC+HSGKgN5Fy/Unu/RWDA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xew3eOTDaDk+z5LjDdp/dfmO6jDkxRZfnrTg7+qnV5anRMda79Az7v8WtSn/fx43gqAv9uCUWwd7afdTOGdNyoXSSzRbC0PU6V17mGIsbgNdvnuZ7Ph/8y0zAfjikOHY4havElAvvUmFwwJWsmtx8LO03VSJnnmZmoItyp3nwPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCl54PNd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IGhg7dht; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5WOBB4131344
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YTzof/GAHtd/VEBd5A2iXv
	0++GjULzEE4n+pqgtZOto=; b=NCl54PNdhqQv2q7JAxq+j3hrZigRCXa7iMsPVS
	cRAmHIajB4PzSruM6psz0v7gBiJj2thwkq7Ztk77MImHmrnUFHrBjDCU5SBOh1y3
	topEx1oAIxLLTL8k/yyV20m+gd8HZ5nnrcZVwpzycB1MMgLZsUO6lmFSi8lF2WHO
	2SFQzoKWqGTOibuVX165uDcV0D2pMiPfG9GFDzKDgVgZ6j8TFZrLk8JzjKJyfpl2
	FoTIUna0GITFh9Z1aiyXKLGP6bxLl6VHo+L8xOFHuGQ1tKou7OqwBG4e9aAR3zpG
	rmWtQdZs0DpFnqVviHART/o7z+Q0M1gAoTVH29/74enH9F3A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1gt7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:47:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso2115409b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180437; x=1779785237; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YTzof/GAHtd/VEBd5A2iXv0++GjULzEE4n+pqgtZOto=;
        b=IGhg7dht+2Ikc0jFOiubfXYn2+DXhs35fpfkHjJ2A1hf1TVO9ZZT7JHWUxRQotGgTD
         Pb/ovQH+0kr86k7htMSDpiasx03AQjyQPL+xt5NBVO66Y4TLXInQchTlb70U41jpSCtu
         vuPx2Dif4MREUscU+1fo6A7NltGzv7mK2LVMaGXSdpWAKc6/NgQfFtjV6KJqKVOAgMI/
         yMbsvmSplGv4GzjRpv/TbaVMZq0u5/+NoZp0U1tFpzK85OjqmKsUGkc04TbwzBkdXLPU
         QDOtCrFuP8Vd28azvntdDbJrHNJJeAXOi0EMOEaRFtkKCGEXiUEFkm2xBKx18vFZSpiO
         N0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180437; x=1779785237;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTzof/GAHtd/VEBd5A2iXv0++GjULzEE4n+pqgtZOto=;
        b=B+PnT8vKa6XJh9+AIWN+A0a2+PZX6l/ZgbrRrjOjDUvOtJalQDRmKcWhOHOkfTmv3A
         7+cYl6Dn7AnYK+iPKDPHxoIbyv24divZbdKkwskdfmry6hlsvQJgl5cCoY+9RTjvDmtm
         3ZA6rc5qRK2c+rWOthm4deBdxeN4+7YyxykV/MVUdviXXIUJYhvovoB3Bo7wVnNXdRaZ
         4RfkJWXIBG/dIwbsIjQY+yJBoHOONcA2Xynm/0TWaIFPm/h5fJKltXT5zcW6/912dR7o
         tOaaq38UUnfwY/C0k/KtCnecyh7zD1Iq0+pGpv9Pd/oNM4U3lxzfPZt7dPvQbJMy8Rm+
         ER6w==
X-Forwarded-Encrypted: i=1; AFNElJ/kyvIzyIFCjDHG+Ssa4PBaHHIQeYp7GSqG2bYAAiYK55lZOLDUEulIpR8653XtM41Ua+N2t1il0QCt5fw4@vger.kernel.org
X-Gm-Message-State: AOJu0YxVuo9e0ugrRTZgtjebpOZSp/im+/gVDyEQLXvRzJrKiVns09EU
	E9lDuqH43oDGXL9B9fwCxwOlCXcZMgKpatRxAobx6L0c9QwDOgle6O0AckkjmWH4rzr5COhPsPs
	Pg3ySbsnVeAb0v/neakcSInxVuVnNiB/vsuDHVflzvCKpRQWMVd1NFMYG29CnaEjOMtyd
X-Gm-Gg: Acq92OEReZpzOLFCbqs4Am92izF5GenrU6mTG7mC8U0ae1i9JhgI1KCb+W5CeTKsHfI
	vdNae79mghBGPigC2oNVtQRCwUUhLhZNkow45aBkbNo6CtGcFo8G4030Fa/qi5+ZWY/ZXIOGW0T
	c3qpnb061ucMhK50OXZ3+XBZlA7xtMEqYDZmFHOS8ooLIBtZQFn0C9+XLZTMo7uV93aQ7BF7OFn
	50qLedYeO2OeSCbumvQ0X1Zfbwtj3ctBnrKuZnMz+MvHLH61XQcawrBim57XAeOl+N+M1ZYpL6t
	nkG91IJCDBCXabWKpuDSub7m7N9IMBwY21gR/ytZgQrtB/Ar0kCnsp06U0cIShSAFv5Scq/rTOa
	YLNe35x104sPVPyssDuc+KYS9+rupYBnnNDj03xxspaP2JTXsRJOoPP+ovJ8tp63h8Nk9n+00qs
	4vIaTFahg/SbVdwjQLb9kxfWKcR95tAZNJlVueN3QKn7+cV/CO6MJVF7oK8zDcCibn5+4=
X-Received: by 2002:a05:6a00:1808:b0:838:af72:fb37 with SMTP id d2e1a72fcca58-83f33ba71b2mr18162201b3a.7.1779180437049;
        Tue, 19 May 2026 01:47:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1808:b0:838:af72:fb37 with SMTP id d2e1a72fcca58-83f33ba71b2mr18162177b3a.7.1779180436563;
        Tue, 19 May 2026 01:47:16 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b1f5sm17434104b3a.31.2026.05.19.01.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:47:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/3] Enable icc-clk support for Qualcomm IPQ9650
Date: Tue, 19 May 2026 14:17:04 +0530
Message-Id: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIkjDGoC/yXMTQ5AMBBA4avIrDUZTYm6iohUDcbCT4tIxN0Vy
 2/x3gWeHJOHIrrA0cGe5ykgiSOwg5l6EtwGg0SZYZpowcuqsxRrtlZorWSOCpVpOwjF4qjj87u
 V1W+/NyPZ7V3AfT/0WdkGbwAAAA==
X-Change-ID: 20260519-ipq9650_icc-994280404adf
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779180431; l=914;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=QIwfsEFy/PkegK5poQuZTixC+HSGKgN5Fy/Unu/RWDA=;
 b=R2EEDUaXovgm3VTGTrroPHraEl9Kvny7YPrOQvtoj3JTq4MWXcgpQaljwAbgW86YJUec8JgpA
 h/3k491oWX6AFc7cBfJMj9pxBLrJm8G+E/Pj9BKJSsDuWpQXmuq5yyY
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c2395 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=AmmTUv6NKEHWZ0q6wX4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: YY8zQb15TGj7UTyQbSe7GQD3Vva3NyJt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NiBTYWx0ZWRfX3zdxR7gnu3Gn
 FauhYt46wjf3gXmKrxQFKdZFqqJMwTYqagJzJY0228DJL/0hSxm+1oUShdzyoQQLb3QIXDjKlig
 dAbxipVfqIGHQpBRuf/SF03gDSW1o8GRZs5nEa9s7ExgbamLhZZ/khtYbLzDKx4jpIq78d0EiBs
 tu0DVwq5ZBb9nPrnI3zt4sxNJYpv8w+iHhcI2oSGfsAcKVegzmwuslpmAJGo0WLJ7UnYe7d4ZZx
 Jf/SgO0V6eNpVhj67r+ZHEf2ZMHRNeRxJgf4vrK/U25DQFOGfK+JQXmay/GeamHQvh38nUtFo8q
 Hbs6nhFDEP1wswrWUsj4U81VSvD+JlV11lDBQUXsdP4pDNSnAJ8/BBN7g/WlY1nCuyj4/AQrmQv
 pZcUQGEhtRRqcUkdy2w3O1zq8gaUKmZ/6yA2vtBe5+bJLogZj9R7DTt00f10AttpzHSYXyZQJmN
 BZaefTw+bETAShju73A==
X-Proofpoint-ORIG-GUID: YY8zQb15TGj7UTyQbSe7GQD3Vva3NyJt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108412-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CC8057A904
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the master and slave interconnect IDs for the PCIe and USB
peripherals and enable them in the GCC driver for the peripheral
enablement.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (3):
      dt-bindings: interconnect: Add Qualcomm IPQ9650 support
      clk: qcom: ipq9650: Use icc-clk for enabling NoC related clocks
      arm64: dts: qcom: ipq9650: add interconnect-cells to GCC node

 arch/arm64/boot/dts/qcom/ipq9650.dtsi           |  1 +
 drivers/clk/qcom/gcc-ipq9650.c                  | 22 +++++++++++++++++++
 include/dt-bindings/interconnect/qcom,ipq9650.h | 28 +++++++++++++++++++++++++
 3 files changed, 51 insertions(+)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260519-ipq9650_icc-994280404adf

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


