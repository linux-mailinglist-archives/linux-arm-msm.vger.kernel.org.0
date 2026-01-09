Return-Path: <linux-arm-msm+bounces-88232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E511D0820E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0F0630146CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE723358D30;
	Fri,  9 Jan 2026 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxoQLUak";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EyGqgbXR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41206358D2A
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949983; cv=none; b=tAH2W0F7jBrooIpc7xhmOC+J8+GQwo6K8Xefal+J1bd/pRRq+84RDy7X+beBn3i/p9D5RAZyBFXuY2xU7Os63PI9TzkebONBEqKetnh9VkUJsa6QCXUmWZDw/ORbb0hP3wSAy+tuN5B2xGhHXFXOn2WE3tMks6qvKvFrRk9td3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949983; c=relaxed/simple;
	bh=2PyzJYzP0Y1RqWMp6rzac5wFiZQD1KJFspE9qiO4mhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YIROYNT6ebrV5v7GghZ4rWAZ65uswg4BJ3rnd0zQdOO2FIcsDn+BqUpCSDG0s9hCALnw9Hu9U0N9fo9MszGytmS5OylW0l625vhuYM/hFljw5adjMbV2fPznOP73/QuVxUDXR7UUplFIGbY0MwUO//9NsBGTpXBwQYtph+KLVY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxoQLUak; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EyGqgbXR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60952eDx3542035
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1P93m0XTzLapwNrcaQ2biPDhM8Asz8miZJjKBvF7vq8=; b=YxoQLUakCVzeOh88
	ZqaK/OwdfAOF9sIZtVbbMX1FqVVQRdPVRy6AA/h/jNUsiKRnj8fw8zBmyc20k/3I
	gfkZ4sE1wlKql3l/BpUpXDKIOrSKKYiF0bxso7vZcnl2zK4Dx6sYxeoBprpe+IYv
	RQHzKrsshZaR4ZdtvawBNBJtgtJKWtxdvuvqajbUJeSATPZNQTMJ+jfGqbDhBOwF
	KKl8qlzD3tEo1F9xwTZimAxNBOMMUfd2DtakIxa3FohJyBz4F3KKeWAtN/yqxv8b
	8LFSP/Cz1LwjmALIpsQLPUuu+l0MYZMlZly9QTGkSyjKZmMziEKrB5X1PPVqJEKc
	NMvsKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b0ph3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:13:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b9f3eaae4bso94010485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949980; x=1768554780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1P93m0XTzLapwNrcaQ2biPDhM8Asz8miZJjKBvF7vq8=;
        b=EyGqgbXR+tf+C3Ppyhi+xAqmrjQ5yFfo+SUI6X0s+GWxNT8CWBFbZtJtWKDS7iYpl8
         RJtn7tHr24vwaonyTu6vQHzKUBTQXYs5B4djKKfKrnDHy2Fadn6u5LIwIeSZULGcJwWX
         vO/YdOqhy3KVxvDDv5QtkQtFcsfBZ+qruA1uoWXZfDxuFK5bs0EdtR6SU30Ho1jPxCLV
         3xShs1UgAgYkubFC4TLhg0qvwTpbAmcA/FF5u6SODqT6XiVjuCFD72klMDQiOjahhhY9
         DjyfEO/iNoea8AqeRgxqCCPNVTjTVASnrgsuFhDPq7lPreMCO1M0n+uJcy1BdFyG1aNR
         GPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949980; x=1768554780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1P93m0XTzLapwNrcaQ2biPDhM8Asz8miZJjKBvF7vq8=;
        b=X/zZvmv7g8k7dHZnODaVT9UkiVP/U+B/PdGgzt5+JvQNYehg1dV82zOjWYDuEaKrab
         vJu0WAQU4FQ0rFR/rqlTKOODXInuQ9KPLCBprh0WEv1xp4AxfeTBOCCmv+zjWcRdxPse
         LD81ylRuaWFwPt2mfOuAu+HqIiWt9aZ7oe5kk7ei05t0zcr3o2f6DO6NVZSeirmYHSw4
         M3nxWbDCLiwiul7Ec038RH8ejt9WQXjkjk4oDVuvjoMqb6qso8fO5/hRoDAT9WR9xmsH
         mi02bGy1PpP/Lj3BFoamI1UJ+hlfvdECVaJIfZhPVsR8JbMjgAQsaMdJmuaAbqKeXTxp
         +y+A==
