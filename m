Return-Path: <linux-arm-msm+bounces-81451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E19AC5319E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 16:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77C05505D31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 14:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE2034A766;
	Wed, 12 Nov 2025 14:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0syu2N3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXV4oJVG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E4D3491FB
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762958910; cv=none; b=gaTgYd30Eqr1umm1rkJnpkxZkqMr8oAlNON/JJ9lOTTLqKDZi7zWR/Ia49NeXXhnSgkHWQaoQrnj/XqZws6uaC8xPDPdYJ3fsbfx/sUaC4Sk2rqj1hq4vuJ3f2gBtZu+409Nkij0UaFRVXNz8n4Ac00gl1M5ao5sOsYhxTAx0bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762958910; c=relaxed/simple;
	bh=9PqxUlRpFFCh1taZ3oLNDJ3kN9QV16XGK7ZLTsF67dM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d/IVTlJ0WvfiuwoII3X+YkdH/OBD3QgTyCJBybkonpVoxuKPpi1uumDq5DiVMlnLP0OcOGUa3IX+SLXCQOyCoB6/Do8fARQz5Mv156SSj7ON+jW7HYKU5NPR8nD+7FE+bcjY+pEQscf3Cz5V6OQlwm2KnjGZblYXiV6t/7L0XZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0syu2N3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXV4oJVG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACEJ6cS1382149
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dWbBm32nIsy7hX/7GW0YHW
	3GKPIux+9q5ey0vZSs58M=; b=m0syu2N3+21MEAk3zMyMIdOlStb4W41NfbICR2
	hQ5XnC8i0jAhSL1ZmYjlYBwFy5P1f8I2nTdveYeMz1yglvODUUL7UExJArYHPHZP
	j9WeLkuJXkbnd8jdMHSilabVPN1V+aL3vsSCav/ifN9M3M22VTl0F8hKj6yNXrzq
	2ATc+agj8V0CFc0xjowjstbT8HO7ISArq51Cl2p3vEuOUt/5vmdaK4ZpIQcRjcO5
	ky7yyqLFXvJFwDriMrJN7qaQkme5x+LbIiK7p71Y2z4DGnO+jbKSj0AZZM6di1Rp
	IGFha6rAM5xDPl5VSVRY6tueLPphiH/cw971/3QU3BDsTYwA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuw482sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:48:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so819141a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762958908; x=1763563708; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dWbBm32nIsy7hX/7GW0YHW3GKPIux+9q5ey0vZSs58M=;
        b=MXV4oJVGC0oE9TXoH2SpivhpUZpz5x5T8Z/jz9tn8o6zXuC2X4yGf3Hzdp4DQj8noG
         m2zNGfNVXxQ8ORWvsKfwqpVUFg05x//do9AVj1JSM4uTa/nva6h8do+J0Rrn0cHKy8Z2
         kKGKioHdoOIEIeEJ0bVM3XORy6UiXAa8YdkLgtPSdB6EYmxx5laFZvZ8ERU0IPRJpZTr
         UsOcz2WM1JfE97JasbOuwJLL6+2h2uWZd00eijF5oiFpRj/WRwDlNXvcEwRU1A25zE9+
         Mr9dZCd5EX418Iu9isHPePeGaKhhFsifX9SAe8phFzon6MIr+9rDVF3lZHyAgAZ0SG63
         h2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762958908; x=1763563708;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWbBm32nIsy7hX/7GW0YHW3GKPIux+9q5ey0vZSs58M=;
        b=PcxdJJBotDyVbD5sEp+IfP4QY2E7tZH9vm9n6dBPlvpXVjc4f285i0jiPoMcjVJnXD
         g3wxn2rWR90cghS6aH4RKbXtWtxXkoC7H+814wXbhdFs5H3XzVlCyQ3RHNaHa/clyyWY
         PFv8R2OWjMjF5ykcuqtQnqcuLsR1xgPriGQR0Cd7fh7Ld1xt3iizRt0Mt+Pd7eClh0/Z
         MxFaSO/DfOXiWObP9iGlqrcgYxDxZ/LF/1PXSx30XOVQPbuuyoNw1aIklj9yBT/eXjI7
         h8ysbn5aiSfgl5XrHcBSJXhYUWxm8MQI6gITRS38x83X0FKapvtkXnNdYvH9zLQrCH76
         9DmQ==
X-Gm-Message-State: AOJu0YwjaEfn6QBoMgAfjtug7dWr0YBo1uheOUo8n95NQmLTTBIUIDEa
	TXFCqXB00yPoSxDy8eR9HOvqPfsyvLKdNDnxhS3wLWoUODfmnrlz4XMrnUk/1FMhWWc0n/q1V7+
	OR5H8A2bwq4FbkSJxg9pQAAJL0noy9gedT5LVeh43/4mn4SGRaz+zf6GYRB472725XeSlVNFe1I
	z1
