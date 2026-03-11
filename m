Return-Path: <linux-arm-msm+bounces-96933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDVzDEY7sWkLswIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:52:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3FE2614BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C5B53059AE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9343C6A43;
	Wed, 11 Mar 2026 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="plq45vbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWlNVzX8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309D13C945E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222410; cv=none; b=KWVidcsSRNuziDwE5FbHzbdlcN9LnuhD08jdvd8Aaff113KscQj+C2P1CX7GJr47xr+Z1Fy9v8TIIqPX1BHxlBaE1rrDKgrqVgC3Zo3/joMQ9S+pulLsVc9J7BCpMtpRHrw9x8cd0AXZDx+e0/EttIxHmjuA8HMEvLxu3ojCe2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222410; c=relaxed/simple;
	bh=xRVBcUcPQn/3XRwGa/LJ62R3q+1u7kG4HqctFlCN9Kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DbSrFKI55BCyey9FbrU8GJGSxMlbNR8r3ORFDJJeEEx/WIskOgVW+STQlvbsMr4l45YdAjdALhxnBXwaoaG8qOHp/mFvoUv3u755W4rezgGo6FQHoiv4OESIb/IQDrSRMn4ATfKkZnjDK3DHWXjnTk6QGP4X46XzXTnt1FPZzGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plq45vbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWlNVzX8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9evoK249216
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GAqPvw1+mNYrygeKcTD6WH5A0ur1DU2x0eDKSc/2zAc=; b=plq45vbuOeZdbTz2
	YBRBl4dde8USmvzjrV0gLoJ9v1z7Yu79CoT6b2Z595ySVwRpzVEn3hx7NL7JDijA
	v/iz3DF2TUus1h+dJPYDBvNJu3qvGWExYrgpaSLNEBaR+XGyZnkDge0V0lVbeAbI
	WoV39tWsTrmMvAEOqXrOykPZ/mcIbGKlSCT9flCiv6LyGsGOgjF9bOI1mLm1oFzH
	B/IM0UEwseJfJvXwUT40BDvg54Y8Vbmr/iLcxeSFz5HYRolVor7rPIAPUzhNx94H
	LeipY2dPqCPRNTxPEOi8OGhv/ZWKopidr/BfmTKKdcnBCyVow/asVBqkCBT1yJf5
	a3FASg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv12vwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:46:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829ad972df6so2105526b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222406; x=1773827206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAqPvw1+mNYrygeKcTD6WH5A0ur1DU2x0eDKSc/2zAc=;
        b=dWlNVzX89bye9ldvn5tmCJDnz2HVD4yiKJrGsbc+HRzI/XJrKHfrc2IcVQwbsgcK+t
         Z0gDCHzDW6y4W1CJf8EopIkS1R6g/hYQvVcouDUjM6MQODmwcGUcQnKpPys91bCsLh6f
         glGDBI936Y7nP5BNsrN9YATTQB0HfMafmvvWPjf1bSTwokrD2DYaxKXFkUKIkFb2M1fQ
         5hITU/nVSydJcrc1Bm2/EKUeFpw4YpQw1GwSILIJDcvLhCWy096VcqUhdd3EHFrLKmxE
         XDTEStdllbJeHkGZckWhwHGC4OhrCdrih6SLAp5N0rQ80/9HRYk65YS9LPiasPGv1f3D
         9W2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222406; x=1773827206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GAqPvw1+mNYrygeKcTD6WH5A0ur1DU2x0eDKSc/2zAc=;
        b=TN96Rdh0n5mkEF02J7C1zGJLlVuIXYgsZegA8WaG/lNw8nqmdCWUWlQQvnJprHc2jF
         cOZWGle74xWuCrtawbzG7FshfFomXZEATdNN6YpE3wFfYG+azMSdxeQygVClVLtsHoUF
         1mRd3enZRsl/pV1lN3HlPfAEXCytzYAMIJFpyoavkz+uUNgejZ/TiGpc4Sj8A46+sjkt
         gaK+dwqFRvb4AbbGVG5U0TjOex0sDJ54xijZKzMuLrjVcskkJ8FxMc/0z4i8Hp8p3Kke
         yXFd2JfgQEt0v4z3fYC8tomPvtgz8fRKNcTeo9zpLa/PwXlVJn1FowCeVQahC8H3ZyQR
         AFsQ==
X-Gm-Message-State: AOJu0YwrIr/uRJ27/PuyCDGKIDuXjT4r7giqunEMzeRiUDODRXNvDw1E
	ud21BYkfffYQ+NP5TasXcobdWR1v+odIWlO6aZW+yqpAUDXf/8rjg4BEhzhmdrVMfC8UutNfqVC
	DEfiUsUYavWv5AFifkfFXVm9b2K/I8x0gcY0pwl6J8PUrYbWFJ5t8Toz9wyoF2YeMRwK/
