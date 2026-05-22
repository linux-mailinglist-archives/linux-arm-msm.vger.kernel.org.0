Return-Path: <linux-arm-msm+bounces-109202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB15GokeEGrqTgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:14:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C965B0F60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 564AB3006B06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2466F36A341;
	Fri, 22 May 2026 09:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYHtM0WR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQ2rdEi6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6B531715B
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779440927; cv=none; b=q+j5gDyM4N/Or7M2w21LvNclZZ2EAsvq4BjOk7bSUll03LqV0awl4zDBAxrMUFesO3/OXOOKJOVucAHe/ALl78sLUqKkCWpab1cogc6ESv3DOaxgmdx8pgStCkwY3olmw3v4Y69cJL1He6/kR5Rb5OaKURrFIXl3juEqECS+xso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779440927; c=relaxed/simple;
	bh=roRWlgdyFRGvzjwKDlar10VDdu/eL54CKftyh/LTR3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=RG9ANoK6zhvRu8e3T1wGjCanzeSYFfMK7N1TJo5ctz5Myo6Ag8QIcVww3TNODt6zq6papXvdNfOQNZECSkJvTKA95s9TQftluGY3BXW1d+NMedoG6luG3qSCl7DxoszlVKHv5TsPi3GCv8KaoqinSMlZ9xBIWvO3QgUMAxIWYdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYHtM0WR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQ2rdEi6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M96V7d3532232
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mKwTq/x1CgdeyD6mhRAd0X8c1OdQ+gz6M1HFcjRwlpA=; b=VYHtM0WRdfskSNMW
	rsbGP8eTuOJ0Zb3Uu3HOV3xUpU62nsl1tHo4RVS7s8bcUFBNFMAh9+5OE7zsAzUO
	/Fi7+bDUMYqnNCa7wa9OYvShXEkIPuWfqNIOv6d/7R0DISZQPEqd3IBgR9VyAoAd
	v5ZrZeKGitgRiPSr6MLombB2xLWSgyxsVPLt1/9zAe5e0Nj/UX1Qovktr3jW1apY
	EvoXL8QIbeBkkQAz8CRsPsc3mv70zmQlhRzgGZpC+rs2kSZ2sVaFehscKDUI6Gqa
	/R/RWrjf6KBRW4ioyoq0tbNeclLzB9T/+5VeWMTA2AuL6HoyoOR/Fau9xvoayaKf
	ReyHRg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gva4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:08:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82751074c8so11294752a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779440924; x=1780045724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mKwTq/x1CgdeyD6mhRAd0X8c1OdQ+gz6M1HFcjRwlpA=;
        b=BQ2rdEi6SeyTVz0HwX8CvTsGunGczNrxMfDuBpLVeEnUzG5V22awNeGSQE/sC9w/+0
         BLxJ564SRiRfVPkWuve/pvtZ7j9jTdVxDxrsfrA+acAM+1/qSH9hv26JvLzZCcb2HlEU
         EifPxBTQtQgBncdu0Ot0gjj1oZt7UrxURb8dK827p2YfaseKNMDfWxzdJ0J9eedUTqvk
         n2DdlntMCyZUtouxhKtrW4TkWSn1TNSPUFei2rTLaM3EKvImK8UcUH6hn+IUPn8jtn2L
         CKo6656HixKOd5QuXfvRZBFVrFq/u8Er5Hre5O7d2dTBfOjeRNt03z52Ba/G0ynd2lDz
         pgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779440924; x=1780045724;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKwTq/x1CgdeyD6mhRAd0X8c1OdQ+gz6M1HFcjRwlpA=;
        b=XM67VRu14r7XElyV07ZAcvZ4A6W6LoPo5DB1deqKFPc+VC8WuHMeMutD+8mphroGJ3
         XqiBUBBmyk0eBvZdtpaAii9tnDqiQgiaMezMyVjNaOXjfAi5qlRjEgV7NTFQO5jD58F4
         Mw5nRKm2PKzgglq5LmArlF5K/GNdc5Vt//br8E9UaTBll1he8ba7zQc7T6PkIBMpdY9q
         EHkh5jmfaBDEFCmf4ogGE/c3HCRTlClbmafGwfUZrm+gkBAsG7IR3I9JZyfRTm9lTUA/
         LdC+fhJ/4dy6NDW83uSY7Yg8fnY3llxj4z3sq+sygJArJMt3fyIPyHPWQYV6L2300/VX
         Fh8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+USgr6F+QgW8zPVf2UxKn7p2jggCyIEVArI2VZHnZE7rexW0S3z4Ghk8yRrhdswdXvCdu4OCa6mzAREoO/@vger.kernel.org
X-Gm-Message-State: AOJu0YzUkmLnlI8XSxWtsrVn3HRjwDyc/z5OvJcCYB1vND+HbsGeN59a
	lfQVtbfDPbkfMpjxlSDwHh7ODa8FcOPxrcddS3ghzDzwWJpOA18OgkQF8UUVmzJ1alhT3kySCng
	tEqLrSuf0Jx3teDMM7xsQLFeQFRluFWeLQlbfZq34JrAHgVDkbu5dVTSlg7UkJZROseyU
