Return-Path: <linux-arm-msm+bounces-98365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KcuC1FwumnRWQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:28:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F34C2B9069
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 453393056140
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D34737D11D;
	Wed, 18 Mar 2026 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/MK5drT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90451EA84
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826000; cv=none; b=nT5bz7drOzE8O7MQbuqp53v5WB1ICPJqD0SgEkCgcF/c6GIG7G0+vluyVxqgRLDCDjca+6FrF3y30p0QJjZDM+9MLCdwe9E0wIfKKx4VSIsGWusiX/Xi7x/ofBGFdK+E+7Isl9uhC0tWxHKfLmxLOPx7vL0Q0JbtGM1JNVUdaU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826000; c=relaxed/simple;
	bh=2Go0fubIUQbxAVrDjujXpKOsIBbuaNGG7k8nCSyotjg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qlj/4kPu8McvVhZVLTdHzC0+wnjTTZzJW/O2ET5jQWuyNmV8VtzscoqfCO2prIIuaiggpOK5Z+jJuTj0mv+IBOXk9I1zALJzcBgxSGYC98BO+o3uRt6WNSbk9JbghHA69J9dFNTv6QqePF9R8iJaEiK6+Gk6Gad3N4ma5W9h4+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e/MK5drT; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso6554689f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773825997; x=1774430797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlmGySGpfP86pFTHgt/qgyQF9vvsUA/8qdDSZS/3krM=;
        b=e/MK5drTOfGF4yrWVu4Q1GEWbDgWc8RmsHJNKnA5bHusrMuFcdPW3cSmwBPT/UU80a
         PXku1YSQIct3ox/mrgBNLhxDlNPQfxJt+0ySnG/89WQ/equYgf8X3Grgz7WrNJHk1jJP
         rhhHko5E+znfDGqsqsnaqxEwByjPc0Y2g5AVAIbIoAawpZ+jDLQrP0ldlehZ1lyp6fYm
         Wl4uIN2DLEfBpX+ZEAK8GCMNUMoCb0qvd/Yh/aXT6PidbIB05/eO4M/iZcod/4SN2vSF
         A4kk2yKN9uHyHqwoazAEXckuJ/G4O5bOSWwJqXGD6Gi+yyh/Lnl2fYnkYfafKz4dRYe2
         zDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773825997; x=1774430797;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlmGySGpfP86pFTHgt/qgyQF9vvsUA/8qdDSZS/3krM=;
        b=SsxS+cN+Zfm/d1CBUYF9JsIOKjfoFeOoqHXe78BHbi+5qI881jKNCrCq+GMJGDotkh
         QXwbRdD4VsFfvE8CvMU+c6oDERUzMsnS43G+o1fA+on6mDC+YlXN3cCHDRv/lzwNv3vC
         7zXC9VWQuASkNg3KANFpFHL0USzvzXl0iHtb7Rb6VF6xGpqdDKp0PZp47c2KAFfoO1iR
         s57inmKCitpIgwjUQ1Qnueysz8xgWhJQpLaD9VpPSij6oXtcMxhz5cEzfvWiE0sbturK
         CEox0M7bccW3DWNN9pgODTLwBOGNR7DBahpx7xzvOekgX8xukfZKIke6qbUaX4Tz+Trr
         6tYQ==
X-Gm-Message-State: AOJu0YxWS6mVUiadPtxr/VhnE5C6shrsZt8jDd2+F3cEEsmFVqnbbntL
	fK806/5SvX2iqbj8pZS8LFLb9RZ0+foZ6JETsDiK4ZI2pKQwltCa8xTXmRnc9zEL+og=
X-Gm-Gg: ATEYQzxLUSsJhU7rjthUBr9nRAZlYIqkDNz2TagXc8vvmCZ9SW2ePb5yILVKfVJx+mc
	uGINm+JU1rFgoB1283hsc9aFQJtRFyWSrfH80S0KYK741Muug68XcoDxJhiCKfGKx+jqDJxko7H
	zym0Zu+Jj4NZ1+E1CXOUGJsDZQ9CjHbq8WI7q7f8x3/G2/kzByrE3feIb5iSltIZF5zzcj9tbjg
	llqtKdJ1YRiaQf5jnfZqVGH3aYhowuB3i+13BnG73yAGzQ7+VHWg5LK5sldRN4FebQuO6XcS5KP
	XPcDDHY1ejCHcq7uQl2y5lebW6RikpdHtL93poJiR5HhsIiIvoU3wOkPAJ7bLJzucfCHlBf+J0w
	LKZ22p8kiFaoXHGFXw2ilmz5t6PK6mTNQ+z/3CpbzSZ5mWCxc2DkS/0DMbN88S1RhEFyC9kZJpz
	ZDdECOvrQ1YZqaB+lUQ/nc1ZxEDL09BpC+nqmgiNfQj6bFHHr4+3UgG0mEdhuxptQttSGd801u/
	L8qX4E=
