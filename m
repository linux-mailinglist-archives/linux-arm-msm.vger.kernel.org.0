Return-Path: <linux-arm-msm+bounces-71595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A18EB40087
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CF9C7A5C3A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAFC2F7459;
	Tue,  2 Sep 2025 12:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C/n3JY8d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD932EF675
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816178; cv=none; b=fRWy3eylksYR2EMOmDxUfv/udoeUN77wOJozC9b4ClIL4QlF5ejvhwYR2A877qssmKWJSFP5PfcA8or3T5OVcA9FZyCrGXMb+ty2riGAqUgTkisvvI3BY4VYkyuWhHNvR040PrCMXFcEDCLQUlVTLyDZUTndKtAbZhpaLZ+MOKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816178; c=relaxed/simple;
	bh=b57I0OXp26oEfOf/7p/hsldlstzVbYwY81eLcRB6a40=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tZArEdlof6NdHQjkPOei6NOjP5aWCaVDK1owxgk8iyS/5R1h/Rf/USSyFKPFw0HO901noDzb1yvtglqXpXwnhLO/b2FizV8SJ7FYGE6vmFw17/CJ+yVvhlF80m1nXPVx+KY5RLcht2ztxMqav+a05oT+AdSisrnWzjQiuMiGY14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C/n3JY8d; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3dad6252eacso241291f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756816175; x=1757420975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZrMGz19D43nUqFgTyxFJMNWsEoiEGhGU7kOoh8E0aU=;
        b=C/n3JY8d0R2IsJuTlaNhGnHeQ3IkxJMQFpegDgyUvvjmV78+x7u/1Pb75QCn+/lvgn
         txZF3+8Zs4hmhLMZWBeAWs/IjZTO1KgB+Y1eBmjT06Lw06DqeobCV4hsiOH0rjQxGvJD
         LzGBokBcdysCWW1PtYexd/iQrr5pknXqjm9DCAxuzuD1La2/qLIsHxeRaNV2ZPvBHI30
         urjscOMa7aIkUF7du7WvoPZeEdcbTYIcyumqc3wuZ290c+r+enky9hS+VVL5AyFYf1m7
         Lr2AMfPzeFBV8TXY5kXspzKJUGXit0h8Ktebw9NuXK05zNFtnRY7ti29Cd9yIaCorv8i
         ji2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756816175; x=1757420975;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1ZrMGz19D43nUqFgTyxFJMNWsEoiEGhGU7kOoh8E0aU=;
        b=jxNqf/CN4I8mjxpobpt72rSm+2SyIWpS6BnxuwaflCeYzkV49jdzcUE8RpXvSYltNI
         cjuuAUFob1d4TvruRgRrQYSEbushla0j3fwLEBdGqgTQIh4xban8Lpoi/5xTaPQXSKLi
         UH6wvNOZ7Ue9uxA+ZqHn2uxNz1fHsRCv0dlg6G9FleM0o6Hgw8xzgdegDroW5TZXyd6A
         kI2EJRC48NjnozEeK+/P9NTjMI1o5MaNuV/6PuPaO0f99Kb4fmr5Qlpwi+ZdHqQc9fpz
         vaPDo+unAEGRgZ9dEVvyhtAIutxB73g+DDhwKNs9QzhB2v+vpCxiRn6fpkPwaQLV0WA1
         QqNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV53rmnKwQxtgVlwuPxFVB/KGYJSjqVoHAfmFeeNCg1Y63gRiySkpqpQSCF+KDa6dDAJHGxCTqA7ioVHt/l@vger.kernel.org
X-Gm-Message-State: AOJu0YyQhk+RlDpMvWPKCj6ENGvyhb4iGWkr5T7i8CgvzI8rYLvrcYAn
	TXGhtMJdfo5OJXMwfUXXlKK0K6QWT1SZTfsLtxIY0IG/oejQUpyPuvBF9CCWNnBNDmY=
X-Gm-Gg: ASbGnct9r6PEsdBBwMtWqh+Zz9PxW7Gn511ulsXCHnTWM2t21/Ae3Tb1q/Izj8iqN8Z
	Yq3cJ1SGnUpN26TgBXy1FwVqn+RHV7vHPtjKeuei77e67yQNW+lLzDdEA2WpA0H0lM93RJqbMk5
	/OyKpx+FgOuKyKskMa8+4HKx+nG/8c1+QAqPlq1ialVBb6/LAnGgDMakfJH2e+1zRSzty58kvPD
	ulQ1RGR3E6y9Ag1cFoEU6SVY7BPiLiy9+avKeDyNQHPJ3GnSyfY9FKbWQavpo6vKzkpH3LUKfl2
	csYagUh3pkzrNU3jrYoYBI+Lef+4oy8IC/VamNRRl1xbNwcbi8TC6YBdHBkLgD8oDyoo9BblMns
	tgbtRGgsOs3bUHYSSr6tjaQ4GXtFwJPSdEHmUtReDoe25qvxkpsm0WcfWIWTuWLhu0LwQXEm/hm
	Y=
