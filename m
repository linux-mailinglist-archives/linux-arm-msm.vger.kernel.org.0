Return-Path: <linux-arm-msm+bounces-107545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EA54BaeLBWo5YQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:45:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A99D853F734
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C81A3016D35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7EB3DDDAB;
	Thu, 14 May 2026 08:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EAtrwwi/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7A23DDDAC;
	Thu, 14 May 2026 08:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778748322; cv=none; b=Rv9o0ogSXl7BOlgBimO2/QMkBRlco5SlwPUrLZgDlAWPPlpI4+Bn5kmIUPpU7jsEQWB8+UPgK6SWAJnnREYliggKf9wkG03mfFzPS4lRHlxXeVs/IgjYDbBwoF3bcN+52NI9WcWbj1uuV9dHuVt9Mvnmofh3bV+OoWmZAYMDhQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778748322; c=relaxed/simple;
	bh=9uriHaR1uFYg2OnsESCBi4B2rNOe2rmUTNqUua9LI9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MfMpa/klKrQ+JPdW7t0yMnKC8cEu+8oIlmBFgSVoPCVBHZlRxYem04wBHyc6eSnRL07wl54WZwZE0yTXuei/wFZ9IlWd4vsrClrpOdvKg4b9MScJlotk2yHumsr/0FKfbQihUZe1RThJRa/eCMHwCrS8O/a2YnSYrw6b5lo4WH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EAtrwwi/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E5SBJh2003931;
	Thu, 14 May 2026 08:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9tWGSa/zAJabm3ZSlF3cSWaOldMs2IRQgMl3EQ5D84Y=; b=EAtrwwi/Q963Vzfn
	6oRkiQcry8iNaAiLlFly7VhM6LfGet/1oMGWN4wJv97crqPZKoPLiEq5nYLL8w1O
	INR5IER/4kIaAmRirvtkdHYkolESFzTj4iH8PurXTjubMBwztn1nmyW+GW2iTUvy
	3nLfJ2uaxjEan6vLw2huGjlew8kxrl3GQwhHYrf7aUAHGGcnImBTOemtktpp42Ap
	oec84TJyJMxee869OyvOz06nphrUmamooi6kokPRBmlQicVM1kox/YYzj3pK6Qf3
	t7v0Ve55zgnbRp0CGDNpuWxLI2ZOSfQKwRr04NcHNkX1InoLd7nv6FM3oWkRG8Jh
	mB2cnw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899rnyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 May 2026 08:45:17 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64E8gxSj030582;
	Thu, 14 May 2026 08:45:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4e1x0jnds3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 May 2026 08:45:14 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64E8jDMQ000923;
	Thu, 14 May 2026 08:45:14 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64E8jDdM000922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 May 2026 08:45:13 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id F3841B22; Thu, 14 May 2026 14:15:12 +0530 (+0530)
Date: Thu, 14 May 2026 14:15:12 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH 2/2] soc: qcom: rpmpd: Add Shikra RPM Power Domains
Message-ID: <20260514084512.q5pzh226zdkuw53f@hu-kotarake-hyd.qualcomm.com>
References: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
 <20260429-add_rpmpd_shikra-v1-2-fdba28564380@oss.qualcomm.com>
 <e032c072-57b3-44b4-84a7-5aff062b9c00@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e032c072-57b3-44b4-84a7-5aff062b9c00@oss.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA4NSBTYWx0ZWRfX778H1GSFMakl
 CeFTFxhiZTcAusAYMkGp2Ma1/wEhj3X2KfbhDdWv0YZr94plfQh6wTAMXMeiHpUeasmLXssj6MI
 sQUGjOoN6WBI4ovN5G0FK8VIiQ0GjC/zOuQnTJdKTir6Tr8AOPnTK6saywsJwQq+LEj49Hi/fbj
 kEQM0hj1lm+Ppj1vwFEWS0Wgn0c+QEOSe+XcQc1MNJx5G7du58sGd2mYqvaFJClkV8NC65Fqfn3
 SF6JBgPULLbsRJqDuPkN466u3har1RQRolfdMazLwitryRhELObQZqnmEsDXIcUieUwYKCw28Ca
 caesXtIPkfnc+FSGfhKcMmwmcyrGRcQ7c8or9XkIfkE+0ZHJyDkw7Z4AS8X+CL/NCC0rOMV5Or2
 mEmF06boKoTbpQ+9eHJRNoUmLiRb294bjBYTpAia/XFcKoTw9gtyWQTD8NwWy8LrAowKixyQ6tC
 arf3+X/RjBzaJWBDk2A==
X-Proofpoint-ORIG-GUID: nUuuMY1bPlFfzURQmQqActli9c6duzWl
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a058b9d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5b2juqbrW4aYtIvz6zQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: nUuuMY1bPlFfzURQmQqActli9c6duzWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140085
X-Rspamd-Queue-Id: A99D853F734
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107545-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,hu-kotarake-hyd.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 02:16:07PM +0200, Konrad Dybcio wrote:
> On 4/29/26 4:09 PM, Rakesh Kota wrote:
> > Add RPM Power Domains support for the Shikra platform.
> > 
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > ---
> >  drivers/pmdomain/qcom/rpmpd.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
> > index 15a11ff282c3f86b1e86c6604d165e297620f6cf..6f751ee5a7833912d54d2bcfd5d85837ab7a97d3 100644
> > --- a/drivers/pmdomain/qcom/rpmpd.c
> > +++ b/drivers/pmdomain/qcom/rpmpd.c
> > @@ -863,6 +863,21 @@ static const struct rpmpd_desc sdm660_desc = {
> >  	.max_state = RPM_SMD_LEVEL_TURBO,
> >  };
> >  
> > +static struct rpmpd *shikra_rpmpds[] = {
> > +	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
> > +	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
> > +	[RPMPD_VDDCX_VFL] =	&cx_rwcx0_vfl,
> > +	[RPMPD_VDDMX] =		&mx_rwmx0_lvl,
> > +	[RPMPD_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
> > +	[RPMPD_VDDMX_VFL] =	&mx_rwmx0_vfl,
> > +};
> 
> This is identical to sm6125_rpmpds. If you're sure the list is correct
> and complete (no LPI domains etc.), you can drop this patch, and proceed
> with just this change:
>
There is one difference — the max_state for Shikra is
RPM_SMD_LEVEL_TURBO_NO_CPR, whereas sm6125 uses RPM_SMD_LEVEL_BINNING. 

regards
Rakesh Kota

> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 0bf1e13a9964..e7d9e8e65641 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -73,6 +73,10 @@ properties:
>            - enum:
>                - qcom,msm8937-rpmpd
>            - const: qcom,msm8917-rpmpd
> +      - items:
> +          - enum:
> +              - qcom,shikra-rpmpd
> +          - const: qcom,sm6125-rpmpd
>  
>    '#power-domain-cells':
>      const: 1
> 
> 
> Konrad

