Return-Path: <linux-arm-msm+bounces-115371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5AK5HzSeQ2oBdgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:45:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B7D6E3151
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:45:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HI8EC6H0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KmQGuCsr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115371-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115371-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5673A30B9DBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFB43F44CF;
	Tue, 30 Jun 2026 10:37:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C5E3F39F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:37:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815835; cv=none; b=A1soGtzvfrDW06bUPSYuvud2zMeP58XMdTN/dayK+jS7v1wYPYcOjl3bMkfo0Mpxg6VH2dQKCMJsAJy9fBnKPhj0pLKjJcg66dAN/xKBy9eAj+eFWQvCLd+6V/f7JMDT63BLXgasabbg0MS4oCn5wgTdNNvPywlN5txZDu/6094=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815835; c=relaxed/simple;
	bh=HagOjHvvKalPyaoRLhnwxbxe/eeYB5Wc6HvJnYKVRFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=noOjRML0gZIJYvx/DzQs902+Nyw80oQq0HRo1H0d/QJpFOqG04T6o+T1I0f4mG+02SXyDvirrAhY3ZksYMTCFBZv+elNdNsS2iv34TlIGcT803dE4qcQi3KqE2sqWdpFgRSZkAb4g7Qp8sto6lBMSz5zEhjAG7XM+yGXU2ixtsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HI8EC6H0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KmQGuCsr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n8rv1605860
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CPV0Cu4z4WlvZa9lXzKbTkoT+NVZAbTVV3x69Ag6f0M=; b=HI8EC6H0H03YFrdR
	YqFGi1tdZcXtXs0xVQJn1RZt/pZmxE6Iww3lZrn+d94j6JwVt6F3Rq1tHNn7+jOW
	zuuiisgVqI74vBjjgHHgB8YBqX4Ad1mYDSKw456FetKf3s+58QH1/5FZrvEUXWXU
	SMta47BXz7nXqwWiGokJXlHf71tqXPoCFhrQn1ZjwB8Kej7QqbS2qAtz8gmpiZ9+
	FaHAB7BF0PT4sAKDC4sTBJZ87jhmyGtbHBqt5gVOffY09vIp6XZPWrsekV36PoWR
	Hr3PiE9/1r69VKVq5RrxU84lojDv26Pu2l7ahIOXN0LDkiRdCknZD55wV3lgwZ1r
	y61MUA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5sus0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:37:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-846f50381a6so1411605b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815831; x=1783420631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPV0Cu4z4WlvZa9lXzKbTkoT+NVZAbTVV3x69Ag6f0M=;
        b=KmQGuCsrHP7GQOTCmcFxpb6GJANOFMOzUXRC2p0Tqv2g9tf4/YUsCDiulOqzUfBfLz
         OzfgdbUA3+VlBAlb+FMoDE2Qw23x4TgKdJjQ2BUp0f16oK1i7DhvRnnbWeCOVspRbghf
         1C/JOVgJXQS2YNF5rcygjYl8svr0ymF7gs1T61a9odnVjYcnT1DznIlPvtijoGkxW3Yb
         0RM9frzKUjD/v8dcWyM65sk4ws+a9OzSx+tTZvibIBtSALdOLBVfZJqCfclrS9aAjCZz
         vwjHdH+2OquKsNuHdWzcJQE6Rh3T4wrqiqzFjztbbguvHST9i1NvTcW4iujqMGUFTKPp
         f6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815831; x=1783420631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CPV0Cu4z4WlvZa9lXzKbTkoT+NVZAbTVV3x69Ag6f0M=;
        b=nPaU4vDwIg0Co3NFsi/zATQ7ET3F4lpl9IUrUWOKSpoVfp97K3L2E3PMTqTMw7C7Y1
         padgoko5IqRDHH35GzgPJTiaBUUE3efG3paxLa1PXUbAEOBbCNiDJ2ZP4Sc/QeWh8j4Z
         Royk/+81HCsCwQt9lZwtxqA9KNUJTzo3JKCUXFLHB7mAg8ygXE13N3blREpiROXI4b+4
         zcE30YaFY2G4RLmneJ5ued9jZGXjgAmLeCKSVBwVRfHyKB0ifqqYlXThlA094PJHsb+q
         FFbIsJBvJQqFAVlT/XirsEw4lEu3MBJpKFnWJaQPIY+SC5H1dg6bPFOAAOs1CjfAxuEz
         Tqcw==
X-Forwarded-Encrypted: i=1; AHgh+RrKYufvDG/F5mABltD5iP9xfFRw4vQnGAm/QeAdkg4hzxvmWN65mbZ6HOAUX0ShZZpNQgL9ysYx1UTcE8sA@vger.kernel.org
X-Gm-Message-State: AOJu0YwyRpHoBWPDjGO67OHCzDTkwtHqN9kkbv7gY+5dP+Wda60B0BZb
	D8MDatabSq8ZPxT2NxpI+w5A+ap1WyNPtc9EFCWqt9olGRDZ/kdvDCcIKtlgTRedrNh3SRih5ZW
	0sSIyNRWukQR1zKt+qwbjB6/SrhxZJ5nG2fE9+AsXTUiN3mJflDBhtRlq7w7+yV/ETypK
