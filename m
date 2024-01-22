Return-Path: <linux-arm-msm+bounces-7765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4718F836004
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 11:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B71091F26AE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 10:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D82B3A1DB;
	Mon, 22 Jan 2024 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s/LtA8vw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1A73A1BB
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 10:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705920407; cv=none; b=qB5VudeOPAYHM48BKNKcsEkMFJT0akAWdISVSZ7SDehF0DSG9bcltqZiSXKioxXSiRIxqIuNaGW8FLsnXfYGrlRwNpEnWXKEAx7F0BqiMZLMh3grrPW4WPTR4od35VLl+T8B/H0iwjkxJAK0o7T0ze4YiquIIqCq7TSVuRDi9iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705920407; c=relaxed/simple;
	bh=Qdi++BPpN4xADY3Ws9MKWlDcELXeuOPfNA0zq22E1lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFBbxRSY8kLlMgqk0WumLk6U4EvLUaPS7dLGgkHb2TLkfK6W/FOQhBWQlueFas7gmxzRNvIEUK4iwPMPIlJoQnOlIAouxZ6ACt/tagq5Rvl1yUE8wX/Iy3OMNcDuRfAJkY/aJ38yvfo0PPm0fxpvO3L7ql+vidK6HuR6cyZzhI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s/LtA8vw; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55a50649ff6so3116624a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 02:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705920403; x=1706525203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WHUmP85bYrqmNNOvIwdt3N2CuMyu+xnFnMaYntAOhIw=;
        b=s/LtA8vwEetTDOBcb+yaZGhj8JLW7gioeFox6H99bii8YdM6JIyJ1Rrcm+rgCNaQCJ
         qIqBacWPnJYtDF267pataLn4m3WsJ6KGU3zCDVqUIesZlHUQsLN+hSLKIIdF7FgpGpq7
         c0wcA+LtDPE42+pKGgp4fZZLYlxMk5sifukp9yDSIGOFfQz3Q9d7+PNGm1zacsBGHpQd
         IJPEn7ihfzFrVVRVgzLb1OKqbYcWNhc3fmT5MKtDXG8JxTxLAqr2XSVqy74PamcTOJ2w
         fOymQlg+I26f9BcsZEcNdSRkInOUQgDNRBIkjG/B7A5Jw5qZYc9gKIR8tkpON+Mnlj/C
         FZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705920403; x=1706525203;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WHUmP85bYrqmNNOvIwdt3N2CuMyu+xnFnMaYntAOhIw=;
        b=PPA9+F5wnOOA12toCAhau/gRWcvjp5S3OugeiTsTpPrYu4xk3dYm1Kp6//mpzf4gwB
         DCCXYovg93lf/YWrofMtR+xqnL4mjbUedCiXmjqFOySPxUF28Hr5ql33Tg6Y8XWDMLGr
         lqM9m9W3S9rVklRH1I74ck8RnpGLAKD3a3y3YgHNn2qv1o8CNlrtieFKwLTS0Jbc8H4T
         pgWCmrzRqpOhoJ+KDMDLfXhpxP5HpPGAgH66aNRf1EYNQKxIvvnnpznuU4VxL2U1xxCg
         8nSk0ApqIVx6NGXU2qK97uw3bAWDVP1xK7LT12TmqIPLPeEeSSNomDfBuvCN8YnSCZHw
         3hDw==
X-Gm-Message-State: AOJu0Yyw5qtl09ZnCctqaoFLuG3lGVuTyV+7TF2BMU4Nid5gMa3GP5N5
	bdNmy7DUjU+MsdiKK3VnnS5Y2xDJKvX3V8TuQjRoqwtZFmR+3/85QNgFyeSwL5Q=
X-Google-Smtp-Source: AGHT+IEUX1EdKIuQMAVePF9Ofx6NGtmYXcsWrE2Cs1IuZl5YQs5RUT61OIgFxTYCtpqFtxndvhWl5g==
X-Received: by 2002:a17:906:99d6:b0:a30:5299:c35a with SMTP id s22-20020a17090699d600b00a305299c35amr661177ejn.110.1705920403190;
        Mon, 22 Jan 2024 02:46:43 -0800 (PST)
Received: from [192.168.231.132] (178235179218.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.218])
        by smtp.gmail.com with ESMTPSA id st10-20020a170907c08a00b00a2fd76dddebsm2387487ejc.35.2024.01.22.02.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 02:46:42 -0800 (PST)
Message-ID: <aa16d6de-c8f9-437b-89b7-357f8063e0db@linaro.org>
Date: Mon, 22 Jan 2024 11:46:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: aoss: Mark qmp_send() __printf()
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20240119-aoss-printf-annotation-v1-1-27e2ceb8937a@quicinc.com>
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
In-Reply-To: <20240119-aoss-printf-annotation-v1-1-27e2ceb8937a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.01.2024 18:13, Bjorn Andersson wrote:
> As reported by lkp, qmp_send() would benefit from a __printf() marker to
> allow the compiler to further validate the passed parameters, fix this.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401100855.UYl3HPPt-lkp@intel.com/
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

