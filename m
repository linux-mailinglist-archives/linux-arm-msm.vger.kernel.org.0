Return-Path: <linux-arm-msm+bounces-78764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E3BC085EB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 02:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B4BD3AA7C9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 00:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E2B4A00;
	Sat, 25 Oct 2025 00:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEhTKRze"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C6311CA0
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761350848; cv=none; b=m/0g2K3+ifA/OV+efO9z4IKvns4+UBc8NNKi1bRoTc1B7LvBaNzD/wMBWFGAqZJ7enLKNYaVZgbBTBC57CE6kDE5IkeCaHNhw5d0KxZkLdbNhbR2EvDkDa/8xHMSeyLYzdlJU67S1A3Jx3+128KWrFWWNyp4tpyGhppYjR+TtKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761350848; c=relaxed/simple;
	bh=JO/IcznMrVTp+Y5T6s7xYUCKmPVEZGJuw0u/077YHeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hv4rEGHB9r7MnrPQYnrfq300Tv/hdhsK7X3Qsfm4RYh5TcdJ6b20h00MHqu3uFqNlOrpWauxzRIj4pcG+tnPMDbwdq2XC5ohH2RVQuS7G3EOs3gKtj3wyUJdWVMqywfdoHaHQFAN/mpXYGTYaSLYKOVqD2rrCFgH1M9H28hP6OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JEhTKRze; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9IHC023521
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UxyvSi4QpSo8V/FgajmmnszDW4zbH8JRzeB/hvknSy8=; b=JEhTKRzeRgX5u8VZ
	aLZoC2grfy4mWvkIrHxm9Zn+NLYYcYYUUXVgSFYl4mBV2H6hpwjXZ5bJfZGn1nOo
	YEJOG2X03djFpnFhCTCckHtTcokHZarv/rjCM1KZybasMdtDwt+HkYv1k1UA09kM
	IhP5jDsT0aytwqbamjENBjNx6y7NCI6T1zVXJ7DQEQ3iLWvUBogTsmsI8NEiyNQJ
	utXVID3Un2Nej++byn8SwUHSwXswPfVH3B1sX1iKokgZJKw5i5CEvPVmeNBUQ4gC
	4KDcIQlcEtl5kSPkehUeNFE08hQQwMBULEc/xv+LHY9T9t0VvQql/zHpIBNJZ1nv
	A1CaGQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8qsny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:07:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2924b3b9d47so27474535ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 17:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761350844; x=1761955644;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UxyvSi4QpSo8V/FgajmmnszDW4zbH8JRzeB/hvknSy8=;
        b=BBi+TbVXoL26hyCpqIqnepzb8ixQ1QeNycoa+3NWDq+gjtXQxtEuupv2hzILKjAke0
         0s9yb16jj3Uf5XAKjyAEx4ocIRWe9xp027v9DqZayO9tN20zttLqZRv8DY5tNVBXaETe
         PML9AO5pAxEBCTi+SWzvvmW8PTliN41xCSDdWEh57S+ux75zJY/F6+X1+aaHoBRj0X24
         K9RAWMczjR0lt3FhyUuMEyS2UlUAKghuZcycMKtYQpBnuHOC93gPdLoASxOSUqsbXZ78
         qYKrOX8/CuomSpjmEFttcvOLxPMn5bwpCAkYTpPYJ/qlS/BOk3YNumFzDsw5YnpM+IEr
         GmRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkEfqZoaKvswQlnmViZZHhWgnhuj1Oj4OtFYSnLQ1SQBH+/0+xmI+C5NKGlLH1drOqxP/LjHHf4k+S/zun@vger.kernel.org
X-Gm-Message-State: AOJu0YzsBvu/O6Cbppc8yWQafx4rnWH89O4zsYtS3s8FYD81S49ZB3BD
	Rw+pMdwzDOHwky3BCUAwHfD7C0zmY1a7JGnKf3aMGkI4SqnbeQNZnntb0pzneeG7EzW9Euoo2x6
	Vt8JySDoFW5Ty73fVFZyejZfD4lgPFRL0BQmh1kWcLOP/vzDzbXlp6/R4KSPihvqoUi00
