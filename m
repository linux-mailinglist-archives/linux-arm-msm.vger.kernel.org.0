Return-Path: <linux-arm-msm+bounces-110862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RcBcH1tZH2qQkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:29:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FD96326F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:29:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="kS2R2o/T";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fThiJ2Ax;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110862-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110862-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70FBF30F4300
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 22:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96F03BCD04;
	Tue,  2 Jun 2026 22:24:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12153BB104
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 22:24:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780439070; cv=none; b=IH9AEIHWIVFT/sZcz7Vt2/9uHDOQ7WAgRqt54EI/YXweqmdEBh6v6iOpeYtOgXvopMe+Xr0FleqAP/srzWa8RHfbgnZSUJzv7CNuKD72a6tUkKoUh+dfcAcyViB1Vlag+b8yDvmRNIEijiXZVUm2iD9QnuBDh2BQpVPbQGygRU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780439070; c=relaxed/simple;
	bh=eBHbIhPU5QhnRv3FTo+WfXhuaTc1Pd3l5QTgoqveuh8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V1jOGdIgKyVUAnJgvtOAo+fyFKWaZ3jrZFElNLt8gGi5LeNUx6sxbUdBUN7d9JvJFonuhDfLyEIrPmvTu+evQVWAwJMprtUH5qXk/iXXSVFr+kSUniV1RPe6soRuJIMhve0DXmUzR3IGNd8bf4xWY4thC9UJ3q8xFDvfyEQW2As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kS2R2o/T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fThiJ2Ax; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652JCcoL1316771
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 22:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8dwmrSe4/4mK9fiPmzsrjd
	Vxh4fmXrMI9gE+cNaNCEA=; b=kS2R2o/T7zXL/PYnRZP0YhvZzwdvOCdtLlCUqM
	+gB8ATyFHNvenro/QVkIfNxuOlWX6RpZUqVv7UgFU0ebpPES92XuIlng5GbEd7bg
	biJxcyIMAccAWUoguSdMc4LXsCR/H9iP5sYg7b5/KYtuiV5mLpDF0IcYt0lVBlgB
	M7H9m3poXZ/mILHpOX7Xpn0odFoeyoKLEAOZjLPSu7HJDr8fxLaEhMkbFb3kDupS
	xC981++cvHVTWzONTYNM3+u+cs8MqyvbTgXpGzFwStv6V8dTtEHnqzdeG2W/o/aR
	8AYJ6SaP4h9JYhDlUaU6y5xEwo9BP1YenCsJ5e0FRC5mX5uw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vv2e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 22:24:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf281d523eso27439135ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 15:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780439067; x=1781043867; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8dwmrSe4/4mK9fiPmzsrjdVxh4fmXrMI9gE+cNaNCEA=;
        b=fThiJ2AxtmFu22Q3pTYfQcmCcbyajTPLp/tFWjuRf0sLSVQlrjs8eCUdI52E4pndmz
         3pR0W9Q/FD42rsIvCh6UH8pzLFyfhO4PPAX67CiRh5maW4cth0WxVClxovfVPfnbWqCU
         y2+koiaAWXyIkOZs36SvpHscQHPIv70Iul28QXlFcGD4eXEIdUvBOgIpq2Y/zKsUAPjU
         C5pl7Gp0M48PCW57kwvxI0CKq4L98I/6sQaF+zUAd/D8V6xN3vLpaZHhW4dmB+RQaZsm
         ezwJnBRFJ/VB6eqVcdwoF/YoWkYwJz0y56PqW1fuRifwwti7Sy2s79zHpfKGMdeclFjK
         ajeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780439067; x=1781043867;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dwmrSe4/4mK9fiPmzsrjdVxh4fmXrMI9gE+cNaNCEA=;
        b=nNPysPx2WfjBitdryT4NoxQ+hq2LFOFkpnrT4tttW1jV8EwALg4fBjxq4ZZYSuyBLX
         aJffHba5tpf6wmTG4yRFqp/gC/K2T3CxyjymNopEWf2ABB+S7hD6p/nprinCTX9SuaIX
         qg9/vUrjzAva801BG3OXETID+SdtHwragXZdaq1XdOJ0QH6xcrm7/ZJvylvV0Z0L2z8U
         GR7Y5j0jt4aT1qw473efx/D9PATtWQkMm2lm7Hdq+/e6vfvkMug96AoWWk2aZxCGTyab
         bZbbFZ2beiqkzS37tNsZUD5tgSBmvz/1liB5wuM/w/k+h1AfdgygVTOriFDBaK7+Rh6O
         5aUA==
