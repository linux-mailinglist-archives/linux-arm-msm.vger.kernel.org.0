Return-Path: <linux-arm-msm+bounces-94227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHPsJdHrn2nYewQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 07:44:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF221A1664
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 07:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 634A93041A79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 06:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C2C3876A5;
	Thu, 26 Feb 2026 06:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7Ev2g26";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fAbcdvkL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C633838B7D0
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772088243; cv=none; b=qXP81IWDj/6iS31IhAs8ZKMhVByIZn8TBNyhjitxHwhOpJMymPpXSujjLiqebUgO8EwPCrmn6dcbw96T33dVhm4d9i2ghAkXRhRK2LYuWopsuRUDC9bkA/7b01Dqbsq7mVdOpZaBVv7wjYQyXpUFN9OfCY+BlnS3z+1jj/WxeSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772088243; c=relaxed/simple;
	bh=EYLnRvQq/XZ/fmr75XhBDUvkJv7sh9WL8NZdGYSiznI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k1/qpumj6A6TXmVCAVzhlOp/FhM4eoC2hVrhm+OUW3zsvOGvClNtjMnQDZM6zK/rjwq/k/LeqcxA349LzeXqy2ceiDazLG2/zsykdwOPlo+aq9jezGlXWBxQVKMUMNgw5iuwZGRAoRqlkiHjFSnOL82/UZzpFaR231Cz5S8OH8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7Ev2g26; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fAbcdvkL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4VQSH576434
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SQh2B8R6nMFyJXVuNWlNbckjibOvrjgxpDp7qBRbScI=; b=C7Ev2g26obPSNOvb
	DcGheDihbCy35Ml01Ki8dwg2toGXXmLEjCgxMBZyCCqHExUoToyMc5fw44XmEdxW
	USLauPsLWWr1vqB48XgRXyCkSyHfevpPC5iB9ezpyjbHbos3/2hlGfrqD3Ygrzhp
	c7V8ZxCJRYHjWlSLtbI4ybFdgt+2WTKmtsrxVY1uFd+CMqTznQbvkIXRW+aYJLYi
	uD6RGk5BSVv3rQPjWWTcCI0T90pz0hJ6MoZPaWhAatvTFYJ4BOFVtDhGQSSsraWx
	1X4zbZbuLEImQDp/0YYPYw1yKRJeiLo1YV3477B8lvw2k9gKQaAKGdQWgvwxhGZu
	7HCoJg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj350jhy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:44:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-896f96458f3so93938486d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 22:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772088241; x=1772693041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SQh2B8R6nMFyJXVuNWlNbckjibOvrjgxpDp7qBRbScI=;
        b=fAbcdvkL0K+YOOXSYpJwvQaPsDTxrp8kowjVYx6pbNPHP2kSxAjCgiQpJ9ZS8u8xEh
         x3a0O5dj2CLvX5w5jJpcml2F9n/UGWRty8X5BeL4badeEmu8CxHr09XvDNFY4pTr5HFb
         7VqLL21CIOW46hUkd4R/nHpMlR86FGVYnZc0c3H3dETKu7/k8BBIOLmBHHjqyId01xsc
         YnWYxOZUsmFH1SH1s7/UycHa4VxKYKFnuGLrih4DkD18esN4ZwdEyOLHSLa3m1/ArdG/
         g97kgx8oxJKv+tVbR9mymEHRn2LV2Fu+KcD/6/u81ryrS47taz9Xp4X2WEYCmDOQAqnq
         3vyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772088241; x=1772693041;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQh2B8R6nMFyJXVuNWlNbckjibOvrjgxpDp7qBRbScI=;
        b=ZL1mQnaacXA059RaUp5u5WvEM+vj+Z/UkmnRN9l1/KfBUPDzzTneY371jsXn2pLcVu
         BYdMdgv96qCieflrt6tOzBd2uQm6Vlo/Q//YIP0IGlYt7bZOtplLo8ficRTrv4cymKRm
         jl15OkNBG16gr7vmgs5FIzd2Vi3+CrCmDqOeVTX5N74LRFr/M+RctoKcyxeDSxcBHOcd
         1zfU4c3N+5Nj8sjAvqmtksfK05tLJQ/05zTEbfH9nJXwur6epAE+o7aef+1FG4565P1N
         uTOGiMUgaX6LpKmQX8CTu0zEvj2XsUcerpkV91jHeLTXLBNMV+ap7p9yEj7CiqOz50kg
         luAw==
X-Forwarded-Encrypted: i=1; AJvYcCXbap7rnF67dm8U78p0w8hUkkSI1QzH7tJuz6CMiilWZq2/ugkqsqznVap8jO07dVgNslZ1ouvJBVADeQ34@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr2P2m7IqE2HnxnelhAW2zV/jARoYToyjtivUIaveJrVYcX1UL
	kkFSJjR6vRlrwJB0Yed1oxQIjVdyJDljc84hz0lKhx5TkErNnyTxQCbZSov3wSEP4hJjRhxLxv0
	22DGBZnlxVpGhZy6pFQ3YGAW8XouYfZlb1Bx/f9HcNu/chSu8fFzcK2J+SMDFgRC6z1W3
X-Gm-Gg: ATEYQzydpPMJwNwW2T1WPy8kvT4sfGUCAcFIdrv0Xik19or0VJpRWlf1HHO0RLtMosu
	rT6QaiFhdWy2GSJ2oTo5n83f4jfwbW2VeKhpduGTf7cqrlrPqhbpwOKH0Q8qm35B7Y9PIMgovri
	V+3LR1rx/lvPmHbxl33cyzvgZPaJX7MMhaOwB2whsRQUeK6iv4JlhCSG/ZDF8thawWMixKzxN0D
	TAY68bIfKJj81Gf+mCK3a/iMEi8KAWanXE07T1BTt+w2UksrH2uuKKaA1oy3kq1Hw5C3vJmull7
	nteynI72E+Sw+k9BJM2cSp0Yi7CimXGCDRD27WfPLK7jcXU0v8VZgr4QC+dFFdE2O9tun4aZuSq
	gO9BvZAWIafRHOlfa8Vif66JkzMnqteOz7OBMXVYTisFYvcMldQ==
X-Received: by 2002:a05:620a:7081:b0:8cb:72b2:2a14 with SMTP id af79cd13be357-8cbbcf54cd1mr414965185a.16.1772088240619;
        Wed, 25 Feb 2026 22:44:00 -0800 (PST)
X-Received: by 2002:a05:620a:7081:b0:8cb:72b2:2a14 with SMTP id af79cd13be357-8cbbcf54cd1mr414963285a.16.1772088240212;
        Wed, 25 Feb 2026 22:44:00 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm38910193f8f.31.2026.02.25.22.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 22:43:59 -0800 (PST)
Message-ID: <015f284a-4632-480f-b5db-aec86cd15850@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 07:43:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Enable UFS support on Milos
To: "Martin K. Petersen" <martin.petersen@oracle.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-scsi@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
 <bab87b07-42a8-4712-ba14-3489b7424ac3@kernel.org>
 <yq1v7fk42r1.fsf@ca-mkp.ca.oracle.com>
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
In-Reply-To: <yq1v7fk42r1.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vIPHfeKWWm6K9_fuzavMxj8kO9-fygk5
X-Authority-Analysis: v=2.4 cv=Zs/g6t7G c=1 sm=1 tr=0 ts=699febb1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=l5eyU-Q3JOpKGWt98rQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1NiBTYWx0ZWRfX2PPlfclh0A9u
 Q7XXl4GWZn1//jr9sCRecVnsVs0+db8vZv3CInsgCwRNEEcQJcx+TTNfVHC4qPaldB4jnOB2Tsn
 AbixEStgZNzk+oxsUY2nYHMShpP/T/x1Nhz0oRy6BJVbCiZE8P8prGMx9DsDca2C5o1XTozgsd7
 q46myX3atIQUj29TOPR3ALxQqk+MHZHx4n2LSWcKyKwrNFc5dTGp3mgofcA+OQDIxeXdgOYdWaw
 SIxAtTX2y+Ndg9kEPxI4ulBkFycwcIfs2zorz7/t9RoK+YQ69069AJj2Vn0lfLNOQA1EIntnr6N
 XaQOiNeL9gJMegBzbMj19c3Tz+iwBDsOGQNNK+SU031bz2TvmMrW7O0RAeaBYfPufppD/7tQ3t+
 0McLMMNVvQVofkIHYk6vQTj9F8oTjwsB+dKqnFL/gjq/TKFoGL1n79wTNbimRpy6gxP/Uole/nF
 JgY1P67k6SGrVDRnbMA==
X-Proofpoint-ORIG-GUID: vIPHfeKWWm6K9_fuzavMxj8kO9-fygk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260056
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94227-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EEF221A1664
X-Rspamd-Action: no action

On 26/02/2026 04:36, Martin K. Petersen wrote:
> 
> Hi Krzysztof!
> 
>> Driver subsystems CANNOT take DTS patches because DTS is independent
>> hardware description, thus combining them implies dependency and
>> usually means users can be silently affected. We expressed it many
>> times and documented it in point 7 of [1] (although it does not need
>> any documenting because it is different subsystem - why would you ever
>> take arm64 stuff without acks/permission from its maintainers?)
> 
> I frequently add impending series to my staging tree. This is done to
> see what breaks and what doesn't if I were to actually merge something.
> Being in staging does not imply that things subsequently go into
> scsi-queue. But obviously it does send the message that I am looking at
> merging patches from a given series in near future.
> 
> My script tries to cherry-pick any commits from a series that are not
> already in linux-next and which look relevant for the code to build and
> run in a cross-compiled environment. The script is certainly not
> perfect, figuring out cross-tree dependencies is not at all trivial. And
> I certainly appreciate when submitters clearly indicate which patches
> need to go through which tree. In this particular case there isn't a

The subsystem prefix defines it - first prefix in the subject.

Why would you take arm, arm64, mips or riscv marked patches without
their maintainers agreeing on this?

> dependency that would prevent me from building the code that I actually

You took patches which have nothing to do with building code. DTS has
nothing to do with that.

> merge. But that isn't always the case. And I clearly need to be able to
> build and validate the patches I subsequently put in scsi-queue.

You cannot validate DTS outside of SoC changes. It does not work like that.

> 
> I'll try to make my script more iterative and only backfill patches if
> the build fails. Hopefully that'll resolve the situation...

Can you instead DO NOT pick up patches which are clearly marked not for
SCSI? Like prefixes: arm64, ARM, RISC-V, MIPS and powerpc, unless
maintainers ask for that?

Best regards,
Krzysztof

