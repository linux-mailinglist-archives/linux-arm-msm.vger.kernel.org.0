Return-Path: <linux-arm-msm+bounces-84979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63160CB4CF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 06:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02A35300F326
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 05:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1FE2ECE93;
	Thu, 11 Dec 2025 05:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQty6PZy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7XepjUC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309D92EB87C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765432173; cv=none; b=a08+MkLC7nM2l0Bj76KaonsMENzHCuViIJA0kOLdgPdMQmyEEbCNsvwB0UMV0kN6aRslpD6Mm7DXV5bERmOP2aan3KnJEEUG9MljAggeL7nr+O6yCNX0Pdf1eoS4VJ+yeRLNZEcgICGZ/lkaYrSNTNl3jwCGz1KZcIuoDfUexUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765432173; c=relaxed/simple;
	bh=bAeD0Df47bVIpMyfpJVrdazkL7WYvmWPlKz1+De1FAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jqq+RB4fiqmLsqzTa91e4fLtLNzKCKD+wVyfFkA4RWXaqQvmB6HQSgvMIJVocoCmmkM6qZguy3bYGHpJBOfzESFi2WvCKJ0LVHLZwOq1f8Vysir51VkDsx0VObrHQo+V16ZGKKF/rGbWz4Jkdi6K6CdOFu6E3Ur3T6/ZUA/9FXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQty6PZy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7XepjUC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB32sIZ3683316
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NwyN8IJrNXD8SoIBZWx8SQJH
	zGoai58glbBN4mO9RRU=; b=mQty6PZylh5P19Ykm1FX0n+Qt7Zjnp7CMRUin7MB
	FBtOa8IDRJfZl2/KtP3kR0pBUeySHvIk5nhdgCm1OcIp2StzibFdyaqMxmifYwms
	zPN8BSMmAY5oY3lR08aYJlef2OWpaJS6N81sWjxlJ0DWLhKA6nWkz522VjM16Fix
	VVtwSIXyGGWKefTRKO17Bm5gINW7U3txjtJZeem0mBO1HdhGYz7M1NYMGpfsYZfW
	3K0rIy/Z28UZ8zlTuR08d4gqcYC2XpbgMmqt98O02P/muB6xuHkaoDIGzFVf/EqW
	VlvOnJsKW30JTDfS7kF785XElzxNXBjNQehp9UI36cH7Wg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aynpvrcx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:49:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3436d81a532so1276887a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 21:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765432171; x=1766036971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NwyN8IJrNXD8SoIBZWx8SQJHzGoai58glbBN4mO9RRU=;
        b=E7XepjUCgouvlH7XQF8MbZgIsdTgaT4AL8o9D+L25y/G9f172giRjfOYJgJ5Zf6V00
         DtVI4gmGvx1dxZTeVXnjvuOc051jhZPV34LiE4Zwsn/iAGFYHnO+VfIbfYjNSPwhtkof
         zSFfr1u5yo/ujojHwoMQIMiRsh6NRKf6qlCrv19wVWDy/nOkioXD7MK5FLoGqXbVd+3E
         CcnLTPWrIHOt4/gFAgK6+wfBlwZrGhYUUOy6kel/XT6ODGOls5eAn14jPmcwC/pmABCp
         JmjiSR+Wf6A98x5YgdxWX6vRdLiOffRxqxnpUDHhJu5h2IfgrnOtVz/dhYkH9KkLT15G
         iqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765432171; x=1766036971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwyN8IJrNXD8SoIBZWx8SQJHzGoai58glbBN4mO9RRU=;
        b=NR+cUoIQmMpjZWhMEq8ve/1+kDCuMN/6ru/6cLB5MKSoJcdfuZxCtoMvfbs9v0IP+F
         cSekq2z3+fP49UfVz8nUYQ58iWlcIApYaJicW4jSBcPwt12KJiWgj2OnFFiK0dpUtcQr
         z+GP5cjw49inSviMqD+z6qqYSnDTutZPO1ZfSswfhS/EoSLepOdCUqtjvD3XkuMpEtRx
         Y5amdXP5ac36SH7BYhOWfx22tDTQzZWTUrQ0P8s7Qy0CSJfgCT+VFwRFqc4aK3Y9Rc7r
         TVWLdLJ8P4BdBE5VEQIK0PrdRd7Nup6JeVeWGqBh0RD6D3WT4hL970ecO5xWaHKiNLrh
         n6NA==
X-Forwarded-Encrypted: i=1; AJvYcCX512ThBxa4QxuwQJ5oirhi4d9bpZQVNYssrFAhvWMnhFL4gsWIGU2XbLw3kK+u5WI/n5R3DeZTFEn8KdxA@vger.kernel.org
X-Gm-Message-State: AOJu0YwXEQynzxNCJPA5a/zxyk+BYE2dKHGUi02VAl26dlocljVMpMIk
	VnB4NFLSnSSTZp2c6HkkxjFVl6UrZCTz+HoDSDLHBhdei5AdfXd1nQGNa9FD3wsgUgHtBbeX6su
	UFRn5rmeN0Pv9k/Npk9djdypx7ARh3s97WtfQKsqQ8KDBLlUN5LM7FLw5Hyj4M8yA9vxU
