Return-Path: <linux-arm-msm+bounces-110749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J3EOhSQHmpTlAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:11:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 931F262A3ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83494302DFB6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 08:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AF63C140F;
	Tue,  2 Jun 2026 08:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="COTJX6tq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZBjHpHrM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4003C0635
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 08:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387702; cv=none; b=kgM4V+EdfLlwwl4ZQPeo4nkL7vmgvCnMv908//BPpholwjbynsJWVvMquOZoVjWp5XXAQlBZ4Oyokq1brLytnM8j5N6eaJe65wsD+6Ug36y54jeIHIe2Yu5PowkBy1qg+AvFxus78l7Pe89yPYC2Te41EZxjqqevhC0GtGicrzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387702; c=relaxed/simple;
	bh=xbQVV0aI3TwSGThszjrzq8V3T0Ru+evwq+4vWGmiVwk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s1zNZgivL6PqtzDgEYgCHmltdpBC3Y1X77aq8iJGrao5iZ1OKuMvwpq3yz10Ils5N8XIT+Uvvw30ATZcoqQQlHgguYPEBzg2pQnPoOfRC+zrtexTu9xvCE9I0mAwiOaB9VvifcObpuQPOWh7uKBCzQ4JjIm4kAHQbASRCO2hBwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COTJX6tq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZBjHpHrM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tnLo1855109
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 08:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q1t3Ot8tDC9qqs5rBQ6cLH
	96AOUrdkqd6rVUqOjCbeg=; b=COTJX6tqjCNNnmrqHVSkBBYW9sR96fj0WTQAVv
	E3DNaQVWEqfVPWaM4Jhx42AYyVxcmIRa+4Np+PgIO0KVK3dk4zyhgYL0uJ55pcI7
	NZv7bZSB7mIpgi5DeY16FJph0wpy0lq9ScC4BXCvIFoy2zifJzXYifVEojB2HYuH
	l+ijGayc1S3GZn8JC/4st/hKcxVMSG5IbokVgDdjij8pjrKWQx/561mSupqUvA2p
	GX9gXE3oyds1pDo6iQbMYGspFPhwqgcSQImsUUYYWffYPaHgfdvUtjWwVfBpYG4C
	RVa9peE+4HgAIbOQf/kY1A/05MJhrk27EWIV43YLJVSD45Cg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf78h1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 08:08:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304d0d0b28eso4454886eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 01:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780387695; x=1780992495; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q1t3Ot8tDC9qqs5rBQ6cLH96AOUrdkqd6rVUqOjCbeg=;
        b=ZBjHpHrMipApCIy0XAJWk9sHsSYs87o6SPUAg48OWjNXBnaZVaFR/+Qh3fyO9ekF8V
         KYo9bvN9yzHOURiXHeexZZYEpZWAhLft7SU3AuXYgpSZ0njinMSfuZ69z1X8moxRTRI4
         hGbf87NJyyNIFWuozWvbLhMxGNy1fVAghqcM1I13gcTGPkzr72BltEApjKn4ffZitAHz
         g/5xS5Aj4K+KvEye9jrd3LSiB7wGVOQ8ndF8ql/syydWX36EWkS2mwjJxWAy0Fnx2vwG
         wewCjqKVBCvirjCiwz2xmlEkCSohGADX2CyYXSBi3wCCKb54uY9nfbU8J7rE+4Lq3qLB
         gEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387695; x=1780992495;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1t3Ot8tDC9qqs5rBQ6cLH96AOUrdkqd6rVUqOjCbeg=;
        b=lsDzdvKl/TFk4JG0/Es+Ps1TNWQrl19en1aq50y44dLMIM++Sk/2fZ5KT+E6xNJxlK
         UBUl2ZdYX2cf64dXxjgCN4wZ1zUl1t/5PFWwjJNBWR6AfS6yWzz7qyVZLyWilqStDD1j
         XNSNSJCj79W1Qg8FvLsQAl3c8eoekN3tQUcKe7IqNWEGqnh4j9JNjgsUf/SIBbIaFsz8
         Zre3Dt/KhZ+bj6ho3tuFsEYDyzqonvVld5TcUEIV3GJNUTbPpfARz/bufzIH7MUZNOwr
         PglkUw+tdunQ5Y9iAaxeHuvvfh8lsTbrUnX/CtTTWosyMOvq4tBcYQvghWwv34qUTze3
         b0IA==
