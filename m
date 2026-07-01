Return-Path: <linux-arm-msm+bounces-115747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kcbRIdVARWrE9QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:31:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4756EFCF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:31:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NbIMQfWk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="CPXHx/yA";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115747-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115747-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 51D073098A1C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDE64C0431;
	Wed,  1 Jul 2026 16:01:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6D74B8DFA
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:00:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921662; cv=none; b=U2uNtAV1KSbohYDwxgNky2n+2dIzZ6QiX+m2MF7Zof/A7LJ+lxEoBPiDsvgPMM1WwyNeaxO42qPcnAePbgh9b7rASZuaLbgLc61w3MyfeS6QivuQWGPlV+H6Miuxw83P21W4vxQ74yMkikOBmBBRlFgvyqWecJXLiSPXNQHO35o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921662; c=relaxed/simple;
	bh=xh4ucig5hPRkaGw1GggCAwEU1pqdfnGTPbj3vUFpt5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C3aDP6rP0j3IlqwWZDy24JCUkkF28LJDuFwsZF/BeCARzNd485Ig1tRIy9WcoJzSG3L6WmcH+oF4IlGBrNRQ/5h6UxAc+k1+vlpvmWPgoyx56TDTIPOzy/wS4CJ5KUaljd3KjgDKL/MWyot7ty58ixSv6/VV5M4IiTpTwq+g1A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NbIMQfWk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CPXHx/yA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Fo9C51429034
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=NbIMQfWk/M75Jc/m
	JJcsFsiD2oORCimjwwYEEgLE4CCbKa8/jk6TtZTAo2x1Chq82xjvwdmFs4twAiDE
	VmDSeiTYXtYJ39ntpwwchbR4xciMLf94auLLm5dXenL6roE2PUu4b2pcjDlKN9xr
	Tmqt2K6wYY4XM7zkpb8EEBtYVMordmmk8cH//v311NIYAS4Ewqa30tp56XPJEkxp
	NnUVh1GPoJ9JUr24MaNvUObsxb/pYWhBmwiTgocSru7GcYIPCxOqTEcs6tMXN12J
	Yoiz/RgXGsjpYOtHtjdn03/y2bD6I/b9+OrJm8s54ZTFl7pmFxudXQyCt6fIC9on
	tk9Efg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q08n6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:00:53 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a196857cbbso546979eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921652; x=1783526452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=CPXHx/yA9SWZf/msCSHBnGg5vUirWSVlKMjclcdpQbz9wzcdoQZOJ3TRw+viG0Om1Q
         BYMARaWiEbNMkE/FqE27Iqny7dxlw5jiul5y9U83SnjXSFKQl5Zc3u33kb/K1k1+rkGb
         rL0yYGcZ9dBOpCcnMF3hf3fo5cT6TNKpHqnX9ByRFvJBZxbM9H6+iaMhOywGzV8axqLF
         BrvH+CTr1s2rXcnhJYRAR6Td0aoQe2zH/L+TTvkUKtZJQEoyTRDx8+EGHA2Su7O8uL30
         9GWeiHhqDGd43JNsdv+twEE87Ad0DuZFWSt+JlbK5b5lqGtYCGq6X07izwZFLY0BnNoT
         Z/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921652; x=1783526452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=WAfpfxfNor7aGBXx7aY0yw67xQQdpv55Papd01ad/8TdBhbQ4CZBaIeq0uHGa4CFMq
         mxb0NZnxnS7otyz7HaLEgIxQ4DKiNYgM1CooypOKIigZK5KwSS+2qoCCiEPBwtMYQa3l
         uV0hSgcr3PQyr/FeYjOTsdmF976IPhbcrla65HxzUUWksLbHYXGSjQHK5EsF5qibUham
         UFe4W3tlj8TOGQLDjO5qkTo/P2xHnL0H0KDW3fAO1AnPliEBpRScdNhnkjqXQ35EffYV
         htDF3x8BXglCfqw4Z8p0kAIPydcFwbfcMTgkgaGg1gZ9ZHveVXyFjZGVKP2mtzeUYbfJ
         AfgA==
