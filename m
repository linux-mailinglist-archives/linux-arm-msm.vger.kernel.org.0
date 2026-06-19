Return-Path: <linux-arm-msm+bounces-113873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jM8VBEqpNWqd2gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 22:40:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F696A7AD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 22:40:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="SXvc9/4G";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JFneWPWq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113873-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113873-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BCA03039819
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 20:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735E33B47F7;
	Fri, 19 Jun 2026 20:39:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EFD344DAE
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 20:39:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781901568; cv=none; b=WlFy4NYPHegOvgPMM3l4XgDT/ljVETx6+1h5wZ6QmsR/PBpVxmgUut++E8fKTgF60hZ7Q45sM7EPTADHUN/fYaP7tLaL43h4HYDNkjxf2qopdni+UKyCZ/xhTxUZP8XoeIFGhadNs7IDx1dDiSfHNAI3gh9rynP4l0Xp/mgr75E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781901568; c=relaxed/simple;
	bh=mzAivGquTuxKJRNPNyBa88Cm3gzCu0h5ZhS95ueAnpQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nnX5AzgdizopMfr0m1LeL2Tr/hTWhx6CP07Zj2dObQK/2fVlfQzT9xB/o3RP3BFL3k1hli3jdQ6ExzbB1ezkWESJyklDdzu6+t7gQlrVs6uwTomVYV8o1o3vU9Lm85ettfBxpvhmokrcA2HK1xrJUQHw7e+7EWzd9lYbWWZLN7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXvc9/4G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JFneWPWq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JHSgtc3569075
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 20:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1LGsZZQGHjPFgChcl2b+wr
	rmhmSGdGUPrKtAPR68/hA=; b=SXvc9/4G06P1rvR5AKZ/HM6mwLZceIQFPMxbif
	093N7oZCdd3kRgdtNsddI/Uph0FFq6NayCvRiJQbU3T3jTgPD3YSqfraWghXQVN0
	mc4/6M6l846Cjoq3lZ94iWcfGw3dY919ts2D2aT3zdILzA5GL8wrSPh4Hxj/3mt2
	JR3V8EcDTtu+90WEyTYV1/xvU7biuNeXJRyoW1Q24d2euSx5y13BL7bzQYcXRH/x
	TzJbmB70imCHzAivuxBzvxR2Je6aQOBDGCIzKa/IXZ349xt5leos6raG7LVSLhhv
	9v22eK2o/eJYb1dLj1oYWdmet5WmaSzwtnS8Mm57IgBjsJJg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmyrd658-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 20:39:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8426ed9f24dso2027380b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 13:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781901566; x=1782506366; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LGsZZQGHjPFgChcl2b+wrrmhmSGdGUPrKtAPR68/hA=;
        b=JFneWPWqIKwt76JaoySf4N3j2s3OjJC8ejBlvRF7HYQWUyfSiavnp6rnCbcDStzfxd
         SnJ2a94Uzq/suEEjF8c8wnv3ULLLC3BKYYGhyQGP0kk31wM6tQ76X7Cqht08cv5CU46t
         R8fPD67jyXw7RNZTiykQ3AY6JsCxS+UMiI1JxSuVfA5Sv9I5CI5FNXgVNLbILQ5zoFKD
         R3MybJDGJyGLtyjT1Q05ornLMu7prC/zeMaUKkdghVPNSgTh8ybbBIoMQxKKj6IvKZDZ
         VzhVZy7zG3VqxVyMLqDnRd9BR/rSrZubDmME3rQGkxV/9VMV7DnEIjLDxcRo0WzSXRXW
         KFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781901566; x=1782506366;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LGsZZQGHjPFgChcl2b+wrrmhmSGdGUPrKtAPR68/hA=;
        b=lQI7FzrMUAhOeVVrg/AHrBrI6NGI6cZfl9N+Dx0NVXFK65zJ3H+HjgkbzYVwZFprrG
         FY/+wVuLAkQwIiYb+gEp5F288weHiBwl1+7vvpuMMUZUmyDhVA7Sp1qGV+Et3Bhuznj5
         iEZtxJMAf7ixVmHmfi52a1tQBue3dK6E1DZy7YNlLspGErEcgatrhDjJZTEtXZc8mRAB
         oWtaDg4pDYycPN9KUPEY17Q2hVs/Mv2IMjFnJChojiIeCH3Kz4jO/JQu3VX5EV86PZKn
         qd78lsHwjl1e2Ece/WqeqXMA8gVoH2uB71A3PPFDqlp6YyzQ5ooTl9D5jX3IAgX0zeaQ
         EDHg==
