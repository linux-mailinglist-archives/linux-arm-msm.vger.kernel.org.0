Return-Path: <linux-arm-msm+bounces-59705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 655AAAC6BF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 227B5A255A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C0828935C;
	Wed, 28 May 2025 14:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="erkqbxt8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7EF28850D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443072; cv=none; b=abq7vs++5fBM6qk6HYK9lPKrbOd25fqcN+BlqmAYp32fe1twAccz6sJOZMS13TCIgSqI69Sp20QKpw5WPMEK/fnQxfDKI8go2mYk0QP/7qlrpsfZ4TIKP+UojV+8VqdRHNYnCZ69yXSgUYQVAOaWKZLZGL0vIggKJz3P1O74t6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443072; c=relaxed/simple;
	bh=E/d0r6OOpns+M1s/P1Grzi0S5pY57VyTC8g4426MF4A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Upnm7tMgiZeK8jFcXWQYs1pxIBOUIQvmK34uD0v1eSnbNn+Nk75FQl/91fVTqXx8bcKSak/Sw9lNzDvDPKjGL5WQbe+zUbpNu6ar0FXE2rbWWZwzpstC1uW+CZSURYQbPK0Pe3l7tUoO4T5uS+yiHStTP3uUss+mKfA0Q7K60ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=erkqbxt8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so36614835e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748443068; x=1749047868; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8e/FVNVV68OMZMjntDEe+D+IU61dqOd3DPdYBN+2WAg=;
        b=erkqbxt8Z1K4KelvFp4KBetLfSTi7qibcWWSbW+liggles7H3+h63gj9e1GpVyRDeM
         1vIf/sIiVKj5E7gQo4Lvtc6F4a84YfMcW7ln2HwqFrP+cetnIoeEZDbFlVFA7xytmAFk
         rwSpK/RWeIkyfj0HDn1NTLSJlEvwN4eyJmKO6jei2b1Cn2dxlpeKXOa0PWtAEgSqp+a8
         ba8ngUVlKeG4wvmkozZigPdqn+YP1lLYXMYWAxjTOIvCyEAdxlVRyJf184woEILNa2gV
         3bMnxsSkmq/wNunhPVxfyXhEk91yVFGogEiJD4a3u0vwqZQcIVlFF3TbxvAK0YRbifE1
         efuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443068; x=1749047868;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8e/FVNVV68OMZMjntDEe+D+IU61dqOd3DPdYBN+2WAg=;
        b=we7wZIMeY8bwaRlrnPLoQ8X1JeIQbDpl1qT4v7Fs1L6SvHGLdDzc9AoLHda74rlvzR
         BSBHP47C7cNRaPZEo89UP8W7jSYEcgLvXNhq4A9K5kXSdOyKpC1FZy3hQ5aUC9o2Owf2
         8brgn/YOAanuMUJVV5LpHZKxoG/LHimq0JRsQHMSs7R7lyeKgtnRozIx0qOh3VQQ5oyA
         x0BQayl33oC8useUqIP1WgI+sYb3i2yWtTAjZtGbWfZbcaoZB3m5oB/t70QClnLaF7Nc
         adt4iUIgv0F5KIBOqixwgfhHW6l10OeQE/vscJMdfUlBMJQTfMlKR4yo8s0VmHaUoSXr
         7Jdw==
X-Forwarded-Encrypted: i=1; AJvYcCVDP+IFtnLVGl+peoKkGzGy5oEx6PuyK6GhZSwiTjtVJLLDBSM7E7+hvTKqeTvtRik5ZFNLJzNke5H63166@vger.kernel.org
X-Gm-Message-State: AOJu0YzU1z9dw3MuiaSfk6fNjaae56mKPxZyzFn5xtvx2gKDTJmHUN59
	ZtC/5rY+dQjvsUyeW+F7cTMQ/fN34AJd2rTihaDUsQymUGZqCAzgn1umolEE3Siiz9g=
