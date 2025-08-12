Return-Path: <linux-arm-msm+bounces-68755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B776B2257E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6242E623A10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A842B2ECE83;
	Tue, 12 Aug 2025 11:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kX3czKT3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1A222B590
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 11:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996847; cv=none; b=TEW9gi0q7dxjKxaJxxjqY+H6dbkyKwdy5PVrtdgQdgnRsxlih07v16U7JyjTDE06S3o/s82+MkR0PtH0UHZoK37XdTfIVoTQWXeDRNyCaq5Kimsi+fGF8w82IJWNnCA2INg9bDlM+QW+IYEPbNjbhFxbuaHcS6B88yINM9+2yLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996847; c=relaxed/simple;
	bh=96w63sZCpX4D5zgyhsFlMuYnebVa9N7jxdKqTc5fR/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RScPRkWFuMPL+u1rPQedVsfpSno7iPlTQUCtuinvaOeixBHINxPZj06H2f/4oiQkNgW9H63iisKHh1+K4Ekok0zGO1Rzqwc2Rtr7Za58yUpVfrpnDtngB4DBBDXHYGh/23m8a1CBUS1FHWEfP1vplT/wBV6HMhd/Rk3WRF6MXwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kX3czKT3; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6155fbff3caso879206a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 04:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754996844; x=1755601644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+Sv8jPaw+SqIVKrhCgaMsFD4viArt0LMaeIeXN266xI=;
        b=kX3czKT3el3fdGcjWurqUsm31lZrU8z/gsqojZ4uhBfJmpqMh2Y7bP2iBoW23mz1hT
         vc29UlceUX/4H9aU1Wn2SnqSNhv4NO57B0igMbBQBc7CEcYz5rW/49hKUhefSDtokovI
         Hl1+xdB1GN7cTRrpawxOQX2UJx6mCRFjRB5YTeVVNeKb2ZtGkXfo09UQfbj1g8o3ruLK
         oGsSf0QhGtywG4555wD+8ZrfPJvTHJQFsOZmvBsCzeZcPmoM3D7vDh+MLcpd3/62MmPk
         DgQOiBYGR5M6ZzHJIA7az/I1V/jTj67tlNc5PYrKDtxKV7XOn6mEmarBuy3PY8ZFTbbb
         Ib7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754996844; x=1755601644;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Sv8jPaw+SqIVKrhCgaMsFD4viArt0LMaeIeXN266xI=;
        b=iWGeYWO3iPqbPuSOCMCu/aT0UiY+INdASIs5ITRYN3PiVPYzxLYkCeitU7NHFxCkkC
         2w18DlBhAWlfaU+B47vkM8gdiTJCVqHpHLLwD/mN4byWRC39ebV5KzpLtp9N9TpYFdqF
         9rIt6nEWiB6xzv6izhaUfJNL0+xdWSlWUyzBGZZk++UYwJT129NEuP+gZZtqUmbnVsOa
         D7zRUUQC34/XN+4gUMPawON/NyHYKpTQcyrMgkBeX/EMkhwIqy3buHY7kxIcP8nE9+pP
         0J/841G+worUFw6o5I21QQQMVIcKdlM8NkmY4OX5hvDbYlft/utQkb8BBwgMzeQtVgpA
         yt6A==
X-Forwarded-Encrypted: i=1; AJvYcCVXKppD5116+wRnN7zbs8hfYKBf0VtFbEbfI4EGDJvbc+ax/l61GC5ddy7BBkG5VgExM58k+/smQrjteP4L@vger.kernel.org
X-Gm-Message-State: AOJu0YwoAgUQl3dpRZ9MkYRBalR2Jux3IEWgdwHvOAyD0bUxNqeceU3J
	/7P9IMYMclB8M6KfvtWz7aMCNgM0rxBcl0TgRiQinvduTWR1dShuReL9UuDQL6JOoEQ=
X-Gm-Gg: ASbGnct4FlagMCeGMrLj3X91/Vg/Cy2o1gTcmK26AX+8B8/WZl7ZZ2lc4SMj54gTke+
	EaxJ4eRUWcD7NtUE2fC3WN/jih/DLlzlDe91WKx+F9PHRQvjrVo01Jhg87DMQnn+BCCPaNtJjdq
	0v1WHXFL1BL+S972c2CDW/66Rzdizr8MHvoBSNemnrpUOfu8DEjz50RNdlpJ9RkiEo15wTtKwwx
	hrWOS4JOkyroxa92AsCkUMhOA4XVHglnu7sGPcrQMpzSgRyOsfbpmpcQOXtBo4KwiVxBq7sDxFk
	vJpEWLAtrJ2I50EoOa9ot6JAqvtzshiZWIfIGTAWMx03Li2w7tw2hYa7SXjGUzHIpSa0Ds6IRx7
	eRRwoqW8mxnyVBJ2108ozauarJYuMX+/qcbXZ6OqQNlg=
X-Google-Smtp-Source: AGHT+IFF/0cevJfh6bkJS+lpabgy6MCLZ1GHfQEyiTwW3uR73zggkhgfbYZVORIytJA2ybIMTSjbrA==
X-Received: by 2002:a05:6402:27c7:b0:615:cd56:8556 with SMTP id 4fb4d7f45d1cf-618598c0b8fmr450209a12.1.1754996844205;
        Tue, 12 Aug 2025 04:07:24 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618465fb431sm1909571a12.33.2025.08.12.04.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 04:07:23 -0700 (PDT)