X-Gm-Message-State: AOJu0YybsS7jkZ4IEj90Mh3E+7OKRHg8gQXmxiuY/OFAtRfodzGg1VFl
	I0Ew91le5x08W95pS5s9LFJONMgjQg38U6Cn14vM2lav4nrI3Vm9l9jdLEGB2qBt47E1DHj3Y7g
	KhsBfWeR3yxnEn99HC0i7CGbgVs42dDlI/DgFwd2FfHPjXJ/o7hqBeWBdwdjCjHb+TK4j
X-Gm-Gg: Acq92OF1LmHf5lymPGmyhlyZfDkyug6y2OxXUAVPbsoZbvs8gijap+fDMoF6nRp9ikt
	TacX/ItbywZLTd8B8qRhuuIYYxlbZRirZ7iWN4UyfzKLt8A+lcb3l7nZc/XzjOUmPrLWAQmiixK
	gyFxiZAqx78j9GFpNGtNumuow0o1LSM/01E14iU/vTTY00aH60b1cvw3yKPo8UU60QmDWVgmphr
	OitWHDJoOw8JruXh67ZFJB2mN1qVHlmOSRTKoSKDOnHPXEYYxeHYubAQLY2p3OYv3zAmG6MLaLN
	02zhGXuLy12IZIt3gk2Fz9fv9iv9FFEKiDRHQIAyacvrPUEteFdbt8TtMC8+4Cr/mIYcBp0DP5p
	DOlhrvj1XTjY/Eo8bWjGpwie0nyyo17czqMHVsYUii3SX0r/G8aKF2V16zkwuD9zoYt+PGg==
X-Received: by 2002:a17:902:f645:b0:2bd:63dc:b7ad with SMTP id d9443c01a7336-2c1639ee43cmr5681735ad.2.1780439067060;
        Tue, 02 Jun 2026 15:24:27 -0700 (PDT)
X-Received: by 2002:a17:902:f645:b0:2bd:63dc:b7ad with SMTP id d9443c01a7336-2c1639ee43cmr5681405ad.2.1780439066521;
        Tue, 02 Jun 2026 15:24:26 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0ecsm2698035ad.45.2026.06.02.15.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:24:26 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Subject: [PATCH v10 0/5] Enable ICE clock scaling
Date: Wed, 03 Jun 2026 03:53:52 +0530
Message-Id: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPhXH2oC/3WQ3WqEMBCFX0Vy3Uh+jBoppe9RFhnHyW5af7rGl
 ZZl370x3hRKbwJzmHznnLmzQIunwJrszhbafPDzFAcpnjKGF5jOxH0fBaaEKkUpJKcJuiGqSBy
 HGT94QBj8dOZQW9fbQhdCaRa/fy7k/Fdiv53ifPFhnZfvZLXZXT2gRpn/oZvlgmNdlFKTRSqq1
 zmE/HqDAedxzOPDTo/DbKHrLeZfD0fWQYiwuOTXJnMVOCuhR6UFgLWktNaC0NWmQ9tB39uqFtD
 vuUcKAVLvJntOCbUUUmpjqlwXtRGKSz4RLfCeh3nyfxK9sN/Ha7LEKES512tpHLFNHdvo6td4b
 07SOl2idAim2VRs9PgBKdRuRJkBAAA=
