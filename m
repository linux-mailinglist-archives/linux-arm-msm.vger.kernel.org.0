Return-Path: <linux-arm-msm+bounces-87242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C307CEE9C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 14:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A772F303EA13
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 12:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7204230CDB0;
	Fri,  2 Jan 2026 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NdVIkrRp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1Uo02Ct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B13E2FF646
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 12:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358195; cv=none; b=acLyzNiFH3fuG3leaP28Y+VhljFWgG4aKUbW7HdDSOABcKV6ONoSWUVdaVZm3kzHcsgKdRaq47j2t4ctLdM/0cWtUAmbqZzOlHTwBoMzX+qCLR5C1E1CJQZfFYU+B/yrNZBjDPy1fs1CO6Hfr7qhsRf4WbykMj8Hl+ewODwusu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358195; c=relaxed/simple;
	bh=nDvM2tNc7bhnswWwCc3vXNDXP4C1H2W2zKaXu5ozTQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZB4xADY5HxrHtmPMJ9tK6O3av9YS7eyZyQX6+QcOMbLYSL2/D9XvPeDVs4VWycus4AhUWZZ/5KEkNDwOxZ2MP0/D7tQE3Lsj5QxWzELVr7vl1qr48QXE+9H0vlBYS/ii8+fO2pT+f5VBstN2z78dIJJiCLUoeK+MOLcLl3u4FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NdVIkrRp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1Uo02Ct; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WFMr824618
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 12:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I1PTZZIAa0t
	EuYR+p5xJVPIyMtUwfOVI7eaAwzoH1zQ=; b=NdVIkrRpWMfGZwnJAKnLYdnS5Ub
	PEbC6QWTYdCXT7UCQ430AU3n/u1+42O6c95zJeyXmph7rWOIbX4bLcbo5+x60HuJ
	b0UMaCGmTNu505s6Lg1jtpRy0iFgEBBRG2Du0gpI7CN9vjHimUAZQgXqAoO8R8gW
	OLZwmf2LPg58YpQgyLplTpLvjaSrLw/OivD6brb9tXhwMbTaU6tr1dmJsdOMkbnu
	a/7uRKgLv7A/VFz0RURgoL/MLl0Jxrv85OTHeFHOlQ/HMo9ho52ArSN4RIbHNSsO
	hl5bw9QRz62S1egdgIRvqANiOL5wQYJm+o8lVzZzQyPm3MVDxOo2Bf048Bw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533byn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 12:49:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0995fa85so365907641cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 04:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358188; x=1767962988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1PTZZIAa0tEuYR+p5xJVPIyMtUwfOVI7eaAwzoH1zQ=;
        b=R1Uo02CtH11vcW/6q252iGF6J5+Udkw6EUuzgDX0nm7pIi6jzWoIL16G1x3fw/TfEn
         /KgpU2IQqdWr+rxqnIULexUHHcuINJhN6UZHOfUsplsLNEBlCEfDUnMtx9EyOMAQ5Ud/
         vadP9R0QSMwEsl/gXrdRZbx4y4iFv3OnjxJVubxlmAdjdTNXQqC8577plH+2v05AWJ37
         +1RnE0Cdae0kUxNf+QOA+HHeWROpJNmyBkzx/gnxtSP3KQg9XoTrBDycKhpK99VxDmCV
         W7Q4TyzFTLJ6M5t7u6WwFEVG+aeNeS+p0OVTHhdwePmRxy0TgJRJVvcO+VH6noH6Qak9
         c2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358188; x=1767962988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I1PTZZIAa0tEuYR+p5xJVPIyMtUwfOVI7eaAwzoH1zQ=;
        b=G0IIETDb2BRlT/sjQyrqjkoTXXteVr+Xp6R50iyuybi19IfNa+BZiUtB3NZf7KQSe5
         I75sHIauwRnl0iZg3uNIOQ5u4vFqzLPZcIIj0GiYSuBiFHLc9fuUrXUH7ahH0JO8/wUa
         XJwFXvQx1THQ4jSj8qVITpnD+fNzNPZK4m6w/ZFW7PcOYwN203iA8gJP2bvcdgvFY6ZN
         sCZOVNwbqCtRDSPDcBYmHgWaJv0MYu1HKjblMiVaGWtO2S7h9JvNW9leyk1C3PRse7Tl
         B8n7ORxdf63ncGztAeAnTZK05ykpHYtEiJRqf4UNT9si3MA4dKgk+di4HwU3ulj7EoVJ
         dc6w==
X-Forwarded-Encrypted: i=1; AJvYcCUo38mrSXQ93P0DG4CYABGFzQi8tXGhrp7U7aq4BJDYumr6BLY8PIN48y6szrEqrSzud9LjCFepduj+yD+1@vger.kernel.org
X-Gm-Message-State: AOJu0YzMWZjQcMkQ1g6igS22ZHB/NidfqkvaHWBi/RyTWbTRSpNb1dZn
	kxzs49u+u0O6/2lpRFFD5ZtfqGTZKT3IDoju88fjhSjY7krMcuU4+Be0wU8jyF+87eQbnPA2das
	+BM/fc+Yv7+mcdCJW1f/fJxZnJgTiF+PfxiF+VkYAWQs5Qou0SGfhUQKoyFJhJg6d7V8E
