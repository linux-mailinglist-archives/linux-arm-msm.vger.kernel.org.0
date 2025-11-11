Return-Path: <linux-arm-msm+bounces-81174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 09975C4B87F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 06:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC9634E1DCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 05:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EBE27FB03;
	Tue, 11 Nov 2025 05:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="az4ZxLfH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N6Gxef9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4980E281341
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 05:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762838515; cv=none; b=rjhKS4k2sl9lntDoa96ljRNOmV5Ybm6cUEzFcMLfTb/xe50H9w0epr8dSTHSMY/geb6I2NXzONOB0YIFnkT5Qu+2wnIglcNTI92jisQTY1WfkTrCfban7kAJJCJk6EigInIT2VDtBIdjh984RVdlLPB2O0bV+DXbe3O4AOkPClo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762838515; c=relaxed/simple;
	bh=2+1Lkc37PtoD2ia3M4HnHwjYFV1V7XKbcCnqjQYPRLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6WgDjRNvTc03vtZxOj0/3FYFPleZU7oWCogEaQeKUMKBM7Cf4ETMjz6KpGizlOt0DVZ10S/P6MypTNa8wnY3fJtK3c4n9WL3mI1F12TlesGQ1Xf3wmPyRnUo1DsIo1JQOSIhUm26U8mJbmNY1pnZDisPn9ATZJMLNqvcPsYqys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=az4ZxLfH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N6Gxef9H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB1BnOg4071538
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 05:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WN42lFWa1VXVmC+HW9C627cH
	jiam2GbdBSO9ab5J4Ts=; b=az4ZxLfHN4FTzCFolja3LJgxordd9+1mO+nHBKOF
	lXiOlLnj4t7nMlQTMEK0tDCR8mZmScp2eNS9tRzhLZwMoMK8k2J5dQ2hoHVj1Cdy
	6hRletrQdLfBByVILc9WghkAiPfJAyyH6pWmxiOYDgVOlHagCkcAHwj/CV8TBUlP
	cWq8NNW4h/RIaNd7cXDG6V2BNpsNF5FpFWI1LnHdiKX6gcvSF+XwUoLkImUGxver
	bWd9rwgsZwgY83Nsh8+R/2izvJ985oqSludqJHb8BfBbd7iRx+wIoYIwgNjGga6M
	i3NSTydpVV0DqwqI8q2h2hU4w2c4MAhIuBpWOwdv/87YRQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjpgt4j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 05:21:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3418ad76023so9576742a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 21:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762838511; x=1763443311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WN42lFWa1VXVmC+HW9C627cHjiam2GbdBSO9ab5J4Ts=;
        b=N6Gxef9HJ/RH2W4ng+iVhxanpBxJtwh9dA7VGVc76t5tCGvqL6WbkxRT5ajeb3UqUj
         XWwQcT15whbNIs7hvWbtMCPKyPFC01PXBi6aLDtYSsdii7TZ4So2di2NcfMphNRXubHV
         sdQolJcZAcgtfaxCoiJVXY8fbpqEeagQ+fMh6epHrlwmnXYyZr2KWZi5MbAI8MZx1W4n
         K0OliqjrwwdxVF+VqKcJbGO8ikBrrTq8SdS/gET2tFm6ulVFx04IzRjYg/+/yelrtkbQ
         dq4xaXQmSP6V9Qyv3RDpQz0+xdzyPODbnsoQBI3Gfxc4aIJtq30zQPhtkcdfuVTUwvGC
         bgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762838511; x=1763443311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WN42lFWa1VXVmC+HW9C627cHjiam2GbdBSO9ab5J4Ts=;
        b=TPc7/SLKqboBRtxZV6ExC8TV2Mqa2HQ5vQ/4NcSc/fTShsotc7aKIgJbFSWNLDqsvR
         JXuZFwro5EjzIUI5IMNq9/IB2DTmlp9dC8ySnDXHng9kmvuVjm6mSESArNtb3o27ifDg
         xPCPw6Sj34xuze4vHgORDVZnXyZBaQ1vOMJ5ausdybiHs90r/jnPTyz0Eg0hNtjTWk8G
         uKc9UfQ8rJosWAXLyXR0dOsj/UPZHyN53dffHy1cfdsUBET6H/ihACKLT+ObFX+Hl7xL
         bxZxtlJUknbMAXKXbLGxJpoxJfYWKbCNI3ShvDf1bItN3T8wjWwHfzLZ7B8lFWt2K3Qo
         Of4g==
X-Forwarded-Encrypted: i=1; AJvYcCWOOd6na6+VqPcw2k1VRNUZIxnY3MOdpn7Cp4FsOOG7VHxqyTVl3yphEhgtxaE89rQ4JgwDmhbjovnDAonS@vger.kernel.org
X-Gm-Message-State: AOJu0YwTqKr2fGZhIdh1HqKIsRiDJGC9IRqByXQ6yWu/Wto5UR4O7sRF
	7IXlgoodUT/Q7HZyBdEthZTr4dORyKHtcXjyRjOytyoXT4Y04bRWipoAHwcb0RTbbSrxa1TIvJi
	Bat+dzZpK3CSrHzQfb+uauOeCokFOwNu9qpeLwrDdP36mCHeekuDfjw29tii3aFroXYBT
