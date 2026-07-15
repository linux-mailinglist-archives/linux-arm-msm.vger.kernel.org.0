Return-Path: <linux-arm-msm+bounces-119215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HGXKE+tkV2r1KwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:46:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F38175D179
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:46:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N6Uh9ez5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bGryAKll;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119215-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119215-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 132353012CC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17E5446857;
	Wed, 15 Jul 2026 10:45:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EE144683B
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:45:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784112358; cv=none; b=dcPExGjgps8xdzvrYOiJriceeVNk/yMT+EI/3A7h7FuH2k0UW1IENyqxdCZCsdoKzVKyPSM1z5UKSQr4CLV5WoNFr0KF/9s+pe74zbTwMKj/qzalAqlBT5sQ++DlECMQbWCx1RKfVDJ4re6QX3d0p3J84hS54qz+xa46MwXJ6ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784112358; c=relaxed/simple;
	bh=yd9N7LIeODrAaKjJZhnWWcAD1DLOtvdRG80PmzSZIZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttK74rE7IDbzD3JtZJbE7+VRLuCJqE+3SuoR1JF9OOqn4RSFelVXGsRc3qz4jGPN0hf3H8LXKN3EcG9tZvgcOB5VTGUUWqB0jXEdrEoRroBJAj9/YcrgxuUEDTYQ0ia5jkxTzKXMGgNjIUGGUVHWR+GLylIshohfr53Ga42oD+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6Uh9ez5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGryAKll; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FA5M9v3547731
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ygiVS8yKBN52g4G5MgSgFARI1f6Qx8LFoeq5saxBaeE=; b=N6Uh9ez50RbqJ8yA
	6NSlLqh4zLZVnIStQfN1578HpEJoyEB6fsLlBlVvkWwN0bUKLe4sraOrEnhrVQdO
	aWZjfo1YElVGf+Ljxd7EICb5Ew3GJyT88nF5ae7FXLDc7j2p1AAbF2V4Pwvmb3Nc
	B1IUDLzz4WmqDk2P5dG92ylSP5KG0VRhN2SkUhwtGjgB+HFSQ/cH+DXRa8ADGz3V
	ZV76xAlg/vpyrhMmEcwW2qu4rPAb1rCLLxjb7g0/2w3pcGeLTs69Y3SiqgkRQolE
	71PHztaeMIhTUSnBer4LUJ/59mYAoDzFQ5QMZnzpLzSDeaCOmioXwjbo5YMEhgNM
	ZaTsMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe85584tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:45:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso95966185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784112353; x=1784717153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygiVS8yKBN52g4G5MgSgFARI1f6Qx8LFoeq5saxBaeE=;
        b=bGryAKll0EFh8bleJex0Ke7VxAXaTkKDLdrrT+lggCr4ELHdeUIyBfaGyecVUAV/td
         x4sHvi7cu/2TRlHrXUZHKNMdqz/K3xM8Afc45sptSlJJFt15MMolVFIYe1udfTnKstbG
         yLtJvpvuqyxwhhcNrsQS7PsQRtFlTMkUjfTkPtlEZZwXmk9IPEut14GYYS/J3jK7JKfO
         tF/AOpZlei+qin2YgwGEHZ/mShO9H10dUZZBlWlAuwHqUwCZARSSHoOnOcqlXnoF6fJk
         iNpcp0xpdWtNB6N+goR4EWZDoNnQ+7kThVhqz/dR2XDYSsDscgSvrVOz3xBhIexQy5VM
         NrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784112353; x=1784717153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygiVS8yKBN52g4G5MgSgFARI1f6Qx8LFoeq5saxBaeE=;
        b=X9BrffqV0+scenZ/zahXD8Pxr87ypyEEU9nPiLqNuK6rXfVCKw6B1lFXpenXyXEwaI
         Ma28KT3T6838c45aT6uO5BeFBw8betQYXTJc9NpLxBdkDNK0o0tDcollEa0sntkLcQkU
         YUzVodgMiGirFHT0CnUWc2z19QJxybgDsrRZE0eEaSu0K4OPpyfr4SRCdzx8aLY9e9SO
         MIHjdTWzXSBiakcrxEV9DQwBwBi/vxV2LE7COOi6YxRtvZSJYWD6DLMr2CvmrsrhGIVH
         WVHPqKrjbNJO4Ywr28EC4LBU+eYexPIhuPT5XNFHJCqyc/Psu7xID7Nr4LMHVWSSHCNy
         6eSw==
X-Forwarded-Encrypted: i=1; AHgh+RqQjePiavPHJGUcVE8Ewzs9xw8y/md23H3zoA8z34QvNReJKCxASBiNY0q3gxt1uOtE4saS6FLhAraS8LjN@vger.kernel.org
X-Gm-Message-State: AOJu0YzWc09FPPYF9Etsn5IQIQw0AknKkSSjxpu29qhLmV084At2iHQw
	7ZIWKmw/zHq3dKZoJ8W+MneDUSfp7uC9SSJrGNFsOODM8NPlDeePKp9tafcCmoJ0Lcv2SAavVpr
	SJ4GQEVYZqIYsl4YttC0HcfBzx3r4XJkpYoZfcsrVNr0znQNdFgXCQwwhcBjg3p5fjTj3
