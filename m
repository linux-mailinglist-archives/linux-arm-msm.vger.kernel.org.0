Return-Path: <linux-arm-msm+bounces-73542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3303DB575F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2ABD1AA0AFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4F32FB63F;
	Mon, 15 Sep 2025 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="peFhYz53"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246E32FB62F
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757931260; cv=none; b=Si9zqHE8xVe2LFY6UF5LJj6z5HesuSPCiziLjkEjAa9h0PVHx0ZZvYP8VuuTAKamhQZyHIUttGnPFR2mUQCFKfAMsMD866OSRQ3W4T/vIlzUzJ1mBJVkuULvvP1xCgIugg2hdZiRysKZjlwWvregiyhOVsh2BZFyvc4O4yKyk7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757931260; c=relaxed/simple;
	bh=nlCxdaA7zvM+S8pgdJ6gFnkAoFVsVUZqMdK7dw4y7xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpnCuvtOoFbLd3eS9bZIyZ9hBC+woO70MaCqIt8PXhIOBo1Oh+fSXmvzTXzK2zqi3vygxHLLN7LWUiTAiKFYIhKazKkUBYOTxH8+2VauHnNp6vBAOEWxpmbu2PkvNBj5d1p7oHcvcjxsm4oZw0LBUNdDSutjIM2CkOpsQwfUFZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=peFhYz53; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8G3I5006505
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3/tnKANI76V9eS3ptRNqiDQ2
	LTSSD/MVKHWal1FM7D0=; b=peFhYz53eralrtCuMSLmXk7u10S4Kdpd2NTyQJYw
	pLjpp1++cemZlt1FfDXZcFMqkqXTY2UYg/3h9owZmT5Z86R9PqmW1wZSfIQf5KM1
	FbHgXlt4MJDuf54BXLtTl4Bk4gIIwEQ7viEELUtGTa3kWTlKf3e2LX2u+JQTIThf
	xFP1a2KWjeoRA/8hzZMMW5S3nB9M9Ze/vmlxqaR2HgmCMo1rZHyrkSt+TodH3+qI
	kv4d8I+zmCwsE7oSLrXoflh4iSGMs63nFd7ESFGhh44LH9S3JnY0doO0Dh1aSWPI
	cqF16KjTEr4bgsOceldhEAkBWJkE+4rCEIB4tzlDY4bPNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chcesy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:14:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b7ad72bc9fso4106751cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757931256; x=1758536056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/tnKANI76V9eS3ptRNqiDQ2LTSSD/MVKHWal1FM7D0=;
        b=CkxRy2QPz+SgHg9hgih/ESHtLOZ6PkyY+gtJELYmq0lIo9rNczVUTzzFGm4q/joKJo
         t5EiRNKK/ii3JluSfek0+DcDUjw/DDzQupUdPxjhLf5im4lamrT55f6Zze9Agn4ceAtE
         EK6wA+FgSb6HZ0bOXLM27jjipUAdC8814jEZakCr+udz9TNmuNma/FglYanS8xT6+Q7y
         uDKQcI5qoiBK11G8DZAVgPyP+ZE7r4Oa80uRCC7FPPBVeErhbRwmU17umoge9TR+ZdYO
         aPAsMtkdcXJExyxoEOnF0o+yBSHVDt4eDbKhIe9o/hQQ+9ZrLDIaakcerLerzPjc9ndI
         ZDxA==
X-Forwarded-Encrypted: i=1; AJvYcCUZaHEnaAUE8/mBbIqvWjeCanb7+w2GOX66wGotvfOb33CkV32ynT2QJjXTOZ5CPy3Bt/mqS9KiggxKK/ay@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Di722fVt58ifGg9SN1kB7/b8LQSIJR9HT+arKXyJBRUP29pb
	KZ502QJ4ey76J5T3wb0EM1NMjr8khFRr+PXPrBY3i16kKl7NgIgPwh9aAP9b5QowLoRk23uY/BN
	wvW9xFblXTK58DDitnj80d2gFDVfYRHDVpDEJuG+BYDNhoEvOZVfcDjVucnExlfPfIQTd
X-Gm-Gg: ASbGncvGqE8pKB44v/5qqhLqu8NANPvIaizffnkheDzDughI0of0VH68qW4YlOZXex7
	jXjve3svw/qYa2pnkHY1kFyQnvMAr54QZBwdgViO4JvhF3WwdQNmo/nbNbutd+/cHsr3tPZPLV9
	9fbQoLfRKKmPziuaGRj8J+Qfn4B1CQZ/OTNBjoSjJp/OhEN1hOZvjZiG79iTj5koGGWIg6CJy0V
	SK98kPRHknA9jYakibpGPeDaeV0cg0OzhnFR4wVOkP2zGxl3oU06tp789ti+x/3UJbqFnHVzizC
	LNf83oLZqr3RVpem2bKoriA5Ew1PQ1B1WM16aW/Y8dQelnj8d2zS4NzMEKKcxYuyL+UyAr7yWed
	gVf60ZOsCByNEnS1ogPw6BYl3xHJeKSUjuV15AqU1YlnXXsSRUysk
