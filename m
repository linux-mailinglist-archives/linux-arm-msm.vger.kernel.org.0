Return-Path: <linux-arm-msm+bounces-55137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A254A98B2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C923B188AB7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF63118EFD1;
	Wed, 23 Apr 2025 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRFmbBeB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF34417A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415084; cv=none; b=AMsI58+jUdd34eWLw3cnPtGmYqs49ZMWjdL93HWBf1Vmg6NUgIUTAs+4wqWBaNgX8IrmmmstsuunO6YovJiJqMRIjpiLTup0COApu6vzjpPawMaFariljBSPkS4mGCy8k36xjBZfBKR+MupUxnatY9Hpc+wP1AKbr3Ee1BS0+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415084; c=relaxed/simple;
	bh=YPWbosimC3qPkFIdP63gOcohPto8jVI/bjwvfdxo1T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVPQ0IVWA0kw6NtqrxSDY4hqJ3ARr8WYDXDX4k57AUqBGgrEv+xqFFslr7Yj+cTxJCX5HZRuYvnm74YBdIqrvWAX/kXIFoqGbTTvX1niK4tmcTqtHH6Eu2blH6qU5R488/fZzEnYSV0WriVTMAM96UjfT99PM4nUxfipiiN0DjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aRFmbBeB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB6SUX023892
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dZWmP9gM06dWmEKtYYm5mxy3
	nQnWFD6fy7umPVrKHi0=; b=aRFmbBeByAGZvNocZKi/oi6Wq9yS71NB7meeiNC5
	6VkTz4uk1rAlDwQDYkckfe+r/03dNhtgy7dh+2+Iin9RD7qbRHx4v3mwbz8Ow97h
	ejZTDBqmtXWtDK+WEkkHf15QK+jfNOnAAQXhFkEjaaxpfGWCEyay7Mt/FAf72jw0
	F3IeOZ8obV2qKlRVtyVqR5wLUIBRsGu+Q26lSN1UbKtQkAYB9rBL2DwdnrGHAgnc
	hTIHQdArOuO3M5xjZ5odE/21yDszB7JUx3h2mWIQSALFgyWOlqgUKlB804XHgytT
	avZVqKi6iPhVByNXlcHdavlosu/o2JgNgovILUgMNI6MHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3a8ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:31:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54e9f6e00so151206985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415081; x=1746019881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZWmP9gM06dWmEKtYYm5mxy3nQnWFD6fy7umPVrKHi0=;
        b=HjnAxPH1mht4v42B2azHIRIywgJ2gtvK+NB7GOu1hk0pFOtFAk3cyTsdnRKwgAnuAB
         tqCxa8M+mV+Of3u9sh84WET6rMb8Z7MSgW/iIlfg4SJTDlqE54OuIag+6/M0TsXEGscQ
         IbGdrzOVcTprQJSkDs1Mykr6zZpgUXpP5xLdKTepbRXEeRCjVNG6DKEVfaeUfiNmShrj
         KigZtXTIfX+rATNxMBY1B0FPyzKX6JpJGP1KRSrS3bhVM8+cLKtwDgsVVs0TEh/sizQV
         6ylG9hH8JCO7ub0fYFMi+TOfCG3bHeN/BSp2FAIk83eKKzPLfK5V/HDSXS8Cib39THLu
         VVNA==
X-Forwarded-Encrypted: i=1; AJvYcCV9vuGParj1O2lyBqcA2ao7kexh17o92CADafd8PM+QqOcnFEPYTW5YMPTlTwMFZ8f1RBVFVhk5vYKi+rts@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkwg4Xj07olV+oon4WyXPs8bldJpedfUXOhmugyUogjxxYoWCL
	ZONeiqyPQ8hPiv8YsJV+nHBVFgqHNvr5a+HfHvKEg0nl+tcMU54r92R+KY0AE4lN/k/2CAkdgwy
	RPjAYmZcL2lzKk8U6jS3lAl2NVPCXcK2JME1DDn1ObS/E8DnFrUDiR5a8DiexxNcs
