Return-Path: <linux-arm-msm+bounces-65300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2082FB07A11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40E074A2E39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9539F262FD7;
	Wed, 16 Jul 2025 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYEObN5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DC924293F
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752680294; cv=none; b=Nle9caEM1+/Z8nMADMFhGLNUPsgDHIEVwuD2+qeOQJ9gmGLOYDuLa5eS48QPkY2beyhjWE/tbVu9LUPoLsuTcY944dS1vKjOqWA0kpCx1+o7EzWFYKdFmOmwlwL7doXoYa3J0iPnXh4js9MmSbZZNktZss83oCRCR7UBDhvpHXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752680294; c=relaxed/simple;
	bh=l5P1z4ovdvHY0CSXjSyliAiwgCOTQV3QfxvxZAlEmC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bUvfaqb4+mxhkfdqBan4fy2hFlTcwz8u8J5k/amZ75jp3ffQ9Ay16vdkTKMI2fjT04GV/CKmDzjecPTnb9BS6isuaKtU82vp8MI6qFGIYXrv3lK9L95tKOcNx6BtxOBzmVCdOJsUt0FOPxRXJsBwX9nTR4sz3LIWrrlcT9NHs1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYEObN5A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GF8loS031594
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UkYAxaVWsTIpveHNj6bY5KPJ5ksQrOMHQ1BxM11VR2k=; b=JYEObN5AbIOLZ1g6
	BdmXvAIsMiPZR6Nxjin0dy8wyZcmVK3SJ7cBJsiw1cd/auknAA22hSrVSfVSKLIn
	xnoscOSbwdjmC2/+I4ZsFiSwEaALpobnv6DS67WXt0ab2RNv+4zuhKTohohv1UYC
	PoXA6tlCfiY1q12wo2JMh3yuwBtbaqsqOE21l67fh5fTJ36He/kSN0Q6siV5VkcX
	tNcBfzNSe+uQIWnt2n025vgsfmAKVVeLhmasVBF6UTwfetgCb0IaEd48/4POYKXB
	FRD4t0YCRJ/iFFCJXNigsp1uSEQzY7DaS1kmQE1PH0HsJn5i+v8FQt6MdScwS8aw
	vTbCAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drqgbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:38:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e348600cadso70483785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680291; x=1753285091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UkYAxaVWsTIpveHNj6bY5KPJ5ksQrOMHQ1BxM11VR2k=;
        b=WrkJqz0k10YqetDlHWNcTiOUxC4/OPfD8HqLGS0VQ7fNnL0iTq7ThnCx3eZpqwokxZ
         myDUY1oxhYpXSM59IJW5Eu6sz114MRQ1GVb9RrQqnmZSwY8xXzD822d3ONXGhjfClzmx
         fa+4XsvfcRtci7J8L05YYYtt/0njJo3DqgHnoaU/fDcB104CX+uC4wc3YiatT09uYc6i
         uUa9GZrmJ7Gion4KVA3Yn/rkB7iWxbuB9pq/sSV4TT9EgW52sSwvoQqsmRu6gpWqmZNG
         8poG0iS8GEWkxpbo1dJDVxt1CJBg9E5VRuTy79ELm8DuvrKMC92A5a1m4Ekct7ca1Cg4
         Wccw==
X-Forwarded-Encrypted: i=1; AJvYcCV0x+heQozOd1yfkPWbV0NVlrP2rDrkLytQ4RRke+rK/T8SUG3sUggdO/ACJMAF90ctG7BmnTbjjgZepvwi@vger.kernel.org
X-Gm-Message-State: AOJu0YwforVuap1vm28lDOJftYX03DXWbC9sAuFMMjtVe6BC0IKXSAZp
	JW2tfAHTG4p0TbpUILO3jKXIB5EUac6WlwmmQKR33qgxhm6ZE+/tgD2WYSK85Pxp5BlaERmZNbm
	utZ5ME4fAwiwj/c/1K0CQypFUpZ6DWfbMv9vzglb448WV2Eh+qREynU+m77cVy2F3Az1e
X-Gm-Gg: ASbGnctCZqVCv5pdHDHlgqIGxM/W85dW85JrVuTptV7HCfAIL6OsVU89lPCkXj3qL1u
	kYqsik4fTJV8FRd7tiYQ/oXnfkzSne40HHODP3HDMmVMoPVJlJFOGGrj4njmFIkWkUwDaqslEyu
	qxZIGAUusllIWmDw0dCRl92laC7TwPFY2g1KRg9/drD4YTkRCeKrkAQ5sWfLLas4FHG3DWuDjdH
	8gz2FcZTtPwAXBstmyvIWXYEWA5JBaL9HuVHoSaheMY6fbk173xJKrKQQAZQV6sZrf4LxNE67uw
	rLcD0DIFsOaEDYMM2ACb+NApSQ2jRENWm15dZiFDupkTUIa7oPwSizgd0QegOKNWb3k=
