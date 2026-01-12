Return-Path: <linux-arm-msm+bounces-88586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A0BD13A8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 16:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 87C0D30698B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 15:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C1E2E6CD0;
	Mon, 12 Jan 2026 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3F9IYhs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hu3TR2D+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8212E091B
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230818; cv=none; b=r0cik4E2n1btDjbsHALXK6OJeM6o3D9naJGx+qs5f5aUeRltNNVwvFJ7gqwKBzFr0msCwk/XVG11EVkdJ/0zthBu5HxoZjHO51h+FUGznELOlultzphcvhu6JfK9diM337TrhHHbY6nFx856S4GKhGYScb8j5Ts6ODTPC6ZjA9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230818; c=relaxed/simple;
	bh=0UWo+pLUC1yrtPmfL3/OOV7yzErSkMRxvOyC+KO1klk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZXkoFgoIjGhsMbveSEJVbMLHtVNjH2Xu6bw0MKgzJ36HDXk0YiTX+oD4luTvvGBv9Qia0S0kOWMFIT0XZDFNvN5mH0vXCk5nRcGp2RbwNxrLx5f/cEQHk9ZuKfF8LMiE7x+W6VUygzEZk1f9j9gO4XHfmi7GrRZwns/S2o04v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3F9IYhs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hu3TR2D+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8Fpx8263654
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 15:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zlf4x+4cK377f5G7eRgBQjOIGn5aPvmQf93PeiIWTvY=; b=I3F9IYhscz4AoCNp
	ujl3itPwoyrW4UKM0oZ4aKYU2rEf2RPxc4DAzzjq/FcfUonMrmlzyTGGkvWu4gUI
	mw0CzY3WT/4JtBvwFqNGO2ZBFEiE5cMtoen2tmIV7/mgLtkZ0UWq6oxEEZMqII3u
	y/S6SHdIqa0S3rWMlilhpcOSJNDLIoRTwvJ9KF04AmMmVsI+iQPgKZujfBW4leDN
	fz/bEw2TJ7TkVMMCM5rqRnbv7HDruFTlzXXLzip9znrHoOHIwHU5MzVWwNx1H+rS
	g5IdyAEF7Tp4e3UKYt84gztCRDZFo0IYVFEeT5Cqh7zfEe79QJFk17W1Zc3p1Lez
	hWqPnw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kyud50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 15:13:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso4540787a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768230815; x=1768835615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zlf4x+4cK377f5G7eRgBQjOIGn5aPvmQf93PeiIWTvY=;
        b=Hu3TR2D+pdK4qesld2zgqK7QlGj42uBQB49FrOp5pHr597pO11b+YZx94ZoWj3g9bI
         kKgO/mIcgYmksjAZK8z+YB8irbTMhxk0Ryd5lU4DuXieSeRITW0rbRCdJDHWKa33HHCe
         +PFZ5vZsv64Pk5gvduvSjLLAFS/9Die1zB1xqEgshxTDTq1MYFH5Dy8OcBpfMO+iXyET
         5jUr1+YvBVyY0WdlITxrm5gJcF9EgPvpfmlGOI7/8MlOVwElBz1esAkAxwK2Q0kBBDEd
         KGWbhkG2SL+0wht6B+SpOjdWmJ0SL5qH2yVduO5puKDaVNfV3BLiGS4C/QMj4dbq1frd
         oDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768230815; x=1768835615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zlf4x+4cK377f5G7eRgBQjOIGn5aPvmQf93PeiIWTvY=;
        b=TgIdVroQeu03Q7psu4Rkmr4k9cnGulFfBE604HQIJgJjU/eMAi/ogmxyKQ95MaXrkd
         Fcf+DP0faXrUoTyOwesnakKxZ1ChId87geYi3o2uCEv22TsAQCwzXvXJ9rzKhpH78Z7F
         iqm/d3/atno3HQLD/whJ1OC+J159JCZFwKUfG+YopVIS58amhpjh95zXworoBNcBsMWj
         fce4A2zf9BGVMmlG+04xhqMlJxSm5SYaALRiRz6C8s3eaoajVpQUxUMntvl7C7AN2435
         vbD4/v92radl32GqiRJzSWhOUpsBalRZNSx3mZTGv3ZSWXpRxrPB8+2S+Ble2CtZHes1
         WiCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfh1hkdVuTrzp2+CC5AX/4bqPq1WYLH+PpEpasPlC133vCjwMHQAmdKMzvz2eq/fYXevJjCPYJbwiHEBy8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyarr0Ih131Yo2czZCIkLXJDyYPHDKEGSHyBooyu7eIKnDwVEfS
	EewsqHSPMamRE07Qx6LY64cts5FmYntUZ9v6/v1PmlAVhVK2K58cRba17k6kNWKXhblTkpVSPpz
	jceYXgR/eIfY2z9e1GiNWdUQiYJW6f0FmqjxCy8zQfhB2gxPlIH8rI0WOFRBZj36r/3o1rLRzaA
	g6xPc=
