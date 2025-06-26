Return-Path: <linux-arm-msm+bounces-62701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52477AEAABE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 01:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D986B7B5C74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 23:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529072264CE;
	Thu, 26 Jun 2025 23:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHmDmM5p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC562264A4
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750981081; cv=none; b=lR+8j9DCb8oFIX5VhvZZzN9GyfipHcC+Hp/eiGigy1JZdV2FxpLx0gaU+743UYeQ0ut2hSYkxqxjkn7bqrnWO9BSBLE48DpS1y7qe8/8QN3bhWeEPP4vw0Jfmw+6Q0O/DzmWLT+2cgog520cK1639P9k/hXFYwnlo8ClnpHdvDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750981081; c=relaxed/simple;
	bh=EGpeMWLKnG9VFthSqSlUF2fQOm9eZpsV2Fv3d8hs0zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ap5fgrPnX5iQKcuT/Dm1vTbyJvDzKoaqLoVtX/avHpEDYS3Qjto3CUu+adi2NK8hIcs1G903YNoHzq+pE0T3+LOVymAz9e2KdTd9obk3XaXIBNzUO4I2C5Azx1YQ801+ZxgCvnewu811EbkgWyKwCcloMu3S2OPh9VdrUVJvAAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHmDmM5p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJQJAF014499
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oNGoQxfq9BmzRNrHBiOpebN0
	WGqD2gPosHFTzl27EH8=; b=NHmDmM5pPEOobkbBiDC814/nRYzrdpLvgK7ea2eq
	FYpbxy1e1ZpO4SHYQ3XyaUP6nCMkstPED78kVJv7N3ZFR1on5T2xOnTuKyheFU2R
	bGqMF+aj/qW5GiBLHPUVObEZB66DGEQFiFSrU4JRIkE9jDo93dS42NW0U3y5g92w
	cvTXUhCODMsPWAXBzGo0FSdfNTvwsPKDc2lICs5YIwMUmxlLSjaME32E4iLbuqJW
	tqgRotBh99dZXW+Aodukbat+q63nzO+QxXmQoFc0aZlRGvohXhBbo4nR/rfjzZpP
	KaTtyIq88R3q2QTId8UIOCNLX4uX+a8SwS/k06Wx33cOBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgmu9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:37:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d413a12847so265550285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 16:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750981075; x=1751585875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNGoQxfq9BmzRNrHBiOpebN0WGqD2gPosHFTzl27EH8=;
        b=BBUcuJiPcssjMTBBHvTdgkhD7jAkjq+9KbhTCXPJgLKqVNRN9tZ6ANzxFxzH3NWpkb
         hLlLtGAc/kde8NZXw6MektvyRYzAyLp6+WFe5fj1Ss6lccyW3bpIcKCbjvKzrBhC+RyZ
         cTQjn2wSpSIjOppEiSovyrsl6ZUNxDPxw2UvFF5r4jrNT9JmHKBzgKz1q/wfaWrbX9Ns
         /kBpOqrx6tN6O//MZoByTXNJ3cv34cpN3Hea2ulMqSzjjdjzgGdxukv0tDk6nthxFYyc
         qBQ+Brxv1IKzBra4FM4PZvRVqvSMznB/VazxXRx7PQkhSuVYIwHoXJWva3e2Snuw7FVO
         rZ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIaiIOaM/ceYNIICvs0t14nxP9679M/Ie99NyuNLhWqCuZWTIl39x3auJIL25kdrp9+efTpapHkow+vzLS@vger.kernel.org
X-Gm-Message-State: AOJu0YypReQL4KuaWoc9nzxdHLEvmefGoqKp9QlCOj58yzU8kWDm4NFF
	ngSrPw8rur6RmzoC0yleaXqXvsCBdG7QooBoMzIRwZDN5JXtH48H/MkuKom5/H5+Ywku7lUCaVz
	2OCibTHMF2CLLENjmBYZvfnMC7rQNSp3ryRGhlOZUZrvscB/YrGGzkU5xdeueOG7oTM7k
