Return-Path: <linux-arm-msm+bounces-87937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8964ECFF975
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 19:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 505443328419
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 18:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6479834D4F2;
	Wed,  7 Jan 2026 17:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDvfY5f0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GHRlv/2h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D667349AFF
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767807702; cv=none; b=LXGhx6+JE/Bb51JMFMhObeu3utcup6nuaVmpvOOsULVPAyjRGJ4/P1PzaJ8xQodr6vAlqLvu517dbuEzc0/QfEUIKM+t2rHBHo/d9G94FE4lZXdiDzUJ+W4JJ0Pemw+8ccVZ8P4O6OyxN2G6zMJ/4B50cH1WVirJ/UmW8ok0tM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767807702; c=relaxed/simple;
	bh=9zm53oJuJfigZnpOBS/4ml2mKUfCwG7A3zXbFrJmy2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DEdoAsc6u6TbTieK2V3mKMDaBC/L2m0aSJKQJLrVWO01wQARvydaTZ5dFwNoaUGJsAME6GTNrbxSDuijv3mXiaee/MKJKVQOChtl8+sPrWMosaikTx5A2Wa4CQ1zM/VuyzLc+lo3QyLH1qYLjSQfGon7G10GKIx0YKijQsV9jPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDvfY5f0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHRlv/2h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607BkYBf1642747
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 17:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gCSiaaYZr44uVtLZHtn7mx3G
	JMbLWlae9f6wk/SlcTw=; b=KDvfY5f0HPpE+qBsE7hrP8pFnGKwzMiawxL4M840
	1Oq4k+uD0jGg9uiZmqG+oIbRl00G5wJ7OjY5lDRtaNr8EHVjp5bnkCPAGnvxFA0e
	aMS18ltE7Sz8IRc1dbSorVsrTcX/3MNzhbSn8Ti4N6+LNv1llbhjOh3B++dhG8J/
	u49uSmfP/FmNVZLQQ+vPaOhvlK9b6Vb+Uh4HH4KkM160shMf8o/kam5h1eEwzUOu
	SOx32SoNUCfc+gdEEx54hEgktKiOsHaokpdOAOI+VJMO+xBNOFdpq/h3AqMrpaWP
	DZOxFnr1N5/Gm0M98RYYKH1uk1E53DlPXn8g1HAbpu0CLw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfje20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 17:41:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e2342803so606982985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 09:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767807692; x=1768412492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gCSiaaYZr44uVtLZHtn7mx3GJMbLWlae9f6wk/SlcTw=;
        b=GHRlv/2h7qOp/WgUgUkUZ/wp1UR5Mhbrq4d5lR33/0n6g9eenGopyJAWirzEPuxNpP
         5nM3TVYFClQwn01TscFE3+2J7eE91sTaBxquAI/Li1jBlw/6pLTvo5ZB+oc7uQEZRic1
         VGA3pqb/+mSrRFQhUwqvF8FPy0w8s67zFdDRV3foS1fBklB2LCxShv1kEzFp4Z43vvQz
         C/nHS55k5+b55GSbylsq8rwZJMD+BBexl2VYHNBNh0FabhhKoBSPlg0bqIChSvgaIDAj
         lP2aLSw3cm6Wdo2+S7/u6knOmOlOhq0Vr5cox3rHefuRS3iPebKhtvebKiAdG2cad85m
         v+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767807692; x=1768412492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCSiaaYZr44uVtLZHtn7mx3GJMbLWlae9f6wk/SlcTw=;
        b=fA2787Mt+KfkLMfvVYOaZwg7UmCD01mv/zk7SDxcx3Yr00EwVkYDsKAZpza25whJ1Q
         32ruHmvoRT95+w7yuT5xeQ8U9Crcb+bb/RNRHTONiPSANT76lmNnBwurrjofBVlkegBM
         40NP52oVAkBLRwCS914DZrNESg7olE/8nOijvAJzFFfi26PzKk9HrEDfic5apiSXiIRc
         Mapv5KugudyGa30gbyDkp318P6pNFsMU9cFuEHlZ3E3KJzRD9dZDvmOTVoiJIk/+msQN
         7A4oLMd70qj6m9jDURZDhPB07tjZDA6F3RgTcJZXwG1Xwd3IheFEy9Bz/pxS34pYWCRM
         Y5qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVydmIyXArfyyBOZhw3ZW6tSQv410CWOdlFht+62siKbr10+gLWpD4ouQQd1de8n3nQWes1SARvxHLY74Qm@vger.kernel.org
X-Gm-Message-State: AOJu0YxZnmJwKgCX5rudcqRBOL6lMqirBreRtceB9S+pBWeLb4r7Xj29
	p3zmCWl+efNiu7v4J83tNqqgiZNdTtyJAnuDRmBa28ze3WoXCVuNgw3f2GQdQKYNZtJDMcs6/3W
	fb7cx887uvIWmnFQS1EUmdKhErxSY3yYQ0YflYBK9maqnzNU8fz34/EEINwHZGrUM6xyK
