Return-Path: <linux-arm-msm+bounces-118897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NRkLLGuYVWp3qgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:01:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E01E7503C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:01:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Lt5XL7Nf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CY6TtMTp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118897-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118897-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A89D302C6C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 01:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2FE12C534;
	Tue, 14 Jul 2026 01:57:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FC9274B46
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:57:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783994269; cv=none; b=UaeFJy7COjynWXAZ6AtlBz0aAXbljyh2TQ8YXwJU5dyTHdkFfjFnPWR56c9/GpdcVCSoxh+L9Gaig2tm80CxF5+c+xieObl9ljFbdAXH4+9dFWx5uIlyKoyMP0pVul1o4R0SmFRlpnM7SlsWGAUZzRqJzQ5ZtEQ4tAun6Wr7wUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783994269; c=relaxed/simple;
	bh=F2K9sEjjREWTXCiiFvgwr/QcjLlB0RgcEW4s31Wtlh0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=trmq9QeME6U5qEQppfIpssYY2ug7H2ABxGqu8LGAGcNHD5LWyVyfj1vgLpkRVlFupPHLcA3AzPcDw9eo7j5Brjjyd+Yt7AWSBP6I9NtT2S5WjBRX3SmJrzrNjTnLvAVJl/sVmgY72ypGR627EnsEL3Atpw4tZEqER/0KkXjGO8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lt5XL7Nf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CY6TtMTp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DNnNfa3063415
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tp+sv+c71VTdHi1qXlE1u1
	5U+7SzQuSNHRz9AK/D148=; b=Lt5XL7NfRoJOWWR8HMi5u8+L9Bxyt7UKH/i//O
	mk0zDHYEstNElk/MsiQ7QES0PZHqITKhrdr7jARMSK4u2ssThVffL7vrnAlqCuuE
	wLM9ZtHVHg7p+FRCPOtljYj1Tc5Tf6JWl9g/mmwF5RlBjRvpCiBj3dJ5Izwil0e5
	i+7+N3Cn8zKAXuD2lQqGW7ix0S3DM2EredYGOu2m8uXeWCBQAuD+E1AMPi7OnOCS
	ESabFpCjUNDTLaKUi+YhRn1LvloIwSP3+MFf9knwCxeuIwA9N32mK2NEcFJygi1d
	F53KKGBK6YKqnkXnZdr55AogzMwzyw5nrJpq2CoaujSo+Zag==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda3brq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:57:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848860def2cso3724767b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 18:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783994266; x=1784599066; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tp+sv+c71VTdHi1qXlE1u15U+7SzQuSNHRz9AK/D148=;
        b=CY6TtMTpJoUgSwtftr+lrHjNXglFuVBvSJdLNlCbpNVycrD4q3BIG8QSHQ8IDC+Sw9
         3uSfsboFzqGNs66dx29jpN7cmTmXsYhEJ6jqZl9X7uyvufpwW8sHLQKA+2D+dyXN4XGo
         ywKfOclkExakEC3imTxskxbhFwPpIAih8WQMaYK8yQUeR/J/zv0ykH6GZrvXHgBKRCGc
         dJCm6LaKJbu+0mJzWIiiXGGcNDFTiEcAloDrTNGOWC8RVbO9b0c9mPRLTMd4zXbZKZnD
         6I1+Jwss8N/VkJaLhM5dgSbJt2p4HL5UWJ20BCdb0GFxr8ufF2jmuhRytdubA0uKk1Xt
         W+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783994266; x=1784599066;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tp+sv+c71VTdHi1qXlE1u15U+7SzQuSNHRz9AK/D148=;
        b=KlmTt8AAkimzVBJOJLIS4LaLx3DbQ86rj+w9l8lx+3c+QItyvOEo+7StOx4jbIQk1M
         Gq8sASP+9JKWJf2m6kXNv95YEO7bfEIjoOhOiK6b8b7XGbMUN1U2Nr+oK53sbAxAiNEh
         5iNpG3EFGRBqfTtTbvl+lWF/lYJEdIH3GR1mzmjqRrgS27VOQ3btNpjYZqTPo1O7zBwL
         YEkehfrymdwfZoai9fZaGu047JLl9jj9obPIcHbYdGeLLF3hk4SQSD2ohiKZe4UExl64
         I7084PCfw7xcVpanUIw/pYTd4gybKaQSpsx4+M4wIA9T06KStFX43UtD4gHA8mM4S4Lv
         x/kw==
X-Forwarded-Encrypted: i=1; AHgh+RpQm8kYC06/2sVFswMQFm7cdV9xJUmwdpXqNDfL/mbClP1wWBKwWx3MIbZWir2rnz2Ij6pj8M1BEZCbxOxp@vger.kernel.org
X-Gm-Message-State: AOJu0YxYBY5Kv7mchtJl2hiQnllqUAVCm5nQZUgEmJjbV+AvnUurWviH
	FYqIXEBDGqht8Fc1qTocgpgRHg/tu8dAjGQ8FuXeg2ixgNRe0Rsg7Nb0ArcomMDbFAWFORt2AkV
	6+0kkLw4nWIhCKz6WbXxMed5DtgsF5YMgPlYmo6Rpv412lhx8yX8EE8OzuAImo78GXdaj
