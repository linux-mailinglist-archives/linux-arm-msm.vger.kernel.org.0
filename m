Return-Path: <linux-arm-msm+bounces-118212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IQPbM/a+UGr04QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:44:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C81B9739361
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:44:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Uh5zxbbw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AvPYxgXH;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118212-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118212-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06DC730852BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E18B3DE431;
	Fri, 10 Jul 2026 09:24:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B303DEFFA
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:23:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675439; cv=none; b=B9uWPvbgvNI/Nl/FlaQ1zBFCBQxuIllji8xs2f73dESQ+csMkuYNt4IGxQCXCIZ1vqeMmN0+hLrYyxS0f9cPqXMLYJf5oHvExoZYgcjpIbdLUU8rq30f5yvhOAsEDylMGCITIwywMiGmR2jn6H5elYLh9TTDK3L9DS+n5wthpW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675439; c=relaxed/simple;
	bh=YoVUDj0VmVAC2jmbVX6pbD6bZIFZCdW/Q0ywRUHMsJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvmak6wYAXyOJPmx6dNpVMoc1AOtqsv4qTa0ytbXm0RsIn4yebDqKC0lC+6B7bi1u36WG5AfxSsyibmAt+6vnksm0/DBCARJDOmI/V1ghOhV+FL4o32Np3aU3MwOJqiMANq6ovycysDIwPM0EzO9o0jJ+tnX3MxrQyRw4b2DGX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uh5zxbbw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AvPYxgXH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7eJPQ141558
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66CNho0zRKeJhcUQz19hKeeEOAaD98LvwCXadn+4LsM=; b=Uh5zxbbwI1VKccuM
	b93P9bjn0BjqDmDT9Pj3cSoLHYNPkJEjf8fhIM0AyitIMR7cDabw7zPz3djCM6cx
	9X6KO3cT2D9jFVoSzRCLBnXSOVHeed/YyMjobcCqR9nptteX79LsvnNXeJN6lNn5
	Crz+8J8Jl72+ByJR/ZD3qvPwAEinjoYmKdzMvAOWROWmtuGxyiH9gXA5Bw3fHl5b
	n9vMkMKe6MGRThvPsgKj5yUbsL6GqRZt+dOl9EfOiktolWLY5O6Bw8txwiyUtGcM
	mSZ4QpoulhBQE8emu0KfDJUI5HhQIoW1LK82sZUkEPcIZpGBS4nfQU1ms7mrmO6s
	93PCqw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf5muh8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:23:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e59d97df1so20245885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783675435; x=1784280235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66CNho0zRKeJhcUQz19hKeeEOAaD98LvwCXadn+4LsM=;
        b=AvPYxgXHH7HIZre96xpaZPYA5DMHZCO9jvagOmyOv3TP5rUZKdjNC3qVHTjNFxiTzM
         3cmhWxxCF1O9zSINRJtfXPbu7vNpSIxrrkCpfO5qW/mXV8u3HwNbpLL012Fn8R+6EVNG
         VA7rSMcoiNuJlojTUzAkltJMNXEaFQwrXdA4cf+ZL4SIy/qfMJOy+Qc64foxsG7p8Scf
         H1fi9J7GQGmckaXJBmWTyGPQBX10eslUunArus0Lk7KC9sHh6rh41E2jFREBsXEwgiY/
         dgNbWleqFM8aMYxbBgQWQZpiNemo7W0zzNKO1ZlbxSfg2pTALF2ZIwOLXMBpACHiL7F5
         mxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675435; x=1784280235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66CNho0zRKeJhcUQz19hKeeEOAaD98LvwCXadn+4LsM=;
        b=r1Az9Kg8X03wX6FQEsPJGy+QlcXdLJNgGS9f2iG2VZ/lKW+kKMcpxCd8Dapq8xcwXS
         2Ikft3YZ62MY/5Me33laJtaOQgG6Qry5rh6XtoQFLlda1v6TZg5SxcFkLw8PTXnygbi8
         ZGTf03It/FOY8hQH9qbRdIiMjh0glX/Eu2mrqvhEicTrPmDaeJb7mHQo7UykEEWl55qP
         lbbDrg22FDF4i/zADmXtU6poJSNvgSOY+rkQyTNRbIt7xg4MCexGw6MdhMr2nPbDR0ZI
         y8oeZaEAkIaTbUz9+Uvpn4mcJAI6Nf5zGWvxFrmaM2e3nnG/Lvr1o+/L26UD41HIOtg+
         47fA==
X-Gm-Message-State: AOJu0YzvhQExvUyO+/eB5R6jD/1YMb/Uqd7rhJRFYn/gSvTkxqc1NEBt
	YIsYtq3+mklw6i+SPwikvVsOD+PRWSX6R2JgNg85pw7ym03vrKPT781epUGpVSOqLclrjYlOHoR
	4lOeGkZbprWRtTfnjrU1h0GL0Re4PCNa2u+So2K1OnsqvURjaa6apmkiRu7m+h+3awek3d6ZWWM
	JE
X-Gm-Gg: AfdE7ckqRE0TRLaMOtAQeE1rJjlAl3gnkYNUklOEJrBVXVbweHfgf3TWYr3XM8D40Qm
	Ec9sj6ZAJKKOQtEmYI4Gg3c6TQKn1Ed6+zO/bUalu7MNrbrAgCXKDGowfe7SqyJAW8nAFkUDdNZ
	R0fZV6C3pmKdiwTzHzNuSrvU/mi6giOAG0+DsQMXRWEk2cWNx4yaMBSrGabl9JrYKYLJNg0/a4F
	MokTsfCNzJUIfAKE9RypmI19dqrvyAmW0H2s7Ud2SnqLRcynNgZkhMcRkOInNNFJEjh6M4fovmY
	OJ7hrIYJkH+Uh10qKLei6cob9prbzm/TO7kVBtV4L1KSPav8778OhWJA3+eMZV+bAuGFKIAXL5r
	mW/W1/4b6GxeLPUdXHZQx6VhKsjhqhG+u/i0=
