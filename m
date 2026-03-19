Return-Path: <linux-arm-msm+bounces-98737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEJyBD3nu2njpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:08:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 211252CAEE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B50C303594F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F4B3CE490;
	Thu, 19 Mar 2026 12:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3FLHizY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNYRCxI+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047033CCFB8
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921941; cv=none; b=hgQ0ochynUYr+vgyn+IqLEeF8Nd7SEto4EFgyZgTakU3kSOOZKtnOED4jK9RKMl8G0my2glIpoebrxylBl7KacFMe5ZUbkylu1J+kgnSWu5sWy8Xym/SmpZUvFGwvjz6lRdU8dhWx7sJAzja+09dtTqO58+lS6YMJ5UZBCe7pNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921941; c=relaxed/simple;
	bh=qEXaveTo7a0m3NulC/EbM+KjCe7EusDllzHIJ5/7lX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5tJYl9rP/Gno5SK4sUxq2PrbGP2u8tuxkD//YZLtuNbsUkAAdIkM9J1L7Mwe0dTAjFpe8nbrYcFcvdB8BXvQ18+/hWljrdKib5cufRd01JN8jwkXLpA1K3WUIlXvkj7mcS5ZnWdSRLZkzfFfHEC0M5lSSh2OM6TAYcpUovu2YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3FLHizY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNYRCxI+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J742hL2666169
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BxWauT55b+x7R7xDqRZOaWA/qamDOJrR/au8q+rJFaI=; b=m3FLHizYj0fDULGo
	m6MMv0llzB3xhr9NUKexQrYut85F7DNPSoHVTx+OjDPEOgdv2t+nX7QufSce6kQP
	HPeYORgWNtppvliCTJTzl8L+WI1xqxCLBDi2Puc6eD6e4lhOZCeHWdNyVtxFSluF
	vzrOQpx/ilnrUY/9aCWs3doezVMYY9wc4f1R70nSYacsMmLhpKXogGP2uB7zf8xe
	qAc7YXW1ZPiIRk5poAelRaW4fcms7Jl8NpnErHluhAk84zWZlr23vR/+jmWfBMnB
	MI/Rg2+LN8ckOvpv/t9jTEEg5U/MM0p8Ys3BRPuWc86aTOfUyFzWAHFTRG4/csva
	aRP+/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj54kfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:05:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd97debc51so76619385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773921938; x=1774526738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BxWauT55b+x7R7xDqRZOaWA/qamDOJrR/au8q+rJFaI=;
        b=KNYRCxI+SyuMjlQO6/ux1W/M0Po4och4J+X/c04JSaY10ORHTgl1Lb4pIhqrvTQ7nX
         2AnTpGKsajvDGno2xGTrJbU3ETB4i5Q12oBQxYBC+e7ku3l4snJgALUhKH74aPloQ0nj
         ME0cITYCxvzGeeJHbIkNMMBvr5C+zJiTmCHumiFcVfSlFO6sKyrNYQmr1oCr+WVWjLmo
         v3/11DnzDonv+TNbjs7qWLw4A8/Oj//dnpN6EaNBK+P9HPsfbWpSNvDVdlzka42wgIav
         Nco7vi5+H134+jT1BwMwnnzzNJYg4ycyT04TQCbyEnMJMckkpO4eskHwkgdroHhNq8RI
         b4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921938; x=1774526738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxWauT55b+x7R7xDqRZOaWA/qamDOJrR/au8q+rJFaI=;
        b=KVwiwflVWWC1+/bTsNdJMGPIzTxZIocficMeLRpEW7FcKcAJXN/fGGJQ8qPXuZEagQ
         8Etnqb4id/0Ux9OjA3XxlWSOyy9G/CMefdrXIw7KuQlwGNV3FtmdiigF5um3z02481+V
         xRCD+bazJ+W6hRW1z428mHbH/mFtLNJPMeZbnkwVZ0q9CEJCx9bjcJrdSf3oCdjTkbeI
         TghtgHqua7iLUZf57z0W82IW7wwnvn7X0Zwger3rppiiSlCokMIdFammeaNItRqOmWjZ
         2uW+emp5CJttOg6qmyeXlI/RlqBsxyVi+/8ttavgpeQi2OvrNO7d8aawUIjIzG11w+L6
         SiCw==
