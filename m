Return-Path: <linux-arm-msm+bounces-99181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBYJIkcRwWk7QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:09:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AB72EFB90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ABE64306E072
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88310388E73;
	Mon, 23 Mar 2026 10:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozAFeuEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DvH0bAjF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B542389101
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260089; cv=none; b=ZWxFp1fdcPbE6cNnntNaN/bC663j5LASMBPDM1LVAC1H2hURaNeQIzihY5cfXybudRRAQxjZUe0oNXy2FWQ+Pisz8bexcDvWsQ+fpJt8Cn9jWdSBkzTpiXN1rBkaYTHQ6nNPe44x/hNJopGiO/1+cJ0JQj5tqKLhtEvrZyNeekw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260089; c=relaxed/simple;
	bh=CvsF+XgmWtypUhCbqoQ+NNzsnZNfTjXaguT9trPTRgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ka+CDENSR9wCyffR6WoofLjaJw6iQlFeM/zK9dUzD6tXzZn3Beaw+ik2QT3+srCchF0SZp00EPV+qjbBbhoK1rI4xfsMI3wKJDMdTkKSrXg3eUCACMk3KhtcIQompn8ABsIE7OBQjfxrddyvjh0ZA9+kof2Zv6jHU59G3KNPA78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozAFeuEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DvH0bAjF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7aYLD2062748
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Eih455ltrzNwTouwaHGU/6
	lt1O9gHr/UXlMlv+6lcy4=; b=ozAFeuEdQpJgNGD1FN+ksBhr7TwqCoj0eFctOV
	CDLTyPmhN2/eXD6ULZcLq+FObEu/70FbXdkyhduQx8SkSztYQtSx3Ff9P4yAusTS
	CmULTQgKKFQyPPwxk1IWGniEBfjs4jP6kkVroGySka870a/yANtO6+ItRKeCUlzd
	0bAkOoCl3AS1VOkdNSUWxqnQHWaGer8nK7UkP+540cko9XZ3DnTQzEOK0B67aKTk
	3UEiN9hi6+p9kKkk02mxJVYjvJzjxHCDN4tB3RrVuNIV4hgmTODKIKo72yC2W87k
	JK6WlhG3GyHm8odSSUbKugTKqg1l7a6/trSP/tqSkyHAkJrA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kduct5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:01:27 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94ac3fcea3bso5214878241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774260086; x=1774864886; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eih455ltrzNwTouwaHGU/6lt1O9gHr/UXlMlv+6lcy4=;
        b=DvH0bAjFs6rvpFlAV3MTz9YdmcgLYcCU25J6VawTjb7DQTj8coQm4cnMdeLKyvMXMD
         1eyaQfl1+Boowh5yUBkFxPNRJWJhlbji+Oucr38rJPJTJRC4w8wQVotws23+TGGTMgwE
         FKaFNFBnxoD7oDk3PkejUU/VDovUXv1ui+TFKZp3Vljfw9JvU6U5t560VGnwYmTDvHio
         Qhw7UC2pEqYTZdQ780hCMSwpZkUi6Je/AaFJd0muWfxntWNu0b0f0G4qF0cMeQxxCKRS
         RxIniRnwz65uv70ODdC1jpx5549gjPUfdKi5nVTXvC/wXD8sS2XP97NFYxYsB8DCFUG9
         kqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260086; x=1774864886;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eih455ltrzNwTouwaHGU/6lt1O9gHr/UXlMlv+6lcy4=;
        b=SKQJ/r6YtsG9KexiqI0S6dg0+qjMZnu1PgfaCZpik/XlyK5PTkl//cN0i2t1KNQ2mR
         rRtC6vXatcRd5ggKTGGDO9dT6+pYNuCYqOVcSsnfV7+aVRKIeGsZzlzgqTyjU06HqnC9
         GRdWlk+QRTDxhhxerqZk95HUda19fGl/scisvSmSTtTRKMAVEW4Jx8sYE2eXsSpF844A
         1w7bUQUWy4o6RWS5KOagbajvvCOXPAEtdOSG4s0VCoD6LVgXsYFhrRnTWZyBnGwTh41D
         MFpY0w5IYIrgg2u4ZTIZb4cHs+UCi+1c1ltJHBVnxe8+aElLcr5+qj8wdKRcB1zcGPxQ
         +iCg==
