Return-Path: <linux-arm-msm+bounces-109608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PnVBCUYFGo4JgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:36:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 820EE5C8B45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46CE730207FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977C135B633;
	Mon, 25 May 2026 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVE2wz5G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACwz2g9d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230213770B
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701683; cv=none; b=Y4cF4XZUfn2/0bBMwJhQr/BxHb4BFaJPVDBbn1n80ko2PRgP/Uj187K+XcWKLd692A2JDw7RAcE4fDXW76EoeIVmWgyV/WXG1n+P6D1WDo5CQ2awI8Nvpz5Qb9zxLev9Ng4BG8a7CkoFVGoAzt+u04ifAONJhgfTf4HcNn7yy58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701683; c=relaxed/simple;
	bh=4rPV+ZGV/3V3cojckC6VpTU8/mUjIdJFtaWs+wpBmpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=I67I9styFqvo6Tg2swSIg3bPOp+GXCnV4y8Cl6m0dIIt2MJCm9Z89WNqki1cIZ+8nakklQIhmZK96AtT2Q8XTTh94NxtfzKoPdmILqPEQzz/Qr3xcPN8VkJJa21Mvzz/UQnX0Ax4OC/d1uGIgCF4K/kPzoOCKmEJEH83iUjcs/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVE2wz5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACwz2g9d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9ERjO079361
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDdyvgPHBYm4Smh+LW+i3c/LYOm4H7fTfg/6tMvRWrA=; b=PVE2wz5GcIfFLFz5
	arx7gYTN9h5jQFTkVdyHfb6M4R95MtY4AWmM3tnMtXBnivfLUe5/2YDDX81T8bSl
	TQ5Kl+MfoxuhfIWZNc+VBZAn8AjAmC/ad3Z6p8tJKlzE3vqZ4xTir+96i1sPlU19
	HbpXL/SpxER4dZfW7P/95JzRLo4ZUW/afwvPBS7x20G7tXqIPPddQNly6HFoXImG
	w54B3VIw//+Ka/AeDbBeuW3mA2RAoYLyrc2807M7aFEorUr634961Cv808hC1AzE
	Jkix5Ev2ja8oEl4CddQq+FyQBJWmzOdZ/zMltlFT0rtjeTXbnwtj5SPVzzEEZM/W
	Rpxr2w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma82ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:34:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba6fe41283so101484425ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701681; x=1780306481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HDdyvgPHBYm4Smh+LW+i3c/LYOm4H7fTfg/6tMvRWrA=;
        b=ACwz2g9d2GuVs8ueRrhG4Xv75ffC5AD4Z73eAAnZBBP5286/rY4LN79MpuACFiZgaj
         H8v1Ivto6jWcEgtnVkRnR1pnLivkmIuFWJ+VS3bKbLIIDQ1mZ7CfX8MVOQKDQHfsahQV
         z9k52qFiSy1HYhLhz0Tq00uteeruP+hhRxTQSOepxTyh9hY1AUQl3H+7IeuRGDHPcugp
         F92fD/HxTxG8ErgoVTEoXsuK9q9M9+i2DAd0ErNzRhTeU9598pl1wC6VlybMAHKVGJym
         0CgIblratmtajoD0CQUkyu1MTs7IFZlIdWwKSdOOYWCtngho97+dUeCUliDwYodJfvka
         WbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701681; x=1780306481;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDdyvgPHBYm4Smh+LW+i3c/LYOm4H7fTfg/6tMvRWrA=;
        b=hPJ3B1sTevlIkc4OTJNxDjlMX6pfMM0VPN/coTTy0lyB6paa28HHtkMivLYg5qpnaz
         mgF9kh716Ez6I+3wDFdblH9hlF2TPfc/bQTvxsajJf50AHqo73gLEHRAHsyDp3M5HEfO
         Sx+wdWol+VXFYSuHq7BKKjwNtl+KQuq0KPITZvb9tpHUeAJ78w2UJvHD0EYXbfA9mJBW
         XocdwqlUdyY90K4qpSxkCvsWHaKbt73BzCzJxKfvToIyBfCZe2In+aN9VPgtYYoo5p0x
         2gm5+ghdUvLoFDE21aeubUIEByHQ2uZ90S5LQT6oZlfqkxjV9dyJ8iALpEj8ezgphEnP
         sHlA==
X-Forwarded-Encrypted: i=1; AFNElJ+2zEdRbRYhKeE4wD4YakiWHglcdnpLjoXayBCjStkyBSEmaA3aLK9SZa5RvDNNPE/Mzaz6i4gWmt268OH4@vger.kernel.org
X-Gm-Message-State: AOJu0YzNEt4oHXvtfVNVb8r2tzAQIM7jkCbQPGD7l5/EZWvK4/p7B4Ru
	xSSr+8nIY/FRCMcI95KKNeJLXXoKkxseAK8dMAmOBIqSO0naHGKQyyMnmL+xUgUPOe55fBrJHSU
	rb0sFJHM6vo0thXL7gGPINPlGav+XS1RFQ3HeWlTsIf/XSbEpTepk4zMC3X7znaP2mjSU
