Return-Path: <linux-arm-msm+bounces-114840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CuE2LyQEQmrRygkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:35:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F73B6D60F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:35:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KNmSRr8j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MXRDL7VU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114840-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114840-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C4E83013723
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C04346AFB;
	Mon, 29 Jun 2026 05:35:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4D340D594
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:35:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782711328; cv=none; b=fhFKZanTOTTh43ponazZVRKSoGiXexX5kN3/FHylF57u8xzeqKTEcXM9KyxmsLQCdRUhoB9pkzfB/JY9jO7fTMBfCTuF0j4B657R1M/BKXeIERrB0Uow0EPjknt664S4vcwcXGtj1lE9rtYHSwRry443ucq/9P3m9MltYUD0e+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782711328; c=relaxed/simple;
	bh=PxaZIWbiRfKq/pjVX+fFLjPVwm6NqZ+lpXwCPgCITwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rGeXTCh/SnusccOS9vsXD6MaQIz8QOs2pCIh4T69r8QVecYk0de9sWXw3LEdJ7avE7FKh7KH3FJcUJVnkmIlfrWEJJX3yM48NXuZdBJt4NCnGf6+S5OrjKJifOnZlwLTpjr3Imv0MYBRBMvYaR0jnv2Vkc6dRHdSwIIxk1BsoNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNmSRr8j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXRDL7VU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHPQ1771453
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1lNe0N0L5HORX8OGtk2WAQHROy/AL8D/HxbtZeZ3jI=; b=KNmSRr8jY3dvNKh3
	QchGfbWF8eYecE1ett6kxRFC87AZgyrSSM7IKlUNLDzVGdIAkeqhHwl6zq4V6qEb
	X/EdM1i0wfE1vLdNlBfnYS8RcRUMradtuhGiFZjhOvCwsa+gMQHuXqMfBmMaC0w+
	aBhbq2m1OpWhe4Gu0X6iLRNMgZpAqrUMDYllsDm8zsO61QCUlnZ4R/ly+iBO+lmG
	DFZJlbExf0Yd0fd69hT1syZEd/pA6Oxl3Nc4isJXKQx7FVcY7dloHvhMAIN4ji4b
	EAJH0rJonnIuuSHUrpwZ1b7L9Xr6pwZdLl/DkCtAliDYfvOhGrJdPj4yUdh17gC1
	Ig51aw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tumm7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:35:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37c9127e316so1874368a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782711323; x=1783316123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G1lNe0N0L5HORX8OGtk2WAQHROy/AL8D/HxbtZeZ3jI=;
        b=MXRDL7VUn0zW2sXv/IWJCmmDIhhwZcHReVoJVm5bALWcvv3JvS3gK9BtPg0BsVq/9G
         CGwEV8QFuXfKL/EKglTR5wo5JJdgFh/CX9aK6CqawHYrZ8QYOEIKoKJ5GnSqGMa/v+mh
         0PPQnUeuRPGsagLhfYu8iUh3xd3HPrleSjkj0zjCnu99x4bSQOVw85vcMiwu5er/sMGl
         cbYnFDuDQM+uFSbKfMjzKQ067TPrnKFxwwussjy3e9uMglLcrCDt41LQZV9kLHESWxwd
         i486rWgdBoqiBUBX59uzOoRk60s5z7gAs67ngNh1tMR8v8lCTB+QroClJtEB+ESKSc/V
         gGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782711323; x=1783316123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1lNe0N0L5HORX8OGtk2WAQHROy/AL8D/HxbtZeZ3jI=;
        b=YdoSlzIVXTkolwK10hDftus7mk6m4hqx0jJqTIjevZ3EV5pEhlDay2v4uXXOn2TTA5
         KpX9AqFAVoGb4dJgwa5VXEgvh3NRiUMxxqYb/l+w4pZ/C+GOrSw4hfrwkvhOhq0YaB6x
         +j1Z4avC+rUZ/QOYhPros9B7tuKyfFWp+w0cF2dai8fOIn3zXntDVEAFsSlb1NPhp9T3
         sYl3yAp1I6hXUvdD+lsGETmh1mAJy+4fANNZvnxkGfJrvVlKc9MJUcy/Y7+2gpNwzg6K
         9FlKIpx+Fwfa7cXd/BzeslfRlbLJVvPQY8LAvnaAubqA8TyfS2fxECS39tG8kHEv4MHa
         1lxA==
X-Forwarded-Encrypted: i=1; AHgh+RrZy8EAftHjompbNJm9Sp7BwNASveECiIrL2ey/yzP89hyrcPmcAOjxM8neFAs9MEXOFTFHe44AIf39BmFn@vger.kernel.org
X-Gm-Message-State: AOJu0YwoQzuKYBXNZ7YBc/E/IfAb/iUOz3iEebJpXw3YAsj5ovFrM+Ul
	i2wl70g1ILcnnC1en2sq1qfH3HXyeRTcFrQxqo6TbxSMrnZCXpa2ovddI2wpoDWK/4x6IjyQlvm
	i0u87EKPnIp3cfyqODXA0R7n5BWEPoK1/gnH7DXvb6GOS0oYEfd9KbCENgUAH/6RCqy9f
