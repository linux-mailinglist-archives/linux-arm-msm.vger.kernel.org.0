Return-Path: <linux-arm-msm+bounces-68100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE45EB1E500
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 10:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA415622760
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 08:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D591A274B24;
	Fri,  8 Aug 2025 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmBYrewt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70078273D8F
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643202; cv=none; b=ZzRPMXGLjGzbt6a67iJSC6lW6OdiK3xzWVAQmO4sJE+fEFdlyt+lK0arn0uQO4w2wUWTw/DeGqSceYUyTZ2JA9PuffXpLIdySyQDmOrJH8nPigeg+i2b0JtlYibzDJ2aYoPKOdDvznqrP6x+vXY+hIrS0K3XzGQoNDUdc+CsEiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643202; c=relaxed/simple;
	bh=xLcisQUmX1kKWJaAAGMAi99CaZ3yNW/4jd6IUN4d/Tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cc7WG8/NBnFA/aDwnl215u+0Q1Kx64P5iLnxqILD3PNTcu9n+c+hsjfIi3taUd6iOeUVCNfDMcWldfZeaGhm9SdDOpLEqHyAKq9v1tKLCxIUNVzzy91TJ5SrcDzy/iYHVZi0QQBYM52DkIeIO4mp6kiV8FsF1KJvsgGTqnUF0KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmBYrewt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787RB2X002159
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 08:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XAMShpBw6gl
	5ZzER3GWo8lF+QTIMlJwqOkE02a/mRys=; b=SmBYrewto+jNpsi4mCt3DQSMm8s
	yyWJMBkdy7sYhTSI4EFHOId4KZhIezx18DuJfacTiZI76cgvob5NnPVDSOves4Am
	8bF7BfkiJhIB4Ul4yAjnLk8jmCBL/PlU/oN98Zu4HskcRTu7qtZAVeiJrO7crsCj
	Bs5+wJDgbVYVjXyqqgOBN10fIlsT3t7E95FSsykffNmCLwcppshrZTN3fuFj4v9d
	/++nJXyXw1D6GhB1dzt0AB7oq2XKqFTyJP7jdcy4LZQ5io1qI4cpctS5iKhltfGT
	kNdktzesb29biz17JE5DvVPaPgKHBKcRoHjr7Bk/bn+eSmdyLyyls46uxgg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw39aa5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 08:53:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b07b90d5cdso24463141cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 01:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643197; x=1755247997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAMShpBw6gl5ZzER3GWo8lF+QTIMlJwqOkE02a/mRys=;
        b=Ywsg4v+Bmj4AC7drKZI/b+GnZnaA+2jFtwoWiGL+UZDMJeCsAwLowj+dtV1v0rX2iB
         +cglnbR4KtrvZClEkzjlU7J7itPSfnOZ2ZLntJPfcULNik6FiYdWhw+Tzc452lO/FAfs
         Q0G3P/3khJGonaZ/7ytlsnUslE9mQzAudRn6Xvbn44jJgomWn5McMO1p16hE7ixSDR82
         ZIFWzab8lPxFJYuDg0yIs2v71orI9wQZTVd8frG3zvcmLiltp+rcWcRZaMk2LDB5b58p
         9bx+s4/w4pCHK4+xNv7kgIcrjf9psXhoFdapMikAYWePvcCYYHTYdPz+03ar5/ZfSm++
         0NYA==
X-Gm-Message-State: AOJu0YysHb48Q+a095au+/hCK7c5Rcyt9xNx8/cg0ZAi2waADMLbCkf6
	7XxpLlijIxweNfxB2/a/IoLvLn4lpLYzBLozsRX1C4WX61Uutjy4HA/E9fD+ny5W0lD93dssRWe
	lncct3XH1wf+ED3reqDFsuO3cg7n2khegeTa917vNJ6PPgHZMeWhc8F/FkSNGQI/mTj/3
X-Gm-Gg: ASbGnctDN473A6dAQ698+rS1zGQ0O9kU236ynOCL2Xukn1IN+6aBquf7dIPupPjyHkN
	gbIrRGbXsT+MTP0+NzF0nIlLqhkQdNt4gO/Z2LFLGZoqYdqPYHULHSceXvSaKKHH+dpH4hESmMg
	dlJ5Jc5Yq9m8n9bc4nKkx4L0RtPmoj8qBHr2sUpjpwUiYaOPxKRqvboUE8PX4Sl04rmPGiZBc5g
	DZVYFkcILr8t21rPzHqhK26pKZyyv9hLYsu2RkCwYQKbC3UbGEG7BAY2xM9+yTszsnInrrDpyq9
	n4xmIZYWsMZaPSPrxdQFJNniSnAdA897xPrBbfO0FE0QBu/p7Ar/NT8gz22+DKR0Gk3rCAgBhYf
	G+tt/ayyYK3AC
X-Received: by 2002:a05:622a:248:b0:4ab:41a7:847 with SMTP id d75a77b69052e-4b0aedc95c1mr30198121cf.31.1754643197266;
        Fri, 08 Aug 2025 01:53:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJP2aWj+S7AivPnjl0T9O7ur4HP90mdxQ0hwDryC5Qx7SHbXMaFhvERCN4XIMhJujoabrZNQ==
X-Received: by 2002:a05:622a:248:b0:4ab:41a7:847 with SMTP id d75a77b69052e-4b0aedc95c1mr30197871cf.31.1754643196868;
        Fri, 08 Aug 2025 01:53:16 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5e99e04sm123818745e9.11.2025.08.08.01.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:53:16 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 8/8] arm64: dts: qcom: qrb2210-rb1: Enable Venus
Date: Fri,  8 Aug 2025 10:53:00 +0200
Message-Id: <20250808085300.1403570-9-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX+RuIEU41fM02
 wKhEjuc81sLbZQaYUdj/G/fiAJfvpWLbWVLA7qB3/1CwhkNwUzww+Zm5FLl25gBM9nvpPqFMcxu
 08IajvR/5w3oSmBxPdkyexniJlL7YAecHmo/MWEF0qe361ANCCX9ZPwGbFh58ABuwTuhYJ8I8Cc
 1S5GgpMM53PQJ1WWo77+Qzs9dGhTY2LWpWnXUg3FDSR5xFvwFkjqwzucjo0DcxAJpV5N1WW0GgJ
 i8sDJ41vHdKJmEPHh6X0VSKVN1rq/NsJyIWmUzIIkikTsiC2csyZ9vp6nbBGn23ze7v7FrAuSu9
 iTFxj0thL8B2050ZW9XTSRSxvR0HSAPKR2GIfOrJcXIz2rZeMLAyhBh5awjJ8wDjM1jy6YFAJX8
 3zB0plvB
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=6895bafe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Qms5JgQ9tnEuTiNUcoUA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Ym1-TYNVMdH7mkma8dMcJP921X6oFBBH
X-Proofpoint-ORIG-GUID: Ym1-TYNVMdH7mkma8dMcJP921X6oFBBH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

Enable Venus on the QRB2210 RB1 development board.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index b2e0fc5501c1..e92d0d6ad1b8 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -698,6 +698,10 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pm4125_ss_in>;
 };
 
+&venus {
+	status = "okay";
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
 	vdd-1.8-xo-supply = <&pm4125_l13>;
-- 
2.34.1


