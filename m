Return-Path: <linux-arm-msm+bounces-62287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D910AE7928
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F8D61BC5950
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 07:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AB020E01F;
	Wed, 25 Jun 2025 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dm7U80NF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A973020CCD8
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838137; cv=none; b=O7Vkd6BxOZ9iDbsLxtgO6lj2J6UM82tKk3+OBp3nZ/FR38AbibBd+jhZ8BVahwANnVb3w/wJiQoHCjXwLae+LmiNQQ8K+YIUelS4Kk9+HaxSOrKdKa92oide/XuTNt7y8injrvID+ewflgI4mfq8Ch6DLTD8kUSUwX1yNyaN80s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838137; c=relaxed/simple;
	bh=zqovogRSX46BigAaRd2ImjZveYMUXSmm+0OkqYQfuoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DO7UnDpk7aHAIy2UoNMUu/JzNSBKxSO3ID+3kE270bFZZEL64SRLdqogKBOYOK9hiQtHD/11IBKkVSyJjb7UtzNcopF2eo/tjAFtXdjXgXMeEaE92wmsEbyvrFm2NBCDhbDWK5qM0RdaJaSSvC2u1ak90JyQo42uyj8o+eOB7b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dm7U80NF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P3iJcT011924
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SE0wZGHjNk9ebTpFdYcQIUxoM8VbhA7KD9TRfAYBS5s=; b=Dm7U80NFuQWqLLot
	CE7O7K9VIKIHetH8LfEw7mBxwiXst060R+VkDcaOtQp1ewp0MhZBx/yb/j6tM8Cw
	wRfxyBaERL0cmAWdCYfXpXNSAFk07uej9CE0US1l/xd//Fz3IBpiZ+wpXLeZElut
	BVaf7Z9ieuT6PpjWumnKBxpx7n4zUk9MxC4+y+Jz6YcNw4Xdau4nZQ01tagB/HQn
	5o641gYAUyu9Xhpo3hR8NoC3GXcvb5qLfp1OLmDtS7EDkIo2HvpGrBcHKerCoeL3
	V+YdY5du5NTFnEeflSHmcjRu8ZtER3FI4oHbbvynBwnFp/O1fGcuoKfdxYZv5Nk5
	0x0FNA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec2697h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:55:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-749177ad09fso1892757b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 00:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750838134; x=1751442934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SE0wZGHjNk9ebTpFdYcQIUxoM8VbhA7KD9TRfAYBS5s=;
        b=DR+KjG59adePWuRDZcRRKYhTmXrbiiMb6IIEDHa8HAzzalE2nSJZ/VdyBJfTbO9c0u
         HkrLJNcVp3/qu6rVxtVfkwW5Tv54mx59vDhtilcbsYKe5Yj/g1eeXNqQis4yogPq3JUh
         E08H9Nc6ckeVxzVLVxhHdTWq6JQmqMrwG0unkExp6+6oRIUOj4KVYPLWNpAsDHagv/7M
         aYJmSFouveNj5usVQ3pyehY4N6tSl7YiYnyzGRRKNcMe5wabcOMoGzr5netrXQ+N7o6X
         wl0jif86CefzzF1vhGKOZw7nI2+1K1ymXBgCx7spnjn33qX2x29LPadZdRjlrKZf75aA
         jx2g==
X-Gm-Message-State: AOJu0YypZDWL3xjxNb0Mgm4OFAXoGJYh3LeQwlRSTk2KcnAJ3X8RLQcY
	ZmpBjI23Nk0xe2TDO5D0LJSQUEJiiIOLxvwNegp/OcKeRiX6X/uemQEhgCuQt/0Gb8c3dR96Fdp
	fXmSKBJmq10JqGFqqx+94q/3Dv9TT5s3uqW6XiTawYX1fGq2kiVOuwnhjhrekVPVjQFzV
