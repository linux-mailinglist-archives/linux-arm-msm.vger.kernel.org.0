Return-Path: <linux-arm-msm+bounces-74417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 239BEB9069D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 13:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F021B189F38F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 11:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B43C307AF0;
	Mon, 22 Sep 2025 11:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RFl7+RoV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0F62FC037
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 11:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758540829; cv=none; b=YQaoUcclRAltAKxoYpRkRtqS0IOoEj7uMkdlsaaWObd0srJ7uOh0zzDSuNNPNeg70nXhndrSOc5at1RmXAU2eyd4YgkQhmfX00N3L7URVejAorlvZY5PE1V8EPKLx5vgNPhAVBDd/SaCNwOCFNumpMycd8b1GK+RmEs7lqYdQq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758540829; c=relaxed/simple;
	bh=fTu3I016k0UfmLefAcsCbi/L2QC3YPl16aRqBTC1hHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSyGIk3XI6ZtWq8pcvEYJQDSQI2DDl5o8LttgUY2LwUtVBlLJh8bdNEpKCmEXzgV2rqIviepKcsx6VFezYUl8LEI9zH3CpY0S36zN1kL6WvC9yrFgMKjQw6bn0ss3ebQEfOXVsGcZpnDxFrql0f8K3KQd4zyqYxMxhsAWNrAdpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RFl7+RoV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M90dRd014459
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 11:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ny3tRDGyVpQC4SF6j/gk9PZ+S1uMs0oLN9O/oVrvh8=; b=RFl7+RoVThr85vGk
	0pq84J2kUfPoEE3WsNh6VQcoF4kb8m2Z72K5ej3yZCzlaicskMi9BVCeN+AUwxt1
	maMW7IHkViPYAXSrvKlt3G8y8eswCIT5/+Jhvi+08bQoJtAQB3J1K7tsLcBnlO/r
	uO0dEFeC5s05UDFPUQl/QxFe1XN1psGPHiCo0fcYOAOUaItSHLkOoiQoXfJKQ7f/
	0QZGJhEANzPFktT2Ik7fCZUzgYdl+kQHmjf8S86CC08zyN9bfehARY4q/WVGU6Mm
	YAh024zFm/pDMktZtYjzHzxCTDk7uoSkG2NVvroSVEqb1M0ypux5ePtG+JYMyCC2
	dukhcQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98cks0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 11:33:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2728a359f2aso6242645ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 04:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758540824; x=1759145624;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ny3tRDGyVpQC4SF6j/gk9PZ+S1uMs0oLN9O/oVrvh8=;
        b=sYDsQxJpmjhZp/HuO9UGEpQAVQUCscKGELzHqRXoPUMM/WKc+QSDgBhpLWXs+wUQCg
         3qvtahIwH4skSzt5NE5nGYxcAmTfNs/A3Xd+nwh7Lxf/9U0rPJ8bPvvHV0Lp3v1Mewh5
         WvXEdvO+sVZY1TA7rNFx+AQq8jbYkOk2QfXRW6IPyCspos55tAbqgR6SBg3z14n3Nnxt
         zFAS+R8yTzAl49+PlX3qfEfei4qNhu66/GWuF0PRKRttBgfP5NdGIftWIc4Wabsvx5jN
         Gfh2Os5psceGO69TcRKUn21yB+pe0F5u0qreCf3gx4OFRfP71+JaQK879p79hWIqYYeT
         nAvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgDDJPZKFmlmUXugPa3L90Ha5atJ13n18gj/js+EjiH4XnFTkjDkbOdOdQ4Xg5zqDLGEmixEQy2Zs0qlti@vger.kernel.org
X-Gm-Message-State: AOJu0YyvGZbvSSRR+NyoXEsQc4Ac0IJZhtlMtsXa9WJhTDDta1agb16Z
	Srs1gQUV7nHNT6hxMVkpQhDYo5R7cajzaEeYug5xgX2xTUPV9fWkc5k0b9+F2k13gPswAB8oJ76
	qPnRICUy4A9WTdpxHb91lugI+K0eCMSYW5S0R9X1P9UadyaQSn6KJ1YcG5xuoWZHQgeMC
