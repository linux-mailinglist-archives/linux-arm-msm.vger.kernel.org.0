Return-Path: <linux-arm-msm+bounces-116005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l+RLMBJXRmqPRAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:18:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A74786F7756
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:18:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BxdWsIHp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LvHmeT0P;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116005-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116005-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50C6B30B5596
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902EB47DD57;
	Thu,  2 Jul 2026 12:09:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ADE47A0BC
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:08:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994141; cv=none; b=c5fTjm443j+T2bdBdNkdM+I6k9Win0MAYMr40JV94eum3ApGDYdqMBiLLp9bLlAxwYMhteY40GvR1h2v+6MMs1C8DD1wxWt8ERhK3Imy/vRMfu3A6utB2/EVMoqzmeXaR2fAVE/cdJ+kL6MGY56mOJDCdS325pyHHWEkRgXn2Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994141; c=relaxed/simple;
	bh=od2cNrwEx23Z+E4OwrIvnrmRbmU4J1yIpnbYsKn7ksc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ogkcQjbX9vhb70mgWO3PlD06w9AnZoEkhS97KAdDu05kPd1h/mQ+Oi4gJCWPXnHPPF0RTARk9vljJSoaLP/NbhkOUaviHSMp8Y+T4lgwVF3E51csM4hWdYXTUTXON18lINN0ilRH+pY0FST92dV5VZqFuBkINq3Hzj33uvFYoRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BxdWsIHp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LvHmeT0P; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629vErZ3460387
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WqUbFffd94CJdYg+tgT60cVAVIRk6IpevQHF0pQaKzI=; b=BxdWsIHpYGQLZXjO
	dJkqbhdzp8isewUp87DbAEA2/swjK4qe0gPIt2eDWvvlprqTcMU/Zwn9TEoKGEtf
	kDe1VTEH1h2L4gSIFblHNI7yh31jk6E4HkmfeQC3p1fMaMHed1a9y2kJg+O5ZOIO
	eST7tbw02YIWtmqBO5iJl3IKF6VXJthEHGpDfiUkWRTTrhMBgLIQu6tJJaZNGoox
	gAFrFiwmCy33QVHaT2DHq0EwPl34Ti7u4/PKsI+FO90u36b4hKBerZ8Nnb4ov8yJ
	6GFmXr4aEBuFhqMwKhQRhkDfyyOl4My/tp9XF7ZcPHpJGw5B2uZOAmR9Q8Nvxj5L
	yb5/Nw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb1rp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:08:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21be5bb4so8697461cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994136; x=1783598936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqUbFffd94CJdYg+tgT60cVAVIRk6IpevQHF0pQaKzI=;
        b=LvHmeT0PSxJWu7P5EknOSz4YvH1ky0GXZ8/lrTKe0Qpl3tn0z6v2KLacH8Y7YUJBeS
         iORQGfvlkTm6vuWk7QDOnlZPxMbSvgBedrE24GTgD8isX2pLDvXt9kjvm1Ig+8wWzqfo
         /dV/nipLR1uoS2pZVUaheB4fuHNt3moPjz0zbWSnvWTTr6jfYKfL6qf8rTymckDwtRP6
         pDAOUaUn9uDh6U7CdHTuylMjo6jNNstxGIcg8GPrBXYXTBNISKLEhUjNPZW4MkL+OkJt
         6DBPCtQWpDl1U/ACkWGSmFFasZnMzYsFtsOfsRbBC8OXtGPzWz1wgRHOFfJCKhpzEOA9
         uK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994136; x=1783598936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WqUbFffd94CJdYg+tgT60cVAVIRk6IpevQHF0pQaKzI=;
        b=HHA1HGC5SW5t2XiZJVXkE23fqWfSPJ8qw6DzC1bOU6IUgJnPS9T/h+q7GI4G/6y51B
         PMKddTtYMDGVSY8o4xT08BVs5UauHd6jJaStQqZeSCyco708HNFiuTWakqh4dCnS6Ooa
         mO0opUAnf0KKfq5bJUSVQJ1VuCjvwe7Y7OD9jzLD5aM0C+/NqxlxYPX483qfG+r1PkWT
         5cc9vi13frOgAZ4YpmnFZJ9za4/bVxOxKf3vA+GRV/Zufcsm9gwcwsjRKtNWjfzGeKu1
         HlQvGN7q1rkYSWWWHrY243ydStmmm0ogtLPTl42gzQehWmFTokRAi1Ij2HUiQYFrzqzV
         C5Ew==
