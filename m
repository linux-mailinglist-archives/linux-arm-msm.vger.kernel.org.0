Return-Path: <linux-arm-msm+bounces-99410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLROEx+ywWnlUgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:35:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E59412FDCB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39390301DEE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD32B37DE8C;
	Mon, 23 Mar 2026 21:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bq6DwCOg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irZV47E8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F4631D381
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774301723; cv=none; b=TNT7rvoYeWrjgV45lkviEdSZdFffumqpwcYhyLp9jxQ+G46qgUCScqkB/QlFkA8VSsZvMXOy+Ky6Q866yTsZUKsaH2BxO/cKHUkm2cLOAdQcOQDyMa4H176w2YKliI27TgIB05/8QwowZNEIQ/t7zyNHqi3uYVp6SiuPUeag/TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774301723; c=relaxed/simple;
	bh=y205nGMlD28XUi3tF7Iw2shM585QNWZAz96/XwO9Phg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2IgrurhPrwDtLfK/nv0t86EPKOgo24Mffwe29sviTCRZDbq2MMklUqcvrwTqgaYjf8fICxCXNUktYS4sGfECFhuZ8OZdSsRjINrxMlJN/PnzOqhLsBFEzCYl/4gaxUr5RfUVbg2pbh4bF+gpBYc0w7XaYUxYGrBwJLQltZpja0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bq6DwCOg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=irZV47E8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqi4u3171141
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7wZB04XDAtb432QUhNE0MOhOE2cxeMMxeHACISlfOOE=; b=Bq6DwCOgyBqZox/0
	HsOiBthrxLit9vTiND2MuSZoNnUvjAHc8+aBb16Dlpun5O821ZfzuQ4sUxbr9GEW
	GTHL+kDBVF9eIzLtzfHKHJAhcxFuvbujn1cGa6f0WC9In41oFyhilAJbuWe0Se1J
	DRtIoULA3h4Q56BO27VUyn8bWoeaCfl30oWc3/ySHkIJOVt5vKyD4VcMkqVi+csG
	nppNK56jVfbhf8CfuLU2DYY75wtkIiFVXy/yJ2kaw5JjpKe4hLaKKyD6H/Ov01Ih
	lJTfo4LZ/lXmdsiU4fF6HzVNLbuQnOavyJmqblnf+XV1lJPelUXsAHxsee2CBR3+
	r3/z7g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r21sn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:35:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adef9d486bso29300275ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774301720; x=1774906520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7wZB04XDAtb432QUhNE0MOhOE2cxeMMxeHACISlfOOE=;
        b=irZV47E8shs3qjdP2udxEcJu8KKiD27AMYrF0+mMUYq4DX6X2sAmjnvNayM38l0h7E
         jfvopgQSit3lG9fX0vyLkcpR9VGPMI8HvNhhhyGYQDfCpQ1ij87BGp7WUZVhD5hlkIYv
         7E1k4kW6RzS77dscyizHU6pFEOUHoa7tae5As2KY2Qgu2bQ6rAQv3NmISoWcMAx9SWnO
         zKw7AdjKUWwiY2cuyr6whb4E741UIuwmQaQ7cnfbaoWhRXvOMum4+Pfe1k6OxMujyklO
         0F+UQNTV3/UaQ7o+hJN+FHKvv7rPgHhVBc7rhCgbA0XHtEiCg4Sp1SGHId2YkS0wFykQ
         wc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774301720; x=1774906520;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wZB04XDAtb432QUhNE0MOhOE2cxeMMxeHACISlfOOE=;
        b=aCSqtOVlBKgIhF4RDreRmfcLDpHMyOvKx9BhOGbne0OK5SagrOsyh1YhSgsEQxEyKC
         ApbwsU8qoXfshJVReV2VjA3x2kth/h8JunnOQGiEjPvraSQxrKnGWNPiu07dQzc/lXnK
         FVgI1S/Yljsrw2hlKg+MdYnjh9fYOz9SzQ8MbWXs0p+IbUXLxOHGGaCRM+9287O97ZJk
         oozsuQpSWDrhrRqUYyTTeEYRJCASWkRSWj3KHSUW8e0TUHs1bV66p3Ei/ghStwMnaAnl
         sA0Xw86TX0DprXXI7xLHOcUkGh2YWClmHAi78KeYZi7dufFxEH8eWgYvM4fWjzWOO8zo
         byIA==
X-Forwarded-Encrypted: i=1; AJvYcCUFSbyw8jH2XG6Mfjw7nJxrnIjMEzhyPZvs1HNJ9Sylv7Zsyaj8PuAE8C3qFCydyO6eG+Ym7YY/tKH7U0Uk@vger.kernel.org
X-Gm-Message-State: AOJu0YzeMupdNThmaV/RYlRoc+m/RvUWdq23cBC5dPc3GkoE2qU+2jc/
	oi2ZB7eVxzpra57tJtyjTDgEmm1yVR0Ssit6vBuRjatXUDRSlbKpMpIrUQ+70MlW4p0Nbgd9iEb
	0Qjq3znkuiomiaPBcJKM02ZI53NulQfP6Jirx+Ub5059dJnqrp3AGsMn5/NS31qbNEY/M
