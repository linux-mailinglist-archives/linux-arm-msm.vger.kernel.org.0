Return-Path: <linux-arm-msm+bounces-93334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMFmEkGmlmmTiQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 06:57:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B51F015C3F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 06:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E573301F9DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 05:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0582D781E;
	Thu, 19 Feb 2026 05:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AE+Ebnwk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTHRMnYW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F2D272816
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 05:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771480636; cv=none; b=gd3Ya5mmxgpDuT93VRJpfeqDUj30mnvojelb1ANp7OdxwrfjxOZ3O55ZlSCPL6+KT+S+bWLBr4x8FiplZtpjyGntCQnXfeGqc59tcU4fBjz7aDBNU2nczjO7l3NzTRgU9TGIZMsAXQXcx4ayrky6p6wd2KhTmnXU/tPYPUJRW7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771480636; c=relaxed/simple;
	bh=vSnTfApf1YQM2UVKof0gu1KcCTRQM/bMxPKi3bTy+m0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=cPpLTO/CJRF9rz/KTdsFqx5wIqckDHsxuqu8xdZFGzUWOhhr61gi+fhsefq6Q27ANFByHt2SQdM6qtJyzgGRta89cgfhCb9jY0ZfgqvA7Y0ZfPOcynBQmievLF0knzz+Ny5wTy8vFXstVwwG4yb5hJR1ByTuVFXphJFci5IaF80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AE+Ebnwk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTHRMnYW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61INpfLJ2883689
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 05:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XolCceZFNPInGayQIfh46vVqqrqkNW8MCFKJVZg8uJ0=; b=AE+EbnwkgBl/+SLa
	9/5+R1bS08y5yij+kTwoGcOlGipRpYYQVTRzgAsrNcIb0Ups3afwnMZGpUXccfOd
	YdaBlz8D+3VXhkHGsOTGrNAOBEL6Ezk2Cmy6ncOxgk6S6o1KWoI2XMCbi5GK7TLI
	+ybGsF0aiUqZb9hIl8+zUtpm5XnEFnH0TkRYpLdDC7+VP/Cg/0500tUeCa1QfUrX
	YCrxd9onRgjBLF0hl2ZXjSMlbpmmakrJlHnJCgGlXcYXoBNwkz6INOaSDRfIgu5b
	2Y3ultRo7tK+KtExLPknM7m/rOt+kKQg64JjV6fS9xtTWuadQDJztvaBo4E/TYHL
	9uFHbQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqfg8ku9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 05:57:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a8fc061ce1so44715025ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 21:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771480632; x=1772085432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XolCceZFNPInGayQIfh46vVqqrqkNW8MCFKJVZg8uJ0=;
        b=QTHRMnYWHc529nAO/3331QtaGzR5TLs9uVPbkXooh/SAk/X/iSvG0++6fAIm8ndFWB
         Iy3a1qUcXG5fSoZO1KOzRXtbJxEqssojYjvnqerH9oGh3WMVYhgkTDaXlY1/P44Jrnv8
         wUqy5LE21YynJnIwElg73zrb8HkMbPYey+laWDvT8FvnZlzCcRAFKgOKaAlCvHHFgtD0
         HZ/vNARxQOv2F/Fhgxubo/5/+KfbHuTfjk5qVB4oK36sh16aHA3bMrbmTCtx854sVVm9
         JaWvEpU+3PaPfHEv4ljTzMloC4RNFFsDUqDVCYMUWafZc97n3uYq8V0gwPIa8Dd+0Fls
         jUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771480632; x=1772085432;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XolCceZFNPInGayQIfh46vVqqrqkNW8MCFKJVZg8uJ0=;
        b=jDTSufXiinIgnZ07hFtgOpf4Utej5FtOq/6SKjj1ZYLEXrZ25oRaGTTmtpoVTL9/MC
         EQdJr4X5dr7a+QXy0hUrC3xy6WDs+EgM5bnM8HxbBxd9dDhoBmVmTdmebt2kRe0sb6I+
         dYvc8d+8gsBqCyW/67NV6cT7ZKRcHi0dRMzer23fJEdJyuPHxwrZ+EhT7pW9fSRt1L4K
         XDdWUvhYsFhggj60FPEs+b+3dFgOlLUWau32Y9XbcVKsIEljtSNlrCmt6Af+TaHT7mdI
         RMWtipbfxZBBOpl03glDJsyRMYyXYqQ+Fljfr+DWTkxMJhYuVdVZEM8ZQFZzpHeLbGfR
         W+HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuyqwJ+JmG0gcLwYuoXwKfmxC+vjp2MRrScz07NoJhA/sUnPhdX43po23VGFjOyMhri/EXpiVs44YbSVN7@vger.kernel.org