X-Forwarded-Encrypted: i=1; AFNElJ9yUcyluk8CWEhU2OWnR05uWRAh6mIAz6IBJy7XPRGp3/dUDA5QXPmCeRRzkTBwbNmIV5hXHsKnUsXf/wpx@vger.kernel.org
X-Gm-Message-State: AOJu0YxN4DikTVzdBfaM0gmuIXbg48EVwMdBh2yddy1bjJPFy/e3+f2I
	BRLhpy71s+Q2nECx8IvQj0VolBp+Az2wlSpAAJ8TG7h44GO+YrSlDvNl4IIY4c9IvzZ7mKImGE6
	+VAheFF3modlSboUHUdLOUeb5/A7/TBUvMqDBj/qDpEeydDRJXx2KmqxN8vmlKUa2algH
X-Gm-Gg: AfdE7cn997BO+UHR7loFV7GCQ8wpPsSSLAx+1ylfhQLVXX3CLzgId845NSWPJFZJMxx
	ZzgJ+yPoshVUXQKr67utNJaM/o+g0fw8eMQwz/n79+ajdwcAV7SoNGa4qeIx6TxzkE9k7ctNRwR
	yGMJvz6Eb0SYWsE4T8kSqR6463zAsUIsSIB31/UIn5jo6ArmZ+Z74lgPeev5W7OPp4EUSVn0913
	Lc05N5yQhqkkYtcPUupKfHHKjSyb0DCRHj2T3t6KVV5ySs3a7+unAwIFGsEDDLq+kPgT8Yi/x2M
	or29WO8NdhjQklPTg2F8vKy9TYg2H40zFYIlBAqdgxVqQEi8C7CAvQGIRGSch5B6IjCr/+g/HmF
	VnTHe7aaN2HLWqM1ZLwUeH5vZExM1IwN1KnGYtnr7/E5y0w==
X-Received: by 2002:a05:6a00:9a7:b0:837:8342:abe5 with SMTP id d2e1a72fcca58-8455023798fmr4319446b3a.18.1781901565695;
        Fri, 19 Jun 2026 13:39:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:9a7:b0:837:8342:abe5 with SMTP id d2e1a72fcca58-8455023798fmr4319427b3a.18.1781901565110;
        Fri, 19 Jun 2026 13:39:25 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ecd779sm94190b3a.53.2026.06.19.13.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 13:39:24 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add Qualcomm SPEL powercap driver
Date: Sat, 20 Jun 2026 02:09:07 +0530
Message-Id: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOuoNWoC/43NQQ6CMBAF0KuQri3pVFvAlfcwhkA7SBOh0EKjI
 dzdwsaNMW4m+T/5bxbi0Rn05JwsxGEw3tg+Bn5IiGqr/o7U6JgJZ1wyAQUdle1KP+Cj1M4EdOU
 8+Mlh1VEAbHSucoESSdwPDhvz3O3rLebW+Mm61/4qwNb+owagjGbiKKSGOmuK08V6n45z9YiTL
 o2HbHjgH1BC9gvkGyhloQEkU7X8Aq7r+gZlLNwBGgEAAA==
