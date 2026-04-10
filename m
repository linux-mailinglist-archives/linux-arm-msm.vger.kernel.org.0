Return-Path: <linux-arm-msm+bounces-102622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHGnIwHC2Gk4hwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:25:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEC93D4B3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29AB3300D1FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F2A347FD1;
	Fri, 10 Apr 2026 09:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a509YB39";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqXM6RXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A70342526
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813116; cv=none; b=jaymchKyBedA89/F5JVSE6kP05FYNWqkNrioQbx8TcAXnlf34LGn3kMUE/zy7UyvvGnK+SNiziv10sffpLbmkhQOg4D1tHrrHsZMaEQF8I1BhTeKErECiENuCgwZGM49MkeWlOXFBb6lTFqVCbrlFHnoQl1o+TLh8zOZrhzDnSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813116; c=relaxed/simple;
	bh=sheGxm7ioYDIFzYQgZPgzTJJEiICJbj+IYtCd9XLyl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AI2GHkBQ1KFxtpOQtNRceaf8fuR+HBJKp8MAOVerKyh99arq11ylEf9XBN7lbeFXxbGZU2pIe6vVfac3B1ohJmBhW6j9LLdDTJRAyyn5rhPtVmMhh+bqdTSNj8AmsVx0pA6ANSZlKAzewmsNf/If2ym7rWeC50Gg/e2aIK5o7gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a509YB39; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqXM6RXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5kkTX3352614
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zppDPlPSoF+PZXY02Fmm39wQPhKDV88OsYILD0VRerM=; b=a509YB39uX5tBQyI
	MjdoU+aJR0HNKGwFxdLofDnW3SsFSU24zL9ESi4TehUi3fyuVpBvH9sPzuSjd21Z
	WPArMGUJfTGQTvyxzHZZetdoNiDcRYooORs9IyzieI7ZvZmPk23l3yitHyphFSgy
	WMBGL8Kf30ex3bNoL5zmkOCAP4/mNOPk2X1FPDZdZe6slBVeW4vAdmf2yVlIR3k/
	vWGH1o1WA862w0rHTZDEhhvQCslSWgNj8fxLJeSgKgkDT1jVAJY2MmV6i9Ce3ScD
	HJgUgjdLvSmgnZbQC4ofa2fNmSp4vF39don63K1KqiNPjrXzG4mWuqqd7Jy/8muu
	tFQ/Pw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1quu1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:25:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c79281bd14cso80643a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813112; x=1776417912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zppDPlPSoF+PZXY02Fmm39wQPhKDV88OsYILD0VRerM=;
        b=fqXM6RXCjJDCJ4YJt2uhaGZyCJmIyBcZfD/Iokps+/8bexdiDzIzeYyUY+PawoA3MG
         7GTVYDqT2eaxcL8+e80xVdqmUc8clRP35S1erPxNFGtTjYfcAUdfFDkXXXGrOcthSVue
         6qe0yHlLU+rhNE3r95JM+V74QW9w5sEyd5/309foaqgfR0S3ti91WO4F7AiGEZ0T1pYY
         kMmaSL4DCdVuTAbwt8f0ckq9cfOpff1i550XfR0I9SpYVX2V0JDEEhDqytHf7bUsjYSk
         EYy0ngBWlnZyGlfGMl+wQxiq8xhnz6v/pqeOjibpy7IXsGAp4HbsFDqbs0x6LD/SHXZ+
         hnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813112; x=1776417912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zppDPlPSoF+PZXY02Fmm39wQPhKDV88OsYILD0VRerM=;
        b=pNOJSoQGs785mkpLIaKD3hGQfmsk9QPRXXtXpXOjIRwM8KAbteIWzFqOgltk4rXAE9
         1CDNBeJbWCkmTGdtJdngG6dCtXmdKST22Fc+5KEs1Cf9bvrHYjUPWwaHwqziMyxVGoez
         d364ZOj2cYMLT4e8iWKPZw3W6G+LzQeIzdHRNHOiz0JKguQXu6DAoJ4NejvZXaXom7y/
         9FSkg8ObXIZU4vSYGx/diUMlGuF5H//DanyFhxjDqVw8kBV3vVauAr94tmxc7ChFMuhe
         lmiZbt63hRmr6v0bDbWGriCwVJ8kerALAEufUQ+5406TLDqOebbOYD6T5CHcjSH7EFmw
         V56Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBjuNS34tqOhcv+sQ+7myj1Rf4IqbgY2oT9K7O1QLKBmhzsb/ihzepOpq9pDUmmIIoTeeTgjFcLRtOciKm@vger.kernel.org
X-Gm-Message-State: AOJu0YyN0YoRF4aQrwZD7FZR8yiD78R8u35AE7Ub6WCbUI2WLbniX4nl
	+Ug8gaDWFiv+ckpr8WCEhhSib/G7OwIxFhVuv675gebBIPEuc0WQB6TSQjdLimw1etVNzAOkVp6
	6ecShAFlMjoZyVpJQl9yRkcZvEoBvHAa3HYn/j07ak38DOYkalIEr9InJ6GG9QE+jVZNw