X-Gm-Gg: AfdE7ckxAHTFcRwlFT/YEJeD9Iz/tde2B00K9Ylf6P8PS3AL3FA7DUDInkZIElQ+HXu
	Q1ETPGIs6ueSmX7dbTSOziM0NWNPcMPuxlvs6vyfyT2o1nMjMMfWTieUHsJDbyvKNHgx+x4f1wP
	0+ky1FdlMY8Uuhlt1+BEeb16Mki86i6+0sN/0m0AYnC0tOXtiFpdG5jW+nS1aHu6pbdRoi1Kroo
	KjGU5UnhN9ve/yeh3UzO3R3MAuW0FcyLxNq9Xi60nhniMCNfdnMBK1wL26rtnjUqvU/QXFKNUxx
	FsR+RY45QQf55I+gpOCbF/CfOkc8wIXk/eVIRmm9DDkcsRrr7pU8ZMk5az3ua3kXgLF8M6K8htH
	yLNA3MXQNfWaC87z5IKjFjLBXgoggfaJJFBI=
X-Received: by 2002:a05:620a:4721:b0:92e:601b:8d43 with SMTP id af79cd13be357-92ef2af9c3emr1426629285a.1.1784112352970;
        Wed, 15 Jul 2026 03:45:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4721:b0:92e:601b:8d43 with SMTP id af79cd13be357-92ef2af9c3emr1426627985a.1.1784112352422;
        Wed, 15 Jul 2026 03:45:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168716f6dbsm3186566b.15.2026.07.15.03.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:45:51 -0700 (PDT)
Message-ID: <401ee2b2-1d82-40b0-95aa-005840a5078f@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:45:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
 <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>
 <aldiLuYib1jCK784@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aldiLuYib1jCK784@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SHAUlUFxFgR4JD2e42VfRK-edpkOZiVC
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a5764e2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ERnfXskPEjP3n-q0xIsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwNCBTYWx0ZWRfX8n7txBKGareG
 lkbq1SaY6Oqrq6MsYPQoGljch6GjSj0IYoLbyiFEKZZN+gl8TKeUbX4kxpIwXWDnZUQLPQe81Ho
 PGQFgS3fgDfyenwf3jXdPD2dkcqGLlVO24eAGTrG+KwY3XlnWlgahPnIrvTt0/UwpI2dseJrWp0
 wyP8Rvf4Xs6A4gJsxGcx881p0EyhIx/gnfOX5TQo31gp+K1/DA0tw2rVZ6A8ZJg/ZfRmlQDwq8D
 HBSUmsFUdkWFIp0LbcgnS4+RtVSHqvx1UzermzSyNDBeuC2rHE664Psl6aWztLdoJpXii/BplYn
 Az62rtg5j/NHXewLVTW4g4BzW/x7Y3b6H1416g5yQbb3m2Gz0grDFf0WPTp1AnSXpXYm/lFugZw
 H8pguR37ggExHB4HJMAe58hO5M4ezM8WdEnro+2sTrWOsG29DfJFYhPT/a0spQ+JaNlyY/MFXZ8
 PGgb4Y31SgCVyt0wT6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwNCBTYWx0ZWRfX6BQeR+RQmpYR
 2nuvlZoefcVmdVoAkVJZMQlQX29pFDiGEoLVofMRHZjgH6BrmzR1IGxRD+cPPIAvwZ5asjCVTNA
 XgBCS4tTYtRBpGIlulM3vY+3XmdY9cA=
X-Proofpoint-ORIG-GUID: SHAUlUFxFgR4JD2e42VfRK-edpkOZiVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119215-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F38175D179

On 7/15/26 12:34 PM, Stephan Gerhold wrote:
> On Wed, Jul 15, 2026 at 11:46:58AM +0200, Konrad Dybcio wrote:
>> On 7/13/26 12:25 PM, Sneh Mankad wrote:
>>> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
>>> the latest wake up capable interrupts when the CPU cluster is entering the
>>> deepest idle state. This is done by sending IPC interrupt to RPM and is
>>> implemented as .power_off() callback by registering MPM as parent power
>>> domain to CPU cluster.
>>
>> [...]
>>
>>> If MPM has not registered with CPU cluster power domain, utilize the CPU PM
>>> notifications to manage RPM communication when the last CPU goes to power
>>> collapse.
>>
>> I have mixed feelings about this case. The RPMH RSC driver keeps that as a
>> fallback for platforms which don't have PSCI OSI mode specifically.
>>
>> On the other hand, there are platforms (early arm64 - pre-msm8996 and almost
>> all of the arm32 platforms) that don't define any CPU power domains, so
>> perhaps it's necessary after all..
>>
> 
> I don't think this fallback is relevant for the non-PSCI QC platforms,
> for the following reasons:
> 
>  - They don't define the MPM.
>  - They don't support cluster idle upstream, so they don't need to
>    define the MPM. They can't reach the idle state where it would become
>    relevant.
>  - The setup for cluster idle without PSCI is essentially equivalent to
>    OSI, except that the SPM/SAW driver needs to program the idle state
>    to enter. There is one SPM/SAW for every idle domain (e.g. on
>    MSM8939: 2x4 CPU, 2x Cluster, 1x System). You can just model the
>    SPM/SAW instances as power domains to get the same setup as PSCI OSI
>    (I had a draft for this at some point). So if someone ever implements
>    this, we should be able to use the same approach as for PSCI OSI.

Yeah I said 'necessary' because of the arm32 platforms. This would probably
be the preferable way forward.

> I'm not aware of non-OSI PSCI platforms with MPM either, so I'm not sure
> when this fallback would be used.

I think it's generally only SC7180 and there's definitely no MPM there.

> We probably do need some fallback for the old sm6375/agatii DTBs though.

The sleep logic doesn't really matter without the platforms hitting a
specific power state anyway, so I'm not sure we actually have to (i.e.
the regressed path can't be exercised today anyway)

Konrad

