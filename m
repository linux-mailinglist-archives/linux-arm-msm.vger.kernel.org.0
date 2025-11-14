Return-Path: <linux-arm-msm+bounces-81874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2ABC5D656
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 569394EB230
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E74324B3E;
	Fri, 14 Nov 2025 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dycCUcrW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JN0RGHM3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D652C321448
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127514; cv=none; b=dqpoa7YpdOc5RgPyJ5PehECqKJQ2WJIKhG3LmvcwZcpLrNfstkA87A45Rw5NTkmalR+HuvFsOuiuHJTGDzHeD+ezk+4h4AHiVOzDuF6Vh7DIz+0tuM4zIyCNivjf+u4UkkGDSlEd/sLU4KpgDVpyvaf7z6CfJg14cXQOlxEmZuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127514; c=relaxed/simple;
	bh=VE0jQr1XgPvPdJrtPrn/PKOE3cJwqZ+R10C6ISVqTkg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ss/PldgargayH5/cgmToI9ub+eF3oOWPKsVsHAEcjUzLuPgqRCLMGQViERpe5OwErtoPWpt0skIlBIHx1PMg1LZDAIXYsnWXl4k6zMgiUkOYt89Eu3aondEp+xdV3C6/KmQ2h26Q8PhsGMg/gLKgt4eL+cp74JrYyotgBxlQxD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dycCUcrW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JN0RGHM3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8K2Jn1629395
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+UG7dCVVsUR
	CyP+SKrMMs739w8RE9svmqjIeaGHEcfM=; b=dycCUcrWlghpV8ddIbv3ljKdtbt
	EHl36piq1UdLmrV2tPSznsFIajMhixMVxdRt85NUrq3gjZH7vIGal4ZDbEy/3IKN
	TaBBf5+hcbyPAS6Rziin3ErCsUpRt9NArBqZ5irlGjCaG4lxfotKVyR/99FO9c0W
	OiNARUi30AFeWVbzbXT2k5bNuHQ9G7ZQXa1zKFYJ09tLlFd881pc7VI4Md/JUB+Q
	G+G//3chfRxns3VFMVUsPAxCGVz5r19LUHzWzKumAKZlDimRUJ6OPqlDSDu9KTu+
	16xP0Nhr+KqWK6xnv5OLgcBmk6Y5RoiAKP9ba7CDzEUPikBl1exMDzk+oPg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9daan8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:38:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6466f2baso57085961cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 05:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763127511; x=1763732311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UG7dCVVsURCyP+SKrMMs739w8RE9svmqjIeaGHEcfM=;
        b=JN0RGHM3exSSFXM0hh8puPit+rbX9haITJwO6BarOKlWgOiHTNzLF/SXAwFkghtXvX
         dnKJeY9pFeEqe2NDjmLtQfUw79T589NFSdeUyS1XezuxxzcfiWy+ImEIPRzMaDoB1D99
         11D5mh/lNjQDMLCaMsN0Scf84/1Qiez0TpCSal7bZmTqswtKphsDQhHapjkwTgnlqB1l
         mxcYK2KTJn5a0fcH+ro0kbROXwnyWSFraGKJa+gVtoyhM63ScXYRbCZFSphWFJHELNic
         F+6B/Aqje/3AESGs4Lij9aVl21b60vxSFDVOyfP/btuGHLGG0qCvQnVBXzdSxOgZnLre
         p2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127511; x=1763732311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+UG7dCVVsURCyP+SKrMMs739w8RE9svmqjIeaGHEcfM=;
        b=nQ7hqqif4AWgcdrFftdqoI69ZZneIv8hDFIa2rI89pu97ODIWsPrcNQByp9ilGt+K+
         bHOiB47mDNpnKbntvbIsgTeqwxfXgWAKOVU56wmj/ENljHA1xMb55n3omXObNYxRcT96
         Zc83OqNh+kZKpcFk7TtJ9890IE/eVbalQqIfuTaHmCBtTAZZivk1tiUKlgxlcDaLz+/h
         HWRYKnoKkUkSItx0fhwjACODw34yeLCAgXBLPT6hTfGIZ/a1Twcbd0d7PLo+tG0HFVlL
         WwjGZkd9T2PmvljWvgyDpJYDXCdZTl0GWTD7dTREohIJr0QaA+op7o0ES5C/xs63g6QQ
         2XgA==