X-Gm-Gg: ASbGnctVF4Bk2pZbxcC+AhWbykfh+lx4fzmiDJ3paboxEmqNKZEy50Z0UI6asBhiBHm
	9g/obvBYhXO/8PopjdiKK7weLC6uQpZfA2cWAqN+aYogWqx/Yv6AuDvrFyblMsJneKi9FcsOfNK
	wDZPpz2z8LVjfIYSbZnvg0nsCMo7uOcJQkH1imSsubwSBQYV9XYNB6pp/Oy4yPcMs5Ay0RkeOWq
	ciZRNYRzYZZsFK8yv4cakyyOkcH+zTfOLLr/Oam4zq2UF0gL6IQg4nvz2w/tb+4OrySGqVlJGKm
	pDUJ1QYt6FX4VklHtIT5g3AZxfAMmpGw7La36drVgcx3F0dCPdRnxE4jj3c4Dymi87YMUcjCutO
	sBunmm+Efxaa0Dy45qQjMnSugoCbOj/frypY=
X-Received: by 2002:a17:903:110c:b0:266:914a:2e7a with SMTP id d9443c01a7336-269ba50450bmr97853015ad.6.1758540824169;
        Mon, 22 Sep 2025 04:33:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDHH9Jnyu/wz0+fPUoAUMxFXs1lC0P7l4A/wqHWPTtDgp9+q8Jyik+xPio2B0P/RaEWdFbmg==
X-Received: by 2002:a17:903:110c:b0:266:914a:2e7a with SMTP id d9443c01a7336-269ba50450bmr97852675ad.6.1758540823742;
        Mon, 22 Sep 2025 04:33:43 -0700 (PDT)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33060828031sm13050240a91.26.2025.09.22.04.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 04:33:43 -0700 (PDT)
Message-ID: <f53fd974-f3a9-4efa-8cca-ff639d75196f@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:33:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/14] phy: qcom: qmp-usbc: Move USB-only init to
 usb_power_on
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-7-eae6681f4002@oss.qualcomm.com>
 <zjegjucwluzzh2x56mn7dpk4ocmbdrhyvubkxprpiuko5cifvv@ygvbal3vpssv>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <zjegjucwluzzh2x56mn7dpk4ocmbdrhyvubkxprpiuko5cifvv@ygvbal3vpssv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SQVpmygVgNcHQKDRK6v0XltHP6m9lZ3q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX4f1ybJlP09Q0
 2Znprz2jqMYO704wBb/lTMb5Tf17GgQwttane3dX0nZjnO4tN774506EmsUgl8UOZ/xM7T7ot89
 xrR0IJVRdjPceH5GMMWYC9xV16iosDntUtQ724r62gos5D9jxWItwg/VurYmP7/2/cdsct1h97e
 zO6Pbyv47atbZBPI7WvE2LYEF+3cChX1IkNqhaSKTCBWBGgKXqkGSs12oruGShyYAgvxs33xcEe
 h/fuaXAO3GMlC9TgDdpda5Mbf1d0UlY1tDPZSutLJKhODke6D+jOVVIFYTsR6nj23MPdtAUf9k+
 X5TLGHDVA8+22dF7v1aamYj5pzM2T6cpMkxnIN5i95Wnw0QkQrT6nypzVthKldJV0inWwDoKaYD
 TKET/bVH
X-Proofpoint-ORIG-GUID: SQVpmygVgNcHQKDRK6v0XltHP6m9lZ3q
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d13419 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MW-FMpQjATtQXXRqn1QA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018


On 9/20/2025 2:48 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 10:24:24PM +0800, Xiangxu Yin wrote:
>> Move USB-only register setup from com_init to qmp_usbc_usb_power_on,
>> so it runs only for USB mode.
>
> Please rewrite the commit message to start from the problem description.
>
> With that fixed:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>

Ack.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 22 ++++++++++------------
>>  1 file changed, 10 insertions(+), 12 deletions(-)
>>

