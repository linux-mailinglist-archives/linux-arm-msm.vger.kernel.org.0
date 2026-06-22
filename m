Return-Path: <linux-arm-msm+bounces-113918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mGsGOB3EOGoZhwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:11:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0336ACAB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:11:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=azxZKtOw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Oq9cS28U;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113918-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113918-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BCD5301F14A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 05:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDE0357CE1;
	Mon, 22 Jun 2026 05:11:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2595035676A
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105096; cv=none; b=byGDk29+jPPJB8f3RbqbWkLiEWkNVX++xFn7Cc5fvHUgjYMnmlE+rN2ts/pqNcU3mQ1OXeTJuxQSfByFVpCbeHSXxmEMnmhH/QchKoo6qM+K91NzGT2Y6rtLg/oZOSpzJFQiIKhfykuuTTBR+scovptDSiDmdf07ct3pJkR+wQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105096; c=relaxed/simple;
	bh=OboAT1fzU1RL9g+1Z78H3lsB1Jeo5VybcdwdtcDqo1s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YHyq7drykBaJWHwgvlwxE3O0HEOvEsd49slC5RVGIKb0A5YP8LhsADCj9Kl7YZzBRSF01dXGSScAEe4yotxY/Uace8Qo0psaNWWTl0iK9YaRJhZLPnJQgYC/QfoozMNAHteusare15+ZP/IgLBPS4Q+wqGMCaCvrhJE5Bh8Jc34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azxZKtOw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oq9cS28U; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59UTa3850875
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h/3utt32KpHCL9JzNrriGj
	rBcVViSsoxRdQP6fWabUQ=; b=azxZKtOwi4OtCPMjmA4mPP+aJXj94MLfuASfnA
	/Th3cY+8+Et98s0OuARE0fqi4QyytlC1JwWNbp2df37ghNln+zj9rKm2IpAqO7Ny
	HiDK2QV0stM4gm3lxQHRfp7iovZq8jHPzN65568aCv61xoYnLbfMoWiOLTU7oGVD
	gjQPDpPdJKKo2oHyfTts2VyFO29vILECbzUHJR9qGR1nVLwZRCHCFeLiAoIAm2jK
	siBAFON+EuLb1HQ/oddXylurpIX8DNAbkvu9hjMm6n6Uap3i6Mn9km/iLYejLFZJ
	1b4KErQ1zj/V+ig4Iltm9z8XtZUpinv0z3PxuOXLOtd2CokA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm584n82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c17f62afdso1947161eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 22:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105094; x=1782709894; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/3utt32KpHCL9JzNrriGjrBcVViSsoxRdQP6fWabUQ=;
        b=Oq9cS28U+tKrp/v1AzQH9u4BNH+Dby9PsweUGx0xg3GO/SUWFcy7UUHJAkYVnHtfok
         sFLmWodaSG8LcNWdo9v3uiVz4awYZLP1Dtl/6D2pTS/HoZ6reK3XS4gSoXYDi2Cq9Oph
         y64wOZ89gwjqX8eTVad6SnZuL2dlGvgLAJ0y0tx7ZA5vtx8/KndT2TPKZCdn5+DFkx28
         TaHF/H/34SR+PiImH7atNb+sxIJkuJgqfqQHrcMgKCppYoU4JGlruWtx6VdOtai9lWa/
         Fe5OS3d/NDdch78MJ8BEfmgLJBtJ4FqIKAeDX1swv/BRDCdjKWWYMEz0EwPXmr/b9yRu
         dHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105094; x=1782709894;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/3utt32KpHCL9JzNrriGjrBcVViSsoxRdQP6fWabUQ=;
        b=Psz7vMe2+zrx0upGhIUbo0F5iqcnVIm56Zhmf6nidYruzCqUiO4ynS0SJNs3mZrs2z
         5KI2Movcqoax+Qj++0Q4Xzsq1La7QgSslhIyiNNbowh26AWOmVa6aylPBdZ0jbFp0QPJ
         m8YGwkUOyhsoqXPIwCEkcb6FPCH4/0NaE4V4VlQ7b7GDVtQVSeH+jKYM8tRvibtB5IUA
         3BG1j2s4mWpDNMYE56P8UnyyGCS3rhfl8S05+lqUPwwj87V9a60FSvU1e56AXoVHYHBO
         MYhteuhpv1iWOFYNnbFzAxkl4Ohj60J9GZvHs28GiGhrvK2lOGbTpAMRd2b6ji0STK4I
         M5WA==
X-Gm-Message-State: AOJu0YzCM3Z/sGJYb5XnXva5agjs77QPmQ1zm8SALmmUg8md4w2C8TRk
	zZIwLG0WTce6ct0aKpA4cGQHg586rF+JWUWksOCjkR20UqKf462BzbsIywai4A07MW357lMg58c
	l5fbhbQFKoePqFA0FS3vI4dVunjQJWWmw9yAbJ9LAWfmJTgl8BgSKZVFcYTz4vwFQXXIL
