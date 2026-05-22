Return-Path: <linux-arm-msm+bounces-109188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMPuFEMHEGqLSQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:35:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF87E5B00B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFD0C30433B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 07:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B2C360ED6;
	Fri, 22 May 2026 07:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfqXL8ZI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYWRMKCd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A72B38E5D6
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779435306; cv=none; b=nEOCcmCwdH9EGzm3z8XGBMFciPJ7aXgX+Wmozj5cbfO2tHvMk8+lNni6YYraplacVFbRRnQ8lsdQbKS26RpYidF2f5CSIBzuiVkSQBkYFa8KDPkXGgSu7elgNwfiYW9oMH2sisyuEWzuRPvtcq0s/mvpRwZQOmTWat3rn139rqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779435306; c=relaxed/simple;
	bh=7Tp8QR8ezREidBdZtgOBqXf3WM+ajNf36iDwZT850qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=Zp/WW/+bWOENcfzjCGqegoPGfxbYoZkdUDSq0BSybXGGRV4KC1ZRDC4gSJ8+WSuxnLvBRAnKYv6pwKXlwWXW5FTpWdjW7hz9lphAmcxblAlDcwH5+iLth94E7NTFjObOsiK002rp/puaXsA2Yv4bgfAJpi+Mv6NN/xr4dmHvGyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfqXL8ZI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYWRMKCd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M2sNjl1658219
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2b+Kij9t1IVCxFpBqd1qEHIqo7GSLvjCvGFJYZ65lN0=; b=JfqXL8ZIUCe2Ii7p
	nwcC5qhqYp/OKR5a6KsdZICVLwTzqXeqTFKJIl2XWyrDe4BgDqGltFdpklJxJ4q8
	bwpw3iUQk1aVO0QoIS3sUbEZfHdoARUfJqJGdNNKaTFDml2M9PTCULj3Pxi62qhQ
	5fexdklrqG2E4O/OzjG4iuPeRL1OBdDrc192ghJ6g8LGKBOXKalRW4sk5aQwv+/n
	MybrvN1Pt44DJOsBJzj+kqOGaZEtVBpPfbie6vXxU+amSObaIfhLXVbwoge0+UtO
	o30L4OTNUk55Uoo1Lj8GiRyGxrOc650G9wG8Bl4zVVQgvXhCoHxfp3UDF3rFqhN6
	LY8L8g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkmf26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:35:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so7034644a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 00:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779435303; x=1780040103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2b+Kij9t1IVCxFpBqd1qEHIqo7GSLvjCvGFJYZ65lN0=;
        b=bYWRMKCd0+fuB016zPpJUBJKPoanbg46b6zs02eT8j/8dJzV2LFGLyfosetExKYvf5
         ftFQDFr6wzGOoeyZO2+IWgU739ZK2h33KA/S/LTzZiJFwQ3+pqRNeB7zBZQAdMdNXDh2
         nDoqfPCPimyEBvYBRRickieH7tc2497a7XEmz/RBrQ5YOm3bT6/cz/MkU88+KQzJo1Le
         vEM846dZOnIzjlmWZWqOvR19GRHnjcCbxJJEShvg5KVeHNK0Q6PYfjZWK6V0TTAkvqas
         Ft6qc37k3OYgHVUToZKWouDaaWnqqtJXjGg+IQzjpH6a+gc4avCyKimtCYPjlyLCig2k
         HUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779435303; x=1780040103;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2b+Kij9t1IVCxFpBqd1qEHIqo7GSLvjCvGFJYZ65lN0=;
        b=SCtM0+YQMWzgFLstPpOZNRoX/H7VU5hTPkpYbSNZ2tGvQf+9Mmwl5lnpVlp/N0hSoq
         LYF7Bt26k1me/rFCtfev51jvx31EtHVHMH8yHrCxppUc8c61QXQEqqK9SgOwRuSSxnwl
         zh52AdlcvvzEqXzm1yuJ7m1zpl3/C7JW/lhfzUQoLparTHfDNJX6aDGRpdfVsa/IS22W
         MZ9utvLZzFB5SfmocLlh9FuXJMnOBm+kZKiDThXX9asnM42+0WnOCrP1OMBF7cn/y5qJ
         2I07va8yAJRBEnfXVk7WIu+qxzrG1vWP+piipxcCEQArktMcS1TitmqoQ0U0NNLvpthl
         8bBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9f43tMblWK8R6CriZcC4NScc+qJ99KAFH8Sw1h86d/S88eSXNk4IlMRy4xmfjGOTK5bV/w0qyO5PZ9381J@vger.kernel.org