X-Gm-Gg: ASbGncu0wu7/mqNNLzNwFezeOpYD3fb7P54FfuFldxiUt+asX/UOFgIdTlJZGYgYP7D
	Dsv8eifPmMwudVRaK3heKg5RZMI+bYxLSb1aKu0u0ORocB+Un/fxacdYX+0ARC3BId0tzbkVhfx
	8zfHwgnIGaFXTk6Yc6JnLZFT8vOYHacppsbGtFz/JHGfRZNFOx7gqXvmqo8KktniW9g51pMiHg4
	yBNrHuphZKbeRAW4djSI8yjiTGdZRRX1N165sggeLbspHZOvkhDZxsbkDtg6QfdhD8/wgMPmBUw
	iKNJFE6CjPj2CTud3oVyhAMbH5kiizjd3AOssy5fff85rKrSHwK8Zkd7FeZP/QvqavRov/G13pM
	=
X-Received: by 2002:a05:620a:24c5:b0:7c3:dd2d:c0e2 with SMTP id af79cd13be357-7c94d83dee5mr484771085a.13.1745415080691;
        Wed, 23 Apr 2025 06:31:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpfJbI+AgBKtKkvkNrS86sfl4ggqkejOcLK4vPJLKCGSN66njI9kIk5rDo+YJT0RY1DWgIxg==
X-Received: by 2002:a05:620a:24c5:b0:7c3:dd2d:c0e2 with SMTP id af79cd13be357-7c94d83dee5mr484758485a.13.1745415079978;
        Wed, 23 Apr 2025 06:31:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5f61afsm1578477e87.246.2025.04.23.06.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:31:18 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:31:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
        David Wronek <david@mainlining.org>,
        Jens Reidel <adrian@mainlining.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
        linux-scsi@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-remoteproc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
        linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 29/33] firmware: qcom: tzmem: disable sm7150 platform
Message-ID: <3skwipkunn6dw4xtzyx4vdiqiwtu2qgezbel3vcu5k4cxk65yi@csi6xun5nlyj>
References: <20250422213137.80366-1-danila@jiaxyga.com>
 <20250422213137.80366-13-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422213137.80366-13-danila@jiaxyga.com>
X-Proofpoint-ORIG-GUID: UjZfV4pPYO99Vy896wnNwslvBfw55U29
X-Proofpoint-GUID: UjZfV4pPYO99Vy896wnNwslvBfw55U29
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NSBTYWx0ZWRfX4O7g8XXkMRPe HlNsRrN1I7GtJQuk8VuHpMUci80xb+o9LmaUe1+splBeip60oyxtTz44j5vs1WEr1irtndrG8op ePtBf6s02lXfhIpa1n6gknBGe2Prnu+XYdj97aP4c2fmz9wFr1W68nAdc/n6f0QVNP6JgI9WCUy
 DDCzee11ckBz5DVeqF8glXT3dcX9+1iDlWhRIy96F3UJ2jlppIUaXS4C7N7W9vZpl4/n/7VhkLk r6SchuNLO2zJ18+QhLto9o2ChDv6pxEex0n7ags8hVnK7Ihe/KESosgPmpgnQrHHjJpxGbX0mQh adenViCcSnaRhNIpXiuxK8mErugJ3PeJPXuaNYyL4JWGN3RBJ2vitXD9rHMwm5uuQZhIMxyhipT
 uYHwig2j1u9uYsxy3ZqVfeY70iDzTpyJZwZZsGI1reF2fMVOaDqbksALN2sIgYWoW96Wxah0
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=6808ebaa cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=7ibcVnAUAAAA:8 a=EUspDBNiAAAA:8 a=UlxMoeSB6LsTFmt9i7YA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=HywIFdX19-EX8Ph82vJO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=864 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230095

On Wed, Apr 23, 2025 at 12:31:33AM +0300, Danila Tikhonov wrote:
> The SHM bridge makes the SM7150 devices reset while probing the RMTFS
> (in qcom_scm_assign_mem()). Blacklist the SHM Bridge on corresponding
> platforms using SoC-level compat string.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

