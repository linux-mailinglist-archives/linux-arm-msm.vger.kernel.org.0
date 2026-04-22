Return-Path: <linux-arm-msm+bounces-104072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNUKHFym6GngOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:43:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA183444DC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB5533022F51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF943CCA16;
	Wed, 22 Apr 2026 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l331lwpE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sr1DjKyw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C673CC9F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776854616; cv=none; b=YqtGGHiudq2xUJ8zUErdH/ILGpu0GRii5CbQbw7gr2u/rjB75Ug6+bR7/CBFptQR/yrnLFa0gs7CO+Qq2ega5tf1+MMuNTgv/tvxqMssC9r5QS4VQ0QzaZbh5GZdHFRm9iqxjO27hxfc64spJQ+0dzxtX4uqJ0j2JCA9EP9K5vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776854616; c=relaxed/simple;
	bh=Vac8R/pnoXXWv/sp0RAq4RlOi6uIOf4fA0u1PWbPNOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDsKCC8SOZ44dd6BN4vIehAXfnxTWoDK5Kb1Mjn0QTbdnqFt+saF1VnUcbz/nZ1oGzviSiWq0flPTrs00jQyIOd+n1nbZMO4auQt6GXBeipeT4KsqIbBzRJ0fr+xn66E3DZNfA0lRTKACodyK7yl5COsPA9PBj/wu70akUb3XYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l331lwpE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sr1DjKyw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAdCkv2001071
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2COB/KfnyQdus17jKNLMja3RQe4vqA+L5nHYjjYpqiU=; b=l331lwpEa3QuVn80
	zTLqb7iN3ucCWjx+sPvKyZT8pQHQVQUo/rRJ97RMmYjv85FgCpI0slRkTjjkkCdz
	LxqP200GZfDnhQeD04LNR8I3+Jj0D0sLxjFUfPnW+BeMq+fCVMZQWA4J5+1NVTy3
	DQSgFsi+8MdJ/jJqyHuXsmYrcupTFuPX7H4INDbG2DLq9vPbUxOzoc58hIvrnvH1
	DS6YTqgNhzIXvrPVRuSdx/7hkl5GbnepPAf0M4d6RwlSO85G431BGpZ5mTO1h4uN
	bpRWwdH6yMk6wfin/BcbSglbhsrbwOnb5ljH4O37kqTA2viK+3CO3iQV5ZWiBlFY
	BoePbA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfb332-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:43:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b02ea0c595so10760346d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776854614; x=1777459414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2COB/KfnyQdus17jKNLMja3RQe4vqA+L5nHYjjYpqiU=;
        b=Sr1DjKywAFNLn15gEOC4FzDqJCninnYzp8AzP2WnpuYeDAHsU1jX6oRsDKvDxkp/lF
         ZKlq0M6Ox3szSce/fTRK1s/C/pR/4KssZZoL+Pp6jxXRSjl+wPZxbNBQ0OShTUf2u30P
         Et1zupql+rZhckGViXrfbaQzWNtLPsM/6VOgH9haNIG7sjCvZaw9wecWPUZniD6NR4VK
         0GzyaswbeXVGGvz6Kdsh/LFwxrf3GGAGRsyZyE/dDhzQlFrpOqoDZc+42AeH1iohKkyk
         9Yclo8SXVBMDlARGkDGmXTmdRuMN+HuZ2nUxZLv9lBptXCkBTMGI2b62qHy0vw4cJGQO
         Isgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776854614; x=1777459414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2COB/KfnyQdus17jKNLMja3RQe4vqA+L5nHYjjYpqiU=;
        b=igFTqhyZXY14zVvtJ/VhWfyEGrnCHzbbYY8n7/3RdZu/YU15Ob/NGB0iQlCGGJsn4g
         4tnmV3KkZPwfkFUpy+icwnfASLMS9HIoP2jUj5FZ+WTjTrWmfcrCdNhlDTUqAVPf+WWQ
         zgQ9azZHemMzM0gYxa3el5HV1zmsNA9r3r1bcEcP1928WtQ46bMamcMM3qSCY2H+ewF2
         n8hVOd4stZ68Bz/plxYvVaUn9rFm2ZGXf9QxxJSjsbRx+YYvmH6f5sABKjPNuacHQZ2b
         yj4lR5cwfd00K+4jd4qlKjEX3e9SQVZQsZS/5YkWG/5fM3l1IyE5Zcx6RWOR4955/ANy
         0v2g==
X-Gm-Message-State: AOJu0YwU4MoGcHX+d+AwVituSyDE2RVk7pPUFi2XnXKQOsSUkAeh+fU0
	Tb9LieuWfETezskZWkeUq1vGr8l/53uyRQegho7MPfmIJuMg10P3c98cvAn5DfLWpojjY6wLS4G
	cv7DjtgLBxcR9n3Tu9q7ZsGqF0cS0NND5J7QdH+dLXB2L+2IV+0Z0oPRtSxX2MQblaawp
