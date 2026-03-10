Return-Path: <linux-arm-msm+bounces-96766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNpFHNF9sGnLjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:23:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBBA257B82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 391CC30D860C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 20:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CCB3E92BF;
	Tue, 10 Mar 2026 20:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gm2vDgBr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWEwalNp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467673E9F84
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174029; cv=none; b=JHwv53Uyph0Co50MDMUcZIfrw2ymJAdPG9nMQoeoYFWDuokNptcMf1h2ubAtdYX42Jo761nf2mc0dipCS5h7rJArsdl07yNN8JJ7m9NpcXsXAwKDJLzsgDtkrRpsC0Yb2m/ucT2FUxwfyXmRzncPhu4xAXYMffnoGoX58NmUUKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174029; c=relaxed/simple;
	bh=jyYjsGfYB2xP5xLribT5n6D8yvHE33K0W0F7UNOWFKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOQhZZv8qhF2eiYD+iC2vfe2zDxx5lZuAi/G5v2pELsRLUtI64oW+v92trxaDpa8e6xZtJRQmONRyJhvYk2Io82WnZYnSQWekkyrpuKphBqsnVJA60VGAqy9oudN8yLOitkmulqWALJcUW5bIitKYm70u3wWIfdzUoSyFn735Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gm2vDgBr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWEwalNp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AGH5Tg508675
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+BZsPaMKQmI4ubVQY6bmcE5RG6cJDpbxMD4m7EkQQF4=; b=gm2vDgBrn974MS8B
	ompvJlFWBG+znGZxfMZu/p+imkepatOOeezHrXUY3BKvAkwJ6IQc3hiVDqSGZ4dH
	EGivWHLv8wKoLfv6W5WKY7pHAZWkzbiV11c3g+DbtO7P2hnEz2Wh1FwNZinWJG2n
	mopSsKsi6FQmOQAHaZuCOTKeRcSIq0vx8ha9Dh9ErimzMIEnhMwfaspHRhNkftGC
	hFmbWp/MZTLAJm+L2WKzL0vGyuMwzaB6JWfmfoUxIyGNUyR+Wxvep1QwMIbH4aE0
	9YhT+ecI9anVlXrmLyNGSU2oOafww8qjQ8VCLQwfZj71G09OonJhDTd0OeVHrUuq
	6QPpeg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppagx1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:20:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb52a9c0eeso10633272685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773174025; x=1773778825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+BZsPaMKQmI4ubVQY6bmcE5RG6cJDpbxMD4m7EkQQF4=;
        b=TWEwalNp/iNdS3IDj9rCKdSkY3kcrF3IRToYJaa5kKR98YZSlPRI3XsAzxk0MpPD/Z
         iuR/5brrlOMDA/P0/vtCZaEJqywIOlQJ2UYKEHqllXwtoYjsBFi1Hv9OTufW1oYa/i8V
         HHreE4fBo8PBzZvzJrjb2c+Iu6XUrHfMPdf874yC2I7HF6bNACd56C8I8SjYBzGK9SN7
         CkGDnzv/5yqDgRJdQkDBp3kjG5V/A0jo4Il8WklDBOH2mW8ogZkqYiRtCOJdbA9JeXhT
         66ctCCexsYRKWIDtF7z+mSgYUvp448S7tmN32+WevBqzJpeuXTweR46/GXm4OMJqYtVR
         zTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174025; x=1773778825;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BZsPaMKQmI4ubVQY6bmcE5RG6cJDpbxMD4m7EkQQF4=;
        b=cbxNS9VSufwMKew6ITEvC/5dP+l0KCE2cpOXZZ5hvrEz1LlSlf88LLwAdFd9Jt+5wB
         OPEYLpJ3NoUbzN6ntVEzwVaJDDrW2j2LyCmDwtJPcUgGvYd7gHzWj1jxAWoWu/7Jstse
         QYDxJGT7Th9TX+UzX+GHz7jkU+6OfNRgSJ6y1fMDeqUGSqOuKe5E0Lr07lKLP/uYfkX6
         lMN+gTx1l+NXFE9DiaomZPex1RD9UaPbsKpNMyaCQoh9ZYW+2JJGfb2HTbNZ9cR2Ly85
         Ld/mfUfj+z5yOYQaQjgp4rUCIKM6ij6eVLDCHx2vBzjroUatbCaTsqCrjxhnKteTnAWg
         tzCA==
X-Forwarded-Encrypted: i=1; AJvYcCVzIzDRKqV9anCxPvu60WhpxE+i1oCd0J4vG8/4xd9B5zD1J++/joh6OH1MNQSXLCm4vJ5RJ5lhY4IkK10p@vger.kernel.org
X-Gm-Message-State: AOJu0YwBzLTUimlEh0SOqLtUEF1vJ1k1CbpcWtbkv44Jldx76gJS+M1q
	kcrXcj1c3cptgaxvQb6fOjnMVdJzJgZX7wCmy3d411xiTW8AM4UNabmK6xWGZ9oVTWw0e6wsl0k
	MZopIaXULV/knu2AResnuKB8mzW3SD5wzBOgCUaYzJLcARTIh2nKsXDMsUuhCpzi8DwD0
X-Gm-Gg: ATEYQzxf60SR9DlUfBdzwjq/AcWme4DG/+LfvMv4MevvGf/8zmsm0MVI6y+j5qip0Fq
	WW1MpNJrMbrPVds89HKkc3GVk2G4fTgA8DyEHjD4TdHXxZJZN0UI1LNjNzsceNoBqsD9GgSRIBa
	hQ0hQFceSfTFbDlqzb9TVB/+laYjiAVYEOk8C8UKh8We9DyGy0RA6Y3z/z4NfC3a18sMfzubz8V
	xr3ZlDapeSewES/PCsbMedssSeG7aNULJzakkKR4L6tpLzLEAS8nfh8d/Yh4Y0JdVnQs5+4Mszr
	joUql0ma8AQSkHn1Hp1MyZTvrPPQcb1mdgHJiRx0ymlgngerkhKjPVSbSYpA84qr3Hxw/9vjxol
	em30SWzdIehjs0JtQM6h59IqJXALlUQRzp/x6PngFitlYASv7
X-Received: by 2002:a05:620a:4041:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cda19360d2mr36789585a.6.1773174025540;
        Tue, 10 Mar 2026 13:20:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cda19360d2mr36785485a.6.1773174025078;
        Tue, 10 Mar 2026 13:20:25 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0fe6cfsm532715e9.31.2026.03.10.13.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 13:20:23 -0700 (PDT)
Message-ID: <97134126-f1a0-43f4-a4f6-0c1bd85e0c92@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 21:20:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arm64: qcom: sm8550: add DDR, LLCC & L3 CPU
 bandwidth scaling
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260219-sm8550-ddr-bw-scaling-v3-0-75c19152e921@gmail.com>
 <CALHNRZ9R1XaYWeTneZmyAvGY-s2-rbSC_=bSV-nC8_zU+bGLqA@mail.gmail.com>
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
In-Reply-To: <CALHNRZ9R1XaYWeTneZmyAvGY-s2-rbSC_=bSV-nC8_zU+bGLqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KN0Yvin3LcuScDReDcsFl86PRNm7AAHV
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b07d0a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=kqzaHxnaL6MRe6R9p3wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX9Ko3bK5iUHxf
 mosazSWlmxDuvl20iCkxLQ8AVL0sjRBAa6+J1FRjcwEgP83TQHVRco9U4+MF2E8FQ59FTWQ6/1M
 xop/WEX9nyvUOSIjJRgbrPjWWCmVDlGvfdkVsEHW3966RLjlh9e6clSYcgApOuvRLz55fUHrC57
 bBQUysdNvv1bd239PyXbuP7rDjYC48nQEMkHVvLBbxIW+wyth3acncFWJp4CRrvNROnKIX0cu2e
 3LqiVSb4GVk6W/oBkbSsdnbkQyJM1eaSIs2ZRL/eJRIjr5cM24E3jDrBP9rauHnLj1V0CHw1Hjy
 XeO5y7U3qY6FO7TyYsOw3dPe2hHALp1EkSpyROE8hmcgFPV1/Vj1bCirxV77XiiuO9Zih6skEpa
 +nLUEHrDZdR0rim/r0nICJrk6ctKc9ON6BTLlRuESQGOOvMeexfVUL0quyX+cu6WUzwBsPD6f6V
 cArTuifqTXjnyxystNg==
X-Proofpoint-ORIG-GUID: KN0Yvin3LcuScDReDcsFl86PRNm7AAHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100177
X-Rspamd-Queue-Id: 0CBBA257B82
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96766-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 10/03/2026 21:05, Aaron Kling wrote:
>> ---
>> Aaron Kling (2):
>>       dt-bindings: interconnect: OSM L3: Document sm8550 OSM L3 compatible
>>       arm64: dts: qcom: sm8550: add cpu OPP table with DDR, LLCC & L3 bandwidths
>>
>>  .../bindings/interconnect/qcom,osm-l3.yaml         |   1 +
>>  arch/arm64/boot/dts/qcom/sm8550.dtsi               | 367 +++++++++++++++++++++
>>  2 files changed, 368 insertions(+)
>> ---
>> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
>> change-id: 20260207-sm8550-ddr-bw-scaling-b1524827f207
>>
>> Best regards,
>> --
>> Aaron Kling <webgeek1234@gmail.com>
> 
> What is the normal merge sequence and window for linux-arm-msm? I see
> several things that have been picked up for -next recently, but none
> of my sm8550 patches that have been reviewed / approved have been
> picked up yet.


This one is probably waiting on interconnect, no? Not saying that
merging here is easy, quite the opposite - it's frustrating, but you can
help by responding with actual data, e.g. bindings were merged and DTS
can go, instead of just content-less ping.

Best regards,
Krzysztof

