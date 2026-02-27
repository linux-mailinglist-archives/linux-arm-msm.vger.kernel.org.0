Return-Path: <linux-arm-msm+bounces-94437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AObBEU+BoWnztwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 12:34:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B81051B6A1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 12:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 869AF300352A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34EB32ED2A;
	Fri, 27 Feb 2026 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqgINwBG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mga1er6z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630B6327BF3
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772192051; cv=none; b=Je/bRiDtlBEk3MMwYUmIj/0pYnMOltInhVl+QoKhuOTKAIlyaN0Dcrb6qw1dQDHwKa2V6zqQ4c0mG1kpochsoPyD9Pn+UO4/0GofdFb/gRAGSmOfBINLSSgfshAbZ5BlH2XIb8KLAgl1T8mqIUyvY3urriF+xcCEAGDj25CMkWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772192051; c=relaxed/simple;
	bh=j6UAQ/oIUliD2/c9PYJLA4ciREWA8h2f0J8RgFHC3Wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDlf6yj0OjPvKFWY28YRQbUI0F82Y9y7PhDDRjUkaw/RPeaIBMD90IPZGVYeCzHs8a8LWLNmnft7UMRgCXIlzBfDeWNbkf+7IWDiqOZ/7AGLbxkXIGFTtgy+2u145MsMPgpsE8fAvbdBhKDfSis+zGpznFDkhTQCSRUqsssRXq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqgINwBG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mga1er6z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RA7u4H3747009
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vugU6Nub7U1CaNFRr7BPqL+35AbeCYSuFn/3PVLmBmE=; b=gqgINwBGAdAj4WI0
	JDl43c+3HeL8oE3cyj+aei6972f2e0vcKB+gnEKeCygLop0axx3/TDI5Xs0cFWbK
	Mhni9r0uTQNfXPPSzKP8EYBiNex/7+HKrLHPHZISqoZFqhKNpZCfhtw2DZ1LZhnl
	+cGyM+37gm8Mln/VnJpHI4+U8ewizlchmyJchMt8s0Odqvoh2okt0TU/NzmGaYZg
	YsZbY2iOELH/j8s2lKY7LC2+8Omvn9nUmP9M2Vayutxh1u4NZhIUR04m0CERzYYU
	6obevLvh6MxycgDidQTNM2iy4V2YkYb76oYrY5hF534+HZ6BnUKCST+uamddHFRp
	UgqwEg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur2t11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:34:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-896f7c56f10so17832576d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 03:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772192048; x=1772796848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vugU6Nub7U1CaNFRr7BPqL+35AbeCYSuFn/3PVLmBmE=;
        b=Mga1er6zIzB4zAuHlBADWy8egTe/D1kI6mNpt8p4c3dpMEmDs9UHrVCkeBUn3/fmGd
         pbAav6pLAwVUeljGELnqbNB1JwTHchK7CHKJQhbslsh78cMHlonK7TMppbhFpgapnNxa
         JUZfi7fOpsOlSQHfd2zNr9PSMDau4rwo8JspgEYZMRvsdgM/Oh25WWLh16PmdfVK+5Kz
         Db6JN1V3cTBzee1owzGmezVDWS+cR6aOwDdUgzDYDqju1/nuqc2vmafXlV80ZE9Qk7vV
         9JkdvAI1g8+cgJI7qYhuXv0GusgqAgnQHMo5bMky3er30vHRwzY33/UL7xVcH5FkPRb1
         m8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772192048; x=1772796848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vugU6Nub7U1CaNFRr7BPqL+35AbeCYSuFn/3PVLmBmE=;
        b=m6VCK64JWxblF+Helzl2AkHgKFEY0M56IbQ3EJLPZwdvBhf5ftqdYUajwjNTx3G3kv
         9upTitbt2ou8y26s1P/ewDY6KGH838v9idweoCIxEucEvhnbrCDII6trDMSsevOcvlHh
         SIgxLtEiu3r0Wxktg6Xc2uy3EwEchs1ktOePNURGV536R9kmbQfq9aNji/4StN+7La0A
         b5ENuQN3bFdxERc5lY6HiWI4uhSzuO+TdDZAxjUA1eLN7BmO0e0rxKL8R8Yz7PLKldZB
         20PN2Nbn9qRF0UjJj3yDvPHNcVuWv9dlD+Slvti/8WrZwp/7k7wkY413KEo9Aed3qoPo
         a3ww==
