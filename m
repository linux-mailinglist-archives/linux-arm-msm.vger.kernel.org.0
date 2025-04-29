Return-Path: <linux-arm-msm+bounces-56030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC261AA03AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 08:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA6505A2DED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 06:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D5E274647;
	Tue, 29 Apr 2025 06:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6XDVcY+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0494C274FF7
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909203; cv=none; b=aXvajdkmnZHXIxRYSh7SYnF8ImrdGgeSojl271tNiLiJWqpFTzCjoOiW6g6iuZJfafDs49gioZeL6KJv77N3nUOCAGAbFu4qFMjfW+k7K+n4qcIZSeYZpzE91B8SIRo/zxwBaEVMmPMsQ/5QOW5iqSDVKzAHIIB1i0EQSXqV94c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909203; c=relaxed/simple;
	bh=1pIprI0EO05HFaFO5ZwHNaOGBqkqOpeJf8DkIAD7OnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBvns2nvqlBO4oJyRxbLKn9hJYs0TRDuxGnG6u5fNY4gA/Dbaf2bqjygXVFHEncuD5nNEmqENOoU6r/0OOf7WUxP0XXNi49piGkKsKKjZiyX5RGQoszaKe8K9wFCpd9pYgS48zElh03uNhDezakaZrU90rjpF1XyISq2T+A8Kuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6XDVcY+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq5Fe015302
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DZu3TV8trj7jEXy9C3oxl4Sy
	0FYWykPDbiLWiHrWJao=; b=N6XDVcY+mrQT+m461o4bwqUWem/L+QiXXwUoTQT0
	lyHKLGcln/unMyGQcwf3WRs2L8baOoyGPxiO8Fi/7QY863ItKpelgREWLF4Q56DY
	a2y4pMer6xyrT7r6p+TKDcBBG6Yyfj5B3/+xfPSX+CXgBLj+VrNHcsfk5JHYW6rG
	0bQA4qxj155NOjhDwrUTJwVwUNCzpyzqoR4s2q1rTWv5/UL0JWpMaFZnnCOodCbY
	8Sbji9o/STMdR9CM3wM6C16DPPrgryVadXWag3uF19gcNf8KURm4R2fLwomWVN46
	8XbEMtYYzl9uMe1NEUhr/iq9Bha0/5C7U3N1Xo83+s6ZJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8htfmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:46:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47693206d3bso136556121cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 23:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745909200; x=1746514000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZu3TV8trj7jEXy9C3oxl4Sy0FYWykPDbiLWiHrWJao=;
        b=H6SK+U+gpNAtIYgz7XSWtOIwNvJR7SLttwcAjXP6RnVLqFd72ZrC/c/Qgrnz2F2W5P
         cPx1w6VCoqCMET+akKi2+2/u+UmiNAEfAFsdjn7ZOFq9LmwLEtTGYjIRvjVdisSl2tL9
         m554miW987dGrcoCZnabVMjpFiZRQrdzVuXo2LJzSXYcGSLgzSlBQ5iufBarBYnyjEuS
         hCuUEoQ8CYX8Lb5PVPcsraGtPgxjXU2m4Nz9LGN2TMDJdsbFG2D8lvWB8PiOMuccYfvp
         V9buKPBY9kBUeK1vqgCEVOLnZriQ/Ugc4pKbw08Cx6Wy/OTstJEhlo7tsFfDKWOvnNfB
         Ejhw==
X-Forwarded-Encrypted: i=1; AJvYcCVT2JQLAjTl293GOv7omSLzNPS3w3j1pNiLPHt5efNC/kur8T8MTuTDKiHQE6qSB9farhHuMfekbKiTfC0K@vger.kernel.org
X-Gm-Message-State: AOJu0YxCvEe++2Ym75wATfMk6kjZgaZ35CSrm8fD2mkH5pz2MOT6Rg3V
	BWK7ROGDpZe8KC8WW1kP6755R1ndBxHJ5DuAtzDGGEjczIXoHImTSuoFO8ymLKYJjuVyZfiI5dl
	NOnHA3Wv8uUZOgizPafhOaSQlrpiOs4h9RLNsD0jtn5fWXRLzJRmS1xvxSQ2vQcU6
