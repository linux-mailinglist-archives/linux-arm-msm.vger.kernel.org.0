Return-Path: <linux-arm-msm+bounces-100810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFp3DjGEymkW9gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:09:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C60035C985
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EC483013882
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E453D567E;
	Mon, 30 Mar 2026 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FwnYT7DE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8dQUc9y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F333D5226
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879504; cv=none; b=CHVIYfHd7oshAjmpoWB+oY+6b6fiuzXT8mWpxtJPCG4S6IErtHqzoKhg5owFGGAjhUjrr16ARIlLgTgCCmf/NkaXYBuvWnu6WM0j3cQve1SnLucxHD5mifJDKAxaaz8z15cLpHvF0+qOUZnV95gNpSVab3lrrSgmRJOCzWAD9Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879504; c=relaxed/simple;
	bh=48/qrQs61V8fjBPqUdLGA6lQrMANhT9CD90vSe0REr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d64vT1B88WY5PLRIwticakvJgWqCukvvmesGAwqVwrTR+sPFIveES06OmfugPqbno4E4Uipd3V1rNPaGFSkhRmaFwzP4VR5xVf5mfVRaryuSh8aA+vxXe54GoIygNUhG/8qD757LP3d+3L8jC3gqkAMmkpY9v5ID3aHSJmHaGIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwnYT7DE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8dQUc9y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UDXZpE2458323
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8syFKyi3bpTnjZ19/6UIlpN5
	2L3dCeVxpSJlcpbfkkI=; b=FwnYT7DEFc1hXi9pfrt84Ielx2ucLFOP/oxSHEeB
	093up/12r65sm8MpRYvgWnx5+PJcQB/6CFWxyt8R5B5QtYFXmElN/qALyOAJHZim
	GeY9CZ8CrZPnpedp/Um+t44ifIyXXDDXLKjyprvsZocllOjrZcXOqDC5ZD37OJTh
	zzpTbODoCwhGGJJ6g2OqaRVhfgnSLB/hJKX0i3E5GAnws/fXn/z1V07tsST81oEO
	StL1ZBiUqgL6aG8FvtKejEaz7mva/sMPEG0LZHsqwDNDbLBCkTQOZk6xXVTbO42c
	03tf+68EeLMRhp3FyVEbHd9vh4OhsVk95VadCHkvLs/3JA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmsd00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:05:01 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5fa75a19f21so11451481137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774879501; x=1775484301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8syFKyi3bpTnjZ19/6UIlpN52L3dCeVxpSJlcpbfkkI=;
        b=W8dQUc9yA3Z38VkeopdxWvaKlGqneDrgS2cKpR8ty8fie8/USllfn67wh6FKCOYq+z
         M971uEeB07hOUrx2Tu9dhAZNA4PlRG80yg9gr22a85oXcjpaHUUTqebboZAtV4ZxyRyB
         AHGHn4SPfhmmtt22y540dMS25HrL6bBhosa2MPXKULeIl6DT74I4Q1rBFyxupsmv66z2
         /ThCeiwIogklbBwOy5UAukulBVMayd7ZeWvPH6hDQssQ1Em4q906Ga6Jmt5xaJdCSdoL
         xxYLP78rcARUWTwpfr4WnLvYbA/K0/MnURQnutMBSaitKkM/NTo4b8c4b/qiEyPhIoN3
         eumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774879501; x=1775484301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8syFKyi3bpTnjZ19/6UIlpN52L3dCeVxpSJlcpbfkkI=;
        b=TzDoqbt0kP3ZmtTk65Rbc6YLS8uAhMedaHC+keKDHIyjXrwfZWN3PSL2+8MdeHMxRD
         ohGazdT+/gpcbsRYS55qbS9O3b0mh+kvD7rhLmRLiWOyO54jy4C4RrIWH800B0BxYX2r
         ZZqoOvB5N5ANUJET79xPN3kMaZrxdDbLy4aVuMyxBtaDnVhwC82PFwpxw+iP1IXM+WQL
         xMtiWrYApTm5SdTzxcUoKg8796NWrTqL4yct403XzJ7AaRWs+k9EILT0PvL1FMsJ4i7e
         ZojnMQIF1FqJ3MIb2bT9ay3OLX698nkh5yNZBtmBUn2s3scRrwUE18gUjEcWdq71vntY
         WNGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk6FXojnW7oNxQCxeQlx6imPl9En36cSh4dYtk1t9P7dL3lqasdp7VIAVRQbXwEK8oNnga3OWlJmK6JRqC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw58c8omuLJemKd5lfoIlf3Tihav6vgSlnmfGBwLmR16vGXoTkP
	d7+w9O+Xn0A1weSSOR/I7NhUh5pW74Cz+zKRXmPLVsr3oxkN/3+kV/pUxse3VkYwjAXF182aCn5
	qF2Q+VJhxllsmJuwcw7pjkmxFIjS8y0fQpmwCyF8mLgFPEI7ExUrWNPa1LSFRSSVxxSCT
