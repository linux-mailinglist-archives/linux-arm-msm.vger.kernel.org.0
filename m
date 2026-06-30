Return-Path: <linux-arm-msm+bounces-115327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pUq0DIyBQ2rqZQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:42:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9703A6E1C04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:42:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="G/U1rECp";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XqzU0IkP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115327-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115327-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DCE2300E14F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F733161BA;
	Tue, 30 Jun 2026 08:42:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A881B2DB780
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 08:42:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782808969; cv=none; b=eu2zwaPfB5GakBad53cLFRirGz7cHfCnJ7f2Rtndqir0tStb/HanIyC8qDC81HZlLFz3rfxR/cHieRx7RoANEJzbeOvXHRAXll8nTOh79wmIzplTCqjicgqe9Ont+YU/N7+LnH6A7OKBVMrG3KawAyNvUTVD+rcvml+UexfFl/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782808969; c=relaxed/simple;
	bh=awnU39Goc8U0uYSQwFG6QxmjFciE6pLbo6oarSPAhTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oype5TVCP3rI1Uy9uKFWcZXpfwyPhyd14kuCHAXLQc7SV4l83vk2GwJPI3kh30ybThsCw0rGZ1nK4B5Klyxtg66rYZKSl52KH/VtZ/EGpp+teeQ0d7fXun1xyaUaE8NUTVUjh0wg6U7LvB3XXbT2mmnG5n/6soH3ZuKZQdPtEe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/U1rECp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XqzU0IkP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CNjD1008617
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 08:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3PkPp9OpJEAmf4QS2hFOkoU+Rq0Ib3wE4adA5BkKIA=; b=G/U1rECpO9DXIczc
	CdXXJFxo6nXualylOUdw7K1x8kiqi4NTIjROD9KbTKEQB3Fb84vvHR+lZKNXLhnz
	Am+N7X37E3xzbWuIAdNENwNweVMEl6QUrackh78/W96Fx+Ch8Fs7WTaBmZ582ncM
	4WR7Fcu+sg/OthS15mHy6Mg/wTomMuQCDOU6wlhv8LzQBk/62fmN01zVefx6aoRb
	7p4/hTsibd4zwX1Mp2nnKtIRYtNFgu1L8cF89NCWBUjtDny+jnKl2H35Yr96kjnI
	nwoEw2QqFq8zoLQdXbyAgEo3gAbVIyYWhTKIgKUll4eeve4SyKaodgRa2wgh6Xas
	7LLxVw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw92bg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 08:42:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8969083f23so2386081a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782808967; x=1783413767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3PkPp9OpJEAmf4QS2hFOkoU+Rq0Ib3wE4adA5BkKIA=;
        b=XqzU0IkP9D0m//B878lJIhx/fZpZwUNl7libjwP2fVsCVJ1Fde7X9EyEjSnzClMX8D
         uHfPBpRrnUyH80mkym+dXauVKMm3zyEiEVHIRMfU3XF8AbDZ9khKpz7nITANXtcP+IaN
         OWpQIsIVOsG8cVp4vvv6vtccK8qKuI1hvo7Om4DgoCrBqzoVUkJnwIJnCQdP5+hUlDAy
         R2PNj7y1I9L5p9QfgohyYc4MkAxMhfORf1y66QHpNvbWUuV6p3wSIeWWP+NSFCCEnLcf
         WEBY+Vs7+ii7gYPfgjj5C7kEf2sMKj/5bcCOuoMRjmogGLHWbQrIsaKVZdhZm8WDcofZ
         7OcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782808967; x=1783413767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3PkPp9OpJEAmf4QS2hFOkoU+Rq0Ib3wE4adA5BkKIA=;
        b=CqApsK7LA5ROmYgBpILePhEBYLpgRq+xOhK/DElKzal7OdLd0bTFTcX1pS38bQl6Ly
         Ip3NfpZVJtmR5vQjkRbAh0Lv2V2uTZissLEHAI26LgP2tClVkqwIn5CNTh4jaKk+y5fD
         YqSgX05q1/CEa9toEEYm5v3yfrgcVTSzgnof2/DlvWUj3z4+K2gcYzWiKy36cjqVCrZ1
         4sf5yL0k3LtKsLr58hzU4WNA1lh4GpNcSaWn+lGJXVjIXPKbatSDLDlpUounXyQAyBJX
         CDmX8gQQe8RR21tG44w4DRKtcPwrHw6yrctPRTj0JbYy+7noOEr6pTZ6nDEftirjlf7g
         WCMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QUtAx9XKW3fKJIj0cKXZLExMGiGWQnbI6loiS6ChHCgHZx75JI9azCZH6uNiKJ7JxPJ1ldoUTeMOt+6uW@vger.kernel.org
X-Gm-Message-State: AOJu0YxzFU3SbIohmfZJOhLtTXGFt78sgMtEv1oZ1prW6C+ubWqHsGHQ
	ExSyGYrxfVolr83dv6leRFmd6Uw3wIzV1a6Th04TAtrGkZXHbtziqgUXuaQtQNvFiPs/8MEsJo7
	pHJNWTaszoFMU5gp5HokAS/SGglhdF1cvbeYPZJBasJ5XVTmKU74sDEEOMsx079MOwOgL
