Return-Path: <linux-arm-msm+bounces-110016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKjwDw0ZF2pR4QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 18:17:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 008635E79B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 18:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA320300F74E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 16:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3574E4266AA;
	Wed, 27 May 2026 16:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdfNcVkx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9ECvczy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE44F382F01
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779898590; cv=none; b=AhDdd+0vQI7lcbciTy3AaE3KyQcmpXuBBUYMaEqJTJaz356lGbptfzEa6L2DUXN3dA6qDHFXiN4bu+FfX+Wl3PeDp7vwDzD7BdZdFODjfey9qHcrMLR0tl+CKIdBMH1cSI3cn0Mgh/UZuBuDRHqq28/MXg/eO0JXHG17UZskQhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779898590; c=relaxed/simple;
	bh=Mc1Kh8665aZUJz5vqgXB2LELXwVyswL8Z7BlMPFGqqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rAB0xUYwQI+sA/8SxfZHh+g2TJ57Qh67UEhtWz/Ocj8mOaO+epfPdVSAPG+/uuB9MzqC5FOlUGA/1737W4xi3r/d/Y6ELkAYcTFV2e6InymN/WS/jDdJfHpLVcbJ7uakBIWpZsXZnVwjdGShGfh8QML7VWxikiLMCicEvB0ZmP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdfNcVkx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9ECvczy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RA6bRm1149430
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 16:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HHp2lK22hKEQ6Y7vMRu0PXmKWGloYhVj62upZKNboxA=; b=IdfNcVkxblBNl7Gv
	QBG0601oHKvgS/HB12PNTmtcewFojqCXlpHhShPsTLTni55SZLjEevZjZMGGgaWJ
	uLnCedSYEZY6C91Wby3zpVjhDRLj16jnN/uAwe/iJOT3SJYK8m2hL3uUvBAeO/ij
	WDKYLAbKgidVFevECp5dzv4jY9RO4o2yNCIs55NX1kNkhOTXg0HaPDAOoAOTHdf4
	5DLT6tisRhkwWtxtKHw4oeYZ6DOzR8iQpS+WIMctFveU/neLg14r4A/QJNtBEhv8
	7zW6kdqaJgFmx6s8nP6DK0sAhoISpoBK1cK+8P8lu+/D+guc7Hr7+h8WkNoObwT9
	fNaXcA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxjshd6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 16:16:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304cb3508e1so937312eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779898587; x=1780503387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HHp2lK22hKEQ6Y7vMRu0PXmKWGloYhVj62upZKNboxA=;
        b=D9ECvczyXj/RZkHTM4FtaxjUutNdh2yFt5eQ2KQCS0ACLYuSoWr/h3N1N9iVsIX+/C
         k/dWV2NLZj5MTscRVUld3IhYpRdDuvtr//aGhDQlYP9P+qny4F4dQfcbt9lHQW929Ter
         P5zsWpiq8h7uf0S0mUIL6xygY+8mgSDT1tAcIiZENb6vhJKM7oYT6XdEG6phjpgw+NLi
         QOiYj14TOmWdKZJ12ID6xrlELlzveGTiLas6Q11auFLbsVpI2/GvaBMFqHg1tC8m79dS
         bxHuJSqBWPosUveR/K+mQZlskWi7TBqlMDnamjlJsBdQlBH/pV0VTgsdHEFdoZWWxc+a
         jHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779898587; x=1780503387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHp2lK22hKEQ6Y7vMRu0PXmKWGloYhVj62upZKNboxA=;
        b=jJvIHBlLT44cg0qN0MbTmkO7nTHhN35O+wukX88aENm2o/6QdEga1YuO1M9WTjw4OU
         9wfVUUumn6qfEeLqY9j7/m5+tmWECniObtEcitrSqTeB/Lj2zZodq/Rgvo7pOQd0ps/V
         qMHNbVvuz9KsNUVOfPNlfotHxaYvYIX1HKIpsa5tVGOnwmMAw4/OreeP542IHbJm7x7A
         Om/arHE4ZWMCt2APusZIXDYSbZhRdL+ngcFkUdSmoRMZBItCR7rJxjeIBML7MZ+HgZAq
         7FuLuCZugOJSgqIHt4Jj5Pg6MxzWuMWoxQEb1+kWEau0nqvBGhkWfTP6Wc71VioJUmNm
         xGzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8tRkf7ZQISWiOZbbBDwTwAKz/aJZkUA1BQe24WRRn4t/KpnRSjZmIglGEzhb9EIkAlGUaPpitl90vFW8uM@vger.kernel.org
X-Gm-Message-State: AOJu0YzShKD2gGOSxOEk8Yx0GG3I86zWAVT5gk+m1Ou72iJIHihBjTfJ
	zsaHML2ve9OVINfnpPRRDVfrWEFjyvSkzkg63VO+/X4gHqSsQTk1RceWwEGRxmCMfAqRMXWfY5s
	lhPuAM/MwZkHBnofgqTX4la4D6nSEo+KAFNd2S+PGEk+aDhkNpVpfHaxDMCk6C8KwT/8+
