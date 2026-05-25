Return-Path: <linux-arm-msm+bounces-109627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFfACH0oFGrfKAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:46:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B24175C95AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E49C3000FD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC443783DB;
	Mon, 25 May 2026 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mZqfAbTE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f5sCXKjU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418EB3E5EF5
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705977; cv=none; b=DR7oEP0mJNPRpPG8mSh2KCsNJOnkJXykNGGA2Mz/0p98RaoU6qOJZ2KSFm2i175ZxhcwSZ7ibXN2XaDZIdxibaDByCokDeMOCFQE421ozLG7x4QMvMLMJSOjgB4GWQhlW4bG1/V4EHffspQNyRWjhJy6tVgf95GVHg+XZ8eMnhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705977; c=relaxed/simple;
	bh=sZ3Bgl1SkNEyXTO+EhHTREB285lckQyhpOOgnegCsTU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mfy5ALlwfviuhFXsXAxXr4c0W2zAaTScAkcIrEL0cUuljFWdaF6rpaFvfBkPt7t2P1/EN/R3uUpjv8R6ZFPffC2AaQlq6OsxuVJumBStakfNmgarPfNP3wy7DrLwl1c+Ras/l5mhS2WW497RIlaf6y6y1JgvS1fRewJUodAxsxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mZqfAbTE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f5sCXKjU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P8J5DU3531929
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RrAk3Qchsl9HTYYm+whnBS
	rxmWERJEvxM4jVWJl2EWg=; b=mZqfAbTEnRpaIWs5d8tduMEw+NTdHXNbZfILfL
	PLgonA7oeyGfQKdlwL/7MxAasB9hjFNrpCeRUnB/Z1dMtN5PRjCskRWU4q40Ibk+
	n0j6TQMtlzRQUwtQVgEfuiZsbWmB/e3FxaFgtvCPx/y40HLaTAn/IJbwpibYuJ3m
	2VATpCLG0IUave2AI2v09FKzuH2/+L1nA6RxspFDAJGeY08DwFGCC0O31cjMV/yW
	VxJE4/0pNJ+X9P+zw39ZeIiUBAkVfGXcAWo7oCCc5V6raHaTmdyPlqP9dCMoHh5b
	i6KSZ8Ysv7r+FiDqv1sGbryg9tku2wBUYngJfxvaiYYL0HOg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4asxbkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:46:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba5f794825so74306085ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 03:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705974; x=1780310774; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RrAk3Qchsl9HTYYm+whnBSrxmWERJEvxM4jVWJl2EWg=;
        b=f5sCXKjUbX8cMPBQkbpYYjyNrp7W9RYFKg9s4+gPVFQgGycqIdaiuUssiqHuqrAXqw
         ju0AitrZTNoEHuDL7VfOyqkF6odkDcsVDZLRTOjHkpfK6Z/lqISg0OusasizbdPM2+0E
         Pp+ieF25Cv3q5HYeRxf92gLbGi+t+1sFUXjTdSaq3XvxdBLICmYvKhto66MVUsuEMTSa
         Wv6aF/qQJiQM0mlCuUtWUerZEDu6x0pAXQR4W2X98yCMYdlfK2MHItMxWPjOXLsPRUKv
         +zEgJxJkmjReJJMHuUPAaj30HzqURFCkP4coJyMPK1iroM4VK08rs+n91+D+xTY2EWPc
         wKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705974; x=1780310774;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrAk3Qchsl9HTYYm+whnBSrxmWERJEvxM4jVWJl2EWg=;
        b=r2+HLN0W0q/TGr/O/g0hsnd/q7/l8n0LXj9wEzoIiDa74OptOdA5VrOwclKxFhn54u
         OrsKHvlp2LdAgO2q+bOUhniJrXAGIymC0qKNJBB5QE/ZdxuK0Js9w6a7RKK3d7b0VKZg
         +7RdHOqqo9C2ZgNDykQBQLRml/+nr1FAP40ClTGcg9PX0yLHwrdEsGTLbyAihL6RGJOa
         RsQOKEsbYv9F6T30MFOgSnLIczP09G/Xx6iUVKiATsGpFNMWMEiVwEgFtz3itwLKpnEC
         /dbRiAx44hUASBo6pYoyZXAE4tlN66CkwrYeE38JPtXStfIex9BYStmaOsfHLe+0gd7/
         sOnA==