X-Forwarded-Encrypted: i=1; AJvYcCVxv+LzhhtZyPH9DQoKTcS2CNqAWqSDXcQDR8ldtxn0PfH1y5PUONnu+pn3bxaLAfWQC8BRVnvqPTNh27yG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/PtRjQj/oRo6336vTSN654KyYS8piqSf11bLbFKy1/2zkp2UA
	l5ROHsm6wGJ+h7OSFfStscOXI8qXutaSzZtgaVllRZVl36P4zR0LSqtJ1gP/S981Bgs/J1Il7NH
	msL53Ek3oHxknJiumaySIWUEVA7VLTahj3mkS9WXME71v6LRodgUMuPb9T/nUzXTuFkwC
X-Gm-Gg: ATEYQzy/2clWE1uRFoDL8u0dOLdVXGxz5oXo58rHHvxV36ZgUDKAHA7D0H7pYjRWtGF
	Go/hVep+ePefF3m4LTLuOqCmUYuiKDkTiiXn0ZgjpUS/dpjTvpAQPFaObPve4L9vipyE0KPO9BZ
	btUuY2HVyeK3PKycX/DN+2hlI0JrAQ2R3Sty4KcuKU3xezjCw7fD6n5qW3HyccjFgZZ0DcJGR1g
	vVFpGlnS6BkpLlHaCj9AMeyAeTNUH6H/+Uhvhms5XZmWeEIunKywIfBiIGh2Ovu9xYFZQg61DY2
	0pZREmOpl8W9EPnnDbwVfMBT5XFLAXQmW4dE8ZxyMSrUb9bvLA9jaw9KSpMRJm9Gcd1yZwpv0+S
	4uxIii/yX+baoSRL0y0keG99NSWM=
X-Received: by 2002:a05:6102:d86:b0:5ff:c510:b7cf with SMTP id ada2fe7eead31-602aed238c8mr5402940137.29.1774260086104;
        Mon, 23 Mar 2026 03:01:26 -0700 (PDT)
X-Received: by 2002:a05:6102:d86:b0:5ff:c510:b7cf with SMTP id ada2fe7eead31-602aed238c8mr5402238137.29.1774260080908;
        Mon, 23 Mar 2026 03:01:20 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8ba4baesm526693675e9.13.2026.03.23.03.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:01:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:01:12 +0200
Subject: [PATCH v3] arm64: dts: qcom: hamoa: Fix OPP tables for all
 DisplayPort controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-hamoa-fix-dp3-opp-table-v3-1-a823776bd1b0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGcPwWkC/4WNyw6CMBBFf4V0bUkfUMCV/2FctGWQGqDYQqMh/
 LsFNy40ZpJJbnLuuQvy4Ax4dEwW5CAYb+wQAz8kSLdyuAI2dcyIESYIJxVuZW8lbswD1yPHdhz
 xJFUHOMu5KmUOXGmCYnt0EKHdfL68s5/VDfS06TaiNX6y7rlPB7px/1cCxfFkSTNaF7SpmpP1P
 r3PstO279P40DYW2IeOlr91LOq4ELwQBTCmyBfduq4vrRfD/SYBAAA=
