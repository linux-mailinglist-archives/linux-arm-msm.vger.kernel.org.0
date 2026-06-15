Return-Path: <linux-arm-msm+bounces-113270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ogf2ML2PMGrDUQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 01:50:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D02DE68AA72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 01:50:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="UY//1OGH";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fx5iU4bZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113270-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113270-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10CB43006D5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 23:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870D7345729;
	Mon, 15 Jun 2026 23:50:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244E82F8EB0
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 23:50:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567415; cv=none; b=eXLX9rMBIuR8FeG7IE7jV2E1p1Dbt45YvbbV6XLxteFBdOV1MkqUN4/CrwPZ1HyP2y8gAjDFYfk9oZ4YYEAlJcCZPbzAoPNPOm+nTUjnssYO6Pp79J8gJAOdMrQETmUD+ELbE1iDma7PSy4BjT8fXKqukbnNfSjp6xgkE9BLVx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567415; c=relaxed/simple;
	bh=ZJE4bpawKev606p9CfK/9HaQjRenhBHPXjX4K4Jv79w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohqDitqA1Xr+yTPXLwqGXoDnCnJPU+y9QoXOf5ker+g0ahJJTotHy0Or3m1x/bcdC2bccyXkYYWkfdTJks/zTUwJ2Fte8poSRo/2UKw13X0ZZkEHujdq7Vc68kN8m4clXJU4KJQQ9GNjkpZi+DzfQhPfnIB3wjPHzRINWKgshIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UY//1OGH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fx5iU4bZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ11Rm1453954
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 23:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PtbPkBFkYuHZJNlttISlt1Fz
	gsGmJsC9TY2z2xFeuuQ=; b=UY//1OGH8tUQ93zAAz28HmsDuC+tPCbGTemB55dg
	6MqwM/Bs9d+ynvYTPnikYjMx0Vpjw/qn45+3kmO1cqpNfdHOJq9V79qAsP3/cSp0
	lVhMJBCQa2OVONHzi759YK5R41NySz+nnbABDLo8THHA2anH7wRb9iv4kry/d4H5
	1uVXp9S7u8qVamxsJsagzxkTBY4MY7uSHHyswUDyD88efeifYAfRqnOYBmPRyPHx
	eM+f487bfW+saacHa73P/HV7OJuvzThfPZaGASwzgT9iZA4QxqMcsxYaimrVJqkR
	xpGt6va/YAtdjuypZIWS0r9Yg+bX4u/qhuwTPgSmdnZiBw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2cc55a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 23:50:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91574ad681eso609917885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781567412; x=1782172212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PtbPkBFkYuHZJNlttISlt1FzgsGmJsC9TY2z2xFeuuQ=;
        b=fx5iU4bZcHLnywoYX3dA+XMEKjagObBun0SU1Q9p2ciyKhvOdbd5tg/C06DwwqBJf+
         d0DQ9USqdfMeXnT3xXMXFafrxCrmBf/OOf0bCPOtJZEJf+zyzUUTsvcaTlb119cgmDpe
         5prAx5c7d8KZ9SIfY3PjHQCJZqVDU+6ZFO1ZlDbzC6i0DXego1WqcgWkK2sf6dtP/SWF
         LzTN68psDze+TcXo5pp0IHSFSO9BLB/jjxzSuX45TNfoDYb78qO30G4ISvAs1snrKw+i
         JH6T/wTCma4FUnGdpK8ApKULNtPgvcLsT9cJPGxjrrJSUpLi9Gh1l5v5cBBQpe9Dlw/4
         zn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567412; x=1782172212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtbPkBFkYuHZJNlttISlt1FzgsGmJsC9TY2z2xFeuuQ=;
        b=iIu+RPHRa+BcX2VxGL5t4X7S4GEvZxQ9VgRiw4hNTaco1m72XvZCxIHluqndVnyOfG
         KDpvLi+3ic3Npz+SzIeLdSh/+RnUXagfEroeduLsluCl83PecsXQZWHRbxQDtTE+3IJg
         /rDZxc2ip6Czd+vkas6AIlfsdg7DUcdD5DRFuHCCUik23QASJDu6w1G4qg2aYkx4+cvG
         5vIcDZe+dCYGyCoornbhz7sgbl6WDXw2NsyeH2iCfROQ2uI5w6VAeNnqJkshuR72OrMS
         CDX5oE2QcXkdRF8QTrikG9ptGkg9PNqm0D84uFgPodeEdpOtKEOQRWU1S74FK4/xcPzI
         YJ8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/uAwAGH0PxbP8rQacl0/obhqvPy+VOmwd2C1SaXHq4b3R4z13zSIYJNYVHLggCUm5xUXdb4aKiZV2HBGwR@vger.kernel.org
