Return-Path: <linux-arm-msm+bounces-114803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2sqPFLF0QWpPrAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 21:23:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A746D4C4B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 21:23:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oTHW0JZA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eMz+yVBf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114803-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114803-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E1B1300C9A9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 19:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE3333F38E;
	Sun, 28 Jun 2026 19:23:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB01329C7C
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 19:23:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782674603; cv=none; b=l/MnXPI8OjSZ6n6B0KaYj1adzkA4qk+16Gxt9fAIjO/iDBLrsv8GPt9dz/u+mEY3itnLcj85ywe7KMO5YNhSVBx/rgw5mqwWt1tUNc85pQeUKaTeaZ41jrfBTah9x6U6FCMwbvigbV3WFeeW1B9O0xCwv2uF6yzu42jIawk+NLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782674603; c=relaxed/simple;
	bh=MYgSAuMhbxiutVM5DXxwk58W4oicMwjhPZrOhiMr8NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArSepLAye7iBgFP4CQx/gqzmBSMPXNw95fSNtI4gVYKZQ17m4FWaexeF4QZLY/vYd4Uhf/UyLK2tj8Zvh4IKtqlDMxpGrHnIzEHutiJ3gb8BSp9W2zSBRgXlKKsdXnd6EkYbZh8ezlmUEuACwk4mYYVjlMmj6B1Fb4Yjjb2qfM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTHW0JZA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMz+yVBf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHjVp9426202
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 19:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Dlxmw3piWy9gqO1kMZlq3gPc
	gqxSTVsCV/CnysTfKpw=; b=oTHW0JZAJxv9OA8a3iGO/yV0kBlvo0XVEpd0eRKx
	G/okrLOQx4PGr1zKlsVj+Tp3Qj1mmnQq/c0BKqYLtERitSHKnyZqWfefXHALoS/P
	ZxT3JihsDhVDiV/ZecOSjU9QxtHQsewspFBnuXN9RmsI8EtwEUiB5MxEJhb4DenF
	n9rULAugnj66TrgijHU6pOTCsYXTJ5GBhcyyXsil5SzOidKT3B9oUpRTMm8hGdk7
	AzOVrwkeXXFwhwY4+vyMORANjFLqk38hwIyMUwhC/6LUtRCk+xCklHVz/869dPqj
	aBc9jX2AzlK75WIKlnNGmr1JmiNT/zi0cqkgpNSlQt/+Zw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27333gpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 19:23:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91931144870so576335685a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782674601; x=1783279401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dlxmw3piWy9gqO1kMZlq3gPcgqxSTVsCV/CnysTfKpw=;
        b=eMz+yVBfTK6X+YY+ouduUkqSZH7JfVDCMjJBIynfpVfU2dBYqAIRYcyDf5D1K1NKvp
         Cbz2u+NjugApIvfwNASwr0lnScaEbqy7tWfauFrztdcx0W2Ogzm9nwbs9gVh4JCM1Ehy
         XU+xtUbdqGM9292HsmFj5S7gNU7hd6uCzAojR65y8aG82VJUm2fUxxnnYfIfsMtC4FyV
         dcW+41Tep+wQJdo5oL0vPjQ2aKmcLrBt99kPnJbuOHPXGHZFDy57nQb9iL67XJmQSjWN
         jqvOdXOjYPXicflTPk2yKuYz9JDi+8ax8m/DXafeQJGDiLOqN1CqNCmqz3Y0HAvPi/JU
         145Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782674601; x=1783279401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dlxmw3piWy9gqO1kMZlq3gPcgqxSTVsCV/CnysTfKpw=;
        b=Nin0GPJbP4aaxPZBm+fn1ZL9q1WoKwPNz96E/HeBuSu2GOyR48OlvJzvsyaJLaGp/H
         iLpI8T3Adja559MbgeqecPW+5X+1F60pObTonI5+gFaO7BRasG9sj2gwISBR9VU1aPGp
         jurhtLCVaaTaW8JfyzxFKJ4YLi1mMqapUj1M+jralZSHdVUvElikVyN85WigXvZMPRhe
         tvSdfFOGoDx2KJhtYBMFNmTTMHt8fYBhndbiKCtn1XagaYrbxzJs8qRHMHDACoMaoWwx
         3YW3/BkAGQ0pJWugfhYc3WyCpKEkXqK3F+ztN/EtxhQeRjTDHeOiwcSL3QVo/9vJfcKD
         RNeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xIiScjQpO9Y/QM9QypfGjAdE2sylQyB6pG2Qzi2Yk3isQsS86YkyGFZv31FEdUB16EOB7k9RWFyWpcznV@vger.kernel.org