X-Gm-Gg: ASbGncsk4SsBqJMfYtgA4juIRVwohf8pSIj2BDaZno0BGQB76BGudmuTCZ9gpQSEhMK
	5IgY3MdqXRy0TWezOqtCcxCwPQ7lCbNfZFlyWao7ZHffiZYSE/AQ5d/LhVglRiF7zoORpG0lg6J
	YNqBzI92xZVAWJpkJlSLf7+TFXqUwRdPsYvQ0l/EYGi+B6k0falSlc6LaeM1l+ZbWnwGBSluSxZ
	SJ74k1/B9pb0sjSBJaDSasmo6v6Tc+L3THn+1Re1Aw7TuNK2keZSUAKR+vIXnH8oVJWKcUicEfk
	BlJQ87sQu6xlVxfANH/hJ1Mdjt8gWT1YIPei4BfGxXvHkWvI85cgnNQiQuLkXUPzRshcyBZv1El
	L47NPyGG5oMeYjkDgBu0pLX8x/KuTATJf12EwzxlOoueiitNmbNU6XAhFA54ZwQ==
X-Received: by 2002:a17:902:ce8d:b0:269:9a71:dc4a with SMTP id d9443c01a7336-290caf850a6mr375637575ad.41.1761350843918;
        Fri, 24 Oct 2025 17:07:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoeC3hlRnAYs7LFyOMX2WlNknnmZsnRvIsHZ/Ntsi+EQK2pCxu96m+tEh/bZBQIS7atunLeQ==
X-Received: by 2002:a17:902:ce8d:b0:269:9a71:dc4a with SMTP id d9443c01a7336-290caf850a6mr375637305ad.41.1761350843413;
        Fri, 24 Oct 2025 17:07:23 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d4287bsm4568455ad.80.2025.10.24.17.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 17:07:23 -0700 (PDT)
Message-ID: <0ba75ea8-3a06-45e6-9f31-49085826c112@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 17:07:21 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] accel/qaic: Add DMA Bridge Channel(DBC) sysfs and
 uevents
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251024164630.816862-1-youssef.abdulrahman@oss.qualcomm.com>
 <20251024164630.816862-2-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251024164630.816862-2-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y68EzV1LMFeUBz9-BDikjyC08PoeCxgw
X-Proofpoint-GUID: y68EzV1LMFeUBz9-BDikjyC08PoeCxgw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfXycj75vI/co88
 cVP6QvUkfYfHNpsjuf68W5Vj/5BSSzgpqs2qfzUg/ORP7+NUDbfA/zUTGq+PySlJAzHyrHCD+E4
 J1TFfeRt69Y+t5J3SeBTCKiXrFV992wdvPCzP6ITIm5dXmYQk+PibHaZJTu7ZqgzVMdvuAzwIRe
 Y9OvbSf5NX2sSZPFRCmsIqtZTQql2q/gW0lClF4B+gv2iD18CiuziVnXdxjL88+RsM9yh+Vw9/m
 Hxa/7vnODhSh7r6An2ZCeOZwv2Ho/1j5LttkA03IfTS5ZtFL8NZJXVcrfa0RymWZ/G5dPPELWzZ
 V0j38fFI68xluHCOHVDQd80SmmZQ4LEgOftPsM/k9dy8dpXWkufUiPwU93iXj9pzDaecZWqTXVk
 YdNnTuklzMpG7gHNl8bkxRpjKuVUDA==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fc14bd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=lH6b5Et66ViyYC0xzU8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164

On 10/24/2025 9:46 AM, Youssef Samir wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Expose sysfs files for each DBC representing the current state of that DBC.
> For example, sysfs for DBC ID 0 and accel minor number 0 looks like this,
> 
> /sys/class/accel/accel0/dbc0_state
> 
> Following are the states and their corresponding values,
> DBC_STATE_IDLE (0)
> DBC_STATE_ASSIGNED (1)
> DBC_STATE_BEFORE_SHUTDOWN (2)
> DBC_STATE_AFTER_SHUTDOWN (3)
> DBC_STATE_BEFORE_POWER_UP (4)
> DBC_STATE_AFTER_POWER_UP (5)
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

wrt snprintf->scnprintf change - this feels like a hack around the gcc
check and not addressing the warning (i.e. check the return value of
s(c)nprintf).

While still hacky it seems like all that's needed to avoid the warning is
to have the return value written to a variable rather than just dropped.
If the value is being saved we might as well check it, especially if
userspace is expecting the full explicit name of the sysfs node. Nevermind
that the value should never be more than 16, if it's truncating something
is very wrong.

I could have missed if this is the Standard Way of resolving this warning,
but this didn't seem right.

-Carl V.

