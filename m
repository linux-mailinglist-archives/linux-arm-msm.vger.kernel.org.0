Return-Path: <linux-arm-msm+bounces-99454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qByRCe/XwWkaXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:16:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C55D32FF7CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E1203015731
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6B62772D;
	Tue, 24 Mar 2026 00:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axsdx0pm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCs/02he"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D28B273F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311057; cv=none; b=qUJaXcgdbgbb3RrqxazfEfIt3+DbyRfg/c7cC8Bpv0CmG5BzuvGBDtI98RiaGAePeuXMiJp/opeMLkITAOl1pfKNb2OUYdoJ1EQ/JXo9uhCCbkxefVTq6y+9IRrDmidhw87DaBJKJYTZWERUGHuATJ0gBH3WMbxA+vuidDobr9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311057; c=relaxed/simple;
	bh=8yH18CabF2uT8z4kGoYVPlYxmNkNb2iB2IanbQbT8qU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g4ocPSpGD4k7TPklP8TH/IGhON8bDd9v+kvUmNArT/w6qrDBDxHI6jQsV2sqRsPodp6HPR8djPooOmnYB5JCYNNwNez0vmNOawRQUXDyO2xzFd5txG3l755iPj4pLxlKFLOAJDq3V2dMOEkNeubO+83FWuTzb61e7wzNmi5IRNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axsdx0pm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCs/02he; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXsX362491
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ik23EJ1+iWgB7RPS9yPxTH
	EOSriWwzsi42HD3aFTW1c=; b=axsdx0pmtfwwwmIpCMvQ/rl717t96eJTvUSAk+
	XUpdl8btdpcEw3MRzm+RcsPzpNUrNNWKXF4S/vDKTwyUru2kn5J/6WBt7qlUE/8C
	iuH2R1SHtfqmuEOiuECE3SPN5ldAKXG2Oftuu28C683zuRaK1MNBPeW+wcUCqJPl
	DdSqnVDxG8lNn8en89/p4mmW5sskGTV8lXvcOpb8GTI2qI5tkg2jOSLrqZqX90XI
	gri04KyMWYLC0v380VG0KOOSgV+QuWnJWpJmBhfPWt7sY4LkGxLSike1F5+X2tEn
	CWcmbZjMwx/FfUq2bHYLHqxzww73VaR+IgxjsjG/6BLSlzag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k32nx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:10:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so250054201cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311054; x=1774915854; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ik23EJ1+iWgB7RPS9yPxTHEOSriWwzsi42HD3aFTW1c=;
        b=OCs/02heXT2Erq1PcbaL1UEXDglbSUQCbICaRMOe2OzICIIn1N1pUs+t7MVf+v56nF
         iRIFORniG8yKkucIk+XzW+nL3EmZ5xZZBmxV/bzs/2LaPwJ3+8az4li71KR5E5obxsZL
         6fYPY7L3V+0kgDNjOWkVpDe9D/qDmVs4Ag0XDgMaz0D8kGgpgVHaDGrwGK/9PmOH0etE
         hvm5niPgwO0aHt41bttQ0FzglxAo/2847EL6t872B7BhQxh9XnkmyKS3e/uELCRpHGeP
         Wkt/waDIdlbnXuDg1zXtAwYJ8W5MJX42bFhrkl7SknJzRD+hZ/FCYGzQfI/gOKoLfx3c
         7gPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311054; x=1774915854;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ik23EJ1+iWgB7RPS9yPxTHEOSriWwzsi42HD3aFTW1c=;
        b=rhqhl+PLhTxeiV5j+c8EKD9qwtolSYIWqmccDvzGjWKNlTG02Ca6aJv9rGL+S8vUmK
         LFndGcLaygAGb1ggW5AN/jMPJOvih0ZAk40oxiw92pEJCFw+qXKkkIcDpgOqqoyZY6oq
         cDJaMDEuCkxxaej6cHRF5EHFDtakSk3x0y+YCsLiNqvCDO6c2FBr+wgh+GBEbCliMt0n
         qXxwLH+t9tkHmYhirIqP3249HXjLMSQxxLtsetBTwgTc6YTNwxP3dMXBNTj/LUeUlD6S
         CFlAR/3q755saJq25f68bLAYSKq6p/S1kd50wSiQQx3sHc+gVKne5bPKRI8WUF09k2HL
         KrCQ==
