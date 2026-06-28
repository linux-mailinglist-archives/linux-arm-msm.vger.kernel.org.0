Return-Path: <linux-arm-msm+bounces-114783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MjLTCsUzQWpCmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 16:46:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B294A6D429F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 16:46:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ml+yI9lv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JZq6nf1M;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114783-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114783-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADD7D302EE8C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BA33AF65F;
	Sun, 28 Jun 2026 14:39:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667093ADBA7
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 14:39:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657567; cv=none; b=R/rQACRi+tn0ldg6rmZ9w+ugS6z2Fo1uVipp/NoPIQiREvIzqSrgtmtKUFnPFOE+tB9RQ2+vHw03aMrhh4WnIJgAWdqS8vNT918a7GxclGaepOX/8XXfJZlq33zvxNJglQ+TyNyH3ZYcrnK/po8DJE28RfS8PG2h4AP/dT9UZaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657567; c=relaxed/simple;
	bh=AZiHHq+x0W9FHol6e+Xjn43IEDJXWdNcQfLBaFTyIpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V27DC0elAe8/U4QKH3d9ZezqC/WrjEZUEq4TaXIsDjAlDZBGM5hOe/roV76v5xahOWJq9MHvrwC/rvlE1Ru1TH8K23j8m9GnklhusxGWoEanGaA5jvt/CIoEKbSzL1ZOY35iNknq8gvFXDvqWB4i02EBIHUxu3tNCv/jItJa7Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ml+yI9lv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZq6nf1M; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SERw1V021742
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 14:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9maitIXa8Sram4TCv+YQqEBCGgRKHZ283RLgVKVYdhE=; b=Ml+yI9lvBCbA6p82
	RzHlPJ3juFXHuXbvw5hvM+Xo3gfh5zMZmGOEhrLziwxFIpwiQQ8Gxq4ENSjbbYAE
	pxSg7opp87kqsQCD80PM6ePUrJQYb9U0EZd62Zn3ONWCYW/ZNsHbcqj0abjcN/yG
	AT+5VT1A+Cbtaf1kVJ0iyOSZxTLzNmgN8S7CdbeynBdO3OqmWZ8Q8cYj4MBMIYCZ
	mTMkpTrfVS4cKtEkHECZ6s58TgWZWcUc+AkQdIU0edL+QRstW0cBGJX47je+aOrN
	HMfORUvZOHehF4qqWue0cuAE2xSDOPIr7rs41uSX8Ccxju/69BvxxhRQfyhkL4uR
	Yi+0jw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279ck07d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 14:39:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c011c7cb9so5559106eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782657565; x=1783262365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9maitIXa8Sram4TCv+YQqEBCGgRKHZ283RLgVKVYdhE=;
        b=JZq6nf1MzVqfU2OtTyuoVhQXv88nRFQkp7q8WAWv84MwVR6EaUuI3bnM12JjeyU0bs
         133Gn94yp9qtYfejwyhwnIHEK2zp1PfeILjpChGleAcdCwI5oDmlnCZVz2PdT5525aJL
         elBZQHgvSXYSwY6jcQrPPsa+vIyz+nV9xeHlpeJ9nk2B4lCqmYXjZn6PYaa//yTt0EOu
         UoL2IzR+0Dvojd3F+MfvPaRX1cYpXeI03BGA7h0w7n2JcIPOcPq+66vUGmZZNKhKGsvy
         Ku5HRU0LVsiu7iPBtbenwXITqMS0qVvNmYs4xL+qmebliATnJZFslflHkt51MQO8/rox
         rpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782657565; x=1783262365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9maitIXa8Sram4TCv+YQqEBCGgRKHZ283RLgVKVYdhE=;
        b=hcDcyM59Z0uqUjRiLANrkzGoRxMONhXZEB28xoFYdvs/BLMwQ0dc+HEqA3rll0VVIf
         wryBXTiY99iE0Uv5U4jsNhRzGPM8ABOEDFNQgN9yLpE6vq6kMlQwSna24CrlNsVlA8Gn
         SVntqodUOY6Cj7ZGtdt0/3hRembe6aE+6nXgs195g+BtFxX6aG3kGvAVNmnDGQw7EW75
         yCQFhk+8+DKoKL3XP0NxOri/xtbpbCRaePAtNKn6opueL99ZG4Ges9yESyOd/xDcnzS0
         ymTXIdVLwQmJol+auqfJrywQsNrjoDOflK6vGSyQrTodbM+mENwPns9r+ftfL7cuYODH
         ytWA==
X-Gm-Message-State: AOJu0Ywx/lsx7pLaFR53Vaz/tT92ZZuiswMhNKeyI8KVNbOQfOsXWcP+
	PBpX+6/0m1TcxZaKe0W5HPZyS2NrhpR8S0wdBlIL0WZZr8BBw3uYbEtzvybh1KOYgnVNN2slrUE
	5U+JLQMU9VSnV5oWzyipngfBr63UqW8yrjWVOTRb0GFWAv5o9kwTB180ad+lWGfB526bO
