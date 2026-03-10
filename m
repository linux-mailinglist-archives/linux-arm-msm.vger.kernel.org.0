Return-Path: <linux-arm-msm+bounces-96539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOaxAerRr2kfcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:10:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A89247019
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF404303DD47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB853ECBFF;
	Tue, 10 Mar 2026 08:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PxFfG+xC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="anhF4fmE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BEB364954
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130010; cv=none; b=WyikEcswnwASJy+6hgVQSs9jQVc6QylnPMlxMtf4wZKsrNWinaRgnZ0U8H/uDNHwn2TCo7H/kG7G0zwZ4zmRAS/H9TU0IbxcrZagIU/lE7ke1xKrf/XO8ix1B0FhNtSrDzKtMNjUdg39pHDN2P9RxgMn1g+AyK82J3TWhU9hvSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130010; c=relaxed/simple;
	bh=znuNKLO3y4Wqzl8E3xgPlJfCPI2s6M2M47CqfMQBpJQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H8IXbkv1aMRcImayQ+uE2ln+Ct4OuxMDR2ntpbpln9Xh5C5vPlyA6PbEwzinO1YJ7Wb3IdURE88S3YiraU2/mPTXlzkmzsxPcfQe+aqfKc0Zf3EY6QvTFLbQ/vak+iOYk/pmh1CSlp2TEYJgcnD0p6IYO4PNWujEilG0rslC7z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PxFfG+xC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=anhF4fmE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A5lI28568748
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oJgKz/c+fGi6e9tLbQFA2+
	z2rvGKv1CqSIdctAOGMwo=; b=PxFfG+xCUy5IkbRyYxKa987uIGMzCP2qmcetec
	NyUDYLh7oderGEBPmZ4shgSWn/Wiu5EqFizMy2CgWAR2EeohodBnyNsUv4otfaOA
	qfQQ5Cm2jch8RNhLrFg3nZWK0itRCYrf7i4QHfEqTVInn+115jGduTlHtVPtR3vW
	u7OYcTF6axhXfnljMBa7syxrbrBK6PodOi9UyL7sVpHwlsbhRAHYk2WSX58KLQZn
	ClIl1qtPSEbErhslP+NGUXFToMelzniC1k2ioLzOPFD0MSTWbPldDRsoq11DsCjA
	ePW7YZNOLtqUa5qJs+WeDlm3MlsRI1qCNbe8iLO0T5yf+qBQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8gevu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:06:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c73a4983fc0so1807551a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773130006; x=1773734806; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJgKz/c+fGi6e9tLbQFA2+z2rvGKv1CqSIdctAOGMwo=;
        b=anhF4fmERGmRthoDwe4Pe9Be9liQfvnTiQo2MEEuhHxNR/odjiW2yUvTVR3BJaG8WX
         Y10WgJj2eK55P2RrOOlTHdLcVXb1wwp6wzkItjBWT8+5jrLm+nf05Qe5FqVG5A+JQnv9
         3SztZaOqhFHbP9SE7lCAklfiN13JsoE2oU/Bt3YilLm/WcZ4teMC2ntFWs/RBjSpQFzX
         2K6xXdI6gC2otPS6P5LA8xhhpeDkPEEXZEtI2z2L4OwCOVSB+dCAlrFWsxbRSQ8yWXyu
         ZXSRxhT4q+S4rkiqJ5tyG+3kGLmVOHVOmiprVRda0fftAVZb8guzSNpQRwZsa8sIeALr
         gC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130006; x=1773734806;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJgKz/c+fGi6e9tLbQFA2+z2rvGKv1CqSIdctAOGMwo=;
        b=KePZLCdfDabIOJe3HkyvUGu9nUZyWSsPH3zdHQnqQqqcOEzUEzlDSwXUCM9uUrX369
         82yrnOCU4TGOy3x68ijUUiq5hno22U36sqZAjRuMjypZJeyYdKS5RWiP+Vmg+C8WCjlv
         99+liSyKE4RE/kH/fFMkiNhOJIprOyZp+s0RSaZsFhPC3mib3XUcG632R6P53NFtKAxt
         TGqeepY2VrSqFAvV21xpQ+vcAr7kg9256Nz9pIdaxhEgM4mnc5qdvTWKRhfDQPz8laSa
         JMg3ACwrF+NSeH8QfBruC+jKH/Lz5+8MH2RsEEVwa+jDWQkO9y2JCJo//OZKufcf48mP
         LY3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrCqZ5Q9PX0P/6aqjVsMQ0v2gvTeqG/BzBfsFryKy+zjSMXOP/gPBtGqOKCDh4aXGVqB3TMeOcgAV5bzfD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3yUZfiHoAwJUJbJcChoNbDnS2wfkfKZAAem9XpoJb8grPKcRW
	zxVaFrVfFeIqudGxhevpZOM2fbTptQLAa7gUYeqIKIgMPxJOOqOfDRHUZQqk/MyBH4hr8iiHrz2
	oOgJV1LiSwCIGj9jaBMZSVN9cvhMVhftIrLtQ91EXAljbGkjaYGTJdo3/kUuXH3Xz2jwr
