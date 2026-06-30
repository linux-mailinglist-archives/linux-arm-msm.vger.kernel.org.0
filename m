Return-Path: <linux-arm-msm+bounces-115373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3E/KGiyeQ2r7dQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:45:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2E66E3149
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:44:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="gx/Ky3C+";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=I9ECIpWZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115373-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115373-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 542A730E1B1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5D03F44D7;
	Tue, 30 Jun 2026 10:37:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A1C3F23CC
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:37:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815847; cv=none; b=B/a6xKBTa5qNfQ5SMIIOLBpdAl8//HBJXUvSKMtXcN6rboKq/g15wqwHaCijHn5Ctr+vvvTdhE4mW7f9/LHG1irgBkRGKos4tuLuPwhgr6zPoSwolLMQVpRicIp4BcA0OsYfkGJp78cNJN3Wq8RxfkiFgIQ+pBr7+sWa4Vr8bK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815847; c=relaxed/simple;
	bh=Gj+QP/Y+EYnERLfloVRJXFv0oSQBA7CdNBDXvdCgv68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jTrnCOfNnwssLHA7NYQMkORnfnEmyLyrW6S/nZyhLU9WCVbOyNnm01Q0cluCA0Fr7TqmHaog5upD/Jj2hZiiz5Cl/R1cemfazPT+QitvHk6DWJAmQSkjgKIhiIr3jVzfjQxkBEQfhkHUL6fBIlma+xk1DSa6DhQ6Hxe6qbRuCns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gx/Ky3C+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I9ECIpWZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n1ba1573371
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySp//vO7Qj51BE+0nF9GXADTwGXQzUmc966X1/StNgo=; b=gx/Ky3C+59pYv6vd
	KlvmxRGsBHGReYGSnPrO3NgKcag5IN/KSSyuNPvqO8VEcj/dx0DCDX0MwlLk2JUp
	LTj5mPRKuqm0cFrHM0+EcmM7gJ2SzipiNc+nsEqONq1clDa9BSbLg6fD3dqbOdKB
	VStcNcKSfjJlECppiIixEfoM3T8awrHkfBqMDsLsikHtOTntBSLBme2ynMRA0JPB
	W86tcxWXlVBuiIJ9B1Vz1ERho36PVyJ6klxQ/PTNZWym1l+YG8qB5CFAABA5cij7
	jrrVua9AX4TFJOaf+a7w9YFt1+kyOd71DnG2JwqaJlTyRovDAKxvHMnFiYizUHSK
	7pprYA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46861pyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:37:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8895156101so2027639a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815843; x=1783420643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySp//vO7Qj51BE+0nF9GXADTwGXQzUmc966X1/StNgo=;
        b=I9ECIpWZeLXKetFPHUH7nAkHT/pTszoSzfqeyF2NsgxCdW4GhwKqzCYpK2d3SUbjX+
         hqVYMzBEiNSOxD02pXnIWhJ/V2TxmmzV8KcvKvtuqd5te+M1O4dNUgs/a5T30lo7KEuj
         cQjqAgj30460xG3dyqN5b3YK2j41AUDYWLXN5OD5wm81WPtDII95ILkREW+GbT8JCbKb
         n8hMjcubliBlnxhN54X3g7Z0Rpahk3KRYgnCvS4Sqk+VWVykrASfkIZEmWh2jkO2MI/o
         4dt9n3NJyjZdgyj/KcL5zq8CpZBQPv2XSQjkE24YoTkVEEJWnE3aP8XUImGE2O1VGsOa
         lHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815843; x=1783420643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ySp//vO7Qj51BE+0nF9GXADTwGXQzUmc966X1/StNgo=;
        b=hM2uHMliOp2U4ZYWSjlNXtliBMGK0IviD7NcjQjUwS9C83BobWTEIbMXC8B6K5J4Kf
         P2ogWBWulVDIwbKSDaavIyFK8dXOhsil72P5vc+DUJZr4i0/0o4pHLo5LJBYZmNcnNEy
         J3up59zHwGPGGKnexro/IMmE6fSBmKAPblzpuUOkwx3Bsb4Yulj9vScnugQ+6/kT3Ltl
         AFbRmoT3U/aPX5UHPo7xywqHtpD/oOE5l7OE+T/SAs7qwP5P9GTE2JBpa4JCXS/Tix9g
         v+bPm7QXfDP1o/5qK1Ac59Dh+bNFKwMf4gXpC4F6kHM/xp+XwrzwiMWTBGHiY2pZezGI
         tLUA==
