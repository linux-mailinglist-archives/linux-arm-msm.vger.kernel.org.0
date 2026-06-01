Return-Path: <linux-arm-msm+bounces-110495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGynKKoKHWqWVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 06:29:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B2D6196A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 06:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B8A53002B6A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 04:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56109321457;
	Mon,  1 Jun 2026 04:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XcBE1YZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BF6DoqWw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FDB315D3E
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 04:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780288164; cv=none; b=ZBbUh44oC/udSNf5IhZziVwA72L3+RP1QQ0rrjUZ4hVW4BBXwo5kO5nK0Vuv6AEdR7bSwpz2iVukWOZi661XHob0vKv6LOV59mczfgzOjEoskAwmUwZWiqMhB+ZpxU6JLSAjQtG0mSatzE6pgOQdmau0gjya6yXAxrb7kvPz5aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780288164; c=relaxed/simple;
	bh=oj9NMY0dHTGaZ+fF8PHGfV+wg6hs7AbMX7SVDbau+aE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kx+NyCdzyBQdhErJkWeyB/fTCHYXyDE6LU0Eo3+VoWAQ6P9wUXZ7n3KkMogp3zXEN1HT7TMPW7zUNDCDUodyGNmDevohXlQRUl2DpGRwx1+yv1KcDhe7CIVedyroVmMV4ARevUpkJJJXNZRaTpewwTom8o4LhcEZTOEktWxeVzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XcBE1YZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BF6DoqWw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VIfuOq2567479
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 04:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RKGMQInl4zv/ejwicadaXC
	R+S8YrLXcWc62MxjTRBcM=; b=XcBE1YZUdE1JcLfjwWsiVHEdYkj4eBbsYoyD0Q
	PlErcJ7TNfNVmVx6GSkFjBUyO50uInsuu7kknpzsumqcxTPxRwRqm2+Gmnq+wsiP
	vqbReIg9iw3Ryt1crKdjReGCb8urY/A/3AH3oZ+WHqzC8BsM+kGwYskrrUkgbjTO
	MOK4gOj6Y+Z/6Dm0CzVYZPbp6SqB5bpgVjhUOd6xQGcnZQmfdyaSl3vpnTft5iG/
	FlNQp7VSJeS6b4wcKljaY7uxHXvIra3JaJnsrMwAMALVo5dylSwSSJTq9hda+uXp
	N2HKAarj58dMUSlNigh8/toW0T7HHAcMohO7w1m9f6rgQ3FQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs2hdetv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:29:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2befec3fd8fso27799845ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 21:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780288161; x=1780892961; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKGMQInl4zv/ejwicadaXCR+S8YrLXcWc62MxjTRBcM=;
        b=BF6DoqWwJKUwJ10POUU9U0jnNf7zySK76Gou2OGjTqAxgX1eAQ2KJqcmH7HPR3cYiA
         ruqHlQxRnh1zsTZ9lsK9H+LjWKJhwL8IIUnqoE4HJaDG6xVLjA6QL1LuQgmcPe1zkP3a
         3FzK5eUHbNxdJZpqMh22/ev4lIR3+UMAv9rGB/lyZefWaSOAaZnIVovpNREXcOHPvxee
         IGo/04zPmKewzl9FDfTC/1rmli3bS15MBcpEON/f8FsUjiBo7rOnBZWe4PD8HkN2venT
         FKL7bD+B2iC6DdD6sHDohk5vB0QSVtyf3Y/sYsiHnt3MEtUCRicqHrxNZldJnPBjfrOT
         qHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780288161; x=1780892961;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKGMQInl4zv/ejwicadaXCR+S8YrLXcWc62MxjTRBcM=;
        b=leBXn1r+L7VS9QQ6bHxa6JYDWkygQgIbBSAWeVqlvEYDeF+GoKfc9t/DAQs+lGNcDm
         8Ch71uWPcb9Zbb8ppdaWad27YSzl9TyuxXSpcHR7Hb2Vo5KCF0C7ZpkaCORIJUvJMzoC
         90QYpi1roBVeYIzUU8EsgvFjc4lK5HkVBLNvjBtyk2eMD1GkbNv3BiIxxEtAtd25hA1V
         myovn5U0SxujNEoUZOW6RWQehjOnEn/WnYPj4wGl3C/MDIUDnxPwx2UMybnSnAZERVy+
         DEeXtM/mEMIOVr1fDs+xqAdRBCbr+km09Jz4iU1YxnUKG34+Aw5EPnkBdZG5t9naf/84
         kSZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Y2osFDvHbOB8vocQ6iOiGaGeZ2/3p9Dld8gU66qXRB4hnEiojFn7kEfNnr0Av89hNN0l3yKCr67jdt9cO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8RhPZJyGqUX5NcmKioMotKbl93v6nLr9oeDO6Wl8K5MNpaRGT
	/6avMf8CrodJx8bl7aGSkoOQA3YMSLI6tcvIeTS6bWAOe5tsIJwaVjAiZFUojc6FjI9PGXMMLYj
	v22qTJcZbw848RBB5X+q1cHxX7HLmejp10k2yvVozDPDJWTmwOJFbovC/VS1Mgf/Ztc65
