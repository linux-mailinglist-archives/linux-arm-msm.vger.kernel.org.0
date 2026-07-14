Return-Path: <linux-arm-msm+bounces-118939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sMSuH1XKVWovtQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:34:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EA27512AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:34:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="OdTDPyS/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bts2Altn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118939-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118939-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 693B73047259
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC9333D6C0;
	Tue, 14 Jul 2026 05:34:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB9933ADA0
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:34:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007244; cv=none; b=I+XLeT9Yv48MENIJAGBiW+T/aDhziyzJM65ETRDc/WwzFmJEqllmX0n7BJwjs6ek2RPThotORJerZZ1O9Q2MhH400X0zZKZH9BxEsa5CUqOuPsW6BiHT0RzYp9LZvz0Im7nr68f3bLn8+FOgGYbSUc6h2I13uCag50Bgj0u7Tkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007244; c=relaxed/simple;
	bh=5dbkXu45HFOosDTiM2+ssNvYenj08n9zSxrcchmpq8M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kfR8d9TrPSgT7eR9AY4jCFJgeh7RLPty3IXes5kmiSRY6Q1wyay2UtXnzYiReZLTFFLr7A9TEpLQZFSKSi/9UQ4vX3123CQQBQ/0P4QpGzA6wnq2cFiRPKbeqIZaZJMvNNm1w94IZdafKEa43+ozhh9ZaciKB4GrcMBHSDqpQBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OdTDPyS/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bts2Altn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38BhJ3482875
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZmX0wPL5IDlQiB7+koGxyF
	G+YiOFbTzb7mQPIUkyql4=; b=OdTDPyS/NRLLsjxXIKx8tSAL4CoLO1rzH9bxNB
	wh5MjUH1UXL+S9j15t1bJenTdvmlRiXsMhe1+yM3Conbw77Zcq5OiId5z/IDksby
	/wyQA2n6WqXAqiCpkstjsJsdJ4gOU5HGv8CQqILiOCgmJfEiACkqwevw8qC2MGEl
	BSoGcw3GjSnhDzdRT7XXKJ7806Tc+SnKdeCh63zi5AQKZRttFGfQVkpE8XvZk7g7
	bQPmUjtGZ0COSqc4kJRiZWRjQYG3jHOVKC9LBHvCfuyj8km8xmxbTzbPb/j/qOnd
	E7IcgioRy7qGEPy0lASkh3glY/lophhRnXXqnbW5gxibbWKQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xactm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:34:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848860def2cso3957243b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 22:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784007242; x=1784612042; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZmX0wPL5IDlQiB7+koGxyFG+YiOFbTzb7mQPIUkyql4=;
        b=Bts2AltnfOgA9IaAjuJ/SPhSPb2cuRGV7dRUkgIxOJd5Nt4p1qjWic2VEWL06sel0P
         g3vxel29W6q6df4Q7ay8/I3lciu0OztxjwGkqKTpsgH84cb0GjMXKtTIQFJXgin1Zhct
         UILhINS4HiMMlX5LqEVUgU/W1H3Ohbn5UDprYRq7gDuXcdkSPaF+6Qoc7SsuDe4u21fn
         AdTNohYYSwfcEvMdHncUwQTC/VlwjoSN0ox2SH9CsT7OlEPlycNHkAiUbNTJm6sriyh6
         mk0rBrK6xbrx+MVNkRKchMCuQfaEVXNr3boVxoNT821xCqI5NtNWb5Jo8QlcV5UQsl4P
         z5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007242; x=1784612042;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZmX0wPL5IDlQiB7+koGxyFG+YiOFbTzb7mQPIUkyql4=;
        b=l2FVz5KdWlMHj8lOqjRT9FTFPy4/IitHq5NtpBrnwCyLe4uajYgNFBKkFopEV2cQJQ
         Rs3Aa+vEOwn5KzCCstakbONZ+sp+wYhKlZfFXymOVC4q2qJx53OtHQJIKl4gESmYzygP
         jQJCUQF+gedXCo2ZA9jLL/kG1SZI/jX2omRzg9hdnaRpUgoel9qpw0oVa3K/QV/KGhaO
         Jvuelz/+5M6EXYGFG7nZiGVP7U3M5g16tYrLQfOFEHbsClhLlbMOin370z9J/gs+NgDt
         aJyV5C6S9FGWXv0pgK5krLYSRyyufUmycQK4lVWNEkeUmzcJXHi+lvfdRYK54qofUI1h
         EacQ==
X-Gm-Message-State: AOJu0YxCvi1aQUXi6mcSMJze4xuVMKpLC/4SAqnBtLYLCbMVWHml4cco
	+fx212dp18WLuL9z6L3cAq95douv34XHi25F8FCljXhpPraoTS6hpctyKj6lnTAkjthtD+mgt6n
	JrDs91DOLZktwxTU2rE27n509rMzgwQmowWAthE1j/EHkctLFPAY1CmPJDmedUD8N+gZt
X-Gm-Gg: AfdE7cmQ/WiMNl8xjp4rT3dvpLfP9E1JC3CEzf6ggY4XBiqEjDSxRGsGO9u5k47ncpf
	cUYAoG8wRpQPAtD+zHY9VnF7kNc99wKyT+PhUnaG4KK5lcURW+cLhPAQVJdKQO2T5B5jTyu1sUr
	DGcXMHtew2xtoi0JxV/UM0UKt+r8dn70J/3z14V2Uzarwt43B5RrWXNd4lepLHSMI+9RbVpJVcg
	OG4eckvUzNwqc0i5M3lRFrbN7UVcIYfE/Q9ouXPnQ1YmVrt7SmSUm1k85CwTsxL0SXCvmCw9Bcq
	zkbhRJzddqnAB6/X2yJ18RKUe3Tlvc/xb0Lhr6F5XVG5nTvtXWE/E/FXWqwhNOwCDxG/zZZxNTe
	S4NZPN4PZzpKifWWtMKZ0a5I0u83b1Gv0E3ldrAJOgeQwJSM=
