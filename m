Return-Path: <linux-arm-msm+bounces-84731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EFACAF03B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 07:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 390553031709
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 06:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DFF320A0E;
	Tue,  9 Dec 2025 06:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gql+PiH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AiqcBauU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A94730F922
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 06:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765261374; cv=none; b=K0ti2/MJGEu+0drFXgH/Kt6v1fvctDelbLAjGQQrqElk5sXyltpYOIwSfx4kMvLjntZsm2cOvgR2RfgIqghScszZf3aKZTfwfsYJRv0GZZQKVDBURQDMVjR5e7QUzt6hi6wMN9iWV44mNMTtWvEhLR6XC3bUIFCiyBcMDIV95x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765261374; c=relaxed/simple;
	bh=MN2MeH6imb5lqt0qyw0S4W2lEq51bW/fWH01vAlssEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T4id4kLI3exODS+SnLh2teJBeFXy51tK85AESJPN6UIreWzZeaIurHCaZQg7fhG3NgXAng6AE0LAT5FHNWBQ4wxZvSfrwzjPPC5Cl+z2IjsG1ky3P0cstE1omDX0bqWMBD7zZdw2uzewmpDq+S4hCEgq4pr6b2np5sbTUcEVX5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gql+PiH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AiqcBauU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NXCMP1311646
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 06:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zdURoREupUT40+Bj2r9kVCoKzLxg3ENOdxq3Uwfok7U=; b=gql+PiH7oSWh65+1
	ny3/Xz262SXX6dyLG/8quFe2hAQXs6obVqv+NwyOATv+YwJEHCCMe2aP/mWfKyXb
	vCOyDzxILRXC7vVWp/n1aEPOalPRdJt7NeipWzhn1Np2VwT8fPmG5TbQG7pmcOOC
	XNPfy+aq6TAzJaR65Gj15k7Ma1mse+p0suChdEVtxcDSHpWXg70iLPs2pW13n5ZZ
	KBj4ik8+qFf3IAA1+HmUxX26KhTKK5ZXN2S5F8M4vo3J0PzAqIjCxle82o4D5MtZ
	NRVqZLRKRU/HTZxoh9Lxj9AFIi+gQS3BeE77Sxk6Vi+eHIEbdaSZ8TIuv1hyrc+m
	m0eg3g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awthpbnx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 06:22:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so9475816b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 22:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765261371; x=1765866171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zdURoREupUT40+Bj2r9kVCoKzLxg3ENOdxq3Uwfok7U=;
        b=AiqcBauUQc7ltFvG8pYmvQRBZt17ONXEyKISoEIEm2MCXp+U57Rujoz5XHzlqM0aDX
         ZLiEGF27Lb6npcTwCD1ZGoEAr+psbkxYhFXPbxStTNxKlQNQa892Z+eKi4kIIH8S4dZA
         nYYzVyv1CwJEn67ZQT5d9UNdSu3ggG6ahuiFZ/Fmnh5yRGbEEoGmO4cRnNvlQsauvNkN
         JDBhdJq/7Z46MEgiNU3rXvsvU9Cc93liaT9yhLz+U7NcjPyD1e3GFaILx92j1Rust9Ds
         8/e75TqfrXCX+qk2JlDWDlzQcIUz1SnhEpLk0euxoNbK3tYSzGoQOmlOMoel8fa8ij2D
         IoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765261371; x=1765866171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdURoREupUT40+Bj2r9kVCoKzLxg3ENOdxq3Uwfok7U=;
        b=dRo0c30Mzzlcro6Re3upy1GcFjRsldalrWDzTF+dpHe2HMoLyYs0RTEyeO02gRckZA
         rhIsIXZVxtsetyLHmaUsBXmf++PEYj8iDewscTFUuBxxb6vkNY0lO8pUG498sVC9U+Y/
         Y+PHXlwwDuNUwTHpnMvMC4KNEu/nXU6WpGkSuGIeUBKffR6GW4fuPzb4uGqbZ9dzETMy
         vSr8hI0qS98Jci8nyFZw4fJQwJ/U1gScKWj1BMLnwiE1H+rgowVyM9TwP2D6D6eM8tke
         +P7jot7x0CtPOvm0QacRkq0Rz89VeDUND5dP3NOMsz6ab9ZWn0gbhJqaP496mhEqu+uK
         FZ5g==
X-Forwarded-Encrypted: i=1; AJvYcCWWrpBIH6zN87jzVxBSVwcX0zPJrcgK8tmyZ0V+923ifuPBnEi4OxUWpC192tnjGF3eVetdvhu8tS3lOKJA@vger.kernel.org
X-Gm-Message-State: AOJu0YxSln/WPei/PYTK70euJCz89q7Jy22x4Thdx6FS6Otz8XePg7rt
	xYJ1A9qNBaad8xFLozFtLjyNlnJtEat+CQO55UQp+M6aEA/7/ru3uLr0SU2wOJF71piGUxKcBAL
	rRPTLb5kYYiZ2RTNCqw3sFSx+I/0rKpxFLwH6d9SYYR8mQWNysW6ruCtXCJmaNdQxmayI
