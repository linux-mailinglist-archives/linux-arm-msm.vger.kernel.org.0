Return-Path: <linux-arm-msm+bounces-71083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 736A9B39832
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 11:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 323655E8446
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 09:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D522E3360;
	Thu, 28 Aug 2025 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FqeLVVHg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6721E2DFF13
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 09:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756373250; cv=none; b=KP8h4h1+qeWoJYx+vfXCDvg0Pam7he+PGKxW+4b3jEJYMxnyhkJl+WvPrK133MKvWcaI7oy5z3wtFIPPgohbW1lHsJdDQwJh89T878XHhFCtx7Uwp8O+LGZLYEvTquydrzlf7JOBBkYts1g2GaEwYZy9oPydr5pD1iU0R64Grmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756373250; c=relaxed/simple;
	bh=UZn1e/0QvG5mcFs0SicONTgp5MkJcxhTgH/qXUOPqHM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LofhEdaHqu/BSYI3laeH2VQQW0x55ju2B/T4CKdAA3k8poz9mDjwvHQDBhZVzXUxdwweEYsN3ZR8HN61hD3jwVsUuCkvE4gKLyOgQ0UkN1M95Vn1jlAYoXcsbZ3hHKev3VAn85Cfui5nGnio0IaROffd3quhL4zOUUoxF6UsRFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FqeLVVHg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S94CmK007201
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 09:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+R9FlvtB5DBD9MbgaBe0G9
	oR+n+eBr41Ts62Yq9hEFA=; b=FqeLVVHgNUrUFUccrdByhf8d7BEAeH7Q8u4jmB
	2RoWLGv0WmXidDQHub+XHpq7WBHRjzQ3hZZ3tA04xZMOpGYqj9A3O8XTURouXu3A
	jtVy5XI6ug8wXUw9568htF3N2s6q0ma7OSM52bNnLvGybzqC0uAeRJohm0Ql+Wgo
	pl2ApNDTJAOIkQofpHy1Mf9SfvKpVdzZ46iiBSLoa0nCTUzKatMjZCoRqBdIvlEF
	vUZATbqJjruvJIrSQKkyBkwviR4Hx00nZJ2gVdF6ua7WcWnr1xiMajgFIJnFJ/X3
	yQ06XHkjZYJjHmDB7eCHVDAtZiPHaiR0HJgF6EdG2b82R4iQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpghecu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 09:27:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4c46fbb997so1289883a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 02:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756373247; x=1756978047;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+R9FlvtB5DBD9MbgaBe0G9oR+n+eBr41Ts62Yq9hEFA=;
        b=kZVjW+bRFFabAqX7Hacut2KogMoPb2dZs1eF8xn5qYR5GA1ZsqG0rh977u4a/oqg+n
         pDBN1TKOBLSanid6Oqv7UtiPosG+/dOk6UpkWRrAUUuJdsdFcE1qYD6tFHR6DxxSTYce
         2zimqAsQv7U3KRdz3l8UEmE8dkcUVWQxJLmQuQeQYIZcoye0cXOIqGa7M9LYZlh2opW0
         6UOGTeqTXHxChNn/fkjJAV7EZJqOobMDVvUE4yUf8/oszxId0gJFlMH7tgAfBEuVGU0b
         D+KJpvOWCHZvskmTMR5Wjj5yufEBPnShSx1fyqaY0xk6UX1YM40MvI7dwfhhFwtaIBLF
         qwIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwqsY1TOO8BIZGRKO/mGc120+29LUdJz+3xlbP2mQh7iDiecFz5dnJfJk4kZ4FIHX35y4MOgJrtneVBCPk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0CEL2BRlt+8K3hIVyJzOdx24C9Omt+pqjlCYycNr2hQNf0zKi
	uKIAjq9z8+UNqtwBLMSg9W4bOUzSJXnGBRV18tR5c28qJh1bSYAJJFOiNpDxKo//UiFYZbTvTeU
	CVdgSIHHAlbeIqQWdRTC7/eX6t53apHlzVsLymAcKmJnwvisz2iIwziPrRJQALCCG7GiW
X-Gm-Gg: ASbGncsM0JpdHYqFaqgTS4wCtOTfCSXEW3vO43rYJdjYz/6qoagg5cHLBXS4jbaJt3J
	wiD+WTZUGmmNHg7wTqSCe2cujvKlVaxFOO8h65MFZJQu3yD7iao+rGKIwDFmq8X6HY1GSdix11f
	3XUtmajE1osGnv05rPm1C02VUFisRcw2xOXDkEMzcEKGKtGYdvjFRfvmHq1Aq/NPeJ6fujHCmwO
	9PnYirJamwpn+McI3xqdw/edu454sut2d/CQJcQGPWl3Orroj5BL/22V1OM01q9dj2U42aSGLVO
	acOBzA08MhiWKKGMBujpaUkqC2QR0hnW+Sqo3ON6F3SsOsDHTYQR4SvL5ddVpJqltLRabXejQhe
	yDFybq78U+yWz0Fn0FbFpDQ==
