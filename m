Return-Path: <linux-arm-msm+bounces-95497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPC4Ei4MqWnm0gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 05:53:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AC720AEB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 05:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F5AA301B934
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 04:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AF6285C91;
	Thu,  5 Mar 2026 04:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwG++LnK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFlAzo/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6185526E6F2
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 04:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772686344; cv=none; b=pOe/lqLoROiMAM19wvmrPm58f3i2wL9lyBhJ93h+Ky5tlbPfUd/3ZLshR0X787hhzSj02sOtgQlRPGpNBPntdL9b7ghJY1m0b1yb1qi9sQG15R1gTVUstgB16HPyN//pOOxNqQ4arneZvggmNCnMJacY8d9iiFLQ6/nX01zkuKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772686344; c=relaxed/simple;
	bh=+n1TIr6il2OdN77z+ioUyXcfHokQELo/8sfunMKxI50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hme4oprYvcCrwZ5jqWvykp8zM53NwBmuirJwEW2o25lQ6aUItZGmNYrxClryr2Lg8tGzhZltlVGAmlVKtZaapRhvFE8gGWs67nvhtXHfD+coNnPjSrGMNU3dWgWTQgsSfZDFsO/Al0+Ow3pDyqX8+uPi6ivNcTBe7gQ3/6NEZKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwG++LnK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFlAzo/D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251Bpo93482643
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 04:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tAEZJinkOXHpWlC6EJ3absTu
	QVPfZjNiktZ/lJ75mFg=; b=RwG++LnK3jYb28yofl4hwv9moteNAuAGkNvigSbt
	7o/l8ph+nk5G1uaLf5WDNxvr92O1YnnHuk+3IilPWsd+dAkoIgYOdUjCFu7i6Qrc
	rQ/i3t7M6N8TB45UiwaLe3kfZI5VfHEPR8ry4iG03l/PQduzu1Rte9GIG83ELazZ
	ozHKN7NpWKO1iD7KZDN7nHN/cqOAGrbvfhXd62RzQwp3I8td6XQupEwkH8+zrxzz
	RJ/LOOC5GG0QZbCjVkBRdJQEaqU4U0z7AxPrdWAa7FBtoXoVnzJo4XtizJHQD7Ap
	njdWG3rQozntZQ0AN/GE9kJpmCt62lidyP1wwN6wqCVSRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0whryy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 04:52:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c881d0c617so4379345285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 20:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772686341; x=1773291141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tAEZJinkOXHpWlC6EJ3absTuQVPfZjNiktZ/lJ75mFg=;
        b=HFlAzo/DVYDFyH0I4YzjUS3Boc/4Ng+RzNmPeF0C4m2eUGHxb/KVDS2c5AM9cKXtBY
         jR1r3NPYC0VTiHwpCXvWKfR8HMwYwaZn5FwJQIAarZRzbzi1zqFzUYzBrXr1rYltN11B
         Po3ar9CUNii8xn+CtwpQ+R3f1V4bl+kVPYOWJ4I+hwmIGvSYjNbf07ssLZEHn6hPLR2a
         p7xNVKp5JvwECorzxOkTZOzOeLBy05cAiwlgYOYUIv8lNDiHT+MdFpv07PBmlivF4/xr
         TK3BdOTo6NFc3g3UpCuN6L7MqlRLa8SZNV9V8S4bFRQuXREidNJphJI6zD12Imq6ZOH8
         4Fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772686341; x=1773291141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAEZJinkOXHpWlC6EJ3absTuQVPfZjNiktZ/lJ75mFg=;
        b=lK1KYN0+8NuAgSirbyufKrPCP/7WsTjZZ8XAp7Psp9fDY4Gm9furew21uPDHfJPhm8
         9dk1rlrM0pQHqXiNcV9FQOG9tbgQXT7v49bVJ+1Qvwvu2Y+y4iPduL9E5kwGdrlOYmPQ
         If/K7vT2P55P3Y4yAcFadmaEPyINYvzJyCU1FpcoBDYxWkg7GX2BAh+9jV1zDvSZbJdg
         88Zqpyh+5yRVa6JOXq0uvTbKzDovde6NOOgo1vWvEbZk4I+yzLcNpHFv0lKINrjB3zm2
         LKf9HvQeAnB9X5M8ocMt7jtSbGndgcLMMkS7iiAVrEb+P9zJ1NpVsBEmCbonAHLRpWAj
         gyOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDPj98A3wpS/jrf+ML9qTWLYsprVB9hBgz2+phG5n5vn1tZMilDl4mWdcjdpFnRyFwuiYraVQ1qVv5lFfj@vger.kernel.org
X-Gm-Message-State: AOJu0YzkWR3pZl4xpZMbnrGkH8x+dwP5MrQioux4d91Ramljs5vcS4be
	hjB+3c4XLmfJSN1KnVLaVd2/oL6wfV+5Qko9ctQKetKdWxvqwe0UULO9EwoZpHNnvnJvF4iN25B
	HzoItN1Wl0ZRBa1+irg6EW7uUHAOS7XCQe8DRK3VtxqsTojG02f4owEii4M2PebBbxSam