X-Gm-Gg: AfdE7cmI/ANrt/bJO6Hb1FgraXpsERNWjyPs5fpuR4CqBFRkuTYxxFnmu0Me0f1DRZh
	NtObGVzseoj7mLEO0IE1IA60oLrcqYc7ebdXiD8MwLoLaYDoCOdsBjvxplX5tihAgLPw8FSA2fi
	ixOnb1Gl9dnyASPuQdRKEm+WfikM3BIO1bxuW1Q7+8kGDZeleryPC05siBi9B0pjxowp5sq2MKl
	/tnGwjJhYuizwLjEeGSx5iWUk03/FScU9KadBkwQrxMEXCXLN09eQS/zBCEJBRZFH9kyvkFAqK8
	TytOwJSumZ7yqdK8D/akL/Qzjqt8KiAp92NaRPLcChVbqUVzBkBubVb0H5Z06tCN66zYNoeF1Be
	tdTLIV9kDz4CTGumSUBrwYvTt+ClFenfR2bdb0oDMSbpF3xOHZc3G+ys5D5LTjap/uFwgnue6RK
	0=
X-Received: by 2002:a05:6a21:398:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3bfc50664e7mr2352350637.3.1782808966658;
        Tue, 30 Jun 2026 01:42:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:398:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3bfc50664e7mr2352319637.3.1782808966200;
        Tue, 30 Jun 2026 01:42:46 -0700 (PDT)
Received: from [10.133.33.20] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbf95c04fsm1124404a12.21.2026.06.30.01.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 01:42:45 -0700 (PDT)
Message-ID: <37017aa2-e18c-4568-a37c-d13964cbb418@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:42:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
 <20260626154949.GA1812158@e132581.arm.com>
 <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
 <20260629142848.GB1812158@e132581.arm.com>
 <adb45638-1787-45cd-b4fd-d957323cc608@oss.qualcomm.com>
 <20260630081021.GD1812158@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260630081021.GD1812158@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA3NSBTYWx0ZWRfX/SXVxQRAUV/p
 pYB3Yp7SQVGJhl0RmC8Dfu3cMJMG7hVs/PpEJfqwAGBZ/9yCdvKvCZJ247UO5cTsQVpOH40RqN2
 YKTLiHevRPbc3lPKxom2+QP9XZO9VD0=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a438187 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=9NUdbc6MOnRMJlQJ6ZEA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: CrqOFnUNvOvuL9_7Alm5pkeDeVnreudb
X-Proofpoint-ORIG-GUID: CrqOFnUNvOvuL9_7Alm5pkeDeVnreudb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA3NSBTYWx0ZWRfX48LfbSVbHkBf
 sExM+Ql2oERkFR5qsZm+DuGBlQXOivNuTfXkQHW3vwN/XPTPtHo8EqOwDdOII7l0SfXMIMkJc0u
 nL/m8iItT4IHUWYrNPFM3DZh23ddeP1HwOphI7k3MzuSDc8D3GZydxDfXRDnxPmrgC4RrQnGxPd
 Alz3aDBNrJYzsyYnAAZlGeM1CoF4J10pDZStggHinMQBFxF/alE+cdWK3sl5V5gfWOvbxEjgIuG
 9D9E5DZTKFhKhMA9bF0VdvZuRjzTYVAlF2lpcJDZIVF63aCzbqyblPlCE3DGiGotGOn+zK+0RS6
 xs9KhUiv/bPaHC/1vgmFE9uBZIlpo+h42vGXpFWFx45jFtm05ueg299ddveth8vRFmcNkYYM3x8
 JauUQf7VeNy8WVeUlfdUeRoGtl7/xvJ3Z4nKDPmaPFpOKygAcGokGiFKy1k+po+Cs5ARN73VhAO
 GI4a+EFm4dGXJJ7deag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115327-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:leo.yan@arm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:yuanfang.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9703A6E1C04


Hi Leo,

On 6/30/2026 4:10 PM, Leo Yan wrote:
> Hi Jie,
> 
> On Tue, Jun 30, 2026 at 09:03:52AM +0800, Jie Gan wrote:
> 
> [...]
> 
>>>     - How can you guarantee that a interconnect TraceNoC will never
>>>       require ATID in the future?
> 
>>  From a hardware perspective, there is no fundamental difference between an
>> itnoc and an AG TraceNoC. They use the same TraceNoC hardware implementation
>> and share the same AMBA bus type. The distinction is purely functional: an
>> itnoc is used for local trace aggregation within a subsystem, whereas an AG
>> TraceNoC serves as the top-level aggregation point for the SoC.
> 
> I'm still not convinced that adding "arm,primecell-periphid" is the
> right approach.
> 

I agree we shouldn't need to add arm,primecell-periphid for the AMBA 
bus, as the hardware provides the necessary registers to read the 
peripheral ID. I used it as a temporary workaround to resolve the issue, 
but I believe that solution is not correct.

>  From the description above, I'd expect either the hardware to expose
> bits in a register to distinguish these two module types, or as I
> suggested earlier, to use a DT property to indicate the module type (or
> whether ATID is required).
> 

I wanna distinguish the aggregator traceNoC and interconnect traceNoC, 
even probe with platform driver, but the existing compatible is too 
specific to the interconnect traceNoC device(coresight-itnoc), that's 
why I didnt try the DT property proposal.

> Or have you tried to detect the last tnoc on a path and allocate ID for
> it? (You can retrieve csdev->path).

As Suzuki mentioned in the other thread, I think it would be better to 
add separate compatibles in the of_match_table to distinguish between 
Aggregator TraceNoC and Interconnect TraceNoC when probing with the 
platform driver. This would allow us to allocate an ATID only for 
Aggregator TraceNoC during probe, which is consistent with our original 
design.

Thanks,
Jie

> 
> Thanks,
> Leo


