Return-Path: <linux-arm-msm+bounces-107993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5NnDG69GCGprhgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 12:27:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8DE55B22E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 12:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BA3E30156CB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 10:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E913B2FFD;
	Sat, 16 May 2026 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcULcQcg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IKjBHdA6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EAD405C46
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778927274; cv=none; b=GAedm7lixnB+zTXKPm7bEjv6FTJbBNE33UZHNKiYkraoLrM2MQr28eHxuYcoPFUY1ODsPgr9Nwm5euURh1E1UvyJ+yul5XlyP6G2F8DMpN2m/i0wDnBQTAwF4JNmJol9AWvJAcCPM9KGmBhh5zLoreq12DvlG7bZpIPfxknv7tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778927274; c=relaxed/simple;
	bh=f2T9F2uzvCEHnJctjhQVkRix8CUIzDtpiO/xf1Lnc2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iP9+gSIFZVamKWQWzbqtWVZd67RpgAd9Cf5VnWqkDZJyDgC57EJwvjHnET4D0/Uh0Y+qEQclGE629FZvBXHwAIPHv9T0rZr5WP0eILWlC2CePIwhhb66/j/Q3VRV0Sf+dchdEyKMCNmQ/q5+r/kieZh8fcIONUp/gB7CDsY11vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcULcQcg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IKjBHdA6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3mwI93269397
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 10:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xr7WRuQMnnc663mN4U36jexc
	m+Fp+os5jRqkaS5NzHo=; b=kcULcQcgknS2cAOU+2Au5cXRQWFRtcMw6TUukw+Z
	xattKWjFtN2GV5EuPK2joqQ0Ii8qQCDlcQjQ3PG4v+1B6ZgGyFcbVapa1Q5YF6Ur
	8ZjQRljU7u9f+6BnNemoHZ64qG8MTu4HWU+y3jfXYr+RQ2JYhwa0CkoKQ3UxN6hQ
	5h7j2J1E7MpWZ5UVCKL+3HN08TY6OA/T6tEdzNFwTTION0qnntkkSHgtNWESPE4/
	rKnxZLZPrNN/MjNandZi3pe3mLswn1aJws2CxT+jFm50SRQfYeqySLv72FmZHG6o
	jLb6O5+DZzd4eez5RDEqDFhelCLr0gy1aeg7hMQ5+h8KnA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g0myf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 10:27:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514a182b90dso8812841cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 03:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778927272; x=1779532072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xr7WRuQMnnc663mN4U36jexcm+Fp+os5jRqkaS5NzHo=;
        b=IKjBHdA6v3/KHvZcJ42TxCtWI29i+8pbAIRygM5DlgeEftZfGCEHlima3jLUE1GoCp
         mjyHqVYenwQ3izK0qtGD7IrGQQ8do2gnDZ/MrKFYevL/OyxfWZWChjz6t2L8aNyuVGpm
         WrMmS7oSRBAThvQp6aOhT2ISwgh/k99Jt07yYWdiQiewS8YxCLSuEmA80fK5881ZB1lC
         IcQbHquN7/WV10GwnuAFTZggrg7lt/F9X9gYGxpi30LnirQbhOOKGjJ+cWw+jEsO/Ooy
         BYOKFbfu6iKRWGPhsbNpRAzvdyxwCkFXJIkbrMOgIDAbLN60ArLbES/G3RVtMH1SGiWe
         HJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778927272; x=1779532072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xr7WRuQMnnc663mN4U36jexcm+Fp+os5jRqkaS5NzHo=;
        b=ppaYoeqVdYHlWwKEN+OTL0gViuchWiZOQCoNqAq5WjHnN3AILs0CjbixS70TUqN4EP
         X6b5M7zZalocfa69Hr+RXGG1PxOHgt8an4UampTajBIfdVsdlDLvsaccRv9m055NyQOb
         ccDKz3Ds7QSoGn0qUxFSiHbO63hdR8/SsDlVogihjMrnQi9OQ0t2kDs5HCKo2nLfmLQ0
         NRK1GA/xuS80Z+QmPDinUR88WuE8iYuDSCP1iqT9Xpvgf52H20+K2YDkGq9brQAVzSXG
         uMgTr/wc8Qtj/8AUUIfJDb8vPQ9J4lG8P7CkNZttj9+ED3MYFi1dv8yMgP7IoeGpkSLM
         E5hQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ps1Xvhak8XYj2v/aOCMF8k8NHKG7QQdgVwPMNX6P7Us1XNC2M23xwty4/45u2fkVx9KQOqlhR4CU/u55Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwfDs9iOwQUFfUyC/Ckz9prfmfO8kXc0i+BK5X6IKBB017rnslR
	fgV1jcJShFzpwrvM24aYQZu53tgvo7ppaa2R1mkej6WeVyVi9l3lF+158NW/QH928gGcSGVoqXB
	l1vA9sjVnMtcSthX3bx7G9l5ZdapvCtEb7hse8dMKULmCIeRhfnOuUiP1PqkoS0Kip00i
