Return-Path: <linux-arm-msm+bounces-104465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ+LNhdi62mtMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:29:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE97945E701
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 722DF301808D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC1D3CAE85;
	Fri, 24 Apr 2026 12:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epN87TOT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPGnIU26"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAF13C8730
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033743; cv=none; b=PTgb5Tr57T1TzlPH5z68mnGBERV+wiGvZk3bf2dcL4AKCFbI5KALzYGM8V7INzmvB69DO7uRtRAF6T/szsUZw1DV6ZflaUqMurXJKSULoeEEATCD3TEyHjttKkG+U7OZJ0goIeKM/WcYRDfA6yd21HTGdXl8JtQ764HN/Y/z3m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033743; c=relaxed/simple;
	bh=uKuZ10FzN1B6RsuxZLoalMZv5ofuEdcyCvW+MB5LzYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuIZPAN9KbtUJ8FVKBn1kt+xaTn1pkFJ7PgnbG9cXJQWGXK4hvMNSVH46a9Npv+49d1xxYQp7W9LMUz7QvaIPer44Vo+LZmxWgfo8ogYSqGYyj9z/znptzmG2sPAWv+787OUPkoDtQkzAu74wXcGb7iSu+PBR8rMRXdU6PK91Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epN87TOT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPGnIU26; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8hUNG1532320
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	llEIp5fqwyaBtRtveOzWn174fewDCK2wqKtqzpu7duQ=; b=epN87TOTCcOeY5MP
	eEI/q95jI5CenddvdPQeuD9h3drChkEqUP+7bXNAKsVu54NvFuUuxbx7aotXJyW0
	20Pe/S/9GHlFNxjjOyoq848MUz9bNqQsnNmQZjS+nMjL6TtkLRo1J5SPyNJ47TwA
	KdCYU4EJYvy25ODcUGZfQqooqBwY1o72PCA+YbcYjoviTeAiSTAyr9tRAdsMr/EN
	sz62+QxH1mtLkxLiWlRZb/uIVtLh3QYvW6R+N8BiR4exXcKg/UkH1m/bfARTNofT
	6PP85PdUskYXRySWvyg74vobYNE/xMc5p+UL0+fIVMeB3Ywcsm5p7a1PLm4G+7z6
	rtZtvg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26m53s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:28:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82717caafccso888896b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777033738; x=1777638538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=llEIp5fqwyaBtRtveOzWn174fewDCK2wqKtqzpu7duQ=;
        b=BPGnIU26B77CZNKJ0JoecieNVdVr/PDkGU+XE51CTwfpOEms0pVhSCfCll47TUP++P
         0ueziKM83ECsPH2Fb3Hcu20/myhhl34JKF2He/XD9J3RfSYqPCbU1D3xX6y5x2sOsEQk
         Eb2AQxq+9sMWRNJNZZ5N9TiIK4c5GwPIUd8cruMf0b1/jKrO9xFld+MpgOlM9JLLp1et
         14EhTSQl+yQWKQWvm4m6HNQuK5Jr9siJHJ9b1N+c1u1f1o2za3Xj0wsQWZRf6ziDyliF
         hVjFH3+AZY7a0f86HPQWtAwG4Qq1NrmOLI3eJ9FWwZvFE7wA/4QuTRnVXDJBgttmxN7I
         2OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777033738; x=1777638538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llEIp5fqwyaBtRtveOzWn174fewDCK2wqKtqzpu7duQ=;
        b=JLWIK8UkDxYnAmHrEeWK8jfiW6n+1caXmqGRjp6OxEJ8rBSqZnpBPFhwjNgBkPQ9pe
         QCeDZ+8QIflNaGql43rAWlOoQC9J7unWHqJYIvgSKDUDMin94baiCHePKVQK4K9PUUfW
         9Omhile6FtUSqgIsNDKyZaUkW2578gr7L+4yk8bIz1nTFCdvTh2dXr6ZwB/gbF2qJIbe
         SHSDzVEQwMi0c3448EmjZ1tK4FoH/7b6NM/UBKI+LdRkdLU/mtSCjty+eyNNw5DJaEI5
         OBeYnwu2+hgB986CwO6bOXSRi1HJxC9la9czfoo4JVSvYfXd3VK9PVA0hQIeXppYm39U
         Tmnw==
X-Gm-Message-State: AOJu0Yx0L6OIb8nw7MIiijgIdA+1Ru6VoWzQBeIIL+IvtpLwa7wxNBps
	DFNNNqm6jKuMJpX/wwZWwOw18N7Sh4OaaL9dOf8zkQHSL7vbUfUVmf6uS23xWkRLK9yNTjbJ9bM
	GNaD63m0qOh8hP+LuIJpjPgUwUYr6ZxKgY6BRZyWSc1We9T8iuzSi/k2OSV/ymu4VdxUj