X-Gm-Gg: ASbGncu1J7JJwSQ8NyXDWsVgYesO51P4o7VSvL5TUqGnRbs+Sq03ALLS+c8bdzB+Hz4
	5AIu4MuCuF3EfRYNsa6eQTJc9ZqCD5/P3F7RNPogD4k1nmfC3ifEaJ/Z71dMXoFJMYjuaZVzh1E
	3VUSIPSRsp9dRB0pbsRlWRcWIufqoPbL+zaPTdNnz3zcuNYGcKXTnwZpEpFeImZy6Nkh9/G4VjB
	y4qcGxUKPB91wvd4knNCgSqGLij7YPJLfHzEI7ygS0APQ6qpOfFFL2yvSPGOY2Rv2qiROixvQmr
	Z+UnHdFO0i5PppZRhK/YToj4NTq5GBoj6JtxPIGZrJ4IgliZM2oubN/7
X-Google-Smtp-Source: AGHT+IHIM9BVzOCXjIDgxXeOl1dIOtdnPxWp/iK5O/TdB3YnpE+mVV2tCG/RghqPvH2Xw5hFmwSDyA==
X-Received: by 2002:a05:600c:1d0d:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-44c9141d90emr133062395e9.7.1748443068029;
        Wed, 28 May 2025 07:37:48 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064a133csm24375355e9.11.2025.05.28.07.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 07:37:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 15:37:46 +0100
Message-Id: <DA7VC87A0OMF.1X5XEWVCHFLE5@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Mark Brown"
 <broonie@kernel.org>, <linux-sound@vger.kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 02/12] dt-bindings: arm: qcom-soc: ignore "wsa" from
 being selected as SoC component
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
X-Mailer: aerc 0.20.0
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-2-9eeb08cab9dc@linaro.org>
 <20250523-fancy-upbeat-stoat-e9ecbd@kuoka>
In-Reply-To: <20250523-fancy-upbeat-stoat-e9ecbd@kuoka>

On Fri May 23, 2025 at 9:12 AM BST, Krzysztof Kozlowski wrote:
> On Thu, May 22, 2025 at 06:40:52PM GMT, Alexey Klimov wrote:
>> The pattern matching incorrectly selects "wsa" because of "sa" substring
>> and evaluates it as a SoC component or block.
>>=20
>> Wsa88xx are family of amplifiers and should not be evaluated here.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Docum=
entation/devicetree/bindings/arm/qcom-soc.yaml
>> index a77d68dcad4e52e4fee43729ac8dc1caf957262e..99521813a04ca416fe90454a=
811c4a13143efce3 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>> @@ -23,7 +23,7 @@ description: |
>>  select:
>>    properties:
>>      compatible:
>> -      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[am=
x]|sm|x1[ep])[0-9]+.*$"
>> +      pattern: "^qcom,(?!.*wsa)(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|s=
c|sd[amx]|smx1[ep])[0-9]+.*$"
>
> Why dropping front .*? Are you sure this matches what we want - so
> incorrect compatibles? To me it breaks the entire point of this select,
> so I am sure you did not test whether it still works. To remind: this is
> to select incorrect compatibles.

Thanks, great point. I tested it with regular dtbs checks with different
dtb files but I didn't check if it selects incorrect compatibles.


> (?!wsa)
> Because qcom,x-wsa8845 should be matched and cause warnings.

This is now confusing. I thought that the main job for the pattern above
is to avoid selecting wsa88xx amplifiers in the first place. Or, if I can
quote yourself: "What is WSA8815 that it should be here?"

If said wsa8845 with incorrect or correct should be selected by that patter=
n
then why not just leave that pattern as it is then? I am lost.

> And probably we are getting past the point of readability, so could you
> try:
>
> compatible:
>   anyOf:
>     - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar|sc|sd[amx]|sm=
|x1[ep])[0-9]+.*$"
>     - pattern: "^qcom,.*(?!wsa)sa[0-9]+.*$"

Thanks, that one is much better for readability. I'll test that one then.

Best regards,
Alexey