X-Gm-Gg: ATEYQzyhMmZBITaYVo970Zi76mHgU3JmbsFvPEKWRWzyJljpUMJu7U+4s/c0Kwjo0l6
	70Xk7LsuP6doPx4XGqmVffr34P0bfsuA2aC4e8rvhzlJW1/6myZ/cPsskcSCIMhs/yf7kCGbV9g
	eoRedaoL/letuJfOP8d+efHMeRep3AMx58bV6f7jXeUvRbHV/F0JP1JVoPlfOHl2g5WY7F+USAS
	T2WeRkpWggxRtN8WEX5tmt0man1kBZdrIyxeIeA5ptRNxe4FllO7JXLmLvis0XgX4K351MB3WF2
	Q6lrF1ZAdM3HZqE5D34f5Z7V3GXbfhp9wt2i8x4YueI1iYsM9CIaoxjOzUQoWZtUYGvvBkzrEYW
	UWmmZyyixbycH6YODB3sbIO41S0SBQCcFce5m5AMCl1wV920=
X-Received: by 2002:a17:902:e5c9:b0:2b0:5626:f75d with SMTP id d9443c01a7336-2b0827a4f48mr121650265ad.26.1774301720347;
        Mon, 23 Mar 2026 14:35:20 -0700 (PDT)
X-Received: by 2002:a17:902:e5c9:b0:2b0:5626:f75d with SMTP id d9443c01a7336-2b0827a4f48mr121650025ad.26.1774301719880;
        Mon, 23 Mar 2026 14:35:19 -0700 (PDT)
Received: from [192.168.1.12] ([106.222.230.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08353e94asm119327655ad.25.2026.03.23.14.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 14:35:19 -0700 (PDT)
Message-ID: <697b9e3d-3af9-4d39-8d99-bb8b1e5a9c19@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 03:05:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] drm/msm/a6xx: Use barriers while updating HFI Q
 headers
To: rob.clark@oss.qualcomm.com
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-6-fc95b8d9c017@oss.qualcomm.com>
 <CACSVV02XkyT-om4LQJA_Xa-4Z+B5aKOPU_3uxtwHCa1nMXVUKg@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV02XkyT-om4LQJA_Xa-4Z+B5aKOPU_3uxtwHCa1nMXVUKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c1b219 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=WRfdsTvTEh9BIu3+I5rxZw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=d0dIk93vvDk8Ins0EvIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: pYlDRBY2NRpOJBfJITMF7-vdLsITRbLE
X-Proofpoint-ORIG-GUID: pYlDRBY2NRpOJBfJITMF7-vdLsITRbLE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2MCBTYWx0ZWRfX9k+2NTNwiW0Q
 X7gvhf9mjl0D+GOoneZZW4L+Psn12yW2vq2gJmD6J0jWZtiJuVpU7pzcPNay/pGSeLU+aWW8uol
 wmz7cuk3ljWzjazfFQ/ErsFsTXia9zP6eU6O0L4l/n8IcOwEsakvvVYqhSRf2RgQbCmyz93vrp0
 +EDOP3h4KoBXujAnt2dFf9yDRmqrCv0MF4u8yCgQw1ojry8SXFfzXm9A5IC4HXvH0gypFOgSsj0
 krTr+rMFIeX9h/8D6sXtLTDj8omEkF/A6/S2RP3zo7xPsXyFY+qyApZD1vngJTPXVsGLPmfbwa7
 Z2vjv7M8w61nrOuUTd+XR1n4VpmbQHTJwJnnG2z9gmR3EnTy5aP4NnYDscE3siK3Q4iGDlVgxIM
 KYqPrpAfaEPiyIx47KrpKwtTvFXwj5YKft+ut+j4ihnuGKkod4QHUAcr8E0DcvY14VuDZoC8ONW
 bafGTDM44GzxCVNieDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230160
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99410-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E59412FDCB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/2026 2:15 AM, Rob Clark wrote:
> On Mon, Mar 23, 2026 at 1:13 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> To avoid harmful compiler optimizations and IO reordering in the HW, use
>> barriers and READ/WRITE_ONCE helpers as necessary while accessing the HFI
>> queue index variables.
> 
> This feels a bit like it should have Fixes: ?

Ack. Will update in v2.

-Akhil

> 
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> index 2daaa340366d..aef00c2dd137 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -34,7 +34,7 @@ static int a6xx_hfi_queue_read(struct a6xx_gmu *gmu,
>>         struct a6xx_hfi_queue_header *header = queue->header;
>>         u32 i, hdr, index = header->read_index;
>>
>> -       if (header->read_index == header->write_index) {
>> +       if (header->read_index == READ_ONCE(header->write_index)) {
>>                 header->rx_request = 1;
>>                 return 0;
>>         }
>> @@ -62,7 +62,10 @@ static int a6xx_hfi_queue_read(struct a6xx_gmu *gmu,
>>         if (!gmu->legacy)
>>                 index = ALIGN(index, 4) % header->size;
>>
>> -       header->read_index = index;
>> +       /*  Ensure all memory operations are complete before updating the read index */
>> +       dma_mb();
>> +
>> +       WRITE_ONCE(header->read_index, index);
>>         return HFI_HEADER_SIZE(hdr);
>>  }
>>
>> @@ -74,7 +77,7 @@ static int a6xx_hfi_queue_write(struct a6xx_gmu *gmu,
>>
>>         spin_lock(&queue->lock);
>>
>> -       space = CIRC_SPACE(header->write_index, header->read_index,
>> +       space = CIRC_SPACE(header->write_index, READ_ONCE(header->read_index),
>>                 header->size);
>>         if (space < dwords) {
>>                 header->dropped++;
>> @@ -95,7 +98,10 @@ static int a6xx_hfi_queue_write(struct a6xx_gmu *gmu,
>>                         queue->data[index] = 0xfafafafa;
>>         }
>>
>> -       header->write_index = index;
>> +       /*  Ensure all memory operations are complete before updating the write index */
>> +       dma_mb();
>> +
>> +       WRITE_ONCE(header->write_index, index);
>>         spin_unlock(&queue->lock);
>>
>>         gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 0x01);
>>
>> --
>> 2.51.0
>>


