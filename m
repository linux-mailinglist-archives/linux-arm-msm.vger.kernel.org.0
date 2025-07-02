Return-Path: <linux-arm-msm+bounces-63474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D82AF659B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 00:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E28F1C462D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 22:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E912F5098;
	Wed,  2 Jul 2025 22:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mm6wrDXh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D0E2E03E5
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 22:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751496365; cv=none; b=fhvc75eRX67/mMucfIv1mxWvTwkSdHObNjGqtF0zjI8QAiVzVaHW4S2JtBdNXWL4Hu0t38vVsTgaW1u5O2/UVbarSl3n+Y0DUIt7p+GZzhYzfyZXbIIqNsq9s9QJn2x4ijZD6JoiyrglfeNYR8lnQHfZbmDF+RnXesINTcA2Hr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751496365; c=relaxed/simple;
	bh=1yUDGo1zRlZ0feBKNAKXG6uhzKxCc7vwlwrd7niyOvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVQ+Zux5x6vB+dcXo4glo+blf/w9ER5NWIYBfS4lgj8SFjnV7gC11lTdmTivxaE9Lh5YDL1fAnVAOjuv8k+BqjyCDTN0Z7g8eF+BXbUplgAe0L3SrwMhCgM5tkD2IFqs30OpkwVCsBhU7mTCKd5+/3j8Q46nx238b+o09tbaGgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mm6wrDXh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562JZN0A020544
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 22:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nGM9DZwF/Fd/OQyKb81XdMAc
	CKZwqXE+v9fpqIkuHk8=; b=mm6wrDXhutFr3uHC6qXUeeftTGzqIOoRT77c+zOW
	KhrL5iogdPPtxctY+wOJyx/UCrc2keVFfwbWeRsMeMlVGpgsHLtg+cway7Y+7/mX
	1Fn33tizx/wqTgjlkVDDnwTdmVEJFgI9auaXt7NBQvF0YSHAq7Qp+yqrtparSEJW
	fpkAuV87++k+c8bWywdmd0yy/lkbLtvw6obky8xTn/GsvjIkMzs0CdI2BnEKfnZ9
	kypp792UseyoI7eeNSxLzZOBd2W1Kz1p/GkaKTMys6rWd38STbIMs+xarMeXk93J
	1iYsOlH4donFFrvzpib73KIdBqDScU5nBpzLrcBtTrrIHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn4wcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 22:46:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d099c1779dso680411685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 15:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751496362; x=1752101162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGM9DZwF/Fd/OQyKb81XdMAcCKZwqXE+v9fpqIkuHk8=;
        b=ZOLV6M1lSLdCsoQIkVRduvAeTqdp52gm4qUSvVDpYHb2xeFixBcPfPuhuuF6wcGiu9
         5akEVOB+jKI+2cSe/HulM7sZ8Rdc2i1ir1QvAdmccL/wIMvcPxLZ1Ne6fB0x9F6L079I
         cc6YTEmYZPpXpMa3hXVCzchc0TiyzAlhcvt22ZWicmoh5ufqyVgbbrzu601kXNMcUddS
         08c760skPxcZ5cf5ECcChDuTgfQVxsSETBRHCcwx0L2rRX+jix3mgJdgh9N54i/Ve/Di
         NOQLKKGMDdynLx9qDf1H9gXTmalaNxsbGB2XQHyH5g1/mblZZVsMsmmFVeEOwnSGfm0+
         CHcA==
X-Forwarded-Encrypted: i=1; AJvYcCWI82unPJJ6kgdxmncYRAJc2cJJK1N3pqWtsmIAhsU+rYDBLxtwK83zhrGYRNDW1yxAWiJ5G70jjxY3q5q7@vger.kernel.org
X-Gm-Message-State: AOJu0YwZVSSTcH6JGaeqaLEYmyQ1zIMoqjfS/AewTOy7z1usEdK29+4l
	91D//qN+AHuNL+Jdad38A7h70KDuvHxvINZq4hy+Bi93ocg7uCBFuBAQX4CtSlCSsR8zrXZ4tt9
	6rYUgRG0t15CHE1uL8pfDyhaDJjxyN0xgOLQoCwm6OO24xV6FjGz8HBOx8gaV/5H+kjGj
