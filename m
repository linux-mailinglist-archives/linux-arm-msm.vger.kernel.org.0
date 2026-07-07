Return-Path: <linux-arm-msm+bounces-117350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vNrDBW4YTWoSvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 17:17:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C91271D26A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 17:17:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=p0NaCsYi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O+nPftNG;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117350-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117350-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AFC531ED1FC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 14:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9B031ED7D;
	Tue,  7 Jul 2026 14:47:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AD53054C7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 14:47:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435657; cv=none; b=Qt0o0htxfHJfDYTz67slBjN8YE+Xtcv3mthbIvKPr0mlLOg2lLVqs3BkIxE+aLpqgjBgNAcWIfphLgiyAeCPgDgRXIiZACWSAmpFLc5ktjAYiP/MIV7dmzGKeJ2G8CI2aJ7ug9/I1DrnNmc6bf09OlgN5P/cfdd72nZiFMcMVMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435657; c=relaxed/simple;
	bh=kbB/eBRZgg8WpEohJaYOhBTmcXDJ4/L3JhRiQEfaGtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XO++HFJRf/4F9WeJfn76U5XuCZ3zemz/PIQuOJfyl7dP2czT5e+1tRN6W9Qa+Pz1BjUuRvzr2ihf+95jYTtsCAgJ89s6/51CRnhtgepuQGvSMO/vfIlzNUBcZdYdf7R8jAnZ4zDjBjb/RCoznYW8zk6tqI1bLivq8T8UAzurmHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0NaCsYi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+nPftNG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8rjK3768493
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 14:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnL8n0Rge/PLupFS9hJ3iC3ksta3Fq+O1fWOUkKJBYc=; b=p0NaCsYiWC2KqUWR
	XSBHszC+Ja+g2ZwIFWFp9g/5FUjNwtQge9XqWfGw6sW30HCuKbAVoLt6Zy+QWHP3
	ftQZh+j4LdrRwvXnqWqSmC6ffC3xGv149tGagUZ+kTHCUgN2WJwb9bnOI0Dn1zjL
	NWG+IOy3dukl+KbAcIIsdjUICVoSAB2LM/O0zkRnw30JEX1i64BDnjW0381vjvq8
	QUYatQAS9+jYcCJ3+QU1kNE/TYSSrO4DN1MQxpYOOmMf+yCw0cfk28xYDTRKD2E8
	XEt12NOYzcWGIwnZBq6BGVxpHUrUhbvKSomzQuJUaSTz7/tpDIwCsr98Lb2dLwUo
	MmeSEA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj7b0e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 14:47:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6751db2792dso1413689137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783435654; x=1784040454; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KnL8n0Rge/PLupFS9hJ3iC3ksta3Fq+O1fWOUkKJBYc=;
        b=O+nPftNGiCwmzCP97qgOnIaF6pJ6+y7jr6csq5mOjv3vJxzsK8hEktRdAiG1/aEODM
         Q/lfwaC4RC7Jo94RiLthg2MOXTV3eiVFqEUy+cyZowVfZKXZyULpjx7Z9ZXjUKEplGlR
         LvtHaY5I+bw1A1AS13xYvLn2iNeGUvRrl9F59DKq7AJcf8ZXuEt/4H98j/YGj0M7n/eC
         RjwLFTNy3wkVt0n9PuQTiuVQ3aALk0beculN33UbitqZLwnYGJYIZEFYfEIiM4YOJgj7
         H3KIAsHC38a018nqAR9nJQEXUbxKcfuATMS5fOO1/3K3ww4TUeN1bqTRL6ThzDcnqD1V
         o7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435654; x=1784040454;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnL8n0Rge/PLupFS9hJ3iC3ksta3Fq+O1fWOUkKJBYc=;
        b=dii9L4LMYkMbFUnBbU0SdwT5lauoDOLE290LA8QWp4mlgrxw8sqh5ntlNpaFXekdUQ
         d3T9hNkSgYFiAClGV6IOny4ygqM8ji4H5Epg1lgl1l4xe4aoTumVtu5YILonuoUSNNAP
         IbEgo0p/o+Ofr6QN2IFOBBJHF3OukRcCT0yS7D1doeeul0ZSPLFlwX1FzLcNC4eh+nx4
         1E1PqrdZuF6nzAcrA+EDIH0yLaJ0CyNfkPUJEA9vuNqa7BYECLnZDcFca8eUcYIZDwFr
         f4neBBsPnoN+6RIhBc+cRIjjrl2juo+vEMF0SjjMscoiyNj1h5u8DiHsLX89vhD1bUh/
         mA5w==
