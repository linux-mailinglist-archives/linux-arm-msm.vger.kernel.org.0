Return-Path: <linux-arm-msm+bounces-116091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nBm8ETGgRmrcaQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 19:30:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD49C6FB645
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 19:30:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iKJVY+5J;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=McelZnUi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116091-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116091-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADD5D312B315
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 17:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043AD394498;
	Thu,  2 Jul 2026 17:23:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B300346A18
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 17:23:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013005; cv=none; b=ZQJSh34Vc+DG+rSxmGcoWddwE2gDiaTrnhvGzrcdERhr1KjZHKZ7pqmL+UL/uyEDTiMbS4qoSaolxPPdrFb8Hdjgzp2GkFZZ5aOBg756TV3juKk329pElRZLsSUbGqKRNUOQr8dnhKQ69k7+fT0oIwoDDhJwVuFh+tiNjSu/I3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013005; c=relaxed/simple;
	bh=SkClX+BRSZeyx/tE3dfrFyvjxOsfCTkuTsmKG3JwtRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FsO3nwSDjevZawnywUsXMFP/TybWaLY7Yl5yp0r61N942M3iqwvZ0+zAiwwina/x351JLUwnAb+shU79AHjL11UyL7cg6+1ACp9oYK9Leh3G3AEKY5VmUxizop85E3giwgmrTJtQI1WjLs/K838vrE9OzXUEnS1FiwtluIaIVCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKJVY+5J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McelZnUi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3KFt646694
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 17:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZVIXvfF08Zv8MetAzCraK24oPCTEkf7t2xGg8nxuk1k=; b=iKJVY+5JGWYbinO7
	vCVteIYV2dbJKlLgwzBEy8CLoOTHlwwsJZVdpWaj9cbAyiSQiCX4FvtmIQ9/noAF
	vnDRv/uivl9ro4aFDR1bdSr8iCln7iBLcgEAM2J8LwqJWYgkiH+SJyWP6/gQrIFX
	Z4uLNF6+/XujjfpRk5vi8MGqDdoHwCe5JfQ3KrQfD+C81t1wgLMuaiFk3Cph32uU
	TSoPqAOyVSomrGzctC4j3uNs2ZvsZq00BKM/wjGqyxt+kTdxIETeeE/lmrdjjK2U
	N0mBud3dJIozy3JyVRxKW3NmpJjJEMDEX55J5AqkQ0FNsbQH3yaW+/XU+kdgfbtj
	EjisPA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb35ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 17:23:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9fe2607511so226681a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783012999; x=1783617799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVIXvfF08Zv8MetAzCraK24oPCTEkf7t2xGg8nxuk1k=;
        b=McelZnUiGs4clG+lKu0NBALE1X+krXZQqNaKYQyFBAud1FOS0K633vCnON9UWDJlRi
         87CKFAv8XAczwhs/dMb5ucjGnUncr/TvBjlUvmKItJct5KvHu+8joSWRILMBtsirXkUw
         MKvH6VI8UFaJ0kUt/JyHC2pCSIf761WD00Ri/Q1spOrjdcO7Tsn9zZJizDimUbr0zpEC
         BONkb2DTSICLXu+radnqfa/msnyXp39QcwFZBF+EBjWu65xQoSv2SXlGKA5UhzE60sYt
         29ByPsDpPqezHFP9oIc94ue3Qs05RMQ7t41HcObAoUgw38GcQFsKKaF9PffAo+S+j6Af
         DTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012999; x=1783617799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZVIXvfF08Zv8MetAzCraK24oPCTEkf7t2xGg8nxuk1k=;
        b=cxmFJ+hlinzu8GSy2/JHLFqQZNZhShoUQQNf0tZtimUa4I4uTPYkY8mlxSSOxf6QNT
         KvzJDMMCJVP/WL8Ha7d0N72ki0ybRzuE6MOXUK7pJEnxQdC0vzbMARlScZkC58O+ukAZ
         QPMDxIhXB14y9aN0bPzvQpcjL1Dk8eZ7YC9zhW9+5OVZkJNhxS0KbtMu0HmRK7U1IUIX
         E9ZDsiI//7ezJczQbrCLaQNS4xAM9DPVB7ngOoSAFuNmqynKOlwh7RuxuT6qd8hEOErU
         9ZEEEgvpYm9tGmQY2n7bk8XzNLXK2tBAQuO/3EJTicEptLPPQInrXWN4pYQZnjfg6BKo
         wcaw==
