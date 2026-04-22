Return-Path: <linux-arm-msm+bounces-103994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD0KBNcV6GmaEwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:27:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F6A440DBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E02EB303A8FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 00:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E681AF4D5;
	Wed, 22 Apr 2026 00:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBG5kQgO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+P1F00b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5946219AD5C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776817610; cv=none; b=p5lFcbAXj9/wsAcux5npl0OWfbbh1WKgHZwbgaRirFfwRkEMrecYPKavhQN61wNGGhUvEUqsFdAfQw9mCl2BZ9cc9z7yIsX5L50IDiI9jO0VUsB2u83ypPI0KiD+suw1/exbIBb7GjNEEpWtK+BNVyYtjcgAp3Yyzx0DIdEYMPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776817610; c=relaxed/simple;
	bh=UyE5+tTFy5R0hNIXTj2fXYUhg5jpsBugPqAfvy4DTTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYA0GkGW2o+9dR70KJK+Y2h0PGl8/Sta7yDgolIMslgfGTXNQ1mEB8uixyZY/0Zd8xcHi5g1tKCba36+7e+mSUDmH1bdLFbuEkfuJD0hIMQ0xaomZMCeYMDcrIq9oULmBOAy4Zc3XHC0KtjSuKEiJWoE3LH6Gk9nhtug5XvKtyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBG5kQgO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+P1F00b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIaFud3732369
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YLS7zenUFGUbxYTjRlEo5TUW
	2uxT6g/PrAPL70sQhFY=; b=IBG5kQgOIzJtUhKZcKc98c3yRG3stfS26TcRsxrj
	M18nn//IvBUdjxuW/MB08LWRhInKZK7NiI3sTJmo/hqZwjWJbQaElfWPV5yaIgvB
	a3aqIMejV/AcDSqVH5DLriE7XeHwcgMObRE7A9lWsVR3RVCxHm44mtTEIhnU7F5x
	oA5tzwUfiLYyCEZ5SuMfRW/CMB+N27djSg/Kqp2OFJayfdB/kGDzKOxawu33Ym8J
	ywVxVLZ3KfdMaGbeHZZclqM0BTaa/l3S0U4I27FclLwX+wYo1lTbXc9JiTS6C/Pg
	imNE0GYNdvsUVg2lsk4SWh8jpmmM8abVTvx0DTgi+mLOPg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfrvdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:26:47 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-948b41f95deso6526414241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 17:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776817607; x=1777422407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YLS7zenUFGUbxYTjRlEo5TUW2uxT6g/PrAPL70sQhFY=;
        b=C+P1F00bW+aKUTaAbbFx8BfUBfh/yUw8ietv6Wt6IccJsczKdMJ5qTYcgcxzE9fW59
         a3e5Xq81qGcizrbOjQmZV4AbTuKVf5qfkruyut68e9YNqSTB+7MtaJXAYl+KMiEH7wyc
         wKUeptdsnUmTGvMoVRmlZYIqq9ZuSfQYYnCuyNdJB4LD8O78Mdlj5nqQe14PnquhZU0H
         1pgKbdawz2q9hNW3xRd5pxtUm/S6pl5UUSnpAZSh20UuZVXLJ3uf3xc98BMh3zlyYvW1
         iVrqQrjNqs3RdvvQIv7id4b/jWlE71lz+Z1Z49F/ip39Z/MvXYeMHupsrJVget8dWgoW
         lTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776817607; x=1777422407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLS7zenUFGUbxYTjRlEo5TUW2uxT6g/PrAPL70sQhFY=;
        b=V0HDAMBeGjfDemhotVj/KBPyqJLO8b7otdhb88BQ8QDmB0i9YAyjqsEc3C+4aZqrx1
         RQ9MaSdRp4Z+Vb2deF7rpsQw+C46yEMkGn5hDdL2p/txN0V333BqcF53L9eVWi8FTI7m
         6MBLfQOzjjsg9itJP2viGNI8QVSE8mQn7NpLj3gbWwEkKBfEZm+808obymBRF3jagkZP
         bUbQEnXB0C/zzfi4VZaUg28zIWKA9Yv0+fsT2aFKtGxVH0NkU57v4PFp/86EKUs0djkY
         XTjEjdSdlwF1QV2NF9oWkNFPb0yNvZu/v6P1Ai00wOZ+rZuXj+oV7BafIeunZKUOn+eO
         g0tg==
