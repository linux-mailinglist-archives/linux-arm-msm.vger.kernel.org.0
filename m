Return-Path: <linux-arm-msm+bounces-56526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A93A9AA7564
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 16:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C90874A60D3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 14:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887E0256C66;
	Fri,  2 May 2025 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcbOSsGN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3FD253B7C
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197668; cv=none; b=fy+Ig2eoY83aL+zlsqZf+XsAfDarPDr26DNgUZ9hP8MhEB5LRYvZXXo+8CFfgW3X5e9OHcUIXGtjz77TJh5DnswmiiUPq+UzSZtBvX7gGJU+/LUAGfOYSsD+v8SnB6b/aUNNx/EBpE1S/SNntndu26yKuVoURaJ9EHZ4YCqAX+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197668; c=relaxed/simple;
	bh=n5mbVutTTdA75c430IqNM7iDH8/4xuyXNJAQmbwMjUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amb2FhwQhDM3rUFeX8GeaaIoNfc6Xcw4MJ3jpt8QqVmL99ay4GTsmpm0wHYR1R8SnawftXQaTQCjSQXsthC7/GGyONco8xmFGxKzrna4yzgTxDCsnkDhcrJSWifMYyVSQtKNmjRohjUWLfDaqwgl0vrJFQ+PzPZAPPSfAa7vbXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcbOSsGN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542E9nh0015843
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 14:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qE/jsvPg905w0/spqoOjWTuo
	z5yjxf8U+JSEYe0nzlo=; b=WcbOSsGN/c0sFyFBfIc5Rky471HlcoA7imjJ4rFb
	2mkJtrF04Z7h2SROOTRBXgOtwZ3THkJxS/l/rZmjQfypV9cuavXASaKWyjyAfhlo
	h/kDqWDeBfRFxSqH1Bju3iVnqdwQCaToGB3/eK4S3ue7t1VCb0qVR6ro+hjM11bM
	U7D4snXDPQ328LcNksud4dGaR66HKKM9IqX9nTCaEWaQt+qtAmlE3pB2GrsgQeic
	IA6lyZGe3PTZ+qcgZsRpa87qat/t35uQk7WrkDfjY7zQyiKMOX5shduWcDMdV2Vh
	N15uh5ypS2QXJ3vDGIENrF8ql0qFclxDgFDdZaFXWfrtVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u40kh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 14:54:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54a6b0c70so200784085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 07:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746197665; x=1746802465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qE/jsvPg905w0/spqoOjWTuoz5yjxf8U+JSEYe0nzlo=;
        b=hXrOOLgF7QgsUm/0jFeDYp56ILYJyFQAg+C0GtRN9Xl0SyJJp9pJ6uicDqk+YY0CKE
         aBqYfN4OlfRGIuZVAiXkKDCJR23KnOUGpVBUKHHEiX1SBGH/QmOp8lEaBhQ6Jwn99SrU
         FsqLj7bwFpOiTZ1TbYdII8qDnEqzzyp9F7FYfWHk9yodOXDD0FGJ+Iwyhe7qEfFG/uUB
         aMIZGrHtuHucq1QhyfF24XGQ4p8YDhwGK+TRjkm71jLDrtuc45uoN/ada38bb+dQMOIy
         91AgPcpXyf29qaO1MCeU8yMx4sDFvbLqTNr45PUEz6mcSCOnF6VZlMPSdJCIvBE09gKX
         HrKA==
X-Forwarded-Encrypted: i=1; AJvYcCWBWO9tMIIcS4XKhU88TjLxbszIvaWfSHqorb3OWKaCEq3INJ4SBhxh9I7l1IV1iztor2zYg+Z6DE4oRyxQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzU91JkSpBl6QPVLnzCZZFOp5La2342P2R6z2urh7QL6AX6oO89
	FwcUCCBFhcqewO60w+dFkyFuFUc40RroAgZuk/j8Ndpoe28wIzVpBlcSHW3EibsZvPVL4u3pqcb
	rClxTKHdT+x6zUxRImQ9chHBaJZ1cay+AwH1xjrVt5Gk7KbXzDiqhv+5sPXk/N/fN
X-Gm-Gg: ASbGncuNT5/+E1DTiaJzMjWt/RScPljKNwqUzM99hwHoFKNIur3osDtEI4JkfEO9fvc
	mwa4Li3B+yFYteG7I9zsbrEfdNjn80jeJ3FB6pEP7hCNdtg24N6tQ3OkQs9e/W1fYxWv0jY9/b+
	ZJjqvZXnSglhlqJjXI9oU4vnHAgU3f7NZw78kWr4qRspqDe7xXHm882Ltn1196oYoyp0l3X6pgB
	n+vsJCfuxtlqxboTqBo+EOhyL0qO6IfD1p02u6plie4UyVtCDsVqiP3F/pIPv2du+v2gbfOGZCK
	InU+xKHAJAR/852bcMmui+Xd9EpiH25thKHr4B9esYpfqQ2OgAHV8y7gFBeusmitwsXC8XkfGVE
	=
X-Received: by 2002:a05:620a:488c:b0:7ca:c9cb:abc with SMTP id af79cd13be357-7cad5b4d180mr417140785a.33.1746197664701;
        Fri, 02 May 2025 07:54:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFet1ZO0otbj5B/aLa36yQdNFxhUTegLhRDS2nexQF821IjSj7e9HTywZtuVlJ/LbIApJViog==
