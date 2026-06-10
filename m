Return-Path: <linux-arm-msm+bounces-112358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qFeqBqgmKWpQRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:56:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A10186677DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:56:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IqSlpoKC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jvdPs8kZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112358-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112358-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 435B530909EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE963BA222;
	Wed, 10 Jun 2026 08:52:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005863B960B
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081545; cv=none; b=EeaQrJ9RhMkfegJHe8AsCgWJdh1QNwYg6YZDr07CwmBqWoDqjvWENLpaywUm7MczVzR+qCclLLjQvReJ4F7/NI2peffgYnOiQxreBUY0vIDRzSrm2MEv6+TZySLNIuR6uQhZBruph5CEqn46Wa3WVSqjWpwIYjV3UgdVJ+8KPUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081545; c=relaxed/simple;
	bh=oOGuGhaAzrRJOgEyTlVSLrE4h6R33Y9ZkyHEdEdsbrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CA4R0I1axse9ydU2IahRTVDyYRT7Bmp1lQSRhRzRmaTaNpprPVFmtDfNUvXJTxB51z1zglvMl6Q1T+WEVFGU5PSQO7cpZPmnN6xR4Oj73DVNFzwvtRFdGlw+2BdNnuuNAG4J30jEnisUSWMKmTRS4ARyFTz890k36UeCZSGEhfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqSlpoKC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvdPs8kZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hn8h530862
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i2hl234ksIEm1RHOdsRVt2VAQnwYkyTNif63obZpEqg=; b=IqSlpoKC9cWVt/ly
	c0lKq7+31n9Hnv36hhfdInICOq+qcKnZ99S6c6oJrTR4YP0nxzwV5YBo+63czQd1
	me+reUpypNNT8P/shkFp30I+0bzHqZeZOPTOJypsYDKT5DAEh1NAIv55nefq5VG2
	NJk4Z+cxn88mTWW8T2SroSYdWbQGXwF/CtaaOj3MWd3TRETz6Fw8dpOJ0l7Q+Dcg
	2zGh0pjuDJgbhzjz67wCQqNmGTLotNTAI7h1uhfGsx83HwCIYFNkwj59wY3l7AZe
	EjbdMOmnQUfk7pnl7HtDYmWWMslQuksuAyRXuGR3xfcMULwgnxTS0dZSbBaRTOpG
	4hnk7Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh1mr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0532a6588so61057945ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081542; x=1781686342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2hl234ksIEm1RHOdsRVt2VAQnwYkyTNif63obZpEqg=;
        b=jvdPs8kZWJmoCbguIYnVnvpKKtdORyoE4+lQn/p8iPP9RdA8UB05pG/twoeke8ynWo
         pH+Y+BX6kq4075bx7H4uYnCVjLAVE7eqEVKsPv7ioduoDd3d/HgQ8sVaEO5nDJZOFHbT
         /Y4+8fBCM+90qC7D/MO5jtNTFMYK4q0iMQFsQimaGBgAyQrTsSTUZnZ0hSHWMTxJqYUe
         e0LjPEnjChwi9L2Iswtjq9g6O19LtTxNdsa18trA+ih66OmR4ALS+F1WVe/YrRLc+4rb
         1xMr9W7qDZ/7YDAFgPFBSGLnDyYBEOqPHeE5+sLSSKFBLMO4ud1xFCRkrHvmn2iFHP++
         WuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081542; x=1781686342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i2hl234ksIEm1RHOdsRVt2VAQnwYkyTNif63obZpEqg=;
        b=RD+g537WC5b/sLRMQhdw0xytYkBD/IyYNGk2oAZlwyJR0cAXuzyNWZE2cYB0uepHKJ
         Lq5f8adgQ2EmZPX6Nx7xl6ddBIidE9nK6fdD80AzcBEVgU2ZHk5SPU09LFzloSagtSWb
         /f35ZWlX2Pt5EHgZImvl+cJQOt1v7eX8fa9vmSRvMSLwuun38fTDpd+4TssOoU+llp0W
         rKVQr9V3OGJywj2cDj/fWduMUSWxaedykNVTJwBWBex8lyHj/2LezaOcEXQSWzbNB+HG
         628lnUuG1HP8QA+0Kw3+H1EMiirmNAR4J6LC78Tyt0s+iapzPmLh/e8LXUS4nBvr1gR0
         R7dw==
