Return-Path: <linux-arm-msm+bounces-66885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0702DB13EE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 17:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60DA17AE11E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 15:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C353273D68;
	Mon, 28 Jul 2025 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pb4XQpKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A25C26D4CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 15:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753717041; cv=none; b=jkMi0RHdQXiZG8w3b/b7hz5kxGlS0Bnm3Z2xIdbqWT0LG22dKl+zPxzRLkaE/p8grfFU7/McsOyOVtQREhHfLf7FJKDEbxWbv7hpye6Hdu91RgtNXNtFJkqmJAMdF9jm4q9JgbpcxJoUocTmyoBQrLRewL4MxCxYsmkQmZB4ZM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753717041; c=relaxed/simple;
	bh=jre8QM0W1aod+snE4SIPjcwGuvGXMCnAU3WPP0zFovo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfp3KI2Da3+TlZR3f8rdnJwTExkGRnAU6zASmBROXx/Ry8mJNkEI0y5Xd9hyq19U5yPwaCv5/YYnZtQVJCBi16F3fQ6TKqNNGb3uFCFCxiqavhPBrbIo9CwMZ5kwl9wXydv43MfYc0seILaD08YsR+YXrD7PBNcByS5coo3zr84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pb4XQpKe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlVEF014818
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 15:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SAVDu2CUO0GFbPnrkds994cc
	7fuJHUyL9s9URha4+gw=; b=Pb4XQpKeNIn4JwZo9QYgwyN8jt5WS7p27L9R+3Lv
	sBtDiOW2Yj3IWvwog0YlaLitsHCvtEERjgFKUEmhcM2VYrShSsoXJxVs9Lyp/qNn
	IQxNwn/xAdqBPLO8GpxMqliRmo/jkULpDDIACh9KEQSiD7oazMMV6NifxQTvnojz
	/PKWqbcLiZlWdNJKuyZQQv48DZQ/PpVLP4c9cE3NGZcSSU/F1JL59EoW0p26G0ap
	YCblv3wCsjP5zLhMFG1F0wPZfL/xiGBIXNxICmXZ0zayCQwUFW25an/BgEpyae56
	CTXQILbgTgVRaiCSFpyVsGFpnU+2t26xuAejBlnG8B20CA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xn1vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 15:37:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7073b4fb53eso24844886d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 08:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753717038; x=1754321838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAVDu2CUO0GFbPnrkds994cc7fuJHUyL9s9URha4+gw=;
        b=fBSrZ3NfKLEjaE/8P5ErxjHqCRdAZqxtStfHeVXjSx1Tx4wblexVcFZctnHgdskxVS
         smJwvbQVzoQzxyplhuRM0MkGcKjxNx8BcD1W+NSxdhS7DBHJfYPrD7Wq8EfFlI+itdUr
         SAo2KyikNP08pCFX9/fDswM1/yCItaJ3m+Q/wn/i4ehOOfEPQ3ss5ZveZBqUA/YJAUBw
         5dETW86D9ed/F35HKqXrbMWVXrYYhDdGtsRjHgQ7eGxW95wkZK0Fz59spvEjhoCa1m/B
         Y3JYR7zOhTauiM9YTDmGV9SpRvXxm3KpRofZUkDFZuPEcFU1KkKochmi/dvTUWZhXEWK
         YsrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9/tDa/hoL+s6U3xbkWBhREIIa9Xzul8otHYPK79y9AaO5J/K6XRKf94PmrxKcpletayxBz9fSyc3ZpQbU@vger.kernel.org
X-Gm-Message-State: AOJu0YwhRJHuyvWggDS8dWc3qEv8jBB8SVkhAiQFU25Y8r9ESM5gtjSg
	nvYC/w1p9E8G4l39NwRVzzOjYNgjtg85mYebdJs63k+CDbXWMILjbuNF/9MasrkW837N1QvDfZQ
	lb6V1x9FQTT6RaqeqbTR3yilzI3RFbnD3HIROuq72jUV5wzGpTa9igzHdvdkt2k3LDnlh
X-Gm-Gg: ASbGnctOApGosFdTSH04SDkbR7QgVR+/orkuY037qf/euYEB9g/L4AhQRnJss9SuACL
	/UtS+iSH7nnZREn6r1/TUVORh6vf8XSZBS1/nEVkQnPlPKQLeo+AIbcBPLgrsG9pZ8D9T4dZNJJ
	F0PEXyKcgkoMXr+Uch1MF6ZUtVa60cX8K4bVyr4BAs3Pp0Y065e/RmjiYEY4U3ZbozBHiOakvOB
	8UhpvZBQMTItuN1CV38B0DrbOOtU0r9nSI4Ybl0r9nUX2YVRZTzfLwTWONbGJn7a6mMpxdl+MeY
	RwGVwQ6aq9Q0uFvfn/HP2lw9tLwSKLILoTzXUddoG24SEIJKFkfgKXD9iIqJ6OuYPRVxM9b+GPB
	gbNPWQcEcigsFQvnOHuMYGps6DNgSXS1C8q3xJotDAaaOZpWFBm3F
