Return-Path: <linux-arm-msm+bounces-100773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCKTEN5cymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:22:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A889A35A212
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7B6D302F693
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8833BED2A;
	Mon, 30 Mar 2026 11:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RobYE/7X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dbQ6op/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5EC3B5307
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869351; cv=none; b=I+UmfQteboRW51CE062GqLO1o4psz8tc31J6LE57JfCoWVZ2VSEHZxOzP033FdI9/z84AuqVniJvOtG9hOIM9Bn5RZyBHAzGO+VNFXtFiwpPmOQaFHUO8D28p0cVo2th66bvz5TbSI02M6QmWopWiZTZQOWj+MfICyZXZ2zE0zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869351; c=relaxed/simple;
	bh=Ipx9AVbUNIiUJY64J7TrYtkx9Md2C7FCaPk3KgoqjZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TSaSZI6b8cb49k94gfCsL8tP9YTjomJw7RcjsXCq9M3Er+qskLuyAD8L/lsTm11hESvS/Bp5VPaST9yxhtWQigA5xFtyNiimw0eiTsCCplUmR3xyJ9WjfDcf18e2WjJhE3sAJnoIpbd91hNM7w7WvDASXYaP27OxH7AcxVvlon0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RobYE/7X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dbQ6op/V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UAGeER3174075
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xg5b7vWnWR48Z+nmUzvfsCBGvAyRjlRj5sHV01r2xzI=; b=RobYE/7Xt0tJg4Ni
	6P1GG0VaflO9tZtQS8/By5bdSWB1TRTW9mAUZlp4yf9VvcjHxCsdE8QjUeIcqTVJ
	1noWVa17cksc5jyLJLffb56QxquYtcLn8TJI0+SbFKJ8sgKOKz5/Jbjd3ocUSpOL
	wLD7AtWA3wZzYRe3RjFOmJP+OVh3KtrEBp0/SD2hJ617bhRtoRxoYjL2uIH48p/v
	03Gam6/tyRCnax1OmeTKIu6NEMDahxcbXUaurszRsKNCzQjqVu7xZtmfzrJbW8Ew
	bk91ElFDkW5fQ5bkSU4fqLS8U68yCMCI5vyFA6gyo4SoWxeoeXWufVJI/gmw1d5H
	/cdjyQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h062d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:15:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2d15c360so11698221cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869347; x=1775474147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xg5b7vWnWR48Z+nmUzvfsCBGvAyRjlRj5sHV01r2xzI=;
        b=dbQ6op/VEBR/o7evnw8X7OCinEwA3hcJVbrEw8Z2glYVWHNvBnr1nfxLuGP2FxZpFO
         vC7u4NxHRfW5FKDhQqQCo6p1gToVJ5fiTU7tYkXWxXnr2PEN+giq8SrOFYYFK567l3w4
         DkfIlQBdh8hK58U4rHC8AKBKaP0ebUGLu145Z32ofE835b9vdmyfunVUymVVcNVrIq2u
         YJV4jkpZ6ZxPT+soXvW3Qq1vht9H05YSxRBSKKMuegdvyEen5gY2OfwIrzV4cZNNi/Uj
         lT2vhLcujvncNMgG0Ask4Og0ge6LJYl3mZ4VqFIrZecwbPN66ihSeu6JXJF4SWMA9HVM
         AMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869347; x=1775474147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xg5b7vWnWR48Z+nmUzvfsCBGvAyRjlRj5sHV01r2xzI=;
        b=ZOErq2Fzmvafx1T9/4HKhB3J+iSXJW40Y5bKUBY/d7noleSI1APqTfhyrf4iGoDwNi
         zzQqmJRnm9Bu/y2ZMFzF9LGUi4EYDPJ8dBT9X4D/FekPpL1cyfZnDHAbRd4AlMDC6H2O
         UEId1mWfeKyN9UVW1eudGPAVRoVv09z9E8Z128gSxfXKjbjWGuM6Xefh/l4JPMVxrcpr
         aR3BX+Xlp4HYpZiPzG2c5bcaUmvzjETJx+ORFw5q5eghbl/yQ/RPHAFDmix9gW0nDYXh
         GR6HMKBAMf5WNgjECXV+k30jXsiza134TCvTtxC7n/jYE5z7TGfknvIlNVvj8+d/lshb
         HmgQ==
