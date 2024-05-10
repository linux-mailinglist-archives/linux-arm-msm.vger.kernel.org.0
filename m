Return-Path: <linux-arm-msm+bounces-19635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 931D78C1AFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 02:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C45BF1C22D35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 00:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8802E136994;
	Fri, 10 May 2024 00:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gNOhM63l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965A71B285
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 00:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715299851; cv=none; b=Mrxq+2N+6Fau+eJKCV/WkiFiIliLtQbsbR/w11k9DSOPp4Qv4uL0nuMycjhEBpcHxLfBypoPbW4P3dHSQFIL+unJyrK2A1GmgaQwHvfVqnLPob5oRTgLD4wX63OzfizW2L/sKzcjGGbXZecUk8VVanh7QpcCon4yqrVW9KSE+Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715299851; c=relaxed/simple;
	bh=pzNITf+4PlEWBPZ4UTZlbmT0Qte+yrYEKZsiFIuDIGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oCBU9UkiZ7MBTifio9X9Mjdp8q3DYjiGBQO/3jjvI3QlkASRJogznvK8pJHH4j5otR3/Fg611QUwvFoFA1UmXbySAdNMNP/EVpA54xlNzvJkBdccnUxGTj8tz3jDfROX5p8pwRTWF+mHLmZ1pfasFVvoghUlGHkhN3OvoZT+V3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gNOhM63l; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41b9dff6be8so11665855e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 17:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715299848; x=1715904648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzNITf+4PlEWBPZ4UTZlbmT0Qte+yrYEKZsiFIuDIGk=;
        b=gNOhM63llP6psYFDnm4yjy8Fx/cGKz93fsCXH0+0VBqtjcJhDILD6F7VL726BDvEri
         UY7M8vzADDhTHTE8IMvuD67vkEuy74RnLU16iV+XMgLbLLuN81eM/KOhWIhqMsujnSYr
         2Tl+DOonEBfuihxmBtjmYMKwlsVOGHQU18McWGKVUlfVaz7WLJBrKxuXS+ki97JGjcno
         0vzkyM1fv3sxTIG+9IwzbWFGw99IIFthdJUEtopB26eZRhGFLqT/GSGQiBcT+XnAN1QI
         PttEPDZL2Q647HA5T6W4y1cJ0E1MsiTgFaanweod3oIrEwKYk81Y/Isc7KV3hQcCVySs
         pCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299848; x=1715904648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pzNITf+4PlEWBPZ4UTZlbmT0Qte+yrYEKZsiFIuDIGk=;
        b=EuCA5P6ZHqWyDhOvdZyV+LV5JAa61f7f03DygdduxWxrWfAbwPyhg+dpfCA0wv4Ij2
         PREjb4lHhb1bDKrqE0Y5N5Xa+4Akt1unFPGxAqDPmslcImNc99mhGzXgiiYwHJ7nns89
         yH+77bD+pF+lr4EL476JdWD0PeGPRTij1fG4QPWM3g3VRdeWJkb62+Zk1JrI6gtGVRd7
         jvm7vxIRky/Of0NDK3HT/L2cli6SnizrH0yD01FwyAud2WCxWPj3FpQF3s3BpMyNhpSH
         yrKkx7lKw2phj2nXDvpJd/oA9iSvAkuwZsadKVVdM/14QOaJX+zr65hIB/1hnG/YuNjZ
         3CZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxc+baWqTKg46FgEF/Ee+V28Fk1ehQwRj0FDBElFgSMLM3zjPs8kOXxMIk5zLAz9rrljos10paEe5c6+0Rzbes7hQwzJpDqN7QdxjHPg==
X-Gm-Message-State: AOJu0YxBrOAk9su1+QQdEpCxU33JlGAdPTUgamMe9WDxj+iYQr75FdQt
	ERt7iAg8Q4M6+jPsztPR833LjLi3d5b7Xq6PQI/t3WvQzhWPByQEaxv5BtX4jjk=
X-Google-Smtp-Source: AGHT+IG2jsczq3dfe/dJ7DPpBcg2bEvQp8RDa/B4ogMpTtlxJN/y4dfXzbn04RJtsYeOgaAbiKs7Gw==
X-Received: by 2002:a05:600c:450e:b0:41e:c9ad:c729 with SMTP id 5b1f17b1804b1-41feac59d29mr8065595e9.28.1715299847935;
        Thu, 09 May 2024 17:10:47 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f881110f9sm76869405e9.37.2024.05.09.17.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 17:10:47 -0700 (PDT)
Message-ID: <96593105-0ca3-43c7-86da-7a059cad287f@linaro.org>
Date: Fri, 10 May 2024 01:10:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/18] media: venus: Use flex array for
 hfi_session_release_buffer_pkt
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-10-7aea262cf065@chromium.org>
 <284a3096-cc2d-45bf-9075-fcd1bc60a599@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <284a3096-cc2d-45bf-9075-fcd1bc60a599@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/05/2024 00:37, Bryan O'Donoghue wrote:
>> -    u32 buffer_info[1];
>> +    u32 buffer_info[];
>>   };
>>   struct hfi_session_release_resources_pkt {
>>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Oops no.

Please don't change the size of the structure.

u32 buffer_info;

---
bod

