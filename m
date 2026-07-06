Return-Path: <linux-arm-msm+bounces-116689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T4mJAk1sS2qeRAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:50:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A4B70E4B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:50:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gErI7nHo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cqWzVX+i;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116689-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116689-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C07C530B35EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 08:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655A53EC2E6;
	Mon,  6 Jul 2026 08:28:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C849384CD3
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:28:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326512; cv=none; b=ZmVlxH27Ve1Xu+jUT62AeGWDdPmXUcxusroGiLaTJM0v/OuEeQr2AyF77dcKlzeB9byWDlY5+eEXkk/sUmxNIN1HrO03nAcUqvZXXZFOuy40K9o/je//JXQd7AJ5Ej+QyJGcfD5ilYKGcuooVQnn9jN60gZyrRVoNeJT1JiphcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326512; c=relaxed/simple;
	bh=mPKd+dOcaM/hRkXKnBke5UZDJ3qEGEfIyRISqg7wB6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7vX6/Jwqy3CNpOI0tL89EGs0O4mE/z998goj9co6Kmaa6mR8xRz7aOQKQULknxrzTikNZdIIN8kUghLhvtp8NduCfwdQ8O5kS/h8GTy0ybg3nLtDtAbzZN5q7L9gdqiEzmtctLh2jbR+hb74yLGrWywGcieAGjpNd9t4FTJ/7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gErI7nHo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqWzVX+i; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668N3n84072469
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mob80sObnBOQjmZYIt894rRAtWKr1ikClaLVZFEtMLI=; b=gErI7nHoDO647b4z
	r4DSFtCfSOrX8VUQsx5UNXnI1yQMl/ork4gmWNq7JYH+rWCXna3v5WTSdvmIDfiq
	tOWOyEO1jhVgIK2yUaVMkbTj6Sl6artmPe3PPsi04a7s1y9JQ05t5AKvwHd5nyRW
	JpD7NyTS0UlvTpzgf0Z0YXGBJuTi0Fpba1KgtNuv6poQA028vk0rvtdBsYqUBVJJ
	w38cza6GxWVqB9DjPYewvDafo0x58LNzM96Uji4fePH2YmUF8Sgv/lb9iJz2hXwx
	Vob4P6z7MUE6PlwTzxuHnWaY0Pgy+wNhxw76uDg+FpZaH2/Um/OGQLQHJFycZ8Hy
	jlA0ug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t880q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:28:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e57e56ce9so8023285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326500; x=1783931300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mob80sObnBOQjmZYIt894rRAtWKr1ikClaLVZFEtMLI=;
        b=cqWzVX+iDdmIC5lt9Ptm7bivpDQdrAEo6mhNYsTK7aiBzP6uhN0ABaU3AthY5jHXSe
         2Qmqh7WwVjpmKFJru875fLN8JTIcDUewlvwrM2V0fhWSP0YTLcioyiICkkxsPm9gJeeb
         vWa5nCi/9X+5RvlZ7s7QlypnWCd+Ib0lbT9I9vIMPZEQWBvNpqGcQd4FUBB70+hdcYFY
         MKF7md2KsSlV+S2nwX+ZOvzvFt5boeCK8hkjOxGTG81DXhVNq+KTu56m4bwlqYdLfftB
         f9mJimoGPn7BowGWASMaN8PK4c4uoYd9PtJ9/iPAghtXHk6zFzYrKSS2XfWxyXwkIOai
         pRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326500; x=1783931300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mob80sObnBOQjmZYIt894rRAtWKr1ikClaLVZFEtMLI=;
        b=Ix3qsHHalapaLT+zShVL6938a36hsoIiMDbf9Vhj7ucg8VddfIyDssEX7wINqY3VOR
         Pjmuauy0oKDmoPgXT8Ac4DKNh90ntr87mORzTc3k0uuXhM3f2Jzi+US3ngZFoH4uubN7
         XRpTKoqVqByDKa1p/yBhvKK5q1obKQYAYxQAMtJCGibcWAY3XSDfaf/KUzGepfdkeU+D
         ehRb5ldw+ZjvX71fCSbEG4FLX4l8Fkgp9vsIh9nvjg6J4f/On3E4udZEbIlyrqgfJLpo
         sbC/tnReUN5kJTZHXBMryEVYF/89AaHWV5glkTF37YZcKzjWTsOUcZF1KKTjD2ruvj+u
         9jvw==
X-Gm-Message-State: AOJu0YwiWseau2a6VyZ3ceP9pw3Qx3+3niPVQc+jSJOiX47c3KKaqj4o
	do7u1RoQfiHCPdQ04Cevq30MAThwKssTVGqXXw0pjGwsHOh8dumRQE8eB1J0NOSYZjbXgOaVItI
	4O2oKx9kN4xufKAqjyOcsIq6ZOmgf5xLUChucY6oa6ozFGx6EU+41srYmvgaiUEno+eQJ
