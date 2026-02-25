Return-Path: <linux-arm-msm+bounces-94184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEl1BwxLn2lEZwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 20:18:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFA919CA9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 20:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15A76303C620
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 19:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFF13ED101;
	Wed, 25 Feb 2026 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBIuGH+q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="judDxENA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14392D5410
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046993; cv=none; b=XhjdISaTlgUJGVQMfBVdLhPqbJ32R9DKeP4qbrw5TVrKig9vGwCZ8wwmg3TYNjO6p4xyocqZ0pL+FQ+q1PfbEEP/CXCcc1Hw5Wfl15JF4ZH2Nh7F+KZeArIjJfghCpk3wKFoShS46LQsryO1gDLL1PmNvB+2hZqtXzEgB0fgh8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046993; c=relaxed/simple;
	bh=JKDW/3JaTVDQQN1HGh2Kx50563O3XSftBtp3y9MuSmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EezBOSV8qs1eqqJ3/AcOAdO8X4N53yMBTrhizpYe/4dDT4oCnWQ4AbmLlfqdoQrxp78JtGWVf7n1xc/CwQXdnpmupyqKRQl3dOjfdle8uRU+soRPaxEp202OwctMHkoRtc4VPoxls/oU8rZFMc1X1BrSBzQ9UHw9EIiZNgFqW0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBIuGH+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=judDxENA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PI0Jqa806689
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdS/QntJSaGj5m5uHLTyiULnHKwPg/+0nR+soa0YEdU=; b=NBIuGH+qsITYkPXs
	Lof0N/6lSzDAv7Bpsm1A94Chi6YXXVYgoHooLmZ82JXaMITNohWCFCF5VA++xnoN
	yFJorSI5utmoSnY1IhQPWMnBVJp91XxB28WwAFzWVEGN3qSiQZCVtHkO5nZsRo2c
	JpJvOGSulZmLVv3Ty54oc1DNU2nIwPiaHIsLPqsoM1WW3qQCi34G+Bvjexxh6JlM
	uafSnrGYntn6CiqjATlu+MZVNOrBjrL6486X76+gARLA1z3DqX0pMoQtPXmQWMhN
	YH7S0MKzRKnXfjyz3xCY97lqnaDBIvi8uc5BjAJfkuSc/hfMmthY1ejzMJHJ1Gi+
	Zxh29A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chr5pawyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:16:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so26893eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772046989; x=1772651789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdS/QntJSaGj5m5uHLTyiULnHKwPg/+0nR+soa0YEdU=;
        b=judDxENASDtWRPk1RjrdYNQmPdZ6zl83fwVveVZG/dekj2O7E+UmeJxAc9KwrzCx1x
         UI53kcbj5D+4B0ZmOJL+9zZBnX2ZsobAF+q8LwXic8yJCDRIXeUvFDBctogM6jwNs2Zj
         tGh5FNh00YR0/xrs1yrFIQvplo2/3kQO3382RiNuT4O8gQwHaeaBc8KGnjGqWK8kO/u+
         XKgw3Ghj97pFsZu1zBhqBD5D9kj5qr+KJZqGs2iXLhUkBBVhlawPb4cC6adQfPvkX5x3
         cwuB5mOKK7aZOE4sCNiFHhHYaI9q/xJCmCP9zGXboccwuwtmkj3p1apDnL2H3Nir7GLP
         qF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046989; x=1772651789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdS/QntJSaGj5m5uHLTyiULnHKwPg/+0nR+soa0YEdU=;
        b=vzufe8UfXDXom4KrNnqEU0IKBWnLHgqkEde0nDLpVdOcyrgdSeDeHislcZsFMMvm6R
         QACl6vF4yMh7jnF/3N9QkgW1YVIEuWwYtm/M3cOXkasZsfL+3OcPdfzxn38JbedFuSII
         9q8XKjaHH0U1sO3pU/9qpZ7y3cyCp04PLMBvCIeFrCL+0U4ASwWCEkKYKSN16zO3k8i5
         sJyb24RklLlkR5875V/iIUvbE1ssGhfvj4H81gR1FmLsGaFqZoE1f1zq5IfTSmlV5TRO
         1jDDrWolKqfZmI+LXkANLYWqptlPFh1Ia1/xX6q7wXGXQNG/GVBjTrG2VTTJ3dc/yUI0
         ubuA==
