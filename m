Return-Path: <linux-arm-msm+bounces-59297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBBFAC3064
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 18:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C89A54A071E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 16:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEAB01EEA49;
	Sat, 24 May 2025 16:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiHZ9HNV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5517F72621
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 16:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748102782; cv=none; b=qAu9//rBtj/Kn3RRvy3DTR7fFtBFRPXHupu6fn0r5JQsPWCppQyu5MLjtIr2Xuxm273VnClH7+WU/ZUFOsHniWFkjRyyzHIhPtmzjxELKsrvqlIAIOi3lS6FEHbcgBcOjrSkBCm+DtB/0lTzAp8g1EcHOf0HGZV/1WPjZIm2EVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748102782; c=relaxed/simple;
	bh=9q/JShL3By0t4leek7AotwidoLPZPL0RwLW5nGVe5+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWVwIDZOhbnMDuvdtHnf/XYvOB3087DfYxwCtwRFJeG0pKBG8lyjGlboi7M9Wz1FA+g6R0jQ+yUFFxga0/D2gTrJ/AqstaNEmL+TIeG1ZSFraVJalsvEtFjfKwZBAfa9uRSvZhRA2U57PI0hikhwVVMYjHYq1d/aCsxbSfgdpyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YiHZ9HNV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54OCj3YX007663
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 16:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qvWre4NwLlEhheV6UhBdS9zth/I+k8wEV1eM6J753YQ=; b=YiHZ9HNVNtH2gNwj
	7WHHK0+apf+0Cv5/v/qmyCUN9D+064lld3QxPE+Vwa9CQJuMA/BuTVpWk2+zYm2T
	HnD5pBh+zjGNoP0+roqajSH6MavQ7foATxv/NO/n23QsXAR82cNrrGADNZROVztX
	XNg2DlY9JxD7phtbjJvIyA2FnVN4EecmdvIzC+cEGOxIvOB0jsIGjnrX+Ejg0KZw
	u1/FeogRIr8p2j9shvPtcM1g9637N5/IIadz6nRtGhu/gaE1DVcinUD32PDEYBxm
	3AMRU1Wmuiik5VWibR25IHW1SIOlgMFwEqUIpeb9f3S8cnOErmNwoxutD2QsUiq/
	eEp2dw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3ths1um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 16:06:20 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-706bf40bd8bso9696137b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 09:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102779; x=1748707579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvWre4NwLlEhheV6UhBdS9zth/I+k8wEV1eM6J753YQ=;
        b=o8OUHJlmYRGluj1NVf+Jtk3RjP2Ga7RpsEddWeEzGPyb5p1G52QY0sqi944OYUJPbh
         2I/lUYGoMAnut9f9U+I3LoZHbamt4VoeKocdapGw5SxHyzoOAOdk7XLxLIjDBU400V+l
         T3XS6hrY+q9+5vw1XWJyG4laWP9avRIhX3BRt9/sUidvOKw1tFLSScq+CgEojf4VMuFe
         nHO+ekTnEAnG45fCv8616ulnQklctNlv0ksHhkDtSV6/uasUIEwYA4XQP1VcAYfVXc9O
         t3ayUggztqY7qWzZMH4KhgkPUcFhcYLVV/18c9bS2JXDy65lXm6VtmGSiEeHUeWsqYT+
         DNGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUES1tbaj/Kb4fQggggq1LJ79wHXCX5VxQkAldtPNCn5UTcLYk2I+SglqSvM1JemH4UWE1G4fk4w9NNTvH8@vger.kernel.org
X-Gm-Message-State: AOJu0YySbySDL4ggulOb5ZyNCMMv4rZLLm68tbno5LdeMb/rK2r9yHtq
	+ZBw24Ot5VYy5mA4l0hFEScCuhI9bjvfnUp7CcHqTvcjw+924rSZftreM8vAzdpCsOq754My/77
	DBxehy0jt2nkgideZbLbtOeEGzPOjWuRy7rIqE3YjRkGELwDcWAm2xTVNQn364whNyGrTsCREWD
	yzzIxhIRKFf+IrbsRtKNjCW1Nu0gcC6nqtXCqLI1ATWK4=
