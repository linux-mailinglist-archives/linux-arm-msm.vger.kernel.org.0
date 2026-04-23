Return-Path: <linux-arm-msm+bounces-104213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJMPAbTH6WnAkAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:18:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D38E44DE07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A0A93022978
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 07:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7518C145A05;
	Thu, 23 Apr 2026 07:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAHheGv6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JmnLOLbb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342772DF68
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 07:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928616; cv=none; b=sKaaMFKuDPXZmxGV8A2YLfDYTorjZXDIMFvIyGyMAeeJ/Yg9u58asud98sFDgVNYNKdCFSdhr3FVIHe+KIIAx3kzCiYddZVLS72zBI+m+5t1dW3+NSxBF/rdW0civ63EbXyCIhDKVsGRCEr6kpdxhU+PdusLiFGQ4x9jv1C1cQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928616; c=relaxed/simple;
	bh=ulrm7hhT1C/R+X/eza+IdBh/8UPhAJkCQSzcmiYnsm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dG6WcDNGxQDdG/cluDxRtQ4CrYrgR/3JwUiHGwdjseJEs1gUZpYetBTpoiBHyvVzYbR7ek2G+UkOv1MUWBfq0we/jYOy2a0RVSegDKdDrDyNjtUzH7Y7gH8XUWYKHq8zGEkx+nSPdswxayw5SFmuSY19cEpRULWFZHUZ9sQHyX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAHheGv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmnLOLbb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N4cJun1218418
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 07:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mur4MXHqvMkii9QpJkTUyQPomvf56RRPQfpcXgqhu00=; b=NAHheGv6sOWkVZkn
	dCkId4uEZ+FuJEsUGnh9XVbID7qHFYZJtc2czotY6r5J6NDJDYFDUPOmul3jGC8R
	opAf9P6Un9cdOtG+1ck2AmT6H8Pee82m14JsU1kdOeq5eyaSNc+DvWFkHmrxJzsY
	pWaUF3zRhAV17xuI5wa2PEv5IeOWdtwbJsSzYmoxv8a4cRIFuEiwzSKYUZka7tXu
	rY7rXFgBpMcD0b6rWIyVAvAA+ir/qoANQBtPDAPwIl7wkcbCu7iXrhcC+DUGsZAD
	TOLeMDHF2dqFNwKKiRwyejZrpUPyZOo+gvCwFHlafuJGeK1SBa5YIcDa8FnwkjUk
	ui6zNg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq282thtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 07:16:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e575a50bcso57450701cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 00:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776928613; x=1777533413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mur4MXHqvMkii9QpJkTUyQPomvf56RRPQfpcXgqhu00=;
        b=JmnLOLbbZwzJkrkOkPgpO7elJ7fHt+4L0rOdC0dv2rDXQT2PhwjtcU3Ve8vOmUks8/
         m9jBJSJlWjlLHfZuGeSI379kCVfakUFCXmELCNj6M6Agjg9B+z1Iv3P8jrREqHaxJMt+
         nk8iIsKQ++0S/sNsgakjan1c19M3V6KD2T/fCa+vsUoQLQTvqbLd4Z5v/Df1vA/NyFzS
         NcGMUvKq8CPfPLCcPZpxmTC9S9FkZkK5DHjqHYUDILlW4ZyMmFqp7E+CYAqVPZxb3EhT
         RZaMDwy5LzRGT/ASQuqdHCU6LSkmIDxNfqidt6QVe9/ePuh7AdsMlTRa2OrRu8yUvC7Z
         4TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928613; x=1777533413;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mur4MXHqvMkii9QpJkTUyQPomvf56RRPQfpcXgqhu00=;
        b=icR6h8jr4vh4eHhv7ijvPESN/h/5KTviGs3lsdyqK9GHLX3J34CQnOwlGtFRJHdnBv
         gNpA4HyWVLV7xj+qU1UEi9RUohGa8IOY8mn3sHdjYxuV1aO0VOgSzwku2qfU+tm7/dQU
         57qq3Jjp1urpiY7Vf5IvPrFoOKHP1S4edTwDCXN0lb/ZUVnBaj/wy3U9rhbBhssXfN5Q
         jpKkrlpn89fSVG7icH3nVRm7CxIDqlQ3+wZ8fLuVzc1PKjkddfxAzVqKGdopYQpm17JN
         ApSgkDQCFlN2TZ9FM1ewP8AUnmAaRFyT6vM3ujV7Qldl5jaCZDUjbWX1E3kDltCemIit
         cpVg==
X-Forwarded-Encrypted: i=1; AFNElJ9GGP6FlrbG3tTaTFuDiLG7zxZpeggNfQAKrlWU/cOoo3pY6ObO7ef7dysTfzccJbN/O5RmtVJ/B48aeFJ7@vger.kernel.org
X-Gm-Message-State: AOJu0YybkhdZzUBDEWsf1NbwQZeAs9fsCQVITUPXMPWFTiVDn4tSDGrP
	Rpez/3EtiqpLGAPFE2S258qpUBe3xOIkDy4ET7LR0wOAZISwQQsMsr1I9mJXTVWj17AMIMRcPiz
	oiYDoEeeqbb6oPUloDwNyp4X/27kTi/BzUFphuNYy15ZpoQdYvqZHkOY6SdONcxHDn8ma