X-Gm-Gg: ATEYQzxdLT9G35hubs1x6qxO69uiww/LvwD7HnF06/Vl2EJ3iRjDxIUhZrTdq7HnxMQ
	GCADhXsNSxaVjydAxbvyAVDDYLraLwIW/2fhf9RW/MpvXUHW54dRXsTbYs5mNBf0xa80/OZT8gV
	PVUlQFBgqmXIGgnMarCwfFcyCoILoLvhbbFC/DOp5gLrXk6L498I5Ag5EUaPB8ORJwT3mMmyAeB
	L5W7ClXex4to0jcu24co9+zX4fpF0Up0+0d2oSxp0/9a73ihBfwI17UYs+3iGCcGYkWyqsLbnd+
	QzhmsdbdGeY8yK+VodvnKyVIMlxYjXZHU/iS4Fq9qz/NDagzqPJwk8pucvytG2F+zYgS5FSgu5o
	ZR4IAA4U6RCijdPS+0qiEx+BLzixW7ZgfKp/FgO7NYWItx5O9iz4a3rq7oO+aR4pEWpXFb1p94c
	OQOwX+3KQhiS8HLbbhvGEFN5T8wVsHFZumJxhSpTqHamZQRa8cK9YbrB3t
X-Received: by 2002:a05:6a00:1990:b0:829:800b:9d6 with SMTP id d2e1a72fcca58-829f7250204mr1685304b3a.57.1773222405961;
        Wed, 11 Mar 2026 02:46:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:1990:b0:829:800b:9d6 with SMTP id d2e1a72fcca58-829f7250204mr1685271b3a.57.1773222405481;
        Wed, 11 Mar 2026 02:46:45 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:46:45 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:15:51 +0530
Subject: [PATCH 9/9] arm64: defconfig: enable IPQ5210 RDP504 base configs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ipq5210_boot_to_shell-v1-9-fe857d68d698@oss.qualcomm.com>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=983;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=xRVBcUcPQn/3XRwGa/LJ62R3q+1u7kG4HqctFlCN9Kw=;
 b=46hwhX6Fzw1ORCbsBk9ce+pweRqE9HfyvYl9JYwhPPyKeDFkwXNmr5mWVbAg+j4pTHJbdVwTT
 qb1r79eB42vDxit17ARd9vUNhYfNk6Kyt+cNm8jnJO4pzFxJlBimfBB
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfX9Gltw3lcBvqB
 eQQ26znlHsm7hfSiz6/wMcMIsrOi9k5dMVPEALxPXVK59EcmdQwZXQXEFvk+NBPAQQuxJs4aBK7
 4+bEqF2OfO0AgZY8zjprTt3v9U+LxPaxoiFpsJBCH/f8VgfFC4GP6m3umf5HIEThSuSwrDAlW/G
 Hwu14fQox+RIMrGxnu8wwqW1WTc2VBUGJeAEjUuIyyAVM1l3IqLwKJARXVhsijc+r3xhSbdYJBK
 tIplQfO3MmIrio724ZMy5C5i7mSZEn+L2FqHyZx/uv8rjwv4tSxNjqYxT4wet0VwSTBjHH6oHaC
 RKicdXVEsNBdX0lSJNS7srPGmcT+nj7bdh8paAkg0RWHCY5E8hZQBWZvbmCg+dERHVStR6vraBE
 Ihiq60g6jUAssav80c+oSpyrA6d1axTO7OXGkiwUeVhx5d3Sr8dcS8QpNEB2c78u/3ckuqRGyAu
 GgFEj+E41hnEaUL4orQ==
X-Proofpoint-GUID: aajC6vx5-u4mJcJmF8T9hgJe8AHLRvPJ
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b13a07 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: aajC6vx5-u4mJcJmF8T9hgJe8AHLRvPJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110081
X-Rspamd-Queue-Id: 9F3FE2614BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96933-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

Enable GCC, Pinctrl for Qualcomm's IPQ5210 SoC which is required to boot
ipq5210-rdp504 board to a console shell.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ed70ab7ee854038fa7a756d8b650a609258bdb3..59c748efc1ca8d6eb7dca19011d2a31d926a0d43 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -649,6 +649,7 @@ CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
 CONFIG_PINCTRL_GLYMUR=y
 CONFIG_PINCTRL_IPQ5018=y
+CONFIG_PINCTRL_IPQ5210=y
 CONFIG_PINCTRL_IPQ5332=y
 CONFIG_PINCTRL_IPQ5424=y
 CONFIG_PINCTRL_IPQ8074=y
@@ -1476,6 +1477,7 @@ CONFIG_IPQ_APSS_6018=y
 CONFIG_IPQ_APSS_5018=y
 CONFIG_IPQ_CMN_PLL=m
 CONFIG_IPQ_GCC_5018=y
+CONFIG_IPQ_GCC_5210=y
 CONFIG_IPQ_GCC_5332=y
 CONFIG_IPQ_GCC_5424=y
 CONFIG_IPQ_GCC_6018=y

-- 
2.34.1


