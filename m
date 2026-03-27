Return-Path: <linux-arm-msm+bounces-100249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI86JkFXxmmMIwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:09:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ED934233B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 684BF305FD89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C40540DFB0;
	Fri, 27 Mar 2026 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FT/wylab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTvbSHuM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0E032C942
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606080; cv=none; b=gTOTvKnBAXfAXxw9M4F7LflFq2q0ncIk8brrCDzlPcBgv1FEmHoVwrZ2CLFzU5xYWNqQ6RmF/kciVm6gFA5ekiiVXKsEsKDz2X5AX4LUKGlI6pohxLUk4B+4WNKf4X1V4tSXGM4kEvkcnSPD6ok6OfvF0qO5FLxknboYZUL74GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606080; c=relaxed/simple;
	bh=iVgeUzEqcx8u8jnODTXP9sg/NrPV/2Ufb3DUYbZ4Cbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HbGxSEPTDJBinz1/j4Iy9HZ+V/tp7jzXgUclQOpUfcAAZkV5vDCYA6pxGAoVgP67eyS4QF8mGkfrO4VZxRtJ7GyS4/fruZi4Uly7+nT0uep/VVQmewrO9Bn8oZkPtg7bhllPsCXi9YRL/+Q/UnnVIw6DBXWl/GDFturLv3+5l3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FT/wylab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTvbSHuM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vtLg3716302
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kscwhOT5CpzRfWGi0pFjmddQgBIrWxPFAh5RohhKchw=; b=FT/wylabdZGE7SJ5
	DEKjXFzk0VMzGmWsZe6QSEsvmbYbLztgl4fVm0PAv9uPxi8ayh7TQM1YM0aQzgUc
	pxUcQq1cYHAOR4CaovwX8VF4M52+kMYYIOTdG1wTNh2Jzpb/W9PMvKSlacM1rxct
	VI+aLko61YqkQEiOsEKmEXJoPXB/5lXVtjNMS/t88Ixd3PBlQycuTU74p6AMowWr
	ty08U5keaKn8qaJWwZbZj7z+sjKYdWY3mJ2L+TDAKusm/Zvm4XR0rt+9fp5NlgDl
	5SODxKs0c4rmj1YWzDgmYq5gkP47n/++kC7pbTocpV6RwheScGhrarUgkfhxCpTL
	R3NhGA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6j973-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:07:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b32feb719so5340751cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606078; x=1775210878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kscwhOT5CpzRfWGi0pFjmddQgBIrWxPFAh5RohhKchw=;
        b=eTvbSHuMRnILhssX31kdmwRLr1wXXGddEsizzoh5Z1iNVICnvryDfCnu/jZ7eE2pD7
         HVl+AfvO/OUmTRY1fbp9ndmiy4iynl16Ac1JQ8V/dhKsoTAoN9GTSD+e74DFIPkMLl1H
         MuhgEq6lCK6PsxVm1W1mui39TfD0TeqFr/M3DZUXNo1LUsOMovon+dqT8KRzDsHBnx6F
         iltEUlYsWGkdlMwU2NJmJA5R0vlmM78Y37ueGW6GHDt4b9Nh9sEeCkOvVht7ApZtEDwx
         NOfLFCHAb45QRLbP3JWw6YsMWu4zlvpKVqPtz0N7e5gKJfhMPVxXbSoBtYN705j4p92Z
         O5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606078; x=1775210878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kscwhOT5CpzRfWGi0pFjmddQgBIrWxPFAh5RohhKchw=;
        b=HKIxQ5ouDQgsbPj2I1Pc+ks7vAu6dtUYkkpo5a00AQwfnio/oAYBZo5NtpddcTPj9t
         FNKzJgS8BFM2JX8LRQtdyDROUTUB2w1x8dbYKKzKtAYbSgVfX83WyV4ufTJJ9wxbo9P6
         PbeXFOaFdqEryToSoZRG3GczOQ9zKos7Qj2Gax1OCIOYScVtCH/+AxMu1nQGiPyZmvIm
         QGfIg1krbBMrS6ofqvX1vY5kay8YprpRkr/z1MYBlMvCjqMjIKKsYnTD6CZflnC9rVaZ
         iyNLIq6mOeA6iL59vMvWGLNPIYHfcLMhYdQRieattvOgYIKIN857Rrs4Gx0bj4c0cYUv
         5KxA==
X-Forwarded-Encrypted: i=1; AJvYcCUWTG+cP9z3ML+fIjgmLpDhatfw15K7TiZ0ECF7APCRR+jq35SrZzVw4SVSo7QLv6dF/hxDW/IQeg2nMvLP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/c8X4FSj2e8nKLKOZApNShL9k9g4RcFilL02pVxOvoN/Oj7DH
	kb2vk2ZU/25473o3w7MEUDj3nPEvG9sFdvz06s1PI10WkJ4OgzZvPfe0SOGKDzX/wHh4YCsqfZf
	6TqRml722I2vXQWSTURL6Kf2DZz9w4sZEEh/DXLGI2Dh0YEXcgqByiC/gft95q4XJy478
