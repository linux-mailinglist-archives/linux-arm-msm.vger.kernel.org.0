Return-Path: <linux-arm-msm+bounces-95230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOvzEHh1p2mehgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 00:57:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9101F88E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 00:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D86133098747
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 23:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D26F286D7D;
	Tue,  3 Mar 2026 23:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtUUexE4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLqt/++r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559F8372EEF
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 23:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772582016; cv=none; b=n8Vh6aoDmZaEIcEX8Oar0duA1J1z5oAiGkJRdY+ZLceqj0osPTlOHpCViDEePrkvZ4z3UqdCnPicCHXaR2bnLvDy3lWpjlZbK3FU0XPPcDcUA6DGIy1VYS8i87EWZfYjBk+5n9i/RnIaSFK/9GyNi2m63mhoOuVruClTs8LP0X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772582016; c=relaxed/simple;
	bh=mPTUW7+++I6V6Gkh87svMpd4/+jZKqbsn6FojcsInxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLsYnRwsI+QlQ2EZE3kyqBJEAxx1YmHq5AldpufN27tEMJ8fE7Wn7jW+AZ9h/PJhL3ZW2TmjTxw4Z7X8A6ZBwfWMzE4JkhdGWCO3hZe1QCm36hSmgrTxmdYFuvj3TgLIvDzZxw8Zi1y8FVPt55mserVlyEG3Cv/taly7Oa1dP0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NtUUexE4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLqt/++r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623KsYW5592427
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 23:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=noxRLzHbqcCDZ6D5qPjWL1fr
	JAIlBz2av79smoXBpok=; b=NtUUexE4oSQgmcfAsSdQD/L9owS6vT+FFCvpawgp
	Ssg14qq0ryWbuXuRBywc8tfo5aNLDUYI0tzkUmvI2Yfi1zCbNXvpouSZ3dd1LLOH
	00X1IbcwPyMzqJKXEySol0oaVFdZoAvKLdLmcfSG+U7+GOerou8v+UGtbe9Bo2EM
	8b1ptVVD6joiP7C7yrlT4o4t8J2xnOIo52oFkktWsQ9z5I0xnYDzo3+XC+lpkLiX
	Q96Ry/JPkDKEAoKlEi63xeo+0sXZmMct2EIikXhXbwZWfRbrDBGPc8mm8ljWDvFk
	ZMk/TktSqLY7ghbJiTY4CIBIjekz0pSYb9pXBzRlzTQHMQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73h8ggv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 23:53:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb5359e9d3so4397264485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 15:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772582014; x=1773186814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=noxRLzHbqcCDZ6D5qPjWL1frJAIlBz2av79smoXBpok=;
        b=FLqt/++rwnzkzty988G4tXN1F/R+3eF9KhVRCmxbkIPTb1t8NsA+YOyP08PTJ/3GvU
         8Izllgmhal1m2nJzahMcu2wiC5vB5HKghJlQOV74IfDg424HyHKmPDMx3PvlbFgXxYju
         Zx5aqEZluvsDQcOMEQl/yUMSlPawiEbO+pCzyz7HHjSoMCgf8r3laWZg1qVu0NGaJfCU
         gAtapyW4103H4heBWLZBPpjZWoFWDjXCQPATBWt4BOpIqyhqpueMR5yOnp+R7LmgiMHp
         5JsrbZ0RIawCrM3C+B7RLkWvjXOE4GoboIE5iQVY1+VUHRVazqgvFnNe9DdQrdDtNJ+i
         Tbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772582014; x=1773186814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noxRLzHbqcCDZ6D5qPjWL1frJAIlBz2av79smoXBpok=;
        b=L/7E0LzbQmGSTyqBwKYnbm3F/EPw9yYCH0AWDC/dTgdw90nEq7/9yQsmizDT4xm0Kr
         KGS6efdCuDXIrGNoZozxE6u61dNNjyflFI5HnnEz4kEkrsi6ALeTmrXgIu46Ua4G6uNv
         P0D9XN3BdpCQdB6hpe+9EPLNeIavndZPTV1/1eaudad/ohEqoe32G5kk/65LAkA5BhgK
         aYNYNom0GEKaw8aLAIqPNxhJSjB+XpPI6n3qXu3tEtG+eyuzJPOHJpJr0Dsim/G10TN1
         /uB+tZ5R+OzxnJ0F9Cn4xEFoQAm3nx1cKebR0urzWOlQY3TXTzEPoaAXSL7pIJJl+QAg
         UeHg==
