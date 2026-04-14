Return-Path: <linux-arm-msm+bounces-103102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDKeIo8P3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:57:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 034D03F852A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35A913025A50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C2F3CAE7F;
	Tue, 14 Apr 2026 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUruiPe2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0ESElkK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C923C7DF1
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160636; cv=none; b=RMeANEpjmNW4HtzUtugYA86VRKLX1iHngyyZ7qI2h3c4+2SAqXkezOEaCyfFH0w5mHLnkA7i2sKWds29FsLUUsdItw59D0XfVxRp0L4tNR8lUOE8hkbjTBC4irc4Scm0UOyuY7xO8qDIvAbYxfBZL/9Tf+G/tousDFwvgWuRGnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160636; c=relaxed/simple;
	bh=4QU+j2opPqbRY6S9FdsfsGUfoFq89DJ57ft0XCMPXrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvmkZRwUVAHX/fiZijNMEb+H3G3GRr4+Z72cT/1ia94q3ARkUzDfKzhV3Wn77H+eGYhFRNTUv6iFvUjxk4q7/fd2yKQ+w2G5vBg7ZOSI5NWmdFLwO1FlDsGzQ7tS3iS+5wlqKtIloupULMA3/WAB3RgCLC8KtUPOyYnCGmbAf9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUruiPe2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0ESElkK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6Yj5I280867
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kflg0sxdLIlLz9lYcDWzQHlhPZnpJHKOX3uC9w/Wko4=; b=YUruiPe2yV8G8P68
	Vd3jixfI8MHnR+ZnVmulP5Q5N25mGGpJnQ+1U8QrIosZeRbZ+88VT3gJDgfvjmfU
	vEWG4mAtg7/AKF9JcnFXrznz4nnphK/5A1xW1VFnAvUzH4T005KuoJte/BtsIWh4
	Dwp1c94+VP+V63QkVWwgo+BFfUT0A+kYevqaBAxswQtsmWWgUBWK0ftbFL52ieY5
	lygOEGycTzqK6h856CNfTym6c1q3AoC+TnJSPdC6tthpTS/IpAKWkHlnHtRkPwtt
	itLcs8B84SGDFphn3FbBTiKoClVOQdUFJsOqDW/WBFnwTWBU7YlzuhVjDORiIf9c
	iaXFYQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vj5tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:57:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b241be0126so105295895ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160633; x=1776765433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kflg0sxdLIlLz9lYcDWzQHlhPZnpJHKOX3uC9w/Wko4=;
        b=j0ESElkK9Od1XkBlQmw7gsfB4WJ22+d/blmXtREM56TuUKETnzVvkRQKoT70eRMFvh
         Ctnb2nivSVCNjCeOKiKDDat75ZneU1JnqnLP/aUbcF/6HjGOZeh8qUaBuZM5WPqSMg22
         jPS5PsO2CxG3JpIHHFC/3KOlGpNPJGAv6D7n6Fvk070mNTtKCe+Ov5wNaLVl2VzmrpSK
         FKatOhV0kZfjsJ2gKQKtgq/pD4Nv946Ij++r2OrgXBkGC+JN2eU+qGyVedfXvM88+HEq
         W6elgdty+50+IBpSgSKLS6yyDHmxqWANguMcaYx9nurt32jN/EEJEdf+elOk4VsMkYCR
         TJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160633; x=1776765433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kflg0sxdLIlLz9lYcDWzQHlhPZnpJHKOX3uC9w/Wko4=;
        b=Kpuyor7V15wKJWbx/k3Sd+6mrDWJBx50/+ENrYPhb2Y9AHOm9YwJoSSsEBzdxVQm7v
         JnI4iZZF5epVahuBj2hWLTt3M6ZSqY2bS5aV0fin5f67PFMGVpMYAOWZV59CfaeNMlLS
         YBchRO43Qg6gTHXWX7moUI0LPykH+cjHvI5/G5Q3P0g7eWWAM5o415WlvdmxN7/75xGB
         IUXy3brmEeXndvAqhEpHZXILcpT0SYXxFQRQ9JIqO6MpJf4jjectjU65eBr8w9CFloyd
         ZQ6PJi0hPEfGtdpy5qU4bhQzKwvl8qywlT4tv4h95AJ6PfjfPz54tA7brjuAmr2XGBzI
         E60g==
X-Forwarded-Encrypted: i=1; AFNElJ+mMLB2nLitlkhpg8TciwyFcmebSVNISHcdGHzN4TZfZ3F392R36/Y+iWzV/Bqpp025V2Fpld8MIef4fbBQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxkwVugNzn1Tu8wdxzg2qe2CJW5lJxQbLlxPKhVJ7TMhplx7EVd
	v5KWW6E3ItyeEYYCS2fhY5l2Gzc0xoI134CFzI+/CanSQJDEpeA0rHlZVlSWZioK7ecbWs1oeQy
	gBrKGG9A3cisz9DkQqXqhoLtkQQr0e6fOhbBk1w6kwLeI+qKcOgexMlxpzxvCDkoGddCC