X-Change-ID: 20260601-enable-ice-clock-scaling-a89fd9434023
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: weZbSYgSuZXHDZ7Lw2QjvmsS96c86uIk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIxNyBTYWx0ZWRfX0yjcn13rApQt
 ut6va6Y3hJdTp7TQdBoNrY8j3o0myWqngrpkfzL5wE5LLEkeQmFgwCvnPwXyurfRwpb+i6N8RSR
 5c1GsJ2btj+87KDmzPKN77hq2cAXGyN7hgGzB3i1EEZxS3b73I7kVHAV0XiEouhntQUlUhaqPTM
 15XDvriL7ArRhuXSQH3O+zxljaPCTqYO0cuuok0KIi7PJ35NfwDchst+09jUK7gH1oCSbTsRDip
 gidKz/xwJ0xb3Tm1kWkvXY+2+SQ12gQQ0ASzuZfT+TwNLm/97j1DaeUSuJqFljycfl3FVSsczZy
 RLcDzZ5MVCB+La258CBdNqHW3pF1yni+WJ4PrAJQjXiRWD86lT5rx26iThvq+x0JbBdXTm0nwGu
 wUr0sogfsjMbPisrP0o+HUiok626ER7SNpD4bl/NCAuTEkTUpKS3lKI+GZCuw8blfZgU6WeTtyr
 /5pRZWJO/uTcvBZ4xyw==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1f581b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=D0JgdhPY6ITr9mA7PGIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: weZbSYgSuZXHDZ7Lw2QjvmsS96c86uIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110862-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:abhinaba.rakshit@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4FD96326F4

Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
using the OPP framework. During ICE device probe, the driver now attempts to
parse an optional OPP table from the ICE-specific device tree node for 
DVFS-aware operations. API qcom_ice_scale_clk is exposed by ICE driver
and is invoked by UFS host controller driver in response to clock scaling
requests, ensuring coordination between ICE and host controller.

For MMC controllers that do not support clock scaling, the ICE clock frequency
is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
consistent operation.

Dynamic clock scaling based on OPP tables enables better power-performance
trade-offs. By adjusting ICE clock frequencies according to workload and power
constraints, the system can achieve higher throughput when needed and 
reduce power consumption during idle or low-load conditions.

The OPP table remains optional, absence of the table will not cause
probe failure. However, in the absence of an OPP table, ICE clocks will
remain at their default rates, which may limit performance under
high-load scenarios or prevent performance optimizations during idle periods.

Testing:
* dtbs_check
* Validated on Rb3Gen2 and qcs8300-ride-sx

Merge Order and Dependencies
============================

Patch 2 is dependent on patch 1 for the qcom_ice_scale_clk() API to be available.
Patch 3 is dependent on patch 1 for the qcom_ice_scale_clk() API to be available.

Due to dependency, all patches should go through Qcom SoC tree.

This patchset supersedes earlier ICE clock scaling series (v1–v9) with updated dependencies.
Hence, this patchset also *Depends-On* the following patchseries:

[1] Add explicit clock vote and enable power-domain for QCOM-ICE
    https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com/

    NOTE: This patch is already picked and part of linux-next.
          v10 is rebased on top of this change onto linux-next.

[2] Enable Inline crypto engine for kodiak and monaco
    https://lore.kernel.org/all/20260310113557.348502-1-neeraj.soni@oss.qualcomm.com/

[3] Enable iface clock and power domain for kodiak and monaco ice sdhc
    https://lore.kernel.org/linux-arm-msm/20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com/

Patch v10 is rebased on top of latest changes picked onto linux-next for the ICE driver
which had merge conflicts with v9. Conflicting changes includes:
1. https://lore.kernel.org/linux-arm-msm/20260518-qcom-ice-fix-v7-0-2a595382185b@oss.qualcomm.com/
2. https://lore.kernel.org/linux-arm-msm/20260520155704.130803-1-manivannan.sadhasivam@oss.qualcomm.com/

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
Changes in v10:
- Rebase on top of latest changes for ICE driver conflicting with previous patchseries.
- Link to v9: https://lore.kernel.org/r/20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com

Changes in v9: 
- Kodiak ICE eMMC OPP-table entry corresponding to 300MHz is updated with SVS_L1.
- Add 75MHz for Monaco ICE eMMC OPP-table.
- Fix error handling and initialization of has_opp variable.
- Pass ULONG_MAX as target freq instead of INT_MAX from sdhci_ice_init as it better adjusts the data-type of
  the function qcom_ice_scale_clk.
- Link to v8: https://lore.kernel.org/r/20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com

