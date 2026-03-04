Return-Path: <linux-arm-msm+bounces-95326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNAyG84zqGm+pQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:29:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3492006F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9EF6B303A25D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014141DE8AF;
	Wed,  4 Mar 2026 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9abeV/+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AA86GLPC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605C936A027
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 13:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630926; cv=none; b=EOTav38JnNW0NV7gdkpl62sAqdlg166HW6NjeGE/0g9FYzFIl4zfdu9HilOhtbNwunuYNn9HUDwF58LHkbM1/WiFnd0+bz1SxhTWydhxeqebGwDDqSG7mttWsVVNj8L0dZnFOPQSf9K3GcmxUaN9W7vipCUILBsRPqGa617WhXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630926; c=relaxed/simple;
	bh=zQPALyBx0oej5Phq6poYz5j2PIMvXej5vbQ31gyqREM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWcge1nMs+ImKyhAitYSVgdGw+V+Z3/vmiFCWRFqxXpyNFVwPsfCZ45IXkqP/f5ILVISfrYAJ9S1eTRvv6o2UHkmaH1bO/5JZUkC4vs+h5J0Sh/CYHG+xZ1Z77Cd2Dl6VXF9VUf+T9EVXCJ8uVjeL//ZJs/FYn80dV0pJD9yMv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9abeV/+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AA86GLPC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624DOuqD2861188
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 13:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MRjk3ferPzYR936MRayApSBLe4Euz+SBlgXPSHias1U=; b=X9abeV/+TPir3awg
	xMb/JVHs8K0fzK19v/daaqsk6k6t8VOb2akRR3MAoKSu77ilg9y1MdISOpmlhfld
	IKPfTYQ5sXzMPKPt7Wbws8NcSDNzCKtnvhj1/WHTTwHPofYOd5vMnU16NmItfCir
	zTcecpnVBQLdsfot5kY1B5w83iQg2eAaUiAu2ZeZW2UzFJkYd0+rmjG16j0s2Jka
	tgZeEjncs+j/GjEevpO9Fs1Iq0Q1F1c2OG/nQqZ9zzp7HwskRh78/lFbCr55dUzV
	48JVT85k/xIpLSMkdELGrVsTMquvL5R/QmG/lm8ZhZtl+73C1jClEzDRzoy7oqU2
	4x9scQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9m1ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 13:28:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82747fb4cf3so2788129b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 05:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772630922; x=1773235722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRjk3ferPzYR936MRayApSBLe4Euz+SBlgXPSHias1U=;
        b=AA86GLPCom4akcJc73nQgPWlAENXhn4C8+pncRDxLmdo0uCLWbPrNT0Y9so8v/EhqC
         /B9UG1GSbGNQCI6zazPnTbjDkM+WUviigtDwM3eK4QiU12ym4FVuJfBdRAab6QhJnrNK
         uB+g8wYHEnHQ0xDUwGzBLDg2mXRVPOqrL5rHnc/FGANp8ljiEt1VxuTpnTMSIR/MyHtB
         5jXRmQLZzt5CE3mj2wJ5eTnNTWS22aoJjd9cfK9fp8sH57NkXyxQO7diaozqVTcPSuMJ
         dCJvKFwtE2SRaqaFsoI5IB1oNfCQFWOLYhSMSwOeYpr/eMIGC4BwgLRwfjNYWMvQLOgt
         aGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772630922; x=1773235722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRjk3ferPzYR936MRayApSBLe4Euz+SBlgXPSHias1U=;
        b=LfgVxeLG+gbn8Vgy1SdeGDDomSxSW7T/XqXkbYIUYgaju42vpckUOye8hjNQLJF3D8
         wooTf1bfmOAQ29Hb/JRI6HwlNvOHEiUwn2BsRxLHZe/2HL8WX6GkVC9nm+ZmWaN2AvM1
         T1bARnPhs9fyFWEkWDF2WXmnePR/2KRm9Wei506nKjC4c5YIsQnt9y7CBLPbWOtrwdPV
         Gzebn6gqERQICo3RcfnVrFZmGUkaXkl/Apsf/2S0cCZYSWGxLSl2eIlg4T+O05yI2wqy
         12sXCkIfc90mD9iM69kxi/6I87rUsl5fkoaYUPuiTE2xuPJa6ukRcKtcvX0WtyxXM3f2
         jDIA==
X-Forwarded-Encrypted: i=1; AJvYcCWRqocONzDpvE/mXMUr9MbiPBBztnDpnXn7fbBYt19xVG6hQk0Da/MyGIgSX5VHAKw1ReCoi6FSd5T2h6FW@vger.kernel.org
X-Gm-Message-State: AOJu0YwL1zPUYgyXErhJZjiO4cNknSHZp+4LVKT92245o8mMjxnySXd8
	wGqBniu4vuUF74W04uJKtwAk7/5Tbw+0CZNVZ/UrVCbWBk1ddLUel0xBPRRUvNm+0W2QzMu+XGz
	jW8mQjqthI70zl5aMLZcZduQXgESauptJim0QONX30KJOJfDwtKB6lxaLt6OEmKsVtDqJ