X-Gm-Message-State: AOJu0YwQetcY7WB795LbJFOQl7KL09OMaYkEZdWbfecFMkZOGJCKjpk6
	SvW9FYwVUl0e7Sw6yTJ1hNDSGLO8hYBWjjkK08DIGR8rCPqcKepuuqkV5YLLo0rjbNNLlUrhQq0
	jdyOs4hFbW5Zv5QlSout/nKkOdbmqAUtnSZknSqvvaOMPRLoUw0fYpSBUbM1/E5UZsYZ+
X-Gm-Gg: AfdE7cnWQCC6Omb9CV92Z4l9Wv2SJuDT6mz90HxR6izMv+gIuNPEsQP3bDAMku6oT6h
	VqlcRfuD5u727kmxDljXU/tPWd9ZzosNEpj2Sg1f4g28s9qC7jJymI9dtsLXS3O5/kt97cO46Aa
	U7cqV5u/T/IapPLcthFE58KGVgeyV9TistKA9Yh3G0KGfMdCa4GRfV+Ghq7ELdy3rsgKmGijUde
	nFK++mkPHyVCCYHtJpedlnkwPjz+0AwqCPSOx2ddhXwOXe/5vz2bvfIMGr9221QeIiZ92iD2iHQ
	E0JC3Mv3iEiyFaOYfw4oZ2B+d6I0qZqAz2PQ2VIycot6lS/A9veCNPYyqABKm0/rzW2wlR9QY3H
	+09+hLfSLy1RUdQ25VZql+JT0d7Tgt7vrePsQ+CwygCwqqsQm6flLf3/zqjbZl188rXbYwq50/V
	bEHe2lCVQAlRIucUOShMjSwGhD
X-Received: by 2002:a05:620a:44cb:b0:915:9047:940b with SMTP id af79cd13be357-9293a2ccfbemr2196869985a.1.1782674600958;
        Sun, 28 Jun 2026 12:23:20 -0700 (PDT)
X-Received: by 2002:a05:620a:44cb:b0:915:9047:940b with SMTP id af79cd13be357-9293a2ccfbemr2196866585a.1.1782674600447;
        Sun, 28 Jun 2026 12:23:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeb0ee9f6bsm1193080e87.54.2026.06.28.12.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:23:19 -0700 (PDT)
