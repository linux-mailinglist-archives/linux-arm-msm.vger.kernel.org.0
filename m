Return-Path: <linux-arm-msm+bounces-76605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71965BC87DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 12:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C4253B8239
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 10:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BF42DBF47;
	Thu,  9 Oct 2025 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSC5xvAo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664552DA74A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760005756; cv=none; b=mRYfl1OTz76DqA/TdDIzftabEGFkHS6KUexbtOpKPNSL9qQVqMEVKLW7CddcyqfzYufJCoTdRYl+efevdHlh38QQIDorqW5OKvc3rQ1bcmr8O5jX30okjbGx2zAoB+ux8fYGm764na8iMhu2qskmhe43UoSNHNtpTUc5qsptCnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760005756; c=relaxed/simple;
	bh=FDxIxe4rrT9EFKfaiQSkY7uRg7lntFD+1h6BTKUCt7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kWKdZkJTPHCEL15P5COC77LmFY/HzXvp3WanVwWOnwD8NFTshAIKjsB3pRmutMfmONvQUHmxhs289gOXFCEJ8L+e4DCo/4YHEypxYwdlA37/kaHHnbW8qz0aIb9YCFZmW93IYlK5HMeyfjRQKzedymIECiHtiBT97E6kMfXQdEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSC5xvAo; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b55640a2e33so497767a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760005754; x=1760610554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zlubuQukgGynRQziDfvVYtUpQMXJXhr9rZla4HttFcA=;
        b=gSC5xvAokjShD+PsKggST691cxCnkHvZuaYgwJvPGMuW9+trT4lRS5GBf2vF3891SG
         gDtnailOKmkLhIWq8gbdM3R3MY0Or6FkFokHrF97Jhniqn5/xR/VhE5GtRgSW9glEF+a
         8kNEZ6HS1NIEq+wvMvzk+FKpS0bkrddk64k4DpVfPOv+ZhhA7oIIx/6t2Q4ZzUeWLHgI
         5vLjZmfDqV039+/A5KO4hJmbUr1svp0DV3+v/Bpm6FZxNnLgLGsGiZgq+0sWLqj4O328
         /h6OY3CylEbWG5SOS+3ZOLZHpDkj7M4zH0ahOQlA3ktsTqAbwmKTts+S3RQl/x3+LPeb
         1VVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760005754; x=1760610554;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlubuQukgGynRQziDfvVYtUpQMXJXhr9rZla4HttFcA=;
        b=qO2eN7X/ga01WBjN1eHWlJNHoVOAvTImWDCtRkUC5TYNc/rR1MXKJpBXPUNVH5nNm/
         U+xq5I5Z1tqKbe5X25AYDV2RPGr2jOBEuPSjIjXkhu6xUiOKwCaEGaZLdZvKsGfP1wPj
         e+ZUNjN9HGaeUxFMNTYnDIK2P5ByMOaEu9jmkEj2WTsKtAMV4Cy4XHwXujGFRNr9+Owl
         JXm2DPaWuuAtvH7uYQ2tbYZyv+iuUJZo1Cs4MrqVmjG2+EtId/kHHGS8v79omuBJ2ifS
         FaGGllmngu3xs1zk9bscy1ImDK8G3wPeLOQo9lvmV6OOnTqkJbMzEUSQBfyC20TfxruM
         vuwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG04JKoOsIOSFVJhs6XGOetEqNQE9yCggqOUmbalDvKF9Cm2UqXFqeJsyVvI+dFlF8WkOKOKiL+Bfkxx1w@vger.kernel.org
X-Gm-Message-State: AOJu0YxmPRDvElS30vCDlL2PDMI1c0ba0L3LzEEL7PP3eENYb5V5uei3
	4PsjzOOZNcpyj6ACHOxitwJSIgfKicZfIUQCQfsbMiW6DTfqQudad2cR
X-Gm-Gg: ASbGncswCkhiOm1oTMMpwYxanqoi6dwwiUyw39h0Brga1RG9tfIDiPFJE0EQkrlHZN8
	7fiwpfeRm1t9YRjNZUJd9dCgkvlysD+Dz6l2Fsmzvu7PxWCDwVOOsmAP/w+9P8lQeK24i9k8Ueh
	SgXD2UVcWLhLuZmTTkhOpAK7Nu3tawxnB3rYSLmS2mCkCLB6RMdf78JV3IwOvQ7vj/zJ0wqTZwU
	ReBO7jX3xeRYZRygLH9vTMP82vX4wKMNG33d1fkt6l3CbwHqyPlMR1UMwqQ4ot+Z5BjuKuzx7BU
	sVrxAVDHUg7WVPif9JM/pwHAPhKRRuVchtAzKFo378U3IG3ZR4hvWk8da2O3RakByFcgbl5Wv2l
	/RLrq1TdyzFB+TW9+bpGA7M0dnBzJRGQqNFMAatDU0HpEs9MLF+G4jrvulnaqx4wORWO5Wxxaj0
	VMmIiNQD7VI9LtlpIELIaxenTnfa4kp3Ztfp7+ZrwuK12ua1kJFisJa00=
