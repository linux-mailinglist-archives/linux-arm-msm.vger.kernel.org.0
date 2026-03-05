Return-Path: <linux-arm-msm+bounces-95490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kL5XMUT7qGnVzwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 04:40:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD9120A9F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 04:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4CABE3033650
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 03:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35DE27CB35;
	Thu,  5 Mar 2026 03:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tv6KIY4J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPsx070w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605B826738B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 03:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772682041; cv=none; b=kqlzxkWzzByasC+brBbdl+sRZDLAPMqp3kKnd5ZXvb611yb/Tnp6N9DEzgPb/3bw23IHKqv2B7uU/uXNK8OvlQM4vMJ8M7n9jt4/39w2gfIhrDMTLf9/m4Pg+SVcza3Eo7WeIBBaj11abCcZAHT8gEPpC/QGanidT26aX56OPz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772682041; c=relaxed/simple;
	bh=nDoC+qnqVRCZsKqhxdGrKL20obiUbD4qrET7VBrVKK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSLVFmcng8UkLodg8D3lnlyO5sFiuGLWZYz0qxFwxFRYgleRw0HJ+LdPMFgMzgNot0boVNUGItbJoaDmyIqL97PmN6qKrYX9/C1hIf2X35YhTQTkKMTchc3lLbWYJJMxa1c0rDGcFKP2PDgnGJH98/WKEgmwwZuc5B+PyRgxoUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tv6KIY4J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPsx070w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251Bpno1454779
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 03:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BCkvYcM+Qnh0dWitG7lZ1F9Y
	4kuK+yrC8gFfslC4rbo=; b=Tv6KIY4JUfp2Qx25CJV1DXyqroVd11nXyEX74ZfK
	uds3p3QsLpIKEWE3f6hdpQS0tesbPKyEKWLk0eCM+nVrNWoyZ/JoMja+6TKwMLYR
	RERt1Ph0uTIE/VJhgMTj1UVI25tMfVAuTX6bbeeAYMsKzoiqvrCqRAvS75xC/whg
	Qc9US4ciu1duBAmY3CBorZ8R8DWIsguLvXk4T2ZHqKwesifwA0yujzqv+bpg8LnL
	TpKT5GjCWsk85lBykjQF+e8nPI9LjaXMJoaUMlHjErOAB7y6KFykdFCANLT8N8XS
	8Wf5+W1wNQovbDV2O8rLBzzByCIpA+CPu7FvoW1TwqsyjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpp4fja86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 03:40:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb403842b6so5238308685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 19:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772682032; x=1773286832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BCkvYcM+Qnh0dWitG7lZ1F9Y4kuK+yrC8gFfslC4rbo=;
        b=FPsx070wCl62TAxMbqLKCaljqHiH/tTsL/evYjLnThDmvVyhh3PoDkv/z21gbQyPBc
         4mv/KIvZo7wan7K9MQfEGO5E2wnHGLkIrGnXcjqOdKqMJKeFvKX8cFHNPpzboFyDuMOz
         ZEhtN2yzoqrvhfvEiSRzmXoPiyQwpvKrXvPlYlfqxIvOX7hrEAm3OTNpIifjs2nYiK/F
         KhibSqq+5CSBGR3tpJWcOVWPlrJRFeUfEwhYE7F7QCEIa2Ldk675fma7ZxZbVRNo0Lab
         D17SbhAi5shBqBnzgJ3qBMBtwZWdTqdHeb0YPESDnPTwkKIthQS057o6Fr9G4QX/Uu9a
         l2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772682032; x=1773286832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCkvYcM+Qnh0dWitG7lZ1F9Y4kuK+yrC8gFfslC4rbo=;
        b=Nz07QQ3SOxJeLV+iRBwkCSGVQHDcMMTq2KDn0bG++wk5KCfZ1O3UPL9kZgKVh4LVRq
         ERt7wdc87vmRQsNuz0eKD/u5DAu369dfaNuHTb4hRM/NjVK1DGExDd09Ko5EfKvETZn1
         hVD94kZQt0ZwJIQezaZ+4HvqU+LjXHQDNCbBQIZhk3+UpNJetHo5rRN1muFX6pCAhxAX
         4lDtapBUYLTWFvc4lYENcNMQAZib5syA/1xpKqoHAVac9t4g6bWdmgz+Q2asZtlhQ8GP
         FE+qaeWtAtsJ3ltKZOKoPySRO6l8HsTa423yGz2HhwRn/PFZI4V/0HHiGvqFpat3YkAv
         A5Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUullTmlqOKtDv10wLMzjwR5lm/qeB0m9xi6xjitqf83zd7wGvZRw4JUVactpLNIlqZRx+2gFQIxqFBA70J@vger.kernel.org
