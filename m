Return-Path: <linux-arm-msm+bounces-109735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIr6B+hKFWq+UAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:25:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5395D1B10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F75A3010148
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF453CA48C;
	Tue, 26 May 2026 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyG4JJDR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZPBQZN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5BE3C9EE5
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779780320; cv=none; b=j9Zv8Pt/FBty226ikmoCf/AUpo2rSUyj+bPYsS4WEOkqcbDyUEZYba2grllgDwCG1nd7ZVtqynLKgmhHcl3z69uioc771eioR1cMvZhnuoPlZNASJTvdEnES24d59PZ009b/Wu0lcWhetf/FUbOoyMkkkrL35qP6ckwrampiNQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779780320; c=relaxed/simple;
	bh=e98yY7FBU4ztLrfwflq3MKeC7JaeU89bB6UXwZ/KjpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=n9EbgzcFz6shNgQMrS/YfjWvpL2sR3PdiCwFnAUOHbvtFllyG3503ZqDcBVBTqPmFoax30bwZBRtG1IRCJriuB1sjv5/80XUrdm44lODuhgJ4p/oZ2SxeTbnCP4rGvZLoR/K7WHJQHwTRedKvu5woPjBLvzXpV408NFuj/VHs8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyG4JJDR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZPBQZN9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q6awPh3263677
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHBSErm/baHSTdbtmVoVnrvbO2RjAxaPcuo57MHOiLk=; b=WyG4JJDRy+Bn8Nj9
	SWdxHM4cP0KOoXe/i6V0Bx+lGDSCB+mVjvCy/y3U8eErNsLEXjgZFnG8KLLBA3f1
	jveT8o3lLBMNCTIpt2YlhMiHTDe9Xozq2jHaAb0ob4sBgTS5WFD/4kzo8B1Zos+D
	r096IWn/6aqR5WJIeriLF5O/X1A8+NrabCd0kAJlDTxSTMb1inAUJJ+Qxu/uUrYg
	BmHGLdm973nuk3A4fkr3PWg6IZgvHRGUs16HT4OSGQU4X+K/CT/oX+tKdxnEm5Wo
	ynSZy33zfgtlHN7xbs+fa40YNd/7fLC/rGsYMi/0XqxqpQ1w394ctMubgNU7lqm3
	DLfNag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs366r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:25:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba115ab6bbso112209345ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 00:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779780317; x=1780385117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VHBSErm/baHSTdbtmVoVnrvbO2RjAxaPcuo57MHOiLk=;
        b=AZPBQZN9qg223vJZ3GxJwNak6xkMi1WLIUPSXqEW0Ni607/6vdSJIqEFXhBJMnt7V5
         ShP8gcA+Q/9dgTYbC5TsO9jX7GaXl5DxuzFEyaAuGvO/81JjYRoxHYeTfX0JKRLPUk5y
         75P5ME0hPSBwaI07g0eNvieB4cLh1nsTM8nWAcBplVjUF+4m60H2LhTzJvuFzKL2ax1b
         X9Mt365lTuFw3JIRDDgnWMZDZuGSycd0bZBTmZgCNGZBiKbSmTws0o9JA4WOMCUgaFQw
         eZZ+86GpdYRmOUr+3LazowvB0bgNtYX5K0HufYKCBlhJ83Tz+5X+hcVlywpa5tPbk6yK
         1Tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779780317; x=1780385117;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHBSErm/baHSTdbtmVoVnrvbO2RjAxaPcuo57MHOiLk=;
        b=SZzRDJv1DnxqvNe1rbEDMQZahZkL31n7YqwYj8TZd8nOlmiSSoMioK++ds5UiSeMwu
         EaIt3mOF6YVto8LDzjc0BPLwcca7UrapTOs80zPlNE4RykN9PGnwTIagVoqy0AMkV5jv
         HlolOlSaRGEbPYGgOa5dNlQDf+XXvV3rOQQ/hG/HUoQoYxyy2oMJT+JbJ9PFjxhEz9Gu
         ZzRka6pTKoMR8CtrEpzz5xKx8vUTwq7m9uq5e6nroHR5/HzYacdovZRKiNfWDSPOKw/b
         lrdt83uhdu6Qw1R1Pu6oslAPbLgWvfEgVDY27puILWMDW3vNeKZEfh4vuQC3nYWbe1WT
         bF7A==
