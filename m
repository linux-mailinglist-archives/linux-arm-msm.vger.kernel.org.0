Return-Path: <linux-arm-msm+bounces-115372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TjTqMDmeQ2oFdgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:45:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 218966E3159
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:45:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="MeRfrcS/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UXofhbYc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115372-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115372-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 261B330CD518
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7A9182D6;
	Tue, 30 Jun 2026 10:37:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5B23F54BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:37:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815842; cv=none; b=L64vgLGJvROIVjEs4usRW5MpliaHQr/61Dvb0P6MyhWuiPLtYFTBFJSGmijTEdSzL8q/nxun3HHCHTSYi9GpzT5YZ08aiCjRAix7mhooyIwJWawqkWjw48RJGq8kak2ctCGR4A6I4SqsSRtBL55ZZyPOnM9aWMkvT/TS/yXVwRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815842; c=relaxed/simple;
	bh=3fON6TjZ2nEd848+J/DYzHWC9pCmE8J5utGZa5iaXgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=leFlTL1p7dNDJhw7985f2BxkgqtNNsV2N55GpqrlauitM32xMQ6k8RpAR2J7cPtNn8l8TYOezYxwFX7hXo73h5U39oAa5NYPZMRTLjbQ31+tYXC2GZW2WGp/j0yU2ayMaNy/jvDcyVjWti0SXUJZ1TavsjYdZLEa1/NdxiEBE/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MeRfrcS/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UXofhbYc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nCli1606446
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Bog9bBvqmPHD/SPbNJlYxw3AmH1QILp9mUTrZ8ifQI=; b=MeRfrcS/dNGA9sWn
	k/QHc2h/4JrjGZZJoGVNg589P4iC+JbYaSHjf7KCrWpXMBd0tq8+eoUaqZTCgIXD
	ThA2MfhM7YCPS7LKgJtOtUrJmEU4r2cgRDCdQms2S3cT0ixReVlgSI+uraoMABUE
	SCzCBeJQFJ0gm0H3R7ZTR28rhlv+ISgo/J9IDLRQCKdl15MsDvFoU2FwJmUp98ba
	qRLcLf34sdNjHilntW4O2pTt/v5g+7bK0FTZgOyO+z3We+BRzwlujhRI/d8Z8/xQ
	JVdhSVYVr3DFUXSYF7TmPYVHxyITqhodcNGzkh705En8wReKCrFH6FT7dq46kung
	JVg5mQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5susd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:37:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478423e020so2542713b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815837; x=1783420637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Bog9bBvqmPHD/SPbNJlYxw3AmH1QILp9mUTrZ8ifQI=;
        b=UXofhbYcW8iojjfIC2cFD26ubFmeohT3A9mixrnbzg/cVn1dU8a9+JOBIHctWO7Ywy
         CYLYzW32jpAvAXANS8BCpNXDb43Iimg1smTxMieYNTTM1sp7eDmjgbjf5d9voPJ+f6PY
         IVcG4tYz/QFjCbcq40MehtJOhwshrUUQg3VgVXTNzF7TgNB/D9ZnbTHmgzdfFkreTXwc
         2ndmBIrYJjbZ9qNsql/gL2lWHzgn1qfZaHh3dnWC629gvizaBfwLlkibX1v0LwU/1TF3
         SYz5vnc5eRyNst5LmfvLDBHi3OuwLMk3e0CSAybIjLLy5qSC/kL1stMJd6g1IdYGNeez
         QprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815837; x=1783420637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Bog9bBvqmPHD/SPbNJlYxw3AmH1QILp9mUTrZ8ifQI=;
        b=dTciC5P268+e/EcaxqDNvAXmsYGAiiTvc1wH/z2+d0maZc8WL5JrYtF16dkD6EnCxm
         MFLNXKC0feX+QK57N8X2RLohbxl/aWVyBg014fJ+fGhDMhSRwlreOVMMvpxTGtpg9ebN
         UZkfZDvXr2/AhJLTb86XKmVrVlr+gKir7p3lvkNXwpiSJrot/EHXnNAHt5QJsm2UjsrD
         btbwPFVavjQGrFXNLmrNi0dZhWccJQPVtVs4ONDKQkBid7NI8OtXnTZE38P3IKyb4zZ9
         cSPn77xjegoWYKKNU2MmZilucqGCgBNbpdd94tIgyb1rmkZw9j2GzJdzhmJILeHywDvm
         CMAA==
X-Forwarded-Encrypted: i=1; AHgh+Rraj7iTObyPFwFez+FInlrrI5Nohhpqt7L6vJRLfJHalLy9rAVT0DNnx/DMu5S0elbx3q3y8IivG30vPcqi@vger.kernel.org
X-Gm-Message-State: AOJu0YxCwTLOTIcYJ+RniKFObT/EArwxozPrWZDvYpmEKOAidTeW4tSO
	oDnXj3ueUgljdNE9D4KnsM4fJpOBrZeag9aFv5c4v6X/5x8E6GcIqqvJ6Zp3ouczlsLeZib1YDQ
	t19eyioOm5J8RYs9yE1iFDype+GU1aQXAAvoVfYh+cFuJn2RSSREg41kRjH115Q2Q6Yt2
