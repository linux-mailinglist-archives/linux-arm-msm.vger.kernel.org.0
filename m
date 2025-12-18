Return-Path: <linux-arm-msm+bounces-85676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C77CCB94D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 12:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B97A33020CF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 11:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6362023C8A0;
	Thu, 18 Dec 2025 11:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4kJoCI3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXnzrZPp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AC419005E
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766056666; cv=none; b=aw4KtZmRGWWvI1C/0ty/7I7jr+v4MrMgtAYs/mmvRuOV6jNlHD2dTq+Sz/WMlLwIYe0eJcVXEmvWxDB2ol6O6wXvjjbHXrpGnxZJrK8t+94H2Qn848gcZzWTaxGgAgh8f1XJRr0eq36mZfFVJ7vEDdbK7uoDF5W31eQpkG0c2hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766056666; c=relaxed/simple;
	bh=OS+7/7JEML2YbkeaVa3z302x33AgXUQbr185GNdARhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XK2DBADbPODWI9q/XmTvWHwbBBujxLS8/OGmpFT/7s9O7ZDVZpICxFp41E3Jj5TByas9NvTiRI/H2GMejnIo5kulrtclYlkLXoGgoehsd/kyVD5RnmMC1Hy1LYWSeUySOZWphI2yKiU0U6N0xMLGpUhk4ETXege7TTIgToS26k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4kJoCI3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXnzrZPp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI92SYr4189705
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 11:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J4IuhnlzREPetzQpbCh4VoBAgi6rEAGmVymF6A4kYIE=; b=i4kJoCI3Ie9L+VnS
	Z71XlyJOKUcmTWTDqd4r58JDMW8Vcbon6Dy2RXfBmmab3y+iU6uo32GW4/bWOlae
	fUU8YCtODtFV7WNbgBahaECo1rh1BpMQZUSPFivJACUFNBgCyUtZ201tCSAskSfs
	LE1b5N7XkcDkhfluM2Jsrhc9nPxaBC8ynsQYSM954wmnuY0RsRrhr5EXB50XLHEf
	huoDaOn3/Bd0ZtXPwfquoQFbS5I4FUgN7Znckwrin4lSk77Z965egWH6dyt/XT9n
	n9BcEHNTmx6296Y8YiRiJehIN+nonBalFUMv0ItRAH73mH7U8D3xtv0sn6/6W2G9
	ysJmOg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b47pkhqpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 11:17:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee07f794fcso1382521cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 03:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766056663; x=1766661463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J4IuhnlzREPetzQpbCh4VoBAgi6rEAGmVymF6A4kYIE=;
        b=bXnzrZPptkV1XHoUiq/0aBLPQWcvUJZBOYZqmjDKA9jMjbw9znipO4B5QC0q3y5k99
         vcCA2qcPXWsxKphSFn6d0HYvZlFAtEzFQCoEXk1Q8PNaDuwOCjmG7H96DHPBUu/N45G1
         uJ3NGEO8ICTyllNybffP1qpUGK37PAlcPe/2cuyvED5s6BPLG3Ug6/PeYUoH2Nc3GFub
         v/CYQUOp+fjAlv/HjkCkhG8o9JEYTPC4t26WJ0RUX4Pl7Icj439YkVqUrHhMdMx5GPny
         oPX3mW/1cT8zCgzocMIMcRlRh4zfC9vyIQCyzRUDMSoUV12ysIR8H2S//klfMQYH8CtN
         fbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766056663; x=1766661463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4IuhnlzREPetzQpbCh4VoBAgi6rEAGmVymF6A4kYIE=;
        b=odOFKdVG6hV+U6nqxcSnI4cUfWFLWueade9mElpRDF03uKtb8PdMPq7Pt7fd1EVnY6
         /djs/v2S7C7RYohzapGzRo3F/+eiBLM+bJXJgki5FRMzh95DMvWpSHRZNUBSv8kQ2qTi
         gUJ2hn2b/8zFv0A6NC9xg2oDXf7nS5+8/cBNsQcYfPzIhmNhE7RxVo+YVQPPzdzn7/CS
         SCr1GTXrmx/sLcYAHT9NCV3RI2g5LxJ6D3aPe50WyOlJJunrgkn/VwyvRZs9xRBpAjSm
         WQpbvbZ1qgY8CqP/NCs1x0VjWWnoFBuKYimnyDwyIx6fY9nKFbfV3CmlYONbtX22d2Ih
         5U3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHfvVz1uDVk3HL6r+Rr+fMEvRcVgELb9xvSuLw+siCaGs1wVHUu87+O5syJ984jYpqTyMJwHxm0KaiKkef@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg18kkDOsp3aTsehgpqHGp78vI5NPw3v5b4CsquMLAZtHGm/mT
	MWl0KveAmYniOmHPqbfraCHEWXcTQdXQL/o2VAQ1ClfiZ2PMjSBMOwukIT5rXb0F15V++xA/eJC
	fxwhhg9RTS/qP55Sf3hF1CQ4ri1FzfI+joUNRKUXEim9/T8Ijmh0xaqBdZOlzLUcbumfFzi3T3Z
	6j