X-Received: by 2002:a05:620a:2845:b0:7e0:bd35:fd21 with SMTP id af79cd13be357-7e342ab1fbbmr515911085a.19.1752680290594;
        Wed, 16 Jul 2025 08:38:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOu3vav4ASfeHUT5qSQ3WEE71kptmN+XUWMWPqA/D78xEVSW3WpYohE6TsP7cV4WPYeMEFrw==
X-Received: by 2002:a05:620a:2845:b0:7e0:bd35:fd21 with SMTP id af79cd13be357-7e342ab1fbbmr515905185a.19.1752680290024;
        Wed, 16 Jul 2025 08:38:10 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d867sm18422684f8f.61.2025.07.16.08.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 08:38:09 -0700 (PDT)
Message-ID: <d25ace2a-4744-4c92-9c56-e630bab306d8@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 16:38:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ASoC: codecs: wcd939x: move to using dev_get_regmap
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org
References: <20250716123323.5831-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250716123323.5831-5-srinivas.kandagatla@oss.qualcomm.com>
 <9f4c750a-9e23-45a0-a761-4c3fc2c7d8c9@sirena.org.uk>
 <6de11c01-5b59-4222-9f4a-c951c74f0128@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <6de11c01-5b59-4222-9f4a-c951c74f0128@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hgtExQuahJytnUONFSBcBIvpFby42U14
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6877c764 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=_B8sJ2igTC3d7dtnB-UA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: hgtExQuahJytnUONFSBcBIvpFby42U14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE0MCBTYWx0ZWRfX5VooDiwPNFjQ
 0EXKNvwYNAdSeJdZ0/+qqZHrzJttT6y/fn1oIcAzfRXM7eBOwtxlEnmHFVePLNvK+R0dSAcmk/Y
 l/qllnq3/uhtHOhFvA9z/B27WKmNwMu2TkkG3mRDi3YQoyOuvtA/oAWN14dJx4gV9LeL3jPdgac
 INw9icMBQUSCXKI5k6vhlhSAE14Bp3q6n4h8jivL4ptIgNX5AcmM5RrkkI/BSSc0z38NwtA8kcc
 dDrRl+MEL2eDgPx0HgKYUxdexem8/AnNMczaJ6naltoSiPQlzbpe1eO2LISWEOFt+si2Ti9vzKY
 gQKBt6O2B5r/gujc/cHNDd+UGk8VTDCGg16T+WYgyNFEG4eesVCGj7Thdp6aL7SguX+yXHSioPn
 mXypn4fX0jFQkAhOsELV0Gv1fu56oxOD6/1lGbx9CdmK5ngP2/PNK7k8AyuDysA/Lc9pxrMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=735 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160140

On 7/16/25 3:36 PM, Srinivas Kandagatla wrote:
> On 7/16/25 3:31 PM, Mark Brown wrote:
>> On Wed, Jul 16, 2025 at 01:33:22PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
>>
>>> Ffor some reason we ended up with a boiler plate for dev_get_regmap in
>>> wcd939x codec and started exporting a symbol for this. Remove this
>>> redundant wrapper and direclty use dev_get_regmap from device pointer..
>>
>>> -struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd)
>>> -{
>>> -	if (wcd->regmap)
>>> -		return wcd->regmap;
>>> -
>>> -	return ERR_PTR(-EINVAL);
>>> -}
>>> -EXPORT_SYMBOL_GPL(wcd939x_swr_get_regmap);
>>
>>
>>>  	/* Get regmap from TX SoundWire device */
>>> -	wcd939x->regmap = wcd939x_swr_get_regmap(wcd939x->sdw_priv[AIF1_CAP]);
>>> -	if (IS_ERR(wcd939x->regmap)) {
>>> +	wcd939x->regmap = dev_get_regmap(wcd939x->txdev, NULL);
>>> +	if (!wcd939x->regmap) {
Infact this turned out to me much simpler and not even use
dev_get_regmap() by just doing a deref of sdw_priv

wcd939x->regmap = wcd939x->sdw_priv[AIF1_CAP]->regmap;

Will fix such instances in next spin.

--srini
>>
>> The existing code should be more efficient than dev_get_regmap(), the
>> latter does a devres_find() to look up the regmap while the above is
>> just a pointer dereference.  It's probably a marginal difference in the
>> context of probe() but there is a reason to do something more direct if
>> you can, dev_get_regmap() is mainly intended for generic APIs that get
> Thanks Mark, I did not realize that dev_get_regmap was devres search at
> the end, Will drop this patch and make something similar changes to
> other codecs too.
> 
> --srini
>> passed a struct device.
> 