X-Gm-Gg: ASbGnctZS797cwMci5iBO6c6CFOy2EMk4a/69VhWrgE/l6ac0TzuiIfpq7TFjkDgM3h
	aMVddDFbctLSeSgkk18CAM0KINk06jRTPbfU3QXziI1vH5kdhiW/LFH18yDPoGGfdPErDdcMgmi
	i4yphN7i+DCLJcy2pxh9WTX69cgwCl4scNy1zI6RTtTR1ZIOGD821k4HkEs3UKv6nMMqdtAjDC2
	tO5pBeL4E2SzThcgCli2c+/7f1YYinCBCmwZaDmhNypDB0u6w2XeJAbhDoZMUuA0DhNk9HELv7p
	gmuGtXrBxeAv1WnENAXxwE2XJA6dz3jBg4N9iIdaNUxwNJBurL6S/H6zrO022+Fkh1eDoRzLClq
	7q+ugtZUM9qbixmht+kpMksFhWVn2zIiwq4x3YBA=
X-Received: by 2002:a05:6a21:498:b0:342:3b8a:f349 with SMTP id adf61e73a8af0-3590c2011a1mr3958634637.52.1762958907577;
        Wed, 12 Nov 2025 06:48:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgo3wUH9zJxGQBmUR9uRu6r7uP4DumatVM+h0gLk8xcEARsSSFLXdK3iHDwFdRgHy4ZQAWdQ==
X-Received: by 2002:a05:6a21:498:b0:342:3b8a:f349 with SMTP id adf61e73a8af0-3590c2011a1mr3958575637.52.1762958907005;
        Wed, 12 Nov 2025 06:48:27 -0800 (PST)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17b0c4sm19098234b3a.48.2025.11.12.06.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 06:48:26 -0800 (PST)
From: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Subject: [PATCH 0/2] Subject: [PATCH v1 0/2] Add LVDS panel for rb3gen2
 industrial mezzanine
Date: Wed, 12 Nov 2025 20:18:10 +0530
Message-Id: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-0-6eab844ec3ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACqeFGkC/22Ny2rDMBBFf8Vo3Ql61bJNKV30L0oWeozSAVtKJ
 DuUhPx7lXrbzcC53DvnzioWwsqm7s4KXqlSTg3ES8f8t00nBAqNmeTyVQghwYYA8zpKITy4QqE
 1Yi5QnDphkkApbHUtZGdY8HaziVIrDFwHz8fIjWTt87lgpJ8/69dx54KXrcnXPWSfeMYUKuQ0d
 W+7m5v/3FcJHBzvRY9SaW78R671cNns7POyHNp5fxqdrQjPhNapU16FQYhBtZkbUY8hKMlNdM5
 51SuhjdYuqsiOj8cv4EhkoSEBAAA=
X-Change-ID: 20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-f804dc09f072
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        Yi Zhang <zhanyi@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762958903; l=786;
 i=venkata.botlagunta@oss.qualcomm.com; s=20251110; h=from:subject:message-id;
 bh=9PqxUlRpFFCh1taZ3oLNDJ3kN9QV16XGK7ZLTsF67dM=;
 b=tcxyr70fvu2+gdtFkmciyIbtr0aXiIWPqnSzd9w8ozM6U2bu3v7nR0Jvj4db7s7HMob2g6Gvl
 ffNFHvUwrKUDXM6b+tO32/1NhmTDjjDIPeizXagvWQIuzmN5huFwLPA
X-Developer-Key: i=venkata.botlagunta@oss.qualcomm.com; a=ed25519;
 pk=/SnYBwlkTzDCLnHFgEY0qFwPgKIV+aQWRbc3naiLzrk=
X-Proofpoint-ORIG-GUID: MFSYBBefThgVf8uGceptv94JKKbhJo6X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExOSBTYWx0ZWRfXzDm8GV1ieBFM
 jmJOrhJ8xqdGKY1Y1LSwZ/Bg2GHHVltr5Of4d3opGLC/o5hRxEXPyKRP1t376y7dzoqejVasYzq
 0Gi2LjdcltwvT1e3KKsay9x5a6grH69Y635bNTpsoAb/kxk34NMZ0x/vZEEXyaSpp8kFpiiErc+
 o3cr3u2rt2p7jfG40qv8ilJ1KOxTM4bvFo4XFRV5dOFcqruS7fYzwu+RLDg06OHul5no/Qe6Gpl
 9/YNs75a/kIFAqt5az0LyHP7MkQMWUoJ0Gd4hkUj016rxdc+SffNEu3FZC9l/Sx5yVn6hkIhU8h
 HqxdMRP9mf6qbzCOunKw0AD+fm6bWFEoGHmL3VgCg6Zi9egokeIs6IQmbSKk3NZlGd2MWs6/wnl
 hU7P640n8f86XqYxqPq7fseuhihSDw==
X-Authority-Analysis: v=2.4 cv=F+Bat6hN c=1 sm=1 tr=0 ts=69149e3c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EG195Y-omq6Azxm0EQMA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: MFSYBBefThgVf8uGceptv94JKKbhJo6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120119

Enables LT9211C bridge on rb3gen2 industrial mezzanine for
DSI to LVDS conversion. Add support for LVDS panel DV215FHM-R01.

Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
---
Gopi Botlagunta (2):
      arm64: dts: qcom: Enable lvds panel-DV215FHM-R01 for rb3gen2 industrial mezzanine
      arm64: configs: Update defconfig for DSI-LVDS bridge support

 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 106 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 2 files changed, 107 insertions(+)
---
base-commit: 3c3d81183061b9e49dd3207fbbbc36314744bf3f
change-id: 20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-f804dc09f072

Best regards,
-- 
Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>