X-Gm-Gg: Acq92OFF9WrJCeHDMK2vW1RY/ME0azATzKSMrvHNnqg14sSZ/Gwum4rx6c+8M3voMsB
	LFLVX3VDFf4Sn0eSMj2aBuJlpkRcUZcClGwGK9w/g4IxI/GFFzS8q5bwvVEE+Rk0xszGokFpb03
	+bsVVxM5HfOemZSM38K6L4LozvREYmcNXm3vYT5h3EW/PP5LVo1HlG1xjnrZV2jwcVVsykzNG3L
	CsC6l8FT4BlpvnlHIJ+OfCu+fwjPQzyADGpUhwS9EmgJMsGqfuuaHUXmwajAkryjh7bSUzjcPkO
	GC+cNYBmkzvLvDQRtGQDZDvGd05Y4rU/HPFFSAIYeK7zCPSoNT2DCQ2KEXlogcUqInAaUgaeAd9
	OYZgs7X2I2nYIht8/lc70FJP7I/jJlpfAMsDHUS5/7nDlsFVVIxU7q8dx48wnvvi9v5jpw82g4d
	jKzbjsrnEbdK4xiM7wfchd7/MMEnI=
X-Received: by 2002:a05:6a00:3e04:b0:82a:7471:eb90 with SMTP id d2e1a72fcca58-8415f66c854mr14233886b3a.30.1779701680814;
        Mon, 25 May 2026 02:34:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e04:b0:82a:7471:eb90 with SMTP id d2e1a72fcca58-8415f66c854mr14233849b3a.30.1779701680195;
        Mon, 25 May 2026 02:34:40 -0700 (PDT)
Received: from [10.133.33.215] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9e1fsm11160434b3a.6.2026.05.25.02.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 02:34:39 -0700 (PDT)
Message-ID: <85c2bfd1-8e69-47e4-a360-10a2655bd43f@oss.qualcomm.com>
Date: Mon, 25 May 2026 17:34:34 +0800
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
Content-Language: en-US
From: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: amahesh@qti.qualcomm.com, arnd@arndb.de,
        Greg KH <gregkh@linuxfoundation.org>, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org,
        Ekansh Gupta
 <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
In-Reply-To: <lvfwkplrktjldbvn3j3jqh7ds25prx723at5t5oobsvhgolngs@pme6jiac5xdg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a1417b1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UrbuGVNNhqs0kg2t1zgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: GjhxaVz51wcpsTdroSP2ZZ_RVBosiJEE
X-Proofpoint-GUID: GjhxaVz51wcpsTdroSP2ZZ_RVBosiJEE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NyBTYWx0ZWRfX+T4Ljn9dQQca
 Fl4vZXT1ZlkSkKr8wUiUhslwKsaRXhfY2dtr5SxQToURTsZEZEITf0cdopjtCrpRgj7oyZPASuw
 NpfQ+b19scVEYSwDeJ4qIznLICVbMsSHbsBirfAcEgA8+ua06UAun8Qk3dz0PGK/jqzEBkHtRcB
 Wz8PO7dLnXF+dR0bUhcJqJAG2ubJ/hOAbhVznxZI0QoXncbhdN3knfg+ui5YM/2RUwRVWgmMBP7
 lIU7y83AfeSCnNdZB3yH2QwfLKbOqU1sJ9khs4INoURxdeSmcOOyqC1IOqREWOmG5sNgHvxPYY2
 EfT+zy+6zwdTIsvhenhg3O4Bgnbb7hbrY4bYQDx7b5ojMJaU9iBYRUQIgBSO+OD9SUAbIBhWRnh
 qZmwqH4DQ46n4hgHRzCofnCBcNvFeAx2eBzNBeOY3zw8AJF4NR3PFsfO5z2JomZ6s7mDftsKik0
 EloDd5zNzNHMZsQfExg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250097
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
	TAGGED_FROM(0.00)[bounces-109608-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 820EE5C8B45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/25/2026 4:30 PM, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 02:55:29PM +0800, Jianping Li wrote:
>> On 5/15/2026 9:36 PM, Dmitry Baryshkov wrote:
>>> On Fri, May 15, 2026 at 08:42:14PM +0800, Jianping Li wrote:
>>>> From: Ekansh Gupta<ekansh.gupta@oss.qualcomm.com>
>>>>
>>>> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
>>>> getting removed from the list after it is unmapped from DSP. This can
>>>> create potential race conditions if any other thread removes the entry
>>>> from list while unmap operation is ongoing. Remove the entry before
>>> How can it remove the entry from the list?
>> Multiple threads sharing the same file descriptor may invoke unmap concurrently.
> => commit message
>
>>>> @@ -1898,7 +1897,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>>>    		return -EINVAL;
>>>>    	}
>>>> -	return fastrpc_req_munmap_impl(fl, buf);
>>>> +	err = fastrpc_req_munmap_impl(fl, buf);
>>>> +	if (err) {
>>>> +		spin_lock(&fl->lock);
>>>> +		list_add_tail(&buf->node, &fl->mmaps);
>>>> +		spin_unlock(&fl->lock);
>>>> +	}
>>> Is it expected that userspace tries to unmap it again? Or why is it
>>> being added to the list?
>> User process can call unmap and fastrpc library won't call the unmap again.
> In the other email you wrote that the driver can be used by random apps.
> So... what happens if userspace unmaps it again? What if the userspace
> _doesn't_ unmap it (although you've just readded it back)?

If the same buf is unmapped again, because it has already been added back to the list, the unmap logic will be executed again.
If userspace no longer performs unmap, the driver will not unmap it proactively.
The Fastrpc driver will free up this list during fastrpc user-free.

>
>> Fastrpc driver will free up this list during fastrpc user-free.

