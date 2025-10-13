Return-Path: <linux-arm-msm+bounces-76945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AC7BD20AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F2554E4BC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 08:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E822F28EE;
	Mon, 13 Oct 2025 08:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IfHjLIZR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D992C11E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760343978; cv=none; b=aap842d5fnjw9AWqHZOMOzuOskQlQJM3UVGF1mJdpN5AleNxWNppwxIECwCGXJ2c4qL4MnQKEB5BhLgQN3HtyOSOy8BwNdZXi7nRCZFTS02YGZK9PtHXGFWRIbAoW3Fg3357WLTSynNJqb2EqpwfV1GJSQZTP5U33/wRG6U69A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760343978; c=relaxed/simple;
	bh=HEat7AkewEQ3u7PqhtZ4WEa9dj4GOCyAnBkiPOW5mTA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YdNsvluliq0g+tcrv4zBU/rMi0YeU//S+CaN4Wa3M6fRdS+ybLREWdabW3/3W7XsVvhlfFuQI5oK6Vj7kU9sutIM0xyWWE9L2IheKNvQLPETIreYB3gons6VZ6wr8kKnF1q8mPW+dh3y725Ko5kwFtQgbTtyV/MmCVQpMIe5P9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IfHjLIZR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nJC0024739
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cX1C6BYRcl11MPbTFCuqbjie5JWw/JDuuQ80Dzz7xis=; b=IfHjLIZRQpLCK2/E
	bC9cw+hQ/OgSc6zCB6qBxCd5C0iDyduHmL2xVyfCKuMtmgl5Nf1pFz05ZSX14SRr
	gBq4wUfNVs7U90wYEhyXZ/0Xc385R2oPE1NX2ZQHr36bGinDPUCXLYjU522SiMEC
	5rkp9M9urh80zrUELxSE5gBp6twAxx1KGB2Rw6wJFKuhOzvwYlyRaZjydLEvbqYF
	58H04Yy0qliiIEsWoJvAcuzYT7EPQic8YpUxjFgHuNeTTYVj1VUpy6ot25Shg+Mi
	XBDijqPncfy4vcTg7ssLJowEiwR8IBaO6+d4un9r+v4qyM6EgTr/QD1+FzrmVvqg
	HBRMYQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa83vb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:26:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ee157b9c9so7689770a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 01:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760343918; x=1760948718;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cX1C6BYRcl11MPbTFCuqbjie5JWw/JDuuQ80Dzz7xis=;
        b=S18hvRM0EpP7A97JLmONOMthLMGDEgC8dHzfRaIy+Pp02+8ebNfSIxsp7hVWbol5bF
         lO97WmZs1EVTrFd+fhbURk56c36/1AHr3/jQ76TlKGh/lnwV9aWBtybjuQ5cXlifLg9W
         ZQHMmPJHHx8BB043mby+RDlBBYZMVilEUgUeEmR8s3QFGndZcQbjmq7NS8h+vLIyrp2V
         nVCBj5+oU356DRpGI8vjoLag707LEUdAEoCm9Cnd6yUoJD2uIRnxcwZSmn4hqLNrUxID
         CdfYmSPkMH3+BKvqmpAE9kDZ08Ti7YbvXfX47CjU+y3dBWYXnYXB/G63cZr0DikR/CQA
         f38A==
X-Forwarded-Encrypted: i=1; AJvYcCWm5GYTz03DR0jAid+ayrtzu5O6WT/r0WpVbpm2qadEmzr/rY7T9t7L8Vk9j+N4NXAUp/i16s2bXk6z82dB@vger.kernel.org
X-Gm-Message-State: AOJu0YyF3dLi0iSIuQeH4dspT4gfqiYG7v7sPjq88xxqOhGFcYK5Wh3Z
	wuiT0EwiYNwgsae/VwY8QDHLf6l1bJTUMGM4B2GW0j/dBweRnFYP+qe+bsyt9FlASSGGqt4FBDW
	wlelIYQArtRqiM5QF21eiPZm1IwG2nGCJGLClS7sLJuc1EBFyDxmFMMR2UIwtqH/78nkJ
X-Gm-Gg: ASbGnctS/nBjwsT+RJIcVSkVpRiT+B6nbN1RATvwMR2fqdiK1XzVXmkmABNPjlCoW0R
	zkY095sVsqe6TaQshaQkbyQvu4bBKEm0sGhrEt4e46cdPoPekk77qwPSOBwb5qkNXQ7cnsOCyX+
	DANninRY+vCHxtSSuIkV7Bc5a6c0iHmp3+SlJqIaJEGI5IswUpUeIN2ZTQlLYWool7RDQXI4Xyj
	gktxnFLrHu/HDCd7p/y6MDAQQQ39oH2xOf5XUtcpqVatvcbJQbHOGTeXc9NMzmgd28lARqbivLk
	B69epYA2MRzjGj4tfNus8NeYAPlrZ7WpDU+MwCnTVqKAo4gc0icB3DsrB/ggEzjrilxh4yQAlWg
	PGkso1bSSKuvMrf5hUSsKLtjKpOQRWg==
