Return-Path: <linux-arm-msm+bounces-81782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBF1C5B7CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 07:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 981BC4E2497
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 06:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFAA72E5415;
	Fri, 14 Nov 2025 06:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZsqMMu9M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqK6k52g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E172D9492
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763100970; cv=none; b=BMg7iFTES74oVdgVzZrb41aNqV0t4GhifCJiYEGbbJYqHNDV+r7oeZdn5sT/kfKpChmeAxxMqkPgsiG7HNoBQWF1G9el5o9bomAV/Oumdr4VeCHsPmDQcY6Kp4QgXoPw0tOWGksrT52NPsYGCKAyVeCH5SlISs1cMM4O/YE4I88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763100970; c=relaxed/simple;
	bh=lzspXziTdgn0Cea7T9rmiH89Fok0gPV6BgJmXu/xh2s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F32vySMEHyPImTuuq/wp3FaMrBHVJJc6MecpCsmh37vkNF9fKsF/nDObGxcFEKn/Thss0nFnZuK6c3PoWavzYdBB+JQWfdhDcrW0TTEkQ87KiZjASXfuptu6dg7ZZ+JoYzutaB4mz9u0a1rf8Fq7Y7unKNA6TBEeOzxfzMzJd8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZsqMMu9M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqK6k52g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE41JnO2263228
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uRl+utPI2ESTxiGrMAr9/9e8pl+qGMmrPdv
	jRrG1rrk=; b=ZsqMMu9MmCP42JwAmIWi90wPMLQ3sd046ThmXYJ5SoeSSSfWAOW
	MHfXfn3aR5i2kqnEMVnIVtv/py6S0bAm4GZnZjnjH2bJMUVqYdM40LKxv/LyaxmZ
	JJNeQdqMpU8RifM29DKYupK7ZYonnQI+6ZUzEVzRYyguCHu2L1CTQx2S3TniLTrp
	Mrx/0Ct/IK3MAEVTUKAQ+ZVLl0xwh6Lw9UlTuy3+ycYdKW5ALjV6Wlnk/8pmyVx0
	wxheoajKKBNsTI2CKJA3TCsh678MigaK3F5PXT5Gv+bnzr1EHAvi58xoW3NjtvuY
	WJ4xwzI300Z8Ew5+2ZbIZYAENzduYEtvg6g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adw1j0a15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:16:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a4c4eeeef2so3335276b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 22:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763100967; x=1763705767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uRl+utPI2ESTxiGrMAr9/9e8pl+qGMmrPdvjRrG1rrk=;
        b=QqK6k52gkGUQ61E5hTR/VeZ/IyboEdMBHZR4mr3MiQMCIUW9rlIn8xa+GTRIsThdsc
         QxShfk015dzu++uJjQZqztZMm5syu8e6JXil01lsKdB/fkaiWEVNHjJa2+P3Xi0QCbNM
         imR+NBN+8UyEtVuvG4MTpwLkVOLSQp/u097mn0oiVrfK2xLf89hxe0RdfLfn2Xa+xiyM
         nE5yrHLOLlGYdf3wYgeivkC4CcFQ0WGLKPKI7IC9sZuZqmMdeyPXGvPE0VGqB+2DIjcM
         NUcaXMU4YFAioxUXBJP4Tl+J4a9fI7T1e1lPrO6cjHTkqnjr0JGvOQOY+jCLkYVnCVY+
         ey+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763100967; x=1763705767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRl+utPI2ESTxiGrMAr9/9e8pl+qGMmrPdvjRrG1rrk=;
        b=h9h4l7KaLAsymSEOG4BinegZVIGHRoPHfZf/OUr61kO+sA/20tJfgNN8GpA3PsNvP7
         TuhTMnMTZepspgWZwr4byp5kFBxnoovUCy8LG7ao+LhsMPpwM0udBSPa1Iy0OjmNx19y
         0hI9huLhaiSqgd6xPuzjGUoDIsApIOXudZz3HfO7KhCAD+vmkoGyGpEGUGpPEdGRgsT6
         tHVoy5bKnk9/ugQ0+t+ffsHIiJwdVU/kXhl+x0Jmd2X/lEyepdpxyIhv3wQE2f7I9b3r
         0AcSKbtpE9rlRT+fpNODS449db40WLNurFrGDYFta3WeUss7T8jb6qsPIxQZX2UIJZSu
         U/FQ==
