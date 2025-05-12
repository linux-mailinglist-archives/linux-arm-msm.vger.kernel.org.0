Return-Path: <linux-arm-msm+bounces-57628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAB7AB438F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 20:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD1DC1608EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 18:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E0525335E;
	Mon, 12 May 2025 18:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7HEJnUj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB8518641
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 18:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074708; cv=none; b=TWwPhZI0KPQYWrKhg09a0GYiSGLe4qCQCLF3Jf8LfztUbE1Db6vhYbr7TYjUUMop9sWjWYoAgEESZNs/510gDYjC1Zc2lrjGcBnr1q0HpqTpDX0nBzmEsf7LGXbrBu6UhCc8dOVBW8UYBzZmXebcv6g7osGClhgtK43lzLeUszo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074708; c=relaxed/simple;
	bh=L8EFsb5oCcGrowlc2Ah+qGEpR7G1fas3/A2sAWITnyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJH00umHKXKGJdeHiv6c0LgepfiMKPw0XDWoapgMtExqig3nTFc/nb+t8qu7UqQ3MSBMVTIk33VXjT9VGFGwOpGbxZzDldlPSdmJkrgGNlWVMVLALLxI588AvC30gOfiO4jyAX4DAz+a8zei4gD6CGDak7tzxPpGBO6RrSmKYeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7HEJnUj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C9cJtv026338
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 18:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRuMbOu7z2/40CcYNv5ov6Lwj3aKCA6IW48Ap+X8VIk=; b=a7HEJnUjIcbIFQET
	juz7tJUh3/WhNf1fPEcyJFPjjgZmiqUA3CH3y3mTIL2uK/OwSwVEo+HJN4iCpxZH
	ngS/y54Dbgt78GebGwripBWnF6LrLtK//JggUFaEnHy4kK7tg5SwXx6J6BSxcp31
	PvkX7PCETCc0LaBFYZX1lOYlh+k9P+w99tY4GcEKxBp4f874QBS0U19/Dv1wzd89
	BI586r99xSsNLwkhB2NSxUghfqkY9GGmEcAzNEcBL3u+ga/Eq70EyGPYmcfMfMIG
	bvY6WvF/ZOHHpO8yNDw6V788xB8EHVuug54ynv5LpCCd1N0DSvxAj4x0ctmkGncO
	KF54zg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hvghdgx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 18:31:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7425efba1a3so1389919b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 11:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074704; x=1747679504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRuMbOu7z2/40CcYNv5ov6Lwj3aKCA6IW48Ap+X8VIk=;
        b=GwY2XWqwTl3Zyw+L5qrrOpYCLt1yBD6RZcSZYa91BnYG3TIzejqEyUiMEkt8Vdi24U
         RRrQqRkEJSaPdqRrQPYX9jiDMhC0vJus6GDO7K12e0pwQvhSfNUGCrGbIAuZBQC8qxfm
         rtGiPwJln7OiRNJW4TMHtI/2T+F9rH3k94PlKfOWbmherULUnKCgKebjFgGB6SxECYTH
         6oPA7YRadWxRsUaAwtA0xq8iRrTxsXCRckeF3/5DUDHKXwCUW6ykSkiPBTWISbs9WBav
         LtAuFazyjTgjuF8fAXEnMU+FNZxFcftSXb8DzM5RQ/vDlW0XY4Y3EB4f9XfrIG3+9cGL
         1zmg==
X-Forwarded-Encrypted: i=1; AJvYcCWLddxBT53xffxtJ9U/8R8phjneiGxDWZE72vkCgenPOaW8Yt9Nx9DJ6mbcm14FK/S496kp12ik6jyw8w1n@vger.kernel.org
X-Gm-Message-State: AOJu0YwbwHUPBM70pxcsy4Kv1UCKorlPzjr6IXp7R2xiB/Yp4Cz+ojcv
	wCg5cYJhVZG9bxGHFYbiN1GFQBBQg11a1eO7HFJ0f/iYL88se/Y4mRPB9oaP4nD7dIt9nXjOZg4
	U2cG3F89w5TWxfpinzsdLCythvf9lVnvPfoLZt8mC1+vtZTCcc8ffKVP9691FwiQu
