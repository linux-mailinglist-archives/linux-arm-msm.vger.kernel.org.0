Return-Path: <linux-arm-msm+bounces-118747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ORqlEiHJVGrsSwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:16:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A849874A3DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:16:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FtySJ19h;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118747-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118747-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AA163003E81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5B0385D8D;
	Mon, 13 Jul 2026 11:14:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4B03845DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:14:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941290; cv=none; b=REynPWd5Ijwp4pUH0MU3cQ/gyp83M68fqy0KmDYkpr1B26JU90Cnv1M3AG2kbxwz+jvbrAjocvseHJqXu8yIcbnUh2oNXK0isjxyl0A/sf1PkzBuPqkBH1UKjkPkThG9faI4yynCuCCOFSJwhTtuvBSk0sH9LSM4crL9ykBVQd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941290; c=relaxed/simple;
	bh=zAetDQromy2N8RZpHM74SaWCREepLFBCH0p5HhPOOoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otpgFUyHvJ+1bn7hRGI6iXruVxZwJIjZisbwcqa4lH2Bek7XMAWDzSzLeFZXt7mVqxS5AAmKFqP9Ln2nruSymrVLZRyT+8AqydC5eOuNLYVCUYWwSICuiN7BwObvl+RooRjuxWqmtldNaHjHhIe86YUA9CsO7SrPAls5AhKE1n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtySJ19h; arc=none smtp.client-ip=209.85.210.181
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8486ac3f347so3431214b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783941289; x=1784546089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qy05wQX9tQW4cKDrF9CYFi6hXbTRcwSo4hY7x3uhFf0=;
        b=FtySJ19hZBI4tdywwYcBsPGpfz42JiVbkyBy+NR+1n7oqF7m+Y2Lt0KepaaXjLa2oX
         rePVoB7fqJjPFiXfq1kbi39ELlEpOXmjk1E8E0sMGk+6eThEwxnFNLl+XczNX8gsDwTh
         LT21FaGS+HfUuQ/MSLk6OoZnirWwgULqiee/LVE65T7OQJSEsYD+JPh/pZueL8Dvl6Bq
         GqzPr+9afm0t9DUyLp2xm9RYnFLj6NpMfOsnPzwePReehcHfsTY+XBAQjIOQw7053+l1
         8QXJkLXSHFQm+T8fRnnpg3w0tA0BNx4M1nTJxSRGBVfsWaIy0gjnjvqq7l3wrFZoKLpq
         9aYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783941289; x=1784546089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qy05wQX9tQW4cKDrF9CYFi6hXbTRcwSo4hY7x3uhFf0=;
        b=XkBTvQLMg6YOE6TO+QBw3rGaAHmgHstkE0dCsQayERmtrUGwnZkmS/HzvjQS+8+wjV
         twwVMb3F2P7iXD0kL5gver2d3EzXpCFeIFuuot3Pd2O6CB6uH7tAEPZ8HuX2dvvAEhLF
         Du2tyy+psfebWYyoWXOaRKF+kG7/irN4QmvGxrKcncI+BpViUZN+XbWFRIsn6O49Bkkv
         ijpEycr/zPMvMTg/LEv+tCJQ4DGSgh/53h9uketI/NuMPOFlsMtF9jwzhfHYYoBBp+3n
         qvGqGZoLeEFPZVCpqhVS61+nh5wbRdQbWv+h5n7oX0nduzyS+RwPDd2nPTdT3vFL2alv
         z8zw==
X-Forwarded-Encrypted: i=1; AHgh+RozBKLEy5CO8iZSzRD9djpU329cVrQ3F7iYWYOCQwFM+Ts/HHUws/CCILhHXp4h8OZip0GL78Tt6t+J6T+R@vger.kernel.org
X-Gm-Message-State: AOJu0YzT6zPuv6aFjWf7OV3+JIg+qwnRCJps2ZujNTdGhvCZRQcF7gjG
	f6zEH+deo4ySbLUlw2mncVrFL3KMGA6TS5Er3vFcqDoPnGzRiJ2UC2L9
X-Gm-Gg: AfdE7cmdtAvANRRl7sZVxeE4Rpd2QJ9jQ39KSoUlqmKtg4RPR10FRF/RDj5KPdQa98Z
	qPpq0+8c62JDKrn9s4FuNBiO19HH5ae98vFTiIySl5b2Acgk4HpWdW71+6alH2C+34r/ssO+VdC
	Rm1VZxekolwx9LibZkkiGCHg0Qk61jSAfxe9oP41YHX9f4+ymSklGWYVgQRB2t9fNCTD1cYjCV9
	Fu5HlsptcpdxdbrBWunMY1bmclizzorezOSGpUryAyTSygkjXCfNGNeVvqEFLTz0H32TiS0Kcui
	qMYXqStfI+JOuRdulU/KPnWTzpXcuCDe8GxtZgwzYXxvq3VyG/AKqzoWvY9v1w6gDwYeb1hWXgg
	9c30angdTQ+afBAqvppc+PswxltzU96GtxkJcYta6nju/lM4QI7mGB++CjG78Gt5un4Qy0Tm5Z0
	JY4LDBumiYDiCYpDPw2p+vVL2lmd1rE1IdmJ38kWcFN08eY70NT2LSHM1Sps6xHY7iA1M=
