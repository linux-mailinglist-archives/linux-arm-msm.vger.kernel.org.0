Return-Path: <linux-arm-msm+bounces-76126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B24F4BBFADD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 00:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7EA564F28B0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 22:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01ED22E03EA;
	Mon,  6 Oct 2025 22:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XNzmyh2X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC3C2E03FB
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789228; cv=none; b=GqzXzntJGlFnYLinUM29nvj95q3+vsHLjA7ni/pf3KobHpr3KJxqW1XsyKKlNbHr7D9HzvsDgF4B/b3Kmm/zMi8uR0V8BkB/RTk7+4RT/R73l4Lk1bjYnwf6V99BNrJjsVnp6NztQjwPoWfejGJxg7WjWzinAczGm9m3z5nQN1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789228; c=relaxed/simple;
	bh=hda2Xd4Mz5OnSn10548Jx0ge0zF0dKZ+ZJ+uSDZXASE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HwxFmn23YVQQFY0p7BvpwiVWrTawCONAjlROEqkkqJj3thRF65ZzQoyYxno5/L9T2sgOwlHP6+ANw9FtviSy8rNvLYpiSgYmALrHnBhkUILUyissNHLa63wdNRNCXcbw/Lk67wIoCjFpxHR1f64VEHDKdm+vJlnWBRZ8833nS2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XNzmyh2X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596EqKXg023118
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 22:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DQ/0YD5xMRw
	3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=; b=XNzmyh2XOAAmRvkmnEGA9YOas+D
	TYNRCEo37uwuxgKSoVQ2PNZOqqXuza1cPH6fDea7aQ950p9NlUSH3uxOZn7Jv6/6
	BBvbmdA9fg2GDlh2/ocumOWL+3rQeiIrF2/tze39ZEBVDcl3R4qpNyzEQ9CFlISz
	fYHw6K7ed8c+izO13JIZ2Sof6+DhzrjDK2kYrl/jbEWQ+Qor14qvLS59Msy5wDF+
	LzuKqmTepXBELIVbR6o622fHxqTZpn/weNV3B9HewUTcKRRB9EbMOfrDGtfXY5K5
	wSgPiZFGOJoO6scn51m6sk2AE2F0lF2b1ovtIMZhlPI8bZF/sfoV3PMTxvg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgnd2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 22:20:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780f9cc532bso5269005b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 15:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789214; x=1760394014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQ/0YD5xMRw3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=;
        b=hlofGDa6kRXcjxJg7iiDBLjC0xZ1n8r1zMhJSR9xbybXH2xq0QtuKFbxvD7/89CrXZ
         /ZV8PbG2CZfb9SX9uwSxkHaS1e0i5sn7B1etatM1JQKqlBC6GBfA6EbEIVXI1bU+S2DK
         iL5AGt/wrBkom8RtvWZnzI7Ilz95VAB9bcLhAmytauyQ/8491CZmxd7n/9dHZPzElkzM
         k0FN6sQVk/SGAzOfZPp/hlo3O9fGJyim25sEvxiXkFVPuX9ncL+kXabSiChhN5E3fOgC
         Oo0twM7InfhEdrhSCXNx2Hfwb5HbJoQ9aj3MnmEnijqY9NHRhbo7Z1KIUN7zFF46j4zB
         DFng==
X-Gm-Message-State: AOJu0YyusKheKREiZQtPb0eo8rwbPKtidehQ4dKg+B661oP6A6Jb4QEh
	aGMc2MpztRvSQt8w7ZfG+yHHXrT07TR1xneOhAOgUZB6ohtz7zxE8DdePDtgYeclSEITvyqAX2H
	hGTiL3kmnTqYUED6zP4aoE35A4z+QCcg2DrT+lSAqCqCMGn7xhrDmC+hc0Qi2b7+kfh3e
X-Gm-Gg: ASbGncvFfL4VJ35+u3Mw1fUI9IJtUFGzbsCOhO0qA14DP/i12c+APTCjK+CcWlZVxAA
	TMiDhn73b2chW+0wwGjizhTZySj3Mrvh3hkWRBdLSfcJZeuj+LYyCLcDaPWort6Xtu1HY6f2bUK
	iBE+2VyYwjA87bwh9ULiXcetUIdSrVkdwkwPn+/LLerr+elhNoTorm0RKTIOKId+MqUimG3IxFY
	A/ZMJkMQ81xg/rFhRJ3qXq8s5ooWXPiGYqoKSfoV7PZBKvzM5wMR+kMYxbvi7N+fN0mio/DFMOT
	zwLgbYs7ElR7pOM3QpXjwF/om5sUY3E4P6jBUx1B9abnHF/KX9e0tIFC+0ZTx9jPHyY6LkvfL27
	6s5VxX+i/hlfP+WYWxTqW4Q==
X-Received: by 2002:a05:6a00:399b:b0:78a:f6be:74f2 with SMTP id d2e1a72fcca58-79230757802mr1247808b3a.5.1759789214003;
        Mon, 06 Oct 2025 15:20:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnkZXwidFHz7CWQzFnYlI1XTWEVkHlGYGjn1W8QN2IS0V8sHRnZ70wzY70yU9/PuxBu2FvJw==
X-Received: by 2002:a05:6a00:399b:b0:78a:f6be:74f2 with SMTP id d2e1a72fcca58-79230757802mr1247773b3a.5.1759789213473;
        Mon, 06 Oct 2025 15:20:13 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb281bsm13734968b3a.37.2025.10.06.15.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:20:12 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 05/10] dt-bindings: phy: qcom,snps-eusb2-repeater: Add SMB2370 compatible
Date: Mon,  6 Oct 2025 15:19:57 -0700
Message-Id: <20251006222002.2182777-6-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX/qLsmJqyutsr
 357VKM1aYiOQyXBCrDIlq0QX2I1Aiqtjkn6OECJL+O+uPe44UyLNn8OuNPQpSeJChc6/qqvCLRy
 yNhOFuIdohP1GY1+N4cPujvId58vdT/yKoMRll/UdPz1EB5KbBdxtY+YTLtEHDBwb8yIpXyxpJf
 fp+89liKCa642AytYN54p/mzIM3+JcEZV44FSMvnGpVXJEceeuwSxYuu7nmSQ6G9YcLHly86eqX
 NlEm+tKS+GQH4xYUtSk64/vnQRTloNosr/e20t5LvPz+FZ+jaRJynk+2mdjObYP8IflGb8sNYAi
 AhaXSK+XQPeiMb9BXaOuymjtKR8d4Ow+4CznMjrHe36+nJIhUpE55y6ptvgj1QONbiRObiP2bZm
 XNWLAc43gCEWkzHoD4YUtD1jx8VuIQ==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e440aa cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=9ZGL9VZrYHwIVTkvpzsA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Jld0sWEp36FvOIMD1Oa0dA-UkMPXBEeX
X-Proofpoint-ORIG-GUID: Jld0sWEp36FvOIMD1Oa0dA-UkMPXBEeX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

Add the compatible string for identifying a SMB2370 USB repeater device.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 5bf0d6c9c025..0f015a4c2342 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,pm8550b-eusb2-repeater
           - qcom,pmiv0104-eusb2-repeater
           - qcom,smb2360-eusb2-repeater
+          - qcom,smb2370-eusb2-repeater
 
   reg:
     maxItems: 1

