Return-Path: <linux-arm-msm+bounces-116195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5tAWED5lR2qgXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:31:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9126FF8E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:31:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QUaQCcWL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F+FQ2pz5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116195-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116195-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15C883030D3D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768603655C4;
	Fri,  3 Jul 2026 07:30:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0EE367B89
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:30:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063846; cv=none; b=nNE84AiIkiznpB8/wi/o8BZSAbiQxA4my8k4TKD4UeIvZp4wjD4KTXcaWt2dMq7L14BuNkccV8QNWQ5JPyBoPutt1zP+TAdjMNB7APJzPpxDRkRGOH8BYYHvelWKdxOZ1SvMtuDdkJcuMVHJizwgWN+Vkyu4LxNgOMrsmLXLxYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063846; c=relaxed/simple;
	bh=4yKQ0kZHZv6Js/eXRRB9kcw/hSSpXSVd81QQhJTa07E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OUm+B1PQ54BACh7Y81qnAZ9DAirEY7etVR1rcyfN6JWDZDM6lES/vBl7hr6jpE4OSCT9LkGEmNiL4nNzu4Td4cziFQueagWpzfHqLiUlj+FTexUViens/vBQabMpfjNQYd2iT4Dt6m3JZIZ+i0SDsogTBUjoipwqcSZBsAwPOHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUaQCcWL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+FQ2pz5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rZnF3136094
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kRBW8lGJJxacHkqCOhieOw
	1QBlP4IW4YtNsHgtcMRIk=; b=QUaQCcWLGzpk/bBPlRB6VTKTtMoCd73cYD8BIu
	lHD0I4W5ElCgaZLwPQLqEaeVJScZDO10FTYzKD/j5EVpZm4W0vHoshVugxBJrnvd
	9APUZYFK80ezWvDQ6L04kPz66VMnsWFC1x9bimy9wKpgOGrHgXE+LnujrMWE55UM
	uZrL/wqA/dAKfTvJTqMwISB7GekBDspFkVJd7V2fv1VurOOkS8yje5LO91xyaPFK
	CB/1IOzHxOpmO02Gr2P546M3JG5o+FMwu8P60bWOMAl1PiSB7iMmVTvwJ3l1P5kN
	0wtVmZKTOuYH/cJyzZX0xi/Xy2nKL3QMatAUhtPg5qcS79Zw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b596us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:30:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847a225cd91so345073b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063843; x=1783668643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kRBW8lGJJxacHkqCOhieOw1QBlP4IW4YtNsHgtcMRIk=;
        b=F+FQ2pz5BYH0Ree2x1ehpDfCof+wK0TXF6KfKho2moWwteZS6ytFPnbAwxeevsnp+A
         YGFXLUXCUuKohUX1JpULucVkFYzBEFFNC2wZGDBLDn3Rn+Ihv24kbjYkN07rpV3Vb/0E
         iIiL+zNNTpIwanFS9wQM5ecfpHGPbYX3fGTYPdMHfXc9pqejCbLQCk5vr1NB8LgNszb1
         J/GNXfZ18b1tEW30aIb4bNsjVNrqxlJIQc7e3M7cPt2paJqcdX93iMRm9WbhZcQp+plF
         TBOH6fXqdT8NyUFSP1b6r20EHC8UQV2j6BadCN9DNmuEDaPBPwzrk29c7nvtnCII0uvr
         LGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063843; x=1783668643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRBW8lGJJxacHkqCOhieOw1QBlP4IW4YtNsHgtcMRIk=;
        b=EYsuJhc7xtpbMlQIVdGcoqTNtmYn5peaVIYUDbisN1wwe5ByG5yUVaMa/O9yc9R+UM
         feiev4FSO1wznyKrnCOYMuHACX5A6qE+f0soRD364EtJOx+PNXZ1g6EiOrl8Au5YxUJG
         i5d7Qn1YbE25yC8ZFBcVVIq0KhaatCSzUOiWMOrQmHyxEyXp84rSTFHuK39I0oWzqzGL
         NrdzkhaHhwoUZdlmuKO+EtY/r5saEX5WapLnv6dnUL6xJQaf5ZS/vuq2XEO3PZ3LUDMF
         QRgXTXeDugD+5O8V+cpCp2IrGje7edHEQYN3rYqQrrExIxI7zOSSuuXy8po3sg3qhAZE
         WjZQ==
