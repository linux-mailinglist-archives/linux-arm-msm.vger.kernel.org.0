Return-Path: <linux-arm-msm+bounces-117162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QqLkI4eoTGr7ngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:19:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F28C2718632
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:19:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="PXjg+KA/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DuZjFYYR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117162-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117162-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E844A301FD73
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 07:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614D63B4EA4;
	Tue,  7 Jul 2026 07:11:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BDE3AA4E3
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 07:11:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408289; cv=none; b=hKxmcPbLP/ScR23RmRpo2fNfjvY9nL48SwJBNDZ/svBTCPJmLK0d4Gssukqs2ldjDaaOcxW/viwqkz/hAVsRLUcL68P92mpm6DzqADx3h4NPLuuFfmimnxPD5CVR9Y07pi/FtnGkWhkZ6StEtVg8b95vWjD7gVmYC+HfZxXMUPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408289; c=relaxed/simple;
	bh=eL48R+jt9Vy0uloALyKWUiD2ANlpBgAy/ZRCcJtjHbM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oxsM33B8OSZSbiAOJLJ/eMROKA/0wwz5UPCUusCHiMs/ikT7UZ9OT8ZkHSQl2V+Y9Xy54Vc1+9mX+J5xZXn4ZZg3UBugBQ1azpPNfE2qb07DWtPB7WJBfEA0F8F/yFCM0tIEuWQjBxU+LlEKbkOldd1YFUAxQ5wxWEs8ej6lJ0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXjg+KA/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DuZjFYYR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748qo02675422
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 07:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LOFlYgHVuwfuahkGIwISfQ
	vVzq3AYWaHFg0t59mafAI=; b=PXjg+KA/jnicVnyK7d1S6b7/L/2OW16HlSzoYa
	IxIzsy/NS/2TXIJ6B6TjJVENCubfolWNonFkYDkUpI4e3XKykDjAfOdPxtb5GNX6
	WgjrUMz8xivsNEJ+aY/0QYpsNi9fJcgLNqdlh1YlpGHxyfa1fv/ZbHQAMRy0bJQu
	CNelH91a0NmZAe47e4gK+Vok1w8WQQbFwEHoq7endTz+NucX2Z5slvSWY9Tb4E+4
	sT8qYBKvVVoBJcj2j6dQruOXvyNZFyOCVuSQFXw9mId6ojgsjQMFxSk48PjP1PJA
	k3g4LrSSkd9gosinPuZC2hfopfCWSEzDkS5isI4nihO7uw8g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj794xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:11:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38096521198so6235456a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 00:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783408286; x=1784013086; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LOFlYgHVuwfuahkGIwISfQvVzq3AYWaHFg0t59mafAI=;
        b=DuZjFYYRC143C3GRGBp40rxWsvIpZFZgvFzS0SwMGgfB5uFW5/7f866DZUYm/LmrnF
         kWfxnF2aU4ijOIuLdC5aZL6GzhPIRwqKr156HD1n10RpEw4slN5mKPcBqmnf3RhzDXLF
         XV/UAs73z0g940bJH2i0hbj/0fDi57KrKweKnyHEwzDNMT+5vUP5IWMeCSROgxpznGAV
         OkJRfmGTnTOJfVgCE60XCy+IOSEf1F9nMoXfPLLwD28WKHhNhI/wmBfGc3bxDu1uhjdN
         jOvBD5Be+etY6IQ72j+PnTgineYuJtdVz4Js6ZC0ijtEx0u8Yfn4sbGOqUR0MrvAi81t
         tLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783408286; x=1784013086;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LOFlYgHVuwfuahkGIwISfQvVzq3AYWaHFg0t59mafAI=;
        b=iEElFNbwHgfirqtkRcJBhSINsRjEz6NOTh3MGYhMm1okxFBwIi9vy5cd4SbikzTdug
         EtPdG9zgDInbcUmYakOcJYuipFZskA8kuM0c5C8Utgg2lnN6UdMkSVynpkOwwoQNeRqq
         yAENDsHGwDqAWRCb0gwC1no2nWWDyI7t5x0fTxz7ADctJV4WUsnkNXqDeAoFiREpvOjq
         s84hmoDq1W3Lc9fYVJzFf135Ge9hKAIjIGM0ap0z/id3pnLq0zz1PlC2QFpAOCZ9yjC0
         ivsYo76CiUSUvlSP1FdHsIT0q7Fn1PME8ktCHF9nHz0iHu/e74GSOHmzDJbfI9uRItY0
         jm/Q==
X-Forwarded-Encrypted: i=1; AHgh+RojE4+ctbcswyOEzEPCg5mBVUSsVeGUmUAsRvYHOi/z1+X2gcqlm81nMacqrwpuKZmEws0++oPPG67G1p4v@vger.kernel.org
X-Gm-Message-State: AOJu0YyUTmtbQhbxuXOP4DSgDf753PVLT1oZZvWKJKtmGcF6B/qsM9p7
	fM8YFdwG1/ZIv8Jf66zn19rUtz7WgfOtGC5N784PswIKHkPChqM7mHoXDW2bv4bq5qs3rDftxy9
	SVUGgRBCLURSn2ezv5ETMWPVtoc36ytowvT1dIxOwF+AZX46RYtERNOEY/PJ2S4KsfgozOmwqZ0
	nr
