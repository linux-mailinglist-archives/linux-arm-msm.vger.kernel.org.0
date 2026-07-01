Return-Path: <linux-arm-msm+bounces-115565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v64IL+yVRGpKxQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 06:22:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5392A6E9ABB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 06:22:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hDHPWblK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UeYtEVPG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115565-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115565-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEE063030F04
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 04:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E6240D564;
	Wed,  1 Jul 2026 04:21:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0813921D6
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 04:21:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782879704; cv=none; b=Pb7INEkeVkKTbmnuRg0gDphZegDu5F951h4oczpF1NiCqrQJ0kpNK7OF7vqSMBwryyXT75LdMmEX2syLTLIpVl/VEAlx/9XYNKI8fvhWdh9Wj1Hua8wUm4CoyIhJjy1Md2jtt0gnS/qrl7QdZfz9C8C0PiYv82ICW/DAwwF3dJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782879704; c=relaxed/simple;
	bh=ZUy7KFF5N05/gVxfiJeZnuspuVmxoUm4o80HqIfijFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z9vmHzwtj3WTOI2x64ZHO5p0tr2/ZsyqA7etGxPx4SRT1WNNGN8r8vSA6akJk8KGrDZEnnPfI2bXVCSrxYFO3bEXJio5t2bUYxNM5ezKM52RLzkNQZuRqxJ/+0qlx/rrTLtB/cI3g3nyO4/l154KX8X/FZ5vfNnMGwX4eY8veQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDHPWblK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UeYtEVPG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6612tcpQ3944865
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 04:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4Zb97i0OtIaJ4qy3+GR60n
	BQ+dBCqeYmIUzW59vvjaU=; b=hDHPWblKUYoKCbXEl3mQjFR83kW3oALrFL+bkQ
	DZg4t7OwpJd0uFGEBdoD9eN55Hzio5W64ICBDYGINgM0swavDa3zc7rm1vRluzDO
	+u4+MegFOw5ijhfnt2Id6UusRRWbfsRMdVrVRHGvUuXiPENn/ueEZK3+G6Cl5XlX
	sL2jbKGVMNntBMEwQvM8I9hHMi/ZzthGIOxAJOK06UEqHvy8AmbtcZLo9bxWZKec
	ZhaFv22f3SQz29VaoXMIpW9RHsjtLGWxkuqm0MZxK4Fi0QnV68UoVFjNpKJAY9dD
	A5+iLv1Lhbs3jyv/UFpDCJfR8gtDtQ4zfzQREKrixwu/xgyQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0atp5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:21:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c42d96713so246454eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 21:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782879695; x=1783484495; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zb97i0OtIaJ4qy3+GR60nBQ+dBCqeYmIUzW59vvjaU=;
        b=UeYtEVPGYYQpGNGCbTJfeerijHrbTqC+U2RvEVqQKZmJvHQTf4gPOw2eUSbmWLph3c
         fohg8rlt7b2AE9zvYCfhgUjNUCsvDzx61FRV7VbcgQFQaZ9aMJxpfmNEl/dH5ddJ1DqV
         Eh+rxNVLoIOfZay0b1D1+2qRM/LQQ02u3OUghwN2C3dTzEealqJx6tfdQvDC12U3SGy1
         fUM4OFwCQunusMd8jaxHiATAi8SnfQYjFQcTX1Ov3o9egjPPgqYtB6L4fPPwgKMVPuof
         MTWI7bUdVkb6nHBKcFb3WGOyLKuorPPRBKk1h4YjLTHsi3lm7M9ndW54GH+1UU/fyXvz
         hsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782879695; x=1783484495;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Zb97i0OtIaJ4qy3+GR60nBQ+dBCqeYmIUzW59vvjaU=;
        b=FNAUbENsnCHX+3omgRZIdKHWFp8Cmrek9/pIPxS+vQX5MVkr8x5k6cs+sRodmE/uq/
         NXvPy1uwA5T06wQ0DJsJTqv6NR6TSd+yS/eZigu+JbXhuxafA+vDh/rJquabn6rpmGP9
         ORNjN5vanIK8A+qT5TcWvyx8zIXggt5Mq4wI9K5pu1M3AgbMhLOmbpu9hhjKLDioNaOc
         laYd1DhGxyYVjpbs3PuegO0ZLWYpYiBheQNMD7iu2SA+XY9vgHaAWrS6xg5RfEhJ/hH2
         3J19mOUUdSCV2wwFBekZdf7FTyop+UCX4fYdN5VEOUHlbBGdyVzJWTEah2DcDRgM+BGv
         sR3A==
X-Gm-Message-State: AOJu0Yw+M44/T9Uy4/y9tcx2KJM8Mch+u62wPLYwptYqVy1kQlouF7TM
	b8b1c/j5pDVXcH6nDik4jAc5HMeOyg0YYXQLYWcgA4ZNfW1PgrmFAQF9XyhZ6u5SVoHzdsbhRhL
	Hq4hyowBCsqnVY+usffVQY3COYyN/F44BXHsO96VVb/Um6oT91Y+oN2a94V/YcuJSxGjn
