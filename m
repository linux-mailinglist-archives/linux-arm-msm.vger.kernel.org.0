Return-Path: <linux-arm-msm+bounces-71008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF76B3821D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 14:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A50963B7068
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 12:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E89302773;
	Wed, 27 Aug 2025 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lR8vuIvd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB30285061
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 12:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756297074; cv=none; b=IwmN/2/ElQifJGbrBKPr6qCRmT1qTRnBO9v/PI38jkX81MdvZLlYcJEPqtqD9zfhCLeDZlimJ1wva9vJurzaBHJBM1tvDXO1FMWteJxbo279nimd/D1jCpFJjYYkLEAceMhE4A64yF/8qiVnQtFA2ldQ5WxT5P6GUL6Zbikvpt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756297074; c=relaxed/simple;
	bh=xB63zHf8WWsvv2dV71RhZN1tcOaGZ44qUPczHpUw1A0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O8E8WU13ixCSotHF8VnZCDaNiMrUDA7dZ5VszlJl1jcgdjiSKWq5zZGmya1reN0SorouCXELtq6xsvzuIVPeZBcrAcceCwybl4FUKt1GxXgvw6FOA2FAZvPIOJqMp+uqeT1dGoZFWszTtXeXYgPOpO89ftqfcYnJqr4ZPO+cWAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lR8vuIvd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kI1J003138
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 12:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X8RSqvNCRDDgijasg0nbutFMmtBqyja8T4LtC7m2lA8=; b=lR8vuIvdVjrFz78j
	ZphFCEx85h7qmFpG4lXcHddG6+Uo/V6xt+7hh51h9rUmisheQ/iPYr0OHEDEYnsM
	Wt9dfgxex3zll6bUY1mXRrVSULlVA1pFczVpGvBsM9QtZ+j9WdlF1XvhxgvYMthp
	r2NY1ev16MXzsOTvfUjrWyfo+tnHs7TdEIINU4XQac0ygWRPBBci1JV7hjE7VGEM
	1W//Rw9/SIszUvctz6T6wpKOCoR6IpbB8wDNmFpxQEl/pQCeRogqEW2LXLimkmPS
	RLJvSgZPvb+6nYNgNhVO4HdLoUvX+u3wgGinYyuXSD+old4avxQkFK9T0vD0pIx1
	1OaPMA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x8cnbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 12:17:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24457f484d6so24704795ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 05:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756297070; x=1756901870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X8RSqvNCRDDgijasg0nbutFMmtBqyja8T4LtC7m2lA8=;
        b=E9xIfGZsM9syfz/TyymKGW5lDi9jEsBRl8nUcPfMXt6iw7C35VOlUfwavdQhGxd2A9
         TEwbnoWBqDwh/ci1/X/tlZXNN1xNc2VGCPgRjoPwwR1OR0EMhq0UI3ogDTk115fRAmxS
         cR6lyo6kDj9fl/aeS85WhqlyGqSEoVDTMvwNJvohfvs2JVFMnj9JgauOeQ5nSvq7GI5I
         Qb+05LdCf3CWyOsr4iGq9IJlXbxfwWBLEqgUUEkOcBxlS1dn6UJdyCcetReN9SEqPXEv
         LlGbTN2+2oW4NZYmBOOWixLyCgaKNUaqY1yMDRwpYJVQoT+HeinYi3eTi3U+KJaogYSf
         6mCw==
X-Forwarded-Encrypted: i=1; AJvYcCUbc0dKE/o7Hs0PaWERmumxs7Fn/RkZW4SIXbGL/Y9VUkXMWaxttSha0tP8vvC1XMufQgSNNqFmCGhR7CWQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yza/huGzdgyII9F8IMVjqseIjqql2rQV9lTJ7eCZNSTM/jAhbLd
	JoJmlgAerHMS4Omlt6ac18gczWckK2AR0ljq/YrARewNs4FWF+2w5TXTChL4/icGB9uFQQ4U1rj
	iaaNsdNhsV5lvLqhbBv+mtG77i3C3Zl4Z29QobgwRttqJZCZoSvL9HtyNrZ3j69XSqaPK
X-Gm-Gg: ASbGncskWoxwjB881szJAUffYkeyxtaDItPZjDl4KySQneOV4KsqseInRWBPHnEQg02
	KNbPpkRmIyoLmntk93Crc7NlZtNTTyN5QrFtc7iUyG+UEi2IaESlpSfslprEC6VcPVqfYf5Eemk
	+sRm59r1SJahLXrRCw4llktNYI9a3qitZxehBY3dluG/2wcE8QIxj+zCYXlTGAWmuokeq0ayI9V
	KPR0L+eAKc/k/YKT4yImmh8MyjBV5MKVLOWkoWs8ZrsHTFZqxXGGgqd9H7+ogYRRsnU8nNBm42Q
	TuNGcM8WQPO9LSKjhF+wsowlyhDVaMiBM4lOjZgnUJfaaxamzPmjNiq0M4qfDKroyVH2bUzYeeo
	Gz+56sjaaeozTuBltH/cd7D6Mrbt20A==
