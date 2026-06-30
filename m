Return-Path: <linux-arm-msm+bounces-115369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8nYUC86cQ2qCdQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:39:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BA89C6E2FF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:39:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F7C9rrU4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bkdxzens;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115369-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115369-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2055130302EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEFE3F0ABE;
	Tue, 30 Jun 2026 10:37:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D8B3F39E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:36:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815822; cv=none; b=kEyke3iU/f743kbI+0tZREk0jqtBuqIxvIDVR1Eq6EyQEiP1JnS1BhZS2VTGCH9T0/c8sF3i7sADSF3aB0jW5rjBliIGaIt7JFCenOtD2dRjwLADhqe4vWs/Z0UGqnYMk/xF2AB7RohrOke0PdLC/U0tlPws6MwM7pm8oWU4LA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815822; c=relaxed/simple;
	bh=uafCeCPRUDIbJ3JsxlFN0G6VRVGMk4SKQJs8XKTSXuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q24FxH1FXImrCkDv6TQ4mvJhiEBWwdP6aVAq8Fj0z1cc37Uqs4Gw5jX7hWPTuc93sGlOCHuziVnwDnYR2reeSFRbMYia+lZ+z7HFlwPHpkwyZxDeM7Fpe4tWzi7lb8BvgCPMS6Cwl1eRNuK0YpWqVSrP2t45TRuoCsf7cf+vtU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7C9rrU4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkdxzens; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxQV1613454
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=; b=F7C9rrU4ADibeHIz
	LckDKVebRoZ/eetdxIPh3GNAbmwnBinVxhSnzms6a9OMatwHo7RvVvVIq1nCRbU6
	un9Mu9FV8CeUcsf9IMHbsayGfbast+pFQ8QNi1tmle/RCgc/vg9GLgGuQypsAaIC
	+jLd2HAr9wR7nmglLaj5qKunaV1dnFKnpyLydxE2Pxns1JRrhj3NV7nzaZxfnJOr
	NPd+FwWBp56uz0Aawi21xSqrBXtFos79Y7vZqpSv8E7Jw6KhqezkrGOE7+T10tPt
	xz6XcnAMFaBF2GUkYVZl99WGZGW/X2NfMjJVdSIXCifUEbV6jxZx58xiJzHnD0x0
	ZutLEw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cubsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:36:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-846f50381a6so1411523b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815818; x=1783420618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=;
        b=bkdxzensUWRKeJS+yn6O4ZhSQy32ch6FZaJ3aOSXniK4vj301XK60BlFwXIsN8WOjQ
         /M9WhxqJ4F/6z/N57NyY92PqvXeDxcwB9eAiLWcuSEOfF3q6T3Agxy0sKMvMxIuaS8GU
         M+VWLsFZQZ7Tb9vZWySlK8VjzchJlB3E7ZxpiWAkH5mo/IZPTdScwnyNMtcs17wEpVNM
         33vdQsFmOALprvQzBh8/HOOZ5MCKGJOepkM3SYTw8pLUioesQVzXlqd0mNy4V59lhfGZ
         W28ZyoIdWxmwRjtHGA2bs1cFrWqn+xnyW4Q/fy5rGOmnEeEiS2Sjm0zbKkPMCPEwkUoz
         YSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815818; x=1783420618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=;
        b=cW9yzNF51X57yIbCtTQFQZ42AGNJZh9gU+2akCuM0ZfbFC0VNIZQ7fNBB93GdtnEcY
         Dd7iz1cgO7q7wE1GZyXS+Tl41cg27RwiMbxeKqCu3tOGHvd4XtVIZcS7LOR6WIfyzPm2
         Sf9luuUiTk7YOMbzlppm+9iV+g2H1xyRd1RayVDrRvwNn6U8yooEIgEXSVHpQG5SZMM5
         uAb9RdZmwyTMMWOSiJjXFQbgDycaTeIxV/okXPMQcEu3NbRedkZgYxS2UCcg31kRgCJg
         Y+4nNikvCRU1BmdbxET4Uq4uK6u2hFc0InIpLymnURPr3wNxzmsee2WyBSq/ru4lbeJ5
         RCjg==
