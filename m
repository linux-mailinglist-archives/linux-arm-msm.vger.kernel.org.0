Return-Path: <linux-arm-msm+bounces-66684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDACB11BF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 12:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E03415A5750
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C001D2E265A;
	Fri, 25 Jul 2025 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0wVWMqq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645B12D781B
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753438157; cv=none; b=gc7WiTQc3EuvtJwYs3Yv9iDeL8uk+siWgqYeZbmIGgwyuM/dRTh0ragr8BPkN+/GssFjqBM6wjn6ZGhPYGr4XfswXXfHmnSbZROkL0xFAbKs1H8ysOc3wnx/HYcHTqPIkhN79ae57nH8EsMoJ+ZuLtzeSOiq8LlUXMWIjN99/8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753438157; c=relaxed/simple;
	bh=QuD88quV2+ZZSG71H8tKu1kO0ROT5crAafRmiD8dmdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a3olsabg/paVpjTND6u35hA4NzmUGbp2X8y6Ipslz0G2gxf8/uJ37s19vzLKphWie7CRYoau0A6b5vfcDK9bmTf7J9/D53isS81VNX9QQVEYQo3BskOgxlSMj4ArIegeKOLN2G8QgviJbLln76RC+0bNwcqV1fduTxj++otAwmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0wVWMqq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P91I0w024427
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xKWmqQzdMPq
	FddVCcAzQVRWG47+T57+MG8ITHFHowHo=; b=E0wVWMqqwSs+37BgbCMx2GYgHY8
	s0mrSrqQwMl0bYaGZ9i0NFqJ9gJgVqs/jMajTvLlLySGl0O678VBmOnLzNDMpzJR
	qeZjqlmO2+1ZFVcVaDg89YoelX96dJ7A9P7MpaWVdI42AHnRlHMMVtgkDmbqnKAr
	FU14+Uxt7JHjMCY8pVSZOq5EyEh2V7ixw/OBkgHnkb5nhPNf8C6sXzAo8W/OcGBH
	ZCdQyv4xvoKG6i5xTvxipRt602EbplRuyyHRkLV3XpV2+9ZqmKyQpjk5q25QRZIO
	i2Z7JPL8CN+iIval3G0F9rdF/WxbID53eECxwxz+7Bn9Ey1hPRJVNPK9dWQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2r9p2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:09:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2349498f00eso27776275ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 03:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438139; x=1754042939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKWmqQzdMPqFddVCcAzQVRWG47+T57+MG8ITHFHowHo=;
        b=e2V5FZsUOAlxxyj6rek/zLN8zHBRr3JuJ3vykEshMU1o8erqUszRkQvzan4W2PONs6
         aLcphER64qOKLs1E5KILP/zZ3hKclF23obRvd8xuap1YN++KbyixjEOi4wmrxZ3bMLTk
         wCw5WPJAc2gQeuAobdtQa4nPyc3x9esJspMhIwrb1NQNxJ7JhY3mPcjogvyTIW2nWwD5
         VDwL3ANQxAXJ5Svggxm8fRy6mlwCmVcGkH1u3FGe9FhvfaZdzJZnaqsdp7yxty6f1NHj
         1CykaQcqxKkDzXik6aPcqSOGEnnwnFSiVgZiZo3kTuAKPeid0YDEioQJyRi89UY0VT2P
         JFAw==
X-Forwarded-Encrypted: i=1; AJvYcCW6sVUQdpHx1z4N1HYRpdKoxdTi0iER7AEjSH/8P5IvKIA/AW8F8LLsDKuDUuT6rdnOblnK+QU5YPrKznzA@vger.kernel.org
X-Gm-Message-State: AOJu0YylEo3ZVBfBA0O8mI6lPf/7IjQwqNAkIVs/wEZ1zbvyLcJFBCjn
	mMkP5eaHEOtFgo7IrQS9LpTDAFxZVInpxi0MkWyhE+B1vKOGRBWXFoNML69KPIaY6FM5Vb6aoBt
	fizcfwzwopl2n8Ns3XJ2WQTX1MyIfzUQbfcd03g/ZqdNQ8XW8mC5ePpwABidBNJGiUPaU
X-Gm-Gg: ASbGnctGX6LC0Yw5TzLIcC/o2KI3WafRuQXjQuVu/6nvHJYl4wmPTdwKX4ZvsG9RCRY
	v8oSX01FSdJ3lfJw2rTMnqAcVYdkoPyDFCmiUq7YJhlbaxmClXx73ChLOUuF3fM9oBhuOF27Cg+
	srNHPpDkYBFBIgrct7I+NxckQ9uizyby+gLjHb2WekJT4xTdORRmxcyV05Ese41oHA8E6qQmzYu
	4BKV3bQwyXLQEobDqYFyUUb9MdsKy4ZyNjxzW7fuu5+H5Ld+/ZKVmkb3oSWlFbGlhPLm62CFvVb
	1w95Sg2Uh7XfItX9Dox8KeW7kK2McVv2LBefiqzv39BHpVsEU3t+QCc/K9YrPZB4HScOQi/cWFT
	Gk9N3h7D5/y7h6h8l0Ko=
X-Received: by 2002:a17:902:e887:b0:237:f757:9ad8 with SMTP id d9443c01a7336-23fa5cd3ac5mr77420455ad.1.1753438139129;
        Fri, 25 Jul 2025 03:08:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGOWyYvFuXyRYBG4B08FA0aT8mJsXIF3dBXE+GRdj5C2GCVY3bEFepxa0+JYY4aakya4DCUA==
X-Received: by 2002:a17:902:e887:b0:237:f757:9ad8 with SMTP id d9443c01a7336-23fa5cd3ac5mr77420045ad.1.1753438138713;
        Fri, 25 Jul 2025 03:08:58 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:58 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 10/10] arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
Date: Fri, 25 Jul 2025 18:08:06 +0800
Message-Id: <20250725100806.1157-11-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfTm13D4 c=1 sm=1 tr=0 ts=688357cb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 8oC4LO0scCwMYOTF2IQedWeK7hCs6J8I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NiBTYWx0ZWRfX4wdDZL8eRMcK
 vtJL4GhUWicpUZKvsNWhj8xwn8jla93dSej3TFjXTGStSJy9OocfxV5J4YhBBz9KuhxqtQ7BB+z
 XZNetfghuZhV7+XkBErHFBx6HERN4Z07melo4+ZISdFhBj6nBKYYvPJ6EP4wqjPMh5K4Gs8LtSz
 rPc4Hta5mnQYwj7IwqOB86eaE8wd/JxnT4+Me0Ws1QwmAYxAfpKE94iXdbiEgFKxbDcRzAaaHQ1
 Mk87VRfqX4z783l3tWN6arP1qSmKdFfIIudT5Dp1973tJkCjItsgTre0+l7O8LQzq7Yt7RuuCjy
 ahODxQkuVDuKoPNWgTdsSuKqsspxHz/De3cCzNwielUcRCIpGFd4WIomOs7oCJbPvCHHMjmp5oB
 bg7fi7e2nbyQa4DMyKlheduKPPll4/YCRHz5IDP8s1K+ue3qVrVA+QKf+oc1LMHk4wnLBmGm
X-Proofpoint-GUID: 8oC4LO0scCwMYOTF2IQedWeK7hCs6J8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=823 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250086

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9997a29901f5..4e6684a6d38e 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2762,6 +2762,11 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "etr0",
+					  "etr1";
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.34.1