X-Gm-Message-State: AOJu0YyFNRIevoxAqiF+FAI+JPE3vgAn7C0nmZPi9KL0jtRkmpxcDk+8
	oWzBwW+dbi2fyj7MYc6/dljl1oi9Sm1+1IUaAnk0Jlj9UXiAzdyuqCRblVeG8+/irF7McmOgIyc
	OPiEksiAWWztU+QbpsPdAnX2Jn1Gaw7yvqcauKz+PknIrUqlv0uwU1BB8AE4lV8u8snV2
X-Gm-Gg: AZuq6aJ5GjHRkdVpdW0i7wV5lU5qQ+vaW0MOOJC5uA3ULCmJUZOk/Pm/dqpnHaBxIY+
	wemHqf5yWABJD4q1twU3XbiqRb1PJmmN8qKre2/MSpmTaaPRskjno86BhMvwUpOEFhkSLQiUbFp
	rmyc6p+GiisDL/pYuO86YFsAuZW4EnBUpqWsIKS4+YdvhZ3OEKXXcGNnoOo1J++KRXYaJgWtlpd
	kkCM0sHtLMr3CADj7Io/1SSmL2zYgJEoiifcQ6hOptDF2rgaUsGRuG2YZAQvhO29dPOXjowCFL4
	2LGm/l63d8WyIX6Jf5bsGZH1Gw+KjO87SphN96pwszTkMenPJ2O4O5cAdPChIU98Hn4nnMQ6uAY
	h5cekpvTnonwi3FKg0O/cRQu4MB4FuS7jfO7NtdWEc0MYmNuzKg==
X-Received: by 2002:a17:902:e88a:b0:2aa:f989:dc7a with SMTP id d9443c01a7336-2ab4d02f10bmr201097485ad.33.1771480632390;
        Wed, 18 Feb 2026 21:57:12 -0800 (PST)
X-Received: by 2002:a17:902:e88a:b0:2aa:f989:dc7a with SMTP id d9443c01a7336-2ab4d02f10bmr201097245ad.33.1771480631870;
        Wed, 18 Feb 2026 21:57:11 -0800 (PST)