X-Gm-Gg: AfdE7cnEbPZYJF/Teks/XkxvnvMqZoL//+Rd8vL2xHdaEyUFKVG4eM9csMhonAFUHYU
	85e0HNKOUAgi6oWYKa3FHl1Z5nI1BZTsbyIaTwUJEK5bulYgKyabt1K7466WE5ZxNbHKieDBpOQ
	HVS0VT/h3+CxXGyEzEvnNemWE4bw6/tMIz6KocLwz4KFUzZyYuAc1NDkmzaqWCNjuSRx8Mf9Dhg
	FC+SHCx05d6IeGiRHHOYOPIGYHAAzRgHDvVig4R0QvtnQdvlucmH0X46wa1E1VOG+jNNRguOnQr
	bKUn/wue5Tl1mxxPtG60vpw+MorFUYkijNxP3ZOdtGViIt09vIfATIKN0vFtvlvpfV0RpT4U+li
	jAeTH5J0yYqlRL52xRsUyqC0M+1aQ2D4A6lauG3DJ+3iB
X-Received: by 2002:a17:90b:510f:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-38756dd971dmr4124282a91.8.1783408285706;
        Tue, 07 Jul 2026 00:11:25 -0700 (PDT)
X-Received: by 2002:a17:90b:510f:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-38756dd971dmr4124242a91.8.1783408285228;
        Tue, 07 Jul 2026 00:11:25 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d13fd7bfsm587326a91.6.2026.07.07.00.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:11:24 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v9 0/2] Enable sdhc inline crypto engine for kodiak and
 monaco
Date: Tue, 07 Jul 2026 12:41:11 +0530
Message-Id: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI+mTGoC/02MwQqDMBAFf0VybkIMiWhP/Q8pEtO1RprE7mopi
 P/e2F56eTDwZjZGgB6InYuNIbw8+RQzNKeCudHGO3B/y8yUVJWsVMO9gw5CcB2t85xw4b3Srta
 uN9JolrUZYfDvb7K9/pjWfgK3HJ3jMWAKfBkR7F9a1lKXlZHC6NJIxUseAdBOglL0l0Qknqt9u
 BSCyMP2/QMcNr1cuwAAAA==
X-Change-ID: 20260629-ice_emmc_support-b24c84cb5054
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: mAiYmnIgtWy42MIgsQxHUdpwzai61KkV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NyBTYWx0ZWRfXxRuBNm7n5ERt
 RRMdvHnF7mpg/yx/ZG2cJEi3IWmcRVifyKW5yM2/Dpnne1tILglmJUmAaSCviTDU83mMixvBb5U
 X5uO1H7n1q9tQUxyrRrXDvsrSLo0v4LJUFRN1Y9t0om3LSajgAU71wX+f6/PdKD7Zd4aS3MHRRH
 pNCjEkthhgw4K8o5G1saGFmcVsxqwBd09yac+ETJZju3R9paUCJRwdqqjtf3Fkxl7sUtDPmeSx8
 OSMEeldR5aTJqltI6j/PYUb3rdeOBDYDG6suu3vyRN3RQPdCjz/5MAkn4rfBJsZQmGbb/FbboDo
 36/GIo1+j6tRNQyOMlMfFFzrRAHz/lNGaFpT4sCGDJqEIqQIV8KJidnPIWAh8KiXAg6O4hoPJRo
 E1felS3ISUrEBrWXDCL4Ahc30yUOOuAegh1C+f/7ygUEebtpL+5JeGHOSEJqE9JLzi5WBsl3K0h
 dYkDjlVUW+E9f7K/ILw==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4ca69e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=xtQGQhj0aSk4Y_6bxbsA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NyBTYWx0ZWRfX1RYYA6JlA1mu
 MZtwOMqCvG9W0HqKkXn4GBAk6rXfA9DtTXW0sTdCM8Cfhq5qD3AQts9djTLZwEzkIdIcVMDVPJ/
 vyqTo19o4+gM/d9Qf4xnE+tafdaRfG0=
X-Proofpoint-GUID: mAiYmnIgtWy42MIgsQxHUdpwzai61KkV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117162-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neeraj.soni@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F28C2718632

The series is combination of below 2 series sent in past. Since, both
need to be picked together, combine them and send as one series.
- https://lore.kernel.org/lkml/20260608041650.541502-1-neeraj.soni@oss.qualcomm.com/
- https://lore.kernel.org/linux-arm-msm/20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com/

Document and wire the SDHCI to ICE relationship on Qualcomm platforms
where ICE is modelled as a dedicated DT node.

This series:
- adds the qcom,ice phandle to the SDHCI binding and enforces the
  qcom,ice vs embedded-reg modelling rule,
- enables ICE for kodiak and monaco by wiring SDHC to the dedicated ICE
  node,
