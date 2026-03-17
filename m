Return-Path: <linux-arm-msm+bounces-98199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPypMvRpuWmZDwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:49:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A652AC4E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2AD631AD52D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1243E95AC;
	Tue, 17 Mar 2026 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oxV1wxWh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XlF4AgAo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD103E8692
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758458; cv=none; b=gfcRY2q2oSMzxieIyujsFgL9/W/RPq4kgyjfaUu8Hag+41uMJthgArxpH2fCZYegUaOMUcKwLlGPdXfh4r8nqAP15iTBh1IOFv+QvQL71b0FD/JataKY5lKb76xc4DHvN6B9LkkE1stss+h+6/SfimyQZREe1jAi34u7H/ngfdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758458; c=relaxed/simple;
	bh=lrSAIUPA5MtWnxZ9xKTMSbKD0hGlAGZS4C1lXwPugMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZUDAxH5NfHM2ImMVWeQJXgVF7YnIuCl5I72xqS/cuhNiQxsilOwieXYtvMDBiXUbm+t3PUmBZE9JN/Xu3OE4yFvrQShcS9rsdHY5BVAeB/4WYkWACOmXaH/bevzw7CdCJQ0f+sYDvSi4FOF/OUATNtkfm7h6frcOi6tRjmR9rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oxV1wxWh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XlF4AgAo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HDPViX2905965
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kw9P5X315NCGRO62MXuhZ8Qh
	DCnEaCtyuUW4X+Trbpw=; b=oxV1wxWh89mGZTIO8N+5myG+uOyXkDvKuxH+fglo
	uXl8cR3hqabQsO6DaWsmKfvkqzTzAlNSHCUqSq3A/fjVswFCOYl7i/gUVCM9dxkW
	/fpz1f3sDwSpMQD9BmXdXSkskkpvolGYltsZNI97/8Ww8AzmdtGELG3YkvPo5fUx
	6ldIrbjPCNC6S/S0anztK/Al6IlpOnODprThLeFjZJNvXU9StyQjxAatNuwN7I3g
	Tpku0WO2YNhPyGOfEdPNQ+pGsYt+5pKhof1IYzb2XbWvRqQfRc1CvMKHL0BeEIqp
	aaoc7BuxzYNvQE20Q7cJMVb7imVQj7MccfgUcHjrYxTKHg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxhkgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:40:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cdae902bccso2947718685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773758455; x=1774363255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kw9P5X315NCGRO62MXuhZ8QhDCnEaCtyuUW4X+Trbpw=;
        b=XlF4AgAoonCjmf7hHp0cHjI17WhETxVPfrlARtHtVangF9k9UaryM33RJNDNmGvBEI
         hnxUVOenAmSCdJZ5VGfeHbCOuRh9q/Wi7uX9FS4ED8DFj8od3ygLZgWPHbKelb6GBYw4
         g1CzuBFzFuov2lUVPNZs5sADB9nGI2OrixI+lhtDfnTBHhjeitcnHymLNyV4OGBFMi8N
         Gx1TgmXjVwtVne6r0rKPoHPjhU1VYqp8z6fRLhaYe+z4J3kNuPlSKazFoYtWEEthEY6f
         tSYplHIEfk85aQ4SfGCFuuRDkIZSM85YX8bk/zowVZxssV4dIK9IHY94ek1KnE5cao09
         Ch4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758455; x=1774363255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kw9P5X315NCGRO62MXuhZ8QhDCnEaCtyuUW4X+Trbpw=;
        b=l6kUxUQBRSpnMtH74C/5fwis8zTY7dQJkcCs9NCj7JSgIq7Tb5c0YpAch9PyyuEeEQ
         wbakY2PcFFE1Xx5zjVFpcswWpxETLZ8pR4c7OPI4+2Zsgqo4/BUM+/wWwyzOmHm+MOi5
         l/StDRYOQ0wc8V6yiLVlS2NhUWC8+WijEoWSoG7QJMntbYW1NqtIKFl/rRJaeNwc3VCL
         F0kCEnVP7baEPzxC/YC9eW3Wnr4TZ98yK48hxV/Llmh1vAM8O2etIFQNvTi4pMajCG9H
         mOYkR8XMjPqIZ6Ywxx15JNFz7BfC493eJr2COQsmhDf09y52g0UimUwcRGwmvpurOPmS
         +bEw==
X-Forwarded-Encrypted: i=1; AJvYcCVI/XTsIrPw5Xfo4hCl3PF/kpRa1vXI3gqumXvGwc0Gm40AftFfLvy2rNruzBK+pJ3St5cAAyXPE3MFTL3H@vger.kernel.org
X-Gm-Message-State: AOJu0YzTe7cEg8TxkBolLerTSQjCNouS7aMNjVurKfbKO/pFk35U5ncE
	OWtHj9FUC+brif6+PRJJPkPAVQblSS2//NFqRP/ck7Q/9oMsPgVaRi5h6tCtB2hDt/rMPFltd7L
	5kxMZcKn2MvBzIO9dSbcDh8q5DG3N5Jp7q2p5WucmnXQQWoa+UD8OZqAWjlpPB6we3+Xz
