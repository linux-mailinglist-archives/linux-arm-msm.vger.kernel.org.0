Return-Path: <linux-arm-msm+bounces-110738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLzvNj6JHmr0kgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:41:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5192629D50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EBBEF304D218
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFD03B0AC3;
	Tue,  2 Jun 2026 07:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+jooV3F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LHh9OmO/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0343AE185
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780385404; cv=none; b=ZodjIzgvnKXcXxbajjNwwQVLDs4c1aBP3l1MX4/GRKsjYipZiNhVWwJn/uM2o20Dd+s3W0C7V92MouPG1OO0PTkdLPuMN3ySkB2MjQJafEj5fmeorE0sFewx8nq1zh1noOJEJTyEo4wts8OfHzE5pZQhRjddTKKKvv1aCJ9rYsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780385404; c=relaxed/simple;
	bh=f5sezRu9tjzvfzojxxbxhZ96R0OsebYnOvfx8CxrWJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZ4sqJH00L4dWI3L1zS/Zx5ObOJb0YxVAFKyX18le9/5qi9QnPH9fSa1L2zd3MLYr+naQUbLFLw4iYAlshBEzZpYRaMkt5OFpZTnUELE/QNzW5MFDx5zP7ofnG69MSbLx3QS4F8eqrB7aHFDoUAiVidbZM0ZhHWjjR31Ob0fSc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+jooV3F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LHh9OmO/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65218wui3430710
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 07:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QUeKHWwTq2n3NcB1fiL1lGPzCZOFlPVRKYeeEWe70sY=; b=O+jooV3FCEoeuLhL
	tOD+4drsw50g5ZKyXxC0c0Yx1LmcDI1+9lS4VNdDaOMlo+/oEg7By2PMK9GUCAoS
	g4CaHnVjUF8hDFjNnDZI79RfPQwV2Cr/ZpU7vMMrZI6LHK1eYrbDJvbv/MwsX1KI
	KMc1P3W999VQl1tgbjhEfbOcOo+uKsY7bJkBRkdunaKDm+xOqWoDV7V/kGBQGWhH
	5FFRVM+w4QoYwBFzvnw0oyPPJp6ekLMF9o/x8+8e6h1cqLg8nWXiCsIkDhD3Vmdm
	mt1zkzm8zMoa255fJh1RtWIgtjyiSrMklyQe5H8dSWqZJvJsoLe/WquVjbIPhLOE
	sKrD/Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehn8mh8t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 07:29:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c331eda3so29553595ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780385399; x=1780990199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUeKHWwTq2n3NcB1fiL1lGPzCZOFlPVRKYeeEWe70sY=;
        b=LHh9OmO/gvEIYbk7EGfEzJxdtFLXX5vbrBMD/KsVC/M93018PoNnMb7KbvOc4NNtZH
         +rSHBcnwW85TycxWeaBxRkgG97w5WGOUC0c+pWzDoJBMg8NfyYpWG1Yqz1GjgBfqvY72
         8g4koudjlEB/SxuF19+ZHmMytl91a7IRrNs5rvSmkbvd2wdNfXCqBH8rciqUkzffWhGO
         2ns5qto/d+fKz69mGeXcBS3YbrnJUcebRITYLbozFzEgBartq3PxELs0hbm2Wg7qv4CC
         jBLhH6u4zJ5ZrY+ck5mVnndmBf765vjUBbz4U3dh3p2RVUBcSCHeR7sfg8dOVichkVzI
         gppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385399; x=1780990199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUeKHWwTq2n3NcB1fiL1lGPzCZOFlPVRKYeeEWe70sY=;
        b=c9Gu+/DLxwXQW0VesIWsJuc39aV1Flq//sakwv7wmHdLUFdepVYPT1XF4hEfRD9DCl
         tDrBUa7/greKp1svrdhJe0//Mbpa+igyZ+giZ2xpZjIuHqqHHxJWdsr0/BDqOIekgr9v
         nkkrRfTd5bqw0tV9Pvypf2QUCeiQR0bgTd813nilrrEHzCbSeXHOnhfhpsHPiORBlD38
         Y2e+LIoA2yjVre5ZmIGXfyJZcnYH3GVbQ90kB7nXIJr2or9TRHU98DLgTHbhEBC9yaH/
         sZYRAZunj25wqAWGdrF9nz66yUh2nnwd7OPRrOIYkIbnmIoNH+6IXfM88c2ArKD/jLfV
         eKYg==
X-Gm-Message-State: AOJu0YwWctbGdCJ7qnBHnyLcDatQexxwOzvGE4ZM1CCbEPhtPYbrb/AS
	NDG1g/+RYq4327F19bqfXzxwZMsbIkuCk4Bw88XQDTMAVJdlOuy3rrihKkkg8babZZiBrpjBk1A
	MA10e3ny6pKzDn3bSUvU0wM27kFkT2ye/WHuUKROVD+aTD7fTVVpxRYL7h9Suo8kVzr4r
