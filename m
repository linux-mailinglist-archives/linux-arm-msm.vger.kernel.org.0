Return-Path: <linux-arm-msm+bounces-100390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJVBILS+xmnoNwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:30:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A7E3485CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09FCC30107EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB90D396565;
	Fri, 27 Mar 2026 17:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJyTmmYa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZEPGkmbh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9058A25B305
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774632227; cv=none; b=eFrzhFqgaOBuiPVm12n6NCuazkDjuZuaQmAaN4SvrQfkHWhK6yG8Jp+/63WUct1SpEzlEr1BC3T47/6ey8CO5FwBH3KDb96EtlC+XI6aydB8y81hGueZSz32SVu7unrlmG1FZMfV213I42u2K/GCnDSf6kX6AK+AiGtGL5Y0AC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774632227; c=relaxed/simple;
	bh=oXHGouaPsU04OdEw95rRa+ejkayYWhlXw7cqQ9DL2TQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKtllnI2p3xcbMHi8UgpCPBZN6Q5I4V9GVTLIE/UcXtVIzv7frcfq0WYru/vASJmlf96bpJO8CO+Hc8nCG0AdGHNYjPcXt2f/JBhdt48ufH5c7zuAuMBWgW37WxIEJLC6VE5IofaacN4VeBUonsMrBTjmwea8MDDCgmxIvloF7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJyTmmYa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZEPGkmbh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDi2nn431532
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	veP/AcaZJqvwTGjl78Yki2Fb/VKChVz/2Shqnw88esQ=; b=PJyTmmYaHO8YvRjV
	EXqljG7SwMrM61ol95ODV/0upNI+nHCCB0N4MCYxPvrcZcp4+T+eYCWoRktndHq/
	VFvkb5QBdAcAsh+2V8v56hqSUl0S0H2u5tcWdwL70Tpf+ksLvE+UEA4jpTfzcu9h
	sZL/XMmuQJysz2WYr4uhJHvz1c8OPa2hh5POGesZUGWD+f4iFeTt4Nrw+dJz4Lvz
	x2rCeeF0M5meAXnEUwQxiQZZfUUfZtzGAKvVV/n1p4Jiq0AaZxQUO4dQ2TQ3ZOar
	3D2K7p900tmnTyBGZLWBFd3PjOXfXj4REs52W6YhbI8sYrmgtcdArPWYOIQEA2fo
	0G74IQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5hapu3k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:23:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c189594f54so4135273eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774632225; x=1775237025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=veP/AcaZJqvwTGjl78Yki2Fb/VKChVz/2Shqnw88esQ=;
        b=ZEPGkmbhUs88roQOgMyXnHwWAWHx/Bs0XpV6mIbVYurmb3BN1/n1GQd/6quuKzW6/S
         DgQkuiHlcYY4y6Amx9gJ+uQ6Bi65/DsJQoynrMhv2aUTqYmatFEcDRuHi64Z04G9ENIn
         EZYoi2o6Vlx4yDYq7dSIKrsGs8H6O76MegqYp6Gf5CDJkPmBn3zZRGz7R1aMwDxI5guH
         47A6wrPv458Lg3s8q5pprGHYtVq465b3nOrWGYoKY3/IO5kgdMQ8XEoVtCbF2ZlCnv00
         I87e++uRlEGItXjtkIWpXeE72m24PoIepLKgbX2xg5oFbV21gR8x3rTHV3ub0RQB9feA
         8zlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774632225; x=1775237025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=veP/AcaZJqvwTGjl78Yki2Fb/VKChVz/2Shqnw88esQ=;
        b=gw2nll+a8qXxrPUjjGmQztzbUrb44M0gL/sq7/j6/e9SrdJsjPhpxPTn1/1FSWx12e
         URVozwJWJE8sA9d7ARU8kZOa9MTmqpGW+tz9VLDz6J4t7VpIoFwFLq40hgR/eYFtAaks
         ygC8w3sWtf8NWKX1nK4RMN7F0wsmbDyJ4ekQImdLWf1F4pAqTuA8ClhdsqlFxx7qcMRb
         4iTRBQmANXbcXrJZj3+IaAkoYxkVlg+Q5R5T2gn6PT0LvccGWBAgBkb4el9kvpPPOKJa
         WrcUGdW0UOJF4jK/2hMUMV02HJwP/WwBLgWROlXivJyL8zwDKr9IevjemW+zXJQs+hQA
         +VNg==
