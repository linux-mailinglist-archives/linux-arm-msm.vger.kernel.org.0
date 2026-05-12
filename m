Return-Path: <linux-arm-msm+bounces-107038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM0EIhHFAmp7wQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:13:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2572651AC39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 951F2302A2D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 06:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7B54D2EF7;
	Tue, 12 May 2026 06:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEa6taoM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfC4ye7x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03518477E2B
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566234; cv=none; b=lDGWC34192B3j3HrM5q/LJZNltvbUfAa4sdnbT3BEA3/bXOojTBwE5dYBjNasuc5X4reUtqCvbgLknWD0Dw9V+Xz5UYc9j0HA93D/EkJKo6mrHH3uxub9+tuMu2T4+kRadVC71z1SBsMykqYVSKweXLJZXx+v6plkrjKjVtsrOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566234; c=relaxed/simple;
	bh=4Oc/ygXfRBTK6jMvUCm36puGCr6UelEV3QWDsP5yNxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ENX8zMS6uUu7Mbfd9It6fEMrIXssCWnOmiADi5BE92TO1hoVAPOQo05UJL+XFvQ1iFFYop86fgJEFVRm2SUKhiAFCHh5CCBWPP9kn0o10vfbmWuLC6JERniiK/IazpkwBURtg4G5sDCo96R269Xpg0X6ihu2dHd54VrrQsilN4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEa6taoM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfC4ye7x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5BVKt2187626
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ll5yBfNIxQl+PyBvANVDDxs0W/OxwTKJ8orvqO+icGc=; b=KEa6taoMZjMuc1Zi
	OuW8Ls+oVft5SMB9E1gm2OEMOyYL7kQa/XWTeKyF7fUSD0pBrNeQFHuQ/4zxqsPl
	w2AQ4ZLiqvxPtDewFskim8pljXzcRfQISfiCQafg3GFfCM3RfVzyUMcEp/tqO8Zh
	+xzlcoVgbyTIW2/SVezbpecfs9b+dZY1e0Z7ygfoQagchK5e7UAAP6DmDwAJqdPL
	StQN5pOUJd4o8C+p2BN/5iEwVQ3ciw2q45lKcs5GcPn2OxQW/8SqURoIIP3BqjJh
	MqDB1CwYzHS1rw86VzibUDVOKOmVyWy2/JutyvqLvjFLZpgw/a5KyLK5SVr5TqOv
	fO0PFQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0spqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:10:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so8292395eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 23:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778566219; x=1779171019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ll5yBfNIxQl+PyBvANVDDxs0W/OxwTKJ8orvqO+icGc=;
        b=XfC4ye7x2rheJ1Tu2CrM2RGVgkngxSXLYCHkRj3o81s83T4SKudKcxGLwpZV3+4DYw
         JK08Lf5qbgIQYbtVpwXvoKvF6+Ab8/tCllcHWhAmVhoMS/OKPeS4CcMyqfvyMNh++j2K
         LR4P8GkkZ4AhapjVyNjgfGFBF4YSFhbULWGS70AzUnLfdF3WzQ+cCHM8Jz1p0HVh2DVH
         OReNs/DqL6QjIkQXz0yrXjA86hxCf73X46qo9ktGlvZfTKxJLqdZrPYpRadL8y6QscKi
         ewBcvaCk2NLEOi0gO+eVDVMX8jmJM0AUKrZ3LYKuq73HmdC8vEc1Xuss9n5X5aENJT5z
         ke7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778566219; x=1779171019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ll5yBfNIxQl+PyBvANVDDxs0W/OxwTKJ8orvqO+icGc=;
        b=q482gKeJYfJ7HNsXCVeWHQEuNC/QZJVmYcljtgbjY20SsFW5y+JOBHlSFKpxVZl8PR
         wBx/+KVJFf/HhuFpr8pNRBzRlCIvEkpFzpbqK8CCRkqpFOtOWyhgkPzhezIxQv4MimfH
         Ru72oRzypmppgHrIGFs2nZCpGO+7gEZ/f4t4RW48pxR3xWaMCEk36M3+Sx0+sr0XsZ6I
         bhybuhB4IQh504O5NUS8K7ZUdIHtYCHV05oYm7yibmvY+6EBk4sMVB4GF/NxCboPOxRT
         rX7CoySEZ1Nuu7+D/VJwgkP1pz3R6F5r7HkpyxHl+2ke6SXsAriV0dSKLilmXT2GiNhX
         hrOA==
X-Forwarded-Encrypted: i=1; AFNElJ9c8JoSV26cZ48eKVVAIvEawVLi1VQpWju/tFgMo+B65x6li/DnCSdWdE6oL3mcPj7Ar8Ch5rqJR6ty4Cdr@vger.kernel.org
X-Gm-Message-State: AOJu0YwbIzK0VQ+pfKAtkmu8vVuzTPmEe8zhlb93bRYuVU7SEzQo+zeY
	MFG9gCZmVuzx/d7JlaXVcBPwy6jIUPoNzW45oFrMkhrxXJ7nqc6VQHycGngxWFxsCIUEx8H5b/Q
	jHA+WBdCF2y4113+Ohp6H8TkH+uqIrFJ6QfsWQnMuIAVTRvEipeWWw8qpe6T8h0EY+fmNJe/CLC
	Q3CAo=