X-Forwarded-Encrypted: i=1; AJvYcCWglh17jyY4IhhTHi+pDYOCK8Ung8YLlwn9Zi69dTlHhnHmpB1bI0rfBX+S3j58i0PvkiZSizFK48DmBkFt@vger.kernel.org
X-Gm-Message-State: AOJu0YxC7LJo3cLz1pOOjovDXjkVtNsqW8qpm4JoGwcx/LyPBMO/9N3x
	xhPTmr8hJLVpZ9s8Qd6zuL5WcgFdLyrQJu13kwrWUYolMUgc4owIe54EQPFnhUbaOHboQvMkOTP
	d7G3Yx4YjHmKhCT9ydvDw5Y7wY6p7eOgxtRyyLO+IuhcI8DUbmqhpA43TGENNAh+K6hEk
X-Gm-Gg: ATEYQzyJwCHuHPf8hHadQZfupH1dM8e6gSc3SsKm2225OKfGGnb3I6RKcglK65FQ8nH
	ZCYfJ1WRAfaSprONr2bvOdb9cECENm032Rt3rUsEqKU9ekeYAx8nnH4NnFYBoqz+ii/N1jqvm1Z
	j2lzNM7ZwFRmRNy+NnRkIBbY0VJAOWfeXG9W5yaR9nuh976LsOX6FjfrqRqWIyR5J6y2DmUCaPC
	auao1iQ6HqLJHvNaODSSJFd0M16UFQsvIC6uzpkMsHhgfxo/1JHELKIVvBJ3cKG7sjQg+SX52AG
	qheSPNTAGFB/i13qlLgIO6r7JdhA1uCAeP8DPAz5tSs+TwotbbTRa4euEyFtxZbolrP/Axfoos5
	XQ9ukEXTdP/WMPPd/zFUNDhSVLhYqAiVJP8620iKUNDslLfMqnSBwHlJGnkMJ3/3m3CS4mCqnGd
	Jfuzo/n3UeMpXoJ2RLW4MXRum7kqp+A/Wt30Y=
X-Received: by 2002:a05:620a:31a5:b0:8c6:a3ed:2f65 with SMTP id af79cd13be357-8cd5af18213mr29448885a.23.1772582013476;
        Tue, 03 Mar 2026 15:53:33 -0800 (PST)
X-Received: by 2002:a05:620a:31a5:b0:8c6:a3ed:2f65 with SMTP id af79cd13be357-8cd5af18213mr29445885a.23.1772582013040;
        Tue, 03 Mar 2026 15:53:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12357d2a9sm884016e87.40.2026.03.03.15.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:53:31 -0800 (PST)
Date: Wed, 4 Mar 2026 01:53:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <fjvug6snigssgheuduzjomzjq6apte2ggixqzjzziwcycee4l2@irh2mkholacy>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
 <nen35eqhwbikt7jlpxn22hvur33chxibrbmzd6awo425i3mujf@f2cbncxpcatc>
 <635cc998-d530-42eb-95cf-99b0d5baab68@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <635cc998-d530-42eb-95cf-99b0d5baab68@oss.qualcomm.com>
X-Proofpoint-GUID: 2IDRqdJb8kqhYKVmaJwVDqJjXyWr3jhE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5NiBTYWx0ZWRfX7cFsUSJ/GYnY
 aq5JHSyC5i/ThZUJeuhm9jZfKXNBvUPDC25MsDj01LUbUBisABCkxGpVXV2KCGRADIHfCJCN8hY
 GFzD1mTH8D+RGK7cgJGYHam7291RPSq4ZYn0jklhNJOLQq80hEKY2mMJiaJsgLeLN/68dpkuxnj
 8LSH2UjL6rWOpc5d50kqjSz7V2DtaBirNFiT0nu/0jzpbUO0aFST4UFW2mHJjatDqC/upb8p2cT
 /2DGIM7E0x1s8xK6Pz8CXs1ZXDwYJ+x/GiUc1EU3nsJXdYSLqrTjuuHz6JEfp8pyxgUG9y0fojS
 hgM4BEbpp3FErR8rlwLObyxNLumvoS/KceWl06UGp85gRxvx52vQo5Urk9KVzknSOqCqJZfacjN
 PjywN9ROnMNZy1wf/gQ0JvOMDaZffjk7BVVX729xdsIR+09SMXeizgMbYwqpLBPJeFNfCglJq7i
 ewwt1ebCSMV2RkCDb5w==