X-Received: by 2002:a05:620a:444a:b0:92e:72a4:f283 with SMTP id af79cd13be357-92ed7a3d1fdmr672201485a.8.1783675435397;
        Fri, 10 Jul 2026 02:23:55 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:92e:72a4:f283 with SMTP id af79cd13be357-92ed7a3d1fdmr672199285a.8.1783675434826;
        Fri, 10 Jul 2026 02:23:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c38c164asm436634766b.3.2026.07.10.02.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:23:53 -0700 (PDT)
Message-ID: <c75c88bc-3aba-44cb-a530-1d994bcd8954@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:23:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: ipq5018: add node required for
 Bluetooth support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
 <11796dd7-11c8-45e3-8f9e-1dc27da0b229@oss.qualcomm.com>
 <SN7PR19MB673648D6C15A8E15D35F1E5E9DFE2@SN7PR19MB6736.namprd19.prod.outlook.com>
 <fab734fd-adfe-45b6-a10f-a8a25f7affb1@oss.qualcomm.com>
 <CAMRc=MccvtBxJaddbX0PjjMpV+6iwZeYf2ebq953msbMeVN=Aw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MccvtBxJaddbX0PjjMpV+6iwZeYf2ebq953msbMeVN=Aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dpMTDDot4pC99IIj-oxVF2TR2ZLYLTRc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5MSBTYWx0ZWRfX3ya15Osu19gN
 XDAmIGp8iNcl997uZTZfpzvGrFTlVFNlvFhp49VwOIzKEUBNCqYHNxSZnCNkUMv7sYHxvTsD5nY
 ebydbAifg8AuoX6TcQX9svEpWcBg8vI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5MSBTYWx0ZWRfX5LolEb5TnG6L
 suu4FTSk46LzL9DJmZUtBwGcB7qmAdbPZomRPiMcdYOV/IUYJx7xzA8uZIoklF51Uaeu6aWvjuW
 bYyYt8iEEsyUW6u1MjVBUcC24EC5iOsoP4Z+DDQW6EAbVeeDYoiqNhRbjD2qOFfPWV7FUrFi0ZC
 OzgNc24X5XbNY9nYdPeaAvEmtu7wta9iX4EPi53yzMIqOtWVLD0TdCuYvPxv01lpgG9qFwNQEqj
 Zd8If6lSrxlcG0/X9PCugEylbrrGwJA1dKUH0lvpBtZPzAmav4iiIGB1giSghmvUCwSxmQlHNuG
 QF+RxKZOl0EIDA72FcO9Eu65gzHRfNME5fi04ithmaOzDnq83UBgyrdrC2xklhE4sEmMqelDMAY
 JRKC7oyen924UNt8qSohcNU4S63bq/EqdG2OjjNjoanD8XiK9EM5xVzuNGy7p2sS9hKagsaRWFm
 yp3a/GJdzHaWH8ehqKQ==
X-Proofpoint-GUID: dpMTDDot4pC99IIj-oxVF2TR2ZLYLTRc
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a50ba2c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=0aS1VzSqY7UWMrxkMG8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-118212-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:george.moussalem@outlook.com,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:jeff.johnson@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com,holtmann.org,gmail.com,kernel.org,pengutronix.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C81B9739361

On 7/10/26 11:14 AM, Bartosz Golaszewski wrote:
> On Thu, 9 Jul 2026 20:40:04 +0200, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> said:
>> On 7/9/26 8:25 PM, George Moussalem wrote:
>>> On 7/9/26 22:17, Konrad Dybcio wrote:
>>>> On 7/9/26 11:18 AM, George Moussalem via B4 Relay wrote:
>>>>> From: George Moussalem <george.moussalem@outlook.com>
>>>>>
>>>>> Add node to enable Bluetooth support on the IPQ5018 platform.
>>>>>
>>>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 16 ++++++++++++++++
>>>>>  1 file changed, 16 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>>>> index 6f8004a22a1f..8c252fa3ff5b 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>>>> @@ -453,6 +453,22 @@ tcsr: syscon@1937000 {
>>>>>  			reg = <0x01937000 0x21000>;
>>>>>  		};
>>>>>
>>>>> +		bluetooth: bluetooth@7000000 {
>>>>> +			compatible = "qcom,ipq5018-bt";
>>>>> +			reg = <0x07000000 0x58000>;
>>>>> +
>>>>> +			firmware-name = "qca/bt_fw_patch.mbn";
>>>>
>>>> Hm, rethinking this, it must have ipq5018 somewhere in the name
>>>
>>> I agree but all QCA BT firmware and rampatches are published in the
>>> /lib/firmware/qca directory, see:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/qca
>>
>> +Jeff, Bartosz?
>>
> 
> I'm not sure what the question is. This particular blob doesn't seem to exist
> anywhere in linux-firmware yet. I agree, ideally the platform name should be in
> the firmware name so let's upstream it to linux-firmware as such? Am I missing
> something?

That's what I'd like to happen - just wanted to make sure you're in the
loop, so that a platform-specific MBN doesn't end up with such a generic
name in case that was the plan.

Konrad

