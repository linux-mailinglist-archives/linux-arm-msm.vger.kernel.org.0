Return-Path: <linux-arm-msm+bounces-115370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5+QtO9ucQ2qKdQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:39:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9D16E3013
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:39:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WpVntv6J;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b44ErqdD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115370-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115370-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 83DA83036C17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0388389E02;
	Tue, 30 Jun 2026 10:37:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01003F4138
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:37:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815830; cv=none; b=OnluiS/gwnTAjQndTWmXrpWVhAhTodS4w2y/j7kveL0n8PLKdsNZiosANrLhjxTK9WK5EsWCV+v707OFsiWHQjp2orK9KBqIUnPwFemlRs+053g52ksn0HuUPDKNt+zBhKIxhyy1c6a06ZWRbMrMYPj6i+lJruvMj63pJziQ0xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815830; c=relaxed/simple;
	bh=33uEo4UJgPbPMMZuq8e5HQE+sJ6R6/JGUnMwJkekCsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svz37wn5nA8VW7wopnxRkaipwefdkAXY3c9dNe9IkNRYpXNtM/lS14XD+LGPH4qw1mS7XFlgI0JocVk6xIzZ2eKb81N0JWfX8T/evViY8J3HOW7gBCNpMhjg4CKEw5oLuIEKVrA6BPO5dASQBGsrTmpBi6i7fwB+Kxl3BzKa0eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WpVntv6J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b44ErqdD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n9fE1605965
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ccqq1qUvXleK1gCp35AxM5d+eMHG5Aas2iW2dgCZeys=; b=WpVntv6JLBY3v36o
	YM+/IO9SsbQUJrDEWB75l1+osDf5YEOBSVQK+f85Jc/29AeKVCXDxa7knRLJKwYO
	tiVPgVWeMYJYkPPne6M07kzXsXY5C+8yV6tqPUs19ZEMdxPAGQKNSMkEJNb1nHqm
	CvBPswjcrbneDm6rzeQnFi/BslNMn3p9Syyv647nOIhV8wx55hCzn2ZUYy7dE8cI
	vdG6R0eD/5iQfWLiNcyR3xlNOEl442xU4jlBwvtifzbPVPcKDYyqvF8N0Bs6mtmD
	bdKGbUMxqpsJR11ZM9+Dl+j1hdqiN4jjuTWjVkAm+BCu1tPszehxuRYYYKqx7Dfp
	cHoM7Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5sur4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:37:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847a90cc5e2so295045b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815824; x=1783420624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccqq1qUvXleK1gCp35AxM5d+eMHG5Aas2iW2dgCZeys=;
        b=b44ErqdDYcrYfvR/4Lg3deJfeYVOR/iQDWGm0HIlPpmIX+ek4o9LpJAZDJDBbjxdzj
         zP+EV45tFZ6pqmCCHLLz76MVQuS3AIoYiUbqgRkmEz6o6Ixp5hnFD5ScgkvIeWPBCiwX
         auBJH9nB7MFhCJhXEhfccwPCaltss8ep/sXvlKbO9OkrckUffuhsWKPdfZFCgB8bv1Q8
         W4G+Ka0stvN9P51kVQjmO+QxIk8SRbUBLo7qq0EH99sz9sBh4TZ7jnHdyTvP7ZoGOauW
         6LiemTkFEh8EsyHeZsgJqQYfEikHfnX/ZcomnA8CSDynye+wSk+W3uHNJeCEB2PZQKlM
         IAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815824; x=1783420624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ccqq1qUvXleK1gCp35AxM5d+eMHG5Aas2iW2dgCZeys=;
        b=KBG50AOMk98pAaMYEKDWl73Hhuq7QItk3InGh3r98hR2QJ67n9kULPJQvovvzTC1db
         J8m+TnlK6CJrNEFMsOBeUic3NhBIv4PhyNRYyG4NQq56U92PQamS+ESe+uBU+cHRfyk5
         PZ7XYoqnbH1UsGBHX1SFXbiC1+xerVdJ1HGxAVI6gAdXE2Afnu5Jg8dkpxhqlhpIwDIR
         /Ld+5le6XHV6zP7tWp0NEb76DD0OJX3AAe0BdqzeCvwgPjZDNmT0+9mk4arQs4ecTUC+
         E0Q2ja5QUKbsYG5pZHNTDKBkOFOhr8s4GLfopglhryv+eJPFTEHR4N/Eb+W9n4yyMNhc
         yuWg==
