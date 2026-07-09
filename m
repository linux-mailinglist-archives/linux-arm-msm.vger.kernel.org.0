Return-Path: <linux-arm-msm+bounces-117997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gGFUN7+gT2o9lQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:23:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A1A731856
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:23:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="WiWpuK/z";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Oh2MJgBm;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117997-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117997-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C2F030498C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA7E279903;
	Thu,  9 Jul 2026 13:21:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C86283C93
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:21:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603263; cv=none; b=VK+tJ+m9HJ4loAZZ2fR/1ZQBrZZibH0JdyOenqB0OszUy1NzxYjYalptPAh6Bi1hwJbMdBnyGAPNqumqtIe3IxAxDf5qDy7q4TrKXs8mcq51k4XjrnoUKPjxLQ69cpy7ZSLooo3yA3fJ9oeekxeV1j3leUY9rRNlUQUDxMoxCUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603263; c=relaxed/simple;
	bh=FdEbwRGaxaxP2+aFzXzzXXq6+TMmDuzky2xTrUOc/q0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qdIRvdI2pysRfo7kGip2JrCz+TtTLXEleaVndvpMJFERc2XKxZiIGwG/gBWFlwewTFD7fMk8xVbJWMV/tc9BuTg6Jv38r45ukpwwqrgHJwHfMh19S1E1EX7cVigSa3OIxEkX24PAn11OCFmOM6DhQdADc8Ww/heAqjFN4MRseTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WiWpuK/z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oh2MJgBm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNElT1488701
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=amj0Hje94YFu3mGWB0ohs4
	vbwDZGYOIJAVDivAP7AZc=; b=WiWpuK/zRXWu6zNAjlDuFaMJJ/60xe56CoMN1k
	DgNanT24VCNt/AvFyiDp0QTp7zN/SQGjNz0bPfoLCZK7kwHds/xMGk0rFdYrx8U/
	gh7GPI7cNEHIkzI4EqMTiWaPHzPpW4uZKfEDhcdTpjrrXF5xJaRqav5pOb/cO6Y5
	3nv6C5V4a4AupDgAwpuwqwQaYgI3jnK2/mC7Wsth1UU6kiFYbHYvR8NPK9AZhQvn
	rsxinzJ8sEjoZMA1F8CcmkLB03vth2ihNFOVxmmuzBJicQ4M0towMEAOlmeRk63j
	4wVHm+VkhVNb2LPzNcexa/ryaGZ8v4lIz0OPzoL8ZJW6+vBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfud10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:20:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e55721a8cso215701785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783603259; x=1784208059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amj0Hje94YFu3mGWB0ohs4vbwDZGYOIJAVDivAP7AZc=;
        b=Oh2MJgBmShJf93zv9ecakbFvqTgDYhmuA91ZfgDzeGqOzet6z0x/cDDQrJsnO1fe6c
         oCL+FVqf3puBMV58laacYBfAT59mkqekSYvv5sEX+qWGovE95jslFQ3enmiZVbzPE1oo
         t9Zp8CnL6m0vxKn3+OYbruPlzp4ImKz9hrLYeNvsslPlE/ssJ1A0N2PzFEb0RDLtDXmp
         Q1JBQ+8RX5D3pxNT0OSHr606tG9+GqifI7QqXAzUJXYmrimp/0rWph7QYHxjG0Ks6UGV
         zRDGpWvFluhNiokaB7mwk8JVWywCfOpBRvnu3ZPctveC8bQmnRyL4Mxt/8frSfCjJSQd
         UDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603259; x=1784208059;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=amj0Hje94YFu3mGWB0ohs4vbwDZGYOIJAVDivAP7AZc=;
        b=FUXX2V64MFbfhqbDNpSh6VflbJdPlCq6Idj6OPWQ6cvVli6PW/xWsmyOmb8IfAIHNz
         ImG8G18IudYs6QeSGL4qy5vxHdRzs/NjmsItvRBBWUELuvPqOBAFM1iM9e0TRrUQPSci
         XF9I+SDRyXxbKkQf6+twJ8wU2yovlSAqcPUUgey32kCdauaTmcFZNslONpd9Zj30JCYC
         2rmwbeRvX15UFtjjYT698adENPww/UM7H3BKKSLZX3fLrSsCd5Er8uRrMcondWtXy1wY
         Zb5LpXGUqhBgbVy2bfNvQWYV5tIe5nVn32OFTABZAkzt6wghgkQ6CSVGqkPmnrAyRj9v
         hYfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYAn65exrUNM+jCZNRHJwf7jLCLlBvJHWACZZxZqSAI7roLRsooUAuu53lGizYDhpsXtXyl2YuExabbZI8@vger.kernel.org
