Return-Path: <linux-arm-msm+bounces-84806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (unknown [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A059ECB15D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 23:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F47A3023162
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 22:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A5B2F83DE;
	Tue,  9 Dec 2025 22:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjYOI/IP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXdz2XkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2FB2F616C
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 22:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765320934; cv=none; b=eE5cWc7t4g9jduxD6+o6CJluIR02s8guMm260Ux0KFe7HXfFTvPiKI5XoGnHK51mmaFIdH8aae9F24kVG/Z7j0rBgITt2Z8z5geyYODi4ilavZaEOO/2fdjQRX2wjUYQoMWjWkGi/yKpOn1/j5K+bcqdhJK/FBCkIiCn79mBeqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765320934; c=relaxed/simple;
	bh=d7gyk8MWbM4IoZJvnJX5k4gGWaFh37ifpVPohwuaPqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNlJ4yiCKOvejtex4JWMxyv3qTdwMJQYtoB/B3umYhtRwaIHunLfb8hTEGSuqislJyfYvLBP8yWV5sgl3y4PpzYns5Y23UoyYpB9LH9qNGoTmH1CYFKl5KRwoImlvVWWFJh2VPducBTbP7hYzvpLjq4AqMeQtxqCGySqbto46+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjYOI/IP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXdz2XkH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9MmUJp656295
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 22:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=839FKuY/wlxpFZxPlD2GXAFX
	O0n8sucDpZVSLxlm8gc=; b=NjYOI/IPi5f1tKSNxc9ZuWWRHNV31v67dc+ZmhUI
	pdPWOgXXM+/V69f/NsgB4jean+AYjdeX6FvaUylzObziPYUI86wGA0mkS0y3WIMx
	mq8QXxfa8LGMCt7lI2kVsx1k4FqibqwTo5SlOVezQNr+tqVHegPo3K78iSiq68tH
	cxza5D5u5ySPyvKcc2KUgExgjAxtJP6sJENOhgZnOeTZmw8H3dVR9VCgjOvCny2t
	58HWHMiDCUufo0pEGHQ0RVS05iHZcbT6/7hC47mJJsWASfW4xBtJEj+gClL93qwy
	KGQUD6UvMu/bwaH9jFpf2zRtmMWZjZHyx+tXe4EpELE88Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axjk5279c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 22:55:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b51db8ebd9so1964841085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 14:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765320929; x=1765925729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=839FKuY/wlxpFZxPlD2GXAFXO0n8sucDpZVSLxlm8gc=;
        b=LXdz2XkHRVacnjoO5JGtO2UTBDuERJr2/909HCPpOdpoThbOQWnp0cEQsYDvZf8CgC
         jxNrjZJrxONF9k5vcrsPdDM43v+Ss9mL7TiX0Mlr0Gdp91nQhWQQV+pfqbak4ctOldr6
         XWNGQJkDzvvVIuFT17nhHO7Uw3Pfl/7D0GRplH9vFJ/JnoCzozJMUbWoL9OHadgoEB27
         NgQC3vckOg87P/RZVBHFshbEqjNZjWS8wZFk8IVpNG8I3PLUQOyGPpboaUoPe5G4+oN+
         Y6SMlXrKMwFxalfG9620V2Gqw2L0LhBGsLM2GIQDSfPSfHJWxet2Jg7jhrRC/4/pRVoy
         jLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765320929; x=1765925729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=839FKuY/wlxpFZxPlD2GXAFXO0n8sucDpZVSLxlm8gc=;
        b=Ch5THs776LM3HKqzmQ7vRuNKOwYBJfjBKRCUqrR5DdGk1LQiL8QdNlthUQP9TGHAyQ
         yZrspg7wKOE0RlDn95Z0dthJBuf7qWgt8T8xqOqmwjoC5mFlmEpsXOwIAcbXottpvQ41
         UBM23DtVdE9son74PyS6E2jnuH/lVz5vQDm1fgyWoyJrECVxBDVmVQMxsGdRe2sAkC7Z
         66RYKWU++/rTjvvnWvB9L5RxhKZt/6pDzKFct0cbhqCguxUCfsQT6eqZTaIuWnBhV82R
         40FzsWQzKCtE3IGadDAwz9kJ9YjH45idgf7v/UMfljBnpK4BnbY90YqRjns5O/dfguv7
         reJw==
X-Forwarded-Encrypted: i=1; AJvYcCVtcLWjr9XJOeTWRIx9/Q7TKMOFl4PYaOtTXaJ7rKQiQIR0v8wV5G9QrTv2yuIMhSx0bzWwSqh6Wk8n5RIa@vger.kernel.org
X-Gm-Message-State: AOJu0YwMhUsg/PK0NtqN49fwKRfqvqYuIIZ/cONu5rmpKZzlocRAqZ1p
	oK5pGf8BaQMU5qrpLjZPGBbxa0JmHruKntsLdqNyf6ANVE4RDhr/5vqWZ43Foc2kS5umfF2bGfR
	YoAKj/ait7gN4vT92jiS6HQ2NpKpWKis4Q7B1Mrighf0Sv5bSFExSBCLS98WG7ZRl3jcr
X-Gm-Gg: ASbGnctRMS0pLgPt20aSIQTpBxz8R2fQcHSZ1BN6TVwsVsVaRZu1dPvxG9qibMONJ9T
	/VtILaGXLivcWDS4z02x5lpTLGx0sGclbjeNoqvxUDvWHnFeFvHppGwu49ZqTSLnKFQKYtvcAWt
	3n8oR4ltA9iqZ92uhEw99BZK6ENuNaLBtu7+zoPGYcmBsHmLlSrP7Z5NSY1j7ELe1ZjBy4esnm4
	MkA+bfV1IOyHD+oObECzc5o4oz2Aaig0ighK9nZQc0Zkn6gF4ifcN73rVn/vLSnUmVX+IEKCBHG
	VWx5owxumXm728xsWIcJXly7BKAqgJr1Zj5IFyxdSa18LOyc6hFBuuyP1o7GUlSOLguYYaMFN9u
	wOvXpUJwRInbRL6GAjud755MrNbEtSqLaFUUJVvLjsnztArH1AOA8+RmwsDtZNDal0Yu3382ZVz
	tq88QWQEYEq69J5Pw/dwqc6DI=
X-Received: by 2002:a05:622a:5985:b0:4ee:468b:1963 with SMTP id d75a77b69052e-4f1b1aa2eacmr5199061cf.58.1765320929291;
        Tue, 09 Dec 2025 14:55:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0yzrmjMyHPciPWlJjOhkTT82T7MaoWoYb1QzzUXOw3RG0D7SfvfllRJK+YNZptuMCM/EEww==
X-Received: by 2002:a05:622a:5985:b0:4ee:468b:1963 with SMTP id d75a77b69052e-4f1b1aa2eacmr5198721cf.58.1765320928817;
        Tue, 09 Dec 2025 14:55:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b244e1sm5532592e87.23.2025.12.09.14.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 14:55:26 -0800 (PST)
Date: Wed, 10 Dec 2025 00:55:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v5 4/4] misc: fastrpc: Update dma_bits for CDSP support
 on Kaanapali SoC
Message-ID: <nkxygm3uyiiiq7jowifpnxl7vqnli7aui6hrnpswrwac3ae6gp@heoqhurmolze>
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-5-kumari.pallavi@oss.qualcomm.com>
 <l6pf6zoz3sfawnsdmtacczykg2dgnaw4x26dfg4o3al44y7fc5@vgzd5s4uygm6>
 <5f4efb71-4d39-45e4-bb0f-dd3c3c5b3a28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f4efb71-4d39-45e4-bb0f-dd3c3c5b3a28@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AL-RbDXAclOW_Q_YEceqaHM3prwrkGDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MCBTYWx0ZWRfXwTNCho1UHtjD
 zqRNJhdAGTWui+KF6Qeq1y8n0EfyJU6ZHLKz8tUnFFaN3HbtPhisj7SlpZE/2jqOngXLMi6oYpd
 z/bAFsJpqntlKT4h92ZFvSaDyyGF2ulztakotOP/ZOAYsU+/B5j9Uh9sPSOGghnW0phm2okL5Wn
 MO+hc0QI3I1NyDfzCwr1rkuZZnuUhCB+NziuBT5UVbSfg/Z4eJ56SJEvpmDVwFTcFQ61Bdhy7BJ
 IoOjzj708z0QPodQrwsFsO2s7J8zgUKNqP80fRKi1abyGYzkFAw0ARPosuub07y4hXw2FhsMQbf
 nVRrGh1mR3OllefIN+cRzZXNo8qSlQAWPDUqd0ervEvOdJAwWyPQtYBExoDcdvB9gfcmotNOtS8
 pUlayBoFae9WujsqgtYL4CzuAR9Iaw==
X-Proofpoint-GUID: AL-RbDXAclOW_Q_YEceqaHM3prwrkGDk
X-Authority-Analysis: v=2.4 cv=RqvI7SmK c=1 sm=1 tr=0 ts=6938a8e2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t6ptp7jAsjtXVIoC2L8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090180

On Mon, Dec 08, 2025 at 12:34:47PM +0530, Kumari Pallavi wrote:
> 
> 
> On 12/6/2025 8:01 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 02, 2025 at 11:36:28AM +0530, Kumari Pallavi wrote:
> > > DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
> > > both Q6 and user DMA (uDMA) access. This is being upgraded to
> > > 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
> > > Kaanapali SoC, which expands the DMA addressable range.
> > > Update DMA bits configuration in the driver to support CDSP on
> > > Kaanapali SoC. Set the default `dma_bits` to 32-bit and update
> > > it to 34-bit based on CDSP and OF matching on the fastrpc node.
> > > 
> > > Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> > > ---
> > >   drivers/misc/fastrpc.c | 15 +++++++++++++--
> > >   1 file changed, 13 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index 6a67daafeaa1..c5d2c426fcbc 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -269,6 +269,8 @@ struct fastrpc_session_ctx {
> > >   struct fastrpc_soc_data {
> > >   	u32 sid_pos;
> > > +	u32 dma_addr_bits_extended;
> > 
> > s/extended/cdsp/
> > 
> 
> Thanks for your feedback.
> Here, i have used extended instead of the cdsp as to replace the
> domain-based naming with functional naming. Currently, CDSP supports an
> extended DMA address width of 34 bits due to specific use cases, but this
> could change in the future for other DSPs as well.
> Using names like "dma_addr_bits_extended" and "dma_addr_bits_default"
> would keep the design flexible and independent of domain.

And then at some point GPDSP will get yet another address width. How
would you name it?

> 
> Reference of the earlier conversation regarding the change of the name
> s/cdsp/extended
> 
> https://lore.kernel.org/all/e0d039e8-8f65-4e2e-9b73-74036dc0bb8d@oss.qualcomm.com/
> 
> Thanks,
> Pallavi
> 
> > > +	u32 dma_addr_bits_default;
> > >   };
> > >   struct fastrpc_channel_ctx {
> > > @@ -2189,6 +2191,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
> > >   	int i, sessions = 0;
> > >   	unsigned long flags;
> > >   	int rc;
> > > +	u32 dma_bits;
> > >   	cctx = dev_get_drvdata(dev->parent);
> > >   	if (!cctx)
> > > @@ -2202,12 +2205,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
> > >   		spin_unlock_irqrestore(&cctx->lock, flags);
> > >   		return -ENOSPC;
> > >   	}
> > > +	dma_bits = cctx->soc_data->dma_addr_bits_default;
> > >   	sess = &cctx->session[cctx->sesscount++];
> > >   	sess->used = false;
> > >   	sess->valid = true;
> > >   	sess->dev = dev;
> > >   	dev_set_drvdata(dev, sess);
> > > +	if (cctx->domain_id == CDSP_DOMAIN_ID)
> > > +		dma_bits = cctx->soc_data->dma_addr_bits_extended;
> > > +
> > >   	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
> > >   		dev_info(dev, "FastRPC Session ID not specified in DT\n");
> > > @@ -2222,9 +2229,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
> > >   		}
> > >   	}
> > >   	spin_unlock_irqrestore(&cctx->lock, flags);
> > > -	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
> > > +	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
> > >   	if (rc) {
> > > -		dev_err(dev, "32-bit DMA enable failed\n");
> > > +		dev_err(dev, "%u-bit DMA enable failed\n", dma_bits);
> > >   		return rc;
> > >   	}
> > > @@ -2311,10 +2318,14 @@ static int fastrpc_get_domain_id(const char *domain)
> > >   static const struct fastrpc_soc_data kaanapali_soc_data = {
> > >   	.sid_pos = 56,
> > > +	.dma_addr_bits_extended = 34,
> > > +	.dma_addr_bits_default = 32,
> > >   };
> > >   static const struct fastrpc_soc_data default_soc_data = {
> > >   	.sid_pos = 32,
> > > +	.dma_addr_bits_extended = 32,
> > > +	.dma_addr_bits_default = 32,
> > >   };
> > >   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

