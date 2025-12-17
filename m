Return-Path: <linux-arm-msm+bounces-85595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B947CC97F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 21:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CD40300D308
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 20:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5656C1D63F5;
	Wed, 17 Dec 2025 20:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBwyOI3o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F2C238C0B
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 20:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766003579; cv=none; b=lgHR3bZeNaiEZIoHMiSAEZ8KRQsMNM27ZqhQodsX0aGH/K7l3E+qGu12BSj8MI5CuD6vWXtAFeRSc0u/iw8eEgGSGQ12YWpjJIsW3DooWAju1JjtuXDLOV+hYs+KNyvDkfKOw8js/V5ACokwdda0SLd4teza4EME17OySCFiJT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766003579; c=relaxed/simple;
	bh=aUNMUHIIoASXlei+fwcpCBA75RzFdLQiQYCADrUkTkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bclRMjcU0osnI6vosQ64MpzhYEo4RTVM1lZZj/uxNgVv14bRl1GoS1cwc/9Z+DEWEenUG8D/rqJiIvBZtZLhNMijdM6eNBcUsxyjMgfChmnuReUkCKcBmHTAM7kafdh5UawVDTrLhhS6sXJOsM49DBhWJzT2Ip82KBrRAaJSaU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBwyOI3o; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477632b0621so41839315e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766003574; x=1766608374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jQt3q086rvOT4nnXw3lmARg1LijJJEzAF5b58emB02A=;
        b=mBwyOI3oPTSDUcrcMfRBNOGh6kqEQsi4nakzRDtcTL5mMmQogVox6JLTiTsj7lSd2w
         cgmSaN5j5cZCOAwWzwl+CLkG7quIyzVSTJzNGG9a512rbyzBOQlkakAx5upBbYqwErtg
         GzdjvIzXP0W2vnGeh0PzpS5/s4kaRsEKg8V/CO58eFhfUQ8+hOfFw101finPWDL1jj/K
         RfgM88/4zE+nyRv3yGoX/fq1vcB2miyImaRH0Q58MvWPvclBIcFaBpiRRds6anTGvZeI
         tVGho9Usx5HzUAIwWkYkcob1jfsqMwN9w8REQ2OCgyEHUkszdukj/88SotKzgCHTpwXU
         zqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766003574; x=1766608374;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQt3q086rvOT4nnXw3lmARg1LijJJEzAF5b58emB02A=;
        b=kOZ/P0ewI2CiDFrG8IqmIlFz1jDaLhofT2a0yysuJHm5EKJBY28FIzfcubaVuvIH3d
         czX1dMZNs4lUJZOnee+A4GRED2oeDuwycUPtyPVhIvGEYrBbEwy3lIzTe+YYJVLhLkcJ
         gLtCdqMN6xWtm3bMsNSK1Y18JrA6bOlBjKqLH4tsS45HccMTgJDTXdGZHPg2m001o5j2
         oTxnpKfNS+bOFMDqgkHe8vPVowiuzXabNgb6fd/eJj0H+gt0SqyJpuYLrOZ+hHziGrhi
         LmujGt8b7nau2YBLD1yAmQu/uqtJZDuiuhRJ8LjlvyRuQjuuT+TAfGj8WHH02SMqvF9y
         178Q==
X-Gm-Message-State: AOJu0Yy2UMD3ZYSzT3s8FMHXPIyZD/iQhwHaCS2vk8oTJ1MrbpZEC6Fn
	hnviNTI3ABMLIMuySJVP5oYiIV1iej6NdPrTt7Y2qcCsErmnAEb/wXy/