X-Gm-Gg: ASbGnctwBkSQqUC+ohEmAPUj+PjmNuxTPAa1d0eQR3ctNk/oMm6np3FoGPrWBjlV4c7
	21BtjTLHoQ2rar2On6uHcjn63MbVp9Z/VbTgSWXMKgapvA0o0vVWQHAsEx98irkKypC4lmcyPA8
	nkCyXpxH5stQ1iHv0CoHE0FiqeyfNT+utn0FWa9We5RzDlbZrGevXQSGMcf4hpatskH+Mq5E9uk
	JOqxvj1lGhDbB0ga0QrHVMMCHHUhYcGFviYfHJyZ5R8nB9aResHkXNaZG8l2Nwmf/X5yBvP6DOr
	vNrnifpfJxiiVZbYsevwRq7B7GnvkU197z6lUuzQsYiPSZ0mNfJ+S96DvD7DwXCjvLP30sccGM/
	2dME3FEfnzA==
X-Received: by 2002:a05:6a00:92a1:b0:730:9946:5973 with SMTP id d2e1a72fcca58-74ad443da00mr2785469b3a.5.1750838134023;
        Wed, 25 Jun 2025 00:55:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpuEfD0kUF0myq+IHmlaXzl+QhyXAvsi7n5BM8WeSKzUKhMn5P3e5TVU1eiij9XrOqr9BEcw==
X-Received: by 2002:a05:6a00:92a1:b0:730:9946:5973 with SMTP id d2e1a72fcca58-74ad443da00mr2785441b3a.5.1750838133617;
        Wed, 25 Jun 2025 00:55:33 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8853133sm3707478b3a.129.2025.06.25.00.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:55:33 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 15:55:06 +0800
Subject: [PATCH v2 1/2] arm64: dts: qcom: qcs615: add a PCIe port for WLAN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-qcs615-v2-1-0f1899647b36@oss.qualcomm.com>
References: <20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com>
In-Reply-To: <20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750838128; l=880;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=zqovogRSX46BigAaRd2ImjZveYMUXSmm+0OkqYQfuoA=;
 b=xTwwjjH5SxkF999PcDAjZiAx4d/S/RGwv5NL+aviwMacHE5KE2aCQU6D2HmSrtxN9xsvVJy+T
 +ATBIhi1xWRA086Lgxb6+jF0fWX/OsgFA2BtfIV4Q1Bthh4CD7p7je9
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1OCBTYWx0ZWRfX8Y6OMJeTk/Gf
 eJKV7ng2R0azJ6NFMzTKyV5nAkzVyDQrlZDrfE7o0x3LPh1TCLFDau2cY0lSFiH32d5bmTsim5L
 utEx1Dr6yEM4S4ESjpGGuyNfgw9ReHrgpT7QxW6aQmQ9i2ReYaZpGVHeGlxV34OLnDG9nsRpJRG
 O4NCl/0FjiqFQrqU5YsnPYToMfO/YCP2LqCdurrjFN484YXNVivHWZBwXOnlURukYSbliZI/iY+
 3pdeg9kDkHf75oIj6ckOx8zIOjtP/o1HgxfqF+AHojyr0cRVLROWa/TGuvDdij/ChvHmE133zUy
 kR4X86VUPm5XMqzyTridFHgt+NJNUImOtT83NZYR91u4sG1fzfM1V5ANBktWdZ4W6MeusXUMWf6
 oZlLNYYpSaXASpF9AgebWrKyc2x1Uo8noqZ598C8IgjD7HnMy2URypmD4mzqegb9LyfPvDhx
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685bab76 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=dI-8CA4c5Xf8_vBnWYsA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Y1j2uSssaihY_O9nN3t9KkQHdvweyLu6
X-Proofpoint-ORIG-GUID: Y1j2uSssaihY_O9nN3t9KkQHdvweyLu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=961 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250058

Add an original PCIe port for WLAN. This port will be referenced and
supplemented by specific WLAN devices.

Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 7cec7f643a84bd59dadfc4f7b8d95f52fc81c7f2..c996d5a9e31ce283109d55fb61db8e09d7edbf02 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -1181,6 +1181,15 @@ opp-8000000 {
 					opp-peak-kBps = <984500 1>;
 				};
 			};
+
+			pcieport0: pcie@0 {
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


