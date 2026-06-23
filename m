Return-Path: <linux-arm-msm+bounces-114166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fVDcHedlOmoP8AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:54:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EF36B665E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:54:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T9RYiuvp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EOQDcAA7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114166-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114166-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 451BD30268B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D353D093F;
	Tue, 23 Jun 2026 10:54:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52CE3D0BF3
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:54:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212057; cv=none; b=Hs7bqvcE28JO1Ut/xHKScP1JH+GUV7/ujOeics0KEGT68QmtXs7HLwbovEcTVG4jLUaglqr4Y1WSW01zIlYpY2w6DQjb2D00b7wzdm6+8vuEONY+EJXgwQME5tC/MM3TKlFarw1AavY6+8Q95G2zwRlFmSCew6EsemUB0jMvrI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212057; c=relaxed/simple;
	bh=CGKHmceFpiofqKPx4rDZhXK5Ys4QkIj93QxQBgPZLag=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d2C2RqmotXRc9BLt2an7yX9+Hf/KZv3HphJRRgE40fOvAJKylmisLvJGa1GXbeqrb9jmOfOnU5HJ9fuu9p2Rcbj8WhSmPrVJ4Tej+47LC6SJxCYTXOtSVVOILt8zZa4mvo4KD1/MfvcFCACLryGPPDEQMUCCaxbw7o9+VZtrScQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9RYiuvp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOQDcAA7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsFi72218883
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/g+/cyyg8C+7YG3dVUIEES
	Jep77mWvEbhJS/dThQ1Js=; b=T9RYiuvpR3VoDX8YbH5ssVMj2bxEh9FSDiEDk9
	7j1gwGlSrnEoTQbEMncxpNKhFLx0+M78gksHdXUEk69Fci61bliFxqu8Q25tp+v1
	e+fq7GDyOmbhRvc7FSNJfhJGa1fm4VzwPCpZGyK0AJtKe8lfqxXWrCmlCzpR5kYR
	c/DX+z6k8Yl/sed9hpRwTcZt8PuN5tkj2WhDW2uVlxR6bYepnkdKZX+PAkXshKEE
	B7u6zj6b/xxkMNDS4bryhrFMFzVuY7G8I0lNFQCIyIhVPC8IoxFM+kabhkpI+hHU
	FCbxRbEmwqch6WztJfKqonxMDtRD+riDBupdyJz0eGn/X/kA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1grs24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:54:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37d4f23eb37so4505223a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212052; x=1782816852; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/g+/cyyg8C+7YG3dVUIEESJep77mWvEbhJS/dThQ1Js=;
        b=EOQDcAA7+fCYseBU4H2bASkKo7WNzYDLJioaKBU3/sCbqU6ZY6kHZmWRx7TEboGCc5
         0EM3CDuijAreWkPbTeSQiCETVxydkAxH3NxC0BMu9C3pK42dH3vC6RkBl7SvEf2YwAWx
         AVyZtqVTtEbgMziSbTOsMjEZJdKYaB5clt/z5lvFqDntSqTXNr7KAOjL8CZZObWYijRP
         m1Dnc8TUR1E0MpYvU39tgt4jxPgS44+VhdJDs91T9/z4TX+udoZVHrKryE+Pk6kk+hr/
         n06hWLhbl+JILarTXhMltaUP2Gy6nnLKDWP595UPqGnagZ9FvvGvt+RmcogngkJX6pbE
         zzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212052; x=1782816852;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/g+/cyyg8C+7YG3dVUIEESJep77mWvEbhJS/dThQ1Js=;
        b=ERMezrQfnH9n02O1TR3O//SIN7W3mtSdcdTSdYhuNRWM4VelRrIEmI/MJFxJDPJhXc
         UnIIvdbg06X3EATv3Nf98wqOxRbjdEJWXM3VoiJos4PZ9bF0i3c+E14Lemp3VFVAhjVf
         T5GU6GY2poewyjQKupKso0BKhtOfKyolcAXf1rLwj3IJgRrDLOOPePftKvjQ+r3VXmv3
         EYfZl759vv47aeywRSQ/mT6y8fLSLATRqG6yppgz/y4Qvy6n9Iuh4Sr+VP9Itvl793fo
         bdkBvLofZL5RXM9x2qEo22ANyw324x7aziQOx2guqDW75VWlA0ZnZVuemBBLyZEy/WFc
         +KTA==
X-Forwarded-Encrypted: i=1; AHgh+RqhiFIbc1c3lMOP4GYdaFlgenzPgasb1hS5uaJMJYnNy63fW76sVZFUyJLI7X67+elDUvfVYGUFYx99l8Dl@vger.kernel.org
X-Gm-Message-State: AOJu0YwAiVuEMerfWIMxBPazTK7H+b3jVREbvrHrTk8k6ZZslf7WEUKN
	5bUEDXxcarovGrRcqFs7HMd1a47v1yzRKLAKqOAwKCiiBOqGy//vFkh2ZtLlEiuCuThbPq5kcey
	kTKl0pkLS4p1A0Zv6gbsJrqqeLuGVbE5QIJQca7VzxzdDq4TUHZDWxRS/rXtSe6DF7Zad
