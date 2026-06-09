Return-Path: <linux-arm-msm+bounces-112016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c11GO0K5J2qj1AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:57:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B14A65CFCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:57:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cccoHyIf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Haesl7O2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112016-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112016-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 950D330038DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 06:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211544D8CE;
	Tue,  9 Jun 2026 06:54:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0312C3A9D9D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 06:54:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780988098; cv=none; b=Dg2eUp1+AhzQSJRQK9CUOMTcwzusCHxJ1rbkgFViJTRKbK0usvKpfH6nD9bt4DnZa6rUfyYbGZ/3bLZID5njj4ee0hpmkA0RIb1I97q7RZNA9C1mBm26rhv4PJ09Q9PWas9e9BaIZsmJYOvwxuVXYHRmoSmWiXd8EurSc7DmM18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780988098; c=relaxed/simple;
	bh=P0Rvy7ba8na9OOAKgVTrVcNkZDLvIMoxbJGmhR9MCic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kwt2LYGKXhaqM6NH8tyG5SwJg8d2msMDHhPFynitfJfGMzWznAe3SQAJU70lisjj1PhQI2vJkuTrzG0i5oIez2wSn+aw/bgAM0nxjPBxkis39Bv/HY1EoWlgEnZh2nX4/543MeYyuoW2hDUt52HkVvyyTtDgqzrg+REm2MGoOh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cccoHyIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Haesl7O2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wbN1944773
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 06:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JjS4922Wi791YeO2uSYBt3QldN53otSS5AL
	ybDv890E=; b=cccoHyIf40ir2AIAkPBP0bGxzMWaLzlOWLrM9NlKUdgirVWi2q/
	yUbJyx7XIxoftX1VRtds7/JNL6Fjqvi8q/DBrWxSPRt72H2ep7y6pv5/shk4CbHC
	89SzIzxBIe5wQfrWW93p6yS0cksBeTwvDE3L/g22BC25St2PEl7FEmXTorqW93dR
	3Fe4ReUX0Gbf8id0yESlmFkYvJlgCwKitrjb4U8u2Kb7MjrShlfk+GOV22Il2JB+
	VLVABIbb7j86CNMo14BF3FC/u//sMdmYpKVIl0JqaycGMY2ydiQckktbieCFlm+P
	TlxUsSH0XpkxgU0H6u/ts149edNG48b+DxA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx44scd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:54:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso9259325a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 23:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780988096; x=1781592896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JjS4922Wi791YeO2uSYBt3QldN53otSS5ALybDv890E=;
        b=Haesl7O2JZa3JLOZxDrtQphnTYlb8Qs6wDjYSRiAcCGzSMK/B2YG+YL3iKT8p50IQH
         v7rfn/eJJ2sEv3bePZ+mJEVifzRPWR1jKKHcgXxt6ThNBhq2LJ/dxAIq1AQMTJZN1shD
         qT7GF/nkP0qv1m01oAPossJIlKlLMiJeE/xbOF1TF99RxPED9wakQwFPC3hcWIf+sVYu
         5JLMhY4eNXJ0GKPj2c6ehFrnUz56xYJ+degKmhSZE7Az+SY49PyPFgNAEuuMeUQVwGgR
         WPm/zG1FGD/zQlTq3U0xPBpOAXWJqnMHNv+epAhgVAvNNhYV6NVBnEtdVj4iDjS/QJBo
         YuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780988096; x=1781592896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjS4922Wi791YeO2uSYBt3QldN53otSS5ALybDv890E=;
        b=V02CtaGQyj2lMGas9IMs75XGGupXRiTwhJBr3w82uBdp92Psjz0G082z3KtOvaQPom
         ZOAvaNcq1z/cnLhkCjL5VHSB8SnfEAE5KBbeiHsRbGm9jrw6xo13p9dgc5Mz15TmNsye
         /RagD4hT5sUzYAICkzs12S3CEcaVFmLhz801NxD6mIXAUGJv/zntqjr4Wg2VEkjlNief
         WvK3gdO/GOGFb/EY+1aGE5PZesp5CZ6pLl9y1ZcdZy+qjLBH3FvroSKBPg5HokinnygC
         kNquRSob6Jjw9t+5BJsHc8DTssyf2fBKCL5o44CzL6eOyzHjHGGMaEYW5rv1XMvCtd61
         t6mA==
X-Forwarded-Encrypted: i=1; AFNElJ/Hz4ZytkHtR0HD1afA5vaj/pcqFxuclAUYqF0Ptv1mVHbqpWJnjl82WhwdImUcuaqhVA5JQ7K/vsAh5Rqj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqk5tjDiaKmqkTRS2DuCAJ8KA5JH/jo7CHJGNhgL/HLF+IOwaB
	9kfP/tLab3j7bph/85Lq/TsuvHb7ietT6PYx8YztteoJNMyTXqBq0gtzVAcvkah/n0aMWpIz/v3
	khIpz6XojzWAaPS04K5nBX9AZT3yKwXW6P4HSmlaG53kiF0J7ipuYjjHwPz07r2rrOfi9
