Return-Path: <linux-arm-msm+bounces-111564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FmLtOtpSJWrqGwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:15:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88207650611
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:15:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BgNotiYa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SG8g0njK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111564-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111564-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AEAE13004918
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 11:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D173A1A56;
	Sun,  7 Jun 2026 11:15:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7773A16A0
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 11:15:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830935; cv=none; b=OI+7cG3jgUdnz7MiC4yxiR3ex9TQygupAtrXdFTtXNJawjo/yWhmvAo1S4/f38cxSsevWg2sn3lmee9A5pS+byt5JnyA/IZ+Q9u4XHPnWJvSnnDh2eX4YOr3zfpxxWvM/r4OJBdPL1xM7ECvvcto58FkwPDnfsVAH+Bk4AuL+Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830935; c=relaxed/simple;
	bh=IU878TfwJWjEzViHg7yoM85ADerUxuFmfEEp3heHIM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cm8XWzuhOP2uwfRiQ2Ph2JlCg+AJpCE7blW6X+g1D/8p0oXW2Nq+VHJhktxMwENBcWfrxm7HkxQi2UJUzTWx7xY7GxTQnT4bmW3XT/DhQ9zAOcin1bscVkjqO7IHPR/8xSQ0aTQK16P54wyawrsOYrNipU2uiawI9EeiIwTxEow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgNotiYa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SG8g0njK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B1kdo436702
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 11:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tQH54m9TrZTMQRynVW84/hWI
	Q9TwqqdJmnTFXIMCgzA=; b=BgNotiYabJwDU67jsdEKqsjHjfHMX39CCvNi/6wt
	seocsNnlcGyiiQaheQFpv2f1MN5OVkp4yOHXU+93rt7EPAl2xDsD7oKQebYTZLE3
	s1eyW8j+9R6iC1ADS5oa8Ni9U4/mwnEjsXqRP8fL7ygA8Kxvfc62GLJg9XGXKKnB
	ZzEC5hPOZYTCmKBHlpXBkoUCe9FQc/+sCumB29fIyjhHQlUJH33OSUUpJEWdclIh
	uOo42c6+jHS0vMea6Y16crDlfG9aQ05yRT/MWt+3X+85QcJNRl2RxaN/6ixwcQSf
	VAEAcfsuMYjLpYG0bPEnkjpfNY/SdgUEbSfS0NPB/Aqn5A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4uy8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 11:15:32 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59eb3f8969aso2431292e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 04:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780830932; x=1781435732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQH54m9TrZTMQRynVW84/hWIQ9TwqqdJmnTFXIMCgzA=;
        b=SG8g0njKVuil/1wfORaH1qtTJVNSUXxQFrDO7eqjJbtJMQ4k+qzHke/XxJ2muFHmqM
         qkxKirSKkhMEeOpBLSVNTX5m0zTX61e49Vi/6PsGIFHewIz/7596okNeXrJ6BDTZN+Eh
         qomL6s2jKQ3jQoMvd8sPP1kaEZUliUwariGKUbWG+WRu68xXRXFGMTBwoz+sUq58tfxW
         5f8VZVSkFvCbIevyRPoNVLLX6bdJfY+bcGEzb/0n8mewpUJ+VxMxGH/kcRJ6mYrxvU1H
         rSJV8OeWRgEfKZ8V7gclGSxrOKRHnOv/PuwtrU+GNt8PxqOzVSvxohAKoXiVqOz0VQph
         WpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780830932; x=1781435732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQH54m9TrZTMQRynVW84/hWIQ9TwqqdJmnTFXIMCgzA=;
        b=EB0TtEqKBP8f2vTrfddnNevyL6dA/hVcqFPnSjUbfXF19texCTqPQXJMbbyiE7/ebB
         J35NLraPf9YlWPReiQKYNXlGsNCqt+PahMyNXbjAQu58/8i8yjMX+5KcQx5z58K2c81R
         SkAIAZjZ41tf5qdD/Rl1XwIrJ4Njn0cJ+9U4p40IjzL8u1ctXF8Wm7uJ0edJUP3JqN1J
         gfR19KvcZdWQl8ZCftUKUZqtZMCOieETVdHptPotES8QWuLQqjyLlTK+QZK5+AIF2a26
         N2uXU5Q1p/zpsov7qsCmbrbksn19LF9GCRR0tVMOjD9fP9rM25eZUqK0HS36YlFWhaLj
         1E/g==
X-Forwarded-Encrypted: i=1; AFNElJ8l82Dc30FKnmGYVtTI1MAID28rh8CsoGKYHVV4MBpEUTI/NErb2jrKq8kIwq6MFqKkUOLfJkHSI5MaM5dJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxNkZUl0l3h1b3vlH0T+41UjRT+U+y3uEZuNxGc1Vc06U7YJGX0
	QMg16jQI6bPjFCim9YPU/asMyPnR7PQki/odcVXeynIMzKgCwvMjqok4P6E20i5H+/AwrHABqfz
	Y+CygocrF2E9s6Fd1rcQNLDWIbpUr+J152UE8KeO3dqVjfxAspPnZ8Tk3HDlDcW0BCjjG