X-Gm-Message-State: AOJu0YyYRnIh4MhSppHrI1nyaz6QlxErxRm/dljKnocgHekbeKTtqQ7l
	suzFs8kLB+UulYsW7GwJzthMozQ9Z/S1G9mztyq2ezTH0ghnDk0wTCw9aa7nkTtxvqtEOH3mQ1f
	RX6E5xBh+UC7qQ4bYuvlu0w4o0D1Wg2bbvr8x+lY7KROpdSPaW+yDpq5Aw6ZfknoHcb/w
X-Gm-Gg: AfdE7cl1qRzsOA5dAjoUB+0nbGLII9R0gVWwqPP/zaX1DtyIWKdIg3nzmMo0procKRA
	XzxH+VFcReOvRe3pDUASTe2Z67hWFlViaoYu79eGFtRiZexUYv3qysd5KFNtyWFDEDYeCzjRen5
	EfkbvtZWdJ0NTGdZ+tNBqnGkGJU9Uir/7hy/to4Kqcc9yD0dGxx8ZJRCXg4tp1xh3koL4eUna6W
	M0eHK2Yq0J8fdnyp2to2H4qENrr0msOucAseTbgwfPnaCiuPr4h+J1/BxKQpAfNKde7T6ZUqy6S
	AcYZJOvhh84JnyLm1GZ77AlXPeHk/AVdtiSmPE8oe3idf4ZuPIWKofudKBc8zorq8DjuvW0uMZo
	RUbzHWBURJJYFZHbQ16wazjYLl73aA8KZ8Fw=
X-Received: by 2002:a05:622a:13c8:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c26b25b59mr58048431cf.8.1782994136137;
        Thu, 02 Jul 2026 05:08:56 -0700 (PDT)
X-Received: by 2002:a05:622a:13c8:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c26b25b59mr58048051cf.8.1782994135600;
        Thu, 02 Jul 2026 05:08:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628efefsm120580566b.32.2026.07.02.05.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:08:54 -0700 (PDT)
Message-ID: <a1151605-242f-4044-b0cb-7decf643e83e@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:08:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] arm64: dts: qcom: Enable SD card for Shikra EVK
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260702073354.3641966-1-monish.chunara@oss.qualcomm.com>
 <20260702073354.3641966-3-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702073354.3641966-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -_kFfUHqR_UakY6SxO27NbO_DIp0a75D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyNyBTYWx0ZWRfX+qgYTRWnQO9G
 HeW9YZIghFpRoE666A6u73dUThvTW72uYN7uHUfwRhPo8u77Kok3DrezsBQtUnl9vdrTZe/viR3
 XHPRPDMG9+W62Qq+qXeth5e7VFzvdzA=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a4654d8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vBACkDl9X50tgIqftl8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyNyBTYWx0ZWRfX1pGLEKke7Zwk
 /Pg5l0uMy/vdV2TPTI5/LWBM8XTMv0Yt8gUuuNYlM6tpDJsXEfRDuLtRnnp2UqvJgPuDBJaF2Gp
 sfJZVfxKes7jSFKZpen7EiW06UNnYy1i0cK/yYuGXs7dqoqHNgyaH8zQs6B/zDX/RBp63mnaZW+
 X0o7nsQ6cVInM3X1HkW6Ehd0GDosSHQuNzqrvUVqvBE9r1RaFXFQiUSYJ1s3gafaGOat9EqxQk6
 b+VO1tZvzpxZU9kEzxFJs0J2g4ZUVqDzr1iWZszyIAz+tNmGBZPdXYiAUC1nK4P1DpuS5a6ciLC
 5AYgwRO3KNJT4REvMW3TGX9TJy/zDYdrXyqdQ8yoPycNpHDXch7kvvlFuQEPpRfI44AkxGNWAro
 alyUuz7gDEs+xn5B+BY5xwqqsXDy4XLn57uiPb/fFUTTGzpUKrbnaOW6/KfubSceWyviXAUDvlv
 E1ObnzzTPN962AqSUbA==
X-Proofpoint-ORIG-GUID: -_kFfUHqR_UakY6SxO27NbO_DIp0a75D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116005-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A74786F7756

On 7/2/26 9:33 AM, Monish Chunara wrote:
> Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
> vmmc/vqmmc regulators and gpio-based card detection for each board
> variant.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

