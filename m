Return-Path: <linux-arm-msm+bounces-72268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C58CFB455B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 13:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D22FB482459
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 11:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5FB33EAF2;
	Fri,  5 Sep 2025 11:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gUMM5u6c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A140340D8A
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757070331; cv=none; b=ZGsFdd+wradXL19Ou6Hys24LRLSuO6d5oQtuIQW1eNh368PpPvsVfSmkePsREptZ8kqV/AHeZ9ycFcoUXL02Kz6F/JDuu3tlhZSqJVl+J9ZzOi73oh7Endc99WycVuDZgwT8fBxVh/+vpZob95buMM08TVFlEBqHGr2a8oxCOp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757070331; c=relaxed/simple;
	bh=E+z0OzvLmJ/8onuEFCaHusvgVI2q7XxN8zJfDiwSrx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INkuwlv4+OYEdSNy5GcG+cVzU+E0adG24q5bFg2lsp6jE0l8eSqv7UT4gHKEMOIe8mtxnId62Lecfx3+O9d2zNt7MBYEnGu4x1UrlyUd+katZ0MvzHA3dOyZPoUbMlnttPQil0T3zwY/Zp/0CvIilSFMf0XmMJVbfHvFfuWQ6bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gUMM5u6c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856OmIX013660
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 11:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RCOkVoSgMv1L0VMNcsjOUXK9ZbBvTQO7jnuAMGFDWS4=; b=gUMM5u6caqUD9mVB
	V9qJX3Q58JsMqoFsYNLMc5HTrscb+ZsnsGw4+mGCM+gbbTRrtVbzB18Ri3kq0WnD
	ltDM3tlWsyHjJ8+FlyIVzCV4kYruOheUwrC0ER7am2akLW9OxJHbx1Pa/cOsytXA
	24Cb8dBLSfx21t/MxrQ4YnMh2TcOEbnhZaYh2fIxscHjFvIpS90B0dXJGPpedPJK
	ZUhQNhL5a/V8F7+Rj8Wd65nfkEBWQ4u6Y4MzVrFkjgAwOtiBW9I2q89tzAvkE2Eb
	CTDjFDfk2r3SjseK22S/6ZkZrqhgM4zQruh3v4Az9YQIctbLe3x2TJl4+XtjTjSG
	GMNPTw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyeu0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 11:05:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4fbcfd821eso1527182a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 04:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757070328; x=1757675128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCOkVoSgMv1L0VMNcsjOUXK9ZbBvTQO7jnuAMGFDWS4=;
        b=Ek+/BLz6+v0ZJ2QYKc40v+PZr5lhMI3OxrMIoph+ypXuKgKXaBnjIISHuQazdrX+CL
         Q45X7cYqYID+uZsXQ7OjXr1nO9/IBjbhkPSsfANnIXYicOIww78jbcPIU6RMfa5NM9WE
         9WfM5kcQeCpoxaeHgRvY1+RzKxQXqi31MA5LvYG8TJ3Jvn4ucGOZqsMDkwPdYF53NZ4X
         ouKbl+SEEzFMIsKyMLStlN/I+4nJVi4KV9uSm5p5Qe2AKbaN0cFEWbXcFAzrcE4ijMsL
         0lAlUzTPLQ6FL6nQPqZgNsvyIh01IOd4nJQBrueUpgC+JVV0pQdp7+BqQNlhuJ8gVm7L
         snGA==
X-Forwarded-Encrypted: i=1; AJvYcCXug2amffTgFq5kRTq9w/uKL+rSdcJh/0AudsAKlVjm4F8JIb3neNe2Y+51l2XPtoTzoshs55Sy5cfIw5n5@vger.kernel.org
X-Gm-Message-State: AOJu0YxzYoPc69ZVab1mGUZtXjShNkbyQQh7SeSRbW+B9w+Z3ZRzOE+M
	QYkXVbVkMNF2SEbFvpOW0StwiyT6fUeE1Sl5ZydIDhGV5zt19QY8NYBfWMkyUbSoi66R5lCY7CV
	xYyz/MpR/oaPivzwbgGgjSsbu9MFSR+Eam5gbhb6PCCtgqmSFadw+jsL9L098so6zhkYv