X-Gm-Gg: AY/fxX7OVo03jubY6VcLlo9IUwY8MHjX31ZXP5Yj62f9rO5NEPHtiM1zOcARAdpPl5T
	/9Q2mWWtDQvhscg/KFZl5VafelQrdx+p+ABK2PQcYcmrATn74XXk6ia+Z3EUfLrDDi/lE1VTwbn
	MwKCKGtyGHV3D7OXfz0eY0m/ytIC1IdZlcBULhRoCY2UyDJ3r6phVmhp04dLDuBjkBdCvCYO/tr
	Z0x30ig6P/iptRRskatqoobNWPmCXc1o2Cc/tZzaExP1ViukXa8yXH0V20JHKLTHjxbmunnX3TB
	QWvO/Ssmj9uq8RE1+Uzut0G0Tbt8fOWJoHB2eXr1oduNBL3L8GiPIjCBkUefMW9yMENMUkFIuqI
	6WIbedccHS+K//DFtmcjwwg2Vj9e2bQsfGAm1NEjD2X534UYb7ZZ2RNtKDXmIs1hgz9IcJ0wWqc
	wtP/Q7fg==
X-Received: by 2002:a05:6a20:9184:b0:34f:2f38:cad9 with SMTP id adf61e73a8af0-3898f976c60mr17212394637.53.1768230814970;
        Mon, 12 Jan 2026 07:13:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfJH5SUXUYgmd3eLYdA/CQDvTSNjo1V2jeY8ZGHh7pUTFSY/VvKoE/69kaJLls3lKa7NrGfQ==
X-Received: by 2002:a05:6a20:9184:b0:34f:2f38:cad9 with SMTP id adf61e73a8af0-3898f976c60mr17212365637.53.1768230814454;
        Mon, 12 Jan 2026 07:13:34 -0800 (PST)
Received: from [10.133.33.212] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc05cd9d9sm18753753a12.16.2026.01.12.07.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 07:13:34 -0800 (PST)
Message-ID: <bd9d1ba1-c70f-4220-a055-e05b579d4e93@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 23:13:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/5] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com>
 <20260112-kaanapali-camss-v11-3-81e4f59a5d08@oss.qualcomm.com>
 <f574665b-48e9-4bb1-8c8c-95ff0f7449f7@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <f574665b-48e9-4bb1-8c8c-95ff0f7449f7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KbutNsiIiSwECBoZ9FWQgB3yUXipsFfV
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=69650fa0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=oOBApU8gXxxbBOQQ7SEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KbutNsiIiSwECBoZ9FWQgB3yUXipsFfV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDEyNCBTYWx0ZWRfX0WpQ4SXpcaAE
 TJz7dOy+q6b0YIFnyXHm4pVhE6SlJnsU5y/ryZXEeSj+OoWNS/CNTSO2VjB9E4g+qIk7W6Q9e3P
 KhXw+pdtXPsdyZ7rqW4V3lpNtRuskB8nB2AI7ppufKQjtxcxNG7yZYe6QnNUVBsIfvQWcTHlUB2
 1nQXHMcgL3FFvq/E+b7+xs3e3LQ1FEBm21VaxadEtv+PD40dbuzcC3rLNhsCGSrw1rYAukSJV7U
 mX0qo9uG8t5rZWyx1ka2XsQ19smK7xEoioLjrLUhngOmR9rG/Dm7egAVKLJpyMoUHBxzQ40Ynyt
 kzPya5RKuXHr0o9Pr4vsrc9HIxycjk1t2K199h403tyP9J61GnT6YJ3zSH0axE026LyOL1QGpHZ
 wcxXqw1YlRmmLY+c7iW+QwJFWENqHwYKQBe0BnhlK0kcsbtQyTmxEKJljkFV0hmYj8iB8COHGyP
 MN5KdngLFP/ye7ZHkAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120124

On 1/12/2026 8:07 PM, Bryan O'Donoghue wrote:
> On 12/01/2026 09:02, Hangxiang Ma wrote:
>> Add more detailed resource information for CSIPHY devices in the camss
>> driver along with the support for v2.4.0 in the 2 phase CSIPHY driver
>> that is responsible for the PHY lane register configuration, module
>> reset and interrupt handling.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
> 
> 
>> +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
>> +    /* CSIPHY0 */
>> +    {
>> +        .regulators = { "vdd-csiphy0-0p8", "vdd-csiphy0-1p2" },
> 
> Please sync up with Wenmeng's patch:
> 
> https://lore.kernel.org/linux-arm-msm/20251114082649.4240-1- 
> wenmeng.liu@oss.qualcomm.com/
> 
> ---
> bod
Ack. I'll rebase accordingly.

Best Regards,
Hangxiang

