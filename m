Return-Path: <linux-arm-msm+bounces-97169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEIHIgOAsml2NAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 09:57:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF86026F46F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 09:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FB3B30B0118
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 08:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF1338B123;
	Thu, 12 Mar 2026 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JvRUjeIK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fLxss9eO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3757232692B
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773305674; cv=none; b=J4RtlqYL+57a7fP1PFiobkILvNG4OIaqG9fKOvPHJ8b6fclY+oWecJx0pz1EYe3QJt1HCct3UfQt3RrsePQLXLCP7f7Ovh0dTpMd3XkdksrjPRvcfkNuIeOwAg4dv/8i454HiJ8/VqzOkZOVBkx8tox9IJY/vL+w735htmkCEdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773305674; c=relaxed/simple;
	bh=W6hiN826Nj47dmuat69Ci+wnnicZJ77Cn5oLCDUc+fM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TattAFBCBp0o6e64x/Wccu5Jq7F5QMPA55en286JE9Qf8T/3r6yNK28ngRPtSGmQP0Ia30viU8/hzj24ujFB8fKUb2cnDZfKZIU+ayLozXVKps2kqvsIEVejiGwYj6dWs0jy2ID29gFkJWPHRQ+Y4eEIQ6TI0dwQCpv7yJJuyxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JvRUjeIK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fLxss9eO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMMpag3136615
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ex6SR5AntwjH2hwV8Pxt06HDLsYD3NW0CR+gEG/N2zw=; b=JvRUjeIK8VTnhp9t
	q3Hg0aEdaIqihYMPsopJf8cAVk5ztzRhE3pJxN8X4R9VeciRfrJrRfzx9Ia9s/I+
	+ZSsnVn+xLCUk0moE4Qkf/fr7bz4o1I8QP/XdfAv4lQkbmnxVYlgSgnq01/n8QIO
	LDfZfb1KQJ3dNhoLEYBo+xlEbyNzgbf4rN4N/VrJ3GnnmUqtQpsgQ+5ZZgwHceRX
	19eE4xQ0eDemioYGRO8EBalv6qAhqMApimXG+4qoSQOMFH9IOjwdOG9IzzKqFrax
	fLwN8TfmwV7z/FjBa2ogHW5r/NFzkwwMLllvhtCwXfrmgEoTHDfZvDhtfuMtjzAD
	1oOszQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w9h1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:54:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae405e95f5so9372505ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773305671; x=1773910471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ex6SR5AntwjH2hwV8Pxt06HDLsYD3NW0CR+gEG/N2zw=;
        b=fLxss9eO+qaKjkGaiODBOh60bxNOM8kCKaIMjfGuM1hIbbniBEgLFyYAWlvtqhWSpL
         xIrqJC6+fF+10wHX3Pn4mQ0UX9UM06KyuGbtHo5x3MKG/lfFdlnZogGYQp4Kcty2mg3L
         wDjO7f3gkp8CbAEbmDL9Iqoc62OSyS9BJG7Obmf8SUXiZfBBTccgrc5v062nforN2xy/
         TNJcUoLu+DwzQTk/2ZsjGvJvlFnElcRcyQB/E3vGteyeS3qiiG74ZXGfz56NpsbEURVn
         4Ws81CPRvSPBCZ5/KKZIj4YCA/KwbBEChzY3z7n/uE1UwZkrKgk3v8i6dY6E2tXBi8Du
         41Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773305671; x=1773910471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ex6SR5AntwjH2hwV8Pxt06HDLsYD3NW0CR+gEG/N2zw=;
        b=JD+8q+IyInr5MzYSwICzh5SwbcKQyT+FeexqOXcauyDcq7JnW/LrBGsEhUNWYl4OXq
         nqM66jS+CcHFPfP/d39yCm2w6uK5apNxr5E3z8Jt6cCfzWeegBaMrbn56rmDnrjOHyfE
         hSHqNVg0WeADZCKyBq8QKUVRHH2WjyBzXJgDYNROJzGw0YBzr5kqoUpRAaCkWLbKE45Y
         8KaIAOnZH8eYwn8qAhRmovB9DiBekHlCaDp5ltr8Ge+9p7Xy5VtiYClyjPyf/+QMnoKA
         XZIPjdJ2f9ehhKC/CrGtwCb0Y9q+2CBQrrkaBGRwzTbiJUwIRx46hDg3tqFqPWTkbvg9
         B89g==
X-Forwarded-Encrypted: i=1; AJvYcCWjrGGQZcYxBQ29MqIjEIeluTjmMfYptMSu79iO0KAiHPg2ihIUHh5d5J1W0PAo7lOvX4HtGimvl4ugeIvr@vger.kernel.org
X-Gm-Message-State: AOJu0YyXrlgzNu6aqWo5VHHbrZ9qyXmctvksBDDhvlhlZX5pe/wzkRJ7
	r3eCKCUctUWz9Az3jzoCPh8RE1XBfxnwCJG1xMeV/QYcL3YkOqcBVYdlnlKNzY+/gqh41jNscsv
	5uUXhYd3Is6tu5E7XujnhrVi+QU8Iy9pqM8QuqlskQPBpMTFGYSoy8KBjFbJ2LlG+inWA
