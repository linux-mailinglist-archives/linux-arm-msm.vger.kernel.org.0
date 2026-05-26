Return-Path: <linux-arm-msm+bounces-109728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG+dIihBFWrJTwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 08:43:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E641D5D1438
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 08:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8F4D303CA69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 06:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53CE3C197F;
	Tue, 26 May 2026 06:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jo62S63T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2KfJhbo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2E439524B
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779777753; cv=none; b=aCa21xfYJmJenz/8hIzm6rroAr5Ulbqf/wmztUxYOG8en43pdq9KLvnlr3z3SAn+AnXKdGwEd8cv6yzxYEHNYPFQh4rAaRpiqu1+y5ZX5f14R0eAb51MhanIgZzeuhXoz8GVBthALB/mdj9CinYQln/pPY744+QvHNwDPr4TDSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779777753; c=relaxed/simple;
	bh=1XZvQh24NMPzJFxBym8WhWMNSuBuj21mEK2ZC6wKrQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hl8AvVJTf9CG1oRgGAPFm77wEF0FhfMS+6ExO84HitUK2LnKSCKFKzQRn6PMJpkRkoGd9MxVs6YfyY31i3MFmiVDw4fst4GwKai2fHkYoF2NQBEvxgWYfnGpu+EEYfpljhXPPbqQIDp2HJ1nD/HjtqOsPdCaL8gLCpO/Q1J3Cso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jo62S63T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2KfJhbo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PNImxB3264052
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajId4scyCctYxikVukDiATz7SBoip+pax0baHtsGRgo=; b=jo62S63TfzA59Gga
	fdBZsD/JMANgFMRtQyub5nVQnIxJuG33kzJJzmOnSx29MQmIYUJgzmQ42LawU8Oj
	xrQKCy0LU/3JvR+zVJ4rSoaVjnOB2V5DZKyrxfxPX6INP5KCxH7zdPAd+bxdLHKv
	v+ZhMFN0eF2IyBkCyavoenIC+t+FHuFo9QugkJixpyQa9htLUQ72S5MTOMGj2QWC
	s3lMBPqJhUu+jHyMzsKFLltxYxP7Ry+xvLh85RgBZxsGmWsdoSv5xLyouNLcyHDB
	DpJOkp27Nt7IyVvcTcjbqRgy5LEJtA717gHRW9fxaeokbUqU+4EMa5TC4twrxyRJ
	3901ig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs30pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:42:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso10953077a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 23:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779777750; x=1780382550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ajId4scyCctYxikVukDiATz7SBoip+pax0baHtsGRgo=;
        b=a2KfJhboPpoAZaI4ls03SVr8gL8gR1S/18nhQ08QTysxnzkVQqGSVWDKQsKJlKiSTu
         rl21hDlG+tTDRkuliKGBB3bfJQf/tEm8lUKUb/gW6WKkwzi91qnbf5SkcAVbXffkIQbL
         bUoboMKlglruLC9L0AUcx5iWSUCYqFPEXywx0djpz66XLIiutAlAsShgGgBuwMqB0Z3I
         qpifJIfFQ5afwH76JwF/JGY4UDvyvTAyC1ZWOiDFWaRTZH4dMOCTj++Hdkg/N4czRQvN
         xXb1Gzd3aJZ9nT7RZ1rtSseTxgro8lXMzoffNlpnRLEhyvDckino/46+DwCo5A3DiA+c
         4+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779777750; x=1780382550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajId4scyCctYxikVukDiATz7SBoip+pax0baHtsGRgo=;
        b=exk5ghla165x8Vdl0qKv2cmVZEqdeYUs8pO8M2uUnXb46Yllk9MCjwzhB7LmQximw5
         vRUqDsvMx3ka61F3pSnyPACA8zccTPgHRjSRapHTmQYo9N9exYCsH/OnjBIeQOjZ3keL
         8EDCYd1m9XGPCrxxy/mem1TBFAq+KpWYe378qeJ0tsNsdx14xCg5UTdfOnFHsSvxmGwj
         vZ1HrWjHBtvKuNZUjNXq4xjb1WiU1UmMJXoEqt8s8Sl3gq27z6H2SCO37ohMdpIfHg03
         r9eSbjnqIE9+SHocmrJUkbNpGKjNrlc2zOKlm1CLU3PxNXE5Q9FDlqCrcw1pYlAvio7z
         WZDw==
X-Forwarded-Encrypted: i=1; AFNElJ9/kdnL53Jk8qjqZkOsiz7bkFYSquVboJQnn3NdlSiptTlr+gxz96T7OJnlwzHKui0CSv5/pv7fEdZFNFxw@vger.kernel.org
X-Gm-Message-State: AOJu0YzXDCCNGh8ilQWq24dNP1igEDZFYmsyy2A9gWPYKUIWa27TpeRX
	zXmIboX3CZ3oEw8nb4k9yoUS+AqoEN6nwOAYyM1TSjXED+eQLMB6YGI2e+CC0z+9ivmUhqM4kdD
	EEnK/3ZvJ3vRMGhpeXEkiI5bRfZKmuIt5Nk9eOeVj/aX/jybmHt1MO72z7PjHslbj+C9v
