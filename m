Return-Path: <linux-arm-msm+bounces-118941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HlnNLKLKVWpktQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:35:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEE07512F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:35:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Xx+QqDzz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BBk27tlv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118941-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118941-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF55630BF1A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB69633D51A;
	Tue, 14 Jul 2026 05:34:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A2D33D506
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:34:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007256; cv=none; b=QRa+ZUQ3jZYUkbf/CYoJVzQM0ct2utkXBi8hxseunXoWJwXi+py8+b9QkEJMLBFL+b/B7ti6VBqcYPgwp6GUIRVaEGpNkYfRihW9ESINKDFH0ioPH7mYR5VT03od1ttNc3iKEB8N5X6n5mZfg3jn8KaSHfX6dod0oI3X9i4Dc4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007256; c=relaxed/simple;
	bh=gmv99zqa1PVpdEbCQJDKuhLLk73XtCM4nYr1M8mwtO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a4gUoo+PcJiZGymHhqo/AexjDOj94DqPnlxoJqqimIe3BmcsnFjWO44irtrOvugxa28S3xGoeSCr2DQo3wKRz+p94x0ja5VciTRlI/vtF8e+oOf+ks+z9Ycy+5OAF+yHevK4XQYoaC9qdqGSEpn0/8XF+jZNB4KKnyE6WrrP4HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xx+QqDzz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBk27tlv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38OQC3303109
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fXVHWx0Zf5/xynoCpxYZ0QwwZNMBpb6VXl8Ewna+hEI=; b=Xx+QqDzz7dgapCAP
	aFzfsuyqmx3jBkVvWlMhgA+QJd3uIzvFMNIh2955A0mFVR1PeUNpQAhD0fUr++uR
	W6A1T3yoyAPBrx+brHdZm68xi0mS3FxsCGr8aIfMNkN4WLH3uUt6j7Fdl4IdKGXF
	IypzC3FFDM2/gNKjYED1LSMn9YJhttZjosmNDWV4yUFo4OSPT/wjOH3T636fm5CA
	lR0SK3da9ZVJbmn3H1ShsD4ZjNTGSnNB12gAzQUr9Sa3uVUWvZhmdQTimg5wD9l9
	wk36VEBljKBA0iQbtBhNnoR3rcX32P3ENgO0x1IiaIUWZiwCBVmDtcikrPvpNtMh
	dRIFvw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p22sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:34:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8895156101so3282256a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 22:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784007253; x=1784612053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXVHWx0Zf5/xynoCpxYZ0QwwZNMBpb6VXl8Ewna+hEI=;
        b=BBk27tlvtKAkDFxPY0o8IZSXXaoeU7ybbnsXxiWHQIGG+cTskRoPuqrsxhA6NfxINC
         N7QI3dEkgssBcJFhBMady1S9YDt1HOm/5aB10LcCvD55Tt0D6IWFyllpqWYqPf8zg+fM
         Qq5r77YgH5Lf8Ozk6LZFmB/9pE8pNNvX7OCkn+k8wT+pvP1xhzBgp/UgKzSvG5iMEaMZ
         EDjhx9gWjm0gZNjt3uoa0Dq0NmQwn+sU+qusfzRUOi9PHaD57Suna78tLpmwo/sbB4T3
         K7ZdwMRes28QCreg/FmAEOUCzn5Xb/aXJQWZ0RAbu2Jj8CTAovLQTNaeQ8Nk2O6ZuIH1
         nKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007253; x=1784612053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fXVHWx0Zf5/xynoCpxYZ0QwwZNMBpb6VXl8Ewna+hEI=;
        b=DECixymBHFacKdI2+53tXonBGZ8iZXE0npwekJGC6SO8MTAi+rupesyQhb5aLsdquY
         2D9og9MdpKGZXwbJtBMXlbHrrnL9GWllshAcxFxqfrZJiZMr44ns0QOUQdtIzEEok9fW
         KSKdyJL4DoT+zvCSrHH7srAUyptxT7HxiJhodu3ezGXdjByszpIfkrJCqXcZk5WtFNeT
         7J28cNuMxWqsCKTqioKnGGy96ha1PaqwtmpOuDKlGOJJATLfUhTiyA22vL06KKSNjau4
         Ip6kM5ddH6DQsX2kcvZsnx9hy7LnRF1Uer23lKGMYhFLW1jedTA6cf6EJssoOrBHHEmm
         02gQ==
