Return-Path: <linux-arm-msm+bounces-114508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WTmvNugHPWp1wAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:50:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABD96C4D79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:50:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nktWvLFF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=M49Jhfux;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114508-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114508-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03DAB3088CBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F83386C0C;
	Thu, 25 Jun 2026 10:46:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADCF37998A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384407; cv=none; b=eMsoAqccAChBzlise9IXH5HO87b6Rvdg08xOZYAmWkEkFK6ordSte2PHSzI5oS9PyO/4aMYC3UsgTWPxEgUknuEHaKELw4WjImFSwTKsQaelaU1k0COFt7d5Mu8VKtHIoGNW6Fy2kZHH/Mv5ehzONHe36mZzr2aVeyPWGdYXYIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384407; c=relaxed/simple;
	bh=fIhJzaso9N9Xd1IgveByjqgunx3Xh6KSxy4FjeYwCkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WBIkJSh3ydl3so7Pgz5NMJxBi2zq+mGNvTqsnxqKp+JJ7uBrwCNBplwvbv9SiMtsXDEq9AlkqFL+V5/MDWgjwh8cgCgZDuvfbMIJFXWA4jx7sM+vXiOaBOlC95R6fMvXPuVg2tffHYznXYfIq2k/S1oFz00+4YahoLNugU5wW+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nktWvLFF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M49Jhfux; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9kIT01725720
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2gE10b7DqflojsoJUwYlVeY6chdArR8ZAvuFavqtsk=; b=nktWvLFFua3yFrvd
	5B6nj7vGsAE6Lr5dZJwt5IA3hJuKA9DKcIxxpr1gYLk/OnGRIsih3W3n39YUVJKi
	ioA69YxoPwgudCSl7IIvK33sJRokav+1zQ9ZVU0hi15A7kxxi16eXu4lTnHjmjtq
	oBKoXnTZ4EAIm2UxbibrJbIQ7Vb02PYSImjzW0UgLReajzEgQdxpv/ACh97dPixr
	Dj3BruedT6b+9nzI0J3bM8ZIgaVhaCG1Hwtm1uvTAiEZdCYFVd5tTysLusvK/QIl
	qsmF7FDNZum+Rx7PFSoH43uw5ek7/k9K8VwFgrMWG9WSqH41i9s4EfyEmWjDgN56
	MaCh6A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7duwk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7edb8505dso13060065ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 03:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384403; x=1782989203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2gE10b7DqflojsoJUwYlVeY6chdArR8ZAvuFavqtsk=;
        b=M49JhfuxJ6fmfCjtGsI+Dfr8NLETJFPIn2BcKYBhrJi1QUdLzy9Nc2i+hrSeD3gFgj
         FzGN5J0K6lG9oQnSS55x+/LPYnom5zxOyjnMEAflzIeIsS/p/5d4XZ45Ko6MLZtC2bLR
         ddavarLUDVtDy2kpXIhWIO7mTcdMjmfydk9s9troNkxOrvrWC00HKEWsxvqIYXJGdzD4
         kGKF9ndmKmHIYxQInN87+2eCuh4IXg1swKkjpqfK7IaTdmANNrFBaXIrmW7re1ileEZ+
         OqePf3EnH02VIP6qV7g05VIZBrZx/1oYvQIemwbEeTrXjJ4+ydm7HGzf0oHt/+pqIRBm
         Qa2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384403; x=1782989203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H2gE10b7DqflojsoJUwYlVeY6chdArR8ZAvuFavqtsk=;
        b=gAZJ6A2nLHHy0yH+5W6B7TAMPzEMNc2OjHzX1sGvJH6TjxwtN1oipxKdpNTH8xnHRf
         vJvth1l6BvHrmfhrr8YhMqm3KnFWLL2gJ8BFvPWNSMCpYB953TljbaHmiEiCdgPnDvIf
         twpArpxGef3jgyRjkRvrBHz1aCDLAyRa3zBaXji92CFmr1UmTJbqZiRbKvqDnanpvXHi
         MmV6uSwWWrgtzXOcEhRDOQQ//BSYbFjgMnzMMyhEd8qPQQC3zTmDYDIjLWfUMh9UU1XM
         GgyBXksvsfP3pE5fuzi24QmDFjSy5buFPNQWB28G/4DOjzxx6tpqPRvW6FK3WWxQvSLG
         +vxA==