X-Gm-Gg: AfdE7cley1xv5ye5YpZlgcfbdhhlWoz3xCrqphvUAnyKOvWjLH6hqiZpeiuivjqQfqo
	QCOZ2wfEJAkKo1+wH9/qqhRk0tBfulwOgBHBTcEsI4Ld+7h3bDbMu7gnbRc7L2SR2y9VI3p21p5
	Vk0iKE0sFENkX518fL/JZCSn9NWO4mw2SI1VuJhQLJlx8gZMihXTJ+A1Paf5d1r8Zii4FsYr9cy
	nmCEGT+LuOBOhLMmcU5MpNhF8rY1TFfnGUonn3MPQ8Vsj9pW2Nrsq5KvMsV+Xqs+JdEiYPOCEwR
	04vSrPnCSszYaIXssL+CpMaXH7onUSCpiuB/FTZIvbgnmCDB7xfhD61lSuVTzRlIk13vOXlZJlS
	PTFocQbD/ca5FNF/2Zy8zQ5dfFCyr2CudndaUHYzSEXTaf3bHTg==
X-Received: by 2002:a17:90b:514f:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-37fbfa21cfemr5617335a91.8.1782711322913;
        Sun, 28 Jun 2026 22:35:22 -0700 (PDT)
X-Received: by 2002:a17:90b:514f:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-37fbfa21cfemr5617321a91.8.1782711322477;
        Sun, 28 Jun 2026 22:35:22 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9d8bf1f07sm25282945ad.69.2026.06.28.22.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:35:22 -0700 (PDT)
Message-ID: <159fe00a-f259-400c-b1e9-7963330bf9f3@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:05:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] arm64: defconfig: Enable Qualcomm QAIF and
 WSA885X-I2C drivers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-9-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260622-analytic-pigeon-of-force-bd53c6@quoll>
 <ebb1c3c7-87ff-4683-bcbd-c088226fc74b@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <ebb1c3c7-87ff-4683-bcbd-c088226fc74b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rtHdnxQJk0ppOk6s3XAT78mL0niU1IX7
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a42041b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=1-yt-TcySLUHAD0pDGUA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: rtHdnxQJk0ppOk6s3XAT78mL0niU1IX7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfX6dLro0OFKinT
 I6S7rGy1vDZy2p2DjQ5rotyYYY1067JCtyuvNPMvUWX+4/7G4uKW010oZoE8YM2Tx69Q7UgACGj
 GHaDWs5qf1Wn2cUhkMnocB3FkF9wzmfcdgNC60Fdrd4guCJaey9cYp/V+OCdrgl7s57lcFVGuKG
 Wb4JXRMKGOvwVLXqGv2MrX52kGeP3FWIM9hWqEfmVRp6kn29NEGdHgDqgep0vjJya/2MRbYsji5
 qC46xGOv1zCm14BK64nNkqh9E8Tp6kTM8A13/KlubY4GDCedYwYTZjUzfQKSgGefPq415MxJcJ8
 oqGdwlre++dKVhxtXzGGumX8fFtttqndM7NKdLDEhlGtrTZpTQ9cB18r4C7W5sWfoqhDdNf4Xu8
 OpKmWZY0GhnyKjsJMm1bAyVlXJf4gWPgsaGZqKEuWlHEcYC2CRuS7uNcxHeKLnbr0PxZgAx8qRW
 1MookRCFaKefv2cwBEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfX/3iuNSdDgTlz
 WO54peESgHV3vET0+jPq0aTfuKiGKXDUh+16pqlpKlVSmTXstRj90J8iiKpQpDEgZLvkFwPIBf3
 qWTz0PFop0yIjoYHbBnCgJwLDmisOxA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114840-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F73B6D60F7



On 6/22/2026 6:49 PM, Krzysztof Kozlowski wrote:
> On 22/06/2026 15:18, Krzysztof Kozlowski wrote:
>> On Wed, Jun 17, 2026 at 01:43:15AM +0530, Mohammad Rafi Shaik wrote:
>>> Enable the QAIF CPU DAI and WSA885X I2C codec as modules in
>>> arm64 defconfig.
>>>
>>> These options are required to exercise the Shikra EVK
>>
>> Qualcomm Shikra EVK, but anyway the problem is that:
>> 	git grep -i "Shikra EVK"
>> gives me zero results.
>>
>> I already commented about this for some other patches.
>>
> 
> And SND_SOC_WSA885X_I2C also does not exist in next-20260619.
> 

ACK,

Thanks for the feedback,

will wait till WSA885X driver got Approved.

Best Regards,
Rafi.

> Best regards,
> Krzysztof


