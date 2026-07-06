Return-Path: <linux-arm-msm+bounces-116967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rDfYIYjgS2qcbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:06:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA84D713AAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:06:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="GK//fDZd";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="OI/Rd8B1";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116967-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116967-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E0DF3039A08
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F219D437869;
	Mon,  6 Jul 2026 16:57:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F197E43784C
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 16:57:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357027; cv=none; b=kXpBYt60CxBOWTiO38t4aPwWao5adu9AKtZJETrf0SHZt9HA+WlOwkMcvHH8fHrlcEvbYSHMMLYz1psVVnT7YBg0jCDwAXIWJELtpcPcq83ipdyUxyS1GCmEzyec83ZaJFZLAy+/1JkSiQRvtXlJTeDK49WcbqkOBj26um9EMao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357027; c=relaxed/simple;
	bh=lat7Bx/Hq+cGZXWIYs7lxJhgcpijDQh+OJ5u9DwkhsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pk4WB5vZ0JHtAU3VczsIhZjNM7CrETz5RVKfIWB8zNVpYAOyBYxssgpu8T0CQJBY5uvFsuQ/ZhPowJsZ0ZsKECMcIeLOBY7w1jYCTm5GGLNVx9jHYYKLEbuVpunNAj7Vik9rw/DExGz65ysa+XnJNzlCrYQ1xwNbY0E3f7mcyDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GK//fDZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OI/Rd8B1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFN7l972706
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 16:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eeMZFJmS8I6MvmecXMPUITG3bfspevNiFJM+WXQ5LoY=; b=GK//fDZdOHa5Ov5E
	1Q6DboppC21nvaIz6DWKAKlzeZFQ/4WZCHriDrQ0j1LPkmDsgR6RaHtRFOS2QwQ6
	sXfH/wgCUdjIMgyEc1k1T5KmZAndK5qznar5uHSUZJGNGgQzh6rB2A2miqN7qO5d
	E/BcznIboz+P6iFOz8QG4AKLxF31Pa981cqbtkVrz9O31ZD0/vu7ZqWKTyBTJLHF
	54Yiys9b2UONurX00oHr5yFZ+RtgP8i9hOodCM8pTNwJfEht+S09fQ79EHHD/H+M
	zkilUX+SHk404auE3sUt/jNueddEp6jpvp7SzalPe1p5EirkSIw9x++rTphy6CHv
	/g3/1g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r1wpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 16:56:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8895156101so4883555a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357019; x=1783961819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeMZFJmS8I6MvmecXMPUITG3bfspevNiFJM+WXQ5LoY=;
        b=OI/Rd8B1EWi9t8xAz4Qlw0ErWfhUtikAp16rMbB2huikcHYmyi0rBm0VLVpiLZWSZ0
         PNXNtQwhTgjnD8Ytut0xN+i3cicK7yptIWZDOQOl6SlzyB6kLwcjsij+tqCqXdT0XnMR
         nfqaigOEze3Rfdlcig07e9Sop54KJVmXGs8gtXFGOSC8AAsW0NRyjBrb3XI82iO8G2Gl
         46bshGnEgV99RLlGpKU2IG8bTJfsStp+ODNdqPqfSwmxzVhvPwkSIi1vgypWwuyHrheK
         Se060MY2S5fSOhAtduJwXrG0Dj3DhxL6dALYCKGogzEGK4AUwfY3MRHN/axIfsiQTa8b
         Wezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357019; x=1783961819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eeMZFJmS8I6MvmecXMPUITG3bfspevNiFJM+WXQ5LoY=;
        b=T4GXnqSYZX2bvhQL/IM90FbMCloSy8SyOiyUS+sjNn0WEpWN6ftH/ytWJ3vONAVzIy
         F9yh5DD1p99iea99EYh5aKH2oEdWAlY/uoIyF6wdh7bRi8QKVcPMptjYnOWtQhmKVwqp
         a8OTPU+LYO89wmWhLcEPTRu7ByLHxkJqydJkLdwegtF4bb0waPnLKadl8tCEz18eTocy
         s0xRdYYkyqxTrFCD/6WhEznjnE8j1lJzI/aXXB9jMcbvcMlKnnEM6citFh+Eg+R4nZLY
         pcRfKrPuxI2aoO2GYuKgUbRAUqV0HsF3gmCQT/3IKtKT2oqUY2NxXh3/JLlXb0ThQVpu
         chUA==