X-Forwarded-Encrypted: i=1; AHgh+RpsS72lgRlhABdC1aMOi23ujNGujqDMlrzD0/mRsCeYb4Z8OIIfiO9vJiIUBU1ty60KdgmZfmBO5qy/+VSs@vger.kernel.org
X-Gm-Message-State: AOJu0YyWNyAatcO5cfAYLI/173WqhyUSsBDzpL15bJGmQ7Fl+MXz1+yX
	kHMQhgm79Hlcw8VQVUo8CbIFnPyDDFN7wqE8psGnXgnEw95UVCbTJcR9ijjiYKI1+XotLv8wfbW
	jwFyFNZ1i89LlYPMMxu2vzUsOFOobr9XVjEHpOLVbJXl1ndXpFKLX3ROX/BL/H8loB5i8
X-Gm-Gg: AfdE7ckTthbHpnOgBUxc3jW+lhaDf1sulEhGnOxCxPtCOAbh776134pQE9MjtisYoMS
	Kc/8+Az38Mw+aa0XGKj1OB2vKBWdwT3PeUHT4mmtKlqcMbLUCH9zoIaBZdCzuBeDT3f6U+XwoSX
	yiqeBa/JWYQLQcJWZxqB1T6lwLPeRVIvGSlxU9L3Rx+SF6tAT9CMsPT+xBptkUxvRiK65eVPUIP
	pw/xRa1uMZsr47plwW3EMbbNlSMYvF1ARIt2maVX8+xU7MdqoSD+p5a79CAG9Q/0IGoULw62vL8
	lQhr6cgdpvuI0qp04ID1jAiCleg9xg9uKhUYXes0PsmLqeP3zuzwiK3ecxStFDNJfJBZxfo/YYc
	XsF1wnpZn2aeEwiTCA2ujlev9G0oB0XJ1fOKnEFwY2MUKHiBChtW4zdCZGsYm6IOZi4DXgJvltI
	ky0k5YnC84lf1gL/X5K937OvsD
X-Received: by 2002:a05:6102:6448:b0:726:cd42:d023 with SMTP id ada2fe7eead31-744b7a8eb73mr3208781137.11.1783435653428;
        Tue, 07 Jul 2026 07:47:33 -0700 (PDT)
X-Received: by 2002:a05:6102:6448:b0:726:cd42:d023 with SMTP id ada2fe7eead31-744b7a8eb73mr3208733137.11.1783435652469;
        Tue, 07 Jul 2026 07:47:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad35edfsm29360981fa.13.2026.07.07.07.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:47:31 -0700 (PDT)
Date: Tue, 7 Jul 2026 17:47:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <n2qzqh7xbyth543qzhufvmqctjqeqzjtn7w67u77meau63vpar@a7ossfgoctqo>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <lxwvnkogwkwq72b7re25isnidjl5hzior4gvftww6vzmngus3d@sdqeb6heki76>
 <c8cb6b7d-f8ec-4e37-8a5d-48a91fbf74f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8cb6b7d-f8ec-4e37-8a5d-48a91fbf74f8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: F423eGL02drFlE3V9JokpdGd8CmjVTVo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE0MyBTYWx0ZWRfXyWfM0r8LEIPT
 ADjg8J6J9iHZxQcxMJaFmWuPwW346SGZ1DFW5oKu0hrAZYTjV5BBho+S5xfSxiNiexcp8nuRzFx
 ugebKN+Yx6sEQUJ1MQuyoJXzRKYoNUng4h3E0tTttja66kh5YJLCB2ApqnHnSgi2VoeH0ZH6NS+
 6/+wcSJ6dbbFVngk4+oEu+M4jhZizVrRqhqDZHJWmlVq9zUX2s09Dr79ZTbmvb6ucp5eYglvSXD
 +Nm84pwkOzzg0DpFIYxbMl9cMcQYM2xDQCxEegpsfruorA7vu5MKRxZ+ZDkHWaLtbWGMbmRkdgM
 QfvtuE6mRx9hOkuzM/P6M2k+REnEs8iDfGfW7k4CJzZFF4k99IQvbHUzYb8HFPty6q0BZ/Skgc9
 IWMuDBPpnrpZTuwCBgxkaC1Pg5yO26jDpqYZ1VYvzxPKP1UWm29JUNcY4zwY9c7OxXVlJI6ddsN
 Tp3XyYP8HK3/xXFMp0w==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4d1186 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gfVf64230eWH3T0bUGYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE0MyBTYWx0ZWRfX37Q6/vHKBxs1
 DwHcidWavUPwfIuIeOn+6hu+W6M6Ogm9hlWercj4gIT1aaidQg738uE+bqUfU01P2tsqi/B4Axi
 Yv4FFd0icej759R30c9UT69hE01gwQg=
