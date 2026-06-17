Return-Path: <linux-arm-msm+bounces-113613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pZSwM4yBMmpW1AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:14:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B29698E11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:14:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e2Lr0Cv8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hjgCkXfu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113613-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113613-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34F1931847C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B06D380FDD;
	Wed, 17 Jun 2026 11:08:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23323370AD6
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:08:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694483; cv=none; b=DU/hIQIHPY6MbdQD2pRwZxArJ5wVS7+nieNnfrFjtASmqKK348DzF5wLB+p76kKobxZeHWBKaBSMXsjL6g80mMoMi+aYTw5HvmFQYsINDJWNshY+O9/ocPmMKlLmmx/g1664E7BDGEje7ZtbnYRKn82l7KdjPVq0/OFeWS0K3yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694483; c=relaxed/simple;
	bh=bv8uzhE1UalkFsBO3sVAwdznQlQ0C0w7nZfUZ/Elo8Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Drbqf/aNHPIp52BvplSAjrCDAqOjFwDFV3d1vLDx/21AlrJft0R3SpA9JYSSDNedvbudnJrlVyGRHRerE3rUhMyv8+kUwRXAqvjEs2PyTOxvuB5nfe8GDsvdDEpwoiLR3POn4mXIFlPd0wFvXVpQOieGeaSoC1CSeSfNmGRO8u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2Lr0Cv8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjgCkXfu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UKVY239729
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LvGStKxZDmkZlkmNhX7Wnh
	OMVUTKVu6r8MbouD/ky6M=; b=e2Lr0Cv8mn62aJosz2xk5rnvowS05Ue2VCIibW
	Q1iRzbEL/uvHN3QArI1CCQDkQbdSh/QzQBvE3+YepeEANUz6bvREhIoj122zbS1V
	iYagycu3RgwhndaSy8YHeJ+pF3rkxe/GbQwQRVCrJqObbeppPGOPKHGVtEyeCk65
	3Rrt3kVi80Gy+VaqP1Ti4hrC0/3eCdCUJI9gRgyG4vp5lH+mg47GSDKiNvIipDWl
	Mc9RbsbfQ9rB/idfLlj7rK3iv7zn4L4Die+QdniCyU4ohc8gvtdg2afuL8gdYF5f
	kpPuAfnBttHmhQKoI8Dmx7AMHC3m8ykxezQaYL1BcI3gBdPg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueepjqhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:08:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842278a630dso7117942b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694481; x=1782299281; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LvGStKxZDmkZlkmNhX7WnhOMVUTKVu6r8MbouD/ky6M=;
        b=hjgCkXfuwF7tFV+tmqb7DT2P+f/IXNRTIRD3jZgiDHwckB/k7QFRyn0RewHrIo9if5
         rWl5ac52+6v9oTlgBP1qNOOtiQFvf01mjYH52jz6/RNl6YCyxOHTAXDk9U5+FCfopLXD
         j6AbImSc+lxHOb0W3+AuIxqX8T3zOb0r2U5G8/UFTX47QPcP6c2YqdxSJ7v94RHqjlhN
         cDmJogC5rUB2wX87W9U4fZ2tPgk4CCt8hSxrUtPh/39rSrIH+u3Cp83cHUOkWnce6pSg
         n4eAGO+CoN98ltV+Cn7YFBSOcuL1HR5403S6rsE0W4pbu5bQEnQ8aEAa+qZH065JzbEw
         oF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694481; x=1782299281;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvGStKxZDmkZlkmNhX7WnhOMVUTKVu6r8MbouD/ky6M=;
        b=IUNIFg7roniMBP2447Z440r9lkK619GqdLYnpCnPlk5/L7qn1b7izEswn8rkB0HLW5
         60ta6L5xx3HlZd9WCmX7re8rktpJ7xTVT9vSDf1slkHOWX8jXl9+MSTXEzQlelFbUfsO
         tVTdpM6xyVdcY7npcyfqCJ9j4lfRaSU05xJBLA4+kZxC2BrOxDeN2axos/7kcdiadcQs
         FrDQmYp/lvilpzTtOedTUUgkN3q93M5jQsv1PWNEhvPA0aDOmLDBdWUWgXq+eNq3NS4R
         f566j6YRqLJcuYqmW+bJxZzXREXovAxUSH4eETwKiRu7XMsTh50jf5lGLunoabi3drR0
         Z9lQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DdraYY2RgeXzS7+JOyI+nKRl0L9yA8NxpQ9FFvpu7IhXO70pcqG1W5qbDx0+1XWzNQWCpGaP4umDIt5AY@vger.kernel.org
X-Gm-Message-State: AOJu0YwoDraqOaCwcdnXoHmh9kTzlsidO3HNOPGzNNXcoL1xxVa5ibWh
	lRYlPucfo2Ca703glC500wlDZ02HRrgHO80jTRlp8a6UO/Znraihglk+zYxVkHDsf9XC7JrkGbu
	wN8PxyBDPqkrD4foF0mb2RSo5du8XEPZ/4oJ48FVOdq172z2NKZRRcdYMWb9hK4/5EjBX
X-Gm-Gg: Acq92OHgHGS127T1yo3lVY++BamVMMgTq/0ts+j3VfLPlKx0sCNobNSIrJ6eItnDXhB
	ZztorkMpXlpwQWxfKMIB49ID/eeECUWSRYV91RVn6H6YBGxPI4e3dPCroLqx2NBiG02uz6bsOYu
	J/Vcs8i9PtF70K5FQzS7W4z4W0DqWPMVUCPLbCLUn/0v9+OcZDcgodSgYSR3xipZP/n6cFBRAcr
	Wb3SUvIoO2ZjwqUV3fGt2Ei4c80wF7D8a4Y+3JaUkom4FmX/HIwjCZJW17Wiu0Q64aVEgXYET+S
	9k24Yu61MAbQRNDMhUxT9bCWuy2KSXVF9H9ZANRgF7QZBRiv3K3ZsdJFPDsX0tOVVYidvsKbvAd
	krlOc+Xq3KpVrceGOw7z5lsoHXU/BPg0AVH0=
