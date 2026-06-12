Return-Path: <linux-arm-msm+bounces-112903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EpR9CrHQK2o7FgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:26:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2816783C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:26:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YSA4uiDa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hdKcGVtB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112903-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112903-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2770E300EC4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033DB3A6B66;
	Fri, 12 Jun 2026 09:25:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1EA3955CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:25:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256325; cv=none; b=T0QP7LGDFcLL+7SXJK0Wj8maFm5Q6cZc24fgDgzzdH0VOAJnAWHUMZYsvI5TZ3CMzw2OYfvhryZUM7WCD1koM2xwHqK7B/Y6kpA3uG7DYfregXHwN+Z5GsNGrWR5nm994cGLtOCwrvYxKou1kxPfehjAtrV0yF6KDq2Yxwt0LJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256325; c=relaxed/simple;
	bh=+F+SQla3BxZLceuQ3pbmtj0WLzHI1Av3PT7HQH22Yoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiRTqPGi+f0NGzkslwPvhiBktbca4MhMVNsQF8z8aM3q0drTUSv9JUUad7YzqVPo0/32mtY+SM7fmt5NO4V5SuDJCSBvAT+cwHf6ts5X4RL4NAR6V/Fw/LPRCMZYDqKWVuVzfFK6Z8Jh9WKmQF1iVC9NffDE+oEJlOu7ZLa3SFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSA4uiDa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdKcGVtB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39WOP2502703
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86P90UhEAGLlR99BxWM0Y431niqx7bECQTX4+J6kHUc=; b=YSA4uiDahdSOpH5a
	KmBPpsXdPLG4TDwzjWTNN+K5wS+PBei5WY2sZd02kNBXKKoowNO9wlvIdY/cGH/8
	aqIDGyYZp9dJXed0RG4MOdb8LXT3MQGGB3Kh1FQhM536fsAEBtSge0XgPqyXK4XD
	Kid2DcSSE5hCZ8eb/wNhycpHIN+2/S9o2VgFN72qArlZsryc/KjqXJBhQRlsJhbK
	dZVfViQLBKUXD0z9E4/P1G95uhC+J+Yepz0m7VylzrbhkhK//k2Nz9L4kWXxL56q
	A+5Nh90tSSxtcRmmlc1g8k7JUHBcBpWFTW7wByS+xIGn5PVmnOyT8mS5Ur8M/Dt7
	hg+F6g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd30kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:25:21 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963b744b61cso723858241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 02:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256320; x=1781861120; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=86P90UhEAGLlR99BxWM0Y431niqx7bECQTX4+J6kHUc=;
        b=hdKcGVtBFIRIGpf4sNpGbxaVoTksDYLx7aWj7Pbeh4wdw0WLN+2xJGzNtSXjf7NlJH
         OKubU7H2DXgHLKGmr5Xso+XAndU30rvw4V4KAW+gCH+uq0tixfFTTYi6CFZh+/gpqKyo
         FRsEXX2/tatwYfJmFyZ8xAncPAXxS7UREqm8oYgm9sZ0xxIsQsFxNa65y8dhimCwIOhD
         mj3JxaWPIHnUue82N7THL3VqyrDzDa+pp/bIknvX8n9dHfUVk8F85DoFmmaY3tST1mxZ
         G5jPZgZBEblXJL2DekD9SzsrGLdzWg1S+ghurRw6BIg27C2OQHLG5Oxms6uhvphX56Hh
         GacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256320; x=1781861120;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86P90UhEAGLlR99BxWM0Y431niqx7bECQTX4+J6kHUc=;
        b=nFyqHzKZc/CUcPaFgdMOAjgVmIRxEt0+ZLbb130QwWUJK/3MXZTkh8YzFWETcfl8wb
         ATaIeLlwfYOExKvwDfrQvrhfIPpCXlNFbt97aOrNVRBM6VBA5PnnmfR4BODn/FjWPhLO
         VOkCHh4LUmOPSBJfDb2XmyC7ViI1nNPcNaVZd/NEGGdiKlcdNXCJVrBTpfLLY2Hexsl8
         rZPn5lmuTuX1RRxixrr6jxJzGVlAlF15pZWT3PMyMbkfNFhMZ7xxigoJ1RKz9/dP+KLa
         YAwR51Y3bsgeejirMhOPmh9PX4iR5+w9b0c5wJgVczwgFw5xHaIqwWmveNDRpi54wV3t
         jE9g==