X-Gm-Message-State: AOJu0YxrXB/RIoxxEkeUY05GhiD6IXgPd+lPNmRkXUkIT1+Ju9zpOFls
	Be+aplqUNoi31nctxpzp+MGdG4xq9gUj89pL0ewsuMNUYPllEJsZsWnCiw5Ffa975KCku4E6zbq
	9QWg6m+/9Mqk4oOuWwI255w8wstY1RxtkL0GqrL/C0XUiE4my1RIr7m0gtSXiPcLynbSS
X-Gm-Gg: Acq92OEpY+SSeATibcHdCooFU7hdQPuxdPPqEOWgq/CnOnPqOHSHXf+ap2p4p69WTSo
	P5GEhvf3GmTFCSv17th2wJWl5Em2UguUWb5OyD8r+8S05D7LfyNOQqYz4lflZaisaDmQam2KM4x
	KjPEppLh9aBTaNm+zS0F01/GISZfbAZUlpgJBuizfdgUTdSuA2XqT8lb/TX7V1FygLswahIIJiq
	BiaBawJBBl2snnT2yhxIdL2JxtV24pD2HmfbEjEUEf4CeDD25qnyvJTvugIdGLZ03SgDnGQOKkW
	/AMAaFgrRaLj5Yi/7tCm2HX7GefcDDCK80nzEG+JLM1HNmHsoZ0TC04dHgg5gdQNvXdhCQ6w/qE
	oWOQs2COQA7JxhiVVr87zMsT1hBkcOTbcoFI3bcE9ofLi7k+pFrKhMepdhRzoBFfFr9rPfgsD/u
	MmbZwfcFRbiT79Y/RT
X-Received: by 2002:a17:90b:1b47:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-36a671e9069mr2466553a91.0.1779435303366;
        Fri, 22 May 2026 00:35:03 -0700 (PDT)
X-Received: by 2002:a17:90b:1b47:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-36a671e9069mr2466542a91.0.1779435302884;
        Fri, 22 May 2026 00:35:02 -0700 (PDT)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a67c4afc6sm579351a91.5.2026.05.22.00.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:35:02 -0700 (PDT)
Message-ID: <01407473-1fa6-45ca-83c7-090c0c935684@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:34:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] misc: fastrpc: Fail Audio PD init when reserved
 memory is missing
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-4-jianping.li@oss.qualcomm.com>
 <5rpyaoyx3dsf3c7llnt57uukeaef2qgget42itfc45tura5esy@b4cwvazm42uo>
Content-Language: en-US
From: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, stable@kernel.org,
        quic_chennak@quicinc.com
In-Reply-To: <5rpyaoyx3dsf3c7llnt57uukeaef2qgget42itfc45tura5esy@b4cwvazm42uo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA3MyBTYWx0ZWRfX2TVP+7kPtoze
 jHcgyuTaUAnWIf+1VUPzQoOX+z+kzvqh1blPtCDbc1SY6M4ibbjnF9lv6XicxsS7gXJ4c45CtfO
 NMfeuCkh83H/6TNZeuvs3yurFHqHdd/ij2MxsCUjJkISnVUFdXa3lDYEKcuAMq2eW1ZMqqJTFD6
 9DOiRWtxHI6I4l8mfc9M7E/TodHFMYjMRLlQFZrtiycass90r3XuEpu8mh6t5uCMrdaHyYhIkv+
 vPQD9VG4bvJQSEZMJ9X3nQFXhUfpWCtxnAHfk/XNeSaTXUqgj6ibnIXWJXU4cUq/y8F9DiRgDAh
 7f/Sz73tzu9btYHCEcTSFdathiN4YU89izpscGmGJ7o35U2rkaAW7dqhCwjadHhELyFjljokLy0
 MgWS/1t1tpN5m0/J9rzvk3ySEP21an21m6oNjsH/gycl6ZnKP7DjA9X6Pw+hA6FA7UG0wZJ8wuJ
 G5TcGNMe1+ymMVWc0DQ==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a100728 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uBSpvLV6fhDO0Xk4A2gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: fQ8T2174RWh8byZ7Y6xRsMs00q7PV9Yx
X-Proofpoint-ORIG-GUID: fQ8T2174RWh8byZ7Y6xRsMs00q7PV9Yx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109188-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF87E5B00B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/15/2026 9:37 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 08:42:15PM +0800, Jianping Li wrote:
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
> I guess that !dma_addr || !size should fail much earlier than here.

ACK

>
>> +		err = -ENOMEM;
>> +		goto err;
>> +	}
>>   	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>>   	pages[0].size = fl->cctx->remote_heap->size;
>>   
>> -- 
>> 2.43.0
>>

