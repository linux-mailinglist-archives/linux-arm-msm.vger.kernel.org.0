Return-Path: <linux-arm-msm+bounces-99900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JBpKN0MxGk+vgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:27:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B2E328F7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFE893004D85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC2B2D8379;
	Wed, 25 Mar 2026 16:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxskECfN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NBku7V3x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCBF3E63B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 16:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455728; cv=none; b=ReJGwysUJnbzgzRFBPlIjHzcRaNZ5r5VI2Sp/CALQzkWPfcspRllQU6gj/7PInOnTcbo2X6T1mta7yYjyKXmEEYMQXp1t06s2WT4nPgp8Lpir8kBhRRmHZd0g4E5h+1N1Ujm5MYOc+g19SYm51H889qE+14AvEgB7NR7Hfo7deQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455728; c=relaxed/simple;
	bh=bvpqWj44ib5WF+12jOlUEH+Vppia8zwBwMPB9/lcfAY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MBtUlLjfheJ4fK6vHDe2KqS9hsC6R0sot41NPaoXTiSBJHHl7gOqo4Zz7XEJP5L+oGGgKOmusEyHnQ9Y8Gf+341RN6onEyZgzymcF7HsALw+THqapPNtNoCF+5JRjt/BgspxFx552p0tbAjq5Mjq0/kwzL5K1JWsIMf9cfoNZ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxskECfN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NBku7V3x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFRa7W1432757
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 16:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m4/t3OX801yud0AC/CSAAs
	KbXKedZzNSsC0z0THLOyg=; b=fxskECfN+tWDVO8WABqJ0mnfNVXwmb0inI0j99
	XLqu6fdGBEYUgZe3bc5JHfoQcCuzJ/AWljFNAqPRKtlE3Acxt1SfXBtBP1cPaZNH
	uUNPGyLq8mk9ksvBMpHa735p8vDLGO46F1wEmn1bjT0Ob83iUmiD9s0RpvQJIZey
	cBa0WHxOiXjMlzMPtOUDVLuWeqGQmEgNoYCLlMSnl8V839x4vY0XLL7Wq2sDcLbc
	j75ktW9lNrUyiEfGj4Q98q49otSUuVAy+jj5eRoD30+dRdJ++C/UKbq0nTtYVxM4
	SuHYtY0Q71SLS41g8SA06DnH/mzOHR5LQoE+W0EKC8aKh1Qg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4jc50780-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 16:22:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c737b6686ddso134955a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774455724; x=1775060524; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m4/t3OX801yud0AC/CSAAsKbXKedZzNSsC0z0THLOyg=;
        b=NBku7V3x69gMi4FlwwV6Hh4i/p7KLgfWvHU1XEU2tRKrRk2R6JJfmHAwKpVUWTAycH
         n6osaETTqHB2CQ55DqMp9dtLgjQWUqf8Htz8TmLHBS2mDpKVoZ08ng0nV4A5ayRFOeUG
         QIqts29OlNttSMEW6lVJZioJQRvjlBbW5neVXE0+dzdErWn8PVecuVOHxN7j+L2SRWAu
         heG15/9pwisnHYUCVhbcbeD7K5y1Qm0//vJDyCBxI/P81q710IeQ5P0WfoD/1ssVAq2H
         M4FNh3EaenDuBY85D0FPSVvlLeCgf+3l6pdxZoYv0GOtV7rXcSvM8W/oEgQNUzs4J3GO
         8/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774455724; x=1775060524;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4/t3OX801yud0AC/CSAAsKbXKedZzNSsC0z0THLOyg=;
        b=TkoRRhLxYcNW5p6zFKF+y3vfX21waHtWFLrPs1TwReq+azQD5DYeNWuMwCmzojVNjm
         tSXviKOAcz6bPTmDSbTBvaws1GOx1r8AUZ+2DQ/TMwy4hmJDQQf6SZh7NmD4WKbEh8AM
         WwzLw03A0uPuebb1oljG4aI9wZVuZUEAn1yfOVpRKi6XdgoqVQxfk2cwi+yQasu6nLfn
         7ks1QEbdmvcs5JkSJ2C69rvd0FyYma8oCqEh/AuqVm+IDbTyZ+LbY+EPCiQ3s0Q0KbE3
         rVUAJdeoHk+cqunUnHefcTK+mSTpSuIo/5xR5bQ8lgJ17AVKT5D1iT6vetSztrGTZ8RA
         LsTQ==
X-Gm-Message-State: AOJu0YzHHgslnTv6O4ptt1eV2UjO17NIbHTpSKqE3yYB103ls+SH+afw
	/fVeDtiTnVUETvyaZQLOaxQ1CsR/qNZrmhS1sdWjtB4zq7COq9D3yj4q2bVCoXaZVeCHC7m1uUb
	H+N9E+5vC4/pzsbIDyzaaTdM5G/l7SfePtVbPP2z/3dNs20i6VU86IHggAos7oCMZViaP
