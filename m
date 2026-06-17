Return-Path: <linux-arm-msm+bounces-113498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id trZPJgopMmrNvwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:56:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDE46968BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:56:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Se0tG82A;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RYXlOq0J;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113498-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113498-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DFD331A3F39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 04:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91DF345CDD;
	Wed, 17 Jun 2026 04:51:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4762033F8A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:51:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671874; cv=none; b=HIUkVoyIuDQeRnYa4kll0vyrUNWHAVFDH7rexinZ7d2WiKYGAQABA03cKcCS5BiX1nqxddTpGtR4kqBCL6MX3gZOo7kMUfcAuwXNXiAxiPSU9ew/kfbKzfgBs9BTjK75fA2VhvP4dXiLTqZVl5DnpXBDjEV1aqPeWBjp+aUBqJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671874; c=relaxed/simple;
	bh=6C0TD1QvcxCa7jF7QmizTETEV86OPeo6DKxWRAkr1Is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lA4sNtKjInu1Cmh6IZiHGGO9SelU9XB0ml9poFzUCE7KPSORzm7iGEY0eEGXp25mTTgN+3XKlQRT057L3sV7I632nzkAC4g+zTMslBlVMWkOuPAxThhV3tbLlbRJ8oopf7ky2ia3gYPPm/IrDfT1/11/okHaDJ6C1qBgpGnKDMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Se0tG82A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYXlOq0J; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H4oAPT1774684
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6v40pFQBH4BYjWCcXMn9db1MwtRUQXVc2am0DOsj+Q=; b=Se0tG82AUi08JHBv
	2YGLeytgzRMuLNdyEAfzSQ4+T9J3Fk2r257sU+mA49ue24ao0Xo10HYG2LIOaLKJ
	JKQFEPxicZeZieU7JgnOLlaHKId5YgTOn6HuVIMLK/4vujDXIHyomv3wK8HgGKfJ
	HaxZlzMuC0Ci2mKbSsLo8ciDpShzTVURSjHqyyCWFkn+BQMFnqUvRKI4C5tCX5br
	zU4EDuyfu3SjGoR0DF4pXPBt3B3VdfC6uQguz96BuMFnGGnx2CgsWKktk+ON1Zj6
	oHp4Yynb+qOPttn+3uraOcitW16qdnp72SJXAmPjPRvt/w+6ob+PHIHppco3t+XR
	Wh/p0w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef29e7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:51:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a366b61fso3048301a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781671864; x=1782276664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6v40pFQBH4BYjWCcXMn9db1MwtRUQXVc2am0DOsj+Q=;
        b=RYXlOq0JIHWBbsWYONsAlwxEKWv9hEjUdBzb948Qk/IlfcxRxXSoIVA8w7Zkct4J3f
         4pMp3DaV2XJEyhBsCRgpgIJC5olC615WY62P1TH//b7iimUoT8lztHvQrLslyEDLcEQA
         D128O2M3PTf9o2AulKqKH7x+TCyhaXrFiWnwHKFQueJtapAfEKYjlzVSqKW5tqVoPKBt
         rt8frjrtQMiQAB9ecMHmDL51vfenpYd1ezNsH06SV+fv75VdLrqpE9ahkqlBnLiiZil+
         u4tubzyS/ReoQcRc0MY34h0NQ2dQvCYbP60JbyYsPY8carX8ZDlNUfrNZ900/MWU9xT0
         8wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781671864; x=1782276664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B6v40pFQBH4BYjWCcXMn9db1MwtRUQXVc2am0DOsj+Q=;
        b=eMGNN9Ji7/aVtPOLVLbaYInFE+ml2sGIgr9zX4gFpKt0KTKEt2MuZS7vknRCxX4FvZ
         uXuE4lfn7yYRt50WhZcpCCaWwWYU61WJ9KvfezZixm8YlSkK9TV3X5w6CZxq52CPwd9M
         tLjL/1U9o2U4Yy5vvWOeGrndmMW+zV4uwoNOnO7SOocPNx/doozfHJDmMNEs7RoKmEeb
         SLX7l576QWQmmSfFAzrA91JL90fMhvbuKCV8GD2xlvT8dQ9O2JnUTBVI3ePHNWZcTkOI
         jxLCiRwgR65K/pCo+an/BebPoqU/tZ/iF9a7mCI/VVTrpATMd3LmkrTzuwzeW7O/TGQn
         Dshg==
