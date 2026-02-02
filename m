Return-Path: <linux-arm-msm+bounces-91404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KETXOcIJgGmQ1wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 03:19:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B780C7DD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 03:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27EEF3009152
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 02:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B0321B9E2;
	Mon,  2 Feb 2026 02:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UO/KZ4nw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqkw7EUU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1314C181334
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 02:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769998769; cv=none; b=nM6/BHzsUu3o2hH+PwzEriOHYcVZsGGnbXDOZy4UcPCDcQYrO0gXsA9uU+p8xYTQf31CzrgdwOlewAv7TCFPfZV0ATCUXxKyNyrcjEMIRhuscorhEY9r84bZ5QSa498RX924q5f5CHvDgqYIxR0KR9gF/8Anh9ggO3LDXfZRdvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769998769; c=relaxed/simple;
	bh=dmsQPhyyoo//BQUfpD6c9uWniyt09qvEuzjYSnJEXfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndCgxgPJ9FBaQDbf0Qo1CXOO+LPqLOU5/p1bMpsAvitZd8qw2/oPZuqtRR2b5LjMdIwsLaLwz+qainThEhwG52UCcto4K1Eva29jPo7JSDayAyT65jmBUG1Z3tGr+dEDhOLjVQgYXuvZEzzlom3SoRZ3Suw9VZjJzAlrBAmgg6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UO/KZ4nw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqkw7EUU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611NPa211333287
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 02:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b14DYZA6t81NrDQFybjoZG0hsObrz3I5Jr9O0v6p8ow=; b=UO/KZ4nwXdG/nWDA
	TqvjOKHU3SG//jZsxYWP7wqrbk7mv2iJDsiE+jMS72orKlsx3Cl8duDd9/+I5LrG
	BH0/121g2pX0a0c2Cf7UXN35k3/N5gswxPPFLXI6Erxl3GHKyr+wXapuLCOtfMzt
	kcEa6mgxIOlsmJnQ1cdNmwbsIjdlXkUvlcRnb+gr/8zoK7eI3+boL4wgsDx6bqw7
	v4nFTsYLqkv0jtxCZ0GLEXoRDKJT8wEPE2Y6X/yRvurmZ6hI0OKQFW5+s7SWe3+8
	UBBNqb9tTzvK0niXb0+NKLO5HTSv0+Jl56Mac9glocUfpr8GD81qCQGuufUOpQxR
	u8RkUA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0umtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:19:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso9366786a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 18:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769998766; x=1770603566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b14DYZA6t81NrDQFybjoZG0hsObrz3I5Jr9O0v6p8ow=;
        b=cqkw7EUU5bRe2oGY6HaC+42Q7pBNAoqqIp430PsjjoIGZmrLsGU00smGR07UNwUAuV
         RpJvu/Cq3CNiN7IeTmyW15iidZD3B1mXeAT6sTRNzx3HVGyahGDd0X61dHOgNnHIaqqd
         f/34ULl30T66JNDzZZ9yJaecpKL/ZXg4F/Qe0ducCSJXKGwu7LaSwU0dPqCfXCkErkJB
         R3nUkySjsxOR1drsmqAvS9T2kqrGYrELwBQWDMEiznXQ3mRCylqh/K4B+XA9mjvCsgmB
         v1M63z3kAe6cJu71S6MF7fKcOrQpjFL72QeohumZvUu+fNqKLNuQABrYjeQB4piLWcQt
         t7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769998766; x=1770603566;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b14DYZA6t81NrDQFybjoZG0hsObrz3I5Jr9O0v6p8ow=;
        b=acIkAznVz+qrx/FceaBdYp8d3mQ9o8SHXw80FLdD41r/0wXYqpL0KUwUI/oXrHfRaO
         fRRUBaxSi6uuSNYGn4JgUIuUTtW5msurREOihjBJXjx8W2RB9YPKTvur4leeupG8etcy
         +3Y0YiUFr4WFcz2udxlarkpa3Vl1EyU5MkSfPvku9WlYdTYj/K5SSfc1ke9/pes8Gcaf
         fSg1DJnIfjP6jWEJ8qsMAeVrErJj7SSvstSP9P6SLc8YYaTPxvcg2qBI0x3Xu/BuwGQ5
         PFsetDJMc9QNs25aTAaa+cJWLJsxAl401pljtOzO38nCCp6v4SyK6EmBw7sBFnT8W88m
         epmg==
X-Gm-Message-State: AOJu0YxaQMGfww990VNxz54gR3qgW//skCW8yRZW2d7WzbCalEd/FK/z
	8wgXkx0DVwV8cCE2TCLFlKcquGNTd/6jkCvCFsdMAsebJjNdd8TRfQbFnUgAqk0AQJnUxL4sz0j
	l3bLgWEJfo9nObxWDAf2hEzBduGev1X52PCUS52lTgs7RlL0jzh9ZUWULg3tp1eIvwANX
