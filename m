Return-Path: <linux-arm-msm+bounces-92514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNnhHzI7i2neRgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 15:05:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9605211BB20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 15:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0609E3008616
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 14:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAFA366809;
	Tue, 10 Feb 2026 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YU+3tYWy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J0PgKl/q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE8931B119
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770732331; cv=none; b=tJN7YqvcrTgGQTF6OTfZNmh/pN3QKPP3OAOCtgSpPDPY7xiQuU4/JJPXLpty8L+F5ZvIMtfM+ExG/d1MOyvyvvQyFIZSAvBsz6PnJT7GGHJyQ3qESLqKo2765QfMhElT48y0xTRktnmffR+CElEHKJ9lGeBHn5VmPIBOHXuIQb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770732331; c=relaxed/simple;
	bh=oRAyvFW1gMW0isJ1W0La4p5JSkKe8QCw44uOPrWWIBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIXExShHAhTcsLRsNBLfiOAkAx/M5sn2fKsZJeqtj8oPDScbqD8EUl432QM9xrAlkwCFr10WgbyTAwJBiseMXJygNBt3L5O53qUvTdl9uEpEk5ir77ZZNz5GTyPgeZjGpFttATnvA+iRGPAuhOshR8FH7PDPPl2LNwXOBfSGHAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YU+3tYWy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J0PgKl/q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7Z3kV2169241
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 14:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLjK0kCKrATGfaPh5ElTpixsSxExbQnUw/DqSkDBNQs=; b=YU+3tYWy2leWxh8D
	GcgRO0HY6/Gntupiz2x0lk6uSchQM149lFqk7+FNoZ7onkZWldOE0vNIzBa9TxT9
	vVaZJrYU8AzBqC2o136vYWDeWRwfQPa2mrM8+kdHuqS8h1I1LaM+tug4AO6fuWTR
	NjllLNp3pIXKqZ9OfNNfeHNfWgZc0Cgk0WBkUckK9qn02HmCvbfSFY1TmozNxWrA
	ocfpkhM+r7FfM1KJeE0an+8RNhfQKARiF+jJ8+79mNbRD4iYca8pzZ4AYWmHLoVG
	hoMz0G8zX1g3UCERplX2zYuoJ3ntc9BMUQ88zi/iktjwp3ixM56FSvCzreiDORq+
	KoOePg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c80drs72x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 14:05:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3561f5bd22eso908272a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 06:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770732329; x=1771337129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cLjK0kCKrATGfaPh5ElTpixsSxExbQnUw/DqSkDBNQs=;
        b=J0PgKl/qV+dxYzO3tT/lM36NCUYKPSZjKaCjC+6VqWsfKLfJ7AMPs1hDZuz9XySFa1
         lJL65XERRn8SPhwlQ7/AiBA+DOEBM3ogvgtqPvIFGlfvQFysOd/uOdU6O+jRCTRAFl/f
         aVnw19jxVgRJ1TD/yUPU8zH8hrqlBULl4scuT4gy9JuMXQqFcOYRJsG+pJgIuvRKql5r
         BJim4naMAxDR4Yu5IGf76NwZMBjEMkSWQWLxPW+pAhk4IxIyJtBFoQ/02KeMGrJZ4c1I
         X78i+KvSOVbtoOPyxZFwJETk0AVoDutCLZ+vF9PeSdNt3ghu900CkXitCancF28aWgtM
         LO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770732329; x=1771337129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLjK0kCKrATGfaPh5ElTpixsSxExbQnUw/DqSkDBNQs=;
        b=nG4vIv94ck6gBdLJEd2CMoFz4TvJctJUJLgsn9sFpTDLnylg75m9nag1cldG6RLUfm
         p7WT1abEIZbHaVgdHLnGBnvh0GwgbEwAQzfVfdZqQ0uxNSvEDzAkhQLuTmu1LcPlM3rX
         OQW4D6r4wBnYes/XyAVnakLCLfvknY7crJi40FgkT9TaopuMlG/oai9Mee2e0Jc/ENMB
         TzCwa/mIzcKRFEMfPwp9bLRzeCPFrKS1XnYzqcCXw2Pqbt3xPRCmu/5C+3BJP0Q9+eEE
         ERVYf7ossTsdD2kmXQVC1R+SDj4OwnhNsJsiIE1ypYJ+0Xc2toYHWY90K+HO+az9LI3V
         /mIA==
X-Forwarded-Encrypted: i=1; AJvYcCXDEXVqkFGpSeXOkzR0uYp3KknYCvPI4NXRE5YyvAYotOq8kGeOpfOzUSK/Hdewy7weygmMVtZ+N6SFtEC2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7HnAt2mFLZnd0kLUQ43ynK8kbpPW6fYU033rQnNLTSCGWzsYb
	wL5fq2cap/BzTAJMwb8n6hAKAO5T3y56bgplmoLaFbopIl7OlTqZ3hQEtIo7IDdzLkL3dCvUbsL
	3kGO3NhFPYJ2uFTSKKyxXadZnXUmiu6ESLjTqmKMwKsghJw7ybqwIAUtB0dP4I5xyuZCM