X-Gm-Message-State: AOJu0YzQ2gqXLKtj3Eb1F2JZuDzjnRYinuHGJ80D7+w2iltpV//8F7uE
	hL1pA/exNTYFJ+Euez5M7cF7EqghXLroQsh/xrkP+LpLlNwS1Cco6xP4bUBtbjxWVQKTmcIcL/y
	RKkYV+t/E4Xv5QYrjWJiWGVKxDnn6miIB2BuIhbW6LDLZgBoQ35isY9CFGLFTASwcSa7OjXD44j
	Iz
X-Gm-Gg: ASbGncvzNGagTBbJqVbXQBDUQXvSOTXKsPHN9DmOaySFyh+I+zqfFi5WYRINDKLMKNR
	kFsvfp+mwh0+yxK/7Zy5zffECy336Tw7afyz3egVhYHXftJ6cVy6MjWj8F7Hcb9arosi3If95KK
	KEZgnfx8bAmUfuvF+w5QCtDBXBM1mPfms/Sq8hTjHCy3Vye/VJMTnK8/KOpprj8bPNWrNbv5O7G
	ahi8ghSzsDoaB+TPa1+25tjJ6G6+d4FBHhWDMUSXRWTV5/iRdUwStFubb8Y7dlnc/Ep6Eqz2xEx
	QgHhRq3n7wQP30Uw1YyuEdJaKH/RieCLdYIrSafAHKRHTIwjCZy3lXCKmmz5AgoQKKgriZZ+d4s
	vZ/oMnZY2orpYlwXUEG/Eb99UO5MbPVc6AaMo
X-Received: by 2002:a05:6a00:951b:b0:7b9:420:cc0f with SMTP id d2e1a72fcca58-7ba39ed0d05mr2756710b3a.14.1763100966791;
        Thu, 13 Nov 2025 22:16:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrT/nGcZ58o1kgCsm1SepnexOkvgACqlLnHH+9G4cbqiQIrgxRP9E8s3+O28v0YEFKkRzDyg==
X-Received: by 2002:a05:6a00:951b:b0:7b9:420:cc0f with SMTP id d2e1a72fcca58-7ba39ed0d05mr2756676b3a.14.1763100966318;
        Thu, 13 Nov 2025 22:16:06 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927c22b1bsm4021223b3a.66.2025.11.13.22.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 22:16:05 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Flatten usb controller node on SDX75
Date: Fri, 14 Nov 2025 11:45:51 +0530
Message-Id: <20251114061553.512441-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jv38bc4C c=1 sm=1 tr=0 ts=6916c927 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PrDDkZ7J-wqMaueNrtgA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA0NyBTYWx0ZWRfX/53o9Wf0JQRX
 dt8kd9InEzB+FtwvdZJGYlvJYl0l9oA+1R7LpKibKjX+zolFYPwZP9caoFG8xbiCWedMZiqg0oU
 ZS8cS8C3qtdDrHPjE9WicdozDPZSp1AOVJuufseCSb9e8UKCd4mb4kv1I1L0tebuiFa41eiRe5I
 /Si/04nflAw1K+gPmab18xpV5bfPHhjd6NUo8mtx9a306vhle14atX5eatrUpR7eGDRMyr10rl6
 kh0TNjCKNARFrKcfM5TfgNGURlU02u3vSoJ365SXwp8XwD+NyU0D+Y5c4wThbp7WOa5/lj7cIOS
 IV5jzrJWKmHOetLde6MmIwx1SFbesnAYs0bTz2RpJYB/c0NUc0I8wSRo0oqCOHI0SWMkBQtMD7D
 YeQB3bo4sW7+IIJTeYMVNPGhDW7RKA==
X-Proofpoint-ORIG-GUID: h6jLOVAoGZaVNX3StW0_uT1dozHI3Mvr
X-Proofpoint-GUID: h6jLOVAoGZaVNX3StW0_uT1dozHI3Mvr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140047

Flatten usb controller node and update to using latest bindings and
flattened driver approach. While at it, add the usb-role-switch property
to usb controller node.

---
Changes in v2:
Split v1 patch into two parts. One for flattening and one to add missing
usb-rlole-switch property.

Link to v1:
https://lore.kernel.org/all/20251113084608.3837064-1-krishna.kurapati@oss.qualcomm.com/

Krishna Kurapati (2):
  arm64: dts: qcom: sdx75: Flatten usb controller node
  arm64: dts: qcom: sdx75: Add missing usb-role-switch property

 arch/arm64/boot/dts/qcom/sdx75-idp.dts |  6 +--
 arch/arm64/boot/dts/qcom/sdx75.dtsi    | 67 ++++++++++++--------------
 2 files changed, 34 insertions(+), 39 deletions(-)

-- 
2.34.1


