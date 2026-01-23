Return-Path: <linux-arm-msm+bounces-90363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLQ1ENGsc2nOxwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 18:16:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B009278E12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 18:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8581303CD3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 17:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD903195F6;
	Fri, 23 Jan 2026 17:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7smWXYh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vh88lI2T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C93430FC2D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 17:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769188391; cv=none; b=VkGMJ+AkBDuCsr40TDwgHAbZQAeNP4sjAm0I6Nux8ImeBw8N58yOjyZfO5gBvGo/XOu7crz5Ezf1YAqS7PkSJhGP/4IgQVyp3IURcFYzdM1YK5BLBflBCnuDIqqXwMCqoWlZ3dbUogmVC47pJ+bNsqM7vvS2eqrrjRo0oxAdACA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769188391; c=relaxed/simple;
	bh=2Z6xwhKJk/Agr/Tfu+uZyoFFVZqx8Bbb+H//Pozkx0k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kEqcIQJ3/nzE4oziHFuEm5drL7TOe8EAmEdDoB5o5iucF5sSzMSgi3lnPz043ebHQToBYHv6mp3fbZ5OQGTpxrYVuufnGq9DKt+wffAvNHgecH/AzfJc0LPwh1joXXgSxwMy9MROhnBHoxZOkqH189q+O9V4Di6iSiEoFba6WMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7smWXYh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vh88lI2T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NBlnUv3656158
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 17:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ra5z7RK+ckZlI54IIzTkyl
	AtFlnUN13RpB+yLrim14U=; b=L7smWXYhklNSX6Uyfo7p04dCDlDokgv0TYtTSW
	Fa89VFxtpWoDrB6iLkH798WDB0dqjNX4jQr6Ql+mEJgfKF2m3+PufwuCSRMT3CCk
	1pI6gEOyWxpVBcLLKfH9tbDuK0WaD6cqe0a+yHQrFJQIkGonMjqODVA9hFc/moFe
	9rI3LRJqR88/vJ+pt3E+EYUCqt7O5p0RmhaQfA0up2i+ruu3zYtaB+HVFSK0nhai
	DicmMU4MB57v2p1R6nMpEHewmw1uEhIZoJ5JQb+rog5/KxdlXzKH+9BtCg0LL6bb
	z7zp9am0C+9HV13CXcOnF7JjwFyjerJrplluySXp68TP6T+Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv2hwad47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 17:13:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c551e6fe4b4so1571740a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 09:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769188387; x=1769793187; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra5z7RK+ckZlI54IIzTkylAtFlnUN13RpB+yLrim14U=;
        b=Vh88lI2TKVziZjWIJCk7AwVbkUlRN/hg2L11veYIlj3oc0zPFQE0NqL1QrHaQjWTIf
         lNNjwIZDw9eRNwXhAGvA0Ta32w3AU4PgJeS3qNK7WfRkVMuRSr0l5xYb8ImoZcm0ZTXC
         E5pNh1OA52iodMHv9Qq+oIGe5C3g5l/PcA0kc8NGh8ikO7hqU3X2Z1nOJLC3wWnyqONX
         QEQa3PepKLpc4JNawYnFbDle141jhCM8G4lWxEQ8X3j0RP1DFy9cdbM6LISGpmoJ3svk
         mubqad00WGaJuFDpqBZevCi/QB2CeryPxvyZ0bHBN0p1B7hCFWQSqhr2/GOesweoKavs
         m4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769188387; x=1769793187;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra5z7RK+ckZlI54IIzTkylAtFlnUN13RpB+yLrim14U=;
        b=g8CLltkRKEz+Kd4NZ+KHGrNgPIMqq9iCTnSCZGxEanY2oZS9gQm/0DZkwgyJl/p3Ly
         hAbaqurgAPzl1fTohzwZ0nQTwuynvliDK6XwxXPRb5JPShNWWVFJlaOAPKseLcnuBAyn
         YKUu8LUOHx4q+QG38kKiJQBoOh6YjdJtPjvrdxaxDQoyJU8dqr9vwAmT3dIBzSEUjtC7
         CK/eSEJI6a6p/twRmddybNRGiuFKfh9yZndBo33FvwcFEB8j2RHBqYxqK1XUKdqbhmKE
         PQnTuSFogDfkCaZS6hHenjGmnccKx8Ls1Sr1XDS3DCio2ggS0mKlQunO/EBUn8JCvZbs
         atTg==
X-Gm-Message-State: AOJu0YzloZyDnINmj1QdtLvKtkg8A0oaUdfFcoSaZY5Mva+dadmmHAiu
	VqPt4ij8hngCNCkjgDFqaGJ+LtJJMZcLlI1u9HkXMpCKMfFKdiTAu1WIqs9cIqoMQ8vHSgwibhJ
	FyyzWe2z7Obj5UCmfFpXRXpKpNKtY3MNT+oPpBX7Oka8zGdIZrlQFh7mUVyQnOwVt8iFERXeypC
	zI
