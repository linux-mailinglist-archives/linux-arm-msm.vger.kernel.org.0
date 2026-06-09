Return-Path: <linux-arm-msm+bounces-112227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 128AMLQ0KGqQAAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:43:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C3E661EAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:43:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Bplrk6K6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=I8823T17;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112227-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112227-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAF093216723
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317E749250F;
	Tue,  9 Jun 2026 15:32:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699DF48B373
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:32:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019179; cv=none; b=ZDssGRFtF3i4E79s20JJ3r3VVlcdPGnIJ8BwnAaNXQlH9SlC5MyBzRrAO1e1xEddrPIAtokEZFxdScEAUmZmoz867EexBaWq0fgTeRxMyTg3Gw+krNtXj6e0fT8NyUgbOkcgZTvWxaxxKT2Vtdca6BSdAkJSi80sUESzdK5zNyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019179; c=relaxed/simple;
	bh=VhUpIZusEDwNFbqFlc2LibIE0jDqP22f5bKnLwzbnmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQoit11VrimCP1FVW8Ix6Fo2+gfxLcLC/MZlkSeflF4dP1ErSwoyMgKD8yZnkRXrQaqmNBDXTzif5pTB7B3Pj7amGneVvv4FA2STVTlbm7TGwx/8idGTHCo0IM7OdTIT9v02rKt0xvwzOQIps7360n4idutOFJhyDbb1BpuGdWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bplrk6K6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8823T17; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmGfg2587825
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WTvP0lPke9tdXWHBSp8VVmCBcodaAo5HdZeUd/qpTIM=; b=Bplrk6K68e8hUO1I
	cDeb1LJ6SG7fIslSAwW3xMowylIS9OX22CGqR8HIN306WKETv7Wps+4eyx/OHorU
	ozv098GLKJQX5W+RJOyysGBidcKsMASHHespZPFaJ291ioOwgcYe7Rn2zMgKechO
	0NeU0WKPElh1PMcBK5rLCA2zb1INfZMiWKiPGUlzJxw4XS+E+aFuJQ8BbOmucrRy
	IwwATNEHkI2VlxevxGMxZsl69D0OtR26/xkbgNVeBSQfJ9fes+phkWoVyBjojOQ6
	GXHISFi42y4eqGuHbTJQXiy+Wp+uf4SrGK22w3Ytm6hFeWNAqLd3Rozgez1Bh0Cy
	0Ur4jg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4j7bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:32:56 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6f7f4e47eso8728567a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019176; x=1781623976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTvP0lPke9tdXWHBSp8VVmCBcodaAo5HdZeUd/qpTIM=;
        b=I8823T17Kfb7a2SCvtPrN1m8ncicikukpM9qH3DvuTHa+5PWxu9ppYHI7KxZ4cy+/s
         a4YC5hKBbxKJCeMEgiggWYJKvH0a/Ta5ZbyMJdFYNFc18ufdbThaczWQyVl2HS0FaDPq
         YshYwvhGmjDpApxquEkQoGBjhE310f7of2nC6IKr2aRtl6K7hawyLploSL/XeyINcse8
         +vk6G9CExpoY1fhbeb1N/D3GvtzY5+HPA7yjtSDBwWH830+iwg0IRl8NG6Rs7NpDcb/u
         7ZDORHTGcD9x7NEHp++SXtD8+XZsK6Kd/Wbf8+fygsfRADeVn+k1QjD++RzGCtxI7Nh6
         IJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019176; x=1781623976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WTvP0lPke9tdXWHBSp8VVmCBcodaAo5HdZeUd/qpTIM=;
        b=ouc5sucFMitamCeatdaUk4dzQsWLor8K6PCV3EO9nIHOJzloHojNEOyflZmcygbK/S
         4oDt2SxGK4nAVvK3EJagKliMk6PmhVDbdo6seNMLZE4Ci2rcVdn6Tl+H/zYgQu5pTN74
         pVaQWCpx9rP6V6EKzECzMNzpQ3b6dG9fub/y1rKgPkiT1PmgbYF3zAu1HrkJQ/n25qeH
         lL2TNtCX06W9ybvCxbrfbzHsSL2hvHO4gNg2cxjNd0/WON0ahBFWwkcJhn4f7qSvXZa8
         Y92B9rd6xMUUaR4GpfkXFCyE0HviWSMMCiGRS7rkZ8T6KN4DpyBoPNKBw1GxkDOuMbII
         JghQ==
