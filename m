Return-Path: <linux-arm-msm+bounces-77647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A747BBE5A29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 00:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 680774E018F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 22:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D6B2E6106;
	Thu, 16 Oct 2025 22:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IH0iahE7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8182D9EC9
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 22:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760652226; cv=none; b=i/wb7diEPH6+r6hRrY/9rk2u7OYeYQt2WES5NjlApVDhQjGPen57mBcEOGtJpBEcaWb56Br8XzxHJrjifR46EiyM80Cq5AIHvaUIxRETnI67uDH0yUnLgCs1uKQuZFCgZGzOZGdjFgJz2zhBUi4WamphrabgcMx678u54/ZJfcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760652226; c=relaxed/simple;
	bh=REPaXfEEwHSvCPYQv1YOGPYDOJ36+iQWTap+y51gNTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gt85vaejFh/Bn0IhrUjOEOR5/4GH0XA5gC5xuCdTuvrlagIVzC9SFJ3mF3NEcoSh2lVkLwoRNCUCKcpZw/0jT8G8fLvMnHC30WSWrCRjRov3479SkfWk2Z5CS1eyo7tpE9ESDoMwMpf+KnPnMM2jYQ4vUHFHuExHKyu8Ec98y+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IH0iahE7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLNPG001706
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 22:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hy4oakQHnBC57FbFZ/RDt9wr7jDjpQ0QoQIdKdfku5U=; b=IH0iahE7zd2RU9FH
	JXT25DKQ7oALJmhqpYYPRCgzdpYiII/8oI5R13Pmh0CwELM8OgWJTiPmuB/nRdTr
	mzndNtjqiZN4Qv6J35QAz+fKkjwazsct5nOm/pQvYphZXvZWgapz2h1NpcHdS53r
	QzJTNFcIvT6TNuL/hL9wMbpR/pOR6rL4bKYlxzHQi+0L8PMrQ9m/roiEWqL0HpMj
	Fgff+auIbwHmEjeJnO/gPcjRThy2p7U1eyFW2KiYzDRKMmndZ4Y0sVupo+jOPZKs
	6nImmyVCwwSSGdTEFELP/Umlho13ihak7j8bycaXIAJYyr/EYnnjIC/ihgHEgDAc
	O9gCsA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd9a1re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 22:03:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b55443b4114so831294a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 15:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760652223; x=1761257023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy4oakQHnBC57FbFZ/RDt9wr7jDjpQ0QoQIdKdfku5U=;
        b=UA7S8ACOoYL+IQSyyJC5i0I2eleZ2Alimq7slPZE6sXcD5CKA2RdAGsxiT9Ez746o0
         hfJ+E80tUxIeDmG6xJYrlZFLILt0HGfFaisUEmwlTda4XhpXxCcMopa+8Ai3++fMmhKu
         njskt2fwrnJyxm3Tr4SIGzYHA9uMG+yJMYUXzoMATWEmVcHewhN8BViFp/UE+a9Vx2zF
         RrbFP+0wVhBnVAdrPrDU+vL2ZHoUvL1B2cpqmezOxfW8XAkgoDcKE/FVMrT8mQpVhm1b
         PC1V0uPR/HJSSPuyM4bwMcsbyYb7MGDi696aCslrMsm37bWCc6BsNnKFwQDSfQ6iZ/1v
         VCIA==
X-Forwarded-Encrypted: i=1; AJvYcCXst0ziNa1Y2f6il4h0QWB6cLCHbMLXgjbsA+B13xBLORaeUgxg9tRAowPfj6Ee3lvqxQNPk5EOwAonvRK9@vger.kernel.org
X-Gm-Message-State: AOJu0YwbO/i4x7QildWahpW/s2xJVzuVWou2XFmAi2A4t+ZLXr/5e46g
	RRO2AKeJANQPDix7QaZB1Y42iK/lNtnnOP2CI/wvkdQQR4usqf/Z+rtSDbL6Z06gR/72z62bWsB
	gXiLzzLJ47I0dMXjwLAIdJ1kpl5As+Sig+bCr44rcdBMTvmSBd67LR8Q9wrWcUNitdZFs
X-Gm-Gg: ASbGncthTheP2Zsp9OfT2HSPEbAbt4ry7glav38BoMRNm9Dx3hjFxK8QDYAAdQ4dsfw
	uDklNRSQ3rJn7WVGAly9tEBU/CcfUP67wwefRpI8Cr/Gs2Jppk+k1Bj7HHcNFCKd6v2sGfaqkrh
	uwRmgxlVSze1OSbguShb3/2AO3TOGoctuNQpAMr9c+iBf7J7Hz06dF3c7w92nQcOHR9UVNKn4va
	8fH/dpYX/HQEqdYlOdVL+eMLM1pd9iKwl0jlgub/TCY7oduFa2w+Bhz36+fJMihIfwwwLQGYB42
	xB/GqE1F3mX19LsHfDZN89+6cAF8m6Jxpg9ygJF8M9U4fIcjBmQ6nfweE58fLa6UaWxTkgrbMOs
	mIUQVpAV9lGa36dvmK4gjeJoi83P3BVf/99L0joAqMO+HqNQdzAXmpQ==
