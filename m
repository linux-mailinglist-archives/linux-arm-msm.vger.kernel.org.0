Return-Path: <linux-arm-msm+bounces-91390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGVyF7Qvf2k8lQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Feb 2026 11:49:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBFBC5901
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Feb 2026 11:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F06430131D9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Feb 2026 10:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC573254AC;
	Sun,  1 Feb 2026 10:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QbF2A/6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ztm74V7N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85DF326930
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Feb 2026 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942956; cv=none; b=MrQNxqUWyNhsyBKGDJKY6PWRRAgjzwKIUQF4ettavR8I/R2kn/fsLCNeJYT0klpWBOJiNwVOvUqRnOu7U4D0PB+Lnv0BlG1OHP+ihyatlKNw7xETy1uimGKFZd3ZDHKvcIxFkXtvpRMgHEWHjFTK+zWj3w8Z7ZgYKia2JsZrxDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942956; c=relaxed/simple;
	bh=ta8NS9oLfaTP8ODHsdO9/5QO4jY2iNkc7qAcFD41Las=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BScNEaIA6jLsImgrcrhZFq5zECf5GUUQM/acFJHHbSkjQyeI6BjOkPr1xQLNqdV2OvVqko+MBVJ9/du6S1MbV/tzTvL1JEjM498k5EeA4ewFImTvM+T0MSS2MCz5VY32C7Ge7Gvq8794Iys0wVMzfXfu1Rvq+jBfk4BAC8eXBIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbF2A/6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ztm74V7N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611AfQmx3377171
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Feb 2026 10:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sSr9bu/cvAJde0xdxCLrIb
	mwiExX74AhA+duZZk4kuM=; b=QbF2A/6frbye/5MEIOMs1oqhu2tHw9mrY/gs9R
	LhfQU0aIl4aEJP72+9J2aKSF8YI/v9lhlOWrk55MR5P34HEH38GiaDplLeXtcH7F
	LxSFI5R8c7NgihNlroQmGAwIphOBLRDng24uqr/mt/VZVlRGNRatfx97KnqX++Gn
	KsEp0zu3lZyJWcVUvxWHF1zBccUIIuPZDeYDy/9t0CEwF6rWlVaW81E2M/eKDMBn
	wUhjK2OTmmRrn3irVPOxyHZMxfahvTk65Vpfm4ukyZ19UHIqA9Jy2qdsIk/aN4Nm
	1PZzJhLqztNZnz3XkVxM4GXZF/DwgJzYT+PLxGCffG0jTRWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1b17tdkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 10:49:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ef98116so885853585a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 02:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769942952; x=1770547752; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sSr9bu/cvAJde0xdxCLrIbmwiExX74AhA+duZZk4kuM=;
        b=Ztm74V7NM5KMKmFX3q+3wRrHsRG2Dq5vK2EDuxnY0/PgBTarDNIxPYXcWDn5dBFA5D
         linyJt9r6kVv/HGkfVlRijGblh2M0NMYR6Rl4dJdJbByFkLRnoGQ3xEJcBDV0XjWiVfg
         kQk7t5G8bPAGQSL/Xz+LAaKQ2tQ9dz+9XTGHzAY9otDVAWnIJOO+sKI4WfKklcgBmCxs
         D+6odnikzqJkk/nzr78j2ut+DcibWmqctbGBL3uOIftFeHVJmjRwKd+az0M1oEDVqU9i
         eRAxdDdStmGZmUBHUfqUDyx8F5NV2B5MuZbG4DrjdpINjWgiX3DQh3H6qVkXq63sa/ZR
         JEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769942952; x=1770547752;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSr9bu/cvAJde0xdxCLrIbmwiExX74AhA+duZZk4kuM=;
        b=U6PqcG2w20Mc3nQpbvYTg/oVXFvwAsddpgB2rEWLEt4u6I7MvREoAATVbgsfd/oDqw
         Z0r+kLoNYFdj6g0c614E/b1P8f6pWNllrAPm12P02FcPpC1Hs3S5oRfADJnZn0Pql6kt
         tGaF8Q575cI3Wc0E4Q1Ag6uYa6b8GmdoJqR7RuNDXViYdPegIsOZ/a08Znmm3F9X0/lD
         Ry+Bi+sxz9GeSWBUTeRzr3VdXP22mXvwFYfV69eAqOlPq52TZrSk7HykNqpmQNNeA0pQ
         GRT71NYoHEJhjrT0HpDvpiPTH9847ITSRKQY8luB+VfyYw0tVPxVblsq++TUls5q/xnK
         eWJg==