X-Forwarded-Encrypted: i=1; AHgh+RpRmyg7pqsFXBN1uerpylcqhbFiJ5pm6yBPHYm9cdqUdDm3QreI44RVJRefKjHkBzVKd5pkHMzA3tbLAFiL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx68XlsXzW9TdL297HRpqNF8B0sci2rxg87jyJ//WKifOB8eAEd
	shujIpCKmtTQyWG3RK/xHcavuVFlvJREPjoGejT29KX/RYZKO2vGVXg9ct8lH6Vdr2SOpbCmmQf
	667XrG4ikU83cfwp1jQvlwR1mqefOx6tUZiKBYseJ+gyojJBWU+pJxKlikYNJtPOJfEB5
X-Gm-Gg: AfdE7cl638C5RYN/Fv5LNrdgMHRh3kpJWu8mSCqKOHB5rWsGvGbgDzXmYeSRgs2G7ve
	wuZwOAWjK1eRfUuhFMEiZiZ4gcJ1YLdZc92m/pid32QyOoCoHhDr0fLHzKuyLYFaXsz4EwH5wQ6
	ieAq6VtRibfW6i/JxoKSd6XgO5YHg2Yi1isxjJvsRhN+R5nT3vtD4Wmv76Z6BKMWg4B+fEADQ1c
	MzP9go/FSVjuljGxSpE6NrSMBQpXA744XS2wEeqRyCRyEFgy6lozYQrmxKrkUWuAxW3JPztQ1MV
	Rq42SekdK6o1FWM59fwGqT3YGxDyPfStC4jkLp7E2qu3+i377eNGEoHGJJsn0TgohWP3Km5nO1o
	xsISgGITPujCMaQnaN3KzbCFqHrIFXxQH+ausd5+U2w==
X-Received: by 2002:a05:6300:67c2:b0:3bf:d487:4b38 with SMTP id adf61e73a8af0-3c08edc70dcmr1771533637.23.1783357018622;
        Mon, 06 Jul 2026 09:56:58 -0700 (PDT)
X-Received: by 2002:a05:6300:67c2:b0:3bf:d487:4b38 with SMTP id adf61e73a8af0-3c08edc70dcmr1771478637.23.1783357018123;
        Mon, 06 Jul 2026 09:56:58 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:56:57 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 22:26:35 +0530