X-Gm-Message-State: AOJu0YxcPiiLlVxtSeFQKMn47LTrh7jem9zgTEClZ8M3NQllhMigEMvg
	8lOz7MnrLtIa44eFCfWGN7urb2o+oeOHIcsBDn4UUcSu4flJQI5gjb9DkGcIIkB7qFymypQUCh7
	jUcL/HfRiRBdc1hg7Pi++LTSfKaqYsNQhyLP1HM6V++ZDRqmGkJ6eFlZutVJww0d6vWyG
X-Gm-Gg: ATEYQzypImWL1xcnA5/+hbgjYleleWw42XYF17Kqh7Ti6/qlrZehvncBI7TkwStvBlH
	DyV9SZ3PA6Hn5RjIoP6jK6fy005QRH1GnYyIgGmFFSSfx9ZTsVmoDs8W4PotrKf7E++X/sMq9cb
	ys+v0+tvzqk5z4CckLfBxbNt5iDgOigIrvcNFi2RTTJWYgz3VLUup1h/KESRf4wwrbkhcCgQyyf
	XLYMQnogvX4gmeWmphCoUmS51/FR33j7BdFZVe0UTCbH2gAWwKYWmBqqE9kPGXtVCNhUnxa2tdz
	nCm1tlhQZhFth2jxL7DSmprmgPIFV9m9xi0ZakXHj2Kq5ZMUljXFO5B0eX8U8SLdTgTkR6GDEus
	D8/Mnk6S7NVQLMx9At3xAbzSRHtDZ1eooGuaVskLPVXva1KiI+ojx0+LzNDoDeAZGbA4oUOkJ5P
	3WbN+azGgGpdrzZC4HJxQKiSlYZsSePwrUuqo=
X-Received: by 2002:a05:622a:8316:b0:501:51d4:df30 with SMTP id d75a77b69052e-50b6ed42bf6mr18143311cf.8.1774311054365;
        Mon, 23 Mar 2026 17:10:54 -0700 (PDT)
X-Received: by 2002:a05:622a:8316:b0:501:51d4:df30 with SMTP id d75a77b69052e-50b6ed42bf6mr18143011cf.8.1774311053876;
        Mon, 23 Mar 2026 17:10:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820f6sm30339021fa.19.2026.03.23.17.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:10:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/9] interconnect: qcom: let MSM8974 interconnect work
 again
Date: Tue, 24 Mar 2026 02:10:36 +0200
Message-Id: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3WwWkC/1XMwQ6CMAzG8VchPTsyCsrw5HsYDnMUaeIYrko0h
 Hd3knjw0uTf5PstIBSZBI7ZApFmFg5jCtxl4AY7XklxlxpQ40GXiMqLN01dKXZOaesqh4aKsrG
 QFlOknl+bdm5TDyyPEN8bPhff788p/5y5UFrVpsGL6fY9kj0Fkfz+tDcXvM/TgXZd1w+izc11r
 QAAAA==
