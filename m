Return-Path: <linux-arm-msm+bounces-101318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EVcMqL/zGnRYgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:21:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EB6379480
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0081A300A768
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755D23DC4CE;
	Wed,  1 Apr 2026 11:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1/unxNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iz+oa4Np"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CF63E0C72
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042186; cv=none; b=lFRq2rSOBaWsKu7ZcV/ebVkAqfqDzhFO/w96sE6xLyU6DP3BpzQXY8j4WwsG93SSxNrqyebiGiX04djJDZRQ8wrIASeehcrNZG0Z2sfZPhN2PTRfIeL8vY27IGgJ+dcauT8ArfHV1J75q2EIgTNWkllSKdpuI9GP0KIK+2XjHv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042186; c=relaxed/simple;
	bh=qrjimdc8fUGGL6e/x+go4AG4L1NYu4PPzmNfdhrjJ6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHI3xkvIzW80P5MqOAGDnpHEYubn7rVB+MVcbKQ250v3avgHlxoFVVqb4fCok+mj96WuHDdYWQqByULr+VWVfNRWCBUQfZ/kzJ1QhwHq82TGayAAsQ8SEEzErM1Ea+wvlIKNRFDmGHT6La2ngrTUx36As1Lz5YH98XvGe1BIeLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1/unxNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iz+oa4Np; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317ErxW4106755
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4bX2wJqvWiPBo1lENEnVQEMD
	UI/E0+pzixl0+6Wm0Ac=; b=g1/unxNBlZnuDn++tEhNuFSbTfQGEIbnlQAlRkk4
	9J83KGLtv5wyT0SYfkcrKXbw68ODsB7o5sHuxJi/EStSFAj5yjy8WxasTvcRgt/2
	4A6h8EmNnJmVGmiV508JcpAKrZw+pO1v0o4ya9ksv8HjAwkSQl2z8IztA6YLvQ2V
	MxjIR0ijINNi4JufsQz82YPFXoxrQ2mpp+/LdKyIJmEELR4cc4YePtK5rUcp04S9
	K/0Qnbi5hCjtuEIWvyyqYYVjc1BGyEj/GslmpnQkVZ4LuWWlmHYrRbttRMpD6QxA
	9xH5FtlLZdEouRBPENAp1vVKx/NqFfp6E1Z8JL6usdhzkQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt90ywc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:16:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090e08dcfcso76052591cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775042183; x=1775646983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4bX2wJqvWiPBo1lENEnVQEMDUI/E0+pzixl0+6Wm0Ac=;
        b=iz+oa4NprYIihHwYUUUrthO1pidajaYP48A0dERAYU1+YEm98TsCHZB2vhPFcBHRrD
         ceBElgTQY+Ixex3McAyhk0MTYQYihyKO4myT1eZwj6i2oBueO4ny5Uo3BxgdSzLn5o+b
         egutsrjopStG6vZw93vzbX5563xM9gtQeiuf1zWSYOZZ7uUTMZg1s79dBJ8eU6S60BfB
         CPQtwtshtDxXtWyC5nInwhgTnbWk3V14cYk45jshUhtBt8HDfs9syY+g38sdHrxG9NIo
         7hT/tWOkpOnQGzGNv+EbNabWin3lX1EX4XBpzsufFSOc5g2cf1qcsLJOBCn9PC6sH7J3
         Gg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042183; x=1775646983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bX2wJqvWiPBo1lENEnVQEMDUI/E0+pzixl0+6Wm0Ac=;
        b=enShWDc3d4pZW8Rbo+oLjjScG5k3yeT2n7Qpo9e3VKD6llb0jEMM32ZqCVNUgMSs/S
         UVXvTfRx+rbMPr0qwRhIfBe3THzramP7B/hZsWSgNGVTPP1mQsuW3k1IPATGDDGbTbiR
         GzbI2yOmH7X+R3PlgoD21ccgnoqc3K4NdicKW4Vor2D88s758GJV7FVhjIL7q53yvev+
         TOUCFZEcZXRh9bq5+YyFf3KZMtqMztcfRHDp/tMdWiCNKh6VgpEYWDbyFfhAZAEa2KEI
         tWI44jDDyBLlM+nHCwEwscGySHgSy8Xt8VK+FcYWbbGSA5z8Je71OmzGR0Lwqtqo4Rey
         6LKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWquKcAbJhFl1+IP7kXcL8LeFvCOSpD/gez7lkxwkIeDpTVCfGmOplDoe4lyqWCZP8yJs+Vo5LU37dM8lyK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5NIC1Vuc/tNkhwhJrZV7x202y59OKefbh9zuyZ3baKzQCUO4J
	iIBHN9nnspSAaawTx56uZLmHWiMmUx0uS4W8nX4sNHJMWpaEJnAtM1ugfhODgUPOJAWKliQSOs5
	as/w6K2KLHm3V8W0n6+kJ1FjtArptZg+aClx3sXPsTulk25IWL95G0TburLQIY1stqTcj
