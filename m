Return-Path: <linux-arm-msm+bounces-118329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sEmHJocYUWpO/QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:06:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A6073C780
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:06:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XrfhNpm2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ShnsW9Qh;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118329-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118329-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63789300F0D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 16:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1258E410D04;
	Fri, 10 Jul 2026 16:03:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3877356755
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 16:03:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699405; cv=none; b=g23nSqNzZM4pNo4vtd4HKlFJNyR1nkfszMAKlPxtWk01rqyctEJVEEKq1qsViUWVdnMm0HRDXrGEq9OdqUl9SptLJ1Min30W79XOu6vC4KnKQ8aup/Fk+MNFGhrgm48JJWpztyva0FyEFlKSXYMcwmvoRYvW0HZraa9ly0J+TIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699405; c=relaxed/simple;
	bh=e7DCAnD4zqMePx7mlR9J2kZH6Kezcd4NX1x8vpun4C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+n+PT3ZERE4aTk6grBkT2Hnp+Tajb4etgypqiLqJ6iuWKTvUJNB0IlcPE7isD4UKWYt5h9XsfRXO6bZbUZ0cvYPqtcqAFmSXUgOGt2bh5UL7aQcepIw33ooDBrdFNvEbBP5IvlJqof4QqXbpxwV/5RIXQy1INYWPLk3W7055p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrfhNpm2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ShnsW9Qh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEcINA1118057
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 16:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qNBbsusWm+Zk0082oioVL0lk
	a3JQOjO15f2DW+3iN/w=; b=XrfhNpm27rY0jJ+iCcxVMi6F50HrE912MByNj+3x
	BC0bZ98BMfvFbv8J3VOXIgkEpcbz35+lE75UJWlupT6095Io/IWwUsWVriE6BOM2
	AxE6vt++sITsl0WY3NKT3iBoio+dpcW2vflQHA7F+gjnIBJqsWFnV6IBJWzh/yu1
	5XGcdDB6o30wxIdZcl67VIwgCEi//Hl10VECrhwXBB1LoR+LlBJXLPEBR3szxy87
	RZrmH5OdR9ou+j9UhrcK3XXNypsdaB3O7BJ3/FNcIpdcin7jy17aGc4TxWqR+2m0
	ymbjqZp+Aqr3P1iY/pK9W9Liqy+54wGijDBw3jV8wcTRHg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwebar8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 16:03:22 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9ee20bde0so732148a34.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783699402; x=1784304202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qNBbsusWm+Zk0082oioVL0lka3JQOjO15f2DW+3iN/w=;
        b=ShnsW9QhFKXymyKy2+7hHIMu09xsOGbpqMvzuTfJnGuVDP6fqUPndi4gaUb+3c/jaI
         ntJzhhnxwQgII3prb71Q7SZeT98hWa2h6yTd76cxCt2xQ+dyJiyoJquFPaZsOrk9sPDM
         iDCnuuH+xfiz6M7Tn2H9YAjRa4zA7rwjLSvJeUWX8pNuRW9XOpk8JiVm5exr+FjWv10+
         J4GZNstI3pbEBQOWNmWXT+enuRJZukgkj9VdBai3vwMed9dp5AA6zJgbJ9xYtv6jgspg
         bfzHP9fu9ay8ysfbFvUl3zbRkEolAYJPiizBX0yVld5KXkgSoXcVKZsl83g24FEJeoPy
         D+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699402; x=1784304202;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNBbsusWm+Zk0082oioVL0lka3JQOjO15f2DW+3iN/w=;
        b=j8xNWqxG0iSkg0PJfQ2QhJBPxgw2ms6YyMB5UgZULguZJ3seMt1EeRbn4FvqsXYGAJ
         sd1jNi8jqAP0BEGc9kLYX1vSWd4rdMC6V9BPPm1PObvQsTfUnSKd0fmtk5o9gSZiysuX
         V/8Hx24YQak2/vt02dJ0dxOptgn8FuxqZRRdEusPdCm/18NPtHnBMy39y7LOUXOvoUkT
         +I8jLGKm1FpRJgWRUlHmyw17f5mYEds7Pg7h/VDMGKuvYndZQqcSNPiLEoLWpx4RCDjQ
         81UPjzhIMV4hiUgwAGm0JzJEjmZHwH4TzGj76ARfdCG5cKCdpGHSsI5+hoA3NBZWELz5
         X+Aw==
X-Forwarded-Encrypted: i=1; AFNElJ/DScwXp52oIwh0i9T5O4Xgcgp0pyZ9gkkwpJcQtVdPLQ9IkzjT2GSD5qbnpiC4aCXoustlYdBfz+vLiwBm@vger.kernel.org
X-Gm-Message-State: AOJu0YyF19omvqE8tNhEDIvR/HjVORGzrXycg7mQgs0a5eHbM3F3N2Rx
	p3gkEU/Vvtkwlt4ABRyUPTMWxpL1YlwKJgnq7644Xm74jFVQV8Vco0aTaq5Mc3NHAyNNRrJwAQG
	XzUBP7XEMKT3bjpIFuXZJsfrSJO6XlR7Ce8FVOI5/T2miyqB9EiUVLph5157z04STVOP7