X-Gm-Gg: AY/fxX6TTlVxS/Z4cQ+WOtieP8GgEvnr/ZM3vyhYFbCt2lZKaTn6KuE/L5v5jbBKWYZ
	f1c9KCvIoRGw2BAxsTVhGhbsMCnAaN8rx/LcOvObrsARjIRTag63aD7DukALvO8sHFDvlKMaP1E
	/ggExI/6cBvNb7ga+QYaXPcOo8bWKd32IDl51dJZZZTVlaY9Z4MFOwVFcr/1tmbt+Ux7qX2AaSQ
	Km0rrhmciXR6Bv6qDiSomjzG6gUa6ssbSQWhvZSRHheXrIecgBqLyWMLEZzSW2Z1QLoYobN62Dx
	udoJ0gWmpLBw8Y524SOdYh0Vml0/A3FjK9fx6BouVoLDNKn48PnfJPTgEwrLSFsF/RNO/biGgtq
	stQmdf22B1b5hxI3ppJj4UTFxg0uZI84MyNBqoNfVl5/uKdQXqOrRDUSVOz5m5qGCBSUEfJ3aSn
	7lbURGYNVm0ueLUi6M27Ftw1De55wRo2kY7TqTPtQWtMOHcSSynUmpgyDCeaCeeA==
X-Google-Smtp-Source: AGHT+IGXb+yQoXclj0b19HsbDMfCYnt9Xpj/oanIbUU5itPqm1lthwf6uvz1OWdzvEig234aityGNA==
X-Received: by 2002:a05:600c:4e91:b0:477:c37:2ea7 with SMTP id 5b1f17b1804b1-47a8f904609mr201528785e9.21.1766003574227;
        Wed, 17 Dec 2025 12:32:54 -0800 (PST)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a6c6ebsm176475e9.4.2025.12.17.12.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 12:32:53 -0800 (PST)
Message-ID: <fef5ab5e-8b41-4a50-87d7-cb5e4169ff4e@gmail.com>
Date: Wed, 17 Dec 2025 21:32:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: qcom_smd: change MP5496 supply names
Content-Language: hu
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Devi Priya <quic_devipriy@quicinc.com>,
 Praveenkumar I <quic_ipkumar@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251216-qcom_smd-mp5496-supply-fix-v1-1-f9b5e70536de@gmail.com>
 <680d3b17-7983-4522-89b9-13ad67f4bfe4@oss.qualcomm.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <680d3b17-7983-4522-89b9-13ad67f4bfe4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Konrad,

2025. 12. 17. 11:30 keltezéssel, Konrad Dybcio írta:
> On 12/16/25 7:38 PM, Gabor Juhos wrote:
>> In case of the MP5496 regulators, the driver uses the same name both for
>> the regulator and for its supply. Due to this, in some cases the supply
>> gets resolved to the regulator itself, and the regulator core code throwns
>> an error message.
>>
>> For example, booting the kernel with the 'ipq9574-rdp433' device tree,
>> results in the following message in the log:
>>
>>   [    1.710392] qcom_rpm_smd_regulator remoteproc:glink-edge:rpm-requests:regulators: Supply for s1 (s1) resolved to itself
>>
>> Additionally, the driver uses different supply names for the 's2' and for
>> the 'l2' regulators which is incorrect. Here is the supply map based on the
>> datasheet of the MP5496:
>>
>>   VIN1 -> Buck1
>>   VIN2 -> Buck2, LDO2, LDO3
>>   VIN3 -> Buck3
>>   VIN4 -> Buck4
>>   VIN5 -> LDO4, LDO5
> 
> One thing this reveals is that there's an LDO3 and an LDO4 which
> we don't describe today.. 

The same is true for Buck3 and Buck4 too.

> are they managed as power-domains, or are there other other reasons?

Unfortunately, I don't know the exact reason.

I have no detailed hardware information about the reference boards, but it seems
that it depends on what is supported by the actual RPM firmware on the board.

For example, currently I have this RPM version on my IPQ9574 based board:

  # cat /sys/kernel/debug/qcom_socinfo/rpm/name
  03:RPM.BF.2.4.1-00116
  # cat /sys/kernel/debug/qcom_socinfo/rpm/oem
  CRM
  # cat /sys/kernel/debug/qcom_socinfo/rpm/variant
  CAAAANAAR

This version does not even support LDO5. At least, trying to use that results in
the following error:

  [    2.120281] l5: Bringing 0uV into 1800000-1800000uV
  [    2.127721] l5: failed to enable: -ENXIO

In this special case, the -ENXIO error code comes from qcom_smd_rpm_callback()
and it means that the resource does not exists.

So my guess is that the undescribed regulators are simply not used on the boards
supported currently.

Regards,
Gabor