X-Google-Smtp-Source: AGHT+IEO2EtUyWaNl6oUHUU53SYgeVz8lV6xScF+kfIMwI03/BwrIknXbZ8VQEGY/T7FESuAg+mXiQ==
X-Received: by 2002:a17:903:11cf:b0:269:96db:939 with SMTP id d9443c01a7336-2902741f404mr75766775ad.58.1760005754301;
        Thu, 09 Oct 2025 03:29:14 -0700 (PDT)
Received: from [192.168.50.149] ([121.134.152.93])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29034f961c5sm24015925ad.129.2025.10.09.03.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:29:13 -0700 (PDT)
Message-ID: <cdc01b6d-370d-45dd-a3fd-9866d2a5f36d@gmail.com>
Date: Thu, 9 Oct 2025 19:29:04 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-2-611bf7be8329@oss.qualcomm.com>
 <CAJKOXPc57_0pJ2ZWf2cKSKAcQMc3S_mHKQxJDzWH7t=mgim3CA@mail.gmail.com>
 <5820a9a9-4474-4c4d-905c-0efd9442e5e1@oss.qualcomm.com>
 <o6dzhmlicwiezmxlb5uqitx7e3pjpyuhbjqfumivbdkru42hvn@r4ksfa6m5nd2>
 <540b1de6-c959-4911-925f-8163f5fa5147@oss.qualcomm.com>
 <fdfzoemfxdz2p622hvixpaznh2n22hweit2e43plfu2kdd6kad@reulvi4vs5v4>
From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Content-Language: en-US
Autocrypt: addr=k.kozlowski.k@gmail.com; keydata=
 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
 PN9NZAOyb771QoVr8A==
In-Reply-To: <fdfzoemfxdz2p622hvixpaznh2n22hweit2e43plfu2kdd6kad@reulvi4vs5v4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/09/2025 19:03, Dmitry Baryshkov wrote:
> On Mon, Sep 29, 2025 at 05:41:10PM +0800, Jingyi Wang wrote:
>>
>>
>> On 9/29/2025 5:34 PM, Dmitry Baryshkov wrote:
>>> On Mon, Sep 29, 2025 at 02:20:54PM +0800, Jingyi Wang wrote:
>>>>
>>>>
>>>> On 9/25/2025 9:48 AM, Krzysztof Kozłowski wrote:
>>>>> On Thu, 25 Sept 2025 at 08:37, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
>>>>>> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
>>>>>> interrupt.
>>>>>>
>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>> ---
>>>>>>  .../bindings/remoteproc/qcom,sm8550-pas.yaml          | 19 +++++++++++++++++++
>>>>>>  1 file changed, 19 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>>> index be9e2a0bc060..031fdf36a66c 100644
>>>>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>>> @@ -35,6 +35,9 @@ properties:
>>>>>>        - items:
>>>>>>            - const: qcom,sm8750-cdsp-pas
>>>>>>            - const: qcom,sm8650-cdsp-pas
>>>>>> +      - items:
>>>>>> +          - const: qcom,kaanapali-cdsp-pas
>>>>>> +          - const: qcom,sm8550-cdsp-pas
>>>>>
>>>>>
>>>>> This time maybe without HTML:
>>>>>
>>>>> This looks wrong. This is not compatible with SM8550.
>>>>
>>>> Could you point out what is the difference from your perspecetive?
>>>> it is the same as SM8550 except for there is one more interrupt,
>>>> which is also described in this patch.
>>>
>>> I'd second Krzysztof here. Your description points out that it is _not_
>>> compatible to SM8550.
>>>
>>
>> Here is the binding for sm8750 cdsp. Fallback to sm8650 but describe the
>> difference in interrupt:
>> https://lore.kernel.org/all/20250221160036.159557-1-krzysztof.kozlowski@linaro.org/
> 
> Interesting. Let's wait for Krzysztof's response then.
> 


Because it is evolution of sm8750, so it did not go back to old design.
from three generations ago. This is compatible with sm8750 or with sm8650.


Best regards,
Krzysztof