X-Change-ID: 20260519-qcom_spel_driver_upstream-11efd8c85e6e
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781901560; l=2710;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=mzAivGquTuxKJRNPNyBa88Cm3gzCu0h5ZhS95ueAnpQ=;
 b=wZNSWCLWJySoGaPwV0dKLloCPK6whcIsD4RLJBATv4QwY1VfvwTagxlXN/RrcMCjd0cUcZoJM
 v87SaWd/HGKAIc2b2VlebU+np/iNYBkJ6E6vIqnnS4RhcOVqeC58Ncu
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=RZWgzVtv c=1 sm=1 tr=0 ts=6a35a8fe cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tfgfb8oKCnp2c5w_Q-EA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: EL8rmrttg9_Ot8z09YWNvM3nxbe96o9T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE5OCBTYWx0ZWRfXwednF4pi4VxU
 CE7OG8FOdrvcHSz2u82wKTCiUi9VyIjk6DkTh+KiVyx458ipflR66j9W41g6QwgseXcZtl2oewq
 /9HdXlUX45Nl8EAz7eLFaH9ENgeQnkM6OrSkkd6ucGJiANOjF/1KyKmS0C72FfLC0627Urx/+0p
 QWtsceroh9ZXV6L5C3S9fb8Ws5L8Z4ZAfYjUp1tGM7xPhITNft7iheh3BBEpjE1azeAnuF2cMmC
 u7zIoqpGcDMmXr0bZ4rem4+MdAxF0C37X5gToYauQja5ViHO0fUe9WJXGSDlscQhtsOeX05/+NU
 h07aJ7kBRfhWnBboiPJreo1aJJarW1gdbsyXcFO1OIA2kKL4GMEJWFZno/+/bkud7k65G46JXDI
 sK046G8PIxJQ1lzEH2VaedC2PQgrSoN9JUTDfWeEbOjujI0omgdF2PhALSyVa18W3rGJMouJl3/
 do4xezr8nyKZtyn7C0w==
X-Proofpoint-GUID: EL8rmrttg9_Ot8z09YWNvM3nxbe96o9T
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE5OCBTYWx0ZWRfX3p7aVQyHwYir
 5hwNgbAN1b0odzGrRoTWPD+oL70XQQf2cTE6WQeTVKBldXd6ocnCJQWRGEZ3Dtt9I4+kDvu2TE1
 gRz/q6/kEVgh6nP9T1NygQgLYk1/jJY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190198
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113873-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63F696A7AD7

This patch series introduces support for Qualcomm's SPEL (SoC Power
and Electrical Limits) hardware, which provides power monitoring and
limiting capabilities for various power domains in Qualcomm SoCs.

The SPEL hardware enables:
- Real-time energy consumption monitoring across multiple power domains
- Hardware-enforced power limits with configurable time windows
- Support for up to 4 power limits (PL1-PL4) per domain
- Hierarchical power domain organization (SYS -> SOC -> subsystems)

The driver integrates with the Linux powercap framework, exposing SPEL
capabilities through standard sysfs interfaces. This allows userspace
applications and thermal management daemons to monitor energy consumption
and configure power limits for optimal power/performance balance.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
Changes in v2:
- Fixed DT issues: corrected unit-address mismatch and made compatible
  platform-specific.(Konrad/Krzysztof)
- Cleaned up bitfield handling: switched to GENMASK, FIELD_* macros.(Konrad)
- Converted hex values to lowercase and simplified array definitions.(Konrad)
- used devm_platform_ioremap_resource_byname().(Konrad)
- Refactored data structures: merged domain data into spel_domain_info
  and removed hardcoded limits using ARRAY_SIZE().(Daniel)
- Added bounds checks (TIME_WINDOW_MAX) and fixed time window RMW
  handling (preserving reserved bits + firmware notify).(Sashiko)
- Resolved use-after-free, replaced allocation strategy, and
  added proper cleanup in .release().(Sashiko)
- Updated time window calculation logic.
- Removed cyclic dependency, improved validation logic, and aligned
  naming consistency.(Daniel)
- Link to v1: https://lore.kernel.org/r/20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com

---
Manaf Meethalavalappu Pallikunhi (3):
      dt-bindings: power: limits: Describe Qualcomm SPEL hardware
      powercap: qcom: Add SPEL powercap driver
      arm64: dts: qcom: glymur: Enable SPEL powercap driver

 .../bindings/power/limits/qcom,spel.yaml           |  47 ++
 MAINTAINERS                                        |   7 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  10 +
 drivers/powercap/Kconfig                           |  13 +
 drivers/powercap/Makefile                          |   1 +
 drivers/powercap/qcom_spel.c                       | 776 +++++++++++++++++++++
 6 files changed, 854 insertions(+)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260519-qcom_spel_driver_upstream-11efd8c85e6e

Best regards,
-- 
Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>