X-Proofpoint-ORIG-GUID: 2IDRqdJb8kqhYKVmaJwVDqJjXyWr3jhE
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a7747e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=Ni5EwOkUcNZy2ZnK61YA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030196
X-Rspamd-Queue-Id: 9C9101F88E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95230-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 11:43:40PM +0530, Vikash Garodia wrote:
> 
> 
> On 2/28/2026 1:22 AM, Dmitry Baryshkov wrote:
> > On Fri, Feb 27, 2026 at 07:41:17PM +0530, Vikash Garodia wrote:
> > > Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> > > compared to previous generation, iris3x, it has,
> > > - separate power domains for stream and pixel processing hardware blocks
> > >    (bse and vpp).
> > > - additional power domain for apv codec.
> > > - power domains for individual pipes (VPPx).
> > > - different clocks and reset lines.
> > > 
> > > iommu-map include all the different stream-ids which can be possibly
> > > generated by vpu4 hardware as below,
> > > bitstream stream from vcodec
> > > non-pixel stream from vcodec
> > > non-pixel stream from tensilica
> > > pixel stream from vcodec
> > > secure bitstream stream from vcodec
> > > secure non-pixel stream from vcodec
> > > secure non-pixel stream from tensilica
> > > secure pixel stream from vcodec
> > > firmware stream from tensilica (might be handled by the TZ / hyp)
> > > 
> > > This patch is depend on the below dt-schema patch.
> > > Link: https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   .../bindings/media/qcom,kaanapali-iris.yaml        | 261 +++++++++++++++++++++
> > >   include/dt-bindings/media/qcom,iris.h              |  18 ++
> > >   2 files changed, 279 insertions(+)
> > > 
> > > +
> > > +  iommu-map:
> > > +    description: |
> > > +        - bitstream stream from vcodec
> > > +        - non-pixel stream from vcodec
> > > +        - non-pixel stream from tensilica
> > > +        - pixel stream from vcodec
> > > +        - secure bitstream stream from vcodec
> > > +        - secure non-pixel stream from vcodec
> > > +        - secure non-pixel stream from tensilica
> > > +        - secure pixel stream from vcodec
> > > +        # firmware might be handled by the TZ / hyp
> > > +        - firmware stream from tensilica
> > 
> > Why are you providing description as a list rather than describing each
> > item separately? Then you wouldn't need maxItems.
> > 
> 
> rewrote them as below and dropped maxItems. Please review.
> 
> iommu-map:
>     $ref: /schemas/types.yaml#/definitions/uint32-matrix
>     items:
>       - description: bitstream stream from vcodec
>         items:
>           - description: Function ID
>           - description: Phandle to IOMMU
>           - description: IOMMU stream ID base
>           - description: IOMMU stream ID mask
>           - description: Number of stream IDs

I'm not a pro in the DT. Is the itemization of the first item reused for
the rest of the items?

>       - description: non-pixel stream from vcodec
>       - description: non-pixel stream from tensilica
>       - description: pixel stream from vcodec
>       - description: secure bitstream stream from vcodec
>       - description: secure non-pixel stream from vcodec
>       - description: secure non-pixel stream from tensilica
>       - description: secure pixel stream from vcodec
>       # firmware might be handled by the TZ / hyp
>       - description: firmware stream from tensilica
>     minItems: 8
> 
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > +    items:
> > > +      $ref: '#/definitions/iommu-types'
> > > +      minItems: 5
> > > +    minItems: 8
> > > +    maxItems: 9
> > > +
> > 
> 
> Regards,
> Vikash

-- 
With best wishes
Dmitry

