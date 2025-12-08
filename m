Return-Path: <linux-arm-msm+bounces-84623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E5CAC164
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 06:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AD2A3013ECC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 05:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3512FDC25;
	Mon,  8 Dec 2025 05:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQ8F2Jln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhvZmQDx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCD12820B1
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 05:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765172504; cv=none; b=SdbJ4pGeLMC/nU/eS8CqDtO7vSl8GjJvLf5QDHv15CygxxglMQHJPXji/asJm+Gq3L9garWFB8N7MB1+Msz9rAis3wacXAc1Q1RZAqidcEsCDBbFWJHmf1kY2/7K6ovcXMnvdl+W9nXJ7p6PI6fEqk6pIO2g8QG2DRgQneLv1Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765172504; c=relaxed/simple;
	bh=7hywqH+/Sx8XfQeW8GJuiPTZizH1wiTSteewcJgx60Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=A4CHIneXhkq0B/YM+Vm8X694Aw7BAtA0gyIJw8Vh1Uf+wEHsY0joRyrzCC57/ZRW2dKCcdCvMlXUVlcO8CFOjj+fBC/FTS5SitbhWanZzQJNj6hBpuvtw8x6zPN07IET7w0hMgTX1RBSKwPgXrkLe7oNwr5p1KOIQnUZshDgMbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQ8F2Jln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhvZmQDx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7MIhC93408442
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 05:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LJSSO+Ts8d2gOowhhkTr9zJ/JpTez2Gx2lV0mQTKQF4=; b=nQ8F2Jlnr/PBt/Lz
	CEtq61q+FhIgj5Xk7H35AvpexeyZYbi1TTownV/UOi10SewnuPcuxX3pJgP028n6
	SXyu+JPW9us5xfQ4nf7SmguxMp6oa2sR1rMaVTQx8EVatwMxXgrs7sUghFnj0Nx0
	lHObAaZROgESPcwBNh47zVNydkZPLkdxCO106yyKQw+eUwNoBH1TDnMTB3l8D/4O
	4Px0jIY8+LUnwTc+W/9wtEjPTIizCUYTODbFCfMj2h2Db3e29P4jYeLp9Qfdn0+9
	hpfH4KhCRy0qMIEDtHIY6ifxs2HlgIuuKynt/B12S22Cy9Zyu15FuYvmKEW9ZYcv
	ExhIGQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcjvbq42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 05:41:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7c240728e2aso7476231b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 21:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765172501; x=1765777301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LJSSO+Ts8d2gOowhhkTr9zJ/JpTez2Gx2lV0mQTKQF4=;
        b=EhvZmQDxQ60A2a7qGVqHwsFfg5vqQo+eGG0uRD4RZQVMaJvTwEIWVaDKjoLE+gzhIm
         mkZlo0Bj7NgSyyas4/gtEjpn4ytUQr3TY7Fquf/+92LbNdRUf8N19bicZ+ClI4awY2Ph
         1akw3FDeHR0R2jHYN2wBFU2DTSZciyrKmx9xFah6Z3SK/2XdS8FHfXqpkA9XN7PFCsM4
         QbbFS0vRh2Fup8hplJPoTVMRIds8epTU2isfF5EFPtYPeMcNhdUxan1chU3GyuJaZ4nF
         M+RJ5Yj39PgYDeXty2G+uO2IhPuQP94T5Fv9tS5ToOerIGPXTPwb0bmedkVhHIoqVVZs
         r9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765172501; x=1765777301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJSSO+Ts8d2gOowhhkTr9zJ/JpTez2Gx2lV0mQTKQF4=;
        b=VuqwS+myK92xO6eoUNdU3Ci8QTfth2pc41KWyOfzwEkYFSjaUaMtkDEnagG4Gy+f9z
         KZMlN/FLZPgXjwe/Bod1OWsKXzLlfIgkmP6jASwpvO4GP4FgntHC7VOkYsoniHBzzvw4
         iyfmA8+3ed/j4o/T260lr83/8Q+WD5aSbMcUUefz2lNHKKQZgSfTsaSBd7wFBM9/wVMt
         n2CGEOCsjPoOzSxGBdvl/XKxsTVGxEgY4k9g2EOYMUlK7OCt7pRNeCdu01WT0tSVcQE/
         mPDX87kpHS115T0jCb57432E+r3GpcStxt6O7HjeiSHNx6vCQu8Jjl9LM6LCF3Kj0MWw
         721A==
