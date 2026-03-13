Return-Path: <linux-arm-msm+bounces-97407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIe0Nxjms2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:25:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C29B281659
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 022AE3004DE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8173935B64D;
	Fri, 13 Mar 2026 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mm30YTj3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EUtm9dT0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C57523182D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397525; cv=none; b=Tb6dvSHi3yvI0wLZ1+qhLXL54dtQz8xbkt0sVFaAIoifge0ly6kvToD36uK46Lp8mfvT33ySyLOSEx/LLmqWEP1h1aOnbQ+aN4yceDIZJI8i/MCTm1jGg32s//jEwkU5zFaKZNwkB3DK71wsEEuQVFEQ6vmz0O/UqFEvYEOlGhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397525; c=relaxed/simple;
	bh=tuomQvuswwi9Xj7UB8ecI/FotEsBZbZZi7eGq/rDAnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3lmUcGlStf+T+UITte71ILpLTwPwlUxRIn4fZG8y49NdTKQ52+1Q9RIK3921M/xEgZlzhYe8HZEhEKceJ8Ac9dmuEABj/9TgTPACVWXWZP0ZJn9fAM153w8efQv2Om/uGhe6j7VjYuriXTaJ0OlbLauzTPT1D2ksdVQuGWDp/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mm30YTj3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EUtm9dT0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5thaO3342929
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z6JX/cxPB5KnT9jggs10cXfq45mIFUC77SLavUgRftI=; b=mm30YTj3GccoLPq7
	rkh02/zUDF++7oBxNLolIwe5iF5L/0lczgO6PFbuFj3v1EMugRoWi/IcukU8ItOO
	ggdLOUgW1+iUQGttJSbuVOBQ/jXGubnX+RFz3eDR7Mkb9LPJsZ03YgRlEH0zv+O6
	Z9zCy+0nD7x3hLjpx3vt6zd//udoAO6zi9C1qUpAYllAZIQZ56HvYtJpUztbqb/s
	ysMQes5FpTYfmiWUMLCPInr8o5jldf06bE11TDWpZYl3YSADJSeoyr7kROsD0VIA
	d+BL95FHwijgbT3VSRPdyC5pTK8Hsu0Qr6NDa0CqrQPtT2LRiEuoHvQHsqbtaVNu
	N4aulg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w4cn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:25:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8e89d19bso109931785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397522; x=1774002322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6JX/cxPB5KnT9jggs10cXfq45mIFUC77SLavUgRftI=;
        b=EUtm9dT0ujfhmkbcJRcYWDtFFJTikD/Fhv1AKqfwczi4hdtRV0tSM4tYSPVKIJqNuY
         pjzzoSEX3/XC4HMybbe/uskVZP0UM8dNbAumH/JXty+4GRVhtN5DFk7kS3cZebe/9HFs
         E2CSFxmvV1KpqmFkjw4ZZug0d8/lSGo39q//fxovypGocsHKAGlkEVjtnai+kVzKnxuh
         eRn288ug+LnzB0lLO/DArw/fCYktS1MYw5KjaoKgXs8Bu1ggzFK/pkccz36qhZoGKsd6
         oZW4noOJlCdey4NfVA5de77jvI2lw+Ru8kDri5jmS1yo8CSJt75VCTO0bVGOYakbwvrD
         AwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397522; x=1774002322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z6JX/cxPB5KnT9jggs10cXfq45mIFUC77SLavUgRftI=;
        b=qDLA+bXGa2d+HWO0nLdM3uU//kvhFRe8uTWm+Ff/GAwTGXsYRL2/MmBcY3TjsGdla+
         o/AgRR5RcZVVOlB2yzbXYPSAxxC8JX0X8HMGujQuM5cfm2dPKiLZfJ4yFApN005o5Wam
         LgXmfw93cvGk/VLsmBc9hls1lBwRWXU1A/Yp6nclH1iXOFKc5FmGtO8RBGOzYNova2BX
         UmoUoU8A1tmddP2lGOKT+XhYe980EGTqhCjrRF17bihJiMW6PlnrPoqPdm/1DG40C4/v
         bnHhc7SWRFX7xMuvyyEfk9crh2/1bqrF2HTLGLv5AWR8weykjpiuy+DFgAkxzgC84Edm
         r8zw==