X-Forwarded-Encrypted: i=1; AFNElJ8bdc2GmjOsA9N9/NRHH/7HenNvhOleD5L4rFpoA+i/51iaXHpWmwLEBFDStheDv/sF7pH7jz1PxH8BauO8@vger.kernel.org
X-Gm-Message-State: AOJu0YwBiLxng6bUL8+4uP44GYS+MdKTnpAHboT+E+ZGwNezB/fwBpQP
	DY52Of4anI7sjkFllKXVjB1hjleacscjUBI8Oip/eVFZ6a4tgFdis1Cl3s48CiEkwgkxUgTAQxg
	e+EhpJZrdn0wm0LNh/a64rsTEsWx/TeOsMmXbWkXKzvLQZ+RKyAIdAwh6XyswO/O2eG11
X-Gm-Gg: Acq92OGM5DkJvkGivVNUJSbMBbmVpJbEDJR64CAlcWfxLX4sp1x2WZ0G0FYwMxCszCc
	r+O7cSLJyAGRFhutDGafEqTnlNO31q7VjdJnDMycXP01q+xzeLpIN28WOlnYGFvpaNJxbbKFVsU
	Ba5IOGmOumSyMNwulqM43lHVMWMlg+szqBP1Qr5m3s8Wy8qeJDmwHKc6KL5ZxfoMhqic2tJUI9o
	ezvYbEkKmDyYwFuTc+tkIR/U/OFJs/aJ7C4wiuG2uxc7KTGTC1L5YtxzhA6i6AG7papd30x7cm7
	eQTIwKaD+Hz6jVyogUg6zSDb8V5Z++vIrVIm7vN5KMuAEKNwZd/JA/mElHflEd1B3fDRPHnDdBI
	RTK5qJsv5jI0JcFLI4pdc+tb9l1RGtfabyWyLIJvXBfKEoLg/PY/l2+mBS2FjYIXGj+qP4wdVk3
	esZ7dt8tGyKHjJcF6Sml3jmErJg9wloDwVwr/GlgrnO8EQdcRYUzMGM2pwbHg=
X-Received: by 2002:a17:902:f608:b0:2c0:baaa:db94 with SMTP id d9443c01a7336-2c1e881fd52mr266012245ad.22.1781081542459;
        Wed, 10 Jun 2026 01:52:22 -0700 (PDT)
X-Received: by 2002:a17:902:f608:b0:2c0:baaa:db94 with SMTP id d9443c01a7336-2c1e881fd52mr266012015ad.22.1781081542021;
        Wed, 10 Jun 2026 01:52:22 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:21 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:31 +0530
Subject: [PATCH RFC v7 4/9] PM / devfreq: Add new target_freq attribute
 flag for governors
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-4-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=7702;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=37NxbrW1EfFxbpoUejE/ZkFqRHFRkvYdYd39MI8qo+s=;
 b=W2YwkcFEZ5IJT5/BN4jcRVsu+M3gLs8KmACdb/DaAC0FZxActyPflb7dcQI3MNy0IpcPTz95u
 UBtczXw4hFBDkwsTXTzL3xmtnru2Kr0uwjm8jtUQ4lPWKylW53WgoTs
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX6SpVuZhdJTAO
 AFLx2efddmA7Eg67IpsRNnio3/yMyBR8qFS9Im3lTuJKHiX/DI7ur03SXS+TQBj9WCEA6uaxZ1D
 jbf3E7GjxxBESs1SdLmI9bfSDvLTmf9MIgg+81WulE7s1+fo1+Jv5dIUPqItJnAZ/W2Da9JH5c5
 RhaYahAYxkYc9wOkO0eUKQEIJrkfbfseDyxvgQoMzYRQ7yS21Fcp1/+umGUcw7mi5rbZGz6UyZm
 2YZD4mHddTXn7hrb+omvqtk/5CJ9wv1pxCSlyo+B0+cDFrUQTXCscmoo+cOtGZgazYkj2Wm/i0x
 hyYIqOIKmc7RFU98YZh/jM/4GeqTqxjN0BMeg3vHEmTh3pcwhx8q/+3yn+M48TGvVzsRj9iKp4S
 86xmmKs4tPXxkmBWm5ozPglLGSmxkEyMSa2T2pGrAEvY76ryTnESH+b+n5cFl1qSy4rBZ0MBbpw
 XvSA4sPMAz8+S8goj/g==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a2925c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hD80L64hAAAA:8 a=WcTcrbn6WVXM4q_icv8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: qI5TT1_n7ubjSGcBioDOLBu5MkGepgzD
