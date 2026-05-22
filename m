Return-Path: <linux-arm-msm+bounces-109198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFDBJTUSEGryTAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:22:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 907165B073A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 708A0300A251
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8293A6F04;
	Fri, 22 May 2026 08:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFKQwolK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcQ08um4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC99A39EF05
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438126; cv=none; b=cbtJeimX2wc6qzMieoDKEoINLqq0qudSinw5PqI2hPl4L14vblsEeH8Yd4j+ePvZWc9gsJDcoK5t7rcP0s1afOUz+vr1DISxS5Vx9zJo/h0XesMR09HMoNaptOQzocn6YJpD/QF7G/mQHkNdE+OdXTpIB2I75ebNqkZntvTb870=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438126; c=relaxed/simple;
	bh=azs06BhmYqKoQMjBwv/SMVh5kJKS2q/NUFKYoAlJrk8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b/LiEyhyHmE2qY5stMSvFj2B81VCsagh/endYhHUBO5Xzs2nm3lzVJTicPFMD3EhFjW1nrjrlA8Zhu3IDAYbHS0+FcW/duDuVl3jXeH9VEGbZ9KEWz7nP1vo4ocHSg47noOKIakwdQzss+rY3ijLa2sFWneRsUkJyvi5ds2/CoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFKQwolK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcQ08um4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M41WSo1816126
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a99CGclp/7pz+A1+MObzra
	ZAm8oXKx94yotIaZEBchM=; b=BFKQwolK4HqicGAFInPVwRQd0CaNZAmUwS2EM8
	w3vS5qCLkrO6yl06rSCZPIvqC4OLzMOdS+CKMHCLgo+elokrNM/0C0rEaoNMhb7g
	yYKQVm+bhhBZCrSPkrUR6UzLn3IEpIYrLJWLSnn+Ydkb9T+IYfs6lM5jsXXJlv+z
	htfoL0jv6kgvbrYNkWGIYS23k42KXa+CkECKJBpNwSa519OiWuXdU0HkbWBuTiPN
	XozeM1ytK3rzoL7gcexxJcwgX0WwG9N7u41bZbVvvFZPyOzZSsLGxs5TAqDOUesH
	ruhve+t2CMSobzZo+UFpLRwv2SB+KG4FRJxpHxy1Kxpl/PbA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm0yqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:22:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c827bda3052so10607458a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 01:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779438123; x=1780042923; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a99CGclp/7pz+A1+MObzraZAm8oXKx94yotIaZEBchM=;
        b=XcQ08um4OxEKES6zwhbwA7+MUI0+CDDpyumKCM60bzVwy1spZEYzmZaJHeCmv8ICJK
         mtape8l0+U6oi1RySdYuerEgQN2y2fgLXxP/QYBmA0qEuu2g70ZJKlow/S8xi3cbM6X+
         0IdQexg7NtY+hQthEH3XY7kwlwtyY1egJSDvd9mYqCelv3ZYw3amlxwmvRrnuNx2MYr8
         UBafT2ZzVvrev4B9TiSGb9wOpPdYF6ognTc/UVbfhKsrpJy6U08O57OrpxuXZrJ/ePGu
         pyqYjz8KHeSmoe4YLHj6TfFyrlhfTzSNKPZzBob3Ou0Ak5+4mHxDwYRzDTfOWbds/Vr4
         BbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779438123; x=1780042923;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a99CGclp/7pz+A1+MObzraZAm8oXKx94yotIaZEBchM=;
        b=owZiXdr0tn3KwRztPMZeg+DZwuFstr1lKoCJlnHjVELdXeFq+eNzeJiNwasfdp++0V
         1g8i9oBVAQNQ9iHC0POqP12+q8EajrmqiHdBm7VGtivp6sTOfiIaG2t7JmV6xMo4yYsG
         hz7KaVFS1K/R8epWUzEY2wtj38CVHAXoSxbnTnuoZJ5ijCRlGQaiXiVebQ+o0Qb3e8b1
         gFdHouaJOxJ3+jz1Q9YOo4iuJEMY7JtdqiOgwrbpHrNt1nrkXRnlt3o0+JIzBbjwlCHZ
         wT6Ytsuft/DUZ/NBY7GMtirtIa6ABfC61V3Ye0ItOQauq6fPyG4xbnm06vbHlaRzNG4V
         4gvA==
X-Gm-Message-State: AOJu0YwfripyqUEqdQPSDtZCywZ7PPpEX51jO/TsT5ngNV6On3TTwW2A
	3TOUhrvyg64OJEzawQ+MwjyJjhPdgdMVs1IWdmpNvY0fxxyFn36zcEQsshwZhEZruk90YTv04sC
	WNovet83FdBl4DHwsfWmYrp/Rwz5gZ4R/yeL9JIGmUuhzQFyfDDtMKPG/YLCw5eeKW74=
