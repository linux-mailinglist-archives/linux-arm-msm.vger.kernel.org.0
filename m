Return-Path: <linux-arm-msm+bounces-86593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBEDCDCC6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 16:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 509A9300B920
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 15:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE472FFDDC;
	Wed, 24 Dec 2025 15:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="os+ZvryB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYLMcSE6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CDB2E0413
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766591761; cv=none; b=p+VLad5uN4xLSTcC2noFcKKW9TLn1nsrbOPA89IhWT1kjovdQZ/Y93r4TOlbTRjVdxJ63JJeSKuqux4AjqSD2qJnkh5iIw08F3CqKDysG9//wX784YP91QcsqL95f9S8G+AQTxhRlNZj7HongEWYtYKdp1jMCWRqbMWt0Y/Plac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766591761; c=relaxed/simple;
	bh=Ap2bTaQx1BIdpb75t15pFDLFfmi2q0i0AxH5RyLceYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LOxoiVwsPfSD3xZ7nSwyt8BWLjZ+M1dVYjmVeQ20PlVCn9JmTl7UJ3dRQGNdwq6t1lhrwIHkkov/nCPG2lYK1yVItpnWrwazlxazyH4HcNtUoyYNFQjnAreypaVC8q3F+//WuG0kY81sCgL0YV7qf2CNrdDTw9zRiLQ37Emxz5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=os+ZvryB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZYLMcSE6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOFFtSj1018073
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iWGedSx1FzSKcUjH2oELnqaBpb+rd2rMQldge1V+adI=; b=os+ZvryBbLSlKgIH
	UG0FOlTmbaja3DtCZCR7C5tqhw5vrpyPiYoHh0rK2EApAtjObYgCfMugLMUQY7jK
	gNLsoFDJMdyXKHhGFNdfekdDsqagZLb5szh3mAXOulQn5IjXTMa/6RpLsFwa2nVS
	7323psaow2kKPSt2Dho5VS2j4P1tbGlPf08wA0DDrTCN8d427qd096hj7E5CaF+g
	9Ojx4+b4yg8IMlBL2VZWEK9oSD2k7Y57RgUBff/VZr/qNP+aFKjtjllN51oEWdob
	+TbhQr54c+SI1a3/rFxHk/Qwu7xSZKaHxG5WiSJlt2u5qqy0YIMbB9wHuQDTixWS
	HmunVA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjsb9w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:55:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5dfc092492eso3492925137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 07:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766591758; x=1767196558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWGedSx1FzSKcUjH2oELnqaBpb+rd2rMQldge1V+adI=;
        b=ZYLMcSE6inmyZHMy4B2+GvaMMU9Psnj/xpqbyzwp11oAbN3u+ixeEIqsCjZk2YGcwI
         jHVRsAeV4s/ogZnNo7m0RQFBmlF6hR8LJMAwub+wTDSRoXi48PvJ7W6D4hSlmzeYL5Lw
         /Hb2jqjxdwBnwvLfie/NfHbagHRtGiKFmn6J7K2i361CWJzsHELL3FtBV1VHz+esWriv
         Rh3qFHZn71BEebGF4ZcrjG13aiJIKYOaO0yAzFJiBK8kKZTlumxupWF4SdHx/7hpCcyq
         LiWNlkiWiYyASfYBjHnTGiXlaNcyhc1qm95r0/FL2hWOaD7yp6ryt5vI3bLP+b0xkAN1
         H0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766591758; x=1767196558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iWGedSx1FzSKcUjH2oELnqaBpb+rd2rMQldge1V+adI=;
        b=mnr2pd6IZh0KuRlXkOyyOeLMrd4QEv9XHmxW7zoNqdBW88EmhWtsuC7B/5uFc36NAt
         jAl8iie8Ja/6INt/SUHlboTXUnObY+i3O907aFUDusYDMDWQwWxIrtpvaOz8UdEECz9M
         jrps+kVUdxt+W0PdFFW1QvduHMV29JpYSQTBtTuJsm9zXlVBBIv1qkiMHBdKJDvVU4A7
         o5xZSn79Zy6ekA6PigvjUu7dmKGA3rGlyg1iht0p9NuCiyIbQP+jBMA8Ndf64O34rZm4
         wnV0PYJEW3BGWGfzgDtBvPfIr/zV6RHDWdhCwI4J2MeGbJJ+hXxmgVHhFmmu6ICRvQKk
         1Snw==
X-Forwarded-Encrypted: i=1; AJvYcCW8J53oarliyBf0oIKJMZ3hqdyciNjUTFkDBAM9NSUaMgzBXSTJ2eUuVDSddbEK7T4b5RzTqxTpvnSF+rg5@vger.kernel.org
X-Gm-Message-State: AOJu0YzS6xtvW5VLgcXE65coMSESoR0ZWsrtZ3+jPoa8yd84JamiR+B0
	JO9Gy14wPMEmsGEci6h5pqoEvGGqCP2UD0E3Hq3COXR+0U7PXMSgMlqnuvUz0sTNR3uskexSxuQ
	67523fMUwkpnBBsm86I9d6sLsJm0OTpnE0FjXH72DJFgxpXK8d1NFDQ2S6LYYE3GgO5d6AkyWit
	/i