X-Received: by 2002:a05:6214:768:b0:707:4aa0:30b with SMTP id 6a1803df08f44-7074aa00690mr43615666d6.42.1753717038012;
        Mon, 28 Jul 2025 08:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+BWhOHv+VJeM/lHL4P6XKb8rnJZC+uPnNDX7+Ov1b4lYzmfrK08Z/Q+Kn87HxQgfASQl2vQ==
X-Received: by 2002:a05:6214:768:b0:707:4aa0:30b with SMTP id 6a1803df08f44-7074aa00690mr43615016d6.42.1753717037278;
        Mon, 28 Jul 2025 08:37:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b73f140fasm21169e87.113.2025.07.28.08.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 08:37:15 -0700 (PDT)
Date: Mon, 28 Jul 2025 18:37:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Message-ID: <mfxfi3blmebuua4rwdppbaiyiyqh7apkh4xxlwqm6t2ishjqfa@i26nvsduy5wm>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
 <b81aa592-a66b-457b-9f42-df4505b28508@kernel.org>
 <3gtlf5txxtioa5bvo6o467jupyoam4hjhm2mdiw5izv5vbl3tz@drndgp3tcrgo>
 <bcef34c3-98b4-454c-8138-c73729e17081@kernel.org>
 <5e2caeb7-360a-4590-a36f-ff1ec4c20d31@oss.qualcomm.com>
 <2a39c0ab-edd4-402c-95a0-a6286f03102a@kernel.org>
 <20250728-exotic-armadillo-of-upgrade-fbebc1@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728-exotic-armadillo-of-upgrade-fbebc1@sudeepholla>
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6887992e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=-6XmDZydnhzWYMP6MwkA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 5l1eE7lhERL2_uaHUpVKb-2zQjXmZsjL
X-Proofpoint-GUID: 5l1eE7lhERL2_uaHUpVKb-2zQjXmZsjL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDExNCBTYWx0ZWRfX6WbybqD1c06F
 +ec5sS5gRSTwpLzRgenhHac0tcoWFwMu+1Vcadixya6JvEfCZ3w6puueuEXYT10SvDWT/MFTBFJ
 ZVZfBaQZbYHOcQ4IFtQnZZgnMp7WxVZ4W+LKEtcxfGPHA7y3oUcn8vIWxR843pExJbFoMjjmXaf
 dTA/LtNM7/Ef+UWmD/UrVnM5y/TraiB+HDRBYLoRXWnlT4xpscOmoDN7ooUNj15kSMtg5VUrofT
 mTFKa/FzUdhqFxqEN8LHQBECyK3YBW2S8jeJS7b2jlSm0RuIMxLQNnsv3Ov4rBobqPSKQT1kNe6
 Y7oGdL0McK+9y5j2dwwQD7Xj0Qv4DK8AwHg391gyj8l9+Mm13g/ungad+sNua5pt9gMsmBfuGFm
 o4u4hqik1WBJMa/VOMuUcX6e5JC2ImbjlmcN1n6mwWlhzF/Mz0w8mAyLcOGjiTwo9UZFiO/3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=677
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280114

On Mon, Jul 28, 2025 at 02:23:17PM +0100, Sudeep Holla wrote:
> On Mon, Jul 28, 2025 at 02:23:14PM +0200, Krzysztof Kozlowski wrote:
> > On 28/07/2025 14:03, Dmitry Baryshkov wrote:
> > >>
> > >>> and the reboot-mode is defined in the
> > >>> previous patch. So, I'd assume, the path is defined.
> > >>
> > >> As I said, path is not. only psci/reboot-mode is.
> > > 
> > > Do we have an _actual_ use case where PSCI node is not at at root node? 
> > 
> > Yes, many cases, because it belongs as well to firmware node.
> > 
> 
> +1, I was about to make similar comment. /psci predates the formal push
> to put all firmware related nodes under /firmware, so /firmware/psci is
> equally possible path and should be recommended one so that all such
> firmware related nodes are contained under /firmware.

Ack, thanks for the explanation.

-- 
With best wishes
Dmitry