X-Gm-Gg: ATEYQzwUBWi0dGeIVqN7ibiHdOEaLLypqmsYxlpjlNiKQPXV7K2jXYNw6ndQ7GysG3b
	HtqHK7QfzFS5qBvcFxuo3L5+oYMzr9byz9Zba59i+ege0/g7C7StoqymtYISU/aNp643PpxXmkr
	4RJq8b7Pm5YeiXjbFWQe8MfPGdrMRYOgxc5ZND98tmQgpGj7v9lV5Msv51KW2T9QPacYXIynxVD
	J1WdsWrNIKWcirBRrQNARmnwCXuYOUqv5LWN3ffDQo2Xc9V6s/4EbWGd2f9y0zWXm1b+owVJvU9
	KjIEUje/6RivlDjzDRCOnFKh1LfS8vjzlaN4SBf5d6E7mJsabiet2tUPTfdpo9w9dsfoaf2tQH4
	Q6JHvoydusknpzD9/oPdOUQLtxyBlETSNNlZZR+Yw/oB9e/UxNEVkZzdUN0onZ/U7Thi+RCweCj
	72cohBHLaHme8w6rbZBI4SAv2ZESTojVOhFcVVJYCfmQbPByd9
X-Received: by 2002:a17:903:37cd:b0:2b0:6621:cedd with SMTP id d9443c01a7336-2b0b0b1db45mr42631315ad.49.1774455724220;
        Wed, 25 Mar 2026 09:22:04 -0700 (PDT)
X-Received: by 2002:a17:903:37cd:b0:2b0:6621:cedd with SMTP id d9443c01a7336-2b0b0b1db45mr42631045ad.49.1774455723724;
        Wed, 25 Mar 2026 09:22:03 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8e958csm2945415ad.66.2026.03.25.09.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:22:03 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Subject: [PATCH 0/2] Misc BWMON fixes for glymur/mahua
Date: Wed, 25 Mar 2026 21:51:49 +0530
Message-Id: <20260325-bwmon_fixes-v1-0-9433f9d4c276@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ0LxGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNT3aTy3Py8+LTMitRiXQtjSyMTcxND4xTzNCWgjoKiVLAEUEN0bG0
 tAJg0fhpdAAAA
X-Change-ID: 20260325-bwmon_fixes-839247413d7f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774455718; l=663;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=bvpqWj44ib5WF+12jOlUEH+Vppia8zwBwMPB9/lcfAY=;
 b=JjfKVvfGn05UX/FP7i81eUkGX5fP7Y2nF8x012aFnV9WPnjql2JnlCMAeYERTBsUmnFU/Eyfs
 1nMFKFVQomtC7WVMQFMw0V6jKs303gHd5kq1uQ+5AuT9aTMHhefL0Yx
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-GUID: 6mgMKp6V4hCJGHM7Ays10duS_-Veqr7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDExNiBTYWx0ZWRfX7X0nvPjqUL1X
 xwNeJ6v0z1j+hl/DRr+Zvfjz6LIAl+0Pd+bZieOzGqkXzvcXIdyr/X9/e9/vMj5uxPVvmJs2r1t
 BKOXc5SQ1IAQFlV25tZd+0JiwhW5NFlm3BGGHR5YMPntC0yTrt/W4tR4CllQo7TTsxfbkDYqIew
 OGYyjdapjz9GK93LE3WC1WFB5jBDbX5iAuuFDmULiyY6jrpVHPftUrk++8K09138ApD0w3p9epP
 Y/Xipv3TliYzoLe06LHxFL8ooSlfdM9pWtmwyV7NSHcyMsKAk0LnSddxhEf3rpMEAyl7wnAhQcj
 gZ5cvZxRKp/2ajDlWA9evihVfR3f/zdLYW+3NMDRE6r/MV/UuCOwBzpRxDfJe/VYeUw8TzZbzb3
 0vwiMSTTxQWzA2j/ge8hpcXYKbxKg57iZGc5kQEba5KvS/v8u8twerU6yUOy7R66yjGY8rmP2mn
 1fOuctF7cSvBuVyzZmA==
X-Proofpoint-ORIG-GUID: 6mgMKp6V4hCJGHM7Ays10duS_-Veqr7q
X-Authority-Analysis: v=2.4 cv=KaLfcAYD c=1 sm=1 tr=0 ts=69c40bad cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=frtQ8PWTZBqyM4CBJ3kA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250116
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-99900-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7B2E328F7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds the missing opp entry for Glymur/Mahua SoCs and deletes
bwmon node that corresponds to non-existent cluster2 for Mahua SoCs.

Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
Pragnesh Papaniya (2):
      arm64: dts: qcom: glymur: Add missing opp entry
      arm64: dts: qcom: mahua: Fix mahua bwmon

 arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++++
 arch/arm64/boot/dts/qcom/mahua.dtsi  | 1 +
 2 files changed, 5 insertions(+)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260325-bwmon_fixes-839247413d7f

Best regards,
-- 
Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>


