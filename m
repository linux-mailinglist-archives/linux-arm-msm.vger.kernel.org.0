Return-Path: <linux-arm-msm+bounces-109138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFKbG31LD2ptIgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 20:14:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AD65AAE42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 20:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32DF53015722
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 18:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513A5388E40;
	Thu, 21 May 2026 18:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6FN46RZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED397360ECF
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 18:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386689; cv=none; b=pdgngRa+ilrzIWj8E/ZoHY1aN4TbDku/wUf1d2ScR1zTQqrIEAyEDGwJLumX0EVMmFGQBr8WQb5KHdJgWQY9m3dH7SqNhP7F3wy9I/pqlBWZlRpj2xgeWGeC/8oC163gt8WBxQF2EwrKn7e2tv1z9vHwADUjQ4GYJrYsRYXTgj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386689; c=relaxed/simple;
	bh=+LRQsUGBCwVJ+vDWBObuNQvwZ3dtCcXP86Lyw5hOAnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9Ftx6XYrokVuL8oMR2CJ7wGhI6WFChdSCa49RhKZsQpQ7ODk5fVG3H61DDBGls7tjoNO97edxBUQjgF6sg7KjOqrEGK17OukNAvVDXNiaxrfXVl52lmHOxi6S54/sJIZFZ41tmNzlEKQ2JCcXEuzQnMR5/dS+kAzLtw58C2PEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6FN46RZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903974854dso9498975e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779386685; x=1779991485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0YT7TiQIY/LxcCw1ik30ZVCCkxlu7cirUrNio/yKO3s=;
        b=D6FN46RZ28Z3W+IbbVeRLATQt71/3t419IK0R6DLEUpSzRImEf1kASu4pKCAN27eDj
         gEZy9Fp2g73b3vXObE4uSatRgF4qKCp6pi8BjXz80AM9WYrhOx7aDip8QVrDdV94b7up
         FwKKcN00+/5hYHUWSteOaGawv2JBjAlYv0nLCgXZMVpcuuPX7CXACVhOb7fkynQFhM3O
         bGSHcAJHnvktnYqaOETrPeNDJJ+ON/4XW+ItFxQKuyT58vLDQ6INnQHEEzCUeINpwlFl
         QikRxPBJKdvt5/7qtF760EW5F7D5rK7NwDVQhCkABR8UBx8PYPoPTKBBi6ZP9QzSSytx
         ixSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779386685; x=1779991485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YT7TiQIY/LxcCw1ik30ZVCCkxlu7cirUrNio/yKO3s=;
        b=p/A4Hoyqj51YmuyTfyLqPRLHKsc0gy/9WmUYgq5wzzDy8HyIAw6mPRruZfDEqs7DvW
         Rif1fx03SFfay+lI+baN5XNXh3FR9ObUDb1qU+BpEaHdn7qMUPxucF98aD5QxsJY6AeY
         J3FrCoOgCl/ZcXboiwSpaPF02P9kvIOrct0WrGHFgjcyzIeFq6HjLmKWTpSChhWVmOmf
         XqqYjWgjGI+Ky9SdEG4wx2+1YQnu3UPmnI/taSaQ0eUMdjusaEroyE1K/SPf+heFr11d
         Xm1cbzojAUYFKvFSQetmgAp5wCao8h/3XgBeuGm6uWUjbIhN63Ytk0tYAB6rS0ZjZqZi
         /s5g==
X-Forwarded-Encrypted: i=1; AFNElJ9mI94gYeUM9pd33O80BUKwgYvPBb28iFZfJj/S1pF20Dl2HUK7I6gSZbCB7e0wpjNJmGl3Gm+ZWPbvx8/u@vger.kernel.org
X-Gm-Message-State: AOJu0YyLzthBRXNY0SGaFfqEmaur49pb40D84SEnVPrZia3yJr7cOhlT
	xS4QBgHJz+jIoUESVgWOcB7fAQwPk8qwfJ4Jbs2qgdMIZ000/nLbWTU=
X-Gm-Gg: Acq92OGzzB1LlIYRR0hEaUtRM3K5iJkmEtSBpshRL6db8/kwuggjV/QIfdMcscxRR9g
	ekGqtpSgty6AKZubcR54AMkl3JFRS8iL/GX2eyOfAxeqxzqD6M1r6C8U0jf1GgR1h+nXNY4s75X
	tANiJDgEO15yU0FPTFM3Ck9EXqQYXvGMf0kmh1nH6axPd9YqHBuV5kfn7z9XoNBl/+0WjVdPNq+
	yf5EWaMmOQO9LD4cnx48FrlRzfnFZ5GZB7ffR7FFdCi2T/hEMcZdVYPc+bHodhm2evzJM6qfkBN
	83dcl3aa1wliO97DeW/wz9++dj0Pb2YIxn5ZiZlEIu+Wg2R/kWl5RzhaeQ6mHwF7VHgS6iII3LL
	7EWWyJjJNGmAO0kBnBr8MZnX7qwPaNkjwLUh+6RhYZ63q+itazVUf4AMcMJ1F/cMG+fZFT9VesS
	BAuoFdglsPiqmUZJXlLzO2TkJxUG2Fn/U6CSW7NHLrxDTTBuLdla7vo7dEMn6aXUSth6OEi5AqE
	eocLKuVZtyMEsppDHqFgx2T6c/vvigNxfwdmdSL0V6JvRNl/O3HT5ieieH6+bE/5y9ztQ==
X-Received: by 2002:a05:600c:1c06:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-4903604823emr65479145e9.10.1779386684493;
        Thu, 21 May 2026 11:04:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903c9445d0sm45599865e9.0.2026.05.21.11.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 11:04:44 -0700 (PDT)
Message-ID: <8347b792-1c18-458e-9c2f-e34de156d78c@gmail.com>
Date: Thu, 21 May 2026 20:04:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] arm64: dts: qcom: sc8280xp-arcata: add USB-C
 orientation GPIOs
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
 <20260520-surface-sp9-5g-for-next-v1-4-9df52552bf87@gmail.com>
 <418efc2a-d7de-4c1d-98e1-634f08bc3a85@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
In-Reply-To: <418efc2a-d7de-4c1d-98e1-634f08bc3a85@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.10 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109138-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 12AD65AAE42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 10:52, Konrad Dybcio wrote:
> On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>
>> Define the USB-C orientation GPIOs so that the USB-C ports orientation
>> is known without having to resort to the alt mode notifications.
>>
>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>> ---
> 
> The commit message is slightly misleading - there is no orientation
> data otherwise

I will update it in v2.

Jérôme