X-Received: by 2002:a17:90b:4a0b:b0:330:6f16:c4e0 with SMTP id 98e67ed59e1d1-33b5116a4b1mr29857501a91.12.1760343918352;
        Mon, 13 Oct 2025 01:25:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrkOMOMk67rmSiVsR6dlFd09MdgUDcMj+0J/ZFBTdTAe+wDZFQkg9mfmItRqpsDRlhZVXYqA==
X-Received: by 2002:a17:90b:4a0b:b0:330:6f16:c4e0 with SMTP id 98e67ed59e1d1-33b5116a4b1mr29857469a91.12.1760343917891;
        Mon, 13 Oct 2025 01:25:17 -0700 (PDT)
Received: from [10.133.33.133] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a3cbf2sm11436365a91.8.2025.10.13.01.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 01:25:17 -0700 (PDT)
Message-ID: <99de75a9-cb2d-48e0-8a8a-c8345fbdf989@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:25:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] add sysfs nodes to configure TPDA's registers
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mike Leach <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
 <49bf23dc-705e-45ab-a2e3-fbb798cd8e34@linaro.org>
 <77342c70-3b75-4ccb-ae3a-c0418511a33e@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <77342c70-3b75-4ccb-ae3a-c0418511a33e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: q2i3jwxVeIfovhpgDQ0kUOYgcvr_bn0q
X-Proofpoint-ORIG-GUID: q2i3jwxVeIfovhpgDQ0kUOYgcvr_bn0q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX+DXHNijeRZLl
 hp3D9tuFKPuPBsiZ2/oKwu1mI+DbbDOuI7n3fEvOywMBEdVCc6wQWk+5Z9r1VN8dbNumNNha/Lv
 vGZ9QbgkvWgsAzG3cWzpOfpd9Bb5p+s5juL9G3ZXYYvzXz93eZ3BJIC3AsohOYguiV8Zl1nxKeJ
 EefzsTAlF7gTj/xMNp9hupRVijrpbnte5pbP2Gel6ljWAwMTdIoaVGvP6SDIS+DdcypHbeBTF9u
 bNI5aedmedn2pbS3K78xozkkqGon+6GkA98qhOUdqMCf5NJhyPHyk6mO93J4QtF5NGWEvDli70p
 i3nTbmwWRTPaUuzJygGEs/RN4PqeTzI3ONc32i4AeNq6JEfq8h0ttZdTFagTUJQ8SRNLeMcoUH8
 hUIXxMVTtrieBKQAJi5kZZb1xggf4g==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ecb7a6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=otdSkCFsg5a9Z_Vg604A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017



On 9/15/2025 10:12 AM, Jie Gan wrote:
> 
> 
> On 8/27/2025 7:59 PM, James Clark wrote:
>>
>>
>> On 27/08/2025 11:55 am, Jie Gan wrote:
>>> Patchset 1 introduces configuration of the cross-trigger registers with
>>> appropriate values to enable proper generation of cross-trigger packets.
>>>
>>> Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
>>> which determines the frequency of ASYNC packet generation. These packets
>>> assist userspace tools in accurately identifying each valid packet.
>>>
>>> Patchset 3 introduces a sysfs node to initiate a flush request for the
>>> specific port, forcing the data to synchronize and be transmitted to the
>>> sink device.
>>>
>>> Changes in V3:
>>> 1. Optimizing codes according to James's comment.
>>> Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1- 
>>> jie.gan@oss.qualcomm.com/
>>>
>>> Changes in V2:
>>> 1. Refactoring the code based on James's comment for optimization.
>>> Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1- 
>>> jie.gan@oss.qualcomm.com/
>>>
>>> Tao Zhang (3):
>>>    coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
>>>    coresight: tpda: add logic to configure TPDA_SYNCR register
>>>    coresight: tpda: add sysfs node to flush specific port
>>>
>>>   .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 278 ++++++++++++++++++
>>>   drivers/hwtracing/coresight/coresight-tpda.h  |  33 ++-
>>>   3 files changed, 360 insertions(+), 1 deletion(-)
>>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight- 
>>> devices-tpda
>>>
>>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>>
> 
> Gentle ping.

Hi Suzuki,

James has reviewed the patch series. May I know whether you have any 
comments about the patch series before get applied?

Thanks,
Jie

> 
> 


