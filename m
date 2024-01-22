Return-Path: <linux-arm-msm+bounces-7868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 591F6837372
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 21:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E358B2221A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 20:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EAC3FB33;
	Mon, 22 Jan 2024 20:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ku04iBsZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EBF41211;
	Mon, 22 Jan 2024 20:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705953770; cv=none; b=k2jBnjywqGOJBtea72M3dBDzaktC4x5XcRfaapxClNSKFUefrhlFxTkqVdeMXj11X+RORtO7Kni0doT4MNJ96AWABLW61fkh/lcy6TBozbUwnf18CUmZcVda71hVtKBR5Dz2nvpvpXFJPbs3BTVWND7O0R3cWHCOzEizYxTIYc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705953770; c=relaxed/simple;
	bh=FLUBN9TYId6XVZQWq5MCtfeoUtIV7Y6P9FSEaFzhmcY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jf4rmqa7EOCGesK3PoWgIcdRlSpi68PusBU+xH7WRsYtNtJAnwBEN1YBYfRd2uiX4IlyoZcxrP80UzX1YVaW+15/BTe5+gZFicdI+4A7JmoVfAASG9ECQiKgiiWG1BR/OTzGeV4vzYejuzJiXoCNZg6YLUiu8hHbNPg+rU7QlFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ku04iBsZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MIbVUo027950;
	Mon, 22 Jan 2024 20:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=TPkdkprz2NpaLMZB/kp7f
	qFVk1n/96xgiPAavAIvYew=; b=ku04iBsZYlfim/g13zkwsTcwLnWmHuqc9lgDp
	TGYmrEJyOZ3hCIhWQA3gr88ayTMwEOAefx0XX56np87z5wSmpXPt8Z9nknPWkCrN
	tB1PpO8bJN7YI3KifBK1btX5kqIdvh6aUVwo74YK+XguWZwdDjTJTylGO2JDIJ2J
	/rT/AxcvXvqhnpJ6GaExsvlVDzgJJsUZRJQMra4BeiFGbZVlZb0EH1lCAuXqHl5p
	qQ8zqX4xkWN9oozpy/oHE9y09hjygvI4kd9s4PGEtOOsc54MO08t8JQ/BHbeMy1X
	EfCdT5weWCca1MO1NnhSs0mfXTYh6w9mzmet+dY7wz7A1OroQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vskn19ura-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 20:02:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40MK2f9C019044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 20:02:41 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 22 Jan 2024 12:02:38 -0800
Date: Mon, 22 Jan 2024 12:02:37 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Brian Masney <bmasney@redhat.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Eric Chanudet
	<echanude@redhat.com>,
        Ninad Naik <quic_ninanaik@quicinc.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_psodagud@quicinc.com>, <quic_kprasan@quicinc.com>,
        <quic_ymg@quicinc.com>, <kernel@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map updates to
 SA8775P
Message-ID: <20240122200237.GB2936378@hu-bjorande-lv.qualcomm.com>
References: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
 <rq2dnfh6ctn5gbf3o3op5ywxx7zhx6r5sh5ykautye56o3p4dg@rjttk3rr65ld>
 <20240119191144.GR3013251@hu-bjorande-lv.qualcomm.com>
 <CAA8EJppLNFReZn1HK_radSkKkf5L584fx3FCuqG0FoUt4+H=nw@mail.gmail.com>
 <Za5xj8S3Gs7N-UUc@x1>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Za5xj8S3Gs7N-UUc@x1>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OQy-qypaDbAk7_CO1Ob59gew1Sfu6ZUD
X-Proofpoint-ORIG-GUID: OQy-qypaDbAk7_CO1Ob59gew1Sfu6ZUD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_09,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=500 priorityscore=1501 impostorscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220143

On Mon, Jan 22, 2024 at 08:45:51AM -0500, Brian Masney wrote:
> Hi Dmitry,
> 
> On Fri, Jan 19, 2024 at 10:35:43PM +0200, Dmitry Baryshkov wrote:
> > This kind of change sets a very bad precedent. This way old kernels
> > become incompatible with the updated firmware. For me it looks like
> > Linux kernel suddenly being unable to boot after the BIOS upgrade.
> > Generally memory map updates should be disallowed after the board hits
> > the production and the DT is published and merged. There can be other
> > users of DT. BSD systems, U-Boot. We spend sensible efforts in making
> > sure that DT is an ABI: newer kernel remain compatible with older DT
> > files. We expect the same kind of efforts from device manufacturers.
> > 
> > I think unless there is a good reason, the memory map update should be
> > reverted on the Qualcomm side as a breaking change.
> > If this kind of update is absolutely necessary, it might be better to
> > define a new set of board files utilising the new memory map, marking
> > existing DT files as legacy.
> 
> This is on a development board that's not in production yet, so
> personally I think this change is fine. It's in all of our best
> interests to have SoC vendors push their code upstream early, even if
> it means that later on we need to make memory map changes like this.
> 

The problem I have with the patch is that I don't know which precedence
it sets, because the commit message indicates that we have a new
firmware version, while Eric's report lacks this information.

As long as everyone with access to the hardware agrees that breaking
backwards compatibility is the right thing to do, I'm not against it.

But then again, if the support is under active development, why would
anyone run a stable@ kernel on this thing?
Or are you asking for it to be included in v6.8-rc, so that you guys
have a "stable" tree to do further development (with this patch) on?

> Once this is in production, then I agree with you that changes like
> this should be avoided if possible.
> 

Agreed

Regards,
Bjorn

