Return-Path: <linux-arm-msm+bounces-94908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLW4KWSDpWmxCwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:32:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5745C1D8905
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73279302490B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1852536CDE6;
	Mon,  2 Mar 2026 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/2j2UZH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CS5lFrfY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC7036C9E1
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454717; cv=none; b=E7UIfUcunuuQv8SInGEZxGtXWWi1XlYkk4wUE5m4AR/gfsX6Po13i8yMsYwfgimIKTS5KZCPqXqNLdVHL3wIbBMz4y+kUXIMOKMphJtVfg5nitshTWptC1hjSdrW6auia46DGE6g1lvoCrkIiwEGHO6BL+6aAHiFLvxp3xPE9tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454717; c=relaxed/simple;
	bh=Md5xRA8YEGesOFAjU15qapNqJizqyuaB5pZwTKTaHoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8L9aEJgHzfnjKFjleoMfEoYBJ4rKNT6VXxLGJJ+m45NeuGzkIE1q02YoY7zmApf03vE+7PXgO2sw8UM9NNRdFbL1bi34pkOUYcd7EqenNRW5LcPuND3rYU/40H1Mh1EKlU2gwPzqZdRT3f9prIpRhLIRDbEAxIMisavImIKPoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/2j2UZH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CS5lFrfY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294lw61291376
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W4ngh7auUa12FfXGU5s7rRoEdx8wE5chgTwMb2MLbMI=; b=l/2j2UZHcRmn5rbV
	O+/c6SmQKiAQFuspxc+q4FCvrWT9S6yIzhVa8Y9akmNXjm05hHuCGnhiSszkeE2t
	Tt9p5y7553HB59PE8K6QFYxgXTCiAET+SJS4XQ/EuIrIfdRaggFXhvkL64DiU74J
	XuTRyox/KzCVD7zGuMKrBcYaRZm2CY7KMqcMpdCCTjlFzu6WgJQT/nM57oAlL6hs
	CPdXrCOL5aIW2MSj0Q5+62V6SezL3lTnxlBZBof3gET2+meUmLMhU0DZP9NTlYIb
	jf/eQU+s+hcL9vPDZAws6ysuIIhX10gQj9KSH8jOtUGKTFxhH5YKEtbSLBDX4XH5
	/mYAWA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7ku0p0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:31:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35986cc87a6so1281354a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772454714; x=1773059514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W4ngh7auUa12FfXGU5s7rRoEdx8wE5chgTwMb2MLbMI=;
        b=CS5lFrfYDVvFyjISCYgCzPH6cNDBJAp6CJl8xTWd11XJzNDWiaJEHdLlv2Bq+KXEMQ
         tRyAO2GNvXOevMRLmPmSGCMwnmXbPKyoAudztYmSjFfR8cMpQfUEzbbzq9+Ok5XeadI4
         BhpBFx60gnTMY4lY7UBfzhxhYmyv2N0HZPs1bBV3fWjDpqKfMc7E51ORTf5A59dDEzgJ
         HRTkFS48aNxRk5L3suwhVJ+3JuscqHtsIJtuqkbiPZ4yWwqNsjTii7GHBNPAr5g9CUda
         7iOK79aSr1YLpwqwTTd7EmfBaKu7GXKUSoJWkzUEomteyZot/Twj4Z/Hgjrl2iacVXQg
         2m+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772454714; x=1773059514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4ngh7auUa12FfXGU5s7rRoEdx8wE5chgTwMb2MLbMI=;
        b=F7iiDRgf1CA8qzDQKUdT++U01x2dII2eLymx2E1xobBrBlONbEpBEkn1DIMags6wog
         nuCoGWHwTbmfDmzHdiCgqzfqU/dMiTUmmyYcEZ2ZNlfnsQBWI2DQ6PnCRNLsxRY3oV9W
         Ph9DBbCRiZZxjEX+3tqbnrMZ/vsY0ptPu9eab1o4wYsiEHAih3YcPAs2mBmH1rhH7GCK
         tuK8o1ziz97In+hfP6KVF6mLEMm24DeGdChC4l/iXIVQzxTptrdIxVHozF7hrZcHGKyO
         4yNjAokotjb7XNwFY87ZyqJR0djhHAMDMwAeGCqo9hf3Q4KP3k24mrLBAQce3nz0XxEL
         qJ+w==
X-Forwarded-Encrypted: i=1; AJvYcCXFyAOiuBXWwA62qrNOO9114yOJOKmmn4SoQa9nNmMJUZrBcsGr7GcNKJwlikZ+uVfQSMZ0pkTriqEhpWlM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn8HZ8TlmOCp/sASL+MMnwmv7TUYOn0iaUIOt9oZGy2QrKoer6
	cW2VvcqpRpdGQU1YyUgPxq1GOAyV6p0Qxysj0TTWPdxliv5znc54MxxhgXSuHuZaJbfKJ6O7749
	ulg1gx2H/64WLs0OC44XE9FZ04djRMt5iRZyo50TcZ2OEzQuowPBLG6OmeLmM6OU88xhQ
