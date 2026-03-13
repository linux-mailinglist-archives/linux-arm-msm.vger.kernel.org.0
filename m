Return-Path: <linux-arm-msm+bounces-97575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPv/N7Y1tGn4igAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:05:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEC3286A28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD7E6301945E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282BF3C278F;
	Fri, 13 Mar 2026 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZZGgaUL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7+xhGDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9F43B47FE
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417886; cv=none; b=EaDMIsJHZLaYjRgd38ZL/BX3bnAr3xSIJc2optwB9r62v04w8Nfm9uBMs2kjjr/Gio8Ckra/SZrLFwaRe2i64lXjod239ZPRJeKoukveoEGjCMVwhtBxJjJo/7iZVqJUpEYxRDuxVXqmJmL6bBQyp4+Cdh/oLD/c5VldQg+oMAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417886; c=relaxed/simple;
	bh=7P/LGnrzlcf+ncZgnJDmoHmIzeRUpfbec/4IBxdG00A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5LT/94tL2RvxKGTBfpmDrC7X8tL1nHrrlitHdQpGRHH3lLCWL4cXQTidCI8a8/61wgMgDg7+y/W1jyBwr+K5Qru4fH6yPWWQtRCGF0D4uKRQs80A1abwhqMFwdVBTXjYhrouRC/h/KLKSKiT42wHQ5dYVm/rTichXrOF3XlT8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZZGgaUL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7+xhGDE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAsILu526535
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S1uRwswWPnLjkN9TXw+Pkw6e
	zGkkk5Xu+OFx3pwXDZQ=; b=VZZGgaULrP9hRAoWXL8/528xfMR0U49j+3U1bZQo
	Tfd6Vz0tGka9I8Srf/VMcRxLCoTHIN/wcicEJyKCit99t88UY5io7Wr+MFuH4m8P
	JSiRlSPuufvKKBKmMtxUSGNo4biV+bg5PE7wxT3VemLY6gIXGB9YsGCWKtA/Okjh
	WI8ExUQ7u9oELXA6ezBLiNSJKpAr1yUGbJeYlqe2ijZRfQTN5x8TKgm3nFfC5XS6
	lyToKS8GwmLmwUDu5g5+eBaYqThu8u2dnkjlXTrmbeuQBwrp0UIY6X0hbEMbDJTY
	HcSYKWmFa9VfiB6I7EGCVRsu8780cRohzYk/WN98kpMmiQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh84s12u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:04:43 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56b07289705so3936597e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773417883; x=1774022683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S1uRwswWPnLjkN9TXw+Pkw6ezGkkk5Xu+OFx3pwXDZQ=;
        b=c7+xhGDE7EeSOOM8yZg60IVz4aPNrDAe24TVzPU5RO9SneePiZu1xOYBv498F4DD1T
         bEr8bPG2RhckAetti8XSpnAQUmhbBqo9P+DrxGVT+LknTD6M7JoI4ErIWHXsGKlX3lLK
         GCqijxZOFfYFRA97UciPz9qtKs5O6hUdUjqs7diLx/usp5morZTrvd343ZV4/q9Dy+zb
         gFnC8jUMOPkj/dAyjGlWOese5oob2Z+D4E303Hn952HyNHY9T4kj1s1fACufMJdErWfy
         zrYcqE6VCA4Ta5kO1d3lfqp6TZewBo4NrgmDskQG47osCBJhE/oH5+/2mmzb6tG17mFC
         b1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417883; x=1774022683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1uRwswWPnLjkN9TXw+Pkw6ezGkkk5Xu+OFx3pwXDZQ=;
        b=AwoJtEN1aQN5RcUwdmHZtOf1LepxiR/etf4+CzZndosc46iNhU1/TJ298f2NMgv5RL
         uLY44xpGY5BtRZsJ+Hgqhf6RGIu9D6I/jvSCjx+daWroCpUPV89kjR4INgGM8cCtBB6P
         9U70UG/y4Riip40QEBR7ooOxqXnjosMr4BVngYg8LcLMauxSa9B9q+z6Tui72hKdvraQ
         Y0IiHzomeCoBbCmrH7PfIG9ueX6VLGUWg09ILqjmF5bYbpyQXKrVBS8UnHXxWxpA8QsC
         vv+qCLD4sLSFnjFq0M8LJ3V4CXujt5vXwsAcPH/ObQkPcI0Re6RKqhlrisMgww5e4739
         vjCg==
X-Forwarded-Encrypted: i=1; AJvYcCWRXAJFpa8xCkgeNTMHjX6sCtsBGxoWqnUU71RWEcqHgTyTOKN0cA0Ol1jbX23+xvUlMa/ZJRkFRkhVeGqq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7cSDVur32iBen0X8hIrVmTtwNM9mLjOQqHa7qaSGGLugluNku
	u2ZR83uEqh4fLDb2NZHnptjEJiNIKYd/g8OBcS/8ODQTtifKM2B7wVOU0f6oqCMCOk7lDkOMWtR
	i3az+odg2Znf+pNcmSFAbem0oTO4fasgID/dOtk9vgDnVEiiy5ziZMiDTq4CfH94hPTBe
