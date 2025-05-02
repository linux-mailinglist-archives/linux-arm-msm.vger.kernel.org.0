Return-Path: <linux-arm-msm+bounces-56518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4B3AA746F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 16:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFA009E1337
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 14:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57311255F5E;
	Fri,  2 May 2025 14:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LrKit6BS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8585255F52
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 14:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194629; cv=none; b=tRs6Qbn384Oto+fl+ocI4JMAPfl7pKyQAPpPCKhysSdVbB/IHkHfkJB8Q7IvfF9+3ihZ4oPdBVmPDK6d/HBvwNo01nqiV4vNEJH04xyzZGd0lXM7cr7Rpql/itjm60M18Xq/QXkYPTAfu6WdWxgJOEhHB69Jj6TlPvxMotz6mog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194629; c=relaxed/simple;
	bh=LgutJA0lJhombQJ4lvFFMTu6PtaO4DwdRtdemX7aeNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=un3feqF2grFY2tJHYbyKtGzSPnl64Bqse5aFEoKXI1YKHIHRlOiHBFje/Td4KQvckI8Ayn5pvLJjh0vYlshp9AXgA4LWb7jW84VSCqY7N5SsgF2wBrj05X5lYJvR18Y/aOFXGoNig2HwQK23d0g3/L3S9l9nPNM7Thz7ReL+Ogw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrKit6BS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NHAc010367
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 14:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oyxo2SQbtPaQHibZb3IFvrcK2jBkjO/BXe2BArjhyn8=; b=LrKit6BSeqeNAM5x
	WqIgVeTVuQ2LaFnqwkgUpSW4qdyMZtvJ4L1EK4JBuf9iyUDpomGEfJwNNiXXMMUo
	TC9KL5JiwkfH5qMOXd2pJlNquscGbzLXy7GETkDwhNpbuES6Y7KhOZg18xOieepq
	URcUejLWwQbyhFwGkKk5v6TmihrdapI5KeCE84MI15ddUIa2WqMXKhziJ3XDO0MO
	qP/YnYCRITFrRl1BuYFcy91QiXf4sMhcz3+FKVpz6hIMDR+f0HN2asCqGwgwDkeW
	H1lll5AWPIni7i+e2MnPzfjBd+iklld8B1SymwqHo4DV/5E0GUjUm7tyy2qs7fC8
	sVJCcw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubrjb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 14:03:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so8432526d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 07:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746194626; x=1746799426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oyxo2SQbtPaQHibZb3IFvrcK2jBkjO/BXe2BArjhyn8=;
        b=e5fg6GkjBKJ6wz8UK+Hh/XTyIcV26CCFvSr/2RcXN7xBeS6NwapXJJyWp3c/VsUCdv
         jTY4sTbe5kUUN9b7xymRkvckfPjtFNIcQwQHXt9izoCSZc6YY8ATAK3x8L13doEd6us3
         F/8LM5si9blAcJfJ9y4DCwIFxvUuhu1KwdVTtHVZFjKBnLY5B+DJ4ZMnFrKSp9nLSYNh
         ijT+zkTuJAR9IQ99zF/uOUOru9i5nUOL8rOyuz7WI2xXZSdjy8fWF5ay4Hx8Nq4kdznI
         J+OOOh81KcpMyA/GrchfUOMKfsqErjCg+K7rfnDUZ7XPMkZ1durygGiYYcsVedrkv4iQ
         E9fA==
X-Gm-Message-State: AOJu0Yx4Dy0QWg4Os4eZ0kB1zppYinpwbEog5ospdQOEyt+GjsKXHn6k
	oLmHTE8EI2aTlK8bEnhyWnFyR8RV8Td5QvxzGHZrilz8OReWhJ+P94W9uo6tWW6unNaqB/kdB8Z
	GZWAidCcOhDQGmtSuxgGUUTXE2lvqFwbpWUrBZfyvJPyAVIxdrY3geLirU2KcEVJH
X-Gm-Gg: ASbGncuF2q5sHq0ZoHNXeoutohRPqxDuDE5zxFkXPJZujFPt/Tt3fTqYXjIFdPxbQGV
	EjS1eJMZObu9m4jZtFuzS3iA7MqMOn/Yu2ESnwvh/il9TvasokSrAUiY5j7RjRN+9Xunpp9FTXn
	ZM1w9aRAj2CynuTIw5W4ibAKJFiiMLTN0FQ/xtScRkVNfiVzpBfQkw12J4M9FKhZBLN1IvRdTpy
	pSM08il3S6ZOskN7U31NGIx+cVqT0TKmyG+iUJRVKfXB5w1xlTMq7bc8o4OOFGrYws8fraPlAKz
	4wvCXsDlC1OWep0ZofojeL7TdPmg4EWNxkLfEwCxM6rk9FJb1kwDW8sFHlJlcbVI5sk=
X-Received: by 2002:a05:620a:24ce:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7cad5b618bamr159159285a.7.1746194625476;
        Fri, 02 May 2025 07:03:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAZdoEcF4muK2lzyA+04Q12B61EG9ZfRedb/HviJ5YwpupYBOF8I/+YmpnDf2FCTkGY1aqPQ==
X-Received: by 2002:a05:620a:24ce:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7cad5b618bamr159156885a.7.1746194624883;
        Fri, 02 May 2025 07:03:44 -0700 (PDT)
Received: from [192.168.65.113] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0284sm53569066b.120.2025.05.02.07.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 07:03:44 -0700 (PDT)
Message-ID: <2036ef2f-c7ef-4f42-858d-8d95c430c21a@oss.qualcomm.com>
Date: Fri, 2 May 2025 16:03:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SxIC8i_g2csnRP06KyawBRJ3RUzuF37n
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=6814d0c2 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=nDYdJfLhOtoYANEz9-kA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDExMCBTYWx0ZWRfX1LUQ4t2vz1w3 TkDfcJGz7H2rC1eDVaC/ooCtPCt8ohFVkKIYhbblOkUMQpKgCAxNhP4TRIsydorrFNKn4QGbLJT X0e2HxqqX91N0mhsqozyfKmGzOGtsdKPV6ECsJ8PiTgKljNzPDIdkRW0DLDLpR2lJfjBvPuKTlg
 KPwGGWSnlaoDHk2Hpy9pUUgHP06jCJyC6f4JQeF497zTH9CkTbwHg4Qu5akbQfv6eVPxUxITVTg QI+nNOAVuI/yOWwXQYDzZUm6loI1fD0TKhPN+k2BrrTalCD8VCfRx/Nu+raKrY8/3QkOWIG0qAR 4zuRqNhsWWFNImUPNrRu/Zl1ceyK/mAI/t7/9E+9tYucsJZA/yP00cb7hKMm4AzjQQXRZnOO7DW
 EjxHmx0NAjTzLNvwUTbx/Mk44uP7031Mi6c4Mfnqzvz4gjym01lc9uUXxV2dcB4TbLGjNkGx
X-Proofpoint-ORIG-GUID: SxIC8i_g2csnRP06KyawBRJ3RUzuF37n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020110

On 5/2/25 3:17 PM, Kathiravan Thirumoorthy wrote:
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

[...]

> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
> +					const struct qcom_wdt_match_data *data)
> +{
> +	struct regmap *imem;
> +	unsigned int val;
> +	int ret;
> +
> +	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);

Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see e.g.
drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in x1e80100.dtsi

That way all platform specifics will live in the DT, requiring no
hardcode-y driver changes on similar platforms

Konrad

