Return-Path: <linux-arm-msm+bounces-91817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENlvLtdzg2mFmwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:29:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D333EA395
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B60E93007BA1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 16:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFA938E5FC;
	Wed,  4 Feb 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1ErX6Kx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csT/FdLE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361AE426EDE
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770222549; cv=none; b=aVIWseL25qUynNCo78J12c0W1KI0rLT4qRa/jRRZcQWFZnW18gz2GWRYrpmaCvq/eMe/PPplGsb00vnEuFZGf9uTmEJC+dVlgo7Rfae4TlYILEkw7Fk8QcywS91TCjK2Ny6RvZeUYRj0antF22oMv4rFDPAeLiynXTPjFih/dYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770222549; c=relaxed/simple;
	bh=sWb5rIpEPBjBGqjRCRsJwTlXgQOnkNWUkWCVvpAoluc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NwEYSuXOWyTPw/4W2kAKDTRGXxoAtbcVSlFDSYQ+JyNtN+wcpcT/u8ZJRM8/aFeLQhKmskymsDQJpOquD5hNktjXfsNoehT0bbAgZWUoTlEHUeM7G/0jVHYv7VLGDMX4nlgTvzJVOO0+sEpm4rHl9xyo6JIWCh+8SPN2RrkOKyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1ErX6Kx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csT/FdLE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614E4Q57943324
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 16:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=U+zSDPLVq06odaeYOuxBYn1640aYkkqXmcQ
	o5+R2vXM=; b=b1ErX6KxTxW/j7pmZd2V3SDNRpQ9ZWMhm9tQxAkKWgXbtH5KX/d
	G6PH6jUQXPDDQDSVxCsaCO0mcqb6UQXrC750IYsY0hkqi5GozmNmICjvhntFHn4Y
	oin5lRa5iHnGWC55uTyJH91F495oK4+qHVyvVKL5TdOLdumpQYAE7jlteQ+1uGeS
	IptdXYuz+9koXu8dARltYaUGNPqaot3Ow1Sfs+LJbf/kBRI88aiUGNN3tGGRqXoq
	ep8vyAS29pYL3YW2XsqK9xwd1OxkfU4ozoBNnXxpMDUXAsWr3c7gSVAaEDCkWOmU
	MZzq6DD9LbGZ/pFb3ZTvQJ5Ax0QY4fmBSeA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47ja0ghb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 16:29:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a863be8508so42995ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 08:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770222547; x=1770827347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U+zSDPLVq06odaeYOuxBYn1640aYkkqXmcQo5+R2vXM=;
        b=csT/FdLEFL2mEVE3RP10BJ6PeekEv94YRsvQyxS7oLmgF1E7ublFJ9nRKMUYrs8hNh
         B+ar4kEWERHTV22wThzzQLI48/IaBCQerkMeWE/LqtY2Fp9tY8ujDzHrsHmSLShOUs1f
         xUOOgnwOK9k/F+36/XfbA/PQTtoh/I9uB2M7kaA/boWq6dJIluVshP5sW86i9hMGnNSm
         UuNoML79Zylpe1SDqRcF4QflpRFp6XiXB4o9BupZdwOtJ3BTrZJlqNv2a2WMbJ2btLqD
         gRXmQrqh9PYqdmv4vYvRcZDQPs+K/zcAzPkCFuZTlRmZ4QaAZQaScEf+WGU7BXbyHWEY
         PfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222547; x=1770827347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+zSDPLVq06odaeYOuxBYn1640aYkkqXmcQo5+R2vXM=;
        b=dp2Bg/Apr+QIR43lchlV2tkTJ+z7EG1Cn5HUslHsc5wTnwbM7PzfOUjIj6DyhBlRXu
         i8hkMMEMgmeI4fACjICetFdj+Vlbn3Pj3VVy5GQNEBdWJbvofkkZ4ulBO8ZWs5lSXQH5
         z01fqGMDvDZF3H+hPcb2Zj7qx97CnektszoEoDqN/Q/kJGKM24IL6wLazTwSjNKwEYkT
         EcB6UAag6Z4i0h5JbnCy3+0LTJ9lA+MrwqdSspKSPi+fofLIX8nhWd6R3GhWEhUpGdJD
         7mOzdz6SFPfaRgLZv5acZZmJLwwLrEoxWesheKoi/6T6RcYDFXMHxZE7/ngfffQce3Fj
         TyWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcTWXdowRGoTnO7JlhacXE8P4OtUpg8CAQTT9EPYjEBLddfNJUqM7p1UdHtYSBFu6Qc/IE8+/zXxlx/XOm@vger.kernel.org
