Return-Path: <linux-arm-msm+bounces-55240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31376A99C0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 01:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 494641B82F6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D2C1DD539;
	Wed, 23 Apr 2025 23:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqsIJHZY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABE62701BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 23:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451084; cv=none; b=fjTuoOIfHmOdIllxNDqZ2Q+V7SKca8D139l7apaBsSzeni2iQLFYYy9G9P3BKk0ew2yNb+Xst8YtUpbEMg8OFQr/m+H1oKjjiQYr6dP/sHLWvVVhXleW79viLRNv92ynA2F4MCkRS+P59XqKDcTEVrRdVzLF0lyvQHpkCE7eZ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451084; c=relaxed/simple;
	bh=8bj6txe88RrRNnvkhnNcHWHokC6XRjqHx/nVoIunHyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POdixwGxMm3TZ8WgNyNI2nVGltB+7p/w1bsJJ8+9dwe1KVB1xVuEoMuZViEO38YM442jVmTML5xQ0W41sEpfxMOMh3HRGy3sVY4E0s5pJ9b4zUVez6HDwEsShwMF6D9P7F6kqpV+CjRszx21NnLOi51QcCIufEKn7IOXQoMJYHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqsIJHZY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NMmbvP016850
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 23:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zNqo2yw+9GHctE0ZAXYaJlAMnBK53myrD4k9IkxFlX0=; b=WqsIJHZYSY0uKeYk
	XxoFYxTMr8ujWKSvMrxku83Qv/Yb5inJe8cpuHDdt0XlrLMDgxq+jkzyN2BiC4o+
	aTlf4xpcmPqwGBpwk6vzoCMHEg3pG+LbDV6dF2qOt2ZsEPkEpIjLnKUMT6suR9Tz
	9RBISoorfGFwNxMjLuFlHTizC+ELNjgqPBKD2ernEY5TYUDNaSjm1MNlZcqK9BLL
	xngS7kFAsS9qaKplHM2O/W0yO5TBGYbALtvitB8IMGil2cH3aSEq/0K2g/2rtEVa
	0S/+kT351YYyHSCxna7SBr0WOaV5533jUbIm6EfH/ws9I6fx2NLBUrWsSCia14wm
	LS9UNQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3kn2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 23:31:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7375e2642b4so198443b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 16:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745451080; x=1746055880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zNqo2yw+9GHctE0ZAXYaJlAMnBK53myrD4k9IkxFlX0=;
        b=Zt+VbTYPrCVLeVXbu3ZpyIYbblJAE3v/Bzm4f1mTMy+GOiZWDMtieuVYOF/WBtGnTI
         KYvjL/7JqPE+HCIi9t6MQxROwWIZS+itxIPEYBhIzdmnRTvNwXputjZAnCqj0FrGEcR7
         gSXzrNnlB93B55qUJOoBZhLKtQSv1rn63B5hon5X+DUb2mEclvIhGHAzGblXUjsPoJZM
         1oUEUI3YfYIv/jVIXTUGlqRcaUr6lGUUIM4U+TV+0lBKPLaJcONcuY4vs0tDAKR8nMN0
         hNwUT1rdlpyNeL5Uj997qlL+XSZLiFoRcnh95/FG9MPqHECyNzUmu/fqrKbO5fwusIGS
         A82A==
X-Forwarded-Encrypted: i=1; AJvYcCVq8vrGUPLmuSY0KoUVb2hCPLyDwOX1ax9NaGS3CfoMpf79jvG8aOyk5PZLfZO/9tHKIDsjoPUraB686uiQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyfBXqge9e0OtTx3Swf4vyR4Wba6RpYESGR/MSdxyDsgD5bWKbz
	P55IQwh5bxWukmtwkH60puIHRzxMoE5b5A2g+qzJwwH3CUhVKSpogzt3kjRnu7lqVDb/z/mqDEL
	YolpAI8zJHMeAEUxdL4rWK/+U9kfqI5ajoZA43sxR39vH+RQmUxCUCGRXSGlT/X4V