X-Gm-Message-State: AOJu0Yyvb4jUV4q/7By07FXNqBcwQ9ITTZ2WcesRmk75AfKkhHvAmxM+
	5SDKiXbjNZysV08/Jt6Lk6yvo9XXaVsyRd+2RsDx89thKX+SRfDYm7tFlewZxUMXduMRMl8mej6
	SpNk+nqZeXx/lAiTcb5B8B2cmDqvZNC7eXi5JVFCALoJavtgqQS1QfaTK7Pkl/jE5FWKP
X-Gm-Gg: ATEYQzyr/wxsz+qO1eEFslU44tTALYnsQQ6AkXp6xV2WekdqzKCw3c3wdzem9Svyjmj
	5xG1ffYQdxgVyCOEM8eMaG/P1WHLVfK11pUG5m6478bYusk0WxNqYkASW1XaKaVq7Y/gsdvxoQQ
	d+dhqn1m+umypBkTHJTTcqGvk4YNwfpkNA4eqwb6Kz7aSvJe7U39qovZw4L7haQ0zHIWzseCZGK
	3yULa7WvH8Or79BIBgIjLfGa5R3TmyaYFXMeaqpvHprTqwXLXnSglyHk7BINshXAuz3atPhjzC+
	4FaNaVUvS3lZewHkMiJXORYFeeIINW2D0QqeIYERt7AcPGAQe53DlkukXJRh/T5HOvLR2BaasiX
	MqEfGdBokWRjeDEFbUY/gZtfWdsaZ3u0sDft6RCzUUt734ikPMeLLBVC4SDKk7LXrWWiDKPnb7E
	YxzcQ=
X-Received: by 2002:a05:620a:4113:b0:8cd:9828:a7b4 with SMTP id af79cd13be357-8cdb5baac4amr264666785a.9.1773397522540;
        Fri, 13 Mar 2026 03:25:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4113:b0:8cd:9828:a7b4 with SMTP id af79cd13be357-8cdb5baac4amr264665285a.9.1773397522025;
        Fri, 13 Mar 2026 03:25:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d0918a7sm36067266b.63.2026.03.13.03.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:25:20 -0700 (PDT)
Message-ID: <7ed3af47-daaf-43b6-8d2f-dc6b528d2c00@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:25:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/27] drm/msm/dpu: invert the order of UBWC checks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
 <20260312-ubwc-rework-v3-19-b7e8f800176a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-19-b7e8f800176a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dgu1cH217obn7TkfnfGoQBqmZYw8PR3O
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3e613 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=C-aM3KecGx6sHzoCZVkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MSBTYWx0ZWRfX+PBiHqFWNSeV
 iYMq6/sz2e0+Q9zhZf51Rd+oJ2iHhebRq4t5Idps4uZ9LPpsbXeVpU0bEItM7ARtsr9mXFnHcNZ
 bENFrtCQIEF7zy+q94Se3oQaksxR0OSLkcvIv5h62kYJIEpSL9E07sp7bbNUbD/Gn7n2LkrCXxJ
 v7zJzRpT14wjgM+JjpJ8PCyxAh4DEot+rw53T2wz6g4a+Dn+qvtTs9rZeWMa15S39FJ0U9X8QJX
 hyYIDJng+xvRosX9WHlveejDO8/ROYOMwinM82KmY40ukLnFrj3qj5N2TGNzA+90pBfozb1jcgM
 HnRejxNh38qNJY9sk5kh03PjZPHlv7tOLsKNT4/Gs5wKsYouUAl4kwDgvEdvapo9qJOTw0wwMTQ
 xegFI7oCiKDQzAxURlBwxGFUSAib8tyW0vGefTTIAPbIXab1IAHX9+012xZgDrY80BS6k/OFzLt
 NXX2QrHM825WVaKuKPA==
X-Proofpoint-ORIG-GUID: dgu1cH217obn7TkfnfGoQBqmZYw8PR3O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97407-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C29B281659
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 2:29 PM, Dmitry Baryshkov wrote:
> Unlike other drivers, the DPU driver checks for exact UBWC version,
> making it hard to add minor versions if necessary. Invert the order of
> UBWC checks, letting the DPU driver handle new minors transparently.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  		} else {
>  			DRM_WARN_ONCE("Unsupported UBWC version %x\n", ctx->ubwc->ubwc_enc_version);

note this is existing behavior, but do we want to write to these
registers on platforms without UBWC, instead of returning early?

Konrad