X-Gm-Message-State: AOJu0YyroTx5JRLKOa8rueujpZixI2tIqTFeTt2e/GmioLHMrnRUF/qv
	5LK8eDAV/VDYoiRb+2JisKZq6pQCjR0QoGn1NjqZXpgZhisgzJPosTlff3lEAKuZF0E03ZIQovM
	zo6ux0v+I8gO5w4B4HXnqBR5vdsCEHrdrW2sXvb/9GmljPI4wnizIYUsW4vbGxfK/IIzftLVU9D
	Iz
X-Gm-Gg: AZuq6aLCgSflXUf9I8fyGfctz68TNjfp4GUbxX+xpwdg96N68CyyUTHwNYOl6euu16m
	55bopV6p+ffwsKbEAFRBbDBzvz0m0jlNqT5hz57nb9M0DDJEY7dnIUWWQSMLXJaSkLj4yXEoSfO
	35tlk3BfKpyHAyKng8mRz/0Dz8vCcx1oAuH/9iHpLTHjscmr5XqmkyOwyEAhEBFP4rL4Gtn579v
	fDCwznB7kR8V7JIA+VZnewd8pH0Pg+ZcAyMEoe8UZNtT99zR7EoKLBhR7en2zGT8vxw5pVq3Wwx
	+C1d7PoyAyy5eI1L4ZRy0esf7LwDc/HXYm0bfQugyZmLRQNxGgQvfvuoAnoyk9gi1v2LohIJhI6
	XjqtVEdvd2iwGPzYnkADHRz+MJFbDgiG91iwIPrMyFX1Eq2nGU14S0GarP8Q4PNKm5JUOsEsSjn
	pGHFl+7ilJclptDlpVQF3e8CE=
X-Received: by 2002:a05:620a:a118:b0:8c9:f8e5:9f12 with SMTP id af79cd13be357-8c9f8e59fd5mr614957385a.57.1769942952495;
        Sun, 01 Feb 2026 02:49:12 -0800 (PST)
X-Received: by 2002:a05:620a:a118:b0:8c9:f8e5:9f12 with SMTP id af79cd13be357-8c9f8e59fd5mr614956785a.57.1769942952040;
        Sun, 01 Feb 2026 02:49:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7a8csm2835006e87.77.2026.02.01.02.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 02:49:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/8] media: qcom: iris/venus: fix power domain handling
 on SM8250
Date: Sun, 01 Feb 2026 12:48:57 +0200
Message-Id: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJkvf2kC/4WNSw6CQBBEr0J6bZP5wACuvIdhgdhIJ8LotEw0h
 Ls7cgE3lbyqVNUKQoFJ4JitECiysJ8TmEMG/djNN0K+JgajjFPaauTAgpHmRXDgN8pUm1Lh0Ni
 aTENV0VSQuo9AKd13z23ikeXlw2e/ifrn/luMGhVenC2JnDN10Z+8SP5cunvvpylPAu22bV+jf
 e8hwQAAAA==
