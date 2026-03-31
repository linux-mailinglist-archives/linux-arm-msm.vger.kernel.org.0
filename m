Return-Path: <linux-arm-msm+bounces-101026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IHbIq2gy2kUJwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:23:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C02367DC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 792333053F0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66593EE1E9;
	Tue, 31 Mar 2026 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hHjyb4C1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zb4bFkQ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745983ED5DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952462; cv=none; b=kF5wGBTYhwfAu/Y2w9C3X9wIP3pCAoxQaxqxihV2ovEr7T3UdHL/Vt4TL9WFdKXWwGFaribDeCMrPZuFAavc3EA6MDMHJFdrtWiZ8pqh3oWPLf8DJqMHqdo4XkvTz0wiO4UokMy1KJx3ZROmggPMmrLyz0/F5l+6xcTBS8dAJlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952462; c=relaxed/simple;
	bh=+hAOKA04/pwKzntdv/46zWY6DEBoxM2Kj5QHldjiDmY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=vFjs3hqJtzyEOk1m16tdgutf4qN/9T6f0zikpbQCQ0UpAG3ki9lFyVuE3E8pVtchIMnL2YZqjedNYBAmZsk5YcST26GSlsfMUgbhxJtW2HiGV/FPFDKlHq2kCBkX/u2X63lIAfT5DVmwjkN0Y+croS/BFi8fdgTQOhDilLVLMKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hHjyb4C1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zb4bFkQ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6A6Rr1090724
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UT82/3lWMmlDNbovHHsALTmbvxSNZnI/J3PZAlHEo/c=; b=hHjyb4C1YI4pAYlc
	VA09wSsVJxi5ArZGeCM9LuzkO22pZKWz34F76O+KHECZSRvOMyO2o9o6lE5uQouW
	kPPR4YEoV5hxPC1bhRTuxyTIlhppgZd/NG9ttzimu7mlFOiLPqX4O8FhXFQgFvrc
	9PGpFxX//rUeDx/9BTjmS9fJ4DZprEgAIde7uZV42cF0p2HiC8mq0TpQsihWjJVU
	DjwAg8t+bLR0OgJErIC7lKyQJ4lXvfVpZRBGnYImdQ0D7G19y19zEPjO7XYar6yk
	P0w4SKmpge8g1mQvgoXGk/Q+x9gvtHhO2GNT++LoyM8xizwc6rUzHSmrMp83TBsY
	CFmt1w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd485d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:21:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50917996cfaso46336691cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774952459; x=1775557259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UT82/3lWMmlDNbovHHsALTmbvxSNZnI/J3PZAlHEo/c=;
        b=Zb4bFkQ8nPjsS2wDKnxDCRTH3twEzxjqow5jbIZNzHOdMVFN4sEUhwWzPfZELPVcu5
         us80gqI8oPtwjf2Qb0RIhAJ6GZxcDi+nZojGfAmZe+SI0DoEmGuX4zECZzGsp1olJxmA
         /LksuPF6LC1+QKvhd8iAvB5qOFNQCzlPpCP3bKvbItTslb47ggpH2QoE/+3K2vtW6KuU
         FsV7EyKbCnA5+dTa5qv5MZcJEw7iyU7dVx0Dhpy0FiKah8Cpg/oNDG3nHY7fEmkHAoAs
         QjT8XpONPniCBARmPCV5Xu3gE8wO7ax3ucpqLAZ59oK47qPg19wkQnPYpxZHSmW3yt37
         Twhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774952459; x=1775557259;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UT82/3lWMmlDNbovHHsALTmbvxSNZnI/J3PZAlHEo/c=;
        b=QBQTh7rAdZIet1paMQBVFV5Z8N2sMBFwoMSuBOnkwwCqhHlvqFNDaMvvyVLEaOCyL9
         utWOwTTQ7YVifbGZPTtaPIc5mempzDNeHf8RcMQz6xwX4S2ukHSu8xrgJzabLAFuFGuY
         0I837LnhUTjEPlE+CnAIxCYu1/ZtBEyfbB0pO/TiM9jTCvqa/5cNAas/8CWr8Q3oowSx
         jH/ERYQ5WRXg5mvZP5IVBUAy2zKmd9MNVAzsIAZBLJ4yrD4iefcfb9ke9hk1TsmorNxz
         WLQQ+7fZIvaf1D/czmk6GoJM9Hm+kSjPTMqQaBrDexVejfOy4eVDfzP6zR1VyFrhpCNU
         PTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfpTNwOJOxXnBQNHHy7vHaMq0dPt0C/r3FynlfD0S59l/95Kjhtlmo8NbGjcT47BKZwIS8UmYXYB1EZQ3g@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+BA3UlWbFoZvTo14OfuoQzRNpol6tPXqPJu4PZgbN4oAlByyJ
	A0bZofZstA8vRaDN5wdGBmWMPeenoijIvkqdmp3dvhfVyKD8+/6iEcfeMqA3F4Kxzm/n6ca7VsD
	ubHdcc2ZWRaQiE5ECR9cFyof+hHQul2LFUwd3xmUtfSvkX6uRIHCqXrw/GXD6TGkgLp/uwnhllc
	aa