X-Gm-Message-State: AOJu0YwhugFyUGrt9tlraruSiKhymIOIwAHYhI+ksT0zIOUAp9j4d4qu
	wbL+RfQi+y0FSFaCTl04SxtGyNMb1ooFpc11tlI9YAXhLj4t0HeyWvVS3WLuyPVTPoCrtwa8d8M
	U3oBy1BWimPBJEE46evZlB+W03iLQXIlBu5jZysj8bcGtO/lTSgGFZUdGACd4OLtw/fGr
X-Gm-Gg: AZuq6aLXElUlY/ka0aGtdYlF6xP2xto9Frje+cHFXtPBwTWVsykoshkAynr+yk3AyiN
	wd4NFV7le7iRYQ1pP4ehAmvPCKW2MNnQ8IhSS1uMXSSQzGx3QbnpSjTts737KP22kAU2cXl8SyV
	Ks2TerKH/tKEu2PiTejD5B+hrLCXSTznjOOQUuFs1MBHmAUr1Rx4xh/pmpjSYePPmw7OHaO+AS/
	iXs0Fdi+2HWFYBZaNXUFJiYaN2OH8jkdi3/7gWjgFDavuzW+Re1HHeLmxAx2T26WKYdxRNcZ/Br
	q1xJGiI/3ysfbNOvfvijgr/H7EjwnUeRFgHsW2owBeKGxty/yk1aYANR0RLfpmCMpqNr25+Siq6
	niOyyb48mdJwLNVdiO3tfuAJfnoSxJDl0P1J2Nx6vfxM=
X-Received: by 2002:a17:902:ea11:b0:2a7:994a:c02e with SMTP id d9443c01a7336-2a933bc9c52mr38601335ad.11.1770222547005;
        Wed, 04 Feb 2026 08:29:07 -0800 (PST)
X-Received: by 2002:a17:902:ea11:b0:2a7:994a:c02e with SMTP id d9443c01a7336-2a933bc9c52mr38600905ad.11.1770222546405;
        Wed, 04 Feb 2026 08:29:06 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c8515f36esm2546878a12.29.2026.02.04.08.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 08:29:06 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Improve SPI target mode support and error handling
Date: Wed,  4 Feb 2026 21:58:50 +0530
Message-Id: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ft_6QRmzyXzmepiBZA5LjkoUk-YSligT
X-Proofpoint-GUID: Ft_6QRmzyXzmepiBZA5LjkoUk-YSligT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyNSBTYWx0ZWRfXwR2sVdk9IY0y
 TBYH1+c0nkFVzpfQOsEKYzxYX0rhTpNlmQGvAa5VAavc/YA45Lk1x91gdRmklll1Uawl9/fWMdY
 Yn54NHhNjFkszBwLCNhOzY9wqxyo/jP3wQYz26IGWKpuXVs6hsJdj0KmfZSh/7XLxDnI8j6Kxyy
 siStpcsoD84og80Qw8yD2QG1zyBfHkBV+jUrtqLtiBufgMIGnDQ7I9xMptz4rk4UJEtOJTkw8PK
 z7+D4INHf2cVybSGWwYNBSEHA7iQxIxGLbqWhHFzsihwxN3FIj3G72KuLY5E/RuwpAieXBzyw9P
 HArZyNlO7gLJtJzBtTBpavTrwD3PDoCP4XVlQy0R4QWbSXCHi9bdul9ex6AsUhHlG2PvfnSOhTx
 lBjN0rqnO3BttXU1dh2LBRaPPn5iGvfV9bX4qe3OESyu8EwB5EyZHngVIG4MQ3I3m7D+e5AoUaB
 lE+JXLEc1WOhxsvFUQQ==
X-Authority-Analysis: v=2.4 cv=a8E9NESF c=1 sm=1 tr=0 ts=698373d4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=fVkAZgIkOhdXw_bALp8A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_05,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91817-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5D333EA395
X-Rspamd-Action: no action

Enhance the Qualcomm GENI SPI driver's target mode support and improve 
error handling for serial engine operations.

The current implementation has issues with incorrect controller allocation
for target mode, missing abort sequence execution during error recovery,
and lack of graceful abort mechanism for target operations. These problems
can lead to serial engine undefined behavior and improper resource
cleanup.

Fix controller allocation to use proper target APIs, ensure abort sequence
always executes for error recovery, and add target abort support for 
graceful transfer cancellation.

Praveen Talari (4):
  spi: geni-qcom: Improve target mode allocation by using proper
    allocation functions
  spi: geni-qcom: Fix abort sequence execution for serial engine errors
  spi: qcom-geni: Drop unused msg parameter from timeout handlers
  spi: geni-qcom: Add target abort support
---
v1->v2
- Added a new patch to remove unused param.

 drivers/spi/spi-geni-qcom.c | 56 ++++++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 23 deletions(-)


base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
-- 
2.34.1


