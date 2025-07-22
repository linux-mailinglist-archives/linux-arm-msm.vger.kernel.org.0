Return-Path: <linux-arm-msm+bounces-66011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8D0B0D460
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 10:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BC71162BD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 08:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89982D6614;
	Tue, 22 Jul 2025 08:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhfhI59r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6712D373B
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 08:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753172505; cv=none; b=ig8VzYHw49eBR/1vTIXlG0URDz6JcNmeCQuIf0+qAaauq338b8knjC+hYUDNUq3XipssCNTbTYCbJoUExOKigzK84BQZrKIHW3VfDw8dBbw16E3x/rtjfG5njRrJBk34HyFwyTtKBGByGtNC+evw6w7hZe+YH3EBUZ3JbsngDGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753172505; c=relaxed/simple;
	bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oV6ZDiUW/s6g0uw5flLn5Msin3JNlszmkOlRDL6iXremBd6Nr0Qg+BhtFFZOAUmpuzKyaxCLFnEnZmerBgUIaqJfhaSQerTlu7QjXOINx/3wB4SUfJxDnLHW7DY47DiR1KePmaFYHZ8Ahe1Of+WuQXDwITm45R2ty151C/pWlWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhfhI59r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M4t3Vq015724
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 08:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=; b=WhfhI59rGSx+q2e+
	JbK8pIRZaqS0QCBSUiktznOnF1ueX/Ik9b8G86lB/7a6t/dAz0TwzFUU7pOLc6Ae
	TuiYgEfADr6MQL+L9OoJbVVmXMi/1N7UNGAecGQifTU2t59TE+oX+bgcnPE7LIgP
	PLw9N5AHrnsuq2e7IY3LuPOKBFCrVpgJPDfBD9+bCnyugtjvjgPekCZD+5h9n4tx
	1XNaC00CRTDXgigKC46FasIMby11569RbJhGcQWEZA+3MjsJ+VTjuDDjp6BI9oN8
	pKyu2kuq4z8zeUxnt18KzPR/vamblfku+btRl9+kmqTzdugmWQoacDWUFzeBVxxv
	hAv0lA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451ghk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 08:21:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31ca4b6a8eso3601193a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 01:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753172502; x=1753777302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=;
        b=jPSLYvCIE9qdvZl5v+TFDmUID7CX/ISsddm/8nscKUiHsL3ceWYhK5kOKmGiVoZTms
         MVmhqMZ3SncUhPvaNIiXANtvPQIrDm7CrXnyNCBPF20A6mKMNoTYW/JzAOFXxrDw/gjm
         o+4MbtAWGIJ6vxPPHUu/l7qBvxQTKcvMWS3bok0v1Cvc4YhNPvgyNWg2uMimCagIIuPb
         8C984fl3nEn5iW/sTh3d+ShtEMshl1oSPmfs43eQtbzewv4lmsTevmKaGmHJ3/ERaIcJ
         8vnvMYv1ZwhpNnu8a84ZeZkT1C3DfM8i+3rbXwqx+oUAv2310r2QkmoJbhXFCFFQ8FJF
         rKMA==
X-Gm-Message-State: AOJu0Yw+ydN3UXPfgAiQITZM3jLz4xOa9E1dNput8Z0p7q6Ppm0NUNgN
	2cQjCS1T03+6x0bxiVcUeazpQpSWnDuhpFXmiAzmJx8kTMbz0P4Q9LMf6i1GmvyZ7yA3pwLsn6P
	BEfGdyS8EFdc/15xM2XHv+IYzoK1VnD4nm0ntvbGDDIGsX9naMyeBKlJ2IH/Bct6U0auW
