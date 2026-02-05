Return-Path: <linux-arm-msm+bounces-91906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA3pKCd4hGkX3AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:59:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD80F193E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5217305EC0D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 10:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E3A3A9D8E;
	Thu,  5 Feb 2026 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXftY+WG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8oJwOl5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3C73A9630
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770288962; cv=none; b=NxBG4TSCZ0xOz6p7RExlvT5GoYTO/ov/qf1bEv+C7da+Y2T2vkh08sHQ6Pypk/Dn4GW10ineh/YZWCgrZ6ndCacd3ODHveCOveZ2p17RTUfIs17r++Lgf+wwAKXXxPESh4/mRq05StrfsY7I8Bu5JLwHliU9B5QAEACuPLfLnRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770288962; c=relaxed/simple;
	bh=hCruqOJNUkjzkYg3Hb7e2m4DUzUOXWMWxzX+Rf5tzbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekD9yhnwjBl4vV7BraBznH2mNcKPC0UBhxdp7w5mzglNV3H1pgqKc8bgwyAS95uQp0RQQtG2O6AZuRd3vMMIH7F70Mcg5Zgbi8kOxTwzO09KW1mpba72UDE3mG3f7665DfrV47MsVwQId/Pzr+w2fce44TF4wpji35mp8GeQaOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXftY+WG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8oJwOl5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153djPl3237394
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 10:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MlaNI97g+MXBbAmK9/Ews2rl
	rWL1UCuYDL06HboPrQQ=; b=XXftY+WG+cs9vO6VmN63TKutTxiKb17okKGAaY85
	4o/aLOspQxUaEHkcO2JWFSD6KmYnO7eZ0xjnFg8EROrqIPimqrnBWTDfy8a5d6hl
	QMjOitHCJps/rKne1qNvZoS/FGlwJhqPYYIU/zemdnCWtzTfbQlDNOgOwPaGv72C
	i7CRNYym2aSN4xtvvNWd6i69JvuOYmAbuEm3NRzuqpnwkTD3c+F3UgD/qVUcSeAy
	zki6RpyaJfmZYm7+3IgbuTqP6kGCSHa6D39l/UULcL1eN3fvLVsmaYXLDK24nmnX
	vaIb1qJjil1yghTJqVE9GEzF+glrqsX7+G4JqlBJf8Hs5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp52apa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 10:56:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c881d0c617so207808785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 02:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770288961; x=1770893761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MlaNI97g+MXBbAmK9/Ews2rlrWL1UCuYDL06HboPrQQ=;
        b=N8oJwOl5C8PH4COsY3FmNEk7/LKdZ86/ZV2R7NZSxDiSNVG9WzQUmTmWcaqexb+rIi
         xlcKFg8xE4JGziSqxc7AKK3TH61DpgH3wfaKc8epOS4LEZtVVVr/Qy2DT9Y2sIM0oKh6
         V6ef9KGuVMsASpm7PXAyTb/7uONPh61wEvWXVW03qm2+Hcf7e3oR1EZY8Dr7kzGbINYJ
         oT2YP3zxG5Tv+f/3znqnQh6ExVtEpk+9t9EU3VtXaOZ21XImr5rqtg9BNW7XK/fUj1XV
         IEdjQxwqs5elMFMAHMHiqWT9FSI40mmM/2NbGzYyZWFNrHteFs2q9qGrwzXnBa33J8mS
         MzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770288961; x=1770893761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlaNI97g+MXBbAmK9/Ews2rlrWL1UCuYDL06HboPrQQ=;
        b=B38xmRrdFhRoTWB9nEpvGrR8QwIuk+qAdq6rrdyRI0nWsVYJJBv8W7d5WtlaVxZOFM
         lV1nGNiO/B/O0x9wWm4E84E3PPPfWkZS8TCQdKvT3UlpqDg0rH7yz8C3lWVqclc99rC6
         P1KNS3c9PdBNFXb8EkolfUpDe97uqNr1lWQva0gp/46WqpTfmT/vqhyEYx6yPTI18P2A
         FxC71NwzKMI7V6aZK7fGXpE11C572KanvX38Rg4KFHX1bdNFo0IDTm3QbUc5HXFVvgY3
         4JbpE9eqPhgoGtVORCow+jcSXN0+yW1XUZ4yYceWLYCZ8eW9PiW9YgIR/CgNMRJh7UXa
         WHoA==
X-Forwarded-Encrypted: i=1; AJvYcCXghUus/4Dxr1I9/v52JKgFqCvcZ+aLMNSTiTcBtoIUq7QPPQxxt1BXHz6QtDzhMVfOgQsCOkMN/udNQM1Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0kv1u+jZxOsggcCwL8de2t/eZBd0Xr55dZ9v5aF2B/l6uAjaM
	Z3noHnSbXl8fdglny1IgKS0RHemyUcJ6jsd7GFoKys6GzK6Vtbn1nWOELOaea1cBj0sBbyboCfU
	ulTuwCczKroJZzssVgMl1Z7gBhKBpzfDXQUGrovYCqMZzXJdhhzdakHBzFBt++DXOwxE5