X-Gm-Gg: ATEYQzwTIv3DCNC2PjrpUcucY3ws37EF2k87G0o5kYonSYQuRAhszqQO79+o1zCP76v
	gwr2hsrpVh91sqgBXA4jhuYGAGRLL9Zomfgiye5KtTIaaW6vcY+a9xwYlGQo1JTBLaK824eIS9G
	BL+rv0AVDO2CfmncsRBIjkaj1iXS8JFzvoUxxVvaNxiZCGqWTRFAnObMc7W4EpiOxa99dmT57yY
	9cQ6NmFlUrt2MEfZDhtpTMMLMT8i3Nh6U7agLsOxKX29Hm0S3tZnMlUUA0rFv2r8vFU7bfl52Ax
	hnIemv6oBDG92YdLEW695sSUEmtGTcYjbJUz6OSZTVfP015ERBMgwYKlKU8M7ZNzDcSw1lQxwh5
	OdMb2m0a/dXafeg/BxMwdH/lnVBrr05/AU+CFhfkgUvIHx4vs6RXRjcSsnRyr6tAfqIB77+rQ1P
	ANhZQZvy03NUAO/MpcbO5PihvO428/ZAJt5mk=
X-Received: by 2002:a05:620a:4481:b0:8cb:6b4:7007 with SMTP id af79cd13be357-8cd5afd23c0mr544618785a.81.1772686341509;
        Wed, 04 Mar 2026 20:52:21 -0800 (PST)
X-Received: by 2002:a05:620a:4481:b0:8cb:6b4:7007 with SMTP id af79cd13be357-8cd5afd23c0mr544616985a.81.1772686341053;
        Wed, 04 Mar 2026 20:52:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a133201faasm143083e87.68.2026.03.04.20.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 20:52:20 -0800 (PST)
Date: Thu, 5 Mar 2026 06:52:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com
Subject: Re: [PATCH V1 0/2] arm64: dts: qcom: lemans-evk: Update SDHC storage
 support via overlays
Message-ID: <ioyvbf5wqfvu6ddl4ua2upow7wdw2xmdjszuoubh5cbsko2ovg@gilcelxn77di>
References: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
 <fg4lxixp4fekhxbvisohgxoiaqya6gvuw5czflkk54kvr75xs4@nnze5nvbk2ix>
 <aaWh9ThZJK49Ex4o@hu-mchunara-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaWh9ThZJK49Ex4o@hu-mchunara-hyd.qualcomm.com>
X-Proofpoint-GUID: kK_kOhX22iVYIGssnIKDpM2WE0VZgSVg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzMiBTYWx0ZWRfX8mlYEowqgD8b
 DtLoWwd4bYRVt0bvpTSKwy2EZe7uKNj/PEJ7dvoIGTfxeIB66l8Sxpw/I3Kg4RlkqWBob17aqjw
 AeuPyN4Bdf7OSBhg33hrrfyjOrFYv1CSvRC/Rs4sCkxUNJWjoZgqkbztOnRkTZDeSOFdvwcAhA4
 3kRyjFYRXGMfQjIuo/gYuyxhg7Gd9hcycnb0mXApmhsW/L7Eg24nYejbk38U1SsbSQ+Ol+SWvuL
 tNwZDxPZV5muOJ4Y0XydhCamoAy+Qf2VUA5HVfHBEx5+sBOxQMX8m4BB1J+HrccGf1Ue9BzxN5l
 zY9qNk1NEBJ0/do59fDO9GR0621wA+9kfqfVzNk12kNvoRzk81KbQt3WoFMjAKa/SybqV04/1rk
 hh6ypHU7ffVuTM9HNNixpJFIx3NxfLSQBOFzt4bnSHYyHkUbR/YmfP5mg/NoigrBTy41OXgWklS
 A6eUNZkPhgIFngGO4iw==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a90c06 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=OSCGcBb75sj0RwwxUKgA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: kK_kOhX22iVYIGssnIKDpM2WE0VZgSVg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050032
X-Rspamd-Queue-Id: E0AC720AEB9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95497-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 08:13:01PM +0530, Monish Chunara wrote:
> On Fri, Feb 27, 2026 at 10:07:33PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Feb 27, 2026 at 03:54:03PM +0530, Monish Chunara wrote:
> > > This series updates the device tree configuration for the LeMans EVK
> > > board to support dynamic selection between SD card and eMMC storage.
> > > 
> > > The LeMans EVK hardware supports either an SD card or eMMC, but the
> > > interfaces are mutually exclusive as they share the same controller and
> > > resources. Previously, SD card support was hardcoded in the main device
> > > tree, preventing easy switching to eMMC.
> > > 
> > > This series refactors the SDHC configuration by:
> > > 
> > > 1. Moving the existing SD card configuration into a dedicated overlay.
> > > 2. Adding a new overlay to support eMMC.
> > > 3. Updating the common SDHC node in the SoC dtsi to include necessary
> > > resources (clocks, register ranges) required by the eMMC configuration.
> > > 
> > > This allows the bootloader to apply the appropriate overlay based on the
> > > desired storage medium.
> > 
> > Is there a default mode of operation / extension? If there is one,
> > please define it in the base DT and override it in a single overlay
> > rather than having two mutually exclusive overlays.
> > 
> 
> The LeMans EVK has SD card slot onboard and eMMC support via a mezzanine card.
> 
> However, if SD card is configured to be a default case in plaform DT, some of
> the properties like 'no-mmc' would conflict for eMMC use case which cannot be
> deleted in an overlay file, and vice versa. To avoid such issues, definied
> separate overlays for both which gets selected based on the actual connection on
> the board.

What would be the result of not specifying the no-mmc in the base DT?

-- 
With best wishes
Dmitry