X-Forwarded-Encrypted: i=1; AJvYcCUwF0vbdiQoTaMUOgD4+x2cWmSUvJmf3jV5egvL+MybLdZ5sj5ZChJsFYQLIP+MZWWGuZyeoMx+veEr6GQF@vger.kernel.org
X-Gm-Message-State: AOJu0YyNUymVvoeMJe1gF6yVvksowVHwDAx/E8Vh2z9K0mFP+Xp2iItM
	ik6VAee6U+rD/aOwPj1k0QiB/9YiM7sPwToasV9Lw6UFnoK95EXw9oxyPwmo+VQvz378HisuvKy
	Nk0iWaTRvPApE89UkCSqYnpGyqBHPOIO0766TWgnqvDGUtMAKm7bPyllKC8evleGWWu3B
X-Gm-Gg: ATEYQzzXS7pbAcHLq0ABWCx3L/X0WWRElYIJJkcsAuqoQ/Q8LMcY6Ldd+TzpAEFiQpQ
	f9Oo8H3znpLcYJTGW4zm4Jv3or1FYQjhWs6P0QCBgqxivbmW5cFkdwFQMbAtNASoFg9eoDKEuLi
	tOlY7+/BqJlHyWmoeHDxLM/Uhvjb1BA9FyYZevfpcS4J9Z/HubY47XbSUhrp6Pti92TxMKY4e43
	DQU3W5o5iupOVq/S9eoxnK2I5DhCULyP6Pj+Y2atYF50Dv41cfC1+IHleql4kPNaXQXg7bWCvKu
	AL1LNJWtl0r9Uvw2Wpb3YRDXxsbMP50i9xQ3hZoZgq4zcLps9xHV7EFKj0mIMpMtlPQZJXPW2kT
	wcj1YIp3eSWuKvyqpcxlGrF/L4gRxW27JY44lbBZglS1VMK33Kkqe7CEQR+BQIKBjR58hB25qgL
	rKnpY=
X-Received: by 2002:a05:6214:3483:b0:894:9d67:7329 with SMTP id 6a1803df08f44-899d1d86089mr24082996d6.2.1772192048447;
        Fri, 27 Feb 2026 03:34:08 -0800 (PST)
X-Received: by 2002:a05:6214:3483:b0:894:9d67:7329 with SMTP id 6a1803df08f44-899d1d86089mr24082566d6.2.1772192047613;
        Fri, 27 Feb 2026 03:34:07 -0800 (PST)
Received: from [192.168.119.151] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae666d6sm140619966b.37.2026.02.27.03.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 03:34:06 -0800 (PST)
Message-ID: <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 12:34:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HjOF5WBErvaA3CSpf06wS6oKWDViJr12
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a18131 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Og81VDND5z1jpqFtuisA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEwMCBTYWx0ZWRfX379vltsyftKi
 iY+uJdmbro0juxvcgTqnKeu96oj459pOwZPiGnb2MU+dtGm1ifPh7oNe2tHRu/ihUx2oRIzMV1m
 Iu5Uzk25NZL8iPfmUAoWZR77d6J35LU1uAGswQ3NOYyvpYTIn4cMvWDLMomnsF4vDyzYwn9H8Hf
 P6HzYYALFppE4Bn3H/c59xlnFcuRGvUOvWy9S9PkJ5xqTU2/WmNCCEvhzgnxaQhCulmcETb4hp6
 rxZDwhzhzDPRh0LNTL/YRyHqt9+/huWrDWxgM33qkMpMDXO+AG71e99uFVmFipq5At9AvRNmfvH
 rMJUAerlcvsfoJeattGXXolg/QCL5kvEkJKvZ2QLA66C7V2TI7Ho6BVL5AenICuYaSBxtKfGt3V
 Ea5kqjfVBbj6LJyNUW/EWHFdUzre5tuL58oO6sgGIrLAexQ7jjC42x1mNb7FtEHVWc2mxSz4WzC
 IqoSOnrUwvlAQQSCF/w==
X-Proofpoint-ORIG-GUID: HjOF5WBErvaA3CSpf06wS6oKWDViJr12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270100
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94437-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B81051B6A1D
X-Rspamd-Action: no action

On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
> On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
>> On 1/12/26 9:25 AM, yuanjiey wrote:
>>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
>>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
>>>>>
>>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
>>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

[...]

> Please correct me if I'm wrong, if we drop dev_pm_opp_set() from
> dpu_runtime_suspend, then we should be able to also skip setting OPP
> corner in dpu_runtime_resume(), because the previously set corner should
> be viable until drm/msm driver commits new state / new modes.

That matches my understanding.

> The only important issue is to set the corner before starting up the
> DPU, where we already have code to set MDP_CLK to the max frequency.
> 
> Which means, we only need to drop the dev_pm_set_rate call from the
> dpu_runtime_suspend().

