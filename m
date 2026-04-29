Return-Path: <linux-arm-msm+bounces-105251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPm8C+Qt8mlvogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 18:12:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C89D0497888
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 18:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1364303A9F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802653FF8B1;
	Wed, 29 Apr 2026 16:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZ/Witbl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQsb91e1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B4C3C3437
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 16:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479053; cv=none; b=nu3zJuyoYH8Bm6sPcc9KoMkBt32TCI0Drn17JGfg3sDy1D1caKqv8mkoeVnY+2F2x5TXAJdAqVrBTi0/99DAGff7cxMtbIs6IaftwrlAE7o/2exqledDTN+zXic2IcICOAMZeRBZXWXPyIeJj1TSyG1Udnk7XwhyvjgwSDotUac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479053; c=relaxed/simple;
	bh=npaGFJnfYo3kLHM/yY+IRCA9qU4oY8XIL7aOWfcIOFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hUFBrTccIUwjUzXD7AgtDJxvBhs4+W0eaJVKhN4M9sMwGOleJmd7uNhNWEiv/j9hiPNIWeOI3HnRgob25SwFfkpwRwlwuUTZVBRTZWnccSBbFmpoKbHcLywm2vG1fW1oCRkzmlXr5gAXrhxsEoeYNX7ZqUnpg5EWg8iwhqlVvuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZ/Witbl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XQsb91e1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCLxid2485195
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 16:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QFEQeqYDr3vnx+CdaU4srnuC/dtlq0bO49Y8PJlmqAU=; b=cZ/Witblgi6EIXKS
	qbLMR/8oRr23GtyI45c0j39vYBwbeHYolz7VXgngtSVVN9so1MoXHt8hzNY0LVNu
	2Hxyjce0Q+t4qLd3Hco9LKxXJReg4MmcK6iaEdwiDdNp82Ekb9teAJfsGwk0kQJX
	/lfBomu2tcDL96kUKW62mWcmX+yYL6O4xfdDQF3jOQ+/+dF31p7PKxm41eR5XsA3
	uQcwFycHKTDJ3MokteQ05wITXxc1uvF2sOjxmzdKyXNpdLd+xsIYgEv/lOGRXPuV
	PRIqXu2wMKgV6tnBWeYthWK0q2ADut09i2ALBhuFLL+lyf9itLbrQrleYckYIzBf
	nDqlBQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duhx90v9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 16:10:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fbb57764aso1046320a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777479045; x=1778083845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QFEQeqYDr3vnx+CdaU4srnuC/dtlq0bO49Y8PJlmqAU=;
        b=XQsb91e1eNZyeGVDZD83UDPnRGuCLx3DIh3kE5EH00Try0584BD3QnxCiHzs3fVuvG
         hRCIZiClfAZRngqgSrN1LF5sFF/KYwfuCwkyXkGfjKKzu/JQRi9kGvreiyq0U5H1ed6Y
         Q5CoSKN/M0fZH0DLFmxQX5e1TPdVxnCYdzS11GJANoSAz4o6ZYYyIJ8cXuFhb9wKcVM8
         0f6/h61FWGgyW2elZQul7kyrNWc6ibPcj1l+tPT70Iw+hXACQh+J7QbCs0r3aTfEgvwO
         Pj6L/+Cve/UBWWzn0FU0YRFSH88eGZP5I7XL/s/B//tN6/Kt8J1tA8eH/u4wNFVKkEs6
         xzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479045; x=1778083845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFEQeqYDr3vnx+CdaU4srnuC/dtlq0bO49Y8PJlmqAU=;
        b=FJ4QPmVwVvwUmmeaoEA3XEANYj/TprSVqo5QdRLOi5R9bCaVO46Mt96rbjbqsk7pxl
         PUBvEjsOgFhkghS3Y0cWDcn9MbyvVs5b/TXNM17GEq+n6cIKirKJp7OP5wBC/Q+alXcL
         xPeoaBpYVBM9z3MjwscHyzBHUgeEatxhfyu7c/NqsOFqHl7VcoDY6w0QaB+RAx71D+d8
         4iJeI4yok/ftHtX3JPebR2T0yxdX2FGgwoORyF7hUMiVhE2XodIGpwvujubthbskb4ix
         El4OGM2daKdn6Ex0pQ0kRh6iQbor0mhP1+CHW4Knq7rfl2dMFRG2PrVlgtlYxacW+w1n
         XYvg==
X-Forwarded-Encrypted: i=1; AFNElJ92VUkKOSpaU2nNMKRFXgOVH2W0hEBQxiKZWhWkRAxnjCccRwCos8/LTtTieGxV8BINKuFOiE3xMJGix4ZS@vger.kernel.org
X-Gm-Message-State: AOJu0YzpPfRoubKP9Jh/vipxEGUgcDciV1S1a7BHf3m0rVPGa4GyYhZa
	wbzb/c4vtA20yfkFD9bjbJZNSP52f9if/iWZEqhT9bMBbwyLn/7W8TgcczRhbG7FBxH9F4Nat89
	pDg3Tgql5GvcAKgAzGSUX3cB++RL+ZOELv9Mh+q39FTL5AZitQkf6MyPXsP3uvtPbOxss