X-Forwarded-Encrypted: i=1; AJvYcCVGJqL4QilVC3bJjtpiFOeUJJGt+A8e1eTsZBf8OQhQknfB9GJlIWNdyJQ/gXfHwFdYpGiBQeesWZ7Ubscm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4UtCsxNCo4X6pBxj4UWbnhr46hPkw62+i6T1FSWdQkOm5Vep+
	OvkaTLrFIOYVG6kB3Qn05pA2gWOPTuVp+uxeM2xK4wwXVow4MNRWxKAM8rFSAnjiDhdiau4B6Ao
	xvz/ywa7S+S43r32xky4cALNZWHiThncfROjSYy8JSBPi0nKZt2eOB2MbUOzqIUB4z+qN
X-Gm-Gg: ASbGncv6GbPh/ZE+Y9AVHpFahxD7Cq3yE5E/DD/+d0BltA5MfjnuVxsgRlMdMqRHsym
	oMRsjL04Spf3GneuOBv6kdn6X8Bkc2ll6i8Fn/yf2rk5iZvwoXuDIN2xRx9YRbnj+XyHlZGklX0
	s0VZLYp2lBCcB7ezPOomqxeguPAkv33XnWVQ4kr+Vl7OIcArxXq7XhowdUqm760Y2ehJ27m9Yy5
	xhF1cta+3nTFtdZuYfKfyqMAxROJOhQBqJeU0x8u947UZuZcFTszZ18X3HTW+Qff1+zh94rmLSf
	ezuPw0W3psM05r5hMOOFY9WxvVpcuaNFMEycogvp3JMOgWBKUolESC8QmuS0hLSADbZBUF1bVlb
	HdDcY2HQbgp4p4l3/mRi1H/Gm2QdP7z6Ru5qbzA==
X-Received: by 2002:a05:6a00:14c3:b0:7e8:4398:b365 with SMTP id d2e1a72fcca58-7e8c561fb2cmr5860664b3a.56.1765172501097;
        Sun, 07 Dec 2025 21:41:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYY5YskHP8FdfN0nPO89xoJMhoLLwBeVdA2ZSyjf/zcK3BzEiOw5mlexg+K695fZ2oI3cdOw==
X-Received: by 2002:a05:6a00:14c3:b0:7e8:4398:b365 with SMTP id d2e1a72fcca58-7e8c561fb2cmr5860648b3a.56.1765172500605;
        Sun, 07 Dec 2025 21:41:40 -0800 (PST)
Received: from [10.92.215.253] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a07213b6sm11807400b3a.26.2025.12.07.21.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 21:41:40 -0800 (PST)
Message-ID: <fb4d020c-5119-44e8-9866-f86ca582ab84@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 11:11:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: videocc-sm8750: Constify qcom_cc_desc
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251208020621.4514-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251208020621.4514-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Dccaa/tW c=1 sm=1 tr=0 ts=69366516 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dIrJftJwEK3lONcwLLMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA0NiBTYWx0ZWRfX9K/lr+f7TvM9
 E7eHmADKXQtTiD/CmuFix0ccNKxZMT9Zen/RsocaYS92tXNPR7W3aXpm96NHalo/OF2ajWG/3JF
 0fGTJKtX1lMo1QFxXOzOON7LfKpcMIRaZjr9cjkFPYHiik8iXOIg2QCXYyy7OFtBsPgtPo4SMOJ
 aJnaXKfxYyzntQkz711wVXcaSkYniZ2zwiuBUO4f7ggUOo8x5j9BazPEzv4g3gZWd3SNlSm8OOf
 LueGh1DN6Z7YR0zAd3A8tHZPq4EsMhpb6KNdRpB9G3oxdsk0YAg2yfesjiA17Dd4Q23OSvAp0YC
 5klVXQY95rQu+0Z9HXBgxC8nqzeO4wiSUzq1nnfbQNESSJ7JwikyJ+C2OJ4aR/gtZvcCENjKJ8E
 b4ouvDzcPLOsMqacG2eTbfrenlnt3A==
X-Proofpoint-ORIG-GUID: ULEo3n_2YmuBZKFXN3t4VRmxDY6iHNsm
X-Proofpoint-GUID: ULEo3n_2YmuBZKFXN3t4VRmxDY6iHNsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080046



On 08-12-2025 07:36, Krzysztof Kozlowski wrote:
> Static 'struct qcom_cc_desc' is not modified by drivers and can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> My standard commit, one more time. I wonder when I will run out of the
> same commits doing the same...
> ---
>   drivers/clk/qcom/videocc-sm8750.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> 

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

