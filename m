Return-Path: <linux-arm-msm+bounces-96299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPspKDDvrmkWKQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 17:02:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAA423C5CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 17:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D42D308A711
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 15:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAB223AB88;
	Mon,  9 Mar 2026 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idDWgHLU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UxMdHYrv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404F4271471
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071189; cv=none; b=Q/E9S6KYhKS+1yKwozFW2ImlPcNlyePBu6hEuruJVGLHeGNks2MuRATdPfFD7L0VyGwSRCjusHxG+J1Qstfbn0PkQUB/nykHDW+JR/wHmlIWsxPnRmfWUEz18naamd90nAKMDmbJn/liUuu8zMAgeK5xT22EVtLjWcuLr4i2Dx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071189; c=relaxed/simple;
	bh=vuhY2lkqYPdmhCdqIF/qTYvsfNNQQhJ19a5lmxkVFog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4J+KbdcIc2Rn0H9oq3HV1d5ya3ZuLFbHvDDWrl1j/sMuiKFR6eh5sf/Xp0sDHqtvnUumgM0KTiZK83poS+K1U4tdtAV9z2ATWex9RQaSdzDcinkBRj1pIgN/OWgw5AcoFehLnACHMpeqhWPiKP0r7Y4FTCh1GdoKKm0AjEeWss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idDWgHLU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UxMdHYrv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629FADpn3773310
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 15:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gonURY8UIum2UspnH0bYd8s2CssNSxcb+o+HZBmH3T4=; b=idDWgHLUdSqFgNVx
	rdJiMqY5/iP6RpC4GVfHHygIFcCwz7T/I49WuibK9Af88X53MQ5XVJukzhSe/7ua
	XDNrJRXXXaSF/GMUCmO6zXa7o4w66Xt4bDqUs7HeqoVeCPxop7VGQzoBa200LpKa
	wRkzOrSRXoC1meykyivLqTposFLYdwOTnXWhEXt7H4t0EX1lSGr3e3L1ZL+EvioN
	2kHF1aJteyL9RKxs3zmpqF6AMvpLP0+rXAUZwhpf1sAHnOrD/f7gIbXl0tUnNOn4
	WSIorjIEX+efLdAwAXxDFMS9sRw1n0fFyAoJhulPWh66fgx2QA1M46E5mfLOm6xS
	eDOCLQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa9f28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 15:46:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae4b96c259so86458115ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 08:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773071185; x=1773675985; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gonURY8UIum2UspnH0bYd8s2CssNSxcb+o+HZBmH3T4=;
        b=UxMdHYrvf775J+o5aNdbUE0DwXQHgpQbmu6iVSxhYkHGxV2oHou4bzqDACxb5f+dCB
         APsAfWovBA1k312Zmy73fZu9cc0edKuJPFG5JWhEG0N4WltBBDQRKYlk6MiBQEENZF70
         ySzZluGOQtQ33RyM5eD3NV/xgtsLdLXhj1ZdKnX88YOi4QyO5f/+lrkFHskOKrouv/v3
         59tPb1oihhpgcJZoBy2561gigL9IZOeyR+TQpUWs7YGRgtIUG5RaseayS2byQmkWFMIj
         AQex0ni58ZI9fWQjOfD45Beq8X0SfQB87HaGi+LDHA+s4eMmUjK//zmoAPAZ2VM6FleP
         x+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773071185; x=1773675985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gonURY8UIum2UspnH0bYd8s2CssNSxcb+o+HZBmH3T4=;
        b=WFoK8aM6gbooo/Wbvv+rd47qaWsmqj3ccSOuMRmd2QQyp+aQytl1dskMQ4TrT+Q2KN
         OCfRypD1HWWRCJcFPmmOAIHLo/zNJ+BoBzSRVkNpS1ccLgJlGvHCLIAWIxQ6I9agkbOX
         wASG+2GRE3LPg1Q7xPhmrzkTw45W7gpmpsFXOncwe5kO5id7qWFvAkU51Y4lom3mNnQ1
         BnvbZNsevdiyMLlEqUTFV0DEJMe0r5Dgsr592J8mruWfXg8mRoX6/jKEat8glmDP9UXW
         XSyYWQPwuvmqiapMK9WFwxbJYuU7v1Pr8SCnvUpdyDYX0w5P0rVzTnJzwkophgtrZvK4
         fIig==
