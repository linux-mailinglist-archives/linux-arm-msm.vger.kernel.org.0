Return-Path: <linux-arm-msm+bounces-58442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32293ABBBEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34BC83A4561
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C571826FA56;
	Mon, 19 May 2025 11:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JewDuTcO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474271F130A
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 11:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652782; cv=none; b=e1ojvmN/5mAeV7IL4EGCm1t2xHhCI2Dwqa7G/79UIrrdYuShjoGNn6QY6alM+q/+7HtDY0Lp+2ynDUm05r86hnEQaxBVXmzp2zoahtiQkC+Fd/QnRJIHAUtdatnkLOxMMBPBk+gY/+37NYbdA+9qep0O4da9OsrK16AQuhl4+Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652782; c=relaxed/simple;
	bh=nZTBtXboM2ajlv8DEsBb2GCaa1NC4QDZ3eeC/e3ZIhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJ63QlKAcBwn/L9dNkXHIkTvqUVfJ3tgAgpYDmyuEmmuV3qulsm6lrtIr69AfkpxxoJ+8Fj7hTeepcbcsvDwyEYLHe1lJ8y81XY4XkiJwQb68imbM1yAbCVCSTZjkO5WFceTVZjNrj61ZyeimhD5V/vs2OK1WrX7pPN8tlqfVjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JewDuTcO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9CEfK027074
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 11:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WUNDWWtPZoGCLyfSP3pq1jbetmnEZ5Ir/gdEY68iwt8=; b=JewDuTcO/sMRs/sz
	BHl7xxScZxq9ahtbeNBmg9j9H1VG6RozyrCBhw0v8RsfaHnjIJyqZbCxmj6ufHov
	H+CndrM1ua2utYRfhwYxPjx6CV+4CKr0zfvcz6Td2vUlryypWkwtm9hYbQj6ciW6
	fpUGA+lwuokrxopJO7FQE9p5gpW75aVsTfi7x8RBdQRKy8coRUbVGvA5XBQbj0wD
	w51V9l16yUQxEFoZgCn15mNmT9JPEK7LRpOboP7nP1zRpjxy646OJw8eYLiHtjCS
	BTDTzHPHnWdhBqiTq0C32TpIkqmJulgTJo6mUwTHgnA066ahuuA9b/FttEO6J1so
	uQITAA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7c3qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 11:06:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b240fdc9c20so4469717a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 04:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652778; x=1748257578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUNDWWtPZoGCLyfSP3pq1jbetmnEZ5Ir/gdEY68iwt8=;
        b=ui61mfXPHytaidJ1OwGt8euDvGpWPic+CSyhGRsMnicSuMmgCdHx+Qe/INz34iAAi7
         expWdjRTrex2UpAsIUotuyV6aZLjttcGkwlMRtKcMv2nSnzd3dJCo342TDEiLpSYnsOR
         n44wa1VIRz+bMnohWm87BPI7YSF/k0fAIw0sA0DiGpRLdN/bYBbWATNW7jzpQ3FkVrcb
         /tH0IWSwHgZlxuVIG/SL696KGrZ/l+VtHDztqy8G+bweCBUtpobuDfCj/tGRG4mBXSKc
         ZyHZjoiiWHUM7od897q7LvjltgTotAkYdfx5EByniCwaRofJhV0rYBgQ/7orxkGhkced
         rg0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZNSOvPk+Q7i9yqAaZegbRr8aSkdETNHdZd7taYIvpSUR7EygWc5ranxt33TURHX2+edX7Pl6LXjVrQiaw@vger.kernel.org
X-Gm-Message-State: AOJu0YyIbqVylOrNXUA5lwQ75yIj9G06o/TEcSrrcnTRbA3ZL4C/gX+j
	TsS6vGmOKtHI4hi/wWg+3FzAIHaWj2G2aa+P6h3mydkXcWPwDp+H9E2Nbp49/qAA1FGXcaJDijC
	atQ73+10qX4jH9yhQul4D2n7RETCbx2UbxoSuRs7cr8bonelf0ZZrybnWzKdw3DlaLuYkTqkiXQ
	K6