X-Gm-Gg: ASbGncu1OpOyzFZcbjroiA2Oi1xtygddTNXX5SS2hZhxSy3sfjIJP+Fb1VL/0hnKuAd
	W2Aznb6SYFpP677RXVUABxByi9GD875W1ADjGQtRlp1uurBlTtkKgqyC/scGXa8Tnex9UcPwXjN
	s7zLKWcvb0LxnjwD53OHBtK/dp1UzsSB1+NHZsNyII6hrhSfawKnJtS057bO/7GhMLHIl1nw83o
	HF6Gh3LVL5lPjp7ZqqgX7LuQoFYaG55VJA9dF5FKluQ3H1QNGD71NLFqeIckJFA/ZVwUXZhVxlt
	/CTp60b0TQeTEclOu6AwCKT1F/Y2tUGbBU0GZ+mmHZ+w99fiSQDE4xKs53ow+YIP0vX7LKvSswT
	z5Lo=
X-Received: by 2002:a17:903:28c:b0:248:811e:f873 with SMTP id d9443c01a7336-24944ab8f4bmr302867105ad.36.1757070327622;
        Fri, 05 Sep 2025 04:05:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaBaEQj2/Ott7YevOzR0H8alV8LqIEopwPPE34mLhhoSdImcC6vNQ/KnXjEeJsTk2psflJDQ==
X-Received: by 2002:a17:903:28c:b0:248:811e:f873 with SMTP id d9443c01a7336-24944ab8f4bmr302866665ad.36.1757070327142;
        Fri, 05 Sep 2025 04:05:27 -0700 (PDT)
Received: from [10.219.49.245] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccbc8a453sm40592945ad.0.2025.09.05.04.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 04:05:26 -0700 (PDT)
Message-ID: <0b560cc3-1735-4605-a34d-7f2413fda609@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 16:35:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ASoC: qcom: audioreach: Fix lpaif_type
 configuration for the I2S interface
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905104020.2463473-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <a9eae2e3-0e75-4ffb-9de1-3b8a9bce86a6@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <a9eae2e3-0e75-4ffb-9de1-3b8a9bce86a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68bac3f9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ROh5OEer_01NpF1xJywA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: nVIYvv9eBoQaTl6xY9EEQEIsdH9_W-7I
X-Proofpoint-ORIG-GUID: nVIYvv9eBoQaTl6xY9EEQEIsdH9_W-7I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX1yj4Oo+mgG/9
 7k6/SP/DLN7PpA3wrxrgGA0PY+GJIBvUYOLt0+CK5y5j7Pl5MGCdb63v1mQ3U6UpWuyJYxKtiGt
 KRophqxXlhsaKZtRNt94qWQ+Di+FfRp8NCcGk4qoTArIU60eNVCvKxvtvbog7n7ysZ0b2agPjU8
 /+gpqC219Aqv5mJEzAEePvV96VQZ/MQMPjed11oFotMHfwtQbkHMzawzmRC6uJTveim2JQdjWm4
 1uPESkyXEg4DqofAFGkygeZvDpJGDaT25c5QN9PfsSAG0lAkRH6BdO24WSboZX4tlIfGPpqoXfT
 HLco3owf18rL6y8fCPQDGciYS1f4uoh5LN5E1ZNaYsoTfnKSVDv3lLVJVabc3+INz0nX3VBiOqq
 nm0Ls585
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101



On 9/5/2025 4:16 PM, Srinivas Kandagatla wrote:
> On 9/5/25 11:40 AM, Mohammad Rafi Shaik wrote:
>> Fix missing lpaif_type configuration for the I2S interface.
>> The proper lpaif interface type required to allow DSP to vote
>> appropriate clock setting for I2S interface.
>>
>> Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
> 
> CC stable tag is missing.
> 

Ack, Will add the stable tag in next post.

Thanks & Regards,
Rafi.

> --srini
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/qdsp6/audioreach.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
>> index bbfd51db8797..be21d5f6af8a 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.c
>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>> @@ -995,6 +995,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
>>   	param_data->param_id = PARAM_ID_I2S_INTF_CFG;
>>   	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
>>   
>> +	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
>>   	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
>>   	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
>>   
> 



