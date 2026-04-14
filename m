Return-Path: <linux-arm-msm+bounces-103199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMd0O3qB3mnkFAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:03:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B913FD690
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B858A307C8B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E797E317152;
	Tue, 14 Apr 2026 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fasTXj5X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OA4Pv/zH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFC71E2858
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189441; cv=none; b=MIr8V+XFsmZ3Ll99NEALIVjVkIkj6bimWsm1ZSZ7fb6GH35Chyl1ffkDOznrG3db63NucbWM99X7+O1dX1ePKN9wQ0jNvFOVj8G1LmjrronBYO+ohl0mX95TJbRKFyjLSJIPcwNGga5Md9eg9hXr/y5K2y3TjRKYMvqlZYw2W+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189441; c=relaxed/simple;
	bh=JKiWmg8ffkxoKEYWHQrhErMIVIkRpAjY0NU58RnL+pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjD9vZWcERpiHAuCNvYZDv5bfyq56OoEXOR5PWnvNJhldb0PlRrgj4voPXJWl25DfugQaYLa8iCV5jELqfEt+6j+yNsrQUIqNQcwO52uIeFa2kqqkwHg6heXOkBkLR9TqflrOvZl10Vd9BxC1I/eG17GYaUlggZn5wjGuDczsGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fasTXj5X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OA4Pv/zH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHbZJ41701772
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KYapHT8xNp4EtV3Te+VNJJiO
	yGb0k3FBeWxnUftoqwQ=; b=fasTXj5Xi3nWnE5FByBFAiYVCaWEi5HrziB0N06A
	eMhC6bW/jjugwyLfwc8aL3+ggJbL3gONbXk8C1sQt172EyeThq5Ie0zcvumkpXAa
	KX6o5d1PnzNZj3RrecrkkbNZp5QrEAOXizv2jZ0E4e4qnU0fC3gam/u1WeKmbqUx
	RKmo9ukl67Y4ZOzT/R5INdNrh/qCP2ZQqaCIq2W1sW9kdx3oqyrMVYKcAY+Oj138
	wdBPokzMRYLpvJZ71/TqOKI2HwgUXS5Cpyoh651r8oB+RBHfvAmGVrJ4rdsP+GhZ
	wDKcFACuD0DjFrO1EVAA1kyURpc7g8k57DqkMk1vDwqfaw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56r2r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:57:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b31cff27fso19971831cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189439; x=1776794239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KYapHT8xNp4EtV3Te+VNJJiOyGb0k3FBeWxnUftoqwQ=;
        b=OA4Pv/zHx9J+CvCCFP1cWtUj7eh1waz4S2Loxhf6yCUqCWfKxMrspH91W7K2yLZlvO
         X/VHACKWFfpEVD+/jE0F2HxuqtXNwynDBrVuAQ4xjHmY9OXZhbRvjtmEhj4HvWp2Y+6w
         HNZguJpZtcySL+Ik6hv6jAdSo+o+51BzyZE2clhoJXU154jD/7jtOYKPCpGM/gDG/agH
         5i3GrPhrulsZ5oOwdyt8mfaDNGw+X+XWrMA2utQgXIsWk+q0sQQK7wdippZRBkRQ+1hx
         5ENxPHxOgkIdOrPYmHFcYYEadHMX9eKP6BpAc0zwuM3miAmFY05OsBECVEURKsmFQ1a9
         GQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189439; x=1776794239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYapHT8xNp4EtV3Te+VNJJiOyGb0k3FBeWxnUftoqwQ=;
        b=YfwY4GIXIiGnUWvJOb85eCX686d2JzAOBRcANiETJKzdsahfDl7M6o1rOdoNoBL+Hr
         JIPR1OjOOgSKvVpFxHvShLjotZbHCfJiFTnZYmcRVYKovhQkdVZFBo+XZuFfFdetvwRr
         tEjxiop838Sbpp3hvvtfl1fmuhA10IUidGk2e+sd4qxTRsiWEv11X5eOYkSAWX4I/3AU
         SIHD36xEWn8FJDlsPYryweOFJpLCSSR6iuXBT6SvKJGGJdW1vsoi4Fs5Te2BLLiCBzxn
         bTl62x9dDjI+ptlqzyWPag53ZoSNMoBjbeKFsenD8lXrRe3/3hcDt9UigergCcos7PKP
         5JPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OOhYSDb1m8u/9qA5D4cdwBs+/Z69OxquHtNuum1idJAHWlGFCmJlCj9WIz6nKQ3LBQ9vT9yhnBaoEjY0y@vger.kernel.org
