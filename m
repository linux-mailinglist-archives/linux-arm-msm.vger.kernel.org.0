Return-Path: <linux-arm-msm+bounces-112354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8hz4M4gpKWoxRwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:08:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A88667A63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:08:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="f0Y/QksB";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fAmuy5OZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112354-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112354-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B6F03034F9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF503A7F45;
	Wed, 10 Jun 2026 08:51:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0DC39A06A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:51:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081517; cv=none; b=AU/VnnmRFgPaNLNPtzb69WFANtitWSROJg/dC4LR4gIYgEv/SelxCo7/q22ojNLH+ms4QRJ2T133I265zaghSnEbyUwVG540NolFmVftNsREcEdiCD5tVy1Qz0Z2/WuKTkLz7IC1sny5tArrF6d0xOSR9wftCIPctlSc6wgmO6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081517; c=relaxed/simple;
	bh=li+NbwI6HgC/D5Vcy46y0xJkab8zM/VOUj6ekoSZb7I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h8+Ulf2lv3ZQkO/AXtAmUaSoL37KqdP0ZABiffeo79zZC58t1ZV+1/Qj+x9C4dkpdqtp5qAlIdA6CEHJTPZ3xxBmuLxT1ArIetccoboQWX+gy+rZTFCAlXULnaj8WSjUqpgNf1ZZ5MhqRBtsKZ5yJ9AhfH6NDnFzPcB9arL27lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0Y/QksB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fAmuy5OZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iKXW988923
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XyT0TY4z2OZOw5ThFSYxvj
	jXVzi8sDq5C1yLXvz+KdM=; b=f0Y/QksBH2hP1H2AHM6S4WUilquMQajIhCfmU3
	GYmRDN9PJRF7sxiOt2Z//uj3oyPVlQ2UGNU9tZHLiAlDobpCZt+loxGvdfZEwPEu
	FnwYnApNVbnB7ucpFHSaPVl9a1/S7GHycf03ecnmdPtHWX1Eg59zxExG+kIfRgFn
	C+Szcd4aG0JrPKrvHbEqG4UImJdKhqO74pVDD3oO5Fldw0I9CfqvuID4vWdFk0uX
	io7SVf5/ZTdYNS/7s4LOwz6w2lB9+PqBS4H3R9shhmbDoOwgXNrvsQ40RZrd7QUy
	m8JmA+2RrA/KddD4F5ccJ7pdkFoSPPODnBvxqNoQAjl+seKA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2seggqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:51:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c272e532so66543955ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081513; x=1781686313; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XyT0TY4z2OZOw5ThFSYxvjjXVzi8sDq5C1yLXvz+KdM=;
        b=fAmuy5OZF5pB8LSkB/NbU3aRGgWfQirxomOGkloJ6U5E7POAkGEHvxhxsHNxQS5yhU
         Nq1byq3Hwfs4SlIDNC/z8z5dkSDMaFkwWiE+X7SX8k8CU7XIl2pFOXcHZ5ru9uU28Xf9
         cxIhadXtpDUZ+td5d3RWBKSae2Jepq3hwIdFENdAVOnpaPKRK1q20mVAtAkDAQn1rDuD
         ihjYnehupzO4lmv+C91o4a7oSKYf+Z/r0AzKAuQsgQ4bFsJMD74e9G5zyNh3XruodAXi
         I+FOCzcZE+GgyodudlE7ufPKHxKsIGDe9NOSzJXmTyTzh5lDwGf7oUZj6nY1pFqOKUag
         MIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081513; x=1781686313;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyT0TY4z2OZOw5ThFSYxvjjXVzi8sDq5C1yLXvz+KdM=;
        b=PBXrI7w+2+pErh7ix9MFsUzlzMA9Ur4Ws0tGGIg/Gunh5I3/iuPYi8Z+hNkwiZ5d/2
         hEVp0b3HrnwpKre6Z3qcJaXtmgv70lOfC5le9w6z/5yM7uJCAD/h2FBp5us91aTVlfeW
         EYoVooAyPrcgOhh2APHKKUSDc19OGsY0/8ubH3+HrnI01P3L7PKoVcGMVsU7ysPfKobo
         vCxHO2jkOxtGfanJBO3VaQaeaFZeVKwDkx7pwRQFpenbnqrD7KGfQCuXDL7gSXQSr6+9
         C+oz08YsMYI2nXy46VzJNwKh/Ne38H7OpB8ffMQtv+YnkpkTuJdJCfVOuNlla+0aYMV4
         o+ww==
