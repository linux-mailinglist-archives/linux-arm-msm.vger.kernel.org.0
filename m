Return-Path: <linux-arm-msm+bounces-117006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1SBeJIjzS2prdgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:27:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4AC7147F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:27:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="lNUbb/Ge";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=csgX6myC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117006-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117006-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C41083020FDA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF10436BEC;
	Mon,  6 Jul 2026 18:24:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7A13822A8
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 18:24:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362260; cv=none; b=Wo2lwtH/HRs+Ch9UHiCCP/bE3zrMQo22d8aLc424+q+fVtTOqhAleyA2gGHxZ4oDj+4S9xM21YNZzbH1ElP+SsWZbTOdWREa7IgBrxCLePWNfUyVSEdSvZaaPwbLIzKnxcbYR966oVl/RsJ0/S4ynajWcEyPJjuYS7Pc0Ask6qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362260; c=relaxed/simple;
	bh=kwPsWx3Lq+eORWtb/AZEuOV9MdYDT8Y8hkryWQSeGT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4Uh1UbVvW5qCahl/qTK6PMz9UOeek5hrEeXIJryBjCd8oszTJzlUhbo51zdzMjFrpEHeU1b6fhyUDe/8NBDxjTeeZ6OvqM5lLWXHnk2ej7Uf2Xg/Z+jhitax7+mMznMuUqG/ecGjqD50WTG3cwFRG0EIrtFQD/6z3DZ9gmygqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNUbb/Ge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csgX6myC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF7m3990240
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 18:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CcQRmc9BaCEAXdMMGYGlgduG
	dM0vGlhEkoGbgTNTQWU=; b=lNUbb/Ge+fiE6E3fUcv7Jw/FULk4oxkk1wkh3+Y1
	x/hKGfAgM3xzauwD1uGAU/9DjVbFIiTfu3EWo3Be3AtHEolg/IHDqmaEgMs/uO8z
	iSre4KhCH2Qyid8gtY7vz03VaPnXx4bUE4D4R8O2eWwsCfYdKJsYdv9MlzgM/YH7
	2/hFtwwscC4i/YOY6YuG6SrFlgFKOCCKALBi8TJwWjw1ViYpsqUv8u6FI5evO14v
	THkT6gWhTBU/oSiLH63A2g7h27vvFgZgUavkK30JEPuyfzwGJGIQn5cFZnp45Gqo
	4WOZLDOfUc1Df9rZpa4NJReR7OULlo06wc2b1/IvFQs4xw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gtbw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 18:24:18 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bdf87be987so528031e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783362258; x=1783967058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CcQRmc9BaCEAXdMMGYGlgduGdM0vGlhEkoGbgTNTQWU=;
        b=csgX6myCVkRzewoSH3m5Gd4t05UAxatc4YL0uzRTLXyAPNA5a+NTVrsbxSfjQxdue4
         Jd1fIqDdn/76nqOVxn1yoR7f9OGKngm0QhSvyyqaSPhvxSqqPxJsVqvkTn+FmCEHuwXh
         M0Q2zXXgqdlWzuSiUcSnwLElYQGjnyK6s2eTwr/LbckSJHrCJ4HSf6lAfVb2s8CLgujr
         vMoINer4jNqWMZOunMHGuEb8QGE7hI6Irh4iV1RHCvCVqrK0R+JS2GBSRuoYQGf7vdJY
         lT64V70d+2AyI+RzH8dLQ+3hM/jimdH1BaPZVSwgis99WuTswwF138lHkN+EaVuWYDwS
         3kyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362258; x=1783967058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcQRmc9BaCEAXdMMGYGlgduGdM0vGlhEkoGbgTNTQWU=;
        b=TN+cTOfxtElYwBcIOZQUSnilqSC7kBp359tb/0u3JG0yIxDBGEE8vnLxsJb7lIi64u
         o70SAnUZwPrnaT2feK+4kzjfb/PpYwqBwkENXhqffS4/qAlcwlkZ4ng4QQVPadwWrU/j
         MuVLhcuXNAxHWdvGSVcxbSALHNQJiZ2xQYAguzyGk/0OKTgrP1DCGItc+Z5LHZUNMLKf
         qQars0iL5KzOh0uRsh+X3ex3pN4ZcsUFdncRfPgmgTmE2vEYGr9cZFjI9WcaFreaHOiS
         SCRH4LZXqn6T6bBH3EcaqBiMDeVqlOcB+m45OX3+B2+ll5pu2ylNEj1F04Ix5HdrCl7F
         hieQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZ4S9jB29r7H3cTRMVwk0z0HivNb19dPnFrBjpJOCYscpteQZCIdfY0Qj8O39Hn4JdSt9TH2xtL9bUoFwK@vger.kernel.org
