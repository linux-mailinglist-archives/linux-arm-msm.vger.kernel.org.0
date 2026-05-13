Return-Path: <linux-arm-msm+bounces-107346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHDKKW6KBGoxLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:27:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E215350AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D05CB300D157
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B90538F928;
	Wed, 13 May 2026 14:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XDZU+OE+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d6C1gVrw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F4540DFDC
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682206; cv=none; b=T1aBl9F3bJXAPOe+0wg5tlc2u84M00/j+jqEC+/h4FsZsC0HPKhep/Nu4II4dvDYJ//4Sv1heiedOP3JRwXYFD8jwe4F4nGoXyY4IjRk7y0mo2F12cQco4HplFXiqagvnLnF9po9ig/2hKGo0b6Jus539qOKLq7YZjK6slVm1tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682206; c=relaxed/simple;
	bh=4R/f9nuj5oke3QAWiV7q4TaukZ9lHkDNMVXoAcgz4O0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kn/R9zHKIP33UbmYLnQm5bpoiHN4d+OwUo5wZiSpvr8Z8+b9mzz3xpCsab7Cft8pfPCP2Y/RbzZtI0S3z8d/kIs4SM4oDpDjYGRz7Hh7kfpRFtpXILViTDj/Nqt41+cLftBJBdy3e/6TPp3xTZFB1pBe7dNxTARiGe9RBSizaLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XDZU+OE+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6C1gVrw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBt9Zq3324713
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aXgSSn27XG5QktxMkuF7jA
	mn6KmQ3QqMT73PjLfre2s=; b=XDZU+OE+cRby7iIoaJQu3bRDUpjLRAuDfY4cSJ
	D6CMEdRvkpq65Rq1yZnQB+o0EcafSTCAyJMg88i0neUAs3xw12rqSF6QIF8vF79/
	w6w39tkVwWdg0aBI8O27c+5eqA7BAyUgj85H8g3QL4uihOw/+5qoPfXcV4NRCCBG
	ozlXcVGtn3R77wYhXGyEgDMx+v99TyLQgqhQJ851hfCWPmYrIOvAGGM993zsjv1c
	uG4OLmrmYJIzq1cYGLhzl7oJyuCubXF7S224rHPzVEqKMtH2hGip3wlLMlGdDx8t
	I7AV9rXm8U+O/HZ/cEMwt2Hqycz4porw0mlxvwuPH1zo/dvg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd9v7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:23:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc860066a6so33389465ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682202; x=1779287002; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aXgSSn27XG5QktxMkuF7jAmn6KmQ3QqMT73PjLfre2s=;
        b=d6C1gVrw5sJKyfXfN7LRI0gwx2p5QoXD62UtWgnsm9HmHugB4Xb2h/kdkjfa+OflSE
         7h1U1ejUjFpXfSCi2Cgci8hUVNsHERiVNgiJ3pJ6u9EbpMtIRfE6TLXt1HKdek9XFHzf
         1Vh19dqgwD1+d2PPlPTe8zA0Qnq46A+xE/iQupJFajiRHxihdSY7ROIWCOGU9//3Vg0l
         HGsjmgZQuCqqoePbQT/VJvrP43lDYvXC+ZDwQx9PDz0wr7eDh2DNu45mK2LIOBBGy31B
         NbGQC2upq8lir0Qyjj2cRaIk1j3Wlhv04/vjJnvSzHWpwg3mPzXs5ep63I7d0LPenbjv
         RQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682202; x=1779287002;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXgSSn27XG5QktxMkuF7jAmn6KmQ3QqMT73PjLfre2s=;
        b=NMOJAfs/RLqywIVrUzCGfFJnsQm+bRDiM/fp37TAxZvA8NyWSpbG5uL02UUeFq3yRz
         pZxH+yai+WX0E4foPQ4a6rv4XEopylPbItgpcbkG0fOps7BQaDXeOfBHtLuSs4NpPz6M
         PUZ6AsQ52CsIx5v+IKJkXL8s/Fg0J4dtGMdNlqhgZoRxI0YsUoDhApMcp2eJOzSjSTt8
         qoHkGEszmarDR7U6HB9lVYjIFj+CkpQbJ1vtQMe2wQt5+peYE5mrAE43WVadXSQXzMAw
         cDyCiBhsS9U5OfwQj3d9lwQeOlcqnAPXJn7ElDaSifMQn/ct+6TGPvPz4NKlSU1yme0B
         0BhA==