X-Forwarded-Encrypted: i=1; AFNElJ/shQuHi8bpO1XXwIuZwne5U4fl98GXd0+SSB4a2wqgzIA/raacGuWfNqOsNTXFIaMpd+GA0RCbyJDIbJaC@vger.kernel.org
X-Gm-Message-State: AOJu0YyPJV5QFfKviIdQtdu+3u6/J0io9RG/lscbEHe4sUBKuTQ7cG1e
	Jg+9i9tbXDlK49RpWNC2Mhj76yuMDLjB75hK9/RZLyd0AkHUDeSKOn5wAAJe4EdXXgaswK8Svv9
	xORreZjsF9SiMaKnnrnn17wjllSXhtnAlL0G3FUvXk0b1ioa8Lced+VDaKl1+3EBaYTbv
X-Gm-Gg: Acq92OFP9zPGBMpXSo10viBzqzXT+KdCSCWRcVGuSDbhzde/DQzrFAzFGUAGcMcs6ZJ
	n6zWkG/LWJthTNxnDEEq9SWSn8iAvlZBdy5myrVftiGjGeNaJvT5OPwTIbl8xCxjkzzSdIHHYNy
	qkMI8KNE3EgYqDdj7tLNXhvf+ims9fUfr5UYIb/ZyW+ZUv9MwBOFQQdWXZKGJtBKYGAXmCgywx2
	HzCEwYXRsoxNq3BKXs5mWy+qzb/xldE8gR4AmIWhAevSs0MGdAKLj3RfChLAjA7Eg6dWOLBy7xE
	NIsE7mKs9UnCk+4+kPr+EBiUvS+U26zgG5lUW7laVj78sxF0RRvP4O8lMA6m+3Xrsa6Ek1/XBdX
	oiGg8OUNm/osEUZKXTLpER9UZs6BtlNZPtynOIa3iEjFGoLJbI7d5Jvesde4FMVeYICY8KUNUb0
	c+vI2t6BjAtoZ18iDnvzlvCD+WHJeqsetbA7t3CKVpXJ1QbZDeA0aL3h21S6k=
X-Received: by 2002:a17:902:c949:b0:2c0:cb90:1e08 with SMTP id d9443c01a7336-2c1e77754d7mr284761905ad.0.1781081513251;
        Wed, 10 Jun 2026 01:51:53 -0700 (PDT)
X-Received: by 2002:a17:902:c949:b0:2c0:cb90:1e08 with SMTP id d9443c01a7336-2c1e77754d7mr284761465ad.0.1781081512683;
        Wed, 10 Jun 2026 01:51:52 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:51:52 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Subject: [PATCH RFC v7 0/9] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
Date: Wed, 10 Jun 2026 14:21:27 +0530
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJAlKWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0MD3aK05Pgy8/ji5NzM+NzU3JzEEl3jFOMUg2QDC0uzFBMloMaCotS
 0zAqwodFKQW7OSrG1tQDvBGyDaQAAAA==
X-Change-ID: 20260610-rfc_v7_scmi_memlat-3d3d0c0896d4
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
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=9506;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=li+NbwI6HgC/D5Vcy46y0xJkab8zM/VOUj6ekoSZb7I=;
 b=riygExv8QhFqBmkG2ACzxVz5l6MLkC9mC9CCke/IVm1r0Y8YjBBIaNv/FPfVfmQT6z12IJ72G
 BChJ4HJYUreDfA7xuQIXD4KRK/WD+UKAnnC08EnXEXv8gLmKAuRJ9vR
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-GUID: I8XIN8QVO6FBsFUefzN8s_jhfFWo5KA_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfXwLr4yta7CWkb
 v0+kIZM6BUUIWTmzujD73pueq2DYWjWj2gGO1PJ3AiMw5B1hRkK1QW8sjnyofTMbGNp4QnxAO8G
 hsi3ffLDLT8p94kDg5o3gqxMxzqpiJB6Wvd5PuZlOXBd1FwnKJQLW02H9T23yGjwwEwfW8WQfGo
 oX7/J1GGmL+NbU1/ceoS+bTHrh7JYrLOWIj390USHyux7POCo4R3Faxyk6M+X4/kprorhD5HOK4
 I3VDftH8YyHtOcQCr1rzJ2JsiyCM5z79aet615Ng5HsiDuVALrgO4lzPhDaJ5oIoU7sDH7WGffJ
 AYd2I0HIMXyTR7pKqlyzEg8hR+X4txViNIhXv0iIbwxFPwe1qJzGMX4cAVo8kwTq9NAyCvpQNFq
 Gs4VZ5tIewg+vdkeItbOfIycnZsL3aSIHghJCUmonwWb7GlVy+GTBEQg0N2nLPazgQVebUmEYXq
 GyN9GI96XL5aT0oCVjA==
X-Proofpoint-ORIG-GUID: I8XIN8QVO6FBsFUefzN8s_jhfFWo5KA_
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a2925aa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=I8QHn4yjjamTqNr_CmAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112354-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,oss.qualcomm.com,samsung.com,gmail.com,nvidia.com];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:pragnesh.papaniya@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:amir.vajid@oss.qualcomm.com,m:ramakrishna.gottimukkula@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: C8A88667A63

