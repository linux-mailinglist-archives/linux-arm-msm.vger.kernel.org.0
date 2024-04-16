Return-Path: <linux-arm-msm+bounces-17601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC258A6F1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 16:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EAA71C2150B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 14:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F2B12E1E4;
	Tue, 16 Apr 2024 14:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nJnfgvXY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB6612F598
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 14:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713279441; cv=none; b=VSgoIgVQIlX62K92jDzLx5eFdb+1zUY/8xGQXQAis+xSYZiGusLUFejBskQ4D81QDNu3tp0rjxmjsAjcrR5NmMWKCK6ot4LJkuauUovz2pcWP1Ih8q6QGVtZX7gl0YK2GETlHraV49OxMijPmDNxxhc8zLTfQ5U88WYYkxZBCg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713279441; c=relaxed/simple;
	bh=FrbIB/Z1SqzQ5A58Zqk4S74k2lIPrqfaXr5V7n8jcz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FxtxuvN0jzOKOO8ACKcKF1g5Yj6pvsJcvzVqRH+RBsyfu8L0nAj+Knpk3s3YHwPKIyG5b+TqaPPm8vOmw8vj8baKG4LwnLlUAgP3QsdTLoUHleMeXC+6IdusnI1gTjbcBnzMqwZkmfm1mAeZF+7Tr12y6axhReokyul0eZ0Vhyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nJnfgvXY; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d8743ecebdso45016171fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 07:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713279438; x=1713884238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Or5aD0vHhofq4hU9WI0SfKr5R6BUi9ScTzvy6tmm1s4=;
        b=nJnfgvXYS2KiiYDk3B4MOcAJV6Vr6/Ewz6Q1ng1pT1foFIkEd2WO69nl5dENFiWmr2
         JjGAmnjvYK/HEyzPEn+iBFU8PZMIW5kJvjnXRuah/SwCFhRCcP0qDF2uQAaPDsYujQda
         lPV1yGhoUChQB9oMDtyvwS9ouWnzrHK4fNyJgcdYmyjIMmMyoKI00NYtP24N7gqmqeYM
         H3YmLQr4V/UFy/zVGzdcqEVwsWXrKdApyjG7FAkbp2rgHSWBxgA1ZsLLzGzSxrgTmFQT
         uLkQAYE1WDqqz4uPOHyULhyh5cHn8rSaLNtHznIoDYYIHqf11ymUt5H5vsa3PWJ/vNgR
         6AjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713279438; x=1713884238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Or5aD0vHhofq4hU9WI0SfKr5R6BUi9ScTzvy6tmm1s4=;
        b=JFZyb3yOZZ1prkbrUukwVFL0QIKmFpBTqeR5XBnYor3qvjxNe19rR0yuY8ZpInlH/E
         J8AzTTfpyqMFGkPLd/AFsxTqXxrnI/3haL4mKkOkUARwGYSC8lDVIWxi99RXE4mH0uTj
         Lc3J1ptys82sfTlu/zK1nruAllR3ZKGN7k6LUkYK5iNzVyE/FwanjjMFHz0azE3W5gZn
         TrPA0FZ/SMgINzoIc/XJxibMRvcKdkARSMPwTJn4Zpwv1XqzAxGZ5tm50eu/kO9TCxaq
         nDap8klJ9mA664rNFEqKx2aWOXay3BhSFc4RUXjSpGdVRSxfUVae6UkNPGzV/X1nP4FY
         Pi7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWeKdcHrtKth8aq9ctQAYHzAFktJ46+mdaZtJLVb9HmycujRc07u0NtGpJyYMQL1l6A2CTJryx07Xi5wf6z8NEOp4IRxheocSaV55YKew==
X-Gm-Message-State: AOJu0YwpDTc+eJy3pBJae4kyEE8kyuDYWWIfC6aH46R/qzYVP6fcj7Tv
	lzCUuQQmfFmwGacuuVCnr/tofzmsEibRakjFqzZf4EKJGl78rlLQCjJvciGyAOo=
X-Google-Smtp-Source: AGHT+IGhqmzkNdrX2UMlDS36AtNuOAiCapJDE/OBBjeoP4TRH2M/KqKJkejU4T3zaLkL6u2UP2FCAg==
X-Received: by 2002:a2e:700e:0:b0:2d8:9fd7:859a with SMTP id l14-20020a2e700e000000b002d89fd7859amr8397471ljc.34.1713279438013;
        Tue, 16 Apr 2024 07:57:18 -0700 (PDT)
Received: from [172.30.205.49] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id o21-20020a2e90d5000000b002d86641176esm1571846ljg.32.2024.04.16.07.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 07:57:17 -0700 (PDT)
Message-ID: <66cd0d96-7576-4f70-b4da-b8d518253763@linaro.org>
Date: Tue, 16 Apr 2024 16:57:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] usb: typec: altmode: add low level altmode
 configuration helper
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-2-890db00877ac@linaro.org>
 <c129b349-dfaa-4b10-9b8c-6098d04b9373@linaro.org>
 <CAA8EJpqH2_ENE6am=m9dtwk_+_Vbc4pZG9=Y_4-b-p0fKQ4sBg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpqH2_ENE6am=m9dtwk_+_Vbc4pZG9=Y_4-b-p0fKQ4sBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/16/24 16:48, Dmitry Baryshkov wrote:
> On Tue, 16 Apr 2024 at 17:32, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 4/16/24 04:20, Dmitry Baryshkov wrote:
>>> In some obscure cases (Qualcomm PMIC Glink) altmode is completely
>>> handled by the firmware. Linux does not get proper partner altmode info.
>>> Instead we get the notification once the altmode is negotiated and
>>> entered (or left). However even in such a case the driver has to switch
>>> board components (muxes, switches and retimers) according to the altmode
>>> selected by the hardware.
>>>
>>> We can not use existing typec_altmode_enter() / typec_altmode_exit() /
>>> typec_altmode_notify() functions in such a case, since there is no
>>> corresponding partner's altmode instance.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> Should this now be called from e.g. typec_almode_notify to limit
>> duplication?
> 
> typec_altmode_notify works only if there is an altmode->partner (which
> we don't have with pmic-glink).

Yes and this seems to be an excerpt from these functions, should they
now drop that code and call this function instead, so as not to have
it in the tree twice?

Konrad