X-Gm-Gg: AeBDievRQwle4BQfaVIM61DmeuQB7hvQIdslt5UsAJpocRzq9KoRvsvL6rxY2yovEQz
	zdpuzqKuRM56916TxYSY8p1F29RqZ9BpJBlzTAHHv8NLECCIOckO/m6Em2oGTtSWpbnx4ELQcwo
	j8WtWzoErDM6ohlZxEIQBSH4Ui1AVgPSXXE2mjWfQ8P0hcQVAWjrspfP8Hmnz0UukY5mbTyQdfk
	kjyf3dg7/0CS1WywK1r+feXozS2evCDm0M9VcN7qLHAUN9V8vvtCdkS3vUTM/8Oh2B13o0gvp52
	lciGOMI09Yo/CNHRobfOhnnvBEAvl6qp4qcZLyxYNyxtdtF4V9FDNsWHzviJZP2ZggaoGKf2jzt
	MlN6fXaXF2iUEkfLdzCtipoci4UOgxCpt4YJWv3S4JMkSX7vbMez8SCwjoHM=
X-Received: by 2002:a05:622a:5516:b0:50f:b904:457 with SMTP id d75a77b69052e-50fb9040613mr128714501cf.25.1776928613349;
        Thu, 23 Apr 2026 00:16:53 -0700 (PDT)
X-Received: by 2002:a05:622a:5516:b0:50f:b904:457 with SMTP id d75a77b69052e-50fb9040613mr128714081cf.25.1776928612734;
        Thu, 23 Apr 2026 00:16:52 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55dc9f58sm404834755e9.6.2026.04.23.00.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 00:16:51 -0700 (PDT)
Message-ID: <5c1f7955-883f-4fa8-a0e5-513a987bd3a9@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 09:16:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
 <bgcrs7ijonskkobvidzoldixqy5ctmvp3hdzntsvfpj4wvjfgq@inlchk3nhogy>
 <b0ec6352-164c-4492-a0c1-b29a07e5e7e5@oss.qualcomm.com>
 <dttcqv63qc6igab7zxlg27ckt3irmjnzhjgcvq6oz7ays4q2ld@be5kp4i433f4>
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
In-Reply-To: <dttcqv63qc6igab7zxlg27ckt3irmjnzhjgcvq6oz7ays4q2ld@be5kp4i433f4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA2NiBTYWx0ZWRfX+mHBbve4zw8b
 chiFfSiX0InxPdGEljcLTB1RoCcl7m7qfXyepl/v0YrSZ6O8hSE89B6OgK5Ogkshz0Nv6wSENXH
 Yx+UC85QWscj8JWcfTksGA6EdWT7KteZIBdfodaClPvsT3KlWobroF+Eq/fxIguYpIQSNgyGvFd
 uIi9UoOCa1g1Fkv+1R3CwbIBalWCYoozoqPgta0kS+kNlT82EC/IpYpE6V9O3OUa0A4AMJc1tiv
 X/kkaFjis6icX/ErE8yH2tUYyFiMxZVqJRKRSpFJ/65zAmTQSUyQHW9g/P/qdk9S/uLaveuJc3T
 pUSjfiQlFTrsn1GpJ/F9qf9q3zLzzCgUU0UW4emUiJY73MlvP6+Lel7MG7xzzGkOeytdJD06px3
 D8PmrxGSLvp1eSdJTmvzLFMOI54gHoXMPTsjCf0l8Okz4+3oMVayqeHrXXezIXRwgxJXnpKl8nQ
 oFyAu8aXMNpuqH/ziPg==
X-Authority-Analysis: v=2.4 cv=Zond7d7G c=1 sm=1 tr=0 ts=69e9c766 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=V7ogQbNXaJUYwqe3PicA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: DkNQdfO_sV7cQMEz60x9tz936tRLkBam
X-Proofpoint-ORIG-GUID: DkNQdfO_sV7cQMEz60x9tz936tRLkBam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230066
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104213-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D38E44DE07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22/04/2026 22:08, Dmitry Baryshkov wrote:
> On Tue, Apr 21, 2026 at 08:41:14AM +0200, Krzysztof Kozlowski wrote:
>> On 20/04/2026 20:02, Dmitry Baryshkov wrote:
>>> On Mon, Apr 20, 2026 at 03:36:17PM +0200, Krzysztof Kozlowski wrote:
>>>> According to user manual / programming guide there is no separate PCIe
>>>> phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
>>>> 4-lane blocks.  This is also visible in memory map, where the 0xf00000
>>>> is marked as the main block with additional sub blocks for each 4-lane
>>>> phys.
>>>>
>>>> Describing the sub phys without the rest is not correct from hardware
>>>> description, even if it works.
>>>
>>> Is this the case for the other bifurcated PHYs?
>>>
>>
>> There's more? Oh damn...
> 
> In the previous generations. I think Hamoa had one.

Ah, I did not check the others and there is little we can do there -
it's released DTS. This cannot be easily changed while keeping DTS
compatible with users, because probably two PHY nodes will be replaced
by one with different compatible.

Therefore I want to change only the platforms freshly added, where any
incompatibility impact will be minimal.

Best regards,
Krzysztof