X-Gm-Message-State: AOJu0YyBGAE33djR6Q7U3WLDXd6pcLLdy3pGp1Ax9uxcFXamd9wS4LEv
	8ZBlhUOYHDRPrUld00ZAVLR/jmv9csrwZqZU7ZIyx3PNlHq9AzOw6GS1coXLGBvi83ba8yxKcug
	Wv/si0VXAU7ACY+8FCbF3vtbfpRLniUmz+zxfEq4QOMpdgTUYHbJwDPBrT9dJYiQB9wuu
X-Gm-Gg: AfdE7ckgHdpMzse8sKhA95RFjVCiDC473YeGzRPFUO+ml1PCPeS7M/3IJ7k8yA8nV0Q
	irhWh8Hf00BKtnawcPUSUwcDeIbkhpDVN1yUvXCibMPq/qrvKcRoD4HZ7aJk3pE8vjHAgANZuT5
	XgpOst5rVISBC8D7OkgnUtXnovr1x2n2ysWdIlqRIR0lVPGVEZHN/+HE0zkpbv2fJaTpqG0Gu7O
	1IeVqcyG2XdZD90XXsGpbFR+0WR3jpiqHmRwEShe6i1C4DfNXkGHxnuXvzq8yVWSfvTDQ43iEWe
	ICRRKRKuv/lBRrMR3gU9jtltmmjTqXk9sRx2g9FEQs3qrLAAr2dPUyH2m3o6/ItciSGTz9zztxN
	lXuc05xMdR9Zs5efOGY55WJzNmOqy9P8qT6RGp29jBRTAbOZNFGVgzBFQ90DxhXo0HGTLmh6MDL
	/Y8ZYck6uVe9pDUDKorRby+Pjo
X-Received: by 2002:a05:6122:659a:b0:5bc:3dde:3364 with SMTP id 71dfb90a1353d-5be907c4ee5mr1028209e0c.7.1783362257739;
        Mon, 06 Jul 2026 11:24:17 -0700 (PDT)
X-Received: by 2002:a05:6122:659a:b0:5bc:3dde:3364 with SMTP id 71dfb90a1353d-5be907c4ee5mr1028192e0c.7.1783362257235;
        Mon, 06 Jul 2026 11:24:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb768sm3082495e87.52.2026.07.06.11.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:24:14 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:24:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
Message-ID: <4g6y4q2udludhwmoqc34afwj5svra4a4j5bmpqza7h3av2oov7@6k5r7a4meruk>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
 <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
 <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
 <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
X-Proofpoint-GUID: YsqbrdSuqAmMlYeWcETABIRtT-2y11Qe
X-Proofpoint-ORIG-GUID: YsqbrdSuqAmMlYeWcETABIRtT-2y11Qe
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bf2d2 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NjmyTZ_Ky2fEOGBI-xMA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfX49y30ypk05Y0
 xz/mIswUwJPVqUnX9O4AWPeKGRImpYeAN6NK5i702VROMcFGm2dMezv1DbtanCiXuLL3ynAZzuT
 d2f5m7VvfnyNg+w+OIznMKnI61bvdH00aZ2/30JbiZgv3NIcM4GIhtjYakmxiC3xXYJKsHS55by
 lBqSx/CKSEJvRYrDXdZTb2SzhUTVZJPQHLbbV6qWkxxN2PmKcwcyhExr3kREiqdeFWIzzPY991U
 9sABMmhbL20Xxj/F3lH6ZomOwBhPfns7PfKsRRMr/6DvRZD1LbDhtTvnMNm7NFtleeBHy9lH1Tt
 WfFJvLygN08fywasJkuJcg56YoVl/OjhTiAWtNuLKG9E5tAehiPzJMB4VsfwPu584Zqb8I8RajD
 N8mO8A1hTSyPM1LkahO9yDcKqdASRCclp81Gd0TBAidtCLYTR9wLPXP007PYOHlApboRbMQpjaX
 4oUeAwYMUrQrzrz0ZmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfX4781hmoEJsgv
 sKgrqEjHLa7drYKw485qW+k3W6pv90e4PpTI1c3O1HU60qsXPiQwIBzdcL6GCveT1ednmvEODFi
 JsVxbkkGyaHLku34th12CnH1QiDiiY4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117006-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp,6k5r7a4meruk:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF4AC7147F3

On Wed, Jun 24, 2026 at 01:26:06PM +0000, Esteban Urrutia wrote:
> 
> 
> On 6/23/26 7:03 AM, Konrad Dybcio wrote:
> >> This is mentioned in the memory map description, but is not part
> >> of it.
> >>
> >> I booted up a 8450 HDK and it doesn't even have MTE, so it's
> >> probably valid
> > 
> > i.e. it doesn't report MTE to Linux. I don't know if it's Gunyah
> > trapping it.
> Then, should device trees delete these memory regions on a case-by-case
> basis, or be left as is?

Please verify that you can actually access those areas (boot with
memtest=1)


-- 
With best wishes
Dmitry

