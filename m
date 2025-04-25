Return-Path: <linux-arm-msm+bounces-55705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D13A9CFF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 296A3179820
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964B321ABD2;
	Fri, 25 Apr 2025 17:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nys2H/rl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E1021A42C
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603245; cv=none; b=QTgrk8JdWZJgqVdi6eUdtC58REmePX/KysesQGmmVl5zJVhlB+DN5L6N0X0P2Mewvf3HMjLjv+iEJkDyMKIeEC+7DnGig0cpWG53Iy7uK0KzeaoKFTiwNiQannuek07rGL6YUTXFN3RlusgwJ0DIhfUIo+an60QraAu74kf2mNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603245; c=relaxed/simple;
	bh=qxwwAQssnBZBBVKru2sbCtWxws/ZOFEbWlTaATtYoOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XnFtU2Ros90h9YJXwxDWXLojS1P+26mOffLrSwTROK3Qtzozq4ss77hrvqdlNxWqakJYbtos1PfQ/Tn7nhRhmrlNq7pIVU4wNkW6WlC/gSwJ66PMaGdROSAAKNhymEKzYaManegmDxfVR6GFJh/fUljlQeNHvUFwOgN8EPPe6tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nys2H/rl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrkl004655
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7macVYl6YjnurDIauzgO7hvqeoRbbfrROTBUYO7oFw=; b=nys2H/rlL/hFc2Z8
	EJNAVx01tS4LSm8vtOeiRU9MCZhJ7HnXTF3R/dZ4PyYZtr/mPfIO0a/5/GCZ7IUy
	BglgrrvrAo4Dq1Byz3ut7OiDi8slpTxRXAQk/KOVBP7hCWF7pnq5kQIrI0DblALI
	k2yjRPHkjidvL8GCnHps0R2XKA8ZVKwJFH7KobNfjawxa2N28AxySoH4srwXjpci
	k5SIl0tQKHULt7E4OetqrVGXHyMcJDJTsJdPGq7zkbe1r2xpP9pPqH0bWDkyHqOR
	7a7bkOBQ+juDc/PG0FuQAqxS2IbTbzpOkYLq/gKiz40w/b3M9tyVcmlzje+bC+/5
	Ys8Cdw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh09w72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ed16cc6e39so47412596d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603242; x=1746208042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7macVYl6YjnurDIauzgO7hvqeoRbbfrROTBUYO7oFw=;
        b=QygCYu8wO8JAxEs71Aw4AIgInCrOfVhi82oIycNLEm9wma93PZiaVTg+eH2S0bMGp5
         /5otz6FuJRDO/6VJcI8pEOP/CyqqDb0M5tiVDZdHC3Uz7A5ralkwGrOJaGBD/cIroVeI
         2cUBH6yojBXpdDuxYNBLg3XPKbaU6O41SIHN+RXNQ1D9ZyX26F5uUC6ioK2gHcL0jm53
         5Avl5QgRMuFhX7MW9lJX1RBU4TJnrTJgLz0TYbsoQE6Bu4lt53jb9OxJrM+4sM/iZc7m
         xESWzY9gaJVc2NB1Bo6O558uqpNFd8L2Y5yckB3jOF/Rqmx/oxbKExudboOQQ/eCg3On
         Y7TQ==
X-Gm-Message-State: AOJu0Yx+buyrkZ+Fa0Sp1EoHUkfh6Oe1FMRu7shzHgFhPCbw14itdLM/
	XSbTnSxpIeyLbk/GfoBkFeU7MAj8bH13IQCX9BNgFeByOvm9U+tlqrkqd2CfhbD8692qLDch7lw
	A9NNk3pSjpQSCK9mll15YE1RXi3RWuh5dJrN1egD5k0WR4gpcBwPfVNPHG72D+Fvb
X-Gm-Gg: ASbGncvuMtOQLNndC7/sd7ZeWeX4tDWdXPd8WUGaWGEQZJC3EPrc/VsH/3EtOAqNbZm
	okxQgWsfNsJMmCNKRksKtnBGaicPyFji1JbUJhjYGEVrQB5ny0FjmkMSu+FBdt59s43ooRfHMRU
	ZT9JXXJvQZHyxRQ8Yrsa2JQVnAd61YJJQ+aGUn/yAgs7TjkvIglmy2H8kO8NvCUPj9Nrb1fd9Kg
	aXd7LgcToaD4V+E97tiH0vaJ+ycgLZQu+FBEl6DKTpRg0iVjKPzRSMwRh8PFIEPijikYJSQ9Nkw
	VdMlGA6zOimvCnfVjd1ABC1r6MUpGWKAX9z5N4OK6M/zPY1X2X6zK+BmIRajCiPK9oIBQ3mMR2i
	tj8UItAhHcfgJjV/+3XhE2/S5