Subject: [PATCH v3 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-smmu_interconnect_addition-v3-2-afdca0125a65@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
In-Reply-To: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=8198;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=lat7Bx/Hq+cGZXWIYs7lxJhgcpijDQh+OJ5u9DwkhsI=;
 b=nAo1SdSTHRgHqoWATvufzYzKXA6ZSzlLu/yclNPZ/Su18G0rQKinCdWabI3CJGi0YHltUYo5y
 O9zxAukcXszCKTXclXBkKXSAOAvDyoEonRQeqlyX4jAe0fn3JicK1Zr
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfXxmSKbatcWk8H
 vHD9cSoQbYl1OHmN+5hah554K4oze0gRMP2cxPLLaOO71sKXUxF9duuNumzsOE0mfiQaxZvp+vn
 WiGM/VjHW4qoMYwpv6XDKwKPDVDS/Kkd8TWmmMCNf/VYMIbB0/unpYWjNkL2S+RfskI4Dv1JdjN
 Oz8ornyTVibw+VN8rtANaymJdQDc71tb9YhAuAdIUMY5W0XSiE7SRLtNLIj1vjz2o1Xe5JWuvyW
 fr8PwMJcOrxUjF5vpFRfRnwz5PH8rGiM/PVhdhg20xgy1r1cBiFYV7/lDJcGd9wUsZtepSAx603
 y7tTM8VjxbVLU3fjqAabmnalhHfknHrJGvM83WrQ26jJtJgHBFZQi7uqauiO1+HAMxxpY23T8S/
 A85AuG1iL9BGrOxHmTwaFdbuUhc7ZKcXxgWVP1WZssoLVckkFcjqFZKdpeA/Zg4fRbrRzlSW7C1
 7Wwf2rX6R2yBoFW/Dqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX/g0Er2E8sZl/
 QF15jMXzOMCl74sDQ77wMFkibXpNhXGwYojagBRgtomHryBi5P6FCB6ThFBed8AAY7CayZKMT+9
 218rGFl/eCl2AzUwgf6HmY462bkUOo8=
X-Proofpoint-GUID: 09Mi5Acv8pPenpCQjKk391LchtVGWNEy
X-Proofpoint-ORIG-GUID: 09Mi5Acv8pPenpCQjKk391LchtVGWNEy
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bde5b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EBvdZ6k9WR3IvNukGaMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116967-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bibek.patro@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA84D713AAD

On some SoCs the SMMU registers require an active interconnect
bandwidth vote to be accessible. While other clients typically
satisfy this requirement implicitly, certain corner cases (e.g.
during sleep/wakeup transitions) can leave the SMMU without a
vote, causing intermittent register access failures.

Add support for an optional interconnect path to the arm-smmu
driver and vote for bandwidth while the SMMU is active. The path
is acquired from DT if present and ignored otherwise.

The bandwidth vote is enabled before accessing SMMU registers
during probe and runtime resume, and released during runtime
suspend and on error paths.

Generally, from an architectural perspective, GEM_NOC and DDR are
expected to have an active vote whenever the adreno_smmu block is
powered on. In most common use cases, this requirement is implicitly
satisfied because other GPU-related clients (for example, the GMU
device) already hold a GEM_NOC vote when adreno_smmu is enabled.

However, there are certain corner cases, such as during sleep/wakeup
transitions, where the GEM_NOC vote can be removed before adreno_smmu
is powered down. If adreno_smmu is then accessed while the interconnect
vote is missing, it can lead to the observed failures. Because of the
precise ordering involved, this scenario is difficult to reproduce
consistently.
(also GDSC is involved in adreno usecases can have an independent vote)

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 55 +++++++++++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  3 ++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 27 +++++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
 4 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index e2c914fccd6f..5133d3ab023a 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -6,6 +6,7 @@
 #include <linux/acpi.h>
 #include <linux/adreno-smmu-priv.h>
 #include <linux/delay.h>
+#include <linux/interconnect.h>
 #include <linux/of_device.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/platform_device.h>
@@ -607,6 +608,45 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 	return ret;
 }
 
+static int qcom_adreno_smmu_icc_init(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	int err;
+
+	qsmmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
+	if (!IS_ERR(qsmmu->icc_path))
+		return 0;
+
+	err = PTR_ERR(qsmmu->icc_path);
+
+	if (err == -ENODEV) {
+		qsmmu->icc_path = NULL;
+		return 0;
+	}
+	return dev_err_probe(smmu->dev, err,
+			     "failed to get interconnect path\n");
+}
+
+static int qcom_adreno_smmu_runtime_resume(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	int ret;
+
+	ret = icc_set_bw(qsmmu->icc_path, 0, 1);
+	WARN_ON_ONCE(ret);
+	return ret;
+}
+
+static int qcom_adreno_smmu_runtime_suspend(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	int ret;
+
+	ret = icc_set_bw(qsmmu->icc_path, 0, 0);
+	WARN_ON_ONCE(ret);
+	return ret;
+}
+
 static const struct arm_smmu_impl qcom_smmu_v2_impl = {
 	.init_context = qcom_smmu_init_context,
 	.cfg_probe = qcom_smmu_cfg_probe,
@@ -648,6 +688,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.runtime_resume = qcom_adreno_smmu_runtime_resume,
+	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
 	.context_fault_needs_threaded_irq = true,
 };
 