The QCOM SCMI vendor protocol provides a generic way of exposing a number of
Qualcomm SoC specific features (like memory bus scaling) through a mixture of
pre-determined algorithm strings and param_id pairs hosted on the SCMI
controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
mechanism to control the various caches and RAM is hosted on the CPU Control
Processor (CPUCP) and the method to tweak and start the governor is exposed
through the QCOM SCMI Generic Extension Protocol.

This series introduces the devfreq SCMI client driver that uses the MEMLAT
algorithm string hosted on the QCOM SCMI Generic Extension Protocol to detect
memory latency workloads and control frequency/level of the various memory
buses (DDR/LLCC/DDR_QOS). DDR/LLCC/DDR_QOS are modelled as devfreq devices
using the remote devfreq governor. This provides basic insight into device
operation via trans_stat and lets userspace further tweak the parameters of
the remote governor.

trans_stat data for DDR/LLCC/DDR_QOS is now available with this series:

     From  :   To
   315000000 479000000 545000000 725000000 840000000  959000000 1090000000 1211000000   time(ms)
   315000000:         0         3         6         6         6         7         0        30    143956
   479000000:         2         0         7         1         1         1         0         3       356
   545000000:         7         6         0         5         5         0         0        10      1200
   725000000:         3         0         5         0         6         1         0         6      2172
   840000000:         8         2         3         2         0         4         0        12      1188
   959000000:         3         0         1         2         2         0         0        13       272
  1090000000:         0         0         0         0         0         0         0         0         0
  1211000000:        35         4        11         5        11         8         0         0     21684
Total transition : 253

QCOM SCMI Generic Vendor protocol background:
A lot of the vendor protocol numbers used internally were for
debug/internal development purposes that were either highly SoC-specific
or had to be disabled because some features were fused out during
production. This led to a large number of vendor protocol numbers being
quickly consumed and never released. Using a single generic vendor
protocol with functionality abstracted behind algorithm strings gives us
the flexibility of letting such functionality exist during initial
development/debugging while still being able to expose mature features
(like MEMLAT) once they have stabilised. The param_ids are expected to
act as ABI for algorithm strings like MEMLAT.

Thanks in advance for taking time to review the series.

Changes in v7:
 - Minor bug fixes and documentation improvements based on review feedback.
 - Significantly expand the QCOM Generic Vendor Protocol documentation
   with a dedicated MEMLAT section covering all param_ids, payloads and
   return values [Sudeep, Cristian].
 - Move per-SoC event IDs and hardware type identifiers from the driver
   into the platform configuration header.
 - Poll devfreq at twice the CPUCP sampling rate so every firmware voting
   cycle is reliably observed [Lukasz].
 - Add a devicetree binding schema for the Qualcomm SCMI vendor
   protocol@80 node.
 - Link to v6: https://lore.kernel.org/r/20260507062237.78051-1-sibi.sankar@oss.qualcomm.com

Changes in v6:
 - Combining vendor protocol and the client and moving it
   back into RFC mode.
 - Introduce target_freq attr flag and TRACK_REMOTE devfreq
   governor flag.
 - Add basic remote devfreq governor to give users data like
   transtat [Dmitry]
 - Drop the current design that relies on manual parsing of
   device tree data and move those into SoC specific structs
 - Add Glymur/Mahua/Hamoa/Purwa support in the same series.
 - Link to v5: https://lore.kernel.org/lkml/20241115011515.1313447-1-quic_sibis@quicinc.com/

 Changes in v5:
 - Splitting the series into vendor protocol and memlat client.
 - Also the move the memlat client implementation back to RFC
   due to multiple opens.
 - Use common xfer helper to avoid code duplication [Dmitry]
 - Update enum documentation without duplicate enum info [Dmitry]
 - Update the protol attributes doc with more information. [Cristian]
 - Link to v4: https://lore.kernel.org/lkml/20241007061023.1978380-1-quic_sibis@quicinc.com/

Changes in v4:
 - Restructure the bindings to mimic IMX [Christian]
 - Add documentation for the qcom generic vendor protocol [Christian/Sudeep]
 - Pick up Rb tag and fixup/re-order elements of the vendor ops [Christian]
 - Follow naming convention and folder structure used by IMX
 - Add missing enum in the vendor protocol and fix documentation [Konrad]
 - Add missing enum in the scmi memlat driver and fix documentation [Konrad]
 - Add checks for max memory and monitor [Shivnandan]
 - Fix typo from START_TIMER -> STOP_TIMER [Shivnandan]
 - Make populate_physical_mask func to void [Shivnandan]
 - Remove unecessary zero set [Shivnandan]
 - Use __free(device node) in init_cpufreq-memfreqmap [Christian/Konrad]
 - Use sdev->dev.of_node directly [Christian]
 - use return dev_err_probe in multiple places [Christian]
 - Link to v3: https://lore.kernel.org/lkml/20240702191440.2161623-1-quic_sibis@quicinc.com/

