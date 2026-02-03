Return-Path: <linux-arm-msm+bounces-91661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLfTHF/VgWkCKgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 12:00:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C72EED805B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 12:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CE8F308A7E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 11:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CDD32E733;
	Tue,  3 Feb 2026 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovCclxQZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AcFBBmEo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222AE3EBF29
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770116431; cv=none; b=lfXc61Ht/gmCJH/49ailkLT+BUE3Jcyt27sXA5PspbPdPrKqt3fjf+iEPhMwcQ+pRI7F5294XhsQZDw9PVhiZXBRg/rPF5uCCjDDVrqMPA2GFfM7+wqhZYGCSWv8EiGx3EUADX/oM7Fdpm+/GgTNrcChI5ttFqZ8PnwVxBNeMvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770116431; c=relaxed/simple;
	bh=s8kd7B8nGOXVT9/T863Ij748peQ8U+2YLjiIBuPLaHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=cZ2dFda5jv7gNTCfHTlZWLm+AFIUIXeJwnTiCM7a0Err/JNndddzqtCRTJOhsJf+KBvznrKvrEKW6tdWhglzd+z/xy0Lm7qGkNMGORinnRTF1172jt5oXnKd3Zv8X7tT8DkCjrvJBhANLguqlKMdTIuqE2cpc/EwR4qLX3leIXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovCclxQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AcFBBmEo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61382I4e255028
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 11:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oQkZfToFq8BT06VP1uFHEcrlVvgBQYb05e9o8S8pTFg=; b=ovCclxQZfTBJZHCj
	kvFChiXP97GakvAnTtA0UXKk0axdw2C6A/HEH5S/6SIPfoHT7qm8+Enh3DVjS7P0
	zVr5M24ui5l6c4TqD/NiVaBKrrhsMxZ/Qh8iinaRLc74DBlaFe5sfWpSJG9PIWq/
	LeSfugWP2yFY24hDDfwOhznjON2sPRNzF9UQsShXTkmNdz6DtdbiIDNuSUlkdtVL
	ZVaI+Lmmjo2W0U2lZ2La1A8DIkPCIQ7UTSHx5p/VE1QpxkwRtGGwlo2gUTxWhU/S
	VrzPqrr9sTnvN/Nt9xevL+JpzIcMJ4ryxdJ65SOYoQSvOlbgsVjFDBVFUKj/gTk9
	qGnYfA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0kkt04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 11:00:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0f47c0e60so18130775ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 03:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770116428; x=1770721228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oQkZfToFq8BT06VP1uFHEcrlVvgBQYb05e9o8S8pTFg=;
        b=AcFBBmEoxwa8URq/LSq3Gv3Tz3aj+W9CNvan1D24QNlZ70IerP0K51NI+UqmgcKxx9
         jWWQDwsaCwhPozjI7/MJS4pYeJwUz5p4zkriZqZ/DKYW7dFtHmTUpJCBK4FFgsZeR1Qt
         7A1C6k+yTyBZYvlDo4lUoGf+EYLJeCEMRrdbE2mG1ExAE2C2EAjTyXX/MHL1o4Japrby
         JxYgATp3PhDCBBXvwjtLD619wEqilWOgTJyP+R5Ft1zyJJFOsXYKln1WazXlPFZMAWMH
         zd4UlRJ8RsWQ5CZ2rlCRt/GBnyjVRVFWs3L91t/mj/kOwo3a4dkIYyzVRa/OsJcvExjk
         0vfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770116428; x=1770721228;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQkZfToFq8BT06VP1uFHEcrlVvgBQYb05e9o8S8pTFg=;
        b=t4OwSJ20bPK9CbEV7dzo8M4usTrT+RiFtaWfLeotPUU1zMzeL3/9GZhST+GNvHrrfJ
         nt7+wBIXUtowzpEIKTjmNRAb72iFRppH5tjIIxZeuYUT00pZRzb7Ar8ZXeizjmEzRpv5
         NOrZFAkvGpijl7LqqDQwWJywja05zRRuDn8YfVsDL3yhVcbHVLtQRAQn62Aglv8aTNH2
         2x0mPfHAzZhrAZ4gt9qdOoi5h2tLTk9/RpgGeA9M3oBTaw8Zlrv0yvRoEuYNwWPxlfmF
         5XdK5xtt8ep4MdP37//zBrMqOdPYqgLrFRWdxhReWLBaDm9LSfjahGa4pDff7ydo0tAX
         Sw4w==
X-Forwarded-Encrypted: i=1; AJvYcCUZKGpWA9cCKW4xd10RB9pigjZDameCBTZPUI6T4u4NMNYzvNAD66C/7ehMw6XsXzmldW299B5t+6YCgQz2@vger.kernel.org
X-Gm-Message-State: AOJu0Yws6HAS6qxz3F1LoNy7UaM0ofEEl8Q2/JF/7eGPU0gorqBEDYaH
	0eIQVE9q+pJ3RU3j4bYpdjrQG7R5UPvOnbqYQxfn5hhkzrE2d5LkrrBc9rjsPIVBVAD0hGZT4bB
	Z1/DxYUoVIS+xWGaLg5YVcchPwYA0c4EYtLojAPpGlUzv9Dn+qhVt8F4Ug7oC9mvVSpHD
