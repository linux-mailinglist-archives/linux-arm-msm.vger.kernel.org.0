Return-Path: <linux-arm-msm+bounces-82038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 069B9C626C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 06:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A27FC4E04F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5220E30EF92;
	Mon, 17 Nov 2025 05:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOGjgc8K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJjLPwv1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FCC26ED4A
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763358041; cv=none; b=oalKNwPWGhkTethpLb0jbx44edu3hSULjQybKI5OoB0X3zEuHFyZfqYF7pYI94/5QdblzN7b7z3EL8OsDZYwaqBGtCX7MPEddrjgbEmA6VN2s2t2OXxkBgn8RqcLRLS0Tf4paDS37c2NvFmweUANeCk4LZ4Y0wBF6cOJr+iNokI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763358041; c=relaxed/simple;
	bh=5CgktAeVU5b5o5Gv7ZUcWMPYpmWApRwqLma2om/YaYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYOnMtM5am0AEtTbMkGJBG4E/kgYDq9LFPZW2+UL60OAXhY2syErOLIuamuEwSUb5DpoGO8kxEH3wY0g7PCgyrj51gI9bGjkyQYfX+31tKXtu8t/BUwbzVkGx5BqZ5ou07C4rtRwQSLiCR/jURzfkDQs0hHvbsAmlC+rWO9hkbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOGjgc8K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJjLPwv1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4oGg92911347
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JwGLuFJyAq4A3H7EurGW9xTM5A4YqSMPozkgARyIVrc=; b=oOGjgc8Kq3rXZrJz
	CHfOvo5ezyaumC6LHqLq6qG53skD305fTxyljllaYLKjd9zUU0mlHDrLI1Jzesmh
	PTqn7SklfyMxBo0v2NoITpYpS1plQOsFjMBvToMazYei7gn25mT/zXRQX6IQ544x
	kL01vGc9x+2xLqLrltX078g1TBbZXcDCv5xJPQoPUX+JgfFVKBiiXB4eWQUobhHR
	IGommN1T4uXSI6JDBBO+O+WjJrW3trd4sdfFyQ3kr+Qj0QlEviHvlnb5EpFmEB6F
	KcqRmYyNf3FG6G9a4iJT/PNGJV36zbW3zYTzy6hOAhLh7+n/UDEl81qLKjWb94rS
	a4Yeaw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejgcbf7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:40:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34377900dbcso6909592a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 21:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763358038; x=1763962838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JwGLuFJyAq4A3H7EurGW9xTM5A4YqSMPozkgARyIVrc=;
        b=AJjLPwv1/e9LtTpSlupw7gtmaAEcHGTyRj8A+E1CtmgfXMxOqxLyQDaqs72i8USQ3f
         dp8PDnUGXq7/7iv+3szCBI4rY+r/WrvINN7+cNWpXlfdNa7rclx5GBegNa3xd8jb6yJA
         irMqQAQ/T5116rZKZvAJgEhhLkd8oEg4TsBhTlVnOgRcF/HuyW2DG8wcX+R2qblqHAUX
         r49KlHlWYuGH1rj/e4w4ensodSuBjH0eREH+hTSXoZUJUgEcJ1rR2NB9mPjRTUPGUQPH
         lcfZCRU0SeDW28QB6yKxu5XtY0qp8Bqz7+rpq5cVhLYZfMQGB85oGDHoqfOocoHhp40F
         dSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763358038; x=1763962838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwGLuFJyAq4A3H7EurGW9xTM5A4YqSMPozkgARyIVrc=;
        b=bNtZoE5jsPFq5RjzJdeVSiKAXHwMhJS2si7/nMWa0nCB4MnhyGYI4yFFTrRTqJn2i8
         JGk1Q9bOGFRCId63tMEWsXANgW/YCkW2+ov10GtCtXE8UvisUkYNWxrpRF8cF6wmjS7i
         1LeMll/JUz4o38V6/eBoWbE7AbS3/jo053482UYIikWn8EvcmZoNu4J+f9xVh3l/AthX
         1t//gwt4SfqmrJ606CTXhrd48rmcZy7mARv7C638tIgr1uNVYWMpn+iDIoI0h8+YavSA
         GwxPgr6y5KqIAbW0EuF3FyLI2lSlhLxd0YlPTDnhNF+k7SbeFp+ePg7Fu7dFAsfvpexJ
         MrJw==
X-Forwarded-Encrypted: i=1; AJvYcCXdI41dlOxKaJohHuJc8x3vdFoq1MOLbF11AgTWKsj7kx20L5tJe/2WQFaS8JA0KIDvrxEmGWLMZ53Z6aXb@vger.kernel.org
X-Gm-Message-State: AOJu0YwyQrLrWj9pnZpJmB6EZihjHykFJCRHws+ZI7+XlShqk7c9nQYs
	CsOn17U03sGdkzLukTcihYGYmnJky2fWCKZAMi00Lr+NbWWnIBvaWzySh/qfaCjEsjk3yuR96pl
	wdZyL8ampXh0AZnPRi0m81fEKNPnkCix/psRk2hgYQoiqlQQxFEtot05MU5a7Zq+ka3o7
X-Gm-Gg: ASbGncsy+0t95Ee5jp3fY31YlDNLW7rSQjoFVsr3iTtKORj6UK8an7p+BDYzhi133Gp
	JRI4tg2nksA2PtbfZ/cbRYYCMxZm0vULMf96JCqEqOvtcRrvpXufiQAWB+BEFJrbKTIdIkxfrTq
	47gvsmxpgAwjlf8hd6VbeMwg/oUNdN4PdJUe8dlBTgCmUtjNGZUZVd4v+/iuBdVQXuSJIFhwRYi
	H/cEAIQ4FoYcX8jP8KvBHVZBf9AEFp9aUW7K0i4qAA9PkbCOKXID0/5K+Bu+theP3Gq3/KANJ0z
	FjKUfqFaBE+XVqKxBH6+FzQX9bbK+xxNL83I4RSre379OKgcwie+QF/NYs/3liz9beFPhcrupCQ
	RzGcnJqpbLPmNPXm86z+Jpsd3Mg1I0+Ji
