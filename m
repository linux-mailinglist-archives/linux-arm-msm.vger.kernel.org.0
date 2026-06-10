Return-Path: <linux-arm-msm+bounces-112507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ME7pHsVyKWohXAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:20:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE3266A2C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:20:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="jp07/d+f";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="U2LW/JcG";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112507-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112507-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B700300B0A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40763101A5;
	Wed, 10 Jun 2026 14:19:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03F23126BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:19:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101172; cv=none; b=qRiJntD3l41cuNYiAMpemX/r/UnABkzikasZhx4SZaIVEb+XCyxkouTWGxCcz2C7CO0oc+0DttuYxEwzgGYe1d574eVmNZCYX1epAV/syZa29OTmRURlFYtUcul/+K0//IBD/+8OMKacz9AJ+PfBe+bnnnSVnbMHOxdApm6cyJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101172; c=relaxed/simple;
	bh=BHydDdWssIH/8J9hIwO7sc+BUM+ivEQ/ov/D73DlQhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V6yyCVLiAkBMKe4cHrzi1Ww05PhDtQ0GT6wgVM0Ra7PyHRwOgFA2ARNr5ywAkhfYh6pgYuqZktBa/EZehp89mRVvs+6izQHkmPu4RNX/H7LdewJAKyItQ1eDihh2pV5G4cyxbD9y/tOJxwJrwGo6upN8RO54hEqNPnFoLkBcfGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jp07/d+f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2LW/JcG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBqN71169875
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Cqy9KYrGD0bxStd7rfjUeL
	9a35+ZabdOdg6fhipUUHA=; b=jp07/d+f+uIhIPOPV+mV35qeCLGwoPgF0bCdCy
	7Tt30ndMOXyX3c9MoASKCbdZTAP7mynr+cm+usNuiQwmpoivru1mj8fP1Lr3xoo/
	W0xYvy1/zuxrcXO1ZQrNOEqg5CgUTcVIBV7PQT5C9ZEABq0X5RNXecib2l30oOAe
	jX/Ba0CFIb6jHebqc8UdBzrfl1u72X7xOfuSOGpO32TRGHIe00ySSGT85G8m19HG
	wCiGKMU630/EPGYubfwS3IOtN1xTPy5d5Y42fPIFYMHicSz0EOb9tC4gOBze2pxO
	uDIHTjVb8GKkfQP+8tUPLlaPiyGfRBBj6FJlgaJAoI4G6VMQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1s6hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:19:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf243973c2so47725405ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781101170; x=1781705970; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cqy9KYrGD0bxStd7rfjUeL9a35+ZabdOdg6fhipUUHA=;
        b=U2LW/JcGhRdt3r5+h2G9w7j2qA2GtDo+9MPufnOfvruTtgojTc1cR3qnSr5zWynQz7
         tMqKqqY4IF74ii0CJIV71PxKTjEvBDicJt/8J+r5lVponjDFlVPn2BnylUtts9hANvVs
         gmfP+EoG9YR72fGeO9+P8a5r/vhsfKAts7SbaWYuawNkuRRVCCEE9PAFgXalsp0qigKc
         /m8qBOsFpZSurRCFYo+nLFzBCAX1WEG15kvXKEgNcWGdHHAHqkPYx6Q0OzYAYbE/ZOES
         SHL/zr/yU5SuFVGDyn4sIkqCfsBXi+kpSRAJk4/TgLCTDG/6c1lIz6vdq7Gkc5qYVbl3
         yZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781101170; x=1781705970;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cqy9KYrGD0bxStd7rfjUeL9a35+ZabdOdg6fhipUUHA=;
        b=b6mCayKhbVCS/06Z+feHrwW9bpS2jeH8mstFNtfa48U0xkw1qZqdxZGBdrNc0kbuff
         DzlzOEzDKDLiVOpT1BZ9jXbHfy0qF7W8xyS5VFxGwvpFMKSqHWwQ8/Ir8RBB6mJL76UM
         TZgnEnOiO/8Hat+QIqgSrL35Ze9frd3HxCHqDPkhmfDXcxaR8KK0NxSi7H3X8IsnSU9m
         BuwzayjTdmlkuzFuFsi4fQU00eI+0P4lIQsy3rx1TEHGgH0yv4SyAt3G1sYJTENBiyOc
         hy+7LiWOFJaiEHcGt8hU3sCerKAmYOInxG/KZCF2MZjG16P4bk1NVW1B7jDK/zcx7/Uw
         M/HQ==
X-Gm-Message-State: AOJu0YwGLmusPo7/vZrOFEflpckIxC/D2PADhya8ai48/V3L3jizZYcw
	oih1TPOJVh/knPWLXjJiGFcXn/gCb7ghLlvm1v7ch1cHSRuLv8aQbo5Sc0ZLXiDs+321uYXWFUD
	acUw6QKTz5PjJORfPwtJSJU8GRUVgJ43JhtDmgFjjKxljp3sxfLy4+BSDKSWkL3aaLD51
