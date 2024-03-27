Return-Path: <linux-arm-msm+bounces-15416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D354488EC79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 18:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F98C1F30FC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 17:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7007F12D748;
	Wed, 27 Mar 2024 17:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BnXB/Qqo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBDB14C598
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711560053; cv=none; b=JwIEph5SoUZuD8wx3QhzFbgl/mB4b9N8j+3LiQaDD0idu5IfmYO+KQn9/jIxyj5JtwWhA3Lc7I6aKQld23+RwkluuWRSbd5UkfbFO0X0Ml+chwvrFitHU8Yj04fHwyoO5HmCuK6IseGXSdPABo4ftd6HEqASWTzIFv1cPUKDYLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711560053; c=relaxed/simple;
	bh=iq6mfR+Pypv0cLjNcshxFJnXWmcAuxgTZBdMICC3NfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQSXpkWPkQs2AEnnI4tmiefkpUdRRQ3QBSAthpDVKu8I7hkHtZfQDelF8tESlOABQwLcht1SwTyZFQ8bL1ChFj36/7T4yTVdC6YGcLTAyCI7PynXkeyWF/YIdwyywftJg4jugnWzALdR9njp0SaztEH0H3yDibETIeRyU0nMVpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BnXB/Qqo; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c147205b9so187400a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 10:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711560050; x=1712164850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x7bK1CWXDphx1it5hX+qBzGDk5cCZMiQMvvxYefH2X4=;
        b=BnXB/QqouJIvWwUuHKi8Z80zblOBmeT4mq11nfppQonTDamdclUn4iZoPFv7X2hTJm
         cfuoV52ev3Ozpz2tZEqXizst8BFOG2HAx/RUJYAFwMp6jCF0lUDg9rDaH2YI4eZ+US6J
         X77slTFq06SRcrUwMfv8kKrROEiXWX+IFddFu+oQCgBTh/U+jXPEf6XjpY/9agvbo8qD
         XCdRrDgQVWWLetyW3pG+eUn5vcaMixmjpRE8MbhBfW+/HJ4RzJg9dFdUE3QqUsGlJNa+
         8vp3jeAbBiXbLThd7/8hx9qGnu0Mn2f/jJxXH/8puIT7Dbuhq12bacy7YirEKhsODXHV
         m7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711560050; x=1712164850;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7bK1CWXDphx1it5hX+qBzGDk5cCZMiQMvvxYefH2X4=;
        b=FobpuAS83BmCBhp8m/43tHiQuNFHiemCOZ5+lZeb8XINbD6UEEq1JzWPIdspydZB6j
         qzQoY4Gxke14dgKYat/xn45SHaIOy6xJgNGudQ9eYEJCHuJEAQj6vqZanMbsLKywDqd4
         MeCYTmB8VPsTbV248paNFPSgSh8Fq0Qax+PTgp39KnTg5U42Px+IySi0Yzg3/D4C66Cf
         ljjJdCP6s9F2zcKDVfKMoHGhMGzFZzWF02X93HvSOnsYFj9ow5P8iSWM1jHfBAVstymP
         6J0X8+18EN+fk0e2CBedEZ4fvXv5wJR2QLsGXCeoqMKqwHFfZF59crvTSFyu+dTST5A4
         WDiQ==
X-Gm-Message-State: AOJu0YybT0ltOTMwKfPDKSv9Pf8P5s68K0PlEJKGS5w+kFmywW/e/8qE
	NScJdOBGMg2QrudLWarhUpJIuBMD55C9UOLQJVz8DgkMcRZw70G6dFCeFfhjClk=
X-Google-Smtp-Source: AGHT+IG99Ntl7l/93YYkA5WMyia0kX6kFvTPSUbGNu6qe32Jo+56500mzGRf/Wtg/Za5MIFkq+igSQ==
X-Received: by 2002:a50:d782:0:b0:56b:d013:a67e with SMTP id w2-20020a50d782000000b0056bd013a67emr182961edi.18.1711560050001;
        Wed, 27 Mar 2024 10:20:50 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id ck5-20020a0564021c0500b0056c1bf78a3asm2917580edb.28.2024.03.27.10.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 10:20:49 -0700 (PDT)
Message-ID: <0e45efaa-4140-4cef-94cd-f2324d77abcd@linaro.org>
Date: Wed, 27 Mar 2024 18:20:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB
 Type-C display
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
References: <20240326-rb3gen2-dp-connector-v2-0-a9f1bc32ecaf@quicinc.com>
 <20240326-rb3gen2-dp-connector-v2-5-a9f1bc32ecaf@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240326-rb3gen2-dp-connector-v2-5-a9f1bc32ecaf@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 3:04 AM, Bjorn Andersson wrote:
> With the ADSP remoteproc loaded pmic_glink can be introduced and
> together with the redriver wired up to provide role and orientation
> switching signals as well as USB Type-C display on the RB3gen2.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-By: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

