Return-Path: <linux-arm-msm+bounces-103147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGCYEgZR3mlIqQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:36:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 861663FB5C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B051430528AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3259F3E8C46;
	Tue, 14 Apr 2026 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1kk1sNQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I7iz5PSV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54DD3E8695
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176913; cv=none; b=qpfSTkjoMa0VhFLU4LrpQDdkP6uLTRH5yc5LVVwpFtL+KA2lIp7Sv6F3lpI49XrufL1HqgCp/WqIvP+UWOTUwENThQJRB/enswZq9N6tsOvOYCDE76RJ/Hj2QGZyCHFUBLezjwWfs9+bUm6dkabdRFOJ6QXC0Bk+tkgIsrZ/9lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176913; c=relaxed/simple;
	bh=S9LGzVX1aV8DIfzInqythzN3CdNAxnj5Oi0uk/Mrr4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3iESD5a3tR6LlRFpXx/qMxwXNXfzRIAVEPrEudsLcp0eds6Q9LXeqqm/cU4Iu8u3sbHdXSz91kI4BTQsbdRI6A0XkCk135+3PMvXgka9fjfnZ/NejvLKXnL9DddCcbvbcMnX62GPRPV3nCbNUTp3ul2GQbJiFpZbcSFs9WguBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1kk1sNQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I7iz5PSV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBhnEU395647
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4h/bSO/ywHvkpULu8zqbn2UT6WifoipO/Bcqnz4RFQ=; b=P1kk1sNQ1Kjd16G/
	EsTz/FryVDczRexmWIYsCZFvDTV8xzXxKuijCUvH/c2tM0OwAem2iofOu2LbT6Xl
	m89a5ASsLX+bH9LMO03wejmc/NkqCX4cV14bCownHt/xnKcSUz1QhBG2q/EaAiWs
	bZOu5+k6g4pRycBJobjO4Z0tbvsWiwH4YeC7tvBqWZAy+RrSLn70zu3BMqBQhU1a
	AEmm4jJQDG3NC5vpprDtNLRtRR1HppC02uRRhDNfZ7QEJCgzHaFp0F+niI/HNjVw
	E//1EsAIzE1/ABDKO2lZobp3Q8CmvNPBSrR1BRJPprRe+50D9u4VbUITs+9qXSFR
	ug+l3Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870u2nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:28:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6055c46b2c8so306378137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776176910; x=1776781710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4h/bSO/ywHvkpULu8zqbn2UT6WifoipO/Bcqnz4RFQ=;
        b=I7iz5PSVbwMBbC0lZbZQnyqv1cibo7bAIOD9pdpqFZqdGgx6szM04UfMjtwW/JKBfH
         sGOgs0HmhvJy5HVMfjyuy82VtRKbcMt1Y+SaYxvCTW8SygIcLODjLoH0D0iUZXTUGgTA
         Nba/51Ccmu9W7XizWvnRDn4vyMSjdfSRnlQJCFzunRLxUKUQ+MeJc+dG0NngpwfMxArU
         cYhSks/b0Av3Clk62AkfY4UJlooNYVf2QwVkcIataKp5TUtwF+/obP+p3/FXh9FfwEIr
         IrzFTSTXwr5osevAbRdykhIAc5/Ay7pJPrMqHH+pJLFVLgALVh2wr3TZrBkhU1OMbdQg
         TUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176910; x=1776781710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4h/bSO/ywHvkpULu8zqbn2UT6WifoipO/Bcqnz4RFQ=;
        b=gG1hdoSyQ7R2K+IufBrU376Sh+5irUU625n9peVvQleHU73DHWXXwI70EpatQ2KX1w
         8F0e7ByD+Mt4taHTFkkh9Wd5cfY/o+YZFiPtlEFGyRh7fM55XOyQ3mPRp69qSZJl7KET
         I8EI0y/TBj4q4aIr2k9WfkwsmMh3C6pToJTgh5uevbuD2QAQyoK9maywZRv6A35KiASb
         NcbPf6kd7KeNH9fw3Cz2Yxem21EoWbtwgfUhQKShbEEAvnaYhydplbsAnJMtP5Iusgmg
         9hHPtfny+ypRM3/3ZNVjbWAEOaK//+2kygBF8SbwslDOBX1gI7dHE+69lT6k2IbuE8pZ
         a7/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9hnynGFIL58LDrJX57O7m158rAiJPpsO4fFJu08QIL2Hql14mdO3fvyQNU3HC1kCtPM7ddXNjfGnXMHvJq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcpe4vLx2TjAVy9NFrs/anBpTCqevmqNsF6XCMLuiWn4EdRn0F
	hk/FMAaFlPFi8kyMHXJjtPjlvIp2UduKyKP9PIRyk5i5/uchCbLeUUm/1ps2MVo+H2NTtyAYKVC
	udlY6FpgBk0L5wiEvcmcBIusCa1Voj0H6tCgCYLoKFyES2hqZmDASC6k93EKFCID39QH7