X-Forwarded-Encrypted: i=1; AHgh+RrCRde2TUqf1pc2+VUuJapUK0xDUf6tgE01K+BFoQySyFsJzCEGQU06iZiL9XhAAFbMj4HEU5JHS3j8ddmV@vger.kernel.org
X-Gm-Message-State: AOJu0YyB0977dAT22GiHfQbUiu6xlHU/yWbdsVgThDmvTDj5KA7oRMgp
	uGl2X6rHMweh5Jdd4J0BmegiZ3tVfn+0/m6LgJaTEmwUO+LXzwGr5A4+csEv5DoJIzGuCEWa4FG
	a+Cu43XYvaT0l8/brcjHc05FeiB2WBlrTtatZ+Z8szvPdxpdJZOqeOa0dQUI69Tn7KD+Z
X-Gm-Gg: AfdE7ckcxq+laB6BZ+N+BFf4Mmyf1p2sPACxdCtrY/owLZ8S/Ds4sQMhAdGPDeUfZao
	ie1Jtpwe5ps8JZDBWa78SG3r9/IaMsCv4tmqnWDzjBKWTJ2wCwPjcDxROJoQD4HCxqMqPLVlQon
	j2lnG41hSRzK/2Z1bggWTliE7e7fb7DCJOdSYoZXFWd32voz+xW7Lu0KVQePaaP6q5G9zo6IDL2
	ZRtVf6abrGWE59sEmPJss9Df7q40UI7wPMKpVM7or0+nUruWUWXiGc5JDx1giM3HqjB9klsUoq6
	dLcobSpUw3+qYQU1va55jlEo/SMrxexEj6XZE3/cMLvWx5BefAQb0Pb0u3V1Lazn8vdFy/FbPBD
	7xRckbhoeqVJQEvAk67kLuv8CB0zjFLSkbBfvyOrHAfVtk6TlHAo+gRsjhFF2jfNQWiLl1gsX8A
	==
X-Received: by 2002:a05:6a00:b704:b0:847:8250:2b31 with SMTP id d2e1a72fcca58-847ade9a863mr115700b3a.38.1782815843428;
        Tue, 30 Jun 2026 03:37:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:b704:b0:847:8250:2b31 with SMTP id d2e1a72fcca58-847ade9a863mr115678b3a.38.1782815842978;
        Tue, 30 Jun 2026 03:37:22 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:37:22 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:36:07 +0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-5-7201e1841e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815805; l=1402;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Gj+QP/Y+EYnERLfloVRJXFv0oSQBA7CdNBDXvdCgv68=;
 b=DIbkhStmFLQL7Dx0uh3VirHk2i+SsbjV8u/lv+oehetGMD3x8pVTZJS6gL49TUp6JC8BRiqf0
 i0ud/ic1AdNAvchGmJpp/v7Q0iZOrobGpQLhjHG+XcYb405dYuaFMXZ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: Eug_-7PSjM3W5wVgXD6Obp1d-xWg3vZp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX7V/TdCxTgQTn
 3BkjEVawSVb9+I2eqvwtEinAMWa45aZhTrYzQ5HqtLTvqjFQ8gcPQvN/ivKUJ6kLJNzJWgo1rNZ
 fOSrRkwxeKmsVliJEyPvJxdSBooMY3wvqWSMRwo8FVfsTcObX+M12VzVKX/ewembnOIcMBMH6wd
 heHr9uOqy3xetDEMjdpxf6WVb4aX/bkiTSjAfgmadUR70gY1DpnmBjRD2dNy+EBo9vAKQDbGsVw
 qNz4RFtpzVOOJ74qSKX3saT+bwCB8yHsleePa+Lj/SCtY9IHqup/0VscWdnHaa+5f18NwnUIMWY
 yXaXZ/RUspMGsJhueBN7+/S+JskKaX9J+fw/PfOF93mTMahx9WnaEa9nkW+zQ8Y3iAtH1HOUV5o
 NnINxQqiCQO9d++LNoRzVlpHtsDBI/lZIzO9pZ56/BEX1/qXcVDRiQcffcG2FQl2z3z/qdwVxTf
 2JXb4BPMbLslmrh7hIA==
X-Proofpoint-GUID: Eug_-7PSjM3W5wVgXD6Obp1d-xWg3vZp
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a439c64 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aFoPaBnoHS3gmuyVzGwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX8quF1/0OOSCA
 OyAsvAtllNQP/g/ZZ+zpWkmQo66qoJisfwNWlLU0/guCzQEesz88s2iJLhXzH//3hq3PsoqctBA
 dKeXabfF87CWU0kfTBUmds4bnh2Flpw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115373-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: DB2E66E3149

The traceNoC node used the "qcom,coresight-itnoc" compatible, which
describes an Interconnect TNOC. That device has no aggregation and no
ATID functionality, so the driver marks its trace ID as unsupported.
This node is actually an Aggregator TNOC, as shown by its tn_ag_*
endpoints, and should expose a system trace ID.

Switch the node to the standalone "qcom,coresight-agtnoc" compatible so
it probes as an Aggregator TNOC and allocates a system trace ID. Rename
the node to "tn" and use the "apb_pclk" clock name as required by the
Aggregator TNOC binding.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..d612e8ed54c8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6038,12 +6038,12 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000  {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1


