Return-Path: <linux-arm-msm+bounces-84239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0CCC9F588
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 15:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 57A88300187B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 14:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C7930147E;
	Wed,  3 Dec 2025 14:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PynOQfNq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ev5R7wmz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C35302CA3
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764773354; cv=none; b=Ba4hZxDI654gcaBI13Wryj2aiG7bd1vjp4rVC3P1fZwnAh4oNq6ZgilTtDI2uEtAcfSyWwrrZBmgpR9AoF2hZu/E/mcRZdCr9qHucQ+7sWGNmoY7pDo3e90D/AXL+S0TF17de7dyXCvlzXc+BugVK4FCKl5rUVya8WXXRzhmJHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764773354; c=relaxed/simple;
	bh=w3RgiLl5XG1LaoPqBzQ+2LEUhpSpPO2VYJmOvbKoFso=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GVqIUUo8L60sf8AFNpcpVlPY1Wh8uMH9YpqpAvZ06qOPZhMPKMgoEaA+HRHllUNwOEU/a7MqP1+UqM5Wbp+jBYJpQcHLApljQttqrJdisaeHGxpjBh3ikZ673ZtewWnjWi0gNhGcnzTv5PvpbmQZ1AeKLZV8T3kjkUexJGAhbTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PynOQfNq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ev5R7wmz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B396R56805887
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 14:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=20mucQy3jyi3KvijcUGeLR0cYLqLTOAbs63
	lpDHPd/Y=; b=PynOQfNq8dfc9CDZ7LRa8/K/1rxvVIAOv9riXufQ61spCpDM4Sz
	OftMNnMsShU+Qi1FIzob6THTzQ6kgQzNg7KSq+hxtikjzH5RZ3zpKNzTqmiABQTZ
	qPueLGi6FEPCa5CXIE3VRcsgOF+S9xgKoXdM0Qqr1HDtIsq7dUvXYh0PIoZ4ny9t
	pk4tkMZ6lWlj5anDO7UnhQdQH0s1StzzifQkmQV1jwNQkfMyZg9ugj7Ib4ZmTg/D
	eIPCtNi2Y6wK9cv4PVEjHG1NvuMVToCVt/esReuMcR6/mp0Fd3sEWst/boDXcTNi
	NXyb+840VNQ+W+YjGIqYiYUUNPdLWlosdMg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atbmmj9m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 14:49:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b4933bc4aeso5496247b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 06:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764773344; x=1765378144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=20mucQy3jyi3KvijcUGeLR0cYLqLTOAbs63lpDHPd/Y=;
        b=Ev5R7wmze7M1dQY3R5oYswPrtPykGc0hFRl9ccpH6qxKTCgxwmzsK5CvIEoHV2fKqR
         HlRTMnHDW/EVrH0rJrISCUeQXsu2PRURyfGqQznZwxNpV/AhUJ0yWmMwg0xKNztZAgHH
         oO+pWcvVNR0VPLbQLblAuAd7rsuPVLAy2qOJsdnLtgkWzjJfOy//ZGTQvayghRfat1U/
         3myAEHRVGTNWB1/O6MQExKYNGVOqeEiif0lEtHy/JmGB7RsUI4TIqF/sjJUtG2GUyS/f
         rgF6NYK03rZCs3Rv58+3ERtInrmWw4Fz88C9OqhHXjjBjK7+T08bBFsgJQPPLcxaP6XN
         kiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764773344; x=1765378144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20mucQy3jyi3KvijcUGeLR0cYLqLTOAbs63lpDHPd/Y=;
        b=S6gPN6amGtK03SGkLRPLY01r5J4ChlRli1rEC/d7ZeaWfU3oznTmW+w/p0IpprZOAn
         yR6ltEoq6UVkq2sKmqjGVc+LYGDGJ/uofT6BZsAR9nT/ST+KhvY9tqW+IEsEPZmcWQYg
         CVS7hVhG6YiSQy4/jb1hkpWpeein6S43mNggzsecc33xThZdBOIP4MP75EUojJcca5kA
         i8NFt0Okn6RbAz7QhYEqzFq+CMXqhQyKi5aniR0VGz5LEa8lshhAgTZg0kckCPcd4Z6p
         wauUrBsPod9BbCeG8LwFZr7uTrJwNZ5q5dXrBoX5yXlQmOqFlBkxR5mgSb2ckNUo8FPp
         +IvQ==
