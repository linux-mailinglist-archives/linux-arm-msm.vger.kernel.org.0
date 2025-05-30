Return-Path: <linux-arm-msm+bounces-59932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A61D8AC96C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 22:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D662F3A8FF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 20:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619F02116F5;
	Fri, 30 May 2025 20:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XEXK/iEN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1649148850
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 20:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638199; cv=none; b=sn73HZgSU7F8rak+bALKRXIyglftbk942bqOCwYGNlR8a83AzqeJXokyUYS0EmQn5EAqLOrwR7+To5ZFOMi6mori0G2cOhcEw2V8va/sM2ZOvO84fiSTb+myEJgISPtAtBs69bHM2kJD+z+MYTibgNAc7ehgLiHFV3h3OfOavK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638199; c=relaxed/simple;
	bh=Z/SQDguAIObEY8C0kHCDdptrHc6WvAlDkwRE+kpr6ME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqmHCSzAyseHwL1LXSTkWi1p7uUA1wD1E3kepcZESqEYtggZtQoicA/nT0kVrhtKB/WMOsYsOHxsAyF2uNWFn+Uwm6Ias4t2gR92NYTsYt/cX8aUbkixNbr6AmyEVJAoflPZhZL0739LGsFo8UL5kPzdN9/zQtkWhgr2i5uX0pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XEXK/iEN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UJTwV1008028
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 20:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DsyXZy2cnb9zt4NqdViRPyHO
	LOS/pgCy2Yd70hjrCn0=; b=XEXK/iENVYHvvInR2h95LM1tesv2yX7broViRsRM
	cRhQyvjsHejEsBaMV5PEDftzDgejlYHUjscpSU29eVdd90byQi8dUVbHSBMxOCHF
	nygAhmWOjYx4xc4zAFrhRWmJf8vLyQazeIbEq1UzzFGb9fh3vsLcPG8K1CX2j2j3
	FecRCklTYWTzpQ19tmWvM+bY1G9bmY9/K5KdZdZXXhzf6EZ8SHv2d3o5PWgaHPep
	UYZi+HCegULsWj47cl/p6S6Big3MMknPqTZG3S+YVfUDLlBX0F5KtUYJYGviPlFS
	HQ64m3hJ1wp3aab/FM4u9p9u383wLSlX8jTl3XEwjpn1pA==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992vmgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 20:49:56 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3dd789f3b99so47615095ab.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 13:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748638195; x=1749242995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsyXZy2cnb9zt4NqdViRPyHOLOS/pgCy2Yd70hjrCn0=;
        b=Wj92936kwr/25SDMtwg5nOe9Hxeo0+lZv9whHe1sPkPnz2vv8mmyhib077egpztqtX
         B3BH6S75FL9MFRXI7Xmxbmw1JNuOy13/G5t7OKcbmdfhdnzFqFWAsEdEQwuMjbb/z0i0
         bvyJ9v7RvggsSgaZitj+BsrqF2do7+FZw1JWhYGU8KyCBceWCN51bPkxoolhGHHszJH4
         HMoIh+HktzQ+9rEsKo2HbJFYOypHbSLLC+b7z6oFxzopnOay3o3Pw2akuOgApop1LgHa
         Weup/uLIq+kLd9r66GCEBmx9WcmKsdsYipY2ZbyQVPMawR69M+qxAnVpIT6b5oeTtdRE
         EXzw==
X-Forwarded-Encrypted: i=1; AJvYcCUQvcQ9GaTveJx/OClgonGJX/Uu16I3n/8UizwZihUKVx2ks5Kg6fmBQs/5LUUVVzxgM20W0IP4rHFJ6I1z@vger.kernel.org
X-Gm-Message-State: AOJu0YzKEmYsGOjS3vkGi8Puc3g8gq6UdMz9wLfAPyaNciSlPLIjB/AV
	iWMsZhXv1/ZyR2ho+5ZrE4jCcE8UIdOo5TFfj8eupA0yi2Vuw8/hgOhNBr6QJPwyC+2IiQdIiTd
	72abgETX7sL88yNxloxupno3rENw2m6rW9XLBYeSUSFhSqo2k9HGriFjKv+YNn1/BP/HKTWEJM6
	uH
