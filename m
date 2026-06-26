Return-Path: <linux-arm-msm+bounces-114714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qo1SAvHlPmrlMgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 22:49:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B37B6D0148
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 22:49:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mmgBY5Ms;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="X/CIbtcf";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114714-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114714-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDC51300B61B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 20:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8472A3BADAA;
	Fri, 26 Jun 2026 20:49:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26083243951
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:49:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782506985; cv=none; b=QRFvVYLbuNHTtogRq0lekjqb0PrMxZjHXZPtZVLf6nT3aTwDDeg5/ywrW0k/kDzakLBlcQFtRepvzNcRD0BbG/N/90X7nJ/vh4M9K19utz6Yy6ehZRO+S0QXDrKvPspcPfR1jX3wPPS5FzpWekJdxlA5JSApuTkE6alwkphpQsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782506985; c=relaxed/simple;
	bh=fKeIsblTZ0E23FHRZVpCwRr64HLAxL+Wv28mrFvs1Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZslsQJ6Dt9AbovMtdNjjEQvH5Ts/1tLgYfUAVGCp0qQSAKRmy+/UXVjS4bhDHbU+Mp6ixSF7AVMoM/n2ixdQJrbTjknQpJVzfrAP/Y+OQeaFggh6ZWnMMvluB6xq5x84gHkpb18SQpUQ3wcqag5TM0rvxTs7c5x6LDUicpYpu7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmgBY5Ms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/CIbtcf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJaISo2324348
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ky5oJQblObHqyE+E/5ZcFxz4/F4Xq5LfboN+e/NPrg=; b=mmgBY5MsyBNarjGq
	fCkNbaKz90Ha1k+46FNVNXlo1ap1dhf9TJmVaTuMznzEwv6wr8Uu/rbmc26oy0RQ
	oTkATT0fUsjjOhKWN8wsH1vBu8EHhANjBCLn6d3SUm/OXYoswaw6NPDSg7sWNbk8
	Aw50wT4mBGPlxuU41Twl3oehLQ9kZsUHVdznR9wRiVnv128HODRg5riSiJwU+H42
	HGZbAs1V11m6dWJaLoa5qPpuwWghr0oIwJoBwP3pzj54cewSWxchOK93zEVjOUHD
	1pLmCSxBcvpwIjaWdRmZTrRe+Fl1U1eAZuSQcyfcDhprcktNrG5fXmHigvVLfD5Q
	oXQuag==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1yqv07au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:49:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e05aa49693so38034976d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 13:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782506982; x=1783111782; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ky5oJQblObHqyE+E/5ZcFxz4/F4Xq5LfboN+e/NPrg=;
        b=X/CIbtcfDLncXebaZ3xMUMpVGks+gToaCpP7IDvV1PQpXvzXOjKXmAvVJYmvn2I0d+
         EaEUYWOfXtpF3h84NBYwpuOikRWI3l2acZ/Bd9NZnLt5zfheKumaUt1pSZE+H+8F7hOy
         aFdMnT6UDjgLBMyjaOfqS0s17drvpwwMVS0z/aui+lxU6+z2c+8dWO0tSp2Zqx3Z1FKK
         kfzKy0Kf3ePv1ky2KlLvlJ0OYDyUSW4hiAjCEGCbSkYYscWbp/1fwE5CnwtSfCVDEc1R
         k/PrNW9laXkTyywKPfHNDK5y/1O1OXlzZ7FsGun/T0tH3pDips8uIIglYmS/NktGaZXB
         cYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782506982; x=1783111782;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ky5oJQblObHqyE+E/5ZcFxz4/F4Xq5LfboN+e/NPrg=;
        b=LiErTHTXxxXGnJzLOTK9mVSe4zrGrAefXWlAPYcMAWqu6+GvRTTHPVOwOfzTaEd1VM
         VFLoTfWhVf0d0p+0NQaSjiR9TfmsitMTTz1sFNvAn3wCjHJxyr24Z6P+kfyuaAzs/pgf
         VE+aA2Dg6OavHHccRSJq5qgkjJ2OZXP5eCOwyqQNNMgQLwK/304vDxyK6e1ZYf0+5NwE
         FZDiNzu3Y1CQX6mlAz5hACKbDhC9eko4f0ca8Ba7BXBM5oVwuj4VLpTiZ+Ew0lb3Id7j
         yl85QGa6omG8jkxLy6b+z0ma2QGkrrhfhe48MjZnFpng3P/6C/aQPGsk5JQHg1RadNcu
         +aGg==
