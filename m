Return-Path: <linux-arm-msm+bounces-97931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKfHMVbwt2mfXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:58:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FE6299089
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6647C301AAAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735002BE630;
	Mon, 16 Mar 2026 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U782mqmY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17140392831
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662269; cv=none; b=PYvWbz/W0EDxpLTMLcPVW/CCAY0Due454ZjUxtEdXQFJ+wfcdRsmYUvn4w+GgG1thwIU4SceCAukFOvhGoc9f7jYjT00fQ1uXPdAd+uqzTEpCe4bK5nAlS9pmRSrcI76ImluQUp0gSJYWnNtjafAQ0B5QiOvXKGVzwiOrQlPUZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662269; c=relaxed/simple;
	bh=nwj5GCIveUwQ3Fjk0FE5m6a282+tnjhshxs/LjAEP9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MzKU87DNngmAEd3WdsMICX2+ednFQ8D2QDKicM5NTTmU6g2Jj04pgBViREgo5EjkSZKLk3bT6e44Ltoj+B5rIdJCpYEERZOPC4fqgf5+FBU+YJEY+64edJfKwBSum9XL0j+OZESwWONaw0+Qj/tZb6NkikJ/g8jaSoElawKVANw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U782mqmY; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b97ba4c2be2so112996466b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773662266; x=1774267066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CU0DpWb+fPoZA0eMakov19NswTmRLnHMRP+UhQ330R8=;
        b=U782mqmY4VYZZvDs7h+/eIWc1TdTydXgSm4florjvpeQKipPxMs01Nv4i/HjSK1g+M
         oppbrWRmz9YF8NNbSSZ55fYTWlpvpt4RBROHMjfjWcIJ6LApnHAmtasqauy6cM4W2ef9
         k/dtoqtz84UQvYK6Ec4uub81JV70xDILYmDCwGoGl8fQ4ogLP1QIeFjQOojRYZhV7Eks
         NTiysTN+tr0fkX7tIecD80oTN6tkY4vH1F4dZ3zf+eXx1AtEUw8rOZhT56KgKXHEMCL+
         +SVPV92oj2qumnzi0vfMOi2neYPRboqAfMT3N1H1H9DOHRXZOdixg5iqicR8SUvasehZ
         GbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662266; x=1774267066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CU0DpWb+fPoZA0eMakov19NswTmRLnHMRP+UhQ330R8=;
        b=ExBsGsv24Wa+/vCRVH+Z5OxOn/1BwsEqIx5zI3X9q1Wp2hp6zI5yH9FIVXtIoiERk7
         9cvbgTU27zj2J8rZpgHS0tPkuWe9wD/ghxxEPKe/mBFFvaiZdSPK6/op23T/6q+XRc4V
         cMtmkdNl1VgDG5e5pY0dvnO2AkRFtJ8gQ6j9KKv/naP697Yx4oAmz7A8ni8CEmwc6CUD
         I0GjjxbwtgPTMRTO0aSCiOuWlQHNNJp6lsSkLVOJXlgCd30X8bzOHmYdh0LaiGMKzxGV
         F+WDhdzW5Wknn1iKBdgF+WyfX4+IjGZ052YkE8aSI5peWOB3hs+t4hbRuYCWvsGY1g1q
         w9oA==
X-Gm-Message-State: AOJu0YyvuqbnGt3xm37R2G260irXs9+m/JFZeo8s+SNV5l9wI1hotrgS
	JrV9+mOpIimMf6uv9fSX0RLqfGePiKGqrfsXwuCaGKu0Zk5M60+1+Tro