X-Gm-Gg: AfdE7cli3XfQMycrv3uDnFEb2hBtWt9xappwdEYOEyPzPNVTJVT6cmWwQ5QOEjsT1tU
	qYj7xMno4LqHzsxlD2a29bE48YNleNIq0zaVb73cLV+lFdzOzjbVp2KLDzztEq6Mij/WlRRAcE4
	R/7V/3SH6GMofsKSZJAXneBn9+MJo3Otx+zQ7xOQKYroMYzNfaJa2ckBxnbEqTiM62gxA0CN2Yr
	f9Wy+oy6o+uEQJ7c9zdnCcYwofakCsCVOaKHvUE6eH0MLn7npsXLTgLQj9b7E+wI4D1N7hc3PSK
	t9LGhXv9Mj0D+vNCMDPZRFnEl3On+nhAf8PjcD4Wzw4gO/0GU/EW+UZ1TLo/UAyfwsMMl8V0Rdn
	bhYJzAEcWFXBjZRyPuIUFF8DsOlBPBY1+B+10xbtU8hLYmP4=
X-Received: by 2002:a05:7300:538c:b0:304:e865:f7d1 with SMTP id 5a478bee46e88-30c8500d8f5mr13533542eec.25.1782657564962;
        Sun, 28 Jun 2026 07:39:24 -0700 (PDT)
X-Received: by 2002:a05:7300:538c:b0:304:e865:f7d1 with SMTP id 5a478bee46e88-30c8500d8f5mr13533527eec.25.1782657564472;
        Sun, 28 Jun 2026 07:39:24 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm39300591eec.4.2026.06.28.07.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 07:39:24 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 20:09:06 +0530
Subject: [PATCH v1 3/3] MAINTAINERS: Add entry for Qualcomm I2C slave
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-i2c-qcom-slave-v1-3-8b0a5c01f9f6@oss.qualcomm.com>
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
In-Reply-To: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782657549; l=1075;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=AZiHHq+x0W9FHol6e+Xjn43IEDJXWdNcQfLBaFTyIpY=;
 b=U27u8RfTIriLBtUO4FkPELhA7v4mOnfzw+CfAkZqQHGrWLNASvvYHcj3ZEd07+OvOqcOhlGSg
 0QavU+5J/mdAEbN++LZMFV+eYcQpEdqqa34AvSX7MMgMUCU7gI1i369
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a41321d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fuCEp469c-Jm1kTzFMAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDEzMCBTYWx0ZWRfX8zsUr5sablq0
 N194M1hCURagtI6ZA01CFcZg2TKkB+byx6L8DCEAaOi3kPCro6pY5Q1k3IahSWXbpU0q5Rvgei3
 ldEx12tqYaFJS9Hy8QRsAMyCRs/JJk4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDEzMCBTYWx0ZWRfXwgbi2deI9Eit
 ekDFUr8Sdk7Uji6h+rbUy389HivaFVy2UoH2gBTr3QgV9uTsqJtszrpx5n+6XKgTsnuTq2b+ikj
 u6QAm4vZluXM5T7mluFI0umMmXW2TNPIleKb6qQ8JPxds6yzYwkJCdOTItgZwUNEFD84cUMkpbp
 CHqSwOE2U7A+zyJ3fbeHExgNft6SchSXJZ+lWp3AVGW8f/BcgC0dreibLa3hW5gdPAeSyFN0JnS
 6MRHsKRFngjJyoHtXaUdDPztF6TGgx+eLR3uLeI1HEAGfEqRokhHrOhor8djWE33vxbJ55tXAT0
 mciwYXz00Dfs1jtS1btmungdCn7GKBYjKngepGEy41e7luBoPsCEor2a8PgU8oWvPn4JcGeWU9k
 RYL2ij+1gE1DDqIisSEKRbRCneqHyp53by3/L+5cuy88qwXvwR+nb60S0jdBRW2hJX/cnQQQ3U6
 gt+9iahy53jgbQG/nBQ==
X-Proofpoint-GUID: _IlhpXlzFu9DmVSM6NZJ7vTBngoHXOdw
X-Proofpoint-ORIG-GUID: _IlhpXlzFu9DmVSM6NZJ7vTBngoHXOdw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114783-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:viken.dadhaniya@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B294A6D429F

Add a MAINTAINERS entry for the Qualcomm I2C slave controller driver
introduced in the previous patch. The entry covers the driver source
file and the associated Device Tree binding document.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1705eb823dd0..645bef228593 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22231,6 +22231,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
 F:	drivers/i2c/busses/i2c-qcom-geni.c
 
+QUALCOMM I2C SLAVE CONTROLLER DRIVER
+M:	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
+M:	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+L:	linux-i2c@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/qcom,i2c-slave.yaml
+F:	drivers/i2c/busses/i2c-qcom-slave.c
+
 QUALCOMM I2C CCI DRIVER
 M:	Loic Poulain <loic.poulain@oss.qualcomm.com>
 M:	Robert Foss <rfoss@kernel.org>

-- 
2.34.1


