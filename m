Return-Path: <linux-arm-msm+bounces-94066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAFkF5nDnmkuXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:40:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8147C19528C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B3D430C2951
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 09:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6A738E5CE;
	Wed, 25 Feb 2026 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="noe0ugw2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iud3muGN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F200B38E5DB
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011738; cv=none; b=AX13KqnpS+COwkN7i4D5qMpVGyDdlwzrMBY7WZh7rWx10LNsik0T+rfy8eIEQPmZ2L97C+NbpGGGI1eoFNlaHBJcsoKmocvh6F+0fW5Flq2ZtcYjrUPExL8qWPcIrNdo0QmIK9mbIGCSUeE/GQjyI76bBsH7ra9XflzDk0YGYXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011738; c=relaxed/simple;
	bh=v7Dn0ql+uFjWKnUilZA6J6QUg44/gu1xKY944XHwHlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4c8EqHqewlcU1dGA4d6M5sH07Hj7PuDGuHZfTuLoIMN+Mjwv+RfPom6mvt8/0sFsQVmoJQ0wb33VadfwVlKZuZm2pcev/Z/5wW8985dLfoxr36Xq7Iiq3fMXEJGSz0kE3UYIxvHw3+z3ECCXHtl2ZEvqS0qQr8jIbYRN8YXafU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=noe0ugw2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iud3muGN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9Sfx41088048
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0rSTNHrb7cMCGYYM8naR9bjvD7jQUjTiqevbIkkW84=; b=noe0ugw2ojIXxQdJ
	6XGLle5/klBjdpbs5FfTHOP62cJzb7ZJJYJYxlAdzbS2+eeaDzl+PcChB/9ar6YN
	Xr8+D4qVTcbrSqcWlXkFOQPk8JksJ7VqAd8CGKzxSzRaJEYIDIEnlTW6Qgfl/x+X
	u26g7lmLOW6vfPrd9JJfl0Mrniu7PWzeKTI07VNfDMtA/5lAP0OE2DElwnDa1nA7
	z6y6IH7hqtuIS/eepQKz3MGIj/ZxXfrZ/71worXXwKIAkd1C1gsMLvAnGWEslQNn
	/lOrUNAu+EoovTdYaNb2xgInXk/XrcHZiK0Ax+GRZFuNzBkrWF6y0B3zGxyNf6oE
	aENh1g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chh472e34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:28:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6df833e1efso26384453a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 01:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772011735; x=1772616535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y0rSTNHrb7cMCGYYM8naR9bjvD7jQUjTiqevbIkkW84=;
        b=Iud3muGNbu0UMxkzuUHgVVegfy0jo/FIAADm7y6Disu8c8/Pk0tIuRSR39HHZ4Gr57
         WyQw+cfiqv2vg9TiA0caZNgwXV3LYmkmZiyg8F7gRN8f9CirgH2dxpt8TAsQhiE84ocP
         83ehBtMPaHYpJgxIJO3g8CINSYNExCEgb++gsv/YYi+xYQA8gkdeFOmmrqLARdtiAHHT
         RU3WoJA/5R3IGgVRzuFVZ8zsgTMvfZb20EdVN1yiyKFiVd24uNEI+025X0cwr2ISYGEA
         1OVmYUFP3343lwpB52QhPwDZgDHKxjyaTVbuNzg4FQt5bXsKwnV94fVQ/R6eZTlirje6
         svfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772011735; x=1772616535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0rSTNHrb7cMCGYYM8naR9bjvD7jQUjTiqevbIkkW84=;
        b=NAKa9b3JsGOs9A4tvfX98o31DXztyQoEHxPk5CUidTZ/2u8On7eMjPnVagWtIrCIWD
         dFq0ir8GrJxyl0kYej6qbZbJdS68yZUn6Y5BCNnENU6eYqdjPLc/njGkjAwS031PSjM+
         SMJmAq45x0fEQ8eSt6C7peVrBIVlTC5gca33MnX3+0tR2sHSITAKpudisZ9ju+1O37Qb
         EvsY5ZA8C5P89sR7HZQBtipJi2XyymswIfz/7ioCPWFoJEXXnfKBzkP4eBv21DBY/HWU
         qnk2YogtXLTvraa7iGiWHOkbAh2WPCVOIoa6+Fhr0kEvqdhje92jUxwFIq4oAkVakJbE
         f9jw==
X-Forwarded-Encrypted: i=1; AJvYcCUjF8KVN73f9qkZB4rWT2lUHCaooWsLuYSlzkPmaBmmuFEM7R8xy6V0CIIBlWNmMqR0cahOLKuPKj+/EEVr@vger.kernel.org
X-Gm-Message-State: AOJu0YwtCkRaARyrPks+rN3tZ0OcXYZTjv8JjYR2DS5Oy16a403+WEHX
	dz0+K2PCZpJrMG3H2b4Yg06qGlm3yfLxAdLgwkAczgzJ4vFBmbHt/PMime+dkdFvhSup+dWOJmJ
	kwQXiSX0rfVE7peakOvF7GZ1+47vpJ8rILY6a+H3iguwtO64+MMq/xu3FAz9gqxn5R4We
