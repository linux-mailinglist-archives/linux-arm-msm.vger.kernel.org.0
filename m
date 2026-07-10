Return-Path: <linux-arm-msm+bounces-118123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I3OPLOhbUGptxQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:41:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59237736BB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:41:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kzGFM3fh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JXZZ8zkx;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118123-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118123-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F33C8302D323
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 02:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F2B31F9B1;
	Fri, 10 Jul 2026 02:40:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4D350276
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651230; cv=none; b=gtgKQWG2Bu9/Rr2hCBfIuxbupM/RWWq/ridZHFTP0srda92nn3u5Ws89Cj6DyVwyBzv/V1Ga4nJ6pTn5DNOMFwcd8zJi40nV8dADpOwpq809F6yPW8Hboo6jAh8VNNUhR6SW7/nXCPl8jGwzawVC4WYkRGB/5SRz8l0MIIHUAkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651230; c=relaxed/simple;
	bh=6SxIbCzVB43Q5gQOLOs5yrmATRLuGa4fNKmIn7mrhsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nmMglF4G8Ll8Fg1a0G7t/kApM/qOGGCJd52hM8kgW1BW5OD5KglxZXU15Up28gsgSgfRrs3ZWbaSXDGNp94KG8D5D/8+fKXhmPivG2XdJB5kzDTWd0IAYCvNI3nqM/eh3dQdQcxQv2VCbXhpGKszzg76CDJ4x43fm7VXgFVYLcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzGFM3fh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JXZZ8zkx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWqJp2563406
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fmLmkU1YQaMHOUF56Fxlmr/AeBRPhfqt1YSrM4LteKE=; b=kzGFM3fhaAn6jTjX
	53uhY/ZgHBfQh6PzZV2cU/6cRJV/qV0eow2t+6nK325ahKFczpnL+7NgJLyWRD7j
	76/EgfB/+ZeR7TPfFy9SgPE9JdcTqaafLAO0qlY2ekQ7xLwU2YX5HByCQlvOdvd1
	8zVPImqgJ1jb9z8Iw/pu3pENbNhMwQyXi+c6JHc8vaI3jLaRQKosK3S4Pjii0fWZ
	xNkpQueE3f5czDJMYPyROHy0mwYNJj5KmEWl0lV9i3TUhXDMyg7CLvsIGPWs4BnV
	1CgmquQBY6DyhYTJfF/xy8/FJzWbVK1SCXe+jlJhTAcm7nV4waKMqGeQWSCec+Kz
	4SXFBg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3jceu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84854c2f888so778837b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651227; x=1784256027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmLmkU1YQaMHOUF56Fxlmr/AeBRPhfqt1YSrM4LteKE=;
        b=JXZZ8zkx5YXX3yiGY3C98pLMjJRlYnDKQNY70dYn8TCUPmAHVYWMpm6Vfl2mZ5CoWD
         oTGLEQUaBLZCPBHGgTcl6xMsvxY7H/UVmreC387W/m8cUItHoD91s9wDyrgFdhykGn3B
         f1llsNY9EluVD5oBgXEsJfqXfyuJiwtiRBsMCKTByZN/2fOlRX/WIGl4zNbHU0xZkKxf
         8C4+9Fro/r/Z4JAElopH6RqI51t8USRD0uuJqMMKlDqCKFpCEt0uU+KP2JHCbQcbuwsX
         67AY2VSeT9mzw5FUdcbLy1uJh5ZJQtIcKMgLfZaMU7H77GVSxlc2o0RNUUA7hXE15mlG
         d99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651227; x=1784256027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmLmkU1YQaMHOUF56Fxlmr/AeBRPhfqt1YSrM4LteKE=;
        b=Mtq/mAPnIL7JvIoeXNxavpuCLkHkP0lyScwyMoXYvSiCxE5GTMKR9wBf69T3DSJkBg
         CU0e4iNPxv1HRmc/AHQ7xaKgO7xUKHNpeTubfG2+RP1CRDtM1P7eot0BOYmSfYut/C8O
         rkO6TYKZi74Jmn6rx0X4dCcV7fj9FwillTgmNdQ4BYq92lnUCqstNjRUGKtrgBgyOcGX
         E23FedUvuvm69WQxcrSE/tKWTmC1K9aCmj0LLtufwrEZhjPFiz9bKvYfRettMrkrlaf6
         wspUY4siz7borN+oDg8ZMhG4ry8nBhBSgJ93JeAgILfiAKZ/PpT9cyXGScKyztLA93UF
         O85Q==
X-Forwarded-Encrypted: i=1; AHgh+RpTNc9+KOgotG4n9EVn/FGosZOUrlikR0fZ5Yc9phV0br6vBU/nahG81SJGMWg5axcxbNwITOfu6he2NQEs@vger.kernel.org
X-Gm-Message-State: AOJu0YyDgkIIPQ+/VaRE/uxPXpkBbE4nu94VeR+5/dI0hU2W/0aoyqk+
	7E3QQxUwSzmmIhg/K6oYym28yUudbLMSNemtemiljkSPznsxiD9/cQohdqxLZgJKsfj2A981Hfo
	Hgljk9kvmt8zOCkcU5h0eIcJ64VeS5or1suf/LQn+EASlxoV96FZXCqDLshcm8nmuNBfd