X-Forwarded-Encrypted: i=1; AHgh+RrSg8nJ2AyMC1ArQHpXdDIHkIl8nn4AQEEL9YlKQg6jbk15dxdebE3lB2oK4MdgToIIc9g9hH6t6lPXbNc7@vger.kernel.org
X-Gm-Message-State: AOJu0YyQeAN6RFusHzqen2hgtHGw/XxGIeHghUdsINDe8coiVosj04F/
	nhiZgpoX4THl5wyedit5Sw9Jy9zP3JKt0PnqoUMjF1qv7BKKn6EL06fuszlBKLUZ5cck+oLRY7d
	MKl6p/7pbh+yuLTj/9ozOPF6weL/FGO7Q+ASANzwseA3jteQFeZPV+7/RvPEiVRMOtOGd
X-Gm-Gg: AfdE7ckjT8DE1Rx5UpLIBX4t/7OqGmAJHOmVph4x9RPwjHEyWhue/zx7PHZENKCt9bi
	P7JKEJL/KsNzCdFuIxQY6TOFRgJrlhrhNvB/h/HmIXluoJdtVvxtomL9/UU4blJ2aNsqqnTE5ku
	M8IupbNiYo2enLvYiLTyAHHzAYRp8eFyC4l+fIWiuHz+2NsiPq0wl7W2b3vg59oyPox2rBXexi7
	4U/2S4fDqfLeMGz7B0bd4ihYGxOEQuIFea90BTf3HVnY5n2IyBGFr+r/e95R5XRS8LRLBtFZLRx
	gZ7BhlIBiOWQydwteasHfc9eKb0ZPP9EqiuB+LI6p+btjdKZBR1wmJd3WfXUqyKgBdEypQo5fsn
	t1xz2GAljlimzSg7XJ5ggHibKSA3F81rsWbWsH0/6eTNAvUs3/j2YflivF5byWj2tyGhiyve/lg
	==
X-Received: by 2002:a05:6a00:3391:b0:847:8f0d:cc0a with SMTP id d2e1a72fcca58-847aded7b04mr104102b3a.41.1782815824460;
        Tue, 30 Jun 2026 03:37:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:3391:b0:847:8f0d:cc0a with SMTP id d2e1a72fcca58-847aded7b04mr104078b3a.41.1782815823968;
        Tue, 30 Jun 2026 03:37:03 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:37:03 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:36:04 +0800
Subject: [PATCH v3 2/5] coresight: tnoc: Add AG tnoc standalone compatible
 to the platform driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-2-7201e1841e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815804; l=4471;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=33uEo4UJgPbPMMZuq8e5HQE+sJ6R6/JGUnMwJkekCsc=;
 b=nNrbjemV8d+J6IgHPQfdSuHPIpGliTr9spJ+rmcrEEJfxdY9BFmrgGSbniTFeKZZUQzBMNTRC
 5dgo2C1vWTcAw4iG0Ggrg1ThVtoCRTwPfdQcBtLMLXQt2rj4fqUf6cO
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a439c51 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=H-CQmrK-EWR9bHiRmqcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: ClzUi-yRE27sA7Z1H66pVJMRUg78Dp3i
X-Proofpoint-ORIG-GUID: ClzUi-yRE27sA7Z1H66pVJMRUg78Dp3i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX6Xy40GTVBsYt
 gYYqVXuQSqXpr0NNuFlq18d5frcxMfpCW7ucYX/n6Y+CdI8OGqDUyNM8ShPN4JmPVqRzv57a5m5
 cfRpsOk1PHvmQSLDtrxpX5r7cvOmORGpsRo/+qZBjc+yT6Pn1zrA6GFXtFpm4j4ayR6INi8hMTC
 edQJcCd64d6FcIq3UYTtMZhWv3hgVDeiFJCDesUeNH9p7XmUce15eUHrNjoTJ/hiyboQbIGn8wM
 +7nARQpFXuGl731ZFl/b495uSNcPIDvAqM9LDiONXbXVmCnkFH/gfR14ivyC4HwwQE8krDOE7p+
 J5weF1+e+/8jcgCt4cdAhnNIwjaEpBmzWgatxhfMAyMZlHCj8qrxKzr6kMTi85Br0tBG8kLSgYt
 +tPxQEIfVgC3IfccGZGI3PX59l37w60btTNL98OC6lkt6oqfzuwVDbUa4wEYW18M9KhciQSLt7K
 r922IMH1ZM8xVG+OP0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX40B+QZokfWc7
 IPtKDhlfnYn0VSSMOCHGXIsS+kfAuGQh6lOSabNG+1Kr6of0PaMXFBjc3pegKp2LypYPbmDfE4R
 7GR+x75lUpHDyOW5194ExXnQnSWNxiw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115370-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 8F9D16E3013

