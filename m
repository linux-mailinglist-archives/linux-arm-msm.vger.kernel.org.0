Return-Path: <linux-arm-msm+bounces-90226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDZOGOg9cmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:10:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF72686DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7EA1830000B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE4331B101;
	Thu, 22 Jan 2026 15:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SpnE9AnP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UaKYmLkG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD822348889
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094621; cv=none; b=J2MiE6cnp4INOjoLezcTHMy0AK8LXahAYRAWeFZz8Uhqxrokr7Hwh59YR4VWSwyKU83pvNywAQNgEd4c3R4ydS1AhZFKlzoPT6GncJ2nib3fXZI8Hvvei7bnKvJ0RjBK5YeiINgwinU6VXVaVReopmjUuJPhhuFFww14xmF4s20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094621; c=relaxed/simple;
	bh=jAvXhPad+799i4jevYzF1yKIxwEIkQVxLwFv/54MkTg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nWQbqxbMbnDND37yj5oiQqtJoOtDgGHUpobg0hxS5lliKuT5xCdalIx56+1a8FqDZYWJe+82eka42tIAbqe5IX7V+FKddTyvhUg4YM8GO+X3qzqlS8TLJAa9VMeN6MzMv9TWdtXvbHIE10qnx13Snp1FvWsPZ8uxh2T/yUfCv3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpnE9AnP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UaKYmLkG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M924n93463276
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1WLTfBIUbrm278eAVvCdHgvSff8YTBI4fGO
	M84er2nk=; b=SpnE9AnPGW6FtUg2xwGhPzth55qJcfyC3oJ8QrqwHpGEr/MbJhR
	/01+p+TskkdI4n4avLJx0OoXhw0K7+skd6aEKHppO2te0OftDnSzZtG2vI8uFvq3
	1jgfhvlu2n7TjnRoOF1yF1M3EoAvZvTD4EaYmfurZk/sHfPbpPk4+uqDXwfWTIxO
	cQuGgpvr6Zfsct656HNnI1Pm0c4IHtAzDdOMUeN5zUzf+ivsFELKhcfBp5m6xKZ0
	DRvP7txcZ/j5rB8bzfUWjHDbQoV1+BtuRWvDZbGqM6NmHz91t3frrrInQOHb+GgI
	Q1HRKHMVjRWLXsyBeK6mJhw+NOJrBMOtssA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu06549se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:10:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6133262e4eso750562a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769094618; x=1769699418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1WLTfBIUbrm278eAVvCdHgvSff8YTBI4fGOM84er2nk=;
        b=UaKYmLkGGWKbTB8Ry9FzYAA9A+KZe2Oa74k9pT3TVqJaSVxsnHg2DnpqgzNOyPQlKN
         F0GTGccdX9CPJVKuCzuuHgMWjSThKQYfF9qY1cSiFA+4YINfeVK2UfVf0yYVSK4bHK1S
         TJqEaiXQKYN3GbioEDzjSID6Id6zRgI5PB/JDFk1JKJPGo55IRHsIAd6Rn8By6nANGrD
         lXeDdi+I+DMJTPozIMwuOXmAW2htR/N8q+fN4y3k9AXuQzBYpHG+djiQ9Wi28rXGOi52
         6zYg0rXim+ty5RAfa5HLJQ9CbmioUbvTMhkiT2iNxGBlocXefWPYAFLR3r1CMSWQbLI4
         kVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769094618; x=1769699418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WLTfBIUbrm278eAVvCdHgvSff8YTBI4fGOM84er2nk=;
        b=hSz8dFPxKdPw10E06uAbOiWh73mI8OCFifEvhR7b9u5DwyhyOr42CD0cR5CafFUPu7
         eMIObzw/ve0kKrKeKPVfKVGiVpWx43/pSa6v+7xZBUeLX3DW7/73LSzRCQUIjMffvsnV
         q5jTPwYzTXDBeEO9/q3zzci9jLV32duf6MTvlvbrdTtKm478nZiu22lBMLf2JRRfM9FB
         Pn6KeE0leWiZUJ2UJ++D/q4LcW7HXxzyhNSX/dCnPcWp0rhFKZKe9cNcwpOBNkUFBGTC
         GMrLMG5eDvgTNqiJIhl4Yw2UlF29d6rYwRilFDw4+pN/rIyNR5FTdNdEMVX31kfdsYOb
         OaKw==
