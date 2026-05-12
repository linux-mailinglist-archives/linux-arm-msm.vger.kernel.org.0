Return-Path: <linux-arm-msm+bounces-107104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBAiNiU2A2ox1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:16:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCE9522240
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C485634C1948
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA64397B0F;
	Tue, 12 May 2026 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDnlx8D2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X71l0Ktw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC8A397B1D
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591698; cv=none; b=Km+cqHLZrECFt9qZKUYNXkq6Lig+2CqlsfwmqSq+gpKVxye+i4x7C3maHlhkhlwaOUjivucM+T3fNd+N2o42UM6LFMy7UNqAz2XXl1IBvFJ96exQ2rVcQcIRXw+0nd+IbA0nTwJry6yV7ZCy4EdRafJOnAVzjGpq/nBH8c2AnTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591698; c=relaxed/simple;
	bh=Xx7quDkGTcXqy8A34xXdgDjc7f6bHwDcpF39fYmOOE0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JQzQp7Yo3VuDoXAvRiiHisUXTrWMH30QWDGX2dZp8R36Y9SBA1hBD7pTYONivkozGWq7wZGKnJ0jge5e1jvUpsLMSZjO+L6GqMpFjpKdt5Rs/IlxmVhmlK1DfyBy3mtECmEe0iIXUdwtu32PmUC4qnuks/qKOcX3m98+F2uc0qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDnlx8D2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X71l0Ktw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCKxJu545158
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C/yuXAzMWs2KK27Ei39QEN
	QP5VvtJshpMiuvn624gtM=; b=nDnlx8D2RoGgZmrvMqJf5TuwRfKX4bS7fjvR5l
	MXcdhCWsrfLTFWKWs7ajF8ThHiwbf8VrFBVM+WCCw9uexC9oq1eGN3f9yZbz54l5
	K9Qy47Ild1L7wAzIv7NT6w8wIqjJKVJqEL6ZzuwHF6wUmDzmxKUSGHbk1TEId14l
	BsAm7i9aMGftjvqC2Ssv6nZ6XZE3HqH5hV8HX1Cj9C5iCe52ddU0EWqrCSfeKWRC
	qU8dcshSE8AZx5+DR23Q6R94TH01ve0guvGDDJIGcM/vBOW5GKe/7DRTjwSPRRFj
	JY/K9GMBRaJoU6nPutcJkic5I8mGU9WTQCxdWPf07x5RqfSA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444sr5qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:14:56 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95f85a1db6aso35104241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591695; x=1779196495; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C/yuXAzMWs2KK27Ei39QENQP5VvtJshpMiuvn624gtM=;
        b=X71l0Ktw/EldQasEMA47QZCeM7wznw1mcZBEDFUxTlGSBqXP9DzEYr2/fx+t3vmVr6
         2CllqS0E4L5jkt3hGxibyTVg49ev3Za8rGnNL4SjFFE3THYGYhqpnE/SCke8WgPI/jhN
         HWYAoJ18c3eGg3OLrI81EoFYUGVWeE4JBYMp8me0YKsl4RA374RYlUgS8HxoGs3UMWBh
         LxwxkeZzpsuYVRHquvUDH1Auah/x0pBPPLtudEmfpExbJxTImJph0u0xwpwqvepaQvbc
         /vwD0pPGBUrg1FIFS0uN1dtxVkDblCrAi2soCUQMI0sA47UghM6/6sdPWPvZzy4LqkDr
         6/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591695; x=1779196495;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/yuXAzMWs2KK27Ei39QENQP5VvtJshpMiuvn624gtM=;
        b=L6KdG4Pbw9CcDiykFeTeLLBvhPkDltgS5g4T89f/wPilBG0RRjiGmaefXkF0QpnSGq
         SGL57b3Ay7LLKMJv3yK+/STbp2z5tLWl235PHyegdz5dba0ZZE8DzS3mQkDmIJ9o44ss
         Mm7oN1JgrGRZL0YRB0AyXbtYeOFt4uDRGFAajBjYo5mBJ0AJiVPCdjaJR964CUtYbwUC
         kuMYmpTzIrWIUQTwVVw5rvx6BnGeXMM3e810oAk7U0xpNGd9r4BjVg1IJ+XzF9+OAfIU
         gKjnKYZHCd3pR5Gn6nM9kptbo2qNbJDpfe3Uf57DWqa2Tqwp3v1A2+0XawEsCZqki7yj
         UZjg==
