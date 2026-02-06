Return-Path: <linux-arm-msm+bounces-92068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G2cHc8Whmk1JgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 17:29:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15048100436
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 17:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 808A130474DC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 16:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D41E328B5D;
	Fri,  6 Feb 2026 16:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMjvYDAM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1HJgzr8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20EE328B40
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 16:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770395157; cv=none; b=srhjZQcJUGcqLwsVIaToqiLhBC2vaFEfxOIvLuxnG5+zGe9wQVlq/O4+kqvCwQecvn8YiPNIX5cQ7uGkWcer3fN4gNxhev1yLl1bTJ1aiX4rWICDIpNyCHYyvIJcJ5KTdFpYZax7q1Yd/X2/AA5JgrcovaM1LvhKTxLYYQvSYys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770395157; c=relaxed/simple;
	bh=L+RyLh8sBuu8YvmjWfQRyVyQbZu3CDhKF5N07Ql1q9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=js/5Jrl/6NlDiKmC0pI3YGyuu5ItGiE+7sDkMUE13S1beeLyMW7EU8yEFKokWvBSk8OWJA8KDXFkuFkjHb3qsRVrOrm/QYosqk2nGgxBTJWtu/1oj9b28Wr6IWSA2pxO4fUS7gyKi2eJlnujGKIgaPlTm7XcMjvl2qziftgXj7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMjvYDAM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1HJgzr8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 616CAwf23012903
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 16:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QPJ/rmJU5BtYs54zO7m6WgcYTCJKwZy9Y/qBdA3qDqk=; b=bMjvYDAMCjfD9Xvb
	GFAsnqDCIWmIoZjo73LLsRaw1dOIgH3jLDg53qv3dUtcGFJTtBf4wPc2ocUFhVb1
	qPVmtcsPI/WDvgMHXPJUayyhAn4P7waHQd9o4g37NY+aBYfHmNCRMeVaL5QbrDD+
	QTVeZnu9Q9+AjAGITrTD8xn56re7/qnZL5IwFGkhbBJ1+zWCuczF2l7+30UwVJwl
	/0t3McqYLWYs2q4QvuHo1xGrFKF2eYtE45q42jc9X1aO0C9MpLJ7+rLYowekrcSF
	81QkzhR6XyWJL5klqobp5h1fIzDi30I2r/kYAKH06JcnPxlN29dpqBVq3YV3m+KR
	BtMeuA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c59ukj0t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 16:25:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f3fb8c8caso2247429b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 08:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770395155; x=1770999955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPJ/rmJU5BtYs54zO7m6WgcYTCJKwZy9Y/qBdA3qDqk=;
        b=Y1HJgzr8u9SL73a3Tp5JIEau+hhGIRDILzif4yJgKTP98NES2ANOCBYczg29tztOe/
         XAxcTz7027VzmFmlGDlqKzYx4PpoBsQB4ZWOSX+v9GYGRseKXybzqiHFGPLdFbbywteg
         c4oVrpGfJuum3RGLtvWKKJ2RVHhHcKCxfnwlSQvpZKuYU2XGKk02F2YGzCXFQyD/ioqr
         Hc9voK3iLqnJyo+eMQO+nIPz8ZjYkawvYBI+zWmGq3jgYQcgnH6FuaO8zuIkaeDZEiS7
         vVnMF9saicF654qTjjORK3hrWNSX5Xk40a6DoF2xLwq0JkE2PYKtn2y1+roHG/uYguhx
         qeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770395155; x=1770999955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPJ/rmJU5BtYs54zO7m6WgcYTCJKwZy9Y/qBdA3qDqk=;
        b=q/b3OwnWfT+h81G9I6KTJ9kAYNa3tLVoe5foUa9QMVhKyA8ZlOdDEmDvvBl4DCoZa9
         WrziF5nqEW7fG667OvnGoAf7pg0muW1lVdm/YfXAtUUkoEYZWe7HfDUHcG/owueS+pJV
         o3tSTVZcqutSPA99by7a6v9ewqP4jvs7+DGkb1+0phSJgLhXeej4oUi7XPIITplR4g0K
         QQWe29oK6NdHMVKnw6d0/SN3GzxeSVFV1NoDoFtIX0rcK8PJDeyenxCfUTyMnKOd+Fal
         vXc1RmHh9Fqm3vBwtFqqTUIrs6zBxRsaRLZb8pv+bTcDvvVMliRb081kbY6jEWaUTPgI
         hNfw==
X-Forwarded-Encrypted: i=1; AJvYcCX88jRJORORCGqgbd3LnkMFk3nsITKuvzzcRMX0U95b0N/xpcIpYR8Aao3OxfBWzW0BP1Kbdg1RsFpZd1zu@vger.kernel.org
X-Gm-Message-State: AOJu0YxKdfV+UnMvry9nbnxWcJysdy2buFDMXPcPF7Et+7Xd4wA+8DCX
	CkFQug1OeL+simJ91kinqEPnsg++XDCUpJE23TsRolSlrTg5ZrG8Y/GiQCAdwCnj8gPlvs2nLv2
	LycQflTwSclfzjUZpT8mOS9zeV2kb9gjTLS+2PuhNJouzhrhrXy3mNsOH9oeqNvg6Himk
