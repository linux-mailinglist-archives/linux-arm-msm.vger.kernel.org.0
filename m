Return-Path: <linux-arm-msm+bounces-100726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JALDqNGymnn7AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:47:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB96358792
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9E11300B1B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9D020C490;
	Mon, 30 Mar 2026 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+Rhv2Ix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DW4mfkuQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711433ACA7A
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864013; cv=none; b=L3/P9+2ahLAyOY8t4bqNHfATt0XN+evDNFQgAtJVoeHC8sY8bV5XOA+2iVhuzDvYplrCsuaGPtK1DsaMj3ZRTvFmqYOM8/10Q9MzO5G3xfeVb/8JOdR+IlAyHsZmqb9FZ3d+GiL3w71wVBpENW0Ez59Q+hdxoKkj1mUBO/k/4xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864013; c=relaxed/simple;
	bh=xs34G7znFw67Yh3gCkVOLBmo/tdjsgdkHpHlus6HV1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nw7N1ZwM3GwLUoVX61uej/uElO70w41XwPZLJ5U5ZrhgvFWGEGww4eGg4SRn1l0UguA0UmwMyqMe/0zPph6vIwcJYGsn8ibrSD5CQ5Gr3sIJOJmSy9XnSG03r7mTd6kcA11nlaZRqDMUZA5DPHlAdL0axrw+a/DEUPiPr8FiBko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+Rhv2Ix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DW4mfkuQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7WOEK1427244
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8CWaXIOeFQ0RWw9uWV4g22gl2iDlz1fpndhsnQ8mBj8=; b=R+Rhv2IxvWE0E9Tn
	48JBIYbPLP0TS2CQ1kJfkFZwxJmO8sTDnIneTNSzj6y+RtDft31cP++mWYZWJjrR
	KNorVcX5Ecw3I2PCbZG1VJGTAST230BO3TkzXalSfYe0HtNsWtkqfGir8FbXH3MR
	OiIIF/90A4c9NgS6xJJZ3fD82FEaA9mBMHI7Ve0aWneO/CkkzuO+8In4NwEKg7UG
	H3RJu8vtxb15QYEvjMZ454xnmZoqIehzyOYJ1cPPhTYX/cPwk/iNWj4iI1kNgLCO
	dMs2Bg6DghdQSke7NZvSjOc/PUFUNtbUYtm88K1smAxEzoQwmIjxRc2Zgc6pAuYV
	coAs5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67715hm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:46:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb39de5c54so167361485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774864010; x=1775468810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8CWaXIOeFQ0RWw9uWV4g22gl2iDlz1fpndhsnQ8mBj8=;
        b=DW4mfkuQeqq1MF9VYNsVG5Yumh6j7ezkLhrfFKAnsxnA6GfaK6mdLw9UqT1IQqDetg
         gBAzBXcLsGgCm1IHBqjHzTNdgYX3Xw5Cynrxn05YZdAPa2DUtQbXe6+KMLsdVdfP6Q2/
         o7lvES4nwzJgDGO8ZljQck3iEuq4ddX//nLU+EDc9KAK1vfqUnbsnFLWkcy6PxUo9Ic5
         EVi6onbGozBsb69NOxfYSvm1sAjoCXPOFHIvyGJ+S7REz3xcuMrw4uHMPhFE0VNgITn+
         ZySDb11WCzMDgN2pRZlaE6n06z+wqq91a7qlxTBANfl/YnXt94fFq365bpMfLyM+yBTs
         Ei1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864010; x=1775468810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CWaXIOeFQ0RWw9uWV4g22gl2iDlz1fpndhsnQ8mBj8=;
        b=FdIblCCGjMQYDF/AwhfbcmVKySwnHxtTzRz1TYUa+c3RYWvn7q80cPBWM8bXV3lDB4
         +ZsnAPcq3I4C2A8YLHt0GHuk+shecvL73oj9OhMcBfOxs3RB38BnLAuGW38e+7shtAD1
         mpW4gHNBeotIAY9eItbRyQHaq23L4igue06IOomzB4RgmOpPWo4IIsWYIbS+rgdloHCm
         o5wN1cmuGu990RI7ijhMFKL87+oSyiEC+j00eJfMakl8KuClXBWtg8jKsF2aE/eBNcDk
         1NNBuVHWb4nmhH34ykudyEfiPec9NSODI6BqBwX5Ekzc/MV0TuJL0Dl0YYf88FfoIqYU
         pS/w==