X-Gm-Message-State: AOJu0YynI4P7VUYGiID3+n+cj06z5WaNRhZ/sX6O4mW2V/c+mZQkEURp
	ghHgT5p2GfKUwiLYyY7NhHVPEoBRbAbUZCwX4eJGEkUyG/5DMge+ly9IrSY2mhsdTRizqXlek+P
	Dr0KDzxpYg2soLNHRxmi5zlucrccDuVh1evO2coOJBol2xs/h+UIez1FPFo5HeqSnJYqq
X-Gm-Gg: AfdE7ck+gWaylN0F+YW5VFNQSBTPSMOSo+ea3GhK01s9EJxF+xgHU2s+LUNxbu2y4f/
	ELPYvW3KcfxoieCANOshitpAORDh3/DbnZ8OZoeEArldnzBE1aQxoxtR0KZhEakZeipdFRVzbAg
	fnYmnfxuieXSHPW80S+N7O3kVjRAKYYbDy8jutphB3HGezJx52/612Po9YCoOdrDcDYx+ZUTrJv
	QFm8Dk0xMiDXkVGneeURjaf6GFjOr6feDGZ0BzftFMe3EBQsgaUOQ4/c8gVwjOTMmZ5TfuaVHMd
	dSSUUgOuR63uN08XKKcNb9jIsCBb1ilgCFmXPEOxnCIyIgof/LfXLncdqX6sgYEg8PNA6mGgVbw
	pWuHcfV+RUzG3APBRqQHkYojRlAyE7iA29VL7BuWO
X-Received: by 2002:a05:6a00:3904:b0:845:4142:b8b7 with SMTP id d2e1a72fcca58-847c5070887mr8202712b3a.24.1783063843067;
        Fri, 03 Jul 2026 00:30:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:3904:b0:845:4142:b8b7 with SMTP id d2e1a72fcca58-847c5070887mr8202681b3a.24.1783063842545;
        Fri, 03 Jul 2026 00:30:42 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9902efsm2456176b3a.45.2026.07.03.00.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:30:42 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 0/2] pinctrl: qcom: Add Eliza LPASS LPI support
Date: Fri,  3 Jul 2026 13:00:27 +0530
Message-Id: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX6Idb6MUBB9FA
 s/kNcmUtY8Vo62ZquBwLmChwW6GWweBONiLS/LDNV1aG41dZ5bloKHCZ2e+aSGVzIIpdEQBcjnr
 l1b1hmXHZoeO+n1buXVfhtYGv+amS10=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a476523 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3m4ceKHbqf4I2ffRd28A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: x1PvotqlbWOG1Q8EhBMlX-y4zhe8mSdU
X-Proofpoint-GUID: x1PvotqlbWOG1Q8EhBMlX-y4zhe8mSdU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfXw+enk+2lSNTD
 mim1bXJXekK5d0A4qQUMVQ3bmifCe7w0d2j4jqXZZEnLdc0QPw7gRiwqobfDgSEmfOnIeW2ljj1
 TlEnU2Cgw4sVZcj59vmlU0q3rPslT8k/f+ijL/laJv05Ci6CEa4S4bJmA/LdFOWL8HK9DZ5akfB
 zRVmMU+xku/48EVG2UuPgjYWVDnWOD+2fVjtopfxebLLk/uADzQ/0ytR8vttNIEzAf0oNm/eZ1R
 0sLqec2Sra7H6EhmAkv9X+qw7sYpYZ6o6FfLKMEh7XfghIin+icG2zPeohntTLrd19fnaQt/8Ou
 2L76qdYIbhGJzj81Z6AGUT/9wvANmBOm7eROurF85ELsfuatNo3HlKA7uZser1DfU4a0pGqkACa
 uygCN3LL17GybsWVvXnLFzIp8TozS+xfUl8GBXdF8PXcgvOPMO09Fbu9lwlxJ8/YKqbfb3T6T1H
 rSkkcZY6ff4hxa+yHww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116195-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A9126FF8E1

Eliza is a Qualcomm SoC that uses the same LPASS LPI pin mux
functions as Milos. The key difference is the slew rate register
layout — on Eliza the slew rate field lives in the same GPIO config
register rather than a separate dedicated register.

This series adds support for the Eliza LPASS LPI pin controller by
extending the existing Milos driver with a new variant data struct
that uses the correct slew offsets and sets LPI_FLAG_SLEW_RATE_SAME_REG.
The pin descriptors and function table are shared with Milos since
they are identical.

Patch 1 updates the binding to document the new compatible and the
single reg entry used by Eliza.
Patch 2 adds the driver support.

Ravi Hothi (2):
  dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
  pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM

 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml | 22 ++++++++--
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 40 +++++++++++++++++++
 2 files changed, 58 insertions(+), 4 deletions(-)


base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
-- 
2.34.1


