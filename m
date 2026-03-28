Return-Path: <linux-arm-msm+bounces-100530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONjVHtKPx2l2ZAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 09:22:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2414A34DCDD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 09:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8262303AF28
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 08:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E3137472B;
	Sat, 28 Mar 2026 08:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="YII2ExQh";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="wKxJTK1t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B876374726;
	Sat, 28 Mar 2026 08:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774686145; cv=none; b=Gmia1xgYKR0OuPyM1Pjb0Hl+AQY7HYw/wug1wEH9j8B82iZScmxGKDo3OUMDKTftCvcDjlCC/yJ7AG1Ri5dxLgdEFlsA4kVrZ6/wF3UigyhXxR3ksAs+/HXdO4sMJ+ztEpoj+LIc6MIXTUuwUGZd7exCDtmooDmUT0PtHvWuxKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774686145; c=relaxed/simple;
	bh=KN9F0rAgEEeooiwR8R0K20dqkZ/BBUYU8vQkKLLJeKs=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=rO5CSJl15DD+T4Dwq1gjuIZ4Qtxk9GBSkFuIrTjrwN1t6EFbw82VB3HlmTJhxhRnhZVuW1EeugdbwTUSiucCW/BFjpSvxJmY2mkWka2UqNLymSrGKS2TwSA+9+/v3PGJQ7+URFPiUVwnvCNQUWa0QWdPpcyGbaq6jjlu3exrqZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=YII2ExQh; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=wKxJTK1t; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1774686139; bh=W0G6vVypT7WW4cj/8+0X35c
	3ULPZjzWVK3rrCsz2NtY=; b=YII2ExQhlJZqkqhu6OacYAKhnb/ibgXffuiZdZ5kqUDwyexuOD
	iNxw57wtIEPPJWyJ7UqSWvgSJ+/JaHZrFT9VELAsKdkkzEkuuYlIFLIWj8/6oonDLh9FNzZdmLj
	ffkj3Vl83kM/PxWKm29/P4k0IjxRKILEhmnSLwmhmN6v1khN97OP5bZm7mWnGw3ZqUAA0iRRYfC
	7yqPS0EtwDO7kdHXBDXmiNTXn67jOkNiMhGnUkeFyZtpxAA33nxfI60K6AhmYmAIiR2LJPYgzpg
	BcT3JlSm8iZXJT+W7wfH56WSbirJ8jfqbvOrR8xFEoyFYnZ2VQc0PFUn28KsteiQf0Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1774686139; bh=W0G6vVypT7WW4cj/8+0X35c
	3ULPZjzWVK3rrCsz2NtY=; b=wKxJTK1tLuFEEM71aPfxksWqmhXhO6ZV0qnrHl7Va3We0Onij6
	VqQacg8iTqUJ8nttC9qGQKcaP+9uwjEG5oAw==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 28 Mar 2026 09:22:19 +0100
From: =?UTF-8?Q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: power: qcom-rpmpd: Split MSM8953 and
 SDM632
In-Reply-To: <ocrzwxmr256h3ef7ifwx3z6jgtzubiha3forfi7nao6gakb6wu@recertxxhlip>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-1-6098dc997d66@mainlining.org>
 <ocrzwxmr256h3ef7ifwx3z6jgtzubiha3forfi7nao6gakb6wu@recertxxhlip>
Message-ID: <39a320e472ddc6d44c950a995b577e77@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.28 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.94)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100530-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2414A34DCDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-27 21:26, Dmitry Baryshkov wrote:
> On Fri, Mar 27, 2026 at 09:11:43PM +0100, Barnabás Czémán wrote:
>> Remove modem related bindings from MSM8953 rpmpd because MSM8953 MSS
>> is using mss-supply as a regulator usually it is pm8953_s1.
>> Split SDM632 bindings from MSM8953 because SDM632 is using mss-supply
>> as a pm domain.
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  .../devicetree/bindings/power/qcom,rpmpd.yaml        |  1 +
>>  include/dt-bindings/power/qcom-rpmpd.h               | 20 
>> +++++++++++++-------
>>  2 files changed, 14 insertions(+), 7 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml 
>> b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
>> index 8174ceeab572..659936d6a46e 100644
>> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
>> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
>> @@ -48,6 +48,7 @@ properties:
>>            - qcom,sc7280-rpmhpd
>>            - qcom,sc8180x-rpmhpd
>>            - qcom,sc8280xp-rpmhpd
>> +          - qcom,sdm632-rpmpd
>>            - qcom,sdm660-rpmpd
>>            - qcom,sdm670-rpmhpd
>>            - qcom,sdm845-rpmhpd
>> diff --git a/include/dt-bindings/power/qcom-rpmpd.h 
>> b/include/dt-bindings/power/qcom-rpmpd.h
>> index 4371ac941f29..2d82434b993c 100644
>> --- a/include/dt-bindings/power/qcom-rpmpd.h
>> +++ b/include/dt-bindings/power/qcom-rpmpd.h
>> @@ -84,13 +84,11 @@
>>  #define QM215_VDDMX_AO		MSM8917_VDDMX_AO
>> 
>>  /* MSM8953 Power Domain Indexes */
>> -#define MSM8953_VDDMD		0
>> -#define MSM8953_VDDMD_AO	1
>> -#define MSM8953_VDDCX		2
>> -#define MSM8953_VDDCX_AO	3
>> -#define MSM8953_VDDCX_VFL	4
>> -#define MSM8953_VDDMX		5
>> -#define MSM8953_VDDMX_AO	6
>> +#define MSM8953_VDDCX		RPMPD_VDDCX
>> +#define MSM8953_VDDCX_AO	RPMPD_VDDCX_AO
>> +#define MSM8953_VDDCX_VFL	RPMPD_VDDCX_VFL
>> +#define MSM8953_VDDMX		RPMPD_VDDMX
>> +#define MSM8953_VDDMX_AO	RPMPD_VDDMX_AO
> 
> Well, no. This is an ABI break. It will make previous DT to stop from
> working. You can drop unused indices, but you can not change the values
> used by the existing domains.
Do these indices never can be changed?
> 
>> 
>>  /* MSM8974 Power Domain Indexes */
>>  #define MSM8974_VDDCX		0
>> @@ -156,6 +154,14 @@
>>  #define QCS404_LPIMX		5
>>  #define QCS404_LPIMX_VFL	6
>> 
>> +/* SDM632 Power Domain Indexes */
>> +#define SDM632_VDDMD		0
>> +#define SDM632_VDDCX		1
>> +#define SDM632_VDDCX_AO		2
>> +#define SDM632_VDDCX_VFL	3
>> +#define SDM632_VDDMX		4
>> +#define SDM632_VDDMX_AO		5
> 
> Please use RPMHPD_* instead of introducing new entries.
I do not understand completely, should I use RPHPD bindings in rpmpd 
driver or
I should use rpmhpd driver for SDM632?
> 
>> +
>>  /* SDM660 Power Domains */
>>  #define SDM660_VDDCX		RPMPD_VDDCX
>>  #define SDM660_VDDCX_AO		RPMPD_VDDCX_AO
>> 
>> --
>> 2.53.0
>> 