X-Received: by 2002:a05:6214:262d:b0:6e8:fb7e:d33b with SMTP id 6a1803df08f44-6f4cba43cccmr52613026d6.33.1745603241721;
        Fri, 25 Apr 2025 10:47:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1y/cmX+wofdmApf8bVZN1nkDanwc1sGDomhzutzvDrC+emKmIi5qJwN4N9Of1eH0a8pSzXw==
X-Received: by 2002:a05:6214:262d:b0:6e8:fb7e:d33b with SMTP id 6a1803df08f44-6f4cba43cccmr52612466d6.33.1745603241240;
        Fri, 25 Apr 2025 10:47:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:07 +0300
Subject: [PATCH v3 07/11] ARM: dts: qcom: apq8064: add missing clocks to
 the timer node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-7-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qxwwAQssnBZBBVKru2sbCtWxws/ZOFEbWlTaATtYoOk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qaAADJ0lbCiZwXhskZFM8uo214/Wv+vE9Xc
 4ZpNVcuJ/aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmgAKCRCLPIo+Aiko
 1eUwCACE9zPnyTlBc+5X5YSE7INFDKajrJeYJrqbo+51TuooEwM/Qw7nvb2azH6lM7URIZWHnJ7
 f6EGXoiMs7cXZiPjJqk6ReEJnQFYTJPl2qtzSonOXOuYZitNw8xzKYhghosgiOipOlv6QAXQeOa
 Nsj5qkrLiT8PSvbZ2ClcuFQkUOGT94VcaMEFpTAahsH7UCUK/Vt5gbOM86zybLUQNiQC9WEz4st
 5VAhTC9QerpKDbbrheGJJDs4DCZ5uuJI0L33UECLKsXFn7yY8yTVBIWRn0KcCP1ywgpVxtaHaAo
 b3siArbuFtZqGM9vpawf2jOXR912K6ixrHHPpQqiFQ03FZDJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNSBTYWx0ZWRfX8mzWeP/rNKqz qCs3VHyYKNH0PeNyhJyAfYcDzQyovnj18xQGqHZmg1wApBdsPPMPIaBAO4IMEyE2VQKo5b24sp1 tGO7V5I6taRke1mHOtHknPf2WpwCSliXhIk11UWp6W3n+V2l6m0CeYR4EHH/49/to53ierLePqO
 2b4iydITVjzO+5Yi7pmjQnMqDJtP7fkPj4iqJCHzPJMvqN7jPsciY5nnRhG3MkNJx5dzMtmI/wF tykL69hZm6I3OGerfPeqLhCRRok4b0fhS57hQx49bu/wT8LFKkaCjjXh/klUxD4iirkEMDnUz45 O8+v+oeCunWtw7X4UGFvMblYFjTH0jyFeFZpBtwaQMLsvkpgqu6q7gJYBaXy30xDylNEdvdK/qq
 iVSjKRWL4oud6BlPRQKCoJfjHhnyPrVaRdMAx662Md9sPdbbCe1vAxRt2VGuZzTHxo9flscf
X-Proofpoint-GUID: tYZcXsCSxi10qg5IqJTIDTsrhzFq4wbm
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680bcaaa cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ZANWpg7mVWKCtM2BIo8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: tYZcXsCSxi10qg5IqJTIDTsrhzFq4wbm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=882 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250125

In order to fix DT schema warning and describe hardware properly, add
missing sleep clock to the timer node.

Fixes: f335b8af4fd5 ("ARM: dts: qcom: Add initial APQ8064 SoC and IFC6410 board device trees")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 5f1a6b4b764492486df1a2610979f56c0a37b64a..ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -326,6 +326,8 @@ timer@200a000 {
 				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
 			reg = <0x0200a000 0x100>;
 			clock-frequency = <27000000>;
+			clocks = <&sleep_clk>;
+			clock-names = "sleep";
 			cpu-offset = <0x80000>;
 		};
 

-- 
2.39.5


