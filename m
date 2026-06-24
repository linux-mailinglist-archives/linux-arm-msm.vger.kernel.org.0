Return-Path: <linux-arm-msm+bounces-114273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zvfGEidMO2r7VggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 05:16:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB5D6BB0EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 05:16:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="UiAd/LJb";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZX2Aqmyv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114273-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114273-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CD03300E73F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 03:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41672306486;
	Wed, 24 Jun 2026 03:16:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8909211A09
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 03:16:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782271012; cv=none; b=tzQ34wVtlCDvhDJ/wjny88WKoVoWhYHPNUXm0BKXZsGdKXsTzvOuAwQCfPfhW9F9OuUtuBhoUvCSlykmsxQ22jAeMr7x4mcUycQpyFwDcWDQQx8K9n1AOh2G++98NVsfugZc4NSXcLayusINAS2lLOtyF8eUdKMWv8px7wy1enM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782271012; c=relaxed/simple;
	bh=aMnZm5BhzVrfy2T1LIxkWHBEOPP7FGoWUI6748NfrHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCVMMNaQ6/anNPiebYkLZk4aS+qYENNt+/Tu6CFD9t6oo/D1sCL5hwpVbiwMqoD+brd6FLY7B86NspUqwsZ7a2XgjbB8f2ghDQATqhadAUBpRqI75mEbbUt2BkjUfaVEaV+OYc5TRAj2mQD2CEtOgQO/oJxcVof5EyjubmNAYbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UiAd/LJb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZX2Aqmyv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O1T0rM1308351
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 03:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tqp3CJDavdcu8AEXNYxlJgSiG4nSfjn/QhDqR8opbE=; b=UiAd/LJbXcjiGy/L
	fK+aWKXk5IXz6hp8aadcfYlZcHhOfHyj6RanGteyzyZFOWv32vKzL3l6lTQFiUhH
	o8CYfgZXDT48fXWR8Zy4PrYOYKneaO1rhJanbjpXSCexgLHOVSTNkTd0we8w8gnb
	MXgsJDHHi37GNCvxWalRVZD7w3s+8q7Dth4mKb++Dt/P+odV0BHRHD38MSg9KU4w
	2C1NLuw88Rhm7Y6Wuc5tSkh0WFxnH5p2oRZJGlwBvm8+UlrCraPbvxNmZCrmSEHI
	tcC+YJzwsbWyAtjjAyvJvGAvLqBmC3gam3pRVdWy5786D6MLhMhQ3SgwFex40lXg
	bm0abw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bf89x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 03:16:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845a29d8c1eso500354b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 20:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782271010; x=1782875810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+tqp3CJDavdcu8AEXNYxlJgSiG4nSfjn/QhDqR8opbE=;
        b=ZX2AqmyvBZKAFvzQZ/ZT9kpXzZKCBfdNGYBZD9fgLFWKXmw2qJ/S/QrTnzmr1oJKL8
         YPECeND9twUQOSVl4dSwXwfAhdP2stzcwSJv7/ymWlEKpN2htA3FJIMkqm3FiYJ9xs4B
         ULD59+Q43AleaxQYzbiyl8KrzUCpuRMoTXzqpRzp16rw1vMF5Hcret3avjFwTxWBqMzw
         BsdzBVgFvP80JtrKo3rcZ1U/atqM2MKBQ85zI6ddyslP7/nvXS1WSTrl7QKe7sNuTYej
         TQvnB848xI1Xt9bFS5nM6oV2NZ5NAI169N/OdxOn9oa3JjaA1pRYbCvcKLsiLJk4jNKM
         zMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782271010; x=1782875810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tqp3CJDavdcu8AEXNYxlJgSiG4nSfjn/QhDqR8opbE=;
        b=icoycmRIAp5NNrwrwuEwOFgX6mHmzzjhkIJ7hNJRRsbtg4muxO8/3KUTX9hYTMTTJx
         hboByM2LogFM49IYmCTJQMJ5XrbaMkCt/4C/MEpnO1uzYXH/it4AKK6aKqA+A1PTo9SW
         ZIdOc+pzLT7oQwzu8Raj+CvCDrrCUFtCovJDNUwQ6DXkbMeYwlihQocG6LOzW39wsrpM
         v32gXvv02xiR8x5fgCwZ4mpR6WOHTUHy4TqVlaKL2LKxPcbh1S+FCivfXWV07Q71Tw+J
         RHMSkjC1jptu9uWX4B2pzKdfWhpVnDrQk4FI9eDUwoA8Hmk9ghTg4OJJN4vfrX2V0UuR
         5hiQ==