X-Gm-Gg: Acq92OHZhA5QusiSPeAxwkjQQiwPW3FROIh9BRQcjPjnM1wmglSRTtdxNRtNPljOZvQ
	2zQEx6aUMAFFwQPYiZ/SaCwnj/0xldWujd+iAknRUIDy/s3b/HwzfxDraue+KZdcHYHN6xvGa7L
	qe+//NkjIYq5H3FQEdogJJ+ILxbCcjvmhyA2FvfZmHAlvSjkBHEtmLh1RbJOYDqvztLi91tYTcK
	GwzatWOn9IoheAleh1scfH5Gi7LUfta29xwUMBizO0qQqamosU9sFUCSVNu8LI/tpGe2sj7lIP3
	5wJMkM1XVVvyetPAEoseY2YzKlAPLqsPHYdZGcc+DwXurJvd7V6mKcx/o6QB48ZFoqrQToPS38A
	xtauvGK2ED7/JXubV5CyYoTPswCsXPkY0FQcM1JQiDJJ6KspjTGMS1X9Hh+ci85Pkl0N+0XqXrQ
	4biUC7b6Ahcel2zF57IUGXUFC33RKTF/obqtk0/rGdPKtVOg==
X-Received: by 2002:a05:6102:3a0c:b0:6ef:f691:7043 with SMTP id ada2fe7eead31-6ff0eaac5ddmr5259285137.15.1780830932369;
        Sun, 07 Jun 2026 04:15:32 -0700 (PDT)
X-Received: by 2002:a05:6102:3a0c:b0:6ef:f691:7043 with SMTP id ada2fe7eead31-6ff0eaac5ddmr5259263137.15.1780830931776;
        Sun, 07 Jun 2026 04:15:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d3a1dsm38587541fa.28.2026.06.07.04.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:15:29 -0700 (PDT)
Date: Sun, 7 Jun 2026 14:15:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Message-ID: <isuyh5tebydvld2lxolpx3ukunmzn27mx2pkamsu4wmolnnyp7@defpphasqnit>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
 <rvs5c4shgeroxsllqtxyjtsrb2447yprucw7qtmeissbbxtvtb@24nexo4dy6r4>
 <4d5e1b90-5d81-4e34-a4f1-79ef1eccc0a0@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d5e1b90-5d81-4e34-a4f1-79ef1eccc0a0@smankusors.com>
X-Proofpoint-ORIG-GUID: sh534ht3OZoSN6Ilhgynxu4G6afw897f
X-Proofpoint-GUID: sh534ht3OZoSN6Ilhgynxu4G6afw897f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEwOSBTYWx0ZWRfX1+M9leBakubv
 AY+ulK8ZAL2aM8E8/kjY29il1RmUXo0gny+8p7YYJAkNrOilV6S2BI+KrxuJ0ErExjehIs6HW9D
 mjn2S29V+r75KDR8IuC5Krx2LxHlCdNCOOIJ1Qi91AwJh2jLxveDFM6NqXyXMx6vcrRVN9Lfg+d
 +zsj7+U/TwwA8frYKhfoLVfCv8GqkIwaHPvfchdnFZhdMJ6Y0pORDHJmXD7vQCHL93OZwYgOIqQ
 uHTu6+5+5QxN9jIXG0B8AmalK6MuQvMAQ6k+Mpzl6iD73JZSR/DU+dgc7NSMkGz3R5e5Catx2Ub
 hcn2vt1zDsVfhqZdoNGH4QNdj6ljnjjpbhNonVvCCAHswU4USK8eQjr2deghlPEYHlq6NhP2nku
 F9VolFPEn9oZAhxst+MRnlexkPOfVkl0Y2a3H+gYHtMXDSvFW0DPQuAFauz2YI898i+algUQhlw
 dd8Q1H64CMjib3EYg7w==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a2552d4 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=pxQ0L-axrEwUrt4MK4AA:9
 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111564-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@smankusors.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:guptarud@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,defpphasqnit:mid,smankusors.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88207650611

On Mon, Jun 01, 2026 at 01:36:48PM +0000, Antony Kurniawan Soemardi wrote:
> On 6/1/2026 6:38 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 01, 2026 at 03:51:17PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> > > From: Antony Kurniawan Soemardi <linux@smankusors.com>
> > > 
> > > Add support for the "qcom,rpmcc-msm8960" compatible string to the
> > > RPM clock driver.
> > > 
> > > msm8960 uses the same RPM clock descriptions as apq8064, so reuse
> > > rpm_clk_apq8064 for this compatible.
> > > 
> > > Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> > > Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> > > ---
> > >   drivers/clk/qcom/clk-rpm.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > 
> > On the other hand... You have added APQ8064 strings as a fallback. Is
> > this change really needed until you actually have SoC-specific quirks?
> 
> The fallback was recommended by Konrad in the initial review:
> https://lore.kernel.org/all/677f1d1d-a1fe-42ec-9e82-c9e504873c98@oss.qualcomm.com/
> 
> As for SoC specific quirks, I don't have anything planned right now about it
> though...

So, I think, this patch can be dropped. The entry for APQ8064 should
work already.

-- 
With best wishes
Dmitry

