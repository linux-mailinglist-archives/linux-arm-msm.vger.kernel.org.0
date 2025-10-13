Return-Path: <linux-arm-msm+bounces-77063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C372BBD6C6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 01:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC0303E2E93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 23:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219772FABFF;
	Mon, 13 Oct 2025 23:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oV30CA3W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77622E5430
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760399258; cv=none; b=cyH4tsaEZckN/68Nzf27rSgyGqHFsTkmMOP/fyBKt3w0zUpk6y4M6Ju6aatp8ELw78kUR3Cq8Ipj1L96T1+/A+EfzeokO8sUFy0OKdpRFMt9T5IqGpwZZmS6/TRJb2joKZ1d9RAkjEMIxSPabwsHmyueXFtVtR1xaZrCGz3AtPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760399258; c=relaxed/simple;
	bh=e14pSe+Co6vH9ZVlcXFjb/UhFGPaoWRqh7+Se38uVpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rSCBCBGJ/L+8KdpEpFrV+8ctd8LhO/9/49ouZDjNAAuQ8GcMSszovwzKb0W/A8AHQUb8yOffFQZ8nXNJ+ri85wz9HdG+9fy/bimwkTpToBSQ4RQwjq2cclFO8DLZcxH6ToPn/sy29Wj1xYbVcJx34eDj+0bciISAUXWcU0GCiCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oV30CA3W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDFRe020825
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gyj5HJ4yv1S2RWrMVSLE2H6nL4C87pX8rwu1PhkAGNg=; b=oV30CA3WJhYzNz5+
	Ic8ZhjznW27W9kxGCbIviQM5TkqlXh/8UO0EDNz2IBlPB5QPtgtjkTBbncqVJdAo
	gVEsdcR+rTUIQ7xmZ5NqzNr6pysmSerFNbvtAntY1xu+Z6YgCRjLQ8IuUAE1JHLo
	f8LePcSbfrRxYCNY2j+gTEBhosH0G5lGnBC+Kep84tpm2MJNhHT8q6t9zKwLStTA
	HDEtsTCIPJIeZgtw38i/jch+nkhe6gHvVWXSsUQKazJArwSurW/sfHwUBAku/JxR
	+QzCCUKImU2X0l4olN+YD6hMeJ72a4z2ZFvsHFwcTkaSXl7g2aMzrk0xhrFGBKlg
	YGeQvA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8xkd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:47:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28e538b5f23so90558695ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 16:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760399255; x=1761004055;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gyj5HJ4yv1S2RWrMVSLE2H6nL4C87pX8rwu1PhkAGNg=;
        b=LmtNT2i5+nErHpBsMofCvKbZ4Mzpnio9ZcJrLtoFsKgvbp5vbVdGrGtgO9Zc+d5IwZ
         RngeaFyV72WjjVYRY86n1zE+ltFr/PFWLVlzW5quLbtagH15XwkIsYWrG66gHBRJnAvm
         x9l0JLZtQoGAi3pTV49pe3H9eVNOUAezza3Jm/uWy8PIRTjAga6LIvaUIoLCaVjb7kqX
         mWRLo9MBK9XPscbgcCyK5RVhMa9jCw31sc7SCF3lFC8ZmEkXrcrscL1J0fmMjjn+c/oC
         Q7FQmYclFnCkdREhG5/jwQX2yrGRThkUP/BydokFyKkskIpy7y0v1RBVRKsvLxROecmY
         4hzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbJsPhj97aPkMbxvyisN9wElPeFfBM0PrcMfJL0mn795jKmVrI/8vaEcpZog6T8d5HVwMp6gENYD3MXUIK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ySx9kMOmjn3qQ8oXMC1q2ZeAWFzH8S9MR7MrITPmgarEZj33
	/99+yyKMUbD1kTK4zGTuVSBeNQEz7xRHrIcS2qChRysg+SDSCrK53DSu+ZyvPekn8WUkTrB8+1z
	HszVhbt64bkCpIMzICWDGW/Y9iLFQoJjZ5DkoTyzM8aENV9sFsOJcHu26NhBP4/s6wsS/