X-Gm-Gg: AZuq6aJDdLs5TUQM2dst99AYXR/5lGGxihrv3fnOR2UJf1nWEa+tYQmHdQVdoHmia3n
	lV8xofCGoa/S0HuNyVLSm+YI5/p/oa4OuhUQyrjauJIqrh2HlQTFXYA7SPy8Jw28qN6o7YPWKtB
	xTpCf1zOcigIdHHk+wt1nxKhvt8AO9O7EyqjZQDXuOW5bTb95o7/sMx/lXXuFWDdId7zb5CIwxY
	si9MzE8l4/tA7xxiOrvGjUodDfJ5pwpYRsDu2pgz6Up7VmZIMRpiMhXrX9mgwOoOqqQ6fyfXM/7
	lF0zBdOA+8PauuolhJlFEbu0srdgBVCJdc/cApfY4J4YpbCWti3hh5VdhR0/nUhufXKrEzjYmjx
	wFikWuh7Yj9yDBcijF/mTcnaGPR6q8YtLhJp3uBejmv7gB5w=
X-Received: by 2002:a05:6a00:2d8a:b0:81f:3fa0:8c38 with SMTP id d2e1a72fcca58-82441632363mr3006324b3a.20.1770395155274;
        Fri, 06 Feb 2026 08:25:55 -0800 (PST)
X-Received: by 2002:a05:6a00:2d8a:b0:81f:3fa0:8c38 with SMTP id d2e1a72fcca58-82441632363mr3006302b3a.20.1770395154793;
        Fri, 06 Feb 2026 08:25:54 -0800 (PST)
Received: from [192.168.29.115] ([49.43.224.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8244168fdf5sm2990653b3a.17.2026.02.06.08.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 08:25:54 -0800 (PST)
Message-ID: <241333dd-df8c-166a-e119-6e23cda3a876@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 21:55:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v23 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Content-Language: en-US
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bgolasze@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260205-next-15nov_expose_sysfs-v23-0-b0c5bdcc9f94@oss.qualcomm.com>
 <20260205-next-15nov_expose_sysfs-v23-2-b0c5bdcc9f94@oss.qualcomm.com>
 <CAMRc=MdHKCg90fc0UJ45wXYPn=F-dcLhDrv2sO-=VP6k4=UqLw@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdHKCg90fc0UJ45wXYPn=F-dcLhDrv2sO-=VP6k4=UqLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OM0qHCaB c=1 sm=1 tr=0 ts=69861614 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=easabUhB3dF0LzbC+5H2iw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=tl4a_pDjrRj4r-21QCAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDEyMCBTYWx0ZWRfX/qAcGuTB8nYI
 bBhnJIL+QlBCasNKb8SxgkLYC1Q8bUoOzd4MR5uWZLOzSzPFB7qihUVYNDU75XAdNne8VckaRX0
 7OyAODqMB9Ja6zNoq+CEimeDLzlWzt+ini3ExDykvMG+W6vcL5HqZ7l2Eeg0nyAHadkoi/Z2E12
 3vSoiPWH6BfCH1OCRJMTP0CepubarnXYELUhj9Ew5tbyTBqTni+cNf9bKWDJ/A6UUe08EHbSj6V
 g+Ch2vil5xDSO+h35EUDqXBSE+o09jlKmFKkZXDUQ/3qyBR6iZN39ZAc9NuDQ02JVU8SwohvurK
 RN06sEYkVS0pfi03DjdU5icGdiSsLv+edgNX/A+kJeSwkhwxANe395izCP9WmC8ZXxheIFWmGWD
 5mkpigqsblZHgvaFg+Mxek6YWlgTDIvRdXGtQ5JpXsos4W4fGMDcCmHu7DSXedU7/NysSegmcfN
 z+ahiKVsKYMkHxuRe9Q==
X-Proofpoint-ORIG-GUID: uQn25h5mpzygCEHKzMhCGlkGQrkCnJ0q
X-Proofpoint-GUID: uQn25h5mpzygCEHKzMhCGlkGQrkCnJ0q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92068-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 15048100436
X-Rspamd-Action: no action



On 2/6/2026 8:49 PM, Bartosz Golaszewski wrote:
> On Thu, 5 Feb 2026 18:17:14 +0100, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> Currently, there is no standardized mechanism for userspace to discover
>> supported reboot modes on a platform. This limits userspace scripts, to
>> rely on hardcoded assumptions about the available reboot-modes.
>>
>> Create a class 'reboot-mode' and a device under it. Use the name of the
>> registering driver as device name. Expose a sysfs interface under this
>> device to show available reboot mode arguments.
>>
>>  This results in the creation of:
>>    /sys/class/reboot-mode/<driver>/reboot_modes
>>
>> This read-only sysfs file will exposes the supported reboot mode
>> arguments provided by the registering driver, enabling userspace to
>> query the list of arguments.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
> 
> There are some nits from my side below but nothing serious so LGTM anyway.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
>> +
>> +static inline void reboot_mode_release_list(struct list_head *head)
> 
> I would have passed priv here as passing list_head as argument looks a bit
> weird.

Ack. thanks. Will pass priv here.

> 
>> +{
>> +	struct mode_info *info;
>> +	struct mode_info *next;
>> +
> 
> These could be on the same line.

Ack. thanks.

> 
>> +		sysfs_info->mode = kstrdup_const(info->mode, GFP_KERNEL);
>> +		if (!sysfs_info->mode) {
>> +			kfree(sysfs_info);
>> +			ret = -ENOMEM;
>> +			goto error;
>> +		}
>> +
>> +		list_add_tail(&sysfs_info->list, &priv->head);
>> +	}
>> +
>> +	priv->reboot_mode_device = device_create(&reboot_mode_class, NULL, 0,
>> +						 (void *)priv, reboot->dev->driver->name);
>> +
> 
> Stray newline.

Ack. will remove this.

> 
>> +	if (IS_ERR(priv->reboot_mode_device)) {
>> +		ret = PTR_ERR(priv->reboot_mode_device);
>> +		goto error;
>> +	}
>> +
>> +	return 0;
> 
> As I said, these are nits so fix them or not but let's get this upstream after
> v7.0-rc1.

Ack.

thanks,
Shivendra

