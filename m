Return-Path: <linux-arm-msm+bounces-108350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M/dFPUCDGrETgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:28:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B9457815E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61E3930721A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 06:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C03238424F;
	Tue, 19 May 2026 06:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HIkZL8Ek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B480C3612D8;
	Tue, 19 May 2026 06:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171556; cv=none; b=CCDJLdO4z/gZe3m8o9ijkhbYVUgYOXKk0QwG+t/5zUI2W5KOQrhxQE7V5xKUzMQBgL9BGmUgUDehDGAMdumsM1MF84ilU92XKK4xRPCA/8qLFpSi4Ogsu8mZHlGl0seW6dMHDegvfS5Q9LbfGXnSGpfKOjaPoMyZL2M+42MA0z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171556; c=relaxed/simple;
	bh=rz0D5zfSNp1esvneIKvAlw/Q7/V7L+dv2t7L66cebPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQ5f9rAuikFZDEELi3G3ER5jaSTA2uVOMBNhXmBG5GEYFVM7rLuhvrNb9xqoLGkvF3xEDyGXT2mxH6au/R5/WZG3aeQA96VY2o/Xi7Y10dOEwaEZCh6HSrWhL0u8VT/7FFUQSOYrjv5E/0HpmvZOU+RmcoS2vvnMk3KLCmG8OLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HIkZL8Ek; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4vPuQ2437943;
	Tue, 19 May 2026 06:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SIMOVFbm6deHTaj515NmN9Qa1sUot9x/t5Mz5A9Iy8o=; b=HIkZL8Ek6kQ51qPU
	XU/G7lD9K58ScHlQxdZ3iXVzhsByObKyQUkr1gdpHmxiYYb9xtzlcKEBZWkjtPuG
	zu+RYJMhPLY2HwnrY0uRNXl6sxws0jQSzYKJCWl3dyeBUw/mOh1I3hn+f6kKkNw+
	dlRoUXnh8Gnc0J2Em2Z0I7jlhW9l8TEMyQloWq8JNfLtnCtq8bmeuw1WzMxcopKH
	6uH5iw9/al9iLLCrY0k1VIZ2FQvQDVdAK1dH2pbfITuJzuTXvIZbgBcy2EnTQF75
	/ZzQfiaVddipI0ArACVDuQSWaBI+V31Ct8d3TvmdHJPHwQOCnlTW11VZgbQp+frR
	OLpOkw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v3ees-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 06:19:10 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64J6J7VR030837;
	Tue, 19 May 2026 06:19:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4e716dbfd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 06:19:07 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64J6J7FY030830;
	Tue, 19 May 2026 06:19:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 64J6J722030829
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 06:19:07 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 66FCEB34; Tue, 19 May 2026 11:49:06 +0530 (+0530)
Date: Tue, 19 May 2026 11:49:06 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH 2/2] soc: qcom: rpmpd: Add Shikra RPM Power Domains
Message-ID: <20260519061906.wma2xeshjyzorh2i@hu-kotarake-hyd.qualcomm.com>
References: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
 <20260429-add_rpmpd_shikra-v1-2-fdba28564380@oss.qualcomm.com>
 <e032c072-57b3-44b4-84a7-5aff062b9c00@oss.qualcomm.com>
 <20260514084512.q5pzh226zdkuw53f@hu-kotarake-hyd.qualcomm.com>
 <ezpigr442rjnodqcg5fqsyaik3tkp4yyw3cbu6j75ra2vidnnj@7svqkcz45sdi>
 <d2025522-ac5c-4e45-8274-1cbb49b7b348@oss.qualcomm.com>
 <xr57rqikcxgrrlj7or42r5frwhvvateeryfnqz7q4wkhfxffzr@intm5itd3ue6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xr57rqikcxgrrlj7or42r5frwhvvateeryfnqz7q4wkhfxffzr@intm5itd3ue6>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c00df cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=SqZV5yZ3ZNr3PNtaPaEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: BUL3MfP4TwuLWGd3ndOZODSFxznGJNoW