X-Gm-Gg: ASbGncuXACMwFx3y0uyns+hW43+0pZS95yltwtyYznhF+bE9F9WACZTdtg9P3vGbuAT
	r44UczefOgsLJouTaYZnY4NbCOowbq7MaQY5T9mwniQxWoIEngmMagCXVSUlfy3pKfZk8Xq4AfF
	fMswq1jcWViOEeb+cXqF9bk1AbqiAjc23UUBumzDKSS71QadAf175mKh8ESsEkqYQnzoH7n3vGN
	9RH/ZoJAbOnVFyq9m+xIzGU/tOQ/N1qBZjWlKHBpizuZs4S2KMGYr0bFUodQ3CdJNL81wD1Nhm0
	cySxXDauXE/kphRHYOGm8T4ImwRsvNUpU+2NdRuLwn3qnZh5rP/UVOQ6kxckPG0Ijh2PPV2DLPc
	=
X-Received: by 2002:ac8:7f8e:0:b0:476:a967:b247 with SMTP id d75a77b69052e-48133562059mr203907591cf.47.1745909199793;
        Mon, 28 Apr 2025 23:46:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMg1rHdHs2/nbrDBu8fCMcRUEKSoFdhUgPQjOmgqhIt37Lk0kiYKjrtVvVlpe5Endpr+SpyQ==
X-Received: by 2002:ac8:7f8e:0:b0:476:a967:b247 with SMTP id d75a77b69052e-48133562059mr203907431cf.47.1745909199361;
        Mon, 28 Apr 2025 23:46:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d206b703sm22953181fa.114.2025.04.28.23.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:46:38 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:46:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
        chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
        Jameson Thies <jthies@google.com>,
        Andrei Kuchynski <akuchynski@chromium.org>
Subject: Re: [PATCH 1/7] platform/chrome: cros_ec_typec: No pending status
 means attention
Message-ID: <zjofw6fe5aznnqphtneccj426vqpbimm23kcpi3xts6p6zhftk@kjhrxvhanamm>
References: <20250416000208.3568635-1-swboyd@chromium.org>
 <20250416000208.3568635-2-swboyd@chromium.org>
 <6eeb7bca-6018-46de-a7db-7189d60c0942@oss.qualcomm.com>
 <CAE-0n53ypGBXAt3frrbfAsbJZEkxK4BCB0+3MWOFRxZ9E+6P9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53ypGBXAt3frrbfAsbJZEkxK4BCB0+3MWOFRxZ9E+6P9Q@mail.gmail.com>
X-Proofpoint-ORIG-GUID: S6yJMRFVacwuZMCpuXZhujdWBHTONilR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA1MCBTYWx0ZWRfX4XPlqyn7PrTC p/oECi2CMj1kTB/5nATASE4tJHBUcTrrIXXJOmVZBnT48mnUSeCa5h8IAsUTxTL5/YfhkQhEcQs wJOpkPwmUfblrMiYU8Wj2VpVA2eTopXFuogksSOmx9/Uf1PEdUshDkYn63uxGWw68MlQfgEaJh7
 mMTmrhPlmTNzoqqGcH6+dNGQBW6a+fR61oKdp47Dj7HozjvmzdGAcIyeW+X3Nx8Q02rMUsOsKOR GzddQTXMKwBiHLpVcXOYJ/Ood1vAXaNm5KrDx7TNpNfxn9ctQoN6hTButyCAwvDqJchhavHkuTh rzKiNAypGLpVwOqXowYhxx3dqB8yg69+/6GguUq8coXfP/FrxpYBOzoFC2+YiSr3kqHn5Av3WDs
 S9OEkj9Eq3FSZN6EecKMBDUdHZy3N468rGkOY7nXVgV8AKA3Rb7LuBSO0bwGI6RlGZiccx8e
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=681075d1 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=yV4NexEFXbUgmP4BVSMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: S6yJMRFVacwuZMCpuXZhujdWBHTONilR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=577 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290050

On Mon, Apr 28, 2025 at 04:55:27PM -0700, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2025-04-22 06:38:17)
> > On 16/04/2025 03:02, Stephen Boyd wrote:
> > > If we aren't expecting a status update when
> > > cros_typec_displayport_status_update() is called then we're handling an
> > > attention message, like HPD high/low or IRQ. Call
> > > typec_altmode_attention() in this case so that HPD signaling works in
> > > the DP altmode driver.
> >
> > Fixes?
> 
> I didn't put a fixes because it only matters to make the displayport
> altmode driver work with the typec port which isn't used so far on DT
> platforms. I view it as a new feature, not a fix for an existing
> feature, because we don't use the altmode driver.
> 
> It also seems like it was intentional on ACPI systems to only handle
> mode entry/exit and not HPD signaling per my reading of the mailing
> list.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