X-Gm-Gg: AeBDievJCgKRSi67UDeAJkNv0Etn+uUOTWGvVOVLHr7Cs3um7P1mceuK8X2BSzwDpXq
	RR6//dS9pOG0NLu+GgOCs6w/6d8N4pHfoZrJdmRRvP9IIOmG+W8i4RQdXLIpjqTwYe1k00Twl7g
	V+7JsTju01QSeJK0v91mMVYNkKxgepLzhGPRbiSN6udESq4u6jl0tcpAeBRZx9LPC4WoyTF6X3W
	sTpyZA/8QFdrYyvSNUgadWqmxkY27hqLteP0JZSvB1zT8+IF1/qcQIS3GdFniMu1+9S9WidemKb
	pWvKeI6bFmx87vY9ySSR94byF7KIh8bixl2y33/y/Ek//Ds16sBMBONNcWpuONpaRgG4520lXxd
	D4tXbyCXQDwJt01ntLeCBuUZuz0OFHV/jGAj1FQ12iFxmfU7FEn1u+A==
X-Received: by 2002:a17:902:6942:b0:2b0:6e12:bb21 with SMTP id d9443c01a7336-2b2d5a9e7bemr117452205ad.41.1776160633560;
        Tue, 14 Apr 2026 02:57:13 -0700 (PDT)
X-Received: by 2002:a17:902:6942:b0:2b0:6e12:bb21 with SMTP id d9443c01a7336-2b2d5a9e7bemr117452115ad.41.1776160633128;
        Tue, 14 Apr 2026 02:57:13 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dae27asm138487695ad.7.2026.04.14.02.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:57:12 -0700 (PDT)
Message-ID: <f9bfcf86-046e-45c2-a664-425db04521a7@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:27:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] Documentation: ABI: Add sysfs ABI documentation
 for DDR training data
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-9-47ad79308762@oss.qualcomm.com>
 <yttrssaw4k2vx7r6l4vsb535qcrr4phsgj6qlnu2r764inai7o@d4qgr7uu5t2s>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <yttrssaw4k2vx7r6l4vsb535qcrr4phsgj6qlnu2r764inai7o@d4qgr7uu5t2s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d5FKETmL4-Jp0mi38e6o5Pu-eUNZVTjS
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de0f7a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XMNYEwTNIfZjcZPMuGwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: d5FKETmL4-Jp0mi38e6o5Pu-eUNZVTjS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfX1eolFqxq9KWR
 DFdu1i1ghvxdSU8fP04tnR2dKzrRhAMCC0KEYSetLHpPzOPidFRTBMXppm5+O+ZnAGeG1I8MNlz
 47R9dgJ686tWy3aolyHGbBbJVO/nC3UOuQEGUYnw+pXCno0efhPXEtf+NYr03D+vobGHmc+c/nx
 Dr45oPFz5BVf2tC3wH8RHjeYuy5Mrc6CWMbjAM4u6Pp4QqSQoTtJST5cd1fawh2SSchd3UgJ2Oa
 voCGkBoVmP1cmDt+J///LSoNQTn5zXgIeESuEv8xUaz+hQPDCLw5UNsiACNdxB2l5QHf6h3MeZx
 twuJO2o7uL7L9qx4UApSoa0B2qB1ZUtIqH/foguXzNd7L+lpv5mBIDijjiExo/yXyqmMhcG4zbm
 75n+NSYO3IbgG56KvqjxlMYn6uSc5GXcPjSWFXqOCJZvrJv+n+tcP1wVZ/tXCgh1kqHRBjBpVEO
 tGInnehaJ6Iury0jDxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140092
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103102-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 034D03F852A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/13/2026 5:29 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 19, 2026 at 12:01:49PM +0530, Kishore Batta wrote:
>> Add ABI documentation for the DDR training data sysfs attribute exposed by
>> the sahara MHI driver.
>>
>> The documented sysfs node provides read-only access to the DDR training
>> data captured during sahara command mode and exposed via the MHI
>> controller device. This allows userspace to read the training data and
>> manage it as needed outside the kernel.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> Ah, this should be squashed with previous patch.
>
> - Mani
Sure. I will do it.
>> ---
>>   .../ABI/testing/sysfs-bus-mhi-ddr_training_data       | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> @@ -0,0 +1,19 @@
>> +What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
>> +
>> +Date:                   March 2026
>> +
>> +Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
>> +
>> +Description:            Contains the DDR training data for the Qualcomm device
>> +                        connected. MHI driver populates different controller
>> +                        nodes for each device. The DDR training data is exposed
>> +                        to userspace to read and save the training data file to
>> +                        the filesystem. In the subsequent boot up of the device,
>> +                        the training data is restored from host to device
>> +                        optimizing the boot up time of the device.
>> +
>> +Usage:                  Example for reading DDR training data:
>> +                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
>> +
>> +Permissions:            The file permissions are set to 0444 allowing read
>> +                        access.
>>
>> -- 
>> 2.34.1
>>