X-Gm-Gg: ATEYQzzqO9m0EnA94BD1hoJwE1o2nnEMMb0n5RBvGG4LxHiTwU5SThYw1lQiNG+HLz5
	dGoTYbf3MiGZlGtWGWDQlU+rjDmmh8BSuVVc2sI32tLUeZJYr5SjDx/BDLPookpErNPxP+OD0wC
	96Xkkq/Js65NtxXpc8W4OLenPqygKtyQ4tkEfl98w1HfXWT2XVB3QQM90yJd7eC2myaP+vQeStt
	3Ta5EdVo8TRtMn3p7rlTQVh5t4cUSnC21pvB1b0Zs6mNV6eHlLvsdPx4hTngfGhw37EdiGISob2
	3emb2gBSrAUoexlKamdjf8RRuftHBdf8jJEBjtH1cID2vVdy792bY5cO/EIPlZD/dbl+qINhekS
	S4u8Pv9Xg6nKl9Uexx91hYurjf/Cj1mHw3Hl3fvaedl+krBVGFa6OPjDHv6Yx8TkCX841M3M0DR
	38oehMLjE/ngPXKThXlW3xSOxQUFno3x9oCkg=
X-Received: by 2002:a05:6102:3048:b0:5f5:3739:100d with SMTP id ada2fe7eead31-604e43bcd92mr5222493137.0.1774879500922;
        Mon, 30 Mar 2026 07:05:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3048:b0:5f5:3739:100d with SMTP id ada2fe7eead31-604e43bcd92mr5222429137.0.1774879500367;
        Mon, 30 Mar 2026 07:05:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838e02c5sm15252301fa.36.2026.03.30.07.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:04:58 -0700 (PDT)
Date: Mon, 30 Mar 2026 17:04:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Richard Acayan <mailingradian@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/4] thermal/qcom/lmh: support SDM670 and its CPU
 clusters
Message-ID: <tvbooogbe2vsosyvhvowain3lon2t72kbesszvf2lqceur5gaa@e2gfyc4447dx>
References: <20260328014041.83777-1-mailingradian@gmail.com>
 <20260328014041.83777-4-mailingradian@gmail.com>
 <a3rrkgvkc4zxcq5oqvws23lyjy6dinlmfgp34wzguvdxdxig5f@25atyxc7zabm>
 <91af3fa3-85ba-44b8-8725-032f77c846de@oss.qualcomm.com>
 <lnumerwlyvmbdkwum64js46tbnvpxjrdrouhq3vybuwto4st3g@7xzr52e3samd>
 <1fcecede-16f0-4ce1-b76c-32f569cb5e41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fcecede-16f0-4ce1-b76c-32f569cb5e41@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwOSBTYWx0ZWRfXwxTgG6UlAzsL
 F9OBhI5wcPZSvGVkVQlQJoaKJYUgmc8yzCw1C7LpMhOyDOdLnSzW+q51UE/AYEEis4b50NSNESW
 HWG818vo1bLjX2bKhnLEVKbYsbsGytBAfg2QgEmjfY5/o6CaRNxM+TqVSJIJmGt5Qe2jp3ZWCXt
 2j3xZYO9JnzIk7+Lzyb4ZRS3bBCsrcW5L1oJhN921sACIle/xh2e64UvWwImCpvnE1IWDq64qzr
 RW8PFK15KqmdSMgkOwWCzHxkB0bF8jkeTvYBEvXPlG4zi5YoxhqMvZWhLxanBlqUecwIni1c1P/
 +Fi3S0hxH8FueuWzYK2PNTNcktXah0Ax9Bvte04k0Pnub8xVyRKkDHi+uRF67UvEmOvpKclaYXa
 UR1KAZctv17jFHUFY/H+uwGVJYRtQFM5tIOHsyy4gdB5CrTEn3IZCNACDp9c8+fJV1bQwATxNiF
 xl700/nY0HExHwdx4eQ==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69ca830d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=khJxtxLVEzNENsewWo0A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: HqGW2V8-525toDX75-pIjLYw8Fb5-SyK