X-Gm-Gg: ASbGnctviRQ0K1h88mIE5/kGOXn+4Ax3C5/rQkqV/raXOfXl6GxJFYeTCI5WgqKDLPI
	zKLlZPULSXe6rBwpahY3MDBu9pF4R3Q1UXQR0pyv4bQ8hCaBGgXrhjxfTXCdK++ni1ZI1SvATpX
	nolrr3SCSZEtHnAAu+qsTOR3OfEp5mmwP67i9bCYTx2PmvM/G87txgmz7Qx9ZeSaSrTmaGSKmjb
	Gt8wB/wNo/bDIlj7GskPZsRqIvBdV1vCYvI+1cMbUu1XBovaOJunoBB5X0cFcwmmzXap5gjSa6z
	dBLgULtpeNj9Ei+tti4PInkbSMxnH/iW1+8O2WVN344c0ZCelBI0wj7LkToDU9BOkVouJiJqL8g
	=
X-Received: by 2002:ad4:5bec:0:b0:6e8:8798:275d with SMTP id 6a1803df08f44-6facea8d3bamr71835596d6.0.1748638184593;
        Fri, 30 May 2025 13:49:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZn6yOPwjbeFojONTjtNi8bdxrJYlYPkbczEfleXf91W2XSrAC4HcDXRZlVG6gYS9oZroZwA==
X-Received: by 2002:a05:620a:31a3:b0:7c5:562d:cd02 with SMTP id af79cd13be357-7d0a201de9fmr732139085a.41.1748638173430;
        Fri, 30 May 2025 13:49:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337937719sm822559e87.236.2025.05.30.13.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:49:32 -0700 (PDT)
Date: Fri, 30 May 2025 23:49:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 2/3] soc: qcom: qcom_stats: Add QMP support for
 syncing ddr stats
Message-ID: <tqmugtxmauwo5o3lqilb3q5czpyl6uvs4wjcmq6pthni6eq7ky@ndzn6ovhnzdq>
References: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
 <20250528-ddr_stats_-v4-2-b4b7dae072dc@oss.qualcomm.com>
 <6ldwvqqhk4lndesk7oac4ly2vhdxyd57f5hhijvutik5gm2czu@vmkasgeg2tmm>
 <4f7168d9-8d8e-4fdf-8917-47c1cc71cf82@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f7168d9-8d8e-4fdf-8917-47c1cc71cf82@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE4NiBTYWx0ZWRfX3EiVJILUQTBP
 Difjcp/jQO+K6SVXCqbewVTHeFlv7g0xp4D9sP3gJdrn9ZILdvEaaLIzDapoT7jPkmpbQx5UaR5
 C0cNao3fm6Ze15o6sSwb7x5zkzVVOtjln6w8ydxaQbr7ho9Je+5RGK3xWHjT0o2haEfdmKdiVEH
 agWogGFUKQOOnftdShOhfcrdxKHxiRqPmID+xT9E4Dj4v/BJyDcP46kReun+3Bvrl8scQ93yIgw
 Z8NPRJFIW24phlOIoIelx4+Q86dpqTiLksRP+O8uxZqhIuXfzue7n45pzkQWEXf282/dsQdhcvK
 A2sXyNmX9Uv8NmXjmr8KG4swjDH40dR0IIGuJH39p5VDKZqeaYucBQbNYqu7ZOu7thv0FCpAiBN
 MHP92Jmo6/Bery0ayCAawl+gdTkxxXIuyUvhU/jWOrP1jjQtbXWkBcI3tZJQgREQIQFliL2X
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=683a19f4 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=o5tYnl-ncifjDb1ZhVoA:9 a=CjuIK1q_8ugA:10
 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-GUID: v50oMYea8wD3vuC4e9UU73fdJKBHdxGX
X-Proofpoint-ORIG-GUID: v50oMYea8wD3vuC4e9UU73fdJKBHdxGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300186

