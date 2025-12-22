Return-Path: <linux-arm-msm+bounces-86227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3E7CD5D0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 12:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F39330358E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3EE319873;
	Mon, 22 Dec 2025 11:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyu/xtFB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TptO/QrL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CAD3148B9
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 11:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766403055; cv=none; b=NOve5AfxC9wGZz08bL2PBTVZj+1w5JhBYUBGt8Xej/wKKs2eNUXMDHCpY4xJGhx2w+QEdIy/0gSow4aqu7vgvuk7v8huoFAf7xvH4nXG+FIdPvKxFQKKvaUcGnpDKpNYgmwKjKi9DzUh2A89/pSQGwZ4W8YUnzgnfJfpTQevero=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766403055; c=relaxed/simple;
	bh=J+qGX9283XKPGj9VPHtYDwNAeHDm101bHLdCgphELnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cLZQDeuM1m7naL/zT03RHGOHBeFDBbuE1VE5wMaCfp3CEwDw1wahAfHHCGF9Ltf/2SemmsPgTOpfMBJpJ8Vi9SrjdUBxq1Mtzl8wG6cE3i95z2rU632Uy8KuiAwepS9uTLAX4JgtVjiamTmyt3ivBx+gJzYmXB29TsfDDEMHlnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyu/xtFB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TptO/QrL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8wL0J3962745
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 11:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/50mFVpl+vSF+YtHUv7DBjqqeMMgq2k9/krZo1nbuw=; b=jyu/xtFB+JJlfTXu
	4vpZW5c1EQCPir+DUOrBQkyBUcOXOaY8Ktf8qFev6Ypglghs5W64ayKq+SWu3NSk
	XTF5s5xdawCGco7jKRvA1bdCb9Lu7e3rlVD2Ybnku0k7PteQ4SWzEVr6xXAlCY8C
	UXvCR1vURd++cNXKtc/ojdROLggCvTphV7+Q4j9muOVLlocJgCyyJKX2Umg1w8SZ
	4EZSqxpF1t816xgWNgNHY5JSZVQls6EVbVT5p2DKrA1N4YQLd9butNQY6SYOfVNg
	V97aISE/05SRQypPNmV7shaU0zOYmZ7EKOguJOQp5Ih74GZiMeq21UYgSyAiJBrd
	rqK2NQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6hjfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 11:30:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed7591799eso93412401cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 03:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766403051; x=1767007851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l/50mFVpl+vSF+YtHUv7DBjqqeMMgq2k9/krZo1nbuw=;
        b=TptO/QrLY4gC4emiIYDMlNLClvNAVWTqFxbVFrnDGX3sLiibzzt0kmfrW94wjGAs6B
         sDUPlTvWRGB0Y5IHDz069QqJIRtO/ZchxLvD4vebNzHP8rofBWQ90UmM2wrMpiSBelzh
         4SaCXKdznHnPZjUoizPw22NaI7t+reeOamS4EVQeyep0y7zuZk0ovDON/rbGuDauwKzT
         IH0WgR57NQRuE6WJVD9wB9eq8nOWSVIn2haqPL8Yp09eBBxCXaWHDq8wOf5xs/rJgJa1
         nJo4BrCbBVDGZc0uJYxEahDBD1e5Uc4a6ycoaM0cy0KVFRwRK5tOGFLIRRXVfe3Mk39M
         O1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766403051; x=1767007851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/50mFVpl+vSF+YtHUv7DBjqqeMMgq2k9/krZo1nbuw=;
        b=OtyTGDdzWtFqiIrY/It+BmsCrz4jAtTQX39SYv5temJuEeTFdpiFK7pMeQbWuf86iT
         rg5exthR+Ca1FMlKGW3A9eaq3KJ1lEMwCxc8RbT2Bre/+rY/AIyp5pWx9Nx+WFsa4mrm
         aonOo+NTRqhIQa9F6+b2W5YipfXSFZd3+xuAK6gqZFi5AJUpzBeLySdHXjfG1/eVDiW5
         +P5gj7ITNAavg/aM9DOp0O9sJFP3+F0SIPfhpoWrekcg0O3sj3qBKCVLlFarPy11Qb+t
         4AWVqEC/rlRpcy6/C+Ajfbm92jS8uqD/TdqZ40BkqFPg3/knT/DZYoCgq9tBoZqJfC4z
         jVKw==
X-Forwarded-Encrypted: i=1; AJvYcCVm4zNV5fAtNTOs/b4YZ6x84ijRuTHVFYQwAXEtzqKHDvM4JnfoqtMqqbD4JBcIA1P3NNMNVYfAHoqosN7J@vger.kernel.org
X-Gm-Message-State: AOJu0YwEpf/o8W8I+845rVGjGsQXI7wesBKuZnhsyJJ4dTHRTMrixcN/
	49wUxWRKP3WSjrmmjwmJMHCl+7YRXX4172ASmYS48HEXDhZ231dt5YHMwyMAdCLVv4zRZlMEDFz
	3P+nAhLEuIxESaMcIZFb0bnT8Sp3QdcdMVKbSrfWHJamgfHXc4CSNOS0vlywzkXMkvr8XEkOpxy
	lg
X-Gm-Gg: AY/fxX7hg2brxcLaNsC6pQCvEDXh6HUSS4qM0NjQFq45K8sZbXQJfqllzqcRozz/kbD
	+Xqe9WaFD7pR4BvTcihjHM3zcQOX37KEKoz66EJwihpCd5y3/hihSwAZphFRNAzgx8YAAXEPu2n
	u0QXlWlhwqFC9jTQxpjLKpm1KxzD98B3In/YszCwZeAkCqc7wXWuibE3NvdS4Bn7WOROgS12YmH
	n+HdlAFhIUt8ZGuSQ5+on0nqLRbIl80tP17MIp+xZVWwTsV/68EdEQdC6gaT6a8T+/2/ll38Qa+
	2iLFgLlDa8ekvC6QSvSs0WBPI18ygbEOKRdPH673G93/ZL/9zl5zU+eTrL2J7LOsTMt+16ogwGk
	GmQmKHOU3lz9PGe5Sbn/gT6MG+w21DTPXfRuSnT/1ZvUHkZuAyyf1pZvubGmu0pTNEH/s6IREUg
	l+pv7FZYr0OEaP
