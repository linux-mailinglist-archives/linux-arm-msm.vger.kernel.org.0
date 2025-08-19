Return-Path: <linux-arm-msm+bounces-69663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C5FB2B9B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 08:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94FC417C49A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 06:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB1E26E175;
	Tue, 19 Aug 2025 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEEiPTOs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F49B2690D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755585435; cv=none; b=PEs9G/sh416VJsk5fZvNAgLRINQwlMTgF7Rkcjv9yXoYyMWioEZM6KxEtYQd0/w0+/xXTfbVetBEDVLXAnoLVu4uF7GbRmN/QFF/BQNVixaa3mKEriph/ov74aUCtRK7q05ed61FUCuJwpe1A6gqz3fJasQrn1WCykPQAYO1NuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755585435; c=relaxed/simple;
	bh=UVRoIFA7YXNnu/vJQ5olTkDt4U/pPMeeSryOJu9KTBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p+wIpZNIy89LRZ37RD+WjiNpBJ0BWPnqmavMqDwjea3MNTI1QKmJwUlRx6b6eIaiU/dO0Y/mJVh6ac1dtg/s2/hUZyGD/CNJOzKt36GQlVB71msy/xgunkVmmX93PD6YxgdMJB+UmsAbnkt3cy4fttb8pZkw+VHZ7YHEIXUX3DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEEiPTOs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J0iJgr031717
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NPgiFAJ7QYLG2oWj/sNVs7ofikmUpmx59tiZmMh5Oas=; b=FEEiPTOsUZeFu/qe
	+jNrfAA1WrSJLADQFgBeTqO8iKt92jHLHJ/BiGhzjA0ceEjv4YwOgLKuL807UJLo
	uGIbkBatZVjtcAkZZiGW1cDnpaCVD7jeVGHZF6/P8u/aoj8R9dKd/LitOHQvGx7V
	BsldcVCDya8C+8C9UcDpM2OWD4vUQtXPEeLdSGtNoWOTUhbiFtQ6mKEBuSlus6at
	cDN3wFXdNyWSSZ5EUqqsinu3JeNjHw8tsbXbI7HQc67vKtwu4A5CLFdnN2Dfb2wp
	JVcOIF4Q8SFRbmNiQL2ZMWCbNipI+VTBWdnPVvmd+DFM4BHSM0i+dh7gyPojtET8
	cuxzbA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2ufhpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:37:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2430c37d06aso43996895ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 23:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585432; x=1756190232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPgiFAJ7QYLG2oWj/sNVs7ofikmUpmx59tiZmMh5Oas=;
        b=mso/1xwaF8HC9PkWBUx7wVipzDixrRFAQBMg91w7E+xymLjIz/dzKhQH1kXmtcair3
         FpsQ/Rt54Fam1vs1aGuWCGtNxVtd8n5vBKm3rTPZRpKWHxlep6wKQI+Mi37gf/iFfqfV
         lpJg58/8IqrTGdzUOPxeWqty469RN2vD6FWLaJ/SgARQigM3SdUVjKBn0eDvtUcB+0Zl
         I6rvvDSyP9PyI5jyotT/G5R3rYb8emTiVkC7EWyNbH6UUn9Bv1LBWLXOiYG8fkEH7zOu
         zYmtLUpa+fpC+sTRnmR4TUwnPbzlufUkx7yEMzJAcppSqn/XaV5IaefWftuRuohmtStp
         OEHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAkIo2XxO5L9BUPiS6PzhRCANTMwxS3tPVjqUXUW1is9pzpQxJBBEWR2El8KiUkGf334efm5pmhQxVcHM3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh19z33GZrqaJCV4YEdAXqSjc58mhoSHUb6c9yPbLjMyWskCrL
	rcE+b61uxbfTta9JPLrwq4J7f9/aGxrsbOMI2Sh4pGr06idbSeMGmtS1F2YsmCOjWTdtroBsu6v
	Z5bq1A5X5FIUatqdwU6E7VllbMVX3XT0yMohi7lhYOWCwwr7gwZnASfuTydy0kMuQzvg8