X-Forwarded-Encrypted: i=1; AJvYcCXZjSrOGuNmcV9lR21Sen4t2mJlW6te3DGtGVv+Fb0xk7cnb2yzYU9WipjfPIMPeQctpgqVSKKfw6925D/N@vger.kernel.org
X-Gm-Message-State: AOJu0YzOmeVao7tmptnoccXF2kzOHgcv/ShGJ02DWzq+YOZxbVQ2Ja+d
	Ua9aU4z4zl992yHJHPjBq/3nKKBxSWl6oaEfTamSEpbcqiQ42p8w9yApmctemXHPiut1+QxkNzp
	O9hROFUXQ0Hnyv8AcVRqCk0F17kfFIuO0OBiXXHyUrMk7HJFMupIZxuUnOR3+9yoRMhn5
X-Gm-Gg: ATEYQzwR600DrT+Q6x2vhJGBy9cN4OCy60MJs5jhVQM4LTlzRfLq8U3ZaLjHg23v0DM
	czKc8yPbdZSRzrHUEUUSPrBC1bvdbFlCiIb9oUY0GDCVEWd8N43CSvqAe6jubcZqJhcre8A8WYC
	hAXK3afQ142yrZw7z7PLPpav1gZ9M/nUdCr0sB5vAjpA9+gC8Cdi1/82GRAX3J/OtVV8+dLn+Lk
	V+lvtRsC0S6GCOj/hqxNK5xwg7Ju8SAGsvhMLFptvUOiZ3mraGr9gCcrLRnUabC4DKnuLUEtacW
	dMXbr0eIkp8f7wH8poB2+CiekMYue5RFeHCxhcwif8GAcvFLdHBCPn0wWTYV9OsDKK1Nr1pSFpU
	VvbFVD3UezfzkDG4/0KGiJkJD1JmNd6kjim6YRW6Px4GXf1dvqsxk9r4=
X-Received: by 2002:a17:902:e54f:b0:2aa:d2f4:9c11 with SMTP id d9443c01a7336-2aea197b7damr709425ad.5.1773071185016;
        Mon, 09 Mar 2026 08:46:25 -0700 (PDT)
X-Received: by 2002:a17:902:e54f:b0:2aa:d2f4:9c11 with SMTP id d9443c01a7336-2aea197b7damr709005ad.5.1773071184289;
        Mon, 09 Mar 2026 08:46:24 -0700 (PDT)