X-Forwarded-Encrypted: i=1; AFNElJ/2fxkY5d1Ds7hzWEw2Y9cmSfU4zijmpsHr3hqI1eVTH+GIfLpRC8qkL49Gx7HWYJgpQgNHU8eo8hWYtncG@vger.kernel.org
X-Gm-Message-State: AOJu0YxiN70A15rdfy51SsWuVxk8Xv7AErBCCJnGBPE6kGbl0iUB6DoO
	p8LeK1RxV2/7phHLu2aA/4XbQXa2DBXhbU6SoMxmuj6UMLlt4CMkpbLQ7xs1UbLZe/6D7FOoqAN
	zpiBp5B8vqUXSx5y528oII3XmcmIC0oxgk4Lp+NT8xMAVRxqRkNQ0LQbnHz8lz1gyXPQ4
X-Gm-Gg: AfdE7clUKHTa0P8fRFZ/bg8vslnI9HOcfcVXt9g2aqn6R88xsMBf7B4rijdtICCTIaW
	dXjfQCW0STYRvupyUffEcNdE8RIRxtccDI+PZw9A8LXwlvDcbpPCW2U4xrK4qEkgySksoIS+ILI
	riz4FxMWS4nw/OjQxGkLccMg1VEIu8b26MXzHmkfp/+MLcKpCT5u1NXnnvAOPRjqVhZ6Yx8ZOUf
	PXKJWxlazQYqx5R416NK2j05dhrSxrG/+e7lOAhzpmeUJKHu8qndhJUzdjwNG7IHIzOAYvlG6eE
	X/jAGTdVqS5rSn256XIr5AVW4oWi2QWgkaSZ+HvKzlDVpM9ap6dAatWn2R56Z0ZnseQ1BEw+fVa
	0honkapx4qfFIkfMZ/ZwfIvjuaQarc/9VMkXejwlihH8ifCOGxPxUFoAIs3vZeCxJk7nJcnFzay
	OzaitEdnSNvcVYROUj74gj1MnK
X-Received: by 2002:a05:620a:a911:b0:929:e498:c102 with SMTP id af79cd13be357-929e498c1b1mr877303985a.14.1782506982064;
        Fri, 26 Jun 2026 13:49:42 -0700 (PDT)
X-Received: by 2002:a05:620a:a911:b0:929:e498:c102 with SMTP id af79cd13be357-929e498c1b1mr877296885a.14.1782506981109;
        Fri, 26 Jun 2026 13:49:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6954a617sm3697560e87.2.2026.06.26.13.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:49:39 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:49:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: kodiak: Enable 4-lane DP via
 QMP Combo PHY
Message-ID: <xcirlthd4ck2mf7r6corjw3mmd4gx3hbm6wty5grodhr63wxvr@4glvc4vdvpqt>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <ag_QL5DIo7MxsdYU@baldur>
 <84ed2c32-16d0-4c29-a06a-9242eeb8e86e@oss.qualcomm.com>
 <CAD=FV=XQH3kng7MV=Jr=HmZQc4TEUCq+V3TsLNChr5vUHUtXAg@mail.gmail.com>
 <d4641613-dcf0-4437-9aaf-dede83afe04b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4641613-dcf0-4437-9aaf-dede83afe04b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aoiCzyZV c=1 sm=1 tr=0 ts=6a3ee5e6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qgbJk5cZIR8ycAwPhMgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: lHYVO-9ID5CxRpLOTgvB44clBoh4SrQc
