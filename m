Return-Path: <linux-arm-msm+bounces-90376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLYyLGvAc2mjyQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:39:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B8679B66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 264123013862
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 18:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D2823AB98;
	Fri, 23 Jan 2026 18:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFg5oP5U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPCPrdAV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C893EBF36
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 18:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769193576; cv=none; b=JDRqTJddrMFNZ2N2ieE/C6o7DKNyiQI0L+vYP1tkcxoQubYAqtGL1AyBhukOxCASsGpam7im5ejt1lXB1p3rjhK8P7mMvdWbDmUj3b9UIwVB1x1oo0ZVRsC57uC0G6lB2y1Dqi/CoKAaaTfM5cGGCot7TbbvnuBpmVCiqg8vsKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769193576; c=relaxed/simple;
	bh=dWUSDx6yQpSmxocokAXVUSl6a4+Sm1JcgGV5Yp41fag=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=BZsgadcLbtxRgc/vivWcHHiBE9xe/T2Nt7uwh1s/adhCkn593Dxv/7h3ik1dmOEveZyFfOIN5LHJDenX5AcEEYobUD/nttvPa1DeE0AiUK2qjpWchgmzFfLhCIahuytfbeinuwtBnw9vV6jwxnhceZL8jNf8CXnqJB4/tCs1GoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFg5oP5U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPCPrdAV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NBlqMX3656026
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 18:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lA5GnhOpz8Pt4vFmJAqiP24gAHIYFFppamhnY2ROAQ=; b=jFg5oP5U6UDsh5Z0
	Xv8cN6Ca0I+er40gTdFvB/kNcKqXEbIO7/HvrDn4Jd2xQG+QI7uzcz9lq7zwk7Rs
	TzQBXu3RNSvb7+Q+tmRDYeM265OgLyt3HSScLaSevk0TQY4svqbMsw42yM6bVQi1
	2EPkwNuG0BC9KcOAHw77JBtgy/gd3hJ4XOsfFj9TDkINNuCJ5rHWXiAFAY3CoCaL
	VWsPtzceS6tt/hRIdh3OXRtkSlom9Eldb0NPTbM4S2/XjGFtehTPJoGBv0v+91WJ
	NMBxDUcwG+DS52y+KmJ9Xy9vftMbbXx909umDk0blJ6/eJ1LJe/YrAlLjWaOTb2N
	VBw17Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv2hwancd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 18:39:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b71eb3563bso291778eec.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 10:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769193572; x=1769798372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lA5GnhOpz8Pt4vFmJAqiP24gAHIYFFppamhnY2ROAQ=;
        b=aPCPrdAVABH62hXZwOM6YymeJNQyMqkX21y95Ftd15bEtjehqddA61Nvrsho5hCc1l
         wFddR186KAV15VZnTKDYXYJlhZdMk1LIxtN4Z6Xi3iHXNQ7DDLEKC77QO4ekMYUJ0SxU
         niwPH7PNJ9DLvEBXlsazT0Krk1HNTpG8MfL2gtZFbEPkjBDfnSLHh8HFr86dHsBMB9FH
         Jqn7bxtcMQaGHhwZez2lDa08F+pxvS3P1OO+f+dNu3FYMDoraSRjI9qq9fkKFu64Skhl
         q7BcCkfp+U1GgpXpEvHgrYx65QOyePQ0nVu7s/0OFWct2M/M/a1bPMJ0nhbERWzLX0J5
         B9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769193572; x=1769798372;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lA5GnhOpz8Pt4vFmJAqiP24gAHIYFFppamhnY2ROAQ=;
        b=uAx3WhmrfMCJe3Z5mCJaQGRA1BLW0lQgWVJA8ZlKexA1BowdbC30EhMiWpbuz0L3Jr
         KBD99tQrxQavtUXjCbApoAUD0UFRGIYWoB6Jr8Hu6ktOMWqf/7d2VV70mBQoeZOHDHz0
         mSCHwCz1zNSysjNkcoA4G0rpLjOhJJT0C2ee3rpxbGGPdUmxdbEubGXx4XtcGqFdNw6x
         LkW+FEkW/OSV5V34m67mmokyo9tRVxtyfqscGh0xXGmdfJNKzWKXRHOxnbLh2otY3YNQ
         kzEBMv17Ll6H4uOh5BwHOAmBH874mvSeiVO48tV/e7cQMc+Yzidqr+0BTkNdpRX40vcq
         49Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWaSGAE5VoMz9WxDgeyKUT4XW+W6FoG6Tt2jKVuObdyHeLvECioelDNMvaMmGEOEMS8NOXqh2QAjs0tfYNB@vger.kernel.org
