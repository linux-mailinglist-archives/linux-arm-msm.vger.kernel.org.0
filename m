Return-Path: <linux-arm-msm+bounces-10418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA9884FFD9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 23:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7592280C03
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4F421350;
	Fri,  9 Feb 2024 22:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VeuEIQhh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E2718053
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 22:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707517571; cv=none; b=I3mCNXpnqCTuQlTIePEfPycdMjt870tbTVB2ZfWGQ+RUXwS/pHOQZREewUPoZf+in14Ad744LwaTGwWjTJWRBJrI2B6jlB62SaFY6Bm/v5il0RTe71vKRH8agfCUiiOe7Yc6a8ihcjVdwvplbiN6IavFQoUhNOJOkEjpY9hRwKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707517571; c=relaxed/simple;
	bh=hrlixnvfaMKcR+Mz2pLMiXCcHS4q6KYRBYEA3ptrVPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cp3InvoBW1U9ed8gyfFanxS5rm++a6DuL6yjdKTk8Q6x/jSVUKB+WSdym3SieuEU2QCXjqn3eVnBB0gz3rsu+342BtAhw8XbQLHUS84YjIFgzHWuXL0AIOornno1pGoCV5V33wsCO4ujEUr+FsCzR8cg4YUky+NluY9bUGIX1gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VeuEIQhh; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5114c05806eso2332341e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 14:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707517567; x=1708122367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yphHxXwb0WbMrWU82ru1cxhNr1b3+e/qN26jPPunEow=;
        b=VeuEIQhhhQp1nBVfGs5TEIzl0D6wWxJF5voMbei6OQLW0RZFC27tH29+Z3g0c9+vR5
         nu2MRtaYXD7RcdW71exa/UpdmZiVvrFu9Tmu43O/Y27BR7U/oIiqL/KA6TFXZmQW3MBB
         U/mj/KB8CELriJomKEuJZ1w9ZlLfWpz8HKnYuyCh/bgTqAY5fXC6RJZmTiGg9xQZLhvK
         EgsZay9UyMKq/apvRpK2d/8bNEepeKxuH6nM+VjzHs7H12MZNlrpfaQw5DNAGLdlNoUp
         J/V9W4JudaOCSWfGNsTQ94CGtOGycwR/xOkRhSh6+bxvnrfwOUz3mf4MZT3cHH+IltfW
         oe6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707517567; x=1708122367;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yphHxXwb0WbMrWU82ru1cxhNr1b3+e/qN26jPPunEow=;
        b=Gyrp+B0uybW1/Mm28P+Zn5vwmIfyqqblPwrunAD66GA7B8VhjmWojxIfBRhOwUrNBT
         c/z5m5uwQOCNWdiNAzGUOtkuO+POO13/LAT2uqKrBK3D2TIiUQPitTsukd26O2T20XnM
         nGNye8uTCpVKjzjavOqNagts6wGgZqnE5ixLEqUuaUPnU6tcu1RvUjMxaKxohkuoZ/i8
         akzXwg5SvlmPJR4uuucjcN5hWOCj1yWQQhXQi7vPs1NPhaqfcUkN/VMdjobARuk/iKq9
         5yoaRowvtc/n8157e6RNXEsKWvbaRgqsdrd9PfgZUFEYAH0Rg1tedvof8jWD12RKZpE9
         hHVA==
X-Gm-Message-State: AOJu0YxF16a9rxZIIcZaWRigPVgBz4QFoBngQV00zr/+CAQMsIKPzZh5
	uWjraVPAW9FyMhIipYJjoy1BBSx/TH/QMRjKu0acDt3QcjRuEY7PQcIIAZAhGyk=
X-Google-Smtp-Source: AGHT+IFU5eAqt0XT0MXQ016FSr6wKNINoKdQ+iMslKY4+vdsWpXkEZpHelFbpxspwtMeN9/ZCsvm1Q==
X-Received: by 2002:ac2:5465:0:b0:511:5f08:f147 with SMTP id e5-20020ac25465000000b005115f08f147mr236251lfn.25.1707517566884;
        Fri, 09 Feb 2024 14:26:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVY5NCtz7AXZMav2qJqqGxlPLXdA/uqK6c597CF51AQLfvl981I+6K2TTblLnh9pwIKtgNO4DLoARMSW/qEhiKtlRx/fI0g2qbnLsJWB31CYMfGZyhfrQUstb5N699OZ/ARY28YlIRReGkNcVGQubSHlXrstyoA/zTffsPpdVaoO1Q218ZnSEUoK/fW9Zd8zUPKmboC/6c/IGZ8ml+ntVnzaz3dLn7e7kfLn759NZzsjfHmoQsMLTOaawI+d7rehiHYg8++CeV8MTbn4zYT6+3ICOrXby9A8UNHDLWhF8qoKjTqIw8b+xcRi/HdGpvyzeo/5QTGDhz8TMIn7Ea5RLFgSkCgcI/dnvX2jDsXKpXN+wdsHcsdO3dUZhlTJd2y5+8LeN7RYqZyzzLIZO56sdc2blFotd2gT3TSG/d1UWKt+5fxyAotPsNzaGMjihPhyLViXVx+b2yrOLpxxJ7gbJNTlRelttTP2gA27ZD5Ciiupcm9lD9AEWKg2Co0rTOGg5inF/YgvVUDDndkxk9YAavDyn7HHMNvMiRnig56o6o/wg9q8bGp029uoMsmev/VfwO3kvPysJI1yHjANsUgz4tT/ltUyEqsHUZuiQriKOENtg==
Received: from [192.168.192.207] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id hw13-20020a170907a0cd00b00a3820ec721csm1167406ejc.8.2024.02.09.14.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 14:26:06 -0800 (PST)
Message-ID: <ea493d76-900a-492a-87f6-365453e8bea0@linaro.org>
Date: Fri, 9 Feb 2024 23:26:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] scsi: ufs: qcom: provide default cycles_in_1us value
Content-Language: en-US
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
 <20240209-msm8996-fix-ufs-v1-2-107b52e57420@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <20240209-msm8996-fix-ufs-v1-2-107b52e57420@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9.02.2024 22:50, Dmitry Baryshkov wrote:
> The MSM8996 DT doesn't provide frequency limits for the core_clk_unipro
> clock, which results in miscalculation of the cycles_in_1us value.
> Provide the backwards-compatible default to support existing MSM8996
> DT files.
> 
> Fixes: b4e13e1ae95e ("scsi: ufs: qcom: Add multiple frequency support for MAX_CORE_CLK_1US_CYCLES")
> Cc: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