X-Gm-Gg: AeBDieu8p5sCw9MXLI70ErU2NSJn/QJzWYOs9wkbmiCVhaiVNNd4dGlYxWgn5BX/ffx
	MUpLw76y36SNAcsDSyggqFM5/vP4JHNUm9f8qpgm5cOuGci/ID8O5qljmHacHvKYI/xzFxpd06h
	S3sWTebcC79b1Z9Ipsoz53TNoC7dq/Mgjl/MHB/byoG0JE+lzPwyfyzw6xXp7dhlI5riPk3LDfP
	ZQpElDPTEHbQtzx+asr5G03pMSWQVm8dHTg0ZPwczMqST6SGkwz9LRfN5pjRAJOMNK+hIna4qDe
	LknJR18o/C//BAaK+gMkhue2U2WAN7Hv3dNku01WpT7UEC8/uGLCRfWh56CcRZNOh8cj48O479J
	P1J0/GkmMiwrW+J/luICcCevTgd73ksedoQRtnVrphcGARyBm92JrkOQtr8iNErzWNTyE1VFtPv
	EnQo8n87fjkM6o3Q==
X-Received: by 2002:a05:6102:31b4:b0:606:2f5:7b49 with SMTP id ada2fe7eead31-60a0169097fmr2647063137.7.1776176910069;
        Tue, 14 Apr 2026 07:28:30 -0700 (PDT)
X-Received: by 2002:a05:6102:31b4:b0:606:2f5:7b49 with SMTP id ada2fe7eead31-60a0169097fmr2647051137.7.1776176909545;
        Tue, 14 Apr 2026 07:28:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd76b8sm409854766b.20.2026.04.14.07.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:28:28 -0700 (PDT)
Message-ID: <eebff16b-2671-4c7f-9930-dc4b3fa903e1@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:28:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/msm/a6xx: Limit GXPD votes to recovery in A8x
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-6-4bb5583a5054@oss.qualcomm.com>
 <8f5ffecc-007e-4a8a-9c5e-9994e7841659@oss.qualcomm.com>
 <df708bd9-466a-4526-ba74-548896b45e74@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <df708bd9-466a-4526-ba74-548896b45e74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cTaYH-TB8BGpDQYK5RDlVSmWLeJc6HfZ
X-Proofpoint-GUID: cTaYH-TB8BGpDQYK5RDlVSmWLeJc6HfZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzNiBTYWx0ZWRfXxVZ2TgS8S3fo
 YpeuYlrD4Mf96ssL8k56kz9Mm+8n0zWheA969ta2MefOIlI/3w4K+NxGnJFD/+Z3gQT02Xv4exN
 NUDWp8xEiSiBw6u7Is+zsBru5ky3ZpVcjm8rhu3FYzeSgxZKc+zLLDLBC9fExcW8OE78AuOHTPu
 KalfEcQV3S2ZZC+KpfhvggUrKqSIu/eMAnmU5q5Myynf7f5C0zPxhyt9cQTtvIOYIEkANMWkrg5
 4RNbnde2kBXcYVgyBVFGq5s15L6fUvNVh9P+IKeNt/cV5MVhcBUGbxQ043PoFGvVmzYFmvpa4lb
 1WYjPkg4E4aN4as8OY0EtdsOsuIz14OHYt1XkaOWyFeqfyhou/DFsR2AWInLhwidMWToG+g/4Pd
 xEkGkY9DID+wPE624SJfFpkCJ6ypCmPirXNm/6b7tml3fS7BlCX9e0ePHFdEIImC6+hhJ60xIiK
 f2a/qgdzs9l25Z329YQ==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69de4f0e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NcxxfY7wZcMA6x9h_jEA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140136
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103147-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 861663FB5C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 9:16 PM, Akhil P Oommen wrote:
> On 4/7/2026 4:31 PM, Konrad Dybcio wrote:
>> On 4/7/26 11:30 AM, Taniya Das wrote:
>>> From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>
>>> In A8x GPUs, the GX GDSC is moved to a separate block called GXCLKCTL
>>> which is under the GX power domain. Due to the way the support for this
>>> block is implemented in its driver, pm_runtime votes result in a vote on
>>> GX/GMxC/MxC rails from the APPS RSC. This is against the Adreno
>>> architecture which require GMU to be the sole voter of these collapsible
>>> rails on behalf of GPU, except during the GPU/GMU recovery.
>>>
>>> To align with this architectural requirement and to realize the power
>>> benefits of the IFPC feature, remove the GXPD votes during gmu resume
>>> and suspend. And during the recovery sequence, enable/disable the GXPD
>>> along with the 'synced_poweroff' genpd hint to force collapse this GDSC.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>
>> Can we simply make this change unconditional on the gen, so as not to
>> maintain 2 separate code paths that try to achieve mostly the same thing?
> 
> We can skip the gdsc vote on A8x because the 'gdsc disable' callback is
> dummy when the synced_poweroff hint is not set. Otherwise, gdsc may get
> disabled during system resume while GMU assumes the ownership. Taniya
> touched upon this point in the cover letter:
> 
> """
> when GX GDSC is managed through the generic GenPD runtime PM
> framework, it can be unintentionally disabled by the OS during system
> resume (resume_noirq/complete phases) or runtime PM suspend paths.
> """

Right, but if we made the GDSC.disable() a dummy on all platforms this
could be done.

On a second thought though, this won't work for gmu_wrapper, so we'd
need two paths either way.

Konrad