X-Gm-Gg: AfdE7cn+liHqt2G7hACLuxFZhPrwd6GJqVJAorJgcJhuJo3dC2soGeLpOppTFVWIBXy
	oAvnuPM/9z3voOXhPsTtxV+nU4pjE2D2LsOvxGflc5MVtiSThHiP4z/fb7oL5iPmdNKL9DEFq/j
	lHD2RO/T+ELrH8GTNPbmwwBonXqoU1HXLssk/ksyxSkLeOeKkOwZtOF08mbcIeOIfVyUdJbHFGf
	uKzI9o8obPiCjFbkohqkAFyE9+K0M4qZx53WqwcXN3Frqv307DzdRUDXgY+EoEqN1N3EB9UG547
	4yVvz+JHZrULkpsgPt7aub95MM49BvVNTjuXm+ZWBq530zBVUI+5gFL1yZz0JqM0LLsZuryFYbL
	4fSufK0KIEaaTm4E70D2ajSqbzIZjyS4fgvPVwDXG3JNUVeBPAP3v3xwVi15vL/1pWm8+ifsqpw
	==
X-Received: by 2002:a05:6a00:4484:b0:848:700d:c950 with SMTP id d2e1a72fcca58-8488975a906mr10015121b3a.37.1783994265797;
        Mon, 13 Jul 2026 18:57:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4484:b0:848:700d:c950 with SMTP id d2e1a72fcca58-8488975a906mr10015096b3a.37.1783994265313;
        Mon, 13 Jul 2026 18:57:45 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f29ed3dsm634191b3a.27.2026.07.13.18.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 18:57:44 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Tue, 14 Jul 2026 09:57:24 +0800
Message-Id: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWXVWoC/x3NMQrDMAxA0asEzRXEJjjQq5QOIpJiEbCLVEoh5
 O41Hd/y/wkhbhJwn05w+VhYbwPpNsFWqe2CxsOQ51zmNS1IzLh1l7C9vrF1lkDtjlHtcEJVpVy
 SEJcFRuTlovb9Dx7P6/oBzTuaNXAAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783994260; l=1206;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=F2K9sEjjREWTXCiiFvgwr/QcjLlB0RgcEW4s31Wtlh0=;
 b=nhcXZEAnqwFMvxfhtW3CN+qiVqmS7C8vIUCnVOD/G678bP0apyOiIDi0PpEatlNLYmjRNgQQA
 CrX5DtpTQwnA+B9F7EjUkpiwWwy6VWaUTVTpQ/ijdd04dI+/7Cm4ypP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAxNSBTYWx0ZWRfX44RwWmuHuXeR
 wJjOHuUpPTn+a3IO/Xib4RLg7axuHNPpoAVqkyWSibOvbmlMe82AZKJfpWedHovyg6Ft4cbproH
 91gnHwvUP5vA7Cu0Is7+tfZk7ZFPHCE=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a55979a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YMzFSpygh5mOmOF2B6YA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 0oYuH8hQVOCh-ANlC6kD_TEjQAuud46u
X-Proofpoint-ORIG-GUID: 0oYuH8hQVOCh-ANlC6kD_TEjQAuud46u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAxNSBTYWx0ZWRfX38b+cwcilHRu
 Q0HV2ZdQmfXkERnRg37sUystjQF2AsSIZVkU8Ht+nRjAzGAl602gi2+Ugu+pUARXZhaBCTKKVXK
 8qXv2y4lYbtP4h1LUSc+I5J4QnQZQwwObbL/UyvXXqKUNMkZOOVEYGKK6DhahI4mz2mZo6Z+Ycl
 gUgS6asQivSpeU46abci5QSxqX0cdmIWNdrp6n8csegRmF4XPTRxZMXaRIMCSjTgaIsS/bkebgn
 vlrmDLZl1Hclz4cEjn0V5nJ7FNIIo0aAnAJAXK3rC4ddpoT0ASN5X/6J+vCZEmIlKcR3nHZikI+
 pBGJU3fJ5aYNFitONNEeN1eyl7/+iSQ0UxHIJ5OQ3MUw/AJPLq50ng0bCNNmw+92vjE+DK3DEPs
 dpF1a6toDLLRS93y3GGqXVT+cMnKjQ55Vi9kq6jWWcyjJMJ5v4/8XcooEOeqzP7KomYJrXcCFyh
 Y2zQmw9jqnl/YzsAd/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140015
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
	TAGGED_FROM(0.00)[bounces-118897-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:jie.gan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E01E7503C6

This series adds the CoreSight debug and trace subsystem for the
Qualcomm Shikra SoC.

The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
Trace Control Unit). The CTCU on Shikra shares the same configuration as
the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
"qcom,sa8775p-ctcu" compatible.

The second patch adds the DT nodes describing the CoreSight topology on
Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
with the CTCU and the dummy source/sink endpoints that model external
trace sources and the EUD sink.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (2):
      dt-bindings: arm: add CTCU device for shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1298 ++++++++++++++++++++
 2 files changed, 1299 insertions(+)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-add-coresight-nodes-for-shikra-fffa261ead64

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


