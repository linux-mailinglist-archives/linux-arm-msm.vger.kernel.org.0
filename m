Return-Path: <linux-arm-msm+bounces-13471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 017BD8735AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 12:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6120AB22483
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 11:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9507F488;
	Wed,  6 Mar 2024 11:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QJAmKDuE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7157F7D3
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709725224; cv=none; b=f3Ku9q4SNpuCNIcmsxyCqgW082NL9qxg8V87NQlCCsMJPyC+pPn+nDee65B9a35PUiS5CHVRrwxwCM2RwJM5me01nERTkmYD7wNy+WckCz6Q5MIPlUQFiB1Z9aPaTV65B5nQjrwKHEQl0dLSwI4gecEMGn/W7Z/ur9xXsVZsMhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709725224; c=relaxed/simple;
	bh=MyDgk4afHvneJK/AGrdFnLoUjc8Ck2lGA49YcoT+rSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jl8jWKvD0OvjuGRBNhnMNrNENF+K9eccLj5fexpieSWXzEtfFELvv2kzZ3+Az3JjqJAV03PS63Aw0jiFaMQjL6UsS9o4p+NsJf8zLXDncdXTw1zF0gASb4hi1QSBAzrH7Yv4vjw5ECegwFkPZG3K/g3FRcEFTYyq6DfVmM+myLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QJAmKDuE; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33e2774bdc5so3709244f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 03:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709725221; x=1710330021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bHsDLu11BhsOOu7vOLh5O5SoeXOiXHoKRCejG9ZhGdU=;
        b=QJAmKDuERm1ib9JzNKOyPSUapuNp3s9GUwU9YQCqHSOXDu7EZHAUu+sckFQsE4dhfQ
         uvkoM0pQG9YHwMHeroF8pLutTQw4At3bHv/RRoas2NwEMIQzYhE1IWnvKB9asMA4BxML
         O3JLGql1Zs1riHUhK79LcfrMHbDs0/ryL1xMTUk1lLCW+GaBOkbyNEYJuK8ek36/y5fA
         LcQN5nRj731LQssULqeN0qHzFFvar2NKz9xTMkkn+lO7JAewe332+3BgSo3zpTU8WFff
         juvqxPigTkcuNEYCbOefSuKsS8lENM5N4cGcxyslkTSdt6wz2+OtktqXoEPxXq7mqMJo
         79yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709725221; x=1710330021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bHsDLu11BhsOOu7vOLh5O5SoeXOiXHoKRCejG9ZhGdU=;
        b=bQkdHeVWnDhSoeBuVSXo93n46ysOG0h4SEvbEB26k+r/5Tz3h5xfTvwVeyH0aSfOy4
         XoFmDtRpPwriN8eTX5kaqTbX3DLg6uzfIOtWnJu9zeICBi2jcGlSI3NAuj/wfP0+y21d
         iaD0u+Eff40w4JWolNDM0++T/etaAwE/aM0x4OaPs5O585+JSN/gFwhRIGbmPYipHdJE
         fJlE53Fmro0bgfowjOZB3sPGa/IbQckSBTvaKbyIuGMzdfcJ88QwoF0/z28fmDqAm/qt
         sagj5lm0ILtMM4yBis90AM6yGymNAAvqG3FtNyzUtxhqjwP0CLbxutzEhDTqw6b7sIZh
         It6w==
X-Forwarded-Encrypted: i=1; AJvYcCVWD1leN+YkeycGMSUtDXT8Cc+nG5km6D93T7mXqlURA0RiqewTJWxIeBrINxTsZ/72JoOQ5d2JWPwE/DZ9bBZ6cYWFdO4YZhDnEyNUEA==
X-Gm-Message-State: AOJu0YyV8BF91Mef1BGQz332Q0bdPqoXhYYqbfumWnZ/ZDvlC/F+I48R
	Mh96e1Z/gyaQZfqIej7F3HYO2V8NrCnpPywzfnEpwqqrDFGiUauD/wDqbAoYqRc=
X-Google-Smtp-Source: AGHT+IGalMQM+1/5hflu9r2698/GCRP0X8SJOvsj+Y+8YnI4kUwo+Wi3TKvJOHm5HSN/ZO1xW0c84g==
X-Received: by 2002:adf:fb8c:0:b0:33e:24c7:78ba with SMTP id a12-20020adffb8c000000b0033e24c778bamr10175310wrr.62.1709725221439;
        Wed, 06 Mar 2024 03:40:21 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id bq26-20020a5d5a1a000000b0033e2777f313sm12519582wrb.72.2024.03.06.03.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 03:40:21 -0800 (PST)
Message-ID: <d63a573f-1ec5-4b4c-b3e0-29c46828381e@linaro.org>
Date: Wed, 6 Mar 2024 11:40:20 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: avoid multiple core dumps
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1709704406-22501-1-git-send-email-quic_dikshita@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1709704406-22501-1-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2024 05:53, Dikshita Agarwal wrote:
> Core dump is generated whenever there is system error reported
> by firmware. Right now, multiple such dumps are generated if
> recovery fails in first attempt, since the sys error handler is
> invoked again for every failed recovery.
> To avoid it, add conditional check to generate core dump only
> once during every system error notification from firmware.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---

 From my non-filter mail addr

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


