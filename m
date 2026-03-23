Return-Path: <linux-arm-msm+bounces-99216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MBIHAAkwWmTQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:29:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 118022F137A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD23C303204F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4492D390236;
	Mon, 23 Mar 2026 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ye+BBE4k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gCQaEkEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ACF3191BB
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264494; cv=none; b=JpRRh4pF7xZM4ONJ/+zeTx6ZxW0lirQ0Azr/SLkeFiUDZV4K91lnWnBGZS1j1emUZ+EBONuBLSZVMcH3SMgYupVTsan0tds/JGNz4z6Eo4ELqDYaV+45mGThXgxzARMa+7UWFL3ZTCRH9th59EJ+RcetXmHU0oUhOzPO+9w22dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264494; c=relaxed/simple;
	bh=cLFCtM3vNo1q1OQN7GQ9cfbUHDA7Kfmuiw5ZyragmcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IsAhR5lyNd82HeB/nu+O4J8yzVW+Si8ufDFhw1MQxyoVKq9UpFGSvylcct/dlV+YHHvzZ/SJNlnaYkkem3q5qkbmF6Fonu9Xfhefr4y/tU2+qf/69h3y8pM3lo+x1TdeYTIdmR8QdvQ/kRqBFd8/2QTww/tiE3gEX5f3W1yiAVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ye+BBE4k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gCQaEkEY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7Wapc562075
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YY3Tc5YnXTi4hNRW8PsT1kXgcBbe6sHvsCQISPk98w0=; b=Ye+BBE4k5fqx+cLi
	B1mowjqEmSo9un0Y2/x95HjC3PA2fy3ZuOgwi4bVO+S3tVtGpektRXRNokIv0Vpk
	MT9cZW7LrnqK+XwHMSv+gmrjT5klZVREGioqmiSRyXP26jpO7eZjhDkJ57b/LB/O
	mwkfpfSzNtW4qdIfhnwqXZhxETlmPU1OQDIfWR+PKkQ6hwCQY1ql1tLl7VDYXHG7
	+OGVyDpaHxa0l4FRacyzEorRTzj22T2KXWTKiTSNopMY51JYj60Qfm1BTqyX2r9a
	3HDGwKOJc78Hcs43B92395JSQaE9TFARR7as7q4P1zRTpq6fpMLrGWIT0Q3cMI1N
	iQe8Kg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvn4t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:14:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50917996cfaso11288741cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774264491; x=1774869291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YY3Tc5YnXTi4hNRW8PsT1kXgcBbe6sHvsCQISPk98w0=;
        b=gCQaEkEYjaBL8269+NpoYH1KlvwNq86/zIAliko2bIgQttzxa3ors5H74MbKqrzn3E
         1JbtPTCcS3RUU1m4GgRP+FGNwS0lJQ/Xt6mRwuyXDJa0y0E+y9WuDazquRaQ5+IbzWrF
         ZjfYfmKeCDo7NkzvBT4hj0YMJmsL4PlrLQZHK0FmIG3Vr+eSvhJ6M1Yd2XBi6p1EEZsx
         S/O5OuBXCy8iHqQxObc+EnPYsVllSHXKiUCsTTcFTHEVJg3m0gesUpacmRDIdICcGJkC
         7QPUk4Be0DzBTDSI9BcaKZwUu0kvUcGYjVW106YDnhMJOq/Kc0uAU1Qxhi0rpaDuCxel
         pC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774264491; x=1774869291;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YY3Tc5YnXTi4hNRW8PsT1kXgcBbe6sHvsCQISPk98w0=;
        b=pBqi/dbVCIDFcs2kuH4xgWHpaa6PdtQNgXW9VwGFgPqwGos6bU/FPdYanM9y/35lSZ
         FA1leaqidmowzdcHUsQW+KyRhVaxq7aJzq+zhzTnDHJNQTlyx0lgd3biokNklgSHXPng
         8eFq3nN7blwXG4DAMc27qWVzFrw0PLD6Dn/Zx4d32ArPmbamt9uiB21MeRF6IsgRdVxf
         +h7gq7QQte5Y72M5R4Y7rF72wOl+5FS1pu2MWfMDVrVAuVxCjEATI/39+FaWD3pgY/Zr
         IHwehGzApigpsI3Mu1nWqHMqJfaI5elRzfvgHpa9OhaBBU8L2E/CHQ4G1EJVesiyQFqi
         7E6g==