X-Gm-Message-State: AOJu0YyvqfFrY6FldDKrMZ5I0vezGN6psj6/8kuSZVhkVFhN/nkZCZsD
	T22RodmLqENTclH6lUZ7o+Nemvh/+Doisa3do2CkfPQHlAoA+sf26c9Ywra46iycdCAEw/djNaI
	quGUTreAVnW1dLL6/rKFidfBR0Ss61SUYWYdkhImrwx/9bY6mU2WHN+FNRvYnftU5rfEg
X-Gm-Gg: AeBDieuXhpuiF/RsowBmw0PTb3gfjLYzi/nMLxttItnR+bfYI200aeS/FN9UMSKmhqq
	giPvfeq7zJOxbdypXq/QFHvq+bGXiYFZlb7RV77rWuEcpgpC2bI8ikAZ5m/dA9I+k8bYViVoZJ1
	Inb8ZVVVKAvumJ8sHOEhXTGEyurMqmY9E/p+qqXXbxc1NQBue0m/XwQlUnJHOvBAJ8feEHJJkzv
	O4MiZDwlezo6CpWJYhGpZSMT84bNNZ6R4dXbE97+UJ554yGJ7v9FdK3VzGtPwEKiudGXtjJtvWy
	W/OzzM02mEKosofOatNivbNZS8ReAEZqd+mdGs1V1EvZCzVDQ50RtDhR/MQ/9CmQ2dxs983XCfo
	F/OfnUUCjL8ZffIUMs7DYOmiHKtBUd/a/gAA9dMmA8bijcpAeVG4sL5cAm8vOVDJVHIU2V0Epve
	ltg9cmMDztyBsMZkPvEM0BCiiZZ80oMjU3oM+SkAQF+/cpsA==
X-Received: by 2002:a05:622a:d0f:b0:509:372e:35f5 with SMTP id d75a77b69052e-50dd5c0335bmr233791281cf.55.1776189438792;
        Tue, 14 Apr 2026 10:57:18 -0700 (PDT)
X-Received: by 2002:a05:622a:d0f:b0:509:372e:35f5 with SMTP id d75a77b69052e-50dd5c0335bmr233790781cf.55.1776189438156;
        Tue, 14 Apr 2026 10:57:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e7c057520sm14202001fa.16.2026.04.14.10.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:57:17 -0700 (PDT)
Date: Tue, 14 Apr 2026 20:57:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop RPMh CXO clocks from QMP
 PHYs
Message-ID: <g6nfj6ajyfyjaw53wewgwl52qri4ql46vtc4jcq3emnayk354g@bubpxtr5t7mi>
References: <20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-v1-1-ab12d77c4aec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-v1-1-ab12d77c4aec@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FmGGNQmisZp37dRu3wr9yN4SForFH4ph
X-Proofpoint-GUID: FmGGNQmisZp37dRu3wr9yN4SForFH4ph
X-Authority-Analysis: v=2.4 cv=K9gS2SWI c=1 sm=1 tr=0 ts=69de7fff cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9Jiz1KvnAC8adWN42FAA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2NyBTYWx0ZWRfX+m58/EWB6MRG
 k3pamyFBLE017P6DtC1t0zIns/LAlcxPF/aXavhtOjyvHcIRvC2cK5JSOGoQRco3xGJUo4UZqJf
 5BOinUIMJW79BodLRA4BD74aeo+paQx7YOAoOEeA9MnxXdsfhdlmUfU5FA2HF/cTtvcUoRey4F+
 V3QlgwloOSDPTUa5oht8eku/9imD30Yrjd0YsCtww8mDwosN699Dku+KLaMeZ878zL1+0raHtku
 UBCJ5De5j5guwkw9PsLSEKOVwWS+v9Jef7L79InjjeAEn7Ad7PPijxwkUtIvELy2NYrsGB4GPIZ
 nznmj5B3HmlKNJ6YahtE51/qDI/2B4s0Od8YsISDHEoFIrC9+bQxjMtSuMojBkPOFjkSTKYCKG5
 USIiERoV+nhXMOpIy8j3PmmIUNshISb9/JWik4kKkyElSfxSMZHwAzP+oVdXwavlAXcazvw3qQ6
 FLRAIx28hbNz97bDVUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140167
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103199-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3B913FD690
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 08:05:51PM +0300, Abel Vesa wrote:
> On Glymur, all QMP PHYs except the one used by USB SS0 take their
> reference clock from the TCSR clock controller. Since these TCSR clocks
> already derive from RPMH_CXO_CLK as their sole parent, there is no need
> to provide an extra `clkref` clock to the PHY nodes.
> 
> Drop the extra RPMh CXO clock inputs and use the TCSR clocks as the PHY
> reference clocks instead.
> 
> This also fixes the devicetree schema validation, as the bindings do not
> allow a separate `clkref` clock.
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/r/20260410145205.GA554754-robh@kernel.org/
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

