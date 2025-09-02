Return-Path: <linux-arm-msm+bounces-71544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A53B3FBE4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A6BA3BBC1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 10:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24192EE61D;
	Tue,  2 Sep 2025 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XhwSZYx1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A682EDD75
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807857; cv=none; b=QbZtUkHFtQLITX12YY9urPoKK97B+mE/L1a0fxDqbtw8lpZu28mjVinVbPcgMwzhHlhUW22g4ChYYqPR6ie+ZVL9aWi+hjUiAMofW8DOj4iWGk6/9hJVTDvdxQWBZt9Rea8kw1OmzGQ5di4seCaid2vpFF59UBLBaBmgEv6me6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807857; c=relaxed/simple;
	bh=uQRbZpMZzS7UYewybYgEDAYd6OeeZC4wMAAbwE42GwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rO+iulO1KfHaVk9Vpo+Wgz9ebzkZYtWI9FO+sqDpsfry2fmYVJOZqsrs+Ocw6JcFfxmTEjyV5cr+mtRNbwfuaKsgh3GywzEoVD1J0Cp9mBbq/kb/7X9YoBIOXp13BP6kS8aODAWQa2A7BXbFNd2pevr8yRgckjgnLseqX41nALc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XhwSZYx1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RkqH020472
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 10:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	THYxMAXcq3NlTG1/1Gxwv/IFrQP4eSDyIsfIRZHUUKg=; b=XhwSZYx1QCW5reF6
	LbAAnpn1ls2qOpFm35u+EM53VOPIEx/4PSSm9TFFi3G4YRioKHDpDmA/DRpuXfjA
	K7y33/f9OvhcYb7/7pVednZgXTe0bZtDqTtSXFYpDLtyHXBwfdaRXzT4bicKRtPD
	3ln/yIOaawRA3iQHSjUF5ckXl0ALN+4i2GZNcxQl8Q1PToazSxA4Ve7TTtfzMlSM
	xJDJ+eazKfkM/nbSJ7HVkGpW3iyaeCgKEqfPYbaKswOYh/ZColeG9dw16Ln/MjQV
	QsopGXLxJWTvedAO6Ow+rOdmqTIHoMluNHGolD0K92515oDRQXfPZDWWBePv7HD/
	wjfvXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8ryfvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 10:10:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b32dfb5c6fso10687051cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 03:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807854; x=1757412654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THYxMAXcq3NlTG1/1Gxwv/IFrQP4eSDyIsfIRZHUUKg=;
        b=v0frsb2Zek0DEeykiRNzNQo7SmbDEHNOGpg+Bzv2LZyevaTT9O8B/lMYjN1blFyKqm
         H8H+0ntp2VhDUyI4LuPYruEijs0ThVgFfig/g78HG13u7ptWeVU9JawGIy/sFB8qTyyI
         L8fUGq6Rc9FOR12Lb5EpZKHxG41c3oXuzpyV3Cs93PCSbNyeDX3wnmIVtBdOHkQanXLf
         nDBO0gzaMAD4ONYKi/J59Z1WFpn/+cY39iMcWnIBvl3wjpnNFC/+sxtOZt2ar3FpmjYq
         e+w7sCnV4z9c+seOkMmoLKhg4/6n9FOIAPxzXpTAfFUZDkbRhE2S7idLa20TN4WFGTTe
         Hb1g==
X-Forwarded-Encrypted: i=1; AJvYcCVy1O6AyR2nMTFKoA7wntBvwCA08oku5MtwQVXQVw5iO6JrMlAe9oHMuV292aAzpEKSwF4eE6qNYtGDKpJ0@vger.kernel.org
X-Gm-Message-State: AOJu0YxoLymHaSPOJBmz6c+YbIrhbXvXwovzZdUevM3nquRjnpR9FXYG
	Ud0ny3e5NDgUflpZg4gsELZ2ajNZTIdR6H5uPDCJV+VDTxoNV0CPki7t7sJlLKNxN6JrcDuSSCm
	jWj5I5b7XMLsrALLTXkhTpWGMx9JaWxV6DgLzNXgVeox/iQnUpOf9gXzeNwPjvsgJfwQe