X-Forwarded-Encrypted: i=1; AFNElJ+/hJsK2k3FvJTmB+7v9cHHyLLJmJfKxNdGohfHR4l1bBOrX8d9zLUW3HTq9zbXwjnFNsOQmGNmXddph+Oo@vger.kernel.org
X-Gm-Message-State: AOJu0YxZvxxRqIaTEjVt+XsHmMSGvcr/KrI2RkRVjxnOHKd58qKLp8tI
	85IZIowFGKAG1LpRUbUUNf4qh02wJEyQglJS+gGoM/hsZoOu5klSihMFcPOQn9NJoDyoK9tiZwP
	/mCLDJK7a9sWaEVk1Y5Jd+9h9wC+OWusR8VF0/xcF7Ecprag7QGBuYYlpU7Ne/1J4BOBy
X-Gm-Gg: AfdE7clX44+szXpX5Cy/+crHNt19/6rprXOjhWexft2CPfgeJEI/I9BOsyz1l0StJI8
	jRlbTjryj12QcK6Shxe+ok+4JrOcX4nIjSjPibh90irK1NMCr+0dn//0AvdG8N/kAWsh52UzABx
	r5Ptu9eaW/c/wr5oBPXzBE24m+fPRlcHhSzbGygkPtJawvn/gOvnFA1GzpCNOJXzediAgmDNVW6
	rjlMsYpY2zlQLex/JcaxG6wkWyfVzggIuNFwexYTAoqV334qDB8YWQzBvBDVJvrd8i1tZc6iwWH
	tOv6K5HHn1bfQqTTn4tXwwqUZmrOoDIFDEKGmB9AXOCE0Qq150+cvOWsg6xpU/aY9aEgyZ/SN69
	+QoaWvWO9JiIoNQ1ndz+mJV/j13j3++OYHc/TLptsqsxflA==
X-Received: by 2002:a05:6a21:400d:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3bfed0f659bmr7633121637.8.1783012998551;
        Thu, 02 Jul 2026 10:23:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:400d:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3bfed0f659bmr7633060637.8.1783012997955;
        Thu, 02 Jul 2026 10:23:17 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3ececfe4sm10564289c88.8.2026.07.02.10.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:23:17 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 22:52:55 +0530
Subject: [PATCH v3 2/4] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-qcom_spel_driver_upstream-v3-2-434d50f0c5b0@oss.qualcomm.com>
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783012984; l=3981;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=SkClX+BRSZeyx/tE3dfrFyvjxOsfCTkuTsmKG3JwtRI=;
 b=yClmCf9za530h3JJpKiRDGS2JiTZ2o7Vib+IN6Cvc+NhSYxbjEUsbUEJGgvNtymDJpCXeF48A
 wqoVqi+0pdrCyJryFPTEUM/291Ql+8RkOHGrUnU2SA3eQ4aszmawO3H
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: 04hoSYiwsWL3ykrSGiz1BRoa6VNnCGIN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfX+Xi8CL9SUnNp
 wrNnyl5kQDEajzGu43bK1z8yzgJrNgSeC6zI5ZHvFnfI3LpXNR6c33DnaA4/PrKRWOv7sYlHz32
 NZc6gEo00l8nrpgbZynTMF3M8C3c4iI=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a469e87 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=3TBu0n0mUwvVB62lRZQA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfXwvnnmKlQoi0R
 Zqewoqfty/tGhWtSVL7jp//lTLpamb6qf4W7izO75yQYFgJIBu2LYA9rNCrOk+6ulBnbWNhechp
 CBZW2o9l8TbUkygdXidaLymUdJ9wTNAmzZRayKlePJWzBl0qlZwqbgR5e0kvwKmWWvom47LABD5
 XQ5Rn2K+Slyt7y2+jJmwnxEhEi03yesvQqEhcADcm/FYMe9o9BBacXWyO0uPeFS2txXyInGSqIK
 bS2xPPz4d19tqcP67sdatkoG1pJvxa7u3PRRUIWoeGX7z9hkqVtmOqHGt369RrezecsBl+Cj/1r
 xjAi3Zkc7u/fZ+KXT7pMBc3AHUyVHixbb8NBAy0XXlUHYo0LCeHz2lXxPPu7hzHyVgFgkGKGgBp
 ulk5Ez3gAtnxV4zDd7xihnstBKEupvKLLQ+MzxtyrHANzkm2BdfahG1sm/V+fEB9HZjAmtEggY2
 qjAmLv6kL7d15xE+AGA==