X-Gm-Gg: ASbGnctMwM77paT6RRNpgLYCGHUCYajqJXY6VAUJiEWqY5lcyyH4BlbAPppnHKLvDNi
	mg3mMbbYt2aZMTFRi7JXG/i9dx0UrPsf5+uZqWtsnHLlznbqoGImj6kUpbEQSIRx5rXXL+45MIU
	Q0hrmSv3JmHJYvQVOH8DvRJ81iEhASd3sHOzWDhai3USrhcF/6ve7KvZpqIMnevgPa4u7x7AatH
	f5Ip72H66KI6tfXKk4O9rH+tLko/7YzQc0RNYABnJL/VBt7oXpEpMjiLITT2/BAnos7TD57VmmW
	VN1sZSR1qx/bO1wgAqWQkpkQ18HUU/YQnrPKfikVQ2UOnPjV55JpXx+KmLdDoKnhCdsFa+9fVhG
	15eWebQsQYOQm12qZY40EyFuLQKq6arHrXg==
X-Received: by 2002:a17:902:dacf:b0:23f:75d1:3691 with SMTP id d9443c01a7336-245e0ebd338mr17897235ad.15.1755585432119;
        Mon, 18 Aug 2025 23:37:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs5sSOdxz4RmFjmlJHx9g8dTbVBE1WGeTusAu1XpGUGqae1RKUVGWzRGqVqz2wkAnydBOXQw==
X-Received: by 2002:a17:902:dacf:b0:23f:75d1:3691 with SMTP id d9443c01a7336-245e0ebd338mr17896935ad.15.1755585431668;
        Mon, 18 Aug 2025 23:37:11 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:37:11 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:36:01 +0800
Subject: [PATCH v4 6/6] arm64: dts: qcom: sa8155p-adp: Inverse phy-mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs615_eth-v4-6-5050ed3402cb@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
In-Reply-To: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585389; l=949;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=UVRoIFA7YXNnu/vJQ5olTkDt4U/pPMeeSryOJu9KTBM=;
 b=tsf+6WvUJKGOAH+FBQ4hmhftcJq+MxJgP5hpWHWfw7nVpRZpaoDF3ljPE8azKnO8ViTgXsSGS
 YPtA30xLy2ODO3YSOHN1nrjjEXlEbtXd3G+JBkkD4/mZWXfZrbYVwV0
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a41b99 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=78Yoz-F5aJHhz6vTWxYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 7lJj4sFE9JrQGgsgYllj9YpwFcUH556D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX2OMSZfEdHzqQ
 1geCzhCHFT/clAcCg6bI/cRWmhYzAKQ38Ey/D9XvbIzdmZTlCCGdY71Sjq47QpEYtzXxL347Ex5
 JSkeDCx/tFbga11LpC+gllmNWFA60OCO1grp+BzY//Oo+ydNGMeYxgH15y19QeP+4Fh2Cw56Z36
 as3RBAOfAubg7EHstBaCfix+gn2tXOEDSF2Qx1vCto+bQgPEuCWt7LQVXrdidw3XIXKGIfmR/ck
 PeUXRH8UsAfyg6RMJPaTCpWnTh30CjAnFS42aw8wsZXEMJlUwrI049GSP1aZoOpxkltojzrWZJu
 7r5H1sgDGNc8lk+ypPM7ZCaEdYw220uHB+rzA7H1sqr91oaXyoxCRU4479hnDMzra56Wdb3iI/y
 aEK8qMKt
X-Proofpoint-GUID: 7lJj4sFE9JrQGgsgYllj9YpwFcUH556D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

This board expects the MAC to add the delay. Set `phy-mode = "rgmii-id"`
in DTS to match upstream definition and work correctly with the updated
driver, which switches the semantic handling of 'rgmii' and 'rgmii-id'.

Breaking ABI compatibility is acceptable for this board, as it has no
known users or interest from any users.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 388d5ecee949..4ac1a5b09e30 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -325,7 +325,7 @@ &ethernet {
 	pinctrl-0 = <&ethernet_defaults>;
 
 	phy-handle = <&rgmii_phy>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 
 	mdio {
 		compatible = "snps,dwmac-mdio";

-- 
2.34.1