X-Gm-Message-State: AOJu0YyfNQKc/6+UlfQK3LSNMsUJb5nodI3nCzzMkCQafVGfVeBgMjVs
	FpHZPPqqP/gGtKceOoSY6tjfiLY/2kagiU233dCAvYVW8plwCo4bVihium7xi5WGVsnzfePp9B/
	NiGgfwu57uXrhYAPyVu4UblEJpPuGZrmSkU4uls6Ie+7+2Feh1pfMQRRiqCjwMYvIeSAS5z0c6u
	34
X-Gm-Gg: Acq92OF5FCGNe4k0gQBX2lVuYtd5U2Sjnjjd9O4XFdumnAKYYjq55aFPAryT7vBseNi
	QScPQqZj4O3VOJuVGVh6O4BiSCqgK5ECuzpcUTHl/O/dfal+rftdtPaatE3ZfxxoCePdYuLDdyj
	0nLLqcAoEmsGWFJre2tfBYlI1M3SLjVDIgBJv9mf1OwzgOzlK9E8oe6Xyrs3meYWX3BmCjUcuVQ
	9uFKDyLYaqAnmRZJmyLzseknqqXueqAxzNat0kVI6ABCkqBRUBgspuJSrW4kPd3yYYXvm9Q6lHd
	EWnYQTj+/h3Q7yVEs4VkR1OZ0xI4GgPO27bgEFDKiIgQRdPqR9kU04Oh50sOqN7PhnuyLeMUYP9
	zcydbfOSql7xC1lnJYKFUgyR7Zd8geKQBbNxq6M/DxXtNudRp9wxSFT6DLemO3BcZ6mkMlHX9WO
	Gbp/1KhIrNMPJ/6S7R+DbMXD86iEnAirLVWUQ=
X-Received: by 2002:a05:620a:1b90:b0:915:89d4:df18 with SMTP id af79cd13be357-91c47f6ea93mr199515485a.41.1781567412425;
        Mon, 15 Jun 2026 16:50:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1b90:b0:915:89d4:df18 with SMTP id af79cd13be357-91c47f6ea93mr199511085a.41.1781567411932;
        Mon, 15 Jun 2026 16:50:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1ae1absm3015001e87.59.2026.06.15.16.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:50:09 -0700 (PDT)
Date: Tue, 16 Jun 2026 02:50:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks
 on LPASS LPI SoCs
Message-ID: <jo3nelsqepovnmjc7ycsxehfc7iprzzplx4lzei4s774fb4xh6@t2pb5vv5kbf7>
References: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
 <20260522204644.4101640-2-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522204644.4101640-2-ajay.nandam@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1MiBTYWx0ZWRfX+buNMfYriLXg
 CPtSGG/oDXiegX10URKqmk4GRalSHnuMqN6pmjUSXkt+NHbaa3yINFbPtyEH54B5lv3n14fhdgc
 WbEM6dSxBperq99z/Td7nXHSjSlHvIB5yt2WadTHyhj7nDUpCeQJT/72hMtpmouCm0Cis+lpn52
 0b6L1oqF5482HGUWy48uMsqjogWV6U+d0LB2n+Yara7fZ57lFr0mOiGL46SpHaDvCv78Am6zUfg
 ZZNx+GcEharHMIn+Z+lDUcg2fN8b+I4lLp0Y8Cdxc0WhkBN+9o2kJHywZNTqrUsNh6yyKqkA+kh
 nemP3e+HovgjfVHOVdPgGRG/X8G9ZFjSaocUG4JZvXtihc4hw9KQCglDUut1g5XBg47Z6p2IJZF
 injCyteQR4e3dF9Z6ovFRj/voGwSuMEo5yeuRvI5d8GVInQBx5CYSoSnaog+6xbZYo8gb0a/+Nd
 +ZCA7nnSxqsePkWp29g==
