Return-Path: <linux-arm-msm+bounces-50287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D353A4F11C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 00:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55B373AD7E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 23:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5303925F99E;
	Tue,  4 Mar 2025 23:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZER8gjj3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0204279323
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 23:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741129509; cv=none; b=fHIemm6ENvCG8vF4s8ZJwcxg5DSp0n99CzpaQ48RnOQqmRJ/DGNIi2wb153ZvuVbsxo/TZUrDXF2xMSMJfzL/+MaIS5oynC+vcTx6Axe26cjzWC3n2OeQW8O2Q/bNztN7Sq4JglEtwsgOeKN1XT9op7X85Pm2/OaMG92NtUWCxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741129509; c=relaxed/simple;
	bh=JQep0ZQ8KR7wNqUuL8Umc/S8sL+su7GsAMhW1J6fjnY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nOp620I7w4RycPYH+WJg7EyNSs71JkGmIui91YdjaGIcd4VFGDYpgZz+mrnfw/15QjRikeC3Czc57yjRInLtc3jFi3J6U18TsNQWMPMRnKVY20CTenbGaB5lY5DM+cXojTMuwjbsfGkjznTKzCGgj521Gxg+mTAZ8tC3k7IHEd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZER8gjj3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524Ji231021535
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Mar 2025 23:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+k0/7n0ayENZ3P/X9hSe8bRKUyB6TgoFwbi
	S2F0zQa0=; b=ZER8gjj3fegQ5557Mwhd/DZXTAYmWRcKH27hvsirMInc+l1YhcY
	b6mHAHKpWNti76lytRLtG7wlMPgEsvymFab9trVlo/K/3fYRez8tFjkKF2+xnG/n
	eLbgvKEPyv4a5EKUS9uaEKSxNk1/MI/2YBb+x3QQl16GxqDi0M8isP2e4/fMIQU9
	qF7X1HJXXhR1D82beZ5CDWDT/uHsIu2vp6+4MHVfe/Ycs+T90upZJFn8hqJvGRgv
	1xJnPUHBRR9akOYfL7KcTYo1L+dBqrP8L+NV7CpIkEIlsZwu8SOWGl4Obo00ap6P
	S/8GuyMpXjZ+zkjYpel5228Vy7ZfuJueSMw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t3fbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 23:05:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22379af38e0so66027815ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 15:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741129504; x=1741734304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+k0/7n0ayENZ3P/X9hSe8bRKUyB6TgoFwbiS2F0zQa0=;
        b=m+bpaKAUoBvj/LKfG470IqZ7u+udSAKySK/a+o1pGpffPmkZn0wp55pgzBBRD3dagu
         75xaEE77NF12VRrtk+oyTGWHx48uUGX+3Ce+5G8rdCeV4Oo/phWBXIFmY8KBFbJU1EBJ
         A63otXMP6hXzAu+mEcghutq/Hdx/0tDNud+LoWScjS/wHoPe7HXYXHAx7yUXLUG8Gt0j
         YdrLlMv4ckimcvOIcPOe3Pg7oxyXXRPRmU+t4TgCBxBU5gmvmHLU/5j8weKTMBBgh2F8
         uNYFOIEJ22Q+2LmtqA6hlmYHLr3b4LAd8PhmNHYENn/kuhqNCjm+0jQrcSnz6HvQljS5
         TXsA==
X-Forwarded-Encrypted: i=1; AJvYcCUdRttm0rYwwGJ9SiD4S0Xmd6+2K93ImGAk4r3Q4eA/vKELZx4d7DZSWRBOVUk4T8ghFNBGUpS8rkCMNPKZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Avl1Z8dG1EKFIna4rJGQ1lpUMSpWVevyiFMtqGjL4NkJijyx
	oCBzo3KzCuvqPl2naVbFUilIG2R9nigZxeDA582UG7vIHoBhPBiKXt4yS9V+opBoWhf6wMgOyLW
	7b4vAXBBOkT6dTQ5YhPE59+eEEXIaFl+HO9yqM28Khsfk8xFS/W4RRiHIaUADFzzw
X-Gm-Gg: ASbGncs72SCGwOTFEv6bNZkaYMS34e9LMxrURxHS1wdQsGtQwAj8FKVRA+Au5GLEtwt
	Eowsb0BmQgUYwUaP5+P/EAjD7uI3Tmb1sbdQSOH3Fv9GIvExMtoys8pRvAOFPHSyvsv8OPGTmA6
	sIcYKBN7XOsvzSXSllR55nGySIhrBJiHE5VKs9vGvSAeFvBqLaFOryacoIDNcQZDdiZz0bMBQre
	xI4WnP2s2IF/jrgMyIJmjLuF4HBetPtlzvH3gFJMdleqES1jx5NWl/cPc0dRiozE6zGw6er2bXu
	Ad9fPsNiHhnye/Wm1or0nSsY4hn08kU1NdO6WdPd9lkf3TZgyawv2fCu9oZYNZWB6QfpfRFXME3
	Tdyw=
X-Received: by 2002:a17:902:ea06:b0:21f:4b01:b985 with SMTP id d9443c01a7336-223f1d3a25dmr15090565ad.45.1741129504151;
        Tue, 04 Mar 2025 15:05:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnGhUpQy825/DMxvlXW2Ue+mmydLdhow3pf6c4GZU71xZ3fvsbSsXGKnIpJE8MZcF6q6FiqA==
X-Received: by 2002:a17:902:ea06:b0:21f:4b01:b985 with SMTP id d9443c01a7336-223f1d3a25dmr15090185ad.45.1741129503766;
        Tue, 04 Mar 2025 15:05:03 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe6cfd9sm11492793b3a.76.2025.03.04.15.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 15:05:03 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: [PATCH v3 0/5] thermal: qcom-spmi-temp-alarm: Add support for new TEMP_ALARM subtypes
Date: Tue,  4 Mar 2025 15:04:57 -0800
Message-Id: <20250304230502.1470523-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I/ufRMgg c=1 sm=1 tr=0 ts=67c78721 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=p-nOP-kxAAAA:8 a=Ke_cMI1aEn6YhuwJoicA:9 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22 a=XN2wCei03jY4uMu7D0Wg:22
X-Proofpoint-GUID: 0TTkbobHw4G-KfJsSffxF48yOdKgDp4S
X-Proofpoint-ORIG-GUID: 0TTkbobHw4G-KfJsSffxF48yOdKgDp4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040183

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

Changes since v2:
  - Updated function name to include "gen1" in patch 2/5
  - Added Dmitry's reviewed-by tag in patch 2/5
Changes since v1:
  - Remove unnecessary moving of code
  - Added new v2 patch 3/5 add a preparation patch to v1 patch 2/5
  - Updated temp alarm data function names to be consistently named

Anjelique Melendez (4):
  thermal: qcom-spmi-temp-alarm: Add temp alarm data struct based on HW
    subtype
  thermal: qcom-spmi-temp-alarm: Prepare to support additional Temp
    Alarm subtypes
  thermal: qcom-spmi-temp-alarm: add support for GEN2 rev 2 PMIC
    peripherals
  thermal: qcom-spmi-temp-alarm: add support for LITE PMIC peripherals

David Collins (1):
  thermal: qcom-spmi-temp-alarm: enable stage 2 shutdown when required

 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 515 ++++++++++++++++++--
 1 file changed, 464 insertions(+), 51 deletions(-)

-- 
2.34.1