X-Gm-Message-State: AOJu0YzTeVjdj3OxyPxNh4SxHfQpfdSC+Gxd1D3+SD5bm9K/UtiDDeZ6
	sHiSV1NXw3CWq2GTxyV2vG1RAcdcDNkBurA8VaLVxHiRow+fd4eSEe72ymOEmgmmB52wl3aTyWO
	vOKSO9ov+O6Qqn8rw59oG+4XEstQbvmMOFJ5qYXmqIDfWZwQQK8SqPJ/YzR1ql4LF6DsG
X-Gm-Gg: Acq92OHrcb5BGZXWdFpFBGXQgPdPMUi00mbMsfhjv7MzU8RkMn0fmlSIcTIbfnt2e5I
	1EArMSkvS+5FsQpvhMySxWJdNq2tNLpb8ExhWV5rMsnqp37hL9H3zAKKnJAVJfknVMzYo0R7V2Y
	M/+JK9zqAhrneinwhsp8yOxGO4f/wjgBDi/mibkpIXVNtvDr0nVLQ8GW+f9Bd6nYcsyEnr+Fkf4
	jYdi5jGQPxKOgvvfJDpt+TZTWHCj8e3ouepYZ0WAbaXpAlRpKV4cngx6aKj5L7n7AejvSg1dk6p
	dmx3aMQcVwEP5ImNBpDmVVDUZKmXlVvg5N9mP6NHheI5ZeqOuqapgP+V7/mdvSKFR2hDXX6H9zq
	XIYMjNN4EfhxfOZlGgRod2qAu51KtyVYCIAnPitBgCPP8Lm/bicgcFUwg
X-Received: by 2002:a05:6830:270e:b0:7e6:1e3c:912 with SMTP id 46e09a7af769-7e70c5c188amr12136459a34.2.1781019175557;
        Tue, 09 Jun 2026 08:32:55 -0700 (PDT)
X-Received: by 2002:a05:6830:270e:b0:7e6:1e3c:912 with SMTP id 46e09a7af769-7e70c5c188amr12136384a34.2.1781019175057;
        Tue, 09 Jun 2026 08:32:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:32:38 +0200
Subject: [PATCH v2 4/7] clk: qcom: Make important ARM32 drivers default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-clk-qcom-defaults-v2-4-0c67c06dca11@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5676;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VhUpIZusEDwNFbqFlc2LibIE0jDqP22f5bKnLwzbnmQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIY4Pfn5koudJH+mfnjIyKNZEyH+Gskr2Qi/
 Pg35c9Ft1KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyGAAKCRDBN2bmhouD
 1z01D/4jmDMsz26CKN+LYCZcjTH9MlvvLWZHkPeGIyVg7AO3D1HCVFsT+DmnU/0xXtHM+k1cZe8
 SXNbAyWF8pDNKPjvDO8bog3jkSsnXua8vrX4NeCaY8coHalKtxA9Pvp9u0qeOEsvXgkPgK7x1jt
 +HwLKGuR8k5GdvyIokFOkZ1VkDH5FY3JC1vdK7tcIfVhc7IIu0CXr5S1Vb52eVgTtLhPPu1DV4e
 qhmnMoYLuVJcFG3slwCQa2KVJPJ6gULSIHAGl+pTI4qYBAo5S23HWS+wJtFg2nADJiTLVwsAa73
 I7G5CmBYeHvC58fwt71/JS9jFU145yd+yGYuFu3oqCHrNnYQTWEPdkVISPH2U0OAX2WWmvhWIUa
 VnXmnlB20QnT2a5/OBa/hW9FtoMLd42wjCml1bTqdkDpoPo9RqSoPlof/f+c3bp8USxLQg1p8rs
 scAUFGx820AREfkY0RHRTQzfrFg01Rk/sumljTn7IvC0BTsskEpDsekuxLcIl+KcbG0A3t14uzd
 eM+dMLNsHfV7ONMQUfrAt45j0xGuLNfaGu58LBkxc30gJOVAeUWxQ6Ztsa2UAwBJ2hexOptFQAr
 WUYqtbHrnWGsYKpo0vbbGMa6WMIUKTpQMtCGyGP0lTMO3+5nfDF++K/vRH9wareKC550NZjqu6V
 xl1Znqdej071O1Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a283228 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nVu6gHFLEUU7Sl8RD4kA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: ukizEveFx3m9UVj-3nRQJhpgShUuQM4H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfXxiFi2iXSWZLG
 KWr6iDy0HRm66KT7DlRyVd44/Qn2hPeaIugUbpQITjsnZLGQbZVsUOOcOQE077hCU4+sA/3Lehv
 4O/st8JUBY/NO6dIxkA71iPejsn2xhtoxxCd8CswqR9WGm835iY+hu4GetYFGEI/fwVJSUxFpY4
 PQtvQryooO3zF3CTp37p2jgvvRobICLjBeUEuOkkyoN5O/re2ipkttWHQqnw3Pa4QE6vSsak1f4
 1YDwaO1gTfL3/C2BhyX6MkbbAm/LHAmiDHeOu8pVsuf1kG0l/RjYmKgG9P4M86wunM0ZOecMoXf
 Xju3dgLsPUlP9TqJY0K7EYT9qSAQ3JXvNdmviQmOWl8FRF4MlIlwdEMM9fMKg2BdyNY4LSEI3WN
 IzX5B1d48+nANmU13AjrSAJvwqT1khxv83xqML7nZRIXFjuj9YkXIDxmo5d/E9h1YK9eT57EuMt
 oat9hkjoXC1LjtWY8fg==