I concur.

>> For MDSS, we're currently generally describing the MDSS_AHB clock, the
>> GCC_AHB clock and the MDP clock (sounds wrong?) - there's not even an OPP
> 
> No. As far as I remember, MDP_CLK is necessary to access MDSS registers
> (see commit d2570ee67a47 ("drm/msm/mdss: generate MDSS data for MDP5
> platforms")), I don't remember if accessing HW_REV without MDP_CLK
> resulted in a zero reads or in a crash. At the same time it needs to be
> enabled to any rate, which means that for most of the operations
> msm_mdss.c can rely on DPU keeping the clock up and running.
> 
>> table.. The GCC clock is sourced from (and scaled by) the NoC, but the
>> MDSS_AHB one seems to have 3 actually configurable performance points
>> that neither we nor seemingly the downstream driver seem to really care
>> about (i.e. both just treat it as on/off). If we need to scale it, we
>> should add an OPP table, if we don't, we should at least add required-opps.
> 
> I think, dispcc already has a minimal vote on the MMCX, which fulfill
> these needs.

I have slightly mixed feelings, but I suppose that as we accepted Commit
e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the domain"),
we can generally agree that it makes sense that calling genpd->on() actually
turns on the power indeed

What I'm worried about is if the clock is pre-configured to run at a high
frequency from the bootloader (prepare_enable only sets the EN bit in the RCG,
and doesn't impact the state of M/N/D at a glance), we may get a brownout

This rings the "downstream really did it better with putting clock dvfs states
into the clk driver" bell, but I suppose the way to fight this would be to
simply set_rate(fmax) there too..

I attempted an experiment with pulling out the plug. MMCX enabled with the
AHB clock off results in a read-as-zero. I tried really hard to disable the
mdp clock, but it seems like the "shared_ops" reflect some sort of "you
*really* can't just disable it" type behavior (verified with debugcc)


There's a possible race condition if we don't do it:

------- bootloader --------
configure display, mdp_clk=turbo
------- linux -------------
load rpmhpd     |
load venus      |
set mmcx=lowsvs | mdp_clk is @ turbo
                | brownout
                | 
                | <mdss would only probe here>

*but* that should be made impossible because of .sync_state().

This may impact hacky setups like simplefb, but as the name implies,
that's hacky.

Relying on .sync_state() however will not cover the case if the mdss
module is removed and re-inserted later, possibly with mmcx disabled
entirely but the clock not parked at a sufficiently low rate.


TLDR: reassess whether MDSS needs the MDP clock, if so, we should just
plug the MDP opp table into it and set_rate(fmax) during mdss init

>> The MDP4/MDP5 drivers are probably wrong too in this regard, but many
>> targets supported by these may not even have OPP tables and are generally
>> not super high priority for spending time on.. that can, I'd kick down the
>> road unless someone really wants to step up
> 
> I'd really not bother with those two drivers, unless we start seing
> crashes. For MDP4 platforms we don't implement power domains at all, no
> interconnects, etc., which means that the system will never go to a
> lower power state.

Right. Might be that 2030-something arrives and armv7 is gone before someone
randomly decides to work on that!

> MDP5 platforms mostly don't have OPP tables. (I'm not counting MSM8998 /
> SDM630 / SDM660 here). MSM8917 / MSM8937 have only DSI tables, MSM8976
> has both MDP and DSI tables (my favourite MSM8996 has none). Probably we
> should start there by adding missing bits adding corresponding
> dev_pm_set_rate() calls as required (as demostrated by the DPU driver).

A bit off-topic, but:

drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
1101:   { .revision = 0, .config = { .hw = &msm8x74v1_config } },
1102:   { .revision = 1, .config = { .hw = &msm8x26_config } },
1103:   { .revision = 2, .config = { .hw = &msm8x74v2_config } },
1104:   { .revision = 3, .config = { .hw = &apq8084_config } },
1105:   { .revision = 6, .config = { .hw = &msm8x16_config } },
1106:   { .revision = 8, .config = { .hw = &msm8x36_config } },
1107:   { .revision = 9, .config = { .hw = &msm8x94_config } },
1108:   { .revision = 7, .config = { .hw = &msm8x96_config } },
1109:   { .revision = 11, .config = { .hw = &msm8x76_config } },
1110:   { .revision = 14, .config = { .hw = &msm8937_config } },
1111:   { .revision = 15, .config = { .hw = &msm8917_config } },
1112:   { .revision = 16, .config = { .hw = &msm8x53_config } },

96 is in DPU. any other candidates that should be moved over?

> A note to myself to also add OPP tables support to the HDMI driver.

Eliza!

Konrad

