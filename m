Return-Path: <linux-arm-msm+bounces-119126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 81ypGKXfVmr5CAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 03:17:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9506759D5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 03:17:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZnLn+WJx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=imcKH9HH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119126-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119126-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F7A030BD56A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 01:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01C5371D14;
	Wed, 15 Jul 2026 01:16:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADD0370AE2
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:16:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784078207; cv=none; b=QpoyjQuHDlU9GzHyHX9wOjk+4LIC4Toy49FBlndD6tJePzsfqrziwskdvbEqSTvJ5HX4EuMw3Bwxse9yhBFsMJCy1LAbL9UNDScdJjTbItucGXHPonHbZDu8pmaBUAVpKv9WVre2ejKEAXa6SczcBCxjiBrRrtPQaPlz9ut6Zt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784078207; c=relaxed/simple;
	bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tzYqYAWQQ8NUF45G8N4AekZYGTmwPH2Pl6B0V7ZnyvyPtcjA26a3/B8frG1QvegsLtGV7nHZGhxps9taSW1WfLwUh+RzIxngSbjDjrNjakv6syO6NvOAAQ8fcOC9fxVEdaKb29+WbHD45VXvwc6IbGoGaib9lXVKfLQfG5LdNcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZnLn+WJx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imcKH9HH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IBxU1952073
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=; b=ZnLn+WJxNHdNzF4i
	3W+cZF6RmtLpCQU1MTWdWGxgW+Q6CBk/MU07fBZgetR6321KC6yrX1rD+AOHGSaX
	EdXPiHEmTXhTfCDDmBRQHt87jtRl5yDKBbwl5bOM4L/UBDQ1neX5SoEHhr2XutDh
	zQMGegjFmLXwcbb5Koo6EfcF23turYDZF4N5RuiyCQEI8vtlE+3k19WHEorefctb
	jG7zaUtupi1AkGPSEzKPGEs0G2RkqrK91/l1y7IL+Lu3WE4W3/UoHq5kDlatiz2B
	os8mJ7Wj25cnFlcVf7c48HnVoQuLUtlkQYN/EyRVMdXgCETKe+/6Dy/A/+K09yt0
	pKQn4Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g1d28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:16:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso6172529a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 18:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784078204; x=1784683004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=imcKH9HHxyrC2Oxdq5HPT6yEgDl1L1bnYk28YU2hXnsWOfi/o8y+koyYPkVh5e4E64
         rHwJ684xDAiJCGF+5O/r04wqCUyPbvt6j7tfJaPa3kuY9mC7skvlxrufNax00yRi3ihk
         SeCOZ3v7j9UAT49rfGN96tzqAZ4tUVXSarIKRxHBNOPwOCc68OY8Tn8aIQ96pagg7EIi
         BAMl4DAHz7GNziW6cqgCd0u7YcYsDEvY8nRN3WmbbcrM3Ws3MXBJKo0KjWEk/eOaEUcV
         wxmTY9ohPapJDZ06bIkPJO+6qymFdUD49Kw3KDYNFkRZwmdkLFQJS7GHrel0ZYA2wTAn
         S19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784078204; x=1784683004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=KWegBQhAGkfwmJDerQKVtI9MF9pSi6nJztf3/EP6hDUHYmeEW6RLxjyxh6XVpk4FDg
         PCpSUYIooM6QviPBbLtMsUPvr4jqUUfeWPXvPhBV6jZ6Lro6kuz42ESUwH6oCuatYEuS
         HYHWfdZm3p/4O3NkryAorO6xy/5hDcxAH6xac9T0xs3dRRCyOl2kuOk9CCpSRlKCGLqL
         RtLiMSNLEz5O0q+i3HAebeoBxG3x/wMsgXzlqp2XKrKX+VOY+gOMzKcwXZ9RvPwsYDGN
         6QexxP1so0o1I0CNXYsAbwiQBNv5EBC68sh5oJ0v6GdabPawaNMSdpxgZoQBl2MRiI36
         5hKw==
X-Forwarded-Encrypted: i=1; AHgh+RpXsUT2syKKGtgpT+mx9IGU/1VbG2MdF/07DSZW1hFE37GjTD9XZTgmGSQDnrPqFN41JqXEuYeDCpRZwRrg@vger.kernel.org
X-Gm-Message-State: AOJu0YxLfOuRfp7JXKYcUq7BzdkXYcNmuenhjbCDxsiJhfQyycGA37Uw
	AselpWt96NJh2HvsQF0B4bZylektZFzMLp3qQt4ZDaiKP0ybiQ4xikz2RJqLSjRvkxxKIOIDd7e
	/Zh4GnQsJK8vC9olGJEClYQU4oun9xDvfi+jygMhUV3Td0gZkOKNsJ8JiA8ze278wA7W4
