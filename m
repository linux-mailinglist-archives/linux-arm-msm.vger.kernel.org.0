Return-Path: <linux-arm-msm+bounces-60666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 920FCAD235B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 18:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71EE93A2A2A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 16:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4D92144C9;
	Mon,  9 Jun 2025 16:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AeebxVQI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ECA2AEE1
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 16:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485242; cv=none; b=rdBTkFXSdbegI17MXEVkxvUuk8+TCGbbu+YyQyN89nA0MiAU0vhVW+OKT8o6VGaZREpdZW13gwWMZxQoyosG+bj0ZH1lQCszHoYVoDuJPewY3OmI/uigk7wY7y1/7353eZI2PfKi4Tb0VY1eE4CZ/+nFW9YfBqu5/nwvMXUJ6Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485242; c=relaxed/simple;
	bh=sxDoAzFVJdKVoCx+2HvwwQXAErvByDX68UtIBeOAd5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apx6PhcZJYrCr5988+0fKKSJ9nezvS9OsQfJF3hItytcLzFr1R/lcv5DkhDvX73zREdSo3P0ledWlW1nBptFCcBKUmde3QcHJVYIh6nZKajkGpisAgzzoxg9ZfQKENkZ3+P8UZGPLrvPiH/bqdDQzxIqhWQGbFnNXYI5JY/BGCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AeebxVQI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599S2xR013230
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 16:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+qUNrYBBdbGS3K588n15a3kY
	0CudgwuLNgaq06xok2w=; b=AeebxVQIFSYXIjUw8volmoUkk0g7/rGSysTwCnRp
	F+v9rWYratG5A/8n4mAE9aCLxhFJP2Ytwqt6HnFa0Rlrs8IGFJHEEsmNoRPbOeFD
	h4OuYziaGv6R2f2+LYzgia6EYoNs5DZHdSzFj8h4VKE+5c/unmeNES6LSzE2W1CJ
	QwSjGP3nZVobIsI519w6kYg/qYNHKH9hVvduugmWAFXK9aOjg7+RUryvorWbAfwW
	Z2eJTNPQ0VX/0OPJ+CGXJwRR7j8giOBTfgiWOxOLAgyTxGO1DXRfllBTfIrPQ0he
	iJ2VUjqNkrk2AKEr/9PnGZuOZPbnpDYf0CY2xQnB89YLZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11xrv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 16:07:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee990721so1140039185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 09:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749485238; x=1750090038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qUNrYBBdbGS3K588n15a3kY0CudgwuLNgaq06xok2w=;
        b=VJnCkCiXy418Gjq2r7TEw9fwndRR18M6uE0DxNr4E90Q5odqDQAfFokIJ0iJJIR7jq
         ZLrYK1dMut0e6APAjuwYmezM1yGptV+SHxKM7Gy/cazii/O9XWIx0tKzMtbxKAaBeXot
         slyIcIjRwPtcFEeknxzcoOnio5WQBhHOj9LiVn1D3ifYUViRoVUU39A0ZR7W3bn+/vFG
         6slhhYRa6tc59fF6L/ygxE2PKfDcLcPrhT2jKewNkYrgXu1qHMgysp0BB92+fOlC8hWQ
         mNm/UdsvtGsTUuKeJnTkIr9K9zA1XK7yUNh3WDy1cBqGPCFVrM8HVn/qWmpPOLzTCs6m
         3gnA==
X-Forwarded-Encrypted: i=1; AJvYcCVSQWZydBmJ/j1JDyenTKWTbLMX4b1IY7HdhwuXwM/ySoD4A6wfr4ti0fmkL2bVskk4tgkiBaHyy+gfxEV4@vger.kernel.org
X-Gm-Message-State: AOJu0YzgJ0CLBdJ0f0z1gda25Ln+lKLUKGOoRuf8ZsSi/sG429PpOelc
	tXbNf5BwScM4STVrRXt2L011Cns/QwZ43jmZAUO9AS1nagJUl+eTs5evbIFhVaAAME+yuo6VvGY
	bjs5C3J143TYCcZkGgc3PNVeudeG5/OGIqAz0q2FDI+XQi5r6K0ou3SfS3fy3sydpPPyU
