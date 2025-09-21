Return-Path: <linux-arm-msm+bounces-74328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 964DFB8D609
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 09:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50E2144269E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 07:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D8D2D375F;
	Sun, 21 Sep 2025 07:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxvNNAHg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51C12D29CA
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758438702; cv=none; b=ns/JSiEd5mZ/JEsOPckbeO5gfn4zx7c0NWOIdZ7hxd8hywJLpg/t9O4b2+Tr/vuJsZrzZbj3cJWFYlrrgA/+P7AEl9ogVg6c0xSHCICKzd3ri3LgXw5Wrdvap0SuK906Vffai31f8p3q6zBZJtRGbnN0hpU6PDH/u+f4+WAEzhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758438702; c=relaxed/simple;
	bh=zkiKWQ545lawisDQZ6UcjJ+C2fdKGwCIkk4moVU3rlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3CPQ3yoiK2TRAAULRPC4efGhu3n2RH16Dn386mw+4V/gP4O0bvMOLWMw5OZRJSwzCTOTzb1NkQlI57b5WcICizSLQs1/gEgeWVp0+vhip79eEs3NyA496TAhg8ISs2agWX7lhqFaO4gJDIiqYjrWuNf0ZJLAkvwxlnPvOl6uGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxvNNAHg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L5r8Vx017461
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kNz1cnXxXp4gzrXuV4750J5uBw00c5aRRnJI/0NE9io=; b=HxvNNAHgkynK7x46
	K+mUHsqoOIZacNJ4CeC/wq2xlpElfvw7xR4WsmP5XCVIPExFih5WZ3pCokl9b2z0
	JahCdk1gKliFUTQa13RdFEX6fcD/D1C/cSZwrjplO8c/eQiEbtaeEeUGIawEkXV1
	tDVbLs2SvQcJeVJv08eWYT6Tf3rnlALIQlq5DEu9GEuMr+VzBTjlfAOI0LVXBXnB
	Rr2x45XIrlHQJyg/fk0A1l6UsI44gQAb1aT/fk8OQsP6cCAf14wHVhTFAcCMAwKO
	U1YrzkFoErrI4GrLjf8qFM+fRNgYAj9WcvkQjMrqhsy4kcT6GRWtExpp0q76mZbM
	61kN6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499nj8spxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-846f089463eso61772085a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 00:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758438699; x=1759043499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNz1cnXxXp4gzrXuV4750J5uBw00c5aRRnJI/0NE9io=;
        b=mY7hFEO/zBy6H5r6wYDoOW6GsNLbMoqKyN8u8M5lOTYHRerAqxohZMqn5xJUN0mBI4
         Pmt2OzEMadfWvfQdiHP1yPbb9yLhpZwm+ETQD27DwqkcijSPNPcdOd3Uk5kcQ2hpfN4B
         ZafjNTyslnoMbdLGQday3SFcv/h0kjkF6GAC7tULiyfy0X7MLkntIESZJZXF/IPuIQQn
         N0e04CNjWzivTXfo08NB2b9rX2CJ7ESRGlY7s76qBazPf68S/jILSmNEHZKcLS79TTZJ
         q1PuY5WfXjyOrssfgU7KUSoHKhUi39AaGTTXr2kfILjOYdBZbwaGgcKNArD+se+WjdTO
         mX5g==
X-Gm-Message-State: AOJu0Yxl12RtJagf3gN9a/IPTW5BJcqCpkzVV5qOAKZfa8kEgGKZ297V
	+D+f3u/1d8qsj6Y/JPqvrrQmWaDVnBkbhehFLDh1OcpXWL2Fh/C6VFodKEj6zuBTfU5uG5sJs+T
	t/A0LwqyovOEMnawDi7muRQQz7FhD6yOlivcfyYrhpysxYSaMCQqt74UEIs1MQPgKMoVI
X-Gm-Gg: ASbGnctaHk6mHufpGZ+1fMcTsubRpq+iAytBVGqB9cN3CkhTlSVV1Ii3KPMnFmLt31H
	OcOxSpWwcFs3vTcIw8tMhZcvDUaFkl+odCPhjoiy3XFSGzxXy1KjEj1lQxs1QwGh6B5ogSaR+O4
	PapnnSzvKMxJKpTTd4uKvO4J+y6Oaz6M4/L/9bBxXfyFmBuvkpCzJyBl9KUFFgcfNXKApOLoGte
	urSimwUBQOjRqKfq0HyYJjktXHlUbsXGHfJLkj6qAtyjnn0I9D9tVjbU94NAn+RdHPLjTnQoBr2
	f60WflKr2ptYPiqxgeIVvmKt2lYnc/cMVU99PW7VfXuM3a4Qj0uNkG6o9dK9tYrHLMxvlLtBsk1
	iL7gsJVowOVVXeR5m3BauZU3MGNYvBhTMgA2546vhZ10Xtax6o10L