X-Proofpoint-GUID: F423eGL02drFlE3V9JokpdGd8CmjVTVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117350-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,a7ossfgoctqo:mid,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:gjorgji.rosikopulos@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C91271D26A

On Tue, Jul 07, 2026 at 04:47:07PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Dmitry,
> 
> On 7/7/2026 4:32 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 07, 2026 at 04:24:19PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
> >> Hi Vlad,
> >>
> >> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
> >> <snip>
> >>>>
> >>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
> >>>> QCOM_ICC_TAG_ACTIVE_ONLY
> >>>> +                             &config_noc SLAVE_CAMERA_CFG
> >>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
> >>>> +                            <&mmss_noc MASTER_CAMNOC_HF
> >>>> QCOM_ICC_TAG_ALWAYS
> >>>> +                             &mc_virt SLAVE_EBI_CH0
> >>>> QCOM_ICC_TAG_ALWAYS>,
> >>>> +                            <&mmss_noc MASTER_CAMNOC_SF
> >>>> QCOM_ICC_TAG_ALWAYS
> >>>> +                             &mc_virt SLAVE_EBI_CH0
> >>>> QCOM_ICC_TAG_ALWAYS>;
> >>>> +            interconnect-names = "cpu-cfg",
> >>>> +                                 "hf-mnoc",
> >>>> +                                 "sf-mnoc";
> >>>
> >>> This is the topic, which may raise a disagreement, but I'll repeat my
> >>> position about the need to remove all "CAMSS bus" specific resources from
> >>> the device node, they are found and should be allocated on parent's side.
> >>
> >> The interconnect has functionality to handle bw requests from different
> >> clients.
> >>
> >> Yes the best will be to have camss interconnect, so jpeg and other hw's to
> >> vote
> >>
> >> on that (actually it is possible in icc framework) but what is the benefit
> >> of moving
> >>
> >> those to camss? Is it not better to create camss icc. I understand
> > 
> > Please fix your email client and stop inserting extra empty lines.
> Apologies for that. Some Thunderbird settings were missing on my side, i hope now is fine...> 
> >>
> >> you want them to be on parent side. But how to vote on bw? Most of the time
> >> it
> > 
> > If the driver actually votes on those, I think, it should be fine. This
> > patchset seemed to add bandwidth voting, but then it dropped all the
> > votes in the last commit.
> > 
> >>
> >> depends on the jpeg encoder configuration based on resolution format etc. to
> >> set properly average bw.
> >>
> >> So i dont see how that can be done with not explicit dependency on jpeg with
> >> camss and some exported
> >>
> >> API's which we discussed with Bryan they are preferable.
> > 
> > Interconnects should be fine to be referenced here. Especially, if JPEG
> > has its own port to those busses (hint, commit message).
> > 
> > As I wrote, I see a bigger issue with the clocks. You need to have some
> > API to vote on them (and then let camss driver aggregate those votes in
> > a platform-specific manner).
> Can we use icc-clk framework to vote on them. I think even today there may be some issues in camss
> for the clock voting.

Please discuss it with the Camera team, working on the camss
improvements.

-- 
With best wishes
Dmitry