X-Gm-Gg: AY/fxX7fqYFOuiQW7sD++bPPKK7w5nDgbq1hJXB4RfuY7H5qKku7bxTiy64Yab4bv3n
	WcOKOXtYzSWdMwaiEyk2OC2TVy8i7SmF2XaEoF+ay1KiwgsOK0clFw+pyUWJOZPIswUBhSWsCbb
	33Cghy9u7BC4IXOEhiI8CgzlljM7CJpMXZ1FK/xWU5tI6PFwJwHhpuE9z7MGJc59DlEDQ7jzvAP
	X8DqhO40ATUSaochn25bP5gVoX/Q0AI8xlS9GFVlDvRqB+ewGUt2RagN4FAFmPRFjqPUQa9QajE
	yTvj0mz6sDnw0FDuDd36DBatreBWhnz2Of7R8uhsInIRzZa48hIU7ukNd88NAPxVMivpN2jk8/s
	nYod4939r764M9idD92x5NJyM9XNyNwhoI7WnHVUn2fPf3nZsAwMc7JuhGHCviUd6S55nNMYBjI
	yWj+ZKswAvgd1MDDxNpPmCkzU=
X-Received: by 2002:a05:6102:5124:b0:5dd:b100:47df with SMTP id ada2fe7eead31-5eb1a61e6demr4946923137.4.1766591757750;
        Wed, 24 Dec 2025 07:55:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEERFla3B6dDcluPaHksW0ojIo6+QZYY+sSk/hQdyYhKIIJtQbahJAM6fM9o+u9/xtIUoAfrw==
X-Received: by 2002:a05:6102:5124:b0:5dd:b100:47df with SMTP id ada2fe7eead31-5eb1a61e6demr4946909137.4.1766591757260;
        Wed, 24 Dec 2025 07:55:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b360sm45158661fa.28.2025.12.24.07.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:55:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, veygax <veyga@veygax.dev>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: Replace unsafe snprintf usage with scnprintf
Date: Wed, 24 Dec 2025 17:55:55 +0200
Message-ID: <176659174997.4059120.16151098492056445076.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251224124254.17920-3-veyga@veygax.dev>
References: <20251224124254.17920-3-veyga@veygax.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDE0MCBTYWx0ZWRfX6QOGx9w7qsPO
 bMCCBZU26svgRIKZg7d8p/JpRkrRvAuff68zqAQhTQXJyhvTBsNy8MAeDEu/HlEhweBvKBEWX8c
 /f67kjspJr1oCR8lmAkzswbbcZi6byHlZoHTmJuUEtewv/Jnyr3TQXoH184/3wMNjDvN73MKvfF
 5t4e7xQE3T97w20+R3CiiBK+fX5EeiXmNGjWneqiyc5lADLwn0OEiI5CtLssTi25ys2tvmC3jXq
 1tJNLJhA1XMigXxfoDMEZYSfu1eEodp8RN5tLSs4q/+NWwF+JbzMlP0a8V5+79sc6gDglqDK5TJ
 PCjCNZcthiwE7mnfSjuGQ9mO47Kpma5gtgvJCeLBymjIpm7KPyCP/tKst5z0118b0oZ1dIz0Elm
 +xJZzdK6TIrujzbJWTB1No+S6ObpSAgLgIGxt0kq3ZEfT+2I0KO97IjxmYjrsydZlMZmaBsbESM
 ZUvBeA5xHtrfKKn2TIw==
X-Proofpoint-ORIG-GUID: myzQsy8peFL68-AwMYzjM2_AzlE2Fv9L
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694c0d0e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=Sr6y7Swg9AFsQnQ4lA8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=gYDTvv6II1OnSo0itH1n:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: myzQsy8peFL68-AwMYzjM2_AzlE2Fv9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240140

On Wed, 24 Dec 2025 12:44:22 +0000, veygax wrote:
> The refill_buf function uses snprintf to append to a fixed-size buffer.
> snprintf returns the length that would have been written, which can
> exceed the remaining buffer size. If this happens, ptr advances beyond
> the buffer and rem becomes negative. In the 2nd iteration, rem is
> treated as a large unsigned integer, causing snprintf to write oob.
> 
> While this behavior is technically mitigated by num_perfcntrs being
> locked at 5, it's still unsafe if num_perfcntrs were ever to change/a
> second source was added.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm: Replace unsafe snprintf usage with scnprintf
      https://gitlab.freedesktop.org/lumag/msm/-/commit/66691e272e40

Best regards,
-- 
With best wishes
Dmitry