X-Gm-Gg: ATEYQzwmkuI7ttnyxQjwBWVmNA0dhsLInJwvfUrme/7EPx5U0NGHiXqqbIcbYImzpFs
	N9Qi6/b5Eq7kgX7QCG92rSsHiYTMP4usqBlMLsWdYb/Q1/QWPu5QuA+OeGJAFmLpYfALrJKfvPP
	XB96CnmZN8P55BksELTrIfdT4luLKc1rmRVW+RfFkNSsypDc8zOVFt6HLHasiK6PMiTDN7Q/KkJ
	FGCohGvV1bVzLIKTvEaG3z8cLXBF65FM6vdrCt98CGVGTVhhH5I5IbbPDG9dHpHJs7DtQXoJo6h
	hlMV7KZadaYErYc9sOiZD7C6zmHEJ2t5Agiprploe08fqzz8dj4aMa4oJ5dMUvBCLvBJtYDNJiR
	2fAUZByX4zr0YjJHKfaCNRwdvIqCgezcdTQUbOh8lIvqNyU8KMhUS+Lxnk0VYVuU=
X-Received: by 2002:a17:903:32cb:b0:2ae:608d:ecc8 with SMTP id d9443c01a7336-2aeae85a33cmr49717015ad.27.1773305670812;
        Thu, 12 Mar 2026 01:54:30 -0700 (PDT)
X-Received: by 2002:a17:903:32cb:b0:2ae:608d:ecc8 with SMTP id d9443c01a7336-2aeae85a33cmr49716735ad.27.1773305670339;
        Thu, 12 Mar 2026 01:54:30 -0700 (PDT)
Received: from [10.30.144.113] ([152.58.131.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222e2fsm66922835ad.2.2026.03.12.01.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 01:54:29 -0700 (PDT)
Message-ID: <509fc515-aa29-44be-86f7-a64e2d8f3f98@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 14:24:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 01/10] power: reset: reboot-mode: Remove devres based
 allocations
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-1-cf7d346b8372@oss.qualcomm.com>
 <abEzdgQ6pe0fC-5z@venus>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <abEzdgQ6pe0fC-5z@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LEQcH_EwyAOY_7-FXO6ozsVwPhaYRG7I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA3MSBTYWx0ZWRfX2UVDvXQlFRAB
 BUhuhJWTnYaDCvTwaHlG8z9K2fZ1RR8571ridYGVwyfi9fQVSC4Cao29M2z5JusIUUANegHOb6n
 JJLpUycSIS5nBrpFsrYs6fZ7T4WpEn3aIWgKOohKJeHC2KUFPfWhHoHw6Trb/9iOnH1xjRSarFH
 oLEkkqPgdkWQNX1Bq4vpszMfc3ra+RbRpcUAyPzvTAL9FzG5DdSblOTek445g08WvC654uTxQcT
 9+c04gam6SR6X/3K5KDmJB7g/FMr7v0jnr3uWh7nEksw/Mwvzj/FbmmsTxiKzqL2bY6sZKZBf0S
 UcVCfYtF1OBjeC3ROMPEUjM9nd8+9Lm74fZxLbIB6VvqwVnCrGpsrh0EhWRMNX27tNwL1Gq8eLJ
 AXuYE8iLy6gOHmhn2Yyak3cW6vGDmJRH9qsA/bpoT5Xt87WiHZe4/v4lu7EnKZIBZOS4TD0aU5Q
 BYqvactFmkmOrAGiaDA==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b27f47 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=kINRXkAo9yxRtpb0MKIxjw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=8-yduQQsOBGYcPy-76YA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: LEQcH_EwyAOY_7-FXO6ozsVwPhaYRG7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com,broadcom.com,oss.qualcomm.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-97169-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF86026F46F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 11-03-2026 14:51, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Mar 04, 2026 at 11:33:01PM +0530, Shivendra Pratap wrote:
>> Devres APIs are intended for use in drivers, where the managed lifetime
>> of resources is tied directly to the driver attach/detach cycle. In
>> shared subsystem code, there is no guarantee that the subsystem
>> functions will only be called after a driver has been attached, nor that
>> they will not be referenced after the managed resources have been
>> released during driver detach.
>>
>> To ensure correct lifetime handling, avoid using devres-based
>> allocations in the reboot-mode and explicitly handle allocation and
>> cleanup of resources.
>>
>> Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The patch does not apply, though.

thanks. Will re-base it.

thanks,
Shivendra