X-Forwarded-Encrypted: i=1; AJvYcCXG93C9pxCx9wd1a7ydJEYLE/LDCOeZwGhRQONxPaKfhG+PfbZl17kP7oRZSs/308LoUxzgUeRfXgqFUR8t@vger.kernel.org
X-Gm-Message-State: AOJu0YwnN1bUCihZNgHRfq+QL97edonRkgtSqgRvIcdwr0luSplIduS6
	hXqfaxyYlukK5wccFI0OuAU7rJaO2052xKQnG+WE6ZT5afLuo7W+VYvpHyPHXNNb9xKn90JoD+b
	mbahMwG4p3ZHsDX/4dd/IqmPtIQUEZXyPcObSsIzmv/bRe3VVc41coZv6qloFQWBwmr0t
X-Gm-Gg: ASbGncu59mOq2/xHb1kWE1ISgbe7tsRNiObBSZWD5al099xQQpP4Szz2f8ZZGAFRxCD
	QmVHw75aUFNw2J3/Cv79FtJ7lHOXGzsjaqQPZOY2rCWPRsY+yONiIzJdElO9+xhr9mjqrn0+p/U
	KOYVm1jMzZP/X6qqgW7rsMojzaiRvldr1vTm6mevymNlTQ9w4vcAwnhp6c7HPNwo5bJJgpVME9+
	ZveKVVVlNM/UB1+VAlcsHaIlvnpH5gSMO9qXNVfa/2Zd9pQAOFGbbd4VaDaMaled3SHF/CwCPI9
	ltJjui5trJORRBGE93xMc1wR5PhyFx30+oSAl1zL2esDUIscW3S6lmev7/Ymjp0oytGPGA5X4yS
	eqkLv35eMDbwKLY0dNWN/3iRi7DO6rCYN9nHeYclzxCHSVGtVTXIbZqDGJDVsatpr+g==
X-Received: by 2002:ac8:5a83:0:b0:4eb:a2ab:4175 with SMTP id d75a77b69052e-4edf2129abbmr47268661cf.39.1763127511289;
        Fri, 14 Nov 2025 05:38:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsTcwOw9SG7FV7aUrdM0DX00gqSc7vI3ixogZBE4EFn6LNaP7+Sm/xLVmLNvp8heQzHOmZGg==
X-Received: by 2002:ac8:5a83:0:b0:4eb:a2ab:4175 with SMTP id d75a77b69052e-4edf2129abbmr47268171cf.39.1763127510816;
        Fri, 14 Nov 2025 05:38:30 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:a4af:3f59:b032:5434])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4ce83dsm3659659a12.34.2025.11.14.05.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:29 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 2/4] arm64: dts: qcom: qcm2290: Add pin configuration for mclks
Date: Fri, 14 Nov 2025 14:38:20 +0100
Message-Id: <20251114133822.434171-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nFDe02rAw9zenJyOLultOJyTIwBxLjnQ
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=691730d8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=gjCkitBQ8UzLeNF7HDgA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: nFDe02rAw9zenJyOLultOJyTIwBxLjnQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEwOSBTYWx0ZWRfX2xVP3WcBCWi3
 2Jv0U5sNtsSLA5IPJaNj+JGhFkkO9Bj8F/x7z/NXz6OASpzTdCW0go1nCh62fSrSODPPc/+cqiI
 tcfbVWL1yLzQwHAm818Le53+MeCdSC/6SCWszMmtdothEuQYivfGbppneyKUmtZuF7RRSyOeT6E
 65vdjf84ms/2/omOuYWwQMAuaWqoitKyHzS+ThcI0CASYVjI24gsn46ucmjVXL63+b0M/bjxPxh
 wKk3spHbzH/nrrZXu6DuWj6JV6Qa1G43o+mhoOmtJCbiTXni3xMR3AfmgDuZ5yY32nqv4XUmytB
 MMHYRm9shkKh4HZGmNurljZwwk05klCwJvbTQLSzhMWG8zY8Zxi+k/ZItysyDsziK3uMJ/VShcc
 CuM8cXV5ALjw0Yu/mfABaM9FTZ3ICw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140109

Add pinctrl configuration for the four available camera master clocks (mclk).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8bf5c5583fc2..e14d1f444ab5 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -597,6 +597,34 @@ cci1_default: cci1-default-state {
 				bias-disable;
 			};
 
+			mclk0_default: mclk0-default-state {
+				pins = "gpio20";
+				function = "cam_mclk";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			mclk1_default: mclk1-default-state {
+				pins = "gpio21";
+				function = "cam_mclk";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			mclk2_default: mclk2-default-state {
+				pins = "gpio27";
+				function = "cam_mclk";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			mclk3_default: mclk3-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
-- 
2.34.1