X-Forwarded-Encrypted: i=1; AFNElJ/OS6wv0mjbKJ4b5AZ/xVmcfkWpoPmIGBpoa8w7SvO0gGz7arrMZjyH5KAUQXuvz+TDKDtkBXgy4DyDlazl@vger.kernel.org
X-Gm-Message-State: AOJu0YxWsD+319/D8rb1GjSJWkRGTB1DX8eFMNmTpN7eUCBOTuCuVIF0
	MEeDytgWrSM23wJHwer7vg9HDUqVX0hwjXr4vf89RwHReO6IY6gNo48x06+9R/4/HYAh1U9/2Ds
	Y8he5HgXAK1pEW7bph/9Yvl6O64e4J8StLLfvbY4VAvKhWtuleGYNhj2X/jpa5skuqpo/
X-Gm-Gg: Acq92OGVZI3fP0bbwyhnu+FhC8YAug4sSfQ8AAA8/AEDJDDZ7+A0OicWvsa4/PPXOM0
	S98CnokKgn+EVFxBkF+WMVgP8fLpV7s6t0sZ9LRGhpiW+97IimynShNFYCBnnv7xkotXjAH/cf6
	nTMlGnC+a4eNi1Z5aygtXsoGqZowWOysjECIpLgYwgPRPw4zkQyCGu9TzTS1W3jBym6jVKd/jzH
	ITBvt1a7BPJ30YN15dzvLIwCegphAnjEwoz6jnJ+dVcovg863nfD5gv0Sme1wtJi/7DAXc5PFhR
	zLf/zF8ZU+BolEZm+pHzce/mIKSY5eNw3l09lskeUfYgfxyFPbwyFaQWQosSAuWbV0+EkldxRA3
	4l5q2INhjpMepYt2TCPLl+PFIRxKqIDddlmF4yzAIA+nF4CYLsG3IlDXToPo2Qhn5+DgCZrqKUJ
	Oz20/BKbeqAKqV7tpxp9bu6JqCWp1CmLdjcFs=
X-Received: by 2002:a05:6102:c4d:b0:633:c6c4:b32c with SMTP id ada2fe7eead31-71e88c4e2bdmr759157137.15.1781256320186;
        Fri, 12 Jun 2026 02:25:20 -0700 (PDT)
X-Received: by 2002:a05:6102:c4d:b0:633:c6c4:b32c with SMTP id ada2fe7eead31-71e88c4e2bdmr759145137.15.1781256319706;
        Fri, 12 Jun 2026 02:25:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c4aa1asm4974281fa.10.2026.06.12.02.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:18 -0700 (PDT)
Date: Fri, 12 Jun 2026 12:25:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
Message-ID: <nkv3q4nzsoew52ti32x3oy6tokjxgtjeyvq7kvwsyr5w5ztm44@kitmsxty4dqs>
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
 <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
 <e2c54638-2849-40dc-9c68-636c04719814@oss.qualcomm.com>
 <dc88df0c-0be0-4a29-9893-032d6c65a45e@oss.qualcomm.com>
 <574a1ab4-293e-4daf-bad5-8dd886a8178b@oss.qualcomm.com>
 <10f2cd7b-4f87-4581-8065-3c140ee473c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10f2cd7b-4f87-4581-8065-3c140ee473c1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uEg6g0EornJEiJ3QkaYY_S5S092jpfEM