X-Gm-Message-State: AOJu0YyDQDsi/e5kMwHZ61zS8fE3BHWlo0Vw7SerCH2IoZeWnhFjWghJ
	QUOjyf5q6qbWdql8uI4SHZCSMD61r5mGvLrczDdJ1FgcuJTw8/0Lck2zjdr8GBMjshheLFbCoMd
	JyO71sfo5uzKuZ7UKe3PPSoMkJ94e8z39U6a4bzZQlG5dLo38AjJvrtD/UXzwKN9O7xlT
X-Gm-Gg: AfdE7ckPIucay5DFBhGJSiemorTs2LHEUHrtc/3qHzfCexF+OZY+rYHhNCaeQFpnBTU
	QevL648bYqh/w/VZDsoq4iawwowLR6geQoq+iWEOwrnKL55x78r+4CXhb/yhD0qef4AcZVG3bU3
	F4lLDlz3PfYJ34OHsgyEEPrSV2ZWYXR6Y5j48wy0afkr+6AddmKGk7B77yuEP4b7CmGxDxunMhZ
	nm4gZCn1FdGz8T0xQyINe1xlv794rtbLycQkShlOCU/qojO1GpIPAzUPHFV8mXioHEoG9UKSSwP
	lQ1iJzzTX+soTqKkyi45GqJ5PdibwaZA8aYV0EsvMBdF2Oml1438yJINdDMCraIFqn4MtNG+D7s
	Yd/u0vZRJTzS4fzr3KPailPLcx8F9FeTAmjyI5jum/sdonRQ=
X-Received: by 2002:a05:6a00:228f:b0:847:8250:2b2a with SMTP id d2e1a72fcca58-8488971d058mr10901882b3a.60.1784007253354;
        Mon, 13 Jul 2026 22:34:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:228f:b0:847:8250:2b2a with SMTP id d2e1a72fcca58-8488971d058mr10901842b3a.60.1784007252826;
        Mon, 13 Jul 2026 22:34:12 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bebcesm846227b3a.32.2026.07.13.22.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:34:12 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:02:32 +0530
Subject: [PATCH 2/2] net: wwan: qcom_bam_dmux: Alloc RX buffers as a single
 coherent block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-qcom-bam-dmux-vmid-ext-v1-2-3f29da7cca76@oss.qualcomm.com>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
In-Reply-To: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784007235; l=11718;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=gmv99zqa1PVpdEbCQJDKuhLLk73XtCM4nYr1M8mwtO4=;
 b=MEW0ZkwIwTi0V3ad5+Op/2XUp9TTpSEit2BMVaoqj1TWLn7cSP2+P/9gTl/MXfZn1uIYgdoX6
 ZUaxDB5bd0tD/JgODWBA8fKrSOeP2Z+Vqj8DmeuTUK0phZ0Ul4Ezv1q
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1NSBTYWx0ZWRfXzStukERXUDUZ
 bh34Ewwq3lItuCI+ncl5GRR8LtVu9dbXj7umbiyP9IO+0MGBdzrf4EAvQgVIz6yultMciUCOYwf
 6esTO58PlAtbep630SDUmNfHaM1/aIQ=
