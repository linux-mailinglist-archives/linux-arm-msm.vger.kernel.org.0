Return-Path: <linux-arm-msm+bounces-90126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOFGG5/jcWk+MgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:45:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DBC635DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:45:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D7BA507C86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961CB3A4AD7;
	Thu, 22 Jan 2026 08:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="il12i+As"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C79F3033FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 08:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769071035; cv=none; b=a1SDMY9EKmAH3vD7hCFw4qh6ysl6de/JXsIoYWGCPOPbPpvDDJSqOzIIebA8iXFRCK5ZSvOvyL9rPYRHLPJrdn5jMZAzfdTKJqtjU+usC5JhneseKYhfSLhBpqhiOhAcDIPEz26EpSXlNU8Pl9I1VsMWw1tLk3d/iZfuIWbi9G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769071035; c=relaxed/simple;
	bh=DRWQURX4xe3xpUHR/D8tifxR9j1qAcJR6o5TzoMITBY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JMX+ljikyVWFC06H81idAvXrpn4jeyUqhXd0jyDtOLpQcCzdk5Bevph90E3ItmQlkKVVyzQf8QK26E+KyvSM9wxfqUmmLYUb9XaBXjtz4mFU2VUVzVAzx5bXUTC5/LIb2hJlBP188oon8asjem9HnurMCmekScDKx+VkyVyv0Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=il12i+As; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso3151625e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 00:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769071031; x=1769675831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WeTlA9/FhyRFOHKy3J+xjpu4T7QXgPNWbIqGL6cUEYk=;
        b=il12i+AsoSaOkfLYe1PWU9vz6mTYwuUg+a9TmDrNfv+yMaqH21joaGJuL5KJq3CFMt
         6nDYIm3UrC7vDAphQ91k3xaMiqWB3t4EXz1wJ3MW2D7+JQAqdqs1OOEEOBS+EG+3JWDV
         O5/RO6dGqoskWTHXe7wdTB6U0jJER1KRhF3F9mMir02g1Xo2LifKDbd/uVNDspjHsuWV
         Izn3AXaU9rU3TO2K5lJYtPtKfQgk/zhaInAcnwX8i7hbclYV0domPnt9t2vdq6XSRmzb
         wOgGxtJX+YlmY1phmh064XMnz7Ey50DCA/+eBmPvO4G9Afd+YzZwtgzpGJ988dZcu1x2
         /iWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769071031; x=1769675831;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeTlA9/FhyRFOHKy3J+xjpu4T7QXgPNWbIqGL6cUEYk=;
        b=lBZmbUAP1dLAg0zrNuYN1KBzgCZ94oRKgyZIsgm+ugFGRO5daXisCqoNpt85TzFcDa
         PT8D6hYhc+jTtDN1/aeAGy+qe5y3kz5mU5wsAMbf+4JwmNfjOfjhvZEfFzgy/xzKnOiH
         /xRhKdOup2jKsOeGMPf7v8UCG1eAWtxxRqoKVS3bB3r4CobvwP8IDaADwG4GvMl+s+6D
         OzcUblIgg6JVCeXk/K3FkwQmKAOb56NGIsaYZINbZ+9x6KxHxnKISoJ3bMAJ+EIiZJiM
         7K4jErAoqHN/1aW2DwgR8y5f9bqT3hA0TSB55QptQAhWyLWa+djy/GPrNNWsVMv+CmMJ
         G+dA==
X-Forwarded-Encrypted: i=1; AJvYcCV0w0lrmTDrJLW3rtBspBE7y+92emZslqxo8Pt5OrGyYey5/6tcLYaFAogrCc+aQcvPp36X4o0lcMxxel0r@vger.kernel.org
X-Gm-Message-State: AOJu0YzHNogRYk5ssjosy48hXSeOO/xVvUlSnNQxmV4PmX0duT3n8VTp
	/Jy2kehCMXdWVXRzZWBuwhI07devVQqyug/S3S0Ju5+dP/bcDzkq+gXhfjNHuXR91CU=
X-Gm-Gg: AZuq6aKHfBY1acdV1yqXow8h5fB8KFw1zj/+Ah+QIr9+t3R7o6OhYOecdEpMACct7lv
	qiMse107+/P698dYtW5Y0iOUmGe7hXIZJl6H/GS9METGKAjKr3CI+kBNyatSfT151RWetMrHhdP
	tpWvhg13ew60Tiiuh5f2xHwqOCyjkFYz4NmOgotgSMM2lBCuCbD+Q+rsNTtjZ9+qJS3DLMSSA9C
	Fkd2mvJBSqABgumZl/4TvG2FDMsMb84wTj2mGW3NBkf9yasHTVRQ+pD/K2QPTsPlcEB0R+51xM1
	J9U8BxT10rMKEK7WVuTXzkVuvdhqfpAYMnzTq07tOwVm0JrvclltKMhJ/jOzdtTXCJbtxQn/7XG
	AebtyJ32hWZaJBIU7Mo2+RjD6z7iNSHp84/c986FYyWK6DQ889zM3LuuDv0/IWsE5vWmRSPp4oM
	dFhbvcXU/eWlJ64ku2kx5kLpH5N1zc19G0j4HTpX7qpanWoCqrSKsA913IHlYHd6s=
X-Received: by 2002:a05:600c:450e:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-4801eac0721mr254012685e9.11.1769071030744;
        Thu, 22 Jan 2026 00:37:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9dc7:6955:8850:f258? ([2a01:e0a:3d9:2080:9dc7:6955:8850:f258])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804702fab2sm49350345e9.1.2026.01.22.00.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 00:37:10 -0800 (PST)
Message-ID: <577b8293-8bce-4344-bf0d-91fe261da3b2@linaro.org>
Date: Thu, 22 Jan 2026 09:37:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: document the Ayaneo Pocket S2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-2-bb3f95f1c085@linaro.org>
 <ith2qszksbrxnbnt66ytnzuje5id2iexzueuyjbftb7t6ijmnt@rgejkddzzqea>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <ith2qszksbrxnbnt66ytnzuje5id2iexzueuyjbftb7t6ijmnt@rgejkddzzqea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	TAGGED_FROM(0.00)[bounces-90126-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: D4DBC635DA
X-Rspamd-Action: no action

On 1/22/26 02:25, Dmitry Baryshkov wrote:
> On Wed, Jan 21, 2026 at 05:40:27PM +0100, Neil Armstrong wrote:
>> Document the Qualcomm SM8650 based Ayaneo Pocket S2 gaming console.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index d84bd3bca201..c6786dac5b59 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -1045,6 +1045,7 @@ properties:
>>                 - qcom,sm8650-hdk
>>                 - qcom,sm8650-mtp
>>                 - qcom,sm8650-qrd
>> +              - ayaneo,pocket-s2
> 
> Shouldn't the list be sorted?

Good catch,
Thx,
Neil

> 
>>             - const: qcom,sm8650
>>   
>>         - items:
>>
>> -- 
>> 2.34.1
>>
> 