X-Gm-Message-State: AOJu0Yy7V1WeHjZPfjMDLx6ATE19dnib0DhxIq7ZlYipbyIUBmYh/ZSR
	bYnWHu9/dmvhVdaSZrSX/aAkXQiDH7WgUtUmlYHSNCOfZdrBUNNlsvOJGUCPoBUHHzcOVk1XZcO
	WVHygflxlK6Xk0BmgLx+YiAUcx5qrlm0o8sy/GYleH12J2wjv+dGbiaGUTov5Cc2RpBYz
X-Gm-Gg: AfdE7clov39DvfI91ajjKLM1u8lHNY+CulZARtVx89q04VwTJ1BwCplTk0WvtHqbL7O
	a6d3e9iGf0TPgvrFJ17LZnyxYGwtYwgA924eCz1Tk966AjTz2eD6Suj4/342GpNUL7gGk6sYa9b
	BTOr6IK7JgTDDoYFrMzE8LqDAvJSITNN8cBq2HFICUpwRYIH4mX6hRQKML4DVc0FSRInIPosObd
	RQD67lyL6OOGKc1M5TCcWT1QXe7ilzBRmSmVJyQ/MGrFicsg7+jJFdl/5gOQb8eROwYFddO0mNN
	cDerB8pgyIDLWA6OQTseYbeypymRwXrRyWnbQQM18KnWZJ8TD49pPGfL/VDdwRgqtWG9jKBhS4n
	gUSSi+mkSK/eMyWIOFJVI/79+YPjPuCiIjB5iCU0fNWl3CWEQMLk6R1Jz2zvUJ3DtdJaBOX9E1L
	MwSUvSaCc=
X-Received: by 2002:a05:6a00:1ca0:b0:845:259f:8925 with SMTP id d2e1a72fcca58-845a26dbae0mr2428069b3a.6.1782271009552;
        Tue, 23 Jun 2026 20:16:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ca0:b0:845:259f:8925 with SMTP id d2e1a72fcca58-845a26dbae0mr2428039b3a.6.1782271009116;
        Tue, 23 Jun 2026 20:16:49 -0700 (PDT)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc82dsm675711b3a.7.2026.06.23.20.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 20:16:48 -0700 (PDT)
Message-ID: <b05487fa-e282-4236-8f10-016e7ee4dd87@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 11:16:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] drm/msm/dp: Prerequisite cleanup for upcoming
 MST support
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3b4c22 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vQr1noI8oyt6EgD3lKgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Ad8DeUH-S2_m8e6WXrQhb6QHGI7gKm-U
X-Proofpoint-ORIG-GUID: Ad8DeUH-S2_m8e6WXrQhb6QHGI7gKm-U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDAyNCBTYWx0ZWRfXzbKiZAPIbyoo
 YCYXntVxzA7OYmdMfek1G4hw9k+5AzqkjyEgTufVskJYV+OyUo8LrWnXngZw4oQzjtJFqGYo4tt
 TxiCynj4k0qqXVUzphgVmOrDno5NzyQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDAyNCBTYWx0ZWRfX4IuuyT53RXBA
 fWANqtzOz0VdCbSjTRAssAJaXZZ749PxJFcOAC/fK4ZKGf0YNzbeAilGL0mlOgt2HTzXHHQQTDF
 OcrhU8xSfqvGzB3LVmFlceh6V+e/KEUAaqJbXXCi+n5EqoeGiaJ4JTl1pNCC1T/ECnfeAI0R94S
 Y9gu4ORjV+GymQ6lttg/laA3nQGjmmAJ1NCzkdkRMLo+4Uo3iBvZpNKCmwwURBFGHfe28lIvZ/w
 M0W+lkDKS/yrY+64e5i7S1Zp8UdX+vjaV3BlNT6KHkut+EeMHYXF+kDCaiL9QDlVrljpw1cQmdR
 tg/9TxEeYTDUcB0b1ONU6Ze7aG3tgLc7A+O0zpbemptNP2T6e9Rm57tQwYGllqANNeg+42SDMCx
 /bJYZwytb1a4MEC8HnswRkcBHp5GUHKgWvxVGhr6lHrtfQrPgtktC5dp02boWSbdW6VVUjn/Jfk
 Qd6V0AdzGFg7yP7nV1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_01,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240024
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114273-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9EB5D6BB0EE



