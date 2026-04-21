Return-Path: <linux-arm-msm+bounces-103872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDeLAWj35mnr2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 06:04:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAC343630D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 06:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D58C3031CF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 04:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01BE63CB;
	Tue, 21 Apr 2026 04:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ke0TDXzS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwkVyjW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62887288B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 04:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776744188; cv=none; b=EQNKg8yhMQ58hqEKhN2bR7VMDfY3ALFQBT3KwS3BlgjuIqER8TlDe77CiN2VDFMOGKCPI6x2nZwj11yKn1hcFCWau+c60pZUxcxFjM1yC7uVKLZB2PLD0pzaa2/nPpHFlzXP6lTG0z2l1IQ4nadhrwsH0aIhX/kPBW0Ab5JqcvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776744188; c=relaxed/simple;
	bh=YbqnDdanp7sGFYgEhwEG6QT+2b0bCUD8zYUBV7wuRdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y89t/S/L3Zi/IieoCXodBoGBOfL8wywC4r7PpZxp6dIKn2ZBvJ9uYkmGv/4BX+YHETeJrR8qxVcYiFpRlroRTIqh+5DOe2i1n6/DNdIxabl7BNDeruc6PcI9f1xY1BWwhOSgNyF/yMWatvT9aNfimq4HtHlQ4994MZ+M6SgM8E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ke0TDXzS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwkVyjW7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KMgq7G1126767
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 04:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=19R3RHdLoSg
	9KO1lKx1Qv+Hh0Hmoup18RgdJgyc18nA=; b=ke0TDXzSTLGFnn+Tr96Bs4Xkc1Y
	lcItqUSXZKrAM+bdskhj/AyyTj5AiRRDEjqGsFaCFYdeJOpazG7enXKCiauLE9yF
	ojcwOZZNt3tfdqD6ATV2qNe1vjPu5H90y3U+zyfwhvUSylWifim8DW2nZQGUrTgy
	GKBAgOGXUDTzDPG5+zJkNP7+927ObrOtUWp11Ji281dSOf9FtrqBLxHpA3/eCa39
	DtFtTJWEfiJHObWLi2dC6tTvvs5VF0edXvaZCQCnVApiQl+p6G4gGhKHUcplj9qN
	YNth0mg2IzY6L9qQI/TN7LD22q3uKIyeBBdm9W0BPQi/C4jomaLuRIqbhMA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnw68rsq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 04:03:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2d889997495so7294997eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 21:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776744181; x=1777348981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19R3RHdLoSg9KO1lKx1Qv+Hh0Hmoup18RgdJgyc18nA=;
        b=VwkVyjW7NrMfzao2oinEOiOH8dLSxxPeE1k9BFwS4VjaeOrkXKHo6VesMDwJL4BnmO
         lSafo9beNU8ZaVn9KDNAjiSpqfcvKKfuUitGqh9s0LbzYG5m2O5qZVc+mCX+GbBXhJzi
         Il6DDUChmS7iCJNxidyZCDMn9i2o9dlMcd0ra0/Z4rVdGQrvRoScMMCr9Zb3NKRSlhwh
         Wall7lV3ANIYO80Si9rb8BBH/NwODp2E2k/meB+xjbqa5gPm0P9Bw0WJe61fOga4dKr8
         IPGkZ6sNlOmAZ4e5PH7/yfGwkrJguGkcNZPPoJf3wpP7iSWbpESmp/sWwmD7oKfmtm3Z
         80zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776744181; x=1777348981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19R3RHdLoSg9KO1lKx1Qv+Hh0Hmoup18RgdJgyc18nA=;
        b=IV+V+Z9OUYY0ZwwdupWiGB1L26QPCkszzXnnYFR57aB6L4dDfsdrT5c+JAP+FuzSUW
         317Rei0mK3bJ6XACi4GL5WKJoqvb4y/zf1NbG71S0Faq2pQx2SXRf7BaWXIk5iVCXQA/
         Evs7frFLodhKM5+A3ek04fsBa/aIRjIztBuSwTuQ6jxiIZN0tp9nJPi/EzEJgvfT3BS4
         byQwMQkuBDKdnUefEKeRGM7/gxKUyIKwe4fPcTN0HGZ8PYxsRdZ5HzebjsaSbsx41HzX
         4alcjjTX6HlZpb2xjjy8y69TQOG1bLa95oqeP9QYyJSFn7BmjZgdGEI9471w6ZaZ9zFE
         QY+g==
