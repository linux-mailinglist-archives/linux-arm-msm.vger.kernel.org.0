Return-Path: <linux-arm-msm+bounces-75497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E2EBA8D21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 12:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 159D018926A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 10:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630F42FABFE;
	Mon, 29 Sep 2025 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDLZz7Yr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61432FABE0
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759140591; cv=none; b=LFlIm+ZMZsSkagH+XlyJEftzESewJ91g8sMuDZuPdt81T1Ddc7R+hd2P8Jx/f+LHbCSok0ENrHP+DvTidQDG/CKDG7aa3MnksWrje6UmVuCPuJlfpsC+Fm7ph5V40/+JLbF1g/mLyGRESMABTb6T0vbSJXlVCAWLPOXmUoUL6rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759140591; c=relaxed/simple;
	bh=06Ux4I3QO/gu1GAwm5gqNsrEmJdX2MdFND6fwSh05LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mk1zV4+vkwyJ9PVSPDmn77cGGWJWWLniZniFQ4JruaWmMDTYn5QXe5qzN/yVZRMmYzF4rWO48baNAaUU5mGWXXOJiNsKnBTP3qqCr/TzkTwjr4tbGXJwNno0hNaNS/vuw5Oa9mHkUWdWAv0m8LwRpCYCBkupArMy5Ky1lMtiIho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDLZz7Yr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T9T8uW022438
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 10:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukuFX1CzqOMg1c7sNCM9NZcKqMaOkjZqvA7bpG2anlQ=; b=oDLZz7YruYMhFIVW
	u0zSPMWgmzitP/ZUBUKnzAqqqsF0Q2jifaFbAhuXRu/MDRX569pqun4SRSdv/FtK
	3qMOlOf3Ta7qBCHSF7UwArgxkZhfOtWtLc1cYpEHHzsbNf/McPHURh5/bYHszbOo
	LvWGN9E/5M3q20M6BGdvEvChy4z2Yzg/lwyWynyHCaxlBiFIV48S+D2Lrgig8gW9
	8/q8Qkp04VLiIXsUHPJgGw2h7WDT0EGZxNRiTW25HSy8ML8gYmhJKfx+g8IwDama
	LvYBv/QTA7JffWiw8oi8cLun1RiuY0CaEP5ZMXiO0uhbXqdjCNFnwylLXZoytDQH
	Cqi/cw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tmtn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 10:09:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780fdbbdd20so4716647b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759140587; x=1759745387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ukuFX1CzqOMg1c7sNCM9NZcKqMaOkjZqvA7bpG2anlQ=;
        b=WYGIHlvUItB8NLHhz+3NtXuiy/BHtUt8LK5krQwMQXwtNNoaEsoUu3byx8fv6CwwpR
         zczPJAwsoN2ImaZizSZ+T9wBv9hGRgZJNMUTuybrGo/ijSTfRPjupf2ehdKnn0tVVLIy
         97p/QTPK/Qq0CLdjD2fCyC7EpaS8c6W7PI5kE2T+2G4YWjUn1pgJ13yucISMdCc4Y4ii
         q64vYgy3ntawwufphFZJ7mAZV8wB2WxOWxchfnogU7xskMniF+4MRN60FCOif0gZtx1o
         F8m+3bgiiMK53XYOgd+XfTxVaJqzWnkUNRLgPIP+VCYAFzW6I5Wer1tiCj1tRcYLhJ7l
         gaoA==
X-Forwarded-Encrypted: i=1; AJvYcCX1CBTbIY/GXy0RQBM3zEbzM+80tmB34SXeyv2NEgXY1onN2b0OL3mxzpkLvaYgsDhVo/unS6+KoV3dgEuO@vger.kernel.org
X-Gm-Message-State: AOJu0YwHrc/pBGlqA5I19p3nl/eNSLreUwTdNzCb7ZzoQBQMZnJy2ePD
	QAxp1ryuetk/49JhAfr6KYoJlloRvPlu/9wxu/MD/0RInpsUvlhBDy+dQklrhfqo5dsaYa7o01R
	/MariA5AV71GjOLkqX2+zDQftkLh2p2xHx9GqXjiV4hOGraR2Jy0Jja7vWvrOqygWvace