X-Gm-Gg: ASbGncvv85dX3OWOVV642qq7FDCYcd5CgWbTDEl3YG+4cpCCKgWXbwy+DhTDBi+JEo/
	eHWf6FWH8P+9WkFK8xnxd4MDpKjyR+5sHYj+xz1KZ9jQgxs0tOw7l+k3n5Pl3DyVZzl2EsE8=
X-Received: by 2002:a05:690c:6710:b0:70d:f53d:dd34 with SMTP id 00721157ae682-70e2d9d50c6mr27825947b3.20.1748102779181;
        Sat, 24 May 2025 09:06:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4tL39voPqdTiKIP3IIIX1ysehsTY0iOqhgM4UabaxxGpMrBca877TkCTIF4JkmyrzRULHgkdJPd2B9DdtaSI=
X-Received: by 2002:a05:690c:6710:b0:70d:f53d:dd34 with SMTP id
 00721157ae682-70e2d9d50c6mr27825507b3.20.1748102778853; Sat, 24 May 2025
 09:06:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com> <76xrcy5lvic7mucwuph7a5mgq47atuoocukanjf2q7g5ov6ffa@wbfks6f4hvpk>
In-Reply-To: <76xrcy5lvic7mucwuph7a5mgq47atuoocukanjf2q7g5ov6ffa@wbfks6f4hvpk>
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Sat, 24 May 2025 21:36:08 +0530
X-Gm-Features: AX0GCFtYDaH1Ic7QEuPAQQ8ozFwzgT7xoanbWmVWsm-9FahKFxoR6k6aeF5-CQ0
Message-ID: <CAHyS93o+zgBK=zP6N9O+qvKDgPTe+OWtpp70D5ciYUfQyqAf7Q@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: msm: registers: improve reproducibility
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: OxqbcjEuuF6o-lZh7T-we5DtNo8T4ppJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDE0NSBTYWx0ZWRfX1f4Bub7CmmQk
 8WpHqFcQVgdZ0dDwM4GQTisNkf1mGvZ++HPFYEcX5Cs0JSxWobQLSDf1Ka5hBYCh158YuaSxp6H
 In0Mhe+RiYBKcMsinkRwvkL1Km4j7q8pGWmMhiWceewcURCl4zouanBOgPIocwpRtJ89ZxLt0Bh
 CZR2ewvFdawGBpxoVc7JlBWG24cSznJrFrJLjc59T7fKFhhTpmR7qJXtgoGpdRLBbkAIcCr1Y2V
 mfR6jkRN35hbs+ZdvTiaMqkFhCvZbsxdRG+kph46kcbBDyTvOQeeGUvqYoa7UQAt//HMii6B0k0
 hSnfxh0oMdU+5UhsPHrU3YYBMtGcH7SLlmdmPYrTUiw/m1uiz0a8TaUg0cbpg1cHfcxF1Zz+I3q
 T/knOfpv+i+CP19U4UralVG5US55RdrDBMun6SSdUZ09POncShY5pFxTFZP+srb2ZH16hHwn
X-Authority-Analysis: v=2.4 cv=e94GSbp/ c=1 sm=1 tr=0 ts=6831ee7c cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=DbLYaGFL_cwN43_H1DIA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: OxqbcjEuuF6o-lZh7T-we5DtNo8T4ppJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=404 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240145

On Fri, May 23, 2025 at 10:30=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, May 23, 2025 at 06:36:16PM +0530, Viswanath Kraleti wrote:
> > The files generated by gen_header.py capture the source path to the
> > input files and the date.  While that can be informative, it varies
>
> You are not the author of this patch. Why did you drop authorshop
> information when picking it up and resending?
>
Apologies for the oversight. I've corrected the author ID in the v2 posting=
.
> > based on where and when the kernel was built as the full path is
> > captured.
> >
> > Since all of the files that this tool is run on is under the drivers
> > directory, this modifies the application to strip all of the path befor=
e
> > drivers.  Additionally it prints <stripped> instead of the date.
> >
> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
>
> --
> With best wishes
> Dmitry