X-Received: by 2002:a17:902:fb8b:b0:248:bf0a:a127 with SMTP id d9443c01a7336-248bf0aa1bfmr1663325ad.1.1756297070522;
        Wed, 27 Aug 2025 05:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWwdfvw8f7MeJn13rr7IAskUSFh8jN+On8IyJ79l4iyWHwbCU7vdfd6HxX6olsZxDiEsjN2A==
X-Received: by 2002:a17:902:fb8b:b0:248:bf0a:a127 with SMTP id d9443c01a7336-248bf0aa1bfmr1663025ad.1.1756297069957;
        Wed, 27 Aug 2025 05:17:49 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd3285sm1910956a91.14.2025.08.27.05.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 05:17:49 -0700 (PDT)
Message-ID: <9bf7f51b-dcfb-4ff8-848e-dcf144936f2e@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 20:17:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-9-a43bd25ec39c@oss.qualcomm.com>
 <3pr7ninjxr4pgsz56dr6ojjmx27fzzszmtt6mx4r6qaqt25tnc@nrgx5qiqc7z4>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <3pr7ninjxr4pgsz56dr6ojjmx27fzzszmtt6mx4r6qaqt25tnc@nrgx5qiqc7z4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NZP0q2mVpqkD_Irt36f5ZcjCVSArXejn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfXy4gQQObBUl+o
 Qwfpzai7x/5RSSlRM+hQ7SnGkrkh4G5V26lotNxnrd9hUy6M4Gfqy9teZpTG6p4dgvTfPxYiJIk
 M3bNAhfl46C9eInb97NVOSkUo48E6CeipBJDLrh9RJxqerCmcNvhUmpf4CJM1/J1jttlH2Tw4i5
 QSTbtwVi8JNLz8M0fMZ7YIoAHMgqmL8Ys77as+P/HZQg6RkSbrDgS0+9qyGHq181UP2HswEl18X
 U4KGpKy1PcRAYq7SZ1UpiWQT0CUV17mAwQm5DOd3xDEcLhWlsPTVJzUmf44doKJqqR3Ea6rwpzj
 4mOyWYz6M4UB+yyffkcH2gFAi2BO9FuWzwWly6OqSpco6JYNoOJnttnmYrxnGe8jD1+XQ9Iet11
 aZa+0Ovo
X-Proofpoint-GUID: NZP0q2mVpqkD_Irt36f5ZcjCVSArXejn
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68aef76f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=eEvFyuGTnR1_S7nXHuIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044


On 8/20/2025 7:45 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:51PM +0800, Xiangxu Yin wrote:
>> Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
>> switchable PHYs.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 163 +++++++++++++++++++++++++++++++
>>  1 file changed, 163 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index 1508a4a5f57aff85318485b79528325f28a825a4..a1495a2029cf038bb65c36e42d0a4f633e544558 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -22,6 +22,8 @@
>>  #include <linux/slab.h>
>>  #include <linux/usb/typec.h>
>>  #include <linux/usb/typec_mux.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>> +#include <drm/bridge/aux-bridge.h>
> This one is not necessary yet


Ok, will remove unnecessary aux-bridge related part.


>>  
>>  #include "phy-qcom-qmp-common.h"
>>  
> [...]
>
>>  static const struct phy_ops qmp_usbc_usb_phy_ops = {
>>  	.init		= qmp_usbc_usb_enable,
>>  	.exit		= qmp_usbc_usb_disable,
>> @@ -1095,6 +1248,16 @@ static const struct phy_ops qmp_usbc_usb_phy_ops = {
>>  	.owner		= THIS_MODULE,
>>  };
>>  
>> +static const struct phy_ops qmp_usbc_dp_phy_ops = {
> Please try restructuring your patches so that there are no unused
> warnings in the middle of the series. You can split the next patch into
> 'parse' and 'enable' parts, then squash this patch into the 'enable'
> one.


You mean it's better to define and register new functions in the same patch 

where they're first used, to avoid unused warnings? And for things like parse_dt and phy_ops,

it's fine to split them into separate patches if each part is used right away?


>
>> +	.init		= qmp_usbc_dp_enable,
>> +	.exit		= qmp_usbc_dp_disable,
>> +	.configure	= qmp_usbc_dp_configure,
>> +	.calibrate	= qmp_usbc_dp_calibrate,
>> +	.power_on	= qmp_usbc_dp_power_on,
>> +	.power_off	= qmp_usbc_dp_power_off,
>> +	.owner		= THIS_MODULE,
>> +};
>> +
>>  static void qmp_usbc_enable_autonomous_mode(struct qmp_usbc *qmp)
>>  {
>>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>
>> -- 
>> 2.34.1
>>