X-Gm-Gg: Acq92OESt9ErnrO1h+mTCWhWD9HeayC8ijHpSU71DRYduw+RCF2VIe/fSY9QDU8dBin
	JQZIrU6+p3v2O4DeT2AN0bP8umbJ1IvTtkuwH1tjDBZEa7vsCyCKVLGiLoRXkj3+getHCaNxACh
	6/f0G67dStnHpifDVmsvvVa32hz+yLjciTdPozIiBrCr59rqRvXc9l6ALyzUWBxN5C1Dh+shVXF
	HeHRuBHIu6MsYQJmjnFHnx+46sg+kCwlZQKIco8iQLkPqPUq1d0eoyoPzU45wceGjMggoKqYwjc
	2S2eWLLUrOSeKeRcVZ/mfQtBhJA+oQ680tSsCmYMnQwEpIbA8yFcCff5jBiB1AKE5Gvn03zJp6R
	kciSdBqit69Kh3CdQI1slzfxzgScQLRBikZk=
X-Received: by 2002:a05:622a:985:b0:516:508b:bf4a with SMTP id d75a77b69052e-5165a219c0bmr102897441cf.42.1778927271543;
        Sat, 16 May 2026 03:27:51 -0700 (PDT)
X-Received: by 2002:a05:622a:985:b0:516:508b:bf4a with SMTP id d75a77b69052e-5165a219c0bmr102897141cf.42.1778927270992;
        Sat, 16 May 2026 03:27:50 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab6aasm128802725e9.2.2026.05.16.03.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 03:27:50 -0700 (PDT)
Date: Sat, 16 May 2026 13:27:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK
 boards
Message-ID: <mxgc3iogd2z5m44xffvqc23cdg4mregw73vslujcdr3ff5hyvi@zqgseqplhoey>
References: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
 <20260516-sheep-of-radical-popularity-d0cdc5@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516-sheep-of-radical-popularity-d0cdc5@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDEwMiBTYWx0ZWRfX45cLBE3Jx6mP
 PKa1dc2txF1Xi25FcbLf4K3NMJXIvxEEWFN2QN2JA0KicK5r+bnCxZgsklvSv9rX4jeUvd4RRX7
 4IZVCotmkLrmYIhjqINbybY/4DAEg+m2L46cLUR/iXG5c0fFwU+Hc79K8MEOUfYAOet9SalpwsV
 J2GMza0waxIHATVp1yweADFeLMWvlDpimuFV+yrvkZD/50EDWIZ8uEwdcO8cwqC/xjeBhxbhJOJ
 84i+73U2MubYywrlwHLKDKTLDWYhqLu7S79/XplCHhpWHtRDEXCkEtL/ZYVOAXaTU9fLViSNXzZ
 ME2Ui1Vd2vykSTTHirLUcBuphiZdIrnANhkYisDR3Tq/GxIscByQ6SrJFhdqhTU5q5ARdhRT6xS
 BiT53tqByKWiOtzXqOPIRdWsYA94tJLV3C09bLSIjlaetg8UggD4Hd/wn95EGLou93d+hUdlOwr
 b2KnFBvvbodDeEM0tLw==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0846a8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lnExPUdf6Q4ZbYV5n58A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: nEAMIZwlynb9fpaBlYFVufJw_SfSnmKw
X-Proofpoint-ORIG-GUID: nEAMIZwlynb9fpaBlYFVufJw_SfSnmKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160102
X-Rspamd-Queue-Id: CA8DE55B22E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107993-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-16 11:58:56, Krzysztof Kozlowski wrote:
> On Fri, May 15, 2026 at 02:13:31PM +0300, Abel Vesa wrote:
> > Document the compatible strings for the Qualcomm Eliza CQM and CQS EVK
> > boards. Both boards are built from a base board paired with a SoM which
> > is populated with either CQ7790M or CQ7790S (Eliza variants), PMICs,
> > LPDDR, eMMC and UFS.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > index 2741c07e9f41..28a18254b4b7 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -63,6 +63,8 @@ properties:
> >  
> >        - items:
> >            - enum:
> > +              - qcom,eliza-cqm-evk
> > +              - qcom,eliza-cqs-evk
> 
> When we talked privately, I asked to mirror Shikra approach. But you did
> not - it's different from what Shikra sent.

Because I think it is wrong to describe the SoM since it can't be used
without a base board. Listing SoMs is useless, IMO. But maybe I'm wrong.

So my reason for doing this is basically reducing the list to only
describe entire setups: MTP, CQM EVK and CQS EVK. No SoMs.

> 
> Shikra received my comments - but you did not mirror these, either.
> Basically you went with third approach... well, I think this is the same
> case as in Shikra, thus comments from Shikra apply here (at least what
> I expect to see). Also, another reason is that this should be
> consistent.

I did read go through your comments, but giving the rationale I
described above. I did realize just now that I misunderstood your
comment on Shikra patchset.

Anyway, will rework according to your suggestion.

Thanks for reviewing!

