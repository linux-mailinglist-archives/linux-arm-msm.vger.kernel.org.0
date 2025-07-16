Return-Path: <linux-arm-msm+bounces-65294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F582B079D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B652A5678C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCE02F4A16;
	Wed, 16 Jul 2025 15:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vtbc4OJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0C82F3C34
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679700; cv=none; b=sf8P4wOb+cIom23thVIBU1r5INrv1mELjy3RjdMOtjXct90G+fvcpmI+GzdE0w35+Dsg5l9tw/ayicKW26oJRl/b3RaOvlkIx8FsNr9rtxT9wqTNIl/SRXk/6JL5Evdt3ZulBfEEqY6xnR72IUh6ch4V/A2foNunfAnIryl8p14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679700; c=relaxed/simple;
	bh=awJhqK9vZx7HfSJmr9fd7vWzKJvnlam9KSwzA05jp7c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=elUaemNgaTGlaJRVzgSF1Xn+s3D+MtCty9pf+bfbctqpIW4yYlAQ9OKwCvKTIWbWyrMIyIQwXBThds3prmlzH0UjKoiaImhasqK3tK1YrTduSpBgqfWv+fml5+tCSwjQRhRqByZREGa4M2UC1GCsYswQlTfbD98oTjkCk/Byl/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vtbc4OJ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G91HEw012368
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eId7Thpi9XZ
	dt0UdhQINAu7XwHMfKszVh+XHIOlEnig=; b=Vtbc4OJ3gC+WqXbqSbAz5OFi+Re
	932uuNUJV4X43NhFdYr0TIfI9s6nX/IRCHIxUooAqPSWHeAzPZlozHzPVosugvw/
	UDyr7afk4IWMlinxR/OGcNCDePpoH8PtiOsGe6JzIOC2cAaV287DUDcWQahHVYaD
	ddO2QO5ajKhv1gq2xL1xpoX6W1l6hZC4RPOV3VRht2wl8DlDm5+yu2ubYx9RMmxR
	nmuJ01RhahDKys4N/8sMlYzYvssR21hmWZWUxTjtpVo+3JWjCic8L/5WdImaCyy2
	OeS1lEBZ9TNuX4AmXnfIE3rquFLVicDbYe6UHjViPtfIk9fN1mlLMhe0Q0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7h9bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:28:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31218e2d5b0so41991a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679696; x=1753284496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eId7Thpi9XZdt0UdhQINAu7XwHMfKszVh+XHIOlEnig=;
        b=Jb1Y9gJacggzpLA8whZqyxd1m2xySleuwWbFBUdZ0BXl1HPqBgK9YUq756EzOtmh6V
         C+/6dC5UtSdIrUJudD9EAfwlZgXRQbY0GdLNfoXtjrwMX7DguTgBBrkB0APt34YqMOje
         V8nC2ov+v6m/LyNad8zD7nDyx5dqrkw5jrKVAb5Ov1caHEE3QrzO/WAulI9mKK4VNa3Z
         xWz+Rl30Xl8ZHUHfL4tskL+Kac7g7WciChAWIGiZpeD08JyM6wdfRtvCjGbJab+R7nKj
         DLBXum0V2feB77v/WClQA5+Wy7F6BuvNycNh9t6K1r7Mv6Axg27/cZNoAok7PUlRwu/Y
         EvKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx6heUrmipt5pNi859iZ0BUriiA9WCXBnwSJYYAP/4fgLZCxji27PBKjKaFR0ddj2xpmk7JWniLAKEDFa+@vger.kernel.org
X-Gm-Message-State: AOJu0YznFMHhVCA6emA+8mx2RAxpSvm2rO/+MSKtJF1dkm5DK4r1uWpe
	BtPNpftsEob4NG9AicjY1Au1DuddSm+wkqkmxojFJTSdzdzSEkq+Z1JS+cyjTLbaKnu2KWJok4Z
	6knbHEQcTz/NtrSuIPy4pyKrNRQUYTPqCK3kbDLfgqsldHUm4dABN9+rpwZbcFO0ZJyimmr957Q
	ad
