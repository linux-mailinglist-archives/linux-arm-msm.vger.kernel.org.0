Return-Path: <linux-arm-msm+bounces-110558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK3GNVZeHWojZwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 12:26:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF6C61D539
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 12:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 370EB3027703
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 09:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D665362137;
	Mon,  1 Jun 2026 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5pfe/Xt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46BB392C29;
	Mon,  1 Jun 2026 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307480; cv=none; b=UIiiLb7qVqoWE1p3bR6jK6xeTa/bwkdj7Ul0wzJmiRMLviNYbbATV9CnfrVazeIIPbLu9wisrNVWe0MSWcogGRvWKaMoNZFWT0UfhOy8MLuF6grdP9/1Nr/ggKn1KlgIulDwv5dmPRa8OYa5/khCWEmLloUVRdHHsHKkZQ1Px2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307480; c=relaxed/simple;
	bh=LcHObPZOT89o12t+anbTSmOcL2opLYoYCH/ox2KGfN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRFenUIsIUSEy60LIQHJ7Zb0wgk3aZ2k6gO7yFsH/9tmUZ8BE68mIa8P/GP+1NVl8QQtDu/VFW58TlC7n2Og736NLMAHqkqX7qkHa5W9NuKrxwuXG8AJae1SCro8CVvelsJWJrt5gJcQmk5csrqzbdvTE316XJhm93iNneTlSDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5pfe/Xt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6517Wtpf2900945;
	Mon, 1 Jun 2026 09:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9w5omm3ScEZ4KmStizV8/RLJ
	v7ke2jq6+6Ar/70UJVs=; b=G5pfe/XtfUkZSDZFrXya8pIxrQNEflU7sUmxIUtx
	IkKDdC9KByNkiySNIcLFPJjvkq3OkBquu7EFk9tGnMC8oVZiig60InA3ddoZOWCH
	plJ67DuIKbHd2erX8zxOKVhUHSthZ+rooPF0S7ZK8bgyNSsDObnPw9GFCeCdvTVJ
	8K4/KfWJjsq7lb+0qcvwCJeUSwm7vNOTsfn13ksvxYZVzkH47LhWjXOsID8pyQXR
	spDNM3SQXqlwIa4qDo1o88SdnQh7CJdJ9YbFKquMKibecWC5i2DpTH4orXqjYSiW
	dsKxf5dI78TROnLKQ0oI/KF0VCtKTdP252SCX+n6pE8JhA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efpw7q2kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 09:51:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6519p3Zq003158;
	Mon, 1 Jun 2026 09:51:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4efryj660m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 09:51:03 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6519p2uL003152;
	Mon, 1 Jun 2026 09:51:02 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6519p2eP003151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 09:51:02 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id CD085B2F; Mon,  1 Jun 2026 15:21:01 +0530 (+0530)
Date: Mon, 1 Jun 2026 15:21:01 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] pmdomain: qcom: rpmpd: Add support for Shikra
Message-ID: <20260601095101.y3cmg5iyke3hc7sp@hu-kotarake-hyd.qualcomm.com>
References: <20260522-add_rpmpd_shikra-v3-0-632838e2428a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-add_rpmpd_shikra-v3-0-632838e2428a@oss.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: m-A7s4xClwTeaar6oMgePOH161W99dzL
X-Proofpoint-ORIG-GUID: m-A7s4xClwTeaar6oMgePOH161W99dzL
X-Authority-Analysis: v=2.4 cv=bNIm5v+Z c=1 sm=1 tr=0 ts=6a1d560b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PL_2mrZd0AI6CT4_4VgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfX47FsgCb3Jn9i
 a3pNPcdFwNrGPPYjRkOzx4NUo0/Afl3s1NlVwdTC5D1QTuACgMKRJy/9pwIzmEg5DnH0QjZzEq3
 yOOrTjmB8E56TjlxPkR4uBv3SFo5X9JUxpwcO7/TzAHW6Ie6Jwtvb73BBa4+5X1CNItlIuyhoSL
 mQlNrOZ4xGG7B9PA22h0D30gMcQPRYjeNnwmwslgP65fA2rWhxStR/SLT4jhzk4+AXfmRk3J8GR
 yxrbu1liuybAefANZlw4i85usfWvQXS0APPM8TAJNo2jskdsRuS+JMAhoglWbOKMfanlLiuK7go
 Qz3YHxKMLOnpqncGYSklPezv4OsYcFt0AEGLLY58fDoo0o1jvzPHiSQ5Ezc7n6kbcLZTHeC4A7s
 HTe65O1EXL7epnkIIJpqY9O2vKx2iX1he5+3KKg6PyeWzxMlQ/NXzqDf2K1CdhJpUHBWf2+d8Ib
 pwaA8DdW5Ou2wcSa6eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110558-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,hu-kotarake-hyd.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5BF6C61D539
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:51:53PM +0530, Rakesh Kota wrote:
> Add rpmpd support for shikra Platform including RPM power domains.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
> Changes in v3:
> - Updated the subject for Cover-later and Patch2.
> - No changes in Patch1.
> - Link to v2: https://lore.kernel.org/r/20260514-add_rpmpd_shikra-v2-0-20bbd37592b0@oss.qualcomm.com
>
Hello @Ulf Hansson,

Patch 1 and Patch 2 both have the Reviewed-by tag. If there are no
further comments or concerns, could you please help to pick the change ?

regards
Rakesh

> Changes in v2:
> - Collected Reviewed-by tags.
> - reused SM6125 power domains as suggested by Konrad Dybcio.
> - Link to v1: https://lore.kernel.org/r/20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com
> 
> ---
> Rakesh Kota (2):
>       dt-bindings: power: qcom,rpmpd: document the Shikra RPM Power Domains
>       pmdomain: qcom: rpmpd: Add Shikra RPM Power Domains
> 
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  drivers/pmdomain/qcom/rpmpd.c                           | 7 +++++++
>  2 files changed, 8 insertions(+)
> ---
> base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
> change-id: 20260429-add_rpmpd_shikra-f57873b2fa7c
> 
> Best regards,
> -- 
> Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> 