X-Received: by 2002:a17:902:e841:b0:290:c902:759 with SMTP id d9443c01a7336-290ccab6c0amr11702615ad.51.1760652223240;
        Thu, 16 Oct 2025 15:03:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdlNyditaaAKOFd3CyrSvZAeteR0a/ircCtUxjXi9qCn2mN27imlOzHsdxn+P/3lQNSL8XVg==
X-Received: by 2002:a17:902:e841:b0:290:c902:759 with SMTP id d9443c01a7336-290ccab6c0amr11702295ad.51.1760652222695;
        Thu, 16 Oct 2025 15:03:42 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909934b0b5sm41340775ad.38.2025.10.16.15.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 15:03:42 -0700 (PDT)
Message-ID: <1d300d0f-97c7-4538-9b14-4216f8762a1e@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 15:03:40 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] media: qcom: camss: csid: Add support for CSID
 1080
To: Bryan O'Donoghue <bod@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-5-f5745ba2dff9@oss.qualcomm.com>
 <5f0e081c-30f6-4ff9-b8d2-2af0d87efd23@kernel.org>
 <16def16e-fead-4d32-812c-5672773ef3bb@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <16def16e-fead-4d32-812c-5672773ef3bb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: c-NRLTtrCrgcUpTEkOrJy5xdLv554UQo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXyVly0AyKouVb
 /aVhrJjNPWMlzLYEYCYYiaSeM9GF7w6eVt23Fs+jRfdI6SPhOCVVfifK36gshNPCGBYKLHZpkot
 mmXqiJsG2V1ZLSDbaBMhD/9JvPyU8XpJ5Vkh9YLrcC/HhiPr/62Cglnxl+aOsfQmGNdJ0w7wd3+
 FvybQNIdP/dgX3OlE7ghzg7uGWhgcB8US5kMN3domx3ZkFVWtuhVRMnf6yHOgZmh5azEJCQZIsz
 jmRrI1lQjIdMs4z1GSAz5TJVQS7yuaD9da+mEczUWdNCslPPavOQzfW9iZMe2/laVUPdqfzCYe+
 4GVglaYge1HWSGnTQ/JGbyidvpP73rmv/5aYqHUFaCqSpm/ZNo+YC5T82mMJMqHht/+p05xTfOx
 /OYmmOLR4hF6lFw1F/prs+1TdCGodg==
X-Proofpoint-GUID: c-NRLTtrCrgcUpTEkOrJy5xdLv554UQo
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68f16bc0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=_bdMYa0xl-006hGExtMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018


On 10/16/2025 3:18 AM, Bryan O'Donoghue wrote:
> On 16/10/2025 11:04, Bryan O'Donoghue wrote:
>> drivers/media/platform/qcom/camss/camss-csid-gen3.c: csid- 
>>  >reg_update &= ~CSID_RUP_AUP_RDI(port_id);
>> drivers/media/platform/qcom/camss/camss-csid-gen3.c: csid- 
>>  >reg_update |= CSID_RUP_AUP_RDI(port_id);
>>
>> and this in your code
>>
>>
>> λ ~/Development/qualcomm/qlt-kernel/ linux-stable/master-reviews- 
>> oct15-25* grep aup_update drivers/media/platform/qcom/camss/*
>>
>> drivers/media/platform/qcom/camss/camss-csid-1080.c:static void 
>> __csid_aup_update(struct csid_device *csid, int port_id)
>> drivers/media/platform/qcom/camss/camss-csid-1080.c: csid->aup_update 
>> |= AUP_RDIN << port_id;
>
> And now that I see the code side-by-side - also please use the 
> established macros and/or write a new macro to follow the established 
> pattern.
>
> There's virtually no good argument to replicate a bit shift or twiddle 
> - that can be functionally decomposed and encapsulated in one place 
> and subsequently reused.
>
> ---
> bod
>
Hi @Bryan, sure. Both are essentially shift + twiddle, just that in this 
patch, both are happening in one place. Where as in gen3, the shift is 
happening inside the macro. The other difference is that on Kaanapali, 
RUP and AUP update registers are separated and hence need to be handled 
separately. But I understand your point about the consistency. We will 
modify the 1080 macros to be consistent with gen3. OR we can add two 
macros commonly in csid.h that takes both the base bit (RDI0) offset 
within those registers and also the port ID to return a value with the 
bit set, just that gen3 file will have to call them separately from 
within "csid_subdev_reg_update". Please let us know if you would like 
this. Thanks.