X-Forwarded-Encrypted: i=1; AFNElJ8Bwmt3XCOl1yV4hhBzEyWfjQzZsGvIVrpYPWaEFstbTcSPPNtyzGjQQG3YHXTbjrDbA7GaKy6YeH9rPtUN@vger.kernel.org
X-Gm-Message-State: AOJu0YyVurYnaJkcKVXvuJ2H5IF6vMfFyBe8On07Ez7nNIA6Hk3+OJWp
	eVyQknOSjNai55GoPXMybm8w806YG6EQOeBBtyMdTqxpEqUMvhPtnzWIb0ZIR6E6EN1ZDulqQU7
	9j2BEoXi6JF/krMwGwtLHDPczUMAaISs0yHbwQnxFyWxHTCqu12JqTV+GEp+eqsw2jY4u
X-Gm-Gg: AeBDiev3g+wfeQw5rNFhqSrBq5ums3Ujk/rvFtyynh/Tdt+9pl5J2D+8qebgsI8H1pm
	6JcmR82p62pZB4Ob02yEZGNpwENj2x7734/Gx2h6u4tHKui8tNmSdLbuAIcH2nhCZtgHRIZGxtt
	c1kMpQZsnk0dYccc7WJf2aF2yqw42opsTzmHp0l5gekbshKJAPasyq2CzRXajAOWorP1gb7+/7J
	LxU+FsK4KeS02sH6CGVl7eUk5GzctxFj2F1xa/I7Y39shRKfWSgn02wQmJEI4rAnaSQahhlg2t4
	Wk/z75MQYHmb+lxpJ8kfWNfL2CBDfpcGmv5rHM9tyN80rJdgGFgpzVy/BhnVNxCZQ48V1bMovTK
	nFPcAfK+gIAD4n0rilf9XiV0YI7w3YUul1jmBMrizlnMtM4MJDTg4R6y1sh463d10yFmUcO24kr
	ULcCJlZLuPUMwE/p5C
X-Received: by 2002:a05:693c:2b04:b0:2e1:f72:3f2a with SMTP id 5a478bee46e88-2e4647d03admr8639878eec.4.1776744181239;
        Mon, 20 Apr 2026 21:03:01 -0700 (PDT)
X-Received: by 2002:a05:693c:2b04:b0:2e1:f72:3f2a with SMTP id 5a478bee46e88-2e4647d03admr8639863eec.4.1776744180691;
        Mon, 20 Apr 2026 21:03:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a7ff1sm17386359eec.9.2026.04.20.21.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 21:03:00 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for Nord SA8797P
Date: Tue, 21 Apr 2026 12:02:31 +0800
Message-ID: <20260421040231.1256998-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com>
References: <20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UJvQSGM-7N_OEllM2pVtrVwsDm76sMqo
X-Authority-Analysis: v=2.4 cv=apyCzyZV c=1 sm=1 tr=0 ts=69e6f6f6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=qdfhL6B64FGM_Lu2SakA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAzNiBTYWx0ZWRfX1SvBa9+0MRNg
 3p20WXNPs7dxJQqZJ8WDRsp/iGxCQCbVTh0DCwci9cFulQP8W3uLdzmIGQNFgWAzqoY9g4oUMAx
 RkrMghuBedHls5rceEVbib0v6WcKqM1ZSI6yiLihzz2I/57qhOPEO2AuBomUYotNWTHmlZ/yB6g
 nw3OXSh5O2R5sbaZj0xCchKceEkcLkZBOEFVLg+LWwf36wDX/oPrCb2jpnk/WGaHl0yGP44nmNA
 tLw+49fdZaP4fJE22USpKz7kt9kjZ1HKm9cDXvYUFS96RnVrW1xzxyHETlCoBs/ai/tflAI+rk4
 yKfWAsLXhMGJHWhCbsK4YlOaCjjaeVdw1aXjMDl5Cqcn2ncQytWrKM+7wHJUV9e39lZMNrPcVoZ
 1ify+Q5/1ml4PszFqZ2MjoqcI6w1PKX0zQhqTdE1/2EWOlXmgY+lfSmVUpk52DgMbhiwPklmmmw
 UsgryyRMvbW/Smogl1Q==
X-Proofpoint-GUID: UJvQSGM-7N_OEllM2pVtrVwsDm76sMqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210036
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103872-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5BAC343630D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Nord is a SoC family from Qualcomm designed as the next generation of
Lemans series.  SA8797P is the automotive variant of Nord, where
the platform resources such as clocks, regulators, interconnects, etc.
are managed by firmware through SCMI.

Add Nord SA8797P SoC ID to socinfo driver.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8ffd903ebddb..3a35f0f6898a 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -526,6 +526,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
+	{ qcom_board_id(SA8797P) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
 	{ qcom_board_id(IPQ5200) },
-- 
2.43.0