The Aggregator TNOC can be described either as an AMBA device using the
"qcom,coresight-tnoc", "arm,primecell" compatible or as a standalone
platform device using the new "qcom,coresight-agtnoc" compatible. The
latter avoids the AMBA bus and the associated peripheral-ID probing.

Add "qcom,coresight-agtnoc" to the platform driver's match table so the
Aggregator TNOC can probe through the platform driver, and rename the
platform driver and its callbacks from the "itnoc"-specific names to
generic "tnoc" names, since the driver now serves both the Interconnect
and Aggregator TNOC. The platform driver name is updated to
"coresight-tnoc" accordingly.

Restrict the ATID-unsupported handling to the Interconnect TNOC. The
previous check disabled ATID for every non-AMBA device, which would
wrongly cover the standalone Aggregator TNOC. Only "qcom,coresight-itnoc"
lacks aggregation and ATID functionality, so key the check on that
compatible and let every other form allocate a trace ID.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 35 ++++++++++++++--------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..8237467faba7 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -130,7 +130,7 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
 	int atid;
 
-	if (!dev_is_amba(drvdata->dev)) {
+	if (of_device_is_compatible(drvdata->dev->of_node, "qcom,coresight-itnoc")) {
 		drvdata->atid = -EOPNOTSUPP;
 		return 0;
 	}
@@ -278,7 +278,7 @@ static struct amba_driver trace_noc_driver = {
 	.id_table	= trace_noc_ids,
 };
 
-static int itnoc_probe(struct platform_device *pdev)
+static int tnoc_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	int ret;
@@ -295,7 +295,7 @@ static int itnoc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void itnoc_remove(struct platform_device *pdev)
+static void tnoc_platform_remove(struct platform_device *pdev)
 {
 	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
 
@@ -304,7 +304,7 @@ static void itnoc_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM
-static int itnoc_runtime_suspend(struct device *dev)
+static int tnoc_runtime_suspend(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -313,7 +313,7 @@ static int itnoc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int itnoc_runtime_resume(struct device *dev)
+static int tnoc_runtime_resume(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -321,35 +321,36 @@ static int itnoc_runtime_resume(struct device *dev)
 }
 #endif
 
-static const struct dev_pm_ops itnoc_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
+static const struct dev_pm_ops tnoc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(tnoc_runtime_suspend, tnoc_runtime_resume, NULL)
 };
 
-static const struct of_device_id itnoc_of_match[] = {
+static const struct of_device_id tnoc_of_match[] = {
 	{ .compatible = "qcom,coresight-itnoc" },
+	{ .compatible = "qcom,coresight-agtnoc" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, itnoc_of_match);
+MODULE_DEVICE_TABLE(of, tnoc_of_match);
 
-static struct platform_driver itnoc_driver = {
-	.probe = itnoc_probe,
-	.remove = itnoc_remove,
+static struct platform_driver tnoc_platform_driver = {
+	.probe = tnoc_platform_probe,
+	.remove = tnoc_platform_remove,
 	.driver = {
-		.name = "coresight-itnoc",
-		.of_match_table = itnoc_of_match,
+		.name = "coresight-tnoc",
+		.of_match_table = tnoc_of_match,
 		.suppress_bind_attrs = true,
-		.pm = &itnoc_dev_pm_ops,
+		.pm = &tnoc_dev_pm_ops,
 	},
 };
 
 static int __init tnoc_init(void)
 {
-	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver);
+	return coresight_init_driver("tnoc", &trace_noc_driver, &tnoc_platform_driver);
 }
 
 static void __exit tnoc_exit(void)
 {
-	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
+	coresight_remove_driver(&trace_noc_driver, &tnoc_platform_driver);
 }
 module_init(tnoc_init);
 module_exit(tnoc_exit);

-- 
2.34.1


