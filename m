Return-Path: <linux-arm-msm+bounces-61011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2125CAD5AA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 17:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A78197AE049
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 15:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA7F1990D8;
	Wed, 11 Jun 2025 15:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2C/oqyy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570751A8404
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656190; cv=none; b=ID+XmipOnRl+WWJ3IX23OA+Ym2EY3Z3vA3MHaTIzJurwAZZmKaV4i6NkUjRsffOgafz1LA1dQLiquz0k4LT/A+e/CDcsqqMNtBXn8y9C8Ebwz2+AnXOH7ZKelCaEjLxZhRiShapE2PI0Yk75eBiE55jXi8HP1vmrE7vqiNeFDYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656190; c=relaxed/simple;
	bh=gE8yZKW3k3jKeED1U2EhAp7IoYuqpQiRBfkBM0k9Isc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRpeY2hm3m1wW1Lcj6//IRCxGsgGc7KF/9TwCjp0HtMfl0D/uJW4+odgOYmoMHzGiKD7dhknY0JTBqPCFFbPIRPhS1sFCbqm0uVsPy3hjYJkyAuxkr1wtaImSWHahrSnPayRlAb8Lr9a886DPi1kBNWZWQ74gWj4dBbu+ThN77I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2C/oqyy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BAnqlM003259
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBpg7FRyPE2bOJtUQWGo/9McLlAo2Q//lTabaKYPhZI=; b=Q2C/oqyytHXh6n9X
	FJfs1Lidsh3BZTURLYn8OFNAW0KKj9Siuh3t4MrsW4ixee82vxGnWU+PuByS5Q1m
	GMg4wSF3hisP8GpR8RxrXtWW+5PRO/cVzlahvp3HzT7cemVc3g1v2bzPty+knR5M
	yUtk63ZEe/XnrzEZIinCuhSgVhc8ShKhptBefnXLG5ODlLIhz8p9VW/zOI+KvusR
	ZXyN44ReQK6TK3SbZoi/7EF+OYPo2EkBcH0UOXdDudrwE3xKFOQ3b8iPdzgO9VgH
	MK/QeA3yO+tCRRkmLgQoRkQbnrlBZW9gC9KQa+D7raSARTkJEA6agkqIH6UELzh9
	x0NzSw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4778cwgt53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:36:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b0f807421c9so3973939a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 08:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749656186; x=1750260986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GBpg7FRyPE2bOJtUQWGo/9McLlAo2Q//lTabaKYPhZI=;
        b=iDr1F1JAjt/8kSnnI32IhxBxqcOdUpFWl0VTHSdhtKpnLIEeUXy2G8L3wS1CgBVI1D
         9vS12AmdxWOewlqG8dyJDT916tb3mDgrQV2MjvGsCuDHhqvCk4lNlAE1mcy79Qsdgzs0
         kChEtyhHLQEmxDh3cCSOx4vk2W36ly62Smbs9ctARMcaIvMS5+LzS3QsS8LlrmDHeySy
         JevEkZ45/tmXjqvagvcyJZaPSOh8LzTi6I+ea0G1gSxGMRRm/X9Q/l1IrCoW66whHNSx
         G/PaAbg52X0Kvib71xyuGcYR0UkfwK9Ma2V7r4w1lgl278lzURz8xLW7UVluGQp1pzNI
         44hg==
X-Forwarded-Encrypted: i=1; AJvYcCUXClo3K5uYLEvqZrsWA/Xirs3P9X8cxAHziHjJVKa4dFl6VMAao2VE3Mc7kJbO2onN+Lz+LDfRRb2XCvSV@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZjXTnPrKwuueuVyFqvO2r50W4eGr3JnemizR9FW8hW+kP/PJ
	0YM0jPCAcFE4BS3xJXSUUw7hihvf8hnnBEA4XZqDgvdQqqgclUujOL0YEPypdLK01gjpKZXy/JT
	owq89vU9mWd3ORMlymLykiSjoBzgzRyVOvpZBU7aK3DcZNvDhMR5pAd/3o9T9623hsQkF