X-Gm-Gg: ASbGncvoo2G4dQvJCDpF+vYyRHYvrjxw3bPVsGBFPqMR7py1wEOZ6NtWnX78qZC99Ss
	Drn3pBYWIfWd96iG+mLnL5Qqmw9oGnnsxbAqzNbeIA1pXlvMawPxAxNl+fMF2ZWxrSz0UQAgVGV
	6flc+RDA1FZG8atI9+DaMQ4c9HQttj35lU/SAcKVMT+aPU9FVXDctWOofx7gnvlOdoYeE0bw1ax
	YcE8E0h0fvXRg2HSEKFDLtAjEgVbCJtfednIVcFerA/vHXBRZlIZ7tleBEA+WPVYjThTEo+MX/f
	hIfF2YmVh4Oeq9jTXb323A7NvjrUHLP7CCFhb1IfJiQQmoMrI5fbRz9ZB/UPu/n1BAGYl/2F36L
	W84AAX2SaVF7JWHLmanbRrIEOPTtCLgPo
X-Received: by 2002:a17:90a:e710:b0:330:a228:d2c with SMTP id 98e67ed59e1d1-3436cbb53femr11853465a91.15.1762838510859;
        Mon, 10 Nov 2025 21:21:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlGunmSYa7rotP+29I+8UNeZf0u9cU++cKgnFNTSe1jAt3AVJudOr7ITZMlKLQVEYlGOScFQ==
X-Received: by 2002:a17:90a:e710:b0:330:a228:d2c with SMTP id 98e67ed59e1d1-3436cbb53femr11853443a91.15.1762838510344;
        Mon, 10 Nov 2025 21:21:50 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc175d61sm13520467b3a.39.2025.11.10.21.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 21:21:49 -0800 (PST)
Date: Tue, 11 Nov 2025 10:51:43 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        hrishabh.rajput@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Message-ID: <3794bb0e-5e2c-4d5e-8d81-d302fa36677c@quicinc.com>
References: <20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com>
 <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
 <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
 <263d1390-eff5-4846-b2c2-31f96fc3248e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <263d1390-eff5-4846-b2c2-31f96fc3248e@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDAzOSBTYWx0ZWRfX0FYhSPuZ9MkW
 tVya5Qu4qN7Cvtu/dfQkCxTNzK85VsPubDUEGvY66I/l4clzB2Hdpg++MXx4ZbGLrConXcP8ckc
 FoSlkCz3ChWPBbpXhMG8AGvE6MInm2pKhIq7mqLnmtPNGAECI1Ha0wYbQQbx1ILDb8UEDY55tSF
 Q1gHuOtvT7i9SJC0wejilAxmBU+Sl6Z2qwvvp1uGXXOeN/Qka4iw1OFgHaeetELZqMp7ta5rsfx
 MZhLeSCBI7K2pKwez9O/I40CXWODRiNCOR6q6goc6sT27OUKoLvKKP7QhIvfYSijn3Uw7ukjYze
 8Zr0xNtydexMG4b0G7i7DxXr3T0gnjNKxwSJ8CPXussKePUUZQ7sAaLxk0b4g8QFnTJKzhFtBM9
 l6QGTYDP1D/x+6zuja0iIemHU8NfAQ==
X-Authority-Analysis: v=2.4 cv=br5BxUai c=1 sm=1 tr=0 ts=6912c7ef cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iezrOMJKwxUNxZnDgFoA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: pardsI4htUiHxohpvfEIBQfYuF_Rtnwz
X-Proofpoint-ORIG-GUID: pardsI4htUiHxohpvfEIBQfYuF_Rtnwz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110039

On Mon, Nov 10, 2025 at 09:43:53AM +0530, Pavan Kondeti wrote:
> On Sat, Nov 08, 2025 at 07:26:46PM +0200, Dmitry Baryshkov wrote:
> > > +static void qcom_scm_gunyah_wdt_free(void *data)
> > > +{
> > > +	struct platform_device *gunyah_wdt_dev = data;
> > > +
> > > +	platform_device_unregister(gunyah_wdt_dev);
> > > +}
> > > +
> > > +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
> > > +{
> > > +	struct platform_device *gunyah_wdt_dev;
> > > +	struct device_node *np;
> > > +	bool of_wdt_available;
> > > +	int i;
> > > +	uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92, 0x65,
> > 
> > static const?
> > 
> > > +				       0xce, 0x36, 0x67, 0x3d, 0x5f, 0x14);
> > > +	static const char * const of_wdt_compatible[] = {
> > > +		"qcom,kpss-wdt",
> > > +		"arm,sbsa-gwdt",
> > > +	};
> > > +
> > > +	/* Bail out if we are not running under Gunyah */
> > > +	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
> > > +		return;
> > 
> > This rquires 'select HAVE_ARM_SMCCC_DISCOVERY'
> > 
> 
> Probably `depends on HAVE_ARM_SMCCC_DISCOVERY` is correct here.
> 

Dmitry / Bjorn,

We are debating on this internally on how to resolve this dependency

- QCOM_SCM depends on HAVE_ARM_SMCCC_DISCOVERY which means restricting
  QCOM_SCM compilation than what it is today.

- Adding #ifdefry around arm_smccc_hypervisor_has_uuid usage in qcom scm driver 

- Adding stub for `arm_smccc_hypervisor_has_uuid()` which is not done
  for any of the functions defined in drivers/firmware/smccc/smccc.c

We are trending towards the first option above. Please let us know if
you think otherwise.

Thanks,
Pavan

