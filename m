Return-Path: <linux-arm-msm+bounces-92898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO3OFgjVkmlMywEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:27:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C631C141894
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96C0E300766B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 08:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62262DF134;
	Mon, 16 Feb 2026 08:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8+hFKyB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QKnPYn9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD427227EA8
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230469; cv=none; b=rfpDc6QM53QNYadTOvy+HDv+Uqa4b9hJWoQes5IR0VbJLAi61hwvDT4fX87elV1r46UnDGbsiOqLMC9k0DRqb3XXYKO30JxX3n4foqUSUdxJ341HkoZDQQ0Xx9tBtaWA54ggtfGqBuXeIsJkDGK5ljtWIVbziz8DJNMjDql76W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230469; c=relaxed/simple;
	bh=62N8Oyt5yY9X2xXrvR3evbPTemv0hsMCFuqTdlCiN4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=um3Uj5iu91Hd0zmUwut5RJZWI2ISeS7Sypbgw22MCMQS9Wu6yuj43jgR7TkSMFB8AqJ8GBnqunA/Uol/dKKzKZ2qwSkxytZ4XUaZXbwXL2qpkn72JYLTOBLlqdcxpvmgHEqc1FExNgxhNa4Pe1PYJqQBu3hx3DuM6gNBn579GnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8+hFKyB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QKnPYn9k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G1pwRP3432048
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J9+Nr7rLFJ1xR06cOK8TYMQyw3BwerTs/Dz4ayhEPlo=; b=o8+hFKyBX0zckOvV
	QFf/aom3I8QF1ybKwTRKodrtVN0sT51KvbWOUZij8dWtnVjbPS9mt8iLNcRPbHJX
	wfXPWkR+PEYKRHX5n8VbOx18qvPE/9ZF8BvSFMk6hmujeLSarMcjk+TPW505DkpL
	oPZudhEjFkcTEMif/H5jtE+D/gLC03BnjYAW8TJLhp1NTyqhKhugWUyV+MfE+V18
	ILEitNAfhyCedV0wmQlUTFAZ9nMfC9MXx3pJTRh1LBQuvibStjCIUv9tZzDrQUI1
	HkbJYDi+DCx3/apLGj+2+lPT9bROCT5e+lQ6hI4bA3M1DYYNm9hHcWZK6EyWYVyE
	0C0Yng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah4skvu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:27:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb42f56c4aso1848683885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 00:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771230467; x=1771835267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J9+Nr7rLFJ1xR06cOK8TYMQyw3BwerTs/Dz4ayhEPlo=;
        b=QKnPYn9kQcfE+/iakdivX53MD/MMEwNhj3cKPNnGRxO9yr8GhEjBOf55nvVSHgAHcR
         2PRxQNXXntWOEqbreDDdBplhePBViUI2WEijfVFlh6x2F16fQGcWPtGBn+FmvKXwcqmg
         QVP/UOUW40WpRQQQ/r1nQruIeGYzMcg+01SYOkEaCWiPSyD5R0oz0p4kyMr4vCC6gfQN
         FBNrcFl020kO9jEdIQZFkQ2b8sQQ9EbX0C3bqCHMGGjCe+KBPGx6gjNgx+wswea4BvNb
         hjI9Z2UKwC/FD/0VKHKQi1dVgeLnx0tBgJXeqsVwbYyaPqVH9tYg4FFAmhI0XoEOYBbH
         2FZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771230467; x=1771835267;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9+Nr7rLFJ1xR06cOK8TYMQyw3BwerTs/Dz4ayhEPlo=;
        b=wF8RKQFdVRTxR4EH7DjoYo3pK3hAFkXhUyHiFv0dyKfv2hD/0VTPBCXZVRFDSSxW52
         3InJ18se5nV6shy2E16JxRmYMMwqfErzpM9835Df/5GgFsHpD1gqIlJhpS3K4yr37mx1
         dQEC0UzfcKX9jB4KjNRZC4WLKL/kSy2nGAZ/33CcJBrQITw+zTIsynbTA8fngErd65zm
         5WMswK9CDhyq18wCV1B7XpCGWRWsmF6KwVUipxGWpv6wz9wWQRy/q3tCeA58zrjFYHpy
         0LNjwDa8/rw6dtdXUuo2tzFcd1iz+ZTFhTu9iVb2N7/Su5XbkSAxB6dH0UKOTwf394np
         wnsw==
X-Forwarded-Encrypted: i=1; AJvYcCVjf6Gb/cZWOEmRALuIwgjOPsRFQuGoUWmLoeVzo9Y/8sGdY2pYDPcLfza01v5oOKpbK4qzvzntRg1oiLO4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj7RzmUgdXLaj9URCJ9n3Ri1t1cSon5je4w3OZWzXgPMMyYSRE
	yR32stmdQV5LRPF2Hks2RtiACbjq2tUGGfmu5ml63u36JQ1TKpUBAhqzLqJJqasnC8y1NCaLMdP
	bMJKMoH+xWBgUnuBxGoAh4oUP7/COj34+1BHR4vYYfLsfjZytxWFsHUHRyHyNn0rwg/zB
