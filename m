Return-Path: <linux-arm-msm+bounces-80388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E23EC33AF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 02:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D926018C252C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 01:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4342222C8;
	Wed,  5 Nov 2025 01:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SuYEqOJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUMvM+jN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF3421D3D2
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 01:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762306796; cv=none; b=LrUOtPZbQGr2nn+H/TnC1dPk8Bg3UpeafmoqoKwcJ6bs+0ClXihkEZlEi9qmsNjrMKoOcd8V8kNGAXtRDOhqrN/A9EEHiXkWka/mpev+eB33GmR2j0m9fEWCtIENhkf4VIygcORXmiYVbasMZhMlCLqjjhzzR9aeUE2XFRDNOOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762306796; c=relaxed/simple;
	bh=q8mDoDpwaPjx7d9imNGir37sxyrt8r/2qhIDL2YCA4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CshO72kYNapK4xF4rKw8HG6tgyMZ98XUR9nce7ZOjlNGW2doaHBtTFAcgYwlN4Jf5Zt2RzvRxdGtX7AsCEY9k75nhoclldMmuoKRtbV5c3i3ponuxc2MwDx6InJaDSn/5f/D6vgHoq2lsFy3GhUCgLPYnuNBKx7vJQj5HlIMl4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SuYEqOJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUMvM+jN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Kgcic3043956
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 01:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ktoBffJvAqQmamplPsRs766qlBYkLoF9wV2DLyb/IDI=; b=SuYEqOJJ5diYh3Lb
	d0CSpvQB3wJwaSgNgvych01BjwUkmQphLohqYe3KgCpL4FHweRVCneC0XcBOL09g
	/UexbcQjn8NCjkf5tvSQ+He59Ieov4+Pw2Q4oCjuJQCjZSqsAf5cIG6X07QoPv6Y
	Ang2qHhcJWxASjLJO+t35nySCKuGSy0y4UOFxoZMxS7KHSnru/RQc20pRLX6Bs4L
	83+RWWHEl/J9CuJOlA1Er9hT2bM23SGKwmx4FZCHf74SgU/ld3bh8S1v+tpJSa5b
	VkjCWrBH5KHkoMcMQmqTOsgpCzNCRmlmppapdrsf7ChM21R31EW1dqC4xkiJKlM1
	nec26A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a78equs22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 01:39:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso5964969b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 17:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762306793; x=1762911593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ktoBffJvAqQmamplPsRs766qlBYkLoF9wV2DLyb/IDI=;
        b=kUMvM+jNxviseijSQqBsO1K/FWQdYqExKiV8XCG31kDiP+4na17Yt9r+uMSPTnrMIy
         MO6xNX9plxifLCSC8Fg3Msk1wsbFpvloVxEj7dHFB+kZ/48bTVJj7M6rZuJE7roHnfg8
         S3GgRdTOR3QRQ+s3MuK6XOMJ9mNSg4OewdCl2KT/M7dldUKOX6y5FSojxIDyG2584mDi
         ZL7g8Wbufwinu6Q0d80cPCudctXkqsLJ2jDFLrRnWgD7cu6enT3RTHdOJl6/kaBuEOCS
         emdcWuPL7kSG8JhzC9u/g+BU+U1SPrvmlabCCbsjiJ7kuJ9IG4+bym8cH2oTH57nQ/NB
         YMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762306793; x=1762911593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ktoBffJvAqQmamplPsRs766qlBYkLoF9wV2DLyb/IDI=;
        b=ecpsFGLg7sI4/7T0vKMS4us3eyIf5JSIQpcLfyUjpPsnGnTsj/9H2CR4WI5IHaBFdc
         ljL34v7LrHiHwqxXUIcuD8szE9XruXrgyqgzOTq+sGmRIBYWe4XNX+EPzO5q4AYLfLLW
         zblyzriUAQyRx9CN40gTBpE2cPrrIa6U2WSAlf+L/6epHLq7BLHhdQfsTu4w5HVen4Y5
         i+LD/qy+rhSY6XghI3Dog8eP1EHEanTZBdVRamlmakja6gufZb5EcINKz/hR6hVrPYBG
         fa0OGpjBDw659F/mFnBHgyhEXMWocpOmL+uM4WtfJH/7N8SPonA06A5N8uos3jpH123C
         5gvA==
X-Forwarded-Encrypted: i=1; AJvYcCU0Wp54rgLXxZzF/drZNVkRK34s3p8POb22HgQMnjfKm1e7D5N6NTMWkEKpjlzZKSSMFXiUxYSLOBdHSYZ4@vger.kernel.org
X-Gm-Message-State: AOJu0YzkQ+GUkX0qzjwtaPBe9F/XaoxFWF6rf0Iz32A08PsG04+gTm/w
	PSj8rPVnciU/2Qxwqmp7JqJjFPuhqjbCvP84rgQw9x/21472NsrL957bmqSUIhmCs5ZQ4mGJF/3
	lJ3lp3EL1yOTSV1A1gAq8NBmMN/6YQnC8JsDlZfbAZP76CrkP/2SyYSv6KwiaXRb8mtW9bVWVZ+
	MC
