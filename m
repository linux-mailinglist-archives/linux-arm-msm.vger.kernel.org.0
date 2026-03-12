Return-Path: <linux-arm-msm+bounces-97273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G7UAJfqsmm5QwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 17:32:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D1F275A48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 17:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E94953023683
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5565038C430;
	Thu, 12 Mar 2026 16:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQaxnQaz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I77csMeM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D1638C412
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 16:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773333130; cv=none; b=Da6Mmz0/u6p/NCOhQqSap3bL+KTD+NZhN0CMiqxRAEywcWqqT0Cp+p5JnYsClPKQZrx2yNEf6tVgdkrmblY150D4yeUPDeXQRmiEw5Nc3Oms4RVtgOk4yfcVQxc1f+0mfkoz0L0XR3AUiFZS4BGcOmmCis8OKuJGeRZZzG2MTbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773333130; c=relaxed/simple;
	bh=Rj1aAzmENFbmH263gHgPBHHEzauaoZ9Ko2MKwh+ioR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2+oLDtnjlgZeleSOx+QMg/gbCqvlNmwXQjO/if+vDKuce5NsORmtre23vJQZRNpNv7XakCRjPOejOeOe55DG+85aWS0DwuA4SQ3UiPgc2CQqYmKTEW0yepSOjNthCC+zkorvFt2DjjYkB84fLpcZiUpwUtPQUkV9zBTTNaiHTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQaxnQaz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I77csMeM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9kmmq588071
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 16:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PjpMODJr3NfcaI0ySY7IsYGndsEPTOCwMM567hJqs+Y=; b=GQaxnQazUfNQl3Ya
	f7V7vDxmI1ij1ocsRs89FV1nG37Psefohq7lzCsIhYx0fI4KfDrhUlMI7QJi1qWy
	Jf1T+IjvKrAl2Zg1AndrygzO/sU4nD8GhlyitdHKYM5Gvu4iOUAKUB7DaB9HFqVe
	ZrV6UUX8huuU1DQDU0MPpnAPQJMbljypGkjIwFTDKtx92m/5H7d4yceOwsnPutLc
	iR6sHMWb3MaPvuYsXbkukAepAmLgxKBoqq9jIBUiRqEtWWRoRdG6L/OwqVgMO/FY
	IHcZtknWeOtaEK4JH4YHR61zpYm04n9y3Y7H9E2WenBvqC774be4QPV+/gutZ1Vh
	Ob+BMg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q2txu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 16:32:08 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94ea014ec7cso1176102241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 09:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773333127; x=1773937927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PjpMODJr3NfcaI0ySY7IsYGndsEPTOCwMM567hJqs+Y=;
        b=I77csMeM8Jou/U/Z+Z9Abs4ccsrIZCDUNdlUKOtW1Os+d/iUApaOmsdZ7kkd5ESjjy
         3RbsclQT+WRL/b4gWBDs8SWeesTG9RUPMH0dYA9K7SiGk0FE/XNwPS9x+T8t+v6T6/Ld
         QVN0V+X5nKX8DpM4zB+lknyjqiNGnyZr22AKjMkAs4RuO8gtLo0wYa2xPiTDQQa8uUUb
         FfWw25/L3IN8KWtPXf+u8DCO47GMO6m/qHIl+kITiUky86jEB0lZHne7jE8QH1XSbHkS
         N5/zuV5PsFJ/kUPc1XGwlVmTbThxb+yogNdPEl8FSoT8+fNb5sehOUOggxsrv1E2Bxep
         cjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773333127; x=1773937927;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjpMODJr3NfcaI0ySY7IsYGndsEPTOCwMM567hJqs+Y=;
        b=g0QQehtwwTkOpQk3LPJ0tqMnmIoS39PcwZAxK7Ptg4FS5A2Bpb8dIJGT81i7VAO49L
         ZVBdO8m8chOiVQLmUoJD3MUHOahoKQaj6qtThKPY4y4e249C5JfVovxqaAv7cyKov7Qn
         /7qdVx1jsePnTI0mFHyZ4YAll1e0oVZsnE2LiK5rNtwMsxdeYjzemxJ4+VebSXskvfs8
         Tp3RF7jvc9rK9/HH82q6MLwxce2fmgLFLEcJdLQD0x2efxKlayc6wvIVqke8ECab0/oA
         nTMLgn2G7PhoBvYh7QZeLE42ZCb1JAgNbgU5j2mZpDYdx1jeJDprvWao3OHbaKvtQ2Al
         wv4A==
X-Forwarded-Encrypted: i=1; AJvYcCVph2wb0tunM+yNROk/NK2FtlSiQ51zIhHhrF90Et5DlfHK6derXqwv9MjGtBK+UxNviqxYCpbo9HO/mqRd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk9aPpXc/bb8rHdUpePvEa5kvcngpmWbrbvlcEdHgUaekT2gIW
	6onSZa6xNl3h8pNVh0zVC4+OHZd+Pf4mjD7ogdwF7hIcyT+FbsHkwzylXMI3pcxVXKVHIByArki
	E7ZER98x6oo4qOreR3LY4feflgzIqhmmMjS2G9IcIbQ9mK3fDDd9YNMfny5ejzZ95LhyA