X-Gm-Gg: ATEYQzx3oFs+lZskOJ0qODLZaFHcgCpF2rD8+H0UJMQjem0PC/VKyF4oVRZkHIFoxun
	JUm5s5MS9p/7ashYAKKbB37aNHCOpAcykFLxnTdCZEYfNHG2JToQ/BkFa6/IbZkKMbXeRjoouF0
	z9z8mu96PIAvkZA3yQGLeB/5T1RSeTIIvik/vK2FQ2AoUtZayebn1j+8EjGZaCHiEwpqif7B0kj
	JNb96hPvwVP7R1ua3C4UJ5umYOGyyb5gox44kQFUnjU940cAJfToLyE5b4V1Rok6cf+4nLKiR4W
	TIRNtOulhZHaBHhgv5kuP5ITNoCqUt+glfbmfC8zHXZTTJ3vtu8e1bKngZPmCE2FGCyyhiqKLCZ
	i8yCMwhfYA8UApsZHdzgkoZLighb1mxGiZy/1AAjOwx2M+agR7iXStuMotgglhSoo9GN/6afTuP
	s3nKAm/gxd0p+PuIRRsKXyAwOhAW+uqP4tH6k=
X-Received: by 2002:a05:6122:2a4e:b0:563:72d8:ea6 with SMTP id 71dfb90a1353d-56b6291dc05mr1457168e0c.10.1773417883026;
        Fri, 13 Mar 2026 09:04:43 -0700 (PDT)
X-Received: by 2002:a05:6122:2a4e:b0:563:72d8:ea6 with SMTP id 71dfb90a1353d-56b6291dc05mr1457109e0c.10.1773417882418;
        Fri, 13 Mar 2026 09:04:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67da99a8sm15093941fa.16.2026.03.13.09.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:04:41 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:04:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 1/6] media: dt-bindings: Document SC8280XP/SM8350 Iris
Message-ID: <o42v2o3y7e4o3y32br2jriw5m6w627oftc3jf4jbvmqdq4dat2@qzl3tvl655hc>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
 <20260312-iris-sc8280xp-v4-1-a047ef1e3c7d@oss.qualcomm.com>
 <20260313-resourceful-saluki-from-sirius-f4e1be@quoll>
 <ksk3hjyauhbzvytvch2xip7kusuicnatbw4xlmg7wtfiyatzpv@y5q7xjvl7esf>
 <341cc7b5-0566-4fa1-b710-c486f318a7e8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <341cc7b5-0566-4fa1-b710-c486f318a7e8@kernel.org>
X-Authority-Analysis: v=2.4 cv=OMoqHCaB c=1 sm=1 tr=0 ts=69b4359b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=i44zYNsDSadjnJfJDeEA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOCBTYWx0ZWRfX4KJJaFd0IFnf
 POBYTrokb7kT2AgaJv1nCOLwJwF5FFFqk+yFARnrDxxO3ABc3CgEY6sivEshfczVp/Fh3aCWUOp
 /uTvFiqXKYhDw3QZN9Ex29zrdCxr07ZxAbYDIrAc76KsI/YKf6smJMa0jTD/vjZ4cWwC4l2nf6u
 AjNGB2TcOtFksh/9ukeG395ubQoI647zQSQqk+eP73gIK8sgYdylUuLXFOM8eXwGBDbqvpMY8U1
 aIuyo3qkDNd87sqMFZykJTqEoY/FqGkmZ7Fbw0PKD5PNTvrb6t4U9DaWJYkSJHZgvfTN2f9JeoU
 nWcSJ3DNHP7yhPj8jxbuDrIUf8GXNym+yPplXjSf+ztXJvQtJyTJizqUpUOKIbo5B2L9ug/6Q2E
 vMK7PN5YraBfPj9eFyOhi0dkhd0FMka+Tr0rFVCHpZA36GTTOHTMtZFbMd0CA6T75fD9BAKdPWB
 wS77kJnf+Md1+REHtPg==
X-Proofpoint-ORIG-GUID: Oka7hIbkh5bh7QxrU6f7RqXJ3DKnCAxH
X-Proofpoint-GUID: Oka7hIbkh5bh7QxrU6f7RqXJ3DKnCAxH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130128
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97575-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7EEC3286A28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 09:25:14AM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2026 09:14, Dmitry Baryshkov wrote:
> > On Fri, Mar 13, 2026 at 08:55:00AM +0100, Krzysztof Kozlowski wrote:
> >> On Thu, Mar 12, 2026 at 05:14:22PM +0200, Dmitry Baryshkov wrote:
> >>> The Iris block on SM8350 and SC8280XP is compatible with the Iris
> >>> (Venus) on SM8250. Document those two IP cores, using qcom,sm8250-venus
> >>> as a fallback compatible.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml | 10 ++++++++--
> >>>  1 file changed, 8 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> >>> index 43a10d9f664e..3700f8fe91cc 100644
> >>> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> >>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> >>> @@ -10,7 +10,7 @@ maintainers:
> >>>    - Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >>>  
> >>>  description: |
> >>> -  The Venus IP is a video encode and decode accelerator present
> >>> +  The Iris2 IP is a video encode and decode accelerator present
> >>
> >> Why Venus name disappears? And why now this is Iris2, not Iris? It's the
> >> first time such name is used. Just call it Venus/Iris if the new devices
> >> renamed the block.
> > 
> > SM8150, SC8180X had Iris 1.xx. SM8250 and SC7280 have Iris 2.xx. But
> > when the bindings were written, it seems, it wasn't obvious (or
> > important enough). I will change this to Venus / Iris 2.xx
> 
> Then "Iris v2.xx", how we call versions of blocks in all other cases.
> The block is simply Iris, not Iris2, right?

Ack.

-- 
With best wishes
Dmitry