X-Gm-Gg: ATEYQzy3cKgWgx9BfFvyM/cQFSnICxLOv2D9Ot7mztFUbinUfRlBwxf1XVPwXJ1WzFS
	x3dBXptzfIlFGELrPfpLkEVFiAz13pFT6i2a2Mpypw6hmlmqyEcyvXcIz6+rTN3TDa/n7r7wtqv
	yofhH9bcZptR1aO7dJCIPRil0REEDvr9K7hxjtnOTTlDugoCbPCs/lII8cWVhcAlf27QJT7a7To
	OHWp1ui7W8CuMh/28fhW13gIZj6LEtqmJWc5Gr4d7ClcEvs4zkAkpVQEE76UnTRaXa0N7g6gUIG
	R9z2o9GeATViFS526ByLjJ+JmDZ6i9z9T7+J27jEnNkgxWVEOxBO7Kbo+gMVZfiLo3FFvC71EdY
	ApwJOpVjmvjDTdRqLDhXmb/WI1p1wCtqwF9QhjnP9iTDyg5hBn2uhwU5zgfrkW/Gw7yrRKvJiop
	3eCJzgAxjQG6SEsIp9yrtqQysvGokQfL9N594=
X-Received: by 2002:a05:620a:31ea:b0:8cd:b60d:10fe with SMTP id af79cd13be357-8cdb60d112fmr1815637685a.12.1773758454792;
        Tue, 17 Mar 2026 07:40:54 -0700 (PDT)
X-Received: by 2002:a05:620a:31ea:b0:8cd:b60d:10fe with SMTP id af79cd13be357-8cdb60d112fmr1815633585a.12.1773758454214;
        Tue, 17 Mar 2026 07:40:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33bf1sm4157951e87.1.2026.03.17.07.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:53 -0700 (PDT)
Date: Tue, 17 Mar 2026 16:40:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
Message-ID: <fctd6mwid2r5thbo6nipbpdecdvgvv4kztjlrp2kibs6j5agxj@hn52hjfp33zc>
References: <20260317-lt8713sx_dt_for_next-v1-0-8195fa931ff1@oss.qualcomm.com>
 <20260317-lt8713sx_dt_for_next-v1-1-8195fa931ff1@oss.qualcomm.com>
 <617cc5dd-9012-407c-8579-2c08fc629047@kernel.org>
 <ablgwa53EVBD9HIO@hu-vishsain-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ablgwa53EVBD9HIO@hu-vishsain-blr.qualcomm.com>
X-Proofpoint-GUID: Pw61VKASAZjtjJMYglh_OBXbDiwCQAag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMCBTYWx0ZWRfXwM8Eg60HcrBa
 d28Z9wZzvN1GRvhOJddI8HwMH2q7VY8zcouoGohyprWhWkI2PRSe073ffMic1edgNCMls6P5GWL
 NghPhLVdpuvKJ5rAiZr9Dtz+BVwuzgBDDTtrHdBCF5I6FqIxdj0BlxSpC6YC9Wm6BnQ1ssuPFXS
 DdcV0kF6NLnSCo/K5CgeqmKR5NusG6O6GBQYtD6MEoZrKaqMSypSoimRBZHLW6vI1DgRCevnGEz
 ep6ixdY+h6hpcDVLGUBaDSdV6+98EMVixW7o1w48gPMgLLSFlucBdkUTf4FXKXFEZaf9GrJ75mm
 h6TG2LD34dhsj9n4oSPmZVi1NNAF9pjnghEIujteC0C2Xx8ynzx81/d7jOG9VPPZqmT7rWOaxOA
 RIr4RXYDB0PY2Nn5MmLPJ/CXwgL8J0AV1gXfMWrLzvaFFdr65+ysOgiXKA01ad2ytVm+zW8BywA
 mZWkUIQY1ek0TT+QZYw==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b967f8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9-LRQQbcPB4r6LtwTA0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Pw61VKASAZjtjJMYglh_OBXbDiwCQAag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170130
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98199-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 74A652AC4E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 07:40:09PM +0530, Vishnu Saini wrote:
> On Tue, Mar 17, 2026 at 12:42:24PM +0100, Krzysztof Kozlowski wrote:
> > On 17/03/2026 07:03, Vishnu Saini wrote:
> > > Monaco-evk has LT8713sx which act as DP to 3 DP output
> > > converter. Edp PHY from monaco soc is connected to lt8713sx
> > > as input and output of lt8713sx is connected to 3 mini DP ports.
> > > 
> > > Two ports are available in mainboard and one port
> > > is available on Mezz board.
> > > 
> > > lt8713sx is connected to soc over i2c0 and with reset gpio
> > > connected to pin6 of ioexpander5.
> > > 
> > > Enable the edp nodes from monaco and enable lontium lt8713sx
> > > bridge node.
> > > 
> > > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > How v1 could be reviewed already? v1 is the first posting.
> This series was reviewed previously, https://lore.kernel.org/all/20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com/
> Maintainer asked to submit a new series once dependent patches are merged.

The patches were already sent, so this should be v4 at least.


-- 
With best wishes
Dmitry