X-Gm-Gg: AfdE7cmOgRke792aCClzAyL7I55aFJ+wQNZ+/AEFSvtb/46NgutOIX9UOK52MivOZqZ
	weztA0vMrKxe7J1vXN9lyfjtpFiAkh+3GBNyLnyr6s0AhWl7hh76bgBtL0CWXnmDTrYSxCZds1P
	HSjjBuew+LXxxHXZke8DVD9Zj318Q8JBXzGIMHfWaeyNnMaT7iKhROvLauI1EgSW4VWBfTHJ98L
	KU/KUSwOSf8P48JuUp9TuJh5xWWjydz6DN92EsAC80OSGPEYygnro0jjG5waEgoLCa3ZT2k7kSI
	McmXzA1a0k8VFyIM1qgkVtAcZ/ht/w6FPAgscOOxtWKr6n85voX+9Xp0o8p407dIiZG8FNhGDno
	2n8bSPEwR95/Qvu59hVepTm2Pct7Jh8oYsvlAedRQjYw6wKVXrgBrBTzC3A==
X-Received: by 2002:a05:7300:6d23:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30c0798b7ddmr7803027eec.9.1782105093446;
        Sun, 21 Jun 2026 22:11:33 -0700 (PDT)
X-Received: by 2002:a05:7300:6d23:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30c0798b7ddmr7803002eec.9.1782105092836;
        Sun, 21 Jun 2026 22:11:32 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:32 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v6 0/8] clk: qcom: Add common clkref support and migrate
 Glymur and Mahua
Date: Sun, 21 Jun 2026 22:11:23 -0700
Message-Id: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPvDOGoC/yXM3QpAQBCG4VvRHNtamzbciiS7BuPAzw5Scu8Gh
 09f33sBYyBkKKILAh7ENE8CG0fgh2bqUVErBqON1dYkavMc6jVgVwuNcjpPXNZo26U5yGmRhc4
 vWFa/eXcj+u2twH0//soEUHIAAAA=
X-Change-ID: 20260621-tcsr_qref_0622-b091b8a06f49
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
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=4630;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=OboAT1fzU1RL9g+1Z78H3lsB1Jeo5VybcdwdtcDqo1s=;
 b=FmejGKbN/I0MJ+V7iqsoTZzZ3QSDvONIWkj7+rCWYnej79k87aCp1XJA+O1IYrnAkcL20i6Ws
 I3TZRHN7KwBA3W+keTmHPGLbvMjMmvonFrl+1wT42rOYunoLK6GJCyf
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: aKU3u2pbLVkZxRDKtn7_3dQBms0iWGD9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX2w5ZViAD/BnZ
 tfuFHcCcdFxfo0yQSokpgxcY5TUv3xjj4FEpBBD+rNtRoa0e4ibrxupo25QDgnilOwSCjFXgdZr
 oXjPo4YIgh7gfvf+PCw4j4m0qGccCeE=
X-Proofpoint-GUID: aKU3u2pbLVkZxRDKtn7_3dQBms0iWGD9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX1ILRS+SKmgan
 3ByEjzU9vjY9IV2YPPSASsJ8z3hZnt3B+l11+jmm3hheKPvuT7E346ioCz0eIYCNWqp75blYWSt
 pckFZHDjYU350zgXZgL1sXnq3A++RVBMKJJ/ySNmi1uqq1zO2bJ/Dl73sp2H9r71fPAqVJ+Fy5U
 iTlgaC/ZEv4j2vbqnaKA1sXOchFMfdK6WwiY04xRNJvsxVwZTX8YNV6gjJohNP7KV5bDM+Q3X7O
 7mTJWBtONcegM1283BqtF4vZBKKq17pbmvqgmn+aXh2sHqLggD1OEeyVIzXsIvkv0oo1efy6wzT
 VIJIfvW2EAXLRPgtrmNKcTEwrJeKbLhK+fALfJO/G7autvYNbj7B/D2H7I2KJfSFJneoOlk49B9
 v8irenUkFRtKXlHxJS2higpifKVd2Qr2GOoKln6+m0sdiElZJhX0c07r4BAoTn9t/QE5bmYvs8e
 BFPTl5aBz9KFI1JHLrg==
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a38c406 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=sASZlnxNsQdz-UvrQywA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=xwnAI6pc5liRhupp6brZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113918-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C0336ACAB0

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

Changes in v6:
- Split dt-bindings patch into two: one to move glymur-tcsr to its own
  binding file, and one to add mahua support
- Use regmap_set_bits()/regmap_clear_bits() instead of regmap_update_bits()
  in clk-ref.c
- Move clk_init_data from struct qcom_clk_ref to a stack variable in
  qcom_clk_ref_register()
- Add Co-developed-by/Reviewed-by tags from Konrad Dybcio
- Add missing regulator supplies for EDP and USB clkref_en on glymur
- Link to v5: https://patch.msgid.link/20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com

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
Qiang Yu (8):
      dt-bindings: clock: qcom: Move glymur TCSR to own binding
      dt-bindings: clock: qcom,glymur-tcsr: Add mahua support
      clk: qcom: Add generic clkref_en support
      clk: qcom: tcsrcc-glymur: Add regulator supplies and migrate to clk_ref helper
      clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator support
      arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR
      arm64: dts: qcom: mahua: Add QREF regulator supplies to TCSR
      arm64: dts: qcom: mahua: Switch pcie5_phy ref clock to RPMH_CXO_CLK

 .../bindings/clock/qcom,glymur-tcsr.yaml           | 146 +++++++
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  20 +
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |  15 +
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  13 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ref.c                         | 205 ++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   | 438 ++++++++++-----------
 include/linux/clk/qcom.h                           |  67 ++++
 9 files changed, 668 insertions(+), 239 deletions(-)
---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260621-tcsr_qref_0622-b091b8a06f49

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