X-Gm-Gg: ATEYQzydnOChwOB/46rVs2pcLBxEyo7gfjyqkfkeST59OQgDyamtarOPHvOGi+QzKw4
	TWZF7i757upZukjAJeNp0rU7PYcDiMrJlgqWI+KWxgyCqJTHGKj/WjxsEvNCamU5myhmXGfx1kM
	rRqZ86G84ws3VR7+44BX2xOWL/WWg5E/8s7BBZqq6wc7VhGPIztaYTMk7MNYkF7vH1uqgE2zhsT
	9pGHzPqZa6/Nzg5BsgsGAUqrEvEMddP1ADr9BxObcbp8MwSy9LjMgWZ3uHLbZn/BzRZSlXRdJJ8
	zB8tz08eWUMpPIvUbp33RIoIFwuIZ/a/mFLalP03XDzjn3/vadKPxMCffzLkoyUkWk+P9rzQD0x
	mVk3GJ31Q5o8uGyvI6yV50MpYdF9uv9SdaYD1vaXEqu60BB8=
X-Received: by 2002:a05:6a21:9089:b0:398:8a92:78a5 with SMTP id adf61e73a8af0-3988a928090mr7058385637.28.1773130006079;
        Tue, 10 Mar 2026 01:06:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:9089:b0:398:8a92:78a5 with SMTP id adf61e73a8af0-3988a928090mr7058355637.28.1773130005582;
        Tue, 10 Mar 2026 01:06:45 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e195c40sm11121969a12.31.2026.03.10.01.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:06:45 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH v2 00/11] Add explicit clock vote and enable power-domain
 for QCOM-ICE
Date: Tue, 10 Mar 2026 13:36:26 +0530
Message-Id: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAALRr2kC/32NQQ6CMBREr0K6tqQUacWV9zCkacpHfoQWWqwaw
 t2tJG7dTPImmTcrCeARAjlnK/EQMaCzCfghI6bX9gYU28SEMy5YwRmdjRsVGlCTe4JX2rbKDHc
 V3QJUilqyY1exUmiSDJOHDl+7/dok7jEszr/3s1h825+3/OuNBWUUalbVUoruVJnLvGA+P/SQR
 mOegjTbtn0AKh5DJc0AAAA=
X-Change-ID: 20260120-qcom_ice_power_and_clk_vote-769704f5036a
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773129997; l=3862;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=znuNKLO3y4Wqzl8E3xgPlJfCPI2s6M2M47CqfMQBpJQ=;
 b=keSLETTky6TJfKmnsR2NnND3UhV0YVvXWnz65lfcs1IaBs5Du+EZbyuUKpGNqbewqZ7SGVT5X
 1xG7CF0BxLOBSfYuxhuE9PMmLJAxhxEwWEohRlTm7DARWwsyUKFAEhO
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2NyBTYWx0ZWRfX0LUjz6DBWBOm
 6ISzSlDdMLvzZpil3FvZnkalApVAfCRFndjBSZyXuInHu4p/oBdq8Uu4tdxo/Do/L+FcInzV2ZU
 tvqr6A42Zu00q77Xpj5HfZtS7dJGNW/3tMBRap4bT4XKoDEZ1F8L73PYDbWPggj2RiNkPRRKARW
 +ZlteIaSfvDyH0pP941Lko/0w3rgUtXx958xwwFAGjl+tyeNwNPTHeDRgr9c7ncG5CqCp+nUOoV
 bn4/bsctKh6qdijxomCK942neec6CSb99/KZLaARaDzBU7Z8OhDOT1Up+lurWBcxyLYXvZLARKh
 R5L3rqB2HEYDI6fjuNWSHYoW7ByHzYiKQiP9EAOO+qtRQfRHDlUVj4aMHc+CMPMNJVj2CTPowkR
 CaMleEkYZDAroMEOdzKDENpu18FCbTyOMb14+NM7GaiQCauaRMKnjXL1xhlOPOHVr4nagQhSwAo
 X9olKPkpKXNeM4R//QA==
