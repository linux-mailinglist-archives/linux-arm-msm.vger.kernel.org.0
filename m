Return-Path: <linux-arm-msm+bounces-109139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMxmAGhMD2ptIgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 20:18:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAB05AAF09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 20:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 580A7304F201
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 18:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6E438E8BD;
	Thu, 21 May 2026 18:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="paVTgpuj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B99538D406
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 18:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386990; cv=none; b=bK5Lycs00JJTaxJDc1GBpulYtXLOZXs4qF+5bcfapmfd8lrpGwEf7jgWFEU4C7lN99NiZ4CqbPOGgT3qg2x4+lwS7E1p8ygYDae6B/X3SJV9xu6zaNQPp1mbcmHdxkomcDbAedTad+FT9c0GV81Fqbb9XNQyelbsYRlf9kg0oTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386990; c=relaxed/simple;
	bh=HdVBOJaLH9+tElXaI37rhEAG+8TDso2hBOAXn/S58h4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8qsT1ZeRdeJsbV+zbZqJ9vppxC4vzNAnyoJ4HoraQyAZqYQVIYbIdi+noAUkNVB58GB22RSxqdRJDPTAZLKZxjZ3QOZzBKNzOS6QitRKJLwbu+7gd1730X6rGtSfc0ov+tWOuM+sN8G/gNZBW9SZqtHN7IsphJwq9CiC/A7s5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=paVTgpuj; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso5463261f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779386987; x=1779991787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SwRKMllRpAzGBdyZ/lJigiiPKVoHGY8aJQFT7Qv+hEs=;
        b=paVTgpujiJq6kF8r5IUu8lHMH9JfuX21v0zOGY572qc4qTeg4RahNRlRrmu6SLihPQ
         /m/u1Heh3lNYmxq4k/FBeiNGz39FOv7FEae+pk/0VDsY9bw4QVJMelbBN0QbryMg4F9e
         rWCoJr5rQXk6JTBAkLKqcaVs6RNUh4Dg7XrWn3AVlVAViEJRtd4lZAIBOgiom3RscaSr
         YbyjbchpzfMFjUaYi/o2SBwlHQq1gCrWslZO1EbBKYNmtLrxWd2yssMPBAxrv/FoUen9
         tG6uhLWJhSXfwhqMfcXN1IHhBBaoILwE6z5lic77mVkVk7sXDSCf0nlM35LSt4pFjozl
         Q1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779386987; x=1779991787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwRKMllRpAzGBdyZ/lJigiiPKVoHGY8aJQFT7Qv+hEs=;
        b=Co7MXX8DLAE1cC1oQtIm3SYG1oa6dmpAPbwqdVdHnFgUBARn/cirzQP3ePiNMwcUDj
         l+8uVr44XP0R+lOPxfp8MAt/S3uhcu2SsyPHj51Ad+VWuxFekdNu0kNUANelin/dqX7f
         2Opda0DUqox48O2CntGp7i1mWVNmUwAKxhwWR31OWt/v/3F5Lw7qJyW2HOmSRjWgPEmb
         y/XqHlpDGqT2weSwI9N4wQHrbzA9FShLaCZ3LIQXUjJtTsHzDcFY0tjVuEkQvzoty9Ha
         hc+D5YUwq372bFixj9a9XiAX5vWc+Nf129MG9U47tmwMYoa4g3QPKOwIEN6PsyYONtzL
         Z0qQ==
X-Forwarded-Encrypted: i=1; AFNElJ8K6WO4ancnKlHozg27BXLj4d87KKtS10TlQybGF7jNdYbGH+Lg1djgyuA7GpRtpvS3rf/Pe7GqvK3z9Hl4@vger.kernel.org
X-Gm-Message-State: AOJu0YymMeeLkR2rQ90fPZNiMQxi+Uz4AIkW+/JNthUcx5+yOcAB+8lm
	eRiPNDcLYoJVWKe4vcnvrUB42OdH1abvdcnGv5na1YureZyoJbviAzA=
X-Gm-Gg: Acq92OHaH+3CZr6gnch/rSuqqAqZ3olbiXTKXdbxxIis/SMoh5BnLnADzB0uHaf7q/+
	4X2OtgUpcl4Do9wopg8ttPcsU9PJdAiu4Ckb7DcIXs3n1eqadLt0DPqGskygD2qE5MJYxt2/hoh
	t69MW7ZaztNhTyeZUa+GH9hr9veFR6Uiqls/3BdLH43IVxpHKOlapBKm1m51F5dBWWk8lpLMjS+
	+scqTXFed0KMCZQgQBEF3CCoAzKy6Qkt8BnYsPFu+V1p5578kONzcE51MiAoaVe8CVRYCbS1j8i
	dHET77tXmOUlCrrPlTZdlO8Wb9Zg8i0Bb//5yjZqn9PgTYWT6vVDcSnfdhdU7fikVUa/zV/47Iv
	NIItZvw8V4BYjCt0+nVg3L4yBow31+mkSMQspa6Ggog/Od1JjU3ULhXTcqJHCu2nTgmElxq7hQO
	PSmy6PXK5wJQQXEWwtOoDEym8gfEq0YY395NLRe+KSAEIS65v4m8m/1uMWPh1l60tLDnAPfjumP
	uKMp9stdxYSVygByhFlWkCbmdiXy1zrs1P4YXGC7ok8kJiCMuyWPPIRmtbs2B8WmSVZ0A==
X-Received: by 2002:a05:6000:40d9:b0:446:ef9a:8f41 with SMTP id ffacd0b85a97d-45ea3cea561mr6344829f8f.40.1779386987437;
        Thu, 21 May 2026 11:09:47 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa935898sm4632173f8f.28.2026.05.21.11.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 11:09:47 -0700 (PDT)
Message-ID: <ed3397c7-bd78-4236-96de-82dd75a96ae5@gmail.com>
Date: Thu, 21 May 2026 20:09:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] arm64: dts: qcom: sc8280xp-arcata: Enable the eDP
 display
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-3-9df52552bf87@gmail.com>
 <cd5a8576-2f06-4620-bbf3-43b3f84de630@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
In-Reply-To: <cd5a8576-2f06-4620-bbf3-43b3f84de630@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.07 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109139-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jeromedebretagne@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8EAB05AAF09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 10:50, Konrad Dybcio wrote:
> On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>
>> Add the vreg_edp_3p3, edp_reg_en and mdss0_dp3 nodes to enable the
>> Surface Pro 9 5G eDP-based LCD display (LG LP129WT232166).
>>
>> The enable GPIO 36 was found by decompiling AeoB dumps [1]:
> 
> I'd like you to strip this from the commit message, as it
> doesn't add much value and makes the git log unreasonably long

I thought it could be useful for other people doing device bring-up
in the future. No problem to strip this in v2, the info is in the
mailing list from now on anyway.

> otherwise this lgtm
Thank you,
Jérôme


