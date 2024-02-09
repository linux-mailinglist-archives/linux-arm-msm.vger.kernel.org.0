Return-Path: <linux-arm-msm+bounces-10424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83429850000
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 23:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A82031C22FA9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8873AC0F;
	Fri,  9 Feb 2024 22:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pzZwxPDk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008743A1D8
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 22:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707517819; cv=none; b=fE1wh1b+KkGjUDWSJQTUKfbzkMMu6fLcU9G2ICBuYjH+pzZ6O3eavcEjvNZOzgBGbJiX8oc8Q12u9328ERMWP1YYHSvaxGPWXCcbAsgRYI1sxezdh1n4yJZIKK5U6ZHk353QWU7WP0Vs+7+noOFMyQ5N25w0yV9th1rBaxV7Rxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707517819; c=relaxed/simple;
	bh=qKs7KyFODwRvXtWZs/ltpJzu4tyt0xFI26Dxz14P230=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=K7xDomyhpVa0/kZ+fPq6G1MJhgrFkvKGeeEIFdr4N4FE2zkA/GmP+wqLfGqAP/6xjCXWs4nG8iEdUrauiTgx48nJiI/IQnUPKiqjyiBSQ0P5nP0316G4Jjz6DZ3LIUm6M3p6RaDGzRbU9G0q2i1uckvVmW/mL/8Fyko8V6aKRKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pzZwxPDk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a2f79e79f0cso211745466b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 14:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707517815; x=1708122615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nSBmvntcwDdUS387eIDlaFknoXXxdiAibn8OQ3f/lsA=;
        b=pzZwxPDkMuOn8IzZAwfOLczp+nSwioX5BNOIDNjthDoB3gbpUtqqb2nkkTcb+HPmuV
         8MVtnFJLReEnf+rtieOXVB2MMfNDl7gdntu7ZuXe6/ktKhvJez6wpECmwqNDWOif31Jp
         6uY/xmY1csjHuysbHggQTpVdOxt7V7sUVo7nUJJQXb53CujCuTdZwCwz9ZE1qXG8lIfB
         CwUWZTVW+CXB3yVvgmxhBo8jzzfJtVLdpbHSExBQge/cPl+mWGvUbVYg7pgdmo0tD3Hc
         JriiG3JJIX4hnvljrjivUv3X87Wb81oqT/09dAOi/N9MKiq1YQhu6zTJNhkH4dqqvpXG
         Zq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707517815; x=1708122615;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSBmvntcwDdUS387eIDlaFknoXXxdiAibn8OQ3f/lsA=;
        b=K0OzYQX68PIgaROmvMegkgZme6UoRBnv6AmyQ1iq9a2mBDyX5F2EoVjVW6bi5aKok3
         uBUO1rV2f4xyIuDWlhwoFmr7PKcmzkAnLztcC29PtYMeJEcRB5B39w6UEsGFEuNJ9eG1
         6yNvt+iyOcRBl3aQBStvGId+4u0ZCm6HXgetYo1qaaciH428p6gCyI9X7PeOCZDst7tr
         8jDZalBmHQqumqMZVBN/FGtmwyS6UqSfFuRE/LbMEUxZvB6YFyySzQgr7Sw5o+WQnZMY
         XuQQYxZMKDyI7wzUBdcJ070vrjpR+Hc9HdbIJU8rUrTWE9OAkT6dAK/qdfafteZZuU+K
         zC/A==
X-Gm-Message-State: AOJu0YwJ3ikYOvpR12zy8ZA1oieZ0mKAS4/gC6gZxQmCHyhl74bXS8jd
	F8z8QlsC2gM+f0J0A/Ef47rGEXBedaEdf+h8Wfj/GolAYjtsvJJr+Yulvq7LTXU=
X-Google-Smtp-Source: AGHT+IGhawL+j1JNpDm+2uht+C960tCrKJwizcQ7uJvRVACxviW8waF9az2rC9cd+IqpxlStuLMMWQ==
X-Received: by 2002:a17:906:494d:b0:a3b:a3c4:a672 with SMTP id f13-20020a170906494d00b00a3ba3c4a672mr299746ejt.38.1707517815312;
        Fri, 09 Feb 2024 14:30:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8nLJ/4mfGE8gW8Kxg87IvLGWhxl0R3XIMeV0JenttIuC2pld+x3ZzEhAVPRrd5R3WFpqiF/2dkbGXoraCt881k6GBzU+vOGIwdqCiXV0gxZW9G7mM7rG9gVX0VpxOo2TKgJWRCc0rzp5KkY8/hxxRFHnkG/SXqAhRK9LO2UNUQaKmN+9ZFXJWNU6gzMqOEE+KZPpbHB8CfROSDjwUQE8vJtuRSpFPU51kUXaItwD196GUlX8V+mNUDETtB/9Iz3/bg9CrC5To0RMtHJl+/eTCjPRJ8ugPUKhcUlX46bTV2RE5Qb4bAMeVHagIq+N2Lz/Y0WbMymj9hceN0vs4lT2Xf20PRk1S0tOmVczuww4AC+NDDcG32JbfbTZndmCTSUGMABzvmZqFoCPEbepAT6TNai+to8Qdl37M98EWfTVVm8NrNl3o4fMRs6jj5hn+l8xNPxrvYp7WBOnolR9tF89jOzRqLcKHbUW7xsB0qaYNmeOd1fJu8b7KFaUV9wYn0TPCMZrZZKfmPN9jts280DBHdfGLwxpg94vbi+bFcnq6LfCte44Gg1G8YFgj8bC1Cjpc4SgNkeu0v4H3wHCxrSt/bV4qrgNmumqboYq+flwnrg==
Received: from [192.168.192.207] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id hw13-20020a170907a0cd00b00a3820ec721csm1167406ejc.8.2024.02.09.14.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 14:30:14 -0800 (PST)
Message-ID: <ed08942c-3794-4cbf-bb47-d5a7329a1d60@linaro.org>
Date: Fri, 9 Feb 2024 23:30:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: msm8996: set GCC_UFS_ICE_CORE_CLK
 freq directly
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>,
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org>
 <20240209-msm8996-fix-ufs-v1-6-107b52e57420@linaro.org>
 <abb8d55e-20b6-4253-9308-019f19d5efb3@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <abb8d55e-20b6-4253-9308-019f19d5efb3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9.02.2024 23:29, Konrad Dybcio wrote:
> On 9.02.2024 22:50, Dmitry Baryshkov wrote:
>> Instead of setting the frequency of the interim UFS_ICE_CORE_CLK_SRC
>> clokc, set the freency of the leaf GCC_UFS_ICE_CORE_CLK clock directly.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> Why on earth is the _SRC clock described?

Ah, I see patch 8 ;)

Konrad

