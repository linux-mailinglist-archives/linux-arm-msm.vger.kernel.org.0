Return-Path: <linux-arm-msm+bounces-109624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mASzN0YhFGpjKAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:15:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F51A5C9262
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04859302A7D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C2E347BDB;
	Mon, 25 May 2026 10:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cO8llDLO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LrJGbLlQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C61346A14
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703935; cv=none; b=TX46cpjp7nNH1Xe/ozka7aLjbBeZy5cEh4pwBslX4OrGvfT1MOUUxlCMl2c1B3ZcDSYt5eXt8y+jnpD0+abkvUBLqfTO7EAEUZliPSL3vIoq+U7eWbKbRHBmSqZCHwvhC3oi6ycC/X8KJ3lBg6Kn4e5RFeOJ+7Ko5cvuqk3YjVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703935; c=relaxed/simple;
	bh=3sg3hRSFdrfYqCE3ImKh756AK90qi6+lrG58peXytwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5O1jR6Uj/l2dTMP7KuEd6uxJlvGxfjgPb1fDl3egTL7S38L7qqajedpdxS6hvI78FUH3pHUQdUXTbMgK4ObpIW4MeAJG6j4sjNE5qUDo4vhtP25JC3krl5ihVfUL8GNE0u3i2k+ciYTYla0UHwwcWWrqTYME6E8d8EJkOocmJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cO8llDLO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LrJGbLlQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9PXlE2573613
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uwUCKvWUz9UKRblR2yyK+gmY
	yUtgsWhpLq6L4tfKyJM=; b=cO8llDLOwJG6kCq6ALAO3AWp60Q3Fn/zM+J0KPKI
	/p+6yMwxOmwy1/wdDoeRBTPMvlOWlcR8Mzh2m9AHX9GakIEr9lQvzuPTpzgcKIzu
	aVhmu628ASoD31XMJ7iS2yy5hXtr6GtJtTih2v6pkf0GlLpVUu/P2x2zwyRrFSyf
	31ywwyhrvR2pGFm2nws8Vzpwusgjci6vf18Rs0OaTh9z0jL7HJJYlrFzcnGm2TTM
	21Q1TOFGby73S/am8enV8104gW1l5+dW51Hm9/wy/EETOnSrukN5xfb7MYyfTXjm
	2Cug3lsM6TCkcYwWz2pfre64SifoHEc2HEGwxhWgnhEuIg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3e5ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:12:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95fcbf9c0e8so15020477241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 03:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779703932; x=1780308732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uwUCKvWUz9UKRblR2yyK+gmYyUtgsWhpLq6L4tfKyJM=;
        b=LrJGbLlQGL8UNZaG4tpfJkdANCBxDiWG1MwlGxg2cJfW4Xp2b0mEHHW9zZt7EYFWXP
         FuWcq8xgV11jDCeaSbH07AI79Eske8fJecZiPeGAiKqh+eJSUZTpG7i9zkzx23JCvGsT
         7sT0yfsNfzS950VxS5FErbMAh5ExoeXhw+4ErLU/tS4374rSOUzag2M2wa2nK2QnWSom
         +SMkuS0T2VirvACJ/ejrno55KptDirPHFZPE0c7xhqZnHQzV627aPKT7NxiApya8Lzdx
         j8U/oxS1VL/pWjQYUrGV0knrWyMgNwm02iFufbOACKuo3UBVDNVz9mATX0cB0JmOPgcM
         27Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779703932; x=1780308732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwUCKvWUz9UKRblR2yyK+gmYyUtgsWhpLq6L4tfKyJM=;
        b=P+BRG11UFfd5ixs4LHGXVy/w9gzqKfw9HZVgv/KKi6aQmJTZAV8YU/tTvT2NFoqZIt
         l/c+JhUkMayExdVItSfUM7mDEWhoExRLnlHeUe8Gc1WqovWhdgJiZDV/3evMX670lkHE
         b2jnB9QmoBU+Qc9LiPzU+QZ7pTOnM/7AbZH2mY/MIFUNu6dDFdaruwc4KrzxTukG+/9s
         2NXHCiRlL2579zGQUldNsos4BrH+kajlpf5LR2hncsJzSl69GFD7Vy+o87pQDRQovMfD
         ++mRr6L+VCmu2TTiI1J0mdGsvYSDMrawgWNW/GxoiRWVswiPIZVP9Ux/gwbcUmGGRgon
         XqJw==