X-Forwarded-Encrypted: i=1; AJvYcCWzQ8ZzqPybTnvY8bwqDS/F0bADkkhwAzYdbaiu6JbVZz98l14kCdevBB6CyKemGMlh+wl93OJ4AInH0T6/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0savAUoCmJ3Cfsq/O1tiU8EOPVBeisM6aE/KGaGkB5NZDS5qM
	P+Ud0aJ9sJQm+QsqzapQxAERxA6lSan4CUojq9PJQrEWlxq7dHYk/E4YatmlNQ2bn754oBQqJOn
	2uUv1KdtYsi5glNbHBLVPK3tOZcVAouAac6fxXYMuJ3bGlVso6XbRtqpp958ZRKPmksFQ
X-Gm-Gg: AY/fxX50t6nrK449JFglWkogRd7JZ46VHdbg/seI3fyiPHh9WTfg3LZ7gVerSPV3Zs1
	hnuOjRRxnUAWWs4uDv0EmodXXKc2gAuIl4vY2mF4MVfxjEWZQeLmFigZA30v8nF6j7UAqpxCQgn
	puuXj6UEvOoSHwpB1HDUDoW9Qe3uxfjm9BozATrL9/E0pCsU7CFulX+EiYIpANx7icV+pMqXXqv
	d7rIMBwWk1TC8nT58ZOPkWn0hQDrxFZYSeABWzhlEihM7IXdMhj1MvFY8eLrHoM0pa0AsoGrdjk
	TkjBCANV0YYN4jRWH+j+rFyvbTnE7nCatBHgYPJuyQJGQy/AEEDNqGGc6o9zCi4EgqnRl8v9GTx
	m6le8RTHo1RJJsXmtYg3c6vKR+UzcR1K1dFqSvX+51+K+haCeHtfSpkSCr60A+kpPfGI=
X-Received: by 2002:a05:620a:2847:b0:8a5:2246:bc29 with SMTP id af79cd13be357-8c3893fd6f5mr926315185a.8.1767949980562;
        Fri, 09 Jan 2026 01:13:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeBZSG8kdSBLShp1+Wc/UybzJzIr8kq9RYBBSnMDG9wd87B0tyDpTBrTpAW7NtU14bEKYlTA==
X-Received: by 2002:a05:620a:2847:b0:8a5:2246:bc29 with SMTP id af79cd13be357-8c3893fd6f5mr926312685a.8.1767949980148;
        Fri, 09 Jan 2026 01:13:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5187afsm1043952666b.58.2026.01.09.01.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:12:59 -0800 (PST)
Message-ID: <faf2dc8f-fd5d-46cf-8572-41879b3f4aa4@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:12:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/27] drm/msm/dsi_phy_14nm: convert from
 divider_round_rate() to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX5lsjSjU5botQ
 cSJa1tgzqBHGwzMxdot0UVeZ+53d62XVNI7lrtFr+fQvTzV3/xX9KYZQEotdo16+to9Rhp8TO+H
 /n2VAKWl1iKiCIyo5x7LkOOiyDmzW4OAo4gHb0wrUHTWLUX/WIrzmNiZawhTuEirA7+gjsU7ibV
 sUFqopvEJDJkf/PB+p5quPW51CD6II+t+oLrKWyMSoTIHDLXSUVbTmnjreZ7jkmM8BF31T/lt2O
 t1KEWPuE7iGd9eys6Mw8iH18PyVX2Rnd00ts8HsZPmILksSPucvwJiZgg8vVWi8Q6GnIWj4mQk7
 f7M8kxfG9RGAh6wLyPMXo3dTDmuUvPRESqX0Axp583cTW4a3lH7vtV0FP/xE5zPtNsrX0dtu+zL
 kb+M7WIA6jg2Wb7aeCufQLrWxM5vGFr2zbNL0s0zFTzjyq7Lcx/a4U1Z8qL3kz1lPaE1tRSGBGq
 WcRP9W+nUz/6IutWByg==
X-Proofpoint-ORIG-GUID: sFl0OrCGKLlnURMqWDv8x8uBo-Oh4sf3
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=6960c69d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=MmoDKESpECQAgM94Xi4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: sFl0OrCGKLlnURMqWDv8x8uBo-Oh4sf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090065

On 1/8/26 10:16 PM, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: cc41f29a6b04 ("drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