X-Gm-Gg: ASbGncvAsV1z7bhIA01qN6IESOP0sKINwwTMHjm8DwGEtkkJBYX8up4CrfoGGNrXll3
	xeEF1umIVGpJT5z/XUAP4N9KD/TjzSuIqUwvFxu5jqg5oNBo7u8k6RIWv5J5LgGp9XnRNJLG1+x
	vtPeTqpUuRArZxjY8fyNgN+UfWG0KwRlfwPqn9BHTNPQj6nh7ZehdLKi4lwt2jjl+RmBHqTfbb4
	8nXVfD0nujfcCgoh//b6GZDDhonCqC7VLcMkE3AhaIxW+yGpAduiZN36hnlAA375H5iaiHkwMEc
	4qrdm7sqsnanyuOS7cA//ZF/7LAsYZaG+/H9pRAi48kDKqMC5FxM7cUX9Q7KewHBmaRBAhCLJgw
	qI7CGeXHCrRuPep+EZSmvhlljYsyvyzVfLhHoNM1mCgMe1S+0FYHTxPIdeaLO
X-Received: by 2002:a17:90b:3511:b0:312:ea46:3e66 with SMTP id 98e67ed59e1d1-31c9f45e1c5mr3880519a91.21.1752679695694;
        Wed, 16 Jul 2025 08:28:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtxskSX4ykowgYW6uvYkR4w5BMuKXIb3nL0la8MIwNTod9JbY4bqqI87oJ/MQXKSnNbpjtsQ==
X-Received: by 2002:a17:90b:3511:b0:312:ea46:3e66 with SMTP id 98e67ed59e1d1-31c9f45e1c5mr3880481a91.21.1752679695170;
        Wed, 16 Jul 2025 08:28:15 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f20e87bsm1688563a91.35.2025.07.16.08.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:28:14 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: robh@kernel.org, lumag@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        ulf.hansson@linaro.org, konrad.dybcio@oss.qualcomm.com,
        quic_tingguoc@quicinc.com, quic_rjendra@quicinc.com,
        kamal.wadhwa@oss.qualcomm.com
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: power: rpmpd: Add Glymur power domains
Date: Wed, 16 Jul 2025 20:57:57 +0530
Message-Id: <20250716152758.4079467-2-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716152758.4079467-1-pankaj.patil@oss.qualcomm.com>
References: <20250716152758.4079467-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOSBTYWx0ZWRfX7AxOxaj72JtV
 6M8B1N7YTrk1YvmOjFrGePdSp4iF5QV+ZygBOTiInd5++1acfHPdKwULbLrPRD5mjG1H8Layc5Y
 /WoZjf3prm0DuEYHB3IlHhPmxqSYcy3ZaVIIDRXsFAoMDLD/SZegmuFQ+qbBu19ppOmh+GmBkMU
 KaUCVkgke7MOFRoi0bmpUqg9No2TfoM0jOTglW/f1ZFL7MLdbRgi5Z8tUYhNIslRuRDsDJjp90W
 TG0kskmh/uoGFPGN4Vlb3c46E3ggNwCgfVD/ADrPrRpUz13CSvek/RfW26IQRh7WMoEUou9NcPT
 LzC1bDZT0qnBBy5muvkW+BpWaGjJvrQcZwGjVXzt4/YCWOYnPxA2JySKO3xyC964c1C1gWXILHI
 3+oXrtkgp37+jaaH4Vr0Oe3MwZYTRTIy0kYtLn+JzjCZQJhlDgwNqy857rmbbbfXKlYmoaXG
X-Proofpoint-GUID: pyFgJ5eoT0JY8wKwdMq7RNyuH65fQgQ5
X-Proofpoint-ORIG-GUID: pyFgJ5eoT0JY8wKwdMq7RNyuH65fQgQ5
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=6877c511 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=mKLVYdK_SoQD2tn2_ugA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=939 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160139

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Add the compatibles for the rpmpd power domains on glymur
boards

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 7d4394a3ccbc..af5fef872529 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd
           - qcom,msm8226-rpmpd
-- 
2.34.1