Date: Sun, 28 Jun 2026 22:23:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [RFC 00/12] RFC: Devicetree-ACPI hybrid mode
Message-ID: <2dbfkh3djdrvklsin7zcy53g3wpc76dd4iosxgahbd26zssmx5@zpkplzscllx3>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
 <20260626-friendly-ammonite-of-holiness-aabefb@sudeepholla>
 <obvpvyx3kmzcdc5nxmx4inlpiqugjxdgzfzmdxzfqqy4qqwt7l@y2zyrtso6yk4>
 <20260627-miniature-skink-of-superiority-234091@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627-miniature-skink-of-superiority-234091@sudeepholla>
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a4174a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=B8OEgOhrbld77uko4dQA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: qXQiNvS6NR4jkkMSJWYvO09JazAdlTmh
X-Proofpoint-ORIG-GUID: qXQiNvS6NR4jkkMSJWYvO09JazAdlTmh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE3NCBTYWx0ZWRfX70ur+kcSPcTB
 J+8J1izoYeC9SYIdDHXxsfstKHNU2LeVvK4LHBwW5HF5F7Yhtty7rNWF8Pr15bhR7zrfAMxdiJc
 7XDsxO8KYGzGUcsZhECWWvqOXv5nnFc9NMZ/W/fTdn2PONQEDTRY1jUY1UAyPDXCQJEs4PtvONa
 8LGAKtxndPGE/KcYAA1nb6Wji/z2CGIn2PVKUIvXgVoX4ZkXx45NlyF8Qa1+VxCwZ9qrmmoiMxg
 g7UwycyQlrP78DBE+Xx/uJjn36RicFHJ1D2yPWuTQ3LHywXkncuneIhrc4QlQ4iTgOZGg7DpE2e
 Cx+RwadDG0nIMu/vCkPKmCYchfmNxY4oaupxknidHfP7arT3Vpz2O5n8oXS4QCUn05OJx9xG+Gk
 A7R8dfGkfRhdKE6yv0qMrSUzGDT+T8+6dTEwFZkCZFuntLIecGpOPdZSIrwQlL4h11DvsV57Lh2
 pe6vUnYlKQif+3CV+eg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE3NCBTYWx0ZWRfX11IeVIlao1pU
 lLI2/oyLnfWlC4YDWtJ8DhM8xmBZSSsTaa+XWLRiyoFCEa8YAsZRGXbNnQELrhD52eoyPGlWQdU
 oQ0m9/gKK2i9vG22Ccd9e/GdHPzjctA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280174
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114803-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:johannes.goede@oss.qualcomm.com,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0A746D4C4B

On Sat, Jun 27, 2026 at 03:12:31PM +0100, Sudeep Holla wrote:
> On Fri, Jun 26, 2026 at 11:57:47PM +0300, Dmitry Baryshkov wrote:
> > On Fri, Jun 26, 2026 at 04:52:41PM +0100, Sudeep Holla wrote:
> > > On Tue, Jun 23, 2026 at 04:52:13PM +0200, Hans de Goede wrote:
> > > > Hi All,
> > > > 
> > > > Currently as soon as the kernel boots with a populated DT provided then
> > > > the arch/arm64 code sets acpi_disabled=1 and the complete ACPI subsystem
> > > > gets disabled. On WoA Snapdragon laptops where the factory Windows OS
> > > > actually boots using these tables this is not necessarily desirable.
> > > > 
> > > 
> > > I am bit lost reading the very first statement here.
> > > 
> > > Who is populating DT and why ? It seems that is the source of the problem.
> > > 
> > > If windows can boot with ACPI tables, why is it causing issues for the
> > > Linux kernel, any specifics?
> > 
> > Windows uses a separate beast called PEP, which nobody wanted to
> > implement for these platforms up to now. You can find a lot of ACPI
> > dumps for these devices at [1].
> > 
> 
> Agreed and I assume that is the reason why we want DT.

Not completely... Using DT forces us to reimplement bits and pieces for
these laptops. E.g. drivers for EC, battery, etc.

> 
> > > IOW why is DT populated which creates the problem you are trying to address
> > > here.
> > 
> > Most of the laptops resemble other Qualcomm platforms, which use DT for
> > hardware description. In some cases, it is the same platform being used
> > for both mobile, IoT and laptops. It was more or less natural to reuse
> > existing support.
> > 
> 
> Sure, just use DT then, why are we even talking about mixed/hybrid mode.
> It gives no incentive to OEMs using PEP to get away from it and use
> standard ACPI or improve if anything is missing.

Well. Here we are talking about the laptops which were being sold since
2018. I doubt there will be a UEFI update for all these models.

> 
> So I don't like this idea of mixing at all. Use ACPI or DT, make up you
> mind. You can't expect to get the best of both worlds if you are not improving
> the missing parts in either of those. This is just a shortcut.

So, if we need to append the DSDT, what would be the best way to do it?
Something like Surface platform drivers, providing extra device nodes?

-- 
With best wishes
Dmitry

