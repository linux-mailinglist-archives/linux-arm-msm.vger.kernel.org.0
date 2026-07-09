Return-Path: <linux-arm-msm+bounces-117880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uJeZKrBPT2q/eAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:37:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C4A72DD16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:37:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qr9ckc5a;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BPwHheq7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117880-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117880-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C1C83306C9BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A733E3D89;
	Thu,  9 Jul 2026 07:34:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC643E3176
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:34:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582442; cv=none; b=lSAHKt6IIiOk75KYzjEdCwZgwKRwA024d5YuE2h42aHi6o1iZlbyjw2eh44nrQkJdA0Gl7eT/QR7tfribCZapEcKHTClJ5U8HtIUrHfQOwgAtLEyPXmaUFFDcxEQXJuO5LBFf0O5UkdrAxWHScHjPmSu0sNHrBSipCuVbXKzgis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582442; c=relaxed/simple;
	bh=Kh5FwszJ4LfJwQ6A/zoYZ4qba9IWmXTwdyA5zZmva+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2bJrA1XJ15JaX6EnQVnLLRoaNj+Ic09FguDUXEqAhjK41DOyhRkOBdtdy2e8AXGwprwkGFj+2ROrZfiIZOgAyger2xxx/Gc4Rc6iTUmqw6K02XvFGqCiiSrvdA+3C2Xe8/NDIy+FYSXIBpLpukoyTuJuarj1nWQYn/qKznkqU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qr9ckc5a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPwHheq7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669618xV933324
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rj6P6226UzjkYIgt9Mf/cOyc
	/GcJxd9MKs8WkH4Ew7Q=; b=Qr9ckc5avzQWZ1W8tZnYumyupzdwE+MnUwWtdzBA
	ufgQsYkesNE3AIDfsX8J38UlEqhL4CvcZbUgLfYe3xOMqX3UAWwwg5IS5JpZNMm2
	v18IWWZ3U5mDggPrEgQhnZzpVgXWtR2NwSa1SHh7Q2A3apqgJj2e9vg/wYWMgIHD
	EJLf+M3x2T9XD64jd9mqQMjVLZNluoV2V8cPRyh+Q39mFIVgc1nMnaJUXcYk9UU2
	D1LKNLerrMssom56HxR8Nvrrk2YbggcDkrXZkAgR8fwSsx9I1W0BachGwEzT9KlV
	EQ7yrsVx2FXjv2XaFt7/rJ3Gk37HPJv8nGNF86T9zEeShg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6jftx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:34:00 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9693cc255cfso1532681241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582439; x=1784187239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rj6P6226UzjkYIgt9Mf/cOyc/GcJxd9MKs8WkH4Ew7Q=;
        b=BPwHheq76GVDW+akrAI8qfVUAOhfkdg+1NGSy7h/Y+h5HscPEIwd2zju7g6JpxrWTm
         Kad5cNn5Hw2tveTuEZpiStgvnw2wP5S/btvT+yQWGEl5Pwc8P+MaSqyuWDbRYfVfKdWC
         P6VsPFaMGhpEc+xEHPQ8AyPWuW+Ooj1+VNHSm2UB6xQcxqIU90d/mIoyLIx+/UTdCPC7
         sJd6N0GbfALHIoUb/S/ShUzkkbC3kewCfYo/KVGnHsLBQDutRrbxRg3t+iLJU30XOvaH
         NlgsLbuyHMUb/25ySPlu9Zs4WhYOKLWGCzp5QzIUSUXOg9smWIhu4waHoE6GVIJHjhyp
         cq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582439; x=1784187239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rj6P6226UzjkYIgt9Mf/cOyc/GcJxd9MKs8WkH4Ew7Q=;
        b=PnLYa3Vygg833J9vZphxBCxWjTst6DrS9Cr/VpwKJASarfHzH4AGR+mRhOoRT2ArU/
         f7BQusaZ/cgyA3U9pFhL/2ARjZ8efMMWHR073FLv/O+FFepI1IWib+PTaueVDyF1Q2Rz
         YhLqxwZVYEOcfpXvrD8t/qUvcY8z070I1PDDOj4BpsWRM3w93jBrzg8vwBanq3H7dZN1
         15uoQoB9Z2l+qmsm0Wdzs3MbJTOuCYWm5/tU+3ZT982s1u+BghWfM6Zg7i+H1MzQviIl
         MdhAHqwydaLZLADHteiE7G1mUI1RW+a1W1kIlOhPCGzyRYXoMTYhQM//H1MbAJpe36yA
         L23w==