X-Gm-Gg: ASbGncvhbOwfZuYfw0d+339mPEMJW1QIYCr1N/puorMpMcUhHPrxXqn4t3aL7CdNoVe
	8MeKO7WyZzNq0m6NwA/hRX4X1r7VjNPhvr+tl8KBLRJyDMEEWtvtyPOh+IgdtaRqRBZZsxGoZ2q
	dhcbjoaNMwnsj8GLeIOBI+rQF8q0H+PXseV92G9M0XaB8Rp28Fu6EkP3yOGGhfXDRzk2PhnSTya
	38NkUF4vXME4KFBFJ5cYMV5xyPjb9Q9Hh4CWdmL4+FJ2OL0hLvaWXYiHV519XI+mdwzLsLAlk4X
	kTPaFAMHfg711JUAXhPO2ReUXy2spMVApEeDXWA9d/AaHHcwfRaAkQWPA3TQy2hzrIsZrsSAFJE
	jbGlEASxb0g==
X-Received: by 2002:a05:620a:4513:b0:7ca:cd16:8fcb with SMTP id af79cd13be357-7d2298d8a80mr1961966785a.37.1749485238171;
        Mon, 09 Jun 2025 09:07:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVYJSeoW9tp8i95NtJeZMS8aHF8ENwAwCrE9FAY1YpPN3brqQ/9Ah8IyaKKQghe8Xs6Opplg==
X-Received: by 2002:a05:620a:4513:b0:7ca:cd16:8fcb with SMTP id af79cd13be357-7d2298d8a80mr1961962285a.37.1749485237767;
        Mon, 09 Jun 2025 09:07:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b347f2sm11561811fa.29.2025.06.09.09.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 09:07:16 -0700 (PDT)
Date: Mon, 9 Jun 2025 19:07:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 00/38] drm/msm/dp: Add MST support for MSM chipsets
Message-ID: <h4zfn52i6jpfbclylgfutdgow7wm2hyl4urtegwcqiw5dkhwef@cfw3fjus4tq5>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: WeamKAoR-HgoE9vuS44Jve-ZQXrxDLft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExOSBTYWx0ZWRfX0mkngObQQQ1P
 KJlFzkIAmJjJC5uaNBYBpjk2wVTKnql25IoHBhDo4tG9iM5Sl78HZKwaUXeZFC38BSBw7oHn6kJ
 RnJ1mDkPepRFg7MyTrjcOYjDE2/mUpHu1PBwO7wM3uyIBXMUirJsERsl7fEFQxVb7RHHSIpXVqk
 axpJ6xOvCYU9pXlNW81YrFrm7kKcGfpNen96Fo4wXWAipQLMecQkOx+FX5LWgU88kWGeVOVznBr
 5zvM+LwnecZ6kzyWTv1Nz1xO+eVNLRd2X5dKhbdfKXuHQL12wt+z2u/mZZsulhSc0mWPSyO1i3J
 8BDLqY/oGiyjdwfBOMCFH10LnZZ/zsyp3iIwDtcb/l6LU31WgXwM6kw800hdgt4RF9zrTDLlp7J
 hJjEwfcTtJASKTy+n9FHQbCsaOd5vACswGfrmbFezdkTQrFhDHdPQwq2C+dJk6qUOf8AmPsr
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=684706b7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9hUQRU07m4UGofkZ2RUA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: WeamKAoR-HgoE9vuS44Jve-ZQXrxDLft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090119

On Mon, Jun 09, 2025 at 08:21:19PM +0800, Yongxing Mou wrote:
> Add support for Multi-stream transport for MSM chipsets that allow
> a single instance of DP controller to send multiple streams. 
> 
> This series has been validated on sa8775p ride platform using multiple
> MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> 
> With 4x4K monitors, due to lack of layer mixers that combination will not
> work but this can be supported as well after some rework on the DPU side.
> 
> In addition, SST was re-validated with all these changes to ensure there
> were no regressions.
> 
> This patch series was made on top of:
> 
> [1] : https://patchwork.freedesktop.org/seriedds/142010/ (v2 to fix up HPD)
> 
> Bindings for the pixel clock for additional stream is available at :
> 
> [2] : https://patchwork.freedesktop.org/series/142016/
> 
> Overall, the patch series has been organized in the following way:
> 
> 1) First set are a couple of fixes made while debugging MST but applicable
> to SST as well so go ahead of everything else
> 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
> of the work as current DP driver design had to be adjusted to make this happen.
> 3) Finally, new files to handle MST related operations
> 
> Validation was done on the latest linux-next on top of above changes and
> both FB console and weston compositors were validated with these changes.

I went about a halfway through the series. During that I noticed ignored
feedback, missing reviewer tags, invalid or strange authorship / SoB
tags, overgrown functions, one line wrappers, etc.

Please rebase on top of [3], review the patch series on your own,
removing / reworking all the bits that can catch my eye, implement the
feedback, ask questions where you don't understand it, etc. After that
please post v3. I'll most likely skip the rest of the patches for now.

[3] https://lore.kernel.org/dri-devel/20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com

-- 
With best wishes
Dmitry

