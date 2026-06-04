Return-Path: <linux-arm-msm+bounces-111116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wqVXKFwNIWq3+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:30:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B1263CFA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:30:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aiiIwK5R;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LWOmukMS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111116-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111116-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28176307917F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 05:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C423BFAF7;
	Thu,  4 Jun 2026 05:26:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054903BFE40
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 05:26:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550790; cv=none; b=KlMmShQhc9uBkLMe/wbYn7PXz+tF0zluPdnIptEqZZAbF14+yGVtigvSG/XwYo/PwqUYLSPWKVSpICois24mjyKVSEXkS1tcCA0H8sRylWfNv/516hI+Rs2ctBCyFbUQmxSWGiwRtF/3higm2aMWDlmEC6r3UgucDqeP5vasXqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550790; c=relaxed/simple;
	bh=JlKh+5TKy2E6DukNpKQOl02G3HujIDfErIuyMU5zelw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LqyfcfygxAph0bGDH2ddEhjZDlVSFygUMZW+rkDHKcPAOioZAn1F5iHIFBw+a3MsKjhp5GOJa3p457VVd2txq84pf8pDoe5I01TqZ5GU7yirwKIcIgkDC4N2ZtLTvJo+K5MywjrOtVaU1UG5CPJ3fXuXwM5rP3dpOBh69vkfIYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiiIwK5R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWOmukMS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542EeFA3552300
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 05:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ULxxNQ2twQRZfxGQlDEjx
	1vOZlqIbbF2YSfri/GGyU=; b=aiiIwK5R7y9zku7tpXabwHsZ4N2EBYRcDNoNB7
	ZXa586fqCJJ7ZxzNWTji0hesjFWN7ldyDL1msNVwGIulYbLADJscUnrzQbaK0afD
	KhVfr55ZSlHVZMYKTcgNy/Bo5F4aqRx9Hu2kaZs59uEnmJ1O2zQR4XysvjJMauFW
	KbqVwwVoBh3GkYbnnAdHl/zunum8aYxAI6x7EJzRHrnimsG4YF0MTjDsF1aNSakv
	k0+iCsUktyzVtXQJg9rqjRw9gPnkGW38PoLv6gpwrmBZEdoCLDimgYJlLaAoVW4r
	NB44p/K7Y5kM6Mily8DVJbzp6M7krPSsONAa3JFvLW4Q6vRA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mv52d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:26:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84245e2bb00so295331b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550788; x=1781155588; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ULxxNQ2twQRZfxGQlDEjx1vOZlqIbbF2YSfri/GGyU=;
        b=LWOmukMSgiAVdCVLbSdrYb+c+3uThxjK0sORuMoouGMVNkmnAZEganVL98GYi5I/2R
         9uKRj0DE528CZbwGEdVcXARmvVR2vD2t7iCN8wME04Rmz+S6YkZ1nXdKdAtbgd/UJ8dU
         /MwldhsF5kRaK1rGD+YKEtxJBVI2+OlIgil2RPHvYOcj8Vjbg0XM7bsavDyljhXLf49X
         xHnPOZfqkpel8GSzy+1bPnWwVAPTdJudMYOa+kQUdd6ClP1lPz1TdrGebb1yU5IkPXXY
         ihd/vJvDPkQm8Fh21hE6y4d98/rBzpH2OvOBnfe0tMjVYoQC9V7GwpwBFaaoUMABsNaO
         584Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550788; x=1781155588;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ULxxNQ2twQRZfxGQlDEjx1vOZlqIbbF2YSfri/GGyU=;
        b=GOjaQBH5GKp2t0Zc/zTpm2t9Q2iRshCmjAAIzFbLDbB5hvxzJxkqzk/UQSJJbTOQX2
         oRv0YJAVCMP3U5GGfBiAVEoXaXZAxPMYVM7OaeNk4E56bjD4q61+EX7NmJtBceyR4XAm
         3tCgYsHc0qTrDpjaEx9lJQn4j+B9QoEAD6n9cRI2Kr8wRny3byaK6ZHFHwzQeSHS6yXA
         doNC2A+scx1rlSWjEuplwrv3n6OuXYWyk6iyCNnH95AkX0vxY7CP5S5GqgjnkLKEzFW5
         Tlp/O/XFSwHr7uZiRbGLWiSy9ZgDQNL7XtXPq7qGq4WCKqjbzwcVix486NgYWk0VbvvW
         tjLA==