X-Gm-Gg: AeBDietNjamYxWUGQllg5R3cRdDjTM2ZiRN8X5HqZeP/lB6Qh/DfRPTUzLAKDLjngsU
	e/bsJdWtkRtYa01HcgoizB/h10hvJI+q4PslIlJNkgJo9MpI9vf9lqnnHzDpuw2TY1N5lvWN17K
	RvBGKdzmKythobi8YiNL4ZfGvB1v7u6w4BAprB1fd5BZircTFxCsPLHPNNNyGLPtU9qZMuP5yPs
	VM3yjnpySxyOl22xVk/1a12lSEDKI4FezdFeeQMPHT81lr8cD31HmKcYGAzV5NNqt2l0GB1ck5j
	9D8MVrONUYUtaCpEeYjTSPsoHqjtpCy08akyHEEp4zPtqpEShab3pGz84sbtKuzmLvJtlaKTHRR
	K1i1v/Gdculxs/9IJ/PCu+pthI8uhgBFoIS0wf3veF0z5EOPjj9HpmF3zDUkgeKnIiQ==
X-Received: by 2002:a17:902:cf0b:b0:2b2:3eec:c75b with SMTP id d9443c01a7336-2b988368538mr33084255ad.2.1777479045150;
        Wed, 29 Apr 2026 09:10:45 -0700 (PDT)
X-Received: by 2002:a17:902:cf0b:b0:2b2:3eec:c75b with SMTP id d9443c01a7336-2b988368538mr33083725ad.2.1777479044502;
        Wed, 29 Apr 2026 09:10:44 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.226.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b99852135asm7875085ad.73.2026.04.29.09.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 09:10:44 -0700 (PDT)
Message-ID: <37ab0178-1c9d-409e-bbaa-832f8075afa4@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 21:40:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD
 cells
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
 <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
 <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
 <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com>
 <ce92a493-5016-41a2-8337-d2227cdf760a@oss.qualcomm.com>
 <CAMRc=Md_OON4cAGcJ=jDu=VY_mw0qa8HPz4VCDxYLpr7JMxLRw@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=Md_OON4cAGcJ=jDu=VY_mw0qa8HPz4VCDxYLpr7JMxLRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2MiBTYWx0ZWRfX9ZKF3W+B6ScL
 EvBBpUxMoWbTM5lxE7GXXMHyLgHfAx2N9d0BeBAzl1MO7Wfw51uBXaSUaFcS639UaMx1Tej2bSt
 MsvSOt6jr/1lSCEoC8pgrBoeo2o27RuyKruqA8XEBwy6vZPUolaQnxmaB3eLKpinXyGPeVBmn+J
 yUI87u5FIHgqx+8zpvYWu7MoR7H6kkxptZlbyqTIv0unDuBMdQc4Dc8/2to8QZV5bz4D1QqGc0M
 pEwjeUEGLPTkKJ88ra7vh5l3qJUKGnIh+6K21YmQnuMTSWrtdb3UQmBSKdCGje9ghxYdVfSZnNR
 1iTi5AzSerGRSAmIC/nIs4eWnbJFh+XLBE2D2n9kXYf8UgsA97h8vFlfKea9IQ1qfnzTLUsY9tR
 DhjMoHEhKWYyWjiWrWtrTeHlj27Ani8qY6PYZO/ciaNWIZkgxGraOXmmRTzF5GpVppFp2z2nra7
 y5tugjDUGOHiU/t8eCA==
X-Proofpoint-ORIG-GUID: upSQN2ZMfkA7zL-DuRyKElnvPRKNvuk2
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=69f22d86 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Y3Rdv8TwbQrKP7QTPRCa6w==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KxIdvRQG5D7s9ip59WoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: upSQN2ZMfkA7zL-DuRyKElnvPRKNvuk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290162
X-Rspamd-Queue-Id: C89D0497888
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	TAGGED_FROM(0.00)[bounces-105251-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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



On 29-04-2026 15:20, Bartosz Golaszewski wrote:
> On Wed, Apr 29, 2026 at 11:46 AM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>>>
>>>> If set, it would be called from MFD core and would do the name lookup
>>>> and return the fwnode which would then be assigned to the cell device?
>>>
>>
>> Or should we just drop this patch for fwnode in mfd-core?
>>
>> Export a new call in reboot-mode framework as:
>> reboot_mode_register_node(struct reboot_mode_driver *reboot,
>>                     struct device_node *np / fwnode)
>>
>> Use the parent node in psci-reboot-mode and find reboot-mode and call
>> reboot_mode_register_node?
>>
> 
> No, I think the reboot-mode device (as pointed to by the dev field of
> struct reboot_mode_driver) should be associated with the right fwnode
> from the start so it should be handled in MFD core.

Ack. something like should be fine?

drivers/mfd/mfd-core.c :
+       if (!pdev->dev.fwnode && cell->get_fwnode) {
+               fwnode = cell->get_fwnode(parent);
+               if (fwnode)
+                       device_set_node(&pdev->dev, fwnode);
+       }

drivers/mfd/psci-mfd.c (goes next patch):
+static struct fwnode_handle *psci_reboot_mode_get_fwnode(struct device 
*parent)
+{
+       return fwnode_get_named_child_node(dev_fwnode(parent), 
"reboot-mode");
+}

--

thanks,
Shivendra

