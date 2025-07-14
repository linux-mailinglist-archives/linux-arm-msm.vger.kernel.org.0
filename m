Return-Path: <linux-arm-msm+bounces-64762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18919B03738
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 08:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 784FC3B7890
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 06:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11122367C1;
	Mon, 14 Jul 2025 06:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzaPNvSO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8942264D4
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752474731; cv=none; b=bAqFqrTjwRJTczZ4mTGAwH5FxrvZTfsKCmDJP4pjOuPp5AFd3ENJoZzL6bmavKNZCpoAYhXLjOyazz/7M19HMCwGhwUyLeRvSm2gADwG5BhQzDYUUseCFhcrY2Fo2OVKAF5Z+N4+3ZqlCXqbrhxBPhtU3nl7gGK2KCHv0pCL7nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752474731; c=relaxed/simple;
	bh=f30cw/8H4EXiyHfPv/hWpyXvXZsxpbdm/rrj/jZvh1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e2fo+sfButbSWwpj3VgGnx5rrPlMCHaJr6kINQetUPDXw3uHMLhrj8LoSiKzMLCCi9QuFnI5ft45ALyGfzCCoLnltCh9LbNZ71Xhshrns7HJfGUtnitOQP57UFKG41G0OakpZ4iOFzvOg63xNeZZkiXx232yiceT9xaIQFst9U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzaPNvSO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E1EDYE022513
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k+EDEHFqKkj
	GqN2StGIjjiSlDJT77CrFI7R+bA+Neo0=; b=BzaPNvSOtqARt6VACorz/zvfbzA
	b0qI6FZV7SLT4wlmUKQ0twErYA6NiylGBckaVy2+2sDPTsiWFHll5YtoQ6wNp5uY
	LxngP/iTZaMCH1U2jQC+eX7eD9WwPc7FT8NI6ZZvVtReQSbaPLhdlspmtR0NLf/K
	ahtgfWcJS+K1FxW6JccDFKGwT2p5YKbyU3lYFCCKS1AjBz19IEiFuVYK6YrPlzAx
	rG4r4WNsMzer2602CUK/uaSNLWRdd4/T9CZ/rp/8/z7PMwmFzMPSKSJnkx4aKg5N
	ei9DcjajcjQczBjw1KUfNbDvgYRm5ssMi0sBiXv9OHiN4T/hRmAaq+6mGHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxauh8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:32:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235196dfc50so39812895ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 23:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474728; x=1753079528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+EDEHFqKkjGqN2StGIjjiSlDJT77CrFI7R+bA+Neo0=;
        b=eJtX9y33CWoyc6MowDOJhqrkLr2kBD9QrY2apRADVBl7HPJtRsfc73lhRsClMNgx1J
         Hueq79hxV6z3XxRFiZakv4e49JUoItr8YKY5YGo0EwamxZl8XTTUlI2mIDZteqj1T9NY
         eVAFJUkUJzZnsYsH/Zf29mcIeAxRkPxzwwnPfL9OdB56SwAN/XyJWXXccSh5pFUX2p8d
         55OCkc4drN+QHcNkILvGZJpijrQiXBJG8QQb8f4/1KgPSmY77vNlNpnJPvGn1glLKLO+
         PT8Z6PVLm5qFuHTrj8UodxLXuecXMDi+KvW/it8NsVJQqxyfiDWpVMaP1tzPuM8cNgnx
         MCOw==
X-Forwarded-Encrypted: i=1; AJvYcCW84iNxSII0CKLuDLZcS53MU4ur5yhHmWVKYLUREDcpwtLx9+M+ZKzKVf9ra/HBkKf2ig31INx9pylXBb8S@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs4Zu3ythllgIszJqVki7caRvBaannybs7pcRpp5InS61JP3+c
	Vn6KBoTmHFVeP9Uh43kvRwRDTi7UO0njQnMIXza7qtar/BDCjC/58uuY/hgGAe0zv4spo2Sue7A
	sA6X/LpUmGkfymu0L4OpqaxkCopBkTQ64uHlylpkQHhyr6fSvRB6IWacY/tq8wujXXQ9D
X-Gm-Gg: ASbGncvVJjgxC0ccWP8VhjGmvjLCVM4U8l0g6s4rkpQvwdUM8iapKKFF8FrsODriivy
	Y3WxQkN1ap/xkJ6r1ekZEN//fjiWPSjr+FsaZqQIFul3YQAQ9YUNQYPxRo5L3g6m6mw8GyXO4ra
	MaDuG0BmPyQLb0kHRDK6XApmt+4PpEiKBoPiMVF4tlPqYbKwES5VoYzoxgUnleS+6I+fauBk/FS
	mLwatOC0lzk0MjwBKXvuXkMlJejTiZqiJNqUXTPtWZaq1QyMa5BTZ/19CTtg8CCoWCWBy7cKpRL
	DYz7LRk4EJw9XmPH1urQiWGTPLcuvDDWG+dCcvZyTSXBZRmeDp57F7XXKkcXxVYzL79PUr47WHU
	wa6Sf/+IEtLqq9cflqGtU
X-Received: by 2002:a17:902:d512:b0:236:10b1:50cb with SMTP id d9443c01a7336-23dede6f4e3mr166292095ad.26.1752474727922;
        Sun, 13 Jul 2025 23:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZiMGZ2Um8rFarD1TkyOaULeiLVr8nn7BvvzuTr6cAcM5dJp7mM9PTOufZBS7vQqZLdLPSoA==
X-Received: by 2002:a17:902:d512:b0:236:10b1:50cb with SMTP id d9443c01a7336-23dede6f4e3mr166291695ad.26.1752474727509;
        Sun, 13 Jul 2025 23:32:07 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:32:06 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 RESEND 10/10] arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
Date: Mon, 14 Jul 2025 14:31:09 +0800
Message-Id: <20250714063109.591-11-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eY7sOlGLRGPwrDpeLTR0VmVc28dg7MS0
X-Proofpoint-ORIG-GUID: eY7sOlGLRGPwrDpeLTR0VmVc28dg7MS0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfX5oiObYWcaTQ8
 gq+s1VJjhyO1XlHZGsqU6kHD4xJ1rADGGJvOPxJRUz4aihU6dvVtcvIfQohvesnF9KBPRd49O93
 x0XnNiYcH0DkoksaZVbogWzAoFfESaym4uHgGHSHrjXV924cFsgbVqkg5OLrGujv0hgnlcU0Koa
 wlKELfGwoACHrVBEbxhFTsbiDzXi+xqcokfxQ4RulKkzH6ShiUT49GKyhPWrwM9pjpzpGpRGT0M
 lHrbUns+poyOM2oOvdVuLJazRSZLDS2wzyEoYwhYN7rpJmVuMODvhZWsEwP6MkW0WSlnnUqCRia
 wYD2sDB4BmZ55WSDqlibXREvkNiEEn0L+bq8ct7AImNgw7IHenLQ5dtfg3sbv7TlPX5PWK+GVlz
 +Jd2cGyY9CLQViAL7u+va7r07muQ+p6YmBNw0NfUNCvfBc9FD6rHZB2MeG+YMGZODAJaplLv
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6874a469 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=825
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140037

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index fed34717460f..44da72cebcf4 100644
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