X-Forwarded-Encrypted: i=1; AHgh+RoxhS4rOdo4b+g42ANOaTAjHNEaay6hhpgvCB+rW9Icz+N8MofDgdxuYIzt10OMCUx5hh11Q+HuxhjnIhpq@vger.kernel.org
X-Gm-Message-State: AOJu0YzQdLKrrjg/xipUstIPNMz/jylX61cyuaXiSCPwZOWwuryMz5jY
	Nkei5X/1IAHRDq3u5Xym+KFCVnyyBE63SXKuqGoMJCghAz3Vs4tKqFJ8vpF2QwWh7MnN2RgUQ/N
	q5WWg1OEgLrvlZ/YDERA1nhCLSQJib6G2sKJGI2oZJ3Yw7zIvItMdxAsZ4W0curbFlK/l
X-Gm-Gg: AfdE7clQVZA7oWVBNMWpBZElmL8o3T0Zw51Cd1MUSofmoLXEpxxy5Q8BvcUI9sUxvVE
	op4O74iUVq+rndxT91+mwvkmQEisvdB3PcFY4dXehzmmY6wgu3K1n1IJqlIHruTHcE2xmS8maet
	siHzVa1Omf/be7RiX/M+7ToKRY2Gjw5fvJ7IPntW3x3bFh2ILwzkbmiytHCMTZBcOqhYh79Lq/W
	TanWqDJniKTzCRH5Tg/QrDD8qfNu1+/XaC59OWjXiNl+4uszE7T5Ek7rdk9TxLRL6/N4kfTGJ32
	rniFvKgoKztH30WQCNAx1uFo3EMsGJdgyPjAANzH6Ld6Dv2Odq0EBiPmBg7Nj0U65PCQW/yt45P
	7eQjfOakIPp4BZCala614iuPka7HSCjAJDAqnTkOqe4VwZP/Pv6F7X3W/rd93wMFCSOhYOPEMFM
	vbaAei+1pRccWmhX0G4J/RVqMR
X-Received: by 2002:a05:6102:b02:b0:739:5cfb:50f4 with SMTP id ada2fe7eead31-744dfd6fd5bmr3646390137.11.1783582439471;
        Thu, 09 Jul 2026 00:33:59 -0700 (PDT)
X-Received: by 2002:a05:6102:b02:b0:739:5cfb:50f4 with SMTP id ada2fe7eead31-744dfd6fd5bmr3646375137.11.1783582439078;
        Thu, 09 Jul 2026 00:33:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3a38sm5058764e87.74.2026.07.09.00.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:33:57 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:33:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
Message-ID: <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
References: <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3MCBTYWx0ZWRfX0OVDQSq1oWSN
 nL31ytZBba/Riu232aNCCCmkNVezFJC9pFgejsdlvjaaRme4TkQRm5lZV0i2DbDpFGCyPio83Wu
 +orQxaERhOaSwfn3J2/lELmv3g08zG4=