X-Gm-Gg: ATEYQzxaw7nIIGXqzzzfnevv3m8fwCRXjBAWoHWgCnz8tEak4zJfFFbC0H4w120Yg1K
	muJS7L7m9mBhNu08/VRZEdcueZFhj7QlCaiAjrsqIEDRiDuOplimDnSCJ3t7SJP/AJdRI++ZnlS
	iGiEwx89IwIw/pXVglo5sX8A2NmTBSLzp+mo3hiAlj2nFpWsD97Yki+A1RpRTnjA0T7yVLTffta
	F1zM2m7ltTP9Xrj5MJrwR8voSoNNN6a3+9Nh55SsAYCldOScbK/DaHTuq2jHrUzmKJBjBAdWqpf
	dRHXusmaBkWOKj592FbqE30nfRAO85JdjHzLUdsCQ3a/7G+QUbW793N35LKRmsthQ9nW9sOqlsq
	cLUXH6Qul2fyJEj8atG/YlfFIoIADZHUEuJKA8+zwiMkb8jI/8pnVZlgl
X-Received: by 2002:a17:90b:48ca:b0:356:24f0:af08 with SMTP id 98e67ed59e1d1-35965c17eb7mr9037601a91.1.1772454713724;
        Mon, 02 Mar 2026 04:31:53 -0800 (PST)
X-Received: by 2002:a17:90b:48ca:b0:356:24f0:af08 with SMTP id 98e67ed59e1d1-35965c17eb7mr9037568a91.1.1772454713176;
        Mon, 02 Mar 2026 04:31:53 -0800 (PST)
Received: from [10.218.41.175] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35977bf69bcsm4006727a91.7.2026.03.02.04.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:31:52 -0800 (PST)
Message-ID: <ec377914-32af-4db7-97a8-64995f5c26d6@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 18:00:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 06/10] power: reset: Add psci-reboot-mode driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-6-ebb956053098@oss.qualcomm.com>
 <CAMRc=Me8WQ=aMd-NJ1yzzHzqU8fT1u4eb7as=EjSpZ+Rpv9+rg@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=Me8WQ=aMd-NJ1yzzHzqU8fT1u4eb7as=EjSpZ+Rpv9+rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69a5833a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UGKnsmkkt59Ar6B41U8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: X4zTh1s0dX7npPxMp04WJo5Pwfudknzl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNSBTYWx0ZWRfX+aZtHJ6FgRQb
 XBTAUb4EOw+T5q4AHOx/XaHC2gydnbWfnqn0q2QmUekRgR9AIbEoS1b+2yxJ8vSmPq9X/50Qi26
 q1qAudwnpfqFqDEjsU2gKl2gS5h1cy9fZ5ijuwVa+3kpCf2gwdGcv29ZPoDeSF71JH3yLKhIzsx
 3K4cuVv+zDPN3GXceXe8+0OzndjyOkSPQ7DzGxACJLmQ18MMr3/glzfJmuzLUxIDxH2+lbmdIeS
 pTuMMVTJtDV7Z0G4DB+spkSgTf52ZT9Au4AAVRtDhZuKsSR9BftBymDHKuENttpeSogba9kjp+3
 oJb1aZCDp76/CRmmH433N0NkcDIV5952AClyTa4BwrYt3o5pjsNQ2DsxshQ7Efct19qrzvKaf0V
 /4mBzKP0k2U0JwiHo5UPNr1BvjXxfpFMs2HJkiRlj5usjJOaeb5CAlunq5lRViwnu8dSSBKo0yO
 qZ3yITnJPV7gMkBErPA==
X-Proofpoint-ORIG-GUID: X4zTh1s0dX7npPxMp04WJo5Pwfudknzl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,arm.com,rock-chips.com,linaro.org,gmail.com,ettus.com,broadcom.com,oss.qualcomm.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-94908-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5745C1D8905
X-Rspamd-Action: no action



On 02-01-2026 17:27, Bartosz Golaszewski wrote:
> On Sun, Dec 28, 2025 at 6:21 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
> 
> [snip]
> 
>> +
>> +static int psci_reboot_mode_probe(struct faux_device *fdev)
>> +{
>> +       struct reboot_mode_driver *reboot;
>> +       struct device_node *psci_np;
>> +       struct device_node *np;
>> +       int ret;
>> +
>> +       psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
>> +       if (!psci_np)
>> +               return -ENODEV;
>> +
>> +       /*
>> +        * Find the psci:reboot-mode node.
>> +        * If NULL, continue to register predefined modes.
>> +        * np refcount to be handled by dev;
>> +        * psci_np refcount is decremented by of_find_node_by_name;
>> +        */
> 
> Can you make this comment into full sentences, I had trouble parsing
> the meaning for a minute.
> 
>> +       np = of_find_node_by_name(psci_np, "reboot-mode");
>> +       fdev->dev.of_node = np;
> 
> The logic of the device assigning its own node is a bit sketchy,
> ideally this should be done before the device probes.

Got one doubt while trying to move it to init.

We used a faux_device_create() in init.
faux_device_create() calls the probe function from within its
implementation, so do not find a way to set the node "fdev->dev.of_node 
= np" before the probe call when using faux device.

thanks,
Shivendra