X-Gm-Gg: AfdE7cka/R56isOK8tIiI9CrrjyBCIO9HFp3U0OLvtjWVDwDHA5jy/kPk6fr1OTpNn7
	nKqarw0p3B3xhQvV0MO2emjlWvAna1DyJsPZRgmJ/EZawa6IO5dm47FfwaThyms7d/ihaj8qKHw
	3EQ4Ar4jh9VDmjM+A7CR/heO7hcuqPucQ+Fsn4B9bqanEXKWHqOXUnuocUl2mwrm4bN4mmX8R0e
	ItTKXLNy4Fky1vRIgK7Xfma9tWu6bWofiupPnhvea7TekqYrKOvttlZ+jxFrm+LnZc/NKPqVCI4
	Yp+qiA/U5+Ht94bv5fn+Oi0j/lWFBp7KXRTzE6zaVemTGCR0YLrHBxw6M76hXzoiNlkOhJo1wn2
	Iht5ziLFMthg2uldTurQSiM+OFfKQ7A9xHcCrVPXSb3AOQN2o3owjkW0p0fUiW+tfqujMqPEdzA
	==
X-Received: by 2002:aa7:9a83:0:b0:841:dc8d:8066 with SMTP id d2e1a72fcca58-8479f27b428mr2431805b3a.39.1782815837169;
        Tue, 30 Jun 2026 03:37:17 -0700 (PDT)
X-Received: by 2002:aa7:9a83:0:b0:841:dc8d:8066 with SMTP id d2e1a72fcca58-8479f27b428mr2431790b3a.39.1782815836700;
        Tue, 30 Jun 2026 03:37:16 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:37:16 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:36:06 +0800
Subject: [PATCH v3 4/5] arm64: dts: qcom: sm8750: fix traceNoC probe issue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-4-7201e1841e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815804; l=1196;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=3fON6TjZ2nEd848+J/DYzHWC9pCmE8J5utGZa5iaXgA=;
 b=4PewfliGY+OR8SpxKIQ0Y/YO0KAfeJez+GHTWzwcVoY0cub9IKTIyM4LHizFRR/4xDjaWcJ58
 pRF0HxlyKaBA2apTuiu6HXxVKMT4U8ajQTCqmVTdV6aNi1+KZ+MQ8AT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a439c5e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9-n9NCBYjeJb_QXN7LkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 96-L9iJpx1kWeOJlMvw3UyXfGJxEbx-R
X-Proofpoint-ORIG-GUID: 96-L9iJpx1kWeOJlMvw3UyXfGJxEbx-R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX1O1OvA3buImj
 2BuqsDqC54q20m81mU/5bx8f42cS95ahBYE2waXPnrRZ+YLm34u24SGKOFTADOLy61C5lg3EMAv
 3Zy+04FAW3jMhHmRFpKz8HMuCoQSDNJnBJ4w5UcL403c9Ik6QzhD78ZlIwBlZp2jEMfKVWlQKON
 aqZ5lD97R0jLd08e2VboEix0OHZjzRIW3ZjLASmcjb9v0/b5zOBPnMZ9+1pX7zk4l6Qm8RWMENC
 UnE6e5coLoaFv7SfoKrKab4FRKv5CEe209361HsZ4Zo4Q2a3LKLn9y2Qf/Y5n/hIJ+zDUNFzktA
 zFYHlXcrGqYindtp1fgJhZo2dqnO1gCq7pRBIUJireZAKkYTtP4n8LEsM3tMpzEQV/myCOmSH9C
 pBRPzQvjmuT+UOIEyz2asYSFIB5fhrCEUqpHLcLT3S/7/2hTfJ12FHW+8dawlO3alC+g5vYzu4U
 s9ftV7eZgHKwuQryQfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX232PSZ9v8YUU
 lB1rLaxg393DzzNVKDnrA5GfXKhvELm8IB74K4ycB4LhM17gkEld4W9Cxiufm63GpvM6VRGdHP2
 GaEdHm7vlGdGAXh8BSzsa3I8mJKj3tw=
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115372-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 218966E3159

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. The AMBA peripheral
ID probing fails on this platform, so the device never probes.

Switch the node to the standalone "qcom,coresight-agtnoc" compatible.
Dropping "arm,primecell" makes the device probe through the platform
driver instead of the AMBA bus, which resolves the probe failure while
keeping it an Aggregator TNOC that retains ATID functionality.

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..d58483f9f93a 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4687,7 +4687,7 @@ tpdm_rdpm_cmb2_out: endpoint {
 		};
 
 		tn@109ab000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x109ab000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1