X-Gm-Message-State: AOJu0YwOc0XtLSbI6LwqdbhCftSDc9DsoL88z5CPLu4VeUAkBvJfzA25
	UGrxy5i82iqK2EnfL5eN7nBLMl3v+DbR3jVbGgcz9SSuBegYN8qiGZoOXa/mv0Bb5D0YXN9H7rx
	jToKPIsCg2nUW0+f3TRXOpu2asMzgm4oqpNRMGmzxFlkNgxeNQOY4MV9Uppy4IIm6z+2m
X-Gm-Gg: ATEYQzwhzDY3oyZaMb49rqnBdplX5A2KJT7SzD1ZTveWQRLkbVNYVy+eoV5Y0ENcnXF
	B9WghEZm6ob4vC6C3jamLwtmvqVUHju0Rv/xdAO1Frkt5vQCJu8nZEneyx7pgu1sA3TceoYyp6n
	+0tzkqOUtJs2LW2giPTBGrELhb4jfEZYt4T3bMu944Sv1GCzHxXfiu+F8R8Fq9MWdSMj9uYVuXi
	O87B1Wt1QO/hMx2hQeECtBvt3Ec/buk2q3Ksop/9RggU2aEAgQNAvhAeHtyl51nPvsPwimhUze1
	rkYAHeo4i40OnhNvNipgLaHm1Bt1dT0p+Fm5hK9Q/PhsQovBf+Zf6JyFW7/M5GmufitJfdrCk6T
	D0Mn9rjS2uMuKcjYN4rIjMeG+GfBsZjQD58sPkRJbbnLL6lvx
X-Received: by 2002:a05:622a:17c3:b0:50b:4c63:cd25 with SMTP id d75a77b69052e-50b4c63ce77mr100300001cf.65.1774264491344;
        Mon, 23 Mar 2026 04:14:51 -0700 (PDT)
X-Received: by 2002:a05:622a:17c3:b0:50b:4c63:cd25 with SMTP id d75a77b69052e-50b4c63ce77mr100299661cf.65.1774264490886;
        Mon, 23 Mar 2026 04:14:50 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe68ec05sm405202115e9.0.2026.03.23.04.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:14:50 -0700 (PDT)