X-Forwarded-Encrypted: i=1; AJvYcCUt3egAacIAiQp5Kzq90jI/3NSXgNno1mjSBGZrBsCLjEMGZJPVktkX07zNv0DWxMJVLqa7IrDlYCAPEWyW@vger.kernel.org
X-Gm-Message-State: AOJu0YyQgb1+reBQQxk3aY1omSuT21Ms9andJH7ijSlO6V7FMGi0+XoU
	IFp9vrt2rP4cDIyguHQOAIPZGVhZk6vhaBW7NhxI76qe2VGAV+UNgmx207FuSSXk6RVprRGK8zy
	R/EZXo7wwtxXLIcu+qrRnVUkFvw/oD69lvsThA+3ZuUKnV/ZUGau4hZFdes3h6Bg7tbz8
X-Gm-Gg: ATEYQzwaJXiI1jZTdZEWFlTjVXHaEz/TGbOP1zQ6eQu9iZhuIbv/XeYxg3D2Kqkiwmv
	p9xlcQGCyrHUEz9cANBvOJmvEDFaj6layqMi4tnTaGQyNo/hE3RpuVGiw9K9iLzj9HVEIWcMvao
	RrqQZBPBX+NbW2piAKl+u3sM0tjPlBzUVARAZw6KF5J8fFgx74NyDTxZcYOrvg1/LF3viV4aAoE
	F68TYBeiqGsRufrKWqiw72gjwT6xRTPwjOxkzGrKSxKZ6N4+OCDTBglg144GfpEeHqsymAyuQHL
	xTBGLNqxQmYAE1IyDk6cRDrPS4+nkB178nhN3HLaI1ThSR+c8AYuZdmDT9T2ggZP2gb/HvZEA4/
	m7WrXmCnOmzyKUQdMyHyWLR1r6Kl9PHft9h0KARFtrM/j84SBIIEXKJjq6zrmf1iPiqZ1WGetER
	s=
X-Received: by 2002:a05:7300:6da4:b0:2bf:1eaf:995c with SMTP id 5a478bee46e88-2c185dfe422mr1792456eec.17.1774632225066;
        Fri, 27 Mar 2026 10:23:45 -0700 (PDT)
X-Received: by 2002:a05:7300:6da4:b0:2bf:1eaf:995c with SMTP id 5a478bee46e88-2c185dfe422mr1792435eec.17.1774632224491;
        Fri, 27 Mar 2026 10:23:44 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16edc0436sm5589779eec.22.2026.03.27.10.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 10:23:44 -0700 (PDT)
Message-ID: <39c164d7-5d9d-41a8-8d3e-e209317ca7c2@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:23:42 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Simplify bootlog line handling
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251223170226.2275812-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251223170226.2275812-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c6bd21 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZUs9zOJhT6POFn0piIgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEyMCBTYWx0ZWRfX+8qpW6+Pf17h
 2GJ3Cowtq12xlfhX2fwzOlySPU7ACigNzmvUOLAFbSMVUlygmzDf7FOmTTpFIzBUhsfDdoVN6/g
 5vOsyz+oXkOT/n6C8a+9CyDeOjIJvWUr6d3Q0eGgm63LzGRaf/P6VrIk/gO1/15Y/YyL+rgMPyX
 T01SiSkloUbLWM57BtirFRCLn/EZAVp6OyP1wMX6uNYAa0Qi/MdQCAD4gYtlqJlfodAgMbYfbF5
 6Rjb+NJeqduqiyd6s2n09oMSuhArYXYcjeBLcjRPsuQShw5GtVFGF6X046gBQgjJvWB0Jd/XJtV
 8nsjVf1wOK9JvZWDg+WVX+ZqbN4XDBR/Tz5jxPY+EZ0iPmQY+BxtgPVtqp7Cq51JpB1jNcHzZhV
 BprpZmbTnyQ2XJFlP8O2OA9O1UVyrx3dVk7rR55UzzS/RMNfpAO49vVDm8Bvbe809cHnmSdDKDw
 hsg5fCxmRvKdpA8+2sg==
X-Proofpoint-GUID: Y8swUlZ8yGrLmjlevKHsZ2WJ_OgKpebp
X-Proofpoint-ORIG-GUID: Y8swUlZ8yGrLmjlevKHsZ2WJ_OgKpebp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100390-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8A7E3485CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/23/2025 10:02 AM, Youssef Samir wrote:
> From: Troy Hanson <thanson@qti.qualcomm.com>
> 
> Instead of storing and emitting bootlogs as individual null-terminated
> lines, concatenate them, and later emit them to debugfs in a single call.
> 
> Do not insert a null terminator on messages received from the device.
> Instead use the message length when subsequently storing the message.
> 
> Exclude trailing nulls to normalize AIC100 and AIC200 bootlog lines.
> 
> Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff

