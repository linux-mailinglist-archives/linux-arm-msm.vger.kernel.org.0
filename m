Return-Path: <linux-arm-msm+bounces-88678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 307A5D1702B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DC7F6301067E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 07:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1983D36A02C;
	Tue, 13 Jan 2026 07:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNsbvb3d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WPBrZHga"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EA936A03B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768289332; cv=none; b=JYWt3odku1t9YlAtsix2rp7eb7zhV0IX8GlOgwgu98xUtvCnpfw7oVK73hF9QlMmlsOy73A2UBAmz7yuXf86qvW6BKgD48g1o/aymlUVs256whw3OodkX3pv24K2V8ngmkHGZlAaSxQWfYHW3D32jcYFL0m48VG6QnoSgfgVu/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768289332; c=relaxed/simple;
	bh=iqSAWGic3pNYGN6blxKsUeRVocZ9hiCw6ST2E3k+StE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBQb/E+AyV0IVsVOJ8clrgJ3+KqgKFUNkGdAZ6ccNRh9kb0GplyirDLUMuZf17acWNb2VyOmMwk9yfsdeH+EB+Pwgp3ZNEdhm7nz/GEdgwYJK7hKxHkwlyt2WxgWlmx7bMjPAhTn4yLaIa0y8ioBQXmCSx6fK3Emopfmq9r2dOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WNsbvb3d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WPBrZHga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5SvDK3869220
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Tdx08RCOHRHAIIwsB6Zam+4AJy/WgvW9Ht/GW5EKzE=; b=WNsbvb3dciTu/po2
	mD0Hpua7mgA1PzXBRCULDrpLP9enFyGkrNQ/jgPDez195642j51+eRftq/N+YU9k
	yi3L7FW1HmQ19uJP9tjwca+5Q8U8xhnMbN/hPMFhWAosLtOe1E/2nnJt/lUMHDMD
	7yrXW2ZXmt5tS+S9ijadcsyq7AFbijIsNIBq1/ZD0uqElUqDZs+JO522rREXAjsq
	6DAlnG76hYbNwtQYn3ax00vshk6QzETntxZ3Nd8dR0VD2EuXHiAbBQz4ck7pDSXL
	OPfYBs5Hg8ronIHXDWiaDoCtX4CKz8ByXwN0TCwlWMD4RGW0OODUsgQb3Dg3LJc4
	9JA+9w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk8a20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:28:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81e9d0c656fso5868188b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 23:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768289327; x=1768894127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Tdx08RCOHRHAIIwsB6Zam+4AJy/WgvW9Ht/GW5EKzE=;
        b=WPBrZHgaYmtuwEFS3bPSJ4dl0LfyCs2SGr6DKWeYgQeTJHrifbvcch+XuSSgOO1Dvi
         hZiGHuED8EWBbr1ueKuT3anBu+Rm4+84WS+HYWDy9Srbmxq0Xx0uS8Zgh/jdQz3FFpPf
         rB0eJ/W+tEDSJk9kzrmnJ7R1YqlWgNYlSYyWKk8QbaKcufZ/PZO4TT5D0BoK5lCMehuZ
         FbLh/N2RCIqswbQ8OSNV6+ZeLHGGieeTN0VIGrWr/WLkIz6Vd12m/+CmqThekoeffKzV
         uYkSfEDeWidOPrDfbKCkgURciwf1dg/8J7nwVYjZyyJDm7gSYtq5kUBPeMyzizmlmRFf
         RRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768289327; x=1768894127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Tdx08RCOHRHAIIwsB6Zam+4AJy/WgvW9Ht/GW5EKzE=;
        b=HZSi9QPcSRVe5svP7n4wun5w/n3Vcm3D7OH/G1WoL4tXCK4NypANOp+gdUx9Qe6wU9
         W2l6PoOzz40FdFSH6YY3p4D6L8keNNN69dzgZUU+q9atiP1gocCoMp6lXCO6AXKNKRE7
         KVh1jSukAPJ7cmVyahBWk7hXbjNG+vM6ZykF39Mlmnvz9Ocfjc6z7P0WIC1vET7t29Ea
         bi705TeBnebX7UmUOVmsBHmIZ5Uou9ybCsXOWoKpeFHRB+S4A86b6787lpbAoALVnVOQ
         xuOHyA8Epu3mMDAuY54qxydXrGJuyOh4WwS0JicxUYho84hQe69sfJfiG7AN7QRKfKtS
         580Q==
X-Gm-Message-State: AOJu0YzCK/5TvxOJHkzTEBe8/5fz9Z1SgT0oLxa4m28VlhMqOezVqLcN
	x7UiXdpZWVKJiQBf35eTiWzCYAx5S7H931es8AMptdg+98DZPHS5ZW9I4P2LidvFUvDrOohpkju
	CfPnUSLKlLZX5RcXmZEA06BEPGuvV9Ox2V6Lb8Y43QQa1pgXjNSdKFoQQbeiAnmy1FWvm
X-Gm-Gg: AY/fxX7yiDe8xcK9ALdcf1/Cle7ZhQDDZwmnYPoHun4jLJ3Ml2AO34uaky4HOGlxvml
	+zTAbNYKp0FbbhKVca4HOKb2299Kul6hu7l9GfWhINdfPHJeUyliHwrCVUiDZubOFTFoqrunl3H
	qrf52Kyp5eHX2nC8pFkE0vLD5qk/tpAHa/yV4sAJ4jcmVl69O1WOIuKeHC4TKcKy3srfWJpmOzB
	4h3uXkHvrJ9diGvUFuq6xkrfWIXHplr6BsRd7GBfJEIYj1S5GrpwlIoC1C4elsmJ1PJ0Fmb0bnq
	oUJ2lsDDbhF6Akd6HXiyN+P9SyP//3lBMyRu10KrcBzQuXcpyeHqmlLszisQHdWkOGLXhbLoFYw
	1MyceVGB3mGTSEqd8Rr3peVUwZ9ZglRLxTZFj
X-Received: by 2002:a05:6a00:7704:b0:81c:555c:e85d with SMTP id d2e1a72fcca58-81c555ceb11mr12735916b3a.36.1768289326991;
        Mon, 12 Jan 2026 23:28:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESxyZYKpKa5hnALkATiJv9fXQZbytGj9avRorN/Obxy/d2CZ5hId0Ft0KOs3pRiyEEPUCMcw==
X-Received: by 2002:a05:6a00:7704:b0:81c:555c:e85d with SMTP id d2e1a72fcca58-81c555ceb11mr12735902b3a.36.1768289326549;
        Mon, 12 Jan 2026 23:28:46 -0800 (PST)
Received: from [10.218.4.141] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81efe4a95c7sm9311618b3a.37.2026.01.12.23.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 23:28:46 -0800 (PST)
Message-ID: <706bb13d-f7bd-442e-92c0-ee26bccb5c88@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:58:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 3/4] scsi: ufs: core Enforce minimum pm level for sysfs
 configuration
To: Bart Van Assche <bvanassche@acm.org>, mani@kernel.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
 <20260106134008.1969090-4-ram.dwivedi@oss.qualcomm.com>
 <280591c4-5522-4d38-b22a-efe9ba456cb2@acm.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
In-Reply-To: <280591c4-5522-4d38-b22a-efe9ba456cb2@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: j5CCqIWEuWUy3MOkII9b4ObY-oZ5vsC6
X-Proofpoint-GUID: j5CCqIWEuWUy3MOkII9b4ObY-oZ5vsC6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA2MSBTYWx0ZWRfX918vRC+q5ClJ
 ahUjeTduI7lLORSNmKMsCQqBbk7jfaM6EGFIk5rg0IWuPxaBK0NVuywioWAvY7muay+Tq89Ffhg
 BmjHFz9uI15S11tLERGffmeDrQyglsD6UpJdyEo0ID3MWoqFmSij1nRThrBSCS+UcqSU4FJXivY
 +dCsQRl/vyjdoNAMgygWX6QZ1jee5apTrDzcJyi8gA8MHCjQupslux5iDauOKgjXaKYrjQP3ysm
 2KFrlUeXhkWb7zxarqXtcB6YZzHImcO6hlsfR/Xwy9wIK5qc2J5TIJEBe9/YAdK3HOl2ikwj44k
 RixrbDJFBNiusmjSyK9ZUWpO3mWtd5u28Qtxz+gQzUomgX/8PcgD5Ac7PgeVql/ur48D7ARvsIX
 pO+1s8LsXeWOO5PeOdN0CCm0NyXh86DXPIiWgK8dgoiwXliTQUQLEzIB5MjgEURM+mighA4Jert
 nbaUtA8VCmzs1ccApYA==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=6965f430 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=JytweJO4TXGN_DK-ZGUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130061



On 06-Jan-26 7:26 PM, Bart Van Assche wrote:
> On 1/6/26 5:40 AM, Ram Kumar Dwivedi wrote:
>> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
>> index 19154228780b..ac8697a7355b 100644
>> --- a/include/ufs/ufshcd.h
>> +++ b/include/ufs/ufshcd.h
>> @@ -972,6 +972,7 @@ struct ufs_hba {
>>       enum ufs_pm_level rpm_lvl;
>>       /* Desired UFS power management level during system PM */
>>       enum ufs_pm_level spm_lvl;
>> +    enum ufs_pm_level pm_lvl_min;
>>       int pm_op_in_progress;
>>         /* Auto-Hibernate Idle Timer register value */
> 
> Please do not introduce new kernel-doc warnings and update the documentation block above this data structure when adding new members.

Hi Bart,

I will add the kernel-doc description for pm_lvl_min in the next version.

Thanks, 
Ram


> 
> Thanks,
> 
> Bart.


