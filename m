Return-Path: <linux-arm-msm+bounces-82463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0EAC6DA90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D4F1D3A0453
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3CD336EE8;
	Wed, 19 Nov 2025 09:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NydyMXWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8/IXcMP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018EE335BA7
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543689; cv=none; b=I3P6FtdXyzU2mCRCQAvTUVPRT2+lGdD4T+cmOCxPrj/nom8kIw4DM0yJ7KoFR0Cxx2K4QNGNxY/1iY1rFP6nDVnxYj8KZ2OlQzlEvO/LblqhTKWk2vgX5uJjtpDrWChmX96R5k+A9EuVSJawQVRqOkb6lu/6BNx8TJzddvl8i9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543689; c=relaxed/simple;
	bh=zR7V9PRFIegXGIBhEStPnVhYH2rJ0jUVElDAzP05aMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBtRE7QSDQGqXPOX9eAd75JOkaAyJ3ZY72xZy2rcD74Wi6QRQSBPczPkxM0jO5dtRSG5bpQzXpI0yGVmZKyQ7lf0gWd2VovIBfrZlKjJWwbfiIwCJrpEFM9/vLu9Vm0Mncwt2GPSVzhaZtljzQbqMftJBnztdNqaORvQ1TtHzsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NydyMXWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8/IXcMP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ9EdpR3412656
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nl/6fD+Hyd7CoJDblx7nZTfga/QGoubL3gzqHpAe29Y=; b=NydyMXWMmA9jwIc5
	J/rY4/XvEd4sGjD6GoQ1QE1ZV41OPWJjbt0JWMiXFG1d8V5qZUj8zEESJXxpjkdW
	sR27d9vHTZku+TwQjFig4Y49bQqPj8w1JqwClJM5y4skK5N7mMlwldSKwQcgMYrP
	KryB9o8R3GoqXQWKVy+IaJ4l5PpDVxW5TzvvHW8mIwTi87FsuZZxvdv1jTPqqli0
	CDm01zAxRPQVuGq/E1mgiAOayX+XPAR2u+CUhSqEn/kNtBG3wRr913T6br+TR9D3
	1VHoD6zfXID42G7/W68rZcDndSBoXVM2l5VyU+IETy5tVBr+NtgY9fhVJJyzuhoK
	R1tS3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agv0v2qey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:14:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b222111167so190806985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 01:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763543685; x=1764148485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nl/6fD+Hyd7CoJDblx7nZTfga/QGoubL3gzqHpAe29Y=;
        b=L8/IXcMPMkZMTjFPu4dY5reHC/sOfdVbIPB6ByzNVbszN+XZtk3nQFO9Xfhopf5lHy
         vgdjykODJ70IOLLBfcIa2xX3fgkOkZDNCB4FcwdSyePHBSg51TcB5RWBNbFvtdLTpYdt
         j+bizDUY1HYuyqj8cSKDxO9RRCXE0Zc+defrK/i38zvXa6NrDEz/eYIVxIIj7twftAUv
         uQGybTwCen/xz/vtQ9SfrYTorQoMPST53+786DbZoC1JiBpraqJd+KR6PLH9lHSAVVcw
         5mRioC/AvqvWbcnQI9Ox9UUJFu5kueBYaCc/rMeVgyipjn6BICea89cbQYXY3UFwKsRk
         Hj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763543685; x=1764148485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nl/6fD+Hyd7CoJDblx7nZTfga/QGoubL3gzqHpAe29Y=;
        b=pJkjAD6i4NjLa0K6pf5GgFuj/wWKGKFv9/jzre0JVKFJO47I8k4vyM4B42c7RmG0kP
         SO3ticyB3wkCyLQ9keca+fUMpVEQK1I1boHJQ1/lfe36UyF0VTsnPr28liEASwh2ZfyR
         +vgwBs0+Z8Kpx2YAvO4RYLl2wQA7K5wzlftMgJTabfH81TCwQfA/rjLA7LE//W6JW7bV
         6JXdAbZQ8yN8Yd6n4eVuG+hy5+JOB/KC36H43bklIPJctGrhknF/dw1SckhsrPOaWhMf
         77S9LzSB234Te49iqxvI2twL8fXlXP0b00b1e7kqZYR/uMfVmu875SrCUrn9kH9HkOUb
         qvYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWBGgwxtf3VdxWAQg/OvDTIJak1Hw5zjRy7KjNnX2bdsN1snwin4GPU2VqWXg7Ro8ydI6EOJtGU+r0d+p9@vger.kernel.org
X-Gm-Message-State: AOJu0YyfngjNwnTYdVh35jTF3I3euM9q3urQyXwQkmiITVorX1YEKQDl
	4vyq7c1TrQ0gdZRX2PcuqvpmLWGQFlngHpOLV52kZ8JpfA4uKSm8A7R+U2OFqD1qsILZj3G0AwS
	809HXR9+PtEFTZPCaw5Ij9uMJEiO2kkvhkNDsgGva/d+jumdlUBKOy1DlmQDiCBmuMwOg
