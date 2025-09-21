Return-Path: <linux-arm-msm+bounces-74329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C1AB8D617
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 09:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E5AE17CD7B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 07:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D6D2D46DB;
	Sun, 21 Sep 2025 07:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pu5wsuXW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29E32D3A90
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758438704; cv=none; b=RZYMjRNOvv4DZG0pg0hJyvXIrAwjz4vzn5Py8tIHzK7LuWibt8SswaJkaND0aIEOpdLpleaN1jTNHvzhnDBeuSqCj6f3SHikQf1OcE3y/hKh9C4nHOf53wsprV+TLdfSF98i34ijCgy/Mjsk/aNemM6eoAKlu+ftleGaum8YEwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758438704; c=relaxed/simple;
	bh=1RoAFURhJrvly7ZLvTZU/OkE9NnQj/ClSoO+/ODqWqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=phN3JzmXTDUblrhGbT1Wf6BxYDWFD8MYUzLTA3Ffrt/fSeClYQztJXcLDLQKvOW0B6PLcGofVZ4kaTBbSPZfdRw20NuKI3KzG9Pvz03c6WAgmp1bGbHC3MZKp6nI6R3Nw6UJm9JYwWJMsZbHz9qGh2TC6wnfTDPdX1aX9YKC9FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pu5wsuXW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L2uowJ031601
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ejKCJjXaWa+4Btg2sDOmh3RzkdRjnyELJjjh7uxooLA=; b=Pu5wsuXWV91TvvFH
	mi7vISt3JRX+HX1X4G6qbgrtQ9Zln+gSoRqrdCMuef1gfEjN05mRYBH274oR4fC4
	EivC9oIvEVoi6bRd+SrQttgDwMnc5KV4mKRyDVjlsCvtCzJaNq4mg2ByxvmfjdYq
	p877KX9JVF4ue8/afEcVC0d99pp/DQCKboIRPCE7oJWOT/TazAZ+/zEVFloOtpL0
	W9WgZpipn4pU0BHlLWIComEOOdxxxfS7TLXAWy06c2ZWTNXrLpTyhNze1SGGUeKn
	aGQP9zN/zjAMnDq5yb/UTMa90AiogotQj1Ar1GLz2S/rox8nPQTfrSf/HZaihScC
	oPpd5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499nj8spy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b7a5595a05so72182071cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 00:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758438701; x=1759043501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejKCJjXaWa+4Btg2sDOmh3RzkdRjnyELJjjh7uxooLA=;
        b=kBaoG63yhRj5KUj2peNQb0eUq73FchWeEaKgzTtjwZLXQBJs9E/FNa/dO51M0ZHXQn
         JY6qH938aiHVHNSJ7IKaEbJYagkNCOX7csExGyL/frjNnFlEkaKc+6fdUiIGws/Vzh0A
         NzyR15qboE+rgtgH0I4qA7l/LEy2VOQfGU++t4Yq4M64Fre88ubwP3cHE1UpWsnVD4g0
         htWDGioHPDGQliVP9dBJm/Z2A+bOJUWkBN3BJwb2Bu1dIZgm7Tjd9R6hfg1DH5ddryFr
         QG1OUCdeDx6rAzQUvIrd637rqOWidZ5DlRX6Mnd6LDshMJI6j7AawCiErpZEJn35ysMa
         miiw==
X-Gm-Message-State: AOJu0YymYvwAbQUs2nIRkwh/2EZ2mLeQmoB1ZJGv996wcRPBWNqoGgwP
	X7Gl84uFHjXatJ8IGi0rY6qFlmq2Jv7r8MxJFQozpgBZaohLwsyiB/+Le7X1r1In0P/LsgJlotS
	NwcFcoG6e0J51eul40qyTXLpkzcnybW/MjFhFD5mgThFRuBCKH1S8puPa7UP+Bd4ZZkPw
X-Gm-Gg: ASbGncsKSaoG9mMyIvTeJAfOuD+9H9xvY3x1VSDAHnflzK2u36ja+oZ6l1Sylb9NvZ6
	DOglHEyMRjxZzvIQRvlGQfH5NFdBMEx38o4fUuTBUsOH3TBd0D+CsMDmR2WjO3qVKvHQqsrLu0g
	0tmGRqsgN2OyL02GzBUfxRbkfXCFtVddZh+5pHdbVGGvj8OXIvDS/W97Z17YWYyQGk71BJplwh+
	gwHhBfk4JsiPhJXWAJ/qD5FTT7+NQofenhpa9IzThYinmAbr3+6pqHKX1TsJDRm6rUPipnZhrkb
	bajSKy8yClTnEykH0DO1SubB7FtqCZ0zXgoHHJsFr5sAasuW0MzfQNu8l2a5ZbJ1/lVyFM033UR
	gDlpGp5r2sLy0CDaq4ipqsEMUmk+oEbaIvUQUe/u2xCt/IGaQQfMJ