X-Forwarded-Encrypted: i=1; AJvYcCXF9LFveeV6DFINjP+n6NIdOPNUZSJL0aVNDaK9KVy0YrRwAPySGAb+QqHPfbJHXnwwIZf899nKVNenxaRv@vger.kernel.org
X-Gm-Message-State: AOJu0YxjsUKGBth1OYbi47p9JJKhIoGAbQV56cpy1qfJyfP7zX9mV0ZM
	I2Y0q9UVYHqH/zbdp9drQGyhZaV8/w4ZXTwxvVHcpHdLa3yRJ7RT91j3Cgt1UjVZexDgYYCesw5
	2wz6x6KsQp/VXj+vcI59eA2W9Pq7Mszu5u4cYO/dlXf/tPU11fcMin1Q2T7qGw0VtG8yc
X-Gm-Gg: AZuq6aI5uWjW2r+ca9ZJn94T8IBdGVdQYT93JyoM6/DICeXRpH7bP+PVNndO4tjnFam
	3VrsxVg3sKwCkuLEKZnZXVvoOod3OEOIb1DrBXrigy5nM0NYx+BSkwlUff5P2Qd5hto1+QFGfD0
	NQxcaJID3/YOcolKXwKshVQ4OEy1pq75vhAdPX4bf73QtiBy2Z8FLRdhSywzURC6zFWU1OrjaVD
	xvK7Hru9uJDh6S/0dMzdvvEwGCjBMlsrHvxsntnHBlMdan5m3M4ynj9E5vixAxeu9dXe049Mli/
	GqktploHgE2G2B0fmIXfIFVmx3ANCVqMK/7gJ9OeSX3r+EjuyrNLpBp4WUm/koBAIeb6kL3PO57
	LMG8kM/fX4j1Nx69Ws37s/R+/JUJ0EZaks1/DflgCv9Q=
X-Received: by 2002:a05:6a00:3d08:b0:81f:33a6:e9cd with SMTP id d2e1a72fcca58-81fa03855b0mr17466519b3a.57.1769094616982;
        Thu, 22 Jan 2026 07:10:16 -0800 (PST)
X-Received: by 2002:a05:6a00:3d08:b0:81f:33a6:e9cd with SMTP id d2e1a72fcca58-81fa03855b0mr17466480b3a.57.1769094616352;
        Thu, 22 Jan 2026 07:10:16 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8217c258fa7sm4328182b3a.17.2026.01.22.07.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:10:15 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v1 0/3] Improve SPI target mode support and error handling
Date: Thu, 22 Jan 2026 20:40:05 +0530
Message-Id: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HOHO14tv c=1 sm=1 tr=0 ts=69723dda cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=fVkAZgIkOhdXw_bALp8A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: o0g4o17mTjq0B9woy8NmtlhDckwvvi_4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExNSBTYWx0ZWRfX7uWqYvY9YHKj
 tRVIYQzV5j2EfJov0R/8ISg0SxmB/UW+IRn2Rxkqlwt4gXfcuWi5kTGOJ34s5d4yvYo5E5UNX4/
 g3YbcTmRGZig90+UrQuyVjKfrTSKndGb3u5a24ZW9wqIggjN7C4meqtt4giJOGIR1PqUZjHPOEu
 Pw4hFpmac4pdFL8BTgqGL1MFJ2NXR8vXboJ/3YwcbHxUgeoGtQ8czSsHKBsTg/0FEJstk9WqZIj
 ZAcDf1CNq77wqR/RGvJVdf+dQn87BABifg5zv0hbb7PzZDwJPAie3Tj+ddPTdwuCbJjupsZMrs8
 733AX3IlppcX7/eAnNbI3x5/13otqPacwVLT6hlMBRVcBjkN+Q/Yi1FpSSBHEoKfkcGM7WPpovq
 ikxM5Nk9nJbnP5fnm75EVy/5swz7Hc/LjFojzHL8YMc8UnmZHZ7FeaAvDcsc5EjGBNscdpKHEC9
 xpTnHQFX2jMZ/N7M0CQ==
X-Proofpoint-GUID: o0g4o17mTjq0B9woy8NmtlhDckwvvi_4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-90226-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3DF72686DD
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

Praveen Talari (3):
  spi: geni-qcom: Improve target mode allocation by using proper
    allocation functions
  spi: geni-qcom: Fix abort sequence execution for serial engine errors
  spi: geni-qcom: Add target abort support

 drivers/spi/spi-geni-qcom.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)


base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
-- 
2.34.1