X-Gm-Gg: ASbGncv21M/OHxbwwQYegkt/sKk0BOYdTchLt+uxqZK4uBJOMMTdqEhUELqmsrsXOv5
	N6eFmFLChiJ7bnGd1ztfvmAibYgr4lESCJOEOj1doBn2mlUsw/TBx3t9T4k3sT7QI/PDuW5P17V
	FcUblyiCnIlv+d8HKqEH5qGerR9rEiRvbsZ8b3+NGNor8r5jismm6GEHE8P0jdsQSK85wrbFDe5
	JHVHtUuAYIek7Vy/GSEYGqovOpCDncRzocwP9otSDH+ril/D58FwwLHRGI60qXi8Y1j5JTwzBfe
	UCyFp6KwOxIWsmujaDqbNc+ikGW5ojYNXwmwvnGw4F5CMd0F2c3fydqOhupUQw==
X-Received: by 2002:aa7:8810:0:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-74278fc0601mr661855b3a.4.1747074704417;
        Mon, 12 May 2025 11:31:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOwALx8DJD5hEqL5IewreE7joV43KAgJapB12TnNBFDt3caeElexu9Ss50kxC3I4FWD2MAWw==
X-Received: by 2002:aa7:8810:0:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-74278fc0601mr661818b3a.4.1747074703928;
        Mon, 12 May 2025 11:31:43 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a3d0fesm6443104b3a.130.2025.05.12.11.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:31:43 -0700 (PDT)
Message-ID: <d97c900d-c899-4f2c-821b-53991ecfd86e@oss.qualcomm.com>
Date: Mon, 12 May 2025 12:31:41 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: Allocate entire MHI control config
 once
To: Baochen Qiang <quic_bqiang@quicinc.com>, quic_carlv@quicinc.com,
        quic_thanson@quicinc.com, manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        ath11k@lists.infradead.org, jjohnson@kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20250425170431.921656-1-jeff.hugo@oss.qualcomm.com>
 <1f2a8c11-214b-43c6-8b3a-9e44094f949a@quicinc.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <1f2a8c11-214b-43c6-8b3a-9e44094f949a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bTLOgmZ_fYtZWmDJ0ZagME4rsR2CFVD4
X-Proofpoint-ORIG-GUID: bTLOgmZ_fYtZWmDJ0ZagME4rsR2CFVD4
X-Authority-Analysis: v=2.4 cv=AMDybF65 c=1 sm=1 tr=0 ts=68223e91 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=wuHSmCbw7zfmQf2vPMgA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE5MSBTYWx0ZWRfX/+L5E0Glbga8
 uTgSpz706x4GzLK/9HCk2Rp2293b0SCso4IsPZxRsmGNHukHIAIDR93hKTu0dfGNClWHQBz9NWj
 RrkT2Q4KvvArVlMOwvPenYAi6FUMhATJe0n4wdjBrlH4phUcxP0iMtzlcdUbbwTGCJvXD4/cUlB
 B81W/Qg01BQ+Tjy79SYaVUlV6ljqCusNOlYxv2DBTNzBR/01gF8zg8fvcJcbzPziA51LtroKJmL
 QeIMStrsVPZZNQSQR2OHFIQjYBsqiH8G28/dNioWAZh57LvOIt1s8yHh/1fGVAHXdenOYyN+tIu
 /WlMDskCHVZwvBmILy7U3m8u16zxOGeB90wHzRqiGynA+n/L2HW/K9DUSZv38KFiM9bPqNT6VJq
 K17SHcatKZVyBkUHEFXqPnx2gXsqyFQ2lsgFYvFwFLWAICR7anMNJAKwQTxOopz4vxkbKvYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120191

On 4/27/2025 7:57 PM, Baochen Qiang wrote:
> 
> 
> On 4/26/2025 1:04 AM, Jeff Hugo wrote:
>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>   int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>> @@ -475,6 +497,7 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>   	struct mhi_event *mhi_event;
>>   	void __iomem *base = mhi_cntrl->regs;
>>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> +	dma_addr_t mhi_ctrl_limit = mhi_cntrl->ctrl_config_dma + mhi_cntrl->ctrl_config_size - 1;
> 
> but the range [ctrl_config_dma, mhi_ctrl_limit] could still be possbile to cross the 4GB
> boundary, no?

Its possible, yes.  From a practical standpoint, that seems to be 
unlikely as the control area is not terribly large on supported platforms.

