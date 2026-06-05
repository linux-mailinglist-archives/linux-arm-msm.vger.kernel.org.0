Return-Path: <linux-arm-msm+bounces-111356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ngu9ORulImqtbQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:29:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F76647555
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:29:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ehgZvF7A;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aevpgKMx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111356-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111356-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 407C63020ABA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34733F822D;
	Fri,  5 Jun 2026 10:19:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DA13F7AB8
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 10:19:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654767; cv=none; b=budKwLVWD57of+74fN4LO2PVP9lhk0dEzK7Pc1Q3yagmE1ruid2j5gvDh1MW1V6Q/+kMK405PSohrfkYonWfs9Hdxzyz/yxZKzuGeiCL1zalcY5Tve/bhn4mbCAlWhNbPXqyKQYn4GUvhsJqwJnigDCcB5MxSk8NKUdtYn++M6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654767; c=relaxed/simple;
	bh=6h+vF01fqXjL8C+60pXT/uazqotTaaqSviArNOyHNG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CJvVOCT5LUj71A/rgA9fgtgLJup5mvqqVIYC3Mf0bd+iNNj/EzdFulLYQA2dG/+kcPfRgkNu68b08pZvbgXEaugKhGSDTHkLL01gUWJLMlq9lGbkP3TCgBKmxkDvcI6j/rlBkRfJm8gNAgzYhQ70KLi2meh68gD2WAEWrXSOEA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ehgZvF7A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aevpgKMx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6555CUko2667412
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 10:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8mO6WbvT1h9M7fR6svjtgiQ1TZ0TcZuDFdD/Tl0yHwk=; b=ehgZvF7AZ5WrNQrJ
	H0w9egfZbOBcsnIpjqYB187lusX001tRhHyQnVDSyqF2734nd4pISwKOrD+v+NAa
	1sJROJep8REdoAInQbMSUb0rPn9f19P0fG3LkTb+NkzkRWvy3NUwFnWvLIxkzKrz
	wCdX2PGrht6JcPhb4OSeMDNxYQLYAs579V3mgCcLEY6ZGMArBJvQnyWWX9dLWy4q
	J8JGpdLHfWji9n3RxEtdvmAM+K2tu8HXoYHbwVfJgC3ugnOeJgkc6mvUkY+9UrmG
	+AiM7u0q1dlJsGJP1RQG88fNDEAYWcG1dvbsw3Gat65jaLxDQSXj68Opg9b55jQ/
	dqc1Hg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekemyuf0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 10:19:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c331eda3so21150875ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 03:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780654764; x=1781259564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mO6WbvT1h9M7fR6svjtgiQ1TZ0TcZuDFdD/Tl0yHwk=;
        b=aevpgKMxsz0Cxu1KxhmISd5MC7xY0tXbEVzmITBqAO9jw0s71+xFD6qBaKA0etYlj5
         91ZHC5jK3PlcgMms983H9KCsk9snL4S0P+ZWfXsumdCdKqShiPeHgO+U9ERbtIYS07ex
         4bpsRB5YirvIJhVv+NZUaQhTf2fuOPSZi0D4dM91VWjxuNs6VsCuayNm2BHZFbKfBeF/
         aDXN/QjpJM4tvH7SnLjNKAN6a018HBJyJ7Sm78Y0RIxFmNOLWtOPWf4r04QdGO4kN8mT
         /YZhG/14UuwXDeFAvJlh+TFTYZPHlnfR/y/vtZw94lSQkdXf9WUixQ7fCcc6tOIrtuVc
         UgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780654764; x=1781259564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8mO6WbvT1h9M7fR6svjtgiQ1TZ0TcZuDFdD/Tl0yHwk=;
        b=XcXqEsMBzT0TRZU6rarHjYuotfO6GpR/U3F2G4fMwhrKMPIYHEycrb03uN5DpDId+9
         60+2cLHyRZNbzwoI/TEtGK7aL17htpdR+lKCJOetDO8DRvcgO3fAHcNUdCohHM3c0p4r
         rcqXWalsT6MhIvW0CBaybRRplguzYGogTO8Tfv+Z7SbVU2eC+uufmePj25eoC8TGjUZK
         wZ3E6ZP81gW1Bs6aZqQ+vZxjsEeS/JsRv9KpKCVhcUXVZgGXbbEAp8TDdWekcviT+vbe
         Q2WU4lC/b/0vnESsjDDHDxBhuGAtluRTVB1czM6TZT1uOBFkZooTMeqpzn/K3ZSpkgV/
         P7Hg==
X-Gm-Message-State: AOJu0Yyrl25bE0WBBJiqijDF7x6URJh3T78dPRuMhvBeRR2DTYaYim8c
	AoMw74qwnxqrAvbTAstcWiXwMP/IlNEFa7t48OYKjhV7Y7/roaUntjWxT/qwHdRLSR1tY2aKQdC
	vwqsxYq5Xe2ubAEXx2+Obk9R9hEsojA2H2iUvpYPLLRRZD2E5naORWuVk8HU+dAKoEcGg
