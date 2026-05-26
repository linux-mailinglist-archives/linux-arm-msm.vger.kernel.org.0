Return-Path: <linux-arm-msm+bounces-109913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIb3IQ/pFWqXegcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:40:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D75415DB761
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 551F33055D4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 18:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4C3423141;
	Tue, 26 May 2026 18:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6djBoeP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCdvO+ap"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EA140960B
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820552; cv=none; b=glO7UoLP+Z5ro6T7wabiIURolQVN2AugNgv8DhfqQIYQVAEAfTLNiqQGqx2NJFH4vt5v4RhyhLXHy7dHntvRlHZx9ndLA5RmDDd/G2wDv9DJnzbA6L89p2rDWbxhy6MJyEWF+6uoSEWrHvaI89mgy/msIey1bfQD5RnUeos5hYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820552; c=relaxed/simple;
	bh=VpvZ5PcXkUHH4om60ug8MAySWRt6JTqtJxB1ZQAos9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aSgaE+ksHQHA0DJhJDUGhDw/WHaiRnjjZly+O0pepCYbZaPsq76xbfyHbzr37i7liGxiSvaoOfOZmoZ7P9sGF4rIgfHkaz3xZ5eLzYW6A5PSZlz7/awItRoq3MfdQWH+qKcjgZ8McIO0JEnGHiM/3hRSZFkU3GTK9D7AZDqGNtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6djBoeP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCdvO+ap; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QHhG332261553
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OLtE6wjsTJE5pWtL33eU17MmRcP/aNLUd0BgNkI4/o0=; b=O6djBoeP6hZSQxkO
	XbPCIHgh1lY5Kxf33EH4eVE15Z5AAn5GKv07Adu4nJmOLzBvNJ+KoOjgt6S8yzVR
	EfsGjdK5NQwOQaTnX7U62PXSyYsi4p/WTS862oY/AX6If6QTZWR3bHH+Y5aLpGqB
	6Wjl50R+dd+MxG0maTVgUdNJQ4UZ/Jv2qfhcqhnvVV54phvk9+9VPdjjaewecvOZ
	igHVuSehRd5mCHMgsrEZ+/OqXYfDTfQOPrUQyioPFC9zMJADxCnBEe73iS3vZ2vF
	esgit93j2ligwRRfN+GL4S6Ma6vqz9hDuXd2jiAuBdrpsibu2yLBxiq8Vf/aV5IU
	dys7oA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edg5p86nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:35:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d191f2ccso111520781cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779820549; x=1780425349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OLtE6wjsTJE5pWtL33eU17MmRcP/aNLUd0BgNkI4/o0=;
        b=OCdvO+apt+SDYAt+EZX8wkOLpAZCgxcZPKbYHg4RILr/bWLEPfXWGR+yN3E3VBfR7f
         RaD3J0rWokxisLl2rU/VUrEbTXucy7d0vgkp38X2Cmf3HrkrLu3jXD9haPiO2ennJufi
         Hr2dZrBjbkuNdOFX/A1Afuqh9PzEPvS5cEXQ8UwkACj8j7wC+cliYNEtjlqQT60n0VzY
         2gHpHzOo24b6kO/CcvfDv39AwfvmZ5IfoRccydaCpWv+u7A1rnJGFm9+E4+bIk7+jZko
         7a2ICLXYGX3ZcVZ7NF1k8qHl9St88aCaeM0pT7E+uqEedeK3fZYZhzPIVMFVZ6tQ6dnu
         1+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779820549; x=1780425349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLtE6wjsTJE5pWtL33eU17MmRcP/aNLUd0BgNkI4/o0=;
        b=DfuhVZ/uMVxZkIdJo8nZp7dQImXJq47ewselcL2sL+jSXskn60MVeMsvZP4xEdj552
         H8ggpmdv8ERyynDvlW8rQsL9izwzHZVwh7e5ahutlAVkXieDQ8qhhosSMlSLBbgJ99af
         5y/RTGuE2aS6ZGwB1zMKintk0/5etObolsJKONBcbkccbOvPciOVdzIgZUtCmYLKplmG
         XO/pKZQXZxJ5zqcI8Q1Nx8ojEYNTU/YOJs1MDTiaMLt71p5cX5XZZ6rCIcAmxgchoiqM
         UZtPCeu4oJfdyRayNril2Az37ALHalhiIQEwy/zaix3A/PQCsV6uPJsfAVR7RxlizHhB
         ORYw==
X-Gm-Message-State: AOJu0Yx67ZbuW0ZDjEF+Gt1xkmj3xcp3g0bjvlrtvzE6P+X21tq9md3A
	jxcBEApw8sOJKdH0MwsbRQ6vuhXxZMKniyNQbn7McWIlNXQdwSwmpDSOEhECtNP0/PsNb025DEU
	69SPl5umHSCqDSYxJ2nao760dPxbxbDWokMXNwBhqNckZwS2HLFEe2AqTqlPa2tnmdabh
