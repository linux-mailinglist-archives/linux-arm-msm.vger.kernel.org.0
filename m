Return-Path: <linux-arm-msm+bounces-69682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6B9B2BAD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 882C2564767
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 07:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291BE2848BE;
	Tue, 19 Aug 2025 07:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSTtg6xn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D78A264FB5
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 07:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755588783; cv=none; b=M4hljbcsmYcL48OI1X0Km7Nk58D65p5ZFuIv20PkUb1wd/rF34CR9Nx1VqWdgqaB6nVMfIASWsi1q5vvsBFxle4NHH/oTOLBTCUjJo1d2haMZevB1hsmbElA7ofRVt4pCdtJIUAmbeg+VOaQBJKKITgzTpRGshSWtLy1SvXDWn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755588783; c=relaxed/simple;
	bh=7LtQWvcQJhrI24KKihIlYQ+gpANvE9h2hMEGq8NEW+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YC6Leah5zpfVaQtuWnuMA9gY+iIC+k7rB5OZKtyJ71VFei1uSUpBW28pul9zAwLcRBpqL0s2uIYc2ADrCdmcO+Vebns6ydD4itBuJaKcxHZBAUaYm37W70wNTatSW1IvvNaEuEQvo6qOcQgGiDDaMJyhmssRzGBQTMARuaQKfF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSTtg6xn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57INtKDN002506
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 07:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZX4WHq0FHGuUzi7xR9JeLuPrT8yDI2/1ljZuVcjfQm8=; b=NSTtg6xnzXxYa0kH
	8N/Jl0r+Xq75clwMHnd5LFr21nLPlHJ4FJT+hTd3glAdegUGxZ2O2MJX33ZxZFWG
	fmn/JNLUW6Ef/jQ92sM0OIQoDVXYl53KDrGSRt90gKHKpNgapHOkSIvyFxJaGggt
	xbwVrs+h0ChA1wNj3feLRbsagfoIZKabNqFm4OD8yIuiTVcCOLh1Xz3UtRLLEssW
	KKcWbq2iJd/59RYhpz9qsZZOzR+s9cTgAuzmOFcfwnmFpKPOybM9Uci6eMRPK5sF
	BxUqa2RdOrQx/iBa4tY73Xyz9OpuFrqplXhwFMGCD51sl+8iY979EfvNmuvFPBZU
	0buA5A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m62vjkn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 07:33:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-323267b6c8eso11107831a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 00:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755588779; x=1756193579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX4WHq0FHGuUzi7xR9JeLuPrT8yDI2/1ljZuVcjfQm8=;
        b=TZVmxmqYwvlkSDLuabXoK6YnvrjSmzGv0oyy4Z6734CEPMDfn0fTH+CvwCVWklGxOD
         b4JQAJPVuAW7A/xFCctrh0C+iVprmT/5D8V7LbycQlglWwzYEkD3swyNC8YFXoKuGBFn
         N3zyKoM3DBr7MUbRB5VxrUYp45W5zhxJorPo6Nycq+TEp//9YGDpqYBBE37ld3/AWPXc
         UjVWlCqIKkA/Yd1uPOKi7Yjjw4kh3QLKnvSGKOhNoTiBE7xyPG1YxHkhBx+TcRvRkMgw
         CyUO54FaCgJhAJcjxOxucDkxKwjO9gAwI5Y4m7TY1ovqkv7Oknzx0IgtYMQlFhKqKar4
         e3rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoULa71jUHJZlOxTo2bKuEOqs/ir79TGTI9mi5u5CoWW3t5kxBrsHwOsp7d5/dlx8fcx6s7ZomeVkBJ8jC@vger.kernel.org
X-Gm-Message-State: AOJu0YzMr1yp9vO+PWxX3wLymg9g6s+ceFE1J49I+LNSHH+QN3Soqq6g
	PZ5qwuQvRvA6cWGGe4hFjyQ73yodK1/Cfp32nFOHowYniGNAzhJrgkCArO5Nv0xpTppkEK2UaWs
	XnMGLVTjsTcaqrogcTE8ZDEwAOXN9QM23h92LuKKtzC2q+XJtTxBsRi5GPFAsFvzVpP8F
X-Gm-Gg: ASbGncu50TCWN1VdiHigiqc1hsytGO3YT2xXCYB4geh4Xq19efVfYs9jP+nypdgXtjO
	racf4KMZtm+t4hwgbFjD+Zeh5D25L02vyz9CutgCrSIMDB6AsBQ1+9vgc3xra8mX+jW4a4vS60Y
	MIVajlwCyuoRI+FO059JZC67atbsdi7x3US3pVvGiT3FsTWgunWCr0/kJkY58jBeXjTiwI3+KK7
	um0sFTxq+IMefr99+ziUeF+omSBXowjAX4BLsjyYIbaAvcTSpNGqg7FHV9PP5UEHp08YPaeU9of
	UWKfHYN8yGUi/dovulSC5u+Wc1CdWjnJ8sFqKYafjW6Du9ZBeHsq59d22gy8IWvk9/ekrrKFcMK
	ZlaX+Tn7SKtHFTMmaATBYf5hjA8hsomkw
