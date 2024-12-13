Return-Path: <linux-arm-msm+bounces-42021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA429F0CF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19ADF283178
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF36D1DFE1C;
	Fri, 13 Dec 2024 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6z5lwr7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7934C1DFDA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734095242; cv=none; b=aDf3QgNR4AK7Pnlxs2yhrw8IIXDPATOUSEX2A2G/5EWoV6v0o6yC6Lb/rOTyDkKVYyyTOJWq0bMJVrfYnAC7yiPXPuLcgkJ++4mzABrgE0AqXutBXGi3u/MGbU+1sXqr897Fg9aMA6OuYlOEC5KkC4yWSxIaUgz8NYSC+KY+LpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734095242; c=relaxed/simple;
	bh=w/6+ve9RzaPBaoheJI+Wc1iUmCYama3hSNzHBTU+6YU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HaNfsvRwMNSPxAmWglN9mXoexGHgMHddNgy/LucKmPZfmbqG3f6nMj7Nt92+eap9DGRuounXqba4fiiJGJL9hRydvR9xWalArqPJfB5hbpYqwba4+a5qWknrV5GVV5oCJZyxLVJPMyxKsE4Yoo71gF2wEcdjx0hbetKm0rKLh/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6z5lwr7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9SLPU030094
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 13:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3kySfdDJgFxHc5Zd6RhdTyY2GR4vOj2W9Oallih6iSI=; b=W6z5lwr70bn6QE5J
	e8ndajbahMeBwuSoIu7LNgvjeQqgMmXcnqkY3vZRZpqyMwt+Y7lLCg/4VN2tabjp
	qWsTh0hCVLHbF2A9zV6GKpTfE0ZeVWw/sNukF00jLQh3FWdeb0TatZAr1Tj05OG4
	9t3Cr7VwSkWZ5XweRWxj+6dLIQhlzIhpEjCu8MbqWbLp88iHelYXdZpxqKFpjsuE
	Oo8gf410jc1f4+m/7fiyxqdyPw5UzDt7F+MZvFt/MSZVeU2zNQiqCPlU5zb2GfTT
	4q3vKck+w3tdZPPD+SY8BXPG97QFDZ4X+0xvZ4koYxRCoO7ucznKwmPFmrW4DyB6
	STMp9Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgekwty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 13:07:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6d50cd3aaso10823485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 05:07:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734095239; x=1734700039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kySfdDJgFxHc5Zd6RhdTyY2GR4vOj2W9Oallih6iSI=;
        b=JSWG1TTitJneiLA2UxBHVsuLMsyiMRx4oAbSzGPTJ+0vC2H9K0CCraQvqu+S/1LQQy
         ZT74BW3jgd3/o8WRSb7LOxgj+NmPxP9wdzZlV1I8cNvnTBCcC9OEM8GmLg5jR+5zwDoQ
         0tmFUfxT/G7jAibpO82J3gIFTDbr0B3E1OskAaDYDwFGeYQnfXyF3VXNj5b5gfxyCSg2
         fvQ1NlT7n6Lz2bSLj7NIswq//hb5kKusaDwZ1uZpgau6fbvGyAi+DMVSJzT/CO6TQqXU
         /IvhhoftqqM7lzaVJkx159M5mF3zHxhvBFOnTqe3+lnBO/0MwNCJNSawAMkYe+ZGun2V
         vhkw==
X-Forwarded-Encrypted: i=1; AJvYcCVDDNXc5DJXIz3BvuLdJtcIUOns0Tr9uNHzbFZf90fhJy6gjGOFaL6IhkSJCpmCPQvdg28/OHNWzAuXlfnz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpbp3B9RQfR3oVXZynT35/iArT5GThFjthtI9NepDwwqSeWdAl
	iv10dRhJZMkdD/mitz38z8AWH33Oy4IBHUEEgT3VcOKvhH12Q4UKo8sazQSyEJKMBqtYo/WmzbV
	4J+wtRa6XBY5Q4JZ+lgPnVnRvYZGl6/EHH6n735WRSAooubh/HtYR8q+Gcxnp2uDD
X-Gm-Gg: ASbGncui1VUk/my8lvNGPdp5iwAwbqU2cfkqpif9tSTY7g+/aBA06JjN2Xvw4b/DeFv
	QdfVZBzYQRHXS9CMVUl8ALubNjc0i6tuQ1WvNAZuT5tcvwX3rM1gFytUF6Lu4TUDTnNinrZ7urb
	7m7o8v9qBh8KfNGXjiGAR7JMnJKrOh8dSsE4yQu9rGqIWg/kCEVoN8flw7/3n2+FUulEh2vNCO8
	U+KkRf9nqBLt7KGXtYQLMLvSoUViFV/Ylu02qblb+ROsQGbP220IHnExcOUZzrt+doUuvPt35VN
	3YM8bjZUm86RJnMSYQjbgMidscRtwHpwwNHE
X-Received: by 2002:a05:620a:191c:b0:7b6:c405:b586 with SMTP id af79cd13be357-7b6fbf19210mr127492285a.8.1734095239275;
        Fri, 13 Dec 2024 05:07:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHU5KoMkP7VcnS5fuuhMe+i1h6GhGpqqGc1qtXrq/TyFLzkwl4mhODTyzWl98c/r5UKJXketg==
X-Received: by 2002:a05:620a:191c:b0:7b6:c405:b586 with SMTP id af79cd13be357-7b6fbf19210mr127490285a.8.1734095238895;
        Fri, 13 Dec 2024 05:07:18 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67d6fcd3dsm778291366b.80.2024.12.13.05.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 05:07:18 -0800 (PST)
Message-ID: <511d5ff7-75d3-4c40-bc87-3087f308571b@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 14:07:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: sdm845-db845c: add i2s playback
 support via LS1 connector
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241205023344.2232529-1-alexey.klimov@linaro.org>
 <20241205023344.2232529-4-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241205023344.2232529-4-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4mNZigmEAsjWpKLjAzEwoglVXc4hFMcl
X-Proofpoint-ORIG-GUID: 4mNZigmEAsjWpKLjAzEwoglVXc4hFMcl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=966 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130092

On 5.12.2024 3:33 AM, Alexey Klimov wrote:
> DB845c board (RB3 board) has i2s signals exported via the first low-speed
> connector and this is also required by 96boards specification. Enable
> playback support via this connector. Since this is specific only to DB845c
> board the pins configuration is also in this board-specific file only.
> 
> This playback output is fixed to 16bit, i2s format and 48 kHz and works
> with simple DACs.
> 
> It was verified with the following commands:
> amixer -c0 cset iface=MIXER,name='SEC_MI2S_RX Audio Mixer MultiMedia3' 1
> SDL_AUDIODRIVER="alsa" AUDIODEV="hw:0,2" ffplay -autoexit test.mp3
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