X-Forwarded-Encrypted: i=1; AFNElJ9b5XL/0uQVu2kbAfr2Axbsixl5351ZSePXqLZiuZWbDv/b0PjTDs90l8lph6oTlcx8Jv4F8bHpDBgtDYBX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4LeqBMpKLXQRq1ur1U3s3xIOvqGPh3WHxInjMeHlvLdZQ9CE0
	T2mHYhh+848ethEL1qqU9aZHmw49+Wbz8vfPog7ennXE5M+QLm0xeuwlt+7tsrGu/xghyUMwhsU
	RU/+GpcFv+BJhuHImpNDdPU/sY/RLFAw1GHeTvxCSqS8PiEj/JMsKInuVKBgr9CPcFfzd
X-Gm-Gg: Acq92OGZWvM4Kf9BM+iaB5WbLMJ1+6C9MFRaISYGqTChkCfmEia/zWbBfT5vh4DFT0/
	pRz0ypyK7y8y6xYyGNwPSATtTd7Dmw9CYwxzc6WqX8iQWhnEAClHqhgex2xALaIn+z4Br01rWDX
	gXm+4K2IOAHgkcNkVnpxDzku39DMXSay29q73Sx2qTf73rWSB2+ckMobLihUCYPiOZ0gbHB9m2q
	xWu5qF0WH3h1EH4NvbP/50py3w6rwysRnTCy6ri/ZQ/B4BV5E2ISOSZSP7R3fq4SlnxCmeLScUc
	gkwx6blvaf4S17fbj8bcPfKCx8kMzOG9dxKzwmHNMsCFCUbw6XH7tO4FGhEzmZEynxXjYCUIoNE
	D5es+gUJ2XASpCSfNolVeltaXZREbt1nSgFtLQ8iZ//Ag+CDQbYLRs8JhRXX1mKMlf1Na0apUry
	DeiXA0MGr+SOLoI2Yb
X-Received: by 2002:a17:903:32d1:b0:2b2:5597:bad4 with SMTP id d9443c01a7336-2beb0770f45mr198289245ad.30.1779780316802;
        Tue, 26 May 2026 00:25:16 -0700 (PDT)
X-Received: by 2002:a17:903:32d1:b0:2b2:5597:bad4 with SMTP id d9443c01a7336-2beb0770f45mr198288965ad.30.1779780316320;
        Tue, 26 May 2026 00:25:16 -0700 (PDT)
Received: from [10.133.33.225] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b3058sm117251945ad.39.2026.05.26.00.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:25:15 -0700 (PDT)
Message-ID: <5b838092-8372-4ffb-9367-a78f19ccdbd5@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:25:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-3-jianping.li@oss.qualcomm.com>
 <xnkycubizpoe4rmhc3jt36ulx2fb3tubjybu3djovafkqqttmc@o6vw2so5ctxr>
 <37146a3a-b18f-40f1-b95b-0ac19bf6c07a@oss.qualcomm.com>
 <lvfwkplrktjldbvn3j3jqh7ds25prx723at5t5oobsvhgolngs@pme6jiac5xdg>
 <85c2bfd1-8e69-47e4-a360-10a2655bd43f@oss.qualcomm.com>
 <CAO9ioeUgeo-MiP7pNY16wL9d7LKEi7PR7pJtH=1hMg-mnMSOPQ@mail.gmail.com>
 <4dc05557-ab95-468f-b972-84fe9fa3cc51@oss.qualcomm.com>
 <osegqij5pitd7fjgpbslddbqgbz7lqrsjoneyep6izwu3kynhx@afvrjqpib7bh>
Content-Language: en-US
Cc: amahesh@qti.qualcomm.com, arnd@arndb.de,
        Greg KH <gregkh@linuxfoundation.org>, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org,
        Ekansh Gupta
 <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
