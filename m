Return-Path: <linux-arm-msm+bounces-51126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7A3A5DA1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 11:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F381179112
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 10:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B844D23C8B8;
	Wed, 12 Mar 2025 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHpXNVJq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393D423C8B3
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741773959; cv=none; b=Rb8aJkFRn9v0zbvvvALuSy/luE8TGYZwsLVU0vuRzyO0ybs4wu499lr8rH/+eAyCMRnGcPCW5t58gNflfdJiPsVRRfSxW9E/rNqK1nkyfVOq+XPDDM7bS3/Ctb5zBQLl3TY1VVYuBlyypChY17Xo/u/VgRowbyB1Xe4ZP+mh/Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741773959; c=relaxed/simple;
	bh=TnV6haB5juXzLwYsnjfTeCliML9Uw7ciBtpPk7YGTJE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ClWxU5L1RnTQxW7UuiLuYrSWkO48u8JC2xPP7TXR9hQwyLq6yBVxuVetxF2Kh/zLn4p0UFhsw8a+kYzDzAhzIyrBsSI22xGingnp5NuUxOsawbx1g9CINgYRkbTJBhkM+6qTZejljcJbX3jKMzEThRpr40QawCtfLP0UnaPFsJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHpXNVJq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BNKEJP017367
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 10:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HgeWIhIMEhGODE3pVk6y8mTvnaewamGCGvX
	6pDQJFHY=; b=PHpXNVJqqXprA0Vgw+XM7nNbkr16NUZ+BKsPkeG9YOZpBPZoLmh
	M6NqRi800CD44xs1N4FNnjqZV21nFa7j5kEIFw8UwlE5IWyZKVxtpjN1ucAgszsj
	VwIX459kY7yrj4vc4g+v15XxIX7xi0Y2MZZeu9lQGTCsAsQTap4jewJfVLJYt2D1
	5f0XTyFciR1FbJZ0xWUgIVU03rauVX4xdZpDuySP+ERG7KtUCKtDhZ7U5DD0DHtx
	KrFkv4J2UEhrJTyXjy72yHWDRLybP8uLy4AU97FFuBkqqckxiz+RMmdgMNIZ+mlf
	Mml0HD/76/yh8RHBn+6Ny5W9PcIbhSzd61A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2qhy98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 10:05:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff68033070so10344328a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 03:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741773956; x=1742378756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HgeWIhIMEhGODE3pVk6y8mTvnaewamGCGvX6pDQJFHY=;
        b=YfOmFi4tgHj/79vv9Mx8abvc+dCOEtKoTzYMmAUQHxQjAYpGNMrXrlrOcj2XzM40Df
         XnO22LqxmGICPJj5GZf1+1Bxe/4DXENDUhIUzZ6DFB5ecy17IXaq7gJMTRR6G7kPTIdW
         uREYUycDSXnntjB0PJAdNwvrEWrauS7NZHILbLDEWJbzcayIhVEb6wznKqlOQ/ITtLCU
         UcNz1bc6ZBoN8f7Y01yub6nvSoLrzKts+M5LiYeitGmRf4XYOW0/8BtOrn/pQQd1Fp5F
         G9EOoVVKTIeJzZ2SJ3H7Y5dWwnr1pi58FiWTNyITDIojlfJ65rAk2dphaGwoIAc89vF2
         aYOg==
X-Forwarded-Encrypted: i=1; AJvYcCW+SteDC0Pja2SGyymfxIVezcp347JvYbnrdRMQajA4FXDChDKo0ViOn8YcmsbUy68Wa3aq+YoonT4jb/L8@vger.kernel.org
X-Gm-Message-State: AOJu0YzeTHhIR3PBPqWo+WZrTqfAuIQdiadt/3mB94bFo6yNAjUikQWN
	JHS6WPNAOEAxsZXF6fYw2BwZIvQXI4m808Hj4VHqIiXffVUjDJoFPwy+si/lEfWCcLTfS3eco2w
	LbgAByphcYqTG+QuMr1k+1ovMwNQ1vd7vGQMVBNoZ4AsS7ME+5d+mVop+wTSI0hM2
X-Gm-Gg: ASbGncsFcx8olhIyH5wUc+xp9SY1EpWMOBlKhwyz501FSI0sQ/v9uJg5cer1iuCvxVh
	nFwyx5xicKcJsJmS0u+yM5JYDbcV/Ythfezwj6vRY+/0AsZcZW7AwAY5P8XqtuLQOxADOpcqvGy
	sEZuFlurnvj9bNiYQFQVkVuiiTb7wRi6PQ3cnKagWzPSaVItrhHVYjNw3H12smEj1BCJ0iXejfb
	GiMWlCqQfJvgQ0I1iiDo30pxIXqWXIYuUg8AqEEeJZZnAoON48ylTfD+D43ijm7l+wZ25h2C8NM
	LWyIpYz1cgznVyA021STxlWhYGBKgnE+VTos4v7kOinuXzzWEykpFA==
X-Received: by 2002:a05:6a00:6c96:b0:737:9b:582a with SMTP id d2e1a72fcca58-737009b5927mr2847413b3a.24.1741773956419;
        Wed, 12 Mar 2025 03:05:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrpFM9aC2Ybs7x0lcdpTYriXhI+a8LEqu97S/o5XlAYzlpGRhYyyTMTdxU6ktmIfaIwEj/Wg==
X-Received: by 2002:a05:6a00:6c96:b0:737:9b:582a with SMTP id d2e1a72fcca58-737009b5927mr2847376b3a.24.1741773956090;
        Wed, 12 Mar 2025 03:05:56 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736ae7d24ccsm10023993b3a.48.2025.03.12.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:05:55 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add orientation gpio
Date: Wed, 12 Mar 2025 15:35:44 +0530
Message-Id: <20250312100544.1510190-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YkzjOaml_L2wNbtSOZ_uIxpr8IQfYi8J
X-Authority-Analysis: v=2.4 cv=G5ccE8k5 c=1 sm=1 tr=0 ts=67d15c85 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=76Bs7J6LVpVJVXfC1mgA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: YkzjOaml_L2wNbtSOZ_uIxpr8IQfYi8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 mlxlogscore=884 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120069

Specify orientation GPIO to the PMIC GLINK node.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index fa7c54f882a4..e6811a094332 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -177,6 +177,7 @@ pmic-glink {
 
 		#address-cells = <1>;
 		#size-cells = <0>;
+		orientation-gpios = <&tlmm 140 GPIO_ACTIVE_HIGH>;
 
 		connector@0 {
 			compatible = "usb-c-connector";
-- 
2.34.1