X-Gm-Gg: Acq92OGGrR3xZ11MojweLHFdQgx2TQd8HAhp2A+cHHsAyF4OdpLTQGljA7zjuWeZ9TV
	sQ899bSt6Au6U0syzYUTgUDIpbXk8QrEaZDHfpEHs6KyfyV7pnUmfhLXpDhbTB6Xq48J/CC14I9
	xitSzhRaj7C+5Y1w8y7p/Q1aAW1IeLIabgQwKcV29JRhQoMvzumA4UckJMT2ZCLNYTWxDmcPOPl
	wN+9Sq7bgpTwPRI3n5ipRu1MmJteFreOI4GEMhx1BUr6IKofFlLdVhFUGIKNibnXI0xkqowB1+F
	NlTqwXIjjU7q6oa49wDA3LdE28JipML//hdenL6oDO/+x5o6ZQHHsBXfrH76eF23/MhfcswWzr4
	WYez0VQI7iipucPw1xkET30sSWHC5Gu58uX/Cn8a2sVijC2WP4tLJEyfqrUSmUWG1oZwNv1VoEU
	iIyBfQP/HqvtiyJ0fV7om0QTMQdo7to5fN3IocXF+omN7MDySMA/+J3Lyct3nQUw==
X-Received: by 2002:a17:90b:5906:b0:36a:5d1f:7ac with SMTP id 98e67ed59e1d1-370ee344dc4mr19888010a91.3.1780988095710;
        Mon, 08 Jun 2026 23:54:55 -0700 (PDT)
X-Received: by 2002:a17:90b:5906:b0:36a:5d1f:7ac with SMTP id 98e67ed59e1d1-370ee344dc4mr19887989a91.3.1780988095328;
        Mon, 08 Jun 2026 23:54:55 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712fcb3a9fsm8607926a91.0.2026.06.08.23.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:54:54 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH PREVIEW v2 0/2] Add support tsens in ipq5210 & ipq9650
Date: Tue,  9 Jun 2026 12:24:45 +0530
Message-Id: <20260609065447.4024695-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a27b8c0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=O98__aPPj8GWcYWuEFUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: LzZqEalBlpw7SIYgLpdtPe5zkD3aRM9q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MyBTYWx0ZWRfX1jT6917Ay5el
 vtNX0PBnXHwCuGV3omlgtQPg/LXGkYHFmKpkYTa50hQqZtBAIjohjo/3kOIZ9hon+M30veFJqWn
 ueUfW+0slVucrcgvzH76oKNLxCQFGw/qwhE9j35530YC0n/x7UL+XoSowo5JwSVTqIitCa+gwo8
 Uda7Lu0vWkSWCTOGOdQe23ww4mU10EKuKZGAP+gmyu1TVwF7+mAk1M/HNBX3cAprCUuNOL/NFOn
 d5HUKxCRmpw5nHXJMi4q7y/nW2W/vuJwNo4ByfrsOIQh0KsaihrTlFD+3xsnqURx8Yv195Yl62r
 TuvUBg/pMBrLQn/jRRVgZ1bs/yZeUJ/fA8HBLzcPH5/2S3fHiMjt6mysqClkNC2/rohOi3ZWS2s
 9BOAuxw26cFwh7fDU8w5A51aFXr4Sg==
X-Proofpoint-GUID: LzZqEalBlpw7SIYgLpdtPe5zkD3aRM9q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606090063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112016-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B14A65CFCC

ipq5210 and ipq9560 have the Qualcomm tsens-v2 IP. The tsens framework
in these two SoCs are similar to the one found in ipq5332. This series
adds the sensor data to the tsens-v2 driver.

v2: Combine bindings and driver patches
    Use fallback for ipq5210 and dropped the driver changes

v1: bindings - https://lore.kernel.org/linux-arm-msm/20260515-tsens-yaml-v1-1-8039c62cc249@oss.qualcomm.com/
    driver - https://lore.kernel.org/linux-arm-msm/20260515-tsens-driver-v1-0-015ca76f1418@oss.qualcomm.com/

Varadarajan Narayanan (2):
  dt-bindings: thermal: tsens: add ipq5210 & ipq9650 compatible
  thermal/drivers/qcom/tsens: Add support for ipq9650 tsens

 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 7 +++++++
 drivers/thermal/qcom/tsens-v2.c                           | 8 ++++++++
 drivers/thermal/qcom/tsens.c                              | 3 +++
 drivers/thermal/qcom/tsens.h                              | 2 +-
 4 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.34.1