X-Forwarded-Encrypted: i=1; AFNElJ+EZ29wGdUumk0mpybfM2KYuOALCjtzeiG7N9PIZFeyDJs4LrLctg5VhtxVDpMGnDfc9d9KvwYPyQW/2dl4@vger.kernel.org
X-Gm-Message-State: AOJu0YxGNmuz/Px2P3DJPBztEzOPVcujoJL9wofisoOmSPzyKSa7Ht3r
	4QlWLJQoXzLn21euTvo23XZmpVCIu0IxuiMQz++OzFnV6qaP/qAhlyIF4olecM6uWTa+N9IT3CO
	S6BLELNsMyxVTfqYT5I8+oToSQPc+qccus7oadTqJSXGNAvnZFQSP3FZxeBy1meT9604+
X-Gm-Gg: Acq92OEo0iEpeYLwBhq9EwQkoMZLFnfL+/eGlG5mESHQ5WD3CBtb4/NlL1rRAujhSin
	pwrssgQFPLQnsjO+UrmtB03hwIykKM4ACorhl2Nsdd4MFlXKU/httla6SqHAQEpeqpu9HYsREtS
	KyaytcVOTsyapmwDPWs/UjLs2jCDxw/TF17Vzs70suCKibcwh8hPkWOVoqfJyCl8QNpw0S9k08f
	oTSJLmTsyG2beMm1VLPxXKly3Ijv+gy8gd+Mu7lLJ/dJmJcZgtgx/pYMY9JLj7+OadB7JQueqow
	eHFEpKiGfm482v6IrO1t4EvlcRqzGdzIe8uKb+TULEJ0fKSVBamsbXOmQFNAz6ejShObxk8Mr/o
	9Gaeh0v8a4p1Lv19S6oW38q0vM5FxJ91S9VAl3TgUXq4lxQ==
X-Received: by 2002:a17:903:2f8d:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2beb0841de5mr148146375ad.35.1779705974079;
        Mon, 25 May 2026 03:46:14 -0700 (PDT)
X-Received: by 2002:a17:903:2f8d:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2beb0841de5mr148145745ad.35.1779705973407;
        Mon, 25 May 2026 03:46:13 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:46:12 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v5 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Mon, 25 May 2026 16:16:02 +0530
Message-Id: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGooFGoC/33MSw6CMBCA4auQri0pfVBw5T2MITAdpYlQbZWoh
 Ltb2LhQTCaT/JPMN5KA3mIg22QkHgcbrOtjqE1CoK37E1JrYhPOeM4kKyme7auuuq4CqAZONct
 ASGMaLZHEp4vHo30s4P4Qu7Xh5vxz8Qc+X1epOIw2wCA3RusG1M6FkF7v9Rlc16VxkVkcxEdRm
 fhSxKyoEoRmBniRrSjyvyKjgnnWKCkkFqb8oUzT9AZZ8FIqPwEAAA==
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfX3Ky579n5FTDF
 D2ij4FJcmF83IjoPh1cVReoFBX3QoZfmwT69oQpWfZHq8oP3J5Seo9DXI6UxZdOzXYi5ijr6JvO
 L3rtRY6b9BH1ZdsqpFP52Ym7JE4W8/PhusmkNCC2b+T8E7RnAW8DgGkEBK1b6+RzNpJ3dUsnobe
 YVySHZ6ueYiFGNVaNDajpx3FJ7KGMYnywWQbDbMP306CArqLl+bo+/9H0ytJVTAUT0y8eS5dfUu
 ynssa/Ar/1g+Ow8BETlE6txg9nd9S6YV/4RTNPSjQRzwejrCfIgk/di5g48x7OlOqv5wn6mDtVQ
 i5qA00zeP20uyt6ZZCQayGNoE8JZ6n18b7UEE3zBO7FxPBkEfcbkWknrJOrlobeRrHuZHXuBhuq
 XMS+f12xNH00KelUNQEeh9x3sjyYx6Q0uZvtHAAnII2ro/bXtFmkL26TcU6ehdYeAMown7+kSld
 658QuHtQahvO9XrJdgQ==
X-Proofpoint-ORIG-GUID: OlyCTzKM-O_pkk8LDp6umG_WKhMwNwlU
X-Proofpoint-GUID: OlyCTzKM-O_pkk8LDp6umG_WKhMwNwlU
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a142877 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8HYrQF7E7KXWYYjJzRwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250109
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109627-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B24175C95AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Since CX and MX rails are already ON when APPS
is active, explicit power-domain voting is not required similar to Milos.
Hence extended the Milos camcc & videocc documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v5:
- Taken care of comments from v3, v4.
- Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
  as required property in bindings.
- Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
  bindings.
- Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
- Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com

Changes in v4:
- Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
- Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com

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

 .../bindings/clock/qcom,milos-camcc.yaml           |   12 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   10 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   61 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  607 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4666 insertions(+), 4 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