X-Gm-Gg: AfdE7cmufVb6mn0AL/3SxLpvZi4BBteLuaPnquAJmh3Gcs9EVxoFVf/Mo13HEXbg5/A
	thKH4gIp0ij03yI/EKozLgKLyuXyplOvoqogKqR7QuKZhfAL/0Q9/TBqIzedrJWFGip9B6jpi8K
	EIBKaVNmuiHX2bO24yu4b10g/c/35LkROtrP60tYYxbGuChYOM7v08F3Y6JsP00vASUuTQ6NPVn
	sK0LDWiBr6J0MgFdPhC1NQqaIPS4l1duqycQqrRJ9lGsd0fQxrKTcsaWgJPIEJFNlrcTIhHpxM7
	NP+VYzesz6rqzrLraIt8dwJZvAw8JYyStNlJwSBkTH2+TF74y0pADFI4Z0JHTmPJOtQ0rBvBP7C
	Xw4OzNtgNjsRmvXuSHxa/i3aGQLk59q7u9Y8=
X-Received: by 2002:a17:90b:278b:b0:37c:6975:2e3d with SMTP id 98e67ed59e1d1-37dd0d3de38mr2393219a91.8.1782212052132;
        Tue, 23 Jun 2026 03:54:12 -0700 (PDT)
X-Received: by 2002:a17:90b:278b:b0:37c:6975:2e3d with SMTP id 98e67ed59e1d1-37dd0d3de38mr2393147a91.8.1782212051621;
        Tue, 23 Jun 2026 03:54:11 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm105788365ad.37.2026.06.23.03.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:54:11 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/6] clk: qcom: Add Nord multimedia clock controller
 support
Date: Tue, 23 Jun 2026 16:24:03 +0530
Message-Id: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMtlOmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyMD3bz8opTi+Nzc+DJDXcsk85QUkzRLoxSzFCWgjoKi1LTMCrBp0bG
 1tQBi414zXQAAAA==
X-Change-ID: 20260620-nords_mm_v1-9b7dd4f92d6d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: VgWzNNvr5VHqqDOyKtM-kgwMsBVTT3Zm
X-Proofpoint-GUID: VgWzNNvr5VHqqDOyKtM-kgwMsBVTT3Zm
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a65d7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_t-zcm_tZIxzBNxMqFMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX38Qt28OFwLG4
 yg0Iko3ZvlT9cux5Ft/0skr6M+I65kLSMiWAclieoNC/bGscge1Iq2nb13XBAgFzQO6y/a2pK+g
 IH2oSnD6vPmoDTgj8hdovJrDcPI2wX4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfXwom9C84msAio
 z5NsojsNKjgGiKiz9FogsPNVZLyQ78nTXPst8cgOuIHilplCVT+oIg+aBi/JLtjreu0n3qtR/92
 Rx4uWCGBbkRf+pS3P4FLh12B4v6JLzlM+L/D/BGjwjZfv9Ns131AsWT/sFrZjWlcb66CiUxBjGj
 SH0XJ472jvCn8R1xh1vFqgLN02NHxt1Yx46yfOL6rIeS/P3AdNWQylxRLzQAsD+yKO3Z0XwAA3d
 8L0Y9rbevx9nsKQupEmHQBPe/Y4yBmMUtHcN5bq5mpBncE63iItLhXahaa7esFZjBWLA6PkCtqe
 rYY1Iy2bOqAeF8HlDrs9SWFGqSuLzVd72dvyKdKwyZVjahPlwRI5JqDw2lgPWX7AvCn0QdED6Pi
 dJUcC3t26EO5mGgGeYVIJfX8QLH/sgWgzn1gf2issGkfJa4dDQuXIxkwB9cIowFTQbChEfbR1NE
 H+tytCC5rnfhIenNCdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230089
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
	TAGGED_FROM(0.00)[bounces-114166-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:shengchao.guo@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: E3EF36B665E

This series adds clock controller support for the multimedia subsystems
on the Qualcomm Nord SoC platform, along with two fixes for always-on
clocks that were incorrectly exposed as controllable branches.

The Nord platform is a multi-cluster SoC that includes dedicated clock
controllers for the display and graphics subsystems. This series adds:

  - DT bindings and driver support for the two display clock controller
    instances (DISPCC_0 and DISPCC_1).
  - DT bindings and driver support for the two GPU clock controller
    instances (GPUCC and GPU2CC).
  - A fix for the GCC-Nord driver to mark PCIe link AHB and XO clocks
    as critical CBCRs instead of gatable clk_branch instances.
  - A fix for the NEGCC-Nord driver to mark the GPU2 CFG clock as a
    critical CBCR instead of a controllable clk_branch.

The two fix patches carry Fixes: tags pointing to the original Nord GCC
commit and are candidates for stable backport.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (6):
      clk: qcom: gcc-nord: mark PCIe link clocks as critical
      clk: qcom: negcc-nord: keep GPU2 CFG clock enabled via critical CBCR
      dt-bindings: clock: qcom: Document Nord display clock controller
      clk: qcom: Add Nord display clock controller support
      dt-bindings: clock: qcom: Document Nord GPU clock controllers
      clk: qcom: gpucc: Add Nord graphics clock controller support

 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    3 +
 drivers/clk/qcom/Kconfig                           |   22 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/dispcc0-nord.c                    | 2006 ++++++++++++++++++++
 drivers/clk/qcom/dispcc1-nord.c                    | 2006 ++++++++++++++++++++
 drivers/clk/qcom/gcc-nord.c                        |   37 +-
 drivers/clk/qcom/gpu2cc-nord.c                     |  546 ++++++
 drivers/clk/qcom/gpucc-nord.c                      |  593 ++++++
 drivers/clk/qcom/negcc-nord.c                      |   22 +-
 include/dt-bindings/clock/qcom,nord-dispcc.h       |  115 ++
 include/dt-bindings/clock/qcom,nord-gpucc.h        |   51 +
 12 files changed, 5360 insertions(+), 46 deletions(-)
---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260620-nords_mm_v1-9b7dd4f92d6d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