X-Forwarded-Encrypted: i=1; AFNElJ/EE+AtSU1Drk4kaEKPoPD/4DCw0YoNha8o/8BlPTqT++Au1aaK96LYgRck+X19sg+KtCDnKyl/6LEgXUsD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2BzarB6pUQl73LKMGfwLfdnT4uzjMHOv62f8NKGHmggOlt8Be
	JSu+SAkB1QXnuKnS7pB0sEsMMVKdG34ds4LVk9la3FlQ620cojj+oQ0Ax6HOfAAQHMY7qikoWu6
	N5ux314IhWCaIZMGmqKefciNCBLOU1quZ/ZsdDRl7To63HGg2DewEPe6rJLzALWiC+jt8
X-Gm-Gg: AeBDieuSO/xCqsACX0RpPmocGCQWMnr0+1fdnPQz1RGenXecbuSmyy9sgncUozLJpsI
	g6L5UgipmBPS9QhDV48dncPJWPBLwgX6RHrZmpqejZcZM5wjcPyIp6ouZzoasmv6OgqwWZz8vVE
	JaG5ALvIowpUgtV5OLJmiLt58Met1s6gZzR4Q7X0izDXVwvw/XhK2YN6AbACHJpKq42kFVWHK1u
	balqBV7VPaXIfEcV6BxXLUVygROCN5MHDa4Y2W5GIDgJIp7hiRZDeqaw7SX7v6qM0wKjNobyF2J
	aABFWKYejWXm3nM5yr/hPrt1awLjzJr9R645Id6MUGp6N/kyfYjf/E8BQgupbmKlq1GqgAtaZW2
	qbqc0LTQe3Gk4xE6StpzTgP++AeF1ha1ceV/0X2w+1vLOaA3mx7QteIP/aVBl0/mpATZZ/Za66/
	tXHBJTtN+2YxRgbS0xQ8MfZK4r6RxcPYptOvcWnviXtNq2Fg==
X-Received: by 2002:a05:6102:441d:b0:611:6fef:905 with SMTP id ada2fe7eead31-616f750858emr10210166137.20.1776817606977;
        Tue, 21 Apr 2026 17:26:46 -0700 (PDT)
X-Received: by 2002:a05:6102:441d:b0:611:6fef:905 with SMTP id ada2fe7eead31-616f750858emr10210152137.20.1776817606495;
        Tue, 21 Apr 2026 17:26:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f669dsm32978711fa.14.2026.04.21.17.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:26:44 -0700 (PDT)
Date: Wed, 22 Apr 2026 03:26:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: declare firmware files via MODULE_FIRMWARE
Message-ID: <pdcgp3k57ubelk5lvkpmegbxjkwpbl3npcxjltbpxdz5563f24@owmlt2eu2tq6>
References: <5RSTHU5_nsLp9gy49GbhT_8mHBjtBeKDsC6F1ABHCU9ZdpW9A8692UruVYnsCexIJGWsWiW2R5WtPULge31Gyw==@protonmail.internalid>
 <20260419-wip-obbardc-qcom-venus-firmware-v1-1-08a0d3cf056f@linaro.org>
 <b18d5f20-4013-47a3-bf43-06162682a65a@kernel.org>
 <5eH-TLTol5AO_JnG_lVOVn4jVL8Y9hFrmS5YgPznDbZXibbSfmVS2QTPl5TJT1IQ7ib7mfdqLz-VZSlRRTy7Cw==@protonmail.internalid>
 <CACr-zFBV0p_61ZA6QDLXDqtUqnqajyqHhC9H2SFJ2kSZHevwVA@mail.gmail.com>
 <148e8b79-25d9-471b-b3ac-35f944aae927@kernel.org>
 <13ae5d6a29548ab7e21b222d6616f87addcdebbe.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13ae5d6a29548ab7e21b222d6616f87addcdebbe.camel@linaro.org>
