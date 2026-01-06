Return-Path: <linux-arm-msm+bounces-87603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD6FCF6791
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 03:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05181303199F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 02:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487912D2483;
	Tue,  6 Jan 2026 02:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PylSFXzZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNc+Z52j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A42D1F4E
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 02:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767666099; cv=none; b=nKj7r5It43rGty9S2pXdJksRtmoyhr9F7on1Iw67x5KnWIj8CKYf7j+5SPmDIR0nzQOy4MHsHOZ0ldlmztBzcStjrMGfQkPqpOsswwMWXhks6TlRqhqvdXhUopqd4Pmwb2qNii/+ZAWZh63psLCph73ksXV6OvdmHEkgMUIDcWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767666099; c=relaxed/simple;
	bh=/QBwN7mvoQ0BdiuAGuzlfyo9MQ6gEZfYYF1zUajQ7jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WhEklraG9zp0R0DSCeiTuqvaPmQHflDOId6fStNKr9TWJ7jclVJioQ2ZGgPFWZ04/+JskHTXSyY13GjHDChQJImyDHTLwMAgZGJXNlY0Z7RfYoii0SiadFJdU6+SQa65Jp7voa6V28by97Wp8UgfFCXBAk8lffhplDehkaB3OOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PylSFXzZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNc+Z52j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nQ0g2969979
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 02:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBO20PBppYKjzHh0LvN9MJwZEsZj2XhbXZEtEqOAk9o=; b=PylSFXzZk7Z5gBSj
	M6L+c7+IWMpJSGY/ypzT56r4CJxMsLADg+JZTz0gO0GmawMFR+iCDXHDGGCkz44g
	DGOjaxMWGHA7KXwu5KsO3KcWv+9yyz+dg2hMl2scLOSy0jsW+Bc2ljKFWYmUeE3J
	B686rCfTPV0r7HSBStbVCu9Tw6YFz4VExvj/NAtL7GYguBSq9u8FJjKKwIrSEkKs
	AzeGsIQuGt7tyQdE7c9cW4JUg1Vn0dXNt6yUMw/XxKYx6dufyJj63eHTcUgwY7Uy
	5X3t0TYN7Db0RMTpCyFhCZ6/P4vGgJxAbVWCzZuyQgs73CLAghkY52wSYvMwiyTT
	50CjTw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggsvsdwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 02:21:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso706872a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 18:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767666095; x=1768270895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBO20PBppYKjzHh0LvN9MJwZEsZj2XhbXZEtEqOAk9o=;
        b=cNc+Z52j40MWcPzfU2xjlbkQaRZ11OZRj105N4w0HTwn2J3DWNUTHqthxOrkyz5Drz
         aesrCIo21prn75Fh99ugq54z94EXSwcUV/+SBza0zLrtZcRjZu9IQ0DJ+J9UMZqz+nKM
         gjd+cNlqq2UXwwB4X+WySDPUoLWGchdzxM9TYWckPmd52MgHtUzArJkn0ZFCQiyz1Cax
         1ZWo1RQnN8wRh0CtbRmhAp1m/JCGdn64EM/+5QT2IPlqOywUjL5RWSHMa28sMEovLMv4
         YKKad28bkDMC7ijBFv8vLJLFb5hEZU97yyZCEM4jN6NJ9rPTL9mNO1jWjUfi2Wly/U8l
         e9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767666095; x=1768270895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pBO20PBppYKjzHh0LvN9MJwZEsZj2XhbXZEtEqOAk9o=;
        b=O67Izg23WzbArIhxEwU078rMvh/d61trjf91XSDcv8JOuKIIwvUpVEEAE2x88JUWV9
         TCjgwId43OLwRcfUtPuw637HTwAzlLfFnZQNkCCfjONMPmpJXrENrGOcTYaz/fdlhOCL
         ynGXbVQQK8fG5e9ZcLdSU1wspnUJb10fGOYd1OYQ1gGbQfZ7T4elMxBiHSKKDvvVJQ6F
         1DaLezNscwELgmfCgnZk0KtpWMHCPUS9RpdEFYJOM8PHUfaciGPYoShzkgt53MaTFNfc
         pc7db68oNixy29QpLNjBa/hk+OCPdlvdD4Wa30YURJvuvhmM0zgONSKAE4G/NyNl7fTI
         Yuuw==
X-Forwarded-Encrypted: i=1; AJvYcCXH+gN8qxuNOw0jOk3pcZbvAAzIX2GzA9iMOL59/I8G2rlg5PlOT9OPF8oxTgqEvalEL+EZ8zVmC+AYj68Z@vger.kernel.org
X-Gm-Message-State: AOJu0YyheQJJRBP3EcL3FEvAz3SaeqmjSpPwW819UrvQokMUbg252Jcg
	/PJmxs2xri/BIAQhPrjUeVuduFOmU+0A7jqlanWnbcVAAK7cofFeO8w023XB+dq+ae9qvhYruqS
	n6BPyrXIcYBtGPnXlXY9URg8Zvap4qmC3YPNlAScuCVvMIUN+ab9a/6ZVR6n9CcA+tOkj
X-Gm-Gg: AY/fxX5M/F97DrmstFFvSIt5l8q019eKxP5QlohYjBQ2B4FopWowAVXG7ckyPNhltHm
	qANvqar6FdYFGtqg97HJVoQil9yczIVonKaoU1J0PGuTOxnDS3SHl3GIz38PpyEagqjFXi3s8q6
	a50lsCSNEbM3k9BQRVE4ncZq2bVQuhIBVpXxv7VviJtflSyNV250VxIEmAyxiUygLFqptTWN4I0
	jq2PhWA9QsKSuSME/EQxNM/GO/zJpWHzofRgS7Dl/LqQKGCZslSgIr/pjxuVZLorijQCKivWEJB
	B0DWKlOyFDPciQescpyPt72qsHeqdwgnKsoBbMXAFrEhMhaqT6i7kws+6+pAzFQdu7Vn+fpI/1V
	WG1i74z28mad9s9VRBFoMvFjfDx8vw/Wnw418nwvVo4PdYZ8xUq+kf99E2DBhIzQL