X-Gm-Gg: ATEYQzxlLeCg9+Q68k29cx4CirKAsxFGCKrFi+gnwFOjJGW6wJu+SeQ/uB9ncztk86O
	8yzECTwDbFuQnoDAbiiknbLT3YIxF/tFsBzHezDqdlyHpU0eC53PrB2J4Ci9zjq+2GMl45wIp1R
	04vXtcqdJ6a4U7xPagVdsG8jQN7kC//ajB6zYrLHsg2tlMKsoiClWuS3EskvJKjxuCNOFWrECZZ
	i35FgvH+7larOu448GQF/ZXKwSDGeUYSmTf2T4jfHxkkWVy9FhOEr4x9v2TJTmvWuwm6VWUJRaW
	CbhQDVWQZarnisphhr+djivalsX8RCi+YelNM6MEEvKDFHRjhvbY0z4sXXuZDJTyK6lMyuiTkxL
	s3zcma2ZihOmXcklek+pWXkqfztUKt8bPPPmXqNcRe3cx4BGH
X-Received: by 2002:a05:6102:5488:b0:601:fa6c:bb49 with SMTP id ada2fe7eead31-6020de40718mr67106137.0.1773333127252;
        Thu, 12 Mar 2026 09:32:07 -0700 (PDT)
X-Received: by 2002:a05:6102:5488:b0:601:fa6c:bb49 with SMTP id ada2fe7eead31-6020de40718mr67055137.0.1773333126672;
        Thu, 12 Mar 2026 09:32:06 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0dc76csm50243175e9.24.2026.03.12.09.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 09:32:05 -0700 (PDT)
Message-ID: <e1a5bc39-fabd-451c-b480-03ac9bf2720c@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:32:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/msm/hdmi: Simplify with dev_of_node()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
 <20260311-drm-msm-hdmi-cleanup-v1-1-c5535245f6de@oss.qualcomm.com>
 <hg2icue2e4oyr2pu2osjlbbcv5g2q6golwoabe3oy2bxhvhb6r@ku7aqp5jdovb>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <hg2icue2e4oyr2pu2osjlbbcv5g2q6golwoabe3oy2bxhvhb6r@ku7aqp5jdovb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ySXrZ4AOpf--E3K41rAQ_W5wVOdqg1Lq
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b2ea88 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=R8rHp1AcDowi_5njnBkA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: ySXrZ4AOpf--E3K41rAQ_W5wVOdqg1Lq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzMyBTYWx0ZWRfXwxqMWEd3f3a7
 MNiYChsexHXAd641fRbfJ3hFHjSBOUD+54eTTYLo0WAmmWQKDaAcgGWiUqeVdn31oVql4zN+BKw
 7FCnRe9fs0wiRCy1yUPY90M5s8q33xyIqOC91gusVwjVq1dI1L/I9tsu3eZCN0RHnjbFKPrdQMU
 m5QvRQlt5FOc74egWr+39zPGIc/qqByaMXkTlAyhRaiIRYYuiT/uxPEGpqGA90ghHsaUcF4afj9
 slGH8kEjonOjdOqTdD+ZHDMIwAmA8zQAUWu7K+K7nY1q8ijgifg8TOzx3ahIAZs0X7ec+hcfY0K
 SMjtB1jpqbPf5r8ejsidXZg6YuGaRwbQAGluDYVtAjl9YU68E3X9SWlDMGStcu63G5l+Lswn9fb
 BOVpPvEeZ+NYsdeUH6zhR3pRwT0yxWaLufjbG6yG4VT0bJlgCDouAf299PbQll65OGbrXzzYxUY
 Ex5eo/Qwf6Hq0cl7diQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120133
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97273-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69D1F275A48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 03:41, Dmitry Baryshkov wrote:
> On Wed, Mar 11, 2026 at 09:17:25PM +0100, Krzysztof Kozlowski wrote:
>> Simplify chain of pointer dereferences with dev_of_node() which also
>> checks if 'dev' argument is non-NULL.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> index 5afac09c0d33..b1db1b597901 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> @@ -91,7 +91,7 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
>>  	struct platform_device *phy_pdev;
>>  	struct device_node *phy_node;
>>  
>> -	phy_node = of_parse_phandle(pdev->dev.of_node, "phys", 0);
>> +	phy_node = of_parse_phandle(dev_of_node(&pdev->dev), "phys", 0);
>>  	if (!phy_node) {
>>  		DRM_DEV_ERROR(&pdev->dev, "cannot find phy device\n");
>>  		return -ENXIO;
>> @@ -287,7 +287,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
>>  	spin_lock_init(&hdmi->reg_lock);
>>  	mutex_init(&hdmi->state_mutex);
>>  
>> -	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
>> +	ret = drm_of_find_panel_or_bridge(dev_of_node(dev), 1, 0, NULL, &hdmi->next_bridge);
> 
> dev_of_node(&pdev->dev)?

Why? dev is already simpler.

Best regards,
Krzysztof