X-Gm-Gg: ASbGncv4CzN7Y08VmfwmvpzOsb7a0eS9tmo21JW+JWqy9TQh1wu+TJRTSaWW4TAl61a
	1FL9TJ2fn+9z99HyXA83G3g66X7/8DJPsZ98BXiQ5Ibfc/WybCEIuC9L7EJuu5K6SHEgAhJO45c
	7D2QecOmv/odmvfvTR5qsE/0LZJgP5zGZoxOx+keG4YIIYX05C3YTCfGQ9B5PQ1G9tKOHOW1fsT
	G+LnXJ6SrpgMA11KWbO+HCZ8E/LBEcxnqyqTVm++KMEvzdDoDs6ThWsyPR7/s2xLsTdgibdgx9x
	7qyPOnozJPNxHzWLqt9SJo2Bx5YT30c4nsYwEpS40PHcjmulVLAWSZXh0j9mmPaZimTCLWtAyQ=
	=
X-Received: by 2002:a05:6a00:1892:b0:781:9ae1:1be6 with SMTP id d2e1a72fcca58-7819ae11c98mr7578401b3a.6.1759140587354;
        Mon, 29 Sep 2025 03:09:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEONG/QNzmtooig6eHCxhIPb/wc02QLjUsMZtIaO+cmgm4v5/5vvNhS/Dl4PpsqvI5jOEbpQ==
X-Received: by 2002:a05:6a00:1892:b0:781:9ae1:1be6 with SMTP id d2e1a72fcca58-7819ae11c98mr7578378b3a.6.1759140586881;
        Mon, 29 Sep 2025 03:09:46 -0700 (PDT)
Received: from [10.219.49.214] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810cfdb99fsm9344624b3a.31.2025.09.29.03.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 03:09:46 -0700 (PDT)
Message-ID: <809add83-ddfe-4fa1-8947-76e0f49fc6a1@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 15:39:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ASoC: qcom: sc8280xp: Add support for Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu
 <quic_srivasam@quicinc.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com>
 <20250924-knp-audio-v1-3-5afa926b567c@oss.qualcomm.com>
 <ru7km6vtbxwnoqtt2zf24si5envayqh7qy45mc5molevrgt5pv@g32atkcwqyan>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <ru7km6vtbxwnoqtt2zf24si5envayqh7qy45mc5molevrgt5pv@g32atkcwqyan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX8UTa95Y+7j6b
 dRBoj/fikSzbWuMM8W+r4/t9mf9BT6qjAkIHFxVVE8jDVf5Vleq5D+rgqu0+0zUnReaXbQWd6dm
 6DKS22CqB62i9Vdu24FOTUAnWkmbRGrdbFvOgA5/EayAbLV2qRSKjOnoceH2FI2Ecwmnh3IlduH
 IqCO3WDaN1/f3P+rL2IXfmm0GU4pu/GyWCXyKGP0Mdllwut1PqVWQOKUxXJDJiCM7El9FcTbUko
 NI1AgS2XLuRUk7/9B5dYwhglTJrCrsQufjQXzLqFFFa/705ear+zHhdPuATjOcwMYuR50T3ckXn
 e61eLO/v/s0e0Qr+y8PDSgGihkKZ2UGyb1AFi3jQRs6drL1N1xyMT7WmcuaNiVYP7owXE4rP5S6
 /E9ECHxo8FdU4Mop44UTE5TkiqfYgA==
X-Proofpoint-GUID: Pha8KHvwVKZFfL_ERJGByanV9qToP6Xw
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68da5aec cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=P4kkzRDHVV3rFGJAm7gA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Pha8KHvwVKZFfL_ERJGByanV9qToP6Xw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029


On 9/25/2025 8:29 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 05:01:17PM -0700, Jingyi Wang wrote:
>> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>>
>> Add compatible for sound card on Qualcomm Kaanapali boards.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/sc8280xp.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index 288ccd7f8866..e231112175d9 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -198,6 +198,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>>   	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
>>   	{.compatible = "qcom,sm8650-sndcard", "sm8650"},
>>   	{.compatible = "qcom,sm8750-sndcard", "sm8750"},
>> +	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},
> sorting

Sure , will update in next patch.

Thanks,
Prasad

>
>>   	{}
>>   };
>>   
>>
>> -- 
>> 2.25.1
>>

