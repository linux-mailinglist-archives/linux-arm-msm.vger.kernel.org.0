Return-Path: <linux-arm-msm+bounces-66107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6DAB0DEB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19A121889E05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988282EA748;
	Tue, 22 Jul 2025 14:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lj7T5EAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0874628C5D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753194586; cv=none; b=SlrQ4PfBpcnPMrXb7U2jc+w1lwrhoSAOJIjHkqEH9faqsKHL4gQvhwLRlWU8vfkZ6LCKHVek1iLiyVILZpWh/J9rSsyDrUF2zgNDEOnx8lthKO7vtLDEQfVQhk76zFYPQaY3dj+Alf8JZv0Pi6vrtFxu7iy9LQPgaZnGIGRX+ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753194586; c=relaxed/simple;
	bh=6h7M2j7iYVmxSttxjJYuI3hDLp/c/0UAguzQiPIXY0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wq1V47ho8egyCiHijcAXU5b3OWh7ucJQVcfzfRXgNXSBoBRbKExSCVzOKZvvfHEPatFSiOTFb/Le9xXqy5d1p1+mGtN0aHQGnY9Im4ja4xmh3zDaScKWWogm+tvreddob8RFOZsv9dIFCBjQ7VXeqZcZ/982iGCe6crjTIUixEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lj7T5EAb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M6vlxQ020539
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FzPhboyOjslZUt0VHvhF43FfMzKfZPvUsmiSEH6qne4=; b=lj7T5EAbtTYnJ8lY
	OcKfaaqAg1a6mhmvAKblH2UwnOecvy6XcsyK8vx1sJicghiCPEFeka2t6KcMb7zt
	cW0ldg00qmlbhIhnPo0ZPyx0mbCqy2czHksmu73Fxx0EfKOXQaQSA91SQscKhZQL
	qVvAk/bxSc2bSbeZ4lymUddmDZN2N6AcewFEDH5/dlU6ieBtUtNpLJki+TIcJb9P
	iifHurbGqqXf2WjwNXqDQye0Cv6qiTAbC2B5PNTWb3deRrJiELLygWUs2W4n/bus
	q31XA+ml2lWgco7As21db/2SXhBxpWMsEnSNE2/r9ToqDIa32gAlIREzyN3DOzzA
	9vk63w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na04ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:29:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234906c5e29so63774275ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753194583; x=1753799383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzPhboyOjslZUt0VHvhF43FfMzKfZPvUsmiSEH6qne4=;
        b=GuqYFavedB6h+L+RtNtdw6ON4FJ5eYnalaakGIgtyOB2ozXmUoIhCRsc6MEogkNfdm
         nplXBB0EaxY3jfaDh8/L/x0VQnn/60CD4HRCp1jm0qhmWQxtLDUh3NBmrGtcDhq86MQb
         e295lu+oy7ksQzWX/3ZtnYJWOxc2yQF7U/geqDEJqXxMcBoKd/nvs3aZIRiuzZass4W5
         wVO86iltTgXCazklO8FSMB+73guwNjcmpq6qKyg9lT8LMV9oPVPSdG2pToJ1ucwQZqrG
         SFx2weUk9gajcc9molMhhOkqa3EmOE8YU0kelBFvOxGvjk+AQ2+OQAsxTw53maZe9pOD
         G86A==
X-Gm-Message-State: AOJu0Yy2TwE7Njfpt3q4reg9I1s5YGxCN9vAZxC+hC7RXY9gvkswHQj2
	1q8mUWOOFym8CAP9kwwma7bp18MjOKlk5pSEiRVg/E3Jiz6A1KKJLaKLTwbi2bf+jcsOpIU23mz
	NuHobO0mXLLAfMMENAOLPZrzlBodNF5PneUq4KqCtCfgXeo4oU49zaH6IxiN/9TuNqGt7Lf7gPW
	9c
X-Gm-Gg: ASbGnctCb489rlD3wP7w04nh7QajsdMxDkjw2bmT+RHKK65jKOJzf7BZXnYRW/IP7Kz
	7rDWw2Q6kK6bSwq/6KVa933hVzJ++wM24oHxhhfBXQxxSqgtRDKWF4Pg8rhgiw8dY52c55vMmDd
	BCkGB5UNWJ1qxxvTFdGTTy3HzqFhogfMxkbsKS3v7qG1PCWTEjG9v/Z33IDRcE9k85YPRqhVWFC
	T6T+oQqWW+gO4fFbikXtwKoxRSZp/6ORv57E24Llvl0XVhd1mYGAkX/QhdyB2BKDHo4vcKMh5SR
	MZcVKPr7wKBQTEzVnDVvRSBE23lTZ3ekLVfMyMFsXwofcY3r1nSem0aEI86qJgn1viVHiO1HqjC
	RwzA4kdLYdU0qgg==
X-Received: by 2002:a17:902:f785:b0:235:a9b:21e0 with SMTP id d9443c01a7336-23e255200a6mr393318755ad.0.1753194582952;
        Tue, 22 Jul 2025 07:29:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2b7G6eNgC1oxJdeC6LGJ0xVz+a9PdxklFhiJXvaqJNZPCy6ZWWTPLxxcWZx3Opj/2cSX2/g==
X-Received: by 2002:a17:902:f785:b0:235:a9b:21e0 with SMTP id d9443c01a7336-23e255200a6mr393318415ad.0.1753194582490;
        Tue, 22 Jul 2025 07:29:42 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b4adeb8sm78707285ad.0.2025.07.22.07.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 07:29:42 -0700 (PDT)
Message-ID: <67824fb5-a7b4-4635-a2f3-43929a35f1c5@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 08:29:41 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update email address for Carl Vanderlip
To: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250721220811.962509-1-carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250721220811.962509-1-carl.vanderlip@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1W7-NnoacGM3ZsHKfFciqprTz8zZQATE
X-Proofpoint-ORIG-GUID: 1W7-NnoacGM3ZsHKfFciqprTz8zZQATE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMCBTYWx0ZWRfXyLQAokFqZI2X
 65goaPWOlxZTI2Vxxu5FHhQ1k2NbQ2xFLMYwwKSOCFLLY7+4oRImEQuRdsIQT9YTletgWnj52kX
 lIAR38YmjvDUYq8JusqwQC/UyEmndnkk54RcCCC0hhFlhn4ARWQrqeZfycALT1nPeIY4AHEh/6q
 EFNeHy/fu9CJIHGYnr0ivyIgbt34ROShrR+4bpG/hTjdRalmhLXukAasHfgJw7764SNTL2LNlSU
 S1W+dk/5t3cZoz13TnU66454mxMgtavDKzTIjfJzahZAooqxxigX+axK0p+LXx2rkoM2ZySRp35
 65RyNwenob6Cv5EjH6WkQuQH8CIV3nOt8LZdr9PVV6OXiqBpk5UlxIimyDVF2+g/u1hK3ST4MMa
 tCHRN5JIXDbbfyxwSFdPsDMb796VHDgPdX7esVUHs0nO98Ie3sGMcZj7b4hZTEMhk4+BHmtV
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687fa058 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=XHUaY7U8O4OWe9Nk0CgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=487
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220120

On 7/21/2025 4:08 PM, Carl Vanderlip wrote:
> Qualcomm is changing open source email address policy.
> LKML and other busy mailing lists use the oss.qualcomm.com domain.
> 
> Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