X-Gm-Gg: AY/fxX4XoPfu3jlHKD5r88oKu15jCbQ7WOvSSpTuMABa8xsXoRKeKdAbowxt3YKG8LR
	lLr7EwzuoZLbG7V9qucsIGiNgMJ/Fyf7P6SO1JVGpwuUx0cSItwlWMyy3R/l/DRQ/mGnpQrXM9G
	AjEXIUyoUvrUI3CuvDEOqW48SLRZoQxTXc8UMpRV6kz267atl+B/7L3O8oPFGZSH7te5i60CCdc
	Zc0bCTc9XWlTAHJ6HGEAJJFOWGO/rfb4XctgWaALrowsQ9rOGcNF5F3BaUIy9mi8H6C5kObgHdq
	2F4lM6YwxJ5izElkrr3LXTA4yFYZQvUEO0CZKnYyB/x3+00QYDod/5yDzLNJIVgxUVXapZma18g
	DnddpwurFBea2jw3WttJLT9JF6z+oXZR2iE+k5ic68iIO3jKmi13PYN4KBJ1Yd85p4+1KFWbSpu
	TvmbC5atbS8IanGDH6n/liNuo=
X-Received: by 2002:a05:620a:2587:b0:8b2:e179:feb7 with SMTP id af79cd13be357-8c3893dc97dmr425596885a.49.1767807692389;
        Wed, 07 Jan 2026 09:41:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5DbBwg4cg7yHnQ8iiyG6HDvceRhJ486t+2eQxhSrem6igvf1a3Sb860tgDQZLXQKJZQIDOA==
X-Received: by 2002:a05:620a:2587:b0:8b2:e179:feb7 with SMTP id af79cd13be357-8c3893dc97dmr425593985a.49.1767807691933;
        Wed, 07 Jan 2026 09:41:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d68203sm1458483e87.69.2026.01.07.09.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 09:41:31 -0800 (PST)
Date: Wed, 7 Jan 2026 19:41:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        bryan.odonoghue@linaro.org, andersson@kernel.org, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: Re: [PATCH v2] serial: qcom_geni: Fix BT failure regression on RB2
 platform
Message-ID: <kgt7t2el7rpbdxrwhdsfnte6ja4pt3aruhbw6xb5hnehvyxxym@2pvcy76dyvwd>
References: <20260107162610.1582626-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107162610.1582626-1-praveen.talari@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0MCBTYWx0ZWRfX58FbZvj9P6Uu
 kj47uFyEOdetW1McOOsk+siT0bKNryhnFLyGxs2BpooGpSuFKU4OYCcFMzdt4wHRMi7z3mw3S/5
 nCAKOnykAgspgd/U62Rt/wSynsnrnGySClxNx3LFM8p0n3c3iq0VrsHfxOQUhUuiymWpn4e+xjW
 8jkQ25u2kGMBLBIxmmztJp+ppxJLwnSXruHUcZJq94JmEPvS95ut9Ivf5svEvhrE8Uhe3Kt//57
 1N2g4JjFKoGniPa9Elny7xDKU30mB3lmJIjSDatXBy+b8amSJzw6eTbUd3xUrYrHUT13SORzR1j
 xLFn24TBB9cjouEOeJv7t9rGegQXgrpkznifU0Mgm+4T/5OHoBJKNwvqRcfQjqzp6mt28ImPmyW
 PqCSuvJczglIHvn+n0NWxKKYQ2Jey4Cl9/I5zJvXOHIhCXairnpnsDw0CtnFWdiTPj06Kh8LjJb
 ubBwE0dZVud+/hTub+g==
X-Proofpoint-GUID: 17uZzQqAp0ldF8IR-eAheo7PQwDQnhb6
X-Proofpoint-ORIG-GUID: 17uZzQqAp0ldF8IR-eAheo7PQwDQnhb6
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695e9acd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=orhsill4HOkje53iiW8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070140

On Wed, Jan 07, 2026 at 09:56:10PM +0530, Praveen Talari wrote:
> Commit 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial
> driver") caused BT init to fail during bootup on the RB2 platform,
> preventing proper BT initialization. However, BT works correctly after
> bootup completes.
> 
> The issue occurs when runtime PM is enabled and uart_add_one_port() is
> called before wakeup IRQ setup. The uart_add_one_port() call activates
> the device through runtime PM, which configures GPIOs to the "qup_x"
> pinmux function during runtime resume. When wakeup IRQ registration
> happens afterward using dev_pm_set_dedicated_wake_irq(), these GPIOs
> are reset back to the "gpio" pinmux function, which impacts the RX GPIO
> and leads to Bluetooth failures.
> 
> Fix this by ensuring wakeup IRQ setup is completed before calling
> uart_add_one_port() to prevent the pinmux function conflict.
> 
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Closes: https://lore.kernel.org/all/20251110101043.2108414-4-praveen.talari@oss.qualcomm.com/
> Fixes: 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial driver")

The order of tags is odd. How can it be tested before being reported?
I'd suggest the following order:
- Fixes
- Reported-by
- Closes
- Tested-by
- Reviewed-by

> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
> v1 -> v2
> - Updated commit text.
> - Added Tested-by in commit text
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

With the tag order fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