X-Gm-Gg: AY/fxX6PglsuQo4WTbKp55MYZPDx56XoqNnS9ucad2Rf+vGiNIQrXwyJLl3/aguUurW
	5NT6Mzk5pcWep3muAE1ik71NHd4V/t1Mc3TwvDy60kD3wS4bkaamEcBgsRAj0SSm/W9XIvljazC
	+5zwPcZS+wrC2Ln4LVYnXgt+qDkHdC2cIxF0nUFUttNXXPua9Zm+pYyX65/PG0XpwCXmorrBsbq
	46MSdnsuaN9KnmmO95oixC2vl+6Ik8mabQwQg+7Xs+KefsmDSXcVaxxC4dIaZVCPCHTakkb7QU5
	nnR6ynyuXwjycf4Ny054n61uoIdbJIZPHq1tc2NfxJqyVBz7R3+7/tdeb9L84N7tsa/T30YQoa4
	7dgq7CwhWvwjcy1EqqYp30+51Zw==
X-Received: by 2002:ac8:7fc3:0:b0:4f3:4bbb:d5c9 with SMTP id d75a77b69052e-4f4abdca1a1mr687187631cf.79.1767358187630;
        Fri, 02 Jan 2026 04:49:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPjxg3lErIClyj1q/c2QA920cSvN+jNUa0YCVQZucLeQ6j109UB9otuPfKDt7/rt2bIeq6Gg==
X-Received: by 2002:ac8:7fc3:0:b0:4f3:4bbb:d5c9 with SMTP id d75a77b69052e-4f4abdca1a1mr687187471cf.79.1767358187278;
        Fri, 02 Jan 2026 04:49:47 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <mwalle@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 5/7] mtd: rawnand: vf610: Fix Wvoid-pointer-to-enum-cast warning
Date: Fri,  2 Jan 2026 13:49:32 +0100
Message-ID: <20260102124927.64703-12-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=936; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=nDvM2tNc7bhnswWwCc3vXNDXP4C1H2W2zKaXu5ozTQc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77bC0qTYrHh193XJS6xkRC3AcCNBpx+8voar
 IeQOheWfXOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+2wAKCRDBN2bmhouD
 1+VED/9nCajKvFH2HUNRtSa685vy12JdBeXoLcJ7SzfTs0WnxG+r+r9cbvpL7vPW9ikOIcnnOCt
 DTBfkWRJmmggpB6RAkJOCxKswAStjMOQU+0gxkD+DrNfQ/L1CaG1SgR5BbNzIr1kP1HZey9J+5z
 faZbFmaf2NGpVGI0rM9cfbCadHzLjqf9I/a0Yt+WyEj8g8wRONlRkwVXb6WlXnb4hExlwbLaQXd
 EZNZamSXX2zZtNMH0xpCyPtf6d5sTpOlXq7gUghE4D1mj5+yYwQxZ0k6RUsfmpJ1GD99xdIvLO5
 z2u167lPzwz3jjRayeQpjgpI39gjdEQrp+PL3gXC7aAcYETamK5al/9Vm2fZ0ugmiAcn7DNlksn
 MGrA/CBI57LzaF2P6KAR7AZII5GtMU6tMHyrowRSadM8rk86RTov5Vhonfz337MMgIJ20kBsKTu
 pkWzftQMFkxpE/JHEAPjgG0swDDcrsoJcee3zYNEFZGBaegmqT2iuKP2FbnVH03WHSj0+LT6N4k
 vkcq2tAG3cC//wWZ3tZI0USZN7rGMkRa51i7IFLGriycgsmXMJF9dsxlNmUDBLIYl2QH5ST4fFb
 mFiHTog0RvCAwkOmy21hC0aFulT77OqoCwLkLnGapgscBfKaNTgS3g2q/aByvutYdczfoninGWA P8HQjOl0aUFIeMg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bdHUwlFMyW2-ywH4rVzGhnLJAhieLh8n
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957beec cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TpWAFCZ4qp-4Y20zCj4A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: bdHUwlFMyW2-ywH4rVzGhnLJAhieLh8n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX97k41d+1THhY
 WZzZUsihEaWT5c+H7+1RKpIDSRMiN7VoqAW9lj3kxZjLyUj6Ku3ChHqm6YN4RwhOT8axI9wgdWa
 tGsW5TkqI+sqrPPhf+O1tRhrc+7zkE+IHjasT4zvRWFAyK0uDxLbh6rmKlErMVn7sn4Ofm+7bDC
 OeYrPBCcKmVMvwkXpuzTRmM/h1NP0N8LGsqSTiomL4c/49RawagVdhodDmtUZOjrTm4dHBPN2f1
 Oi5S+2TsBmqP/r7d5aWNR5AQgY779xfr186cFvWXexpv4jYJaU6VJOp78oyPrA+m3fyXqlqHR8C
 749cIT4cIX0YGl76yB3xDp7HCs6HgNKzEm34u4P1qXSYoQyEy8USaxQe7j1ChBjT31jFyV4t8NI
 vXVoGZB63/14lAyn/32s53OrZLqNvPI6ixaAnmE9ThCp9UbrJ4lRLNq8V+2bAXhNeSQWFeTLs/M
 lFtFHNFoeQRdjxwGcUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020113

"nfc->variant" is an enum, thus cast of pointer on 64-bit compile test
with clang W=1 causes:

  vf610_nfc.c:843:17: error: cast to smaller integer type 'enum vf610_nfc_variant' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 4b5ba3187853..1955dc50b40a 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -840,7 +840,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 		return PTR_ERR(nfc->clk);
 	}
 
-	nfc->variant = (enum vf610_nfc_variant)device_get_match_data(&pdev->dev);
+	nfc->variant = (unsigned long)device_get_match_data(&pdev->dev);
 	if (!nfc->variant)
 		return -ENODEV;
 
-- 
2.51.0