Received: from [10.217.222.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662f6b678sm27009925a91.9.2026.02.18.21.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 21:57:11 -0800 (PST)
Subject: Re: [PATCH] soc: qcom: ice: Remove platform_driver support and expose
 as a pure library
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260203080712.15480-1-manivannan.sadhasivam@oss.qualcomm.com>
 <spejairpdsb5sa3jwuogkl3edkglqoxa4eqz6zriq5w53ic4a6@4gyymeidqy5d>
 <14de409a-d6b4-7c17-d04c-7d26f16469e5@oss.qualcomm.com>
 <dinx3z2aumwfoipcijxsequulmb7sxaeti5eo5wjug4fjssxbz@v3azphuen74m>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <ae80421d-2a45-bce9-d05f-b135c26216b2@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 11:27:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <dinx3z2aumwfoipcijxsequulmb7sxaeti5eo5wjug4fjssxbz@v3azphuen74m>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J86idNJi6GnyeZDRq1DYq0T0UUOdjHnh
X-Proofpoint-ORIG-GUID: J86idNJi6GnyeZDRq1DYq0T0UUOdjHnh
X-Authority-Analysis: v=2.4 cv=A6hh/qWG c=1 sm=1 tr=0 ts=6996a639 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PP50npNdIGhDFdkOlfsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA1MiBTYWx0ZWRfX/GT4ra424ADh
 z3mypv7ZQOLSZiYbhXMVIcHS5cHgnJv0MevH/i9rNghK2uEKazYMnIMLg2QOypMhLAaBBwCPxdv
 BhEXz1Ss8ERhuTB71plv+VJWcWxfmR32tUrw55QoV9t7ubmsD63Qj/8QBSRM4cnatcewD1dMxuZ
 jhnJx44zi3a7GOOWE0aD9DTz0DOZwTlgFs7FrJlVZDKexFZabnaw46lNNoyTemtUeVf0Xa5mIVp
 ZBVrXlgtUGDiysf5zoezwd1WPF3c6cGW5G0GZqkVfD9Eu2/qkFPCkDTt8ioLH+ersdQT36oat92
 +JWQDi2Vllf7PDfpJ9lPIxWO6Cxi+wKSQ8aSPN341CZ1bkHaWOHVD3U9x14sI2PbHbXOYnV+YOU
 pnjMbtTrYIAkJqY/zyd9E679NXYqt6MyTasWGet97L9fxShtz9s/zyDjpHeCtuDJDetWPb6+1MJ
 +jk5FG7evx5OF8kg/KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_01,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190052
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93334-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B51F015C3F5
X-Rspamd-Action: no action



On 2/18/2026 7:11 PM, Manivannan Sadhasivam wrote:
> On Tue, Feb 17, 2026 at 10:03:27AM +0530, Neeraj Soni wrote:
>>
>>
>> On 2/3/2026 1:40 PM, Manivannan Sadhasivam wrote:
>>> On Tue, Feb 03, 2026 at 01:37:12PM +0530, Manivannan Sadhasivam wrote:
>>>> The current platform driver design causes probe ordering races with clients
>>>> (UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE probe
>>>> fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops with
>>>> -EPROBE_DEFER, leaving clients non-functional even when ICE should be
>>>> gracefully disabled. devm_of_qcom_ice_get() cannot know if the ICE driver
>>>> probe has failed due to above reasons or it is waiting for the SCM driver.
>>>>
>>>> Moreover, there is no devlink dependency between ICE and client drivers
>>>> as 'qcom,ice' is not considered as a DT 'supplier'. So the client drivers
>>>> have no idea of when the ICE driver is going to probe.
>>>>
>>>> To avoid all this hassle, remove the platform driver support altogether and
>>>> just expose the ICE driver as a pure library to client drivers. With this
>>>> design, when devm_of_qcom_ice_get() is called, it will check if the ICE
>>>> instance is available or not. If not, it will create one based on the ICE
>>>> DT node, increase the refcount and return the handle. When the next client
>>>> calls the API again, the ICE instance would be available. So this function
>>>> will just increment the refcount and return the instance.
>>>>
>>>> Finally, when the client devices get destroyed, refcount will be
>>>> decremented and finally the cleanup will happen once all clients are
>>>> destroyed.
>>>>
>>>> For the clients using the old DT binding of providing the separate 'ice'
>>>> register range in their node, this change has no impact.
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>> Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>> Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
>>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>>> ---
>>>>  drivers/soc/qcom/ice.c | 100 ++++++++++++++++-------------------------
>>>>  1 file changed, 39 insertions(+), 61 deletions(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>>>> index b203bc685cad..b5a9cf8de6e4 100644
>>>> --- a/drivers/soc/qcom/ice.c
>>>> +++ b/drivers/soc/qcom/ice.c
>>>> @@ -107,12 +107,16 @@ struct qcom_ice {
>>>>  	struct device *dev;
>>>>  	void __iomem *base;
>>>>  
>>>> +	struct kref refcount;
>>>>  	struct clk *core_clk;
>>>>  	bool use_hwkm;
>>>>  	bool hwkm_init_complete;
>>>>  	u8 hwkm_version;
>>>>  };
>>>>  
>>>> +static DEFINE_MUTEX(ice_mutex);
>>>> +struct qcom_ice *ice_handle;
>>>> +
>>>>  static bool qcom_ice_check_supported(struct qcom_ice *ice)
>>>>  {
>>>>  	u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
>>>> @@ -599,8 +603,8 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>>>>   * This function will provide an ICE instance either by creating one for the
>>>>   * consumer device if its DT node provides the 'ice' reg range and the 'ice'
>>>>   * clock (for legacy DT style). On the other hand, if consumer provides a
>>>> - * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will already
>>>> - * be created and so this function will return that instead.
>>>> + * phandle via 'qcom,ice' property to an ICE DT node, then the ICE instance will
>>>> + * be created if not already done and will be returned.
>>>>   *
>>>>   * Return: ICE pointer on success, NULL if there is no ICE data provided by the
>>>>   * consumer or ERR_PTR() on error.
>>>> @@ -611,11 +615,12 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>>>>  	struct qcom_ice *ice;
>>>>  	struct resource *res;
>>>>  	void __iomem *base;
>>>> -	struct device_link *link;
>>>>  
>>>>  	if (!dev || !dev->of_node)
>>>>  		return ERR_PTR(-ENODEV);
>>>>  
>>>> +	guard(mutex)(&ice_mutex);
>>>> +
>>>>  	/*
>>>>  	 * In order to support legacy style devicetree bindings, we need
>>>>  	 * to create the ICE instance using the consumer device and the reg
>>>> @@ -631,6 +636,16 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>>>>  		return qcom_ice_create(&pdev->dev, base);
>>>>  	}
>>>>  
>>>> +	/*
>>>> +	 * If the ICE node has been initialized already, just increase the
>>>> +	 * refcount and return the handle.
>>>> +	 */
>>>> +	if (ice_handle) {
>>>> +		kref_get(&ice_handle->refcount);
>>>> +
>>>> +		return ice_handle;
>>
>> How will this work for a device using both UFS and eMMC storage (one being primary storage
>> and other being secondary)? UFS and eMMC will have seperate ICE DT node so returning same
>> handle to both clients will not be correct.
>>
> 
> I'm not aware of any platforms using separate ICE nodes. All are using shared
> node only. Which platform are you referring to?

Example talos uses both UFS and eMMC:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/talos.dtsi#n699
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/talos.dtsi#n1398

For few more targets where eMMC is used along with UFS, the patches to add ICE handle for eMMC is in flight with this patch:
https://lore.kernel.org/all/20260217052526.2335759-1-neeraj.soni@oss.qualcomm.com/

and more are planned to be added.

> 
> - Mani
> 
>>>> +	}
>>>> +
>>>>  	/*
>>>>  	 * If the consumer node does not provider an 'ice' reg range
>>>>  	 * (legacy DT binding), then it must at least provide a phandle
>>>> @@ -643,41 +658,43 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>>>>  
>>>>  	pdev = of_find_device_by_node(node);
>>>>  	if (!pdev) {
>>>> -		dev_err(dev, "Cannot find device node %s\n", node->name);
>>>> +		dev_err(dev, "Cannot find ICE platform device\n");
>>>> +		platform_device_put(pdev);
>>>
>>> This somehow slipped in...
>>>
>>> - Mani
>>>
>>>>  		return ERR_PTR(-EPROBE_DEFER);
>>>>  	}
>>>>  
>>>> -	ice = platform_get_drvdata(pdev);
>>>> -	if (!ice) {
>>>> -		dev_err(dev, "Cannot get ice instance from %s\n",
>>>> -			dev_name(&pdev->dev));
>>>> +	base = devm_platform_ioremap_resource(pdev, 0);
>>>> +	if (IS_ERR(base)) {
>>>> +		dev_warn(&pdev->dev, "ICE registers not found\n");
>>>>  		platform_device_put(pdev);
>>>> -		return ERR_PTR(-EPROBE_DEFER);
>>>> +		return base;
>>>>  	}
>>>>  
>>>> -	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
>>>> -	if (!link) {
>>>> -		dev_err(&pdev->dev,
>>>> -			"Failed to create device link to consumer %s\n",
>>>> -			dev_name(dev));
>>>> +	ice = qcom_ice_create(&pdev->dev, base);
>>>> +	if (IS_ERR(ice)) {
>>>>  		platform_device_put(pdev);
>>>> -		ice = ERR_PTR(-EINVAL);
>>>> +		return ice_handle;
>>>>  	}
>>>>  
>>>> -	return ice;
>>>> +	ice_handle = ice;
>>>> +	kref_init(&ice_handle->refcount);
>>>> +
>>>> +	return ice_handle;
>>>>  }
>>>>  
>>>> -static void qcom_ice_put(const struct qcom_ice *ice)
>>>> +static void qcom_ice_put(struct kref *kref)
>>>>  {
>>>> -	struct platform_device *pdev = to_platform_device(ice->dev);
>>>> -
>>>> -	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
>>>> -		platform_device_put(pdev);
>>>> +	platform_device_put(to_platform_device(ice_handle->dev));
>>>> +	ice_handle = NULL;
>>>>  }
>>>>  
>>>>  static void devm_of_qcom_ice_put(struct device *dev, void *res)
>>>>  {
>>>> -	qcom_ice_put(*(struct qcom_ice **)res);
>>>> +	const struct qcom_ice *ice = *(struct qcom_ice **)res;
>>>> +	struct platform_device *pdev = to_platform_device(ice->dev);
>>>> +
>>>> +	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
>>>> +		kref_put(&ice_handle->refcount, qcom_ice_put);
>>>>  }
>>>>  
>>>>  /**
>>>> @@ -713,42 +730,3 @@ struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
>>>>  	return ice;
>>>>  }
>>>>  EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
>>>> -
>>>> -static int qcom_ice_probe(struct platform_device *pdev)
>>>> -{
>>>> -	struct qcom_ice *engine;
>>>> -	void __iomem *base;
>>>> -
>>>> -	base = devm_platform_ioremap_resource(pdev, 0);
>>>> -	if (IS_ERR(base)) {
>>>> -		dev_warn(&pdev->dev, "ICE registers not found\n");
>>>> -		return PTR_ERR(base);
>>>> -	}
>>>> -
>>>> -	engine = qcom_ice_create(&pdev->dev, base);
>>>> -	if (IS_ERR(engine))
>>>> -		return PTR_ERR(engine);
>>>> -
>>>> -	platform_set_drvdata(pdev, engine);
>>>> -
>>>> -	return 0;
>>>> -}
>>>> -
>>>> -static const struct of_device_id qcom_ice_of_match_table[] = {
>>>> -	{ .compatible = "qcom,inline-crypto-engine" },
>>>> -	{ },
>>>> -};
>>>> -MODULE_DEVICE_TABLE(of, qcom_ice_of_match_table);
>>>> -
>>>> -static struct platform_driver qcom_ice_driver = {
>>>> -	.probe	= qcom_ice_probe,
>>>> -	.driver = {
>>>> -		.name = "qcom-ice",
>>>> -		.of_match_table = qcom_ice_of_match_table,
>>>> -	},
>>>> -};
>>>> -
>>>> -module_platform_driver(qcom_ice_driver);
>>>> -
>>>> -MODULE_DESCRIPTION("Qualcomm Inline Crypto Engine driver");
>>>> -MODULE_LICENSE("GPL");
>>>> -- 
>>>> 2.51.0
>>>>
>>>
>> Regards
>> Neeraj
> 
Regards,
Neeraj