X-Gm-Gg: AeBDieuwhXXp1stVqe0SexqyLO+soXcuCeqMY96Eb/Uq3tySD34G4Fb/LS1EbhYEblh
	zRtGBlnWEG0FmX6KaEU/KT9TrwSVq1xO6nqOmyCn0D54cO0R3D8zCISdWo02q/gDeaJyFP6E9ao
	4ysrlDnEKTiLdw15gaINb/WZ8du6ieNUEzNrvb7CfWV6CXkgWkTaP+cGcfQdqzgHZ04kAsF02JT
	JEHN/I38OIMXievjfuTtHXIBQso0f/a0n9yJeNXuQjFRw9WMlB8j7Lq5uOn+SCwwIoYMwyF35nh
	SODSWeDTlvEt95qmVkC9/iuK3p99ZfSM7KmXbRcDyB8apBuQVf3vHgle133tkMrREJc56nZDQeZ
	+25Y16LdK3a4v+3A2+hV8vSREHAsE9efuxhUjR0rMyy/HSaunud/2CqQ32NHbzcp3NgbKgtHrFi
	Xa+vXscGuIJcWTOg==
X-Received: by 2002:a05:6a00:bd86:b0:82f:1da:9781 with SMTP id d2e1a72fcca58-82f8c2c243emr17014163b3a.0.1777033738224;
        Fri, 24 Apr 2026 05:28:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd86:b0:82f:1da:9781 with SMTP id d2e1a72fcca58-82f8c2c243emr17014141b3a.0.1777033737587;
        Fri, 24 Apr 2026 05:28:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb33fcsm22424008b3a.33.2026.04.24.05.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:28:57 -0700 (PDT)
Message-ID: <2f830f17-4bc5-4ebd-a66b-8068a14a871a@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:28:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: add
 LPASS CPU audio variant
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-12-14aca49dde3d@radxa.com>
 <29a7dd01-7513-4fe5-8546-d57757b3b2d0@oss.qualcomm.com>
 <88B7BBB9133FBAD1+ccb025ea-4999-4701-bb18-c57a42cabe2f@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <88B7BBB9133FBAD1+ccb025ea-4999-4701-bb18-c57a42cabe2f@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MafyD7ThE4QfqgIFeW6raPVZrUGmnoST
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb620b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KYwSRLHedoOKSWcoqLUA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: MafyD7ThE4QfqgIFeW6raPVZrUGmnoST
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNyBTYWx0ZWRfX6t7ye09XVeBD
 z/VYNDyL3Lz2H4/MtrSGwe4k/SosW3QxR29l4/bWYvu/tZ0ibIOJi2i8xfjDGOMwAq9vaRgfcbn
 RTE8gBmDzXrLhhcWKf3zKhfSw9GvrvCP9sG1RQyfMiSXLAMFs+OUU5BoH9xFzFSdyHOBzb4vfM2
 BCBHE7V+q2/OXv8BwQRcPoik1+3SgfPMKxetzOc+xJiMPHF7kh9Asn/VjHVfJpnUp4mT6dRDYNU
 1Yni5vKLYk40th8vVzZgxDr9Qsws8KiYAsqIdItdQKqtVmSM6M3oJIVL+PDkUeo//g1qx0aVPHq
 8Rc7PEgHs1hvXEQemGApD5uGEwe+hvnUYTwpxrk5itSBQAKlVaI7k2700XItht0DwuJcVyNHXYj
 obCtoFbMVagtCIz/eb1PV4L56yr7E4L3ZeSukx2TTr2Q7CQtnD0EPpQvi2oexiXrajzdC3tsttN
 F/p0AXdlT1ddDrXFz0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240117
X-Rspamd-Queue-Id: EE97945E701
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104465-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[radxa.com,kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/8/26 11:47 AM, Xilin Wu wrote:
> On 4/8/2026 5:06 PM, Konrad Dybcio wrote:
>> On 4/7/26 5:20 PM, Xilin Wu wrote:
>>> Add a qcs6490-radxa-dragon-q6a-lpass-cpu.dts variant for debugging and
>>> bring-up of the host-controlled LPASS audio path on the Radxa Dragon
>>> Q6A.
>>>
>>> This variant enables the LPASS blocks and codec macros needed by the
>>> lpass-cpu driver, wires WCD9380 playback/capture and DisplayPort audio
>>> to the LPASS CDC DMA and DP interfaces, and disables remoteproc_adsp so
>>> that the audio hardware is owned directly by Linux.
>>>
>>> This DTB is an optional configuration for systems booted with the kernel
>>> running at EL2, where direct CPU access to the LPASS hardware is
>>> available. It is useful for users who need low-latency and fully
>>> controllable audio.
>>
>> I believe on Chrome platforms it was done this way because at some point
>> it was determined that they would specifically like not to use the DSP.
>>
>> I think this is more of a hack than anything else.. but at the end of the
>> commit message you mention low latency - is the impact actually measurable?
>>
> 
> Some of our users also specifically prefer not to use the DSP [1] :)
> 
> Based on their testing, the AudioReach/ADSP path imposes a minimum scheduling interval of 10 ms, which is much higher than the 0.67 ms they can get on a Raspberry Pi 5 with direct I2S/DMA.

We passed on this feedback.

> Since the lpass-cpu setup works properly, I would not consider this a hack.

Well yeah it works, but I was really hoping it would be made
unnecessary and available for removal sooner or later..

But since there's a genuine usecase, perhaps not.

Konrad