X-Gm-Gg: Acq92OHGJrhRbXAHdYzVW6q/6RAtfRpMUluUKcGsUPuDV+B/kAtIXfUTnTmQ3jD0vLs
	anR0gqnz3wUXcZWnI6yXkpQiFQpzXFazedAzjCHE980ju12uleXsPpgWJXK6/cF2DCVcU9B3cba
	Nh1RlvqTzSSMKdA79JrRXonkGznTKLtvgFR9r3p9KzEgsM5xjfYr/2QkZsxD58FeOG2NNWfMUmm
	Cdn9htQM0hP9KyUMb5ptxHqRZsvTsDhR3nqWlCqLm3SHtbWCi0X9eqW5trSjnlnkR3V2SUeAkzL
	BCHPVyQVGAn2Wsj/IugIP40jjDYADAlVCe3mv8/wywhJWI9JEVlmmQ+DxbXcyDt2wAL21eWZpD4
	nT234Nhdk+jkmby1sgJpPjwf3DlQNgkXB3Cgm7bjGcesimrBLNxfSviV9GAbZ4Is=
X-Received: by 2002:a17:903:46c4:b0:2be:e3bc:e8e4 with SMTP id d9443c01a7336-2bf367dfc87mr97329785ad.18.1780288161462;
        Sun, 31 May 2026 21:29:21 -0700 (PDT)
X-Received: by 2002:a17:903:46c4:b0:2be:e3bc:e8e4 with SMTP id d9443c01a7336-2bf367dfc87mr97329155ad.18.1780288160930;
        Sun, 31 May 2026 21:29:20 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm117215715ad.41.2026.05.31.21.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 21:29:20 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v3 0/4] clk: qcom: Add RPMCC and GCC support for the
 Qualcomm Shikra SoC
Date: Mon, 01 Jun 2026 09:59:12 +0530
Message-Id: <20260601-shikra-gcc-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJgKHWoC/4XNyw7CIBAF0F9pWEszDn1QV/6HcUEptKQPKijRN
 P13aTduNG5ucie5ZxbilTPKk1OyEKeC8cZOsbBDQmQnplZR08ROELCADCvqO9M7QVspqZvHmHL
 oPUWoMtVorVkNJG5np7R57u7lGntn/N261/4mHLfrPzEcKVDJZFOWec7rUpyt9+ntIQZpxzGNQ
 TY44AfLgf/CMGKcIeO1wAwK+IKt6/oGB3ZhSA4BAAA=
X-Change-ID: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA0MiBTYWx0ZWRfX9VTDbLvNbbjc
 DfS87L0UX+Lj4U+1rMB4uTx4ZA/hV/g3ZUP6vlhLKLSE7IxOeN4ahrZYv7IRkyhiBCXY4heK/oQ
 BQQZAJow887o+C/+hYGm49l5xQQpEaJc18tZFIVZBX//umUVUawqwKANeaT2/ngWu7N4t7zsQrx
 nj3UkZPV913YgkWQufipwr+wr4UxTYm6KV/MGbqYSghAv7qEF5fOVUu/DTFNTxu+b2u89ALSpwo
 wobrWYQfGFtZwIN68sJVa54Yy9fRhO40tyuLQiNR1J9t2I6O6GZDjjHlG4yvWKE1K5bJTxp9kG+
 O1wkoL8ULX+23KmglTJfcOnQQqT1Ld7HVASf8NJBgKO8DGKAACQg2Kf5wHXeNErVTWVszkQT0sN
 QB0CPMbkOhF7e5UTYa3Ef84w78xN9X9u+Hy8OLusxM7Ee89SDY0hfjlRUSiy+iMj6SQiZhh6NsL
 lRFJK8kvV4CfgF4CgDw==
X-Proofpoint-ORIG-GUID: 0L6lyJMHGXVxe5AModFQ0rdQMMBS5a0z
X-Proofpoint-GUID: 0L6lyJMHGXVxe5AModFQ0rdQMMBS5a0z
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a1d0aa2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jEWS2u4n0fhbBKcMAsIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010042
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110495-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94B2D6196A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for the Global Clock Controller (GCC) and
RPM-managed clocks on Qualcomm Shikra SoC.

Qualcomm Shikra SoC details:
 - https://lore.kernel.org/all/20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v3:
- Squashed GCC USB3 DP PHY reset support changes and picked the R-by tags
  from the following GCC USB reset series.
  - https://lore.kernel.org/all/20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com/
- Added R-By tag received on v2
- Link to v2: https://lore.kernel.org/r/20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com

Changes in v2:
- Dropped defconfig patch and enabled driver from Kconfig [Krzysztof]
- Updated GCC bindings and driver patches
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com

---
Imran Shaik (4):
      dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra SoC RPMCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra SoC Global Clock Controller
      clk: qcom: smd-rpm: Add support for RPM clocks on Qualcomm Shikra SoC
      clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    2 +
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |   70 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                     |   39 +
 drivers/clk/qcom/gcc-shikra.c                      | 4429 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h        |  263 ++
 7 files changed, 4814 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>


