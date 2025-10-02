Return-Path: <linux-arm-msm+bounces-75819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D925BB42A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 16:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FAFE3C5E4C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 14:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB3125A2A7;
	Thu,  2 Oct 2025 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zaWDrO06"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFF63115B9
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 14:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759415351; cv=none; b=tTFu45sxuCywH5+BSgK2FoCrpUrZ3DbxhVhytc9m7rNnP0rvokLcEjp4JLLib4kfyGq2Hf98Xnx7R9f178gvLqKOC/huMjcEQ8wxqcHTcEkW5fiQDNkmXDbspqAFZlTrsEgR9ODs6zgoF0UGYmGgQKQ147X2KpYgzh3fP2sBMgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759415351; c=relaxed/simple;
	bh=lnVly7B/ynWFg1o/azppqD1otcdk0Nc+DkPvo+hfI+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gj4hxR4RyaXTBbjBf+uY9+XoPOOdmGbzG1Ukupa+UmT0e/BgxY4dxp05BHPYpdbiOy2/ztqw3E7fGZ8yGCEiK+PDQklYt0jchGp6sVUWskbhnR3SE1A4NFw6SoBVFH8yrvqoXlkg7wmS9oWHMLD4AbHIe/Hc3CnzSDMYQ7b5qQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zaWDrO06; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-636535e4b1aso3761679a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759415346; x=1760020146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQfCWHeADRMRctoSeDLhAiNPu6h3f7C5McM5+dE+g+A=;
        b=zaWDrO06iBE+DYvasS+jPRkOAOr6m79xzddWLRdsvSW4cLi0rnqtEEQn5/M/bK+fCZ
         khOe46JV1h8UnlfLji+HB3s+puPSkYNZHOO6EHm/PUXUAEV/zhJGfUtkFkNCFj0PZufU
         VgWHkicXE1ig6oMZ+THmBgkE7BvDKbNnrIM49hjrI7aQ53XFRNrY4D7Ubv1d+xNnMvwu
         MktpoCcyxi6ZVilzBhJKlAusXdRmXw6R+B9Go86OrC4PeH3dObMLbRrhSOdC+DCD3XP5
         IHZOpgalq3Wy3CsnOTAn4y6gnsma5lqeg88LH3uiQKF4792Glo8yu21FC0putvFLO+NY
         QAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759415346; x=1760020146;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQfCWHeADRMRctoSeDLhAiNPu6h3f7C5McM5+dE+g+A=;
        b=LUqBsUy1OJydFqd3iVeDd4tSd9xtpVKe9I5flROoDUsKD+I5qb62YupFUcqwVe7/tV
         os0HaS+sguHkY7fGRGqqEVXV78aN0fqNxeb1YCIvsD++7HcLmlt7EmtujV2ESufUete2
         d+gw5HktwDbnbycXo2XIQpX+DV/8DeSKWFnr4WYvcuxz2WQiVJo/xzOQ8iFfq6r5+Svv
         sMk5GAVB7s61ZCapZoah9Vvq9ho10J0cZXRrpLP3ktOnzL8/h6UKvSweZAeJWx54p/DV
         QM3FuqzETMcZZZWdR7emho4DA3q9q5PFfZLL/6xyh5LHpEBcK85rjBFd3HQfTyhm9UGU
         a2jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBflw2OfpMwlmJEJ3Y+e+ILjIsMQg5QyxYXijGiTnYlQydKpGIz6TaeHee1Yf3UsRj5czLf5lM/fki5Ujn@vger.kernel.org
X-Gm-Message-State: AOJu0YxNsX8NQh7wDAdLxHvyNWYXivnymDr5lpUAlFIMFt86KyoDKrC+
	0IF7/zDqfScYGnoylsFNrHjW/MYmuHkje8Jm/j4IlDesCXUv5WH9018yeOrA5pSuKs0=
X-Gm-Gg: ASbGnctvW5+Vc+hW5F/sL6mcuNx0F/lzd6nOjdD17Vx911ruDN5oYamgXTEOeXSw1Jh
	F1x+mtH2vVI91uyzL/bwDwWyqvTRdm3wRDuduHQ9b4Vua5kBLaPoeiyGsrRsOD9vlQqDiXjZWoq
	T5rmxRwYa/S/zBgi1mSTV9rlnpFhM/SO75tZu3/W8Y/12PKgZuh+dliavxMndHgGPD+1guXEvR5
	t95jFds/EBMcS5XG9y0FM5crIyc3jCB7wqT3ujhr5pP5yQcKy1k0O4jFwjA1WfDU17R4fqSfZEL
	v9CSl2s0tp+NX2NV1QMMCjuAiUL5lqq+11EWH3b/Zd5QNN+ibvvfUjC/EMMx/id0VKp2GUhqTOx
	MFJJ0f3XEqLmKu6ozUOohi9MkA0QC8rfpzy/B0ioXmhXX1wDYgqv2+SXTgirJOaoAQUe2ZmnbT3
	vyDOLrDUFZyWmuShSZNejywjC/STk=
X-Google-Smtp-Source: AGHT+IGnulA+Q5h9/q8aA5Ppg3Byl6uFpjHjx1bhWf6x3fEjpyWL4Kz+sYqViTJlhMs3unwt4RSJ4g==
X-Received: by 2002:a17:906:c10a:b0:afe:159:14b1 with SMTP id a640c23a62f3a-b4859e7d413mr481034266b.9.1759415345681;
        Thu, 02 Oct 2025 07:29:05 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a26e639sm226244166b.98.2025.10.02.07.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 07:29:05 -0700 (PDT)
Message-ID: <7fca9e71-b9d4-427e-be66-56f813096cd0@linaro.org>
Date: Thu, 2 Oct 2025 15:29:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org,
 "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <25e6e163-f91f-4fe5-9454-641914d2eb43@linaro.org>
 <CAO9ioeUa2Ea7CNsXpUANyKiqfjzW0uQU_ZxgEw==uMA42eF1NQ@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAO9ioeUa2Ea7CNsXpUANyKiqfjzW0uQU_ZxgEw==uMA42eF1NQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2025 15:24, Dmitry Baryshkov wrote:
>> I think in fact it should be possible to point venus @ the gen1 firmware
>> file while pointing iris @ the gen2 file.
>>
>> Unless there's something here I'm missing, that should work for the
>> update and the agreement.
> Both drivers are supposed to work with the same DT entry (that was the
> agreement, they should be interchangeable for the migration time).
> Consider having a device fused to require vendor key and a venus node
> with the firmware-name pointing to the vendor-signed firmware. One of
> the drivers will fail to work in such a case.

Does it ?

Your firmware over-ride is in the DT - which is a downstream thing right 
now for sc7280, in which case you're required to manage your out-of-tree 
stuff yourself.

Else you operate from platfrom data buried in the driver which we 
control in upstream.

And my own thinking, I've been semi-convinced anyway, is that in reality 
the gen2 firmware is the only one that is going to "get any love" i.e. 
we are probably _only_ going to see time/money invested in that interface.

Hence its in the interests of 7280/6490 users to get onto gen2 firmware.

---
bod