X-Proofpoint-ORIG-GUID: ukizEveFx3m9UVj-3nRQJhpgShUuQM4H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112227-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68C3E661EAD

Clock controller drivers are essential for booting up SoCs and are not
really optional for a given platform.  Kernel should not ask users
choice of drivers when that choice is obvious and known to the
developers that answer should be 'yes' or 'module'.

Switch all Qualcomm clock controller drivers which are chosen in
ARM 32-bit qcom defconfig to a default 'yes'.

This has no impact on ARM32 qcom defconfig and ARM64 defconfig
include/generated/autoconf.h, however enables a few drivers for ARM32
multi_v7 defconfig: IPQ_GCC_4019, QCOM_CLK_APCS_SDX55, MSM_LCC_8960,
SDX_GCC_55, QCOM_CLK_RPMH as module, IPQ_GCC_806X, IPQ_LCC_806X and
QCOM_A7PLL.  Enabling these on multi_v7 is expected to properly boot
these SoCs with defconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 drivers/clk/qcom/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d8281ed68dc5..ed969553649c 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -249,6 +249,7 @@ config QCOM_A53PLL
 config QCOM_A7PLL
 	tristate "A7 PLL driver for SDX55 and SDX65"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the A7 PLL on SDX55 and SDX65 devices. It provides the CPU with
 	  frequencies above 1GHz.
@@ -280,6 +281,7 @@ config QCOM_CLK_APCS_SDX55
 	tristate "SDX55 and SDX65 APCS Clock Controller"
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the APCS Clock Controller on SDX55, SDX65 platforms. The
 	  APCS is managing the mux and divider which feeds the CPUs.
@@ -289,6 +291,7 @@ config QCOM_CLK_APCS_SDX55
 config QCOM_CLK_RPM
 	tristate "RPM based Clock Controller"
 	depends on MFD_QCOM_RPM
+	default ARCH_QCOM
 	help
 	  The RPM (Resource Power Manager) is a dedicated hardware engine for
 	  managing the shared SoC resources in order to keep the lowest power
@@ -341,6 +344,7 @@ config APQ_GCC_8084
 	tristate "APQ8084 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on apq8084 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -351,6 +355,7 @@ config APQ_MMCC_8084
 	depends on ARM || COMPILE_TEST
 	select APQ_GCC_8084
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on apq8084 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -402,6 +407,7 @@ config IPQ_CMN_PLL
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq4019 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -456,6 +462,7 @@ config IPQ_GCC_6018
 config IPQ_GCC_806X
 	tristate "IPQ806x Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq806x devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -465,6 +472,7 @@ config IPQ_LCC_806X
 	tristate "IPQ806x LPASS Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select IPQ_GCC_806X
+	default ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on ipq806x devices.
 	  Say Y if you want to use audio devices such as i2s, pcm,
@@ -533,6 +541,7 @@ config IPQ_NSSCC_QCA8K
 config MSM_GCC_8660
 	tristate "MSM8660 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8660 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -577,6 +586,7 @@ config MSM_GCC_8939
 config MSM_GCC_8960
 	tristate "APQ8064/MSM8960 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on apq8064/msm8960 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -585,6 +595,7 @@ config MSM_GCC_8960
 config MSM_LCC_8960
 	tristate "APQ8064/MSM8960/MDM9650 LPASS Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on apq8064/msm8960/mdm9650
 	  devices.
@@ -611,6 +622,7 @@ config MSM_MMCC_8960
 	tristate "MSM8960 Multimedia Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select MSM_GCC_8960
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on msm8960 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -629,6 +641,7 @@ config MSM_GCC_8974
 	tristate "MSM8974 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8974 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -639,6 +652,7 @@ config MSM_MMCC_8974
 	depends on ARM || COMPILE_TEST
 	select MSM_GCC_8974
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on msm8974 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -1212,6 +1226,7 @@ config SDX_GCC_55
 	tristate "SDX55 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SDX55 devices.
 	  Say Y if you want to use peripheral devices such as UART,

-- 
2.53.0