X-Gm-Gg: AfdE7cm29o6ZgH3LZencCyvJDKfCL6KPUlEbjgP8weOzb1p2NrSv9wGjutLNVhTCB0p
	nLgF7x0CzNZv3C8F+wcQ3nY3m8hjEdtDhjxBi110ocTaf5uQCBaGjiMagjSN1uUop7F0xdwqm3N
	lor84mX2C2/TGBQFOPclTnu+8rOX84w2y4trakchlypEp5FLnj0IZSG8g4TIS10/Wp2w5TypGGr
	tt5lLaulWLfaPOoNhIeQCkgi1RUxpWXNDymfeK/46q8lztYVLRGIpk4H+0vgKDkd/Fx3uetArnB
	UmSD6JF1IG2P/BYL+bLpSDn1CMXTICWGENUh5D5AldJPLTfkeCVNmDopoCegTy7EozzPDzVnMss
	uCEalVCRwtyvoiW5Ke40WpsZt7cIJPpwmqHhfpdKtcThVQ1Y=
X-Received: by 2002:a05:7300:6c9e:b0:30e:ccdc:4df6 with SMTP id 5a478bee46e88-30eff273b72mr59775eec.25.1782879695365;
        Tue, 30 Jun 2026 21:21:35 -0700 (PDT)
X-Received: by 2002:a05:7300:6c9e:b0:30e:ccdc:4df6 with SMTP id 5a478bee46e88-30eff273b72mr59745eec.25.1782879694705;
        Tue, 30 Jun 2026 21:21:34 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm20562850eec.15.2026.06.30.21.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 21:21:34 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:51:28 +0530
Subject: [PATCH v2] soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate
 firmware size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-qup-se-increase-ram-cnt-v2-1-0618a19f26c3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMeVRGoC/4WNTQ6CMBCFr2Jm7ZC2UDWuvIdhUcogNdJCB4iGc
 HcLHsDNy3yT97MAU3TEcD0sEGl27IJPoI4HsK3xD0JXJwYl1ElopXCYeuT09TaSSUc0HVo/oix
 0LhqR60prSOk+UuPee/O9/DFP1ZPsuNVtjtbxGOJnn57l5vu/MkuUeJYXXdSiUtSIW2DOhsm8b
 Oi6LAmU67p+ATtghJLXAAAA
X-Change-ID: 20260522-qup-se-increase-ram-cnt-14530f035b55
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782879691; l=4656;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=ZUy7KFF5N05/gVxfiJeZnuspuVmxoUm4o80HqIfijFY=;
 b=rZ03gOXzLxls7v6W/U5pzv5KdSDyMXPnEhm2TK/tyKkMdYCIuhg8SAYoWxvA/W5j9zJJKsDsB
 qqwISOshZMtCTgU76SX1qq/BNmvBtcFHNURqtt2N9gdtphiR3UEqa6E
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a4495d0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=FX7-I7kC4UuLIknBy2IA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: daheP_R2sUXHluXmByKQfkkn8QY5PsqM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA0MSBTYWx0ZWRfX8x4YHwmMbB+E
 hIoRoh5ExVAJAOu1pCHbpMtwMAohN7HcS532h3cW3ijK/ZBAJvERd1Kw0xRItIprycLvlb85uWT
 PUNZiABUSV+onJL/+D6cdASRxfp9elc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA0MSBTYWx0ZWRfX6Hhd/4C8q6g+
 Of4C//dh9GI2tBNaHCqRO4XWdqNKGV5CsN28eDaNouA1ZMTvhrydCP3BQYZlSoNR4i86x8FHRh7
 i/TwqhW28Ag5YuQLkdkU3jKqwXQL7W82P38IrL1pkkI6ywZOvOE8Z4DHiRPvQjqqX/wlOnK10PQ
 M5reLb9fABQ+jhFqVseHLHQN90fRAksSdfajIB3yGqekd1uWLCFcLbj6ybYDUclOvIHgoLXgE8H
 xJ+Eun+1BD3Os8deG51OpqxcUWCANvXUS9mAEWMBOhk5R2kNEpxRxjlaRAZr6nUJu2EfK1JW2Hl
 2Xmceh/vKYNSmTU6KRDL5L9fBi8ayAQXXXVVvk33zUh00nLo3UG+bUbgLHKUX3djPFOKCcDrnzJ
 +EvCxttRvzcxPl0LlDAIpo0+bnRwdDOptB2+44vxxu9RoznwcXCWvUS5OgPh7Z8XnB1mxD1DtZ4
 1esSmU1DFEi464Zc9xg==
X-Proofpoint-GUID: daheP_R2sUXHluXmByKQfkkn8QY5PsqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115565-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:viken.dadhaniya@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5392A6E9ABB

The hardcoded MAX_GENI_CFG_RAMn_CNT limit is not accurate for all SoCs:
some targets have less CFG RAM than the constant implies, while others
like QCS615 need more entries than the old limit of 455 allowed, causing
valid firmware to be rejected at load time.