X-Gm-Gg: ASbGnctRXXEApFpQMC6cPnkO6+zBdZYDztw8RMPkfNaCFOkypmRL1I1EGaLaUhgJ8Lo
	TsRIS1KGIu0uNyso+O82/PIEqeVgTkybkj4uPpvF5EmPEx+jQWF11rXlHCec1myqrXNQ+Ug4/vE
	0ZeLrtBSRqakqRAGKxaJvnlhrJehJz1qLBMi0IbifgHNLgqS3fKxT7/BoyuFpJJllVJB9V3rotv
	pUIemI4bi9b8GwJ7Fps4LdaVbpZQXXrv8KLVCmnMSFi5aDNjDKTXRbCF0ydsVkL77Ay8gFjj5QR
	/CFC7Epo6csuu6UlDkxx7Rg5MfJXFTnppNhmvg==
X-Received: by 2002:a05:6a21:3d8b:b0:217:ff4b:cc57 with SMTP id adf61e73a8af0-217ff4bcc70mr13447304637.39.1747652778283;
        Mon, 19 May 2025 04:06:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHW8AIMBrKHP5ulMfETRqfjRJlImNtYkbXRn6muV3ss1e64lSzJgGDOqisnYMXvv+ewYsT/g==
X-Received: by 2002:a05:6a21:3d8b:b0:217:ff4b:cc57 with SMTP id adf61e73a8af0-217ff4bcc70mr13447275637.39.1747652777923;
        Mon, 19 May 2025 04:06:17 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970bb2fsm6135568b3a.53.2025.05.19.04.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 04:06:17 -0700 (PDT)
Message-ID: <71eb4b35-51a3-411c-838d-4af19631325a@oss.qualcomm.com>
Date: Mon, 19 May 2025 16:36:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
 <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b10ac cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=04P1SzlzcXGIquy7d0wA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 4VubMJ4BZ7fSDFDwPKE5uljAc_2FheDO
X-Proofpoint-GUID: 4VubMJ4BZ7fSDFDwPKE5uljAc_2FheDO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNSBTYWx0ZWRfX4QJ4mOW0f20x
 sdN6F5DktxjsMNzKaxYPoKHYsew9mQyh+PyFnFrTun+6wIAHGdhFpwvZAe1+S2l1Uesqr+UfKGC
 E15OpRCBG6HP9IC9ettTARqj9C5caQfj6VeQD116bq0+JK6DB8yq/3C1sxNDhm3CjA0sk5pdQFt
 JcAOIuLHsiLOGrIYxGSEJW1qPvkp5MMpCcZV04bEmdT6/hfnYwAas7vjn+Q7JwBgwCVeU73mPA0
 J4PMpr+jcbWSuTWsLGGeh49tC+eztuCoTTAJYFsZw0vpWi2QCNWOduLHnAGYd05sjMn2qhM13t5
 vbGtKYF4LYrhtmuf4VttiuzdjpaVGp7QdPWdOnIztHVUZjRPouu/UK8TkQRLupSh5HkCIdshvne
 eGjwI0ac5QQjdg70RsX6Fayc7feVYlaB9GKVkcVfuSbQ2QmUCVQP3Xnnk8ATbmTeZeteCieC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190105



On 5/19/2025 3:46 PM, Dmitry Baryshkov wrote:
> On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
>> Remote heap allocations are not organized in a maintainable manner,
>> leading to potential issues with memory management. As the remote
> Which issues? I think I have been asking this question previously.
> Please expand the commit message here.
This is mostly related to the memory clean-up and the other patch where
unmap request was added, I'll try to pull more details about the issue
scenario.
>
>> heap allocations are maintained in fl mmaps list, the allocations
>> will go away if the audio daemon process is killed but there are
> What is audio daemon process?
As audio PD on DSP is static, there is HLOS process(audio daemon) required to
attach to audio PD to fulfill it's memory and file operation requirements.

This daemon can be thought of to be somewhat similar to rootPD(adsprpcd) or
sensorsPD(sscrpcd) daemons. Although, there is a slight difference in case of audio
daemon as it is required to take additional information and resources to audio PD
while attaching.

//Ekansh
>
>> chances that audio PD might still be using the memory. Move all
>> remote heap allocations to a dedicated list where the entries are
>> cleaned only for user requests and subsystem shutdown.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 93 ++++++++++++++++++++++++++++++++----------
>>  1 file changed, 72 insertions(+), 21 deletions(-)
>>


