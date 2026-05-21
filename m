Return-Path: <linux-arm-msm+bounces-108934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLv/K0a5DmrBBgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:50:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEBD5A05D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97AFB304C2E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BC1202997;
	Thu, 21 May 2026 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lUXJkozi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9C5394E91
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349502; cv=none; b=C09Rdlp2+/SvrhmuAeJ9C3JmkvX4m2gXQkZXR657Jxa9HOVHwW8ZaVp+2iJ0e2E8WTxNtTUAJrnyiOROnhG2Fb3khMLxE4QSQEe1fm3iu9PomPPHcZ/CnXwbXE3xg4fFAyw0N9nbaYoXQyxodzfFC1mjTO8KwSfn4cDG0xqrcYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349502; c=relaxed/simple;
	bh=RPl5WYANuCknJSdFd2Pa4ywS8J0J0SidhWKNPmMZwAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tVuMJQaFwTUOUMf4+oCqD06SUV4zsjW2S1njXI0VWr22mtcFyV8pbCez7JY5repFkEsUPpIj/oB+P+O0/tqjymyXAMr5W8g7pF6krfaHbTMcrnReqbVIbBaYrdEWtpMsW03hreuw37/qe/A7RsE/9EGNLjxcSz2qqnQRzD3ZVA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lUXJkozi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488d2079582so55487285e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 00:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779349500; x=1779954300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHRSZ1dQ/OppMz1XaPvdHkTsf0qKVIFDibvJklHxKOo=;
        b=lUXJkoziQbvZrQjCkpPqdp0AtwqvTirGn/kn1znO74QW2nb2TcI/Tn0PRjGxXfC+RI
         6dPvSq+1kjC+vekvR5qajwVzr69vb7zbQq/2LDeFXyw9jDc8vEsfBN6f/IVzxKkTlp5U
         dpCRcCIPwG51BMRa1bFW1IX2andTR1N7NkL+G84j0MFpHJ3joQ29Di+mgv+0KE/OHy36
         I+wP6LAkOkLL/hYrtIrmFj+scltlwaAy0soxobrwJPa+SDma3Hh66IhMIRKQ76cDZIw/
         tSK5nrVVJynqVU5X1uwJau6gCNFD2XxFcn/cPVnHReKDB4od41nFb/+rUszvsoOJ/MDN
         8l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779349500; x=1779954300;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHRSZ1dQ/OppMz1XaPvdHkTsf0qKVIFDibvJklHxKOo=;
        b=gvc1jTz5ycyEis+n2EOsvAD5ZK2DMm66Z8Tp4Ufyo88T5nemVlHoD6QqrZwLmbJhkV
         o76ktxUwyhPAvOQseNMMAdY0EeitQHWGE23gbI382brAyizEIhAsW8NGZCnsiCYprIx/
         fFUZdyTWwon/XK84qJfXaWWL2hL4wWm8cvRisWkYbeerrEo2chbmsmm+edi0mVyWdft4
         0COU7c7yCAG0PKdLW585x8gttgKV+sv4yCkLEbUtaAcnCBHEd1MiPCCE6ZnLk4vS52uh
         IxFiC9MHbTYF9qH8sQcSLBczsmFsD2ESrVOWG6oJdJlbbyUmuHWfrUwp3wcqcx+GkYG2
         hS1Q==
X-Forwarded-Encrypted: i=1; AFNElJ83bGhL+/46lgQazMMeMo40V0RxBgEde6cSpzgEAPF2iSsacixAPvF7e0NqcDssgcOr9vzUE33wRLqAx5fY@vger.kernel.org
X-Gm-Message-State: AOJu0YzFhMcLmZSiHX6Ashs9yQO58p6ucl/p6Fz1ZnJ84QY8pYEazKLo
	eO/Y6zIjzzH4hWk9Kz7jcJgFIgoOme5VCL8GIM/FefKP1wH3oQp1urP6uhB2wX/Yg5E=
X-Gm-Gg: Acq92OEaTWW+CcceJMUea0TkCKrJilaYj5SxBX6xP/iF43XUaoLQqJPVH9rFqq27KZH
	Zxh/JRXvHkYSX7BXU6lq7EzpLaBhvMbZ8pH+3QWSMR7bIMQBwxLRwoiLgyZIj/vZieGQ7MZ7t+V
	GNxS95gwFXfsvr5UPDu7o3InezwuawKUB+L7oYdADFwd9V5S42K1TA5lJ2sPrKPJD1lyREKwewG
	sI9xqEKV0YFf35pW7zxNVU//YT7XFGyzprj5uacT0bB1eNGI/mQKRitFIP5cjJUzcv9/OwLgdMW
	tSBL/FS87HHAPKH6jk6l6d+Ik3TX+Za2pQxuaMuY/jQWmlOjxaZMGhxQHK/dyXyihEIPttKo4KC
	9lrzPyyGiTDh7+V1i56+q7J4s8mSsPjl6PhoIUG6m6Xs3Ef4t++GqqMWQgXEjfYHK7Fc6okTDLp
	DWwNM4uIKsK3U6vUV09JvqVdoREY8oRNzrnthXoDaj/nhzGAIXWlGzggDAhoKXoHt9IWxmYIhTM
	2H+bqs=
X-Received: by 2002:a05:6000:2883:b0:45e:742c:f195 with SMTP id ffacd0b85a97d-45ea38c0decmr2776799f8f.12.1779349499721;
        Thu, 21 May 2026 00:44:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e038:7e8a:7467:8c6c? ([2a01:e0a:106d:1080:e038:7e8a:7467:8c6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa92de72sm670351f8f.21.2026.05.21.00.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 00:44:59 -0700 (PDT)
Message-ID: <efede04f-b2e2-4fba-8247-f92eafa2b381@linaro.org>
Date: Thu, 21 May 2026 09:44:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260318-dsi-dsc-slice-per-pkt-v1-0-1bd66b7f9e0c@pm.me>
 <20260318-dsi-dsc-slice-per-pkt-v1-2-1bd66b7f9e0c@pm.me>
 <w74ctaczp3ty7wil2sfkztc6wvuppgpyff4tw4dze34irvfmlx@e5f36rzqmp6i>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <w74ctaczp3ty7wil2sfkztc6wvuppgpyff4tw4dze34irvfmlx@e5f36rzqmp6i>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-108934-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,marek.ca:email,linaro.org:replyto,linaro.org:mid,linaro.org:dkim];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 0AEBD5A05D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 10:39, Dmitry Baryshkov wrote:
> On Wed, Mar 18, 2026 at 07:33:03AM +0000, Alexander Koskovich wrote:
>> Some panels support multiple slice to be sent in a single DSC packet and
>> this feature is a must for specific panels, such as the JDI LPM026M648C.
>>
>> Use the MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT flag to derive slice_per_pkt
>> from slice_count, note that most panels are expected to just work with
>> just one slice per packet.
>>
>> This change was originally authored by Jonathan Marek:
>> https://lore.kernel.org/all/20231114174218.19765-3-jonathan@marek.ca
> 
> This is a wrong way to give attribution. Either please retain the author
> and Jonathan's SoB or use Co-developed-by and still Jonathan's SoB.

Please retain `Signed-off-by: Jonathan Marek <jonathan@marek.ca>` since the only
major difference with the original patch is moving the drm_mipi_dsi.h change to
another patch.

> 
> The patch looks good to me.
> 
>>
>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>>   1 file changed, 10 insertions(+), 15 deletions(-)
>>
> 