Changes in v3:
 - Drop container dvfs memlat container node. [Rob]
 - Move scmi-memlat.yaml to protocol level given that a lot of vendors might end up
 - using the same protocol number. [Rob]
 - Replace qcom,cpulist with the standard "cpus" property. [Rob]
 - Fix up compute-type/ipm-ceil required. [Rob]
 - Make driver changes to the accommodate bindings changes. [Rob]
 - Minor fixups in subjects/coverletter.
 - Minor style fixes in dts.
 - Link to v2: https://lore.kernel.org/lkml/20240612183031.219906-1-quic_sibis@quicinc.com/

Changes in v2:
 - Add missing bindings for the protocol. [Konrad/Dmitry]
 - Use alternate bindings. [Dmitry/Konrad]
 - Rebase on top of Cristian's "SCMI multiple vendor protocol support" series. [Cristian]
 - Add more documentation wherever possible. [Sudeep]
 - Replace pr_err/info with it's dev equivalents.
 - Mixed tabs and initialization cleanups in the memlat driver. [Konrad]
 - Commit message update for the memlat driver. [Dmitry]
 - Cleanups/Fixes suggested for the client driver. [Dmitry/Konrad/Cristian]
 - Use opp-tables instead of memfreq-tbl. [Dmitry/Konrad]
 - Detect physical cpu to deal with variants with reduced cpu count.
 - Add support for DDR_QOS mem_type.
 - Link to v1: https://lore.kernel.org/lkml/20240117173458.2312669-1-quic_sibis@quicinc.com/

Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
Pragnesh Papaniya (1):
      dt-bindings: firmware: arm,scmi: Add Qualcomm Generic Extension Protocol

Sibi Sankar (8):
      firmware: arm_scmi: Add QCOM Generic Vendor Protocol documentation
      firmware: arm_scmi: vendors: Add QCOM SCMI Generic Extensions
      PM / devfreq: Add new target_freq attribute flag for governors
      PM / devfreq: Add new track_remote flag for governors
      PM / devfreq: Add a governor for tracking remote device frequencies
      PM / devfreq: Introduce the QCOM SCMI Memlat devfreq driver
      arm64: dts: qcom: glymur: Enable LLCC/DDR/DDR_QOS DVFS
      arm64: dts: qcom: hamoa: Enable LLCC/DDR/DDR_QOS DVFS

 Documentation/ABI/testing/sysfs-class-devfreq      |   8 +
 .../devicetree/bindings/firmware/arm,scmi.yaml     |   1 +
 .../bindings/firmware/qcom,generic-scmi.yaml       |  27 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  41 ++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   4 +
 drivers/devfreq/Kconfig                            |  21 +
 drivers/devfreq/Makefile                           |   2 +
 drivers/devfreq/devfreq.c                          |  27 +
 drivers/devfreq/governor_passive.c                 |   1 +
 drivers/devfreq/governor_performance.c             |   1 +
 drivers/devfreq/governor_powersave.c               |   1 +
 drivers/devfreq/governor_remote.c                  |  73 +++
 drivers/devfreq/governor_simpleondemand.c          |   1 +
 drivers/devfreq/governor_userspace.c               |   1 +
 drivers/devfreq/hisi_uncore_freq.c                 |   1 +
 drivers/devfreq/scmi-qcom-memlat-cfg.h             | 573 ++++++++++++++++++
 drivers/devfreq/scmi-qcom-memlat-devfreq.c         | 616 ++++++++++++++++++++
 drivers/devfreq/tegra30-devfreq.c                  |   3 +-
 drivers/firmware/arm_scmi/Kconfig                  |   1 +
 drivers/firmware/arm_scmi/Makefile                 |   1 +
 drivers/firmware/arm_scmi/vendors/qcom/Kconfig     |  15 +
 drivers/firmware/arm_scmi/vendors/qcom/Makefile    |   2 +
 .../arm_scmi/vendors/qcom/qcom-generic-ext.c       | 153 +++++
 .../arm_scmi/vendors/qcom/qcom_generic.rst         | 647 +++++++++++++++++++++
 include/linux/devfreq-governor.h                   |   8 +
 include/linux/devfreq.h                            |   1 +
 include/linux/scmi_qcom_protocol.h                 |  37 ++
 27 files changed, 2266 insertions(+), 1 deletion(-)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260610-rfc_v7_scmi_memlat-3d3d0c0896d4

Best regards,
-- 
Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>