X-Forwarded-Encrypted: i=1; AJvYcCWCBUn754gB7aS6xXgx/NsZoGHyc50aQGg7IX8OJr0qrrbG7b8cEbd5xihqt7poCWRtpR9rg5HO9Q0y0j0E@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb4untrnlv8faMkSN0xB4Ti0fdHfLjWkBZVZZc6Zws96qq+D6U
	wE3ykfmQfkSf+Y3FILjkYfGNEDGH8VROr/U6GOXgqxXlR02sFwNUoeRRH2JRlnC+JFfOqLeS0Ah
	94uWZqZvLGflDDpkCMOMpDityInSjxBp7v/gV0tqd38ThQjIp5slTwcUon67TbgxHDWsD
X-Gm-Gg: ATEYQzzheBUpJWXeeAz8oHZ2z68/waLJRqnLMfyn5/YacOhLCjLx/Rmbejf6yxWybCw
	5Vn6RiKhGgO0vLdA/arFfkcGkrKOgrIFfhTc13hIcIQ7b4SB5A0maVgtCbNKhnBmf9d7oD6qHLh
	zX8vzEkC2bZJ3KIIMnp568rr8eswbhVz3MsPIFL3SAUBTncXkCY9JVcq2jcW8hBR9ul43EjLcDv
	/fkCi/m2HTM7q4qrzbMK6MpXg2JjyZZpE3m7ddjRgeO0ggpxtkVq3/U+ydBgH5TqKTq0XGpJZZa
	9t5isFMYqDLF2xtAJPAZPgiELF3h1gOCGW91XUUGonW0b2yCfkMEBbXXvKBRUp5J+YrFNAjM1jw
	LB1U6+08Nt+KzRhM2AL1xkBTZi1qQRuyttSx8kynBYkB8tfv235VxxYgsJ1YjYEPE6l+rBHFp61
	D0J3k=
X-Received: by 2002:a05:620a:7109:b0:8cf:d441:c7c4 with SMTP id af79cd13be357-8d01c7f643cmr1077004885a.4.1774864010375;
        Mon, 30 Mar 2026 02:46:50 -0700 (PDT)
X-Received: by 2002:a05:620a:7109:b0:8cf:d441:c7c4 with SMTP id af79cd13be357-8d01c7f643cmr1077003085a.4.1774864009953;
        Mon, 30 Mar 2026 02:46:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7340cae2sm2493762a12.11.2026.03.30.02.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:46:48 -0700 (PDT)
