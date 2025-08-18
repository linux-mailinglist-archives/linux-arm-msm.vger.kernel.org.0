Return-Path: <linux-arm-msm+bounces-69544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AF6B2A168
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 011FD17A3D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A347326D6E;
	Mon, 18 Aug 2025 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYuGxOrG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD0A2E2293
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519173; cv=none; b=T23K20bcpNCn480VRn98ozdGPfg8lfjLpMr+Ytry/d9YMKQomMcKF29OxfsTWcuBj9MyUK+pwZ7sSeYM2dKAbvWEoj0qS7vmWaSvVaGbmG8lPiPPhaDKh8dSQQM9jW/IbKTVtglH3MOodGL3tiESCcI1TR3X6pWher0BHTuPGbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519173; c=relaxed/simple;
	bh=l/Hq9M2tag2Uf2Hwt4nk862X0hV2q6xQBB+TOTBaiCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I9dm5YdC2aSTv0K9cRGX8VpdAYHzGvEZoBwfjVprH9WJycucL14GN6Kwmao8L4uubTMiJ178RTrzhf9moQrR4nOizC8+oyWFxDwxuHq1Xf0nzrJZnbZx+iF4+ZSoRttyrNtQBl+LTPzgdKsU0EKBIWnFOpT8f9yguNE39a7619s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYuGxOrG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7m8a2015589
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/Zk/ptbfC/s0X71iF/TOOzhAZQdu9FozG00nBTib+Q=; b=lYuGxOrGw6KVoj9d
	6wt3DXu/EpGyz1itMgu845RUyfGxJqsDbLju5KAx/ZcrQ3zEvZEK+KCOmkuQ35ns
	XYu00HKVxX5+rMrS7nBKX3nYHmdKQubDLRk7k4CVWX+jYD+T+P+1BGs0ZRsceerm
	iC6/0k/CkR+5QaOd8kjKl2LCYanBQnUMb1Uv38FcNzva9FITphHhg/qk/X/+vNcL
	AezZfIrUK93MMw/8P5fBRc0QdvQqOmruLyxIZ4Eo9ZBKdY22FUpAaUlA06nJ+MtT
	TJREQpbWHOMzlKq9Mvw9DoZX+VKvnXV85eMb1EcWwq4TJU2wJ5azEhOcswZHz09W
	rRs6hw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2ucnu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:12:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b10993f679so95084631cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519170; x=1756123970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/Zk/ptbfC/s0X71iF/TOOzhAZQdu9FozG00nBTib+Q=;
        b=JKmYmbRre+6Q46HDAXXtZRBsG/jC73x2HMCwYCR1ql1tFfcQjAdY6PWgXvMJnpgjdf
         e/VLBAUqe8fcM6UttmM8H03J0I/KER8S6jwf/zDYZnfTztDLu638eMRq9QwvSEq3FXm0
         zqyLc28ZCmA2oGZgmTr0cEWWPZhunqNwvlTTviIrPl7P7m/XyZrDN7hwa0iiLO2Kh728
         wS+I42HhvtVX2+R+pPwAWGAtT8OV1WaTT4diC5I4qTxi9+s+pHwH1Zh2srJ+mdSFZfsF
         G/Rmhi4SxbvNWC3hSudUP7Llk62QFtuSGL6DQsxJ2bE87KkpVECUeyNjXU+npo8rkoCq
         V/rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMHh+cQSE2tiXJUmSlqnFImN+CqOZ/WkDR8/70plwFrGHU8mTrCuKz/8G9LUc3ppd3bFrjMeKNowT0M35w@vger.kernel.org
X-Gm-Message-State: AOJu0YxNQNjlovjEap5cfEKAw7/u+IpLKQBDemIW2r/u5ZoyET7iFbmM
	zeF1EF7VTAsw/cBAigPFXRUCqopnF3j5hwAUpCNsYnh1snNOgzs14aatqS4SECtKI1bD2omZf/F
	RieygUD/lyMQbrQ0bcD7b0VkNDFW8rmeT4ZnpXs+MJPMmodLETevY/sm+c5mgVvkscRbUT0pFqy
	Js