X-Received: by 2002:ac8:5f4f:0:b0:4b5:d5ed:e972 with SMTP id d75a77b69052e-4b77cfc1cbbmr143392321cf.2.1757931255857;
        Mon, 15 Sep 2025 03:14:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAfuNCGve0i3eB424H9NLK+h/vY9qauhRsX9Z973SrspafnTcgWaopsqQyYHApzqc7SEdykQ==
X-Received: by 2002:ac8:5f4f:0:b0:4b5:d5ed:e972 with SMTP id d75a77b69052e-4b77cfc1cbbmr143392021cf.2.1757931255326;
        Mon, 15 Sep 2025 03:14:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e64bd15e6sm3415142e87.116.2025.09.15.03.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:14:14 -0700 (PDT)
Date: Mon, 15 Sep 2025 13:14:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 08/13] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
Message-ID: <ykxl2xjrabsvs6llaf6p3cpiler2nhyrsbnhrbvhtl2is27cig@fbtj45n4e2yd>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-8-2702bdda14ed@oss.qualcomm.com>
 <6p43oxn57kke5eotoqtt5gqtmhmgeteoymewqm3ko5q5veyegs@krkh4dwdno5i>
 <335ffce5-19c6-409d-8386-686fe9e5dea5@oss.qualcomm.com>
 <7ozv3u7xuvtz2x5q3pp5kdeydtsu5jlrgwjnxpxxiuh7przr2z@35uo7t3b4ze2>
 <05e8069e-895c-48b2-8a25-a4a680728cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05e8069e-895c-48b2-8a25-a4a680728cfa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c7e6f9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Pk3c0UAvwP2i0KrjZkwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: J09YZdUiAm7OYrpWHNxV9_QPYCJB_gtP
X-Proofpoint-GUID: J09YZdUiAm7OYrpWHNxV9_QPYCJB_gtP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfXzJ5MbNL5VPGr
 AEYBU3atoY/0GIzGcpWBCUAR48wDH1spFyNapweIaRk4L3SBxEG4RJIrf1ZAC1mkYHX64jbP7sp
 oHc+97bweRBJPKwOQNmAvZu5AA3eVuZ7olQgfU1uxZdR5yeyRIPmcx5wJ2wOuOH5AGcLljj+mYu
 RlPpFRgL+CDNhH+t6xk17ESRH1G5jZ64FeGtULECb0w+jrFbfgBNSvn9DYm37UZzNazYtYdix0K
 veUqeld9CXLtCEFQJtC7iXWxBULzxyrBXZ4EXZoC43o7o7vto09VE0+NRS3rT+mArsU+ZYfyuuQ
 d8tVJEIfCE7UnW9mTJBnIngq2erzBWIbJ1qL6E/lzL5mn0Vr3xbHIrwzYLsVnNHFxqZnlvViqDS
 zby4cW++
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036

On Mon, Sep 15, 2025 at 06:02:19PM +0800, Xiangxu Yin wrote:
> 
> On 9/12/2025 8:08 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 12, 2025 at 08:00:14PM +0800, Xiangxu Yin wrote:
> >> On 9/12/2025 6:19 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Sep 11, 2025 at 10:55:05PM +0800, Xiangxu Yin wrote:
> >>>> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
> >>>> Extend qmp_usbc_register_clocks and clock provider logic to support both
> >>>> USB and DP instances.
> >>>>
> >>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 208 +++++++++++++++++++++++++++++--
> >>>>  1 file changed, 195 insertions(+), 13 deletions(-)

> >>>> +	default:
> >>>> +		return 0;
> >>>> +	}
> >>>> +}
> >>>> +
> >>>> +static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np)
> >>>> +{
> >>>> +	int ret;
> >>>>  
> >>>> -	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
> >>>> +	ret = phy_pipe_clk_register(qmp, np);
> >>>>  	if (ret)
> >>>>  		return ret;
> >>>>  
> >>>> -	/*
> >>>> -	 * Roll a devm action because the clock provider is the child node, but
> >>>> -	 * the child node is not actually a device.
> >>>> -	 */
> >>>> -	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
> >>>> +	if (qmp->dp_serdes != 0) {
> >>>> +		ret = phy_dp_clks_register(qmp, np);
> >>>> +		if (ret)
> >>>> +			return ret;
> >>>> +	}
> >>>> +
> >>>> +	return devm_of_clk_add_hw_provider(qmp->dev, qmp_usbc_clks_hw_get, qmp);
> >>> Do you understand what did the comment (that you've removed) say? And
> >>> why?
> >
> > And this was ignored :-(
> 
> Sorry for missing this part.
> 
> For USB-C PHY, the legacy implementation only supports USB with a single
> device node. The new driver for USB and DP also uses a single device node.

There is no 'new driver'. It's about DT.

> The function devm_of_clk_add_hw_provider internally handles both
> of_clk_add_hw_provider and devres_add, and supports automatic resource
> release.
> 
> So I think using devm_of_clk_add_hw_provider allows us to remove
> of_clk_add_hw_provider and devm_add_action_or_reset.

Which node is passed to of_clk_add_hw_provider() in the legacy DT case?
Which node is passed to of_clk_add_hw_provider() by
devm_of_clk_add_hw_provider()?

> For combo PHY, the legacy implementation uses two device nodes: dp_np and
> usb_np. To maintain forward compatibility, we need to keep support for
> both nodes and retain the related logic.

-- 
With best wishes
Dmitry