X-Change-ID: 20260322-msm8974-icc-0ac4c28e139a
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8yH18CabF2uT8z4kGoYVPlYxmNkNb2iB2IanbQbT8qU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+bBa63aVkviZ2zIPJnwJ3tO0dGI0AWvfSV1Mz/z78/gf
 uEaNVGyk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATufSIg2HFPdVzO5kfOune
 SnXdHr207ZUPq//FBWzt5x95RpjmL9XUtSmqjUz1rkn+tFZsiuLfY0nFl7g/OR1MlMg3bzzWduF
 bBaf4rbxFK58oZLBJa97oFwmMmf0vTdkke+qBnRkV7et6+hRrCkO6Wi25ohKeavwouZBcfOb+ly
 ymxJVube06i3qY0wNCzDx2BP5P3tJwQ7laU3BV1oUbk12nPfi/u8v4SEeg3eI6xk8P9Q66xs52s
 GJbX7r265GGHqa+wqNTlLIUv94x35jMp6G9xnrfwuJrBmXuKmdmG9V67dm3e8Z07eXav8JE5s5S
 y0y9kjhtu63+/zXXa62b5XLL3BfP7tpQaH7hyf0eAy91AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c1d68f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UYl0gxALbNRs-l06lEwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMCBTYWx0ZWRfX0W0XwGgzuFPt
 j/FmfAQ0wIVdoDnVUnIoz0YeF40B/YFbTpB8dXkCGUAE1SwVuMSSOTfguip+R3gVjApUDQZn1UP
 eN0aOqJlUQqLFg78GD0e+i4OIRMRrGyS+Aztx9FO0A5RGWihZ9Gm3EfUZ8At30AjpkzS29vn0Ow
 QA5XT4mftswSePgQGkEQ89X03/SXH9ICwLa8yB7Rx3MZ3aRpPU/SfJpZRVFix5pc22cb+Vjjao0
 U7kjeM5Yc+Wd9l9Twbd5OW4HDK1AvEI04+w9+gYF8Z0T3IT73F/iDspqS3qDga0tKqeX0CB7eD7
 wT00XFT+5Fgtz29YZzHkQetdJlBWYJBjTRHonhLPkKSUHLTrRsTC/l7P7eY5oL0aLf6KNLeSott
 3Rlh+52C+dSJ1mUl+IWVuV+3d3Ub+eyx2+lJiqZ4/d15dVnDAyS10a/9+T4ZZ8c+zPhGepcZ0N5
 DHvSpEHFg9uwQ//Rtkg==
X-Proofpoint-GUID: QVQGnNeTRdBiHu6ehFuA0L1Ni2ISePna
X-Proofpoint-ORIG-GUID: QVQGnNeTRdBiHu6ehFuA0L1Ni2ISePna
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240000
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99454-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C55D32FF7CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit d6edc31f3a68 ("clk: qcom: smd-rpm: Separate out interconnect bus
clocks") moved control over several RPM resources from the clk-smd-rpm
driver to the icc-rpm.c interconnect helpers. Most of the platforms were
fixed before that commit or shortly after. However the MSM8974 was left
as a foster child in broken state. Fix the loose ends and reenable
interconnects on that platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Swapped order of clocks and clock-names properties (Konrad)
- Corrected the ocmem comment regarding core clock (Konrad)
- Link to v1: https://lore.kernel.org/r/20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com

---
Dmitry Baryshkov (9):
      dt-bindings: interconnect: qcom,msm8974: drop bus clocks
      dt-bindings: interconnect: qcom,msm8974: use qcom,rpm-common
      interconnect: qcom: drop unused is_on flag
      interconnect: qcom: icc-rpm: allow overwriting get_bw callback
      interconnect: qcom: define OCMEM bus resource
      interconnect: qcom: let platforms declare their bugginess
      interconnect: qcom: msm8974: switch to the main icc-rpm driver
      interconnect: qcom: msm8974: expand DEFINE_QNODE macros
      ARM: dts: qcom: msm8974: Drop RPM bus clocks

 .../bindings/interconnect/qcom,msm8974.yaml        |   28 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |   21 +-
 drivers/interconnect/qcom/icc-rpm-clocks.c         |    6 +
 drivers/interconnect/qcom/icc-rpm.c                |   18 +-
 drivers/interconnect/qcom/icc-rpm.h                |    7 +-
 drivers/interconnect/qcom/msm8974.c                | 1637 +++++++++++++++-----
 6 files changed, 1274 insertions(+), 443 deletions(-)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260322-msm8974-icc-0ac4c28e139a

Best regards,
--  
With best wishes
Dmitry


