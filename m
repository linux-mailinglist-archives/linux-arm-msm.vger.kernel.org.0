Return-Path: <linux-arm-msm+bounces-103310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKTDEMD632ntbAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 22:53:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B10F0407C02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 22:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40DFA31467AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 20:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3542222D0;
	Wed, 15 Apr 2026 20:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ng5BTxKh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rsw83pdO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB460385506
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 20:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286292; cv=none; b=KWeHCh+N7mWGd5JDoNz7C+Kl7j9nExX62AzIbVhH6r/oFZnI1+C/8My/Q6rqTzvABtHHr2yxM3x2w+qc7hZtp5+B1aCfn9Lk0pFESf2KV787iLopqNuhPBOtdfQdO8r8YL/SXB9/ap1gvRFKyhH/CKjMfjweQNC03wZ7H0RyqBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286292; c=relaxed/simple;
	bh=1p8NSnHp2ZoIeGaQzlfVeCNqKATnjU5veK4IJvrBahE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmrp19WqPkp5Nu5OBHJILP9A0QMDDY8GbsrfnPKx0tOIqZrTg0qEiZiIRL+BlvV/ylHAyKEfi6OwZZd/DR2+azoY1fVXE1CKUgH8biL40SIjc4tLYWlD8XVb7pbZEY9co0WApAsAr3wz6AVlHxRjh6XXkS9mYK+LNldOXGDiubA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ng5BTxKh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rsw83pdO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FFLN8P4053105
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 20:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uQkGrBvY1Q6Phw3ZndsRhOHv20pp4HB0vkTp3Pi0WBs=; b=ng5BTxKh1LnpJvZF
	Dr4EpzBnHj0FodO3QYrpfICS57mZGnKyqpTHGC6imcUxDsLQ4hl9N1Pz9caxfUuJ
	D8sZqGPQvnLloWQjuEqpEBEtRP+alrOBWFMLOzGMO9+wY8MapPJ/f/ODwEE5ILTn
	m5kycPBXjlVj5+YO8VYK8jXHjcaP4Bkk0nQPqr3z2PP560Ymq1GrTlwwtIp1L+Mn
	BaidGiNlV1qj41Tpi/TOGrjk475/bUZVgu1U97u8kVGryeiGnkVggF+y+z6OQy4S
	X0cLpm5RESI3oz2TDib+P3BGgS9ZAEqKdVW/HcI0dTZHrvHUIbGsh6CGZLv3Wk3d
	tGtGVg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7s5tcdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 20:51:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354490889b6so10500223a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776286290; x=1776891090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uQkGrBvY1Q6Phw3ZndsRhOHv20pp4HB0vkTp3Pi0WBs=;
        b=Rsw83pdOJp5i8feJouvkYfuf87uGWOhUI6gVK5slheA+1JtOMEa/jAEh1SR91XqTKJ
         U6VvJk07n0a0gpg8R69BglX4ArFAnXplTmiGDLQZWUjy3DnVQ5EoE7j8EeLWlRrOd7S0
         Xo5fYHuqzV0WYbo0nvbsfmAVaEx3htLfPsnM9dz0EeIcHkoa3OfsEW+iApottVKuGNZ5
         sf3JVDJaQY35eFq7jD2HBHHHiWxAatxlDzMgRpE6VihOyDWRWp/F+zMNY2MloCKrN3+c
         nhs+UD9X8ew13/hLul/H0SHDyUBdxVGLiZgj10meWtjQaORwhdIqF8Uskc8BfGQVxlX+
         qBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286290; x=1776891090;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQkGrBvY1Q6Phw3ZndsRhOHv20pp4HB0vkTp3Pi0WBs=;
        b=abKoui2zdEHAApF8MzVUxG/UPJHIDYxkR+tMEzVaAxL7ZkVStXvHXaG+9kIRdLLmA3
         i8t3iY0ZlTR/8RC4Jz2EHtyzd2CiswnvBjMnP5t+YteStJxi5q2fVaQFd+fo9NRmBxxf
         P5bQAu2so7Pw8TFi49VuHs5JTYQZ66qHSv9cRxjuyONQOkmdUeRSVlQxK34CNi4kpG5L
         eCuylxC+GcCu9egaAGLkn7DqtMplyiFFoMHQzbM+5u7GF/YREMp+1HbYsJP8rx24xehm
         ViCH+JX4h4Sg3bak89cds2FtXRe5Cvi+XcQTNmvSiQCteMPFnvsV6EFo8nx54YWW+66H
         cKYA==
X-Forwarded-Encrypted: i=1; AFNElJ866YyCmE5oLqe9zAZ3PEC0B2pvmdOCLDN4zRUxhXOcgje04GZfXWn/7Iy561Ty/LE4aSuYzB4bavldR5UH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe8I5RVfsEkzqf4IBVGGUe8V+k8K9ro/XMEWlrNnBrJmbTrSeB
	4wdsJjNT99nK3nDKybL8jjS1+WXs8KHVG0UGslsQiEEya/F+ghecmiN3i993yjusQ9yTsKF18Hs
	tRPimetMiQBxw4x9hVNmkBCJ3RgLhr0hKAKV61v/h2doEpARLhqYFgXoSz+DfgtsEoCu9