X-Gm-Gg: ASbGnctK4ukc0B9ULhPLvGKg3GJt830hiaOBCCBBf9tGy4DhIsbueUPjwqQkmvpkwCG
	KG/t6xFeh2RddRkf9cIjQKvSIMSswn1QE/oQWO5f7AHO1SVdzdaEzohe4ft0tj1KXGwjjPQ+I51
	UdWlhYLQkyUNx2LkBZdbdPf3cnSGAaAyG4FAgFT38nicG7EovdN3q/LtPJDNEMLfEOPOAbwZPjF
	x3XXfkqgKxud4RK/h+DMk2ohAJWj/nsB5xvcshgy1kweT+h3iAE5A+7HxPAHw589c84Nfnwitxn
	p4LJf+BgTHm/c4qiRDX6zvPJh6wkmhUf75dlMqIHaBot5yiI0eaGKMrLfgUD
X-Received: by 2002:a17:902:f683:b0:234:bc4e:4eb8 with SMTP id d9443c01a7336-23e3b883340mr253148965ad.46.1753172501871;
        Tue, 22 Jul 2025 01:21:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMHeIru6AMa2BMVF2ulTO1NNIkX+FjZ+wMn9YJ5/aatntmKA4rjfIeF3aKgxv0OKGhiHqBgQ==
X-Received: by 2002:a17:902:f683:b0:234:bc4e:4eb8 with SMTP id d9443c01a7336-23e3b883340mr253148685ad.46.1753172501448;
        Tue, 22 Jul 2025 01:21:41 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60eb01sm70994255ad.57.2025.07.22.01.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 01:21:41 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:21:27 +0800
Subject: [PATCH v5 1/2] arm64: dts: qcom: qcs615: add a PCIe port for WLAN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-615-v5-1-4677e70e25ae@oss.qualcomm.com>
References: <20250722-615-v5-0-4677e70e25ae@oss.qualcomm.com>
In-Reply-To: <20250722-615-v5-0-4677e70e25ae@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753172496; l=943;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
 b=udUQZfWvGiNlY5YaptGAlEF3HxsBO5zF5yaVZjXcmtmaPO6L2TzHSYybE/XnX2HMTpXFJDql8
 xiz87+MSkPlCgCjTVUrtAm83ZiyTJgya3Iujh/e1S/VKhBCuhtRLE/v
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687f4a17 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dI-8CA4c5Xf8_vBnWYsA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: ZuYGljQwQuEdeddxYzAD18yNGoXHgblc
X-Proofpoint-GUID: ZuYGljQwQuEdeddxYzAD18yNGoXHgblc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA2OCBTYWx0ZWRfX/HOVp+6Nq0xw
 LP7TmU75RtMQgXONahTBKKJV7koMD11iM0Y4DylpvHEuXJprmoXwTuI5QRr8R+6QD5h5dH7LP44
 4PikeVteiN72ExaHNRy3JUd1aJ5azDGS1tki/V+jekHJW84FZEe2X3CV0uSmDX7wTd1zgCSCh1Y
 9Jyv7shuoO8HDbLLoVFibRC9oGbS0kU9ECjKUuIig/v7SVocMsbhwfxnVEFRg45FVV+yk/Lo9E8
 W7gDq8BTdC2Psot83pHbf4UH1bG2GAiEkmOGIprsecwA6BZExK4LyZ5msU+H+Ienp2pJOFb19hB
 TOhBNpCEOsdKoZbxzxpMv+b9PC01bw8EMYkuehGL2U5L6nLRXpj22kaSog5pFMCwrzt0ZwQpMvR
 AHbthrPbDp05DngwQaYetAjIbG0EYzT1XuHUd5dHDIt8kS4lH4cRkoo/1utQ+x0MWD5mxErK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220068

Add an original PCIe port for WLAN. This port will be referenced and
supplemented by specific WLAN devices.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f4b51cca17de5518aad4332330340a59edfdc7ec..b4fbed517cde18e088096d182fe6b482363e403d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -1173,6 +1173,15 @@ opp-5000000 {
 					opp-peak-kBps = <500000 1>;
 				};
 			};
+
+			pcie_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				bus-range = <0x01 0xff>;
+			};
 		};
 
 		pcie_phy: phy@1c0e000 {

-- 
2.34.1


