Return-Path: <linux-arm-msm+bounces-88346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2350D0D4ED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 11:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BEDB302DCAC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 10:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A5E318B96;
	Sat, 10 Jan 2026 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGWMeufR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PHODIxQa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F6E318B82
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 10:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768041962; cv=none; b=bHueXLznITSUqvtFdnWs9xyVdfT/7wPacikSucMBN9s9r33JXpXpKw2JzM2xPFEkAipR6hPsLtc/vxC1sukJYHfFhuuMPrC/35KPGwcvfvoMQiVsmJSe9U7B4noFHhI6tUgJHdxdupWO+r3TNz4Y6izjvUCjdm+AHhCLm3LkkEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768041962; c=relaxed/simple;
	bh=TCNHkGRPrNl4tMA9s5UCLLKzeAgKmFTcBT7iLjFJLos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcAZtdnCyxzcp5UJ/BoY+wjgugi+3pWtUGzBwa2FnROjIWed+ju2OCXSrTej5uyk3ULEbdhI53uuDIm3FWJo+SZY9TjPPDUwg0duCiMtXCdXN4Qhq1w9KBlZdBGdbwniuqjR30HLr+Gq7ykykfWmrnHmQVNhEibIjQBlEoS2614=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGWMeufR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PHODIxQa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60A9llcr2905342
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 10:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dYQJmxLtA6YlVQI11wziCwTn
	+OgvteNvmNWULyo3Ies=; b=dGWMeufRm4yyPfvTyTzGV+kIfLckaUM9vLN7tZh3
	wHVwDOZsxMK+Pxdh12nnInNl+Lt3SSmccoeMtZz7XSNm/1ss/z1qryPA6szdZeLe
	1HOQeUrf3EKEIF76ukVtOg+U+dRpjX5h5TuLN9sMozZjG+KEZY051HcqJQXqeKs9
	8n1hQM1240sGCO0SULZ86kTsNAl/CPv+JVJTJ0i7/tqxtuw6yjQmFKaReWG4jiOP
	kCUyLyonVVVO6w0ogN46xVT/poR05brmY+jHrNNSioWuVMJThjplWaJ87Mf1Qj34
	11R/E7I3U1oNsgIeKJOWEYczRb97ft3ZB2v2/hZgV5HxEA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkmem025y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 10:45:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c1cffa1f2dso1051568785a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 02:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768041958; x=1768646758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dYQJmxLtA6YlVQI11wziCwTn+OgvteNvmNWULyo3Ies=;
        b=PHODIxQacTvcokNZaDYckydttnj/TqzrRUjMjtBKKS1jDGpj/9dLTGlYtUn5IJACY8
         reGSqAYQBO48Q2TBEwZBCujjH/KCMt45IbcQJxJS9ZpPGnKMzZKzbBL2U3KtqsSUmt9i
         toQ+CQpBB0yMLGfEzSe49fvy9Zsn893TFddoRdAv6AAbZjWKInGOHR01G9MAcYCfjWYe
         aqUpeBS1P0VtmjVhC3aXEy3YSWtZn/MrCMG/Bvi1N1Nv+136UDaCrBtlmUMsxffytgaL
         KsJu5sIgOEi97kI44HidzJV7bX3lrKBp7kwqUSQRsfTsri0KbmRg3Tl3q6j/Q3q+GZOC
         9RBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768041958; x=1768646758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYQJmxLtA6YlVQI11wziCwTn+OgvteNvmNWULyo3Ies=;
        b=RU1kRA5x+/Kpty0jHCDvS16vMpu2JhGlvs7htGmZQ4/9EzA/U2y3k9t4VGKVNQARZf
         nf8mAA8V/JLCfSkcY2OrZNUoezEoBaGSslksrNaYrCLZUkPFgSx1bkdH62t2KXPmVimm
         EfrNpeKpnNox9n5XzUhBJZiH9Yl8ibZHnVocqWDxKOh3ZDP8IwsMET6Pec8fa51dhYmU
         IWSuOqpkCitFo7pqMVwPlCwjv9pk5Xgp/c4ehlN/g+UjHAYGRJO030cbv7WbMZx460Pj
         vrQip4eYahiLK54C+f0z+/IqcjlOAlJUUj0ul+Ch0GD3zziXOAYZwzzdfCOGT2xqysZg
         o3gg==