X-Forwarded-Encrypted: i=1; AJvYcCXYHrn0z4pYB4tiRarWP+xgpOzk7NuM7D0zGMwdT6hC57fQ15qtgp9PlPgnssr0eULkT7Gm+rOCkMbktJ7p@vger.kernel.org
X-Gm-Message-State: AOJu0YxqtN74XV6vnc7/AyyNn9Ia6dgqMPwgXP9g0UFfxY3ILmB9a7e4
	GWvrAmRFkO3UUSfSB+M27imaIT4WhwPokpKEjM/8yUQl+lQQe1fj1zeWQqTz/MVJFpN2FFhpE4z
	+Eixzs9YIPKkPiOKoPBGLFXnQnVqL3qNBvDw0Top3UVYmb8criaQbg8EJSuW2iAf1XZR8
X-Gm-Gg: ATEYQzzzwz4RgMPSbr80FmpLe3N3hdu1+RAI1Th7cqiy4AeWW6U/so7unFgBfPGQohp
	MCEwzWqMDHEQ6QnZ4glmtrWsw2LzXQCueZEK+9BBUp62JTeUhU6qiDTB+Id10gbkt/yF33w+3DV
	mXqqO+4oOVHuVYWX+19mu8+mE4QAuZb2x8gxKDVaMFbmso86wpiiP5tUpuyH35JkG72DqFezjgD
	gXw3SSWSAiO37v0YbPQrZpEeeyIx/Hq6+2jIIw7r4CAnhDUAwl8uwKh2je9+40yOZaHChkvQJdw
	+M94lLVG9Iy1ZemTSnOQH55dQdr25oD6cXRIlM380VxD3VoSjn0ghrJUDHhK6W9+4WcSpzYkHkp
	sYu/DKFTvQ1bHJadBp+Wx2enApoXvqe8o07Mqx0NtkaxgA5ZM1f83qPg=
X-Received: by 2002:a05:7301:434b:b0:2ba:990a:4829 with SMTP id 5a478bee46e88-2bd7bd112fcmr7841910eec.30.1772046989275;
        Wed, 25 Feb 2026 11:16:29 -0800 (PST)
X-Received: by 2002:a05:7301:434b:b0:2ba:990a:4829 with SMTP id 5a478bee46e88-2bd7bd112fcmr7841890eec.30.1772046988649;
        Wed, 25 Feb 2026 11:16:28 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe8304sm9699189eec.17.2026.02.25.11.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 11:16:28 -0800 (PST)
Message-ID: <4e4b50fe-1091-451e-b854-f7b061ebd88d@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 11:16:26 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
To: Bjorn Andersson <andersson@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
 <e94ce683-d47c-4c8e-8b26-cd327c891cc8@oss.qualcomm.com>
 <5a278b02-f2ad-408b-b0ad-f2297817bd7e@oss.qualcomm.com>
 <opjniedtfhkv7vlb57g3xyikcfkxelthx3lmspmypws4vxz4oc@4uypmmf4t6fb>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <opjniedtfhkv7vlb57g3xyikcfkxelthx3lmspmypws4vxz4oc@4uypmmf4t6fb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE4MCBTYWx0ZWRfX05iy8fjEAEDG
 5V0vuunM9hZznufhpIj5lahTZhuIbclW0D7v7+8OoYvvzHnX7zZQs+qPbNrk8AxCQBlGS9LptJM
 eyj8HoXyO7XW0kaLjaQ/e5wrYufknp46XVxvNYxojTTcqMUmZ4LvOjUehngkuYeJDxc35QfBaPz
 k9ilp3KOXzvYFyQCNn06AawTorvWrWujNLSx1bNUhmfVNj9/SKDdiojj1KTv+jh+Qrm4pdiDpm3
 0YyUENPNgc1XTp1R2os9jiqheF3UYmVr32K25WP2+4u5GFaFRH6I9HgnUqFaUQf/h23OQesETfP
 Lkky71j6HU4c9TsqzokGMfDDXUVhD7AEHKSuZege225YWtIJPfF+fNvMc1yrAU7pvcvungxTf+T
 lEMxGN/1rhDQhgp/1asjBaapyyY60d+zGls06l/IH/xvW61hjQDnpaLYpFPt1NoNscWE3hOAALu
 VbFvl42v3OC+O1piRfQ==