From: Jianping Li <jianping.li@oss.qualcomm.com>
In-Reply-To: <osegqij5pitd7fjgpbslddbqgbz7lqrsjoneyep6izwu3kynhx@afvrjqpib7bh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a154ade cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3dfTGY2RfG25o-zzpn8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ZYiCdBO5R6TG7oqVX-Z8b0oAkQLqeGYc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2MyBTYWx0ZWRfX3JsT20h/Yrhk
 aLZCiIrHAlXUBXVNo4aMbVVBnJxDdf38GDRPToyJ7ozmSQDf4gHUBW4jzIpQy0+Xb/qsTQj7Hzp
 JtUhpE6PmNrjzhgyYiLZ/NmbG3oHS14R7LMzUMDDArllc7uPZs2J/zLR0I8rdI/PH65kyydWVAi
 43UtDUE7hnxgUpGjIXNfZKSrxXzgwlcxo8GuUt+3cVV4dj6RN5AYR932NEPt5vmgUh44AsekMeR
 xHd0FG/VTTRYhaYXNti9aBoR6D+oOZWNqu6pHfu67vx4btmOpM9t2vjNBZ+fJfzpFS1ITAJDeSZ
 XubYOAaRjjPT4+yJMeuNf0FwYp9Ws9qVnHqeyASOkvsneNuddYtXwU5qSMf1MunxBDP3t7mrXrT
 SBSEqfdPj/cb0fAhJsi7Idj3DnirgXKcRfi50oo9Sgg3jCvhmUZbfVWZH9LQ+P9tlNzfEWt2954
 rrBCwun1N9MyyibyIpw==
X-Proofpoint-ORIG-GUID: ZYiCdBO5R6TG7oqVX-Z8b0oAkQLqeGYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260063
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
	TAGGED_FROM(0.00)[bounces-109735-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: BE5395D1B10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/26/2026 3:06 PM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 02:59:31PM +0800, Jianping Li wrote:
>> On 5/25/2026 5:35 PM, Dmitry Baryshkov wrote:
>>> On Mon, 25 May 2026 at 11:34, Jianping Li <jianping.li@oss.qualcomm.com> wrote:
>>>> On 5/25/2026 4:30 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, May 22, 2026 at 02:55:29PM +0800, Jianping Li wrote:
>>>>>> On 5/15/2026 9:36 PM, Dmitry Baryshkov wrote:
>>>>>>> On Fri, May 15, 2026 at 08:42:14PM +0800, Jianping Li wrote:
>>>>>>>> From: Ekansh Gupta<ekansh.gupta@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
>>>>>>>> getting removed from the list after it is unmapped from DSP. This can
>>>>>>>> create potential race conditions if any other thread removes the entry
>>>>>>>> from list while unmap operation is ongoing. Remove the entry before
>>>>>>> How can it remove the entry from the list?
>>>>>> Multiple threads sharing the same file descriptor may invoke unmap concurrently.
>>>>> => commit message
>>>>>
>>>>>>>> @@ -1898,7 +1897,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>>>>>>>                      return -EINVAL;
>>>>>>>>              }
>>>>>>>> -  return fastrpc_req_munmap_impl(fl, buf);
>>>>>>>> +  err = fastrpc_req_munmap_impl(fl, buf);
>>>>>>>> +  if (err) {
>>>>>>>> +          spin_lock(&fl->lock);
>>>>>>>> +          list_add_tail(&buf->node, &fl->mmaps);
>>>>>>>> +          spin_unlock(&fl->lock);
>>>>>>>> +  }
>>>>>>> Is it expected that userspace tries to unmap it again? Or why is it
>>>>>>> being added to the list?
>>>>>> User process can call unmap and fastrpc library won't call the unmap again.
>>>>> In the other email you wrote that the driver can be used by random apps.
>>>>> So... what happens if userspace unmaps it again? What if the userspace
>>>>> _doesn't_ unmap it (although you've just readded it back)?
>>>> If the same buf is unmapped again, because it has already been added back to the list, the unmap logic will be executed again.
>>>> If userspace no longer performs unmap, the driver will not unmap it proactively.
>>>> The Fastrpc driver will free up this list during fastrpc user-free.
>>> It will free the list. But what happens with the memory mapping?
>> When device release is called, DSP side PD is also cleaned up, which includes cleaning up of DSP side mappings
>>
>> Before kref_put of fl, we call DSP process release, where DSP PD is cleaned up.
>>
>> After calling this, we go ahead and do buf_free of the list
> Okay, capture this discussion in the commit message.

Got it, thanks.

I'll update the commit message in the next version patch.

>
>> Thanks,
>> Jianping.
>>
>>>>>> Fastrpc driver will free up this list during fastrpc user-free.
>>>