X-Gm-Message-State: AOJu0Yy8oaOhizAt2XbmYAMDRkNXjWmfjlwZpGYXklfCEjsQgSafJyWP
	8GLs0vdY9XGH52KEEyw/BgZYrGh5cCdEVI8GnlMSAdzWLyLfGyzFRPb745b6yrTlZeNhQdKea/+
	Gmkh2rMFxI44oziz4/s41L3eA2aNUwZ5qt8fIz7PlXPCmcJQiGgC57XNd7rt88lCzE0wO
X-Gm-Gg: Acq92OETrNdVKqJYqA85ZQpev2G3J25wx98R+0uT/42P356QRfvllh4PK1Uui8I10Px
	DBn7TMH7LAaJ/jhcLVDhr9xjW1eOwIZ7kL0XayDKAvd0o+TwAuZ++EhzWtLoTY81fmRHr2T69pO
	iPbTq7lt8+eRLiGDB3CzP4FHEyZdm+5pM0FmtgtaHstdWV5QO1GRthgfeSisyWLEliVYGL8eTwR
	56Uaz06o//HRTbowMyRnL7gdOXVTPNzAjwdgxwgYFAQCXWip8jfy74HiGf/UcSm+vabmEY/ErUT
	IPPN5GiMa7/hemPpEVi2lKcwTGnpoCw+ZL0481aikJNnHRQIuHGfp0eOT9LfEzFkIAdtRDELERR
	LRuB7DFTrAJOylTo7JeZNEDVQ0647k1MPxYzcBG30CYaCsZAEqnERynJ3rk0D5iRdVjvrkPYPqo
	1cdEuxJdf1PSVjOskTBnDb/pBRLrh6lhdmPFk=
X-Received: by 2002:a05:6102:1483:b0:633:3040:ca5d with SMTP id ada2fe7eead31-6333040cec3mr4177004137.9.1778591695033;
        Tue, 12 May 2026 06:14:55 -0700 (PDT)
X-Received: by 2002:a05:6102:1483:b0:633:3040:ca5d with SMTP id ada2fe7eead31-6333040cec3mr4176926137.9.1778591694506;
        Tue, 12 May 2026 06:14:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f395d5sm35163281fa.10.2026.05.12.06.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:14:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 0/2] arm64: dts: qcom: fix power domain handling on
 SM8250
Date: Tue, 12 May 2026 16:14:49 +0300
Message-Id: <20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMknA2oC/43RTW7DIBAF4KtYrEuKhx9DVr1H1QWxxw1SbTeMb
 aWKcveOk0WzKGo3SA8eH0JzEYQ5IYl9dREZ10RpGjm4p0q0xzi+o0wdZwEKnKp1LVNOJFccF5J
 9OksaPFgl+6A9QsDGhEbw3c+MfHpzX984HxPNU/66PbPW2+5f4lpLJQ9OW0TnwJv2ZSLanZb40
 U7DsONFbPAKPxioIgaMud6ojmu29aGA6UfMlDDNWKP66Dzapg+ugJlHLJQww1jgH0ZlmrrzUMD
 svzDLmIoA2tlOW29/wa736WQ8LTzs+T4icYiEciuleV+NeJ6fh0gzZu5fvwHFty++JAIAAA==