Message-ID: <8ac10933-0bf4-450b-a7b6-59731dfe4cd6@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:46:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
 <CiKTMNVmEm3LXForJ4o-DjuXFxbKkiaLtqbFPYyA0rC-Ij0hJPmCw_LUixA-dZe2douOwy2Jxizna8qBRvUjPw==@protonmail.internalid>
 <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
 <556a6736-472d-4551-b5df-15e809e7e20e@kernel.org>
 <a44a0f58-11cd-4aa4-962f-a5b153e24d82@linaro.org>
 <vcj9b-49PycEnk8KeGcgXAaN09KfYZnW7g0LayiEPie9p-4krmMDfNO6Nx4DLgwoKHdKJughl7zoxvmKVkqOag==@protonmail.internalid>
 <qr6ubhjlzxenx7rswwkfu2nkc7ci5hw5tynpipa76bqsibbd3d@rw5d55vjnkbe>
 <0322e0b3-bce8-4415-90b2-d14445986e23@kernel.org>
 <r767islbwq2a3m6rf4wvl4hxzafdsw74jhev7jjz665kfymn56@vcn4p233n74f>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <r767islbwq2a3m6rf4wvl4hxzafdsw74jhev7jjz665kfymn56@vcn4p233n74f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q6uzt1tFXFKYh4_4O8qqkjzN2upFJO4_
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca468b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=1V8kSKjNecEwgvKTtA8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: q6uzt1tFXFKYh4_4O8qqkjzN2upFJO4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NiBTYWx0ZWRfX/3rMYLCYiqMo
 85zGGppQJ/2WwKOLxfc8ugwYXL905D6rTXfdt2ZeZCBNvuXgIxgUYAkH1kQO6P6QWGTn0E1Co7s
 l4IggDBfRIdQYmViBjD5irkVHzaQi64SPYYSwOKV4hoqpti5ciLc9KcTFh7cWB8Xptw1HIO1Z5m
 jThpiRbI3cxTnw3sq0/P8MIOBafUWUTGp4ND01z2ZttliH3zbUyTjihG/vevZ5slUXOpgCbm6nx
 mlg3lV/mmMTVzhr1FvTDA0jikX5VtU7TuPiMkco4NFMl7eEh6X1PBH6qS5cmi06xCj2U1SrY2No
 hV9mlZIV2aH3Ju8ABttaLcJO3JGlYvrcfx77gYFOn5BDd+0PzpAIxxMKQeGvMLauMcBUahpGs6K
 vn7HSuSsUeu9gR2/SgUGiNcGM8GG1DeDo8y+D06IbRNKTH3m/pmVOYYpO+65PsggxysD2lj37+y
 /NNU/Lihbp6cllMJVtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100726-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFB96358792
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/29/26 12:54 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 27, 2026 at 11:40:51PM +0000, Bryan O'Donoghue wrote:
>> On 27/03/2026 23:23, Dmitry Baryshkov wrote:
>>> On Sat, Mar 28, 2026 at 01:12:22AM +0200, Vladimir Zapolskiy wrote:
>>>> On 3/28/26 00:29, Bryan O'Donoghue wrote:
>>>>> On 27/03/2026 20:51, Dmitry Baryshkov wrote:
>>>>>>> That's just not true. If you read the camx source code you can see
>>>>>>> split/combo mode 2+1 1+1 data/clock mode requires special programming of the
>>>>>>> PHY to support.
>>>>>> This needs to be identified from the data-lanes / clock-lanes topology.
>>>>>> And once you do that, there would be (probably) no difference in the
>>>>>> hardware definition.
>>>>>>
>>>>>>
>>>>>> In other words, I'd also ask to drop this mode from the DT. This
>>>>>> infromation can and should be deduced from other, already-defined
>>>>>> properties.
>>>>>
>>>>> It still needs to be communicated to the PHY from the controller,
>>>>> however that is not a problem I am trying to solve now.
>>>>>
>>>>> If I can't get consensus for PHY_QCOM_CSI2_MODE_SPLIT_DPHY then so be it.
>>>>>
>>>>> I'll aim for DPHY only and we can come back to this topic when someone
>>>>> actually tries to enable it.
>>>>>
>>>>
>>>> DPHY may be the only supported phy type in the driver, it does not matter
>>>> at this point, however it's totally essential to cover the called by you
>>>> 'split mode' right from the beginning in the renewed device tree binding
>>>> descriptions of CAMSS IPs to progress further.
>>>
>>> Okay. How would we describe that there are two sensors connected to the
>>> single PHY anyway? How would it be described with the current bindings?
>>>
>>> --
>>> With best wishes
>>> Dmitry
>>
>> Assuming you add endpoints to the PHY i.e. that is what Neil appears to be
>> asking for and I personally am _fine_ with that, then it should just be
>>
>> port@0
>> port@1
>>
>> if port@1 exists, you know you are in split-phy mode.
>>
>> Its actually straight forward enough, really. To be clear though I can write
>> that yaml - the _most_ support I'm willing to put into the PHY code is to
>> detect the port@1 and say "nope not supported yet", since like CPHY its not.
> 
> SGTM. But let's define the schema for those usecases.

Let's perhaps also add a short example for both a single- and dual-sensor
cases in the YAML, even if there's no plans to support the latter
configuration now

Konrad