X-Google-Smtp-Source: AGHT+IE1b3znR8mhSVfN1o59ljoC/UoU3/SWyuUcMM/rQ1Xo7sYc7jTiyhzTL42RejqME3JwAEmmLg==
X-Received: by 2002:a5d:64c6:0:b0:3ce:f0a5:d586 with SMTP id ffacd0b85a97d-3d1dc5a2fe0mr7157423f8f.1.1756816174847;
        Tue, 02 Sep 2025 05:29:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939? ([2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33adf170sm21033678f8f.33.2025.09.02.05.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:29:34 -0700 (PDT)
Message-ID: <81b1e0b8-6a5b-4eb9-8f9d-fe9a52f0afcd@linaro.org>
Date: Tue, 2 Sep 2025 14:29:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document static lanes mapping
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
 <20250902-topic-x1e80100-hdmi-v2-3-f4ccf0ef79ab@linaro.org>
 <slgu2d4iv6ef76f43gvwaelcl5ymymsvhokyunalq7z3l2ht3j@t7pko4rtqvgm>
 <bf772209-2420-4794-a52a-1d5932146307@linaro.org>
 <tl4fskw6yq6rniwwqkrvnulfpgym3jswlt5bmulgquogv7xkct@6bl4boesilsw>
 <14f334fc-35de-4f21-8eb1-f6b41ac24704@linaro.org>
 <oel3t35pxegxaowcfjbrzrxvuw47p7pzcinz7kf2uj2ivcderv@efbttlqpwcc7>
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
In-Reply-To: <oel3t35pxegxaowcfjbrzrxvuw47p7pzcinz7kf2uj2ivcderv@efbttlqpwcc7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2025 14:22, Dmitry Baryshkov wrote:
> On Tue, Sep 02, 2025 at 12:05:45PM +0200, Neil Armstrong wrote:
>> On 02/09/2025 11:46, Dmitry Baryshkov wrote:

<snip>

>>
>> This is wrong, those are the internal connections to the controllers,
>> those are fixed. I'm speaking about the external lanes, but there's only
>> a single port.
>>
>> So, following your suggestion, we should use the Output port 0, but as it's
>> only a single port it would need to have 2 endpoints, one for USB3 and one for
>> DP.
>>
>> For example:
>>
>> \{
>> 	dp-connector {
>> 		compatible = "dp-connector";
>> 		type = "a";
>>
>> 		port {
>> 			dp_con: endpoint {
>> 				remote-endpoint = <&usb_1_ss2_qmpphy_dp_out>;
>> 			};
>> 		};
>> 	};
>>
>> 	usb-a-connector {
>> 		compatible = "usb-a-connector";
>>
>> 		ports {
>> 			#address-cells = <1>;
>> 			#size-cells = <0>;
>>
>> 			port@0 {
>> 				reg = <0>;
>>                       		usb_con_hs: endpoint {
>>                          		remote-endpoint = <&usb_1_ss2_dwc3_hs>;
>>                       		};
>>                   	};
>>
>>                   	port@1 {
>>                       		reg = <1>;
>>                      		usb_con_ss: endpoint {
>>                           		remote-endpoint = <&usb_1_ss2_qmpphy_usb3_out>;
>>                       		};
>>                   	};
>> 		};
>> 	};
>>
>> };
>>
>> &usb_1_ss2_dwc3_hs {
>> 	remote-endpoint = <&usb_1_ss2_dwc3_hs>;
>> };
>>
>> &usb_1_ss2_qmpphy {
>> 	/delete-property/ mode-switch;
>> 	/delete-property/ orientation-switch;
>>
>> 	ports {
>> 		
>> 		port@0{
>> 			#address-cells = <1>;
>> 			#size-cells = <0>;
>>
>> 			/delete-node/ endpoint;
>>
>> 			usb_1_ss2_qmpphy_usb3_out: endpoint@0 {
>> 				reg = <0>;
>> 				
>> 				remote-endpoint = <&usb_con_ss>;
>>
>> 				data-lanes = <1 2 0 0>;
>> 			};
>>
>> 			usb_1_ss2_qmpphy_dp_out: endpoint@1 {
>> 				reg = <1>;
>> 				
>> 				remote-endpoint = <&dp_con>;
>>
>> 				data-lanes = <0 0 1 2>;
>> 			};
>> 		};
>> 	};
>> };
>>
>> So the driver logic would need to look at the port0/endpoint0 and port0/endpoint1
>> data-lanes to figure out the mode.
>>
>> Is this what you were thinking ?
> 
> No, I was really thinking about the data-lanes in the PHY parts, so I
> was incorrect there (which is incrrect as you've pointed out).
> 
> The endpoints approach looks interesting though.
> 

Indeed this would accurately describe the data flow and lane mapping, but
I fear this would add a very complex logic in the driver.

Anyway I'll try to drop something.

Neil