X-Gm-Gg: AY/fxX7DnT0vHWRcGdIidvSZoJ7MLDZAmbxeVYwfn0UgtfMOPnkVXw5uU1L/F15BtX8
	U7mQzWrE34NUB97Ufy96ay8hgu4/JYuNkCDyo7VOjaYgYLQaZZy6ZFAFC6tO5ujrxXqqJCeVBQ9
	5qrsP2PlKqjsp6o11isv0q5bNiDeufqKU1MJdbf3VEl5HJy8Bpe4DNbJsPcKfizYaW06OPN6/KU
	p4rDeDNNE3myOc4naRapSm50vw/s+JUderkmSc4ZcvwWUt0N2zxp3NYH+eEaNQFUfI2tkd/JB2k
	w8sAeE6OkoN/rJ0xsXJctJAVjjlVsOwIcTTL+53xgbFyXJjJGyO8KikJOZXtulyj36oItdssdi8
	PAVvuTE6HUqIgT7GV0kowhOQDuo1Bw6Su3IrX+ABmzVdbqprxU12ZPvEjU4MT7nrlTA==
X-Received: by 2002:ac8:5f8c:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4f361153914mr15819651cf.8.1766056663151;
        Thu, 18 Dec 2025 03:17:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESlwY5fSua4meWi5H0kHNWDJRfnToJ9lMnpz0+VlwdqbOiEwdELdgLJ508LZmUKShiPHno8g==
X-Received: by 2002:ac8:5f8c:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4f361153914mr15819401cf.8.1766056662749;
        Thu, 18 Dec 2025 03:17:42 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b585b3718sm2218739a12.1.2025.12.18.03.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 03:17:41 -0800 (PST)
Message-ID: <139312fb-a8c9-451b-955f-444ff98b29b4@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 12:17:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Add missing platform data entries for SM8750
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251218-iris-sm8750-fix-v1-1-9a6df5cd6fd3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251218-iris-sm8750-fix-v1-1-9a6df5cd6fd3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YTGLkpp9BkFq6nSvoSATC3pwjIERqx6D
X-Authority-Analysis: v=2.4 cv=Md9hep/f c=1 sm=1 tr=0 ts=6943e2d8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9YNTAxyjkWIlg3udmsYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA5MiBTYWx0ZWRfXzMBp1o1TbsSo
 BSqLZVysI4X5WpgsCuJTX5Kpuf/I0G1A/Rn+mRT6Q7eHj1Fw8GvPvyKfMxSdqVId4+9Ybg36Z3K
 1LthQQIDMRhyCkOsEH7QY4mOkf6jOgcL8Vg8696zKY6j9CVXLJekdEis2Olvy1eNUCp3e8nilGY
 G73iqPsT9tvKbBlU9F7jSBdsuAYjGBo1lOER8yW1i6I4uWeZ0YWqws45hVwYu8qYKlt0G8AC6To
 +yYzHSv8SXe/I1WgGLJ21dEylKQZTJavDFsVuXae8TRI1OIJQAPQHet+tInzLu7yzhIpTl1wfQ0
 Ew666kKBfci5H5k+bD0+K/4DAibvGqyKFDd5hffh64VjIK1lLi5bKVhRUMvGdVC3A3A5tzeM8Wo
 dl3FeWoyLVhFGmKsMHl47Amj+Uqg3Q==
X-Proofpoint-GUID: YTGLkpp9BkFq6nSvoSATC3pwjIERqx6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180092

On 12/18/25 7:54 AM, Dikshita Agarwal wrote:
> Two platform-data fields for SM8750 were missed:
> 
>   - get_vpu_buffer_size = iris_vpu33_buf_size
>     Without this, the driver fails to allocate the required internal
>     buffers, leading to basic decode/encode failures during session
>     bring-up.
> 
>   - max_core_mbps = ((7680 * 4320) / 256) * 60
>     Without this capability exposed, capability checks are incomplete and
>     v4l2-compliance for encoder fails.
> 
> Fixes: a5925a2ce077 ("media: iris: add VPU33 specific encoding buffer calculation")
> Fixes: a6882431a138 ("media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for encoder")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