X-Gm-Gg: ASbGncsqrAPTcg3K7ZeBjcngNXdePUGts1nRtG3ZzbxwXOWWBWtgDvyhnssKoTRP9WV
	+tP80DjLA+02H1zzFM4nOpHloIEOen3JsZMb/2in/uLkD0xn5S7la5BVp9JW5/PfjZW9y57WDn+
	u4bSder7bZD8F1OcxihKW/4bXyYzxFnIaIK0qLDhaa9md4MBlFKc1saIhK0nMiTJ24zwu1NV0Rp
	94cMLVDSVlSiDLxCsvGc9NHAA65eA0j5x353/QFZ3ditXpSvEz3JCs8UoE5Y+VR+FJmAwWI45rY
	dCBx4UktDsPyo2HE5yxx/Ag4L0yQsmn8JrBDfD6oVJWZ6xuXLB1X/t+G6ayR4i7Bdb3C+543
X-Received: by 2002:a17:903:178b:b0:235:f3b0:ae81 with SMTP id d9443c01a7336-23641b198bcmr43701835ad.27.1749656185748;
        Wed, 11 Jun 2025 08:36:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNe+ViZORDsP5Y/hLxF0FbUul9r0/EOhNQ+GwB+CKWOeGphnXlvWwwX3PPzsWyGWUpQjQ9/g==
X-Received: by 2002:a17:903:178b:b0:235:f3b0:ae81 with SMTP id d9443c01a7336-23641b198bcmr43701565ad.27.1749656185373;
        Wed, 11 Jun 2025 08:36:25 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603097070sm88818405ad.62.2025.06.11.08.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:36:25 -0700 (PDT)
Message-ID: <4e9508c6-8eac-4930-93c2-ebfe65df16c2@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 09:36:23 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use dev_printk() in RAS
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, lizhi.hou@amd.com,
        jacek.lawrynowicz@linux.intel.com, quic_yabdulra@quicinc.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250610175912.2086773-1-jeff.hugo@oss.qualcomm.com>
 <20250611083602.169893da@canb.auug.org.au>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250611083602.169893da@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AaixH2XG c=1 sm=1 tr=0 ts=6849a27b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8
 a=EUspDBNiAAAA:8 a=CiQAVfEbOHSXt17sDtkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-ORIG-GUID: SO2T_CeMgluB0QPVq_c1gy8m9xz99-Cr
X-Proofpoint-GUID: SO2T_CeMgluB0QPVq_c1gy8m9xz99-Cr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzMSBTYWx0ZWRfX1oCGBWT8sSlK
 ZZGLIqmXuCNJMCkpMEfQBlUdkW85134a9149JgQ2b4JqGJWWSpYL2tvDpPtoc5Md/K6ivHZuTjw
 qeZTgCkDxPrSMXmuYl+6oLc4zRr/pHefmArLdf/d+Y9k7D4I5trT9G/vh55c95RfpjgNFRxuh5L
 f7pqpgkjsxtrro2iQiApY8dschABLX8ZfK7ZP0rzJCEjwF16uqTVyXstX9xUZvuAqN+1NioSvL5
 bTUMUhYeOnFqelzmnbCxmtCThNXrzeJyAAUNlblZF1dNztj6W1qIk3IqrBEo57Y36LKSJWSJBzL
 Zhsr4OhDjI3QnFf/tkKAWQ5BRt2w9l+m4g32GvgqY+MDGKC7Ii4N8Vh66fLIGjO/ISaVEO2qSOp
 vnXnL+tPaugTh1rzvIAh6V/P+57Fct6kVCsn2QaUscoKTkgqX0sEXIGCd4fSgjzoXo7LqP3R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 mlxlogscore=965 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110131

On 6/10/2025 4:36 PM, Stephen Rothwell wrote:
> Hi Jeff,
> 
> On Tue, 10 Jun 2025 11:59:12 -0600 Jeff Hugo <jeff.hugo@oss.qualcomm.com> wrote:
>>
>> pci_printk() was removed with commit 1c8a0ed2043c ("PCI: Remove unused pci_printk()")
>> so change to using dev_printk().
>>
>> Fixes: c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)")
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Closes: https://lore.kernel.org/all/20250610124809.1e1ff0cd@canb.auug.org.au/
>> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>> ---
>>   drivers/accel/qaic/qaic_ras.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> Thanks.  I will apply that to the drm-misc tree merge until it is
> applied to the drm-misc tree itself.
> 

Thank you very much for the report. Pushed to drm-misc-next. Hopefully 
it will make its way to you via normal channels very soon.

-Jeff