X-Gm-Gg: AZuq6aI45R2BuBB2BUntl60VIudbQ/WBwsUANF6Bd87YjcWxQn6iM1/+fDKJIShMk6W
	UAYMDWAwJislhza7NTD5goQZGa/iARUVAb3RzM5uSzJcthLliAPjSvNRnrT/R/jspZLQoMaShzR
	smRJ4ZzfcC6B2SsG6SeZP1GeWQqXOGNwMdZ76K0pLR32o1wsW0NZBLOviUPlEkORPgv0CTdtWBW
	w5u4w040UAUE8GfwoPQAF8iJYUPpG3wjWT8FghsP9oqFBPBXmhJjziclRpN2qr3SQFNoqgy5HT6
	QQpoUlrzjiIVLzAGjTJztQsxRSkeA2VWoTRB0cB10/8sgritadWSmJWttUke9HnOu5q9c22X0NU
	dpZodNHrH0cHvyMrJe5dNAQEX05Q+RLGjQGX/iMqYJWVceGYNVQ==
X-Received: by 2002:a05:620a:9005:b0:8cb:5d77:946 with SMTP id af79cd13be357-8cb5d770e87mr226126685a.87.1771230466769;
        Mon, 16 Feb 2026 00:27:46 -0800 (PST)
X-Received: by 2002:a05:620a:9005:b0:8cb:5d77:946 with SMTP id af79cd13be357-8cb5d770e87mr226126085a.87.1771230466363;
        Mon, 16 Feb 2026 00:27:46 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abe3b3sm29762358f8f.18.2026.02.16.00.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 00:27:45 -0800 (PST)
Message-ID: <27b70d90-b69a-4f29-9b8b-ed96e21be870@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 09:27:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] firmware: qcom: uefisecapp: Annotate acquiring locks
 for sparse
To: Johan Hovold <johan@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260215110548.34152-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260215110548.34152-5-krzysztof.kozlowski@oss.qualcomm.com>
 <aZLOo3tMAWhXhdkR@hovoldconsulting.com>
 <dfb72ee5-0576-4b9d-b109-e763273cf39f@oss.qualcomm.com>
 <aZLTVNrADn_zL0NN@hovoldconsulting.com>
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
In-Reply-To: <aZLTVNrADn_zL0NN@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3MCBTYWx0ZWRfX8dkW2NhN0a02
 JdtaXNPakLqCZvh5gf7ZJL6TJG2P78HS9lTmCMadnWaTnd/qh0yQUR+M6qBZP+qfVqOkRvmJ9Sc
 3iVBAsZ1/3hkoXE0BHXYfC6jhvryQfdEnFSocxYacGyvbg1vMloZR/rgTguXBL4814dbZ/ygeos
 cJ1Up39lH99EjOQCdoyx7pD6lcZEXFt2q+9UZVEAQPyiMt5yXjEnMBb3VQkbNT4KSS7gbKp7Jqz
 ++VMsyfQCyEfyLrdDVfB0qZhtyRwJqC5c8GzuF2YhfE/EwoC1Xoyv+5XK+fZPAVuY29ucqWr2Hm
 pvi98oXeMTlL2Qq4AxBLfQWGcaXfIggRbiYwCTfpD8g2enkOGTYD3jpwVXsBquiXtygjCqJKazq
 1yugheyqtrikgNZXmZs9zpesKM83hCktx1rRuSBZd2QLQu5uOTUKS7zB/VS588XQMhExPQ2OHu/
 iN7naOGeo67q+EGj2sg==
X-Proofpoint-GUID: OjCIfo5Ak0WfxlmocNAtNvl13CTyjQta
X-Proofpoint-ORIG-GUID: OjCIfo5Ak0WfxlmocNAtNvl13CTyjQta
X-Authority-Analysis: v=2.4 cv=EbXFgfmC c=1 sm=1 tr=0 ts=6992d503 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=OvoMmNvY_YUAXSDwc9oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92898-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C631C141894
X-Rspamd-Action: no action

On 16/02/2026 09:20, Johan Hovold wrote:
> On Mon, Feb 16, 2026 at 09:14:13AM +0100, Krzysztof Kozlowski wrote:
>> On 16/02/2026 09:00, Johan Hovold wrote:
>>> On Sun, Feb 15, 2026 at 12:05:50PM +0100, Krzysztof Kozlowski wrote:
>>>> qcuefi_acquire() and qcuefi_release() end with mutex locked or unlocked
>>>> respectively, so annotate them so the lock usage will be tracked by
>>>> sparse.
> 
>>> The mutex implementation does not use sparse annotation so this actually
>>> introduces sparse warnings (unless something changed very recently).
>>>
>>> See 
>>> 	
>>> 	https://lore.kernel.org/all/ZJ11H8btBhvCx9gD@hovoldconsulting.com/
>>>
>>> for what his looks like for the code in question.
>>
>> I checked with sparse and there were no warnings. More importantly,
>> mutex uses __acquires, so this apparently changed:
>>
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/mutex.h#n214
> 
> Thanks for checking. This is apparently about to change for v7.0-rc1:
> 
> 	370f0a345a70 ("locking/mutex: Support Clang's context analysis")

Yeah. I will include note about this in the commit msg.

Best regards,
Krzysztof