X-Gm-Gg: AfdE7clHEIbr4e2TyaEt1cASzRPqeRAq7KS0hVxFET6IQFF89U50Ggh5dw7MzP1WBM0
	QDUGnZBpQKIDaUb/ORmJeHkCCpJ/zRqmcy2ZKgFDTX+e19O41GLtwg6bxw6VMIIuq37i6+40qWl
	H7ODL0wMeWtVqz0RISUUhg5Igk+3DhxjIjq7glLCgtD0a0n+kTUcfpAgi7yYgxlq+embRhp8rK4
	cjL3i8OsWcIJlCai1oTS+OWSFmg+q7EcWb4RpSFTBoOBltLAHSsq0tIqvcSkqZN1un/rl1Kw+2O
	LBm4oawEyLVz6eg1ZTCO4oSSCoRJJQ5XTGCszr1nmPGW6O70kd8K6Z3EAUCPq/Dyg3g5DFjqt0k
	R32GenP6iGEkZ+0BWgs5vTzCxKlVEdXp1g+IRWciI5VCWYhg89L6PSz3M9hNgwnmGyjW1lPfSDg
	==
X-Received: by 2002:a17:90b:3c8a:b0:38e:baf:6087 with SMTP id 98e67ed59e1d1-38e1af3fbf1mr4250310a91.35.1784078204360;
        Tue, 14 Jul 2026 18:16:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8a:b0:38e:baf:6087 with SMTP id 98e67ed59e1d1-38e1af3fbf1mr4250282a91.35.1784078203859;
        Tue, 14 Jul 2026 18:16:43 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1745a3fesm2207487a91.13.2026.07.14.18.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:16:43 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:16:14 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: add CTCU device for shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-add-coresight-nodes-for-shikra-v2-1-ebd485e39a51@oss.qualcomm.com>
References: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
In-Reply-To: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784078191; l=948;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
 b=WtyqlZzA0DXss5OsWmivd5DeH34exJbbEApd5XxCJO2QDiBWm7Js2v6uEFquGfE6CkTb+Abn9
 iyXf/b5+j4XB7vlIZQ9mF1ykxlBRUym8OWoSjDj47vk3A6GEOOUaG5/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfX0xgvPIushzuC
 htKcyECD115MkKmZO0qkmgluSiNXCzeZsJ6o5KnUAsbCkpLkbrVFroQI/PywTdGGTl9YAixCFOz
 uQ8rbMW7S1gzulp0xsAHDR3Jhcko0K8=
X-Proofpoint-ORIG-GUID: rFBWJGTVg_2AMmVVjZSsrqGO7lpI5Axz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfX80NF/yS7v73A
 DG1OcOJ8GB58Ru59RnHZWyjmbu/ETr5ZLgx9GWnRyS8Nd0PNNnQJcvcruBmGsnZMhEF5BBlLLtQ
 CMC9c83TTxYvax0Ilbc84yCx8vw4FFRzZHd8Nt0rSM/2AoSv08pSsyDUtK6QEgNHwLGV+Eu4NZl
 a/u4WR7ql7swgsvo608faovdSAPI7/d98yVWfBwZCUWWWRvxheMOB1M48fuFW8hGv4ZSwSTq1zO
 X0alRlHoFuP7oFNFonxbqFLvDgBNzRts0oPSTMn/B8/h1XWcCdPjWDpyQqQD8/2k31qx6W1ea/D
 e/rA3Tqt6hiWzjzH6O2kr9Lb6lUVW1JZVugOqPXxCGo7Yd9hLWpvlhijT46NZWbxKY6NPxrBOXF
 rRewc6jqeXzSdWI275EnFqbDmhXFvpOY/Tnc9Q02urnrFBxDruHXR6qVjCLZYvyqfJ/N7CjbIPF
 yMfvn/cDVOXBzwAGSKQ==
X-Proofpoint-GUID: rFBWJGTVg_2AMmVVjZSsrqGO7lpI5Axz
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a56df7d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bwSPl2VgRa2lNh99CM4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150008
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119126-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:yuanfang.zhang@oss.qualcomm.com,m:jinlong.mao@oss.qualcomm.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:jie.gan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: C9506759D5F

The CTCU device for shikra shares the same configurations as SA8775p.
Add a fallback to enable the CTCU for shikra to utilize the compatible
of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index f3f3feac4ce2..335a8e1a5a9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
               - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu

-- 
2.34.1