X-Forwarded-Encrypted: i=1; AHgh+RrDzTkz8znTFE1B6z+FtfGdwppFbkO812R5pcBHZ+P5L5gNvzl/VC6SIBmZZHuJa7PmdUgIXfJetxrO4zon@vger.kernel.org
X-Gm-Message-State: AOJu0YyFJN/nfLhFWqwWpDxfyazLAgHg3d5Se30D1XlyhpjY6SR6H5KU
	qYq5BGQTP2quEy/UuNrVUtUuHDt+mNWbyE3SjJl8cXyMlg+144EUIf4LNISzjpEEUwcKG0xM0mY
	ylkozG7/bnfOxmF5tqHSWFwt2aJXzXbvZcaghbZRvI6Ftpn7A8qNuCX4fe9KpHjkPLkKC
X-Gm-Gg: AfdE7cnnT+ArI46AvUaBHoob4B4KuGO8rJcmP6rurzcdMNA1Q52qpsmf76I9M0rGqrL
	G8P8skVmEybomIPh0Ho7QnE4Jeznv3IkshTy+ADnB65KYI+Ewew6utcPJXf++RACvvhGhdIDRcA
	YCApPLxUR2Lcy5rERr2U99tW8LOgbSUCXXtAFGb7RcwVxyCYsL0dU5281IFja/7ntqIcfzfW5Xb
	R/ykCFsDDn+x84bu9KO2kRCkPAyEN4e357CnEowvKl6QiRQGuER64Iv3HJaIYtFQTTx/Awc0rcg
	/Owsy9RtWF4P1x9+AnCcZ0WWjaKesEYXPHbOWTiYzCx72zT7y6dKRzhdLw9ZAXvQohZG1/OfvPx
	vD5jp+VgdNK47/XfnLX+86dgw0ccEPk65SksvYjhAXm8EfQbx70+EeqPclHWVWollosMxzHO3zQ
	==
X-Received: by 2002:a05:6a00:4b56:b0:845:e4d6:bd2b with SMTP id d2e1a72fcca58-8479f277e17mr2455247b3a.48.1782815818050;
        Tue, 30 Jun 2026 03:36:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b56:b0:845:e4d6:bd2b with SMTP id d2e1a72fcca58-8479f277e17mr2455228b3a.48.1782815817616;
        Tue, 30 Jun 2026 03:36:57 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:36:57 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:36:03 +0800
Subject: [PATCH v3 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-1-7201e1841e94@oss.qualcomm.com>
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815804; l=2337;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=uafCeCPRUDIbJ3JsxlFN0G6VRVGMk4SKQJs8XKTSXuM=;
 b=JIwVOvTjthVWmGNBgjc4DfL0E8A502LDkwLjqcBDlBCXBDdgPBYJ7z3UrL4Kh6ZKCrs4WxJ4U
 wqcw/PQKjyiAMCodp+1nCm6qMmcEtKJo4U+B9xGEvhcs1E2388xMy6D
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX1IkvQ8iDk9oO
 KKjTys+sF2+syeIX2xLKFYXKcPYY7JdFqtjw/pEUQ8ZiyNk0UnA6LD8oHI8jYaDVyP8oKGl6/0f
 Rsx9BbRT5vF4u7LJYKgPMhq/91D/DxjXv20UrMppNVQVRcenU2MyPRhQDN/Bzs8EXs+VHQ2qz7v
 hNSGluntdUhXL3bL1ji4gLtvKGkjG3V2lqG7bQaUAIfeZJITRt4pkXJ+v9GKFtJ6hL/QpbcF2yL
 3sDd/yWTiJKKn4U00oC5XmOgt+W7Wp1Vo1O9KsqJp+qwQ2XIkcOHkMxCF+RFHkJEqN4FqRp3dpW
 84Qu12x6p5HC5TQsn+VGfXzKqoViJ70Ag3qPu0Q9E1FMZxAfKHXDYq0m3JwZrY7k9jWVHuU9f4l
 mCVJ76EhckG7pdsMJwbezdX9S9P16ED60Rg9sQQeaavjmEPqiXZQpBU81Mgf/vALfYKs7E/K8iL
 kbUBpwdu1CIntFpjvEQ==
X-Proofpoint-ORIG-GUID: m7KI-xw3Ztxe9mh1lZABGbysLHiFy2oe
X-Proofpoint-GUID: m7KI-xw3Ztxe9mh1lZABGbysLHiFy2oe
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a439c4b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SQ-coMCA98RGVnoR9hcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX9hezWqMadZ/t
 +nX/rou9bQKgruPnVDiCh235cCgFTYbAY3a8mAS3ZLrtZ/+4IRxUdHIBYtVH6LlvyRqm4JwDHnt
 wc2kceUYrC1WoAkCpyE1sg103Ii/zrY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115369-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: BA89C6E2FF7

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