X-Gm-Gg: ASbGnctLyVsANzYU+3Oh/DN9/t+z3+e5gZO0B/Z2dZfaRpIq/B+7gWfL7wKg3V+04Dr
	/GF/POZV1ElRhAxn7RUbj8Yk0FsfFE8rNczpJe8Pv18LqATfT6D3vEzlWkdt9vjrf1qfZs9BIse
	sO+v0ZBBYb2cGeMoKYC056ieimA73Ugwdl6qJpy5issbuQZ3ouihe5FL8LmGGXEb5stn5Cg30wy
	orLhR/P6BKqBYzgbhtiXr41Xh+2YMz/87+D/kY41VJjXWk+uoH41vKj1qQxk/pUCfRwAzRDR5MN
	ppdfjgLTj3WnEahgpge17pDakckANEa1dYn5LgJuv/UizcapxH0tD7U+a/61+Wg2Fy/1DCJZdxm
	z4Y0ZBgIZWEsI6gpnOIsvPWs2IUToUkhekVE=
X-Received: by 2002:a05:620a:468e:b0:7ca:ca00:735 with SMTP id af79cd13be357-7d5d1478c26mr195295185a.41.1751496361796;
        Wed, 02 Jul 2025 15:46:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnZ1KfGDoGnAnKKb48QCXInkKCn1fPiOPT/0wf5tLma0vYWc3UfPox1mlLLdjDhi6HGr8ihw==
X-Received: by 2002:a05:620a:468e:b0:7ca:ca00:735 with SMTP id af79cd13be357-7d5d1478c26mr195292485a.41.1751496361431;
        Wed, 02 Jul 2025 15:46:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2eed872sm20589301fa.86.2025.07.02.15.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:46:00 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:45:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
        dri-devel@lists.freedesktop.org, dianders@chromium.org,
        jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
        p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
        rfoss@kernel.org, chunkuang.hu@kernel.org,
        cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: Make dp/hdmi_audio_* callback keep
 the same paramter order with get_modes
Message-ID: <roqsr25rk6psidxikgj6gejil2n6yne5gsbuvbnanhtpuqivj6@fqxazmw26hru>
References: <20250702111453.102539-1-andyshrk@163.com>
 <20250702111453.102539-2-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702111453.102539-2-andyshrk@163.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4OSBTYWx0ZWRfXzqVMn0uMXIbp
 3q9TUU7uONOJsrH3yvVfQ7rQANb2brTUZgLvJYgpdtjgfm0zgztkFS5qiYLGMjBiU+k9Qm9LfTI
 MgsVnBsf1cB++kpXf+tmjk5IdwT2Qbmm+XCww3zJamoLCa8E2uCIMp04Zos36iiPXc4EA/NacxM
 JMOy3eMj6Xq0xD6N/ZajQhL/AXBRWT1W4jB1amhfB1V5Wvv9FqjvgpGLv2R4RTjC8XdF9nLG+an
 uF+YcxtMKOwqnAqHMTrTDJCny15NHMnXIr6RAS2Vfcr4i1QSbRNCKgs+JA7+6dUC9zCMNSE+YHg
 YkMDpT8XYoY68jZCIQxF0X4MAmc1linn5eYEvuM03svNpLu43VPxahPRHCh08RCtL4pr/RJKu0A
 56/sJOgVunjv+hayOpkYgoMvoJzfOGVDUaWsrKzmF8t+LK8eBz9TAjAcFZVRW2ufQOrgXkNY
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6865b6aa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=ywvnwGVb1iWAczny1xEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: P5yj4dv297fBWckofl1gquEya3Vv206p
X-Proofpoint-GUID: P5yj4dv297fBWckofl1gquEya3Vv206p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=765 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020189

On Wed, Jul 02, 2025 at 07:14:43PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Make the dp/hdmi_audio_* callback maintain the same parameter order as
> get_modes and edid_read: first the bridge, then the connector.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> Signed-off-by: Andy Yan <andyshrk@163.com>

No extra empty line between tags.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>




-- 
With best wishes
Dmitry