X-Forwarded-Encrypted: i=1; AJvYcCVIZ53kWq9AT3F7OlgVWXPQF4bEHgwg5EXkq24d3XDpMN+taDYKvnaPnLp5y6OrTDWGsSOcp/7oHSrc1fnz@vger.kernel.org
X-Gm-Message-State: AOJu0YwtR5K8gmrzB9JPSRm8M2lL8Yguj8yJK73qNJbgAzDDm2zGR9yL
	8eyZZdpTIZVBSn6WVy/nXFI3J0va01yEGV9JZNOjg/UVocm5lJW2YWtJ/om78qtdErL29xEg1eJ
	ZQY/CBi/yb8GswYb8NhXyCgvef/fOO1D2Ws49CQkRlOiVz7AJSHABQUgU0cautS/AhvVw
X-Gm-Gg: ATEYQzxYcVGE7QSGSl56w9EuawVHoIATtvI8uiVUr99ewQdZzD7JUBcvYFirmiyCozp
	gmshQwr9drfTBCRrlOrki5fguCFmOBtc3h5ro6m5ZhIdhYfadJQW3Q5n39YWYAIBZvs71nnoQvs
	RTq3Z0lupN4UZ4Fg1PLmxrr73worAnK4/ch6w5Hv6jHhvxBatCJS0mYnGCI6UsddYiUsNbtd2xQ
	NLiW2e2Z2BcjS6b6WaWyS+Yob+ygJWyurTzot7XH0/kq8Sc3R5AQ64HsCc4BLqrops/H4wy7e0/
	fNRopsNoY+YoNUm38Q2BAPUCn7GX5THB8eUpGhI3WOY6sBAz1ybf3cSEWTlovx0Q0fmuxCXjitu
	9LseSwbBGP3RD9Nogg66b0Uq6Q84HQAPHMyk1SlCNc4HqsCPelIzKmNK+cA2PIlU4NebOh+3ThA
	QPNk8=
X-Received: by 2002:a05:620a:171f:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8cfad27373fmr685238585a.3.1773921938297;
        Thu, 19 Mar 2026 05:05:38 -0700 (PDT)
X-Received: by 2002:a05:620a:171f:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8cfad27373fmr685231585a.3.1773921937682;
        Thu, 19 Mar 2026 05:05:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667aecbcc9fsm3724012a12.6.2026.03.19.05.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:05:36 -0700 (PDT)
Message-ID: <c9ea2f9c-8f50-448b-ab9c-cf4500722189@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 13:05:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/msm/dsi: rename MSM8998 DSI version from
 V2_2_0 to V2_0_0
To: Alexander Koskovich <akoskovich@pm.me>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <20260319-dsi-rgb101010-support-v3-1-85b99df2d090@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260319-dsi-rgb101010-support-v3-1-85b99df2d090@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA5NyBTYWx0ZWRfX6WNm88rg+tra
 3Us3XDG1079mXLhIrARJ2pROHRutlUpMYbAq7OZzXHh1zNdXNmt/mwN+qTxFTr+n7qHWU4xyEbw
 BV9Mt71pSnvYfDAblXp5FxjfRcIya9OxIYMN1TGvFGqHTbs6JU+tWRgh/q6WXl/bg6N/UqGkYjN
 bZ7kzCPJU/MDIV82bnBCWkYvqNlei4syUw4etE9blSIJISnqQwYf/W+v0G/BQfLSAeE8ow8ghl5
 A1Gqp8VfDC4iFpaVDLvH1wwoN18GI9B73dFJQ7jzyI5lCVjpUz8oy2Z0wPcVMCABcYyACKSO6QU
 919drcof49oc8wc2UEFjcVxASq/rjz+wNO4v4H3a9q5SYdaO1TNB6RMzvf8dZKBM6VvMJKVyPcB
 Rq99E+rK8ZEwkuaqdkhZPgJhb5iVLlN0yX5ioohVBhDScIsbDKGz2Mbnt5vMV4TD+J1A7zrACiU
 JajqR+hGIMgpJfHm7Fg==
X-Proofpoint-ORIG-GUID: AWQq7iJumJPnfOyvgtEIK4XaqE6eDFab
X-Proofpoint-GUID: AWQq7iJumJPnfOyvgtEIK4XaqE6eDFab
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bbe692 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LOFc8Sdq0yBhcMBbFKQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98737-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,pm.me:email];
	FREEMAIL_TO(0.00)[pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 211252CAEE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 12:57 PM, Alexander Koskovich wrote:
> The MSM8998 DSI controller is v2.0.0 as stated in commit 7b8c9e203039
> ("drm/msm/dsi: Add support for MSM8998 DSI controller"). The value was
> always correct just the name was wrong.
> 
> Rename and reorder to maintain version sorting.
> 
> Fixes: 7b8c9e203039 ("drm/msm/dsi: Add support for MSM8998 DSI controller")
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