X-Gm-Gg: Acq92OG/eSibW0oq7ojCJPZt2nO8MsSj4d8Te2g++Z3XbZkOMmc3WW95c32rGpN2l6d
	EFjVVvZW3dgSLKaHpKTgMfzwoaRGc3E9vxOs6bu/GTWQwFeNNFfgw40BXVHeRhcYByvjUyBC2kc
	ah6b90N5VTdZdi7Lk5fnl8svfAi+VrpwTPLMFl/0PWbQlxJ9mw/GsZLPHlgb1/y3ZSCtgLcJtGQ
	Mw+jSGdFsdR4oB4gj3eNxqjOKrBn9Rhz0UOjwA2x+LG5MkZlzUSUBMHnjA3Gp+NjhL/+PDJu5xg
	14ai+awYlaOO3cLCqqp9vx8R5JjWSADDqZYtlqkfh+EV7y8rUZFNI38o1Lqxtgnp87+QLCr4TPd
	UR7nsEkEyZlaRgmXpwro7Z2m6IMx1wjWbzRaWksFhYDc1OyIk5JmX
X-Received: by 2002:a05:7300:ec11:b0:2dd:5641:f01 with SMTP id 5a478bee46e88-2f54e194293mr13165504eec.28.1778566219049;
        Mon, 11 May 2026 23:10:19 -0700 (PDT)
X-Received: by 2002:a05:7300:ec11:b0:2dd:5641:f01 with SMTP id 5a478bee46e88-2f54e194293mr13165479eec.28.1778566218453;
        Mon, 11 May 2026 23:10:18 -0700 (PDT)
Received: from [10.92.208.73] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm19727422eec.10.2026.05.11.23.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 23:10:18 -0700 (PDT)
Message-ID: <b3caf403-f882-4a39-b309-ce6a9ca3aff2@oss.qualcomm.com>
Date: Tue, 12 May 2026 11:40:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] spi: qcom-geni: trace: Add trace events for
 Qualcomm GENI SPI
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        MukeshKumarSavaliyamukesh.savaliya@oss.qualcomm.com,
        AniketRandiveaniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
 <20260506-add-tracepoints-for-qcom-geni-spi-v1-1-c957cfe712d1@oss.qualcomm.com>
 <afvkiT50ZUEXZ-YO@sirena.co.uk>
 <e4651363-7c1c-4ae0-a97b-b64841424c83@oss.qualcomm.com>
 <afxJmZ9MkP5eJkQC@sirena.co.uk>
 <59e36f20-891d-4a58-8cc4-6822d03daa23@oss.qualcomm.com>
 <af3spostNgoRU0Vv@sirena.co.uk>
 <e37f2d5d-daa9-4302-8d34-9ce198e60a4a@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <e37f2d5d-daa9-4302-8d34-9ce198e60a4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA1NyBTYWx0ZWRfX2hdV73LJXEm1
 ttCf7cwDCN1AjY4NISnxl3VXL9IK5JnA5jfuLtOxcSGNmsUEBYZmdxnMiWYf0eFwHErHFGn4QEz
 JbaE2UyE8A+o1HPq8ulnu0x5fB1dJ8W6QD8H1g+5Pjdmu46hiZw8EuyvNiJTAaM3/qPwdL6Hpnx
 Dhn6NCwteTYgQMInUINbvEV9ETN5aCLinH3JwaZiQj+ovfKSNYn954X6Qayj+dsbUujwD9dQCme
 OT1bEY8i8DKvVtyl7cMuP1PxP3GpZwcpzZTlWZwnwLNU1xAenS1yGEKXP0Nx8/gEjXxw0+tZvWh
 wD4+cDl1tZ4lQZJTRnffxM8C0MRpxcdhalr2yj/SUVTmu+MkUvk52NFmj92R2CETeDqr8QxIJ8U
 LLRByPFTedyWuz6Zyfnx3TedTrE///5Y+74ggfOQqODnqB2KA+tvDMHgFcX7VoIfpc7EnNuenA1
 krd6DobxvQndtZz4R9A==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a02c44c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=UcMF6MLYIlUYwx0yHsUA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: TsZHWht4nooFy85IOW9hHEcRGecKOQhq
X-Proofpoint-ORIG-GUID: TsZHWht4nooFy85IOW9hHEcRGecKOQhq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120057
X-Rspamd-Queue-Id: 2572651AC39
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107038-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Trilok,

On 09-05-2026 04:44, Trilok Soni wrote:
> On 5/8/2026 7:01 AM, Mark Brown wrote:
>> On Thu, May 07, 2026 at 11:03:39PM +0530, Praveen Talari wrote:
>>> On 07-05-2026 13:43, Mark Brown wrote:
>>>> By generic I mean this should not be driver specific at all.
>>> I hope these changes are fine. Please let me know if you have any concerns
>>> or feedback.
>> The data tracepoints look plausible but I would expect them to be
>> generated by the core, they'll be there for everything so I'd expect
>> them to work for everything.
> I agree here. Praveen - this is similar to suggestion I had for the i2c
> internally.

Sure i will review for I2C as well.


Thanks,

Praveen Talari

>   
>
> ---Trilok Soni
>