X-Gm-Gg: ASbGncuuZpELipOBjXXaOLkhegOcAtzlYuoVA6ho8GdQDRrl1XeuBET9uypx6mFRylb
	Lqc7MiaQqrk3wwfgALRLpoElAky1C2BwFNkcc/8KC5JEo2bJuN8BJ3zU5SPChJ6sYYtdxjcteHQ
	zILS6rWCaZemlIIW8ursLNk9SxhwIGiztxxKtqj+eD2QLES3ew6IvSUHXNhdV4m3azaNK63aPL8
	JOBdFEKjmSntAbf7xblTSNCseMzIYqdPK+7ZN87BpXBAoNBd+x1pSDVElxTFlimW/odoD2BOJCV
	3iVfmhzT4y8hHZCqKeK3A7L0JWtMl2K47KngcmjDzip0jUTFthSlPP1w7bn760omSk0Cv9z2hs0
	S84ci3N+XKVps0HIYcXHuuyXD1en4RZSwsJAAH4zNetkRX4dBee/m/tbc86Rcbj4Ysgc=
X-Received: by 2002:ac8:5a81:0:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4ee317e0a64mr59638261cf.8.1763543685218;
        Wed, 19 Nov 2025 01:14:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGObLPZkLSTwhyHEhcM8iEzSfjtGJQl79qr6rZQ0cnMOHqYjW6bF4CMAUDOqre1/Yn7BoVkmQ==
X-Received: by 2002:ac8:5a81:0:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4ee317e0a64mr59638001cf.8.1763543684575;
        Wed, 19 Nov 2025 01:14:44 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa80cb6sm1567289066b.7.2025.11.19.01.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 01:14:44 -0800 (PST)
Message-ID: <bd6b2ae7-71e0-4c65-bae2-81240bd2515f@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 10:14:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/2] drm/msm/dpu: use full scale alpha in
 _dpu_crtc_setup_blend_cfg()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
 <20251118-dpu-rework-alpha-v1-2-293d39402b59@oss.qualcomm.com>
 <5c2e47f0-ba96-4433-b13e-9e819cfe2204@oss.qualcomm.com>
 <ogiiqha5ak5z4atck7ykyvbzw4juegsn4z7nazkkstiep3duwe@6qc5ag3kobj3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ogiiqha5ak5z4atck7ykyvbzw4juegsn4z7nazkkstiep3duwe@6qc5ag3kobj3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA3MiBTYWx0ZWRfX20thmIgQb1FL
 I+WHVas6YApXme4P4SoKt7rsr9jVptzGy7RB5PKRok+WcRF+5+jwsdLzBtwoLp4gbmJF12zzind
 S/UB9d2n2NC11XlSk3zqlCT77ETmTa+xnxnHEjt+0sRstT1c8p0mgCmAkYFs9qU0TcIAoK/5W2x
 TIW4ZgZaY/U7WGkbNWUxQwYEo2y+VN/AM7T/2ThwcQLRkOHfg1/FdoSuAxP8mDgCHVcu5zcp7Py
 yzOc8M2SgbmDlvmU23w/Dk9WqDqm9OPh7eMbDWr/S1Wrb65q18e5ow2DzKKxYfLwqs/snCpY1qy
 ac2ReMuHiaLdgQ/7LmTAACwmGL1AJM+cbzJSyyEls9enbF322LcT3Q0A/pf8UUM21KEu88pWgRQ
 feskgjrVqH7OCt3kN5IGhE8MEguwfg==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=691d8a85 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YLj65xLjQURtOJfc0jEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: oZOVreF3Q_eWpfpzuc2Z-Mbbf6n9tlQl
X-Proofpoint-GUID: oZOVreF3Q_eWpfpzuc2Z-Mbbf6n9tlQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190072

On 11/19/25 8:50 AM, Dmitry Baryshkov wrote:
> On Tue, Nov 18, 2025 at 04:02:03PM +0100, Konrad Dybcio wrote:
>> On 11/18/25 3:51 PM, Dmitry Baryshkov wrote:
>>> Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
>>> callbacks embed knowledge about platform's alpha range (8-bit or
>>> 10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
>>> alpha and reduce alpha only in DPU-specific callbacks.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> -	const_alpha = (bg_alpha & 0xFF) | ((fg_alpha & 0xFF) << 16);
>>> +	const_alpha = ((bg_alpha >> 8) & 0xff) |
>>> +		(((fg_alpha >> 8) & 0xff) << 16);
>>
>> This begs for some bitfield.h
> 
> Which one(s) would you recommend? Ideally it should be something like
> 'get N top bits', but I don't see one.

Perhaps we can create one.. there's include/linux/wordpart.h
with upper/lower_16/32_bits().. Maybe we could add

#define lower_n_bits(x, n) (FIELD_GET(GENMASK((n - 1), 0), x)

// register def
#define CONST_ALPHA_BG	GENMASK(,)
#define CONST_ALPHA_FG	GENMASK(,)

const_alpha = FIELD_GET(CONST_ALPHA_BG, lower_n_bits(bg_alpha, 8)) |
	      FIELD_GET(CONST_ALPHA_FG, lower_n_bits(fg_alpha, 8));

At which point it arguably becomes equally difficult to read.. but I
think the rule of thumb is that syntax sugar is better than raw bitops ;)

Konrad