X-Received: by 2002:a17:902:ebcd:b0:294:f70d:5e33 with SMTP id d9443c01a7336-2986a6ba476mr125253395ad.12.1763358038116;
        Sun, 16 Nov 2025 21:40:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmA6o+kbOYh/BaAqHLrJj6Wk8KzmDvDjZ9KxgpwKs+YO/pyMn5IK4SjYWx/utHO71biwVziQ==
X-Received: by 2002:a17:902:ebcd:b0:294:f70d:5e33 with SMTP id d9443c01a7336-2986a6ba476mr125253145ad.12.1763358037616;
        Sun, 16 Nov 2025 21:40:37 -0800 (PST)
Received: from [10.219.57.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245f8asm125541655ad.37.2025.11.16.21.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 21:40:37 -0800 (PST)
Message-ID: <17217b83-12ba-e3f2-da78-f423275da4ad@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 11:10:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20251116-next-15nov_expose_sysfs-v1-0-3b7880e5b40e@oss.qualcomm.com>
 <20251116-next-15nov_expose_sysfs-v1-1-3b7880e5b40e@oss.qualcomm.com>
 <t3hfhlp27numfxurtmtcwrovvlgwdvnujain46kwmi37zehdak@xt3vngtkxpsm>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <t3hfhlp27numfxurtmtcwrovvlgwdvnujain46kwmi37zehdak@xt3vngtkxpsm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rsKihnItDxuT3mvyBXlg_bnbyVbB22ft
X-Proofpoint-GUID: rsKihnItDxuT3mvyBXlg_bnbyVbB22ft
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=691ab556 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=NpYxkmfexd4ejymn4sUA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA0NiBTYWx0ZWRfX78a1xk4XEqAC
 FGPzKGZNpXT+o/zehtTmko0cmmy5sAfPkQwpzOW6A0oFbsSMhfFj886zUsRSjJGETLM4pFHCVSn
 wLVk/8TsPYT93rHCQcWBtaYmptkX1f3EAnW4Tgx+cIrytbDEsIVHQku4fgcNZ4iryP27efMdxKc
 rZ63vp2qkeg2PRDauDEUd2fWqsyaZANn9ZoF7XmrBZ1uFkAIvQRgABqIob2qPFQICT83vwPjnJ4
 WF+RPZOnjJkDQO1pSi11wFrzBgiXhlL1iXN1pzX34zuQNAvN8AobSsrKeRt4ufB01VIj4+PU0gF
 jDyzAjy+lZOkg4fIycGDDNM4iMwH3oJqaYcdIGF0vlXWsRCT/ZjN1pL8n2tRjRxEuYTJm1GLnxR
 t+dRUHEI572JQPj8vkCFnQNY39Bahg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170046



On 11/16/2025 11:14 PM, Dmitry Baryshkov wrote:
> On Sun, Nov 16, 2025 at 08:49:47PM +0530, Shivendra Pratap wrote:
>> Add ABI documentation for /sys/class/reboot-mode/*/reboot_modes, a
>> read-only sysfs attribute exposing the list of supported reboot-mode
>> arguments. This file is created by reboot-mode framework and provides a
>> user-readable interface to query available reboot-mode arguments.
>>
>> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  .../testing/sysfs-class-reboot-mode-reboot_modes   | 39 ++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..28280ffe9bf962ef9d2136ea5d7c6aef77c4bd34
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
>> @@ -0,0 +1,39 @@
>> +What:		/sys/class/reboot-mode/<driver>/reboot_modes
>> +Date:		November 2025
>> +KernelVersion:	6.18.0-rc5
>> +Contact:	linux-pm@vger.kernel.org
>> +		Description:
>> +		This interface exposes the reboot-mode arguments
>> +		registered with the reboot-mode framework. It is
>> +		a read-only interface and provides a space
>> +		separated list of reboot-mode arguments supported
>> +		on the current platform.
>> +		Example:
>> +		 recovery fastboot bootloader
>> +
>> +		The exact sysfs path may vary depending on the
>> +		name of the driver that registers the arguments.
>> +		Example:
>> +		 /sys/class/reboot-mode/nvmem-reboot-mode/reboot_modes
>> +		 /sys/class/reboot-mode/syscon-reboot-mode/reboot_modes
>> +		 /sys/class/reboot-mode/qcom-pon/reboot_modes
> 
> This part is obvious, isn't it?

yes thats correct. Its just added for completeness of the documentation.

> 
>> +
>> +		The supported arguments can be used by userspace
>> +		to invoke device reset using the reboot() system
>> +		call, with the "argument" as string to "*arg"
>> +		parameter along with LINUX_REBOOT_CMD_RESTART2.
>> +		Example:
>> +		 reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
>> +		        LINUX_REBOOT_CMD_RESTART2, "bootloader");
> 
> So, does one need to write a tool for invoking reboot with the corerct
> set of args? If we are adding a sysfs interface, wouldn't it be logical
> to also add another sysfs file, setting the argument?

Some of such utilities are already in use and they pass command as an "*arg"
to the reboot SYSCALL.

reboot-mode is currently tied to the reboot SYSCALL - "*arg" being processed as
command. We can open a sysfs for setting the argument - That will be a design
change for reboot-mode and then we need to also decide that if the command
being passes will override the sysfs?

thanks,
Shivendra

