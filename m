Return-Path: <linux-arm-msm+bounces-70355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A9CB31525
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6C251BA4031
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70A121ABC9;
	Fri, 22 Aug 2025 10:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BB1Myr10"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6938B291C3F
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755858016; cv=none; b=BETUxZNWRU48M7cPgHCZw0Q7MgganRkQ5OA6nElUx1BS1PGytg0gQfnHEr99MrEk+r6/YafjH5+njCTYT3D3Q7RYihQZqpu/VfjZgSJsgSddBP4/pqCaBA4iJE9KuUA/+af00YzFcJ4Vj4KKY9lZL3iipVC+wbVbwQxksEtRUxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755858016; c=relaxed/simple;
	bh=b4BRNmm1LdC2MzYr6xK54HvOoIkn4T79SPIzxJTzBZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hx4H1jhCmQQ/OBLfI9x4GsJwUFSrBMj0m+gVprkxlRWgKRCEWzlLlm/X1yGGgPWug22YWSoZ5FKxrbAsuEUCWC5TAI8pxumHNnp830/lIksRNEy2CUPslqVBXS+DQZ1kHYBogVAMVPocB747GjkzbBfq45fTviLJBlKHJnAURYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BB1Myr10; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UQtu001127
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wcwtoydceysfZ+QalYvQDHtC8HQIqAuICXIVQl1rdew=; b=BB1Myr10xlCwJWt4
	CE+8LDXgJWqYJyvBOIIoJ6b1DR50m6zYyJ6U+uvQJTIFBaFkf8yGLxHT6jOBIhh2
	ILiHlIntAQaFLvabDYSlVvQCz/rCXIJgvXY0+baraR+wWD9vuB3ici9pbEsnFPqG
	ogHqYMlUTa7bFFYFUZz7lkNXgBC3p3qVDRs1FOmTrmvV0PtaP5osoRsrFG2ufI7O
	oUjjvZPRgmQGH24L548BZGZ1Fci21TcNNKek05NjnrwhP0UY2ZJJowo2dcm1brUM
	kXAxl0l2qYAoQ5P+pCx9OWOkn6ks8dUJhYdTEzRjU4MO+Ww6RvvCk2pUnrtlD9WW
	CGL4Qg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5298vte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:20:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d9bc306e0so8917916d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858011; x=1756462811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcwtoydceysfZ+QalYvQDHtC8HQIqAuICXIVQl1rdew=;
        b=NtvbyVKcBI/7bJtqFnKcUv3ANqF3cQU6GYEqifL87tlUhMKGZtt3KxNFcRZ0xTuca5
         1wFbQ8gMMl+ODNVZvcbpdnReio8PP1OgkasYKdzxU5P13ffRhTguYij7RSExAsIMhe+7
         TWRLo7cDVT+ZJ+wTbRVk+OuoOdB2SUu3QwIfYkcsnASRc9nYB28VzLUSwxY7QAH00A0m
         M2u6F1LzF2oM1MnRRmZhWw235RomctKaahei253rn0TSBrECh3pE9KSEHkgx2TVU1he+
         Moar6ZptVES59SgI2dkYgIi7AgiH7z9FyUqLs4rFclAG/sqouzlWPwdRx1s+80DzwUyq
         Y92Q==
X-Forwarded-Encrypted: i=1; AJvYcCWk9m6hxZxIMIjCVDMxlVHBIrNqEpqeKCLY6pmsvYrfa3TLp2x1GBcmKl+5JX3rATy1qnv8F4TcTOve3foB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf3MT8sVpq20IWX/TLwCftPE5DIjmyUeccF1CNl0T0j37dtWAz
	S/l8/DFCLYgSOh7a0L+T0Qkq8A1nfO3tm+GwWQwyriC23xlaHPHbY4ddTykVM/O8FrQzpPe0495
	lOv807OwQj/PEwhy5Ddi/TOz8+wzyfV3i3pn7qWT/3pyPyXHTXvbwJGhhAKzufhxy1uQf