X-Forwarded-Encrypted: i=1; AJvYcCUUDjf4Lc8gh6kt0TcSjTcgjLM+9B01l1VtBnz/koxOa8yRPriea5fsH01xcEFNe4jmtcktHj/gK9RJVYuQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzDSIgOvgHes79LusGykZOLXlDQE7C2rU3Woq0ecFZ3jBFqzUyO
	m/CT/EkR4UN4phl9vEiQzaWLDxcVl9oeQjfTk9xS+j592WuEC5EBFFOXhCCwzzzYvQd4jcPhyLD
	/n1ZKMeTtOIF3CDfpOBRebpXztuL6GzSc909BV9e3nlkbpPHGl44NeFxSmlgHo0uxffPV
X-Gm-Gg: AY/fxX5fDi3AzflsWBmROcHiQpL3JmKm53BOl2bmB5AEO6lASAKQJTXf4W7cFkjNw8e
	Dp5RLu9ZilnDKYuWx644veBSFVLdSahG512jbnzY2DH8G+wD+uv+CCHc8hVdhsr0hh0tcFTPJU4
	xU7fbLZGSyEaAdK/GppqyJPHdf7DwDfXhs6NhJIv1YyU6R9GwJ/Z4LB6c3QOScSUyd4AzkZdmMb
	WuRnk0nH+F9L2RMYHeeiZPdk3U/Wa7x16IMcFMOIaZZNslZj4zGULc3+rv/W40rsizLBi4GzE6/
	wJKPuYvu1pm+8OsiaQvyUnMU0CKvvi8pbGR0JRw3YudG3XES2KEpGAoH4P2atMpTwGv6HUprgRd
	VJLDE6n+jbW4VcBAXoSUiRa8q7/GWJUChlXApEO08huQkYortMVRInU9f4Q07sKBimtIk8pLBmY
	xtdea9ZW7w/P5YMUKB0/kN3sA=
X-Received: by 2002:a05:620a:44c6:b0:8b2:dd78:9288 with SMTP id af79cd13be357-8c37f4d6fc3mr2194442185a.13.1768041957789;
        Sat, 10 Jan 2026 02:45:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQEsXHEtrN4Tbqm72kgYTDVw1nykFc9S+KxE6Bnu6jdH0gUp/tS6qLlXb4fD0qTZS54Q94mA==
X-Received: by 2002:a05:620a:44c6:b0:8b2:dd78:9288 with SMTP id af79cd13be357-8c37f4d6fc3mr2194440185a.13.1768041957303;
        Sat, 10 Jan 2026 02:45:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6e821fbfsm2697924e87.35.2026.01.10.02.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 02:45:56 -0800 (PST)
Date: Sat, 10 Jan 2026 12:45:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <nhgxvv5bm3bevq4qkqnew6gaqlwiaicrs7yjckg26fgwnffqj5@u2phabfukljx>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
 <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
 <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
X-Proofpoint-GUID: r8_wzhorqtI44MGirVc05kj_w8E-zz4J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDA5MCBTYWx0ZWRfXyMwUsAVs1ed9
 N/+L8dgqmeZ6N20lvJVROjo0fMY7vYD8RFc+OxNBEOaw6RuE8kIIBbSe18zXMmKxRuuCZT+xtMb
 nWMWI7H2AE6/L3adlZE1Ji66ysj0aRvHUe/+j65eBZ2o2gBSD9eFLYQ5WLaUXatf6Vj0xp7sura
 gy9ccfGSEbW2vcVQsdUBSGiGa+8ddvgMLATPuDHMzg67QGEnmBB0/rwZI3ZGwhTFNyzNaY7ttlk
 s5QVW7U+5sLRDi9xqEEIBq2jZ8uI6aq/b6h0OCz70pNt9rv/+qiPwPym+k82HBnwhq91Cg0nMMl
 DzPYiobEr/mtLlQVaFrrmi8ZVLSN4bbFkeE6ElkmZkOiC75aV3jJ3sHOsxACidgxRjlX3+bWilV
 wzwWKGImx2vNMkH2czMtKK2FFqpj/ds7tqREezK0E1l+qKSsoP/AwjMb+jkQd3egytTaSt+U8/U
 mvfJ6PGbZnnWwkNxj8w==
