Return-Path: <linux-arm-msm+bounces-14888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE218872F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 19:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39FC228316B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 18:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689CE651BC;
	Fri, 22 Mar 2024 18:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gdRSYolz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F3D651AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711131775; cv=none; b=agyBrvhQ0tdhBHwD/8Q/hF4521CaXQwJ9DeXQi7BLXMKWHAl5db8nxblImm1CxZ+5F/83Gv8c1+UlmOOgC7A+XHofyYalv8dKPIgxVON3GW3cTlvKQvz3fuhFmGB2Qb73n4faA1IsZMjMM6WQtVhX2lt5wGMY3cioJVrD6xtgQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711131775; c=relaxed/simple;
	bh=qkQte3r0ijCtO/RXb6KA6OLOuQLxORYyhLd8+PxHMCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2/owN55ZCH3iL2grCX6dra4pDr9EoKDMwl8wja+3HP5s7bbUif2LGYONkeWlmta6ozOpXKNph3WT7ubZWm8rkMrbcEdg37P6+x4Sm7b621/EJbmq5XoJDZlw/bao8iUPARQKmxNTn4vlvHbD3Ca8NviPouSDEmtJnyltHw48YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gdRSYolz; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a4644bde1d4so338007766b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 11:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711131772; x=1711736572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MveXzUtHIxiGC+UvZrjMJW/3zlt1prAejsyF3p/A0e4=;
        b=gdRSYolzpYBhiTeiMEiuqdEKDPYutLhi/yoalMGgrSsNh9O3aV1zk8g1wtZFX406oz
         zbPbLKI7CPIKmACv0SFyz26x2ftxqUsEfijypwRlTLyohTI7tYXkGNgWL/zue+WKC14E
         EroeMLHIhzZ7KLchW5EfkKMXx7zAaoxtQAzQig+hzc1KIoNIwXwAe9hvkuhU3JSU2lPD
         x4n7luzZLpXGb3ZKdt2z2hle6LKvHw1xClCHYfXzQ0LiSdcrNxVTKFw5Aw4CUXJYiCPz
         LYzYZYKCC2mYEVDjdL/X4z+hRbFMrPTFr01txO/RHdk0RmDChtKF5HPCxDXgjC/HJGSE
         Lahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711131772; x=1711736572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MveXzUtHIxiGC+UvZrjMJW/3zlt1prAejsyF3p/A0e4=;
        b=q+gUsEX0tsd3cpiDopbpwRA2vUTXsLRlZPrTQOu82apz1BJabXeSRV7RmwKsAt865B
         5Q99X/JD57wAb4TgSoLExWs1jGcdE/GBsAf2RubXVNfHakSsz5qtULpKX+9rIUiV//+Z
         SmOYE1WctAF5eRimoS+Sx9/B/Z3QQh1d2xnUJeo2wnVhmUSUIjxGGR+msgRmQj8kKZMn
         CZ2zi553Pxx2NacfyCL5OD3gqlNr3zyGOiIQhzm0vZwZHmjPt9r2xLRNIZSFbarjJTgB
         laXGqJhGTIwxym9FU+vVaVy7rQqgoGq5SeXXN4X4IqcVoz5y6UR+2ZehjC5aNR0G/Xxh
         bejw==
X-Gm-Message-State: AOJu0Yw1da8SiBKo2sC+i1rl+prJz14pyKtesVDaCbeC2pAdEwSvMMbV
	nTITRJ1NYWbBWb+mamBgoXalZpgqii8VLNK67AB4Pcf+gljkazhh2+nVHyWocG6saMAq5V2vJxB
	nkAg=
X-Google-Smtp-Source: AGHT+IHR/N1B5eWWzUpqIvN7EWkP0veGaqivyFrZDe/pkqJaeePtFEmggg6ApO1eMFdLjsorAkHZ1w==
X-Received: by 2002:a17:906:c00f:b0:a47:20a1:5a4a with SMTP id e15-20020a170906c00f00b00a4720a15a4amr360290ejz.23.1711131771926;
        Fri, 22 Mar 2024 11:22:51 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id w24-20020a170906131800b00a46b10861acsm77304ejb.208.2024.03.22.11.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 11:22:51 -0700 (PDT)
Message-ID: <728bb2bf-c5a9-4e7e-8592-0fd7901837ec@linaro.org>
Date: Fri, 22 Mar 2024 19:22:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] firmware: scm: Remove redundant scm argument from
 qcom_scm_waitq_wakeup()
Content-Language: en-US
To: Mukesh Ojha <quic_mojha@quicinc.com>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1711034642-22860-1-git-send-email-quic_mojha@quicinc.com>
 <1711034642-22860-2-git-send-email-quic_mojha@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <1711034642-22860-2-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2024 16:24, Mukesh Ojha wrote:
> Remove redundant scm argument from qcom_scm_waitq_wakeup().
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