X-Proofpoint-GUID: qI5TT1_n7ubjSGcBioDOLBu5MkGepgzD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112358-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,oss.qualcomm.com,samsung.com,gmail.com,nvidia.com];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:pragnesh.papaniya@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,samsung.com:email];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A10186677DB

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

The target_freq sysfs attribute exposes a governor's predicted next
target frequency. Not every devfreq governor has a meaningful value
to report there; some merely observe an externally-driven device.

Add a DEVFREQ_GOV_ATTR_TARGET_FREQ attribute flag that governors with
a meaningful target frequency must opt in to. Gate the existing
target_freq sysfs read on the flag and return -EINVAL when the active
governor does not advertise it.

Tag all in-tree governors that already populate previous_freq via
get_target_freq() so visible behaviour stays unchanged for in-tree
users. Out-of-tree governors that drive frequency updates and want
to keep target_freq readable need to set the new flag.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-class-devfreq | 8 ++++++++
 drivers/devfreq/devfreq.c                     | 6 ++++++
 drivers/devfreq/governor_passive.c            | 1 +
 drivers/devfreq/governor_performance.c        | 1 +
 drivers/devfreq/governor_powersave.c          | 1 +
 drivers/devfreq/governor_simpleondemand.c     | 1 +
 drivers/devfreq/governor_userspace.c          | 1 +
 drivers/devfreq/hisi_uncore_freq.c            | 1 +
 drivers/devfreq/tegra30-devfreq.c             | 3 ++-
 include/linux/devfreq-governor.h              | 3 +++
 10 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-devfreq b/Documentation/ABI/testing/sysfs-class-devfreq
index df8ba88b9f6a..5be9940a5853 100644
--- a/Documentation/ABI/testing/sysfs-class-devfreq
+++ b/Documentation/ABI/testing/sysfs-class-devfreq
@@ -37,6 +37,14 @@ Description:
 		The /sys/class/devfreq/.../target_freq shows the next governor
 		predicted target frequency of the corresponding devfreq object.
 
+		Reading this attribute returns -EINVAL when the active
+		governor does not advertise DEVFREQ_GOV_ATTR_TARGET_FREQ.
+		All in-tree governors that drive frequency transitions tag
+		this attribute, so existing in-tree behaviour is unchanged.
+		Out-of-tree governors that previously relied on the
+		unconditional read of df->previous_freq must opt in by
+		setting DEVFREQ_GOV_ATTR_TARGET_FREQ in their attrs field.
+
 What:		/sys/class/devfreq/.../trans_stat
 Date:		October 2012
 Contact:	MyungJoo Ham <myungjoo.ham@samsung.com>
diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index f08fc6966eae..2f27a239e34a 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -1530,6 +1530,12 @@ static ssize_t target_freq_show(struct device *dev,
 {
 	struct devfreq *df = to_devfreq(dev);
 
+	guard(mutex)(&devfreq_list_lock);
+
+	if (!df->profile || !df->governor ||
+	    !IS_SUPPORTED_ATTR(df->governor->attrs, TARGET_FREQ))
+		return -EINVAL;
+
 	return sprintf(buf, "%lu\n", df->previous_freq);
 }
 static DEVICE_ATTR_RO(target_freq);
diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
index d7feecd900f1..b75e4bbee4b1 100644
--- a/drivers/devfreq/governor_passive.c
+++ b/drivers/devfreq/governor_passive.c
@@ -448,6 +448,7 @@ static int devfreq_passive_event_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_passive = {
 	.name = DEVFREQ_GOV_PASSIVE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE,
 	.get_target_freq = devfreq_passive_get_target_freq,
 	.event_handler = devfreq_passive_event_handler,
diff --git a/drivers/devfreq/governor_performance.c b/drivers/devfreq/governor_performance.c
index fdb22bf512cf..b9ec587f582c 100644
--- a/drivers/devfreq/governor_performance.c
+++ b/drivers/devfreq/governor_performance.c
@@ -37,6 +37,7 @@ static int devfreq_performance_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_performance = {
 	.name = DEVFREQ_GOV_PERFORMANCE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_performance_func,
 	.event_handler = devfreq_performance_handler,
 };
diff --git a/drivers/devfreq/governor_powersave.c b/drivers/devfreq/governor_powersave.c
index ee2d6ec8a512..69eab1d0a7fc 100644
--- a/drivers/devfreq/governor_powersave.c
+++ b/drivers/devfreq/governor_powersave.c
@@ -37,6 +37,7 @@ static int devfreq_powersave_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_powersave = {
 	.name = DEVFREQ_GOV_POWERSAVE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_powersave_func,
 	.event_handler = devfreq_powersave_handler,
 };
diff --git a/drivers/devfreq/governor_simpleondemand.c b/drivers/devfreq/governor_simpleondemand.c
index ac9c5e9e51a4..65ff9d912ef9 100644
--- a/drivers/devfreq/governor_simpleondemand.c
+++ b/drivers/devfreq/governor_simpleondemand.c
@@ -118,6 +118,7 @@ static int devfreq_simple_ondemand_handler(struct devfreq *devfreq,
 static struct devfreq_governor devfreq_simple_ondemand = {
 	.name = DEVFREQ_GOV_SIMPLE_ONDEMAND,
 	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TARGET_FREQ
 		| DEVFREQ_GOV_ATTR_TIMER,
 	.get_target_freq = devfreq_simple_ondemand_func,
 	.event_handler = devfreq_simple_ondemand_handler,
diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
index 3906ebedbae8..d1b765a7b8e5 100644
--- a/drivers/devfreq/governor_userspace.c
+++ b/drivers/devfreq/governor_userspace.c
@@ -135,6 +135,7 @@ static int devfreq_userspace_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_userspace = {
 	.name = DEVFREQ_GOV_USERSPACE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_userspace_func,
 	.event_handler = devfreq_userspace_handler,
 };
diff --git a/drivers/devfreq/hisi_uncore_freq.c b/drivers/devfreq/hisi_uncore_freq.c
index 4d00d813c8ac..0800116e3334 100644
--- a/drivers/devfreq/hisi_uncore_freq.c
+++ b/drivers/devfreq/hisi_uncore_freq.c
@@ -399,6 +399,7 @@ static struct devfreq_governor hisi_platform_governor = {
 	 * Set interrupt_driven to skip the devfreq monitor mechanism, though
 	 * this governor is not interrupt-driven.
 	 */
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
 	.get_target_freq = hisi_platform_gov_func,
 	.event_handler = hisi_platform_gov_handler,
diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 401aac6a9f07..fcb278c4a74c 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -776,7 +776,8 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor tegra_devfreq_governor = {
 	.name = "tegra_actmon",
-	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL,
+	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE
 		| DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
 	.get_target_freq = tegra_governor_get_target,
diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
index dfdd0160a29f..2853f571dfdf 100644
--- a/include/linux/devfreq-governor.h
+++ b/include/linux/devfreq-governor.h
@@ -43,9 +43,12 @@
  *   : Indicate polling_interval sysfs attribute
  * - DEVFREQ_GOV_ATTR_TIMER
  *   : Indicate timer sysfs attribute
+ * - DEVFREQ_GOV_ATTR_TARGET_FREQ
+ *   : Indicate the target freq sysfs attribute
  */
 #define DEVFREQ_GOV_ATTR_POLLING_INTERVAL		BIT(0)
 #define DEVFREQ_GOV_ATTR_TIMER				BIT(1)
+#define DEVFREQ_GOV_ATTR_TARGET_FREQ			BIT(2)
 
 /**
  * struct devfreq_governor - Devfreq policy governor

-- 
2.34.1


