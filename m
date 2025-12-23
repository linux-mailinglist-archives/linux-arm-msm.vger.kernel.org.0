Return-Path: <linux-arm-msm+bounces-86342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E0FCD9498
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 13:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 799CB3059E9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 12:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466D133290E;
	Tue, 23 Dec 2025 12:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gjt4jNiV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqCWl82U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC32130BBA3
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766493243; cv=none; b=avztr42f6MqnqtJRdigUyNfC66VBXSRCFgK5mxJO1+RcXvh1ban/98bxB9Ma0ti6XEctbaIphTe0yIszZxYgokYuhlrcFZ7EiWgHOJch1GwP7BrUVHPitp4scQWJ9Ei/U0rTgcwaSL0LhC0WrsfrdEFDi8QpGktg16XKJb0H2f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766493243; c=relaxed/simple;
	bh=XuQBN6DNebiO0zYIxmj7uYi8xpbU1qeTvKFq7id//xg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BhT1gDH2giRDRgRx7OGcZvLaESM7LQtRtKOuqqysc+vwQl5K59Y7+OK9oo2U1g8qHXUPzvlF84n4awucdCJkT8wUEHv3C07bDWbjcAVl8PZEM6KTAuG525I1RmuVbRU9XEhAB7b1U/KY+S2JZODbwovzEMUWsu0Pi2d8KlAkvAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gjt4jNiV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqCWl82U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNAAYxa1568865
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BagGfG/LJXH
	XkgGkR0SfhpghREf6AsylGUK2Ww6S8nw=; b=Gjt4jNiVr1nNhXxm9xRJxJqTFsm
	RuAWqRt/wcIBTE4wSxYx/XIObtb9nl7bLUa8StJK+7fiOABWXOM637nw/J9+Z/nC
	XWpZf4C+4OMxbk3jyYhIh2zR/sW1ofn1JicDlbbCjh5aerS4gfHJXYyf4mbzHc52
	5oso9aMppkfh3EHqStUBYwOsarsCbLwsMdoMEpnOlLDWJGePxMRvReuYBG8eceuv
	BcrnVjWzoVBwmQwJgaQXM5/pAuMKNQk11ITc3lQKjdjDM6MjMjEMnU70xf5rmDgM
	BWGKhuStqpnf9dtzEK54PpvM0P513JkoR7pp2ommLQBmqABz97Psb1DUqEQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy3mvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:34:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c21341f56so15225104a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 04:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766493240; x=1767098040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BagGfG/LJXHXkgGkR0SfhpghREf6AsylGUK2Ww6S8nw=;
        b=cqCWl82UoXWeAGd/Ukn5zLx8OmUNbAP/cUvmdqCTtvF7A0Ur1ssTAhf7VN5c71Q2hR
         FMRd3jsSCXk0ZktkKvMqlYLdNhjBmwLLcEdDG3uUdJxY41OfpNlByeC4Q1jlNnNOg794
         LnjWOWP21smalsrjnDaaMh3wLJjpBNvefmzcxqjdokUAcdS7zz8YyJxyDAX16xIP4qRj
         j9WCdrlalYKahNZXkWjtFH9+fnH1YO4SQdDR8U3Pda1xH4KMwo94WeotHtVti5KwPcMw
         Ej5B2yJ/66KFAraPQ9hngESTNbyI+XUBi1VwCK+qu68tvhgiacsy1mAO9Vma74i9IAHO
         QCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766493240; x=1767098040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BagGfG/LJXHXkgGkR0SfhpghREf6AsylGUK2Ww6S8nw=;
        b=ggKBQCLZwitSyhWBGFlIEtcwv+ZTgZ0rRBO19IPi6PgxIjjmATUl015KFzZxyv6M8l
         xxYE4pgdYvCr+AaBw64tdSdsv95d3YwXxElvsGtPXoEPOozhEqnmTuZpE3Dn7WkJ1FH4
         Hh+9E/Y+eje1LQBuxE5ywzWrBj9TE9v3WJziuCzcjRrMEVOX0EzAfmi+BzdqZbVo7X/x
         ltNE19xz0KYYUoJ3n1+j7X7kCKeVJdFL9a3BGoN6MKcKH3/LROdVYF76zUI9AjXaSwVv
         A8DqrHNeojmGZcjp7dyrC/+mMaUt0t9+1yDfnJs4R3S+kKR8CQOH93sl/ND7P6jFZv0Y
         6nXA==
