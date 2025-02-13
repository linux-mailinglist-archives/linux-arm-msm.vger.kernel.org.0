Return-Path: <linux-arm-msm+bounces-47948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33196A3500C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 22:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD49C7A3CB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 21:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE9A24A056;
	Thu, 13 Feb 2025 21:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NbxLY77H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68AC250EC
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 21:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739480648; cv=none; b=YvPlT8OCNQ590uUkuyvnQyW+EVTrErhLadntD88lFnaNNzJlbI/vFAolNrQLs7xTgVrRjLNcYRMh8normHEdBTNoYIA3zwjg1NDVhMM5gGQ6cakstrLL/Idf/VmUQU4Js81NJc48YKH1uxJ/Ea/Sa/mnGKsIa3X9goYt3qVZ8Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739480648; c=relaxed/simple;
	bh=YRGZnLfEo00umHgePB/lOxUrXp4t6Vz/QLbBg0QP3mc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VXEdM7eYHjzlNgdEsFw98dwCjB7+/2RdMlLj+6+LgbvRZT4lZ90BIyz7d/H9SVbYisukf6g0f9a2EBjNk6Sq06MaU7cAT4JuGxwI1CVt7TAc0dTFo8gobipsADXwy8ICWJ0T3BYSgsA7LGLtYj6q2o1tcRqL6P9O4/eukQHVmWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NbxLY77H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DKVekq027469
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 21:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8VxP/CgXnqLT7dCVI0cxvlRc3vuTuhQDamA
	kGTDrmDw=; b=NbxLY77HESK8z2YTw5p41EtFM4+f1MZ/aI0SAtGTnwKV546D9wr
	i7icOiJES4OIy6pp3GoQaAXzwYxRZ8v2rSDLlnDa1Qgi0TvPYYuQ9K7ncdMvVLXK
	Hlfz2rltDyC5ARp/0tHLquq5RQVgrzNWFB444MR+gHWEENx+UZIGRfuiTHT4XSGP
	GMNCDM3LTkHScSDXFjkxgzzMSwWeuxdVCGeRNDBAW+DIsLCxNt3bPx8MtVYzKj8J
	+YTZgvNDXOw4LNBiENiUbVN9R2fvWPX8IcFE6dPTIT9LcOt5lJMYeZ/wgVJCXHdB
	pdQhYMLbMgKD3yNlH5zb9Zh2x/q1cvw0DVw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sebn9qvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 21:04:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220cad2206eso27405125ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 13:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739480645; x=1740085445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VxP/CgXnqLT7dCVI0cxvlRc3vuTuhQDamAkGTDrmDw=;
        b=oHQWA7YfK/a32UXykH+HuAM7u87sk87goL7qcJXp/lohfUs3lp4iBL3XTjq2yus/aV
         ESubxnG3AVyQclmQkMbHY4dDSECL6c1ahcyfmQ2A6aoZuAMql6zWUhQ2ZE4WtshWcsR6
         zvPmgyFYswNzsPj6y2c1XCMLn+DHtQv2jZ484PHNfi3iTsbLJbE1HhZlIwOpYugLuiTm
         OA+Be+Z8G2yg6DC+ObowrgD5j4jd15TK7UPM4Wsg5+pfFyZVtU3VZME+1g8oiL5vt5Gd
         1alwfu1domoCJA5PUayMOvzeinup6OPW6DnoYrZ66g82bT/o5hEO/4NrBBuMoCZaptla
         WqUg==
X-Forwarded-Encrypted: i=1; AJvYcCVndfH7bU3au6Xr0woxMDSFqhYb8Sla5Alq1fSFaiQLrWcWHIjEhoyHfKIMtwQOFBefXc4HUnR/2cUQ+7pX@vger.kernel.org
X-Gm-Message-State: AOJu0YwCokCjXisXrIMYwLXE+FNgZR6dTVgNC3V6GH5qFExtp/2/llJ0
	gXePXorKH7idebTTX55/Jn23+3aqG3mCj6YyZDPv7Kp6qx2RNKRvQ7K9dALkazJn5/4131JMTSL
	o0Getm0fiAHpgIxNPCcZPDOBBlxR+6W9SDBomfPI3iUHMAM4pHvf/g0ySNdq0PbHC