X-Gm-Message-State: AOJu0YwwqadzDxRkAnlEiB9xUG39sTC30/e53YOHuBiZpBufC1E75pO6
	bI0c6s94kuavAlWCKWBXm7ipu0YssIy44IJaqrrThjg1vW1M2ixaSGdgO4BlnBG63hBECjqTe5s
	XGcLvlE8xHuUk61oqBc8mTZdjeJAh7dbL+IqWisoIO7gMM8u96ymq1k6Nv76hYaM5ABHJ
X-Gm-Gg: AfdE7clGAIEz7tb4jAI4zCA+qOyBtpawAV/JuBGY7ImY2mZiWRzk7x5oWcV4m7HRcIv
	2VSkOw38xpeaegYiSZ2CEHMHStLfTkG1cVMr5k6OKahI03UzZI+Gt0rtbm0YnpjF2hlI8x8Ea5P
	HJxI5IMZokh9CCXUwr837yJ+NMg29eRdgYz4eWQgvHwoPNHMoTX0L9ImwLpAL3pkulHEbUc6nPH
	Hhm+/MMyHjMMkyGQKkfFos45jk3ZI5dhjWYuFkpS3/hmQKLYllVqS+ZUhiXkOmx9Zy0Cb5nLrXq
	zu3rUg1qOBBuwKgylsuvrBemSAjAXvgpJS82dEVHjH1zE4ZFXIvkIOKun6ApyN8GrlKBOoncRF9
	CwzfeKdXMcDj+w8LxyL4M1oI6ompkw9dmS9EeqOL3FQ96O2dj+Ad9xNlAIQwpHYbDqEQAPqs=
X-Received: by 2002:a05:620a:4542:b0:92e:8fa8:829b with SMTP id af79cd13be357-92ecf5f3f2bmr764350785a.24.1783603259212;
        Thu, 09 Jul 2026 06:20:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:92e:8fa8:829b with SMTP id af79cd13be357-92ecf5f3f2bmr764345385a.24.1783603258693;
        Thu, 09 Jul 2026 06:20:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ce5126sm1654976385a.41.2026.07.09.06.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:20:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 0/7] Add initial device trees for Nord platform
Date: Thu,  9 Jul 2026 21:20:06 +0800
Message-ID: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX/OW2CpgwtAhW
 uUcLI0lcmHsKIReaX64U/kFij1vqlwiqNuAmSqj/bceTZNDhAXW/rYq/8qPcpa8xHO6IXMWYprf
 XlXLkIX/rJ2Zn8J7XNG5sLEahQwIS8afWUjr4rkw+Ccicw/NZVe1y2xtmnolkjLE8gVw823EfiE
 xj2ppixEpGAmU8IAmTVwBfSG4kXnG4F8eZRbc8TfvxN6wa/jovrDevBYMJVCcUjKLX2UPh3F0Ry
 MVyZdmPuMgFt3ei7Q2McH0FEwLkjWyAyEX0BTbfcyrz0DUe84ToSKTXD40IGfHaYwNahnQGsHTa
 R7GraPv9PSX2+29ok2IlR5xkYOncedxmJ2cU9rNZxpsX5RrnOh3PIUl9yWMEP3MXTFfv273QGcf
 nTAk6Vpm9S2EZeMGeDlVWfSoaDrDqFH8yyh1g/xDKaoclCS/ivWYZvPwOOVuBG/g31OBMjMNB9Q
 /ZCaAyNK6I02qYb3gXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX3GJ00mDGuLWI
 oXQxLO68XVQDZVZQ94D8lVU2bdijGqziMtumtn0JKo1a4+2levG9qxrifOdvl7uuFnXyM2IUfMz
 eCAAUYsgugCAm4WinP+YABjJ0ZLkcjw=