X-Gm-Gg: AeBDievvofGBjmMNuCX1tPmsyCzfjoTCjis7EifUMXmIhubuzdmNtfXpR6rCm9Zwvt3
	3bOX5Yr214d7HhMaMdHb8XtnpbpJ5tkzHc3MlYcXM/T+9v8sRibezipFvQttrbuIlKHXol0+yqk
	oMojxY61KRVmXm3UNUp1n+cRUFs4Uoj4FqlWF820ChniC2cSbH/+JZXlHmeha1nGlNw+1XaNX+H
	u02lM+sUuRmGj26XMgqOAHrtq6oGFH0lQ/aDRCI6Bylf2iqL0zObikfoc2oIAFoH+VcnVSkHC6+
	G0JgfGDsCiG3V6RFSe/U0p/YaVRkgNHKRpEObCi0MAOlMBF6TDFr40p5jrsppOZ2WUrUb9pD8Cp
	hW3mpF8+tvP5MAhYDZb/tDXJRW60nNB/HfJ81mJit0gH2ORiILEhh+CE=
X-Received: by 2002:a05:6a20:a111:b0:398:89b6:1b41 with SMTP id adf61e73a8af0-39fe3f5a009mr26877737637.32.1776286290207;
        Wed, 15 Apr 2026 13:51:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:a111:b0:398:89b6:1b41 with SMTP id adf61e73a8af0-39fe3f5a009mr26877711637.32.1776286289726;
        Wed, 15 Apr 2026 13:51:29 -0700 (PDT)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79581a3015sm2487185a12.16.2026.04.15.13.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 13:51:28 -0700 (PDT)
Message-ID: <a7cbd382-49ec-4b3c-b8f9-b47646d6b0aa@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:21:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/msm/a6xx: Limit GXPD votes to recovery in A8x
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
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
 <eebff16b-2671-4c7f-9930-dc4b3fa903e1@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <eebff16b-2671-4c7f-9930-dc4b3fa903e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A7Zc+aWG c=1 sm=1 tr=0 ts=69dffa52 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tjBgj1cQHot02RtnpFkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: cHmDhZxl7QNwxX90yC_ZLRzqAxOJkyfz
X-Proofpoint-GUID: cHmDhZxl7QNwxX90yC_ZLRzqAxOJkyfz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDE5NSBTYWx0ZWRfX37EaoqX4al4g
 POpzxLagLZviIvdOxx46j1TN3MsdP0svCUa4smOHZ0P5raPpf6F34Qfy1e7O1XOjmDSDR8uqBlj
 IxVgIOvY10cTymdhThMYhD5vr4biUAMpPeTWQC/KAeEv0il9HThrC8B05CXMGVPs8MLskLVkTEs
 pe3UWKBM1UxMQ789NEZfr/MG/bKig9XFXNSp5nPiwX8H1vNjgllHBTvhGv4btpzXX4EtM42eOKo
 wFc3hJQlS2LSgyij6jmZwl3gI1yYejDYmyClsqtJK7LdOBbzskFAU+/n63jK2OqDijq3PPG9OHo
 iLEeeJP/7jbMUK5I+ZdXRPBR/eMThBRKooxPAIY32w41ZuTBtBK5+FMbLMYyUYMzl81hrOm4P31
 p8DBMorkX/sfpPci92i5JwEBZ7Itwob7p1SApJB73ZK6FDFxM+I8O4WGLN6CDJhV4hGQMUNYqpd
 FPqVyLdBeg/YloPodiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150195
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103310-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B10F0407C02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/2026 7:58 PM, Konrad Dybcio wrote:
> On 4/7/26 9:16 PM, Akhil P Oommen wrote:
>> On 4/7/2026 4:31 PM, Konrad Dybcio wrote:
>>> On 4/7/26 11:30 AM, Taniya Das wrote:
>>>> From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>
>>>> In A8x GPUs, the GX GDSC is moved to a separate block called GXCLKCTL
>>>> which is under the GX power domain. Due to the way the support for this
>>>> block is implemented in its driver, pm_runtime votes result in a vote on
>>>> GX/GMxC/MxC rails from the APPS RSC. This is against the Adreno
>>>> architecture which require GMU to be the sole voter of these collapsible
>>>> rails on behalf of GPU, except during the GPU/GMU recovery.
>>>>
>>>> To align with this architectural requirement and to realize the power
>>>> benefits of the IFPC feature, remove the GXPD votes during gmu resume
>>>> and suspend. And during the recovery sequence, enable/disable the GXPD
>>>> along with the 'synced_poweroff' genpd hint to force collapse this GDSC.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>
>>> Can we simply make this change unconditional on the gen, so as not to
>>> maintain 2 separate code paths that try to achieve mostly the same thing?
>>
>> We can skip the gdsc vote on A8x because the 'gdsc disable' callback is
>> dummy when the synced_poweroff hint is not set. Otherwise, gdsc may get
>> disabled during system resume while GMU assumes the ownership. Taniya
>> touched upon this point in the cover letter:
>>
>> """
>> when GX GDSC is managed through the generic GenPD runtime PM
>> framework, it can be unintentionally disabled by the OS during system
>> resume (resume_noirq/complete phases) or runtime PM suspend paths.
>> """
> 
> Right, but if we made the GDSC.disable() a dummy on all platforms this
> could be done.
> 
> On a second thought though, this won't work for gmu_wrapper, so we'd
> need two paths either way.

gmu_wrapper uses a different code path for pm_resume/suspend anyway. So,
that is not a problem.

Perhaps, we can explore this separately as it would impact a lot of
chipsets. I would like the get this series merged ASAP to unblock A8x
support.

-Akhil.

> 
> Konrad