X-Gm-Gg: ASbGncujq0xb9VAAoQs+HBWqAn6pv+b5ulwj6MSyNUy6oOvWPgIq1pEGrIDyw4hCKm8
	WolJpCESO3uNVxhpg5S1kR5wdzjxeQuMbCAHHZecaB7C8nkBR7BcoinVqaNRKknV3ucmn7u6nDJ
	c/C6V6CowibPiyQeVICnsAECtqy0IKtF0tlOHlnymOiC9MRpFEQ+zyWbYRnOW8pY/+Dq07YpHAv
	kUn2SNbToLymt09e9hbFQj5B0oKUvsdXPLTllpxXWc4fFwsh0eMIk03cyWQayl36It1m7ouu1YW
	Iue1TCKTzJzYxEpDPSx5rKphVL3FJF/pnUp72Q6IF+rO4FbrM04TMLttxV6Ojwq0hts=
X-Received: by 2002:a05:6214:2b0d:b0:707:4710:a551 with SMTP id 6a1803df08f44-70d9720a8b4mr26236526d6.46.1755858011239;
        Fri, 22 Aug 2025 03:20:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoVZc7bCJ4naBD4rJSgP7PzSX5ebugI4tw56aD1euvzJ8FFfbMFF5VoeT5a6LEv0kJzKEt0w==
X-Received: by 2002:a05:6214:2b0d:b0:707:4710:a551 with SMTP id 6a1803df08f44-70d9720a8b4mr26236216d6.46.1755858010660;
        Fri, 22 Aug 2025 03:20:10 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c0777896absm14824527f8f.50.2025.08.22.03.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 03:20:10 -0700 (PDT)
Message-ID: <89f8bfd0-d8d6-45b4-bd06-d5507da258ee@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 11:20:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rpmsg: glink_native: remove duplicate code for rpmsg
 device remove
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250822100043.2604794-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250822100043.2604794-3-srinivas.kandagatla@oss.qualcomm.com>
 <54moh5c4s4hssl47tabtlqm5mu33frf3x4k3fdhsrlc6abfltg@n6igz6vf5yd4>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <54moh5c4s4hssl47tabtlqm5mu33frf3x4k3fdhsrlc6abfltg@n6igz6vf5yd4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VVc2RUcpEneZGS4zc-wcYUfbxP6_LCor
X-Proofpoint-ORIG-GUID: VVc2RUcpEneZGS4zc-wcYUfbxP6_LCor
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX9/SaPYH7EhL2
 Vom9fNqMZ4Q04G6wptURASI7ceOKYTJ3WTApHoOtLEZ1qjzU2zze5XlGvLYlj0gCYw5N0Vx426y
 cJQcEsenoqNcgVgOh9G5wSP899aUkX79ldXy+oq2QkOm0aecwTFhbLXcaE3JrroNCUD7OB1hRRy
 CPvxFGsaujAtBgip6ME4MB05Mz7T0qZ2SHj9RTsIVQyL29JRVvgaPZm3rrFNl0HTDph+Gj3J/Jv
 +gBGsFTriaz+XoIWfE1AH4aOUBzJdg930h6ywMkvMgndq78o8aCgHjHeWzQlHnap+7AOOAFGe08
 uhFyToAagQ1K0K/dx5sT3CkHvuIDr0Dt8CIifpgLI5rOx6CDsk8egqRSAYVPbKY+SHpvAw3k5R8
 zv+18AXBLS4WnIf6dGSMk4SkAOHKzA==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a8445e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VhFYbXtIDa7AXiK5D64A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On 8/22/25 11:14 AM, Dmitry Baryshkov wrote:
> On Fri, Aug 22, 2025 at 11:00:43AM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> rpmsg device remove code is duplicated in at-least 2-3 places, add a
>> helper function to remove this duplicated code.
> 
> I think it's better to sqiash this into the previous patch. Otherwise
> you are fixing the code that you've just added.

I did not wanted to add new cleanup code for backports, which is why I
split this up as fix and cleanup.

Am happy to merge these two if Bjorn prefers that way.

--srini

> 
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  drivers/rpmsg/qcom_glink_native.c | 43 ++++++++++++-------------------
>>  1 file changed, 16 insertions(+), 27 deletions(-)
>>