X-Proofpoint-GUID: 8oK8dB8lJtIfq5j99EbN950we1JrbBva
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e815c7 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=wSj-4W58DzhtZvwVQfkA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAwMyBTYWx0ZWRfX2LBqo+s9pDs+
 f/ClRJJJOAt7FIRmks8bxczfbCs3TGGiM6IltVptca6KxJcnkZNIMaleyygdPuu1mnc4fc2NTEu
 3WuKWX/Uf4Slzae43qeEdgJxNlgKqJ7wxRWOb/TIEeg5n+M/K3Rf0Y13zBKvoTfQyQA56XcNWTf
 8siQtOFFbMyeAj3smcbDMeNdTrQTrYgLJDDkM4f1MaRaE4DkueZ75AWDCshxeen21vSCW1vKg9X
 Cu/Fzug6/40mjxHRTZSGrG7AnV6eHbjZ/2BqXAaIqZdoroOplUhgvi1/AxWbss8nlh7U1T6GnZ0
 Y2Kbgq53gG9p1mBgg06rbku1792e1PmozIDVPX0edmsKrBAWAEZoqjnFVrfLiI+WiUJigN1DXt2
 whQSLhk0C2VHJ+J0qLeORWXG0qGZ2797v38bQBkG1bTw3SfZcIJMWuVvey063EoeVm6lWWJx6uu
 mECNac1plChAt4VOw2g==
X-Proofpoint-ORIG-GUID: 8oK8dB8lJtIfq5j99EbN950we1JrbBva
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220003
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103994-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9F6A440DBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 10:10:14PM +0100, Christopher Obbard wrote:
> Hi Bryan,
> 
> On Tue, 2026-04-21 at 02:23 +0100, Bryan O'Donoghue wrote:
> > On 20/04/2026 20:57, Christopher Obbard wrote:
> > > Hi Bryan,
> > > 
> > > The background for this was to ensure the firmware is available in a
> > > system image
> > > or copied into the initrd if the driver is built-in. This is done in a
> > > CI environment without
> > > access to the hardware.
> > > 
> > > Debian's initramfs-tools looks at MODULE_FIRWMARE and copies those
> > > files into the
> > > initrd if the driver is built-in. For now, a workaround for me could
> > > be to just manually copy
> > > the firmware into the initrd and drop this patch.
> > > 
> > > I didn't get to the bottom of modifying the firmware loading code to
> > > make the driver
> > > defer probe to when the rootfs was ready and instead just threw the
> > > firmware into
> > > the initrd, but that's another story.
> > > 
> > > On Mon, 20 Apr 2026 at 11:20, Bryan O'Donoghue <bod@kernel.org> wrote:
> > > > 
> > > > On 19/04/2026 23:39, Christopher Obbard wrote:
> > > > > The driver loads firmware blobs at runtime via request_firmware()
> > > > > but does not currently advertise the possible filenames. Add
> > > > > MODULE_FIRMWARE() entries for all known firmware variants so they are
> > > > > visible via modinfo and can be picked up by user space tooling.
> > > > 
> > > > What about the board dtsi files ?
> > > 
> > > I really am not keen on adding all of the firmware from the board dts files as
> > > MODULE_FIRMWARE entries into the driver, it then becomes two lists to
> > > maintain. What do you think?
> > > 
> > > BUT talking of two lists to maintain, I am essentially duplicating fwname in
> > > MODULE_FIRMWARE, so perhaps my argument is moot.
> > > 
> > > For my use-case, it may make sense to "teach" the initrd generator to look at
> > > the firmware-name entries from the dts files I am building for. But that is also
> > > not ideal.
> > > 
> > > 
> > > Cheers!
> > > 
> > > Chris
> > 
> > I think its reasonable to keep a list of firmware that is supplied in 
> > linux-firmware in the MODULE_FIRMWARE() list.
> > 
> > AFAIK paths such as "qcom/sdm845/SHIFT/axolotl/venus.mbn"; are not in 
> > linux-firmware so .. we shoudln't expect tooling to populate them into 
> > initrd.
> 
> In latest linux-firmware we have:
> 
> $ find -type f | grep -i venus
> ./qcom/venus-6.0/venus.mbn
> ./qcom/venus-5.2/venus.mbn
> ./qcom/venus-1.8/venus.mbn
> ./qcom/venus-4.2/venus.mbn
> ./qcom/venus-5.4/venus.mbn
> 
> So I wonder if I should send v2 adding MODULE_FIRMWARE entries for just those files in linux-firmware?

I'd suggest doing a simpler thing. Add firmware-name strings to
corresponding DT files (updating those when necessary) and add a warning
to iris / venus drivers when there is no firmware in the DT.

Then we won't need to add MODULE_FIRMWARE to the module. Instead you'd
have the standard code which fetches firmware files from the DT.

> 
> 
> Cheers!
> 
> Chris

-- 
With best wishes
Dmitry