X-Gm-Gg: Acq92OF2LGK6SilcGK8G+wnr3l9bFVLRrPXwUzM5HQGEubTObd+09AYcYqmRmjMVbcd
	gAiQQDosZZG9IMlHNuv2BO/Ez6I9cvRc3pziLrwGPaedpA7LK2lCJOcU3PmUvEtam5OBnxtoiJr
	Yg5sg7jRzrL2XTQaV2l3EuwepSbdYcBcBRs5c565jjQrtQe/Y5pvJrf/955WylTXCUIp8QPT4nn
	AkXbNDyHUM+JYtM4riGzNhiaEA9SJZDzs9syKU8j1ToPfV63OaB/UHAaanQXAfi88n6polCQqdS
	gxOoXh89d1pL2/IEmT36OuYQDP9wvDWSuatvSiPWs9mxdy7POsXM9ndqV2hRtZc9WQ+qUDQiyqr
	2D7MKzrFtrxBL1eYlNEftI/nkVP3oLO1YmPAFA4GWnxv4pvVvkchJORtqxYqlYfJRc7mF0Cy8jP
	hPaYA8bHTicmxXWJPJ
X-Received: by 2002:a05:6a00:244a:b0:83d:a434:f099 with SMTP id d2e1a72fcca58-8415f11f764mr3127956b3a.5.1779440924396;
        Fri, 22 May 2026 02:08:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:244a:b0:83d:a434:f099 with SMTP id d2e1a72fcca58-8415f11f764mr3127918b3a.5.1779440923866;
        Fri, 22 May 2026 02:08:43 -0700 (PDT)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164e9ec47sm1576039b3a.32.2026.05.22.02.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:08:43 -0700 (PDT)
Message-ID: <5717a34a-d998-4f4b-832c-08941d49fe54@oss.qualcomm.com>
Date: Fri, 22 May 2026 17:08:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] misc: fastrpc: Fail Audio PD init when reserved
 memory is missing
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-4-jianping.li@oss.qualcomm.com>
 <4f8697b8-d602-4718-bc8f-4bd0dba50040@oss.qualcomm.com>
Content-Language: en-US
From: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        amahesh@qti.qualcomm.com, arnd@arndb.de, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org,
        Ekansh Gupta
 <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
In-Reply-To: <4f8697b8-d602-4718-bc8f-4bd0dba50040@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a101d1d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uBSpvLV6fhDO0Xk4A2gA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: nk7MRtcUzbhj8RXxBOvzFo5l4fqYexxn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MCBTYWx0ZWRfX8TQlUR+TLLhH
 tLDA0tB/R+it4pOOgejtD+vS3+5I6PliNsZOM2jLwJJlJ8NKOBmeNlgzb7eEJ1aUphkziZab4sP
 O/6iOylO5EANXKhTGIBL+MVqCuGC5va1fM/l29wTnIT24IWC2CnR8WbV25H4VKv6x0Py4vql285
 yA5rT17D/+2CkbJrtp7QNApsBCau7smkBC74Vy3CL5izz1yjOm5C7W3cdYIZAKQJ/1iVdY44Vbm
 t3D0Sc0eVxCB64BIokF1Q3yKBlUEI7JaRRmhsY2/BxjQGwVal79hFJlRBDH/6S/C4rUFO6v1AZI
 9TmoKuv7Y/fNR09Nm61neKSWRnr+XMBIG51QCU/N02+K5yW20kGPkWmwzFzi4l322nqhbEvJ0e9
 32lejWcLhri60h+aoM6rDarn5Cu6AO2s0hDIHm1LoOU4QT7sv8YdxY3qy+z7vaY1JoFnAXHBt1A
 Uh7r7yI/zioXVsXcrRg==
X-Proofpoint-GUID: nk7MRtcUzbhj8RXxBOvzFo5l4fqYexxn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-109202-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9C965B0F60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/18/2026 3:59 PM, Konrad Dybcio wrote:
> On 5/15/26 2:42 PM, Jianping Li wrote:
>> Audio PD static process creation assumes that a reserved-memory
>> region is defined in DT and exposed via cctx->remote_heap.
>>
>> If reserved-memory is missing or incomplete, the driver may pass
>> invalid address/size information to the DSP, leading to undefined
>> behavior or crashes.
>>
>> Add explicit validation for remote_heap presence and size before
>> sending the memory to DSP, and fail early if the configuration is
>> invalid.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 3c7c3b410d7d..a0337cce77f3 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1363,6 +1363,12 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	args[1].length = inbuf.namelen;
>>   	args[1].fd = -1;
>>   
>> +	if (!fl->cctx->remote_heap ||
>> +	    !fl->cctx->remote_heap->dma_addr ||
>> +	    !fl->cctx->remote_heap->size) {
>> +		err = -ENOMEM;
>> +		goto err;
> Let's maybe add an UERR() with some context
>
> Konrad

Planning to move this check at the start of this function as per Dmitry's suggestion.
I'll also add a dev_dbg log there.

Thanks,
Jianping.