X-Gm-Message-State: AOJu0YwMbpP4KEE3ix8+sbFvoJ4+HAEUf3OI04AN3IhPKEhcg6JL9vyW
	s71t0HMUG4ZTIyAFMT6vx21TMam2mGFAz/sV/istPwgNEZD5NhaWE8PXrg5iVQfADQK7uGtMtA7
	xi4WxcTylvcUdrAnFogji8pmGsQT43+XpokqfYxVIt/bxLBuAxBEm+nNr0CgrPjkEpmc5
X-Gm-Gg: AZuq6aJ6wk6SfVhI2EiyW2WBxH66rqi5oUG1PVxM0mnBZkrRe0vWcr9uPYTPD7ayueB
	5xrO9i2VCHM2qz0I6gs/UdJSkx/puBLIhH15lP3sG+68qdbNQsh24ccU51awphip87mirhJMpEs
	Avtl7hGiUUN8f7KR2v6FnlLhm9ZBEiHM5h7oFD7z/Fv4e7OhbTAwAbiarACYoJ+FksSkEMkBFY8
	3OSOxqJj5m9L9Th4jh063vGwUv5XsXLp+9vcg0kGEEyPDjr4SYrCY5LmQCa5kQ6TTDmfLlJ8t+r
	ZGB86crM3B06cfWjlgSUtWc5EkYHQFaFr4UdAhhG709ZdpYmoAZndNH92IQ2zdHcH7C/BnL3L1k
	/26e3S0VyYvjU5DNcTTt3te/tbWEzN/dW0o9840xFNfr1vDL+lmNHFt6OVC4BonQ64Z+vtQ==
X-Received: by 2002:a05:7022:987:b0:11a:344f:7a74 with SMTP id a92af1059eb24-1247dbff619mr905924c88.3.1769193572139;
        Fri, 23 Jan 2026 10:39:32 -0800 (PST)
X-Received: by 2002:a05:7022:987:b0:11a:344f:7a74 with SMTP id a92af1059eb24-1247dbff619mr905901c88.3.1769193569734;
        Fri, 23 Jan 2026 10:39:29 -0800 (PST)
Received: from [10.110.62.4] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa22707sm3974176eec.29.2026.01.23.10.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 10:39:29 -0800 (PST)
Message-ID: <99d6bc60-7f27-4221-83ba-b9bc14a9b3e2@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 10:39:28 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Implement Region of Interest(ROI) support.
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
 <abb850223d81708588c594cfeee9e0fdbc1193e8.camel@ndufresne.ca>
 <d7b2d31b-e643-43cb-8f16-9568944222d6@oss.qualcomm.com>
 <6b5746cd16edf589fca79e2e6f8cf7f706309815.camel@ndufresne.ca>
 <0232a3fc-8774-4540-a718-eddb1d89e6d2@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0232a3fc-8774-4540-a718-eddb1d89e6d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1hR4G3dYWE12TOeSpBudYD8v1eVRf1qo
X-Proofpoint-ORIG-GUID: 1hR4G3dYWE12TOeSpBudYD8v1eVRf1qo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDE0MCBTYWx0ZWRfX1DwI6vxwPJWk
 xelnotXyFrWF/jbOzNdhXMoATS1gyRebcFPOLnB6TQpfcFRj1XJLTCPW8WQK0bTG5nP9dYK/Mi0
 bqKxvZ63vvMZa/NDy5k4ZmoMqP/LzWfjvZXMAWiGmpX73QhXkf8yVEhBM3gSKBkqN0FIOWVUMKN
 qqhJ9OzIaTmH7pxV66kTpg2HIHgT8JyXtqI5kjsr4MK2wYseS0pyy6OVxdKBBHFnBsg2ww6N6d+
 HjfNRLF0gD7SnyUG7m5wpf2Ge5B3EDGp+oBRr3ocZGTqTLYHkUXOpDQ3t6PE52LK0t45h6VQh9i
 nC6hCFYl50usqkcbACcemGRCQqmMT3EI/CvCGA5pg4B6yjPZVr0a/fFrVR6AN91yGigGGq2UE8S
 WM9ZVpXZVYLFeylwhpYqcWnbe8z3O2BHe5iePXaHeQJQ6H7Mt9ORip08+3+Jc98n4ObfS9RUZUD
 EENJ9hjQD+hI0rxyOnA==