X-Gm-Gg: ATEYQzyY7eu9geHZQGkzpatvGNCXHFmWghb2n43VB+j/tINcw5OgM0pNbxBv/4C1H/4
	US+Jj8SKF2x5rpYAXS83ephGDWpHEq4bceWnCpB2EH+GSAgms+G7sPPbQQbiMQJQzCHlXExUTAm
	G5uTduCqXgzu9d+3xfvQ6aU4IUoiL+yEnwqmiIdvUzvQIuSBVUnqAFgd8ZMYUj5BjMNz0Zjbpgi
	q4wMqsLAL5dpyGtct2xrErY2bvzeC4/QfQl7d3rlCi8eUIiCREIaqGHVehPEL8E3rf/BquMq9v0
	qbzg+XpcUHiNW9P3TOw/7kmTxHI6YdfYBLAcOTZjpfhTjLZ+IbVeEdYU56/hsJ8uhjOElRqMA5N
	lWvmTeJRS3hPAmgg6b0dFjHjxrHMLFbwpiUbh5f8qI/37PJCJQ/CFmQ==
X-Received: by 2002:a05:6a00:10c3:b0:81e:a228:f0c9 with SMTP id d2e1a72fcca58-82972bbd897mr1801008b3a.19.1772630922177;
        Wed, 04 Mar 2026 05:28:42 -0800 (PST)
X-Received: by 2002:a05:6a00:10c3:b0:81e:a228:f0c9 with SMTP id d2e1a72fcca58-82972bbd897mr1800978b3a.19.1772630921715;
        Wed, 04 Mar 2026 05:28:41 -0800 (PST)
Received: from [10.204.101.56] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4d8dbsm22937109b3a.5.2026.03.04.05.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 05:28:41 -0800 (PST)
Message-ID: <d3310437-2776-4c7f-a844-8dc5de0f6359@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 18:58:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: allow interlaced video streams
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
 <4CA1838F-504D-4EEA-99F4-B3CC5EB10EDA@gmail.com>
 <goqowrvdp4uwbakbp5cztujh5q5z3jroql7m7dumlp64lj4yph@4n3mjqsj5n7i>
 <885a74d4-c61e-414e-92a1-863faad931ce@oss.qualcomm.com>
 <uis6txrcj2thbtkrk2u3w23orzzjkluuzynqcijpcix7zlsvz5@kyrmka6zwtyx>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <uis6txrcj2thbtkrk2u3w23orzzjkluuzynqcijpcix7zlsvz5@kyrmka6zwtyx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwOCBTYWx0ZWRfX7rlUDpQh32T6
 Ng9zKcllMfe70QqihOJbam1+v0fBhzjc1HvXXcIJUWFe19DAL5r7jn9hQcYNSXlFi8zBVRlVz+M
 angpZjgLVD+NbReIXAhA3n7aGQ2F7QOGpjp8kWxiMAybVA4hq1/Tlh0HH+DzqxjnxQOEcj1p97i
 HAAu6utAtfCAk7tEK3Bz/qChIAwtIdyNNQki4rfbYW33Ph+PcBLZlzRy5NTOleBzMI/9NufwqFf
 BijM4P6g1a5J0j/z9mzyk74105Pcdp/vs+3+gjwkjYYhgGpjEDxfCQ1hWdKWaNNIlh7mHMWhtTZ
 Z9GPxtsQdQUB7408N7Vo31QplgIfrvuyi2jsnCesSKMsfsUoxFpweEI96GcE9zeUb3qh98BAW9e
 +imUpdim5WANnOdTad7F0IIIghwtVj8B6XAsAYJH++ioNTS/uWoDIzbz5wLuOTtW/vlyTHA6X3t
 WQCTFT+3FuUzftaichw==
X-Proofpoint-ORIG-GUID: pRMyIEeDesHFBl_wawr8dU_uRJwfsA4s
X-Proofpoint-GUID: pRMyIEeDesHFBl_wawr8dU_uRJwfsA4s
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a8338b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=wFsewLjXzL0l_FF8NPcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040108
X-Rspamd-Queue-Id: 6D3492006F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-95326-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,samsung];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/2/2026 4:58 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 01:01:18PM +0530, Vikash Garodia wrote:
>>
>> On 3/1/2026 4:05 AM, Dmitry Baryshkov wrote:
>>> On Sat, Feb 28, 2026 at 09:54:20PM +0100, Piotr Oniszczuk wrote:
>>>>
>>>>
>>>>> Wiadomość napisana przez Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> w dniu 28 lut 2026, o godz. 10:49:
>>>>>
>>>>> Venus driver errors out on the interlaced streams with the 'field isn't
>>>>> supported' error message, which e.g. prevents decoding of the MPEG2
>>>>> video streams. Don't error out if the buffer is set to contain
>>>>> interlaced data.
>>>>>
>>>>> Tested with the fluster enabled to handle MPEG2 through Gstreamer:
>>>>>
> 
> [...]
> 
>>>>>
>>>> Dmitry,
>>>> I applied this on 6.19.4 mainline and give run with interlaced content (hd tv) on qcs6490 (radxa dragon sbc).
>>>> Playback fails like this: https://gist.github.com/warpme/a368983678af0a76af85314808773076
>>>> pls see a bootom kernel output showing venus failure.
>>>> my sw stack plays ok on e.g rpi4 stateful v4l2m2m so i think root cause isn't in my userspace....
>>>> pls let me know if anything extra is required to fix venus decoder issue.
>>>> br
>>>
>>>
>>> Interesting. So, most likely, H.264 decoder can't cope with it and we
>>> need to allow non-NONE fields only for MPEG2. Let's see if Vikash will
>>> have any other ideas.
>>>
>>
>> Venus should already support h264 interlace.
> 
> I guess, the question is: do we support interlaced H.264 streams?

Yes, we do support interlace.

> 
>>
>> Piotr, do you see the same failure without this patch ?
>>
>> Regards,
>> Vikash
> 