X-Received: by 2002:a17:90b:560b:b0:321:a2cf:9da9 with SMTP id 98e67ed59e1d1-32476a4fd20mr2605845a91.15.1755588779158;
        Tue, 19 Aug 2025 00:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhfH3UlxhiOYhnFv9vS+sUYiu5emcuumytoT8Wd2+lqdseeUtaxzogf3ZBo6T/gdJDJ/I08Q==
X-Received: by 2002:a17:90b:560b:b0:321:a2cf:9da9 with SMTP id 98e67ed59e1d1-32476a4fd20mr2605819a91.15.1755588778666;
        Tue, 19 Aug 2025 00:32:58 -0700 (PDT)
Received: from [10.133.33.73] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3c3063sm1988856a91.1.2025.08.19.00.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 00:32:58 -0700 (PDT)
Message-ID: <754f2025-11da-4747-a98a-74c992006946@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 15:32:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
 <20250815-itnoc-v1-3-62c8e4f7ad32@oss.qualcomm.com>
 <20250818143011.GB8071@e132581.arm.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20250818143011.GB8071@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDEzOSBTYWx0ZWRfX+hTDPnV8l5fa
 SKRpKzAcDC8v7zvyYdfwh0h0fsD+epP/CmQtmy1cud4D9mSnUVZbSkh2BhDENBLgrkumzKRwsGi
 lmE15NrlZ3G3cGw7Ch+NTzDp2Hq+JVIAMBqe4OWLbhNsmY9GDLft45wUwi4tCC0mAzjVVDrtewR
 85Bdhf+79W2AnU8Q01MyE+xVnHZi1LhO40IGKUD4z6yyKS4OgW5xs6oVIf2sth+a+mcAUdzO7xD
 K4jlKsZEOaTjTxXJQJ8K22zV/FhItm76qFZnwo651eimfJX0fYRSoA/pAaO2p4+ro6MhXMcnm/d
 LlyZR4O23lsUh4N3AypaCGazzOaZxeuFWy/AplK+0crI2Nx+ZUGeI1vbLb/ZnqMUVAUPMJ3Nx+Z
 EUw5zPUy
X-Proofpoint-GUID: FBZwplVaNFPUGwwEKryLkTObZrzKu5rw
X-Authority-Analysis: v=2.4 cv=A4tsP7WG c=1 sm=1 tr=0 ts=68a428ac cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Zm1HM0GOZpLsNU_EOA4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FBZwplVaNFPUGwwEKryLkTObZrzKu5rw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180139



On 8/18/2025 10:30 PM, Leo Yan wrote:
> On Fri, Aug 15, 2025 at 06:18:14AM -0700, Yuanfang Zhang wrote:
>> This patch adds runtime power management support for platform-based
>> CoreSight Interconnect TNOC (ITNOC) devices. It introduces suspend and
>> resume callbacks to manage the APB clock (`pclk`) during device runtime
>> transitions.
>>
>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>>  drivers/hwtracing/coresight/coresight-tnoc.c | 26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
>> index aa6f48d838c00d71eff22c18e34e00b93755fd82..f12a1698824bc678545319a3f482fd27e67a7352 100644
>> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
>> @@ -270,6 +270,31 @@ static void itnoc_remove(struct platform_device *pdev)
>>  	pm_runtime_disable(&pdev->dev);
>>  }
>>  
>> +#ifdef CONFIG_PM
>> +static int itnoc_runtime_suspend(struct device *dev)
>> +{
>> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +	clk_disable_unprepare(drvdata->pclk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int itnoc_runtime_resume(struct device *dev)
>> +{
>> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(drvdata->pclk);
>> +
>> +	return ret;
> 
> Here can be simplified:
> 
>     return clk_prepare_enable(drvdata->pclk);
> 
sure, will update.
>> +}
>> +#endif
>> +
>> +static const struct dev_pm_ops itnoc_dev_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
>> +};
>> +
>>  static const struct of_device_id itnoc_of_match[] = {
>>  	{ .compatible = "qcom,coresight-itnoc" },
>>  	{}
>> @@ -282,6 +307,7 @@ static struct platform_driver itnoc_driver = {
>>  	.driver = {
>>  		.name = "coresight-itnoc",
>>  		.of_match_table = itnoc_of_match,
>> +		.pm = &itnoc_dev_pm_ops,
>>  	},
>>  };
>>  
>>
>> -- 
>> 2.34.1
>>
>> _______________________________________________
>> CoreSight mailing list -- coresight@lists.linaro.org
>> To unsubscribe send an email to coresight-leave@lists.linaro.org