X-Authority-Analysis: v=2.4 cv=A4Rh/qWG c=1 sm=1 tr=0 ts=6973c065 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=zBYVM8QCAAAA:8 a=Dy9dXtnXAAAA:8 a=JsNoqYpyAAAA:8
 a=tf5jizbvQTEfMRR51aQA:9 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pqcTjcuDZwkA:10 a=1JuLLl_Xj_IA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=ArXkYGXkE6hBHcUMFODu:22 a=7b_YKI4FLZevj963FIVU:22
 a=2FlLF0J1BH4NsEBlSY-u:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230140
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vulkan.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90376-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[deepa.madivalara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 24B8679B66
X-Rspamd-Action: no action


On 1/15/2026 4:38 PM, Deepa Guthyappa Madivalara wrote:
>
> On 1/15/2026 5:42 AM, Nicolas Dufresne wrote:
>> Hi,
>>
>> Le mercredi 14 janvier 2026 à 14:14 -0800, Deepa Guthyappa Madivalara 
>> a écrit
>>
>>
>> [...]
>>
>>> Thanks for the quick comments.
>>> Qp map for can be too much data to be sent from user space to firmware
>>> via control per frame.
>>> Ex: Avc has mbsize as 16 and the max mbpf iris driver supports is 
>>> 8192x4352.
>>> This would mean 136kb of data (8bit Qp) needs to be transferred for 
>>> each
>>> frame in worst case.
>>> While are still evaluating Qp map option, due to firmware performance
>>> issues we are
>>> gravitating more towards rectangle ROI.
>>> I am not sure if we will need to support the Qp map in the future.
>> Have you read how this is implemented in Vulkan and D3D12 ? Please 
>> have a read:
>>
>> - Vulkan Video, see quantizationMapTexelSize [0]
>> - D3D, see QPMapRegionPixelsSize [1]
>>
>> [0] 
>> https://docs.vulkan.org/features/latest/features/proposals/VK_KHR_video_encode_quantization_map.html
>> [1] 
>> https://microsoft.github.io/DirectX-Specs/d3d/D3D12_Video_Encoding_Texture_QPMap_DirtyMap_MotionVectors.html
>>
>> Note that D3D also support dirty regions (what you call ROI in this 
>> proposal),
>> with no limits, since these are translated into map by drivers (its a 
>> software
>> feature on top) and motion search hints, that one seems rare.
>>
>> I'm not against having ROI in our API, its common in older chips 
>> designs, but
>> its clearly going away in the long run since most fixed hardware 
>> impose very low
>> region count, which is not usable for modern application. ROI it 
>> trivial to
>> implement on top of QP maps.
>>
>> A typical use case for that is to use lightweight AI or traditional 
>> CV to locate
>> most relevant portion of a video. The result is more like a heat map, 
>> not a set
>> of rectangles. Then we roughly map that in a low granularity QPMap 
>> before
>> encoding. This allow maintaining very low bandwidth, while preserving 
>> the
>> information needed for the heavier processing in the cloud. I'm 
>> including one of
>> the many example of that, this is a talk from Spiideo [2].
>>
>> [2] 
>> https://gstconf.ubicast.tv/videos/region-based-compression-in-gstreamer/
>>
>>
>> regards,
>> Nicolas
> Thank you for the detailed information. I reviewed the documentation
> and agree with your assessment. I am following up with my team to 
> explore this further.
>
> Thanks,
> Deepa
Hi Nicolas,

Thanks for the references. I was able to go through these and speak to
the teams internally. Here is the understandings and proposal for ROI.

To support rectangle QP, userspace will set compound control and
driver will convert this rectangle QP data to firmware understandable QP 
format
(similar to MB based QP format) and send it to firmware.

To support MB based QP, we need more inputs on how we can send 136KB
QP data eg. 8kUHD frame (one byte QP per 16x16MB) from GST / Userspace to
video driver. Can we send using compound control or any other alternate 
approaches
available?

Thanks
Deepa