X-Proofpoint-ORIG-GUID: 04hoSYiwsWL3ykrSGiz1BRoa6VNnCGIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020183
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116091-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD49C6FB645

The Qualcomm SPEL (SoC Power and Electrical Limits) is a hardware block
that provides power monitoring and limiting capabilities for various
power domains in Qualcomm SoCs.

SPEL enforces power consumption limits to prevent thermal overload,
maintain system stability, and comply with platform power budgets.
It provides:
- Hardware-enforced power capping with configurable power limits
- Time window controls for power averaging
- Energy counter monitoring for each power domain
- Automatic throttling when power limits are exceeded

The hardware supports multiple power domains including system (SYS), SoC,
CPU clusters, GPU, memory, and peripheral subsystems. Each domain can have
independent power limits and monitoring.

Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/power/limits/qcom,glymur-spel.yaml    | 61 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/limits/qcom,glymur-spel.yaml b/Documentation/devicetree/bindings/power/limits/qcom,glymur-spel.yaml
new file mode 100644
index 000000000000..e8d974cbdc64
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/limits/qcom,glymur-spel.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/limits/qcom,glymur-spel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur SoC Power and Electrical Limits (SPEL)
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description:
+  The Qualcomm SPEL (SoC Power and Electrical Limits) is a hardware block that
+  provides power monitoring and limiting capabilities for various power domains
+  in Qualcomm SoCs.
+
+  SPEL enforces power consumption limits to prevent thermal overload, maintain
+  system stability, and comply with platform power budgets. It provides
+    - Hardware-enforced power capping with configurable power limits
+    - Time window controls for power averaging
+    - Energy counter monitoring for each power domain
+    - Automatic throttling when power limits are exceeded
+
+  The hardware supports multiple power domains including system (SYS), SoC,
+  CPU clusters, GPU, memory, and peripheral subsystems. Each domain can have
+  independent power limits and monitoring.
+
+allOf:
+  - $ref: power-limit-controller.yaml#
+
+properties:
+  compatible:
+    const: qcom,glymur-spel
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: config
+      - const: constraints
+      - const: nodes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    power-limits@ef3b000 {
+        compatible = "qcom,glymur-spel";
+        reg = <0x0ef3b000 0x1000>,
+              <0x0ef3d000 0x1000>,
+              <0x0ef3e000 0x1000>;
+        reg-names = "config",
+                    "constraints",
+                    "nodes";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index db3d8c441e4c..44e90b2d5e85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22368,6 +22368,13 @@ F:	Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst
 F:	drivers/net/ethernet/qualcomm/rmnet/
 F:	include/linux/if_rmnet.h
 
+QUALCOMM SPEL POWERCAP DRIVER
+M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/power/limits/power-limit-controller.yaml
+F:	Documentation/devicetree/bindings/power/limits/qcom,glymur-spel.yaml
+
 QUALCOMM TEE (QCOMTEE) DRIVER
 M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.43.0


