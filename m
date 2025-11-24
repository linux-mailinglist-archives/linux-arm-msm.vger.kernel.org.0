Return-Path: <linux-arm-msm+bounces-83109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75008C81D24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 18:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B2A5E4E1A51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 17:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2092C2C21C4;
	Mon, 24 Nov 2025 17:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2E9pH8g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hdrqmdvv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AFA313E0D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 17:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764004145; cv=none; b=Jz0FWlJA+9q39eMmTmE5kMJG0/oc9uxop7gtCac1NXfJPQr48uDGbFESC09K2ZZ+kqEgQkdQU5g1gyg3Uk0AkmFx9PV3doXb3VrboLcWUw4kYq22RTZ/rKV7bZaDuhNWSptB9Lnur+95r8q9oqukjsRLLQBuB+2iluKFwJAR/gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764004145; c=relaxed/simple;
	bh=GEZkILBQcZuFuSsamTbUDcv0GlYXt84BAbmPewTcedI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GBSmLBNlpuOzXPaZhYsl/omgLCV76+RaT602VAyZAbX06t0XtnpZLuyp5Wi4GY83YcYFTSvppSJjxwPEN8Wjlg6rts/ylRbzIbULyqtsud8JZ5Ndn1EN1cn+yA2gVJgccrX9+uYTLi4r27FKQ+Dgcs3YR2Y04mGc6jYmAtXRbTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2E9pH8g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hdrqmdvv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOFuSpJ311654
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 17:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nTaVdnsOVRgvHNDCJYfyB4
	IZrgcK8LINikYhlVDs7eM=; b=E2E9pH8gGAo/rOGaj53YBawMLhuI8QuH/D6bUQ
	lL4XkXOG5XMO7m42XtJdpkXXl1F549Ak64vXMDKStIjejuXAYn6ZFPSGFj3BM4Qg
	/UjoCRMiDfaQUwoJKvknqsZcsKueJSpqANac4mv6O4VNSbV/7quXsiVDS1cAHhRD
	sKkYanzWV6c9+C2yOFHEFxkm0gzXM7d3/ZqSalmx2ios76WiK5kn8kC89IexiZv0
	c3q9hwG6P0Omv8DpJi7o/Iqf78bx3d1E6pgwZrnK+hFLMhQ2EMWYIuNn4TgkeKSw
	jaEHSqra+WVCB+QwPi7dRNCn8q5NFPzlr4hFcmzELRK29Tkg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amrv68jf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 17:09:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956f09f382so27839725ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764004142; x=1764608942; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nTaVdnsOVRgvHNDCJYfyB4IZrgcK8LINikYhlVDs7eM=;
        b=Hdrqmdvvpo28CXbITqXxG6zxIJhuqqAwB6yPz6gnW5CllfeinJgxbvaXVwzZVc1A7O
         kPVHepIGPxZilyH5tL7C7MApbcGRkDtPnQXHSB8xr+Wv9NV+esSQ4o8oxOm7Cl3eMwRw
         IMVqHAlrhrJaTAskSgNVgpQepCSt4S1opcqbUgMmLUQ+NvML1OCuXS1EtBQXgxavPrH8
         QaB1SM1uOlkzjiJslX1yohaTIE/tyQPZgbyiRbpA/A4uXlQlZ5ro8ihDU/3yXMP8+uGU
         LE/fE/niI5s5RjEnbtL+9wFDvc1hodYDZisI0LAJZFK7J2GkpQCYJc2KvSIeCWUipymZ
         yH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764004142; x=1764608942;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTaVdnsOVRgvHNDCJYfyB4IZrgcK8LINikYhlVDs7eM=;
        b=B0E103d49g/VFpDPFWPZ/sM0x3UkEmVxd0olF9NHbXnFUH4p5sKWuD8Lp/PKrkOztu
         dGWagRqG5A/Hb/vzchTBZZlzxeVUeOG/EnBHd8kb1df8Kupb2jyr92ljR6YRRjaDElG/
         BHWFdcdTTGRLsIIXyHF/e/Vu5mqPYl6dnu+hRBMK+QMyX53RIbS8hCyEBAXo0tRW4ljj
         Upwh6+0eQEU9VAjwVys9Q/+TTONtNEw5JpfLN2QF5+SM6LaFSWMaJa9yS3E/NpRonARj
         DJkjMl9ZOgTaOKjuRKJvVMZ3iq1BBzjm5VhbeSKyuyptfF7DgEIjmwvJ5C88RC19QiDt
         /yRg==
X-Gm-Message-State: AOJu0Yx7E3l6iQCw/3nzbh7I6zynQ3x2dRsVOzJ8SyOigHqiGoDJlJaF
	EMEGeBgGtqP8IW36NJE/rU2bqhLbHTF/N3AGz6wbzbfdjC66CQ7zTUh2YEfm88wMCKnhny6Iras
	gKduYV7yUtqCEUXBaxKv5dyVnqfn0Z8Cdy41ajdbVY213UfImlLbAqGz/xpSF1bk6Q9vQ
