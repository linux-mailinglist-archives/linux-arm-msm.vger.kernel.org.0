Return-Path: <linux-arm-msm+bounces-78761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A98C0849F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 01:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D7CF3A809A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 23:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFAD2F998D;
	Fri, 24 Oct 2025 23:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwB8HaNO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC582BE03E
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 23:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761348085; cv=none; b=HKrUvWTVBduxpkEDMuRLIAi/qcOTJtJJbwksobTLbQQmqPOmq35SOfRuHa4O/h8Lq0Ul8blPBKnXAR1LB0tqp8IQvZaju8X0TKE9s8ME1UGXkPWfv7UiyfnEXfE2loFmtAIU2xe8GfjfzB7NtsJb3HvxsCDka3/uXQ1rWRTs7PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761348085; c=relaxed/simple;
	bh=WPe1OJUuDjducWe9ylfF52ogCka0cD1c4+NgVVycIBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKig2AjWg01BeLr90nla4TPt8Qim5hsyUbOt45yVqO870EWdvuewLpG9MP/9HSStM5bCsTzgHgfiwr7cQQUKBizaHfG9mrdEcy5ns0BT7li5xu5MAAqpAhQdePEsXdMaGC6xc2FKCJ3iILgYvW0DoULiX2gHE8FCZAOmrc+aXeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwB8HaNO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9F4N018176
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 23:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uDqcLOKZ2Kzw7eWCO1bcjqMp8O6sHD9pWo33HyB0QU8=; b=NwB8HaNOTTlfQ/Ub
	3HIlqL9ywZrR4E+5Ju8b1XBN6mt4t5XLLodojpERXk16wviOb+dy3jOGTCWhVggN
	TqjguWbZTHYrGsogq2HdmqjcI7jyEtici1eeAPNIBfZZRgKdESAy38rJBVg0X2HV
	+vl3gl1quc0Y5JnCrR8nV6sa1KvYHLshlwpkyKgY/hq+VSuMhGaXRVTA9mJ1Ntas
	zH5X2XIGnWVU5Rc1MjsU3LGX7jODnJfgZxzeakaUq0aef/QdN37UAllJ95VHn5KI
	DRcMnPB9hsJFh8UFo/OsG492k6BM9pEE9ejy0dYROkt2eppyNAf9TbVDWRh2Z/ID
	rfhv8g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsk37a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 23:21:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce15aaa99so2008868a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 16:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761348082; x=1761952882;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uDqcLOKZ2Kzw7eWCO1bcjqMp8O6sHD9pWo33HyB0QU8=;
        b=XgtlyLvT5vp3y/1NEF1S9f5QDFWY5nzpWUvETSD8jQfldtDALnnKxPfykILYTwr3xx
         ejY+m7oZ8+907ZFbSbgLPqr0V9CxDMKyeV2XqyAaKni5PKYrb641jKB0em7jbcd1S/2R
         3EsaJEdh0HXGCOajctlFQP6cQQTKEfhSuqn6d8EhqutJ0YnqCbloIWUS7tvH92dTmddQ
         vgQzyDA6SWnjYkCQwBdsfzEEXoHZ6ZW68WCOH4nEY6avfgjQMoOmjxExjU6W0fkta5ib
         yNGWTSfSHz6ar1hRi13swWH5qmWPNXInFdMT6/kBQ61UefmCY509/IcQ0GIq+QyVzhnc
         JE0A==
X-Forwarded-Encrypted: i=1; AJvYcCUnQT1KL6YPnW7gdOwghgNwPP/mTWevbV/4hkmyhEmTK21z9tKan6gT3oZjmoyCQqKjFlawKy3c987JI/Y7@vger.kernel.org
X-Gm-Message-State: AOJu0YxGGRM3wVDl1hb5ZeWIozMcnXJQ10mp2MOnrgh+KACEiIAXcJ9R
	1y//o7Q6/Q6T70gcO6QxgB6rsgRwMu2+nXMcnyRLCNuoWOFVkOvEeKxP9Eoa6cV6HHrTlmEI9Ut
	6IXcMphwk9ZuJ7t+q3E2dtvnWav22o2raMPgSI7mOwOo+k1fg91BvpcSumWFbwV5evQjq