X-Forwarded-Encrypted: i=1; AFNElJ9WU1rfuPm6V/G2+THn4uNAtjuTflITcl9mbAkO34LLTiC4yeJayumk6jnPH6nREs3ChVJWx8jk3BOifRy8@vger.kernel.org
X-Gm-Message-State: AOJu0YwzUskc97dA5TVELviXo6I2SEuJmN1Bn9FlFtcu3xtfwjiqOAqT
	P3We0fSPu5SCixgJut94Kr8VMo961g7RIoo4cq93b6NcoXxQWdGDlkHGsPxKimp4LMmF9LTgIXI
	LKZpepWmHM52gi6aWi2nC8sczolbeD416Rv21n+D+xSmBY4a/9u0ZKIyCHAtdQOYdaRJ6
X-Gm-Gg: Acq92OHsCWG0AMUTmEpfePfSP1p0A+B+0LsZ+U3hl4NkPe7+sXuYCFG4EjR3EEGI9M+
	OBXwAj9BTjEvLYSVoioUxVGOBAlgaGOaGOLIcsCROLfik4tTcytvvrhndWcmg4fnPaTJrgGxL9B
	zD8ZhILAm+/v1KZcrdziQpXJDGRhR5iv7yx0Dch9XD8uCMK6c782QP2EgcO+Y4oG2io8O1hK3cW
	+jVNT/nZq4MecYM8+oDmFf+SFeoSMQDAHpR1PIkL+sQNwk7DEVIj6ULE2taq++BHXwvtOjHLMF5
	AqMUrQl99q+IloamNgEXb1XBQVM73gC+VdABlBEKkTdX3oYu6CSbracBtt0bs47dpUnxnlHUy7Z
	vbf8v7mhaGUWXzhNhTi3Q9tlLKKSy5jZu9HrJiyWZ4Ub5/Yby516GxZdqF7ZZES0=
X-Received: by 2002:a05:6a00:a511:20b0:842:8985:340 with SMTP id d2e1a72fcca58-8428985054emr4406584b3a.35.1780550787425;
        Wed, 03 Jun 2026 22:26:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:a511:20b0:842:8985:340 with SMTP id d2e1a72fcca58-8428985054emr4406562b3a.35.1780550786985;
        Wed, 03 Jun 2026 22:26:26 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:26 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v4 00/13] clk: qcom: Add DISPCC and GPUCC support for the
 Qualcomm Shikra SoC
Date: Thu, 04 Jun 2026 10:56:06 +0530
Message-Id: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHEMIWoC/33Qy27DIBAF0F+xWJcIZgAbr/ofVRc8E5SHHXCsV
 lH+vcRpmyzSbka6SHO4mjMpIadQSN+cSQ5zKmk41CBeGuI25rAONPmaCTBQTHKkZZO22VCfyug
 cXY+nOlWU2gEyYFGSujnmENPHor6933IOx1PFp9vj3e6bRRagf+R1BfO4r9PttoUC0yL4GCNa1
 s9IHot9L0vOf2tN1LfS61ZIoYTqZ3FdsKYE6ob9Pk1943hwFlBHg0IqCdoggJQodXRtZ5UOVvt
 OtOTafJPKNOTP5TwzX6r/e4mZU0Zl9KpFLpSx8DqUsjqezO76/aqOhZ3hgYLuOQWV0hIjVIhFa
 /+g8E4pxp9TWCnFHbcGW5She0JdLpcviLUrLw0CAAA=
X-Change-ID: 20260513-shikra-dispcc-gpucc-6f59c23020f5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: CwKnNmfzzDSi0P-YjJ0Y-vJZToz4DMVn
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a210c84 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pcGu9BRYFhf5DAYLC2UA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX12oUy5Z7jAev
 6vInUtXUPeyaZKyjcQsgJdlbwJu5yeS9qwCq9bYSg4oLaKDJy4PNwL615m9TK/8MeKlxmCCOsyp
 lPuyyk5/jA0Xu06cEitWnGNl/UuHglLOyvd9vFV0ZjPwLzFR4pOd9KGkVvJx+S+WIOZKoji2gST
 8DGp2YOO5DecphSrAL0MAy9/IFTUikU7lQI7ixxL+q+Ij9xUnbY4clddb+6ANFBgLa3JjySgyYX
 zq7ne0Avg+r25SiEm9IPTn6l2HAj0uFWk1BP45B346YfbXneJWR6SfRKcta59fHjRjL/HtQhr8l
 hWNdFomMfCs8tfWfqLYW9+pMiIHKMbvDycUhYJESMEV5Q2lz/KmPRBmV+r/WPr6jOK4bQn5E5VD
 oeWr+gd+aet0M1vwAH+0l0h8Y+LEeiSDcFaT5PFYm/XZ8nkIyhjuDcK3MHz5SnnA5sRLCRpLZCP
 TCBdolI6crCE3WLe33g==
