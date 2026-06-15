Return-Path: <linux-arm-msm+bounces-113119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qi0YJZi6L2rzFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:40:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32547684A59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:40:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oLSuJ8HK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Hn7aJ8HO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113119-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113119-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D2EF3018595
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D265E3D25A7;
	Mon, 15 Jun 2026 08:36:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30F93D1CD5
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:35:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512562; cv=none; b=qSnFbph0ueyFE0vT9P3LZ1dApnBFCr7+poeNGNT15oPm8Ikq3yTakbjF761r7grVefAaWBxwHDsKjB3YvN+UUVK2uIZwcZwRUby8ReKCn147WILvicy2jXcF2CruVnJVdq6z7leM+8OBm5sQYO0sFqVRB68FEVsYDp3lt8FMaBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512562; c=relaxed/simple;
	bh=0CbeIfbe5MjOdT9CQPYp9szhighV6UBlYT32HHqksf8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G8iyZzl/9rLKNjPk+RJWztmR10E3UgqGbN5aX2bo1+0IUnM8ugLakkkKKZzAqQZu/cN0jmZ4mjfFVNzjNoDSVfdWGNRZxdmDQ+1urIgWR41AlroK4tQ0rQaDdrGnVvOUxSQ6dfq6yQjAEkFPgpLsRGAouziBJiHoNi1LG4k1tBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oLSuJ8HK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hn7aJ8HO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Kr693710243
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wV4trMcsPj/JH0c/7ibhAF
	ZjIAm9kEZUKLzZv+e34cA=; b=oLSuJ8HKER9/GeorRd5RvX3TVR3eXutYtJvqa9
	kaKex+OP9syc+slAiw97WhGfs6Vg4yHSPnYIZmoyHqxz2ezbto+KAhPnJoWc53v1
	pOtw/aj/eApjwzvpddAKBpbs51af4EzapK1/JtGv+/8D+A97ommfwmKthS2YFJoV
	nyzt1tbglG4I+Tpd9mGEmy1uuFV43mEEqFHwqm249HfwYfYp8Dn/2Mbp//N3CDuO
	0ctG+R6NwnFjRMRlxv+M28eAQW/yrIEe7p0rfu3ai5lLtzSs14lfa6QFHNwFwBe5
	qUOisnqvd7++h+PXGGXOo6PqFeVZuHU5rp3iSR5N1po4rAWg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery956ek8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:35:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso5710456a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512556; x=1782117356; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wV4trMcsPj/JH0c/7ibhAFZjIAm9kEZUKLzZv+e34cA=;
        b=Hn7aJ8HOd9JCClW9WTSqpJzqtvX3L2LvgCbmPemgOgYrt0qrflPrCFonkYI+RNPFVD
         vLVYV+VnmTM85Ye3wVeH49eCN7WSa826cYTacXtrvLh777K/a5C1GSdPTKxW80VAlLrH
         85IYKY5Ljs+o/exozv/iKMuWF1kBt7gIHlr2/w1euY1VWfGiku0AqcOLnBg8J4spbOMJ
         jKvHQhw1wTNzC7VHhXd86QI0rCNBvQWvYeMhZKlFDPHkPhxNV8xi70I58+0GuzaprmpW
         tG0Z1M81NfqZi4Srgmk4lKU9nbSPPYJq9xO/JIRzS/2yXWH4c2nK+fOLVRigkZGtqG4E
         I84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512556; x=1782117356;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV4trMcsPj/JH0c/7ibhAFZjIAm9kEZUKLzZv+e34cA=;
        b=W/dzJ576fjQ6xhYtB8kcDrii8aGyuBlz7rfVX8EerDqf+hNrUb9YQ1JZskoYCoS5Zd
         xZ99oevMr5Pwwnle0sD4CNzahQeWLN3AdrsE+fW4OS3qXGANFBLx4U8ovU8QNaMKyAeB
         J/Jx3g5LYC+WzQUj6ZWGg6+DAicWlioC/fbs2ft0h+k1NVXHkiEXc2cAjc+UqjpSPelo
         m4xHIV7UXanipT5edCeUgIuZs5Q/tYLzLpgtAHzLTfqTedNG4EESzmKXcynYOo3bDxae
         ean0tD1svQ+V3H/7R1O4nmPXuZxShpsfbI8l0ff2Ux/UfC7aris1aGka6aU0wFd57a8s
         QX5A==
X-Gm-Message-State: AOJu0Yzy2JImSID346ngk+1yaTDA+syLoJDyDux9YbEyOuq45WGRf3P/
	+G9/FeofQ9Kep8qr9DtdyqU48opH/m/kPF9p335tDI/M4q3S/Q8rECBDcPRA4eL5q/uKvQW1TX4
	6CTO4Q6mQdDucBxW0MPhHIxkLYdMTk1xEa2eeDakKnNnVo4n+XUL6kVEmBrpekVWpRJUz
