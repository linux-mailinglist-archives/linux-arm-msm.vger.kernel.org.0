Return-Path: <linux-arm-msm+bounces-112178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VLHOLfQUKGqF9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:28:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6C5660900
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:28:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="bP2rw/br";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G6Yx1JzQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112178-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112178-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4CBF3029D12
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 13:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AD42C158A;
	Tue,  9 Jun 2026 13:26:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2415823AB87
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 13:26:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011595; cv=none; b=jU6bl/t4q8HO8bRwmwwu/X9CTEKjmYLdkL01Pl/e7+UEuyXUAvCUzFKtJQdgSC8TUULxwqJmRqPEpFOrXDZUwjvWzMt4rW54tFL1zkTWcxvZGmqXeFwZvew1FnhGcQc6jcdrJOYfrydNMsnN4ubpW9ZV5RQj0yWa9jJqOR0fDcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011595; c=relaxed/simple;
	bh=ZaS16NqBLf85S7mXyE0T5MBWE7dC4iKHxYJUfo8lKo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ap+H7htrzbAo1QtHByViZN1nsr45WAF+xaljX2BDNzCsZMi4C1XR4bShPEGsSD6U2Kus7zqdMwvPhXnNTOcxBluW7huQSrDvstbXGjhwQezFZOLsQe/2GNZeE0j7USDShth7VzrBwQdZijqdn8J4etKRakLcTuHfczBtWu2ko4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bP2rw/br; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G6Yx1JzQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClewA2248096
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 13:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fodeJ2QdboYj6AqCWNyQFWBP9D5W0x7wQGzJ+z4Dj0o=; b=bP2rw/brlwC6MpAn
	KOQE7tAJ46wWd0GziVu5Wf5bKNomDFDz0NLcdZoeXMhIOE6nLgHWt9DCZOuKGtIr
	Zn3cS7/axWao3HZr1p66Y9F8c3vOFy/qGcvjQCXOYDcok/t33Ba68KsiUoGySuke
	xoORlx/7W2K0VN+SESdQ0hqsZ6gnNDnX1H2dmirSwqLGNPkNjHoO7LyTrDNNODDj
	Ql5V6SX429vtyCt6aOHmf3i5az2ZLcMb6Q7evbNjigrxoIUXeXFufasWgKCi+vVg
	pOsiwFX+lIeZOyPgpUeuPrB4D8B3YhZJKvyF3YSGPizwVYOxUrHJgq6yI4DxoWpp
	s7Fzvg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeessyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 13:26:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d6389bbf4so5263441a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011593; x=1781616393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fodeJ2QdboYj6AqCWNyQFWBP9D5W0x7wQGzJ+z4Dj0o=;
        b=G6Yx1JzQREtAXFJbh92UrDeu57GyB/UIp+EEIpCwEt3g1IoIug20wqRBsz7eYM3FSR
         +zn3OhtRKNv6HWvWx47QwXJgq4x4guk4ADLMCtuj9ZMGskFH8GthHEHEnfzXoOspqsEL
         /DaGkkFel0Xl245/qUSZH7zpjQs6Ybmt9MOGMDF9FJXAoAuGVSv3hbO/zqTee+/pt/7l
         ximkgWTo9vOt7wtVNeUdJ9FkcC4bsO6z2c1GHy1sSywTLAJKSXRXVGTp2ByYf8gijbKD
         /ZJwl6KcrPXxpYtzSq9MEU2bppX0ZUfGyXavFHmJDeM/Ib8KgLZQgiSih2vhtINgXX5N
         5fJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011593; x=1781616393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fodeJ2QdboYj6AqCWNyQFWBP9D5W0x7wQGzJ+z4Dj0o=;
        b=nQNiTGg9xEZPtSzm83ieQM3GCnPZ6gE2V1KGlJtQbAiRmbC0OFxQlW+IZvyWUS3Mv/
         xzdgARpxsBumm/MOH91c109dVPaxVScPAgKbFwRgFjGWwCdpXjfhD1O+U/r33Sgv7KHW
         YaWVY7u4oPEtgyphzpzcMNVC8vgUGw80hZXxfYzTG9PBaJ3xyeeIsmiYai0xPkvJLsQ1
         6jRaqy06bGr/b+r+35HFhXmMkI2uMfXA3MwoGGyeVHUI/wagZ5nH09dIcmJEVWjJjSH/
         uGpTNMS288gQQkD2oDbz/ukN27FHQiYbUP730AxPh7J+ldPVhJmQkXvxc80BfaPHkYhE
         1ulw==
