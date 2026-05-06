Return-Path: <linux-arm-msm+bounces-106093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GfYKNYM+2mbVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:41:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0614D8C79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BE3243001452
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 09:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A80F3EBF00;
	Wed,  6 May 2026 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OTdk7vFB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fbIck3aM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6343DC4A9
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060481; cv=none; b=do9s52obA86JZjqDM7IESY8WB5cKpe3rhNaRXZbnNUT41a4dsSS3E3fBsOfLomU9n4Nd0QhYfXSkq/ZxqJbN1SlrSoqFwbum3+02oS5wy/V48UZXPWqoLtZ605fGcPq1w42voopRZhet19pD2UkYJ9BNezwIuumlnlWyvsJdLbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060481; c=relaxed/simple;
	bh=3wbXNlLS8RPWHlm64ZSPH9GUtK7pJWkQ9S5zAXX8KL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDFMBA97CZd73puqygv67lgG6ZWcMbK60NF/rur/v84Nm9ihnSns5Sa9zAZoeSWX7YtDxiwF8XHKNu4eEJYrWuY41Buwn4QUFZNOLWLpJEUzLofu1J/oLbZ7bDNAYoCGQxkh8hxGE/uxMrUJJzqCgUM1ZQUgRbr97VVQVTiYrNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OTdk7vFB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fbIck3aM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466xTBg1515371
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 09:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5UFGXt3ejSAv47+ZqLe6WtCLBVRdQ6t3LjCHVbOUbEM=; b=OTdk7vFBKZnNX1w+
	XPuKEv0JuOl8iYYwfIk5wPQnUWPufrQepDTWCAN2NflV5tPvhDFLocm3tDHLsjUW
	uxlHtIhfoC7La0qsZNlf3HyrvrbhML0SbLliSM4e+4tRT9mga8aGhVk4HWbaIBBL
	HH8s6+Jmvc3Rg6eEC3zoZE+aHjx2Bv5M83SizKdxOiYoU+CoLRjs5zB30YuB0uo/
	dNTIhFzg+QNArcJ5/tHHOvRpxeQBhh04ZlKjvn1e4iPCCVGQbn/Swf9DCwneCL+K
	aGyNxNElxaGCAm0+DenN3+e6YQkeAC54xKNwnSgbQQ6yYZo5a2kSOGrGA8baKFKJ
	pjNV3A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e00v1rr89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:41:19 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f7d6e7a31so500605e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 02:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778060478; x=1778665278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5UFGXt3ejSAv47+ZqLe6WtCLBVRdQ6t3LjCHVbOUbEM=;
        b=fbIck3aM6+woJffQhiOifIM9wg4ek1SWwFzOvTsix7Y366xugdP3D5NpdaEdbRHfn/
         2CZ9ORFFD6wtp13ccKHOw/6+ta+0Wc5w0aynEc+gxmvvUJ9ywX1IPBjC1Ssq0DlZQX9f
         alLYRvlHC6IlAbiHOSqi/96Bg6ZLIYgH2lIztIDx/y5Xb32kpV0YLycW0aFB8N8p2QUz
         sR96z912e8/V7Qp8WI4qJ75FOhpcHj/kUcR986mGyn8FziHmjrpmCtPn0MnKweeELVDF
         MYYoEBGKsjwsMLGM9YtfZEPH4MIngtNVPyh7Pr8T5py/BkZB1f8e45/ACfUeHUjL2YDa
         By1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778060478; x=1778665278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UFGXt3ejSAv47+ZqLe6WtCLBVRdQ6t3LjCHVbOUbEM=;
        b=mEQTi3ts53XrM4gm1xmFL8tnZbkyBQbe2vzqnV/TJbkcQ606Ib0EQyBRBSRMrDOCx0
         9TMti0+A6F1t2TGFBv/jd/pq9Sm7+ONEaPbOvGoAW3mPBbif1drbnv1lhUg3/gfczfnf
         V+ySyIHpKbZPEx283egqWhyANheYzzlaRHvTjb/wVwrZzpIftMsd+MxWz0Lf8mWrEnZL
         +w2OGWmy9C55+83grIiq/9YWpIh3Yy7mw847b44DIVE6GxVc6oBBM5vg7feml28tveTh
         fbRXnK0abZhhedn/BIvBPgnhb0B9WnQUJTEIiMkS9K/ZK1zaHuRO938sYqfIKCTZdz/O
         67qw==