X-Gm-Gg: ASbGncsZUOyb039NJJ5ka+1cWiH4yOksZ6uziUJbdKVvlcFl3OpH4UqimdH4FTFUGjb
	qfrleLxBUt2/b1D2sJfGdoKbENS+h5qiZBpeixNd9eIimlr5ilhTohGqVfTobSqKww35TZntWna
	Td01oY5WnXH/nm6hTW9Wf1rL3puNHHyJMIq/W3v7nQaJxssoUwIixCtWwrq9UXDHSflOnqGa33s
	UHmxxzl7iYNClVQvCDm6XktWzUzV33UXys2kuIUbAahkhAZareMjfKY5iGfOb4d0t8m8aLrVy/J
	SplOgwv1F990ZdUzzdg+aYeihE8ROZnfkeLZdBHF5RkUtJpONe1+GZ8mi4DjXi7+J470LaadBfK
	/nXvcYXixWIxsjHZK1TALjo2nFqvtPxY00UN7riu9m7O5iYpABB/jsmuPAOMDfA==
X-Received: by 2002:a17:903:b90:b0:290:bd15:24a8 with SMTP id d9443c01a7336-290c9c89fa6mr368110405ad.11.1761348081890;
        Fri, 24 Oct 2025 16:21:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk8f3rGYSNCtqBevn0HZr4TBUjj09QsiyHXYq9V5eCQ15z12u8l7vHIA8AOCi0gWJS7Ps+vw==
X-Received: by 2002:a17:903:b90:b0:290:bd15:24a8 with SMTP id d9443c01a7336-290c9c89fa6mr368110165ad.11.1761348081421;
        Fri, 24 Oct 2025 16:21:21 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3465sm3952055ad.1.2025.10.24.16.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 16:21:21 -0700 (PDT)
Message-ID: <0389cc8b-299d-4768-81aa-41fadb9f0a82@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 16:21:19 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Add support for PM callbacks
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251024162916.801196-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251024162916.801196-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX4rjC7vLnQ1gA
 0+cM57Gsy6m4atvGh1IP+aoI2Dk/ITEKKN8bMLZv5JSern6H0xCAwFrJEptbaCvBH1M8R9WeW8G
 lh9Krol/gfmDjvRN0HiqoanyLhFT/wIpXA/iuEQE8cffjsW5EzcFi0Y3D3RMhW11ilL8XZHZ6i+
 zCixUmG4VmuNmI9f8DYGaVSRm3BZjZL2LugGA+uEcx+pVIU+n8cfqkkjgVo/9k22e1rgy36gJa/
 eBqbDiAd+RZeKjlv+JVZFC01zkd1udydKhTc8G4H9ZOf5vZ/1txLW3FByyoVzXrTf0I+tAq6jw4
 PVlXstoQwhNphlwT6JKy+1OjMgL6NTIjrQ4MiWwW7AWh0xje3o32okhgzq5K6ibnFNe+cU6jvL7
 qbegYU6W4bIJTeAyNmyXBolDW3NjZQ==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68fc09f2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bwFRUYIpjFZDIrCVu9QA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Dsg2D1Fhd-KihSoCNdUp2x7pLA8vBd6n
X-Proofpoint-ORIG-GUID: Dsg2D1Fhd-KihSoCNdUp2x7pLA8vBd6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

On 10/24/2025 9:29 AM, Youssef Samir wrote:
> Add initial support for suspend and hibernation PM callbacks to QAIC.
> 
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
> Changes in v2:
> - Guard the pm callbacks with CONFIG_PM_SLEEP to fix openrisc build error
> - Add __maybe_unused to helper functions used only in PM callbacks currently
> - Link to v1: https://lore.kernel.org/all/20251022204005.3888195-1-youssef.abdulrahman@oss.qualcomm.com


Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

