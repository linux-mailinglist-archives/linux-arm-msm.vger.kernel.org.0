Return-Path: <linux-arm-msm+bounces-74069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F9FB84599
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 13:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC1204A8412
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 11:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C620301032;
	Thu, 18 Sep 2025 11:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUV4rZI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8043043B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 11:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758194859; cv=none; b=o4BeBRqsVqMOEmuJXsZvkbyAMezBbPUfFJJfKuyDMyJ5lM613gtfiBbgOW/+Z7ZYJRLYvUAMScMfcwFFHebZaNd5fjLwcjO2kHsxjRRhcWaX+bE8ltACAkb36qPj0roLbkfbnaK48NvJ9Xefwr4qj+g6zCZ5ykjvpY6ix7Kl/No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758194859; c=relaxed/simple;
	bh=IUU/IggIt5ZdvVUDdA+5dvadTg+m7Vkq9dz4uwpNq0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O3aR8F4YQd7HuIg6bAJxZoN2pt60sfKYVYai54XO+X8XHlUpJhX/TieIu7Rw0z41uACKOb2fpZykXeSxCths4NMkDrZnNrrX4LyMg+/eXzJ/tuWUF/sBeMoGHhAaAn+vF9/gT+mEAmij0S4XR3b4JWkF89DCIb2ETidLrBE7FME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUV4rZI0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IBM9nN021911
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 11:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=em02LUNYeaoKw60r2hbDNF6m9VIKoQ80dUP
	lB9X65YY=; b=LUV4rZI0SzSHDYpKEf9ShLhttC0NM2NWvNC7WEuQXG8Lcbs2ET3
	za3ZcRJHtNtjvaTLCbe45Q86Iniqxg8B10Gur1ccT9AmljSdIplunRhx2/iez38z
	r1A2/Yk9DUTBGtEKEC1utkIvpyXW3XLN0iTQNJnRJGcCghysSbNSkW40fjHhSo36
	em+bvYm7ke2JlToxRXTPZlxSDfm59ut3DIPc1hvBrg/J6TlzmCgaYGfYCbAFbHha
	PwLl5i+0bYvp/C0eLZVbrNdlVwYV/gTYgrAMSms4o3MmO9+0ZSbFP5d6TFJJ0PX2
	p31Wgpxxh1bScC57NewpK+l2QZdTjpnF7Xg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5e42v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 11:27:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77422201fd8so1008873b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 04:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758194855; x=1758799655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=em02LUNYeaoKw60r2hbDNF6m9VIKoQ80dUPlB9X65YY=;
        b=WcYeDmnK1VxnkHQYbI2iLkwmC0qsOv+5vzrt5hCLQWfrmHxEaAxGbeSeY9yr8/zMPr
         j7vN9OoLd3dU/5vUKyGrM1FYLN7SAdhRSxBZ5cOl9wCez9KnhgeMMz+S84rRX+8UwFaB
         8iijmhYBeC0zFVKjRPN9a5fPTmo1L/F9l0s5VsM3cgBYxIGYzqFqC/ohCfOpMM2rEoEJ
         vltYYaaGjNp4AlrU6nvG6Iiv46PEeE4l48wDGAZqRVGhw9B+Xbuw3oU/OZjKHD9rBvgY
         9PnElWDfwKC7uTmguIHuPRcVErtEauY4wqlZdJem/wq7TYdtlx38rhuPvgVcQ4UOm8ru
         rtAA==
X-Gm-Message-State: AOJu0YylCIfW3CgvBATn7jAJxqy9jQboNQUgmXJnH1+GKC9aoVB2mK+3
	K+6zHNJaMjbYdj9d73EmSEsU8mal5kcGrSZ2Rc4NQJxuF7fjGuRGL3l3VJCxNa5uK1+ttH4CazA
	B5wR5YSkEglJO5YDIinwLqk26/YqJyb3498joHUt98Ub3xouc6DcrN5K0PCL21PgadQ+3
X-Gm-Gg: ASbGncupCJ2r14hxcKE8Q+4Z0/iyU9Ka+LYvnmbFqMeZHpLkOQSit0oaWuhjciJY5am
	ZwW/DkpgvcCLmIpTq6DuG/jVLb5tiVVy181DblnQtEMxhrNuWWgQMoURmZSB5sVHPd6gHzEeD8v
	xH4lZWjRZcC1kqD2dI5dwFXhZPXg/vbXwLJqmJAOBYsD5GyhOnUxz9FUQMwc3aaXUuG/m8gW1xM
	hU/GMiagnl9ysu/eCrjgn7gLmJPkuE9Cz2FVirwjjj/vYVm/8Ccfkko21qghTGScUB8x+mxOolx
	cUpB2MKrcXS9/exCQp8c9X/zVvMZX+v3xoYOZmbEyXe3mKjH8x0RGXW7L5dsUg==
X-Received: by 2002:a05:6a20:914a:b0:252:2bfe:b65a with SMTP id adf61e73a8af0-27a91197b56mr7041407637.7.1758194855304;
        Thu, 18 Sep 2025 04:27:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3iHWGK8a3hmAVBUv+NQGrIktg73U/FZNcDHWZ4s3IBRB+hSihP3LeJbH5xBNSNNbX2z8UtA==
X-Received: by 2002:a05:6a20:914a:b0:252:2bfe:b65a with SMTP id adf61e73a8af0-27a91197b56mr7041377637.7.1758194854834;
        Thu, 18 Sep 2025 04:27:34 -0700 (PDT)
Received: from jiadhuan2-gv.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff3733dasm2143820a12.14.2025.09.18.04.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 04:27:34 -0700 (PDT)
From: "Yu(Yuriy) Zhang" <yu.zhang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qcs615-ride: Set drive strength for wlan-en-state pin
Date: Thu, 18 Sep 2025 19:27:29 +0800
Message-Id: <20250918112729.3512516-1-yu.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: L3LtD61GdiCguKmQ5wNCOhkjoffxKhqW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9mguqMmZPnxK
 p0Rd7338aanqLHNqn4zs9UTDmfGwgDYKkHPnTaFgMyLtl+jQvNIjywVQpZnZLw4QzlM/PHMqVeB
 ndR3Vm5ADVoNahOzg4TQ9cHItrTG9TsEOBAZ+kAAk0Q3p1Ii27IyAuPzoV+aHnydb6ct7HA6rg2
 Vw2CsdlLBzH6HVHZnaW87BcQV0V59Y8Q6hWPn2cyXckqb7rC8C4QhbhOzcBedKqDPMknFM6QJbB
 h+R7ZtZLqqxIDhEv/JtcF3l69mFWVSohsWwpgAxdiFLEo4zKTZmbbWIqJbyilaVTPehWTocSEbW
 922Je3SoTQOEz3NTYFVLihD5UXfLUasiYLB0HYZtBUyuNnEM0h5yPLbu6NOeF7e3FV04nfFPNfb
 BUBG+qCR
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cbeca8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=xJVcXfk84ssIFEjcLW8A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: L3LtD61GdiCguKmQ5wNCOhkjoffxKhqW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>

Set the drive-strength to 16mA for gpio98 used as wlan-en-state in the
QCS615 ride platform device tree. This ensures sufficient output
strength for controlling the WLAN enable signal reliably.

Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 705ea71b07a1..a69b1335f0ba 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -398,6 +398,7 @@ wlan_en_state: wlan-en-state {
 		pins = "gpio98";
 		function = "gpio";
 		bias-pull-down;
+		drive-strength = <16>;
 		output-low;
 	};
 };

base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
-- 
2.34.1