X-Gm-Gg: ASbGncv4WFXfutd8c8KLnAyV3yRpkEtfuS0vArWkGszm4nSruoU9Hkw/F1Ncylxgnmj
	kuAv3Gy6kCKqt7hJfdID51cBRSMhsdQmQBpug30pvmwDdJFJ+jdh1EVhlYAPmosBt+/+MXjm9Ur
	3aJ1IosFSsjacD03IbWqSHR50vAJDsxrqwvX/qXM5YM1IVzkDnT9iYsCSmqflhdB1i5Otqm/mvO
	mKxh3WtdJtpxb6fAU5adn3NDo2UyoDr4jTiuaBKmkIa+DdoDfUQjF6xA8XYZSGBiMDvEK76LHk/
	UE1NtaP2+NQBdmggw0K6qXUTQiMtQt3/vZ2psxN7ljbTjzHDZTFYyOu35oqDFAK8B2zdXb9F1te
	0+91ijiQMCVYaXVdH017bH+bsLgxJtwcpb9hvNUMX6YT8VowB7r4Im1Hzk0dzpU7+9x38VGWO
X-Received: by 2002:a05:6a21:329b:b0:311:99:7524 with SMTP id adf61e73a8af0-34f84113993mr1311050637.18.1762306792818;
        Tue, 04 Nov 2025 17:39:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGg/w5f+xI91DD+yJ2Uww0vfui90Y1y4ztWbeZWicsgdKRZr9byOes3eQMm4E//Je/JJ3igSw==
X-Received: by 2002:a05:6a21:329b:b0:311:99:7524 with SMTP id adf61e73a8af0-34f84113993mr1311023637.18.1762306792201;
        Tue, 04 Nov 2025 17:39:52 -0800 (PST)
Received: from [10.133.33.131] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f2893b60sm3793791a12.9.2025.11.04.17.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 17:39:51 -0800 (PST)
Message-ID: <db7484fe-df7a-4430-82c8-186bc91d8e95@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 09:39:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: ETR: Fix ETR buffer use-after-free issue
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Linu Cherian <lcherian@marvell.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
Content-Language: en-US
From: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
In-Reply-To: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAwOSBTYWx0ZWRfXzB/yH+hCQdvt
 IQ8HrJ4f8TRC7xCZKfkNdNs+Cns21/h3NY6ukX5s9dNWDsiy0VKw81FLtO4r0bgCJT49DJdU1iy
 xr09TYBIQ/CPeZTLcane/xFfImm367afwmByyWU/FCCW6OLPdteRl9NM3qVDMx5nQTHhC0/vx+B
 CqR37WuiXtr3/rkeRD9rGwrZ21xhDXpEDHe28e3tUQSWANCw1/udxvDAMPBScO7UMCbPjSHB+zr
 609rnkglN6IG1gh7YdK9sz4XlxEwMPE/RgZmA6gMrFegv0EZ72Ug7q+SUkta+i04de/eixGziuN
 A57WZWUw9eq5nZ1twq/seQebVL9ehWqisjZ2MLyHW+XOUxbMP6/tnkzZ5QBnQZzSWcRkpKmkaOM
 SLvvYYlc0ydPyJCXs7nqLj3gNsnqJw==
X-Authority-Analysis: v=2.4 cv=fofRpV4f c=1 sm=1 tr=0 ts=690aaaea cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CQwrqSfbpNu9xGj0-OsA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: xq54i4A15NTV-WH4pALqYMDJgFvahuSM
X-Proofpoint-GUID: xq54i4A15NTV-WH4pALqYMDJgFvahuSM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050009



On 10/21/2025 16:45, Xiaoqi Zhuang wrote:
> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
> and enabled again, currently sysfs_buf will point to the newly
> allocated memory(buf_new) and free the old memory(buf_old). But the
> etr_buf that is being used by the ETR remains pointed to buf_old, not
> updated to buf_new. In this case, it will result in a memory
> use-after-free issue.
> 
> Fix this by checking ETR's mode before updating and releasing buf_old,
> if the mode is CS_MODE_SYSFS, then skip updating and releasing it.
> 
> Fixes: bd2767ec3df2 ("coresight: Fix run time warnings while reusing ETR buffer")
> Signed-off-by: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
> ---
> Changes in v3:
> - Add a fix tag for the fix patch.
> - Link to v2: https://lore.kernel.org/r/20251021-fix_etr_issue-v2-1-80c40c9cac8c@oss.qualcomm.com
> 
> Changes in v2:
> - Exit earlier to avoid allocating memory unnecessarily.
> - Link to v1: https://lore.kernel.org/r/20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com
> ---
>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..800be06598c1 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1250,6 +1250,13 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   	 * with the lock released.
>   	 */
>   	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +
> +	/*
> +	 * If the ETR is already enabled, continue with the existing buffer.
> +	 */
> +	if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
> +		goto out;
> +
>   	sysfs_buf = READ_ONCE(drvdata->sysfs_buf);
>   	if (!sysfs_buf || (sysfs_buf->size != drvdata->size)) {
>   		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> 
> ---
> base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
> change-id: 20251020-fix_etr_issue-02c706dbc899
> 
> Best regards,


Gentle reminder.

-- 
Thanks and Regards,
Xiaoqi


