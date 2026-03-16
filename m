Return-Path: <linux-arm-msm+bounces-97897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG37CxXat2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:23:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E41BB297DB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2068D300D749
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510B438F64C;
	Mon, 16 Mar 2026 10:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+s++aG7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D5lnVTjh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3010F38F25F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656579; cv=none; b=mdgeVjOGO8dGx8TWuNUe2IWlnAi8rfDkBgKViE0QmUdUV+Sf/+2dbJXpDhMg+IPu0vzT504XJbckZEZKVLutL3b3TN9U2pK+Lk4JZI4D2SCL5q5+pjWACBrluzEzB543RIRlVPKn6T5dYwjV1m+Ko1FRfvKr6Lj09MkSdifiKSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656579; c=relaxed/simple;
	bh=SQVI6k4aCbiCeCNLXIx1I0+fKjm6v1C1tutNaXc+CNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z1Vqx0iL4mrabPh9O41zb02gpochPS7xFna9gdgLTs71EKZz0taszxGq3vf4IjQZFzLvjLUKf3F74tY+Su38ri3zmgRc9AX1T10b8Uu+lZsL6lKxp/odr5Vp5IloHV4UfoU+iysrrTXhrR5RCHg+G+tCiJBzxqqOF32Iuo0f9w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+s++aG7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D5lnVTjh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64oLX1724892
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMLVJCkhpdvuaYBZT6ZJtpjc60jL3K/BIc3n5U+wroc=; b=T+s++aG7kI83DMIZ
	DPR88V5qU3L2BoOYdVP1CJZRrpds/xN4D767MuHpNYkHtVSlToGLTpG/vvAT0LY1
	lfgWT9FH0hO0DxciHbzSuM/RNX8BmvahKcBZRUMYOqwUofJDOSR/0SIaebHais96
	7AIiMEZ9OyrDDXoO/ZZOX549V8JatK1/D8STEKn2c+L2Ic3DKYKogaD3IRbRzV+U
	ihbzFG4APTS1vEH/Paeju6KPaDrM/FalwUM85X/W/pbG978Y4AaqxA5AvmGpf+Rj
	wMi/2vWnZ+HCAvLAtk3oilnvoItjhx1ArV1Of2G6h+cjyInGRC3P4ZwUuQnfEHeo
	zA6Rlg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udn48q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:22:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829fd367abfso2097610b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773656577; x=1774261377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMLVJCkhpdvuaYBZT6ZJtpjc60jL3K/BIc3n5U+wroc=;
        b=D5lnVTjht8IUNLGjgm+0tullxHXIzjwogu2Rm+5dR3stYCqCSUoM+HLTEL/obYXczW
         1TGg+YkFg3HIWOOCkY/jY7EOqQefF3t54Y2+MOipITgmw5AOk2F27ljQhc8+aZN7wo8t
         rqHn/FbgDALVLt977+k7C0ds/mbzXncN2D5TK6GWI9siVe8VxxK4gB011P/02Lxin3K4
         mvJXk1HVha0CU0MNI/an7xWWx661toH1IdCgXdZqan0DLFft/aLaG76RT5/KVyb/WGmW
         FF7zw3rrUwek1DWa0qdQDQnx0APor9BsrfcrN/I5OoiWqeUvvS2GN33LbNBfSb+1PYLp
         KQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773656577; x=1774261377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMLVJCkhpdvuaYBZT6ZJtpjc60jL3K/BIc3n5U+wroc=;
        b=FvxHglgYGH2Y0RRsonq9fozw2koZRSLas/iZvysYvjwpJnDU2vulyPguAETh48Fjca
         WIPez+nDU0vwdiOUdkweucP1BW/1e1kWRPZvhUOeszSSdjp8i9RJOWrc3maHpF3iXAZ1
         XAUcdisu4274ntDkdSsGCZkKZtFm7b0y/YW6TyS1+Pc4KN7z+GvvVIqBz0EuLIxnh3dF
         lVeey5E8hgkZtgThUXtmtmhTGKV/+aUmZo4sdny21GbZ7c/JaTfT0wUWUDIihqT3vcuo
         Qnj5BHs07Rb7sSzdRNOQAMrGCby3sm+XUh8ltZZk8Q0SJ6Md1wcUM71lc0UXjN1UAE7C
         mdYg==
X-Forwarded-Encrypted: i=1; AJvYcCXc726j22DU4WFcGyqYdptpYxTzB2DKfjxvNIM6dXBYYLKfFmbq7vEzaWPfiYByUtPqQVuhgGUi14dVQ4bL@vger.kernel.org
X-Gm-Message-State: AOJu0YwNf14OdzF8iS8CGE4iN/n/W+9c5WXU/mQ7jNAoBxlBA9I+tLW7
	gh8l/GRA0WEfjrBrbDIJ+ZI+WnoL3Oxdb2ZJeh88vpqhZEzKUGhxsy1Gwy/6CJn1MZVTXm9vJhW
	Ltrgh+wcHRVfCf1sSGZJWj2gYFzCjg3yrKFayZLSsa+Z1AjHwXH7eLeV/Fp9qooOUuTpx