X-Gm-Gg: AfdE7cmScGmj+2aMTu4e7aXi7+Ffkr+zrw6VtguZAXkZErKLUEjJOK4dNfXG1qPhscq
	tfzjk25SIktm6IKKeSLeEFd0AJl/4CjsxKIpMLthQOlEzVDLT6BQ4Nt/Hgw9qzLqdkgiDQiQez5
	BZkg5nCw+QMTuiHUgmhYQu7G3aL/DzxR8TzZLrm58cM1oOQh9hr9nbZmGYQ9NA2F0vjKKYoVXet
	gx3FwjfQ3knEMI7vUE9U4chePHrqww2PKh34RL+wp3807kirjk/zl5L9fJlhJrFEiIOOvr0tTJo
	Y/nyjCJLnnbaXl/3420i/3eEhPDetxePg6C7YKLxrEDFQO0SY33GGawqnGaMCxbRblhqL42cewY
	D2M6t9hilr6i04z7DMocnTWX4FeJaqnZfF44=
X-Received: by 2002:a05:620a:2983:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92e99f6b749mr838790585a.2.1783326499436;
        Mon, 06 Jul 2026 01:28:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2983:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92e99f6b749mr838789085a.2.1783326498940;
        Mon, 06 Jul 2026 01:28:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60575c4sm692575666b.9.2026.07.06.01.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:28:17 -0700 (PDT)
Message-ID: <d67703cb-83e0-4598-88a7-29a69c17a2eb@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:28:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
 <20260703-eliza_evk-v1-2-7624440bd76d@oss.qualcomm.com>
 <7ce4844c-8025-48e5-a1fc-4d1cf9f7917d@oss.qualcomm.com>
 <b5a6a0a4-4c7e-4fcd-96eb-54041c29ccba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b5a6a0a4-4c7e-4fcd-96eb-54041c29ccba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX1vwxjMcMetNP
 Xfs9deR+q3U9Fcuca52g/e9zLnXDh0oZE+qMXaHm3tExgYraNjwjiXHYnXTb6FYYbFHIHbv5TxF
 wGB8NCv45Ur+kqnv3OrWIeT/Lho8qbY=
X-Proofpoint-GUID: IIvq3DoRYG_btRwIss01P4jy7VuCPXqd
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b6724 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=M7nLEK1OKNC5V3jzK1UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: IIvq3DoRYG_btRwIss01P4jy7VuCPXqd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX+kFUwPE6kRVy
 Tv54PIKZIvgJYkS7bTXTF1vlNY0Kt6ARvCZwYAi3nxJPJqvJ1Dl4H/bJ3dqQvNHNj1u/0lgUjLN
 g7vQizYC46cdC6XdFUq9nzHDcqkO70l52TbLjg0Zjk+hV3RKn0MQ1ke+CdXSkSEs9OnczY1hNzr
 RAl6b7enm8m1tkeHQ2tcFQLwQdgLVw/auz7Bj868CS2spQmVogN20Gu+PZUHe3Uc4JlfXWD5O05
 kb8Owy/gNPDNvL4520WC0ioFHKuo8XsKBvhTgJ2Lr1x4W35A3IT/EESrKhncJ9Jtw3msPs5S8an
 iMhzOefnBTU84AnNxHKd5KGlA8SmA9D0vuxxoDGHjO61g9W6P8lbF4+fjx3H+5r80CRNm6tPevs
 dDisA36s88xhvwhX+jvdBC7EbnvHi2LzC3JEiXx1P8tQJj0rZ2gC8cv2Cz5HgqSVSofNSyju6G5
 hjyyuFBKOH3KoTo9UqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116689-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1A4B70E4B1

On 7/6/26 7:22 AM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/3/2026 8:39 PM, Konrad Dybcio wrote:
>> On 7/3/26 2:38 PM, Krishna Chaitanya Chundru wrote:
>>> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
>>> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
>>>
>>> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
>>>
>>> Override the base iommu-map with the expanded set covering all the
>>> switch's downstream ports (0x1400-0x1408 SID range).
>>>
>>> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
>>> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
>>> from the PCIe controller.
>>>
>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +&pcie1 {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&pcie1_default_state>;
>> flipped order
>>
>> [...]
>>
>>> +&pcie1port0 {
>> This port should also get the compatible
> for pcie1 it is not required, only for m.2 connector we need the compatible.

It will be required once someone else makes a board where this
PCIe slot is routed

Replying back and forth took more time than fixing the issue

Konrad