X-Gm-Message-State: AOJu0Yzl33sF922q9B+WGS0+fXg+eDucbXDfBCuyImJjImQ5mPm3MDfT
	JNpmqPOuwat64nyhnxiw6sGjId3Kf+Uc79JiQ7XA73R0hRJ6s2n4Mhay/FyciCajQ6blOTWmYiF
	zhARaCNhZuJ2s6lV38Y+HnNooxGXwboemnj5ATJHLFpS7Rai8lHG76Flw/iHGqUAiXzzr
X-Gm-Gg: Acq92OGwoxuTSHHYQrstiGCwoEiJ00jgwIEWLgeL7KjHcdSke55wiUGZKL0VV1BGYI5
	ZaZ7UxESq3Qk2NEJ2vUDsgqBqUgA+5JStGb5zqAfMkzaKeotiKR3ItWl/8X+zuQThTyCHVFgpVZ
	8Cy7bkpSZ8348rx8bdafd4DkP2HOOe1UR7TNGfszSVDNYx1h9xNcqt2PKsQRRiZDkDGGDWQdxSH
	ZimCwM9y9PQNwuL46pTUkZ4ID+8vZ+RX6EG4rCh5YrWTapWEGq4n0jK35U8zPFX0iF/CEfoLGtK
	pGGD+AHgLQJjBoAXPgTYI9Sct+UQC2i+omm+rXHV/yonv52RW9tJ9SWvGsHlRpiShtb2IfzJTMO
	zT0j6hefHohtZyuOJlELWaa7mWXirsTpQKNv1WyBBujFGk93ROly+yzKtpdLyl8x3O2E8EGih/4
	UbU50=
X-Received: by 2002:a05:7301:7213:b0:2f1:496c:94bf with SMTP id 5a478bee46e88-304fa5ab148mr7191042eec.16.1780387694684;
        Tue, 02 Jun 2026 01:08:14 -0700 (PDT)
X-Received: by 2002:a05:7301:7213:b0:2f1:496c:94bf with SMTP id 5a478bee46e88-304fa5ab148mr7191015eec.16.1780387694036;
        Tue, 02 Jun 2026 01:08:14 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3d8f839sm8006025c88.15.2026.06.02.01.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:08:12 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v5 0/7] clk: qcom: Add common clkref support and migrate
 Glymur and Mahua
Date: Tue, 02 Jun 2026 01:02:16 -0700
Message-Id: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAiOHmoC/3WNQQ6CMBBFr0JmbUnTUgRX3MMQgu0gNUKlA0RDe
 ncLrt1M8vL/f7MBobdIcEk28Lhasm6MoE4J6L4d78isiQyCi5wrcWazJt9MHrvmwK6Q2AqhSi4
 NxNErJvZ9CK/1j2m5PVDPu2Vv9JZm5z/HxzXbe3/la8Y4M2gKWeS5Lk1ZOaJ0WtqndsOQxgN1C
 OELRXCf7sUAAAA=
X-Change-ID: 20260527-tcsr_qref_0527-f83ea225903d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780387692; l=4031;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=xbQVV0aI3TwSGThszjrzq8V3T0Ru+evwq+4vWGmiVwk=;
 b=qjkV/R9NpkLH67Dglx8uXBC7gHILaVhy2sHGS2bI/GmBD2X9Fgsoe6wMs3ceWrCiBHnXTGw9X
 RBlDGHRWJbZCrOsa/sDdeGLotWNj9zZrSP1d2WZbO4jRwc+G/LYMsF5
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=WKRPmHsR c=1 sm=1 tr=0 ts=6a1e8f6f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=DfkYS8A862cjZAK12kEA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=xwnAI6pc5liRhupp6brZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: kWmW8W5gyAWaczMPZK3hAYRJ1maQLneN
X-Proofpoint-ORIG-GUID: kWmW8W5gyAWaczMPZK3hAYRJ1maQLneN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3NSBTYWx0ZWRfX+UN45DhAiYHh
 TmWGFtA1G4lWy/4GmoA5IR7CsrzATdCI1/oSWlcps7CWN4hVRL8vfVOpk380VENN/SV2HlDroth
 WOlgyrNttNsyBMjXv1+BqqnON+abg5NDdgi7P/zzcqwkkst73X88HAPrCSJ5ZWLw3DXpms85/lK
 j2KttyQqPOBZ1+FeLcXwd6N6ZJER3N6BA05WKImEMP/hwAwFrMdin5HY6UKQ8cS1WnHTvuB69tI
 BcLlZDQT2Vg3HSiyLv4eidztSKdTEoLc1LYvNeE6KQs3knPdRWF6VMlOZQ+bmL27vV7M4LOiXkk
 i3ae3VuQABDPZVcbI3/MJDrHX9Hf2nHXb60PGuVQIULiuZB71+W3DoViLGUzLfs5rMwRZ/EUQGv
 FDjRdAy54w5O5EnaWL0XAfqM7aPzNO7AEYoF/kUKt+3NYxk2tHyS5gb+2uwM8byuvqJh+Gmv/Fg
 gusaF7llmIeUOCirpPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110749-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 931F262A3ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds a common clkref_en implementation and converts glymur