X-Change-ID: 20260131-iris-venus-fix-sm8250-f938e29e7497
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
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
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2031;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xx7quDkGTcXqy8A34xXdgDjc7f6bHwDcpF39fYmOOE0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyfMHm9hknKKYOrEEhLmKfvJM32CvqBnmoOft
 Cnjs5mdhJSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMnzAAKCRCLPIo+Aiko
 1dCgB/4uWnaUyze6CAarR7dazGrInghX10aGbEDFcg7BxCj91GMd9EtngJG49JVUGJ3/gj560OR
 wa754NH/HnKRRG+qz/hy5CoPTfxChUdGWDn9KygAysuqbYIdwmHPj+lZR4hj46IuwbykRda80Ig
 e1Gh3HZm3pGCQQSaa2JobinfOsGbaS7Yy+eC3YeWQjEegKaLghfoNq6kjhS634+Z4B4buW7J3Rl
 pNKz86xi8G5cW74+5rrGM7i/BJLEFf6BP5T/jonLgvzrGwwYRIZ1ZTVEHuZjylrigaT9JKJn6WE
 yCRiwrQxD9N8sFhVHYnW+GD+lKmE/EhXNbqV1L6tsWC02K9q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: oItcllidBn_mm1jy6R_RgN03xg7ETInJ
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a0327d0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0RjBngDeADCmygnGHrcA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: oItcllidBn_mm1jy6R_RgN03xg7ETInJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX3SZUCJPnbAJO
 QTN6mufvS/BQoZX2EBLuZbRasnZlKSqKz8Aob80cquMKJ5GIjztXv+AK6ywB0GT7bdZ2/EBBo7F
 F7CbM1DTCvv/Vz/AlF8EkOa4HKSsYSY5iR/eKiVf3UK2KvuGNMn9qGh5UFnIW1twxdNRFGs79bu
 wOEk1CpMTKj0TxQqWNw+j/kvcveMB03/k5n6vhA2LQTW9sYMAMJWVbFRnyclfcBlV38KRRJ004S
 QIy+pIQnuKnL01AvhnMlefv1qz5w3qeDiI4kcEpwCY2BsFll8vzvhdReBDiK4hN/qyrOuFFuaFk
 d9fOTGjMMG9z9mmXm5H+l0qa9S45E48uCCuPrIY6CeLfStOpqMOnH2DexSj5cXqQHr9AiSetV/y
 glzavTk7pZmQuT9YJUD1624/5ks1NxHEor3GMMcizJEgfhsLSIQhpuUc2dsA3d3IZGEUbt5g7M/
 mpNFCXEX4GJGvteoZyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136
X-Rspamd-Queue-Id: 3DCE9522240
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107104-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

As pointed out by Konrad during the review of SM8350 / SC8280XP
patchset, Iris aka Venus description has several flows. It doesn't scale
MMCX, the frequencies in the OPP table are wrong, etc.

Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
stopping it from being overclocked).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v6:
- Dropped patces, applied to media tree
- Corrected levels for MX rail. Dropped the review tags from the patch
  to enforce the review of MX levels.
- Link to v5: https://lore.kernel.org/r/20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com

Changes in v5:
- Fixed maxItemx -> maxItems typo
- Link to v4: https://lore.kernel.org/r/20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com

Changes in v4:
- Dropped MX voting by videocc: it's almost-always-on (Krzysztof)
- Restored minItems for the venus device, preserving the ABI (Krzysztof)
- Link to v3: https://lore.kernel.org/r/20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com

Changes in v3:
- Dropped applied patch
- Fixed typos in the commit messages (Dikshita, Konrad)
- Corrected MX OPP levels (Dikshita)
- Switched Konrad from Suggested-by to Reported-by (Konrad)
- Link to v2: https://lore.kernel.org/r/20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com

Changes in v2:
- Fixed example in the new sm8250-videocc schema
- Link to v1: https://lore.kernel.org/r/20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com

---
Dmitry Baryshkov (2):
      arm64: dts: qcom: sm8250: sort out Iris power domains
      arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497

Best regards,
--  
With best wishes
Dmitry