X-Forwarded-Encrypted: i=1; AFNElJ/iZeSbl9VocwVbNLlSr5jUkMB0Fai3foSPCOAg6odTnaVjq7jP0NskCC0980UtR3+GOBCfXQnkAi8mL57/@vger.kernel.org
X-Gm-Message-State: AOJu0YyLRyKtLETciLY/TFEIAAgCQMrAYo8xCa/NuZAaIBQKEPrMKy4R
	h1A9wtLw1SVZNEeScHn6eDoZyb8bi44bsILlBCGN0CLAWb+AOYDpngxUwqyPlfArxM3/ZlCKthy
	emX3lhFwjbiNtbhLsjg3IhqRb3YAobHC0tzqyQTZm9ioPifaiuSk6SqEZBEcqFrZr3iO4
X-Gm-Gg: Acq92OFJj62PL525jFHbpCw2L48ydof9IFUDpaiF/rM9Au9gyRcSGBA7R07uQRLZkY4
	tmqiXyjLgUEQaVSh+E+u3Oi57+L4H/RDCCRufO0uDS6d1HNNlM4F1iQBimFVngyirYP6N62L8pX
	JSu80maXUauKQ2FAJW730RCg4u0YGqK3EDufY4OGn5R8KWLxHRz6ObD5TELNqfUct6qpYyFcDb3
	dsEiz4vFyuSbFHv6ZgrO2Bt7k1VeiJ+FPOdBUsZUBylAuszanP3Y5a8bmZYa/tO5EVk+2Wc26dE
	N/7QP9ENFaWzeVu7j/qc5+Fs57QvnvIoydkVmCzh6YQDo5bMegB0RzmLC8VV4fwFWCp8CMPY82B
	f6NcIKIDzjcfSfdKOOoPyzccCDjj7II+F+F2eMOMRux0rj9ng2R8r+JtB0F6I1xO622tquMMv1d
	2Fy1QmoYgdJ3wPvef75RcIdrg9sA67+wHLMyPgooUXaflhdw==
X-Received: by 2002:a05:6102:d90:b0:631:d3e4:efc9 with SMTP id ada2fe7eead31-67c8bd35beemr6714636137.27.1779703931775;
        Mon, 25 May 2026 03:12:11 -0700 (PDT)
X-Received: by 2002:a05:6102:d90:b0:631:d3e4:efc9 with SMTP id ada2fe7eead31-67c8bd35beemr6714624137.27.1779703931381;
        Mon, 25 May 2026 03:12:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cbaaf2sm2606780e87.33.2026.05.25.03.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:12:10 -0700 (PDT)
Date: Mon, 25 May 2026 13:12:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] interconnect: qcom: Add EPSS L3 scaling support for
 Shikra SoC
Message-ID: <ld3bxsk4brqehwzxxpjuxwdego2bs6g3p3h35b5i352hbeu3zk@4wyckysck7r4>
References: <20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com>
 <20260524-shikra_epss_l3-v1-2-b1528a436134@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524-shikra_epss_l3-v1-2-b1528a436134@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YF6ValOoFdEZu5U1hmTyCitLn9UVeb2H
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a14207c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=AL6Zp-OlWJ-5pd4xuMwA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwNCBTYWx0ZWRfX7xvnvTk457ul
 qWr6eRZ1016zGQFstFpru3XToSgVCGY57ulMkTWK+pGyrih4DAGGboykhW4dZ6pf3F3E7bpRiql
 9ssfQziBakkCuG5MzVw6M36plq+Z8DqHC8sz6koRa2ITJjHfePuapKfMWKGB5tFKubIy94UP6Cf
 7CemSetaQEZbwYAP9sTTVhaKgOuj0jNwjCTfe/mxHhGu2+3HdahXMOZnDz8OH3msBmaTv40nLu8
 JLTOM3+eXM9B+6T/Ru17BG289Kb/r6qzT6MOu/JRPc2/1zjvQHF7kTDRkxdKrqpu9U9wJjrJfoT
 6mDZ66jaxrWgJpsGwX/YRmeBjAZ0BtskBbS4XQ6Tnlf4i6iSanZzDgDn6GUCqxRMF+fAoHycwBr
 tUtBTDKM7PAcWoK+ryxQauA0k7ICWyTKZesWDVNvzjCHuHU3UcW8OGFtvqqrZ72mGhBRPnEvRME
 bOCiSWEYnNhDTi/WHJw==
X-Proofpoint-GUID: YF6ValOoFdEZu5U1hmTyCitLn9UVeb2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250104
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109624-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F51A5C9262
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 24, 2026 at 06:03:36PM +0000, Raviteja Laggyshetty wrote:
> Add Epoch Subsystem (EPSS) L3 interconnect provider support on
> Qualcomm Shikra SoC.
> 
> The EPSS L3 block on Shikra SoC is similar to existing Qualcomm EPSS/OSM
> L3 providers, but supports only up to 12 frequency lookup table entries.
> Reading beyond the supported LUT entries can expose incorrect frequencies.
> Add shikra-specific EPSS descriptor shikra_epss_l3_perf_state that reuses
> existing EPSS configuration with appropriate LUT entries limit.
> 
> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/osm-l3.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