X-Received: by 2002:a05:622a:8c5:b0:4b7:aa99:5449 with SMTP id d75a77b69052e-4c06fc182d1mr114448191cf.2.1758438700639;
        Sun, 21 Sep 2025 00:11:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbEffiODdDcEV6/sySy7mH2Tl7Xwz0TgRlTuJxwJiCt9ulkuemj3hCOkK4O6r7hzICYNQuXQ==
X-Received: by 2002:a05:622a:8c5:b0:4b7:aa99:5449 with SMTP id d75a77b69052e-4c06fc182d1mr114447931cf.2.1758438700131;
        Sun, 21 Sep 2025 00:11:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e06875c2csm144031e87.4.2025.09.21.00.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 00:11:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 10:09:20 +0300
Subject: [PATCH 04/14] arm64: dts: qcom: sc7180: add refgen regulator and
 use it for DSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-refgen-v1-4-9d93e64133ea@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1RoAFURhJrvly7ZLvTZU/OkE9NnQj/ClSoO+/ODqWqo=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGjPpSGhU3kG+04h8mDK7HnW5wHScIkebZ3SE0c5PWUmnJaWV
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJoz6UhAAoJEIs8ij4CKSjVCtAIAIVm
 6/Hf6HGfB33mXPfDhnnBwrR/6PmBMneksnlEduC3h7QdfGL8t0RHQsAjoTM3CgbGVK/I6UPiHRy
 typkj1suNShGktdYCXxR3bgGgQ7yhUKooU/gVZ2ETgwbJipffo86TdHu1tjRSrFGF+U4IBTmTFd
 mwiBJBnGdwMMINEpFmle5SjJDUa8ORm8vMqcuqYBQ8S/dJDDUuhYWCkpfS6kHOpqq1jb3W1LRyU
 r0PU5OLe4AUMLLtCtCmAvcZSfP5MCONG5HEtT7scLNrl++USYfW69e6n/ZiIzHWzLcdd3o7Iqg/
 SmIkthKvA1ccz0Jz2ZAF8ZD5GnVLLfxV2tmGB1c=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dZ6A3WXe c=1 sm=1 tr=0 ts=68cfa52e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VWJQ3tB3OeTIR7vIxygA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: pJG4W60zUhJPY3XT1VGvwXEB8-6R0pqQ
X-Proofpoint-GUID: pJG4W60zUhJPY3XT1VGvwXEB8-6R0pqQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MyBTYWx0ZWRfXxXRoIdB1ThHh
 S5I01z6yV/ANlId8bB4QMKpz+6/DL1/xYHY7H86yQhLxDTk2yGLcm5BAAtHvnhJb6DYLoHFpwVJ
 L/A7CjZ7ZtZzxaLHaXvk2gJr2mEXeRdxTZkFGNR/Wavcp2TcevSlPwEz8LwZl5GyOZ0pvCK4eBg
 fxSMZiXIt+9V0Phfd/iqVNALy2UjfbN5hO98/qpoo9YCICJGLHGs4zQbDaLBUygZBSmYJz/0fv1
 7/rkTVRwdDAZA2rEw3lDIhPR1mJOWo5UAI/G3fz5BZj7bh35cN8WUaLybhYUszLV1q5gwSHdyGs
 Bz06FnE8N9TBnf7gYtYFG6NmA6/SUah5Qz7hsbVQ60Ct4z52td0fWSgY1xEQa7X6FACFI7KVNfv
 HMIy8XuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200043

Add the refgen regulator block and use it for the DSI controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index a0df10a97c7f8aa5cd468c8983e74256490d1d06..a47182994c564e036dba25c772454320dc41cc7c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1474,6 +1474,12 @@ uart11: serial@a94000 {
 			};
 		};
 
+		refgen: regulator@ff1000 {
+			compatible = "qcom,sc7180-refgen-regulator",
+				     "qcom,sdm845-refgen-regulator";
+			reg = <0x0 0x00ff1000 0x0 0x60>;
+		};
+
 		config_noc: interconnect@1500000 {
 			compatible = "qcom,sc7180-config-noc";
 			reg = <0 0x01500000 0 0x28000>;
@@ -3332,6 +3338,8 @@ mdss_dsi0: dsi@ae94000 {
 
 				phys = <&mdss_dsi0_phy>;
 
+				refgen-supply = <&refgen>;
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 

-- 
2.47.3


