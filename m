Return-Path: <linux-arm-msm+bounces-84800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD884CB141D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 22:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 051043025E2C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 21:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAA52DF710;
	Tue,  9 Dec 2025 21:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPqpmiBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B267A2DF12F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 21:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765317581; cv=none; b=XtUgn8MngHezVvFqF/ehoyeRJGPAowPosBHRPyqCoMM+94MAJLBnK0RxaPUbc+VNX3hEBeWNEzxG9AaOlfzYIvtZu3t1OjAwdFgzZ5FKvOk9kB3zTjVM1cqbE0/2C0pfrRf2rtu/S7MjSTf6vRWLXwPO0IbuWequhcy4do6Msjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765317581; c=relaxed/simple;
	bh=RZD2/pljY97pmtmDsBmNKwERTDH+7KpDHpokSEfLiR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPbg7gdUKe5aII6G9zg4/XTUyl5EQqgcpbiho57CGcknmHTZpg3QmZrEG/DyNkRrN2e6qvAdfsjhgKy2EbUYrm7mQ80R/C/cKLLtoEpwSpLjzyawacWSwc1ZIUGoWKL0vnL8GKnptPWh00Tg4UxqXM/7jvcOhdwFU7r3ovgKGzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPqpmiBI; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3ec47e4c20eso4067572fac.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 13:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765317579; x=1765922379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DuZ2z2VCQmq7QpmkoDn96+JZ2qZdKN3RWULcV8zKlvo=;
        b=MPqpmiBIK3/7ZXuXExLpLLolXAc8q7t5BEZGbnJ+1gDwtOvzsS3Vxvojjz4o926QHa
         TaG8RJ/Nb2N/NYDjv6VZzbY7GgQBXEbRvZkkBugPB3/ztP03LlYl9CE/+0+90kii0H13
         oUWOQHj41wwCDVhJrcC2RP3DmuHqYZX4X308nGEkd7b5OelezX5w5lxwp4DmjbWr6J5m
         MtcdJhf8J/EsDd7x9QicdzArcD57np40linX2bWNFAfIaM47ILD88DLSkk5/kbw89Qcf
         2bMQOJgdt0br5YnziieWhJZSxtgtAfTYmDhrw4+Pi3cr5M2406CDsvwVEbtdb45wbomZ
         KrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765317579; x=1765922379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DuZ2z2VCQmq7QpmkoDn96+JZ2qZdKN3RWULcV8zKlvo=;
        b=tO+gszknW2ou/pBjLedJPbDvl3039FutgMiwfTUpy1ygYoo/dJxJLyM+q5+qRtcAWs
         sQXrAKD6VNclkAgnoRDs1FhkXdApNEE5zRKtM3/NA0nNrPJD1XAwX3vT+6u1uruXfanO
         f5gO7mYDld76KCPD4Ti+CXXFJWL6b63m3OWizYytT4KqNErEZpZhs6kzCpOdNSWNd5b8
         eq5Z/HP7xNKGUFvkTvt4m79HtvpwJCcd8Wp4sISrvuNEZfiPvjZ9ZF7FAgg1P4Dp6i0N
         S3n1mlqTrT15yhGXnGpIJj7yRTqBqYxR1sK6ZiNQKrJo7hDRD+A/GozGzz2+4ET9PXLC
         Zrjw==
X-Forwarded-Encrypted: i=1; AJvYcCV+7Dn4kDPIJEh7Cbc730PXHRRkD7kb30ced4oOEephp6D2yblri/Hczg5ldpp93EC/6LTxB47h+CCGz3da@vger.kernel.org
X-Gm-Message-State: AOJu0YwAyA+jjnIve88pBORraeK7Ih1kswlMRi7K7+7qm0LobLC/+6ve
	AnA2xQI2z2Q72K6f+hKQKnnmTGOAJWCQasXpkk1tWCiQ3J8SuPlar5df
X-Gm-Gg: ASbGnct38et+I0jNUAAcvmDJUPaMSyTPzjv/x2e9erTJkw6QiN7u2PUKF4REiVdJcbZ
	OMMFoFs2LmPtIcMot7fon6rZBQXy9MQJTz3nCdZu95tGS+LmK4OQ9hRQ7PZC46/XmIiyvf6JSIr
	E5BY1koJv7slmPupRqCozrAd36MEfI7RS1a0Z4nDmBHEtT/CbhQifkhsvfmB0PVsGH9kp8h6477
	2oEVXMBU4FM4Az1ISKcnOefFUJF7Pn6YrsneQJ3qun8DUMZAsIeIP8skk08ijVDqb9VWRdeskG1
	4oQJnvXL/+PSHinBjlqAfIyWaTfpluV26dbY+5nzimVbWxpvDDeNPE2b7n5NeA8xhtALymoGH3R
	FiVhymYYFPw1zi1MwAAx1XwbioIflHUy+o76We17LAI7jFqLh6f+vDBr/fLIKrRhsKrccDqIqYj
	mYaILbrsfgiLk2+c7EoKVpy4NsgWU5OR4mdE911b4ir0VsNiG2pzEEhSOabCmRL14A2E/8MGBXL
	ofyOvy3jok7l5iQ5eJQjMktzpcRXP+GR3J/46LcWcus
X-Google-Smtp-Source: AGHT+IE4Gbwa3W9A/LyUYK0KU0rzXxcf4YOHEus7H8/fV0hevhduGimk6KLCjCZwgujIyaa2uRoaZA==
X-Received: by 2002:a05:6820:2224:b0:659:9a49:8ffc with SMTP id 006d021491bc7-65b2ad359bfmr187014eaf.41.1765317578652;
        Tue, 09 Dec 2025 13:59:38 -0800 (PST)
Received: from [192.168.7.203] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3f50b5ed5a7sm11327996fac.22.2025.12.09.13.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 13:59:38 -0800 (PST)
Message-ID: <b167f406-c5e6-437d-bb34-57f253258f54@gmail.com>
Date: Tue, 9 Dec 2025 15:59:37 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Use 'usb-phy' for node names
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251209160755.3878878-1-mr.nuke.me@gmail.com>
 <xmserprghzwpcxt7ionh2ju7o3cudj5emtkycvurbz5obztzr5@lkllnnsag6ri>
 <23d3bc82-0909-42a4-b4a9-742834faec76@gmail.com>
 <959b3e2a-c11e-47b3-8d8a-03dd9ae18254@kernel.org>
Content-Language: en-US
From: mr.nuke.me@gmail.com
In-Reply-To: <959b3e2a-c11e-47b3-8d8a-03dd9ae18254@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/9/25 3:48 PM, Krzysztof Kozlowski wrote:
> On 09/12/2025 17:26, mr.nuke.me@gmail.com wrote:
>> On 12/9/25 10:17 AM, Dmitry Baryshkov wrote:
>>> On Tue, Dec 09, 2025 at 10:07:54AM -0600, Alexandru Gagniuc wrote:
>>>> The devicetree spec allows node names of "usb-phy". So be more
>>>> specific for the USB PHYs, and name the nodes "usb-phy" instead of
>>>> just "phy".
>>>
>>> Why? "phy" is more generic.
>>
>> Hi Dmitry,
>>
>> The goal is to be more specific. I find usb-phy, ethernet-phy and others
> 
> We do not have such goal. Where did you find that goal documented?

If the goal isn't to be specific, clear, and readable, what is it? Why not be generic, and call subnodes node@, or dev@ ?

Alex