Rather than hardcoding a constant, read PROG_RAM_DEPTH from SE_HW_PARAM_2
at runtime to get the actual CFG RAM depth of the hardware instance and
use that as the upper bound for firmware size validation.

Fixes: d4bf06592ad6 ("soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem")
Cc: stable@vger.kernel.org
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Changes in v2:
- Replace hardcoded MAX_GENI_CFG_RAMn_CNT with runtime read of
  PROG_RAM_DEPTH from SE_HW_PARAM_2 for per-SoC accuracy
- Link to v1: https://patch.msgid.link/20260522-qup-se-increase-ram-cnt-v1-1-71854d0b2ef0@oss.qualcomm.com
---
 drivers/soc/qcom/qcom-geni-se.c  | 23 +++++++++++++----------
 include/linux/soc/qcom/geni-se.h |  4 ++++
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index cd1779b6a91a..87907f559bd4 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -152,8 +152,6 @@ struct se_fw_hdr {
 /*Magic numbers*/
 #define SE_MAGIC_NUM			0x57464553
 
-#define MAX_GENI_CFG_RAMn_CNT		455
-
 #define MI_PBT_NON_PAGED_SEGMENT	0x0
 #define MI_PBT_HASH_SEGMENT		0x2
 #define MI_PBT_NOTUSED_SEGMENT		0x3
@@ -990,24 +988,27 @@ EXPORT_SYMBOL_GPL(geni_icc_disable);
 
 /**
  * geni_find_protocol_fw() - Locate and validate SE firmware for a protocol.
- * @dev: Pointer to the device structure.
+ * @se: Pointer to the serial engine structure.
  * @fw: Pointer to the firmware image.
  * @protocol: Expected serial engine protocol type.
  *
  * Identifies the appropriate firmware image or configuration required for a
- * specific communication protocol instance running on a  Qualcomm GENI
- * controller.
+ * specific communication protocol instance running on a Qualcomm GENI
+ * controller. Validates the firmware size against the hardware PROG_RAM_DEPTH
+ * read from SE_HW_PARAM_2.
  *
  * Return: pointer to a valid 'struct se_fw_hdr' if found, or NULL otherwise.
  */
-static struct se_fw_hdr *geni_find_protocol_fw(struct device *dev, const struct firmware *fw,
+static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct firmware *fw,
 					       enum geni_se_protocol_type protocol)
 {
+	struct device *dev = se->dev;
 	const struct elf32_hdr *ehdr;
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr	*phdr;
 	struct se_fw_hdr *sefw;
 	u32 fw_end, cfg_idx_end, cfg_val_end;
+	u32 prog_ram_depth;
 	u16 fw_size;
 	int i;
 
@@ -1066,10 +1067,12 @@ static struct se_fw_hdr *geni_find_protocol_fw(struct device *dev, const struct
 			sefw->fw_size_in_items = cpu_to_le16(fw_size);
 		}
 
-		if (fw_size >= MAX_GENI_CFG_RAMn_CNT) {
+		prog_ram_depth = FIELD_GET(PROG_RAM_DEPTH_MSK,
+					   readl_relaxed(se->base + SE_HW_PARAM_2));
+		if (fw_size >= prog_ram_depth) {
 			dev_err(dev,
-				"Firmware size (%u) exceeds max allowed RAMn count (%u)\n",
-				fw_size, MAX_GENI_CFG_RAMn_CNT);
+				"Firmware size (%u) exceeds HW PROG_RAM_DEPTH (%u)\n",
+				fw_size, prog_ram_depth);
 			continue;
 		}
 
@@ -1193,7 +1196,7 @@ static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
 	int ret;
 	struct se_fw_hdr *hdr;
 
-	hdr = geni_find_protocol_fw(se->dev, fw, protocol);
+	hdr = geni_find_protocol_fw(se, fw, protocol);
 	if (!hdr)
 		return -EINVAL;
 
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 0a984e2579fe..16d68622954a 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -118,6 +118,7 @@ struct geni_se {
 #define SE_DMA_RX_FSM_RST		0xd58
 #define SE_HW_PARAM_0			0xe24
 #define SE_HW_PARAM_1			0xe28
+#define SE_HW_PARAM_2			0xe2c
 
 /* GENI_FORCE_DEFAULT_REG fields */
 #define FORCE_DEFAULT	BIT(0)
@@ -285,6 +286,9 @@ struct geni_se {
 #define RX_FIFO_DEPTH_MSK		GENMASK(21, 16)
 #define RX_FIFO_DEPTH_SHFT		16
 
+/* SE_HW_PARAM_2 fields */
+#define PROG_RAM_DEPTH_MSK		GENMASK(10, 0)
+
 #define HW_VER_MAJOR_MASK		GENMASK(31, 28)
 #define HW_VER_MAJOR_SHFT		28
 #define HW_VER_MINOR_MASK		GENMASK(27, 16)

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260522-qup-se-increase-ram-cnt-14530f035b55

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


