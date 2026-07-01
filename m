Return-Path: <linux-arm-msm+bounces-115558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WkTgIHhzRGoIvAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 03:55:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E556E91F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 03:55:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IxQnoBnY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Zwe6XWPz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115558-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115558-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F1B9304D702
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 01:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B95A40D574;
	Wed,  1 Jul 2026 01:54:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5066E361641
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 01:54:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782870864; cv=none; b=G7e3JflpPRdsVg/tLILk+nMyX2uN2AA8lZ5KIM4Aeanw3Ifzb6d014WMg+g59p+t9KC0iFUWzmldGnQr9sDjRQsyfYabXmAkZkS9B1mivotf6Ag2IW/IN+/Sl11Rn2layHcYb+xyf81SCC/GjQaave7AjvNFkze8VWN1ltHZQhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782870864; c=relaxed/simple;
	bh=uafCeCPRUDIbJ3JsxlFN0G6VRVGMk4SKQJs8XKTSXuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PxGagyphvz8dnaEgAuuBusiLOlEhdjbsplSAkIQISXYTQO61nPKySUp9KA/aIeVAvw87uX0yWLFf6OTdthGhJKJVqiv0ULkjg61MFMVOJsdv552cT3NjDaRPCykyqa6NPfaJzQVnit8ojhfvc68rnO8XkiXNC2DjJoEBAd3bJcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxQnoBnY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zwe6XWPz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNM5uD3494631
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 01:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=; b=IxQnoBnYLCE0xjJ/
	RkBsQiaBvM3+mcEbx7F+Tb4QsRG3As3v4rkSSbRPYOiyBf+0wzyOZGG3BWK1Qbwj
	0rA+aL1mmQS882X+LEueytoEVA9vSuep7o4FwaahqgMrBURaD0G6i4YxXsFx/pkc
	PkGs681eWtn3N4v2uP9jiXu0Or45gbkxbKOy2QNdj6htApD0UJsZexW+NjnYjREq
	vnyiwnZfsXScTV/vohSABBTLguj41SezfXy9z2gmxu/kpYj21tg7B/ZjkD7NBOd7
	N5g6AAfd/D+hS0ZlVgw/vZux3o828Fs5yUX/YzsS38c88/dAo2/EbBwbcoDudv8m
	7CsbcQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jkt9kkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:54:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca0d4fb061so1886845ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 18:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870861; x=1783475661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=;
        b=Zwe6XWPz9rMW11DMfRMoQUTeg0BcBFWpaqzgLMH5JQeax0DhYOm2vaCEKs+hIjeNxT
         CDj5jjRZb2xnATNqsYDVRoIOiT66QR2G0YWGhtz+rVT5QkP8xgYU/cinvx6pys2U9PpM
         qXqFEg0AcPO93VAY6rP0MQBru86SY2n2dtvfyyum9nVxVNvg25RGGKDksfgNOB9SN4m9
         aQ8vmtXivRIXDJIjOJRg7BzK3GG8mDjNFB41+HNeraxSW4rT5Z0YBKy2A9J6P5OtLkGm
         pIi/UrS4aDj0kQIlGXxChCSGdlShFO2yJg54rtUaGYRx7YB62Mu19CbqpkGv4+wN50t9
         fJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870861; x=1783475661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=;
        b=HSzS3pCb9Yi7tshS2eKIamviJih6m4XLwVXPeUD/ySgi58UnpkLGF8xr/AE0Npk1E1
         kf+GJCvueabfM6z4LMi8dry6ZLulIIpoltPTuuXpMobt2tzu7u3tQ87UXqB27+kfSczz
         TSJsAkVs2pNJePGhqwAY4fLvoSOHkr8K/TjQYGvsbbRqQAgZJZN8SbGNnaZReRSCSpu3
         8c0+n6IjQyXrEvVJDGyjjLonVa6goVjEfSIjDVAbKezwpmenqxlg8EGUt9/kIwY1Jb9w
         c8jIXE8L9p34eZfKVFyNwqmBcpKhO7f+rswkZDoef6c9yr+NJcokz80rydrXsHzpavte
         9j/w==
X-Forwarded-Encrypted: i=1; AHgh+Ro/0zrIMZPX9XuIg7tsHiuYchxIesz8Z82KbogrFTocosEIcAiM4cJQQmR8pPGocr2Qr5pF4Yskt7B9UIym@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4EWuBMBl4mmGDonU2+tTSPVcCWpuj2ogmD5rI3UplSRX89vnY
	btGXTe3uvMGK27aJ79N5Dz2o+Oj2ctGTGlZcwnS+4MJWqdZ1+1ONf2jRPctskTocWEJfjuVjcnv
	Gwp4BgVvzX4VVkD5ZnrsAp40sQBnDLmndpG4tmgeEIVr8W7AgFGXqPgY0eeR4U/ERqMuw
