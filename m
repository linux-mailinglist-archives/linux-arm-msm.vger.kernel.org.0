Return-Path: <linux-arm-msm+bounces-65985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AD2B0D177
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 07:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97D6E1C22BD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 05:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5AE2BCF7C;
	Tue, 22 Jul 2025 05:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IDApwS37"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D5029E0F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 05:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753163470; cv=none; b=hNma37CoxbaO5gQSszSYBxmFcI4uZywHZwSbSE4syOijte+d5qALFrMDCP/CIOeGqoYnAjVl/Ft1POKK/DFLYeLqvpGkQbv4nfhseMjqTmPTEhZ3Gw0csw01dMaNQWbfkJFZfKNzt71e3BJTKQK9ypKLbTXRTE0FTn+QUJB2pis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753163470; c=relaxed/simple;
	bh=LkPnRAX/oeMeE+OrufVGyi0NXGZ0qUs+Av8g3FBETwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EvEgAdmQtFKENn0md9rf7TIKdFq6l/iqCAyWxHr/wnPWxTGFFuKkVFA+oz4qpRGYsyIwdPz/c6M0aeItUcK1lX8orL86McoRRfGudeCbpP33qX7pl0zxfkDqzFq+NOJOa7qIGacSHWFl/dH5YQPesxzDkT2WhIy4hffqUflRTh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IDApwS37; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LIhEJM017492
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 05:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Zhy0MZ1jZ8F7Jnao5FbZ4vgfFLZ3bbYPjtt
	A+SWufIQ=; b=IDApwS37Ixk4XwHAFqXY43tY/gD5HrrQman+UPEfcacdv1A7gCW
	8aDG8quijQ/kja5rF8LB7Jk21PPDNtfbLy4AnPxRcT3YQgP7dzO3s8QoUK8WdjMn
	CveS8xLEPh92kjpza1XADRhjQBvrUXHX41zAgoL6vC+JWxt8UxN8hvNGi7UYXXIF
	F4jrk0cAbhThAPFRg8oYsJW80AKsIcd9srvhjUkFd614lX9XIbu6fHFdvP1q9OYL
	m+mGr1rGOmbXwk5urvBjibivQrVTBP5ioS4dFqWiPEfAMMot4quhf2bzBfHCAU4r
	Xt3sba2P7sR+pbsgicrJwCvkcg5USID8pXA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w1by9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 05:51:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-75e28bcec3bso1677011b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 22:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753163467; x=1753768267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zhy0MZ1jZ8F7Jnao5FbZ4vgfFLZ3bbYPjttA+SWufIQ=;
        b=GJ1Yw54ujf2YDEaRdiJJCtjBIpcJG8BPVdjPdnl1NRpBGmTVziGcKO8fH6DKHP4i8W
         4gz+jgvoEKlXuja/M9SCy+XWxGOJXxRm0pg1FtDFa/ZlvdeO2Y0B6ECjlwqor7oFtaiJ
         SWbDlDRH0HHnM/Mq+S7W73RiFoYFkjz1ViqhnBt+iabui8S83op3mSRzgjRWkRucSYBF
         qBipORbrK5DJwaEVBBerjqGmaFXP3ueJNZ8thcbL3A2LK7Vp/OOFKy9ADg8LwoQsaeWA
         AiLhh/WWend0Ww+RUw/wqiJ8elNfo+WFnw/x+Mh1Aa9PnVnQGSUCgSITcsRVhDjxhZah
         CLlw==
X-Gm-Message-State: AOJu0Yw6Yco9AyNJ2qE63lFygiNaR2QnRnlGpqk427PwMBTE8gs503w1
	taDsHZbsnk18MInk2I1pARLdPPzAUo4htgml9zY5KZHXsqlEkeVVPgm0LEGTW1kajqV72IYhnCZ
	plgDVv1oajem54AHYIeASUt+Lv88DFE1ePA1TtlRNRAZh169SzeFUwnEPTUyRkirOmKPI
X-Gm-Gg: ASbGncurF+Ds7GX3+jnQhQ9Ej0DPKq+/hhhBG5omNK2vsNs4mWGGndzBadXPSIKRb0J
	0CoM1HB8H+xbK/zNSINkfgCdXGwLAyJNFkxClmwNwXdtxUdgO0ReElgxN7x/CsTcP1idcNZIaFh
	2qHTatrNqeJFGrCBS+//vHYfFze6gWT/Qd78qHHjtiT5D+y5PCCm+o60iNhsstv+H/uI2ieJ7Cp
	9PLupE4/XYkVU+3QueAKPH1+Eclz7p4NLT83W0+fYnte79c/7hV1Koa35IsCG+duowfHrd18lH9
	1JGikt5wlWy/xRoR55jrwqgd+Pydl6rusp0YMWVzHvuNeKbVnvqRNReEQjbetij4VhhPTiGt5DY
	aH2w=