X-Forwarded-Encrypted: i=1; AHgh+RpeRRJdmxjrOX3C3ocrXarVCe6U7PKVi1VAmvwfTpzRkAWGmWZyQ+MqH2eTwAF3C3KZkCpwVHdI3kT1CdH+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1lXzryc4QD86eRssnfEPquNNM0ba3F4fLoTuUGGy9Zn5MPbVd
	ZaX9xvc2rKsvFnD7ujyJf5Yzt9Ob52LNXsVjGP+Hn2hg3xSh9//uTh8sqcvpe2tEiNJmq/Kk2gw
	wXSBPsn8y+08XgMbM11hYI4mEMdNG1GOYQ8A30cO13SyXbMC4KV+Vr0Lk44z8nO/MGXIm
X-Gm-Gg: AfdE7ckHl9zFrWPA51jg8rDqXRJFL6F2n2eAhbAZN0q9VobCcYcIJ6hq9MJ9FcG4zJo
	/XrmdZ4e5vEtVhK8HfnpSHLbCpKd6OWMThbsKQCyJvsWKvXSXf6GVCygfgfF2XjZ0CD6rptn2Ha
	V2fRVrn5W6lNHygRUzZPwWclYdpcidcs4QMPlAEqKCJRk0nndPRigig/8j0SlGgzNUPCRu/qqwh
	RMG/ekqkQ/O1NLuiTLXQzs1YqrxgRPpEUV6rtDHIhVPp9fLsjsqyeRVfN39/QaoPp9AC11Nc7Mo
	5wDkei0ArWkX3O8lu2U5hySruvcICosfauG0QJwtylNoi9K/tKcT9RLgczRDQEvdbcdXjNk99JC
	9thBpgHQG5OnyoIIwPM5qdcVE+sg7yjCqMpak8WHfGD7rJimxWDlu9bpHY/RdoDrfW/4ZRCFm5w
	==
X-Received: by 2002:a17:902:cec1:b0:2c0:c14c:bf38 with SMTP id d9443c01a7336-2c7fc7309b2mr19681975ad.24.1782384403444;
        Thu, 25 Jun 2026 03:46:43 -0700 (PDT)
X-Received: by 2002:a17:902:cec1:b0:2c0:c14c:bf38 with SMTP id d9443c01a7336-2c7fc7309b2mr19681765ad.24.1782384402956;
        Thu, 25 Jun 2026 03:46:42 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 18:45:54 +0800
Subject: [PATCH v19 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-4-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384372; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=fIhJzaso9N9Xd1IgveByjqgunx3Xh6KSxy4FjeYwCkc=;
 b=KxGEjMfdJvyIiidzq8F2ZIosQs0uCJGWkZa5FHiQaLch4Vk5w2VVPtL3MT5jND7sa+axVhvo/
 NXNHyXdi6zaBGQNmRG6wcWvxqdFOS8qRrrxEyaqfei1DNGJ1U1Xbtuk
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 98RpZhIaEOzG1ykn92fW2dfeXJ6R2pk4
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3d0714 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX1tEPqVoiqK4i
 M/sONCBRieaUk1EeUzRvtXdwABRueHHVIEOZOXwijHsVx6QLov/Gmg9118rB5kpoQyp7/Gr06Dq
 Kjb/ZUsZyjJXKLsBgBUrw8BNUYGMpBw=
X-Proofpoint-ORIG-GUID: 98RpZhIaEOzG1ykn92fW2dfeXJ6R2pk4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfXwwkO9XqqNNI/
 l26xpzcUlOCuLJMlOWEaEu5LvFWy7vwo/CC3O9IZOADckDKbYqHVF8H1a1D6RT8wMH4BGwpSd+F
 psA2HaNv/WgapJG9PGEzEljThZLhhKXzuLsbtgBF1RIjzxc0wL4CjaEbln/07O+Hz9VvhX/Ahi+
 QZYSiEEQGaI/VLYcJ5blg05XBDxJwrzA3hGWXbdoyqP16UYNsbtB2C5xXBYHN0fReCbfQavKhZ+
 fTS2UUL6CcOCYHVz9DvJh5WTi9ryoAt7peGks0AeJ6M9yUOr47yfeTBQCvG/XTyxU2Nfy/XfmMg
 1jz89iDb9Z0Nz229KKAxws+k+5aFN4cV8B3lrxG4TN5xLBvGWGLJz1HoKV/492kxLUTRn9xxEhC
 dd4wKRN23Y4YBEmN5xTTVwkQMIKS+PoZuhLtOAi7iDo6lfaGWAsQQnc4/jreL4802Ip3qQNcJIM
 kimYe5DSR13dT4ksAKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250092
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
	TAGGED_FROM(0.00)[bounces-114508-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:alexander.shishkin@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:yuanfang.zhang@oss.qualcomm.com,m:jinlong.mao@oss.qualcomm.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4ABD96C4D79

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 9b3ef73e9cf2..2b26ce6455a7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index a14645b04624..fbb015079872 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