X-Received: by 2002:a05:6a20:cf85:b0:3c0:b598:4983 with SMTP id adf61e73a8af0-3c0f0bc744dmr14145797637.30.1783941288539;
        Mon, 13 Jul 2026 04:14:48 -0700 (PDT)
Received: from [192.168.68.63] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm27749509c88.6.2026.07.13.04.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 04:14:48 -0700 (PDT)
Message-ID: <fe802ea0-fa1d-415c-bc9c-1f534e9df26a@gmail.com>
Date: Mon, 13 Jul 2026 04:14:47 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: opp: Allow optional -vN suffix in
 opp-microvolt property name
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Ilia Lin <ilia.lin@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260527-expressatt_cpufreq-v2-0-b9b7726ccb6d@gmail.com>
 <20260527-expressatt_cpufreq-v2-1-b9b7726ccb6d@gmail.com>
 <wwzqpnkhdepkgl6bdmcuwep7v5m4rb6h3vfdbqmphxvmw4ao2m@efgv7wvm6cty>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <wwzqpnkhdepkgl6bdmcuwep7v5m4rb6h3vfdbqmphxvmw4ao2m@efgv7wvm6cty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-118747-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[guptarud@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:ilia.lin@kernel.org,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guptarud@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A849874A3DC

On 5/27/26 23:35, Dmitry Baryshkov wrote:
> On Wed, May 27, 2026 at 08:39:28PM -0700, Rudraksha Gupta wrote:
>> The qcom-cpufreq-nvmem driver generates prop_name as
>> "speed%d-pvs%d-v%d" for Krait SoCs, resulting in property names like
>> opp-microvolt-speed0-pvs0-v0. The existing schema regex only allows
>> opp-microvolt-speed[0-9]+-pvs[0-9]+ without the trailing version
>> suffix.
>>
>> Extend the regex to optionally match a -v[0-9]+ suffix so that
>> devicetrees using the full prop_name pass schema validation.
>>
>> Assisted-by: Claude:claude-opus-4.6
>> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
>> ---
>>   Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml b/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
>> index fd04d060c1de..846f49a99484 100644
>> --- a/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
>> +++ b/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
>> @@ -81,7 +81,7 @@ patternProperties:
>>         required-opps: true
>>   
>>       patternProperties:
>> -      '^opp-microvolt-speed[0-9]+-pvs[0-9]+$': true
>> +      '^opp-microvolt-speed[0-9]+-pvs[0-9]+(-v[0-9]+)?$': true
> I think this should be fixed differently. There is no version for
> MSM8960 / APQ8064, per design. It is only applicable to MSM8974 /
> APQ8084. You also need to scale the core voltages.  Would you consider
> picking up the relevant parts of [1]? (also see [2] and [3])?
>
> I got stuck because I couldn't implement L2 plumbing properly and never
> pushed the series further. On both MSM8960 and APQ8064 we can scale L2
> cache to follow the CPU frequency. I tried adding the driver for it, but
> RobH requested using cpu_subsys, but there each cache device gets
> created multiple times. Maybe I should fix that in the end, then we can
> scale the L2 too.
>
> [1] https://lore.kernel.org/linux-arm-msm/20231002185940.1271800-1-dmitry.baryshkov@linaro.org/
>
> [2] https://lore.kernel.org/linux-arm-msm/20230827115033.935089-1-dmitry.baryshkov@linaro.org/
>
> [3] https://lore.kernel.org/linux-arm-msm/20230702175045.122041-1-dmitry.baryshkov@linaro.org/

Hi Dmitry,


Sorry for responding back so late.

I'm not too sure I follow what is required for the CPU frequency patch, 
but I can attempt it using AI. Would you have more information and any 
specific patches from the patch series that I should take a look at?

I'm also considering putting CPU frequency in the backlog.

Currently Antony has Wi-Fi/bluetooth working (Which is depending on 
https://lore.kernel.org/all/20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com. 
Waiting for Lee Jones's review and I will send my Wi-Fi/bluetooth 
enablement patch afterwards) and I've also separately gotten display 
fully working and cameras partially working. Currently I'm trying to get 
audio working and recently I was able to hear a click and pop. However, 
I seem to be struggling to get Q6/hexagon working. This seems to be 
required for the modem as well so directly controlling audio seems to be 
a temporary solution. Would you have any tips? My source code repo is 
here: https://codeberg.org/LogicalErzor/linux/src/branch/expressatt

I feel these subsystems will be more important getting in compared to 
CPU frequency. Unless I'm misjudging CPU frequency work and it's simpler 
than expected.


Thanks,
Rudraksha