X-Gm-Gg: Acq92OHXW/o2Y3czhV7DIzumriY9yliPMpGVPmWff60KL2qdBcZyhMgib3Or1prMV1H
	7ZZ6Tnru0UEUXSWwysT2EXW5A1e+gXxZBYH6n5kh3t2aOtUSTStPXObzrPzIQpQIldEKRddxPpB
	AyXux2uwOE8y5cLITm1/KSYaJAg+OG0V+Iuq4zC/mBVz5PwnZ2hKG7nQYYM5V6rG8PU1ghLlcCr
	UEHilPuFvzRIZBHck1owCaSuuyZ2LJ/kehTz7+kDS8RInGLrj+m4l9UD5IWu3uZgnXkNG97DlnA
	CUnYZnE8Xp9BcOL+5f9WIaTPoGpzvGYmBwz7UIL+XyFp/xDLdSCBnBubs0lQZ5T4Q9hbiOvWGlB
	WOfCx1pSOwsCKMAx931vgjLOBXNBfO+jemSuOfc/rRwYLnEwCIg==
X-Received: by 2002:a17:90b:3f85:b0:368:b92d:df93 with SMTP id 98e67ed59e1d1-36a4797cc8emr17399632a91.9.1779777750174;
        Mon, 25 May 2026 23:42:30 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:368:b92d:df93 with SMTP id 98e67ed59e1d1-36a4797cc8emr17399608a91.9.1779777749732;
        Mon, 25 May 2026 23:42:29 -0700 (PDT)
Received: from [10.92.181.2] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36afbc766d2sm1987905a91.14.2026.05.25.23.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 23:42:29 -0700 (PDT)
Message-ID: <c36e0241-08d6-4866-8b3f-3a7e2bfde547@oss.qualcomm.com>
Date: Tue, 26 May 2026 12:12:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/3] scsi: ufs: qcom :dt-bindings: Document the Hawi
 UFS controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
 <20260522172716.820490-3-palash.kambar@oss.qualcomm.com>
 <fhdronmweor6vb4yu3ggickvvzj7ls7w4eqb6tsvp4amjpg7ae@xfr4up3iesjh>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <fhdronmweor6vb4yu3ggickvvzj7ls7w4eqb6tsvp4amjpg7ae@xfr4up3iesjh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a1540d7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=sKss_wxwHuIV23YTwXMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: B1GzS-BUfjg2cZmCC5ezRryAegoFoSNV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA1NiBTYWx0ZWRfX+VbyGet+qQzp
 VkWxK9zJPe7pDeli0IpYzQ7G6QvRCjJdzVumqVe2dkFV8nPMXzlrS1SL3U3vFYXBDRGC1/O4R7r
 5uzmu9vQ2vC5qErgHzMOGAYb2C26+MlfsobKvzGrAguKyR0NtgO4NcBFRwsuY694JpoKUgN9JDK
 YekQKXr0uqSb+N96sBg74wIPYMXN/8r7y1QjxFqshWEg1PMR+OrIggRN0uGqGaS72HRrAuIQmGt
 CnKM8j0Da5ib5yBYI/3nE0rPtzUOIyoAH7p808IBm/veN2w6K/ylYOcfOz1n1nYORIhgETWTLaa
 8pUYJHXwU55+FifiX/irvhQ5ehTKHqqbdF9Ycv5XmqUtgtFLANkpZgKHtMH6z4+advb3bMlegZc
 voymzzcsukHUTe0JkYhplV3yCUaVdnUsVx81p8i4WS+wfVMPhzMbIyKJDLSv9lQKcarZzA9Bnjn
 gjbYiGBdgFDguUCQmmg==
X-Proofpoint-ORIG-GUID: B1GzS-BUfjg2cZmCC5ezRryAegoFoSNV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260056
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109728-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E641D5D1438
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/2026 2:16 PM, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 10:57:15PM +0530, palash.kambar@oss.qualcomm.com wrote:
>> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
>>
>> Document the UFS Controller on the Hawi Platform.
> 
> Please fix whitespace order in the subject.

Will fix and update thanks.

> 
>>
>> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
>> index f28641c6e68f..3de00affa4c6 100644
>> --- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
>> +++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
>> @@ -16,6 +16,7 @@ select:
>>        contains:
>>          enum:
>>            - qcom,eliza-ufshc
>> +          - qcom,hawi-ufshc
>>            - qcom,kaanapali-ufshc
>>            - qcom,sm8650-ufshc
>>            - qcom,sm8750-ufshc
>> @@ -27,6 +28,7 @@ properties:
>>      items:
>>        - enum:
>>            - qcom,eliza-ufshc
>> +          - qcom,hawi-ufshc
>>            - qcom,kaanapali-ufshc
>>            - qcom,sm8650-ufshc
>>            - qcom,sm8750-ufshc
>> -- 
>> 2.34.1
>>
> 


