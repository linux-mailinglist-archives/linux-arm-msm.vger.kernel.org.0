Return-Path: <linux-arm-msm+bounces-99628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOMFHPZwwmmncwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:09:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F38F307093
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C0C7304501B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A4B3E866F;
	Tue, 24 Mar 2026 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="f05CdQI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EF23E716F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 11:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774350253; cv=none; b=eeiRDeiA5QZTpV4zRQkIrvm6vR00VYsDIqQQGQCHLdwCyYrQRLCE17Q0UFYjPiaytGR22YARfBakSvWXqQ9i9L7EiNZ8BTvNpXxMR894eaF1IaPnCbRGgwpgxCSnur12IDAmblTMENjUPEC1/JllwLZ1jSN/41ZKLOjwbEmkYHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774350253; c=relaxed/simple;
	bh=kXwTzM8m3chUzL42QlXn8SAnILWR/tBEk4o9I2s9F4s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GyaLWQkEAHJ4Ib02ruAqlUKhqJ6t2fOVNVc/SEEa/w4BfM7cJmO3Bxh5Ez7/l9o6QAdavv4BR93crzZuXNK/UKaqPZD1ICJNX0DfKPIcfha8WIhLz/fsB+nsoigXTo9M6hM1dIbsEb1y/ag/6YWrTQx75Xrq0tmN9D/78oo7aaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=f05CdQI/; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-66a4c6bb6ecso571887a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 04:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774350250; x=1774955050; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJSft7WXDopdPtbx38F8LsPABdfo1rbEMNuhG4z7KvU=;
        b=f05CdQI/RavHH7lpKnR8u9xg+5kpwVVik9lHUmiBDRB9heFQblojFpnqXMhBEr5FVy
         HOyDRAwoaWbuhCfjHMT5Xm1d/yYQ3rj5YLn+/3wLm+WRq0cP9HsWNmLyuxI2T84quOtZ
         KsdOBQE6S4UOYggdm141w2LkF3QtPIWowY1MJ4XM5vs3p7coPS1laMINOfZU7KWBrJ7t
         Qua30+1Kccp4JfNKOA4/LSEiDQ6cQGgihOT7tgNH6jyZ9ZF58F749tyZbR2wvkdc51kb
         to6rB98I0bdETPYqdi/QIMV6DKUOXlK7Qt87jbvneKPb+1g/+6Wv64BcJ5i19lF+JNxT
         XeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774350250; x=1774955050;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJSft7WXDopdPtbx38F8LsPABdfo1rbEMNuhG4z7KvU=;
        b=lJQene0dzP20PF4DnY4iUMnwnz3B2EdGeFHIZTtmjKCK+NXEhzIKiqJRsqonV4boqc
         7Ow4EX52TtDpxAxHns7hQlziIN3YFRNQIdp/Ur2JhsvE6WY1NvR5aLTR3mtG0P564TRf
         MiDg/WXSQNWuHCmkyXM4tWIuDTQKaqrv39hgW+NgYSmW5ZjBJTZu/XLNuZQfrdSZBgAp
         moKyydqo0CjnRUCr9Kwc1UEfhl5nwvW5WCA68SkdjgQXGLVWN/Bek8IFp1acEsHEpPhi
         yweYYDx10OACN0w3UBLerRwfWIxyudXThsUa7TCRJBP6jWAzTqbtoX8BlEZkbDQiizbU
         g33g==
X-Gm-Message-State: AOJu0YybZGvdzFmX5uv73JP7f+2nbopd7OwBD35hyDVV4aFqg4uPjb3C
	nR23jH9GnooTOJvYi1Tv7JO1DmON7HE9F2c9fJs1/3IqlL566WdmrJVtvsIXv6Os0Mg=
X-Gm-Gg: ATEYQzyB1SXfBkX6vipznkokWJWAlEW+c/zfbukskpBBYmN6ful1uZXmU3ICv9kSeXW
	Mr1qe7H/9zw9XfJ2Bcl09vw8PS8iNfSv907+bFQEsDgnOILj4b//9peE+VT3v+5I/WZB1jM8vTj
	QtIzbKI9DL7hYPOChHwaS1FK+wvKmyAz8lYeZXEJu9HGJmgzmYHg7PIG38Ev82P5psXm8nNWwhz
	t03+kl52teKtIBTU84673TVnqenHXOvA9fOyaW8BiG/jmKM71kpgHsVBDXrT4EL8BfrZSocFwrs
	+HT5sxrPIV1foOjuux2jQZ+VxnNTdZPW7R4on0f0sCKSKM4GC19RoK6VS2m4qIVV0MW07jJOsUe
	ojlfKzCNWt60LDhL/0R8gK51TNXNnUh45fF176km8vUp+/zxJ2mG0GpcrtrtrKN890qyClAif4F
	Qt433JwZOK6FUI7+xOO2eanVhN8SMxAcJFWHxVZzLPntBroUrsr3Zv4bVj0ILuwByrPLnT