Received: from [192.168.29.31] ([49.36.209.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9d228sm119838665ad.33.2026.03.09.08.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 08:46:23 -0700 (PDT)
Message-ID: <5488a169-777b-4bb3-9566-78083613d40a@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 21:16:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node for
 a faux device
To: Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
 <2026030649-evacuate-emotion-422c@gregkh>
 <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
 <2026030612-collapse-empower-285f@gregkh>
 <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KbsvP1KY1hqgXyUDSudXrOn_h0Gtgu-C
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aeeb52 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=SibS68aVnxHiogvcwlKZDA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=__pY0jlSMTdJdk2JTmwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE0MiBTYWx0ZWRfX9uV32r2Hk0xd
 vWN50WbYm6j73+tA0mCZDdUWleJA+kCOi0z1Q1jwLERLo6YlPkZOJui6EgAXDgVgyUoumWAYAvR
 c2aCruqdAx3N5bA2SZ+5ZxXeLL6sCorHkPUU6vdwkXZgvnHRpieI+/WecY4WcRDwHK3x3OOwOOJ
 VBYbg1gXym5mFRRDmZ0P2j4FX/tOaV86/Y3cj1iDL5huXPbvZ+uxiwzGQwU1xdtYv/R0bqR3XyE
 uqLapxlUJwfRDalaSr/B3YsfTmi4egE97MDARqDd6q0DxhiAj0sfgKQYsppQlTPk4w46t4fOygp
 MWSXC2Mj7y00yAtzfQx6CBNBrFae9fS1c3zDcvG2yNP4IkLxNfz5N/JqoTFDO4Av7ZKtwFZ2KM5
 ixBJtexbJr1hMfLxCURYQWSrvWzq9/R6NVCBjJ0W4vm30g9j6ByJ9CYwGzCG7IPYOyd5G/vYk9H
 4sdR+Cq3WwENKqjF7LA==
X-Proofpoint-ORIG-GUID: KbsvP1KY1hqgXyUDSudXrOn_h0Gtgu-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090142
X-Rspamd-Queue-Id: 9FAA423C5CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96299-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.953];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 06-03-2026 19:54, Bartosz Golaszewski wrote:
> On Fri, Mar 6, 2026 at 3:13 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Fri, Mar 06, 2026 at 03:07:03PM +0100, Bartosz Golaszewski wrote:
>>> On Fri, Mar 6, 2026 at 2:54 PM Greg Kroah-Hartman
>>> <gregkh@linuxfoundation.org> wrote:
>>>>
>>>> On Fri, Mar 06, 2026 at 02:45:56PM +0100, Bartosz Golaszewski wrote:
>>>>> Add a new variant of faux_device_create() taking a firmware node handle
>>>>> as argument and attaching it to the created faux device. This allows
>>>>> users to define and read device properties using the standard property
>>>>> accessors.
>>>>
>>>> Why would a faux device have firmware backing?  Doesn't that mean it
>>>> should be a platform device?
>>>>
>>>>> While at it: order includes in faux.c alphabetically for easier
>>>>> maintenance.
>>>>
>>>> Hint, that should be a separate patch, and is never something that I
>>>> enforce or require in .c files I maintain :)
>>>>
>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>>>> ---
>>>>> Hi Shivendra et al!
>>>>>
>>>>> This patch is related to my response to your reboot-mode patch[1].
>>>>>
>>>>> You should be able to use the new function like:
>>>>>
>>>>>    faux_device_create_full("psci-reboot-mode", NULL, NULL, NULL, of_fwnode_handle(np));
>>>>
>>>> What is the fwnode handle here for?  Why is it required at all?  What
>>>> resources are involved that would want this?
>>>>
>>>
>>> Shivendra creates a faux device that registers with the reboot-mode
>>> subsystem which reads the reboot-mode definitions from devicetree. The
>>> faux device needs to have the "reboot-mode" OF-node attached. In his
>>> current proposal, Shivenda had to bypass faux device's probe() because
>>> he can't have the fwnode attached before probe() is called.
>>
>> Why would a firmware device be attached to a faux device?  A firmware
>> device is, implicitly, already part of the firmware "device tree", so
>> there should be something for it to be a child of already in the system.
>>
> 
> Shivendra: I rememeber there was an issue with using any proper
> devices like platform or auxiliary with this but - as the series is
> already at v20 - I can't find the actual discussion. Could you please
> describe what the issue with driver matching was?

reboot-mode node is a property of psci which defines the reboot 
commands.‌ As its not an actual device we wanted to avoid creating 
platform or aux device. few references here:

https://lore.kernel.org/all/rz7tnl5gg73gtyij3kmwk6hubikfsvu3krekjkpoofpdio6cwe@innio7qvotye/

Till v17, we were exposing an explicit of_node based registration in 
reboot mode and then registering it from psci driver.
Post this, Lorenzo suggested to move this outside of psci and use a faux 
device instead.

thanks,
Shivendra