- adds interface clock and power-domain requirements for the ICE node in
  affected DTS files.

How this series was tested:
- make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
  DT_SCHEMA_FILES=Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml \
  dt_binding_check
- make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CHECK_DTBS=y \
  qcom/monaco-arduino-monza.dtb qcom/monaco-evk.dtb \
  qcom/qcm6490-fairphone-fp5.dtb qcom/qcm6490-idp.dtb \
  qcom/qcm6490-particle-tachyon.dtb qcom/qcm6490-shift-otter.dtb \
  qcom/qcs6490-radxa-dragon-q6a.dtb qcom/qcs6490-rb3gen2.dtb \
  qcom/qcs6490-thundercomm-minipc-g1iot.dtb \
  qcom/qcs6490-thundercomm-rubikpi3.dtb qcom/qcs8300-ride.dtb \
  qcom/sc7280-crd-r3.dtb qcom/sc7280-herobrine-crd-pro.dtb \
  qcom/sc7280-herobrine-crd.dtb qcom/sc7280-herobrine-evoker-lte.dtb \
  qcom/sc7280-herobrine-evoker.dtb qcom/sc7280-herobrine-herobrine-r1.dtb \
  qcom/sc7280-herobrine-villager-r0.dtb \
  qcom/sc7280-herobrine-villager-r1-lte.dtb \
  qcom/sc7280-herobrine-villager-r1.dtb \
  qcom/sc7280-herobrine-zombie-lte.dtb \
  qcom/sc7280-herobrine-zombie-nvme-lte.dtb \
  qcom/sc7280-herobrine-zombie-nvme.dtb qcom/sc7280-herobrine-zombie.dtb \
  qcom/sc7280-idp.dtb qcom/sc7280-idp2.dtb \
  qcom/sm7325-motorola-dubai.dtb qcom/sm7325-nothing-spacewar.dtb

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v9:
- Rebased on linux-next tag next-20260706 (base commit 8e9685d3c41c).
- Drop dt-bindings as already picked in -next by Ulf.
- Enable ice node default for sdhc and ufs and validate DT schema(with
  dt-bindings applied locally).
- Link to v8: https://patch.msgid.link/20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com

Changes in v8:
- Added iface clock, clock-names, power-domain and disabled status in
  kodiak and monaco ICE nodes.
- Enabled ICE in board DTS files where SDHC is enabled while keeping SoC
  ICE nodes disabled by default.
- Updated trailers to reflect co-development and sender sign-off order.
- Revalidated with dt_binding_check and CHECK_DTBS for all impacted DTS.
- Link to v7: https://lore.kernel.org/all/20260608041650.541502-1-neeraj.soni@oss.qualcomm.com/

Changes in v7:
- Rebased on latest linux-next (sdhci-msm.yaml renamed to qcom,sdhci-msm.yaml).
- Added links for previous versions.
- Link to v6: https://lore.kernel.org/all/20260310113557.348502-1-neeraj.soni@oss.qualcomm.com/

Changes in v6:
- Wrapped commit message for patch (1/3) as per Linux coding guidelines.
- Signed off the patch (3/3).
- Link to v5: https://lore.kernel.org/all/20260306093332.4193993-1-neeraj.soni@oss.qualcomm.com/

Changes in v5:
- Updated the constraint for SDHCI 'v4' vs rest to reflect the 'qcom,ice'
  constraint.
- Link to v4: https://lore.kernel.org/all/20260217052526.2335759-1-neeraj.soni@oss.qualcomm.com/

Changes in v4:
- Added a new patch (3/3) for device tree changes for Monaco SoC.
- Updated commit subject of cover letter to reflect "monaco".
- Removed the text description of constraints from "description:" for "qcom,ice" and
  wrapped the code.
- Corrected the schema code to reflect the constraint of "qcom,ice" usage properly.
- Link to v3: https://lore.kernel.org/all/20260206112053.3287756-1-neeraj.soni@oss.qualcomm.com/

Changes in v3:
- Described the purpose for phandle in "description:" for "qcom,ice".
- Re-added the "if: required:" description for "qcom,ice" with proper
  encoding.
- Corrected the uppercase for base address and reg address space for ICE DT node.
- Link to v2: https://lore.kernel.org/all/20260114094848.3790487-1-neeraj.soni@oss.qualcomm.com/

Changes in v2:
- Removed the "if: required:" description for "qcom,ice" dt-binding
  as the ICE node is optional.
- Corrected the ICE dt node entry according to the dt-binding description.
- Added test details.
- Link to v1: https://lore.kernel.org/all/20251124111914.3187803-1-neeraj.soni@oss.qualcomm.com/

Changes in v1:
- Updated the dt-binding for ICE node.
- Added the dt node for ICE for kodiak.

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Neeraj Soni (2):
      arm64: dts: qcom: kodiak: enable inline crypto engine for SDHC
      arm64: dts: qcom: monaco: enable inline crypto engine for SDHC

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 13 +++++++++++++
 2 files changed, 26 insertions(+)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260629-ice_emmc_support-b24c84cb5054

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