X-Received: by 2002:a05:6a00:1ca3:b0:845:d286:1fbe with SMTP id d2e1a72fcca58-848897aa414mr9625276b3a.60.1784007241587;
        Mon, 13 Jul 2026 22:34:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ca3:b0:845:d286:1fbe with SMTP id d2e1a72fcca58-848897aa414mr9625243b3a.60.1784007241156;
        Mon, 13 Jul 2026 22:34:01 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bebcesm846227b3a.32.2026.07.13.22.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:34:00 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [PATCH 0/2] net: wwan: qcom_bam_dmux: Alloc RX buffers as a single
 coherent block
Date: Tue, 14 Jul 2026 11:02:30 +0530
Message-Id: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO7JVWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0MT3cLk/FzdpMRc3ZTc0grdstzMFN3UihLdFEsjC8uUJGNDg2RDJaD
 mgqLUtMwKsMHRsbW1ABRA82loAAAA
X-Change-ID: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784007235; l=1539;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=5dbkXu45HFOosDTiM2+ssNvYenj08n9zSxrcchmpq8M=;
 b=RhV4Zoi98yplbi+t1A2tNsWzjPpf7bfkl3oqD8x2pcfeF87vrmtyI7bliNxAwO12o9ap8GCZd
 n91wu0dpSt9Cj3acCZjnjnJTdsjF1SJ2iMgj7SVLu0+/DJeb3meFh6P
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1NSBTYWx0ZWRfX20adrtCBnIHS
 dtBz4hBEv1SX1k2QtjV/lAxBUG0eBZputKwMStHzAHbJeYJFpnqeU2nQ33dLCLCkaubozBdoclo
 tK93UA5gZQtxRIpsCYG/KmxQ5wHsIMnpKlOEpVWG30YVV7Wb5i4uw+2e4S/qOJX/xufi4LB2Q2p
 iuaU8BR7g+Q1cVnIpNjj2V2o6GHLXTxpL4TCoVxRqc++jgWeItZsooQJjSCMB/ltIgb2mPshzgF
 HHzAFeK/Nd/oAEmunb01kq9DJBhVgLz6/paPFVvlDG0GJ9L5vYkOxGOTWRGa9XTdoYAWiKBzGxF
 ZS12kEt4flqDFb32RfxFusSgwx7LSBMttsC9isr9WIeFV/bMPS70cQFmqoty3ZX4OrG4PNh1vDu
 ovY9YXz5YCvg9hCGakbzAxll3C6HjFTbknTEvl02n+lQV1t2Vxy6w69Rb+WzHaDcm+gv6IHBgnQ
 65k0kUL9+ClNxqLyZ0A==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55ca4a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ByYuNnzN2TCMuokQ2IwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: EsdTfEx3cpDeUg9kwmR9ylmRQao2e-zY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1NSBTYWx0ZWRfX2rqUbKhK5Nxz
 0OTM0y3u61BlByqA1SWSXuclTjKBPSHx1EyfM8L4eBuhd+gqJ1rD2LcRRy5t1JfbrU7OjqsZaeE
 +q4WUJVzH8sVOMLrk4T+pt5j0z56Zns=
X-Proofpoint-GUID: EsdTfEx3cpDeUg9kwmR9ylmRQao2e-zY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140055
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118939-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gerhold.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,oss.qualcomm.com,gmail.com,sipsolutions.net];
	FORGED_RECIPIENTS(0.00)[m:stephan@gerhold.net,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:loic.poulain@oss.qualcomm.com,m:ryazanov.s.a@gmail.com,m:johannes@sipsolutions.net,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vishnu.santhosh@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:ryazanovsa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0EA27512AD

On platforms where the modem DMAs into the BAM-DMUX RX data buffers and
the XPU (eXternal Protection Unit) enforces per-region access control,
each individually DMA-mapped RX buffer consumes an XPU resource group.
With only ~16 groups available on Shikra (mDSP, VMID 43 / NAV), the
per-buffer mappings exhaust the table and inbound transfers fault.

This series adds a qcom,shikra-bam-dmux compatible and have the driver
select QCOM_SCM_VMID_NAV internally via that compatible's match data.
When matched, the driver allocates all RX buffers as a single
contiguous coherent block and SCM-assigns it to HLOS plus the VMID
once at probe, consuming one XPU resource group instead of many.

Platforms that do not use the qcom,shikra-bam-dmux compatible are
unaffected: the existing per-buffer dma_map_single() path is
unchanged.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Vishnu Santhosh (2):
      dt-bindings: net: qcom,bam-dmux: Add qcom,shikra-bam-dmux compatible
      net: wwan: qcom_bam_dmux: Alloc RX buffers as a single coherent block

 .../devicetree/bindings/net/qcom,bam-dmux.yaml     |   8 +-
 drivers/net/wwan/Kconfig                           |   1 +
 drivers/net/wwan/qcom_bam_dmux.c                   | 134 +++++++++++++++++++--
 3 files changed, 132 insertions(+), 11 deletions(-)
---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
change-id: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


