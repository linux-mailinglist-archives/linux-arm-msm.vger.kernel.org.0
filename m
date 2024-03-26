Return-Path: <linux-arm-msm+bounces-15278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7816D88CF01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 21:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EC41340B39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 20:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1557713D891;
	Tue, 26 Mar 2024 20:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BmqphAjS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F21113D881
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 20:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711485141; cv=none; b=dIjVMdD7LtzTIa8yltg2J4xOO1yN6rIh+XF1mgQbfDN4eIlel7oqR9OI5nB4zFwApwuDMZhD/lRtIdSTvzFW13TMy9NBZW3drqh44BQR90mW7BRZ9KbB15xAfJt1jBpNH3ngPD9mq1kHQGulhG0MtdH1hdsJysgSWzjyrsv89eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711485141; c=relaxed/simple;
	bh=VgCPJU44QLSg2GKIOQSZ5MrtRTt0B2rcrRTt5IW/eKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=igCCIblogOTStl02tUZh9U6ZntTlnUDSnpfE4psAQ4TpoSIQ3NqX/dluiyKddZnMwuiG+NLCcZMqVyWpXHvluj6IhV+uNcq2UmnpSjd+T5ZnMG9fHboNb6ALqdwEuiS5Ifu3aAhc2sMFW1etrvM/bYkcuq1V6Cu+BSBZouMgJhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BmqphAjS; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5684db9147dso7023254a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 13:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711485137; x=1712089937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6VDCXcE5QdWHR9kG4pOhacMN9bewYQsjsFRjYTaqxso=;
        b=BmqphAjSruJsmV55Jv1x5BFQzBs5AFEGs8aHf9dkyqCDtIjDBl3L1yqu8kz5bDjQvk
         U6C7YS8Ml1r9tGSKAPSM6aQy05CwAXkSyX8THki0j8pAhqYFA1VO2tNbxsahjSnAmIhJ
         NAG24yJ3/Ci7vUlpWIVkQrXzJ2W3j8lMTf6kQCDf/JvwfYKP3hYkeVurQNTFnKY9x6FK
         MLfAYwccPk3QUw5MsQ7L9PydTVBUn0MWuYHLLuZ7pSrDMj612gHmY9lqY9lmqWioG0nm
         IZu2ujkSQ4fuhCz97/jK+XvCz4c8pAAJ0PI6aAVZ8d+DZFOuyR92cn7HlEbjougbIHiU
         xfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711485137; x=1712089937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VDCXcE5QdWHR9kG4pOhacMN9bewYQsjsFRjYTaqxso=;
        b=ELzDJW0VNzuTdJ5fz/l9GmFg9nN+ZYJe9XIJKXLNnLI6qXetEXKGnW2tLtj3uLQPdT
         hldElSEYzwuGLEZpMQQ4/dTosRjPBfwW+NjaYAMbpPJ7Sbkjd4kDIJro/XOSSBzOfdS0
         pd0FkqtinD21c/XEc8EvS4/66oJAlklSCsx4Q41nGLH/z/r7ln2IPJy5QoFeQPcIr/6U
         XAw3WzcP1rPq2ttmpDNK3LugN73tE8H0fyKfUZVL0MolRwDR4D+fX+7O3QD5VUel33xY
         fVurjo5XIlOpCkCFV1uHXpta2QmCN17ihLGOslG00huLgwwNeSq1+jU88wbFM6/BXkTh
         ZErw==
X-Forwarded-Encrypted: i=1; AJvYcCUfpEbyPCYMKhf/8teFfWwpxkNaFkypMO/HTpZx0wcGogvFk/M8r4wJptSa9/vTlPzyFami7p5cPkeGU83RPbJ0y/ocFKDjELcHUnwOrA==
X-Gm-Message-State: AOJu0Yy+D6sAA3f0MpJ2cm5RqgShnYFTw3s1FCWXkUa+g4Lx9cSYIaM/
	ynj4pGadeppBvFTdsEoWZx0OCpQkGiAXnmoprcJz5l7mwRNoOKZgHuhkK6Xa03I=
X-Google-Smtp-Source: AGHT+IFOlD0xK8onRUJ9yqR9hLHwwtbhpRKjqRY+8LEBATvXBmdrFXwlqk/rYHKgRAJSLR25QhUOtQ==
X-Received: by 2002:a17:906:4a0e:b0:a46:8c40:7a3a with SMTP id w14-20020a1709064a0e00b00a468c407a3amr1692821eju.26.1711485137449;
        Tue, 26 Mar 2024 13:32:17 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id lb25-20020a170907785900b00a3d11feb32esm4583167ejc.186.2024.03.26.13.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 13:32:17 -0700 (PDT)
Message-ID: <a789fc45-f689-4fd7-94d3-7da37aab340b@linaro.org>
Date: Tue, 26 Mar 2024 21:32:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] interconnect: qcom: sm6115: Unspaghettify SNoC QoS
 port numbering
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Georgi Djakov
 <djakov@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
References: <20240326-topic-rpm_icc_qos_cleanup-v1-0-357e736792be@linaro.org>
 <20240326-topic-rpm_icc_qos_cleanup-v1-1-357e736792be@linaro.org>
 <CAA8EJpo=JScW9ksFtq_rzvJKue_1bVcK2oiA5ZfjpyD=F3wNZA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAA8EJpo=JScW9ksFtq_rzvJKue_1bVcK2oiA5ZfjpyD=F3wNZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2024 9:13 PM, Dmitry Baryshkov wrote:
> On Tue, 26 Mar 2024 at 21:43, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> When I was creating this driver, my bright mind overlooked the existence
>> of desc->qos_offset and decided to make up for the difference it made by
>> adding 21 (0x15) to the port index on SNoC and its downstream buses.
>>
>> Undo this mistake to make the indices actually mean something.
> 
> So, what is the meaning of qos_port?

"The index of the [data?] port that we're applying the QoS settings to"

Konrad