X-Gm-Message-State: AOJu0YxlL51EHfv8niXTZZZsXt1mExNA+Crz1aZoy+F2HpKdPVoAbXwy
	JSVskPsEpuuI5zq9gkNpvUTZbPPJuUuqH9gH+dhCHA3V+ZaYs4iHDHoYV8gT9PlP743q+LZRWyT
	ntu2Qbrg3Yu/W523l674f6yL6fMMMglWf3Xu7PvescOhdM5OxtEAM1U8VL55lYv3uaTsL
X-Gm-Gg: ATEYQzxSTrWN+dj732E8/zkFiYqqnwtuJUV5+vn9QX+D10xQLNzqVnQwabvJckCMOab
	VA17wL5jPHGbAGE8KzYieXJqjuWJLwI/sNTTHoJR1Qe9x3zjN5uXa0hkM7y7zvzK8TBVWhA+1li
	DscXS+GczQjkfIj1SZf1FzVPuU6SwrGTWQqrexJm9cdMuR4H4LZQMQKBfNDBlFt6qBrwEME3iIL
	OFtxyyQHBj1E5WEP2PEgqxgjtrZnFlnOrTWx0TTJrDo/0gCXkW3lcyqRZ2IxhIZMQ7oExW09sr3
	AwyCPHsRqvbUK6bKgeog+rQKFu7GW3VRR4ilkZpiX5/IhJ7Ye1iVXpWJFm3PsX+rx1PQJ/sazgA
	KBz/B4XFVO7ny6s1MOHyGl0tuiQJA01geqH7Fh1JraUmdtYC3MsOrBQpsKnTVcr1okpeiA/lLdJ
	ZOqqj2FRzo2ULU5atxIBi1HkpZ+/u8eNElp3w=
X-Received: by 2002:a05:620a:370a:b0:8cb:baea:89c4 with SMTP id af79cd13be357-8cd5aef2c3bmr592400885a.24.1772682031631;
        Wed, 04 Mar 2026 19:40:31 -0800 (PST)
X-Received: by 2002:a05:620a:370a:b0:8cb:baea:89c4 with SMTP id af79cd13be357-8cd5aef2c3bmr592397785a.24.1772682031145;
        Wed, 04 Mar 2026 19:40:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1337e3a51sm85153e87.56.2026.03.04.19.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 19:40:30 -0800 (PST)
Date: Thu, 5 Mar 2026 05:40:28 +0200
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
Subject: Re: [PATCH v2 5/7] media: iris: add helper to select context bank
 device
Message-ID: <2coz4rmx2w3iz4f6pp5d26pzwvu246cavauiiiq6bclndczxya@r4cio7nwknwt>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-5-850043ac3933@oss.qualcomm.com>
 <bi3i37ho3ppzlgdx264ohxpcem3nwumjelzckf4x5uzdj5rt7a@2y2jrilmfimj>
 <1dc86b00-9a18-482c-94b1-96692c1dd530@oss.qualcomm.com>
 <jgygscmwovezkytizhh54cmmu5etgv23bgopfqrql3qj7zlhxh@adxo2b7izlrc>
 <22b3e2e9-b855-487e-868f-e72fcbbb22cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22b3e2e9-b855-487e-868f-e72fcbbb22cd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: P6zN6OYBv1NqT6mktNM4hbuaCPsvExKv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAyNiBTYWx0ZWRfX9ItsqY/pv6vL
 xQxQMF+kY6GrlprGTia9RkytSJucap0bKoo4T15iBkhzJEEcFKQOPhvelHSy0g+r1erUwJFFDsW
 fYdm9mDl2Nu+FO13/aZuhd0fiBInu9Jtuu75ZOiax/m6K+7FCm4cRe7yashErvDIZSX6s4QAa0p
 gxAvaKCzTiItknUByvAnFqqAfRktIByPK8vcAKssDpOEoVLTjKIoW0AdZ0Skqli5j6iU4A6fR95
 n2+JQ7whPVfDn0ygvzYBwfuLzuMUKIceXs1VilsODbxclbhVTr5WcghWT8h2frZIZBC2V3Q0YaO
 WUkd3js0wbBp+WFDf8c1fnvmeXzsDZEa1ehBYWGwvMh31YMGTyx9OgkEZp5izpr72QfJTNpY3fN
 0/FQWAjuVbbhAdAcml5hzIXtaIm6wBbCh2TIiKVp8ATJfIG98Wr74ru8M8zzj03Wl0TZb4caRS0
 TRyuU+aNF5Fy6hDO7/Q==