X-Gm-Gg: ASbGncuUikaZMyFdWqr/FpeYwCz5ct3oTpH6TogNm/ymJia0uVWkP6xSihuk+45lo1j
	J6ZYaRBFM03QAPWkCmFikL7xG8SOEiqQszUEuuBnTbERcqrZl9+qiRZ3s4nSxsTfyF+q/XrNPiZ
	fjwJZBau70BlMvzBKWhuuTQZawfBwOBsfzMLHF24YhhQXsVsQOTqSYdlnr6qN7g/XatpuiiU/66
	r5Vubsx/QMC/258ig2M+Vp0kfQJROwgyh5yM6+QmrWaVOYym3vmh1WOQGTDbntCw+bgRDmZUBTU
	fshReHXs/Y5MEuFBxOYmkDM2VIQPspFEOJsc+qVi0+78/IOASJLKS5KTiih6QXrIQxL8ONHX+qI
	Y+Azbn17oPShbeehc4vUPYKRVNbs=
X-Received: by 2002:a17:903:8cd:b0:269:8d85:2249 with SMTP id d9443c01a7336-29027240d03mr246537955ad.22.1760399254910;
        Mon, 13 Oct 2025 16:47:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLM60Ogs/QOdUTm5Uk60UE9sWW+1nnygkigf6kjrerhzq1IEU1HOiFeReszYLZ0VnwGmBIgQ==
X-Received: by 2002:a17:903:8cd:b0:269:8d85:2249 with SMTP id d9443c01a7336-29027240d03mr246537605ad.22.1760399254377;
        Mon, 13 Oct 2025 16:47:34 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e179cesm144182735ad.34.2025.10.13.16.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 16:47:34 -0700 (PDT)
Message-ID: <148df7bd-6410-4814-94ef-0880b596f363@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:47:32 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add xbl_config image entry for AIC200
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
 <c3339f06-aaca-490b-997c-8b6b145c93c8@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c3339f06-aaca-490b-997c-8b6b145c93c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tB9iBbHLS7oktAlA6P4movX1SKul0B_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXw2fkDFTvcOXt
 CmK+//5fvh4jTL07s91JjPkOJDMJIUFqJ7OjFp/6LdTuG1+Ruxyd0JeYCky7NWLKSzEEnq+iVUj
 s9r0zK2VPoDLSQikg3vEp9IuaaUJwy2M9s/Qe77p8oLuD1xS/zoAo6vo3Ch/mEJsZiH5u03impG
 R/SEhEsySsNN3afE6O8iURtGSQCUORyopgBaWsvmolALfp5CeswB9Ho0g858HB1rOl38/szwLVI
 fMOxk+tezHnYsydqz9cFuHTXPRTZKWAerznykxQdDsDrTL2SFgjVUQrnrKbw7q5cgrn3eH8PlMI
 wqJ3K1xU0G/XaigNtgZi3hnY9RCvXP59HRDp7voFq7WBN5QqOeDsjgQ2QVWtmaJD6HQ0H1hu9vr
 mehFcgo0M9gQpUU5aYoZticuCugTmg==
X-Proofpoint-GUID: tB9iBbHLS7oktAlA6P4movX1SKul0B_p
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ed8f97 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-fMRNY-8PQATv_ULIEAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 10/8/2025 12:49 AM, Konrad Dybcio wrote:
> On 10/8/25 12:15 AM, Youssef Samir wrote:
>> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>>
>> Update the Sahara image table for the AIC200 to add an entry for xbl_config image at id 38.
>>
>> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>> ---
>>  drivers/accel/qaic/sahara.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
>> index 3ebcc1f7ff58..04e8acb94c04 100644
>> --- a/drivers/accel/qaic/sahara.c
>> +++ b/drivers/accel/qaic/sahara.c
>> @@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
>>  	[23] = "qcom/aic200/aop.mbn",
>>  	[32] = "qcom/aic200/tz.mbn",
>>  	[33] = "qcom/aic200/hypvm.mbn",
>> +	[38] = "qcom/aic200/xbl_config.elf",
> 
> This is the third oneliner extending this array you sent within 24h,
> please get the list of required files and update this list once and
> for good
> 
> Konrad

I wish it was that easy during bring-up.

These patches are being upstreamed from our internal branch and thus
reflect the different latencies across the sub-teams to that request.

Nevertheless, this is upstream and these changes should have been
squashed.

Once that happens...

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