X-Gm-Gg: ATEYQzyQVwPfpYOPPpzyRm9MbUzgxMOjWkeQGbA34stn1Vm1HW5syKtmwxJSYgy9kR5
	7nGh1Cu3rudD6o8L0zJXQVuk72boE+ksx9CIdVNF2nYFhBFCqSAevf0OCM74ssPrVmuehDX4T93
	zBFAvkyU9IMZUyGIcPX4jRdazxY8OzIEXNDdIbgJs2u/AE97XpmF+/uN2XV9eR9rTgorI9L92uR
	//vLotJ2X2soXmcFU5gNcVblz9Qg7GJOdVO+oHwAGXGO7g64HTRvi74w/qP9X19Te0OcZAk8mL9
	29Cs3F3/FXRWLgx7djN2w9BrhUY8G9jKO8p3jeVAdn406eLg570nJaXmUkGAY/lka9U5WL1Hdx9
	PIk5ouV01PLe+hqwDCcxjAq5hKhmNAhTghESwpO4UkDexMnyA
X-Received: by 2002:a05:622a:7c8b:b0:50d:2828:1a98 with SMTP id d75a77b69052e-50d28283268mr36255591cf.0.1774952459086;
        Tue, 31 Mar 2026 03:20:59 -0700 (PDT)
X-Received: by 2002:a05:622a:7c8b:b0:50d:2828:1a98 with SMTP id d75a77b69052e-50d28283268mr36255321cf.0.1774952458674;
        Tue, 31 Mar 2026 03:20:58 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887a648f3dsm25400765e9.0.2026.03.31.03.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:20:57 -0700 (PDT)
Message-ID: <7fece0e7-31b0-4b92-855e-bd9e210cc651@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:20:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
 <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
 <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
 <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
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
In-Reply-To: <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f7Yj8UN6Qr5RN37z1Jo8bW_fOl36oFeF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5OSBTYWx0ZWRfX2g72vTpgWXdp
 vL9P5J/mBFDYt3Xe5v/11YCU3FgJ6Wih5Zcsq197PXocj/iTNywXTKA/wZ5f3HMSduvqk9Lgd/Y
 XJKYpOkrdG1EOynsx5ai0m5UJH5xtyoHWJ456SyRv2CzVCFY1PXiPstkfsf0Ak+61BP/ZNAoy96
 77qNozUNj/jedKPHSI9SeS0Dn6z/JrSSukdB/pGqnI0CRYz0Pw/6v3jyaNFjU5Gye902MmMVQ9m
 efBtoGnMNSKnLPqsax/gWrkiuV8e4zsB7O207AESs2M5w8L+N7pL4miPeLsmIMCGXO4qupgTr1a
 jzHKJaaRJtxlrq+lVWtQFwV1SFyQkpXQU793dc0AhUHLf29MInnt3gjkl+gSO7UdqSyh40GmN4K
 76X7xeU8/8CcvPeirIyPxVVh8B7Y6rhDZ/OqCFAHBvro7saNdqDef+r9U5v8WawS/rCoGvvJIrU
 en4ysRvDC30++kIywAw==
X-Proofpoint-ORIG-GUID: f7Yj8UN6Qr5RN37z1Jo8bW_fOl36oFeF
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cba00c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=y-Wd9Zd1aYVehlAUloYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-101026-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 26C02367DC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/03/2026 12:13, Krzysztof Kozlowski wrote:
> On 31/03/2026 12:10, Konrad Dybcio wrote:
>> On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
>>> On 31/03/2026 11:33, Konrad Dybcio wrote:
>>>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>>>> and is not modified: neither by the driver defining it nor by common.c
>>>>> code using it.
>>>>>
>>>>> Make it const for code safety and code readability.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> --- a/drivers/clk/qcom/common.h
>>>>> +++ b/drivers/clk/qcom/common.h
>>>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>>>  	size_t num_icc_hws;
>>>>>  	unsigned int icc_first_node_id;
>>>>>  	bool use_rpm;
>>>>> -	struct qcom_cc_driver_data *driver_data;
>>>>> +	const struct qcom_cc_driver_data *driver_data;
>>>>
>>>> This can be a const ptr to const data, even
>>>
>>> None of other elements in 'qcom_cc_desc' is const pointer, even though
>>> they also could. If doing this change, let's make it consistent - so
>>> shall all of them be const?
>>
>> I thought about it, but then it turns out that videocc-sm8550.c has:
>>
>> video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs
>>
>> So we'd have to duplicate the entire struct
> 
> No, that's not a problem. Pointer is not modified and we speak here
> about const pointer.
> 

So to clarify what the code is doing now: I constified the pointed data.
Not the pointer. If you ask me to constify the pointer itself, it's
fine, it will compile/work as well, but do you want it?

It allows only definition with initialization, no further changes later.
All existing drivers would be fine with it, so just confirm that's your
preferred expression.

Best regards,
Krzysztof