On 6/9/2026 5:46 PM, Yongxing Mou wrote:
> This series is the SST-only prerequisite portion of the MSM DP MST
> work. It refactors the existing DP code paths so that MST can
> plug in cleanly in a follow-up series, without bundling the cleanup
> with MST functionality in the same submission.
> 
> SST behaviour is preserved end-to-end; no new functionality is added
> here. The intent is to land these refactors first to keep the
> follow-up MST series focused, smaller, and easier to review.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
> Changes in v7:
> - patch 7: Use WARN_ON_ONCE() when pixel clock is already on. [Konrad]
> - Link to v6: https://lore.kernel.org/r/20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com
> 
> Changes in v6:
> - patch 4: fixed the RMW comments. [Dmitry]
> - patch 10: do not rename the existing struct. [Dmitry]
> - Link to v5: https://lore.kernel.org/r/20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com
> 
> Changes in v5:
> - Split out from v4: only the SST prerequisite cleanup (patches 1-15)
>    is sent here; the MST implementation will follow on top.
> - Rebased onto linux-next-20260527; adapted bridge callbacks to the
>    new drm_atomic_commit* API.
> - patch 3: added Suggested-by: Dmitry Baryshkov.
> - patch 4: fixed "splite" typo, reworded body, added RMW comment
>    covering both SST and MST paths. [Dmitry]
> - patch 10: drop cached panel from msm_dp_ctrl_private; pass panel
>    explicitly to all stream-related dp_ctrl APIs. [Dmitry]
> - patch 13/14: introduce bridge wrappers and atomic_prepare with
>    drm_atomic_commit* from the start to preserve bisectability.
> - patch 15: fixed pass panel inside the func. [Dmitry]
> - Link to v4: https://lore.kernel.org/all/20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com/
> 
> ---
> Abhinav Kumar (6):
>        drm/msm/dp: break up dp_display_enable into two parts
>        drm/msm/dp: re-arrange dp_display_disable() into functional parts
>        drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
>        drm/msm/dp: split dp_ctrl_off() into stream and link parts
>        drm/msm/dp: make bridge helpers use dp_display to allow re-use
>        drm/msm/dp: separate dp_display_prepare() into its own API
> 
> Yongxing Mou (9):
>        drm/msm/dp: remove cached drm_edid from panel
>        drm/msm/dp: drop deprecated .mode_set() and use .atomic_enable
>        drm/msm/dp: move mode setup into msm_dp_panel_init_panel_info()
>        drm/msm/dp: split msm_dp_ctrl_config_ctrl() into link parts and stream parts
>        drm/msm/dp: extract MISC1_MISC0 configuration into a separate function
>        drm/msm/dp: split link setup from source params
>        drm/msm/dp: move the pixel clock control to its own API
>        drm/msm/dp: simplify link and clock disable sequence
>        drm/msm/dp: pass panel to display enable/disable helpers
> 
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 382 ++++++++++++++++++++----------------
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  30 ++-
>   drivers/gpu/drm/msm/dp/dp_display.c | 273 +++++++++++++-------------
>   drivers/gpu/drm/msm/dp/dp_display.h |   8 +
>   drivers/gpu/drm/msm/dp/dp_drm.c     |  43 +++-
>   drivers/gpu/drm/msm/dp/dp_drm.h     |  12 --
>   drivers/gpu/drm/msm/dp/dp_panel.c   |  75 ++-----
>   drivers/gpu/drm/msm/dp/dp_panel.h   |  17 +-
>   8 files changed, 451 insertions(+), 389 deletions(-)
> ---
> base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
> change-id: 20260528-dp_mstclean-f094cea8ca24
> 
> Best regards,
Hi Dmitry, will this series be merged next cycle?