Message-ID: <e36e0b01-2572-49c9-b8ea-8f4796c3ba92@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:14:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] dt-bindings: usb: qcom,snps-dwc3: Add constraints
 for SM4250
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
 <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-4-3bcd37c0a5b5@oss.qualcomm.com>
 <e5a8c3d0-7f7f-420f-a5fa-cb177d321112@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTpLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+wsGXBBMB
 CgBBFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmkknB4CGwMFCRaWdJoFCwkIBwICIgIGFQoJ
 CAsCBBYCAwECHgcCF4AACgkQG5NDfTtBYpuCRw/+J19mfHuaPt205FXRSpogs/WWdheqNZ2s
 i50LIK7OJmBQ8+17LTCOV8MYgFTDRdWdM5PF2OafmVd7CT/K4B3pPfacHATtOqQFHYeHrGPf
 2+4QxUyHIfx+Wp4GixnqpbXc76nTDv+rX8EbAB7e+9X35oKSJf/YhLFjGOD1Nl/s1WwHTJtQ
 a2XSXZ2T9HXa+nKMQfaiQI4WoFXjSt+tsAFXAuq1SLarpct4h52z4Zk//ET6Xs0zCWXm9HEz
 v4WR/Q7sycHeCGwm2p4thRak/B7yDPFOlZAQNdwBsnCkoFE1qLXI8ZgoWNd4TlcjG9UJSwru
 s1WTQVprOBYdxPkvUOlaXYjDo2QsSaMilJioyJkrniJnc7sdzcfkwfdWSnC+2DbHd4wxrRtW
 kajTc7OnJEiM78U3/GfvXgxCwYV297yClzkUIWqVpY2HYLBgkI89ntnN95ePyTnLSQ8WIZJk
 ug0/WZfTmCxX0SMxfCYt36QwlWsImHpArS6xjTvUwUNTUYN6XxYZuYBmJQF9eLERK2z3KUeY
 2Ku5ZTm5axvlraM0VhUn8yv7G5Pciv7oGXJxrA6k4P9CAvHYeJSTXYnrLr/Kabn+6rc0my/l
 RMq9GeEUL3LbIUadL78yAtpf7HpNavYkVureuFD8xK8HntEHySnf7s2L28+kDbnDi27WR5kn
 u/POwU0EVUNcNAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDy
 fv4dEKuCqeh0hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOG
 mLPRIBkXHqJYoHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6
 H79LIsiYqf92H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4ar
 gt4e+jum3NwtyupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8
 nO2N5OsFJOcd5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFF
 knCmLpowhct95ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz
 7fMkcaZU+ok/+HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgN
 yxBZepj41oVqFPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMi
 p+12jgw4mGjy5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYC
 GwwWIQSb0H4ODFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92
 Vcmzn/jaEBcqyT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbTh
 LsSN1AuyP8wFKChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH
 5lSCjhP4VXiGq5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpF
 c1D/9NV/zIWBG1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzeP
 t/SvC0RhQXNjXKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60
 RtThnhKc2kLIzd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7q
 VT41xdJ6KqQMNGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZ
 v+PKIVf+zFKuh0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1q
 wom6QbU06ltbvJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHp
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <e5a8c3d0-7f7f-420f-a5fa-cb177d321112@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4NyBTYWx0ZWRfXwugvwjBhG1JS
 RnVQWyJ/WVyCFmQ3z31a093rxdn31eVb4wN4P+fC5iGi+rEOW3TDfGeevZMJLwM3Rccw6H6swlp
 Qv9P7XHrdPAxR7l8smC6hWcmV1rJauVdHxLIi7Skz1251kM3V7tJAGHM7aHRI9/nZdEc+biy8/6
 l6FsRrcIruC0G5GIHc0m4tXkY3nZ7JTbzHHtFOnjTi9wXLuiNmr7z0XrbDwbNtYnS/UG48lMxtA
 ELfFkroeMaEWuDwKhD0LewjDFaLLXi+obIUuUE8g6sCOvuQ7f2VtOrQdPpDxGL4+8zheyMZD5ze
 Z9SicDheUC0u0fsDy2g+5pjQgRqDPFUVVn+1D1ZmAmuh5F17C/lpoFIW3RuxU7VUTp5onaPOFef
 iMiuFnp84wLc1n+OsLIJ6xa2/lA8X4T66NlbkNCHT815AT6e7c+uvvRWvkrLwVs4bvVtd2/g4i7
 h4dK+Qk1J5gZSMXIKiA==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c120ab cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=dI1csYQj4UmQvqOn9H4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 0LQuCLBbrFpgK2DX5O5yorsaEfu8OKoC
X-Proofpoint-GUID: 0LQuCLBbrFpgK2DX5O5yorsaEfu8OKoC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99216-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 118022F137A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23/03/2026 12:01, Konrad Dybcio wrote:
> On 3/23/26 9:54 AM, Krzysztof Kozlowski wrote:
>> The qcom,sm4250-dwc3 is already documented in top level part, but it
>> misses specific constraints for clocks.  The SoC is derivative of SM6115
>> (or vice versa), so the interrupts part is incorrectly placed and should
>> be same as for SM6115.
> 
> They're the same SoC with a different speedbin fuse value for the CPU/GPU,
> I'd say drop this binding altogether

Sure, I also thought about it.

Best regards,
Krzysztof