X-Authority-Analysis: v=2.4 cv=CdMFJbrl c=1 sm=1 tr=0 ts=69a8fb30 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=gatHO16CKhhCwir7Zf4A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: P6zN6OYBv1NqT6mktNM4hbuaCPsvExKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603050026
X-Rspamd-Queue-Id: 0DD9120A9F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95490-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 08:59:24PM +0530, Vikash Garodia wrote:
> 
> On 3/4/2026 3:57 AM, Dmitry Baryshkov wrote:
> > On Wed, Mar 04, 2026 at 12:46:27AM +0530, Vikash Garodia wrote:
> > > 
> > > 
> > > On 2/28/2026 1:57 AM, Dmitry Baryshkov wrote:
> > > > On Fri, Feb 27, 2026 at 07:41:21PM +0530, Vikash Garodia wrote:
> > > > > Depending on the buffer type (input, output, internal and interface
> > > > > queues), associated context bank is selected, if available. Fallback to
> > > > > parent device for backward compatibility.
> > > > > 
> > > > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/media/platform/qcom/iris/iris_buffer.c    |  7 +--
> > > > >    drivers/media/platform/qcom/iris/iris_buffer.h    |  2 +
> > > > >    drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 +++---
> > > > >    drivers/media/platform/qcom/iris/iris_resources.c | 60 +++++++++++++++++++++++
> > > > >    drivers/media/platform/qcom/iris/iris_resources.h |  2 +
> > > > >    drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +-
> > > > >    6 files changed, 79 insertions(+), 12 deletions(-)
> > > > > 
> > > > > @@ -177,3 +178,62 @@ int iris_create_child_device_and_map(struct iris_core *core, struct iris_context
> > > > >    	return 0;
> > > > >    }
> > > > > +
> > > > > +static enum iris_buffer_region iris_get_region(struct iris_inst *inst,
> > > > > +					       enum iris_buffer_type buffer_type)
> > > > > +{
> > > > > +	switch (buffer_type) {
> > > > > +	case BUF_INPUT:
> > > > > +		if (inst && inst->domain == ENCODER)
> > > > 
> > > > Can inst be NULL here?
> > > 
> > > during queues init/deinit, instances are not created.
> > 
> > Is this function being called during queues init?
> 
> yes, via iris_get_cb_dev()

I think this is a part of overcomplication. queue init uses
BUF_HFI_QUEUE, which always maps to NON_PIXEL. If you remove all
indirection and device lists, you can access necessary device directly.
BUF_HFI_QUEUE looks like an extra entity created just to get the device.

> 
> > 
> > > 
> > > > 
> > > > > +}
> > > > > +
> > > > > +struct device *iris_get_cb_dev(struct iris_core *core, struct iris_inst *inst,
> > > > > +			       enum iris_buffer_type buffer_type)
> > > > > +{
> > > > > +	enum iris_buffer_region region;
> > > > > +	struct device *dev = NULL;
> > > > > +	int i;
> > > > > +
> > > > > +	region = iris_get_region(inst, buffer_type);
> > > > > +
> > > > > +	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
> > > > > +		if (core->iris_platform_data->cb_data[i].region & region) {
> > > > > +			dev = core->iris_platform_data->cb_data[i].dev;
> > > > > +			break;
> > > > > +		}
> > > > 
> > > > You really seem to overcomplicate things. Replace array search with the
> > > > indexed array access. Much easier and much better.
> > > > 
> > > > enum iris_buffer_region {
> > > > 	IRIS_PIXEL_REGION,
> > > > 	IRIS_BITSTREAM_REGION,
> > > > 	IRIS_NON_PIXEL_REGION,
> > > > 	// add more when necessary
> > > > 	IRIS_NUM_REGIONS,
> > > > };
> > > > 
> > > > struct iris_core {
> > > > 	struct iris_cb_device cb_devices[IRIS_NUM_REGIONS];
> > > > };
> > > > 
> > > > region = iris_get_region(inst, buffer_type);
> > > > dev = core->cb_devices[region];
> > > 
> > > all the regions may/may not be present in all SOC
> > 
> > You can check for dev != NULL afterwards.
> 
> with one CB to multiple region mapping, this logic would not work.

I'm not sure I follow. We always need only one CB device and we can
always access it (or check that it's NULL).

-- 
With best wishes
Dmitry