X-Forwarded-Encrypted: i=1; AFNElJ8KXGbxZxj2xEeOjNuZvYx4/hVXJdVLFT6qCZbtjHti1OG6SK36rfOonX2woM/jR05XqIQSLL0tf2vtwvxS@vger.kernel.org
X-Gm-Message-State: AOJu0YwRTWQ69FzddmqyE1jb2laa3Iz63s/lMz7SbBqPFA77e5os8Del
	4VdYRYCzU8yYIuRuFXdvEID6gMMNXUE8nf/paGOCU8qc3YpiGz51n9W/qWfgKE26OZjv0/hsH2s
	7+KPhCkNi/G6OApdf2gHNIgardvomTWapGDhRK5XEzeGjZSGUkQGbEyCWV55OLjeQuSTB
X-Gm-Gg: AfdE7cntuXG7iemVXK4sHCneMg3fUF4RgBMV0iveTkUmDqg7AWI81rqVn59ou369FG9
	wURxjCpiG1DhjmqJExfQMMxPBhMdmWsKdMtjqcQwlDZRCxWVbaa4qM6xi84pknnQUrlddAMno7/
	uROPNrLGxe+8IGSY2Oi/I/96epRyNNOlN78dePcLgSwK4AINq3V5j01wzHwLjRUAtwABf8A/cyj
	VKwQf+vZkqI6yKKGkdxHVZQt3xiFaq/HPOUL4NCcwniJrQNzm1xwhkvjPFXzCJWzoZxzrXdddBq
	LxCCRbcp70kqCaNvsYrX5QiyX9yw0tTz5p8qNzoZjpnBNMbJKKuqA4r92Lg1ZXp5codB7XAfToW
	JKPIsWw39oJXHpSnl1Q55jj9fpgqCtBzM+q16dr77Sgp8zo55ew/FoFAKE8k7FIjA2U1rHCpPVF
	R9f1Jz+kJ09CK1RbdghNG+PII9IWIHhVrYodQRW0wMTNVKJdG9avUNham1/lTZ3kM=
X-Received: by 2002:a05:6820:2911:b0:6a1:3ee1:d673 with SMTP id 006d021491bc7-6a309ae51b1mr1066931eaf.36.1782921651791;
        Wed, 01 Jul 2026 09:00:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6f02:b0:915:afa5:725 with SMTP id af79cd13be357-92e78206c88mr299831085a.6.1782921639993;
        Wed, 01 Jul 2026 09:00:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:00:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:27 +0200
Subject: [PATCH v7 3/9] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-3-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
In-Reply-To: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a4539b5 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: UNAoYmhg9jyO491X8AS2ocqoj6_RzmKW
X-Proofpoint-GUID: UNAoYmhg9jyO491X8AS2ocqoj6_RzmKW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX60e1ftQQdgxY
 /cHUGbUMLNe0vf27eT6+pjubBKqyOU5MBAAANGsb9cMl76ebbXoduPFLe4i3DyVE36d6VclFlwK
 b5K+Qn8zMTkiOsheua+uHDk09mB6zgPiZATFj0ddZuwD9FSWNN77NkdHodzX1fKsKgDOFVz2TzF
 mgRpW4ULWRGca+qPWw2MvWM8l6nQLg3LhRnV9vXrW+WSB8IljDaqDYVNrVvWa/0aY4KEz8QoglP
 9tce+ltZtZ96iY7O/GRimd6EwhCpzWFONdZa4AR2VS6kRqFAn5lDeoLrhrKqpAR8hPMAImXQtfF
 B5FheZwhZjszk5kMfQ+wvzihcHiCBOC8xrWmRmMc5nfmaJFS1O3JQgXAcGQvBt44j1K2TRW79MJ
 i4Qp2lCYemwNRGt5rUl19kR5cB+rG7BwJF6EmafRpJ/oog68KKUyCHhJDXCIFCGNTZZnYSOvnkO
 Y4n1TCEwGKFtMAc/ZYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX0vTu5SILAEBF
 m5WD3Up8tlkNYt38AvBzrth2FxEOj7sRVWoBBHxj/4df+ezKrKYxaLeYQhwUG2rfFxVhMLCi5KJ
 D16xC7HtPA/SyDxrnQhNnTE/hYMcZFs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010169
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115747-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:ansuelsmth@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:list
 s@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D4756EFCF9

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..7cb28f30c9af032082f23311f2fc89a32f266f17 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,13 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1