X-Change-ID: 20260131-iris-venus-fix-sm8250-f938e29e7497
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1967;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ta8NS9oLfaTP8ODHsdO9/5QO4jY2iNkc7qAcFD41Las=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfy+jlt0mSi2KPEsBGqa6ClC6PcPT+B67GwYO1
 wWuT4waXwmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX8vowAKCRCLPIo+Aiko
 1eFnCACziPVJklWNltdISmgIRH3q5XAItPzT2VXBl8DaYbb5huQfI5fT43X8u7E5A632IhVhynb
 CGLkYgIcR4SHoei2mDjEsb59DGs5fAsU9QKRTiOvlO8lqBNMXEwdDjzb8DyoxOD+fRZwBnUZ6kD
 MagYGn2fLl3RDpwchtpou+Pu0XikhQL1aD2/iO5+UhQZFRgOMFIZV845JfLTdnn/lFQbuL2km6B
 8my66GckklxpOov2ry0ebAziqgHbETCv0iY3jdTYzqb35Rus8rCFAAbA7ZPU9V+BIJ2TxhNdST/
 1/DiDcPQERfq1djrrD7Cp9pTjG+i5cIE1ltnibf6tZRg5fG+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=LcAxKzfi c=1 sm=1 tr=0 ts=697f2faa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0RjBngDeADCmygnGHrcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5pzpTxrAswK11rWAlmjlUQjdvEc73EG8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDA5NCBTYWx0ZWRfXzYxZlHMz5CE+
 lU/KPdURBOtJwlDRRpXS48KM48fVWBgUt2RtTu0jH0fCaKy26YCKanIGxIbjMcxwYMomqXxlyZP
 Q1TNpqtIeKqw+evATv0N32qL8cyYHq/PnRyVP/1I/qG7m1zUwIQr54u1oqV3wAO9ul3ffpk7Mti
 dHdQUKO8vVoqH4Momopikjwh5UTvPrLdSbcMdwfdVQiYK02g25p93ahzAdLmolxNFD8EgFm8LFY
 Jis8kv+N+oaZXUh95KnI+WaXqhEpN+cZLfCIUQ8fRSvwLGAVgx6ZNATQjiYYnbt+ndOcyA4DHNo
 0rrf4nXkV4hzpLONguTe2DTTbvmd3raE/UGTNwPdIipXbgQ23vy8Ne0yxp2RFe6wvcO5ZOG5FxO
 reyZM/6g9VLHhQG9/4ioJQVtpmvvip3aOY/jpKnVJKgPtZ3M/dT5DSJqUVYrlCAF5dkkLw0Wlqu
 fcXkwUCmcJU5eDg1i8g==
X-Proofpoint-GUID: 5pzpTxrAswK11rWAlmjlUQjdvEc73EG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602010094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91390-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AEBFBC5901
X-Rspamd-Action: no action

As pointed out by Konrad during the review of SM8350 / SC8280XP
patchset, Iris aka Venus description has several flows. It doesn't scale
MMCX, the frequencies in the OPP table are wrong, etc.

Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
stopping it from being overclocked).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Fixed example in the new sm8250-videocc schema
- Link to v1: https://lore.kernel.org/r/20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com

---
Dmitry Baryshkov (8):
      dt-bindings: clock: qcom,sm8250-videocc: account for the MX domain
      pmdomain: de-constify fields struct dev_pm_domain_attach_data
      media: dt-bindings: qcom,sm8250-venus: sort out power domains
      media: iris: scale MMCX power domain on SM8250
      media: venus: scale MMCX power domain on SM8250
      arm64: dts: qcom: sm8250: add MX power domain to the video CC
      arm64: dts: qcom: sort out Iris power domains
      arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table

 .../bindings/clock/qcom,sm8250-videocc.yaml        | 85 ++++++++++++++++++++++
 .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 -----
 .../bindings/media/qcom,sm8250-venus.yaml          | 10 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 42 +++++++----
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |  7 ++
 drivers/media/platform/qcom/venus/core.c           |  7 +-
 drivers/media/platform/qcom/venus/core.h           |  1 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |  8 +-
 include/linux/pm_domain.h                          |  4 +-
 10 files changed, 140 insertions(+), 46 deletions(-)
---
base-commit: 44ef70faf71468e0ae4bdb782a6d43f0614b8ffa
change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497

Best regards,
-- 
With best wishes
Dmitry