X-Received: by 2002:a05:6a00:4ac9:b0:83d:b0a0:90e3 with SMTP id d2e1a72fcca58-8452457f6aamr3569975b3a.31.1781694480796;
        Wed, 17 Jun 2026 04:08:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:4ac9:b0:83d:b0a0:90e3 with SMTP id d2e1a72fcca58-8452457f6aamr3569936b3a.31.1781694480305;
        Wed, 17 Jun 2026 04:08:00 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9cf01sm15873609b3a.11.2026.06.17.04.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:07:59 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add EVA clock controller support for
 Glymur SoC
Date: Wed, 17 Jun 2026 16:37:51 +0530
Message-Id: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAiAMmoC/1XM0QqDIBTG8VeJcz1DLa11tfcYMdRZCZmbLlmE7
 z4X7GI3B/4Hvt8OQXujA3TFDl5HE4xbctBTAWoSy6iRuecGiinHjDKko1DqNs6bXT1iEsu6PYs
 BVy3kycPrwbwP7trnnkx4Ob8deiTf7w/i/1AkCCPJiWoaxlSNq4sLoXyuYlbO2jIf6FNKH4mPZ
 2qvAAAA
X-Change-ID: 20260525-evacc_glymur-5b0b489af038
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=AY+B2XXG c=1 sm=1 tr=0 ts=6a328011 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IpJZQVW2AAAA:8 a=20KFwNOVAAAA:8
 a=qPUPAFQaLVUpwlA2bBwA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: dUt_Iez4OlC3AcNDEGEPTLJT-99yOVsR
X-Proofpoint-ORIG-GUID: dUt_Iez4OlC3AcNDEGEPTLJT-99yOVsR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX+WuSjFKstUNb
 rYJQMAdcN74UbooRIDKeJOeETF4ooOhfIEra4ijrapZD9UaohKPx1jRzecW1Oaa0iWbbypwkulJ
 HsUdiLTfKPcTpPyFi84Pf6cCOzu7Y8UPg7jCocFF9PYa/ZRtpY13wKQ/GZcq4zY1+HNP4TYgZiF
 5XPxjLUGeqQl4xa0gG3R4+sUYtiIbXmato3bB3USG+2mKn0R+R9SnMkXoFVqSo1E3SP2Ef5lJsL
 g2ULS5EEvoiWn0Ua2+U2PY3rhBzNmbOn7tbglhEsEvAbf0/DEcc8v/9s0Tzhaaya+qT2LWAEpc1
 698NjDDd6FL/E8Rf2OqGDCKEjv6UhYH97EUXyCkNem83QqOvMhrFWtdSMkasj04bu1Y6Z7kqoSW
 x4zhqCwvtqsxMOjJH5bVykO1CDQ1tVMhZOqTEwDoKSVvnU3fT65sxk26G+WC3wyHWjVI05PcN8W
 nM181uQ246EIHVrUF4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX9zxBSrEeGEUb
 Pqg9Fga4DdaMyZ5M4BCnQryeB8oyA2UXUEvU+1l4icpCm2BnRwCidFoLG/y1zXvkdzRvkxHVxEy
 90SkF745IPY0nPCKChKSCPgK7BMk6OU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113613-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43B29698E11

This series adds support for the Enhanced Video Analytics (EVA) clock
controller on the Qualcomm Glymur SoC.

The EVA subsystem handles vision processing workloads and requires its
own clock controller (EVACC) to manage the PLL, RCGs, branch clocks,
GDSCs and resets.

The series consists of:
- Move gcc_eva_ahb_clk and gcc_eva_xo_clk to the GCC critical clocks
  list since they are owned by the EVA clock controller and must remain
  enabled during boot.
- Add DT bindings for the EVA clock controller.
- Add the EVA clock controller driver.
- Add the EVA clock controller device node to the Glymur DTS.

Changes in v2:
- Update commit text for keeping eva ahb and xo clock [Dmitry]
- Remove description of 'power-domains' from bindings [Rob].
- Remove XO_A reference from bindings, code and Devicetree.
- Update comment for CTRL_IN and use regmap_set_bits [Konrad]
- Update commit text for device tree [Dmitry]
- Add RB-by from Rob, Konrad from v1.
- Link to v1: https://lore.kernel.org/r/20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Taniya Das (4):
      clk: qcom: gcc-glymur: Move EVA clocks to critical clock list
      dt-bindings: clock: qcom: Add EVA clock and reset controller for Glymur SoC
      clk: qcom: Add EVA clock controller driver for Glymur SoC
      arm64: dts: qcom: glymur: Add EVA clock controller node

 .../bindings/clock/qcom,glymur-evacc.yaml          |  72 ++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  18 +
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/evacc-glymur.c                    | 455 +++++++++++++++++++++
 drivers/clk/qcom/gcc-glymur.c                      |  32 +-
 include/dt-bindings/clock/qcom,glymur-evacc.h      |  38 ++
 7 files changed, 597 insertions(+), 30 deletions(-)
---
base-commit: d387b06f7c15b4639244ad66b4b0900c6a02b430
change-id: 20260525-evacc_glymur-5b0b489af038

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