X-Gm-Gg: AeBDievAdaUUcKyk1cjACSfV1MIUs/75JlC1QccRBuS82Vhz5lv8L2TwOjNduA8eUQs
	EzoFhj/92TIdWnTkCrFo4s87P3K3xCqMiEmkYd7fe8gJza21h8scVivsuMA8LJ0Dfr9CKTwL37q
	r9Bqsuqn9661lzVK4KtkUI6kZ2ZrEg2KMJSJ/AvaTpSBxShoKurTlmwuDNRAjd+zU6LGSOD2A7T
	JylttBjuzK02GqD3A8QgTFd84NoiU+lD39BT1tBpTdqo0mslD4R1jTVpDbQw3RkUut+lVeGJMJM
	2zvzEDaiWoEnhLuCpJQA7VE4BiiAnvtl+EM1f0uyghQdayDyXCMw3jfmvnhO/R5v32NAHSr5FJ/
	x87SZdgt7KSNk5FvlE+DuTQDG+ZsnLYv2Hj+n52dmFee75TdF
X-Received: by 2002:a05:6a00:1bcd:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-82f0c169049mr2705986b3a.15.1775813112214;
        Fri, 10 Apr 2026 02:25:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:1bcd:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-82f0c169049mr2705947b3a.15.1775813111521;
        Fri, 10 Apr 2026 02:25:11 -0700 (PDT)
Received: from [10.218.28.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c506150sm2123732b3a.52.2026.04.10.02.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 02:25:11 -0700 (PDT)
Message-ID: <80d60c30-7e60-4233-b072-3d3719533481@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 14:55:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
 <20260410-ludicrous-rousing-pudu-dbe5be@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260410-ludicrous-rousing-pudu-dbe5be@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4MiBTYWx0ZWRfX32Zxt18+h7VB
 6LhfU52FCJgg0itL2gU6mwR4IIR9abzNeZYPJT8x4geyfUkip4BUe/2st5GQv6XuXFju2uhE/pl
 lTybE5GPpZZwx7uLJowDqIi/tumnqtpzdsjRHDrWDgdjN1kfhcE9zpkJLL0JHI+MaZn5tMcPZqv
 mFJ129M7s0ns5U4rhLvWPZ90fjXFaVNsqV19wZ4xB0i8SBgxbpo9gEddp732UDbI8NMGiLhTBvO
 tYrKX93WJqf2UjVwFy8ZtYH0PT2YrQ0ovTK49+S/3TlPLNKtU1hJDCQ5JCY5zIRtdm4kn7LsHG4
 39eDPkJK22XgT38E6Jsr0fiC4OzWkvbtOgZQX1VdQ7TYDV0FgrjSW1Ium0G0X4S8MuhHWYTal9r
 Wsz3nBt0AT8KeVuUv+XgBuCUptAcC6JR2At/9eClFAR5GwpVRoiZ6GPKkpL8FAmIDUXW4LxaIBX
 nmycDAV6cYe1ltSNu9A==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d8c1f9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MbdO6sGYhmOsAQUEtOMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: vmcGTCnAbS-TNHnPOCxV1WMgZiHxY9qc
X-Proofpoint-ORIG-GUID: vmcGTCnAbS-TNHnPOCxV1WMgZiHxY9qc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102622-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,81a00000:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,80e00000:email,81c80000:email,4.196.180.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[4.215.3.128:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3EEC93D4B3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/10/2026 1:14 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 09, 2026 at 11:40:49PM +0530, Taniya Das wrote:
>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 54 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
> 
> Note that this patch and drivers parches were likely not tested.
> 
> Please mark patches you wish others to test as RFT.
> 

Krzysztof, please find the logs, if you need the clk_summary I can add
those as well.


/ # dmesg
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd801]
[    0.000000] Linux version
7.0.0-rc7-next-20260408-00008-g476992104d28-dirty ()
(aarch64-linux-gnu-gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0, GNU ld
(GNU Binutils for Ubuntu) 2.38) #19 SMP PREEMPT Thu Apr  9 16:46:11
+0530 2026
[    0.000000] KASLR enabled
[    0.000000] random: crng init done
[    0.000000] Machine model: Qualcomm Technologies, Inc. Eliza MTP
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: UEFI not found.
[    0.000000] earlycon: qcom_geni0 at MMIO 0x0000000000894000 (options
'115200n8')
[    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
[    0.000000] OF: reserved mem: 0x0000000080000000..0x0000000080dfffff
(14336 KiB) nomap non-reusable gunyah-hyp@80000000
[    0.000000] OF: reserved mem: 0x0000000080e00000..0x0000000080e3ffff
(256 KiB) nomap non-reusable cpusys-vm-mem@80e00000
[    0.000000] OF: reserved mem: 0x0000000081200000..0x00000000813fffff
(2048 KiB) nomap non-reusable cpucp@81200000
[    0.000000] OF: reserved mem: 0x0000000081a00000..0x0000000081a3ffff
(256 KiB) nomap non-reusable xbl-dtlog@81a00000
[    0.000000] OF: reserved mem: 0x0000000081c00000..0x0000000081c5ffff
(384 KiB) nomap non-reusable aop-image@81c00000
[    0.000000] OF: reserved mem: 0x0000000081c60000..0x0000000081c7ffff
(128 KiB) nomap non-reusable aop-cmd-db@81c60000
[    0.000000] OF: reserved mem: 0x0000000081c80000..0x0000000081cf3fff
(464 KiB) nomap non-reusable aop-tme-uefi-merged@81c80000





-- 
Thanks,
Taniya Das