X-Proofpoint-ORIG-GUID: HqGW2V8-525toDX75-pIjLYw8Fb5-SyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300109
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100810-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,intel.com,arm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C60035C985
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 03:50:12PM +0200, Konrad Dybcio wrote:
> On 3/30/26 12:59 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 30, 2026 at 12:32:29PM +0200, Konrad Dybcio wrote:
> >> On 3/29/26 12:44 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Mar 27, 2026 at 09:40:40PM -0400, Richard Acayan wrote:
> >>>> The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
> >>>> some SoCs divide the CPUs into different sizes of clusters. In SDM670,
> >>>> the first 6 CPUs are in the little cluster and the next 2 are in the big
> >>>> cluster. Define the clusters in the match data and define the different
> >>>> cluster configuration for SDM670.
> >>>>
> >>>> Currently, this only supports 8 CPUs and tolerates linking to any CPU in
> >>>> the cluster.
> >>>>
> >>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> >>>> ---
> >>>>  drivers/thermal/qcom/lmh.c | 69 +++++++++++++++++++++++++++++++-------
> >>>>  1 file changed, 56 insertions(+), 13 deletions(-)
> >>>>
> >>>> +static const struct lmh_soc_data sdm670_lmh_data = {
> >>>> +	.enable_algos = true,
> >>>> +	.node_ids = {
> >>>> +		LMH_CLUSTER0_NODE_ID,
> >>>> +		LMH_CLUSTER0_NODE_ID,
> >>>> +		LMH_CLUSTER0_NODE_ID,
> >>>> +		LMH_CLUSTER0_NODE_ID,
> >>>> +		LMH_CLUSTER0_NODE_ID,
> >>>> +		LMH_CLUSTER0_NODE_ID,
> >>>> +		LMH_CLUSTER1_NODE_ID,
> >>>> +		LMH_CLUSTER1_NODE_ID,
> >>>> +	},
> >>>> +};
> >>>> +
> >>>> +static const struct lmh_soc_data sdm845_lmh_data = {
> >>>> +	.enable_algos = true,
> >>>> +	.node_ids = {
> >>>> +		LMH_CLUSTER0_NODE_ID,
> >>>> +		LMH_CLUSTER0_NODE_ID,
> >>>> +		LMH_CLUSTER0_NODE_ID,
> >>>> +		LMH_CLUSTER0_NODE_ID,
> >>>> +		LMH_CLUSTER1_NODE_ID,
> >>>> +		LMH_CLUSTER1_NODE_ID,
> >>>> +		LMH_CLUSTER1_NODE_ID,
> >>>> +		LMH_CLUSTER1_NODE_ID,
> >>>> +	},
> >>>> +};
> >>>
> >>> These tables made me wonder, can we determine this information from the
> >>> DT? For example, by reading the qcom,freq-domain property. But...
> >>>
> >>>> +
> >>>> +static const struct lmh_soc_data sm8150_lmh_data = {
> >>>> +	.enable_algos = false,
> >>>> +	.node_ids = {
> >>>> +		LMH_CLUSTER0_NODE_ID,
> >>>> +		LMH_CLUSTER0_NODE_ID,
> >>>> +		LMH_CLUSTER0_NODE_ID,
> >>>> +		LMH_CLUSTER0_NODE_ID,
> >>>> +		LMH_CLUSTER1_NODE_ID,
> >>>> +		LMH_CLUSTER1_NODE_ID,
> >>>> +		LMH_CLUSTER1_NODE_ID,
> >>>> +		LMH_CLUSTER1_NODE_ID,
> >>>> +	},
> >>>> +};
> >>>
> >>> ... this might be problematic, unless this entry is broken. On SM8150 we
> >>> have three freq domains, but up to now we were programming two clustern
> >>> nodes. Of course it is possible to define that node_id is 0 for freq
> >>> domain 0 and 1 for domains 1 and 2.
> >>
> >> The third cluster situation on 8150 is not super good - we e.g. only have
> >> a single LMH irq that's shared between the big and prime cores. That
> >> was fixed with later SoCs (which is why it's not wired up in the DT today)
> > 
> > Thanks!
> > 
> > Anyway, from your point of view, would it be better to define mappings
> > in the driver (like it's done with this patch) or parse the DT?
> 
> Well, we can spend a lot of time trying to be smart about it and handle
> the odd edge case, or add a simple comparison!

:-)

Then let's go with your suggestion of 'first core from second cluster'.

-- 
With best wishes
Dmitry