X-Received: by 2002:ac8:4993:0:b0:4f4:bfc8:b7be with SMTP id d75a77b69052e-4f4bfc8b803mr79264141cf.12.1766403050487;
        Mon, 22 Dec 2025 03:30:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwPSEdGj2eB0wB84JQpAY0aD7J8Vf/6//zqzjefaPQdLMbLICsvYwAoThyUi0Lcjt/sdy05A==
X-Received: by 2002:ac8:4993:0:b0:4f4:bfc8:b7be with SMTP id d75a77b69052e-4f4bfc8b803mr79263841cf.12.1766403050050;
        Mon, 22 Dec 2025 03:30:50 -0800 (PST)
Received: from ?IPV6:2001:14ba:a073:af00::4c9? (2001-14ba-a073-af00--4c9.rev.dnainternet.fi. [2001:14ba:a073:af00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de366sm26808781fa.2.2025.12.22.03.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 03:30:49 -0800 (PST)
Message-ID: <748385b8-0764-4665-baae-5876be334a47@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 13:30:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: Add dts for Medion SPRCHRGD 14
 S1
To: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>,
        Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
        stephan.gerhold@linaro.org, wse@tuxedocomputers.com, cs@tuxedo.de
References: <20251204155212.230058-1-ggo@tuxedocomputers.com>
 <20251204155212.230058-6-ggo@tuxedocomputers.com>
 <b2ofd5pxifqhznqo25byc5jksneeasy2zlli5jpqezllj2ja4j@tscydfwesmk5>
 <3f52419a-2494-4852-96cd-dd5607e45760@tuxedocomputers.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <3f52419a-2494-4852-96cd-dd5607e45760@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BjzIryPYXZC4eGmsUff-2ZHM3XRS5rWG
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=69492bec cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=yDUiu3_GAAAA:8 a=tXVFJDDfIfXu0v-9UuwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
 a=gafEeHOdjwYkg5oUpzAY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEwNCBTYWx0ZWRfXxOWsvSbfJ/5V
 /dB/pF9f8e6IA3RFHC+Hzmi+bU0x/JcXkVB7kjtq8MP7p3IPd0UNXPLcev1r1yZFeYxzWDRPGzK
 4gJ6DECAd/iRvR2NqkoQ/RpcFLm28pS34uSrd/K7VO7Qo7Gjn3FwxX0phGRMLOij3+HFypbyoB8
 nolP3UYAFxFqu5Omp2dwRo107wyxoBgozsmDHshh42vJ+erJElUw6h5WUmGXWiJq7ofQKBBEIWC
 ogC9LQKmva83AxBoeuf56voF3mL3q7Gq4HVkCYk5/gcJxQgzYFJJDa7FetQezS+6+TMqey0aE53
 Zs7UWSSkDA18tQqsPihrlifD+I6riS2f5Qx0dHi8NDo4paW/Y/9LO/f8HqyZhN7ja0Vw0jXZXtV
 0kZDFypHFA/h0sdvdBQiEmlIxOC2zH8GM9PcwQJ0qJfKITVgK6IUn2kVukdye96HoJtzWDagbw8
 luBW2jyphlGc2j0028A==
X-Proofpoint-GUID: BjzIryPYXZC4eGmsUff-2ZHM3XRS5rWG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220104

On 22/12/2025 13:29, Georg Gottleuber wrote:
> 
> 
> Am 22.12.25 um 01:32 schrieb Dmitry Baryshkov:
>> On Thu, Dec 04, 2025 at 04:52:07PM +0100, Georg Gottleuber wrote:
>>> Initial support for the Medion SPRCHRGD 14 S1, which is based on the
>>> Qualcomm Snapdragon X Elite SoC (X1E78100).
>>>
>>> Working:
>>> * Touchpad
>>> * Keyboard
>>> * eDP
>>> * NVMe
>>> * USB Type-C port
>>> * USB-C DP altmode
>>> * HDMI-A port
>>> * WiFi
>>> * Bluetooth
>>> * GPU
>>> * Video decoding
>>> * USB Type-A
>>> * Audio, speakers, microphones
>>>          - 4x speakers.
>>>          - 2x dmic
>>>          - headset
>>> * Camera
>>> * Fingerprint reader
>>>
>>> Co-developed-by: Srinivas Kandagatla <srini@kernel.org>
>>> Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
>>> Co-developed-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>>> Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/Makefile             |    2 +
>>>   .../qcom/x1e80100-medion-sprchrgd-14-s1.dts   | 1515 +++++++++++++++++
>>>   2 files changed, 1517 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
>>
>>> +
>>> +&gpu {
>>> +	status = "okay";
>>> +
>>> +	zap-shader {
>>> +		firmware-name = "qcom/x1e80100/medion/qcdxkmsuc8380.mbn";
>>
>> Please use the `qcom/SoC/Vendor/Device` path for the firmware. In your
>> case it should be:
>>
>> 		firmware-name = "qcom/x1e80100/Medion/sprchrgd-14-s1/qcdxkmsuc8380.mbn";
>>
> 
> Ack, but this patch was applied 2025-12-18. I assume there is no way to
> change this before the merge into mainline, right?

I will send a fix later.

-- 
With best wishes
Dmitry