X-Gm-Gg: AZuq6aI4WEfgpkrGBNjLszh6BaGJegJp05799eYv0ptSNFvQFICMFp4i9jJ/cfupdig
	JfJb0BUQ8ndwQnjHRyHepc4lE7pWErBRYqqIIeS7dY/GPs1qLBdLGcrypX/G4S/kwC7vOtkaA99
	5qjsn6wjx321m3oEbJfvOKKfmE1a84J6pOCEIsbe7W1egpXxtVm8J6Vgcn0whYe93wvOkAqO/EI
	NzdlhN/pDR5/CMWzw410ZQUaIArwTdKwC1UHb7PABpC8wpIoB/jjNf9EWwDmJeX68PghFdPi6DP
	Z8t4bxWJqLFDJQ6RbYwxdOvy+6kAX2waHZh0jV3l9sw4dm86JyFCF7VGhNA1bCSjDZoAUw+ki6Y
	D3mUCugnVLavWh4XNOUXs0vFJJKVmA8HkJc0uycWgHPhpO5BPwJamd/bU8buZepSlUX3wjQrodQ
	U=
X-Received: by 2002:a17:90b:4fca:b0:34a:4cc0:9e38 with SMTP id 98e67ed59e1d1-3543b316875mr9716371a91.10.1769998765634;
        Sun, 01 Feb 2026 18:19:25 -0800 (PST)
X-Received: by 2002:a17:90b:4fca:b0:34a:4cc0:9e38 with SMTP id 98e67ed59e1d1-3543b316875mr9716343a91.10.1769998765137;
        Sun, 01 Feb 2026 18:19:25 -0800 (PST)
Received: from [10.133.33.156] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6205d3esm16462175a91.13.2026.02.01.18.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 18:19:24 -0800 (PST)
Message-ID: <7efdf5ab-fd96-4388-b914-8ac1f90e5813@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 10:19:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add remoteproc in EL2 device
 trees
To: Xilin Wu <sophon@radxa.com>, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260130073113.3091884-1-xin.liu@oss.qualcomm.com>
 <11D9329300A4B492+9485ef48-5ac3-4030-afd3-e5c7dabfa1d8@radxa.com>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <11D9329300A4B492+9485ef48-5ac3-4030-afd3-e5c7dabfa1d8@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDAxNiBTYWx0ZWRfX1gpef4GvEDd+
 nel0dGZis/XDZ60Py044TxI+uIBzyV5CfpiAGUudRw1BJ+abGKid5U8p3xSjxsw/JQwRBMeXNZW
 utkj9VyHTdS6zKALNguVhRXDmc++dHQRdTTHhGeCBCijxPJGbR61IN7exVZQ+vMA9ByGNy4bEa4
 n5+bPODgW7iSC5y6CZaybnZS9jAh5rYcJPU3BEkghwD4NCZl3tgQAR9+2+SJXOjQNOct05LRWIq
 U5W31Tv4r6mqKmmWpJIYoTZv1TRYqQHOzevDVkP+gjquQC7epF9sJHV9tnDL/NlN1odqyWGkw+r
 7ENpQZ70vYsOwIX8C97CYiLrtaSecS3NBn/4khJUS/i7WFa/viU9Q5uzwe3fK25WawOkMotk/l+
 +nBA2jQWaN2Fl0g/gdsp2JNuPptAFj679oP/CgdBVPJVwSN6UmOYc0L1xDvRBtl+psksEIoz+wI
 /s7K/BqY4ii3d58HI9A==
X-Proofpoint-ORIG-GUID: VMv1W4Alb02NCvWqNRyAfeMbq0ZxgyZS
X-Proofpoint-GUID: VMv1W4Alb02NCvWqNRyAfeMbq0ZxgyZS
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=698009ae cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lhBQhH1O_-Za_c4e93IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_01,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020016
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-91404-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xin.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B780C7DD8
X-Rspamd-Action: no action


On 1/30/2026 5:37 PM, Xilin Wu wrote:
> On 1/30/2026 3:31 PM, Xin Liu wrote:
>> All the existing variants Talos boards are using Gunyah hypervisor
>> which means that, so far, Linux-based OS could only boot in EL1 on
>> those devices.  However, it is possible for us to boot Linux at EL2
>> on these devices [1].
>>
>> When running under Gunyah, the remote processor firmware IOMMU streams
>> are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
>> by the consumer of this DeviceTree. Therefore, describe the firmware
>> streams for each remote processor.
>>
>> Add remoteproc to the EL2 device trees to generate the corresponding
>> -el2.dtb files.
>>
>> [1]
>> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi 
>>
>>
>> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/x1-el2.dtso | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>
> Hi Xin,
>
> Will this work on Snapdragon X laptops running the older Windows 
> firmware? I believe that Peripheral Image Loader support in EL2 
> requires a newer version of the TrustZone firmware.
>
> I noticed that the TrustZone firmware used in hamoa_iot-ubuntu [1] has 
> a different version string compared to the WP firmware found in laptops:
>
> iot-ubuntu: TZ.XF.5.0
> WP: TZ.XF.5.28.1
>
>
> [1] 
> https://softwarecenter.qualcomm.com/nexus/generic/software/chip/ubuntu_qualcomm_iot-spf-1-0/ubuntu-qualcomm-iot-spf-1-0_test_device_public/r1.0.r1_00004.0/hamoa_iot-ubun-1-0-r1/common/build/bin 
>
>
Hi，Xilin

Now firmware can not work, still need TZ team to modify some things. It 
is the only modification from kernel side, so I update it.

Uploading this modification will also facilitate debugging by TZ team.


Thanks,

Xin