X-Gm-Gg: Acq92OEkuPPpjKOOzxRCKD/26LWcQOda8nnnXIVq1ej0nvTX0djL5gNBs9/E4f/sEwe
	dE0qQDD0AdF5vLe+8a4Sc0UVU5eb9tug/0UYY6RV0OupBoyMVZJkK5kBWtmOU6sATwRFbFjDkS4
	n/KwDPAbOa+phfB1b4PBrLtxY4ebmWyNBxsKWiG3iWsPMm6IFJyEfqwHLzdxy/dhJGt3fQN2kGh
	TUzopgy/sjMZpIYFO4AZmsmCvQ2cvNmBwAHb1ku8mydVjw2j9RRfOpBvRuuhmuU9chPWxsKRCK5
	W39gqzGmKqB6xfjqr90cYb6yopuYD80bwml8vwhU2f1UOYONwQKiXDd35Y06c04zNWzH7va1TSK
	Y9z7sbjvskjSkFj7KIh1A9pKbqUTnA4hGFJK8Xc/yVJNVxDWWn0HmyFO1FvsF6PtL8a9d/VkBFU
	qaP0RF2wmuTHF50W/x4gXQ+qNN9d+dCZ5WkY1BLAF3COsSIAEOJM0GPfTpg+FXN8xYG2c=
X-Received: by 2002:a17:903:1aed:b0:2c2:245a:3364 with SMTP id d9443c01a7336-2c2245a35e2mr208250655ad.32.1781101169564;
        Wed, 10 Jun 2026 07:19:29 -0700 (PDT)
X-Received: by 2002:a17:903:1aed:b0:2c2:245a:3364 with SMTP id d9443c01a7336-2c2245a35e2mr208250165ad.32.1781101168976;
        Wed, 10 Jun 2026 07:19:28 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm241212965ad.73.2026.06.10.07.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:19:28 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 19:49:17 +0530
Subject: [PATCH v2] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-ipq5424_drop_clk_ignore_unused-v2-1-15240af073d6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGVyKWoC/42OQQ6CMBREr2K6tgTaAurKexjSQPlAFVrop0RDu
 LsFL+BmkpdM3sxKEJwGJLfTShwsGrU1Adj5RFRXmhaorgMTFrMsTllK9TilgglZOztK1b+kbo1
 1IL3xCDW9xlUjLjnnKgMSJKODRr+PgUfxY/TVE9S8W/dGp3G27nM8WJK99/fYktCE5qAyDlzkD
 SvvFjGafNkrOwxRCFJs2/YFa9T+7eUAAAA=
X-Change-ID: 20260525-ipq5424_drop_clk_ignore_unused-90bf48733c6e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: aOuNDPcqhDBfahMp7Y_6ZjKb0Chrnu_C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzNyBTYWx0ZWRfXx1PkjLXCLuVI
 cOhKxF1XGhQ3bx7dqEu/IKElO1p3PxWAObmX7UNz6w62hpm3kj/jIzvBy3K51+qot6c8YrLQ8IK
 0tNlDLdCW3N6cRLEonmW88T6Nukl01/Z510Xh4ZwaPce5aFB9CNdvyX2ktpRyL3/Sao2+RfckV7
 DTM8Ac0Ju9o53UZDfrPnY6CB5TcPAgBO1pnQ7eRR0IcVjCc0d14O/wbav/tuI0MaG1I01QE4JkH
 er1wc1FPI2Y4qLEiSQXLc6oeZ+zZfLI+jPwXPz3AQDnEDUjAIlPTkaGK47OzpecTuCvoKbwozL1
 LsGrAVH5K1vGv5vW9U1OAlpNrG2R7ZTZFWys5bf3cdLPW0RJRjQpAN/J2ZISh/8tYgzQbZsZxxd
 bmb5hTLjfpwkCOFjSoGQPikBSysc9+bSDJXjewpf9QzGHgETnKszYZWf/xAURPvy4GvCqRkxU7f
 kH9KTuP6bP1F2s6m+AQ==
X-Proofpoint-GUID: aOuNDPcqhDBfahMp7Y_6ZjKb0Chrnu_C
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a297273 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8
 a=20KFwNOVAAAA:8 a=xjaQWaglaTHDcvof_gYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112507-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,msgid.link:url,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EE3266A2C3

Since PCIe and USB are enabled and consume GPLL4, there is no need to
keep the CLK_IGNORE_UNUSED flag. Drop it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Rewrite the commit msg to include the consumers explicitly
- Link to v1: https://patch.msgid.link/20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/qcom/gcc-ipq5424.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 35af6ffeeb85..3ddd4b3aedea 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -139,17 +139,6 @@ static struct clk_alpha_pll gpll4 = {
 			.parent_data = &gcc_parent_data_xo,
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
-			/*
-			 * There are no consumers for this GPLL in kernel yet,
-			 * (will be added soon), so the clock framework
-			 * disables this source. But some of the clocks
-			 * initialized by boot loaders uses this source. So we
-			 * need to keep this clock ON. Add the
-			 * CLK_IGNORE_UNUSED flag so the clock will not be
-			 * disabled. Once the consumer in kernel is added, we
-			 * can get rid of this flag.
-			 */
-			.flags = CLK_IGNORE_UNUSED,
 		},
 	},
 };

---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260525-ipq5424_drop_clk_ignore_unused-90bf48733c6e

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


