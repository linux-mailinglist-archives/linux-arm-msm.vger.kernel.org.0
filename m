Return-Path: <linux-arm-msm+bounces-116636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nm1sLEBGS2oZOgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 08:08:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D4870CCA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 08:07:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cHBIriv7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SnJvpoSk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116636-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116636-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A888F30393A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 06:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676483C062D;
	Mon,  6 Jul 2026 06:05:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A443BFAF5
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 06:05:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783317906; cv=none; b=UCfndtXD76nMZUUFA2MpWYhUSAY7PrPJDnvQSyoeKP33ptgHuboFx0s1ZeZMIylFSWeQOFOKU/lCS8lsO1kM5xsApR7bclIHOhnThLimT+3VI1yvfSs3GXZG5ZUUtFxMMrYkavq3baY2aOFIWX6IH0WJKmUxoKAn4C6mETzAd3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783317906; c=relaxed/simple;
	bh=iOs6GYAI1Sry/kgGSYYaJvWSsRMqJlSEIxu1Miv/29s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZC7xHdZuchfOz8ro+7HOhWOuoqr34gDPHLtfk5lmImrt0RPCX3AzEIXwrQmxHrm57nMCpB4b89drw5dyWA428ien/MJz3iNJ9rGXJvFvNAmji0T2EeTezJm4KViDnSlScuCAsxROqteogNXloUCkcd/Y38Ft6heSEJZvDg7QGnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHBIriv7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnJvpoSk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641T5x3438123
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 06:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cnp+51k+QSROYzZ2w2FlmfOReH0A4P11krpEcpJ9Z34=; b=cHBIriv70cikITZV
	/tm/dWUoZ1yWEKeAgOq7vuuyJIsneTae+46Y7FCYsB8ZE6t2y6HjnhiGCVP0bDay
	UR5H3TDh6l827t92i7cpI7OeRtOxXs0Xf1eh8v07bRE3tw7pjPzTbBIqoMdbJjWx
	EpE2Mqt3Jnizqmn9g2xgnkesq7HhHUCLHlreql81+3fJx3AfMp1eP0BBm/y2bUd1
	ivbQJaO8/D0vh0l8If+PDGoS7lkMQeXPQ00wLeukOzYDLmh1b/g5/az07uRTTZEf
	doZbL5AGO89Kb/0DpYldu2j1CGc7HAK3jqDmTep//HW4SJx0ylCiaurSMp/I4SrU
	8qgS8g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8mk81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:05:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe2607511so3952420a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 23:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783317901; x=1783922701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cnp+51k+QSROYzZ2w2FlmfOReH0A4P11krpEcpJ9Z34=;
        b=SnJvpoSk0B9JIZDKAUsqFvfdkydSfJuQOcpsiu/vISYOOiwq2RhRi97TKbN+xtuBUa
         hZdJwPqhxVt9TXhN1YG2afGL5Nu4InTBg3kpctSZ8iMqCItDxHw8tH9II5oGqi4VH21N
         veekibw3y6bGoHr9nvVjcmutl/rhQxpCjhHEJ2JvDmsiIxL1AyB5LHTN+6Z5+ML8fYUm
         kIxJScB956GLCzIyde9nCE1JW4WPGFK28fLU9oMgAeuKJ2JiIdeSdfB8AJ2t0gJYGKWB
         gn8c8Xu4Qd6dLBzvzAaGwpRKL1FHR4MDXy7Cu1TUxNK4vM0GmHE0sKKyV30Otqs3d9aO
         GGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783317901; x=1783922701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cnp+51k+QSROYzZ2w2FlmfOReH0A4P11krpEcpJ9Z34=;
        b=iA8HVlrqbxtKVSw2vMzcCq193heBa95zSOY2KmOlrwzKTndVh+rhv7/TncVesMvcSf
         upmqMLAK/bId59agJ0bIaaTM2FPJguh3gxYTpdKO7f+r+wQ3dH0+dvro3XTXo1iciow+
         OuYcT60SrS1TceVywCZlXEN21JsOlwcJ1I88WJ0wVp8YIhm331XaBUBCSnpmhOMfrrwC
         1YA15M+X9QT/WR1ySIt5vGO+OlDnHfuovtIosKVggF5xR1f8ITRmtnJZjQx/fl2dLMMv
         D1kZ0/XAsgizBjiWjzutuM57ZWiC+zAcDKxGzSo7+zHtJ75lcAec2/SgkGKiHCwwYfTz
         f6zw==