X-Gm-Gg: ATEYQzw80BfJ7LzI6li5J9Iu7QMeBRypBo/DPOrAOan87XQihJ7y9uRUsZYA+Z9Lhui
	t9MPNXNmegR3DQ/12D3J1bhW3beZ+MvkE0fjA3FAvWBpFVtYciy8u4S9lMpXbcJ+sLQdmt+qslR
	vcHZDQCN6RfnTwH/aFE/tUWcD/3cPrhIjHbBTYT3xjkVUsWsCHf8ZzOW+45KgzFjiGDDWBV1TKh
	9E6jC9MFeSwOcwL3ZlKnGn/fOm1rrnHva45F7T1Hr8H8QlAnRL3Y91qZgmzH25MA24d/hOWEXZ8
	qH+KfNZjKmLpbhDh0Oi9A0gBkhadOCX5K7TBzuBXiDm4jS8wj9rD51q08qEwZVXcJP27fkc2OVx
	PM/R/+zAwUPTKPi3OWc1HZ3o5v3a9WDPp2O0XoRRbS/M027q49t8vsrQhJTZS2ExLB69wc7rqzY
	lwq1nUc2oZCk08FI3l5+j3FSd1mpEq9ilMIg==
X-Received: by 2002:a05:6a00:2d90:b0:7fb:f87d:a0aa with SMTP id d2e1a72fcca58-82a19916342mr11124618b3a.52.1773656576762;
        Mon, 16 Mar 2026 03:22:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d90:b0:7fb:f87d:a0aa with SMTP id d2e1a72fcca58-82a19916342mr11124592b3a.52.1773656576284;
        Mon, 16 Mar 2026 03:22:56 -0700 (PDT)
Received: from [10.79.197.144] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07244071sm13441253b3a.6.2026.03.16.03.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:22:55 -0700 (PDT)
Message-ID: <bb38d7b7-859d-423a-9837-1b678975bd06@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 15:52:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add driver for EC found on Qualcomm reference
 devices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <132116be-2964-4b98-be2b-1baae5bfb58e@linaro.org>
 <19e8837b-d711-4d0e-ba9c-e9b2c8330969@oss.qualcomm.com>
 <aabf9bfa-aa90-411c-b9f6-706f963a5ab0@linaro.org>
 <azoaku7s3lxgcccc2rrp2bljbvqeitax2bl47k7eemy6uhcr2g@kveqod2tstgk>
 <ca7d675d-139d-4fbd-b57e-5b233a0e2922@linaro.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <ca7d675d-139d-4fbd-b57e-5b233a0e2922@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7da01 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=meSk0gseeHhLLlbLLrwA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: tz0Q50FsV-OwC_8bN8l_nibkpbVT7Wc9
X-Proofpoint-ORIG-GUID: tz0Q50FsV-OwC_8bN8l_nibkpbVT7Wc9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3OSBTYWx0ZWRfXxR7hh0lCmgrZ
 Q70hp2FiB+s2ZfZzAcIxMhWiuw9GFHypAPHGyTjtEsI6mtUOMO72gGHI2agrA6vXt5pNZw5bilg
 uAw2krbEFCEWpXaGGuyiz6wmb7bBzU69V6VppnciVsf6nyKF//QguRVOWgx7GnqN+kjDBz09qTa
 l1SYthtO1j6HF3VOElnj7jFEYRxOMDZPLJqQTg5sgZt0uz8pq2LcSf8jQUskvOfgeQEL5VSGeBM
 WvbWfum20Bi2Yd96/YXc1ssYAdAMKzBQna/S/13ATty9toZ+AmvT2W1tvCjM0lpiJLKWXNUNvt/
 UdIUVoAicZ2z0wetXmAmaCUIVwtFGc5zuYbs41R4Rui58Tqk9vTltAmDGZOWnLGiLj70GqV0IZ3
 +IiNDmS74Iogy339YLgR0v/wCJbBMArF2stcQ49oizRGuNP+UrrnkRKdu9nR+riEQ1AxB79KYyi
 tArPNdpvPk6vPma+YmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160079
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97897-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E41BB297DB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/14/2026 9:39 AM, Bryan O'Donoghue wrote:
> On 13/03/2026 17:17, Dmitry Baryshkov wrote:
>>> Fan Count == 0 || Thermistor == 0 => error and probe() fail.
>> WHy? EC is still there. QUite useless though.
> 
> You want to register when zero fans are found, zero thermistors... ?
> 
> That's a bit fruity.
> 

We need to keep the driver loaded even if zero fans are reported, as it
is also responsible for sending suspend/resume notifications to the EC.
Failing the probe would prevent these PM notifications from reaching the EC.

Instead, I will add a dev_warn message suggesting a firmware upgrade
when zero fans are found. Let me know your thoughts.

> ---
> bod

-- 
Best Regards,
Anvesh