X-Forwarded-Encrypted: i=1; AFNElJ8Zfwv5Zbz1CW+aIzkIxSz51MRbqPHUCv1BJXNYoHt8aUburlFcwUdrVf76rsMVzmoVvIioHsv2sUaiI5x7@vger.kernel.org
X-Gm-Message-State: AOJu0YzLyCAsk7tbZwulSP2wtF2tF8ZAqvJWIf2fBymblrcg7daQr27F
	9tzimenHNck/sZBjDNQgggsndXitTRmE9Y4TeXk4ERjtRkzK+e2uRFJWhWjeL5+rhUOBN5fLmCd
	WsJerowHDRWlcscPwaDZB7lrYm9aqEC2xf6QTV+f543cuWBE27hxYwKnqhvSt/5apPX+6
X-Gm-Gg: AeBDievxps3hOxOIsMH+vBBNoFDpPv2chXZLS8Sx2lnJPgSnTt6WAMUrZr/Z/qSM7uk
	cDReQbyW332sd10xde3h2eScg7o4x+wHR3A3TOBPLjOTTuRAtiTOvTPrA86QfqKAoi6UvhDpTCs
	0UJtR9EUsz8v9NJgnofeAH3OSv9FiTNyu3bfgxat9AuIL8AXzHf9/uk06+5s16KtkzaekvDltdj
	rjOj9ML+zaCJM8RKkkXWfeeXcM5AENydY7NUhGoDo2nhM9ybKnsONqpV3kpVvNiZ5tJYTWEkIJa
	mgJqnmq7/YmdwLBYLwtrtNott0mANWBVeTUKi1MmmPL0vxYV0KPQ8GpdwizLdTsYSAZ8vcHhKe8
	6akw7IHnxA8FZLF+KNb3DSN1WHYhYfZHdU/c+Fwkf9h5J78iF+lL06sXBazTEPrcyvfSsOHoE8/
	QjvN2B/AsA8WVEkg==
X-Received: by 2002:a05:6122:2671:b0:56f:4a47:6c9e with SMTP id 71dfb90a1353d-5755b4125a5mr202304e0c.2.1778060478559;
        Wed, 06 May 2026 02:41:18 -0700 (PDT)
X-Received: by 2002:a05:6122:2671:b0:56f:4a47:6c9e with SMTP id 71dfb90a1353d-5755b4125a5mr202291e0c.2.1778060478176;
        Wed, 06 May 2026 02:41:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55b58f0absm64768966b.20.2026.05.06.02.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:41:17 -0700 (PDT)
Message-ID: <61c09a6a-c46b-4a2b-9bd6-693581e8ee71@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:41:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: qcom-rpmh: Fix index for pmh0101 ldo16
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260506-fix_pmh0101_ldo16_index-v1-1-cdc8708b01f4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260506-fix_pmh0101_ldo16_index-v1-1-cdc8708b01f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e2UO-uj1GxG2uV6WYEUXuKJBQaadLFMV
X-Proofpoint-GUID: e2UO-uj1GxG2uV6WYEUXuKJBQaadLFMV
X-Authority-Analysis: v=2.4 cv=cKXQdFeN c=1 sm=1 tr=0 ts=69fb0cbf cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JhxO9X557sUytE6M4AsA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5NCBTYWx0ZWRfX7040Ga3ZllDT
 1qhW04ZGaNciTDvDFM8nVQ5WSbXkfWJMPOWecZjLWbMZkKoDr5oa/43aa46hZudnvpisGJmW7Rk
 MOBPeb0MW0ZJy/jw5Rnn4a9StkvOLsHSn7Hp+LidZ9kp9BbUtvNla146c077Xqif7nfxCFIIXLu
 E5ds2gBvdhn3ePp2HlhRdamL6OXXknTY6nGv2xUSpaKtOGvr388gnRyVKWsc45oitzcC2HAOMk5
 0xXueWUu0MmH0BbPBGcqK7AB+C/TaZipe3ctDGtcKO1td/zPMqdmMsOm0TR0wTssJpbX0Zyh3Yp
 3YtbuCekqe7r/MRzsBEMHyZBF7+k41/2Qr6Dq50Paxqnf0VPvPY/wb168un1JY8FFiC1UCzdBPR
 lLAAUFfyvOqpq0DdqWopShQ33f7c+4xsTJHPMDhPifpOR/6qOXvYxkSVWzDOc9VXIId2mZgiqTR
 ZtLRrR7IbypzKxoTXLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060094
X-Rspamd-Queue-Id: 2E0614D8C79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-106093-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/6/26 11:28 AM, Fenglin Wu wrote:
> The wrong index is assigned to pmh0101 ldo16, which results incorrect
> rpmh resource being used when the regulator device is voted. Fix it.
> 
> Fixes: 65efe5404d15 ("regulator: rpmh-regulator: Add RPMH regulator support for Glymur")
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