X-Gm-Gg: AZuq6aLl2R8vl06D+GKS0eFGuIY1/i7WEH7HTl80mnVJHGJR3PxBPLMhxcAfmj2nBL6
	y3vapPm2k2QKVPSDWFov9Vksc7IASCtcYo4nKL2ZuPwaIayBafJ8QIWDwsNLmWkzIvTO7n2zLIh
	l2VGNnXRi4ywhk41guid5o5ghQRvWrkPS2Q5Qw7Yd512tWjZPcWREVpjPwcoK3H0UZZfsCQdmpV
	yk4Kiu13V1vY0WkTAShxUThwfhgGECGpmKKB2d3cPd2ime49x34rHA+4xoWApVhVITHwqmynqHm
	+o0o/dBo9K+ErioGBlz7jc1MzcgBhesVTPYkUdlyrC9RIYaNckpcbbAaLi9xJB1bGWTrc3+96me
	YX1dAi44AQtJpEJ5rHxBw2DvTMVCIlw+Astcm8i3N8A1/k2s4ywCFsthC1/asRJhuRYPKSeIiib
	q7jj1Z625pqz4eslwKJULw59g=
X-Received: by 2002:a05:620a:1a82:b0:8b2:eea5:331b with SMTP id af79cd13be357-8ca2f856b1bmr728561585a.19.1770288960659;
        Thu, 05 Feb 2026 02:56:00 -0800 (PST)
X-Received: by 2002:a05:620a:1a82:b0:8b2:eea5:331b with SMTP id af79cd13be357-8ca2f856b1bmr728558585a.19.1770288960207;
        Thu, 05 Feb 2026 02:56:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e3882220csm1347914e87.68.2026.02.05.02.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:55:58 -0800 (PST)
Date: Thu, 5 Feb 2026 12:55:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v3 3/7] media: iris: scale MMCX power domain on SM8250
Message-ID: <3bmmqdn652xm5ja5mqq3epmycthjnhhgllm5guhc5jzn42mycj@kdjqjkhuvjkr>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
 <20260204-iris-venus-fix-sm8250-v3-3-70fa68e57f96@oss.qualcomm.com>
 <2740739c-b0db-7248-f9ba-e1a7dd69a5a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2740739c-b0db-7248-f9ba-e1a7dd69a5a2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=69847741 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9MiheJ026npgdNaa-0UA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: NsPJJ3b9SN22lrYvVb_9PdcCmLNvib50
X-Proofpoint-GUID: NsPJJ3b9SN22lrYvVb_9PdcCmLNvib50
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA4MSBTYWx0ZWRfX82784Z9E3/yV
 tU8BZgRlnkFuCaeN5VeZakgfciekUwxduy/Yj6j1tfQ0C98Wvrz+sUnHMDqzGwEUlKBTxLBfWvR
 D/O+xspaCV4oLN9AGWQJGQtyK6SU/iy+VdEPUQ796sGvewfklJgblsg+4q+zkm0muxKJkOX+5Xl
 45bN9JdR0FxsymPzmj9r6+V/kGXyRES6vx6bEtFaS1fnTTFlWRv5VAk0uxyhROsovyeq9cnvfAB
 JvNQH4TsvQsOXdZAtt1DM0X2bHdG8MK+mo+h4/UI2tlUEoWcUsVo7xhpr0QGDntoqHVxpqB6KBT
 7LnjGcq0+i/qMQTjBWyIJfAxqaGCnuv1WLkYI9Ntz/Yg2wHYt9kYEN2mKsUmsf6sIj3jtyptkVk
 gLxrCifKQ57mF98BkAZNUH/5G2GQS1OWDVk7mz0mb3rprytwMYjfHIsc4jhERI9Ch0JAzAK/sBA
 gXCr3iht81VzP+5MppQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91906-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0CD80F193E
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 04:09:35PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/4/2026 6:29 AM, Dmitry Baryshkov wrote:
> > On SM8250 most of the video clocks are powered by the MMCX domain, while
> > the PLL is powered on by the MX domain. Extend the driver to support
> > scaling both power domains, while keeping compatibility with the
> > existing DTs, which define only the MX domain.
> > 
> > Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
> > Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
> >  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > index df8e6bf9430e..aa71f7f53ee3 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
> >  
> >  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
> >  
> > -static const char * const sm8250_opp_pd_table[] = { "mx" };
> > +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
> >  
> >  static const struct platform_clk_data sm8250_clk_table[] = {
> >  	{IRIS_AXI_CLK,  "iface"        },
> > diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > index 7b612ad37e4f..74ec81e3d622 100644
> > --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
> >  		return ret;
> >  
> >  	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
> > +	/* backwards compatibility for incomplete ABI SM8250 */
> > +	if (ret == -ENODEV &&
> > +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
> 
> A query here, is it okay to have compatible based checks in driver?
> 
> I don't have the links but I remember receiving negative feedback on having
> such compatible based checks.

In general, it's better to use platform data. In this case we have a
case of keeping comatibility for exacrly one platform. Adding that to
platform data would be meaningless for all other platforms.

> 
> Thanks,
> Dikshita
> > +		iris_opp_pd_data.num_pd_names--;
> > +		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
> > +						 &core->opp_pmdomain_tbl);
> > +	}
> >  	if (ret < 0)
> >  		return ret;
> >  
> > 

-- 
With best wishes
Dmitry