X-Received: by 2002:a05:620a:488c:b0:7ca:c9cb:abc with SMTP id af79cd13be357-7cad5b4d180mr417135285a.33.1746197664163;
        Fri, 02 May 2025 07:54:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee6c1sm370305e87.110.2025.05.02.07.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 07:54:23 -0700 (PDT)
Date: Fri, 2 May 2025 17:54:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, bod.linux@nxsw.ie,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Message-ID: <gmoe3ykmns5hmmz6hdyxgzxiejb3nycghhvt3pgjysq6xa2zni@wpqyuz2pj5vy>
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=6814dca1 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=d-kK87IHMynt6gTeNOsA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: QskGyCZgVX675BfByR7kiVQyc7H2YVVU
X-Proofpoint-ORIG-GUID: QskGyCZgVX675BfByR7kiVQyc7H2YVVU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDExOCBTYWx0ZWRfX3dQ2x9mLs4kI IVvUrNhJsq+j9QCFqpOWwaXrU16s+4IBXUqxUM0r9Le73gc8d5RESPMHkeJs03kanucAWCOYv4/ 4nUsAXITpJjkg3rJfGA9Ul2bzhKs+Nw520ZmCfXqTUKPy9BTs2/RnuTyCNowyyIA9rWHVaKprfW
 H0b7+S7TPH2SYYfZd7SxTEEaP/fG6Tz08bTVJlFxWFSdtlXkP//hGlzqVTCUnFrivAzTETR+5Iq 9GZ8sQal8TV+zNDcositxBjr5H5mcDHr8RunnxIRzBiEcOu+mWQ767xPFXmFS/x1JEWIAokON+Z xTJGuBvI6ZH3gB5EynvwRSN/CxGIqltXrpNBZnhDJo8/e91Z7i7EPIRmHpymv+A6pQjF8daAtuA
 9caQTMQKWmW5WTZuXtpoytZuBET7tt7Q3K/TcrFBZtZchVvCXbdaAnKbjNPMsUx37di0psIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020118

On Fri, May 02, 2025 at 06:47:52PM +0530, Kathiravan Thirumoorthy wrote:
> When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
> in the WDT_STS register is cleared. To identify if the system was
> restarted due to WDT expiry, XBL update the information in the IMEM region.
> Update the driver to read the restart reason from IMEM and populate the
> bootstatus accordingly.
> 
> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
> as below:
> 
> cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
> 32
> 
> For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
> function qcom_wdt_get_restart_reason() to read the restart reason from
> IMEM.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v3:
> 	- Split the introduction of device data into separate patch
> 	- s/bootloaders/XBL - for clarity of which bootloader is
> 	  involved
> 	- Mention the sysfs path on to extract this information
> 	- s/compatible/imem_compatible in the device data structure to
> 	  avoid the confusion / better naming
> Changes in v2:
> 	- Use the syscon API to access the IMEM region
> 	- Handle the error cases returned by qcom_wdt_get_restart_reason
> 	- Define device specific data to retrieve the IMEM compatible,
> 	  offset and the value for non secure WDT, which allows to
> 	  extend the support for other SoCs
> ---
>  drivers/watchdog/qcom-wdt.c | 40 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index dfaac5995c84c1f377023e6e62770c5548528a4c..f2cb8bfdf53a5090bcfff6ea3a23005b629ef948 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -7,9 +7,11 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/watchdog.h>
>  
>  enum wdt_reg {
> @@ -42,6 +44,9 @@ struct qcom_wdt_match_data {
>  	const u32 *offset;
>  	bool pretimeout;
>  	u32 max_tick_count;
> +	const char *imem_compatible;
> +	unsigned int restart_reason_offset;
> +	unsigned int non_secure_wdt_val;
>  };
>  
>  struct qcom_wdt {
> @@ -185,6 +190,9 @@ static const struct qcom_wdt_match_data match_data_ipq5424 = {
>  	.offset = reg_offset_data_kpss,
>  	.pretimeout = true,
>  	.max_tick_count = 0xFFFFFU,
> +	.imem_compatible = "qcom,ipq5424-imem",
> +	.restart_reason_offset = 0x7b0,
> +	.non_secure_wdt_val = 0x5,
>  };
>  
>  static const struct qcom_wdt_match_data match_data_kpss = {
> @@ -193,6 +201,29 @@ static const struct qcom_wdt_match_data match_data_kpss = {
>  	.max_tick_count = 0xFFFFFU,
>  };
>  
> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
> +					const struct qcom_wdt_match_data *data)
> +{
> +	struct regmap *imem;
> +	unsigned int val;
> +	int ret;
> +
> +	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
> +	if (IS_ERR(imem))
> +		return PTR_ERR(imem);

Why? Just pass the syscon directly via DT.

> +
> +	ret = regmap_read(imem, data->restart_reason_offset, &val);
> +	if (ret) {
> +		dev_err(wdt->wdd.parent, "failed to read the restart reason info\n");
> +		return ret;
> +	}
> +
> +	if (val == data->non_secure_wdt_val)
> +		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +
> +	return 0;
> +}
> +
>  static int qcom_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -273,8 +304,13 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	wdt->wdd.parent = dev;
>  	wdt->layout = data->offset;
>  
> -	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
> -		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +	ret = qcom_wdt_get_restart_reason(wdt, data);
> +	if (ret == -ENODEV) {
> +		if (readl(wdt_addr(wdt, WDT_STS)) & 1)
> +			wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +	} else if (ret) {
> +		return ret;
> +	}
>  
>  	/*
>  	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