X-Authority-Analysis: v=2.4 cv=GstPO01C c=1 sm=1 tr=0 ts=699f4a8e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Vs6AG_5Z_IHWLNxo5LUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: AjokyqlAPrjrqVRk18Zxb7_H6Ddqkomu
X-Proofpoint-ORIG-GUID: AjokyqlAPrjrqVRk18Zxb7_H6Ddqkomu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250180
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94184-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8CFA919CA9D
X-Rspamd-Action: no action

On 2/25/2026 7:12 AM, Bjorn Andersson wrote:
> On Wed, Feb 25, 2026 at 07:47:08PM +0530, Ekansh Gupta wrote:
>>
>>
>> On 2/24/2026 9:03 AM, Trilok Soni wrote:
>>> On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
>>>> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
>>>> integrated in the DRM accel subsystem.
>>>>
>>>> The new docs introduce QDA as a DRM/accel-based implementation of
>>>> Hexagon DSP offload that is intended as a modern alternative to the
>>>> legacy FastRPC driver in drivers/misc. The text describes the driver
>>>> motivation, high-level architecture and interaction with IOMMU context
>>>> banks, GEM-based buffer management and the RPMsg transport.
>>>>
>>>> The user-space facing section documents the main QDA IOCTLs used to
>>>> establish DSP sessions, manage GEM buffer objects and invoke remote
>>>> procedures using the FastRPC protocol, along with a typical lifecycle
>>>> example for applications.
>>>>
>>>> Finally, the driver is wired into the Compute Accelerators
>>>> documentation index under Documentation/accel, and a brief debugging
>>>> section shows how to enable dynamic debug for the QDA implementation.
>>> So existing applications written over character device UAPI needs to be
>>> rewritten over new UAPI and it will be broken once this driver gets
>>> merged? Are we going to keep both the drivers in the Linux kernel
>>> and not deprecate the /char device one? 
>>>
>>> Is Qualcomm going to provide the wrapper library in the userspace
>>> so that existing applications by our customers and developers
>>> keep working w/ the newer kernel if the char interface based
>>> driver gets deprecated? It is not clear from your text above. 
>> Thanks for raising this, Trilok.
>>
>> This is one of the open items that I have. I'm not exactly sure what would be the
>> acceptable way for this. 
>>
>> As you mentioned, applications that rely on /dev/fastrpc* might not work on QDA
>> without modification.
>>
>> I was thinking in the same lines as you have mentioned and  having some shim/compat
>> driver to translate FastRPC UAPI to QDA. The compat driver would expose the existing
>> character devices and route the calls to QDA. The compat driver could be built via Kconfig.
>>
> 
> This is a fundamental requirement, you need to address this in order for
> this to move forward.
> 
> Which makes me wonder if it would be possible to reach an accel driver
> through incremental transition of the current driver, instead of just
> dropping in a few thousand lines of new code/design.
> 
>> However, I haven’t encountered an example of such a UAPI‑translation driver in the kernel
>> before, so I would want guidance from maintainers on whether this is an acceptable
>> model or not.
>>
>> Regarding your question about library, all the APIs exposed by github/fastrpc library are kept
>> unchanged in terms of definitions and expectation. The same project can be build for both
>> FastRPC and QDA based on configure options. So, the applications using github/fastrpc should
>> not face any problem if the libs is built with proper configure options.
>>
> 
> You're assuming that the kernel and userspace are a unified piece of
> software, they are not. It must be possible for me to install a new
> kernel package without having to replace the userspace libraries.

Thank you Bjorn for providing the inputs. 

I also foresee that we will be stop adding (or already happened) new features
into the existing fastrpc driver, so calling the new driver as an alternative
is in oversold category.

You are pretty much began the deprecating the existing fastrpc driver, so let's
just mention it if that is the case and provide migration/shim path so that
existing binaries doesn't break.

---Trilok Soni