X-Gm-Gg: AfdE7ckalDHiWbf9Ucvb+dvRI3zlglVLsOCR3xhMhuPFfxx53DVmZqs7Z67SBqa/pCy
	ea+CO2Is52+h5xaIlOD0mCJexJ3FeOQoJuK22WW2nT1B0LFzQQ4nHWa+bKQtr79soKftl9y0ZHX
	/06ecGPtH4fNx9c6pke8DMggTjRkb0j5pjBAIy0Bwp+DMNbI6T/pxo0bHmAZnL6/mXUKRK9dvu7
	mkWGS7nBcDgLiVXSBq8p8wPnlgh2z/YTdoqxQrJuDmUJUGS2SJk8tqmWP86EZKTgXIDoDQFeONw
	ob2f1QUlF+fnpS3a+UNba23ciVeEVXVUkV0dWwHamuD3BktflxMp0ZriYy2Tig2x+SCIAkNR4JP
	WMOzZOHZRwWZN4FVm7vHNJtyacZ+wt8tZ2Fcmgx1UA1cjsjIMwdzWsUI2fzdLMDRopj2hTIVq7A
	==
X-Received: by 2002:a05:6a00:8c8:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-84842e8f2b6mr8945869b3a.0.1783651227045;
        Thu, 09 Jul 2026 19:40:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c8:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-84842e8f2b6mr8945831b3a.0.1783651226566;
        Thu, 09 Jul 2026 19:40:26 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:40:26 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:39:04 +0800
Subject: [PATCH v6 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-5-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651186; l=1699;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=6SxIbCzVB43Q5gQOLOs5yrmATRLuGa4fNKmIn7mrhsg=;
 b=dbHuilsW4KxM+/xj3xUsen5J+9wy2lfD6bFh1ZEENRS60E3sUsXMnDUWzpcow2ZRroA77ut4o
 rtUALoX0HXrCQjChr6r9g53qvCpL4ZowiOj+mgLseTGDwJJ9VRM3f2S
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfXwuG133R4rfAK
 LwNiy6z2h4ohKGfuDZDqtiTd+psuWsACfb0KQSI720Qate3vSJR1Mg8gTXHB6ZSwm7+n8yNvPqb
 7oax4mzTnoqe1aZvkJDfPcNMVFSdnK3J/regPvXeqfGwRVEKgD/GNMM3j5CX8tXvxNmTfZ11uZV
 qXl2WgHxjhRxo2k3xSMWvBo5LBom1WvSjZIl3cP+kq9PBvzo5FK1FDw/QM43R1rH1wKZwqT1eHv
 4ex0Gf3b22kb0GL+p8tHoEWON/wkfVkbPvmU++JggoYyH8Z13jKt5BgjIlvVSYYsc2kzBCuLmf9
 PeZN8oiu7xwQjw464zaA4G3F9gX1RGhvEVrLhM/+UyxDW+aIlNLAzvZXx5f7KDUPzRxbkfuX9Vw
 17PZrs2plZ6dfYD7KfbSRJ8U4Vr4uyJGmg9+7Kjv3wIAM4cHf6FwwiFj6W0Y+vfmmtxt9t7UGck
 wxTwOAKiYL/lYrjhRRg==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a505b9b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VopqNUcg1dr8wGNk0jsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX7yYjjifJCUTS
 7EPw0/G241uqMHCHCs4lSAHOISj58Nj4BvjgLHN1hcE5uh7JjgWm521K9qu7HqVQPZvaMnA9yki
 +ONl5w3vFE1pCeVrp3zio+nPnZJBxIs=
X-Proofpoint-GUID: gGkdOoSDYk2E1XkTSnoe67xQueqqGGJX
X-Proofpoint-ORIG-GUID: gGkdOoSDYk2E1XkTSnoe67xQueqqGGJX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023
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
	TAGGED_FROM(0.00)[bounces-118123-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 59237736BB1

The traceNoC node is the system-level Aggregator TNOC, so it must own a
valid ATID that tags the whole aggregation path. It was marked compatible
with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
an ATID. As a result the aggregator had no trace ID and could not tag the
merged trace.

An Interconnect TNOC is a subsystem-level aggregator: it merges trace from
the ATB sources within its subsystem (TPDMs and other ATB masters) and
forwards the combined stream to the system-level Aggregator TNOC. It
carries no ATID of its own, because the Aggregator TNOC downstream in the
path already owns the ATID.

Switch the node to "qcom,coresight-tnoc" so it is described as the
Aggregator TNOC it is and is assigned a system trace ID. Rename the node
to "tn" and use the "apb_pclk" clock name as required by the Aggregator
TNOC binding.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..0c04dca5e557 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6038,12 +6038,12 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000  {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1