X-Proofpoint-GUID: BUL3MfP4TwuLWGd3ndOZODSFxznGJNoW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1OSBTYWx0ZWRfX+P2WWK8OazWU
 GvF8kBpD9Kwq6yyJ145O337vgD8DISxcpUU0rz9pGWrib7mGl6O4vIqcWSwjjSELjzlPPNhhI/t
 Gd3HSdnIhJSZZEpqxy/stMupBdjcS7ku+LPjUNY/f317tl7pJRe0DkvVmaluCjhRmH3+LMPHU/Z
 8WeQpR0wTYRXy43/7AAMR1Y4NXdoy89ZXguoo2+l9u6tLfraw2ExMV9zPDVQy2COF+rRZREC1pW
 zXaPDDRiJsP6oGZbQ5ffSXBAN16b/3ZydELiJsqFLeDnfXC5SAnVk5i7X9+Jgz2uJpEJREagN3+
 poN7dlQkd3sokq8G067NY+uelo0+ie150jO/xRw7Son9WGoJDZPBsfrP+8fJCY96B1NO5QF2Xhd
 DjBu+tlS+80XP3mS9pGKTMEwb8Ysg02DMYFkUhWtFGfldK4cdk6MkFQ2HeDeY6tTPjKGP2eSR9g
 pJT/8HZQ3I1c9+L5m5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190059
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108350-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 69B9457815E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 14, 2026 at 12:32:37PM +0300, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 11:23:39AM +0200, Konrad Dybcio wrote:
> > On 5/14/26 11:16 AM, Dmitry Baryshkov wrote:
> > > On Thu, May 14, 2026 at 02:15:12PM +0530, Rakesh Kota wrote:
> > >> On Tue, May 12, 2026 at 02:16:07PM +0200, Konrad Dybcio wrote:
> > >>> On 4/29/26 4:09 PM, Rakesh Kota wrote:
> > >>>> Add RPM Power Domains support for the Shikra platform.
> > >>>>
> > >>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > >>>> ---
> > >>>>  drivers/pmdomain/qcom/rpmpd.c | 16 ++++++++++++++++
> > >>>>  1 file changed, 16 insertions(+)
> > >>>>
> > >>>> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
> > >>>> index 15a11ff282c3f86b1e86c6604d165e297620f6cf..6f751ee5a7833912d54d2bcfd5d85837ab7a97d3 100644
> > >>>> --- a/drivers/pmdomain/qcom/rpmpd.c
> > >>>> +++ b/drivers/pmdomain/qcom/rpmpd.c
> > >>>> @@ -863,6 +863,21 @@ static const struct rpmpd_desc sdm660_desc = {
> > >>>>  	.max_state = RPM_SMD_LEVEL_TURBO,
> > >>>>  };
> > >>>>  
> > >>>> +static struct rpmpd *shikra_rpmpds[] = {
> > >>>> +	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
> > >>>> +	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
> > >>>> +	[RPMPD_VDDCX_VFL] =	&cx_rwcx0_vfl,
> > >>>> +	[RPMPD_VDDMX] =		&mx_rwmx0_lvl,
> > >>>> +	[RPMPD_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
> > >>>> +	[RPMPD_VDDMX_VFL] =	&mx_rwmx0_vfl,
> > >>>> +};
> > >>>
> > >>> This is identical to sm6125_rpmpds. If you're sure the list is correct
> > >>> and complete (no LPI domains etc.), you can drop this patch, and proceed
> > >>> with just this change:
> > >>>
> > >> There is one difference — the max_state for Shikra is
> > >> RPM_SMD_LEVEL_TURBO_NO_CPR, whereas sm6125 uses RPM_SMD_LEVEL_BINNING. 
> > > 
> > > It's handled in the DT. As such, programming model and the domain list
> > > looks the same and compatible.
> > 
> > Yes/no, this is an upper bound
> > 
> > one improvement we could still make to this patch is not to define
> > shikra_rpmpds[], but refer to the existing sm6125 one
> 
> SGTM
>
posted the V2 as per suggestion.
https://lore.kernel.org/all/20260514-add_rpmpd_shikra-v2-2-20bbd37592b0@oss.qualcomm.com/

regards
Rakesh
> -- 
> With best wishes
> Dmitry