X-Proofpoint-GUID: uEg6g0EornJEiJ3QkaYY_S5S092jpfEM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX5Uxv79E6dPgK
 f4HishtOFWcZ0kNJgYau3vVwXJlQ7LeqwxsecvQjNiOF0PKMcHo2kT78/HVK1wn3dzbjmlDCKAD
 wnXWjaKMoFZ9Hso6t9wpfA3/ZqqksCZ+FWln+nhsSK//4R2LlYZp80DByrhwCwSjpmhraq+xOx5
 LRJfr6CPZhgM6xiHmjp2Szv8VQ+KmUYThVj8zjVqSGN2TTy0CzoKsbE8iENAlFPu5u4c7Yk291a
 cRDJDmnT602QVQCjItuKFGKFGd1ZtbE2ZdRVSMoE+CA5YPGAmx31kl9eW+ZvYODC171Ab1iA48H
 8xwPSIfvn2ikK6pZrImQ5Bdoj3Jl5GUcQ6SZ8VLVLCQPFqv0Ge1p6xGYiifyjnFOjHBkWbvYoZ9
 oskCWZQt8RSmWDvrsxGhd0ycvj8IA4POoLmLLv/CuztUcJn9bBHdHD54kWrfSN5vgclX5NpOTBF
 vSExkN4C8B4/cKgAiqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX22d2EsFepL/7
 dHR9jP0R7KPrtben5ImYKLMg01aUEyj11nDDOZsg6S5nMGW1qAJbRJ2Rv62yotQ13uSwxh/oyXq
 lYQLWjXpTTzs4bbI+YgevtxYsq/CAzs=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2bd081 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=crNuaYni8ADyvu1K6ygA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112903-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,kitmsxty4dqs:mid];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:abelvesa@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A2816783C1

On Fri, May 15, 2026 at 02:15:55PM +0300, Dmitry Baryshkov wrote:
> On 15/05/2026 14:13, Konrad Dybcio wrote:
> > On 5/15/26 1:09 PM, Dmitry Baryshkov wrote:
> > > On 15/05/2026 14:03, Konrad Dybcio wrote:
> > > > On 5/15/26 1:01 PM, Dmitry Baryshkov wrote:
> > > > > On 15/05/2026 14:00, Konrad Dybcio wrote:
> > > > > > On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
> > > > > > > With the default PSCI suspend value for cluster idle state Lenovo Yoga
> > > > > > > C630 isn't stable enough. For example it might reset if display device
> > > > > > > isn't probed early enough. Drop one of the bits from the PSCI suspend
> > > > > > > value to make C630 work in stable way.
> > > > > > > 
> > > > > > > Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
> > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >     arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
> > > > > > >     1 file changed, 4 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > > > > > > index e41200839dbe..e6c67016552a 100644
> > > > > > > --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > > > > > > +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > > > > > > @@ -347,6 +347,10 @@ &cdsp_pas {
> > > > > > >         status = "okay";
> > > > > > >     };
> > > > > > >     +&cluster_sleep_0 {
> > > > > > > +    arm,psci-suspend-param = <0x41003244>;
> > > > > > > +};
> > > > > > 
> > > > > > Is it better if you do hack in a
> > > > > > 
> > > > > > qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");
> > > > > 
> > > > > Any clarification? Then I can try hacking it in.
> > > > 
> > > > This will send a message to AOSS to intrusct it to prevent CX from
> > > > collapsing
> > > 
> > > This sounds like a dirty hack. I think, hacking psci-suspend-param is a lesser evil.
> > 
> > Yes, that dirty hack is supposed to help us understand why this is an issue
> > in the first place. Especially since it only came around at some point
> > (although I suppose you're not really happy with spending a day bisecting
> > when exactly)
> 
> A similar patch has, I think, always been in any laptop tree targeting c630.
> It could having been a disablement of sync state, a removal of cluster sleep
> or something similar.

And gracious ping.... Can we sort this out somehow?

> 
> > 
> > > I know that we should spend time on understanding, what should vote on CX instead, but having the issue only on C630 doesn't really help. Maybe it will go away once I can sort out the gcc / dispcc / mdss issue on SDM845 & SM8150.
> > 
> > If it's a "not enough votes" type issue, it can vary from device to
> > device, from unit to unit, depending on your luck in the silicon
> > lottery
> > 
> > Konrad
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