X-Gm-Gg: ATEYQzwUMzhTStFUdmJurnSNa+kwz3jWXA9c9OZOIuzab7GhmlIfGAFXGHzsZgekVya
	UgTqMNgJ3w6Y2pCtbAcXrvzH2a15LgNkNP4xDLRpZYrTx64f7mWRJgzTONTiIlPq9gP7edD7ZFw
	f4T6lYf9z70P7iNKQoIq6RBaCCRPNsOH7KQXdXoruGv/6D5ZWkFa1F5TAp/9FuZlsDcJOIZcw7L
	on1oUsau1AX1+v/khGTh/Rzmai7SQkvAWUojx+PejnXGQaWCyTEP3yPPigRnjnz720ZgJFVWWsg
	ddfWdFShGdQfhM3yflwnGrs2lumITXjeb1rOt/wS6tQIQuuJnba5CtoO1fi0oA+MVdWt3ePZNGh
	cfTG8Q5vtjAThWdIdrGmLeUn4FlWVpKYNao+a7sB0yXCTjv8BczvejxTXkFqHqQ8QfBc7w/bhdX
	5Q2Srd97hvlulWPH+NpjgoAr85WbIrkjH/Eyw=
X-Received: by 2002:a05:622a:580a:b0:50b:29a6:8696 with SMTP id d75a77b69052e-50d3bc2e0f7mr44673511cf.7.1775042183311;
        Wed, 01 Apr 2026 04:16:23 -0700 (PDT)
X-Received: by 2002:a05:622a:580a:b0:50b:29a6:8696 with SMTP id d75a77b69052e-50d3bc2e0f7mr44673021cf.7.1775042182841;
        Wed, 01 Apr 2026 04:16:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83903e44sm25698371fa.40.2026.04.01.04.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:16:21 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:16:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add qfprom efuse node
Message-ID: <edqobjetzofwvlxanmxtpbq6yzldy3monq5stbov6hctopycee@qvh4d47pxpvl>
References: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
 <20260331-milos-qfprom-v1-2-36017cc642db@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-milos-qfprom-v1-2-36017cc642db@pm.me>
X-Proofpoint-GUID: EIUDJ6wX4U6vsxBMA7kbKDuY4lO099KQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwMyBTYWx0ZWRfX+SZGvIqgwhmP
 T7S7CAPXZfhfM0LYFJdtJPK6ihrMBoDVd0EWB0DCsp3U2SyrktZE8RidPV1R3J+RfQpZ+3rERfe
 ewHev1aJlrKvTuvT99F3+UZ/CT17VJ2aLy3aFJS44+cL4303zXvc12Letf9FQ+WpUklHp7H3YXP
 TH0WTCKudPIDU/zN0/scSVOi1cZhekcFswUbkWJezBeSIixxOBEzJKB4G4xSxgPizTBf+8M5sZx
 bgG9ZYES/ip65YOSlefSeb731Nb2CgtIeDFLWO6k67+If+D/OjFBPbLKj4tfu+uhDr65uh0tAOw
 6wFnMQ8f0k90Z4KjXCrDceLtpeuMn1P8hZArrBCvPsjE5Htpb6qFj/IlgocvOTPOEX+vds6pTAI
 Q/nlWbtcMttytl7DvGRT0V5gyibf5aymQDS2od1dgnEEUWUaD2Red0fLE8ICXDzf4odishsSRKm
 76MATdozvI4AgQITxnA==
X-Proofpoint-ORIG-GUID: EIUDJ6wX4U6vsxBMA7kbKDuY4lO099KQ
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69ccfe88 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ukwwJ_iyby0_xtxX_Q4A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010103
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101318-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73EB6379480
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 02:25:07AM +0000, Alexander Koskovich wrote:
> Add the qfprom efuse node and describe where the GPU speedbin fuse is
> located on Milos.
> 
> Note that for SM7635-AB at least, the value is "221", the max frequency
> for this is 1050MHz. There's another speedbin out there for 1150MHz but
> we do not know the value for it so just document in this commit.
> 
> Once the value is discovered we should add the speedbins to the A810
> Adreno entry and update devicetree.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

