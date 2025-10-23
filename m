Return-Path: <linux-arm-msm+bounces-78519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E19CC003EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 231884EFDF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8B23081A5;
	Thu, 23 Oct 2025 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lbNeaaBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECCE307AE3
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211847; cv=none; b=hfq00+2mlaXFik1P8t8i48Thhw8eXzeZBZRe/yyiiYvu+BaN2FVDNg+G+Spbf+i7be3Xfm5AqXZgxzwg/BVLN38mGfm1F3+G/uQjaWPVnbQLZIE4X0RDDPHfhxuDjz2C9o+lCLyedt3pjO/A4zBxzLpkD3IWJmdmX4x0MtHm3UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211847; c=relaxed/simple;
	bh=gDpUDiXrDas6zKuKFZJhSQFS5rIKPulwiUd2vxXh9MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+WLPJwcFM/D4DmW/4Ny8S7sijp5NdyysSDK197CExh9xah0x/PAPc35LSLBM2ENNv3vHdQZrxA0xheL7uQ0Bhi69gMszrWXn91k8DI5nJc3Dd6sk2EVuddCZrk8W2Tv1VxYT6h5d015P1kmio2Dsb+ecORbmJqQuEQWKl2p/mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lbNeaaBT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6fA8U025832
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lvgrhya8OiRRBgIX3KTvLE88himJCuk7lyQHjo9ZbF4=; b=lbNeaaBTGPJafyi/
	nyzF4ismjyfezEmXhep83IaTcL6tanuI7Znm21t2ByjlsqjpPG7mj2zh2WxSmT9s
	9Os6es7xQowzcKhOlwIRFZooJl+VMMsukNkNAZTavmJnoSdRVX81GfgAMuG3+N5P
	bXIpjM414MM4qGuzXfFFajL9NtK2Zhr+S9tWZAXUHuUtad4yA3YGMNUejyD91/M5
	l1EdcZAfWbvj2u+4wP1VzhcjDg+L4OAwrx9/VlTq4qveH7N1zsnTupnT9apVG+Tz
	RGkiBAnu/ohYoGtZpokqqRZXxZu7xn5W4M+eIXE6dEb9vCB9lZqNPqgbjh6Ak0C2
	H16HSg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kfne2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:30:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e899262975so18903411cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 02:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761211843; x=1761816643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvgrhya8OiRRBgIX3KTvLE88himJCuk7lyQHjo9ZbF4=;
        b=s3JAlPYLSkjgQj2s+1C9bnY/ajKkRLu6Gb8R87i+8c+S3GksQie44DBK83HJi7t7kg
         lspvH9YnHEA9X4H8UDNBrEg9v8RXzrnbt5Wkb2TZSE8Jy5qMEvL6TogB/MIvVajI25Va
         thwNMNXT79okwXL4M5sDEeJ2kTVZMTkeFmAmLsUP41r3BgKRKGfyi+2WDGkTRmz5qlt3
         JU3Iu7p0rJdDLbAwk9GSsJCDkIDdFwMwNhkeR2ndJeSADhUdXrT8tKdcpk/6r6sgRkh5
         CQBwTJBpmjxpKfrvEsgJcN9r54ym5K9XuoWYhDD0yLHM4h7JbxYYbAtylJWe1FXQD8xR
         8pyA==
X-Forwarded-Encrypted: i=1; AJvYcCXhcETCxkQmA7asYbMyw0lyR1YH5HaaqFBGk80BGHsC0nGG7kaTM2Y9K7zbhPQycCeCH0vRFpEVfy2JbiTH@vger.kernel.org
X-Gm-Message-State: AOJu0YyK0djdkSZ5K5QHOS8VIHYNKLMzcZE/JKGoGptvlZuP+/D8hV6o
	LkHcCw0vd1YydZuR+mWewFhLuJHLdkQqvTUeYw7vTtthBandVWMTVqgI0/7Nj860sLY46B5QZBD
	OIsyFfRzMn3KCmHj7Jm4vuGCIsutoj9YLhCMrpE9pl4EHTbCbyTf2fzq0SMaKMbotIAqj
X-Gm-Gg: ASbGncuEvuMoz8BN/brqw66Vsu/RtB1BT+84FfQD62FWZ6Nx0AZe2wdrjVdKEWN/gei
	gTO4Nw0iGBfUEz9N2xmxt8esX7mOnb/wgIwLMMvseJWRUNjhRnbhoAmClI0By7rtvjKn0O1JlgB
	mDc7tarQcxv5x4p+1FQ8vFGVQQIaQ++kwxeVLpbJC78crGK/OAsVRL2KltGOLnXxu5z9w2So2mQ
	ktSg2l7/s6qHepACiJen/7fhVjSOuMzxu4eWNESv45N4cKFnXL1K64YirBaLvZNtHG9IasWGAmG
	xfUzgONcCJAul5iVsDwc5tyZohj0RKVb2ECTXlAb4fxIqWxCh1+ccV4s8nqNbArsUMTYnn9Vn3V
	Xdsy0FgLYfI6RkflEBXBJu7wa1Q==