X-Gm-Gg: ASbGncsbKBIyBwPoBVbKwrEwtH8V2gcBF8dMBGdTCesH2N7ToX3O1nqZK48+eh5w52M
	PP5BLoicDyzw1UJUiM47Xi5QNa6FZ4VlmPqozNTqniZBozc8Q5fAoYjOkLXP+JMI+7ZAqUMuppn
	VeCkC0WuWo0SqFVcS5BtptDuyCuLJApIT4XTcP1oOT5FQl+zsPcvcruMCoUSwEbla43HIRGLPMK
	do/K+XBoqs7C7WQwfJMw63rdn73tyS5J5N4yI/YR11/HTomwqYISJd74+PeCfONh7ADXJ140wpM
	A/dE/yf87KU2/E4lw10qJFH+VmRt6iZT8X0DmyxiyCN6STslnp2zgxp+0/lH1yGaf4g=
X-Received: by 2002:ad4:5ec9:0:b0:707:4753:bfa0 with SMTP id 6a1803df08f44-70ba7ae8111mr141335896d6.13.1755519170411;
        Mon, 18 Aug 2025 05:12:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHRFvUfwURz3ewAxMtJStPogLwq4buM+7ktoCYfMhG9uZfyOelR0HnLGAyPJJlNvhRCWmp1A==
X-Received: by 2002:ad4:5ec9:0:b0:707:4753:bfa0 with SMTP id 6a1803df08f44-70ba7ae8111mr141335526d6.13.1755519169817;
        Mon, 18 Aug 2025 05:12:49 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45a1c74876csm170320785e9.14.2025.08.18.05.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 05:12:49 -0700 (PDT)
Message-ID: <9533096c-926c-4251-89e8-84989a9bf0b7@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 13:12:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: qcom: audioreach: add support for SMECNS module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250818112810.1207033-5-srinivas.kandagatla@oss.qualcomm.com>
 <8405b263-08a9-4b8f-ad20-73c8f5865b39@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <8405b263-08a9-4b8f-ad20-73c8f5865b39@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a318c3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=gLwdHoSog2dnRv_T-kIA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 6dv0jVxraWvHTbbUofToKlLjaZs5Ek5h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX/iib18282aI8
 GimWeSsD6B4D3ZG7EPpEI+dDA9xKEYrPZ8JtusdkwDhcS66bXrmPejIEE/xx9Qjel7z3AwcJ+cC
 DF6jw9za0OX9GD7VCMulHY3Uk/HeDAmtklZdOyB1AnZBfalA3FG1yApJiBwZH9V78LElIGhQt7l
 dpGW3YOcpA8UtscAPkh2gFfNuMlj/zBCx91nJ2kNfUQvQ3hbQbVebxPYJtApRnzTeBjJwlGw94o
 kuDYuyq69g4LgCe0rRzHdGK9i6rNi2hezYHfG7tb6ZbmSQYBpF2gdHUO+7jJ3FEKsSlVlW4eDMV
 3LAu11E/PzCWjbrjXqz3Tdcu/eEL57hJYTq57q3u5ASXPVvBSxm0MIDIoNjv150FaAqk0s+rb+9
 4lt+n52d
X-Proofpoint-GUID: 6dv0jVxraWvHTbbUofToKlLjaZs5Ek5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

On 8/18/25 12:58 PM, Krzysztof Kozlowski wrote:
> On 18/08/2025 13:28, srinivas.kandagatla@oss.qualcomm.com wrote:
>>  		rc = audioreach_i2s_set_media_format(graph, module, cfg);
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
>> index 617bda051cf8..2ae6420f4b6a 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.h
>> +++ b/sound/soc/qcom/qdsp6/audioreach.h
>> @@ -30,6 +30,7 @@ struct q6apm_graph;
>>  #define MODULE_ID_MP3_DECODE		0x0700103B
>>  #define MODULE_ID_GAPLESS		0x0700104D
>>  #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
>> +#define MODULE_ID_SMECNS_V2		0x07001031
> 
> Can we keep these sorted by hex?
> 
Let me try that in v2, looks like some of these are not sorted.. I can
sort them and patch it.



--srini
> Best regards,
> Krzysztof