On Thu, May 29, 2025 at 09:07:49PM +0200, Konrad Dybcio wrote:
> On 5/28/25 1:02 PM, Dmitry Baryshkov wrote:
> > On Wed, May 28, 2025 at 02:51:32PM +0530, Maulik Shah wrote:
> >> Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
> >> ddr stats. The duration field of ddr stats will get populated only if QMP
> >> command is sent.
> >>
> >> Add support to send ddr stats freqsync QMP command.
> >>
> >> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> >> ---
> >>  drivers/soc/qcom/qcom_stats.c | 34 +++++++++++++++++++++++++++++++++-
> >>  1 file changed, 33 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
> >> index 33fd2a1574464768bd07289e743fbb79ba415e84..0545c8cbefb8f18758d4eb51638e4ecb94e05422 100644
> >> --- a/drivers/soc/qcom/qcom_stats.c
> >> +++ b/drivers/soc/qcom/qcom_stats.c
> >> @@ -13,6 +13,7 @@
> >>  #include <linux/platform_device.h>
> >>  #include <linux/seq_file.h>
> >>  
> >> +#include <linux/soc/qcom/qcom_aoss.h>
> >>  #include <linux/soc/qcom/smem.h>
> >>  #include <clocksource/arm_arch_timer.h>
> >>  
> >> @@ -37,6 +38,8 @@
> >>  #define DDR_STATS_TYPE(data)		FIELD_GET(GENMASK(15, 8), data)
> >>  #define DDR_STATS_FREQ(data)		FIELD_GET(GENMASK(31, 16), data)
> >>  
> >> +static struct qmp *qcom_stats_qmp;
> >> +
> >>  struct subsystem_data {
> >>  	const char *name;
> >>  	u32 smem_item;
> >> @@ -188,12 +191,28 @@ static int qcom_ddr_stats_show(struct seq_file *s, void *d)
> >>  	struct ddr_stats_entry data[DDR_STATS_MAX_NUM_MODES];
> >>  	void __iomem *reg = (void __iomem *)s->private;
> >>  	u32 entry_count;
> >> -	int i;
> >> +	int i, ret;
> >>  
> >>  	entry_count = readl_relaxed(reg + DDR_STATS_NUM_MODES_ADDR);
> >>  	if (entry_count > DDR_STATS_MAX_NUM_MODES)
> >>  		return -EINVAL;
> >>  
> >> +	if (qcom_stats_qmp) {
> >> +		/*
> >> +		 * Recent SoCs (SM8450 onwards) do not have duration field
> >> +		 * populated from boot up onwards for both DDR LPM Stats
> >> +		 * and DDR Frequency Stats.
> >> +		 *
> >> +		 * Send QMP message to Always on processor which will
> >> +		 * populate duration field into MSG RAM area.
> >> +		 *
> >> +		 * Sent every time to read latest data.
> >> +		 */
> >> +		ret = qmp_send(qcom_stats_qmp, "{class: ddr, action: freqsync}");
> >> +		if (ret)
> >> +			return ret;
> >> +	}
> >> +
> >>  	reg += DDR_STATS_ENTRY_START_ADDR;
> >>  	memcpy_fromio(data, reg, sizeof(struct ddr_stats_entry) * entry_count);
> >>  
> >> @@ -304,6 +323,19 @@ static int qcom_stats_probe(struct platform_device *pdev)
> >>  
> >>  	for (i = 0; i < config->num_records; i++)
> >>  		d[i].appended_stats_avail = config->appended_stats_avail;
> >> +	/*
> >> +	 * QMP is used for DDR stats syncing to MSG RAM for recent SoCs (SM8450 onwards).
> >> +	 * The prior SoCs do not need QMP handle as the required stats are already present
> >> +	 * in MSG RAM, provided the DDR_STATS_MAGIC_KEY matches.
> >> +	 */
> >> +	qcom_stats_qmp = qmp_get(&pdev->dev);
> >> +	if (IS_ERR(qcom_stats_qmp)) {
> >> +		if (PTR_ERR(qcom_stats_qmp) == -EPROBE_DEFER)
> >> +			return -EPROBE_DEFER;
> >> +
> >> +		/* We assume any other error means it's not defined/needed */
> >> +		qcom_stats_qmp = NULL;
> > 
> > I still think that we shouldn't be ignoring actual errors here. I'd say,
> > check for of_property_present(dev->of_node, "qcom,qmp") before.
> 
> /**
>  * qmp_get() - get a qmp handle from a device
>  * @dev: client device pointer
>  *
>  * Return: handle to qmp device on success, ERR_PTR() on failure
>  */
> struct qmp *qmp_get(struct device *dev)
> {
>         struct platform_device *pdev;
>         struct device_node *np;
>         struct qmp *qmp;
> 
>         if (!dev || !dev->of_node)
>                 return ERR_PTR(-EINVAL);
> 
>         np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
>         if (!np)
>                 return ERR_PTR(-ENODEV);

So, I'd say, we need to identify whether it is this caluse or another
error. It should be enough to ignore ENODEV and return an error in all
other cases.

> 
>         pdev = of_find_device_by_node(np);
>         of_node_put(np);
>         if (!pdev)
>                 return ERR_PTR(-EINVAL);
> 
>         qmp = platform_get_drvdata(pdev);
> 
>         if (!qmp) {
>                 put_device(&pdev->dev);
>                 return ERR_PTR(-EPROBE_DEFER);
>         }
>         return qmp;
> }
> EXPORT_SYMBOL_GPL(qmp_get);
> 
> 
> Konrad

-- 
With best wishes
Dmitry