X-Gm-Gg: ASbGnctXWt7GaBASR4yx8s4OBHtL+S4Yau9TMf9RJwVwIPlGn/J7fR/ofuOJqd2Zmbv
	RMg1w/izz8NU77H0R2N8F8ZVoGrJ059d38DEFAdVw+2lugibC0w6fK/UfWZeaMt4BmkVGiAfd5L
	m4wEVHOCw9FWXvS4WKqfXtkvV+Vjrt+PTzQjl4QTMJ8rFYExp2FuynipMO+fav5eXHNTxoNGsF1
	jkO11z/IVdNbyUTE36lFVSisHPbx/ggPnaA3jYEjQqgk3B4zmgS61+EH03Cf72Gj48gBYeNu1u6
	M1K3QLLApN78xe516VbL1Sc48tXEKrrTCtkEaI/dWeB5vQRCeusCN5cNY8K1IUcYcgv4
X-Received: by 2002:a17:902:e74d:b0:220:c94b:83a7 with SMTP id d9443c01a7336-220d20e9098mr66059105ad.29.1739480644976;
        Thu, 13 Feb 2025 13:04:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3PVefDcwgu/C99h90ihg+V7iq72uwEndOIuPiYoQ0b1DMyzjKKFzPMqJTWrNTXGvhYvMn1Q==
X-Received: by 2002:a17:902:e74d:b0:220:c94b:83a7 with SMTP id d9443c01a7336-220d20e9098mr66058705ad.29.1739480644579;
        Thu, 13 Feb 2025 13:04:04 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220dacfc769sm14339375ad.201.2025.02.13.13.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 13:04:04 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] thermal: qcom-spmi-temp-alarm: Add support for new TEMP_ALARM subtypes
Date: Thu, 13 Feb 2025 13:03:59 -0800
Message-Id: <20250213210403.3396392-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ydGdWB7HEfA0p3S0TDlhnMS1x1jxOkbi
X-Proofpoint-ORIG-GUID: ydGdWB7HEfA0p3S0TDlhnMS1x1jxOkbi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130147

Add support in the qcom-spmi-temp-alarm driver for the new PMIC
TEMP_ALARM peripheral subtypes: GEN2 rev 2 and LITE. The GEN2 rev 2
subtype provides greater flexibility in temperature threshold
specification by using an independent register value to configure
each of the three thresholds. The LITE subtype utilizes a simplified
set of control registers to configure two thresholds: warning and
shutdown. While at it refactor the qcom-spmi-temp-alarm driver to limit
code reuse and if/else statements when deciphering between TEMP_ALARM 
peripheral subtypes. 

Also add support to avoid a potential issue on certain versions of
the TEMP_ALARM GEN2 subtype when automatic stage 2 partial shutdown
is disabled.

This patch series is a continuation of older series from 7/2024
(https://lore.kernel.org/all/20240729231259.2122976-1-quic_amelende@quicinc.com/)
but current series has been reworked to address the change in thermal framework to
update .set_trip_temp() callback function variables
(https://lore.kernel.org/all/8392906.T7Z3S40VBb@rjwysocki.net/)


Anjelique Melendez (3):
  thermal: qcom-spmi-temp-alarm: Add temp alarm data struct based on HW
    subtype
  thermal: qcom-spmi-temp-alarm: add support for GEN2 rev 2 PMIC
    peripherals
  thermal: qcom-spmi-temp-alarm: add support for LITE PMIC peripherals

David Collins (1):
  thermal: qcom-spmi-temp-alarm: enable stage 2 shutdown when required

 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 515 ++++++++++++++++++--
 1 file changed, 464 insertions(+), 51 deletions(-)

-- 
2.34.1


