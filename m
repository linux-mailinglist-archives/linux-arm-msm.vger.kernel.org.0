Return-Path: <linux-arm-msm+bounces-80896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7B6C44C82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 03:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 158A94E5C51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 02:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA14819F11E;
	Mon, 10 Nov 2025 02:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkLjvxdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1a3J1JF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AD51A9FAA
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762742248; cv=none; b=Gkmi+Zwj3UiYAOjHERFc0ej/cGXYZNOuHqX62KQKB2KaHrnyzR6yvEy1ZJdru7nd0J3FOpmP3nKXILUfFZhcFwjW+hqpwq6jUTIS0/7AMiS7i2sXmongQ6yhThwKchzUMDhh8EyLxuDn32OG94vtRIaWRykw4G4yyMFmdHvOx1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762742248; c=relaxed/simple;
	bh=dDUr6RlWVp++AWWjuwzu9Ndht/5kl/qlNbxSBekCeaw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cEbj+2lSERQjEqdv+vCvUKDxBXA3/Juhix2dyJoHdJXPguPpoSwUuB7m5k3F/a3kaax8q++j/hAoLnXCHDMDEZdJbehrdvC+Fw5b39ZoHffVQuMXM0w9lQqE6Q9pJHSWIrermqimoBpF3Eq5qh5M4xrEFH7BL/KYt0+ALj9X3Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkLjvxdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1a3J1JF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9D1qxH575464
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JFedLY6wqoSs/S6BwoIDBMsnBgrbfZK76Wkoc+0jWL8=; b=mkLjvxdyejPF1iT+
	lh+pa3mvmBFgma30YUCsNl6FAsmmoN1TdYa3yfe04wFyrLwzshyyJmfoo0iZ9NUI
	VHcuJk49k0zN/2O2npAnlRYXQ3M8yl24OAXWnClppwuRRpT4PLv3FsA88qbPuqQs
	VLZ0e6ud5Vs00vOy9YZb47Okqz5DXh39JrM9XpzqnG7fePL5VESwB9yIlvNQl/2F
	/8vodz16ezxNhhyxs5Df6sJS6H92+hMHdnYF4ycNIGCaoFVdgVJmzCVdxVh58XlK
	BchxiRxSi2jvXeb3pzhNz9HsGOf9TjFgKt5kJeDDHpAB9slDgsyzWk7UdBevu5uB
	008IQg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aad2a1xn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:37:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2954d676f9dso21945365ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 18:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762742244; x=1763347044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JFedLY6wqoSs/S6BwoIDBMsnBgrbfZK76Wkoc+0jWL8=;
        b=I1a3J1JFWmsEE3u7dYesV7Q0QhVjDQZIQuPvsk8KYGbWc4SCbLR1ZXwU+iUlqmqu9d
         gqMBHYL9E/xYHSd3G6u8aOcYY8P11+4u9SZLC1JDvtUzAFuZP1GaRWsAdwUvKugrbcDN
         exevlbgb1bPHPksipTjlmuFPS/4St74mH8I8j67mjgt+QXJ/P2SeLjrT/5QOzddrG0gi
         cXfMAW1JX0tU6LKP+snfqfYGzALn1ulLsLy67mGDfXAwT7mSErDdRDxteStz0FCkMedx
         87B2TEMBKkFo5mU0BjvJOUvGJDPGnkWj72AvFlIAUXwqVBoKA12Ya+Wdxy2WC2iYSmrU
         cHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762742244; x=1763347044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFedLY6wqoSs/S6BwoIDBMsnBgrbfZK76Wkoc+0jWL8=;
        b=j+0MTixujdJQcWWQh917g8cB41nj/MY/yLJAfVlE5G26qZGvcBV5LFoEM2zBwGDaOn
         xqqHVWpm7UQrJ/RdqDbTVJTM8WNVrfyV6OhXZe489feGJ40HDjq3AU/4DTqixfGPXBmQ
         oWSmn/Guo5fn8fQs9LmRc/2RyzFXm5V4VmK+4iCdQbThJx3pwv1W7V0DbJj0F0ttUSP5
         vIzByBeLNmde8AU61pZB8TfhfAbef6n0g2/uRmMwhzlBOzeFC6unIjR6N0DGyXYYr7m2
         UY2QknYgL1bC+kvGPu7Kp6w9Phg1NmKxLmZo8sQJzhftTNvhhIcb+2oyEF4vzX8ni8o6
         un7g==
X-Forwarded-Encrypted: i=1; AJvYcCV9AViC9hLiBJs73U1ujCkjVKN8BbwS43/ZLwx5ODgt8G1mJJRhye39NmESdDjjpkywOQSV/Pw2JijrdK4N@vger.kernel.org
X-Gm-Message-State: AOJu0YxeqR6+x3N+1JbM/BzYgF2UKit2jVFj1/bBv+eN9pcre2ouXaIT
	l/OL6xzQSfWw1rKR+ZYHSgBXojVuNd/DWybY75XYz/aZ2pgL3dxurXwL8uaAw7GoUB1XwCAgJoq
	nUvXcQDtNeivEt2YQluH8wupZgCWvNjqJk0dJISKH7wU5PGHlxswlCMxaM14a+NOHHm6w