X-Change-ID: 20260309-hamoa-fix-dp3-opp-table-453b8a5e3bc0
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5666;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CvsF+XgmWtypUhCbqoQ+NNzsnZNfTjXaguT9trPTRgo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwQ9odG7dHPi7nZz086qFqwDsY/d+M014XsY/j
 2hlW3JzqE2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacEPaAAKCRAbX0TJAJUV
 VrSsD/0RfTAMJKLu9uwxuDupulKBjSpR1lz/eRLz+sf9FBOUinz/xHpkFX4y2XPIvfmOwBWdZ7O
 ou7DxrWxw4eUBHAocxM5b/qwD/AxUiESMH7Aysr+tfriR0nJYCm+7QRsri+3jnkC/9x7HLXVHla
 d0rMyg65AtkX4Hcx/Nt0xdaLrQVpW0oEBVj7oXIpd2vstT/oLGPFc6Jr/f8CH0eyEdmkFw9uuGw
 M0MOmJb/Rz2iL0+xI+XUHZNS/huvGepyhIKj/rNzAhIsR9HyZG40rHbuaV3DTvHxFw39TXo5t/p
 cfybW+gB2Qgp34Jz/LKH3euFhlrD4TXVZtuF7rhi5B14ykB/FqqvaGls/8P4ZHz/0PKEOiUg1IF
 +He1Lgk28Ecpcwb6Ks7/HbHNXL9nzRD4jE5m+L8qtXeBHQG9pg6x/dn2SapcoUjo4gdNNmcjEzu
 5GE0KT7R+S0dWz6XF/lFeQc5k7llF5h0Do7FIRir2zcW7hwCCUGY14rHXWkoqlkDJnwAtpNVGn8
 CYuFCZIg1AL0rQ9qyyzDs54ufoyUFrBooJPnv7Rf/j/M88+4AjANrbn4SMYBHnJhjrRo1+KyfC/
 Lr1Bixt9Eb8ToeW4m3+EqGZb88muO/JWTtqfNw1KFb48sMxvk4hMfckXT7HxUl1ljrvneamhjwb
 +Ekcxjg12EtuL9A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX5+kKc23lppSI
 xqMVgZqbDY4uoMp/0yqVqL79RT1tXaC5j+iogMKGKIiVhn4oWCQHoZg26g/kgiH0gfuMCYzSe0+
 CZFJI0drYT4mxGuPH+7TpShyFAQkPO+Y8ETjQjCMA2q1yAlQR1Or0Wf+HwwA+Z5KmKFuEvOPW4K
 PzOy612HMKXX0MdRxiFbCaq5NZYDUBz/yQB1ZTVVWXi9cODEVuACjumecLU0I1hcU0LTEQLeivF
 XDoGt2W1D8SQc+RNNtkUTdtS3D0Jit6R+S2sVg6KfLEVwqgHMmzJsta042MfAFW3jJRg9lUZB/d
 y00cBXuMbkTk7HAtxEQEcJQzXzDhBq3t63YeWZqx4WePT/EftmaIAdRb6ile2VhHnYroCR1Z823
 wHgH49GKkg84cHi08dY/j2UWPOf6YYwpdpxVe3qMupCZ6mMSQbTOHBwgiFIBi/lWvlpV4uJboKt
 w2+LQ9OmTaiGjbtH8BA==
X-Proofpoint-ORIG-GUID: D2f43x78TM2ePWyEe4tFZJjeUbuur3iZ
X-Authority-Analysis: v=2.4 cv=Q4DfIo2a c=1 sm=1 tr=0 ts=69c10f77 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=d4EVK6T340-jQqwUKIwA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: D2f43x78TM2ePWyEe4tFZJjeUbuur3iZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-99181-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,aea0000:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ae9a000:email,ae98000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0AB72EFB90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to internal documentation, the corners specific for each rate
from the DP link clock are:
 - LOWSVS_D1 -> 19.2 MHz
 - LOWSVS    -> 270 MHz
 - SVS       -> 540 MHz (594 MHz in case of DP3)
 - SVS_L1    -> 594 MHz
 - NOM       -> 810 MHz
 - NOM_L1    -> 810 MHz
 - TURBO     -> 810 MHz

So fix all tables for each of the four controllers according to the
documentation, but since DP0 through DP2 have the same entries in their
tables, lets drop the DP1 and DP2 and have all of them share the DP0
table instead. However keep a separate table for the DP3 as it is
different for the SVS, compared to the rest of the controllers.

The 19.2 MHz @ LOWSVS_D1 isn't needed as it's not an actual working
frequency and the controller will never select it. So remove it.

Cc: stable@vger.kernel.org # v6.9+
Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260320
- Re-worded the commit following Dmitry's suggestion.
- Picked up Dmitry's and Konrad's R-b tags.
- Link to v2: https://patch.msgid.link/20260318-hamoa-fix-dp3-opp-table-v2-1-3663767e22b0@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260317.
- Dropped the DP1 and DP2 opp tables and used the DP0 for them instead.
  However kept the DP3 one in as it is now different.