X-Authority-Analysis: v=2.4 cv=Z7zh3XRA c=1 sm=1 tr=0 ts=69622de6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KLUUaQERiW0IIiXZ-soA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: r8_wzhorqtI44MGirVc05kj_w8E-zz4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100090

On Fri, Jan 09, 2026 at 11:50:46AM -0600, Bjorn Andersson wrote:
> On Fri, Jan 09, 2026 at 05:21:10AM +0200, Dmitry Baryshkov wrote:
> > On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
> > > On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
> > > > On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> > > > > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > > 
> > > > > To make sure the correct settings for a given DRAM configuration get
> > > > > applied, attempt to retrieve that data from SMEM (which happens to be
> > > > > what the BSP kernel does, albeit with through convoluted means of the
> > > > > bootloader altering the DT with this data).
> > > > > 
> > > > > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > > 
> > > > > ---
> > > > > I'm not sure about this approach - perhaps a global variable storing
> > > > > the selected config, which would then be non-const would be better?
> > > > 
> > > > I'd prefer if const data was const, split HBB to a separate API.
> > > > 
> > > 
> > > I agree, but I'd prefer to avoid a separate API for it.
> > > 
> > > Instead I'd like to either return the struct by value (after updating
> > > the hbb), but we then loose the ability to return errors, or by changing
> > > the signature to:
> > > 
> > > int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> > > 
> > > This costs us an additional 16 bytes in each client (as the pointer is
> > > replaced with the data), but I think it's a cleaner API.
> > 
> > What about:
> > 
> > const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)
> > 
> > I really want to keep the data as const and, as important, use it as a
> > const pointer.
> > 
> 
> I guess the question is what are you actually trying to achive; my goal
> was to keep the base data constant, but I'm guessing that you also want
> to retain the "const" classifier in the client's context struct (e.g.
> the "mdss" member in struct dpu_kms)
> 
> If we're returning the data by value, there's no way for you to mark
> it as "const" in the calling code's context object (as by definition you
> shouldn't be able to change the value after initializing the object).

And I, of course, misssed one star:

const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(u32 *hbb)

This leaks the knowledge that HBB is slightly different kind of property
than the rest of UBWC data.

> 
> You also can't return the data by value and then track it by reference -
> as that value lives on the stack. This has the benefit of making the
> lifecycle of that object clear (it lives in each client) - but perhaps
> not a goal of ours... 
> 
> How come the ubwc config is const but the hbb isn't?
> 
> 
> If we want both the per-target data to remain const and data in the
> client's context to be carrying the const qualifier, the one solution I
> can see is:
> 
> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> {
>         const struct qcom_ubwc_cfg_data *data;
>         static struct qcom_ubwc_cfg_data cfg;
>         int hbb;
> 
>         ...
> 
>         data = of_machine_get_match_data(qcom_ubwc_configs);
>         ...
> 
>         hbb = qcom_smem_dram_get_hbb();
> 	...
> 
>         cfg = *data;
>         cfg.highest_bank_bit = hbb;
> 
>         return &cfg;
> }
> 
> But we'd need to deal with the race in cfg assignment...

static struct qcom_ubwc_cfg_data *cfg;
static DEFINE_MUTEX(cfg_mutex);
const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
{
        const struct qcom_ubwc_cfg_data *data;
        int hbb;

	guard(mutex)(&cfg_mutex);

	if (cfg)
		return cfg;

        data = of_machine_get_match_data(qcom_ubwc_configs);
	if (!data)
		return ERR_PTR(-ENOMEM);

        hbb = qcom_smem_dram_get_hbb();
	if (hbb = -ENODATA)
		hbb = 15; /* I think it was default */
	else if (hbb < 0)
		return ERR_PTR(hbb);

        cfg = kmemdup(data, sizeof(*data), GFP_KERNEL);
	if (!cfg)
		return ERR_PTR(-ENOMEM);

        cfg->highest_bank_bit = hbb;

	return cfg;
}

This potentially leaks sizeof(*data) memory if the module gets removed.
Granted that all users also use qcom_ubwc_config_get_data() symbol, it
should be safe to kfree(cfg) on module removal.

-- 
With best wishes
Dmitry