X-Proofpoint-ORIG-GUID: lHYVO-9ID5CxRpLOTgvB44clBoh4SrQc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE3MiBTYWx0ZWRfX/G1SXEoNAgkK
 vvZcglpeB/9Ug2Q3VFFvA8dwFsxLL7W+jCtC2sHkDWe9uz7LIrMF2fvd/4FwtCMfJdRjBQg+faA
 qiKpF4TCCAys/LQw0cEuiKj009+FEMI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE3MiBTYWx0ZWRfX7QvfElPrWaEv
 MuOc5qBzT57LUBH33ZLHZZhmlYniu6qe/rNgdsP522Fyh5P2aCnd//4OUdApoiV0OrTKuQQ4SkY
 0+DwV5aIAFFKdh16OgNwccGne2M7QjnMxsSZEDsvtr5I82Kr/poreLndCemsECzD10sLUXD2bhu
 gXbx57Z3uwmhSNh5LGPefoxn9kB+2t0RjX4/Hk28GQlQmy/rQMTfBjNNDwFrZ8Cp7tjQALaEula
 uPg7mKn7pQgEt779WhRwtW2MwnGFnk9PUrVGgG2kmgzjVu7Ls029gXpvJK6DNfNGtlh8P9v2TxA
 7L6WkWqyUYSTPGZ+a8ILOilzc+8+98ozuh7vZk08MW9g+3ryyjqqWShm3DIAZpQXmPwbaTZrbOO
 0ijjqpXM5U3ruKpPhwux0QtRlwIeCDif4NkAJORFvoGf0WHDyPRGK6HyWKWR46xCEXophx7t4fQ
 q6StgZAWNmFzEvRFUWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260172
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114714-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:dianders@chromium.org,m:andersson@kernel.org,m:mahadevan.p@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mahap@qti.qualcomm.com,m:sboyd@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B37B6D0148

On Fri, Jun 26, 2026 at 06:02:12PM +0200, Konrad Dybcio wrote:
> On 6/22/26 12:11 AM, Doug Anderson wrote:
> > Hi,
> > 
> > On Fri, Jun 19, 2026 at 8:34 AM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> 
> [...]
> 
> 
> >>>
> >>> Are you sure that herobrine has 4 lanes routed on the PCB?
> >>
> >> +Doug any chance you still have schematics for that old boy?
> >>
> >> Bjorn, perhaps we could switch to a model where we define the max
> >> capabilities (i.e. 4-lane 8.1 GHz link) in the SoC DTs and only limit
> >> them as necessary? Not meeting these is borderline a board defect anyway
> > 
> > Bleh, I'd forgotten what a pain it was to look at herobrine schematics
> > with the whole qcard "abstraction".
> > 
> > My memory and a quick glance at schematics makes me say that herobrine
> > only has 2 lanes of DP. The problem is that this SoC really wasn't
> > designed with a laptop in mind. I seem to remember there only being
> > one USB 3 port and it is muxed with two of the DP lanes (since the SoC
> > is designed to drive a single Type-C port). In order to support all of
> > the ports that a laptop should have, you pretty much need to feed that
> > one USB 3 port into a USB hub and hardcode the DP to always use two
> > lanes.

This matches my memory and the abstractions that Stephen has been trying
to implement.

> > 
> > The two DP lanes then go to a mux where they can be routed either
> > towards the left Type C port or the right Type C port.
> > 
> > In terms of whether we can support the 8.1 GHz link speed, I remember
> > much debate during the project, but I don't recall all the details. I
> > think the discussion was that we were supposed to support the higher
> > speeds, but we had to disable them because they weren't working. From
> > my fuzzy memory, it was unclear whether the problem was known to be
> > hardware or software related. I can try to dig deeper if it's
> > relevant.
> 
> If anyone still has herobrine easily accessible, I guess a smoke test
> with a high res display and this:

I remember that it was not stable. HBR3 worked in some cases and didn't
in the other cases. So, I'd rather not touch the old grampa and leave it
as is.

> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index 5c5e4f1dd221..a39e418fdabb 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -464,7 +464,7 @@ &mdss_dp {
>  
>  &mdss_dp_out {
>         data-lanes = <0 1>;
> -       link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
> +       link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>  };
>  
>  /* NVMe drive, enabled on a per-board basis */
> 
> would be the quickest way to confirm that. Although we can just leave
> it as-is if it's problematic.. I think you said there's some folks that
> still use it a couple years ago

-- 
With best wishes
Dmitry