X-Gm-Gg: ASbGncvsMJraWQxkS70jGcNtmwm/39BXO5bRBC1zHXXkUnUyLrM769hGtNxsIn1E9fq
	/Gtu0ZU1N+JpCayhCmUkT/su498kHtZYsP4p1T+vXYQhiyhVvjb0X1lgLMmyQOOn7cbQMSzXcO3
	Ud5fSkZM0H2DYvtSIjg7bQ/LQP0my5ZIDWlZmx/ens16FCzVBP7FCwsfawsSeeAZBkDlGMGc0Zb
	VtyrBOkElMimnN94WVR1klEp3cBrHqFdkYJcCYozSURylMOSmhP5UkJ1alpkBxWSkHgvD+VkAkB
	rzm8VgkFiNyn6YNOoQc69DRx5uNQYQbQTvWsqpTKrGIy1ElxKVg7p2VKjzJsJNdoZPxNDP573bN
	NyWMU1JBg1NdDLJW3bHmC6n/eC98wvW1LLNk=
X-Received: by 2002:a05:620a:1b9c:b0:7d3:f0a3:d91d with SMTP id af79cd13be357-7d443988248mr214252285a.52.1750981074924;
        Thu, 26 Jun 2025 16:37:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtdY9OETvGBAKYL+WWZHvWwuSqbMuPgwVoPJD7Cdt12Xn2UPw8ZnPr9A16Kk7BI7zL9BsGfg==
X-Received: by 2002:a05:620a:1b9c:b0:7d3:f0a3:d91d with SMTP id af79cd13be357-7d443988248mr214249485a.52.1750981074540;
        Thu, 26 Jun 2025 16:37:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2403edsm201771e87.14.2025.06.26.16.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:37:53 -0700 (PDT)
Date: Fri, 27 Jun 2025 02:37:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: qcom: pas: Add SM7635 remoteproc support
Message-ID: <id45mfkotz7g5xyuoumlx7oqkprwfue34bmh3plefurvmznq5m@275kadhyh4ry>
References: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
 <20250625-sm7635-remoteprocs-v1-3-730d6b5171ee@fairphone.com>
 <3dd39700-4fa7-44e6-8893-b46c601d772c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dd39700-4fa7-44e6-8893-b46c601d772c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jzbNxmqajC7GTSonAWCiYnAWURmo949M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMyBTYWx0ZWRfX1lKjHCsD4KBS
 sTHYlQCRsoXomyp7eOpGN0L4H+PIkN/ZXRABNM6wo5u1jMGkmfwm3FZT3oXJQqeyGYURqlsXTuT
 DWoWK0BZj370xHa+1WF8Id9lQWjFbr6UeJYyGu4pBC+0oz4e55obbBC1d8fgcXNcI+gNsQ53cGa
 SgJjQv/9MsBDaMvmYm+p6AqmY0CIQ5yLgDWC1ojcY8zwfJJ8lxdSaLrftTnRAiaHAovVhntzZzL
 IxmqgBH7Gdrf95bkLerxOajDC3MgmqPv6sdzs+R7Opoy8oo4x3SjP3+J92TcsZO6QnteCFyjWcm
 PquxrXwbB4RqNr3c0TgydN6Pe+Idv8MKKAPVOl9WY4eI6IcL0XSdgW5bz8IDbow1FP/o+SeK/+7
 kodqgwgusd0ssXswQ/hU0dYHGZulHAiq6SKrA2cSfxWcIYaxvLM6aodGOxmV8JbhTE+AMHjH
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685dd9d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=-dTNQW8ulQ0M454dHoYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: jzbNxmqajC7GTSonAWCiYnAWURmo949M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260203

On Thu, Jun 26, 2025 at 09:20:28PM +0200, Konrad Dybcio wrote:
> On 6/25/25 11:15 AM, Luca Weiss wrote:
> > Add the different remoteprocs found on SM7635: ADSP, CDSP, MPSS and
> > WPSS.
> > 
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index b306f223127c452f8f2d85aa0fc98db2d684feae..6aae61dea8d0dbb9cf3ce84b9dbebb77b5aa1d52 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -1261,6 +1261,26 @@ static const struct adsp_data sdx55_mpss_resource = {
> >  	.ssctl_id = 0x22,
> >  };
> >  
> > +static const struct adsp_data sm7635_cdsp_resource = {
> > +	.crash_reason_smem = 601,
> > +	.firmware_name = "cdsp.mdt",
> > +	.dtb_firmware_name = "cdsp_dtb.mdt",
> 
> I wonder why we're not putting MBNs in here..

These should be .mbn, yes

-- 
With best wishes
Dmitry