X-Gm-Gg: Acq92OE8jq7xx1v9EOrmL4/Q9KXYOg6wRxScdFHEwPS7jh6mCGAC7OgH2wSO7hj6p0g
	Flp1bFQ4nejpaUwsFyt1TeJZlUX2kGHrnsynzRlga1vPvahgxhAlHh4by6WAUx2LemdNHDO8BIi
	Zm9Ri2xzfJWa1naSfX9/Hpynpa9A1Qc3H3eB11QpVi6eCzL6n3otHY16jwHXnwQlPQRhuAv5uR7
	9YVhjMhtPwK1bsOiKkEOMF+Ap6GWEOWxL2Jrqajg6H/0uAytB0hFhLlGjwEePdHTFFbbpS00UMF
	fvVjhasebba3jWTSj4ttf07eKkGnrk44FoEUVf8TxOtIDUfxz8HJEyZTbfYDHjzxGjP/cq0iXRv
	qdw0PFST23XeOx7qwkFJcjrTbvNFU0vfJP93HCa0YNuUM+l/K4F8H8ulSut8YnVT0ScxUtemPRn
	SyMYTCfu2I
X-Received: by 2002:a05:622a:8d02:b0:50d:82db:773e with SMTP id d75a77b69052e-516d44095f0mr255087051cf.47.1779820549147;
        Tue, 26 May 2026 11:35:49 -0700 (PDT)
X-Received: by 2002:a05:622a:8d02:b0:50d:82db:773e with SMTP id d75a77b69052e-516d44095f0mr255086691cf.47.1779820548715;
        Tue, 26 May 2026 11:35:48 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454dedd9sm314782765e9.6.2026.05.26.11.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 11:35:47 -0700 (PDT)
Message-ID: <a2751a8d-5b65-49da-879c-a81003d321c1@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:35:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: qcom: tsens: Disable wakeup interrupt setup
 on automotive targets
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260526-tsens_interrupt_wake_control-v1-0-6adcd75555b9@oss.qualcomm.com>
 <20260526-tsens_interrupt_wake_control-v1-2-6adcd75555b9@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260526-tsens_interrupt_wake_control-v1-2-6adcd75555b9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 42GqL7L2oVyrgjutX9sHKNlTGx5rSClV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE2MiBTYWx0ZWRfX67L3r4o6Bcmw
 XI/9LyaHYrIe7v5VxTTQ0O/8bSs/tSwdvOTfMKZ7PzQkRbjfHKoNav6lCttHXW5fuLNg6oXO/hs
 b5w2oLyocCG98wETvCY83PS1KlM/8lAVSj16vO8nGCpNIMidGlhGw11wU+YIFvzEnc01iNIefyw
 HGivYBc9Ba5zaUJ1yEIApwfmGoEhnsdZchL7fwnk6+VX6XkZwTrXqhGHIHaMIJLk25ZIGc4Wc3L
 U7nZPnReOF2FnRYclgVc3ixXhOrZGbVJqjcUPD2vCH6t3VMg9CJ9n/EAwdqzrAFaNp0UDXorwaL
 8LELwlGMNdlG8oehb/SiIxUgqJgyE6wBqTqCoNlFIQsQHYtBS+g6HYnUa5nf0+YrFrx893zmdtZ
 /je95Dglvi1D79Jp/JI41qBbBOWHLkeTrdzLcWrXwHmYpcMRxxeoirwCyvOssZqwfcnk0q5WS7+
 feN7pxERdPDHy/2dZYQ==
X-Authority-Analysis: v=2.4 cv=I95Vgtgg c=1 sm=1 tr=0 ts=6a15e806 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=m5gfosTcClCIMLnN9JwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 42GqL7L2oVyrgjutX9sHKNlTGx5rSClV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260162
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-109913-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D75415DB761
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/26/26 12:18, Priyansh Jain wrote:
> Add a no_irq_wake flag to struct tsens_plat_data to allow platforms
> to control whether TSENS interrupts should be configured as wakeup
> sources.
> 
> Create a new data_automotive structure and add compatible strings for
> automotive TSENS variants (SA8775P, SA8255P) with wakeup interrupts
> disabled.
> 
> Automotive platforms can enter a low-power parking suspend state where the
> application processors and thermal mitigation paths are not active. In this
> state, waking the system due to TSENS threshold interrupts does not enable
> useful thermal action, but it does repeatedly break suspend residency and
> increase battery drain.
> 
> Allow these automotive variants to keep TSENS monitoring enabled during
> normal runtime while opting out of TSENS wakeup interrupts during suspend,
> so the system can remain in low power until ignition/resume.
> 
> Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
> ---

LGTM