X-Gm-Gg: AZuq6aKbDxAUZ0G5e0RveSChPxjdgqL8Fok6A8fycBpiaHpigxmDwv5OpExHX4B3tS8
	67YbZw1q64kZ24cKSfH7W1vEVInNo4A3P8zs5kbxFpQja/8jFeEiY0FCwE/k6WJnos65dqh9sRV
	/xV8qrdITTZhuo81KMb3aqQHDDIH0TDnHlzNg07KQZOyVwijJz0WoAhRI2FGEHylYPY19GVTKuZ
	+antZ9+r0eExZGqrUAfQnIbR1fZ1eERh1zPG8dKHwkjSOPNeul99e5CjPt+Sqv40+IIfGPxFoFh
	dAnYXsocvOH6vVWX6YYQWwCsJaDnHsyM6LcYeBIOeklHjNeKfhgvmK20MCY3x8YmbVq0d+RG8Ns
	00cbX53F1YpHpYrEKNN5SoM2iTmX5W5bSEA==
X-Received: by 2002:a17:903:2ec8:b0:2a1:388c:ca63 with SMTP id d9443c01a7336-2a8d9919665mr138993135ad.31.1770116428358;
        Tue, 03 Feb 2026 03:00:28 -0800 (PST)
X-Received: by 2002:a17:903:2ec8:b0:2a1:388c:ca63 with SMTP id d9443c01a7336-2a8d9919665mr138992885ad.31.1770116427866;
        Tue, 03 Feb 2026 03:00:27 -0800 (PST)
Received: from [10.64.69.250] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3db4sm180801255ad.50.2026.02.03.03.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 03:00:27 -0800 (PST)
Message-ID: <a7fc9f94-4a64-4e5f-8c9d-858e7e9df7f8@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 19:00:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Greg KH <gregkh@linuxfoundation.org>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
 <2026011621-fang-moneywise-d6b2@gregkh>
 <2255b500-f4fd-4d7a-a5d9-5b4fb55c78b2@oss.qualcomm.com>
 <2026020245-catalog-outburst-f805@gregkh>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <2026020245-catalog-outburst-f805@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=6981d54d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X5nBk1X44HCHp22wJVoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4NyBTYWx0ZWRfXz+SlGjoy9rYm
 pBag5A3QXYZuUliRfXCIuxIMY8X6r3+BNmCXOlC3/hbfmH4GMnTwCGsun/epuPrs6Y9gQOL6n95
 iRIdNDWsG/NPXk77N11SggMolUYDgdN3eiZmWmPgqa7Sj7iwheLXEg9S0LImaZFiMXCX0qUXZAJ
 leoGprUa0P1yI2i6RkxaMG8l7W8AXSmf2Nv9g61pNGy2PT5M6zqbCMFPRiuq0mk41kQbklpTB8z
 uZZGms6UAeXVGJ73pUBDikVAnCC++G73whUpqXmxoqNgP3JPBCUXiQ2nkMR/SEKYHqz0zbon5EZ
 BXVaQaRmQ0h4SGoA3dgKtCZUFFQcHI/a/xUctYjVUQZW1DwF6pb2p8mqV3UNi2jslK7vlH00l7r
 3/8hLLl8Tg19TdaHn8e8H5VrpBO8Dr9gfCmIK0jSYCS33/wYvOSF1G+BzwuetTDvMwrkqTRDFtX
 FVhZ9wO24ne4WHwFCHw==
X-Proofpoint-GUID: kGpBL68oGX1wt2EfllqblrtexOvWxheo
X-Proofpoint-ORIG-GUID: kGpBL68oGX1wt2EfllqblrtexOvWxheo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91661-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C72EED805B
X-Rspamd-Action: no action



On 2/2/2026 4:41 PM, Greg KH wrote:
> On Mon, Feb 02, 2026 at 03:13:10PM +0800, Jianping wrote:
>>
>>
>> On 1/16/2026 10:49 PM, Greg KH wrote:
>>> On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>>
>>>> The fastrpc_buf_free function currently does not handle the case where
>>>> the input buffer pointer (buf) is NULL. This can lead to a null pointer
>>>> dereference, causing a crash or undefined behavior when the function
>>>> attempts to access members of the buf structure. Add a NULL check to
>>>> ensure safe handling of NULL pointers and prevent potential crashes.
>>>
>>> What caller passes in NULL here?  I did a quick look, and see where the
>>> callers check this properly if it could be NULL, otherwise it all looks
>>> sane to me.  What in-kernel user is causing a crash here?  Why not fix
>>> the caller up instead?
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> It's a saftety coding: to eliminate NULL checks on the caller side, as we do
>> in a lot of other kernel API.
> 
> But you do not do that for all functions in the kernel, otherwise the
> kernel would be full of checks that are never hit at all.
To clarify the intention: this change was not triggered by any real 
crash in current callers. The motivation came from the v1 review 
discussion [1], where it was suggested that a NULL check in 
fastrpc_buf_free() would allow simplifying some of the caller paths.

[1]https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/
> 
>> And it was pointed out in the v1 patch discussion that this change was
>> needed:
>> https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/
> 
> Were the checks removed from the caller side like was asked for?
Currently, I have placed the check inside the API and removed all the 
checks outside the API.
> 
> Also, your changelog makes it sound like this is a real bugfix for
> something, when it is not at all, which is what I object to the most.
> Don't make scary changelogs for things that are not actually happening.
You are correct, I will modify the commit text that caused the 
misunderstanding.
> 
> thanks,
> 
> greg k-h


