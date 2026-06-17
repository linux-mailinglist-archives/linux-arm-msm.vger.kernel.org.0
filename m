Return-Path: <linux-arm-msm+bounces-113506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lVG9HRBTMmppygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 09:56:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD7F6974E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 09:56:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="CIYNIdc/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113506-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113506-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7611330098B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 07:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927903C6A2B;
	Wed, 17 Jun 2026 07:55:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485783C553A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 07:55:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781682956; cv=none; b=sYUlb+/lKsxixXGuMZI53Gfc5TGUnDwgDrsd24OCuaXsgyl7nhmMcICL7QUU/wJ0VV8nXo9I3XFQsr+Tcdry+K8U7gNTUJHFA3FaqxzuFREOq8oGv+dlupk/cIQiEy36Ahj2XaMZPsSQrgHaBP/xxJB/4oWO70zSEyRwBPOUwqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781682956; c=relaxed/simple;
	bh=DvRso/AOe3/Ackbv/gV5sQBWqnK8QzSsKJ4M2Q0oQKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTQME4Z110KYpVQViSm4mDJ4CIVEQb7JxD8T+mTroBpFCQ5B0ZLa+JN8jrw4I2kHqPiaB954iOwwarum6tCS02rX8hNYsoqXl/UWoxt5NPAfQ8OLLWxCmW9BFVLzJOe7AGfjjV665Tzpb0PhIW6zlORexXwfDJVgSHXvGM0Svw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIYNIdc/; arc=none smtp.client-ip=209.85.218.46
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bec449cf976so675663766b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 00:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781682949; x=1782287749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1v5FlOwlP3qv5NVsuERde6s+iLytWjSY6IwbQXfaxfI=;
        b=CIYNIdc/grYpIwkfVs4SAfHcZ1uEiJvUQGqNTRBBYZrXuLpkz9/Cli0iqMCmHCv7H5
         X1NrzEO4FulgqAkyco0GNA3cyiMtpfA4a5sWy1i+Ldp2OJsPx5NWJWQxb+U09Dez3viO
         6Dte8pVGantoPBldXWM+vfoQis9TmxMDpt8Ys6eh0g4fwagZHu5QOW8sCxBzwWryX2tj
         RFPnOJW5foZLG9ChOuPD8io0+ONRNhyTR1ExYfH5pV2nAASCqIzPnB4hV3hauyklalPN
         5w6qtLe1CJu/EbrCDe79crhjbvUJoSQECW6u/opRiioDH2hXmvYpZfIFofPjLFl63OF7
         fWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682949; x=1782287749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1v5FlOwlP3qv5NVsuERde6s+iLytWjSY6IwbQXfaxfI=;
        b=iPQhlaPbsxWXHQvBkwGLl5cLy1ox8G8epJyOJL+l1HdBoEInIknng/zz6aqXejSgB4
         UIKgEIX0Uv/30NHKjrHadU5AGRfLOfCBoG0jxpzOUfrJYYsg3IlvwHlYQAumfVO0AcP0
         1ftTkgbA0AD6EumwBm1dSxjzW4DW7psabhRq8Kd3O61swg7Os/O/kCOwUhWHiIa3bnDz
         Xvxfplf+x4JZr4hFbov/9jYcF8tnNW/YfkOF3vGi1Sx6kog664viejc0+V2tbHd/MeOx
         B8UYzmq6bELZMowvzwoz0L2pY+6iNTZbevQDQ3ROfDWw8Ru5h9yXEJZrWvFwv0LlSphD
         MRBg==
X-Gm-Message-State: AOJu0YyKQC5ls6BNJ3/5u5wVgRvLV53k09roM0ktxI7PWPHqe11dXIyT
	3n15AarGx01DEg/7nYQqMrEg3LINWCeEl3AnBd4u19Gv1+Fbb8xpjgdq
X-Gm-Gg: Acq92OESKaRjGYchJpM/21l2k4stRKmzTHtbaw9AkT8r4wCVSLg7zT/RLfokWIkPgiN
	5RuUlB4yn14zSXs8fuxrIiY919GGqE33CMcTAzSicwLge7occ3+gT8fnGS0XVMdMBDDaNbVTcbO
	g0gpGcoixiwie4W62zQX0eatpmGAgNw8IWtCAq0EAKMGGA2+AMTn4AD8JOTZnnIpXbBhoNHbGzX
	2GwtLOnYwom0ulqGNZwKSIhFbmlrHIQlgyZdg+O/hbFs+1xs13mwtCGwVBjVWMLd02M8VymitN9
	u9E+x/nx1JEHHtaWKygpWlozEFdjwfzhGu7Q9CTMQO4xUJMTUYKzeUpzfFD6aiEW7QJFmF6iU6G
	i8X6iXEBpUVokeGFzwH/VsKek1zo5NxrZrfPCsi/sMLEQ5LauZoRJAdP37gyOI5YdewYvJjNqHf
	nxbtJ9LMMaPkQTfClA7wMFZIjPBI69lzfJv3k3b2QTWJex+GE3XhlPe3jXOLnm
X-Received: by 2002:a17:906:2092:b0:c06:3267:4483 with SMTP id a640c23a62f3a-c0632674b69mr38913666b.36.1781682948974;
        Wed, 17 Jun 2026 00:55:48 -0700 (PDT)
Received: from [192.168.1.30] (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d9b7sm752527166b.41.2026.06.17.00.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:55:48 -0700 (PDT)
Message-ID: <3bc5c1f5-8994-48b7-a376-39afc7e429e4@gmail.com>
Date: Wed, 17 Jun 2026 09:55:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
References: <20260608143329.252033-1-zstaseg@gmail.com>
 <20260608143329.252033-3-zstaseg@gmail.com>
 <8b8fe93b-3df4-4dd4-acd6-3e87401071f9@oss.qualcomm.com>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <8b8fe93b-3df4-4dd4-acd6-3e87401071f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113506-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CD7F6974E7

On 6/16/26 12:01 PM, Konrad Dybcio wrote:
> On 6/8/26 4:33 PM, Stanislav Zaikin wrote:
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
>>
>> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
>> ---
> 
> [...]
> 
>> +&ipa {
>> +	firmware-name = "qcom/sm7325/xiaomi/taoyao/ipa_fws.mbn";
>> +
>> +	status = "okay";
>> +};
> 
>  From make dtbs_check:
> 
> qcom/sm7325-xiaomi-taoyao.dtb: ipa@1e40000 (qcom,sc7280-ipa): 'memory-region' is a required property
> 
> Please fix that (or disable IPA)
> 
> Otherwise:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Thank you for the review.

This patch depends on [0]. With [0] patch applied, dtbs_check passes w/o 
warnings.

[0] 
https://lore.kernel.org/all/20260517-ipa-loader-v1-6-3c3764c1b4a3@oss.qualcomm.com/

--
Best regards,
Stanislav