X-Received: by 2002:a05:622a:1a98:b0:4e8:bb14:d97a with SMTP id d75a77b69052e-4eb81020578mr17636421cf.3.1761211843495;
        Thu, 23 Oct 2025 02:30:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFffBBqQZW9ZspBnX2nRA2fUq8D1XIhDY4m7fLDnOMJqAU+Iq9eeSK2rMWGBbo5Jvh2IgA4Qg==
X-Received: by 2002:a05:622a:1a98:b0:4e8:bb14:d97a with SMTP id d75a77b69052e-4eb81020578mr17636221cf.3.1761211842966;
        Thu, 23 Oct 2025 02:30:42 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47496be2eb6sm56430105e9.2.2025.10.23.02.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 02:30:42 -0700 (PDT)
Message-ID: <a38edaa8-d793-4e3c-ba9a-b8717c8e7569@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:30:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] ASoC: qcom: q6asm: add q6asm_get_hw_pointer
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-8-srinivas.kandagatla@oss.qualcomm.com>
 <DDN8PM13DWWZ.BCXRTJIFB7PD@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DDN8PM13DWWZ.BCXRTJIFB7PD@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8HVSaBRmBZC_YZ5FWTenOGqf50Rrqqtq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX6QMvTb0/azMg
 ltkvV3tVYKIiLr/Frb66sGQGTnvLa8u5DVtEaYar0hN9giPOLGmJiOkMB25KqRl0uWnSuyEnYQp
 6ZFkF7hT1o5+/MiH5tywe3Ff5EEm2tRgjp0XfvT5hHXMAA64VyXMXuX4HSMvLbzxlcQV3bP82an
 4379cAHdRyhZsLE2McG2t41TuChLHAzRsb8p3eR511D5tT7kBVmTM1KQz1xzlm2/YY06NC4qDVZ
 iUJjYuymWxVFPRlW4bThFq8WUMjfZ2T68ER4xNCxQZLdwN2/naGFlgL0GLC6j4jSWjXZ+YWGep+
 Z6zGWqDzvDxCMqoCkeTfocsKRtJ+5Bih2YgmHM3wUnPqoxhtSzTRiaILVBvE67Vju0S1+p3mYvm
 PnhrIr4Gu1q6Gr3kqowCcAtye3XNig==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9f5c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0tmoJSEW-Zqf1m8SmKkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 8HVSaBRmBZC_YZ5FWTenOGqf50Rrqqtq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On 10/20/25 4:04 PM, Alexey Klimov wrote:
> On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
>> Currently we are performing an extra layer of calculation on the hw_ptr,
>> which is always prone to errors.
>> Move this to common dsp layer for better accuracy.
> 
> The subject says that the change adds q6asm_get_hw_ptr but here it says
> that calculation of hw_ptr is moved. Where is it moved out of or from?
> 
> Currently the commit message is confusing.

Sure, Will rephrase this.

Currently q6asm-dai.c implement tracking the dsp hardware pointer based
on callbacks from q6asm, this is really an overhead, prone to errors and
redundant.
We already have buffers and tokens which can be used to get hw_ptr
location, use this instead.

--srini>
> It seems to be potential confusing split with commit.
> ("ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer") where calculation
> of hw_ptr was implemented in q6asm-dai.c.
> 
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/qcom/qdsp6/q6asm.c | 12 ++++++++++++
>>  sound/soc/qcom/qdsp6/q6asm.h |  1 +
>>  2 files changed, 13 insertions(+)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
>> index 371389c8fa7a..643ca944b1b5 100644
>> --- a/sound/soc/qcom/qdsp6/q6asm.c
>> +++ b/sound/soc/qcom/qdsp6/q6asm.c
>> @@ -6,6 +6,7 @@
>>  #include <linux/mutex.h>
>>  #include <linux/wait.h>
>>  #include <linux/module.h>
>> +#include <linux/atomic.h>
> 
> Ideally this should be sorted but it seems it was not initially.
> 
>>  #include <linux/soc/qcom/apr.h>
>>  #include <linux/device.h>
>>  #include <linux/of_platform.h>
>> @@ -248,6 +249,7 @@ struct audio_port_data {
>>  	uint32_t num_periods;
>>  	uint32_t dsp_buf;
>>  	uint32_t mem_map_handle;
>> +	atomic_t hw_ptr;
>>  };
> 
> Thanks,
> Alexey