@@ -658,6 +700,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.runtime_resume = qcom_adreno_smmu_runtime_resume,
+	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
 	.context_fault_needs_threaded_irq = true,
 };
 
@@ -667,11 +711,14 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	const struct device_node *np = smmu->dev->of_node;
 	const struct arm_smmu_impl *impl;
 	struct qcom_smmu *qsmmu;
+	bool is_adreno_smmu;
+	int ret;
 
 	if (!data)
 		return ERR_PTR(-EINVAL);
 
-	if (np && of_device_is_compatible(np, "qcom,adreno-smmu"))
+	is_adreno_smmu = np && of_device_is_compatible(np, "qcom,adreno-smmu");
+	if (is_adreno_smmu)
 		impl = data->adreno_impl;
 	else
 		impl = data->impl;
@@ -691,6 +738,12 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	qsmmu->smmu.impl = impl;
 	qsmmu->data = data;
 
+	if (is_adreno_smmu) {
+		ret = qcom_adreno_smmu_icc_init(&qsmmu->smmu);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	return &qsmmu->smmu;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index 8addd453f5f1..6835b40339ce 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -6,12 +6,15 @@
 #ifndef _ARM_SMMU_QCOM_H
 #define _ARM_SMMU_QCOM_H
 
+#include <linux/interconnect.h>
+
 struct qcom_smmu {
 	struct arm_smmu_device smmu;
 	const struct qcom_smmu_match_data *data;
 	bool bypass_quirk;
 	u8 bypass_cbndx;
 	u32 stall_enabled;
+	struct icc_path *icc_path;
 };
 
 enum qcom_smmu_impl_reg_offset {
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 0bd21d206eb3..a27804e15738 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -2189,6 +2189,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (smmu->impl && smmu->impl->runtime_resume) {
+		err = smmu->impl->runtime_resume(smmu);
+		if (err) {
+			clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
+			return err;
+		}
+	}
+
 	err = arm_smmu_device_cfg_probe(smmu);
 	if (err)
 		return err;
@@ -2273,8 +2281,11 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
 
 	if (pm_runtime_enabled(smmu->dev))
 		pm_runtime_force_suspend(smmu->dev);
-	else
+	else {
 		clk_bulk_disable(smmu->num_clks, smmu->clks);
+		if (smmu->impl && smmu->impl->runtime_suspend)
+			smmu->impl->runtime_suspend(smmu);
+	}
 
 	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
 }
@@ -2294,9 +2305,18 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 	int ret;
 
+	if (smmu->impl && smmu->impl->runtime_resume) {
+		ret = smmu->impl->runtime_resume(smmu);
+		if (ret)
+			return ret;
+	}
+
 	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
-	if (ret)
+	if (ret) {
+		if (smmu->impl && smmu->impl->runtime_suspend)
+			smmu->impl->runtime_suspend(smmu);
 		return ret;
+	}
 
 	arm_smmu_device_reset(smmu);
 
@@ -2309,6 +2329,9 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
 
 	clk_bulk_disable(smmu->num_clks, smmu->clks);
 
+	if (smmu->impl && smmu->impl->runtime_suspend)
+		return smmu->impl->runtime_suspend(smmu);
+
 	return 0;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 26d2e33cd328..ed08f86cf99d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -455,6 +455,8 @@ struct arm_smmu_impl {
 	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
 	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
 	void (*probe_finalize)(struct arm_smmu_device *smmu, struct device *dev);
+	int (*runtime_resume)(struct arm_smmu_device *smmu);
+	int (*runtime_suspend)(struct arm_smmu_device *smmu);
 };
 
 #define INVALID_SMENDX			-1

-- 
2.34.1