X-Gm-Gg: ASbGnct2rrGvTm5vN5MVvm8Ovj3kElw8fpiJT79JSSz0IMGwJVdhaLHFUl8vZw4RSGq
	2InyYXM85zpuGUvloEBJv8H1xDA2H5SThGc+KfkisMwcW25cgGvsQTLYyoKAg5vv+55fi4yT2f1
	N/LxkHqH3nWEAWdPIWsTUsrAoVgTTpSf+tO8HQkJQX/ijdnPDp1acpcqihAZTZ1VUrZatc3TK01
	dPXLHnP4rdU8HJbD43RXa4ssaykYF/0h8guWoQS/8UFN/HxxAOclIV57C/KpjCPJH28fmsRULjX
	arKsfa4nS/TLe5z9r9KhIf0nhnMtyZxg2nOA2EH8qdtuFJD8Pt45UkLt47quBbvVDoNYM/3MsjP
	LnELcJALW+pjzzQD4j7RZu4FBnYPSR2AOh50=
X-Received: by 2002:a17:903:2383:b0:295:557e:7468 with SMTP id d9443c01a7336-29b6c00b02dmr140316585ad.28.1764004142110;
        Mon, 24 Nov 2025 09:09:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFprP6rxA6/T2c4BwZxvgggU1iahHX7R3rpt90bPcjZsWL3XHIYeUVXg4tgCLb6TIFSE6gKzw==
X-Received: by 2002:a17:903:2383:b0:295:557e:7468 with SMTP id d9443c01a7336-29b6c00b02dmr140316175ad.28.1764004141639;
        Mon, 24 Nov 2025 09:09:01 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b107effsm143949275ad.14.2025.11.24.09.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 09:09:01 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH 0/2] Add TRNG node for x1e80100 SoC
Date: Mon, 24 Nov 2025 22:38:48 +0530
Message-Id: <20251124-trng_dt_binding_x1e80100-v1-0-b4eafa0f1077@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACCRJGkC/x2MQQqAIBAAvxJ7TnDNwPpKRGRuthcLjRCkvyfdZ
 g4zBRJFpgRjUyDSw4nPUAXbBrZjDZ4Eu+qgpOoRlRZ3DH5x92I5OK6YkYxEKcWgacPddKiVhZp
 fkXbO/3qa3/cDZ4KccmoAAAA=
X-Change-ID: 20251124-trng_dt_binding_x1e80100-94ec1f83142b
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764004137; l=599;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=GEZkILBQcZuFuSsamTbUDcv0GlYXt84BAbmPewTcedI=;
 b=bHOePMxySrpnBKqm1UMiYIn/NHf0e2w6to4onexOLo6gutSKTgjyDZ70ChhmcigO5wvs2b/Y4
 U+vgnJrP+WmAdqJjAoVJj+9AMX6Uko4WAUnsCCecsxTXfAq5846jAUp
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDE1MCBTYWx0ZWRfX05N4S+ZY7wWX
 kQe0a0fyTpi04lGhhweAEddlxQ3SlYKCm7pRZY+MTWnSzo/hZneJ/dzSVZccT4wfuEHDa8bTieU
 yZhhWR/bDM6X/2P3jTd4gBJTZP5DIkSf4U1tNd8wjrhMiOrH6vOvN/RnPokzHE77OUsmBwRQWaf
 qRCftZdLUpFYw2WKqXtb1ZnbdPHqySYpBPuZ7Hsx/F0uBIpWskO5rWUDUMdiOu3AoSFDGqbvH2y
 uIGPQGmaD4Qp5vVaNMbQxn3v84cfEMGJjMrPicQmLrFI7URCa5ilJARDkxxyPJaW1e1A31y9nLG
 ojj5Y42J5qVV2jIwtTGAo6pza9PigEfZ6vxasW1NyX+mWFH2KGCv5vPxmomqzHKp2bO1gX0m/Z6
 KU91VptWTI+YNhQ7/a8fEWr9bIMj0w==
X-Proofpoint-GUID: o2_JoLrvC60K8FWtNOJ8je5r7C4hgvpq
X-Authority-Analysis: v=2.4 cv=f7BFxeyM c=1 sm=1 tr=0 ts=6924912e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6ZNt1lSE2E78l_tYFJ4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: o2_JoLrvC60K8FWtNOJ8je5r7C4hgvpq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_06,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240150

Add device-tree nodes to enable TRNG for x1e80100 SoC

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Harshal Dev (2):
      dt-bindings: crypto: qcom,prng: document x1e80100
      arm64: dts: qcom: x1e80100: add TRNG node

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                  | 5 +++++
 2 files changed, 6 insertions(+)
---
base-commit: d13f3ac64efb868d09cb2726b1e84929afe90235
change-id: 20251124-trng_dt_binding_x1e80100-94ec1f83142b

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>