X-Gm-Gg: ATEYQzwuVDSROiDV2iyfER59XjThqOOF2pWEDMPIIAmFmyjclqsPMqWynLYCo57Dbic
	y1zbW9C2g23KpCPsqpEgfrxe/Diyk3OmNQojXQQRfKbWlyU1ooghBGO5T50HUjCUSuspq7LJHJY
	TBxSGjQUWK53jA8+/IainBigXnZF4wL86UMNSuBbyobbQXJSpoCa+QT7I6aYUOFGffNKltH5WzJ
	Afi4A94aegPIGNJa1IK4mNkU9qXL+/9loREMfAR1cAqMYzKiuc74mQ2jcsxjnHVeJ1q1M17v3PV
	+9q/NvazcJ0IBsyVpOQFERr2E8MgbqKTqCfS6Sfrk/P/PnPwkaxK0cnHowaiML49Fr0Ok85IdCu
	Ihfn46fGJCwhUnpS/xaqC7lYB4fjPa5hSdnMOHd+leGFoNxHhXpGsjNQbw46ZFSoY1/swbotxwt
	QYfNE=
X-Received: by 2002:a05:622a:60e:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50ba36a09f8mr18854731cf.0.1774606077651;
        Fri, 27 Mar 2026 03:07:57 -0700 (PDT)
X-Received: by 2002:a05:622a:60e:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50ba36a09f8mr18854441cf.0.1774606077116;
        Fri, 27 Mar 2026 03:07:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b202663c6sm238521366b.23.2026.03.27.03.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:07:56 -0700 (PDT)
Message-ID: <27adcbd2-0ec3-4a8f-84d6-ba381a66772d@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:07:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-2-0c0fc7f5c01b@linaro.org>
 <bc6abd24-d56a-4fc0-89e9-8986e8d8b3b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bc6abd24-d56a-4fc0-89e9-8986e8d8b3b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c656fe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=anbA2sijppV0hw6aPocA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: yCiZavSHoXba1gC8qOvLLt3xsYJk-Z2u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfX+1rP2wpVUmNV
 rxwIBLb1zH4op/1/4MydCO+Byf/TWGEcweTpygI4hZtYQEFtkx3phbBuQBT9iQ6UmVvnIvbRIza
 +a8eY4V1oMswWwXGmk4Cgf69M4/b79X23Fiyv3yYxiVIObERPjGvKeVe3OFN5KQtZ4wQLG11Wco
 rOicyCnPKES0hFFGGHoNtE8jyzQWAcdZTfukkYgvJhfskBbfiUMGL3/1pPX4MoCfa8ejXvspog3
 nflSUZO313FAibkxTg33pMYY/6c/7+3CxUQTQ9iUuye54a/x/xRQutF8Yh4p2rYEq/X3q3XVnEV
 n91nzq6g1ltl3EwOAboEn+TarZqEqOzp78pOa5TT35cqnsp5Bn+KQqhJDgOmBCtLHYaPRtWckCl
 DdsEcaHmJadtr/WwmzMvJw3Ln3DeZ4pn5Ytw1rYJnHSU9RUC19Y0P4d/Pmx3GNeSUagWHHZ6nxq
 kwL8y8Cc5eMRySR6sXw==
X-Proofpoint-ORIG-GUID: yCiZavSHoXba1gC8qOvLLt3xsYJk-Z2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100249-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 49ED934233B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 3:23 AM, Hangxiang Ma wrote:
> On 3/26/2026 9:04 AM, Bryan O'Donoghue wrote:
>> +#include <linux/delay.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/time64.h>
>> +
>> +#include "phy-qcom-mipi-csi2.h"
>> +
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)    ((offset) + 0x4 * (n))
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET    BIT(0)
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE    BIT(7)
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B    BIT(0)
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID    BIT(1)
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD    BIT(0)
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)    ((offset) + 0xb0 + 0x4 * (n))
>>
> Hi Bryan, one minor observation on the following macro:
> 
>     CSIPHY_3PH_CMN_CSI_COMMON_STATUSn
> 
> The 0xb0 offset implicitly assumes a fixed distance between the
> common_ctrl and common_status register blocks. This holds for the PHYs
> covered by this series, but on some other platforms (e.g. Kaanapali,
> Pakala) the offset differs.
> 
> That said, I think keeping this fixed value is reasonable for the scope
> of the current PHY series, and it does help keep the macro set simple.
> It might just be worth documenting this assumption (e.g. via a comment
> or in the commit message).
> 
> Alternatively, if future PHY variants need to support different layouts,
> this could be made more extensible by moving the status base offset into
> the per-PHY data (similar to other register layout parameters). But I
> don’t think that needs to block the current series.

If the register contents are generally similar but the bit positions
and/or reg offsets differ, regmap_fields may be useful

Konrad