X-Forwarded-Encrypted: i=1; AFNElJ8wAaZ1w72bqgKYAB2W6l3LvhTvXPq2SNQsR1i5nczGZuesvnlfIJab0DfxUVnZz22pE9Kuzx7S79wUOJHR@vger.kernel.org
X-Gm-Message-State: AOJu0YxNm8wdb/eCks8cWZridhv3uZV7QkeY0G9DZWW4xOdJViHiHyYq
	IuX0FS2f77BUypsWPD5QlGDx7DnaaEf7a4GJUdR5LqkmMcE3ybVFe8pF6PNRrTnO6taUb6m/lb8
	387MBARoYGefHnOx/tOYJ2+rIOMz6t+EYziOGhf45hL1s1ttmVN8kzOUjQwDenDBBvqqj
X-Gm-Gg: Acq92OGT+pSBPH8X+A8rsDfeAPqiC4rQzXEpDdgHUFH3aXulCQ2Xo99p0uSXy78wf2/
	e2GQVJeEapXXXFLzBAjWLAilvg6qgaxgOHn8cqDJv46YuBIQYIb+eQPjy+glteHhJ7anpm3QkJB
	62tUvvo9A8sFnhVqRZTqn6hX5rWCe4V2OCnobuaL9RUdVYSlOZKJD5jhgMiMqhHsBAIf/a4xCxf
	EcIqpUsWbh1mg41RbWPRPL5Oqq3tv4v5IEmBtgphCD27A5yPIC07dizLc7OR/UULFMQdMS0zukK
	gBEoMh2AiuUdSuniYJJH23nw/mvDl1s7mchg8m73gsmnc5zkYoRjXDeNgUJLbhy4F1pqLhSE6Ip
	Vr3ijNsecgogaZMWo27zGd4fVUPpnUvFG77IsfNNUlT5c
X-Received: by 2002:a05:6a00:9285:b0:82f:390a:69df with SMTP id d2e1a72fcca58-84524595987mr2100539b3a.35.1781671863821;
        Tue, 16 Jun 2026 21:51:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:9285:b0:82f:390a:69df with SMTP id d2e1a72fcca58-84524595987mr2100492b3a.35.1781671863212;
        Tue, 16 Jun 2026 21:51:03 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c016sm14721127b3a.8.2026.06.16.21.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 21:51:02 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 10:20:19 +0530
Subject: [PATCH v7 5/6] i2c: qcom-geni: Store of_device_id data in driver
 private struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-enable-i2c-on-sa8255p-v7-5-ad736dbeab57@oss.qualcomm.com>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        prasad.sodagudi@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781671828; l=4444;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=6C0TD1QvcxCa7jF7QmizTETEV86OPeo6DKxWRAkr1Is=;
 b=aP8magEXnCd/pXP5dnCRJaN3Ja6oeSUNCz9z8SIiANalVyxBU4Z2S2zN3MoGVGv5XQxRcsW3z
 Agruywkfu8UDrbfJtpAkxefu1G9vsAWrSkY6te/rcrabuv6x3x8QJ2l
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a3227b8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=L-JS82rCYefCJmJZhRoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfX3SBcBN5c5i5g
 IUWuoosWpFvWgLMFSiet2N5bHNlbRd1gAZZFXJ/24rVhSXd6xjphJtIoJ+3a/YpjwfsKaZisgVn
 ielkji52veCGb5AJ+d22YM8Ic6TqcKo=
X-Proofpoint-GUID: SQVxtCMzFkanMu4tUPdFYQ3lD5uHgDX_
X-Proofpoint-ORIG-GUID: SQVxtCMzFkanMu4tUPdFYQ3lD5uHgDX_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfXx84UEOjOoTXe
 gUyY2VWjAgQY8balo5uhEaF4KET3NsESoxWltg7xJ+ZmRoJReVdun10XDIntJ/SIRooN5+2Zsp2
 ItGPNOaymp0CSLCsdblyAcULtls4Ki89KxdmQ8GiBALEVIyJmodTxGk9HIiHFn4mcaw48XcCH4i
 37sgmLh0nMc5fE1qTMOwIoZa93+p9WgXz2XjwHikxbolDBesFJJolD81sZxp1xGFj7sEDGGM0dp
 4twbPxGJQBAFt1qXecUQf+oUar3PP9l+F9vYNddD79/O6vqI+eFZgeW76bSrGyyKr9vHiTDRFmH
 LxAPhZjg3QA3RD0ZVkAU/pOEwifJ59SAZZTkdt/Yr9c1lellQNP5PBodGoLpQddlZBnB1f5RXMn
 CNsi5awSTEfucTuDZlorCpoOS0QZsdNRHdznsAiVHzfmEFdszgYzPi1GiIS/4h0Xw/v+m763cNV
 5utly/fYjo8khA9MmZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113498-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:mkorpershoek@kernel.org,m:praveen.talari@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:prasad.sodagudi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EDE46968BF

