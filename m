Return-Path: <linux-arm-msm+bounces-72600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5DAB49401
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A1FC3A92B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49B8312819;
	Mon,  8 Sep 2025 15:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkfM9Yu+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8E33126DF
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 15:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346078; cv=none; b=o93zp6mqVXSIQ6AlxxIwRVSfsIV9paf5MitPk5srYz/gzUSc6xtylHsCfpQ11ftPrMdl04XKDVxbdjg66fknGdu9X2BNzHcLJr3zeWjx6zGXe4ZFRVmAcSlENQPlPnuepl7ULo+ci/0pnSwSRjtDvYrO1Rcs+3hHGaq0Fqs5kZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346078; c=relaxed/simple;
	bh=G2fs2nKN2ZhgBjC25RM41Kh9rDq7tT3JvNkxLut32sM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMW1ooYpbqOrhQ+CYHs8hnTyYtroBZdipUvvnu1/xi3uwaM8rbLZnBI8zpxXY74qjZztz45dytgtgZXohaLPj4scaQo8jYCqSRj6mhK7FlmPEPEROUZcaUfIkQtg0rCT3PE5WMg6jyHEphTW1wGb4hYtg5VN1/zJRbj0kuKdBOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PkfM9Yu+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888w84d016206
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 15:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gUNywjEFdmTkr5x1l5m+XCGsRzCZz5+0YY3gu0GUprQ=; b=PkfM9Yu+/rv2MnZl
	juMEblxaJs+I6c+tH9adT04naeezqLbdt3+0KRkf+CBpg479N1M1Xc7CW7Y4pzBu
	Tpyfsj/vEb2UH7ZYficaX9JEdlJdMkDTUfhf0exzJDx3y+FgZLMIs20zu3UVPUrx
	sXLWQ5pkT3AMLqlfTXxBr0Gm63BZlSPWOfKoP/h+LesanJOsoRyh7x6VpGNcbthO
	KUd9xawEPStYPb6axXwBCdG5yPeY7Aj3t89D6bz9hNKcvgn6ajm0TFRm3bVI34Pb
	JaNqJRAnBzMex4V848mv6p1S3KTEjMfyycOxCSKIqFNQ/Q0PK0nX1xqd/Y6rAKvG
	GP6jUg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfvxq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 15:41:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b612061144so2632661cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757346075; x=1757950875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUNywjEFdmTkr5x1l5m+XCGsRzCZz5+0YY3gu0GUprQ=;
        b=MP1lpk6zEkO5qtjDnVEWLOWf6jefNtKzrWhKkKE9/kklH2PD5E5asPnRnp2fDs37Xn
         OU97zbE4vQ/0bX4s8hbZzkCSLMtZQ7yZ0V1jvO8jyHXYdsa89o2PHTTye6zU83HNfUBJ
         npSiqEzWkFHpppy+6NjRhH/GOh0I5MKJ3xu2LRmmDlnLmXq/O5AH+p7+EXdOE7teQLnQ
         BXSAvJ5avmsKTJ6nChvZejGGI+3/E8XxAGsUIpzhhjtB6sHgwqb0PzZMxg5MdxdX7DW4
         JGC5ExwabkqkAQSe7NwkXpaZFXfn0dOpA6dzOPoPecCdOGTfvX53Iuy0TcHIKHeV7b8+
         jr9A==
X-Forwarded-Encrypted: i=1; AJvYcCX+NRnQMr7FAZjkVkPs3ezHpAv5kMBy5chDJku9CIVSSLet7+i0Vu1iVcPHyND9qkfLIYatbRKRnu3Q7d1M@vger.kernel.org
X-Gm-Message-State: AOJu0YzvWCK0bEI4onQ0Du3Q88L0aGR7hdOgeBJwbciqrH+3HzCLvgFE
	3EiSMqGJS2yC3B3Iq24mDvq9htPxZdhzlTwfnxbGS5g4QKszy77OE8sI9x3mTJRgxW7fN7R5NcK
	Mfu/4v4iKqYIKwa7hPJo/WMYicMA5cPntOI2ageXWxsiyg2ApCv775ZfwJOm0ZOft8ton
X-Gm-Gg: ASbGncu1TplEIZ12LIzuxtocgzyTGqCZbuHLg4eW8yoPORtvogdKFBM1CvIxZIMtT8v
	l3KqqHFZp2R8uuqE+ANzJl6jfmuK/wR83eDDfGZ9Ptq3du97/Pf5Uhb83Urae05d15fghiXD1Rz
	Z9qwWtm0O9WVf51YESK2c0w8gOQVCxguv02rvZArhr3F+sbcWacn/PHJEYQhgQc5sMxH8iXvBga
	/V/GeeAJnMddxdE5la9qZ0LbQP/29gxGVtbEkejtYDOJLNYk5Zet2ixC1wfiAr518FQXpfKYG/8
	A50NTTkYUjo7V8obd5qR6RvXnZTF1X7/IWoT9KSOBUe4H6/SDoRPSfoQH/UFn80tgLQp0K5Oevc
	epvd/G8OgDecXTuBEdaK7rQ==
X-Received: by 2002:ac8:5f14:0:b0:4b4:9175:fd48 with SMTP id d75a77b69052e-4b5f830417amr59239681cf.0.1757346075062;
        Mon, 08 Sep 2025 08:41:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEd5ZNZ50YBUchs3nuPz0LYnawAnj+cThrii0JYVr/emigl5wPPuJaCTU+N79pP56oMJTCaig==
X-Received: by 2002:ac8:5f14:0:b0:4b4:9175:fd48 with SMTP id d75a77b69052e-4b5f830417amr59239211cf.0.1757346074307;
        Mon, 08 Sep 2025 08:41:14 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040d44c9adsm2198301666b.9.2025.09.08.08.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:41:13 -0700 (PDT)
Message-ID: <2f95d508-34ba-4a29-9add-63909db22b60@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:41:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] cpuidle: qcom-spm: drop unnecessary initialisations
To: Johan Hovold <johan@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250908152213.30621-1-johan@kernel.org>
 <20250908152213.30621-3-johan@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908152213.30621-3-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: opTTNx0CMuffIpAPYAojYB_LdrSSMH3z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX7QzFc23s9fvb
 udCgTd2uwQf1rz5NHClpxvOPyys86uAbJfw6Qb4gSAumxry4NFh3nh5Y9vs1a8hTKj31yLx1BhU
 PwDCr97hEKYXIdlTh96v0Ff0dk1YSlQDshxFenhb1ytu/3TJfOzm7Q+QJBU2B8Y091QN6JiQfMq
 Faz1MAHZQ6ULlbEK35wJtpEL3JeTU5Gt1Elq9X/UUdJOuO/wdy/MRMe7vi6vlZY4VeKPKvEAxgJ
 MPdCBLIW/sVtF+ApGaEGWVnYL8yHSvVBp71650PXmSHUtv9E8tCB33hIZZ1VOFqBCEup6YAzUUD
 qvCR+BMHRfI3rdLJ1CbqqZzny3RiH8gfpDc7MCJKGv6IQykcxj1uXfeCYspH/X4nA4u2ig6C2uw
 f6xGdVsH
X-Proofpoint-GUID: opTTNx0CMuffIpAPYAojYB_LdrSSMH3z
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68bef91c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vJ8C-6PKK5JqxMKs-bcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On 9/8/25 5:22 PM, Johan Hovold wrote:
> Drop the unnecessary initialisations of the platform device and driver
> data pointers which are assigned on first use when registering the
> cpuidle device during probe.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