- Link to v1: https://patch.msgid.link/20260309-hamoa-fix-dp3-opp-table-v1-1-1a8141d71f9f@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 77 ++++++-------------------------------
 1 file changed, 12 insertions(+), 65 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 0efeb7b7ff03..079bbc62c475 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5670,18 +5670,18 @@ mdss_dp0_out: endpoint {
 				mdss_dp0_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-162000000 {
-						opp-hz = /bits/ 64 <162000000>;
-						required-opps = <&rpmhpd_opp_low_svs>;
-					};
-
 					opp-270000000 {
 						opp-hz = /bits/ 64 <270000000>;
-						required-opps = <&rpmhpd_opp_svs>;
+						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
 					opp-540000000 {
 						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-594000000 {
+						opp-hz = /bits/ 64 <594000000>;
 						required-opps = <&rpmhpd_opp_svs_l1>;
 					};
 
@@ -5722,7 +5722,7 @@ mdss_dp1: displayport-controller@ae98000 {
 							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
-				operating-points-v2 = <&mdss_dp1_opp_table>;
+				operating-points-v2 = <&mdss_dp0_opp_table>;
 
 				power-domains = <&rpmhpd RPMHPD_MMCX>;
 
@@ -5755,30 +5755,6 @@ mdss_dp1_out: endpoint {
 						};
 					};
 				};
-
-				mdss_dp1_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					opp-162000000 {
-						opp-hz = /bits/ 64 <162000000>;
-						required-opps = <&rpmhpd_opp_low_svs>;
-					};
-
-					opp-270000000 {
-						opp-hz = /bits/ 64 <270000000>;
-						required-opps = <&rpmhpd_opp_svs>;
-					};
-
-					opp-540000000 {
-						opp-hz = /bits/ 64 <540000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-
-					opp-810000000 {
-						opp-hz = /bits/ 64 <810000000>;
-						required-opps = <&rpmhpd_opp_nom>;
-					};
-				};
 			};
 
 			mdss_dp2: displayport-controller@ae9a000 {
@@ -5811,7 +5787,7 @@ mdss_dp2: displayport-controller@ae9a000 {
 							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
-				operating-points-v2 = <&mdss_dp2_opp_table>;
+				operating-points-v2 = <&mdss_dp0_opp_table>;
 
 				power-domains = <&rpmhpd RPMHPD_MMCX>;
 
@@ -5843,30 +5819,6 @@ mdss_dp2_out: endpoint {
 						};
 					};
 				};
-
-				mdss_dp2_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					opp-162000000 {
-						opp-hz = /bits/ 64 <162000000>;
-						required-opps = <&rpmhpd_opp_low_svs>;
-					};
-
-					opp-270000000 {
-						opp-hz = /bits/ 64 <270000000>;
-						required-opps = <&rpmhpd_opp_svs>;
-					};
-
-					opp-540000000 {
-						opp-hz = /bits/ 64 <540000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-
-					opp-810000000 {
-						opp-hz = /bits/ 64 <810000000>;
-						required-opps = <&rpmhpd_opp_nom>;
-					};
-				};
 			};
 
 			mdss_dp3: displayport-controller@aea0000 {
@@ -5930,19 +5882,14 @@ mdss_dp3_out: endpoint {
 				mdss_dp3_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-162000000 {
-						opp-hz = /bits/ 64 <162000000>;
-						required-opps = <&rpmhpd_opp_low_svs>;
-					};
-
 					opp-270000000 {
 						opp-hz = /bits/ 64 <270000000>;
-						required-opps = <&rpmhpd_opp_svs>;
+						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
-					opp-540000000 {
-						opp-hz = /bits/ 64 <540000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
+					opp-594000000 {
+						opp-hz = /bits/ 64 <594000000>;
+						required-opps = <&rpmhpd_opp_svs>;
 					};
 
 					opp-810000000 {

---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260309-hamoa-fix-dp3-opp-table-453b8a5e3bc0

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