X-Gm-Gg: ASbGncvlkP2A7XjSyym+TgG2K4xowg771n9ACFXXmyHt6ZxfQvyq3yiBQaJpAUUWELq
	VfRklvmxD4P3VBVTZMDn8a+JQFHzofBwiSIiDy0HaS1Vyl6nCKunGIMGqXHTNCe7Ejcj80Om2Pg
	iFcY3vD8XTm4Qa+/o7WqBeXsdSYY/Ni3Qf1nG6bKWXANeaSTVDpa1WN55RFz7SlriySYzyARw5b
	b/Ix/mBnSDAPp0CVgI60ZmZnU2M1D8d8kSyFylJYZhtPtbSz3jQMxSw2xlYZ1jCzDXKIVIw0Ew/
	0xe2pfehms4MblMZ10WV17zjZHAOynvBY/6RcAR2fb/27SpOtDj/stxNCwa7zJfgSf+x6TRz0Tb
	qqUgbXw2H0roFTqAcWlEZFB2pNCWRBaR8mB74kj+ANCbMjLOAnIv9ysrg1+fa3H/TDcd3uw==
X-Received: by 2002:a17:902:cf42:b0:295:5668:2f26 with SMTP id d9443c01a7336-297e56c9ebfmr95693365ad.46.1762742243692;
        Sun, 09 Nov 2025 18:37:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUHXymZR9rRNblimju8QZIyozw3WayNgOSOEEBRKq6hlsqJaliQCDAqvcNklp9aQ1xLQ/O4w==
X-Received: by 2002:a17:902:cf42:b0:295:5668:2f26 with SMTP id d9443c01a7336-297e56c9ebfmr95692955ad.46.1762742243195;
        Sun, 09 Nov 2025 18:37:23 -0800 (PST)
Received: from [10.249.28.136] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c9c310sm127743155ad.87.2025.11.09.18.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 18:37:22 -0800 (PST)
Message-ID: <46637f07-f6dd-4a9d-aa52-0ba12b571c29@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 10:37:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
Subject: Re: [PATCH v4 2/6] media: qcom: iris: Improve crop_offset handling
 for encoder
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251106-iris_encoder_enhancements-v4-0-5d6cff963f1b@oss.qualcomm.com>
 <20251106-iris_encoder_enhancements-v4-2-5d6cff963f1b@oss.qualcomm.com>
 <1728c571-1e25-59e2-beae-124d9976fb3f@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <1728c571-1e25-59e2-beae-124d9976fb3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aedsXBot c=1 sm=1 tr=0 ts=69114fe4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0ZktX4uVc-4WF-759KIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDAyMCBTYWx0ZWRfX8prB4FyxQUuX
 wIM/fZjNddkYTQ0I36dYMgWk8PznIlt7Ytc6LnIv8LBSzBcJoTzvL7PkRifvJ39Nt7N7WbcCc4r
 PDh0OIkXWp+5DBMlKn3ZOwX7KnUCS8XoyaUTc4LOi1nmam6CrtK9lOQI2BFW5ew8F4EfaCkg3k5
 eETB7Wz9Os1ngkgCQr3Chzm0Zr1BE/l7KvUVAmhRrIhvHenFNIcYqq//mxUKrr40w6btr6K7flH
 Yd0Zyx2Bm8XkxXp2iYEM/q1k51x77+3yGd+yEQWsZ7IqwuVlKKQQD4mukTIe12uSQKLXW720Mon
 9p0wg2FtE3ALvL7J+l51qg88UffCMpDrBkToQe9BAAPn/xKLG1bq1Djwmo+3zfJUIfgO3KV4kYA
 UZ/kH4QhTSNdrFIzSq4hLHOc5/HSKA==
X-Proofpoint-ORIG-GUID: EtmyQ1lAeIEaPxtCDe4PsyEgWtUfFCM5
X-Proofpoint-GUID: EtmyQ1lAeIEaPxtCDe4PsyEgWtUfFCM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100020



On 2025/11/7 18:25, Dikshita Agarwal wrote:
> 
> 
> On 11/6/2025 9:00 AM, Wangao Wang wrote:
>> The setting of HFI_PROP_CROP_OFFSETS for the OUTPUT port is correct,
>> but on the CAPTURE port it is used to inform the firmware about the
>> ROI, so crop_offset needs to be handled accordingly.
>>
>> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> 
> Does CROP use case work with just this patch and first one?
> 
> Since you are enabling different features in your series, pls make sure
> features are working with individual patches.
> 
> Thanks,
> Dikshita
>> ---
The crop for the input port works correctly with just these two patches.

-- 
Best Regards,
Wangao