X-Gm-Gg: Acq92OGMUXTdoXuwUP4ZrTb+jVgEprsztDDvWVMh4fBmuPjPb5JjkDMpqmYU9DZD950
	W9nbFydC0WQbW2HjDcvyRoS17oF8OESDAn26oeQWkmAEiJEnYEhsg7pQlqD4hKFZ+1GlRaYHc28
	HqRX6xqyyPvkMnmkAJcWbwvX+A0ncMAquDZe+8asvqeMmuLWIINr46UXcz0VRtlmJREr4Jcd+Qa
	VudL6r9vjpBIzYEq7StP5UoEizikeGWKHLX9xA+zOve7KVhJ4PINTwlw8ZTan0NUXGdbOVHsWDh
	eDz4O3L4YMVFZUacjtweVWIuMN3CY3+Wk9lcYaqNFw/IWBgL21UQkc5rfUk5qU8JHs7RGjBprr8
	OBF7VsuPY9gpvTylnpUXcFOl51w2xAIvZXFj3PmEq3tz5yo8RVQ8=
X-Received: by 2002:a05:6a00:b8c:b0:82c:247b:ffdc with SMTP id d2e1a72fcca58-8415f5dcc06mr2794986b3a.29.1779438122743;
        Fri, 22 May 2026 01:22:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:b8c:b0:82c:247b:ffdc with SMTP id d2e1a72fcca58-8415f5dcc06mr2794957b3a.29.1779438122233;
        Fri, 22 May 2026 01:22:02 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ff3e00sm1431407b3a.54.2026.05.22.01.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:22:01 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH v3 0/2] pmdomain: qcom: rpmpd: Add support for Shikra
Date: Fri, 22 May 2026 13:51:53 +0530
Message-Id: <20260522-add_rpmpd_shikra-v3-0-632838e2428a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACISEGoC/33N0Q6CIBSA4VdxXIfDg4h21Xu05kAgWSkGxWrOd
 w+96cZ1c7b/bOc7MwraWx3QMZuR19EG68YU9JChrhfjVWOrUiMgUJESGiyUav00TKoNvb15gQ3
 jNacSjOAdSmeT18a+N/J8Sd3b8HT+s32Ixbr9g8UCE2yUFFCzqqQ1ObkQ8sdL3Ds3DHkaaDUj/
 BxWlDsOJAeIlIpy1oDcc5Zl+QKAh2d9/wAAAA==
X-Change-ID: 20260429-add_rpmpd_shikra-f57873b2fa7c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779438117; l=1050;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=azs06BhmYqKoQMjBwv/SMVh5kJKS2q/NUFKYoAlJrk8=;
 b=ADy/45Ch1O+1RpT/bf7DPzHkiMEhO9E8GoZMH5BtGtnA/g0MEJgWivvwrGLYsfDgn+V7BQEsi
 6Eo1HpM0u6ACdAp7XcvC4gDt6OnMxq5wit8dK03wAT/LGV5gyzl5F9O
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: BxY81UQi7fKOQByGMa1wQ-4Q2GnP_1b0
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a10122b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fa4qZZSo5jqT8jJZuxwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA4MSBTYWx0ZWRfX0s8oW0C2LRFu
 UwdN6Qu9c7NuaiMmCYrtlK+2wT0f5ERZWdppyMCPDc0FvVrZZrWBDSpTqt9h9EBBJLl6L5tD+by
 3X7gXn1exK/LpzHp1nSRHi30TFclY4GwSe8qY3GZCmO/Vvn0ec789yjm8wP82OrM6/z1tTuihg9
 2uP4tK/cW92LPKo3ze92D1hdm4KBUr2qrD13LaARfjP2gbqZMZyNwsmYPfRIWlMj6W65ULUkzfh
 ywxCPH0wyF36oE5v3o/2w8u9pd8eiI7XysISohPnu/S7BQiVMgiqMyNX0Ak6I3BMjgBDTeMUdU/
 1N8J39Dglug7pqxqgW2eHKYq0W4QNXZsoGJRjk8Djj1CRgBgCy1Mcs7H+Gmh7LEWLPTWPn5BjoK
 HIeZyuwPuP8sGbFvuvvUcvtYUiKEjNrRcm5QSzEvPZ5dWn38wSTkOrtr5xB85gtC0Zu8IppIJiD
 CglMqw67hMjXC3/i6pQ==
X-Proofpoint-GUID: BxY81UQi7fKOQByGMa1wQ-4Q2GnP_1b0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109198-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 907165B073A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add rpmpd support for shikra Platform including RPM power domains.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v3:
- Updated the subject for Cover-later and Patch2.
- No changes in Patch1.
- Link to v2: https://lore.kernel.org/r/20260514-add_rpmpd_shikra-v2-0-20bbd37592b0@oss.qualcomm.com

Changes in v2:
- Collected Reviewed-by tags.
- reused SM6125 power domains as suggested by Konrad Dybcio.
- Link to v1: https://lore.kernel.org/r/20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com

---
Rakesh Kota (2):
      dt-bindings: power: qcom,rpmpd: document the Shikra RPM Power Domains
      pmdomain: qcom: rpmpd: Add Shikra RPM Power Domains

 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 drivers/pmdomain/qcom/rpmpd.c                           | 7 +++++++
 2 files changed, 8 insertions(+)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260429-add_rpmpd_shikra-f57873b2fa7c

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>