X-Gm-Gg: AZuq6aJDdFKPzw7FO1Qf3e/HK+/tSQOFZLoOzQVPjsqvSAXkNoeAP2P54aoW4EWY+R2
	q/cvwZcG7NMHECyCBGaTWjxaqcTW8qEl7zSfzAMlaprShAAplu7gdvrsEyGLfX6YnRM/HENWDsE
	svuD7jEy2lakicqcGd6C4rItQqNIoXd9+JrGWHUuuuT+acxdIScgysXnkJGctbtqvktG3d1/gt0
	XXoYroocROhGw4NVmmMHOB+QyVrHhtuFy28hT7PTh0ZBWBbyQjMYoOe2MBiH1XT1JqnF6z4jWeb
	3cJ7EW7Vsab/y6NrlM2e0gsrosKlS2mxoxYizxkaFSMrggjZ4MkHUqcHXJZQLY/YxV8jiSabcMJ
	eN0ww+D1ahARUWkhql1SjbPLHun+X//PX
X-Received: by 2002:a05:6a21:6da9:b0:35d:b5a1:a61d with SMTP id adf61e73a8af0-38e6f713dc2mr4242096637.26.1769188386784;
        Fri, 23 Jan 2026 09:13:06 -0800 (PST)
X-Received: by 2002:a05:6a21:6da9:b0:35d:b5a1:a61d with SMTP id adf61e73a8af0-38e6f713dc2mr4242051637.26.1769188386227;
        Fri, 23 Jan 2026 09:13:06 -0800 (PST)
Received: from [169.254.0.6] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536ef9ddb9sm1191358a91.3.2026.01.23.09.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:13:05 -0800 (PST)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH 0/2] Add interconnect support for Qualcomm Mahua SoC
Date: Fri, 23 Jan 2026 17:12:34 +0000
Message-Id: <20260123-mahua_icc-v1-0-bc82cb087f1e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAKsc2kC/03M0QrCIBTG8VcZ5zqHkzTXVe8RI07O8kDO0ibF8
 N2zQdDNgf/h47dAspFsgn2zQLSZEoWpRrdpwDicrpbRWBsEF4p3gjOPbsYTGcN2isttr5TW/Ax
 1f4/2Qq/VOg61HaVniO+VzuL7/Sndn5IF4wyVHA1KlKbXh5BS+5jxZoL3bT0wlFI+mxQKsqkAA
 AA=
X-Change-ID: 20260120-mahua_icc-76054966880b
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: BdgiwwjF7_3Vy0A9LuYV9S9rLYqovpEk
X-Proofpoint-ORIG-GUID: BdgiwwjF7_3Vy0A9LuYV9S9rLYqovpEk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEyOSBTYWx0ZWRfX7BPO2qp8HLp3
 ogXNax187FS12PAfQ7inntKT2Q+d67FIt7YY+DFfpd8ppo5mi17Tx3RhWU3Le01YZlhAIsGwsjy
 7cw4ihrfongYZoOkN/OJRoImC2yFukaLZJH83btCrdmc712FPc90J3yMw8PtW5xbbXHyPiFlSkt
 E6+0Zn/Kf9iGlqXH3G6ExCpY3xPg2kh2kj2/Qz3oZPsIanRVAwzBy2gPDXaM5lsO7wLn3if0Mui
 2vDWlmzqq9eIcowSuupP3x4/3KeBe3p0YOY6yMnpC1MT2/mbrUtqGoQ9bkHtIN6+HUuQEz0p3HO
 h6F/6pImbU39YLhe78f9efgwnrh/KYSrtxo1fSAUuw776u06R1TwDBrpGrrYUG2eV6HzEWBPCGt
 AC0a3zsOZhF6dAuRe/kmlI3qUygiwEKTYRv9Se/c5V6BAh00u0UwHsuQf5jJBV7rSyUZxbJtRs/
 hWZWF/wzPqjCXD7eUsw==
X-Authority-Analysis: v=2.4 cv=A4Rh/qWG c=1 sm=1 tr=0 ts=6973ac24 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LGNSbPc2IrT9O9NjG_AA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90363-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B009278E12
X-Rspamd-Action: no action

Mahua is a derivative of the Glymur SoC and shares a significant 
portion of its interconnect topology with Glymur. As such, this 
series extends the existing Glymur interconnect driver to support 
Mahua, reusing common definitions where possible and adding 
SoC-specific configurations where necessary.

Device tree changes aren't part of this series and will be posted
separately.

---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Mahua SoC
      interconnect: qcom: glymur: Add Mahua SoC support

 .../bindings/interconnect/qcom,glymur-rpmh.yaml    | 132 ++++++++++++++----
 drivers/interconnect/qcom/glymur.c                 | 153 ++++++++++++++++++++-
 2 files changed, 261 insertions(+), 24 deletions(-)
---
base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
change-id: 20260120-mahua_icc-76054966880b

Best regards,
-- 
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