X-Gm-Gg: AfdE7cnkHFhQtbhV/OpbPdmoifa2oRjdm3P1RqlyHBWXQ8TOKnwz77D//vxSyIRf+YU
	vj5kHIhFUnk0YaXxM0iSBOi5GpH51BEtOiHwRJDWKKaDNPJhm3VMJFl4SycItYOb59Ar+bD+yeP
	uXP0Bi/deXk1WLJYv+c07p0mToJxfBcjFHuEl75+0V7yXsUGzsd3pV1gd7KtYvTvbqMa858Terx
	GsEp0OY+OyXF1hUT7YIFTBfU4+PxRqY+tY6FGiNmDguwib003AzGtobRCjHi1bBBcDYEY/and/E
	htFliyiNjsH7PER5l45nhBOne/m0jtwN9QBvrTpLO/4FGrG8T9qGNyvfn1+86qAhzcqZnqn0bTC
	8vyAbtgSk5mHTA8YnrfoX6xG67E2kf3kt3h34YcdvVTk+u6lrm+ULKFnwdrSRpMj28vhovzFa6g
	==
X-Received: by 2002:a05:6a00:1253:b0:845:e1a3:107e with SMTP id d2e1a72fcca58-8479f27a8d4mr2349390b3a.52.1782815830834;
        Tue, 30 Jun 2026 03:37:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:1253:b0:845:e1a3:107e with SMTP id d2e1a72fcca58-8479f27a8d4mr2349370b3a.52.1782815830384;
        Tue, 30 Jun 2026 03:37:10 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:37:09 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:36:05 +0800
Subject: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-3-7201e1841e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815804; l=1214;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=HagOjHvvKalPyaoRLhnwxbxe/eeYB5Wc6HvJnYKVRFQ=;
 b=4lZF37zPda1yimqyZLnf7/5YnIJaYzVw6x5TTSBnASYMyAeufNJcTbfRuB0rbMFy0xiaCqNVX
 eJO8CBg95lIDb+wy49Iz61s7gYwDsyG0IxF5ZBSDEd/UMSltfv5+3YJ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a439c57 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9-n9NCBYjeJb_QXN7LkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: URPBDjkuEnFcL7aGPuMo2BPzXKT1-x4m
X-Proofpoint-ORIG-GUID: URPBDjkuEnFcL7aGPuMo2BPzXKT1-x4m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX3AEGyiIxzIdp
 JATe220u+lUgKe26YVfu/6cHK2p7BLkH6bDPMkPCn+BFDMOzUCjaYIGL5W2BBMrvlGv5j6kBLMu
 67P3UJXBTJh0k1g2qVvx28FoB0GgfGnBzsioKXLfN0DAl7ZWE/BQHiULEffy87dvhzbbNsjjjc5
 uV1pavMIpsWvVqktB/Q7ncx/3Y82ZqjXd8Kvp7FTsMEa2MaVUE1sQQkzjNUn8FfPjrJ/6YHuj4O
 r3GiC7rOM30kkKzbmsgWa+NeqXsC4tzHvAdVH56DDkz7KGbMrnnyrsYqsG8qM2/a8ApimO/9o+0
 QqIujtgZyjNUMOMpbWXSy+5fXK2K4no31Cpkctnv1LzEtvXHWhpJipN9yMP0lawxQqJQG44ejLr
 lx0gSt2iKWv0EENAuJ/jVdEMctv46iXYKMyH1cHsBpQLrtmzYL7TFuOIhObf0hUHONUunM/1Loj
 e0OGfb/PYx7qrHPv3cg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfXzFr5r6DJLqxp
 BrFgp+O9aJR3hl3/Lxni/a2ToNIFHhRjM9NGIM43nqLvJ6qWlFQo99kWahdlxEilu/T9h9nNZYT
 nHZVTYgHoAq0zsT8JymCSfKIBdSYrew=
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115371-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: 25B7D6E3151

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. The AMBA peripheral
ID probing fails on this platform, so the device never probes.

Switch the node to the standalone "qcom,coresight-agtnoc" compatible.
Dropping "arm,primecell" makes the device probe through the platform
driver instead of the AMBA bus, which resolves the probe failure while
keeping it an Aggregator TNOC that retains ATID functionality.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..e98f4aa4b141 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5004,7 +5004,7 @@ tpdm_pcie_rscc_out: endpoint {
 		};
 
 		tn@111b8000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x111b8000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1