X-Gm-Gg: AfdE7cnghFgRnIkoEk2110sDc+0+oD34xPsldWfeY3vzcEGGhJJrFLCbQoq9UHOhh1F
	z6vpQK5s9vVXUgbnEtBrvTXKadOgrRGelXf4zMFLEnftzJa6Naj3fWzWonnMqw6l43f7AEre7IW
	k1iGqFdsHFLupHEHdcjM0tQIwkwb9sG4y5LVdiF9wbrsrtbsA9HC/3H5MJHqj2tjpd8l0Me/pQ4
	0QSr/Q0s/Agj4N1bW2bSYjJGg+LF9KTIcaLa5W/xQpTalHZLiTGGWs/cnfHVYY3tQ/wISCyBEkX
	27LqwTV4CVBRwkfoe6e/fbUq8JdhLDX74CpGO5QOulok0HGKpWWTWa4+WBd90psp4JAe26tYpqf
	Gwda6ItQFQdzdVNdKq+ijODF18kKASpU/vIqh9+zaIv49ckBS7iEFUzZrKhoisYd4IbgILIKEOA
	qu1kWpzNnuHfSmwoMqmo41Q1Xz
X-Received: by 2002:a05:6820:202:b0:6a1:5acb:e954 with SMTP id 006d021491bc7-6a36d972ba9mr8270215eaf.19.1783699401860;
        Fri, 10 Jul 2026 09:03:21 -0700 (PDT)
X-Received: by 2002:a05:6820:202:b0:6a1:5acb:e954 with SMTP id 006d021491bc7-6a36d972ba9mr8270179eaf.19.1783699401281;
        Fri, 10 Jul 2026 09:03:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84bacb22sm9899921fa.38.2026.07.10.09.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:03:19 -0700 (PDT)
Date: Fri, 10 Jul 2026 19:03:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 06/11] media: iris: Add hooks for pixel and non-pixel
 context banks
Message-ID: <b5nydlpsjbvycbhu42wl3tqhprpr7cckz6rv7vo6phxbfdink4@fzp4yrrtalsx>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
 <osurkrrhqgkxtgv6lkose2n7ll5f3ofydl2gnjenogtyxaohvm@7ccuyiaeg2nm>
 <409c36d5-d445-4ce3-aa39-34bcb859f74f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <409c36d5-d445-4ce3-aa39-34bcb859f74f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a5117ca cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=vZaFuzaNU0UfsOUG0jcA:9 a=CjuIK1q_8ugA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE1OSBTYWx0ZWRfXyAE8APMEc8KU
 FpvLfwNPPNkbSg5n19C8pRSxSQ0jYSjtTVyuilKgZ3YRS3Vd54q3oiCIQLlXZ9lCe7LPJ7jRI7a
 MHauldcfl88rEenEWLQm1YF91YqLietwUJTTqPYKoJOvobmb11uYnELyia0xkqQMQ2POtXh3Bg2
 o3rgRPHUBH4Wkd5GvLaI05y9ucK7+QGdpbQ8NPhTvXkgfWdyRdGbMd/oRi6ilPah0h3BVpEdjeB
 hBqEseGz1JQwfRUp/YkyYOzZZHybe3YKDB1w6hWSNmWRKle0/MNIr5gQAhS5noPpgvwJojJ1QJt
 ybwvCYv/yodx9TQ1xgRsju9WKIo44yfyX88vjoLTZ05edpVO3qvQZo7/drhy7zwikwdcNNqZ0+q
 XDuUT1GATQAoSpM1x7tsZ/AIrhXW+AfFx3h3qB+5/RZvw7yQ8dGTV64wBNB6w1LkhvvNnLK9hso
 UVTpMmfhR1QS7bDsNRg==
X-Proofpoint-ORIG-GUID: Labab2HFuAIfviRdISlfsWFYkFqobsi8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE1OSBTYWx0ZWRfX3PSOrYeg/tG5
 z5uDIeg+/fjc6CFxnMrqAees2XxzoJeqsJCnr4l0Qu++Vnn2B8RoLxJ05x4lV5jcuYRr/+HV96K
 wYsT9z5CFNNZQM01EliR3nwPs9zXbgI=
X-Proofpoint-GUID: Labab2HFuAIfviRdISlfsWFYkFqobsi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100159
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118329-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,fzp4yrrtalsx:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95A6073C780

On Fri, Jul 10, 2026 at 12:02:46PM +0530, Vikash Garodia wrote:
> 
> 
> On 7/9/2026 6:44 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 09, 2026 at 06:05:52PM +0530, Vikash Garodia wrote:
> > > Iris platforms use separate context-bank devices for the pixel and
> > > non-pixel domains. Add platform hooks to create and destroy those
> > > subdevices, and wire them up for the affected platforms.
> > > 
> > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   drivers/media/platform/qcom/iris/Makefile          |  1 +
> > >   .../platform/qcom/iris/iris_platform_sm8550.c      | 71 ++++++++++++++++++++++
> > >   .../platform/qcom/iris/iris_platform_sm8550.h      | 24 ++------
> > >   .../media/platform/qcom/iris/iris_platform_vpu3x.c |  4 ++
> > >   4 files changed, 80 insertions(+), 20 deletions(-)
> > > 
> > > +const struct iris_context_bank_ops sm8550_cb_ops = {
> > 
> > For a long time I have been asking to fix name prefixes. Now you are
> > adding one more. No. Please write it as a rule of thumb. All new symbols
> > in the iris driver should start with iris_.
> 
> Ack
> 
> > 
> > Moreover, there is nothing sm8550-specific in these hooks. Enable them
> > for all VPU3.x platforms uniformly.
> 
> Good observation, will change this something like below;
> .cb_ops = &vpu3x_cb_ops,

Please see few lines above, that's a bad name.

Also, is there a reason to introduce a separate struct for those
callbacks? Can we fit them into the existing iris_vpu_ops?

> and the callbacks can be added in iris_platform_vpu3x.c

-- 
With best wishes
Dmitry