X-Received: by 2002:a05:7022:e0c:b0:11b:b2f5:a1f4 with SMTP id a92af1059eb24-121f18fa854mr1180084c88.39.1767666095211;
        Mon, 05 Jan 2026 18:21:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZWYKKjDQkCHJhiLuRB9dT/rtOLEEoLRbWLBv8D4McSmZhwR/cEPBv63uz8SoRG58/0PuMkg==
X-Received: by 2002:a05:7022:e0c:b0:11b:b2f5:a1f4 with SMTP id a92af1059eb24-121f18fa854mr1180056c88.39.1767666094609;
        Mon, 05 Jan 2026 18:21:34 -0800 (PST)
Received: from [10.110.93.66] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f23b798asm1364920c88.0.2026.01.05.18.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 18:21:34 -0800 (PST)
Message-ID: <6d29459c-2cd8-44ed-b64f-6947cf620960@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:21:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/1] Bluetooth: btqca: move WCN7850 WA
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20260106020738.466321-1-shuai.zhang@oss.qualcomm.com>
 <tfdeucc7opjtjuo723hskens3te3eg5ohm7db6tbhompbtgkkq@vsqgz5qtmbr2>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <tfdeucc7opjtjuo723hskens3te3eg5ohm7db6tbhompbtgkkq@vsqgz5qtmbr2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WZJh5FKqT2QX3uCSvzHjYLXXMwUy2HJt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAxOSBTYWx0ZWRfXyTXXXD/rdawS
 qe0oLVQueBFxlJJPlogKzFgufrl27YM1rDZPxueRK10XvTvu2MZsLwuiLG3nI5ak/6K9pviy6Db
 21vzQnTEKRdFf5NVgrCjIikJSvnCLvv8lb+H4d0/v5Su4LgDLv7wnqY64H2aO5mO5wtB63Rpmnn
 bvzW8JDA4mKZbi5AK4WMxgC4Gf1N5W7RgYyg007QalS52ExQkYg97hpzuar/nOMes2/DxDf8iC3
 i5FIzZKMDz1AhOuYIsW7jO2sWlse2trxu95MGSIIyiEgzf2tOtBx4eOsCNjE/RfMPThtmfgdvTY
 /sJwu/LIbWLIOD8HQP5Bt/oCC8xUV2T000D+rMrzh8iOOzsu7yu6m9L6EGjUnP9x/bQzNzA+PNx
 l/H6IrUO85baevsnHJkS8eyWaIxYDOcff1mO/Td79vn7jCCnSMKLiNd1HCXcdTnvWWKTIhbuFyQ
 B9bCfW4eilCDwC5pyZg==
X-Proofpoint-ORIG-GUID: WZJh5FKqT2QX3uCSvzHjYLXXMwUy2HJt
X-Authority-Analysis: v=2.4 cv=Yv4ChoYX c=1 sm=1 tr=0 ts=695c71b0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=zPWPNcdd_rTy89SwO4wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060019

Hi Dmitry

On 1/6/2026 10:16 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 06, 2026 at 10:07:37AM +0800, Shuai Zhang wrote:
>> Move WCN7850 workaround to the caller
> Why have you lost the second patch?


I thought the second one had already been reviewed, so I didn’t need to 
submit it.

Do I need to submit a new version that includes both patches?


>> Changes v7
>> - Update the if logic for firmware retrieval failure.
>> - Link to v6:
>>    https://lore.kernel.org/all/20260105055646.3816296-1-shuai.zhang@oss.qualcomm.com/
>> Changes v6
>> - Add WCN7850 workaround details in the commit.
>> - Reduce the logic nesting level.
>> - Link to v5:
>>    https://lore.kernel.org/all/20251231075817.2611848-1-shuai.zhang@oss.qualcomm.com/
>>
>> Changes v5
>> - Separate move WCN7850 and add WCN6855 fw name commit.
>> - remove WCN7850 unuseless condition.
>> - Link to v4:
>>    https://lore.kernel.org/all/20251226075621.3223336-1-shuai.zhang@oss.qualcomm.com/
>>
>> Changed v4:
>> - move WCN7850 WA to the caller.
>>    handle cases where the firmware cannot be found.
>> - Link to v3
>>    https://lore.kernel.org/all/20251117021645.712753-1-shuai.zhang@oss.qualcomm.com/
>>
>> changed v3:
>> - Remove CC satble
>> - Update commit
>> - add test steps and log
>> - Link to v2
>>    https://lore.kernel.org/all/20251114081751.3940541-2-shuai.zhang@oss.qualcomm.com/
>>
>> Changes v2:
>> - Add Fixes tag.
>> - Add comments in the commit and code to explain the reason for the changes.
>> - Link to v1
>>    https://lore.kernel.org/all/20251112074638.1592864-1-quic_shuaz@quicinc.com/
>>
>> Shuai Zhang (2):
>>    Bluetooth: btqca: move WCN7850 workaround to the caller
>>    Bluetooth: btqca: Add WCN6855 firmware priority selection feature
>>
>>   drivers/bluetooth/btqca.c | 66 ++++++++++++++++++++++++---------------
>>   1 file changed, 41 insertions(+), 25 deletions(-)
>>
>> -- 
>> 2.34.1
>>