X-Gm-Gg: ASbGncsfDViH/6Y02bFLNHmkxzx29mBti2bXMavkGSJ8P5KxdMLL3LW0/AkZ0HfDwgx
	1OYxTs4Js/iT5VkHjaXcwpm8Q4hZoRTZczBc8wQckFCMbQoOIou2ejhRQ/DDVAsvTgFXbYr4ZkR
	zPWFo9XJiSFL9KQ5qoCpjWvyl7yFuVweqR1BG4yCl74+Oonntc9tr4ESBbtp94nUjohCsMHu6Is
	lCeo1dAzF9Q7rd+KUK5fiH3R7eYwsdPEdg0fehOksjsicCXmyMXxxsFWNyhEfGHZ2e0pWqjRZs2
	JdAGBj6EXxsjtjyinT2UqBX/7QyxZmHzPynaY6B6mWDHVOLCAIK4WKFhE1+5TAgxcsmJZHelzFy
	sJPa/pvJZPTYURxR/U1SzxA==
X-Received: by 2002:a05:6214:252f:b0:70d:fda9:8118 with SMTP id 6a1803df08f44-70fa1e37ac5mr90373136d6.3.1756807854234;
        Tue, 02 Sep 2025 03:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXA1MX+R32DY7z70Jxh6Fma+swPbMAM/TxTka9ZiM1Mii2YSXZKJfvdjD4E/i8Haz2dDeEoA==
X-Received: by 2002:a05:6214:252f:b0:70d:fda9:8118 with SMTP id 6a1803df08f44-70fa1e37ac5mr90372936d6.3.1756807853750;
        Tue, 02 Sep 2025 03:10:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7a8fsm9210260a12.3.2025.09.02.03.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 03:10:53 -0700 (PDT)
Message-ID: <f65d7789-198b-43d9-8d2f-eed87c32a984@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 12:10:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: common: Fix NULL vs IS_ERR() check in
 qcom_cc_icc_register()
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <aLaPwL2gFS85WsfD@stanley.mountain>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aLaPwL2gFS85WsfD@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX9PF6KC5/MYK3
 ZS8DPuhuiqxhqmRKOd15II4ZWvXcSS/dF2CqQfNGMzvaS+1y1zc5C5Wb+hXtEyPnNh/rRrLWN7d
 fN7Yfbyz9xbApOMPnMpEIeBiXGitPlJ/+TfCrmbRuhSE2bv+AeoTpmdMV2pZs08MRBwIvtKBLcD
 wyYeWXIiZrCgZGOEJtWYufiD7brx4GSTfZ5Vnq12kRVmLUf6ywoQbggUwTjVzXKUaTxjSSlFOmo
 XwR2KR5OLkWZ0aWLxFJK7LhmQ68AjknHwhIFWLNEwVPW0DVefDtoq+q26qBkqJukztSJOPPsVPQ
 muEajYiKTzJrNxYwpx9lgiP1NC8T3p6I9rIhjb/bVwwG8i5nsjOjMLKb0dttaGl3WnvLAh9aBND
 9UMrj/Q8
X-Proofpoint-GUID: JObnhH5goIaqH_1MOM7tUxx6a8oYKnjU
X-Proofpoint-ORIG-GUID: JObnhH5goIaqH_1MOM7tUxx6a8oYKnjU
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6c2af cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=8T--ygq334zCgzS6G-IA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On 9/2/25 8:33 AM, Dan Carpenter wrote:
> The devm_clk_hw_get_clk() function doesn't return NULL, it returns error
> pointers.  Update the checking to match.
> 
> Fixes: 8737ec830ee3 ("clk: qcom: common: Add interconnect clocks support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