X-Gm-Message-State: AOJu0YxwOg1DqIBC93Sr+3pNDoONHEhArppBPXh01q1Oh2q7Yc1OyTF0
	qKdUO2fOrPOU/KDEyDT1/1inIh3PTiAEo75hWrQ5CR1iBZhPGtPBF6qOldrVfx40DSfSqbXnH6x
	eB3Ve9HnHBuIuWvRztXJMoMytaq4Vu9U0Ln5z5bE0rdkX1wyZ6kLsfs3pEs4eKaa7u/1L
X-Gm-Gg: ASbGncsgzrojAIwrY0zp7JvV2JUadUHwHrARaeY4Mdwuyr2/xJ9pv3klLIs5oGIf9eu
	rl+gB2VYWgDIhAU65aVwgGnJVW3tUu/XJx6RtX6+aJauaJ04MdSDUAl6Ouq2c+fbhnDdI8GA0V9
	ktXF5uvQTDOu6ncDiPF49UAn4GZTLfOH31/GsB77DKh5QYSOaCrW7d/KJ0W2uVGVfAx7rBt84hf
	7ii9nVKzdsIkvstDVCxcsJPeNXy9H4fAiJTDs4NlVrXjngEgNUZosxS5IQzSiBhsdJz/rsph5T2
	MYXTr8aon2FclU+Qldps0H+lex+tpKDf4rdczhiNmty9EF/VltcIINNXQfXq+r+6goevFC60rVT
	xecgS3eY5Q/5nLXtKjhY2lpUEoqN2DXJrD8s/HvUBGUcaRD8=
X-Received: by 2002:a05:6a00:10d5:b0:77e:8130:fda with SMTP id d2e1a72fcca58-7e00a5b1f37mr2728245b3a.13.1764773344419;
        Wed, 03 Dec 2025 06:49:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkDe7ZNslojak9Q37/XbTXXcJcsZOTB1jDa9+O/C5QbPUFRs8O/83d9vAqEwRsQcJnc0V5xg==
X-Received: by 2002:a05:6a00:10d5:b0:77e:8130:fda with SMTP id d2e1a72fcca58-7e00a5b1f37mr2728220b3a.13.1764773343861;
        Wed, 03 Dec 2025 06:49:03 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d151eb5bd9sm20719683b3a.27.2025.12.03.06.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 06:49:03 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/2] Fix compile warnings for SM8550 and SM8650
Date: Wed,  3 Dec 2025 20:18:54 +0530
Message-Id: <20251203144856.2711440-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3r4p7esI5jPeMqWUA8tSF6hkHO4sjQcb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDExNyBTYWx0ZWRfX0pcJvQ2wLGKt
 AVVeW44H/MEIw9XxT8I05xpIKZalt/xAXcFQVwHju/Pd4FgrMoFHKAeYVgPnHIRT9Q4yJ0nBiH5
 z18A3H0bDVq7uzIfNai+pzDJmmB93Q/p93FB/2mWT75nvpJt5Oc2Qb5YNTFwmEQ3kt07d7guqzm
 0h3kMX6T0iUKtxuaJNBUZY3xiWvuj8REE98X3Fx4221LQb0UAw1JF1SfkWDVC3p73KAVjaRw78u
 dA+IMY7HbQ2z9PA9lMtEhEXp0G3Z6q0NVqhaxEKtSvT3WnZfoOG7Nx5ZFB6GmoJG1byPNRFArXJ
 /1QHja85npHkBSjEJYR6GD2CfX5Cnwaculr34i1mbHsU0zeRUtZuCt4+vzBL1JA4OkFjSrUArrx
 TQPhbUo8BlxMakwQcHBG6J2vD17Pag==
X-Proofpoint-ORIG-GUID: 3r4p7esI5jPeMqWUA8tSF6hkHO4sjQcb
X-Authority-Analysis: v=2.4 cv=ApjjHe9P c=1 sm=1 tr=0 ts=69304de1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W_W4GMoGrKgtJPV1LKUA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030117

arch/arm64/boot/dts/qcom/sm8550.dtsi:4133.22-4223.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property

arch/arm64/boot/dts/qcom/sm8650.dtsi:5086.22-5177.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property

Fix them up accordingly.

This series has only been compile tested.

Krishna Kurapati (2):
  arm64: dts: qcom: sm8550: Fix compile warnings in USB controller node
  arm64: dts: qcom: sm8650: Fix compile warnings in USB controller node

 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 --
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ---
 2 files changed, 5 deletions(-)

-- 
2.34.1