X-Gm-Gg: Acq92OGD64l6dLJOeIFSHqANmc5uodGiCJZasVugYVybL/em1oUn8a61wkOQuMx2ckq
	rZ/4ZWTP6jWoAluiox/+Iv1Kclahi0F2uOAJ1kAgXH1a04zI92Dnw3v453xjRGM9g+yx2Q0+zNF
	tXVQEPU7og3ZWz7VrwBIodzmLSpPXEwCQ8Iy/uti4+tW530F8HqZoDedvFm2zv6wDcI+Jtufa+b
	nq+j/QV8U0UvGECdwi35J/tmBQX0Q9+LfDlhMecKglySdHqemxrNuYpA3HBPa8kfMpjjqISBIqf
	cfMx/gP7/c0fn6bdfX6rpOLi9f2s65Yzcrk2K1hFsIvoWw7GF0a2uYuLplf0SiVVYAv14m971XH
	LRbpfJGlzX9dB9MjlKA0VvYtBuwHNwRRwepSQ5xZlA94ik3zZOfTeguUtrZ1KJV7pM94S5ad23x
	2sg3jEMDXLT3KgQRXvSgX6Vg11
X-Received: by 2002:a17:903:986:b0:2bf:1e59:d99 with SMTP id d9443c01a7336-2bf367950ffmr150381885ad.8.1780385399230;
        Tue, 02 Jun 2026 00:29:59 -0700 (PDT)
X-Received: by 2002:a17:903:986:b0:2bf:1e59:d99 with SMTP id d9443c01a7336-2bf367950ffmr150381655ad.8.1780385398742;
        Tue, 02 Jun 2026 00:29:58 -0700 (PDT)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fdf0asm123199395ad.26.2026.06.02.00.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 00:29:58 -0700 (PDT)
Message-ID: <18235340-cd42-4d88-bfdb-19aecdd63d68@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 15:29:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
 <4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2OCBTYWx0ZWRfX0iKWDwVpsmBK
 9+a8/+Zj1DnGOqpfvpmzrqdV+UuO/Tg59RHhIU3FD9ak3F5Y0FRYlS6nfXrct7c6qTEWRUpHv+H
 c0GFIi7zwV5WIn8CuKfF6ThUae2fBlFmfrfCwg0FECUkQwfKsmDqd+V7m1pxdQ3+Wk1KrorwFHd
 J01xD1WF1fFfNfILbRtPYOkxyx+BV+5Um8S28IOpsN3Eh6N59saPlY3RP5q33cKHu1Fl2QPtqzl
 cHythdsFspWaYubcxXAyB9y1UerDVESVnvfPfKyei1b0yitickB/OrPm6zICkxK+ZD9qthkcs1v
 Yz1IYrXKkmN91lj3tREcgsp3UmYdkQINBrwKTfjWgI9ya9nkBIYTLtO4j1SiKPLFjSGh1OJgQyF
 omqIiWNnDp3ZuP3W4+7KSFoFeax/c4g60S9yACoVXCyry1CbCOJeWIkueSk6FyGPENCj5pNN/LX
 3A5s3pkcVvoHfIyneOQ==
X-Authority-Analysis: v=2.4 cv=d5nFDxjE c=1 sm=1 tr=0 ts=6a1e8677 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=1fo9jZtHFcPKizIzv_QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: BCphPq1-JFukcBXyFaHcVV_UybbfKyrc
X-Proofpoint-GUID: BCphPq1-JFukcBXyFaHcVV_UybbfKyrc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020068
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-110738-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E5192629D50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 6/1/2026 9:37 PM, Dmitry Baryshkov wrote:
> On Thu, May 28, 2026 at 06:05:35PM -0700, Fenglin Wu wrote:
>> Currently, the RPMH driver only allows child devices of the RPMH
>> controller to issue commands, as it assumes dev->parent points to the
>> RSC device.
>>
>> There is a possibility that certain devices which are not children of
>> the RPMH controller want to send commands for special control at the
>> RPMH side. For example, in PMH0101 PMICs, there are bidirectional
>> level shifter (LS) peripherals, and each LS works with a pair of PMIC
>> GPIOs. The control of the LS, which is combined with the GPIO
>> configuration, is handled by RPMH firmware for sharing the resource
>> between different subsystems. From a hardware point of view, the LS
>> functionality is tied to a pair of PMIC GPIOs, so its control is more
>> suitable to be added in the pinctrl-spmi-gpio driver by adding the
>> level-shifter function. However, the pinctrl-spmi-gpio device is a
>> child device of the SPMI controller, not the RPMH controller.
> This replicates the story of the PMIC regulators. There are two drivers,
> one SPMI and one RPMh. Why don't we add a separate, RPMh-based GPIO
> driver targeting only those paired GPIOs (and we don't even need to
> represent them as a pair, it might be just one pin).

Thanks for the suggestion.

I agree that adding a separate, RPMh-based GPIO driver would be more 
straightforward from RPMh control perspective. It makes the new device 
as a child of the RSC device then it can naturally use the APIs for RPMh 
commands. The main challenge here is, we need to make the level-shifter 
mutually exclusive with other GPIO functions when the GPIO pairs are 
used in level-shifter function, which means we need to write SPMI 
commands to disable the associated GPIO modules. I am not sure if AOP 
already handles this; as far as I know, AOP only manages the 
BIDIR_LVL_SHIFTER module registers. Let me double check on this 
internally, if the GPIO modules could be controlled along 
with BIDIR_LVL_SHIFTER module registers at AOP side, and get back.

Also, I would still insist on the pin group configuration, as the 
level-shifter would only work between 2 pins. Do you see any concerns if 
we represent the level-shifter as following even after move to a new driver?

     pmh0101-ls1-en {
     	groups = "gpio11, gpio12";
     	function = "level-shifter";
     	qcom,1p2v-1p8v-ls-en = <1>;
     };

     pmh0101-ls1-dis {
     	groups = "gpio11, gpio12";
     	function = "level-shifter";
     	qcom,1p2v-1p8v-ls-en = <0>;
     };