Message-ID: <3239685a-97af-4d56-a0cc-984f26db5f76@linaro.org>
Date: Tue, 12 Aug 2025 13:07:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] arm64: dts: qcom: sm8750-mtp: Add WiFi and
 Bluetooth
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250811131055.154233-2-krzysztof.kozlowski@linaro.org>
 <l6u4y3suv3dpylexbiiznhcuyanlc4ouizhzj2cchblaf6o4wg@fe4laxrioaj5>
 <481985cb-fa84-4b09-9b95-948ee70b557a@linaro.org>
 <k7mw7rj7cno3con2t57nps23y7evd3da6gahyl5gnrxss7e3s4@qncnuekxr7lb>
 <f7704cc1-95b4-4860-86ea-96ec18f61c8a@linaro.org>
 <ibitgekdjsktpvr6zmouuhgzcbfjfeuv4l4zsl6vszv4hauug5@one6zo6gdykb>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+AhsD
 BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmgXUEoF
 CRaWdJoACgkQG5NDfTtBYpudig/+Inb3Kjx1B7w2IpPKmpCT20QQQstx14Wi+rh2FcnV6+/9
 tyHtYwdirraBGGerrNY1c14MX0Tsmzqu9NyZ43heQB2uJuQb35rmI4dn1G+ZH0BD7cwR+M9m
 lSV9YlF7z3Ycz2zHjxL1QXBVvwJRyE0sCIoe+0O9AW9Xj8L/dmvmRfDdtRhYVGyU7fze+lsH
 1pXaq9fdef8QsAETCg5q0zxD+VS+OoZFx4ZtFqvzmhCs0eFvM7gNqiyczeVGUciVlO3+1ZUn
 eqQnxTXnqfJHptZTtK05uXGBwxjTHJrlSKnDslhZNkzv4JfTQhmERyx8BPHDkzpuPjfZ5Jp3
 INcYsxgttyeDS4prv+XWlT7DUjIzcKih0tFDoW5/k6OZeFPba5PATHO78rcWFcduN8xB23B4
 WFQAt5jpsP7/ngKQR9drMXfQGcEmqBq+aoVHobwOfEJTErdku05zjFmm1VnD55CzFJvG7Ll9
 OsRfZD/1MKbl0k39NiRuf8IYFOxVCKrMSgnqED1eacLgj3AWnmfPlyB3Xka0FimVu5Q7r1H/
 9CCfHiOjjPsTAjE+Woh+/8Q0IyHzr+2sCe4g9w2tlsMQJhixykXC1KvzqMdUYKuE00CT+wdK
 nXj0hlNnThRfcA9VPYzKlx3W6GLlyB6umd6WBGGKyiOmOcPqUK3GIvnLzfTXR5DOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92Vcmzn/jaEBcq
 yT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbThLsSN1AuyP8wF
 KChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH5lSCjhP4VXiG
 q5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpFc1D/9NV/zIWB
 G1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzePt/SvC0RhQXNj
 XKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60RtThnhKc2kLI
 zd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7qVT41xdJ6KqQM
 NGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZv+PKIVf+zFKu
 h0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1qwom6QbU06ltb
 vJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHpcwzYbmi/Et7T
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <ibitgekdjsktpvr6zmouuhgzcbfjfeuv4l4zsl6vszv4hauug5@one6zo6gdykb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/08/2025 13:00, Dmitry Baryshkov wrote:
> On Mon, Aug 11, 2025 at 04:40:09PM +0200, Krzysztof Kozlowski wrote:
>> On 11/08/2025 16:33, Dmitry Baryshkov wrote:
>>> On Mon, Aug 11, 2025 at 04:25:47PM +0200, Krzysztof Kozlowski wrote:
>>>> On 11/08/2025 16:22, Dmitry Baryshkov wrote:
>>>>> On Mon, Aug 11, 2025 at 03:10:56PM +0200, Krzysztof Kozlowski wrote:
>>>>>> MTP8750 rev 2.0 (power grid v8) boards come as two different variants
>>>>>> with different WiFi chips: WCN7850 and WCN786x.  WCN7850 is already
>>>>>> supported by the kernel, but WCN786x is not.  Both of the board variants
>>>>>> are considered newest revisions and the difference is only in MCN
>>>>>> numbers and internal codenames.
>>>>>
>>>>> Are they soldered on board, installed via add-on cards or installed via
>>>>> M.2 slot?
>>>>
>>>> This is MTP, so same answer as other MTPs - these are replaceable parts,
>>>> just like you can replace display or modem.
>>>>
>>>>>
>>>>> Are they going to be somewhat compatible (e.g. on the BT side?)
>>>>
>>>> No clue, you need to ask Qualcomm people - it's their hardware.
>>>
>>> And you (hopefully) have access to the docs.
>>
>>
>> No, fought with that for 1 year, got some basic docs only. It is very
>> difficult to get any access to these docs. I assume you mean the MTP board.
>>
>> If you mean Bluetooth or WiFi - I have 0 access there.
> 
> I mean WiFi / BT. Then you can ask Jeff or a corresponding BT maintainer
> to provide necessary details. You make it sound as if you are not a part
> of the system. You are. You can talk to necessary people within
> Qualcomm.


This feels like creating obstacles and some new sort of requests that
contributor for hardware A has to come with answers about completely
different new hardware B, so please provide rationale for such request.

I see no reason why compatibility between bluetooth of WCN7850 and
WCN786x is relevant here. Even if I knew the compatibility or
differences between WCN7850 and new WCN786x, I cannot publicly speak
about them.

Devices will be different, they will have different compatibles, thus
you CANNOT have one DTS for both. What else - not my task, not my
expertise, not relevant to this submission.

Best regards,
Krzysztof