X-Gm-Gg: Acq92OHVSOOmIydNpPAGsBAVnSmY0oVJ4UdZ4GN2/x6BEiwQUV2zJDGfWCzHR95TWvC
	D8QWmoKrIH5RQjgJj6z7rac7aeplBsZYW4VIOMGfx1aXKh82Y+WQ5ibAfWV0prjjrWVlQqVLMMC
	UIU/EHL6x6J3WBU+wz9J+7oBk/7u7jAENrjlftIYlxWEilqAfXJ8UUJWvi8Zun7e5Zb1kjWxIsa
	YubSS/5FpUovxd9hFqeu+Qbe6wEMcA61rP8JWNKfML2Odxo2qaj3PNXEaM3bDufp7n5jf8z/7AH
	aDe6dG2RV00asiEKzJ48wuyaTnExGlE3czFDan/6XR+mTWtmXO2Dn6zzFT18BKKMZ4fWcdbjyQO
	4W+4+R/NOxksTbsEk24zbX0SN5l3zaEKR/LPkYjqCEPAwMqqQXH1P5CUvka4=
X-Received: by 2002:a17:903:4b46:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c1e8979bedmr28483615ad.37.1780654763774;
        Fri, 05 Jun 2026 03:19:23 -0700 (PDT)
X-Received: by 2002:a17:903:4b46:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c1e8979bedmr28483275ad.37.1780654763235;
        Fri, 05 Jun 2026 03:19:23 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa0236sm89741445ad.33.2026.06.05.03.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:19:22 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 15:48:51 +0530
Subject: [PATCH v3 1/3] dt-bindings: display: msm: qcm2290: Add Shikra MDSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-display-v3-1-9846ba5fe635@oss.qualcomm.com>
References: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780654747; l=4024;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=6h+vF01fqXjL8C+60pXT/uazqotTaaqSviArNOyHNG8=;
 b=TFxRUXxc1AM66zgTu8vryy4ABMH/7M1dXZw8TcuBEziBAE4HeSrNwG9FLnM7EYBN44BuRN6Dy
 aKPmV311+bkDAsH91RkXrlVUjkWwslHad46kxpe84+RjOtbqpfUeZdZ
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: TouWQOZN0ZpE1Kw5472ppkM_CKGaih93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5OSBTYWx0ZWRfX2AP7QJmvacJY
 H8cgaY24X2qGFb80oIRJZ0spBgSP6Nb/2kmyfv3G1WBgUEMTFmrnaGMb8vD+LAHtCSi2xsSOso2
 JGZhL/RHqwPwSfLzZShpVMoJDr3PWK1/2K0JPHF79iXQChHb+OytaR1FyqqwW/Lc/BxDeokdWzT
 ovup2FYiYgO3SZQnSs9yuMY2bhyLhXP/+o8TMF6D424idrUpI+Fgj0HmgM4EGbxeZ7wSSpAiUIS
 aQUjiVuszNAI2PVX3AJ8Y3X2v5wsJlcZfYjWHLhqXGnTXqUlceXCzLw7Dk8cZzKi8IU/L5CITxU
 Or1T212MIq1Ng6fQsVSK7F6Czglw3VEDxI+c19+Ja4Am/FbRWPX0lvNJRl+aif5doHgg6jrfb7z
 v9B4mDVPA0Do1L/CJHrQCd2wa2JSsKL6X32ld2+CBnUpSSJqPkatDDawFt2t/0aIk1sHKkokuhl
 S9wQlkmP2XSlID6B2LA==
X-Authority-Analysis: v=2.4 cv=K/wS2SWI c=1 sm=1 tr=0 ts=6a22a2ac cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=OEkpyX7SRU1z48_sfK4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: TouWQOZN0ZpE1Kw5472ppkM_CKGaih93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111356-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,devicetree.org:url,linaro.org:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0F76647555

Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
the existing qcm2290 bindings to cover Shikra by adding fallback
compatible chains for MDSS, DPU and DSI controller nodes rather
than introducing a separate binding file.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/msm/dsi-controller-main.yaml  |  4 ++++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 +++++--
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 22 +++++++++++++++-------
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index dbc0613e427e..ab2cfd6d6e3e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -57,6 +57,10 @@ properties:
           - const: qcom,eliza-dsi-ctrl
           - const: qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
+      - items:
+          - const: qcom,shikra-dsi-ctrl
+          - const: qcom,qcm2290-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
index be6cd8adb3b6..e166a73651df 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -13,8 +13,11 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,qcm2290-dpu
-
+    oneOf:
+      - const: qcom,qcm2290-dpu
+      - items:
+          - const: qcom,shikra-dpu
+          - const: qcom,qcm2290-dpu
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index bb09ecd1a5b4..ef21b2c263f2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm QCM220 Display MDSS
+title: Qualcomm QCM2290 and Shikra Display MDSS
 
 maintainers:
   - Loic Poulain <loic.poulain@linaro.org>
@@ -12,13 +12,18 @@ maintainers:
 description:
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
   sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
-  are mentioned for QCM2290 target.
+  are mentioned for QCM2290 and Shikra targets. Shikra uses the same MDSS/DPU/DSI
+  hardware as QCM2290 (DPU 6.5) and shares the same register layout.
 
 $ref: /schemas/display/msm/mdss-common.yaml#
 
 properties:
   compatible:
-    const: qcom,qcm2290-mdss
+    oneOf:
+      - const: qcom,qcm2290-mdss
+      - items:
+          - const: qcom,shikra-mdss
+          - const: qcom,qcm2290-mdss
 
   clocks:
     items:
@@ -52,7 +57,11 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,qcm2290-dpu
+        oneOf:
+          - const: qcom,qcm2290-dpu
+          - items:
+              - const: qcom,shikra-dpu
+              - const: qcom,qcm2290-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
@@ -60,9 +69,8 @@ patternProperties:
 
     properties:
       compatible:
-        items:
-          - const: qcom,qcm2290-dsi-ctrl
-          - const: qcom,mdss-dsi-ctrl
+        contains:
+          const: qcom,qcm2290-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object

-- 
2.34.1