X-Gm-Gg: AZuq6aJMGY9WeyFXj0es5zIVX0ZDpQBkXbk2x7lAZ+yjvHlT1C3Vp930NGp523sZodO
	eFFfrcEjEjP8jAe5mGbrRBOW3cmEDibfMn8EztqzlMIByaUSljQYzQMN6r+NdETBYylbx88/cUn
	OdlbZ9w+4HTXrFe/NgjGKFwZZqQINHmAeEgHynwasOfoxVEl0JsIPbXBBmQkyS60mO3qIy6KyLB
	VIFG7X2Q+QydJ3jiQvvZS4S2YIc0+2qLBLe1jbWU8J4K7/FUG5NOqY3pzd1IEeK1kVxzfXmRGev
	lxMDXW2RzUJVxGIYcAu9f+lvPl+C0cich0ta2gX1y+RdVSQOQZGOrKIpxlOZhIuIZVqKW7Qio1M
	8hM8Lhub+OSv1/Pj7d2zGyj3onZobXJAsez5UGvC/gP3vpjbsYqaldmjp
X-Received: by 2002:a17:90b:5746:b0:340:f05a:3ed3 with SMTP id 98e67ed59e1d1-354b3e2ea5cmr15423137a91.17.1770732328699;
        Tue, 10 Feb 2026 06:05:28 -0800 (PST)
X-Received: by 2002:a17:90b:5746:b0:340:f05a:3ed3 with SMTP id 98e67ed59e1d1-354b3e2ea5cmr15423114a91.17.1770732328193;
        Tue, 10 Feb 2026 06:05:28 -0800 (PST)
Received: from [10.219.56.177] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824587621dasm10223703b3a.54.2026.02.10.06.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 06:05:27 -0800 (PST)
Message-ID: <61f166a0-44b6-a917-66e4-1e1230fa1115@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 19:35:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v19 00/10] Implement PSCI reboot mode driver for PSCI
 resets
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <2dcd9e3a-0a40-0dfb-29b8-99b70b73a59a@oss.qualcomm.com>
 <9e9b9faf-7c5d-2e83-a8ac-37afeffd81d4@oss.qualcomm.com>
 <aXduTklGm6AOeaGG@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <aXduTklGm6AOeaGG@lpieralisi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDExOCBTYWx0ZWRfX4Ilk1uT5DRO1
 yPrHGKYG/l0K5BS6FRtMhSuLGy7J6yhY4j7UNOG0SUlCPaZ3TsZCS/qwbh2GWCxa1qHnBTN4pDr
 F0Ea8khQydS3fNWRs5cGddXvl2PWeJ5XFloernl5uu0Atm50okNfhucWq6iDh+Ntf5f86PqWEyN
 DQkFjOpN2QhiLFJWZXAb6kzb2NW+Q9sPiF650cRS037IpwAQb2ZpCfrVaBgUxq9sPRVn0j75c9z
 /NbZP0wO9+p+YGCGFR3Wbms8WWWIZ1BnXBuIXurV58hY9Y2MgiGgZP6o/0vtlnHzLXAw5aMKUWA
 4WhyQXpIEwywAvRzJsqswx3wpQAt4wwKsUjvgb2gdbMEtxBvsrDQ+KZHF84IVOb3rNErPN3tYLy
 O1BepSD28XBKR+iueGzKmfWYAbfLHWIcZCJTVqGQvtO85ipZq/Xof4siiRx/FRC9/af+0X+yDB6
 fXIvH3eKs00fTEO27UQ==
X-Authority-Analysis: v=2.4 cv=fd+gCkQF c=1 sm=1 tr=0 ts=698b3b29 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=hP7UyYXQfnt6fAoQBTkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: dgjvVhPZUVz6R9eRfFzlXUWSdR8EGn4p
X-Proofpoint-GUID: dgjvVhPZUVz6R9eRfFzlXUWSdR8EGn4p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100118
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-92514-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.infradead.org,quicinc.com,arndb.de,arm.com,rock-chips.com,gmail.com,ettus.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9605211BB20
X-Rspamd-Action: no action



On 1/26/2026 7:08 PM, Lorenzo Pieralisi wrote:
> On Sat, Jan 24, 2026 at 04:08:11PM +0530, Shivendra Pratap wrote:
>>
>>
>> On 1/6/2026 4:38 PM, Shivendra Pratap wrote:
>>>
>>>
>>> On 12/28/2025 10:50 PM, Shivendra Pratap wrote:
>>>> Userspace should be able to initiate device reboots using the various
>>>> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
>>>> patch series introduces psci-reboot-mode driver that registers with
>>>> reboot-mode framework to provide this functionality.
>>>>
>>>> The PSCI system reset calls takes two arguments: reset_type and cookie.
>>>> It defines predefined reset types, such as warm and cold reset, and
>>>> vendor-specific reset types which are SoC vendor specific. To support
>>>> these requirements, the reboot-mode framework is enhanced in two key
>>>> ways:
>>>> 1. 64-bit magic support: Extend reboot-mode to handle two 32-bit
>>>> arguments (reset_type and cookie) by encoding them into a single 64-bit
>>>> magic value.
>>>> 2. Predefined modes: Add support for predefined reboot modes in the
>>>> framework.
>>>>
>>>> With these enhancements, the patch series enables:
>>>>  - Warm reset and cold reset as predefined reboot modes.
>>>>  - Vendor-specific resets exposed as tunables, configurable via the
>>>>    SoC-specific device tree.
>>>>
>>>> Together, these changes allow userspace to trigger all above PSCI resets
>>>> from userspace.
>>>>
>>>
>>> Hi Lorenzo,
>>>
>>> Is this patch series now converging towards the design changes you
>>> proposed in v17? We’d like to conclude the design so we can move it
>>> towards closure.
>>
>> Hi Lorenzo,
>>
>> Can you please review if the design aligns with your proposed changes?
> 
> I will try to do it this week.

Hi Lorenzo,

Any pointers, if the change aligns towards your suggestions about the 
psci_sys_resets?

thanks,
Shivendra