X-Gm-Message-State: AOJu0YzTyapmHELj1DvPCKsnPfzibkj2RXQ2yES1svmD+2ftCaBFYMHk
	h7F9n052PXWo4tOVyDyNLOotArTBovOf5wYRTc9Qc+su4NECH2PUFlj1i18vpYXOZrSdzYFvxcP
	RvQ/+duaIubjCR1Ml2S/PZpYOVIkWdguYbpkJMyhYeyU3u70UDFTYQVFmq0TKhARZz5zU
X-Gm-Gg: Acq92OFdm3TxM3QtzuMlMSHJWmksL0sibdsP8oIR3NXwgdWeow9ekW3kZYL0zlxvbs4
	YlCMKOND9kjnXKRKmSUXbYOwzXFyP49Kh4AYHB3DbWGEENyrb6eH8KYrz/y0Yvsx+H10+U/Kb00
	6nYoqSDU9C6KPgfj0wicJQ2EWSNF/+LKnuL3wFAzmRu3tNnLOyHdXXWrIcvBpmMagdImiqFw2zX
	REuXLujcpfe82GuvZ295Cgl2tabGI+YPUQZwHA5vAx+/9R5FfRtni036q/NZnzClhqzSR2jVb52
	MMLWRRzFuz8jgbMoZaFQRa4YlfKKEVXHoc8baGeFOLR6I5PEQO/NjHu1FXj5v0MVE+NrXnT4sv1
	NBfGLXjqf4flLL6vJpP2NMSRb8umOk3CRtrKasDfXwmZCoENvH7SdB5AE1qz2yG/13MA=
X-Received: by 2002:a17:90b:6c3:b0:36d:6308:12fa with SMTP id 98e67ed59e1d1-370f0386f18mr22250716a91.18.1781011592618;
        Tue, 09 Jun 2026 06:26:32 -0700 (PDT)
X-Received: by 2002:a17:90b:6c3:b0:36d:6308:12fa with SMTP id 98e67ed59e1d1-370f0386f18mr22250649a91.18.1781011591914;
        Tue, 09 Jun 2026 06:26:31 -0700 (PDT)
Received: from [10.92.193.107] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f68bf99dcsm19245474a91.0.2026.06.09.06.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:26:31 -0700 (PDT)
Message-ID: <6f4da6a1-c456-4b3b-87c3-d1db592ad5ad@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 18:56:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
 <69ad1327-8ef2-41c3-b07f-61d00e862904@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <69ad1327-8ef2-41c3-b07f-61d00e862904@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a281489 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=H6GCtRmxFJq2rLhnTBcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNyBTYWx0ZWRfX0oKT15l5KEcN
 nm38xjBZyPT85YFTFjq15GCQVaaqnuxcv1Pf/swgb6epAyUxf24TFtw3ojPCuYkNlCc5Zvxirz0
 0v8CcReo71qaHkkgskI6S/Q5nMUZQHUHbTYcgEXwpIRS6Dwm4W7CXbCck4Q5RulhVBJiWBpqgd/
 yvQMsCEs8Dk3Ao9r3Zltj8BnAJk2G9krkEaC7HZrkoFg5n455Wi5PelJEQ+bi4SwVGpvRCzKe55
 n38IgeV5sV9s0gS8ron8J1NsS4FVEobX8RAHx6FFIB31xzwQw2/dP170/QwkMaj7h94u93onwfd
 64fqgugQv8aR+uikLGgPoGKmOFQEZic1oUREzcfFvpIBC/pMJWbBjrP6vYtMP4y70By6hpMymTR
 E6KcW/ErmJ4F13FCmvR43zkrxNBlTvdywblpY2qfiZFOGE2I9zhAskFPTbLz6ID6JyM/dfIYTLE
 mB3TDWXZVpKhO6wyf3w==
X-Proofpoint-ORIG-GUID: GbfaBX-qEFxQ4Ooe4V3L7uTPi4A8jiiA
X-Proofpoint-GUID: GbfaBX-qEFxQ4Ooe4V3L7uTPi4A8jiiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112178-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B6C5660900

Hi Konrad,


On 5/21/2026 4:49 PM, Konrad Dybcio wrote:
> On 5/19/26 12:49 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>> based power monitoring and limiting capabilities for various power
>> domains including System, SoC, CPU clusters, GPU, and various other
>> subsystems.
>>
>> The driver integrates with the Linux powercap framework, exposing SPEL
>> capabilities through powercap sysfs interfaces.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static const char *const spel_domain_names[] = {
>> +	"sys", "soc", "cl0", "cl1", "cl2", "igpu", "dgpu", "nsp",
>> +	"mmcx", "infra", "dram", "mdm", "wlan", "usb1", "usb2", "usb3",
>> +};
> 
> If the domain data is not going to change for future platforms (but
> e.g. only the offsets will), which I doubt, please use designated
> initializers

It can change platform to platform.

> 
> Otherwise, please coalesce the names and offsets in a struct

ACK

Thanks,
Manaf

> 
> Konrad