X-Received: by 2002:a17:903:38cc:b0:246:2cb3:5768 with SMTP id d9443c01a7336-248753a2bd8mr119449165ad.30.1756373246885;
        Thu, 28 Aug 2025 02:27:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxz54QfBeeANm1Mg3jqliReUDNjYOnWOmNkEg2Int6lFhWZh1T5+xjUbSHeCwCMBvkxsM8RQ==
X-Received: by 2002:a17:903:38cc:b0:246:2cb3:5768 with SMTP id d9443c01a7336-248753a2bd8mr119448925ad.30.1756373246396;
        Thu, 28 Aug 2025 02:27:26 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246ed91ee20sm92497015ad.136.2025.08.28.02.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 02:27:26 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Subject: [PATCH v3 0/3] coresight-tnoc: Add support for Interconnect TNOC
Date: Thu, 28 Aug 2025 02:27:21 -0700
Message-Id: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPogsGgC/22MzQrCMBAGX6XkbEqySX/05HuIhzbZ2gXbaFKDU
 vrupgVBxMvCLN/MzAJ6wsAO2cw8RgrkxgRqlzHTN+MFOdnEDAQUopYFp2l0hutSQKWsbGthWNr
 ePHb03Dqnc+KewuT8a8tGuX5/C1FywUswNequaqyCowshvz+aq3HDkKfD1lCEb3n/kSHJYAWWL
 WqN0P2Rl2V5A/SpbjveAAAA
X-Change-ID: 20250815-itnoc-460273d1b80c
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756373245; l=1882;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=UZn1e/0QvG5mcFs0SicONTgp5MkJcxhTgH/qXUOPqHM=;
 b=5VRyT8mvsMZTvKcbUoKzMdYJSJHBUeFfYA72DcRGlU9FwKOHc3xVkJXJ0DKDPy1rLuzZyvRMr
 bBSAjcTFTVKAPlKlLEDBXtfxAFVXeekAglNonHiaB8LbqnCy41XIA8K
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: AtznLjQ_AuVkm3E9zdp1ujjSfoylNmru
X-Proofpoint-ORIG-GUID: AtznLjQ_AuVkm3E9zdp1ujjSfoylNmru
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b02100 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=s8j_kBg_6ddNrZYoh_kA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX1B7t9PNgaINM
 Xr3KWgWB5DCaZuynqdoHo/jsbl1gXxOsIVcN9ILnZqJqyg4nAqN6iHRbJJG6Ywessm4PqwMG4i8
 hqNOIipH9vu6FlglEVs2GXivEKUFpv/mzNna/EsT3/7T+/+gLNT1ncdFXV6pWUnpywUUNUU0rM3
 p6kxBxp3rauunqDMmwF+B4fqMBBdsQnPkwF4X+8t20M2bVRJEjosK+WEiJKsPLSP0WffNC1Pq/E
 XHF/JVjwZwrDW1vd/WNE1a++vvidw+sw7JwySb1QJpJ0bSAgxWrabQiclCU4t9s6DaTlGtR3L/S
 g48yBtORVjfx9iGIIuG7tAFRJy9uSHdvsJGOXiPYBRPcYG0NKXZlpdh5Fa7qGIr3AeRk18GhxFr
 sJbPgyhJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199

This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
(Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
this block does not support aggregation or ATID assignment.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
Changes in v3:
- Add detail for changes in V2.
- Remove '#address-cells' and '#size-cells' properties from in-ports field.
- Fix comment indentation for packet description.
- Link to v2: https://lore.kernel.org/r/20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com

Changes in v2:
- Removed the trailing '|' after the description in qcom,coresight-itnoc.yaml.
- Dropped the 'select' section from the YAML file.
- Updated node name to use a more generic naming convention.
- Removed the 'items' property from the compatible field.
- Deleted the description for the reg property.
- Dropped clock-names and adjusted the order of clock-names and clocks.
- Moved additionalProperties to follow the $ref of out-ports.
- Change "atid" type from u32 to int, set it as "-EOPNOTSUPP" for non-AMBA device.
- Link to v1: https://lore.kernel.org/r/20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com

---
Yuanfang Zhang (3):
      dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
      coresight-tnoc: add platform driver to support Interconnect TNOC
      coresight-tnoc: Add runtime PM support for Interconnect TNOC

 .../bindings/arm/qcom,coresight-itnoc.yaml         |  90 +++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.c       | 139 +++++++++++++++++++--
 2 files changed, 216 insertions(+), 13 deletions(-)
---
base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
change-id: 20250815-itnoc-460273d1b80c

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>