and mahua to use it, along with the related binding and DTS updates.

The PCIe clkref clocks on Glymur and Mahua gate the QREF block which
provides reference clocks to the PCIe PHYs. QREF requires LDO supplies
and a reference voltage from the refgen block to operate. The refgen
block itself requires vdda-refgen_0p9 and vdda-refgen_1p2 LDOs to
function.

Previously, these QREF votes were done in PHY drivers. In earlier
discussion [1], the feedback was that this is the wrong ownership point:
those supplies are for the QREF controlled by clkref registers, not for
the PHY directly. Based on that feedback, this series keeps the
regulator handling with the clkref control path.

Another reason for this series is reuse. clkref_en registers may live in
different blocks across platforms (for example TCSR on Glymur, TLMM on
SM8750 [2]), while the behavior is the same. The common helper lets each
driver provide simple descriptors (name, offset, optional supplies) and
reuse shared registration and runtime logic.

Glymur and Mahua share the same QREF TX/RPT/RX component naming but
have different PCIe QREF topologies. Both are handled in tcsrcc-glymur.c
via match_data to select the correct descriptor table per compatible.

[1] https://lore.kernel.org/lkml/aEBfV2M-ZqDF7aRz@hovoldconsulting.com/
[2] https://lore.kernel.org/linux-arm-msm/20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com/

Changes in v5:
- Return 0 if regmap_read fail
- Add a separate file for glymur-tcsr and mahua-tcsr
- Link to v4: https://patch.msgid.link/20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com

Changes in v4:
- Add mahua QREF support (binding, driver, DTS) to avoid dtb check error
- Override pcie5_phy ref clock to RPMH_CXO_CLK on mahua since
  TCSR_PCIE_1_CLKREF_EN is not available
- Rename regulator arrays to topology-based names and merge duplicates
- Remove else: false blocks from binding
- Sort supply properties alphabetically in binding and DTS
- Link to v3: https://lore.kernel.org/all/20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com/

Changes in v3:
- Fix dtb check error: allOf:0: 'then' is a dependency of 'if'.
- Link to v2: https://lore.kernel.org/all/20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com/

Changes in v2:
- RFC tag dropped
- Changed back to additionalProperties: false
- Moved all Glymur supply properties into top-level properties so they are explicitly defined.
- Link to v1: https://lore.kernel.org/all/20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (7):
      dt-bindings: clock: qcom: Move glymur TCSR to own binding and add mahua
      clk: qcom: Add generic clkref_en support
      clk: qcom: tcsrcc-glymur: Migrate tcsr_pcie_N_clkref_en to clk_ref common helper
      clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator support
      arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR
      arm64: dts: qcom: mahua: Add QREF regulator supplies to TCSR
      arm64: dts: qcom: mahua: Switch pcie5_phy ref clock to RPMH_CXO_CLK

 .../bindings/clock/qcom,glymur-tcsr.yaml           | 146 ++++++++
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  20 +
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |  15 +
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  13 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ref.c                         | 205 +++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   | 407 +++++++++------------
 include/linux/clk/qcom.h                           |  69 ++++
 9 files changed, 637 insertions(+), 241 deletions(-)
---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260527-tcsr_qref_0527-f83ea225903d

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