X-Gm-Gg: ATEYQzxJB+hYisE+XqobM746aXy6ijs5Jh7GDW9Xzl/JcoF8jiaBXMXJ7QoMjBqmOIb
	m9nL5v9gvfcmCeXIysi3vND5HtrOvh5lW1uc01AxborasffbmgNn4qF59tEbuPga6rxAAo7c4cL
	T799RbMUOy4Y4mx/zd5WYw1/4rKd+94QSLmdSUtmVJj4mQ5dH7mTxaWCuPBSA4ITUO4IbGX6R6R
	oT+OJAJ8LP41dJdkinQGnx8H8ksLKd6ULyaJpvg2oJkws7Z7KE95X/6pi1ypWBT0cCwP5ohKWt4
	rmjfsxltzOn/WrSuRK1Wj3lWY9FiYq4hUNXs8n5CEjcyXC2iH+zQmXdqExHw8mJOIzduDwwDmTr
	AU3zE47NH3qbW5bkJapgs+B6CEeOFuLikvEIG54Q++TfcfgHOYQ==
X-Received: by 2002:a05:6a00:6d49:20b0:827:2c87:9485 with SMTP id d2e1a72fcca58-8272c879ec1mr292156b3a.32.1772011735249;
        Wed, 25 Feb 2026 01:28:55 -0800 (PST)
X-Received: by 2002:a05:6a00:6d49:20b0:827:2c87:9485 with SMTP id d2e1a72fcca58-8272c879ec1mr292148b3a.32.1772011734794;
        Wed, 25 Feb 2026 01:28:54 -0800 (PST)
Received: from [10.204.78.182] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8a1145sm12759019b3a.45.2026.02.25.01.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 01:28:54 -0800 (PST)
Message-ID: <5fc6f252-a161-4deb-b88c-da7729f5a8f7@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 14:58:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
 <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: M8zQBHI-49uVz3tEx5rY8Dg0gC00JU8V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA5MiBTYWx0ZWRfX5o3ddN1F78Yx
 rJPAwemnnXl0tqVndS/BnABtlSkw6wp5GFwxXcgpY5At81sBhnt/9MJvc6Qn/dF7dxNYTXvIDIy
 UNT1+lx88Wv7oCUFDURIiAY8HP8sk3tUe2SE7NGKG0CjwCEh8vFnUiLFg00WyGsPF3i0vSo592h
 0ZV0HRfIspiByJysA9G7YgcZ4RaKyJA6S6zam4z7VPnZNZc0BuJoZumnkMlKerPBZ9d4AeHxH84
 VSiPW63WIAumBnEM4gzCdN0UbHio5KFK4li1LyS20UsfW/uJuBnmVYSEiVGp5DuQki4Lj+k3bjH
 VTINo2RT3Bc9uVZc3Qb2dKenDmjAs/Tv3RFZBtvht4P1MV4tPuZM2W2DSYxiixDJh0etsZr4x/u
 EkRb75DHisj8/evQw60zQGnEHh2Mr3ffwEQYHkpLYqu/W8+zdhE5EUjZXvpwbKy1fR93Y+icjbn
 ifFxvpaa3ZVMbPSniqw==
X-Authority-Analysis: v=2.4 cv=fvDRpV4f c=1 sm=1 tr=0 ts=699ec0d7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4FoVbHgPJPfqMihqj2kA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: M8zQBHI-49uVz3tEx5rY8Dg0gC00JU8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94066-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8147C19528C
X-Rspamd-Action: no action



On 2/23/2026 2:02 AM, Dmitry Baryshkov wrote:
> On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
>> On targets with multiple display subsystems, such as SA8775P, the GPU
>> binds to the first display subsystem that probes. This implicit binding
>> prevents subsequent display subsystems from probing successfully,
>> breaking multi-display support.
>>
>> Enable separate_gpu_kms by default to decouple GPU and display subsystem
>> probing. This allows each display subsystem to initialize independently,
>> ensuring that all display subsystems are probed.
>>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> ---
>> Depends on:
	[1]
>> 	https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
	[2]
>> 	https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti.qualcomm.com/
> 
> What exactly depends on this patchset?
The dependency is as follows:
As we separate out module loading of adreno and mdss with 
separate_gpu_kms=1 autoloading of msm.ko fails. With change [1] on 
bootup, msm.ko is loaded and gpu card is created.

The main reason to bring this patch here in upstream is for enabling of 
dual dpu configuration in Lemans hence added [2] as dependency.

> 
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index ed2a61c66ac9..65119fb3dfa2 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -54,7 +54,7 @@ static bool modeset = true;
>>   MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
>>   module_param(modeset, bool, 0600);
>>   
>> -static bool separate_gpu_kms;
>> +static bool separate_gpu_kms = true;
>>   MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
>>   module_param(separate_gpu_kms, bool, 0400);
> 
> The patch LGTM, but I'd prefer to get confirmation from Rob.
> 
> BTW: have you tested it with X11? Are you still getting accelerated GPU?

Yes, tested today with X11 app(xterm), GPU rendering is used.
> 

Thanks,
Mahadevan

