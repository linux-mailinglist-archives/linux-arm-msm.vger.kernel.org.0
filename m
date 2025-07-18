Return-Path: <linux-arm-msm+bounces-65702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D555B0A975
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 19:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 011454E1DB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 17:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308642E764B;
	Fri, 18 Jul 2025 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzobpW+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976E12E762F
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752859624; cv=none; b=TtCy57VdR3fGkLcxRV3LPD5YqaMH/IzAmeKV6EL1qCrEEQ0cItt95ODDWLFcVyfoJBz75wu/Ot8ydbUosmZq9cHrLVv4xeWLQbDDtK61xfCAO15AgfXccqPp+dr6k+25z1tSUkLy0QUWTrTwhMoV0CO0dViI1jLJHcluDNJu5lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752859624; c=relaxed/simple;
	bh=PNmspk2fu/IR2dTOXna+ISz0MMt+wWO3tpb86klVnyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdvUbwyTnvzpJ7kKe0+83ImNsVEnbz8Tpx/YVSmIIDMKHAjoRPCGZF9/LlzyyC1Gj4PqAKrtiCLtxC+geyyW18Xdx+cVwNRaavNFcGKiaMKAbE09O5OUzTXFxaBSH12Wo+DKLwXhvdKSRt57+rdvWrQEkxAAGbqAxSRL1R0cHf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzobpW+x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I969IF022149
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+kObH4cbteXwLfeWdFmGrxDm
	MfZ/gQ1F30gvtsINTQo=; b=DzobpW+x4Sh8HuTb8Br5Y4W+K5FzLi3MZPbDfkFZ
	MOfcuNouCk8DaeQ1fb1jO4tI3wfNVKHQcEnGzkUkTGNIFO0HaZGpsxjragGUs2gB
	fCQpzl0OH3l212xZk5/IZSdhs6QX5fHuZFQ2P14fIxtuAznDWYsoctXbC7mjHDGH
	duH4t5jOAWVowBRzq1PyzWERehL82idn6iodHao1Mg6xczlo+fbQP/UgIklgKME7
	pkTGb/ZFwuK/Qp9NGuYwqPaexxjMMiwZlorCxexWpNkNiUdu6y8HVcHAblkcAbTh
	Z2xVIdbhUqGe1u+vr1Hmx4Tc29sCX7Q1tleGm3zn2awuBQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8m8b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:27:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e1fb57a7adso219756685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752859620; x=1753464420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kObH4cbteXwLfeWdFmGrxDmMfZ/gQ1F30gvtsINTQo=;
        b=NDa/HgHbmrpvxT4RIHGxjFqCYVa4NDcEVruQ4br09+enGL9vv+oC1oLTYEbFmPHU5/
         wLTwND72Df2lpQIIIrHUy7ADzWw8WhE/mz+lwAyKiZg+30PULSjWXXZi+xD+5AIJT6ZY
         C8E3nPnOceXroY3wbCGFvdbWVrO4Ca2JRYQcegWvuVZxcJuHe7Xi3r5Racn5qN9EJEiS
         TwtdKldKLTkTOMk3783TxjOly97606DCO8boUy49rYoFwtPhPrQCpme5CcdgvDxWHKB5
         0gGf68KT+iJhdPFY8SoJSIBbSLPQHjCfYnHQUJNGR2IxYe0oujLTZfvPYZxqUDrW+wof
         8vGg==
X-Forwarded-Encrypted: i=1; AJvYcCWIzEyx9zywX0oOdsd65Z9IckRWHhYjPhwQoCOWDuiRxSmVEZR5+++G0H8nngUcR1FEv0tc7qD7E/Q4xvRm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcq/8ljymq3F2ZjKvPObGNLu2KwuqXlFIjhvFnUvEJJvoQHFRV
	TFkkXbgy5yHejJ6Eab9u+irESnf/u7b/eLUGYBHOhKJatoHWbHmM5c1jeUNizRY7Waii4KrUB78
	xjXjGVI+RdW2V5NjILpV24xICIN5ZQMFFnHzYy+428hBj9761lkIJx9tDDc1fZWWkN0xt