X-Gm-Gg: Acq92OGi44HjfgdzgSltnfSzAUXO7bkyMaeLTld5+gGYp18AFKKRoYE437rl/ruFvlK
	2Ma4g2gUqylghiki/CV0I5MF77DM2Qcfx2ZUGQHj+rF/CZPivfYJa48IHQSrjFzDW+L9mdwijmE
	hAyb+SVbpHyP/spxa8kRvanFnLfIw6PKe5bCjeckxE+rDGp8Zn6kferZVCx2fIOundMn3gLNopH
	DMpGkQCm161TBTEiAhng+UTeOg1XQODGNKxZ1UQ41CraPXp1av1ooOXieOPWkYiCUZeRPv4ki01
	BG4EHyyykj8eruWz+lrTZLSy4ZdH4v1ushhOQ9SB63bLx28eM94NEjN6cLxYvPiaK3LlgSkxxyk
	H5ik/l0WenYQIlLXc9RZvVagwatQfmm73nby0fHaYNSwaJ8dUqMaT8pwtQBDkl+/fOOFa7VPoC6
	qnhOT8iTnnzQL1y8udoCO3DsdHVkjUhAgzn68Ravmp7ZUlqkZq280x71XN
X-Received: by 2002:a17:90b:6c3:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-37c2bd033e6mr9436113a91.12.1781512556292;
        Mon, 15 Jun 2026 01:35:56 -0700 (PDT)
X-Received: by 2002:a17:90b:6c3:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-37c2bd033e6mr9436087a91.12.1781512555895;
        Mon, 15 Jun 2026 01:35:55 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a210ad64esm9558974a91.0.2026.06.15.01.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:35:55 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add support for the REFGEN in the IPQ9650 SoC
Date: Mon, 15 Jun 2026 14:05:46 +0530
Message-Id: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGK5L2oC/23NQQ6CMBAF0KuYri2ZVlutK+9hjCkwQI1QaIFoC
 He3hY1RN5P8yZ83E/HoDHpy2kzE4Wi8sU0Iu+2GZJVuSqQmD5lw4BIEB2raTkkBN4dFiQ1lSqb
 iAPkxzYCEozbszXMBL9c1+yG9Y9ZHJTYq43vrXsvHkcXeikvg3/jIKFAhkOtCi6KQ+7P1PukG/
 chsXSdhkPhj5B8KYz8KD0qupFYsF6lS+EeZ5/kNpEpKAQsBAAA=
X-Change-ID: 20260520-ipq9650_refgen-196b570d8bc0
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 0Hxx5azmQ2QA2CWnbO3moKqhYMCdZDe0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX8wXP2bPE6AO0
 9rUz/FQC2mC+xtaAvzCZXyafuWP9iBXCLgaF2GquFGju16Jbf6iTKsWpA9kLfKo/ELoDBRWmaYj
 ls6fdUL+g2YrfxjI0GvEpPHGP84LPKA=
X-Proofpoint-GUID: 0Hxx5azmQ2QA2CWnbO3moKqhYMCdZDe0
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2fb96d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=jDu6XcLu4sYahdmiP6UA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX9epRR7XbGRWQ
 DsdthApTzTc46pLYm/bXWx8UyO72C5cE06NBvT4OHWUX98fncy3Q+UOZDljkRLjMu31cAi4EhkM
 qxgwkdX4IOqhxhTB93JYWnCY7eBgkIwAIGhWJJ2uptsIHVU1QUsyFugXP0hoyAz15qkwEbvTES9
 iQxyixJ+hhoplnHRZIXnakc/pwJzsvj1lCD2fz/I7mjqC2y10VVCMqJSM/h/J/todS4M3lLAS5b
 qqItMrqYFVfqG/8nMNQ+eLymwDKxJD36ADuz7CWivKrWhyvujMG067vMpFui3P/umEx9yE5xl1I
 wYizt/zqRi+dCOyaNDzs5VwhWtf3jBVBhyBEe1iRQ7GnhMyQQixaHLuuOpKbQtv2ARD6OID7+z6
 BBCAt/l2N5VO6EGMSuYUXUSK7sjrTv+nuprD7rkTt/KBPXyGwA01qgzK04QQRjC68ZaBz68hRMJ
 HqKImhE0sNxyMCfPRAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113119-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:stable@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,msgid.link:url,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32547684A59

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to
the PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block
is enabled on power up but that's not the case for IPQ9650 and we have
to explicitly enable those clocks.

Document the same and add support for it.

Correct the regulator type to REGULATOR_CURRENT, as the REFGEN block
supplies the reference current to PHYs in the SoC, per the REFGEN IP
team, aligning it with the hardware behavior.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Pick up the R-b tags
- Use the lower case hex number in patch 2
- Document the IPQ9650 compatible as separate one not as a fallback and
  move the allOf block after the 'required:' section
- Link to v2: https://patch.msgid.link/20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com

Changes in v2:
- New patch 1/3 - change the regulator type to align with HW behavior
- Add the constraints for clock and clock-names property in the binding
- Read the REFGEN_STATUS register to find out the regulator is enabled
- Dropped the unused slab.h
- Link to v1: https://patch.msgid.link/20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Kathiravan Thirumoorthy (3):
      regulator: qcom-refgen: correct the regulator type to CURRENT
      regulator: dt-bindings: qcom,sdm845-refgen-regulator: Document IPQ9650
      regulator: qcom-refgen: add support for the IPQ9650 SoC

 .../regulator/qcom,sdm845-refgen-regulator.yaml    | 31 +++++++-
 drivers/regulator/qcom-refgen-regulator.c          | 93 ++++++++++++++++++++--
 2 files changed, 115 insertions(+), 9 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260520-ipq9650_refgen-196b570d8bc0

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