X-Gm-Message-State: AOJu0Yw0r0h669fTERe+3icfhY3otyB7Brt5cHWn3nuSKGbdsrWuw4tR
	MmawhYcOcoXBLwJRbk8kh8uyMRg8dSP2lH1fbCwLM6OzR7Ecpk06hBLTN01ucaR1e+uHZt1jWnG
	zsXurj667EOwlr4yO21HVYeyERadkn8+4QvxJZ3xM6sZNoO4dXZfjNz1xw0mR1knqvNCq
X-Gm-Gg: AY/fxX7OoeGkzqnvRXoddLk3W1gsIuUXV/BwMZubWSJSckp7prayNLnMGUp/Pw0tgOH
	TxmDTv4iX9qUS6nyb9RRGaA07dxqRtyad1ahVqUcPqEbGw0EDqlh5a3SS+ODP2Mnz/M2mBPS0Ud
	RrhGaOvMhILs1xzek7pxG0BQXQjFEJRo5kJV3WltKGB6O71fX41BodhSGFZ1IY3uF9eZswytt9z
	88C713N7BcOSRFVPM+lcrFXAGLl2tv0H7ozhopMta5bU6JCzqCmT1lRrRN8Rm0KFbLPMWuYk+jq
	8HZaqJJO4urdiha6tvqApw4ZNfj24kbrgC9QmWkjQAUMk9yO12ggjy4WjDnv2QpBavjnNEIGhTT
	uNFKp2Nti9NwZShevBRXB/8XBNcwmyxCus5t6LSE=
X-Received: by 2002:a05:6a20:158b:b0:35e:da63:4e7f with SMTP id adf61e73a8af0-376aa4fc362mr13397292637.39.1766493240252;
        Tue, 23 Dec 2025 04:34:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUYcW4FmjUXnkiiAaRW5BWDNK8StWeFHfJyg29XWU5MiQs7Wi4PIxP7lY99yekh32+FhbtCw==
X-Received: by 2002:a05:6a20:158b:b0:35e:da63:4e7f with SMTP id adf61e73a8af0-376aa4fc362mr13397265637.39.1766493239841;
        Tue, 23 Dec 2025 04:33:59 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e921b39dfsm12936044a91.8.2025.12.23.04.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:33:59 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        konradybcio@kernel.org, amitk@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH v1 6/8] arm64: dts: qcom: Enable cdsp qmi tmd devices for talos
Date: Tue, 23 Dec 2025 18:02:25 +0530
Message-Id: <20251223123227.1317244-7-gaurav.kohli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEwMiBTYWx0ZWRfX99nxl3Yth/VD
 wnAzrzqlM7ysgz8cCAI7ivmcRn7sI0IhkDnol8m0ATylwAQCesw+c03M2usvrp/chLlB/9RMa/I
 hcGVZOeafhvmY9HkSAz14Lz8/SDwgUdhFrd3cFUM0mqRXRMJ8cPstISEHQOrFAOx7NRCVzEBB2X
 nW9g0KcWf9lbnHAt85YgtP4nW4ORlMJAfZsj08R6H/QdlGzjrekK7NMVZmUvrR6Q7kUAz4ewMIB
 nI5vqhh5DlTncKSPb4d+RSgq15QW3pGYLwyDYlkuuLEGZu8XWBVm8nl3x51kFb475y/faOaqHBp
 7Lp5049C+Ztdr1riRTE/OVuM4alLxYt40vxVLIyWf/cGyYi7EbZDikqJS+ZEueBp8IArGD8apR0
 V/pRX4QEe+effhd1mubhRPJ1ErA/pATk69FfV+oKi7N7cnzpzUfu6X/rHmLeDT6hKkAuhoclUGU
 iXVExctCQ6qB35mw7+w==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=694a8c38 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=MZxNTxNVYJ8QJ_AAN10A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: iFK7mDEyCf2k5N59hIXAnDPs2RZp3ONo
X-Proofpoint-GUID: iFK7mDEyCf2k5N59hIXAnDPs2RZp3ONo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230102

Enable cdsp cooling devices and thermal zone cooling map bindings
for cdsp.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 95d26e313622..61faea81c263 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -3550,6 +3551,14 @@ compute-cb@6 {
 					};
 				};
 			};
+
+			cooling {
+				compatible = "qcom,qmi-cooling-cdsp";
+					cdsp_sw: cdsp_sw {
+						label = "cdsp_sw";
+						#cooling-cells = <2>;
+					};
+			};
 		};
 
 		pmu@90b6300 {
@@ -4721,12 +4730,26 @@ q6-hvx-thermal {
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
+				q6_hvx_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				q6-hvx-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&q6_hvx_alert0>;
+					cooling-device = <&cdsp_sw
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		mdm-core-thermal {
-- 
2.34.1