X-Gm-Gg: AfdE7cnfeM+XC/5LCeMsmSt5Aa/OBfBxcqdU8V5DGMW4/tnhwD16dllCjTaPPaZL+Gk
	335v4vi1HZN8nzaENT637G58cHOdi67OgzZzqJSsirzP4pWgH2uSPUcfmx4zjjvsVGMCGQn2ZTA
	DhgQFo6c7bAuuhMYweKCVeD7RQertlCJEfZcBxwNkiOEkZIIWrgfJkxVSS8vF/g7eMS8KxvJY1Y
	taW465wRGWGdKO0IwKKkjvPYENDqZ7UwEUYj/nYDmLhF37V9SLsygDxf+Z5+PSSLKxEZ7AXruYa
	Yh/KbORSR67bs1Uk6AhVPlwcwzD3yEKvtJoTFeaRH93fwW90C0T9Zi+yy3Z4HzuXBzH/UriZYqQ
	Y1ixA2DtSOpnxNh5dWbqIOZ3X3f8dY6ByTH4K5wLdWjqYcvGhNwJJoS777pMnFsA9wuwyO3b/uw
	==
X-Received: by 2002:a17:903:4405:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2ca2ed3225emr47983605ad.28.1782870861305;
        Tue, 30 Jun 2026 18:54:21 -0700 (PDT)
X-Received: by 2002:a17:903:4405:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2ca2ed3225emr47983195ad.28.1782870860759;
        Tue, 30 Jun 2026 18:54:20 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:20 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:41 +0800
Subject: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870847; l=2337;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=uafCeCPRUDIbJ3JsxlFN0G6VRVGMk4SKQJs8XKTSXuM=;
 b=+n0qnK+pFSH04EldYDI+hf+Zxgas6gCR+hrbok3yDDi5msmYlbV1vYiQa2ihdiT3LHOdGn579
 KLEO6OdJqi7BV3Vi5aDpmizSZHWGrdXVuX9w2gJHpTjKc3GXEstDlp9
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX+Ae5qqTrISPY
 OsNNBXRJN40hWtCa9Yv7FdyQDK5Z0/g88aVSkkAOOdvnDOHeyx540YPbNFsJnRJJ187bRXLgG/g
 acEtAp59fm+/RZjA/twcDVAMZUSCzBw=
X-Proofpoint-GUID: AJfPuz2xSphz1l8aj5VHpgg8FWmz0HBR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX+wMKdAcL/XzA
 dQ8hJuAVT0dfcmoYmGipK1AB8b8C7gX1g1L4keEL0/Jmjlo+RVz/P3pWSGKUc5Z8QrlPV3JuJp7
 HIp+VEbQgb9zyXrTn087xp6dkfH8gDJIxhpxcJFWPSVFCA3H/27VPnpLizEmdBzpXXB8fJcXREB
 jO/0QHBAtsG54z16LSj3oGFwyda5oOAFdQMzlKfIe70E+Nj76Ny8b1dyKpuZZTHLInLRQJ2FsTR
 VQZzO7KdzO5Y1F1hM9fkOqDRJWZwrU7zD/w81YXJKIfQbm6sO+HeGmspyDULgHMV/pxGfsINFME
 xt+eTOgyISFCkQSpAmtdnsg4VM3xfpAgAkys86ejUEb73/8oDnhTct/GhgWaHOrFgwuIivIuibJ
 t9nAnw2uMLmLprVvBdvvdjdGdafQqCbHw7ZrPwIshWXGygfzy9wAWhhyVfBkLrXK/bSm0Y3EaTj
 5J1SiXG0CJd/uE23lOQ==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44734e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SQ-coMCA98RGVnoR9hcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: AJfPuz2xSphz1l8aj5VHpgg8FWmz0HBR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010018
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115558-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: D2E556E91F1

The TNOC compatible previously only allowed the two-string AMBA form
"qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
AMBA bus.

Convert the compatible to a oneOf and add a standalone
"qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
standalone string carries no "arm,primecell" entry, so the device is
created on the platform bus instead of the AMBA bus.

Add "qcom,coresight-agtnoc" to the select block so the schema matches
nodes that use only the standalone compatible, and add an example node
demonstrating the standalone form.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-tnoc.yaml          | 39 ++++++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index ef648a15b806..7e6e4b17a6c1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -29,6 +29,7 @@ select:
       contains:
         enum:
           - qcom,coresight-tnoc
+          - qcom,coresight-agtnoc
   required:
     - compatible
 
@@ -37,9 +38,11 @@ properties:
     pattern: "^tn(@[0-9a-f]+)$"
 
   compatible:
-    items:
-      - const: qcom,coresight-tnoc
-      - const: arm,primecell
+    oneOf:
+      - items:
+          - const: qcom,coresight-tnoc
+          - const: arm,primecell
+      - const: qcom,coresight-agtnoc
 
   reg:
     maxItems: 1
@@ -110,4 +113,34 @@ examples:
         };
       };
     };
+
+  - |
+    tn@10980000  {
+      compatible = "qcom,coresight-agtnoc";
+      reg = <0x10980000 0x4200>;
+
+      clocks = <&aoss_qmp>;
+      clock-names = "apb_pclk";
+
+      in-ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+
+          tn_ag_in_tpdm_mss: endpoint {
+            remote-endpoint = <&tpdm_mss_out_tn_ag>;
+          };
+        };
+      };
+
+      out-ports {
+        port {
+          tn_ag_out_funnel_in2: endpoint {
+            remote-endpoint = <&funnel_in2_in_tn_ag>;
+          };
+        };
+      };
+    };
 ...

-- 
2.34.1