X-Gm-Gg: Acq92OEW2z60LpbeEAyJyuqhpUVME9p0357TvaKZiEf/7THZmD7GHEGT1Y6SMDa9Ij5
	3Rw8edg/frYV+1m9usLeXVm3fsZYjuSfK8s0zTKL0nZDbJQaNuvvIg8HnZTmWpeS8rXDIwMrlQo
	guYzt+NE3+QM580Audcdve0JFxTpBmAMY8HjJqV3s8Q5l0fUCMEyAPHsgT6Z9ySSa39esFthyO+
	4Z95yBnsUtvKPDv+CuTDsIZjbs+iUNYLcHfX9VawxMC7pIPB57eFDfh5yqyKe7ZpSAA2uDBQjDW
	mcKDJcpfOuVtuShfe3XXDpM5OIAm9Yhyr9gv2Gkj0MuvX7hVQj65+gzDwkqpdcB1tJb6ftNwZkK
	0/GJ7GJjdULSPZJjELYwlCZm+WznY36v6iReUQTW+O2wRKzBtoso1pc3dfWD0jsoE
X-Received: by 2002:a05:7300:641a:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-30449144597mr12538897eec.34.1779898587495;
        Wed, 27 May 2026 09:16:27 -0700 (PDT)
X-Received: by 2002:a05:7300:641a:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-30449144597mr12538866eec.34.1779898586745;
        Wed, 27 May 2026 09:16:26 -0700 (PDT)
Received: from [192.168.0.3] ([49.204.105.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304522547fesm13547748eec.21.2026.05.27.09.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 09:16:26 -0700 (PDT)
Message-ID: <cad163c4-2c5e-4c10-b434-d8bfe3fc0209@oss.qualcomm.com>
Date: Wed, 27 May 2026 21:46:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] serial: qcom-geni: Add tracepoints for Qualcomm
 GENI serial driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260518-add-tracepoints-for-qcom-geni-serial-v3-0-b4addb151376@oss.qualcomm.com>
 <20260518-add-tracepoints-for-qcom-geni-serial-v3-2-b4addb151376@oss.qualcomm.com>
 <2026052258-scrooge-friction-fe21@gregkh>
 <c0daeac3-1c13-4389-b48d-92f3c3a1643c@oss.qualcomm.com>
 <2026052738-unexpired-diligence-10f8@gregkh>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <2026052738-unexpired-diligence-10f8@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4PZDwP+ c=1 sm=1 tr=0 ts=6a1718dc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ExCzEAt1B76v0Cu087J+OQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dl6q9R0lG94mxgL4v_kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE2MyBTYWx0ZWRfX1HzlN1ayG32w
 +/g5v1lbJYVpIsDuiedmqFDiKNGuctw4kDwJr1Cozg2bGp3oxWL/y3J/bLIcjFvw+YgMplEVyYl
 kcqLBbLE0f7SoqQTsZB4lGKuz9TGKBG6zd7zL3q0vh+p3KM8glNu++vxRBhza0TSYeVrGmwmPbJ
 Qlgaz5PWFkMTyN/SFt0W6NthOmNzpQOGMryayo6KQrkBt+7QRKmiyUXdKwpaxeKa2ATmvbEbAaC
 bSPMUqxCU1YFJi9qc6PFLntfx3IrK5f7uoSZigpBF1uDEQ69x2bAg+CURurBa6Ohc2fHkw51jkJ
 7u0dnft7GXq+jTlqz6nYfLo3RihL0ikahEY1PfTpZxl9FdckVMZBDn9tUlou2FvOvPvqeIXcvVA
 Zxttk4epZJUsdJAA++TSL0UwStgy9eHt3Q6pf8LiNQd9X78/i0P5mQilqFCaX6ZmsHWez0L6KyM
 Yc0IFZUmUoZOZxUGL4Q==
X-Proofpoint-ORIG-GUID: 7PU_ZmkxMziRMbjjLJlRT7r9eEWo_AWb
X-Proofpoint-GUID: 7PU_ZmkxMziRMbjjLJlRT7r9eEWo_AWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270163
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-110016-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 008635E79B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi

On 27-05-2026 13:47, Greg Kroah-Hartman wrote:
> On Tue, May 26, 2026 at 10:36:18AM +0530, Praveen Talari wrote:
>> Hi
>>
>> On 22-05-2026 15:17, Greg Kroah-Hartman wrote:
>>> On Mon, May 18, 2026 at 11:26:56PM +0530, Praveen Talari wrote:
>>>> Add tracing to the Qualcomm GENI serial driver to improve runtime
>>>> observability.
>>>>
>>>> Trace hooks are added at key points including termios and clock
>>>> configuration, manual control get/set, interrupt handling, and data
>>>> TX/RX paths.
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>> ---
>>>> v2->v3:
>>>> - Updated commit text(removed example as it was available on cover
>>>>     letter).
>>>> ---
>>>>    drivers/tty/serial/qcom_geni_serial.c | 27 +++++++++++++++++++++++----
>>>>    1 file changed, 23 insertions(+), 4 deletions(-)
>>> This patch did not apply to my tree :(
>> Do you mean these patches are not applied cleanly?
> Yes.
>
>> If yes, i will push on linux-next tip.
> You mean rebase, right?

Yes, i have already posted V4.

  https://lore.kernel.org/all/20260526-add-tracepoints-for-qcom-geni-serial-v4-0-e94fbaec0232@oss.qualcomm.com/


Thanks,

Praveen Talari

>
> thanks,
>
> greg k-h

