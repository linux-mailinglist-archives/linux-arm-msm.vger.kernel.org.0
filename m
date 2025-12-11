Return-Path: <linux-arm-msm+bounces-85005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D58A7CB525E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 852E3300ACC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 08:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC582E6CA8;
	Thu, 11 Dec 2025 08:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sc1un1HH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J0Y2izDV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3B2285CA3
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765442709; cv=none; b=f2YPmRMNEFuulCOvZ1kQGFXeci+yBUHP8ao8nsoGPx9V0EogxZOUAphHxejlsXadM6UROgMJLtv3QsJJH6Cmgrv0OC5oI2mz1Hurilak9lD/KJpnF/yi7G7Ort/goAgp2uL++mINCUDVjXnT474egpY8/89I+upbeiOVeHNx/YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765442709; c=relaxed/simple;
	bh=v87WcpJ5SjS1TYa30P/cv1eb5Av0T7oqmwWqdRVsZxE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KQE91KJPHNXjLAAaLQqCuElQRlI9797MywWcKESn759mLzAVXvLFKGBGVOzhrzVB35yXPP5UiszOYUnrzGaXzug4+tjWpECqBB5Ill7lisgGgrXNPuSUk2zO6dFFG/M5jFUH9tfUZhChMLI5HlSlAYj6bKSqHPlR0+311RVv20U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sc1un1HH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J0Y2izDV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB8gUs6779397
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hv35z6aXJ85tgay5dnPDLX
	Q0ev+G4Jzc8gX3Vem/A8A=; b=Sc1un1HH1tIm38Vv9yY9isFsP+qgDe4/Vl77qt
	v3JtUa2Lqr3mEciKwWLGJKMjxmseqAmZSTFW1Kxv5E0SopP12q7HTHWMrbsLsNzN
	7rTgbJmIH9/IkP0qAezVgodGhcFbodFO+KmOrxwknxzRGi8Q+iGCnX7OUMJVstwa
	R0j0ubTgwplK0p9tVHRdb/ffMO0Yjz5JzL5Vtk48fORSSHIYpDD99xVuybo2vr++
	9W6VBWEz7qzh1UPQeB2+0yI8Hs5uFqkFelYPJhYA1WZIic1kb+8odBhLu1F9N9Sf
	Nbx4/sZQd0IZpx0py+5HjC+F5hzfy/tg6eeipObqkaWakKNA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayrpagctd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:45:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956f09f382so5253525ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 00:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765442706; x=1766047506; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hv35z6aXJ85tgay5dnPDLXQ0ev+G4Jzc8gX3Vem/A8A=;
        b=J0Y2izDV51/FgoW7CXrtzAbVpCEY1DgAWmYucqpex+PZ/OPfwi8x3YREZfjuDEIGZX
         7RpU4kjQ7Sot2qgdutlzVDUq6pPli2EFo+IB/Whb3yKalqedDcfsuHSaHiGzyz/dmNvr
         e7bIM3WD0A2nHgAi7yq0U0SSZonChuQ8siGZ1kLtMqzcJVw5aVCrVAVbFr3W9L0SFHRH
         vibnNzNiepqgngfF3dBEJVY5cZlAF0FwDuiAdTv9FxlHGWHX77VCiFSXojiNgpq2eSbC
         0TpFp0WmwJCl7xavJinwDatOWMGc3s7JVvhjlJ0DAcbxmICRd3KoAwigQcE6srcv6HqK
         pvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765442706; x=1766047506;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hv35z6aXJ85tgay5dnPDLXQ0ev+G4Jzc8gX3Vem/A8A=;
        b=TbYvaDNSY/BzGN9rlET5Ts+cnJ6odeeyEth5zdx52etARvJnB/JoG+Evakyj3zjhnn
         iduo2pUkTjBez+L4eEM0RGVBJOxTLSGc+HgpjvBsc6kuarDMjRjdsiQLVAF5IWVFXs7D
         wZIoHkylAcV68XmEVVVnxLHwypIDAVrg4wf+wnW53Lht4rTiAkTRbl0E7yDX4HZNTYw0
         OsOVzwt3AbDhZAvjIutBnUWmoFBf1MqzodPidADMXD6iVx6nCM4O+NSFnVU4tPYVDgd5
         zQkGH/17OsmKtLpHfZVXr7A13/s3fmBxu/QY3ilHrjmxv15mCLqVJNevCM6kxgCfWnDI
         84oA==
X-Gm-Message-State: AOJu0YxC9YMftTOIISKDSdScZDP6QyzxEpRavT7dH55vY3ihv9Prqtzn
	t8vGWoHLxrNTGZX8Yn+XFFIS8xXku+CmmTq3m3lttXqVOJKU76p57EOJOMnJOj6sj5tJ8mgNPvl
	Fw207ISzdeVRSiHiv162zWVTE0zxZWe2onsyNJKhaRTC2kKWuHWVK4mGAUTb5sYWkGsxs