X-Gm-Gg: AeBDievfyKK3pdXBu2/uCOlGi/8IoboObOsjxSW4WfVjLFpfbpK9KnFRxoBOUo1jQRK
	JIQHeXTTpM1gF4nMiIST7f9EBZIZ19RmiSGG/AGPI0IbHwBchPp1WXxo6ywXd9yJX/hUxhYWEAf
	ZhoKd+R7GFKWBMg54ej4TleB344iF1wtP8wN4tVqNSFigavIJKSWBs7AMoKOZZHwPX2ZTZDInlz
	Bfacs91Iwl67KVbj8ghAJHGkk/3c0pclIJEvqyWjrMfFJxB4YBFbRTxj9BLsUgI4ozMYuoCUV49
	6gkUTc+KmrgQAXuT6oB7NRcuTRgMhpCx25MFUAgyYhBNjISb+Vc41ikalJkiMh8o3lufQEXtem/
	/sj3yAJznLCZ8x294doMTJx1XSNcwUs3KouQCIo0pqNUV2jd8VA3BDziEgsTQUwPdA+aylepOia
	r+m3QD714qIUUiqw==
X-Received: by 2002:a05:6214:411a:b0:8ac:a91c:c9c with SMTP id 6a1803df08f44-8b0281fe001mr242061176d6.7.1776854614178;
        Wed, 22 Apr 2026 03:43:34 -0700 (PDT)
X-Received: by 2002:a05:6214:411a:b0:8ac:a91c:c9c with SMTP id 6a1803df08f44-8b0281fe001mr242061056d6.7.1776854613845;
        Wed, 22 Apr 2026 03:43:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdd2b8sm535272766b.25.2026.04.22.03.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:43:33 -0700 (PDT)
Message-ID: <3d50f17c-060a-4a1d-b539-1bea9b3e6cd0@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:43:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable retimer on USB0
 port
To: Prashanth K <prashanth.k@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org
References: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
 <6c2c5fd6-c032-4658-9a15-039c77074c4b@oss.qualcomm.com>
 <8cb5e28c-1c6e-450e-855b-32491ee73885@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8cb5e28c-1c6e-450e-855b-32491ee73885@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tjLuD8nFSg0DXAd3SgCdYhDKnb2yrAzn
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e8a657 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=wI2HHqrEW52EUbEo9zwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwMiBTYWx0ZWRfX/Y00JKiX3wVb
 B0upKNwYaeDh5ZHHFOcM1Er7K1p/7KCKnaRIZnXztAndCEKyk0oHUDgTNShCfaLlNrpbQzihmWX
 jxgkgnWBA13QCW6AV5Ga5c/snW99PGfDhMV8Ij0EolPWhoDoGQG4tJSym5VFuvKwt9+b1q6/F3a
 LxPOJL4eJpD+bcqMUNQdUxkNQt40ZUadp6lBc7cRYlFGaQuXKG3V2JyYHUGToQk2/02T6p5mPPM
 lBFN135wbmbtpL2O788mLpLk6wVCD0KQOgNObsX50MhhnkbUI5v/UZu+9+0JE389yeT84ix9/YY
 2zX9+VzGG4XGsWdr6K/alI9dcMSc53oH5p+5X9qXB4Ms80aiPQ5dj8gWGh5ZFQVxjjaRJ4YkVos
 ZAD0seqyfLjy6esV640lIOYjQXclMAe22F/JbgI19XYZZbKR6p7K8sgo8dpc3lQSXiAp197AL8g
 UTtcS6EnAsFdfE37Ffw==
X-Proofpoint-GUID: tjLuD8nFSg0DXAd3SgCdYhDKnb2yrAzn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220102
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104072-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.2:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA183444DC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 12:32 PM, Prashanth K wrote:
> 
> 
> On 4/22/2026 3:56 PM, Konrad Dybcio wrote:
>> On 4/22/26 11:39 AM, Prashanth K wrote:
>>> Add the retimer for usb_1_ss0 port (USB0), in order to enable
>>> super-speed enumeration on that port.
>>>
>>> Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
>>> Cc: stable@vger.kernel.org
>>
>> This is a feature addition, not a fix
>>
>> [...]
>>
> Sure.
>>> +		ports {
>>> +			#address-cells = <1>;
>>> +			#size-cells = <0>;
>>> +
>>> +			port@0 {
>>> +				reg = <0>;
>>> +
>>> +				retimer_ss0_ss_out: endpoint {
>>> +					remote-endpoint = <&pmic_glink_ss0_ss_in>;
>>> +				};
>>> +			};
>>> +
>>> +			port@1 {
>>> +				reg = <1>;
>>> +
>>> +				retimer_ss0_ss_in: endpoint {
>>> +					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
>>> +				};
>>> +			};
>>> +
>>
>> Stray \n, but you should really have a @2 port here as well.
>>
>> Konrad
> Can we ad port@2 and leave it empty?

Why would you? Just connect it to port2 of the connector under pmic-glink

Konrad