X-Gm-Gg: ASbGncsorSiLptgsVcFnHydRvPjZRzKBQRunC4AJHYsc8ySMMSQT8f2u82uiVi2Di/n
	F5RnV0U2efBxNChccZ/+iUlhejhEA4fujWXjyP6rvtKlchMTsXmWxdBFalZEgIu6O+xWnHAed9N
	xFh63I5I7EyFV+nTpuMmtpMogP6L2BEp/0uwlmdxwE0udQobnp7CUkxrV1XRhwSqX3XO2nYpRzd
	NIMu0ofteVRo34ZtHVl767tY0s6INmdHEuW3NqcELwootE0Duvcy70cl1F25qENC7nTmYcj05JP
	kEU4J0P6Ob2DDI92TLSYZDjWJJux16Tt8ggODcpln+qA/hLrY6CkQ6cabZFbcaWtKhDGu7hg0JN
	6kJ6Rjn5pd13e6/Cj/4f39uWcGEGMTNI2qF0L
X-Received: by 2002:a05:6a00:b86:b0:7aa:a2a8:9808 with SMTP id d2e1a72fcca58-7e8c21f7005mr9748929b3a.20.1765261371461;
        Mon, 08 Dec 2025 22:22:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXUUyZXOdrbPjw+xg4yza/R1Wf78mUXhM6dCV9AdI5VKiWEAiPNvLmU+M8him3pa9KSQvHog==
X-Received: by 2002:a05:6a00:b86:b0:7aa:a2a8:9808 with SMTP id d2e1a72fcca58-7e8c21f7005mr9748911b3a.20.1765261371042;
        Mon, 08 Dec 2025 22:22:51 -0800 (PST)
Received: from [192.168.0.195] ([49.204.28.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2adc5c400sm14910285b3a.37.2025.12.08.22.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 22:22:50 -0800 (PST)
Message-ID: <e58463b1-647b-4b7a-bb01-529c96166c6c@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 11:52:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] clk: qcom: rpmh: Update the clock suffix for
 Glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
 <20251126-gcc_kaanapali-v3-v4-1-0fe73d6898e9@oss.qualcomm.com>
 <tp2lubkvapjwaxs6htxifnf7hm3y7barocfupenkvo4luw6nl7@z7hx7evwrl5j>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <tp2lubkvapjwaxs6htxifnf7hm3y7barocfupenkvo4luw6nl7@z7hx7evwrl5j>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA0NSBTYWx0ZWRfX4yAc+Eie9syi
 CBHbnx4MTD5gJeGaQFOXbEvXBK2Tt+bJoWqxKinASWISA1NWeaJjA+uEYwlB2wHhQ706WAsdJVz
 WNv0kJ8FvjmipDJyejM0r1mBJ9bcv/nZmn2NHmqzDRRtttlBOrkFqB7LJpZ4sMk2aB3A43AEXiW
 EV/dkK1j8vkXo1qiZeYsf4g09qZIuQzAa9X3+BBwugM8Q6Kgw6D9uERgHhccojFEDVZdZclWoF0
 LeygSJQ6VnkpVsoXkToUOiMwimcbMgaM941oZbvPYtTlkrcmOg46UT7N61glyey4G1qFenvPM29
 uGRZ19YcZoqejX3FxMYrSftgsNaweXL/le2FccDV8xsmkDiSC77Ar0Z17sdEn/wPLnR+n9drOJD
 jEI6aAPbf8JeOAs8opdIjY/UjcsqQg==
X-Proofpoint-GUID: zLwjJCnqFSvNdpTf7MCqzO0_hNxBvc5Z
X-Authority-Analysis: v=2.4 cv=AL1K5/Xh c=1 sm=1 tr=0 ts=6937c03c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=+ZBMrq4S6zn/E4yUNzEvUQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=xlDbWZs_62DcLNYfAMQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: zLwjJCnqFSvNdpTf7MCqzO0_hNxBvc5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090045



On 12/6/2025 5:04 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 26, 2025 at 03:27:15PM +0530, Taniya Das wrote:
>> Update the RPMh VRM clock definitions for Glymur to add the suffix to
>> indicate the clock div and e0 for the C3A_E0, C4A_E0, C5A_E0, and
>> C8A_E0 clock resources.
> 
> Please start the commit message by describing the issue or the problem.
> 

Sure Dmitry, will update the commit message.

>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++----------
>>  1 file changed, 10 insertions(+), 10 deletions(-)
>>
> 

-- 
Thanks,
Taniya Das