X-Forwarded-Encrypted: i=1; AHgh+RrehvxNz01jvbP+BsfqM2r0nHi60ANzJlNlFvatVVSTftfYSYscj+WgMPD8bcXWnn5RownzV2ghvg4TBtK4@vger.kernel.org
X-Gm-Message-State: AOJu0YxEe+upk7TNjcFwILGn9U9yCWwlw17sBfa2XPNq8Do8GK+M0w7X
	4XRbEKhkEc4u3y5Nhog3pxImUqYZc7YhAdZysAEDsx6JEaFjvfp96QnOjPpZR3RDjJHoqr7KCL4
	1qXSdvv+3ampfp9JUcOqhjjVtLD+sT3JvMSIFzPAkavCXx4d1ub+GeLPzfxCposrCDO7w8mJ2f8
	U8
X-Gm-Gg: AfdE7cmK1hkqRHAkDQPvD4EPPMPkMOlY+MeSOVTfdLtBXbp+0gm2lmofGC+M0jJsI5+
	NXjKdYf0DElH8AUVtOFn851PAjg6GrPsdQUSLaddwAaAD17qGJ/yXsvh6yxg4qpD7ek2gBcxqjo
	PA3ZDs+OFc9dO+RrC9/c6mwF4Atu7xnoVDHfe7XTNnDiGMmqMBjOM/7lp9xf8ycvuBNhplsKbfR
	XyNVPtcx2P3VND9Jm+z0jHKvCXhfAKwYpmFgDOftmJ+UcknIB4HeFzL/eGy38rbtO7xXKeKcDrV
	m9yJlAm7S675npcurYmHMdy4YvCyPnemgUytvbfGknzvBnBGrvw0Z1U2Btrt/JzopnMMnSdBzGK
	GaYgMGv6Mh2ZEa/fNPDU6z7D6zQOIgTQSQTqHhg==
X-Received: by 2002:a05:6a00:1884:b0:845:e7e9:b57a with SMTP id d2e1a72fcca58-847f6faf1admr8298942b3a.61.1783317901306;
        Sun, 05 Jul 2026 23:05:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:1884:b0:845:e7e9:b57a with SMTP id d2e1a72fcca58-847f6faf1admr8298921b3a.61.1783317900881;
        Sun, 05 Jul 2026 23:05:00 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498dcsm3113266b3a.30.2026.07.05.23.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:05:00 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:34:43 +0530
Subject: [PATCH v2 3/4] arm64: defconfig: Enable ILI7807S DSI panel driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-shikra-dt-changes-v2-3-56fcd1659ea4@oss.qualcomm.com>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
In-Reply-To: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783317885; l=834;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=UnybwlAPEOA7quqfyfGuxz2V5vHlqCvNZa7cTXVKqzc=;
 b=M40tYN558Fzi0vX7Q3USfhw4wZ13RiEeAwc8eDSbW154SZAnM6NlmNLN7SVX2Uf9Ju25moi3B
 HWziuiz9n8ZBhJE3y20o6MFYYy8BgdFcPv8pPYHG8HH6146uNZsIb7x
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfX+KY+bacrhTzi
 7zwYhipGMydk+kos2Jf0qbh1b7Kv33xxDYXabDdsQxXdcJ5Y2qcMDKhTnh9cOWjqL29VzG+uxOU
 zIiwZYDoth8UPxOwS/8xaqrinZFaEja1VrgX5t6bnr3gBG18vIFThCNzSVnmz1pVnT/w2F1xN2n
 j3rJzNngwTYoVCc9DwRinZ3rEpV5pfjrxN9iHpf4NzDzfUIOJoq6OsTlphNXBpcpS0KhvFrRnLI
 3jGdBrWNlNBpHIhKfMzGVUnPyc8gbQ+vXrGkyTkCg4JvOc8vOtZHgNNwxDaCsnfd8U0/mD7bu/d
 ALC4VaUyKe792q9ZpXduWnIexBvPYeSlXu9MSSS37AF9x1V7jWhSoTKDFBCVDRAcK2ffjOeSIjL
 dLN2BfU6CCP7RDzk0Af5tlQmZZPfZTvCHdX3EaHSgd74QBYZcfA6UpRswqnamvizoZyXOeNF+Mm
 tMRO14JZcN1lYaI58dw==
X-Proofpoint-ORIG-GUID: ox5TXQaBYleyD5QJaHtWnemPBcmdhsud
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfX/XPtnMeM9jeO
 mA39JBydBm4C25vr8ioznTHgTCoW0OpC2p/AOpmy1bA4t1Qn3QvTcU5IqfvIPIiZ8IhDNKNRG0z
 Nn+7PyaXk1p146zA8HgggcHcebH7ySU=
X-Proofpoint-GUID: ox5TXQaBYleyD5QJaHtWnemPBcmdhsud
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4b458e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Glpgw3x1L1QHtqWtt5QA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060058
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
	TAGGED_FROM(0.00)[bounces-116636-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2D4870CCA7

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Qualcomm Shikra CQM EVK board and CQS EVK board.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e6ae93e533..53f7b3d104ba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1013,6 +1013,7 @@ CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m
 CONFIG_DRM_PANEL_HIMAX_HX83112B=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m

-- 
2.34.1