X-Gm-Gg: ATEYQzzd1GlWzpLUEGjhnp8GAjzTkCpqjo3uxQnaPTYWabxmMnHkXaibbmRjqpmM93W
	099wB85UdSRazqjBVmgU/ASi21pwnNK0TrliXqxIjimS3uPv/6U71XKLjmZUaxGrXZ/r5Uu5+OE
	6baHYiS/QSF8Myy3ZtJPReLSQ6yXRQOW9pKaegoLstIk7JYJ0SW7vAgTJALw7JgB2T9c89ZthvL
	IGBTc5nhlNrZL5yGx65M2J0ct0x/aiDQP/doqw7H4cZEIZDiyfDhy5mdEhkFglc/CGs9XD9EaVg
	zYiK+8RMyv8LvBoEh+CazrbWu/WDXu7Ut0Vd2VbhumIQNWpOmZXg5KsrXGZwpgp8NJ9uf5FJK6S
	tzWHD8Yb/sZCERcscPQFZQ0E7ePsnvq6NiaRXJfHXEOnAKQczBatTOweFB9TRgO6hmZXFZDyjI2
	x7cvno+LaroI44trUOKEb5BK4/yw==
X-Received: by 2002:a17:906:a14e:b0:b96:ed21:f47e with SMTP id a640c23a62f3a-b976506f1a1mr647340066b.25.1773662266092;
        Mon, 16 Mar 2026 04:57:46 -0700 (PDT)
Received: from [192.168.1.31] ([178.227.109.187])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d0c745asm527856066b.67.2026.03.16.04.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:57:45 -0700 (PDT)
Message-ID: <168615a6-615f-46cc-b126-4780fec34ecd@gmail.com>
Date: Mon, 16 Mar 2026 12:57:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Val Packett <val@packett.cool>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
References: <20260305093941.305122-1-zstaseg@gmail.com>
 <20260305093941.305122-3-zstaseg@gmail.com>
 <356110cc-699b-4a6d-973c-403d2e29630e@packett.cool>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <356110cc-699b-4a6d-973c-403d2e29630e@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-97931-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 64FE6299089
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 5:05 AM, Val Packett wrote:
> On 3/5/26 6:39 AM, Stanislav Zaikin wrote:
>
>> Xiaomi 12 Lite 5G is a handset released in 2022
>>
>> This commit has the following features working:
>> - Display (with simple fb)
>> - Touchscreen
>> - UFS
>> - Power and volume buttons
>> - Pinctrl
>> - RPM Regulators
>> - Remoteprocs - wifi, bluetooth
>> - USB (Device Mode)
>> […]
>> +        vreg_l7b_2p96: ldo7 {
>> +            regulator-name = "vreg_l7b_2p96";
>> +            /* Constrained for UFS VCC, at least until UFS driver 
>> scales voltage */
>> +            regulator-min-microvolt = <2952000>;
>> +            regulator-max-microvolt = <2952000>;
>> +            regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +        };
>> […]
>> +&ufs_mem_hc {
>> +    reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
>> +
>> +    vcc-supply = <&vreg_l7b_2p96>;
>> +    vcc-max-microamp = <800000>;
>> +    /*
>> +     * Technically l9b enables an eLDO (supplied by s1b) which then 
>> powers
>> +     * VCCQ2 of the UFS.
>> +     */
>> +    vccq-supply = <&vreg_l9b_1p2>;
>> +    vccq-max-microamp = <900000>;
>
> If this device has UFS 3.x flash, which it most likely does, the 
> copy-pasted eLDO comment does not apply.. and VCC range is 2.4V-2.7V, 
> 2.95 is overvoltage! 

Hello Val,

Thank you for the review.

Though you're right that this comment is a copy-paste, taoyao has ufs2. 
This is the explaining comment from the downstream sources:

> /*
> * Yupik target supports both UFS2.2 & UFS3.1, here
> * vccq2 is supplied via eLDO, and that is controlled via
> * L9B which supports a max voltage of 1.2V, but eLDO would
> * supply 1.8V. and same L9B acts as vccq voltage for UFS3.1
> * devices.
> * Here L9B can max support for 1.2V but UFS GKI driver code
> * votes for 1.8V, which is leading to failure from pmic
> * regulator.
> *
> * Now since vccq and control of eLDO are common that is L9B
> * we can use vccq vote as control of eLDO for vccq2.
> * Hence vccq entries shall be used for both type of UFS
> * devices only. And vccq entries should not be changed/removed
> * for any design alteration.
> */

So I thought it's better to keep a small comment regarding eLDO.

> If it's actually UFS 2 after all, it would be better to rename the 
> property to vccq2-supply.
Could you elaborate please? Do you mean l9b?