X-Gm-Gg: ASbGncvSAEDQZapXU1kb492hSFYMjyqA3gHQL+SigWCD0SxuFKtb/RSS8KYtN2sGHoj
	xLnlzKkkOxfMa7/VC6MS4Wca0CC7Wwk8StDdTe2/CkYDjWvxpRXvhe3p6Ck9qOHAKzwPIBlXY0s
	DK9GijF9OiA1H//HwKn2D7aEHu95oLoql2tOuHrrIRI+Ht8sxm0y5+SRx3H1C9ut9FOUePP1A5x
	HVqHYay+v1IQPwwo29MP6hgwIZ5ku88fGaFDIgYBdY6D+eLrLSq8PNPTIQBSTxsAaIfKQvcnSu/
	cDnFI+9oC7VB1u0Qp9SaJ/ZOD7HM2sDXtpeiDYBcFHIOIzYWAaF0TCy2ZZvDw1HC51/v+WGS7bw
	zaP8DBc1KPdlCipQOfuF4OVrfuGVXzJUciPFh8Rvcl49MgMzZLHzX
X-Received: by 2002:a05:620a:3d89:b0:7e3:4416:fd6 with SMTP id af79cd13be357-7e344165874mr1273078385a.61.1752859620310;
        Fri, 18 Jul 2025 10:27:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ/ik+O1GI49O6qiePOhD7kpa6iYGBKoCjB8vuyMr6LyH7Wks4unXKok1B6hJX1V6SOF0HVg==
X-Received: by 2002:a05:620a:3d89:b0:7e3:4416:fd6 with SMTP id af79cd13be357-7e344165874mr1273073985a.61.1752859619766;
        Fri, 18 Jul 2025 10:26:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31aac72csm335768e87.58.2025.07.18.10.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 10:26:58 -0700 (PDT)
Date: Fri, 18 Jul 2025 20:26:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/28] interconnect: qcom: rpmh: make nodes a
 NULL_terminated array
Message-ID: <efvyk4ojddr3emsdavex4uqrl476sj5hz3ihd6kditdxd373jm@wu2av4fvqc4h>
References: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
 <20250704-rework-icc-v2-3-875fac996ef5@oss.qualcomm.com>
 <859be3e3-be14-411d-b5ef-07bdad91a878@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <859be3e3-be14-411d-b5ef-07bdad91a878@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzOCBTYWx0ZWRfX3hsboh2ojrNJ
 CU+xt4z0/SUQ90ExGwmTYCyE+1fWJpRYuRNRS0FsbEGS1toUtC3zy+iUSnBq8oARkycQMYXN1Hq
 lS4lh7cyLuyYJo3EeKAF0ZxiEPZCSGQpsIkpsSyeY8zNy5IKBzXTGXpeo8ITA3OwI44erY0ja7I
 yAZcsrmLaO0PmrBbKtrwt3jzL/GgemzxmUa4CQLV1Y3h9M9QoPkU4v0GJgod6AgS6YQwYoI2IVn
 nnBIIixORTKSqKbgSsCJLYrNBpncC2IMWjqMCmyz3GqlrA94Yidgb0TSWQYZJ74v6yxhUtujb6X
 2d6VyzYnt7JSHY6uHMj29y1kOn/z+AcLP9EFW+JQPKA4UkGBj+Z8Qz8OaXz1uSBe6vu/iVvCk2J
 9RXaeVAlVnUdYdKOkCQNpiX2VfVGthfJR04sBlLsstfu57cH8ehTrDapWLUTzD/MUmqxvNvC
X-Proofpoint-ORIG-GUID: -EtqNDpLb1wF53D63bGrM6puCupIiXc9
X-Proofpoint-GUID: -EtqNDpLb1wF53D63bGrM6puCupIiXc9
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687a83e5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=aAPYKyr1qmF_MXq4w6AA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180138