X-Proofpoint-ORIG-GUID: P79oqO7yzu8bYwAV9rqy0PduEEN4PGad
X-Proofpoint-GUID: P79oqO7yzu8bYwAV9rqy0PduEEN4PGad
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4fa03b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=avSFmSnnVhJmRsJhiZ0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117997-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93A1A731856

This series adds initial device tree support for Qualcomm's Nord SoC
and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
for Robotics.

Nord includes two variants, GearVM and Embedded. The GearVM variant has
platform resources (clocks, regulators, powerdomains, etc.) controlled
by SCMI server running on a VM. And the Embedded variant has the resources
directly controlled by Linux.

SA8797P RIDE board is built on GearVM variant, while IQ10 RRD is built
on Embedded variant.

Tested on next-20260706.

Binding Dependencies:
- ICE: https://lore.kernel.org/all/20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com/
- I2C: https://lore.kernel.org/all/20260707095708.3801043-1-shengchao.guo@oss.qualcomm.com/

Changes for v5:
- Rename nord-sa8797p.dtsi to nord-gearvm.dtsi
- Merge scmi-common.dtsi to nord-gearvm.dtsi
- Drop "qcom,sa8797p" compatible
- Add Nord Embedded variant and IQ10 RRD board support
- Link to v4: https://lore.kernel.org/all/20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Rebase on next-20260706
- 1/4: Drop useless comments from arm,gic-v3 reg property
- 1/4: One triple per line for qcom,pdc-ranges
- 2/4: Improve commit log as suggested by Konrad
- 4/4: Drop 0 polling-delay as that's the default value
- 4/4: Name PMIC thermal zones with prefix "pmic" rather than "pm"
- 4/4: Drop 135 C trip point from PMIC thermal zones as hardware will shutdown
  at 125 C
- 4/4: Have trip0 at 105 C as passive and trip1 at 115 C as critical for UFS
  and SDRAM thermal zones
- Link to v3: https://lore.kernel.org/all/20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Rebase on next-20260525 and drop patches/dependencies that hit linux-next
- Improve commit log of "Document SA8797P Ride board" to explain the need
  of SA8797P model compatible
- Fix the real issues reported by sashiko-bot
  - Fix unit address of pdp0_a2p node
  - Add missing compatible for i2c15 and spi15
  - Drop GIC_CPU_MASK_SIMPLE(8) from arch_timer interrupts property
  - Update commit log of "Add device tree for Nord SA8797P SoC" to match
    code change
  - Sort sa8797p-ride thermal trips in ascending order of temperature
  - Fix sa8797p-ride thermal zones with identical trip0 and trip1
- Link to v2: https://lore.kernel.org/all/20260519063505.883379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rebase on next-20260518 and drop dependencies that hit linux-next
- Include SoC ID changes into the series
- Include ICE binding change into the series as the prerequisite change
  from Harshal [1] was merged to qcom soc tree instead of crypto
- Improve commit log of SA8797P Ride binding change
- Use label in nord-sa8797p.dtsi for referencing nodes defined in
  the base nord.dtsi
- Link to v1: https://lore.kernel.org/all/20260427023455.236410-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com

Deepti Jaggi (2):
  arm64: dts: qcom: Add device tree for Nord GearVM variant
  arm64: dts: qcom: Add device tree for SA8797P Ride board

Shawn Guo (5):
  arm64: dts: qcom: Add device tree for Nord SoC series
  dt-bindings: arm: qcom: Document SA8797P Ride board
  arm64: dts: qcom: Add device tree for Nord Embedded variant
  dt-bindings: arm: qcom: Document Nord IQ10 RRD board
  arm64: dts: qcom: Add device tree for IQ10 RRD board

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 arch/arm64/boot/dts/qcom/iq10-rrd.dts         |  588 +++
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 1731 +++++++
 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi     | 2847 ++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4596 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts     |  240 +
 7 files changed, 10010 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/iq10-rrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts

-- 
2.43.0