X-Proofpoint-ORIG-GUID: a9huHPFf91b_cOvwOwgD7VBDkZYNqTE3
X-Proofpoint-GUID: a9huHPFf91b_cOvwOwgD7VBDkZYNqTE3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1MiBTYWx0ZWRfXxLxVIICB8mAb
 4erYn7nKwh1COvh8NAAuB5hGa5tnWC6IZ/guxy4SKzd4U6t5K3bEdWniURPjsCgP069B5DyU+Dx
 1eFWf2PcF+qMePXycHw2lixB86QYjYY=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a308fb5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=1z5vHLmaq52fhps1YVsA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150252
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113270-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,t2pb5vv5kbf7:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D02DE68AA72

On Sat, May 23, 2026 at 02:16:43AM +0530, Ajay Kumar Nandam wrote:
> The LPASS LPI core conversion to PM clock framework relies on variant
> drivers wiring runtime PM callbacks.
> 
> Hook up runtime PM callbacks for the LPASS LPI variant drivers touched
> in this patch so they are prepared for the shared core conversion.
> 
> This commit is a preparatory NOP on its own, as runtime PM is still
> disabled on these devices until the following core conversion patch.
> 
> This is a mechanical per-variant driver update that relies on the
> same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
> pm_clk_resume()) and DT-provided clocks.
> 
> Runtime behavior was validated on Kodiak (sc7280).
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |  7 +++++++
>  .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   | 19 +++++++++++++------
>  .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 15 +++++++++++----
>  .../pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |  7 +++++++
>  .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |  7 +++++++
>  .../pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
>  .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
>  .../pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c   |  7 +++++++
>  .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 15 +++++++++++----
>  .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 15 +++++++++++----
>  .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 15 +++++++++++----
>  .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 15 +++++++++++----
>  12 files changed, 110 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
> index 3bf6fe0cf1bb..72b8ffd97860 100644
> --- a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
> @@ -7,6 +7,8 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "pinctrl-lpass-lpi.h"
>  
> @@ -203,10 +205,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
>  static struct platform_driver lpi_pinctrl_driver = {
>  	.driver = {
>  		.name = "qcom-milos-lpass-lpi-pinctrl",
>  		.of_match_table = lpi_pinctrl_of_match,
> +		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
>  	},
>  	.probe = lpi_pinctrl_probe,
>  	.remove = lpi_pinctrl_remove,
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> index 750f410311a8..a61df10d46cb 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -7,6 +7,8 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "pinctrl-lpass-lpi.h"
>  
> @@ -129,20 +131,25 @@ static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>  
>  static const struct of_device_id lpi_pinctrl_of_match[] = {
>  	{
> -	       .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
> -	       .data = &sc7280_lpi_data,
> +		.compatible = "qcom,sc7280-lpass-lpi-pinctrl",
> +		.data = &sc7280_lpi_data,

Split whitespace changes to a separate patch. Never mix cleanups (like
the whitespace or formatting) and the sensible changes in a single
patch.

>  	}, {
> -	       .compatible = "qcom,sm8350-lpass-lpi-pinctrl",
> -	       .data = &sc7280_lpi_data,
> +		.compatible = "qcom,sm8350-lpass-lpi-pinctrl",
> +		.data = &sc7280_lpi_data,
>  	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  

-- 
With best wishes
Dmitry