X-Received: by 2002:a05:6000:4203:b0:43b:45f5:efc with SMTP id ffacd0b85a97d-43b527a4a9fmr4229623f8f.4.1773825996924;
        Wed, 18 Mar 2026 02:26:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ac75:790f:ef3c:2eb0? ([2a01:e0a:106d:1080:ac75:790f:ef3c:2eb0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518a3e3csm5821720f8f.35.2026.03.18.02.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:26:36 -0700 (PDT)
Message-ID: <85483caa-5e62-4c66-b3a9-23ff7fc16f98@linaro.org>
Date: Wed, 18 Mar 2026 10:26:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
 <20260316-x1e-camss-csi2-phy-dtsi-v2-10-859f3fa55790@linaro.org>
 <b8d00023-ebe1-4abe-82ef-c8dc20f333dc@linaro.org>
 <f5c0c9e0-78c4-4c54-be10-c252715c36dc@linaro.org>
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
In-Reply-To: <f5c0c9e0-78c4-4c54-be10-c252715c36dc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98365-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:replyto,linaro.org:mid,0.0.0.0:email,0.0.0.10:email];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 7F34C2B9069
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 12:46, Bryan O'Donoghue wrote:
> On 16/03/2026 08:28, Neil Armstrong wrote:
>>> +    ports {
>>> +        /*
>>> +         * port0 => csiphy0
>>> +         * port1 => csiphy1
>>> +         * port2 => csiphy2
>>> +         * port3 => csiphy4
>>> +         */
> 
> Hi.
> 
> Thanks for the review.
> 
> I think the above comment probably isn't making this very clear.
> 
> port0 => csiphy0 => msm_csiphy0 in the media-graph.
> 
>>> +        port@3 {
>>> +            camss_csiphy4_inep0: endpoint@0 {
>>> +                clock-lanes = <7>;
>>> +                data-lanes = <0 1>;
>>> +                remote-endpoint = <&ov02c10_ep>;
>>
>> This is quite wrong, with the PHY in a separate node, the lanes layout has nothing
>> to do in the "controller" ports since the sensor is connected to the the PHY which
>> configures the lanes functions.
>>
>> The PHY should be a media element in a port/endpoint chain to properly describe the
>> data flow from the sensor to the controller.
> 
> If I am reading your comment right, we are already defining the data-lanes where you've said they should be msm_csiphyX below port@X here maps to msm_csiphyX in the media graph.
> 
> So for example here is how we configure this before and after the changes in this series
> 
> media-ctl -v -d /dev/media0 -V '"ov08x40 '2-0036'":0[fmt:SGRBG10/3856x2416 field:none]'
> media-ctl -V '"msm_csiphy4":0[fmt:SGRBG10/3856x2416]'
> media-ctl -V '"msm_csid0":0[fmt:SGRBG10/3856x2416]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGRBG10/3856x2416]'
> media-ctl -l '"msm_csiphy4":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> media-ctl -d /dev/media0 -p

So a csiphy is a media element here, so why implement it as a PHY ? and there's a data link with CSID with should represented with a port/endpoint relationship...

> 
> Its a NOP change from user-space's perspective. CAMSS has historically used port@ to map to msm_csiphyX - taking logical elements and configuring pieces of the CSIPHY and CSID based on that mapping.
> 
> Other examples of this upstream:
> 
> /* Cadence CSI2RX */
> /* Sensor */
> camera@10 {
>      port {
>          csi2_cam0: endpoint {
>              remote-endpoint = <&csi2rx0_in_sensor>;
>              data-lanes = <1 2>;
>          };
>      };
> };
> 
> /* CSI bridge — NOT the PHY */
> &cdns_csi2rx0 {
>      phys = <&dphy0>;
>      port@0 {
>          csi2rx0_in_sensor: endpoint {
>              remote-endpoint = <&csi2_cam0>;
>              data-lanes = <1 2>;
>          };
>      };
> };

Yeah this is totally unrelated...

Neil

> 
> ---
> bod