X-Received: by 2002:a05:622a:11d1:b0:4b6:1acb:64c9 with SMTP id d75a77b69052e-4c072d2d5d9mr100406591cf.67.1758438698934;
        Sun, 21 Sep 2025 00:11:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/gPyDWmRNBkl5UV2cfMUtRiih4ggyLOshMaxW+JJa3TbXIgaLn7/c1gLOiBlpPMvvmZz1Hw==
X-Received: by 2002:a05:622a:11d1:b0:4b6:1acb:64c9 with SMTP id d75a77b69052e-4c072d2d5d9mr100406441cf.67.1758438698475;
        Sun, 21 Sep 2025 00:11:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e06875c2csm144031e87.4.2025.09.21.00.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 00:11:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 10:09:19 +0300
Subject: [PATCH 03/14] arm64: dts: qcom: lemans: add refgen regulator and
 use it for DSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-refgen-v1-3-9d93e64133ea@oss.qualcomm.com>
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
In-Reply-To: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zkiKWQ545lawisDQZ6UcjJ+C2fdKGwCIkk4moVU3rlU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoz6Uh9DvFtGnaoCCAOvZ9NsakJUzDIwXmToZnO
 A3ZMODOtxmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaM+lIQAKCRCLPIo+Aiko
 1ThQB/9Hn2Pe1z+Hc+rApl00pow6WaTnztYuv9wPR4zcG749lLNCVs7vNHdbJsR7givMkBAeYYV
 Hiy4rG9wo2zyisJl47tl1Jb7I0iwMHberVBV/8WhPKar+vxO4yy5mb6VZLsVq5Fng1cwx8iYnvy
 xFRi+eQ1U1qwvAspBIe9BiSLTdm1tPnRSObkRAJ0L4K9f0dKNDWQjXGq4e25SXBmpcvbNZ3E0S0
 /MmM0ucHFMVe43VESGrTRgji7I55uLBiKIokey4eiHWqYTaXEv/+KozLlfZ51ONJzAp+3ymqyX2
 xRQ3dkSeeZRMDgBPnipgm+MycRRksjCT1DOAS5LEPhhmP9T8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dZ6A3WXe c=1 sm=1 tr=0 ts=68cfa52c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7Z5K0qU3zCLuYjkCW_MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: oG2LATVgmg3zszTMik9rbOTUj0hpd5rO
X-Proofpoint-GUID: oG2LATVgmg3zszTMik9rbOTUj0hpd5rO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MyBTYWx0ZWRfXy8rk1c8qSH/y
 MKwpPyEy9z9+yUo2Agl0fxu5eJgvzDJFkA+qxMwL73K7AOjm5/wzNRD1p7xGuYljbHOL3gUH52S
 aYtbzcq5/Ztfr14dV1OP5d7FTTmcu2bOcDF5NGhYMo9f+DzgM/BWa5/sIjvnkv0YtyVRFCxm/Yq
 16MIE9ISbVFVztZ6d2P1PV6Q3AU2y8ZgbmHbEhDeLeglXQd1D6c6EBO+mJTY19urvtXGNxmyw1l
 6PYsFXG4c1Ns7PGTudwPdUritonJdqCB2h4EcIGES7qR88gcc93SFW2u+kAehcq61kM/dabstUi
 l5wVkuOGmvF0spiKuKkFJM85fWhqyaZQ1XUIMP1d1554BtGg6BAzI5omKXvKBcHcqLldCCiXPf0
 wQEobYvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200043

Add the refgen regulator block and use it for the DSI controllers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 7b5f0b4d1be75d1aa757069522bbcf20898a321e..b9607cfa117c8a5d71105c7787a8db79d36cc842 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3975,6 +3975,12 @@ usb_1_qmpphy: phy@88ea000 {
 			status = "disabled";
 		};
 
+		refgen: regulator@891c000 {
+			compatible = "qcom,sa8775p-refgen-regulator",
+				     "qcom,sm8250-refgen-regulator";
+			reg = <0x0 0x0891c000 0x0 0x84>;
+		};
+
 		usb_0: usb@a600000 {
 			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
 			reg = <0 0x0a600000 0 0xfc100>;
@@ -4899,6 +4905,8 @@ mdss0_dsi0: dsi@ae94000 {
 				operating-points-v2 = <&mdss_dsi_opp_table>;
 				power-domains = <&rpmhpd SA8775P_MMCX>;
 
+				refgen-supply = <&refgen>;
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -4981,6 +4989,8 @@ mdss0_dsi1: dsi@ae96000 {
 				operating-points-v2 = <&mdss_dsi_opp_table>;
 				power-domains = <&rpmhpd SA8775P_MMCX>;
 
+				refgen-supply = <&refgen>;
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 

-- 
2.47.3