X-Proofpoint-GUID: faA6ufuzVKOe-mJ1LDAM-JpyQ19ANyqS
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f4ee8 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EXRVaAyRHng4RDevV4oA:9
 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: faA6ufuzVKOe-mJ1LDAM-JpyQ19ANyqS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3MCBTYWx0ZWRfX4e8pQeUOimBs
 JE0SQMJUeI55xkAb3QNKnpj9vQm5FTuxxIaIuOpRXaqLF5VJpqoAjiAOZSd+CK9qdOlQzIivES3
 qGHF6T9Qh7O9u+Solndj1FWUCBl6o002XETKsXUkvB6qZFYSnl7zBJtUVFyaYdwu6WScfFrV278
 0/nbxONl1EjiMv6Q/fMzflqGQrCF/yRF3eWK4dafTCdtVAMvToKb/bEU++p4QQDYM3L1degQXVk
 eTLx3Y+tFJfi7U8Y8mbX3MMmv2f5J5xytHakSSoA81fu7CAkraI3SMu2psjhJ0TcvvX3/rAHc/d
 fFqyjIMyOaNSWvlDtiFGKKXxj3/FosDVZe2sBn0Ba3YrW1zvAJte8SlS8paRkWcEmr3tXHxakXY
 KVIqoot5HcbVjoQnLLYyBIbFuHJnrKx17324YQ2xO92yyzdekajBPpaMLD6mQjzOTBdXUR7yjxj
 vwwh+y0wE5Vc/J66Yiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117880-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,usg2mizurxpp:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39C4A72DD16

On Wed, Jul 08, 2026 at 10:21:43PM +0100, Bryan O'Donoghue wrote:
> On 08/07/2026 13:19, Konrad Dybcio wrote:
> > On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
> > > On 07/07/2026 11:11, Konrad Dybcio wrote:
> > > > On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
> > > > > On 07/07/2026 10:24, Konrad Dybcio wrote:
> > > > > > On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
> > > > > > > On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
> > [...]
> > 
> > > OK, I can see how this thread is confusing.
> > > 
> > > The idea is to start to declare sub-nodes "on the road" to making camss into a bus. The legacy binding we have is really for the IFE domain - that is CSIPHY, CSID, IFE.
> > > 
> > > Right now the camss binding describes those things - so linking say OPE or JPEG back to the thing that describes those isn't right.
> > > 
> > > OTOH we_want_ to make the top-level binding into a bus, we've discussed that several times.
> > > 
> > > To transition from monolith IFE-domain only, to camss-bus, we should have the sub-nodes fully describe themselves as "camss-bus" doesn't exist yet.
> > > 
> > > Once we have compat="camss-bus" then fine, make that linkage, I fully support that.
> > > 
> > > That roadmap BTW is why I'm asking Antanas and Loic to make JPEG and OPE sub-nodes of camss - but make them complete sub-nodes - power-domains, clocks, nocs, including the TOP_GDSC.
> > I think this needlessly increases the amount of combinations we'll
> > have to keep supporting down the line (with a ton of compatibility
> > boilerplate code)
> > 
> > Konrad
> 
> Fine.
> 
> Lets drop the bus idea then. I'm happy to close the conversation as
> peer-nodes.

It think, this would close the path for upgrading existing platforms to
split the driver / bindings. If all IFE / PHY / etc. are subnodes of the
CAMSS, it is easy to play backwards compatibility tricks and
reinstantiate devices on the fly, pick up only certain resources, etc.

If they are sibling nodes, it becomes much more complicated.

I might be wrong here. Maybe we really should try a simple (heh)
experiment. We have your series which adds CSI PHY as a first class
citizen. And we have existing platforms where CSI PHYs were packed into
the camss node (and camss driver FWIW).

Which way of representing device nodes makes it easier to migrate
existing platform to the CSI PHY driver, while keeping compatibility
with old DTs (yeah, ABI, old DTs must continue to work)?

> camss@{
> 	existing CSID/IFE
> 	IFE SID stuff goes here
> 	power-domains = TITAN_TOP_GDSC, IFE_GDSC
> }
> 
> csiphy @ {
> }
> 
> jpeg@ {
> 	JPEG SID stuff goes here
> 	power-domains = TITAN_TOP_GDSC, JPEG_GDSC
> }
> 
> camnoc@ {
> 	modelled as an ICC provider and consumed by

I think, it's a part of camss.

> }
> 
> ---
> bod

-- 
With best wishes
Dmitry