Changes in v8: 
- Instead of scaling to TURBO in ICE probe, sdhci_msm_ice_init calls qcom_ice_scale_clk for setting freq to max.
- Fix error handling in qcom_ice_scale_clk.
- Fix error handling in ufs_qcom_clk_scale_notify for the call to qcom_ice_scale_clk.
- Move the registering of OPP-table to qcom_ice_probe and remove passing legacy_bindings argument to qcom_ice_create.
- Add OPP-table for kodiak and monaco ICE eMMC and UFS device nodes.
- Link to v7: https://lore.kernel.org/r/20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com

Changes in v7: 
- Replace the custom rounding flags with 'bool round_ceil' as suggested.
- Update the dev_info log-line.
- Dropped dt-bindings patch (already applied by in previous patchseries).
- Add merge order and dependencies as suggested.
- Link to v6: https://lore.kernel.org/r/20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com

Changes in v6: 
- Remove scale_up parameter from qcom_ice_scale_clk API.
- Remove having max_freq and min_freq as the checks for overclocking and underclocking is no-longer needed.
- UFS driver passes rounding flags depending on scale_up value.
- Ensure UFS driver does not fail devfreq requests if ICE OPP is not supported.
- Link to v5: https://lore.kernel.org/all/20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com/

Changes in v5: 
- Update operating-points-v2 property in dtbindings as suggested.
- Fix comment styles.
- Add argument in qcom_ice_create to distinguish between legacy bindings and newer bindings.
- Ensure to drop votes in suspend and enable the last vote in resume.
- Link to v4: https://lore.kernel.org/r/20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com

Changes in v4: 
- Enable multiple frequency scaling based OPP-entries as suggested in v3 patchset.
- Include bindings change: https://lore.kernel.org/all/20260123-add-operating-points-v2-property-for-qcom-ice-bindings-v1-1-2155f7aacc28@oss.qualcomm.com/.
- Link to v3: https://lore.kernel.org/r/20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com

Changes in v3: 
- Avoid clock scaling in case of legacy bindings as suggested.
- Use of_device_is_compatible to distinguish between legacy and non-legacy bindings.
- Link to v2: https://lore.kernel.org/r/20251121-enable-ufs-ice-clock-scaling-v2-0-66cb72998041@oss.qualcomm.com

Changes in v2: 
- Use OPP-table instead of freq-table-hz for clock scaling.
- Enable clock scaling for legacy targets as well, by fetching frequencies from storage opp-table.
- Introduce has_opp variable in qcom_ice structure to keep track, if ICE instance has dedicated OPP-table registered.
- Combined the changes for patch-series <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com> as suggested.
- Link to v1: https://lore.kernel.org/r/20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com

---
Abhinaba Rakshit (5):
      soc: qcom: ice: Add OPP-based clock scaling support for ICE
      ufs: host: Add ICE clock scaling during UFS clock changes
      mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE init
      arm64: dts: qcom: kodiak: Add OPP-table for ICE UFS and ICE eMMC nodes
      arm64: dts: qcom: monaco: Add OPP-table for ICE UFS and ICE eMMC nodes

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++
 drivers/mmc/host/sdhci-msm.c         | 24 ++++++++++
 drivers/soc/qcom/ice.c               | 93 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c          | 21 ++++++++
 include/soc/qcom/ice.h               |  2 +
 6 files changed, 219 insertions(+)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260601-enable-ice-clock-scaling-a89fd9434023
prerequisite-message-id: <20260310113557.348502-1-neeraj.soni@oss.qualcomm.com>
prerequisite-patch-id: ab9cc8bd28b2e1e27df6e44907e8d758dfeee3df
prerequisite-patch-id: 40f239f7f06573ed45452249f444e54e3565ada7
prerequisite-patch-id: 59129ed0aeba84f6b50f42261d51fe323806a240
prerequisite-change-id: 20260406-ice_emmc_clock_addition-e19f36c1fca5:v2
prerequisite-patch-id: 5b6a436bd949a93e44f912d2565103f6bf0ef55a
prerequisite-patch-id: 7f9ff2b708418a77578e154102f72f0da243eb71

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>