X-Proofpoint-ORIG-GUID: GhOWRrHRsPkgk2jyKZ7aAwkQxEssWlhb
X-Proofpoint-GUID: GhOWRrHRsPkgk2jyKZ7aAwkQxEssWlhb
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69afd117 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g2SMA5Qby75y8d18gdwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100067
X-Rspamd-Queue-Id: 75A89247019
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96539-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

When the kernel is booted without the 'clk_ignore_unused' and
'pd_ignore_unused' command‑line flags, votes for unused clocks and power
domains are dropped by the kernel post late_init and deferred probe
timeout. Depending on the relative timing between the ICE probe and the
kernel disabling the unused clocks and power domains occasional unclocked
register accesses or 'stuck' clocks are observed during QCOM‑ICE probe.
When the 'iface' clock is not voted on, unclocked register access would
be observed. On the other hand, if the associated power-domain for ICE
is not enabled, a 'stuck' clock is observed.

This patch series resolves both of these problems by adding explicit
power‑domain enablement and 'iface' clock‑vote handling to the QCOM‑ICE
driver.

The clock 'stuck' issue was first reported on Qualcomm RideSX4 (sa8775p)
platform: https://lore.kernel.org/all/ZZYTYsaNUuWQg3tR@x1/

Issue with unclocked ICE register access is easily reproducible on
on Qualcomm RB3Gen2 (kodiak) platform when 'clk_ignore_unused' is
not passed on the kernel command-line.

This patch series has been validated on: SM8650-MTP, RB3Gen2 and
Lemans-EVK.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Changes in v2:
- Updated the DT bindings and ICE driver source to ensure no ABI breaks are
  made in this patch series. A follow-up patch series will mark the clocks
  and power-domain as required to preserve bisectability.
- Added list of allowed clock-names to the DT-binding.
- Added Fixes tag to mark the original regressions and ensure back-porting
  for stable trees.
- Updated the commit messages to explicitly mention the problem of
  potential unclocked register access and stuck clocks during probe.
- Dropped explicit calls to pm_runtime_* APIs from ICE probe, suspend and
  resume.
- Link to v1: https://lore.kernel.org/r/20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com

---
Harshal Dev (11):
      dt-bindings: crypto: qcom,ice: Allow power-domain and iface clk
      arm64: dts: qcom: kaanapali: Add power-domain and iface clk for ice node
      arm64: dts: qcom: lemans: Add power-domain and iface clk for ice node
      arm64: dts: qcom: monaco: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sc7180: Add power-domain and iface clk for ice node
      arm64: dts: qcom: kodiak: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8450: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8550: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8650: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8750: Add power-domain and iface clk for ice node
      soc: qcom: ice: Allow explicit votes on 'iface' clock for ICE

 .../bindings/crypto/qcom,inline-crypto-engine.yaml       | 16 +++++++++++++++-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi                  |  6 +++++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi                     |  6 +++++-
 arch/arm64/boot/dts/qcom/lemans.dtsi                     |  6 +++++-
 arch/arm64/boot/dts/qcom/monaco.dtsi                     |  6 +++++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi                     |  6 +++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi                     |  6 +++++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi                     |  6 +++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi                     |  6 +++++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi                     |  6 +++++-
 drivers/soc/qcom/ice.c                                   | 11 +++++++++++
 11 files changed, 71 insertions(+), 10 deletions(-)
---
base-commit: 0f853ca2a798ead9d24d39cad99b0966815c582a
change-id: 20260120-qcom_ice_power_and_clk_vote-769704f5036a

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>