X-Gm-Gg: AY/fxX4HrdpuSRXRKWiHRQfa/g1nZzQL7JK4sE0E6jR/ubDbtLDI6XquEliZfG/CJjP
	NE+vSENUQ79lDUBOm3wABzUTeiPNXwPIfgTRKHqCKSfbMCVreD5loulUZc5UrF6tYUi9X8JNDpU
	tf3wMRdHKf6B1byRzvrAMvKgds1b0YrOTWsP8NB+7AG68PODh1OwlqoWpyAPU8w4NgkFKjhXlzv
	xDSpYdfepqWzJ5O9qlHanxLZ1IaWd7jAMYQcN0pvwjStKlszyBunv5rDFkQgDKqH0KrE9NbMvYc
	FqtU0x0qwtY4h8hHLW4PiRVFQufF4cJ/JskX0Nbop4ZsBtOkX+nI7XAQUB5Hwf+Z9J9p2LjALB5
	2Ttl1UeeeSdyrSniuUY/CJS0cU7WmW+VCRQeSW6faqRu3YQs=
X-Received: by 2002:a17:90a:ec8b:b0:341:194:5e7c with SMTP id 98e67ed59e1d1-34a72838633mr4381149a91.24.1765432170708;
        Wed, 10 Dec 2025 21:49:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+DfS4aFflmDkMLyhdNowrZaC/gdIB2g+zo9uoNkqehdTHMx4/Ak+zelKEffLx/D2RWL7Beg==
X-Received: by 2002:a17:90a:ec8b:b0:341:194:5e7c with SMTP id 98e67ed59e1d1-34a72838633mr4381130a91.24.1765432170254;
        Wed, 10 Dec 2025 21:49:30 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a9275474asm713481a91.16.2025.12.10.21.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 21:49:29 -0800 (PST)
Date: Thu, 11 Dec 2025 11:19:24 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH v2 1/3] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <aTpbZHRUj6QF3KSE@hu-arakshit-hyd.qualcomm.com>
References: <20251121-enable-ufs-ice-clock-scaling-v2-0-66cb72998041@oss.qualcomm.com>
 <20251121-enable-ufs-ice-clock-scaling-v2-1-66cb72998041@oss.qualcomm.com>
 <c04cd051-b6d0-4d98-ac2d-4fc7ffcb4301@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c04cd051-b6d0-4d98-ac2d-4fc7ffcb4301@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAzOSBTYWx0ZWRfX5bRQSCeghmxa
 +afTHJWSqNPYYi9qfU/enB5TS6LSlTvuvg/2az1OnA2v5/jeSII8kEYhyYp9gzCP1PPilS3LsNg
 PO5GTgeYTu6FYbjYa7oxH4ccEp4WzYIfJCH/zbCviwXDi687CHEkUz3L7Q2YhmJgVlwdpMwtNFS
 mEX9inISBOK4E8hHdQ2ItQ/sn41E0CYvNw3KajfjP8g4pwBgjf9nkX6cTObCiAPNYXS2cP8mkQF
 YjMQ0idgcTyzrTKDWu7bSapAo+ziVYNJXFOKUZAXrNFDqI7LMdtib1GAWIKDdRKBLM0Gmwtdb55
 wkEyhSyUw5G7sZa/xZAvK+1HJFxY8E3bxrR8IrPhDnHGNyIIpBcVsDaaVitA66XZp0XO6CVwCsJ
 tjiQ+SYS8+3Fa9ocqa9+SO8QgdW2pA==
X-Proofpoint-GUID: fMtSeHtkseyv-AIkXlFF-A300QnFIfAv
X-Authority-Analysis: v=2.4 cv=C6nkCAP+ c=1 sm=1 tr=0 ts=693a5b6b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SuTxBroE--coa4UUL8EA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: fMtSeHtkseyv-AIkXlFF-A300QnFIfAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110039

On Fri, Nov 21, 2025 at 02:46:52PM +0100, Konrad Dybcio wrote:
> On 11/21/25 11:36 AM, Abhinaba Rakshit wrote:
> > Register optional operation-points-v2 table for ICE device
> > and aquire its minimum and maximum frequency during ICE
> > device probe.
> > 
> > Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> > core clock if valid (non-zero) frequencies are obtained from
> > OPP-table. Zero min and max (default values) frequencies depicts
> > clock scaling is disabled.
> > 
> > When an ICE-device specific OPP table is available, use the PM OPP
> > framework to manage frequency scaling and maintain proper power-domain
> > constraints. For legacy targets without an ICE-device specific OPP table,
> > fall back to the standard clock framework APIs to set the frequency.
> 
> You can still set a frequency through OPP APIs if the table is empty
> (and one is always created even if devm_pm_opp_of_add_table() fails)
> 
> [...]
> 
> >  	/*
> >  	 * Legacy DT binding uses different clk names for each consumer,
> > -	 * so lets try those first. If none of those are a match, it means
> > -	 * the we only have one clock and it is part of the dedicated DT node.
> > -	 * Also, enable the clock before we check what HW version the driver
> > -	 * supports.
> > +	 * so lets try those first. Also get its corresponding clock index.
> > +	 */
> 
> I would argue *not* setting the rate on targets utilizing a binding without
> an OPP table for the ICE is probably a smart thing to do, because we may
> brownout the SoC this way

Also, adding to the previous reply, if we completly remove clock scaling for any target
we see a major degradation in IO throughput. On targets like Talos (target with legacy binding),
we observed around ~50%-70% degradation of IO performance if we don't keep the ICE clock
on par with storage clock and leaving it operate at default frequency.

> 
> Konrad