On Fri, Jul 18, 2025 at 04:38:02PM +0300, Georgi Djakov wrote:
> Hi Dmitry,
> 
> On 7/4/25 7:35 PM, Dmitry Baryshkov wrote:
> > Having the .num_nodes as a separate struct field can provoke errors as
> > it is easy to omit it or to put an incorrect value into that field. Turn
> > .nodes into a NULL-terminated array, removing a need for a separate
> > .num_nodes field.
> 
> I am not entirely convinced that an error in the termination is more
> unlikely than an error in the num_nodes. Aren't we trading one kind of
> error for another? Also if we omit the num_nodes i expect that just the
> QoS of a specific path will fail, but if we miss the NULL - worse things
> might happen.

Exactly, that's the point. It is easy to miss num_nodes, while omitting
NULL will crash the driver. So the error will be noted during
development.

> 
> [..]
> >   27 files changed, 541 insertions(+), 1119 deletions(-)
> 
> The negative diffstat is nice.
> 
> > 
> > diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
> > index a2d437a05a11fa7325f944865c81a3ac7dbb203e..4fa960630d28f338f484794d271a5b52f3e698d3 100644
> > --- a/drivers/interconnect/qcom/bcm-voter.c
> > +++ b/drivers/interconnect/qcom/bcm-voter.c
> > @@ -68,7 +68,7 @@ static void bcm_aggregate_mask(struct qcom_icc_bcm *bcm)
> >   		bcm->vote_x[bucket] = 0;
> >   		bcm->vote_y[bucket] = 0;
> > -		for (i = 0; i < bcm->num_nodes; i++) {
> > +		for (i = 0; bcm->nodes[i]; i++) {
> >   			node = bcm->nodes[i];
> 
> I like better the single memory access and the two registers comparison
> that we already have, but both are fine as we are not in some critical
> section.
> 
> [..]
> > diff --git a/drivers/interconnect/qcom/icc-rpmh.h b/drivers/interconnect/qcom/icc-rpmh.h
> > index bd8d730249b1c9e5b37afbee485b9500a8028c2e..0018aa74187edcac9a0492c737771d957a133cc0 100644
> > --- a/drivers/interconnect/qcom/icc-rpmh.h
> > +++ b/drivers/interconnect/qcom/icc-rpmh.h
> > @@ -126,7 +126,6 @@ struct qcom_icc_node {
> >    * communicating with RPMh
> >    * @list: used to link to other bcms when compiling lists for commit
> >    * @ws_list: used to keep track of bcms that may transition between wake/sleep
> > - * @num_nodes: total number of @num_nodes
> >    * @nodes: list of qcom_icc_nodes that this BCM encapsulates
> >    */
> >   struct qcom_icc_bcm {
> > @@ -142,7 +141,6 @@ struct qcom_icc_bcm {
> >   	struct bcm_db aux_data;
> >   	struct list_head list;
> >   	struct list_head ws_list;
> > -	size_t num_nodes;
> 
> So no change in memory footprint, as now instead of the num_nodes, there
> will be an additional NULL pointer for termination.
> 
> [..]
> 
> Well, this approach is also good. The existing one just follows the pattern
> used by other frameworks, that seemed more common and thus make the code
> easier to read and review.
> 
> I don't see a strong argument to switch to a NULL terminated arrays (yet),
> as it does not make things any better for performance/memory, so I'm not
> sure if it's worth reshuffling the 10k+ LoC in drivers. Is there any other
> argument that i miss?

Well, two arguments:

- Two first patches in the series (which fix num_links / num_nodes).

- I think we should drop the old (static IDs) code path. Switching to
  dynamic IDs would require reshuffling of the drivers (and these
  arrays) anyway.

> 
> Thanks,
> Georgi
> 

-- 
With best wishes
Dmitry