X-Received: by 2002:a17:907:7ba2:b0:b98:4156:878e with SMTP id a640c23a62f3a-b9841568891mr1060559066b.47.1774350249586;
        Tue, 24 Mar 2026 04:04:09 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983387103asm622419066b.57.2026.03.24.04.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 04:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 12:04:06 +0100
Message-Id: <DHAYO287YDEO.12W871ZAAJ6GD@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Brian
 Masney" <bmasney@redhat.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/9] interconnect: qcom: let MSM8974 interconnect
 work again
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Alexandre Messier" <alex@me.ssier.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Georgi Djakov" <djakov@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Brian Masney"
 <masneyb@onstation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
 <b09a51bf-26b8-4c88-ab23-c92ddc1fb801@me.ssier.org>
In-Reply-To: <b09a51bf-26b8-4c88-ab23-c92ddc1fb801@me.ssier.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99628-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0F38F307093
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 24, 2026 at 3:09 AM CET, Alexandre Messier wrote:
> On 2026-03-23 20:10, Dmitry Baryshkov wrote:
>> Commit d6edc31f3a68 ("clk: qcom: smd-rpm: Separate out interconnect bus
>> clocks") moved control over several RPM resources from the clk-smd-rpm
>> driver to the icc-rpm.c interconnect helpers. Most of the platforms were
>> fixed before that commit or shortly after. However the MSM8974 was left
>> as a foster child in broken state. Fix the loose ends and reenable
>> interconnects on that platform.
>>=20
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Swapped order of clocks and clock-names properties (Konrad)
>> - Corrected the ocmem comment regarding core clock (Konrad)
>> - Link to v1: https://lore.kernel.org/r/20260323-msm8974-icc-v1-0-7892b8=
d5f2ea@oss.qualcomm.com
>>=20
>> ---
>> Dmitry Baryshkov (9):
>>       dt-bindings: interconnect: qcom,msm8974: drop bus clocks
>>       dt-bindings: interconnect: qcom,msm8974: use qcom,rpm-common
>>       interconnect: qcom: drop unused is_on flag
>>       interconnect: qcom: icc-rpm: allow overwriting get_bw callback
>>       interconnect: qcom: define OCMEM bus resource
>>       interconnect: qcom: let platforms declare their bugginess
>>       interconnect: qcom: msm8974: switch to the main icc-rpm driver
>>       interconnect: qcom: msm8974: expand DEFINE_QNODE macros
>>       ARM: dts: qcom: msm8974: Drop RPM bus clocks
>>=20
>>  .../bindings/interconnect/qcom,msm8974.yaml        |   28 +-
>>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |   21 +-
>>  drivers/interconnect/qcom/icc-rpm-clocks.c         |    6 +
>>  drivers/interconnect/qcom/icc-rpm.c                |   18 +-
>>  drivers/interconnect/qcom/icc-rpm.h                |    7 +-
>>  drivers/interconnect/qcom/msm8974.c                | 1637 +++++++++++++=
++-----
>>  6 files changed, 1274 insertions(+), 443 deletions(-)
>> ---
>> base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
>> change-id: 20260322-msm8974-icc-0ac4c28e139a
>>=20
>> Best regards,
>> -- =20
>> With best wishes
>> Dmitry
>>=20
>>=20
>
> Tried this patch series on top of 7.0-rc5, using "htc,m8", and can confir=
m the device boots properly now!

Thanks for testing!

> I do see these messages in the kernel log now:
>
> [    0.692540] ocmem fdd00000.sram: error -ENOENT: Unable to get core clo=
ck
> [    0.692582] ocmem fdd00000.sram: probe with driver ocmem failed with e=
rror -2
> [   24.173125] mmcc-msm8974 fd8c0000.clock-controller: sync_state() pendi=
ng due to fdd00000.sram

For that you need this patch series

https://lore.kernel.org/linux-arm-msm/20260323-ocmem-v1-0-ad9bcae44763@oss.=
qualcomm.com/t/

Then ocmem probes again correctly:
[    0.859855] ocmem fdd00000.sram: 8 ports, 3 regions, 24 macros, interlea=
ved

Regards
Luca