X-Gm-Gg: ASbGncuZQMJgzU8qqUi1McDp3ze8yMU++3HbUXXSqC7MjaIfMQdNFBmh9xP4HO/Gfqv
	UI0T7yzVovf+TxCpUC1+edTRu5FPBr9G1fbNXVYPNqErgF87HgCznE0PcpOkkyjfpBqA6XxjLFP
	O9qmJdnAWHOuXijRVJYdYA8Wqa7LvOCkrvQQuWlU6WQ8QicEolAKVWnryE6M1M4NFVQzRBiInna
	ERk0QIK1iUJEKcksGYk9BUgl+lr0Z0kyNRe8QYtJ8RTmz+5MSoCFfIXxrTqmwoDxVPC4puBWPzg
	2tJSuDSsnaUk/dvhA2KmWeQeWX9hJ7Ca2tIF18KxpGKz9r5MVKVhFyiNIJGa+AflvMWf5uE+8HD
	6
X-Received: by 2002:a05:6a00:ac0b:b0:736:65c9:9187 with SMTP id d2e1a72fcca58-73e245e4080mr732979b3a.9.1745451080599;
        Wed, 23 Apr 2025 16:31:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDwwjEzdPvaN6z0apVE7LcGy75yAZV4sL84cdUlyEpqpBfKRQxyAwfdO3tZrKoojwHH7my+A==
X-Received: by 2002:a05:6a00:ac0b:b0:736:65c9:9187 with SMTP id d2e1a72fcca58-73e245e4080mr732960b3a.9.1745451080266;
        Wed, 23 Apr 2025 16:31:20 -0700 (PDT)
Received: from [10.71.112.43] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a0a6sm141767b3a.138.2025.04.23.16.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 16:31:19 -0700 (PDT)
Message-ID: <6031624c-9c65-4df8-88db-96800d58c910@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:31:18 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5 RESEND] thermal: qcom-spmi-temp-alarm: add support
 for GEN2 rev 2 PMIC peripherals
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        rui.zhang@intel.com, lukasz.luba@arm.com,
        david.collins@oss.qualcomm.com, srinivas.kandagatla@linaro.org,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
References: <20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com>
 <20250320202408.3940777-5-anjelique.melendez@oss.qualcomm.com>
 <aAI1JnQ2yCjtJL9u@mai.linaro.org>
Content-Language: en-US
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
In-Reply-To: <aAI1JnQ2yCjtJL9u@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5OqhPa-J865tgQ32dwWkCqyk6ZH8rZbH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE1NyBTYWx0ZWRfX3PSyEBCuyqwQ hRbNuym5qJX+qE92rLwngzukzcIM0/bWcsCFFs9rnK0plx+jWpIU3V4mJdTT073G3FhIrE22I/s vcpsVeO1dyJUyBQWOwW/0V+0j7VuP3jzdMMmNzKTpNh6Q0aZlYCt96LJJIRyyH/AQNb8Rhpkjhs
 6wWu40hPl9nkXaw7Fl49QfJgVhN6QjrgjY0PfpWJtfrd3qod2r6h4OPiSBlnp5Klg3PNtLI/lzT O+uSCBoKZuHInMy3JHHTlz9JCCsmUsJfOPo9OEkIFphG8Da27h09OttdVdwoKjJgsOqNu63M9DX 75f4NKOSYp7tpJWNA0YKtQEz/qFX+twzUDziNvwwd90gs/5cVQI69ST4bXBRk8XG1XVzh9LtNXr
 NF6GNJ6luE2GCEpHxqUSE1fkHM4YMmYkgpKXmi1UGU6ctFVBVtkPRnuJYNWdLtFeAhpHU1WP
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=68097849 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PCcEw_Bt9sndwEor8soA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 5OqhPa-J865tgQ32dwWkCqyk6ZH8rZbH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_12,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230157



On 4/18/2025 4:19 AM, Daniel Lezcano wrote:
> On Thu, Mar 20, 2025 at 01:24:07PM -0700, Anjelique Melendez wrote:
>> Add support for TEMP_ALARM GEN2 PMIC peripherals with digital major
>> revision 2.  This revision utilizes individual temp DAC registers
>> to set the threshold temperature for over-temperature stages 1,
>> 2, and 3 instead of a single register to specify a set of
>> thresholds.
> 
> Can you elaborate what are the different stages in the QCom semantic ?
>  
Stage 1: warning
Stage 2: system shutdown
Stage 3: emergency shutdown

This is the same as was outlined in original driver documentation: 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/thermal?h=v5.4.281&id=f1599f9e4cd6f1dd0cad202853fb830854f4e944.
Will add this info to commit.

>> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>> ---
>>   drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 136 ++++++++++++++++++++
>>   1 file changed, 136 insertions(+)
>>