X-Gm-Message-State: AOJu0YwcOxO0kY9SmQUtApUY1rhiPb+pe/rHiZWOw7zUOw0cEANStatd
	8MYs1OgJ4QVBoLdvD6K0hVtJtQE47oJ+IZrnIYoYa6h+xYLVkk4kg0nFp4vM5TwrYPrmQ3Ytrs+
	tixsPLzwZyxnQDBPkR+ELxtddFBndJx02/HBwUYdhMLgsdu+301w96q0nR4COIHRSAVG4
X-Gm-Gg: ATEYQzytP3UP6SCnV0eXLp1CUArIdNtMqrUad1Pq3f3Jt93qy716hrF5gj9hnb1JrnQ
	XG7jCn8kGTOgYs9jJhqcigzAFZb08zX/tfpW6w3AfCaFOu13jgyRVf5ljQl6AyRmBGhlIFky5mS
	UJxbvAFQmJRrmgqAC1E1baX2/8TeoeLPV5OPkd/NOydh61qLzpazZiUx0258sElCQEgF7ERVzPY
	TKe7NVg6XYimssbT5EjVi74XtouH7iG6CkrnX8N/DY7FWnUKBr3mTNsHG0+k6sfpt3RuiIsPGfX
	yIYsB8MsQz4O5585vUgSwDYSL9nj+QkIIIL2mzQ5YFnxeXdiZxOnxz5Kpb1p57i1sgda1WTs6II
	dHvG1GAgiFtFVUJoAsiUJ7ceA8p5EICB0dzcP3treQ7cJF2c+3WoDyNA9cGNEXEPye/AjdbHH4W
	OM36A=
X-Received: by 2002:a05:622a:4a8d:b0:509:2239:8b46 with SMTP id d75a77b69052e-50ba36b0249mr116207041cf.0.1774869346583;
        Mon, 30 Mar 2026 04:15:46 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8d:b0:509:2239:8b46 with SMTP id d75a77b69052e-50ba36b0249mr116206491cf.0.1774869345985;
        Mon, 30 Mar 2026 04:15:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae522d4sm283960566b.22.2026.03.30.04.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:15:45 -0700 (PDT)
Message-ID: <3465929e-262f-407e-bc3d-7564787bce3d@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:15:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/17] drm/msm/a6xx: Update HFI definitions
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-10-2b53c38d2101@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-10-2b53c38d2101@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OCBTYWx0ZWRfX5KZoa8rBJWJS
 dSrPlwBZ0Efx0HcJVGE2Os2scAmPlxQ1a56xvM0XmX6Ey1pgYdzyShKjr4DC8D0eVzeQQpA2H3n
 H/tqNC7ly11TjyqIX6NC9M41bO1Ebi2nkW3C4II3Cpm9zIIV/QX/KXmCcXbkT5tSHRamUZCM2O0
 kmBup4qVyqbUPafpv4E1w617jH6IVcuoNA2LLupYBrJPFx3uIxawUSc/lDxEY0SNsZUibjewHSk
 VFhdoh54AYBd2Z75rueM2dCA71FPBmLGPnF5GBsncEf0lU53CtW3b203hwzS2MJB6G/I/C5qYkq
 hbRx+xb/LXNzY+aohrst2DgU+mMHLkqm59iauQgJsEeShMqd/i9OhlJXZqsL7eZXfDZ1N7ak1ot
 SCfGHme753q6KBMx6mYJtBaijiYjjJ13xb5BGon2wqc54nlENUjh/x12FfCxiJCpTYz7/ZZjSkt
 pjlcLZ9vFZBDdPt8T5Q==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69ca5b63 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=obEroLpJCF5-QB5h4XEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: E8fzrQYaM0RZAvDgRVS56dbNgHjyyF9r
X-Proofpoint-ORIG-GUID: E8fzrQYaM0RZAvDgRVS56dbNgHjyyF9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100773-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A889A35A212
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 1:13 AM, Akhil P Oommen wrote:
> Update the HFI definitions to support additional GMU based power
> features.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Whether you want to proceed with bitfields or not:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