X-Proofpoint-GUID: 7r_jbkPAVK1rr2pWI3HAb9AhVgvNsMJu
X-Proofpoint-ORIG-GUID: 7r_jbkPAVK1rr2pWI3HAb9AhVgvNsMJu
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55ca56 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Yt_q4RW75Gh75vbNyMgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1NSBTYWx0ZWRfX5Nsm7nUjq4Eg
 bWvqQRavPxv4w4m8eeIpLNq5nqcVPTkCoVlgquSASRO4Uo9MG0zw35osozRM0rHseh8pU8f/aeh
 b0oTIbcS3OQ0cxV0C3yQFI/Lzs4IQXqcGa5aEnuxsqRC8yuhZZEsoGbXpYBTVyHRdrc2FCZr02K
 mMdKcL3hiyQZAcLlzw3dYvJQJeoRU/xBn2xzJBoQQeWFYg8XuNLAn5zEcqJ1hgqpdmi2Jes3GQu
 kYUoBtpXc5YHqVYMnJgqzTYkMQ5Kax7UCO3fUCSJlQYn5rWA4V+mxe8nYGV9ykUiE8qFVsVbUMw
 x8hs5A6gviIaXhvkbtud9h0L7kTj4AsnvXK0YXORfmbQp2ZlXlTImMhS2eOdgrQLY3NkYOE4n7Z
 ld8JPu2zwvLGAwJTwQihFbuV3xiL4fdlUwM0asi0spbEkw+y0m/fhAhEiPivMOFnU4hLVK6tPUh
 7tYsgAfiL/lE5oAXDtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140055
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118941-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gerhold.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,oss.qualcomm.com,gmail.com,sipsolutions.net];
	FORGED_RECIPIENTS(0.00)[m:stephan@gerhold.net,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:loic.poulain@oss.qualcomm.com,m:ryazanov.s.a@gmail.com,m:johannes@sipsolutions.net,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vishnu.santhosh@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:ryazanovsa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 2AEE07512F5

On Qualcomm SoCs where the modem (e.g. the mDSP on Shikra, VMID 43 /
NAV) is the AXI master for BAM-DMUX RX transfers and the XPU enforces
per-region access control, each individually DMA-mapped RX buffer
requires its own XPU resource group (RG). With ~16 RGs available, the
32 per-buffer dma_map_single() calls exhaust the table and the first
inbound transfer faults with an XPU violation.

BAM-DMUX is a singleton (exactly one instance per SoC), so the
destination VMID does not need to be a DT property; it is looked up
from the compatible string's match data instead. Add struct
bam_dmux_data with a single vmid field, and a shikra_data instance
hardcoding QCOM_SCM_VMID_NAV for qcom,shikra-bam-dmux.

When match data is present, allocate all BAM_DMUX_NUM_SKB RX buffers as
a single contiguous dma_alloc_coherent() block and SCM-assign that
block to HLOS plus the VMID once at probe. This reduces RG consumption
from 32 to 1. The block is never reclaimed across a modem power cycle
(bam_dmux_power_off() does not touch it), so the probe-time assignment
covers every subsequent restart without re-assigning or reclaiming. It
is reclaimed to HLOS only once, at remove or on a probe error, and if
that reclaim fails it is leaked rather than returned to the page
allocator.

Each rx_skbs[] slot is pre-assigned its virtual and DMA address from
the block, so no per-buffer mapping is needed at power-on. Because the
coherent block is not page-backed, received payload is copied into a
regular netdev skb before handoff to the network stack; this is an
unavoidable extra copy on the XPU-enforced RX path.

Platforms without match data are unaffected: rx_virt stays NULL, no
coherent memory is allocated, and the per-buffer dma_map_single() path
is unchanged.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/net/wwan/Kconfig         |   1 +
 drivers/net/wwan/qcom_bam_dmux.c | 134 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 125 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
index 958dbc7347fa84ee869439bf8b503037faab8bef..1b133c56231615269698140187ca3141dfe48dbf 100644
--- a/drivers/net/wwan/Kconfig
+++ b/drivers/net/wwan/Kconfig
@@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
 config QCOM_BAM_DMUX
 	tristate "Qualcomm BAM-DMUX WWAN network driver"
 	depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPILE_TEST
+	select QCOM_SCM
 	help
 	  The BAM Data Multiplexer provides access to the network data channels
 	  of modems integrated into many older Qualcomm SoCs, e.g. Qualcomm
diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
index cc6ace8d64371eb8d00c638a39b234ee540b83c9..247230b720e6011876d5c429badbb5a1f34fc576 100644
--- a/drivers/net/wwan/qcom_bam_dmux.c
+++ b/drivers/net/wwan/qcom_bam_dmux.c
@@ -9,10 +9,12 @@
 #include <linux/completion.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/if_arp.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/qcom/smem_state.h>
@@ -62,6 +64,7 @@ struct bam_dmux_skb_dma {
 	struct bam_dmux *dmux;
 	struct sk_buff *skb;
 	dma_addr_t addr;
+	void *rx_virt; /* non-NULL: slot in the coherent RX block */
 };
 
 struct bam_dmux {
@@ -75,6 +78,10 @@ struct bam_dmux {
 	struct completion pc_ack_completion;
 
 	struct dma_chan *rx, *tx;
+	/* Single coherent block backing all RX buffers, NULL if unused */
+	void *rx_buf;
+	dma_addr_t rx_buf_dma;
+	u64 rx_buf_perms; /* SCM source-VMID bitmask of rx_buf */
 	struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
 	struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
 	spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
@@ -92,6 +99,10 @@ struct bam_dmux_netdev {
 	u8 ch;
 };
 
+struct bam_dmux_data {
+	u32 vmid;
+};
+
 static void bam_dmux_pc_vote(struct bam_dmux *dmux, bool enable)
 {
 	reinit_completion(&dmux->pc_ack_completion);
@@ -111,6 +122,9 @@ static bool bam_dmux_skb_dma_map(struct bam_dmux_skb_dma *skb_dma,
 {
 	struct device *dev = skb_dma->dmux->dev;
 
+	if (skb_dma->rx_virt) /* coherent RX slot: addr pre-assigned */
+		return true;
+
 	skb_dma->addr = dma_map_single(dev, skb_dma->skb->data, skb_dma->skb->len, dir);
 	if (dma_mapping_error(dev, skb_dma->addr)) {
 		dev_err(dev, "Failed to DMA map buffer\n");
@@ -124,6 +138,9 @@ static bool bam_dmux_skb_dma_map(struct bam_dmux_skb_dma *skb_dma,
 static void bam_dmux_skb_dma_unmap(struct bam_dmux_skb_dma *skb_dma,
 				   enum dma_data_direction dir)
 {
+	if (skb_dma->rx_virt) /* coherent RX slot: nothing to unmap */
+		return;
+
 	dma_unmap_single(skb_dma->dmux->dev, skb_dma->addr, skb_dma->skb->len, dir);
 	skb_dma->addr = 0;
 }
@@ -468,9 +485,10 @@ static bool bam_dmux_skb_dma_submit_rx(struct bam_dmux_skb_dma *skb_dma)
 {
 	struct bam_dmux *dmux = skb_dma->dmux;
 	struct dma_async_tx_descriptor *desc;
+	size_t len = skb_dma->rx_virt ? BAM_DMUX_BUFFER_SIZE : skb_dma->skb->len;
 
 	desc = dmaengine_prep_slave_single(dmux->rx, skb_dma->addr,
-					   skb_dma->skb->len, DMA_DEV_TO_MEM,
+					   len, DMA_DEV_TO_MEM,
 					   DMA_PREP_INTERRUPT);
 	if (!desc) {
 		dev_err(dmux->dev, "Failed to prepare RX DMA buffer\n");
@@ -485,6 +503,10 @@ static bool bam_dmux_skb_dma_submit_rx(struct bam_dmux_skb_dma *skb_dma)
 
 static bool bam_dmux_skb_dma_queue_rx(struct bam_dmux_skb_dma *skb_dma, gfp_t gfp)
 {
+	/* Coherent RX slots have rx_virt and addr pre-assigned at probe. */
+	if (skb_dma->rx_virt)
+		return bam_dmux_skb_dma_submit_rx(skb_dma);
+
 	if (!skb_dma->skb) {
 		skb_dma->skb = __netdev_alloc_skb(NULL, BAM_DMUX_BUFFER_SIZE, gfp);
 		if (!skb_dma->skb)
@@ -499,9 +521,10 @@ static bool bam_dmux_skb_dma_queue_rx(struct bam_dmux_skb_dma *skb_dma, gfp_t gf
 static void bam_dmux_cmd_data(struct bam_dmux_skb_dma *skb_dma)
 {
 	struct bam_dmux *dmux = skb_dma->dmux;
-	struct sk_buff *skb = skb_dma->skb;
-	struct bam_dmux_hdr *hdr = (struct bam_dmux_hdr *)skb->data;
+	struct bam_dmux_hdr *hdr = skb_dma->rx_virt ? skb_dma->rx_virt :
+				   (struct bam_dmux_hdr *)skb_dma->skb->data;
 	struct net_device *netdev = dmux->netdevs[hdr->ch];
+	struct sk_buff *skb;
 
 	if (!netdev || !netif_running(netdev)) {
 		dev_warn(dmux->dev, "Data for inactive channel %u\n", hdr->ch);
@@ -514,10 +537,18 @@ static void bam_dmux_cmd_data(struct bam_dmux_skb_dma *skb_dma)
 		return;
 	}
 
-	skb_dma->skb = NULL; /* Hand over to network stack */
-
-	skb_pull(skb, sizeof(*hdr));
-	skb_trim(skb, hdr->len);
+	if (skb_dma->rx_virt) {
+		/* Coherent block is not page-backed: copy out to a real skb */
+		skb = netdev_alloc_skb(netdev, hdr->len);
+		if (!skb)
+			return;
+		skb_put_data(skb, (u8 *)skb_dma->rx_virt + sizeof(*hdr), hdr->len);
+	} else {
+		skb = skb_dma->skb;
+		skb_dma->skb = NULL; /* Hand over to network stack */
+		skb_pull(skb, sizeof(*hdr));
+		skb_trim(skb, hdr->len);
+	}
 	skb->dev = netdev;
 
 	/* Only Raw-IP/QMAP is supported by this driver */
@@ -574,10 +605,14 @@ static void bam_dmux_rx_callback(void *data)
 {
 	struct bam_dmux_skb_dma *skb_dma = data;
 	struct bam_dmux *dmux = skb_dma->dmux;
-	struct sk_buff *skb = skb_dma->skb;
-	struct bam_dmux_hdr *hdr = (struct bam_dmux_hdr *)skb->data;
+	struct bam_dmux_hdr *hdr;
 
-	bam_dmux_skb_dma_unmap(skb_dma, DMA_FROM_DEVICE);
+	if (skb_dma->rx_virt) {
+		hdr = skb_dma->rx_virt; /* coherent RX: no skb to unmap */
+	} else {
+		bam_dmux_skb_dma_unmap(skb_dma, DMA_FROM_DEVICE);
+		hdr = (struct bam_dmux_hdr *)skb_dma->skb->data;
+	}
 
 	if (hdr->magic != BAM_DMUX_HDR_MAGIC) {
 		dev_err(dmux->dev, "Invalid magic in header: %#x\n", hdr->magic);
@@ -644,6 +679,9 @@ static void bam_dmux_free_skbs(struct bam_dmux_skb_dma skbs[],
 	for (i = 0; i < BAM_DMUX_NUM_SKB; i++) {
 		struct bam_dmux_skb_dma *skb_dma = &skbs[i];
 
+		if (skb_dma->rx_virt) /* coherent block freed at remove */
+			continue;
+
 		if (skb_dma->addr)
 			bam_dmux_skb_dma_unmap(skb_dma, dir);
 		if (skb_dma->skb) {
@@ -762,6 +800,71 @@ static int __maybe_unused bam_dmux_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int bam_dmux_alloc_coherent_rx(struct bam_dmux *dmux)
+{
+	struct device *dev = dmux->dev;
+	const struct bam_dmux_data *data = of_device_get_match_data(dev);
+	size_t size = BAM_DMUX_NUM_SKB * BAM_DMUX_BUFFER_SIZE;
+	u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
+	struct qcom_scm_vmperm dst[2];
+	int i, ret;
+
+	if (!data)
+		return 0;
+
+	if (!qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
+	dst[0].vmid = QCOM_SCM_VMID_HLOS;
+	dst[0].perm = QCOM_SCM_PERM_RW;
+	dst[1].vmid = data->vmid;
+	dst[1].perm = QCOM_SCM_PERM_RW;
+
+	dmux->rx_buf = dma_alloc_coherent(dev, size, &dmux->rx_buf_dma, GFP_KERNEL);
+	if (!dmux->rx_buf)
+		return -ENOMEM;
+
+	for (i = 0; i < BAM_DMUX_NUM_SKB; i++) {
+		dmux->rx_skbs[i].rx_virt = dmux->rx_buf + i * BAM_DMUX_BUFFER_SIZE;
+		dmux->rx_skbs[i].addr = dmux->rx_buf_dma + i * BAM_DMUX_BUFFER_SIZE;
+	}
+
+	ret = qcom_scm_assign_mem(dmux->rx_buf_dma, size, &src, dst, ARRAY_SIZE(dst));
+	if (ret) {
+		dev_err(dev, "SCM assign RX block failed: %d\n", ret);
+		dma_free_coherent(dev, size, dmux->rx_buf, dmux->rx_buf_dma);
+		dmux->rx_buf = NULL;
+		return ret;
+	}
+	dmux->rx_buf_perms = src;
+
+	return 0;
+}
+
+static void bam_dmux_free_coherent_rx(struct bam_dmux *dmux)
+{
+	struct qcom_scm_vmperm hlos = {
+		.vmid = QCOM_SCM_VMID_HLOS,
+		.perm = QCOM_SCM_PERM_RW,
+	};
+	size_t size = BAM_DMUX_NUM_SKB * BAM_DMUX_BUFFER_SIZE;
+
+	if (!dmux->rx_buf)
+		return;
+
+	if (dmux->rx_buf_perms) {
+		if (qcom_scm_assign_mem(dmux->rx_buf_dma, size, &dmux->rx_buf_perms,
+					&hlos, 1)) {
+			dev_err(dmux->dev, "SCM reclaim RX block failed; leaking\n");
+			return;
+		}
+		dmux->rx_buf_perms = 0;
+	}
+
+	dma_free_coherent(dmux->dev, size, dmux->rx_buf, dmux->rx_buf_dma);
+	dmux->rx_buf = NULL;
+}
+
 static int bam_dmux_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -809,6 +912,10 @@ static int bam_dmux_probe(struct platform_device *pdev)
 		dmux->tx_skbs[i].dmux = dmux;
 	}
 
+	ret = bam_dmux_alloc_coherent_rx(dmux);
+	if (ret)
+		return ret;
+
 	/* Runtime PM manages our own power vote.
 	 * Note that the RX path may be active even if we are runtime suspended,
 	 * since it is controlled by the remote side.
@@ -845,6 +952,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
 err_disable_pm:
 	pm_runtime_disable(dev);
 	pm_runtime_dont_use_autosuspend(dev);
+	bam_dmux_free_coherent_rx(dmux);
 	return ret;
 }
 
@@ -879,13 +987,19 @@ static void bam_dmux_remove(struct platform_device *pdev)
 	disable_irq(dmux->pc_irq);
 	bam_dmux_power_off(dmux);
 	bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
+	bam_dmux_free_coherent_rx(dmux);
 }
 
 static const struct dev_pm_ops bam_dmux_pm_ops = {
 	SET_RUNTIME_PM_OPS(bam_dmux_runtime_suspend, bam_dmux_runtime_resume, NULL)
 };
 
+static const struct bam_dmux_data shikra_data = {
+	.vmid = QCOM_SCM_VMID_NAV,
+};
+
 static const struct of_device_id bam_dmux_of_match[] = {
+	{ .compatible = "qcom,shikra-bam-dmux", .data = &shikra_data },
 	{ .compatible = "qcom,bam-dmux" },
 	{ /* sentinel */ }
 };

-- 
2.34.1