X-Gm-Gg: AY/fxX6GbWpuVPEuL3vNF18FdA867R980jS8sOY3U/bM/OOHYhKNejbkF1rnVMBxQoc
	Mfwygymy1f5OB+TUCFqsLeiZ4fW0MTgs4YGMfKI65pOzwz0RDeIO46m1n3h1w26spodJfdzGi6B
	LgVHpK06PmX3dsacs9FWSJkwa8vojk1M6tGugr3L1S3h9XLEikPkAsZrlGi66/w8wpHNOQC4wUx
	jEotnssnQS3vV/fyzzKV8SK0ch1yPBHOAZDl5WqvenBV91P7NlbOAX+9muHBkoOjBTKKGF0iAyz
	FKjty7snjxsjur3GUGZvQ5h+Y/S6HRWF6SdPQYCLMlyfzsoMJFrN7F26HV+DBpaJDtLgk11m3Bs
	Wui8mrNgNmfRs/vwl9iZKq5v7RyvPZPorGPM=
X-Received: by 2002:a17:902:d50f:b0:267:8b4f:df36 with SMTP id d9443c01a7336-29eeec1e3edmr15702095ad.29.1765442705968;
        Thu, 11 Dec 2025 00:45:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFROZCggjnHyx9jcKxhajvG65OuqDhUWCroSswMRWKrmqzaoPAiiqpJSOUgLqJ6hyMrXp1HWQ==
X-Received: by 2002:a17:902:d50f:b0:267:8b4f:df36 with SMTP id d9443c01a7336-29eeec1e3edmr15701755ad.29.1765442705500;
        Thu, 11 Dec 2025 00:45:05 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea03fcd8sm17322105ad.74.2025.12.11.00.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:45:05 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add TRNG node for x1e80100 SoC
Date: Thu, 11 Dec 2025 14:14:58 +0530
Message-Id: <20251211-trng_dt_binding_x1e80100-v3-0-397fb3872ff1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIqEOmkC/42NUQqDMBBEryL73Ug2pmj71XsUkagbXahJm1ixi
 Hdv6gn6M8wbmJkNIgWmCNdsg0ALR/YuQXHKoBuNG0hwnxiUVGdEpcUc3ND0c9Oy6znZFamSKKW
 4aOrQVgVq1UKqPwNZXo/pe5145Dj78DmeFvylf4wuKKRoNRlrpEVZljcfY/56m0fnpylPAvW+7
 19jUhnkxwAAAA==
X-Change-ID: 20251124-trng_dt_binding_x1e80100-94ec1f83142b
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765442701; l=954;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=v87WcpJ5SjS1TYa30P/cv1eb5Av0T7oqmwWqdRVsZxE=;
 b=uI6OTVEg9k7IYASsnj1NlqBilg4RjG5B/DUeyuTzVljMcsrNjcr8VOJnPkQnYZkf5OezRI0FA
 MYUc6ULZMTkATcB0+TN0eVxUJ4KAC5wR9/eKeW2YSTZDzzE8C9DvzKN
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: 8ZZNe8HMgGmtzQctnB7mIhvYTL30CssT
X-Proofpoint-GUID: 8ZZNe8HMgGmtzQctnB7mIhvYTL30CssT
X-Authority-Analysis: v=2.4 cv=G9sR0tk5 c=1 sm=1 tr=0 ts=693a8492 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6ZNt1lSE2E78l_tYFJ4A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA2NCBTYWx0ZWRfX4tVAEciay5l1
 fhOKkIeuDKTHQVFqgLoUbki+5KSdxjxMBUAq6bINAySWctFNKWUIb4ul0MsLKU5maXW6WCd/Z51
 QD2xgVFF+lYiSsVlGnK9UmSgCvBU/ndojncEYvEo2ZMmy1O4FgvdBR6xwhOlyT2fJRehiTwJim7
 k8Nyea8om50jtTS5TGk6BRyvWIB5IZWXPNMsMwEtghjU6BEGrUMwLfc4Xs9FLnvER63Cwz54Qfd
 0F/vCCLKL3c15gY84p4DFzayxzM8CpOs8412rhby867P3YjfVjQkeRN5brf3EEmB6Pmhl+iK8Ed
 lYDbhMJfV5TSkSpvMin8ennmT5IKB6mVHsCOXAeCgbaUtTMomiO15+ohoXSZdBos1M0xoZIcL/Y
 PxiFE/z3mHiw0YzYmCgQRE36RHJTsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110064

Add device-tree nodes to enable TRNG for x1e80100 SoC

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Changes in v3:
- Removed Tested-by tag from DT binding commit.
- Link to v2: https://lore.kernel.org/all/20251210-trng_dt_binding_x1e80100-v2-0-f678c6a44083@oss.qualcomm.com
Changes in v2:
- Collected Tested-by and Reviewed-by tags.
- Link to v1: https://lore.kernel.org/r/20251124-trng_dt_binding_x1e80100-v1-0-b4eafa0f1077@oss.qualcomm.com

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