X-Forwarded-Encrypted: i=1; AFNElJ9kE117PItszFTtiMC/tra80RRt8mkznH1ANsxuZW8hv7XCRa5x1zmqDs8EXI6uk1jKwQjOxRCl9CV2qg+U@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvu1sOGDIybW3kx2QiGlPxpQePZLzPFRG3SUHAdTo8ZH523iu2
	K/XfRadpQNUAldsxRzbh0+dMdzv6xIaszWb6XbVT1L0pUiDGR5gdEpArvIo/+pzMbZDBD38BVva
	ckkmR4LsgvHlL3LMC1+3aaXqhvvMxR4m+skTk6xC43AKr/aDA7b6+j2Dx4tPRXQ2J9Jm3
X-Gm-Gg: Acq92OHyfccBqb6P2ToPGrQE3IwlMkrwBM0xF7D8TlAIb5V/t5P8/DGSbEXSJNjlQuj
	umXQCyZdHZl9gNPxo8q/1NAVxmddNAkOgnjv5QWbbY5hEnm9fhdj2STtJZNRQh4By5fY3fbHLHO
	prxB78izXkikjUB5O34kmiy7H5wHBXEJ1VuFx05vNc6P6Rq2lTtpL98kKA7BmrVLXiC95qORzEz
	ZfBDKqMZyhOcFFfVsxl+kXv5DbBg2VVee0NpsS7+g7mg8dRN3dhQ4RUQGSQQTmVV3JVoMC0nZPD
	qwIDLDDosxWvYbz2F1W+X9k+/QTYclKCZD8LxwdvOSwWi1KC+AjAZZvTshZYQDwBbgmkyz08kMP
	ar2mZmFvsXUyJgfDX3Jk9QdPwVJBQpDaoiN1qM+ZdzTObMQ==
X-Received: by 2002:a17:902:c212:b0:2ba:359a:9b8e with SMTP id d9443c01a7336-2bd27158ce7mr31344825ad.10.1778682202361;
        Wed, 13 May 2026 07:23:22 -0700 (PDT)
X-Received: by 2002:a17:902:c212:b0:2ba:359a:9b8e with SMTP id d9443c01a7336-2bd27158ce7mr31344525ad.10.1778682201746;
        Wed, 13 May 2026 07:23:21 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:23:21 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Wed, 13 May 2026 19:53:05 +0530
Message-Id: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqJBGoC/3WMwQrCMBBEf6Xs2ZSY1gY9+R9SSrNZ7ULT1ESLW
 vLvxt6FYeANzFshUmCKcCpWCLRwZD9lqHYF4NBPNxJsM4OSqpG1PAoa+dN3znWI3aKElnusamu
 NrgnyaQ505dcmvLSZB44PH96bf1G/9a8qRwqDEhtrtTZ4OPsYy/uzH9E7V+aCNqX0BSEHayezA
 AAA
X-Change-ID: 20260409-eliza_mm_cc_v2-701c34ddb74e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: WMJHw6LAna-3JZ5IJWBJzgf2dV_1EuiT
X-Proofpoint-ORIG-GUID: WMJHw6LAna-3JZ5IJWBJzgf2dV_1EuiT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfXzT6m9I5+/t4e
 pymh+CNm+s8FT+wTqP1zwA1SvgpikSoAcomr6mNUlkldY3Jcrkl0eyyDRBtfMJ+MsjMAh+bU5o0
 EwJ5u9WQoijaZbBeUd4Sg8EXLCoBrJ+n2DqbCkBLA0m0cSvAfPAVTVEZ8X0cP/kT+gjAnrKpQm2
 7Jmp77ry/0p4c1dtA1L6TzZw4MAG2X+aWezQVaxL0gO8dTv0ruC9+sEUhVzHMdgQk15lPLSOfCK
 QVDKWPA+LaKcQ2ztcm541bPJYSXZKejQaPn+yF6z/pARZponS3ndueLarc/F0PoBmVTQC62i6YK
 PrNmsZko97YOeuoMRA5RY83Qr+z127GCA91tLvVqOrAVudCxPk2+Rh8HjhZQ0iuzQyPkBOgTwFs
 +R+ajHc64iRbQgY2aqatQ5FowR4PVi1AW0s7F+eyJDSFfLPaS3xAYB5XlyeWbnmsCo/Z2H72460
 S2CwOdW/V2NlrqwFj8g==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a04895b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8r5jHq557GnqU3WSqWgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147
X-Rspamd-Queue-Id: 20E215350AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107346-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Since CX and MX rails are already ON when APPS
is active, explicit power-domain voting is not required similar to Milos.
Hence extended the Milos camcc & videocc documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   11 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |    9 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   59 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  621 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4677 insertions(+), 4 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