To avoid repeatedly fetching and checking platform data across various
functions, store the struct of_device_id data directly in the i2c
private structure. This change enhances code maintainability and reduces
redundancy.

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v6->v7
- Added Reviewed-by from konrad.

v5->v6
Konrad
- Updated in geni_i2c_acpi_match() as suggested
- Moved geni_i2c_acpi_match below to avoid errors of geni-i2c

v4->v5
Konrad
- Added a null check after platform data struct.

v3->v4
- Added Acked-by tag.

Konrad
- Removed icc_ddr from platfrom data struct
---
 drivers/i2c/busses/i2c-qcom-geni.c | 46 ++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 8f8b74c4e88a..92cccb1cce69 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -77,6 +77,11 @@ enum geni_i2c_err_code {
 #define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
+struct geni_i2c_desc {
+	bool no_dma_support;
+	unsigned int tx_fifo_depth;
+};
+
 #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
 
 /**
@@ -120,11 +125,7 @@ struct geni_i2c_dev {
 	bool is_tx_multi_desc_xfer;
 	u32 num_msgs;
 	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
-};
-
-struct geni_i2c_desc {
-	bool no_dma_support;
-	unsigned int tx_fifo_depth;
+	const struct geni_i2c_desc *dev_data;
 };
 
 struct geni_i2c_err_log {
@@ -941,15 +942,6 @@ static const struct i2c_algorithm geni_i2c_algo = {
 	.functionality = geni_i2c_func,
 };
 
-#ifdef CONFIG_ACPI
-static const struct acpi_device_id geni_i2c_acpi_match[] = {
-	{ "QCOM0220"},
-	{ "QCOM0411" },
-	{ }
-};
-MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
-#endif
-
 static void release_gpi_dma(struct geni_i2c_dev *gi2c)
 {
 	if (gi2c->rx_c)
@@ -989,7 +981,6 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 
 static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 {
-	const struct geni_i2c_desc *desc = NULL;
 	u32 proto, tx_depth;
 	bool fifo_disable;
 	int ret;
@@ -1012,8 +1003,7 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 		goto err;
 	}
 
-	desc = device_get_match_data(gi2c->se.dev);
-	if (desc && desc->no_dma_support) {
+	if (gi2c->dev_data->no_dma_support) {
 		fifo_disable = false;
 		gi2c->no_dma = true;
 	} else {
@@ -1033,8 +1023,8 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
 
 		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
-		if (!tx_depth && desc)
-			tx_depth = desc->tx_fifo_depth;
+		if (!tx_depth && gi2c->se.core_clk)
+			tx_depth = gi2c->dev_data->tx_fifo_depth;
 
 		if (!tx_depth) {
 			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
@@ -1077,7 +1067,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	struct geni_i2c_dev *gi2c;
 	int ret;
 	struct device *dev = &pdev->dev;
-	const struct geni_i2c_desc *desc = NULL;
 
 	gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
 	if (!gi2c)
@@ -1089,7 +1078,9 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(gi2c->se.base))
 		return PTR_ERR(gi2c->se.base);
 
-	desc = device_get_match_data(&pdev->dev);
+	gi2c->dev_data = device_get_match_data(&pdev->dev);
+	if (!gi2c->dev_data)
+		return -EINVAL;
 
 	ret = device_property_read_u32(dev, "clock-frequency",
 				       &gi2c->clk_freq_out);
@@ -1229,13 +1220,24 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 									NULL)
 };
 
+static const struct geni_i2c_desc geni_i2c = {};
+
 static const struct geni_i2c_desc i2c_master_hub = {
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
 };
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id geni_i2c_acpi_match[] = {
+	{ "QCOM0220", (kernel_ulong_t)&geni_i2c},
+	{ "QCOM0411", (kernel_ulong_t)&geni_i2c},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
+#endif
+
 static const struct of_device_id geni_i2c_dt_match[] = {
-	{ .compatible = "qcom,geni-i2c" },
+	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
 	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
 	{}
 };

-- 
2.34.1