X-Proofpoint-ORIG-GUID: CwKnNmfzzDSi0P-YjJ0Y-vJZToz4DMVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050
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
	TAGGED_FROM(0.00)[bounces-111116-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3B1263CFA6

This series adds support for the Display clock controller (DISPCC) and
GPU Clock Controller (GPUCC) on Qualcomm Shikra SoC, by reusing the
respective QCM2290 SoC drivers.

As part of this, the series extends the QCM2290 DISPCC binding ABI to
include DSI1PHY and sleep clock inputs and updates the Agatti DT
accordingly to match new bindings.

Shikra GCC series link:
- https://lore.kernel.org/linux-clk/20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v4:
- Included new patch for Shikra DISPCC/GPUCC DT node support
- Link to v3: https://lore.kernel.org/r/20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com

Changes in v3:
- Updated the QCM2290 GCC patch to use the .clk_cbcr convention
- Extended the QCM2290 GPUCC bindings to add DSI1 PHY and Sleep clocks
- Separated the patches as per the review comments in v2 series
- Added Agatti DISPCC DT node changes as per the latest bindings changes
- Link to v2: https://lore.kernel.org/r/20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com

Changes in v2:
- Dropped QCM2290 GCC critical clocks modelling to kept them ON from probe.
- Updated the QCM2290 DISPCC/GPUCC bindings to align for Shikra drivers reuse.
- Reused the QCM2290 DISPCC driver for Shikra without modernizing
  (keeping the clock-names approach) for now to avoid potential bindings ABI breakage.
- Modernized QCM2290 GPUCC driver to use commmon qcom_cc_probe() model
  and reuse for Shikra. 
- Link to v1: https://lore.kernel.org/r/20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com

---
Imran Shaik (13):
      clk: qcom: gcc-qcm2290: Keep the critical clocks always-on from probe
      dt-bindings: clock: qcom,qcm2290-dispcc: Add DSI1 PHY and sleep clocks
      dt-bindings: clock: qcom: Add Qualcomm Shikra Display clock controller
      dt-bindings: clock: qcom: Add Qualcomm Shikra GPU clock controller
      clk: qcom: dispcc-qcm2290: Move to the latest common qcom_cc_probe() model
      clk: qcom: dispcc-qcm2290: Switch to DT index based clk lookup
      clk: qcom: dispcc-qcm2290: Update GDSC *wait_val values and flags
      clk: qcom: gpucc-qcm2290: Move to the latest common qcom_cc_probe() model
      clk: qcom: gpucc-qcm2290: Park RCG's clk source at XO during disable
      clk: qcom: gpucc-qcm2290: Update GDSC *wait_val values and flags
      clk: qcom: Add support for Qualcomm GPU Clock Controller on Shikra
      arm64: dts: qcom: agatti: Add DSI1 PHY and sleep clocks to DISPCC node
      arm64: dts: qcom: shikra: Add support for DISPCC/GPUCC nodes

 .../bindings/clock/qcom,qcm2290-dispcc.yaml        |  28 +++-
 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |   4 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  41 ++++++
 drivers/clk/qcom/dispcc-qcm2290.c                  |  87 ++++++-----
 drivers/clk/qcom/gcc-qcm2290.c                     | 160 +++------------------
 drivers/clk/qcom/gpucc-qcm2290.c                   | 117 ++++++---------
 7 files changed, 190 insertions(+), 257 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260513-shikra-dispcc-gpucc-6f59c23020f5
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v3
prerequisite-patch-id: 5a0fbdd458785da2d0e850c851a05046672ecadf
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: a64476b2ba6e0f2a55928baf72ec32672ee0123c
prerequisite-patch-id: 63e4153eb0a47bb23d906be97cc4ce84f9821248
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v4
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>