X-Received: by 2002:a05:6a00:a8a:b0:740:b5f9:287b with SMTP id d2e1a72fcca58-75723165190mr29279615b3a.1.1753163467207;
        Mon, 21 Jul 2025 22:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN6iDLyXNCraZNT8x/1YReDJKwIOmpbnw05LKZnQXeSdXkn2GEn4y/ij1foKWlkejDAgwPZQ==
X-Received: by 2002:a05:6a00:a8a:b0:740:b5f9:287b with SMTP id d2e1a72fcca58-75723165190mr29279568b3a.1.1753163466699;
        Mon, 21 Jul 2025 22:51:06 -0700 (PDT)
Received: from 2603feb0d442.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb155e0fsm6669136b3a.71.2025.07.21.22.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 22:51:06 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Mike Titpon <mike.tipton@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH V3 0/1] Add EPSS L3 provider support on QCS8300 SoC
Date: Tue, 22 Jul 2025 05:50:38 +0000
Message-ID: <20250722055039.135140-1-raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687f26cc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XhFW2igMmoW6a3705fEA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA0NSBTYWx0ZWRfX2Y+BmtQZsXu1
 Wm4qR2jfuiApwgYfR8M4sjKMyxMbxzwQ8rXj0ftmhu3JWe6+Y98jETZpfbi9USEBcqZnjx4zNOC
 eh7AmbBmDOmIYwucHniDv48T9cRTjMqWhciKY9q4JmngrfU0WIfwh09FqUxWLhCxkBUPHmrgRR7
 eHPd1JwkprYrrvmz+Ebafs+C+lvB0THoQEfJZopvWUnHFLR7Pn4eWO4tovFfklyN0ypA2mTmWG2
 bCKx3z96yAlNA3x+V0fXY1hBiJO2LURu89CZaAb2rjOXj6gd0ZHzeEHQq45uCjQb/MK0VUgpIp+
 1ssksbzyYbidR+DywwUBv40WyTIkJXalgG43x6TccU6XiwKT21VdkoVstimMAGfEn9g4GQIZTbK
 +F/kaW6fWI+VI1yRoK1/PO/cfL9ucuYoIWEHhp+FKojM7lWQ+Cx1kEXrj2iMkY4RNMRg8GVW
X-Proofpoint-ORIG-GUID: tLA2TYkk4aJ7t3HOlepoBYRr-TmiLt50
X-Proofpoint-GUID: tLA2TYkk4aJ7t3HOlepoBYRr-TmiLt50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220045

 Add Epoch subsystem (EPSS) L3 scaling support on QCS8300 SoC.

Changes since V2:
 - Dropped the dt-binding patch from series, as it has been picked into
   linux-next
   https://lore.kernel.org/all/20250711102540.143-2-raviteja.laggyshetty@oss.qualcomm.com/
 - Squashed EPSS L3 provider node changes and CPU OPP table changes into 
   single patch [Konrad].
 - Link to v2: https://lore.kernel.org/all/20250711102540.143-1-raviteja.laggyshetty@oss.qualcomm.com/

Changes since v1:
 - Removed SoC specific compatible "qcom,qcs8300-epss-l3"
   from driver and used SA8775P SoC compatible as fallback in devicetree.
 - As the EPSS hardware in QCS8300 and SA8775P SoCs are same, a 
   family-specific compatible string for the SA8775P has been added to the
   bindings. This avoids the need to explicitly listing each SoC in the
   match table and the family-specific fallback compatible can be used 
   for SoCs sharing the same hardware.
 - As suggested by konrad, added EPSS path handles for CPU nodes.
 - Link to v1: https://lore.kernel.org/all/20250617090651.55-1-raviteja.laggyshetty@oss.qualcomm.com/

Raviteja Laggyshetty (1):
  arm64: dts: qcom: qcs8300: Add EPSS l3 interconnect provider node and
    CPUCP OPP tables to scale DDR/L3

 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 301 ++++++++++++++++++++++++++
 1 file changed, 301 insertions(+)

-- 
2.43.0


