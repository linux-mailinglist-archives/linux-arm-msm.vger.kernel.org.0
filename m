Return-Path: <linux-arm-msm+bounces-31723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B000C978028
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 14:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 396C7B24A3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 12:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDB61DA62E;
	Fri, 13 Sep 2024 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LeY/29GX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5CD1DA2FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 12:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726230963; cv=none; b=tnEqgmGrVE55AztvC7E02Xghf0maPtUG5PKEEgZmD6D3TxV/zS5g+jvaelGOpKUfsIDt2fwnkehQOMQ9q1zSAX4TARLAZv21PfgIOftLUcTQsQfHRy0AJVFS+hhdTqQAcpsrH1sms2i90fWA2vV8o2Rb+qv0QtADmgSgu3lOniE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726230963; c=relaxed/simple;
	bh=KfeLGnBWP9LbOPrNBGyI7Jf+uKLJYPunvVFQGKJZS/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I67aXaGuFnvi0E8jUWkzRRtO7klZUu6+y11xKf91SnROK0JX+GKqyXj5ltj89gDlgqkRcns5PtRM7F/fd4DVLaQ1mKy1NR6uv3QQay1tLzO9TY8afcz0rNUcLyRC4wFm4ptuygHxhjIVYZ0ktH2ubTPgy9vxT7HaV91/6Fery8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LeY/29GX; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f752d9ab62so10266601fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 05:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726230960; x=1726835760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pFD+Jn1Q6UyyyHIKNy7SReGKO/WcduqlM7d7kkw/yoQ=;
        b=LeY/29GXzswU5uGJRwm9hrs7UTYyhwnrSrvNn8vdiX8cQQ+brA95VtswS2gkeSLVHz
         QOVJHbkXYY45eNBiODk3q/SAs21ytJTb5TfMF7O2+Qgs6vwMaNbf//2uHnJxLQwJhOUM
         nTjuG4Qmq6hdUbtYEGQXgFkMhxaEo2g2GNgR++Bj++RsI8GIVdp3rAO7WKTxegSs5pS8
         pC0fBQFcUuma8WdEpk5fkXi1/gDzmvdR2go5vNterreGsfJgje0o/sX6cEAyu0QLJkPh
         621ZB6IMINw0G8qSR2lXr8AwhzM4qRDr/EteqVaAvPDsw3gEy+3pcdZ/OUvZmcuXGzpz
         3cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726230960; x=1726835760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFD+Jn1Q6UyyyHIKNy7SReGKO/WcduqlM7d7kkw/yoQ=;
        b=Z3RoKcP1o82GVRs79DWbsHa5jDplaLtA54Fgo+6X2Zkdt3Wd6TpPsWSnhoSsPRejhM
         dbe35A+c32J9UYbrUihIt3r+iCWd9iRESqwALZB4MLFuMIJp+iJXQFZCzu+GPokDNXoN
         sJgiL+VqSpWwU5vVTAc7e0FnhbXVNSAEXAzGavzC8Umya+S8u5quBjQC66mlkSCrmtXP
         AwBCG0ny6Kne+ayDfc12iNjppFxsNu/7Lf1oZ4/7uMDjtgND4+MYSlcR0qL7qf+dSWsy
         OvrUXE0m/PcY3ScCDwIbWN2dZZxR1vv3NoKwBQ8u5BaS5OLvgfUeFBvBAJniclvdK/ft
         Ac0g==
X-Forwarded-Encrypted: i=1; AJvYcCV9jKztPOLW7dAaphFnKUswa2DiRH2ra7FSQcLrpzqrb40kvj08QSvQ9Rqx/DL7FJZNZnVHiCkmZnZBymrE@vger.kernel.org
X-Gm-Message-State: AOJu0YwFXF3htdy/ik5Z81qlpGyoAF1Fax9lZ6NxyeryQHB1r78cqltl
	9GqpbJOPMJS8JKOpTq3VQaPgme5YoA8c0IEBXtxd7EgMxby4tPAkZSUqgdRzTT0=
X-Google-Smtp-Source: AGHT+IGNesu/TPONWtHH5WBVmOcBtC92jiJD8e2sxjheoT0Ix3+hqei4gExaNhCLth4BCHluhR74bA==
X-Received: by 2002:a2e:5119:0:b0:2f7:52c5:b75 with SMTP id 38308e7fff4ca-2f7919044a3mr12114511fa.15.1726230958897;
        Fri, 13 Sep 2024 05:35:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75bffc9d6sm22628751fa.42.2024.09.13.05.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 05:35:58 -0700 (PDT)
Date: Fri, 13 Sep 2024 15:35:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
	andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org, robdclark@gmail.com, 
	quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org, 
	airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, 
	quic_parellan@quicinc.com, quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, quic_riteshk@quicinc.com, 
	quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 3/5] phy: qcom: edp: Add support for eDP PHY on SA8775P
Message-ID: <f6pyasnn34ufvrphfwiskkk75nuzbcjxqz2uuurk3wujubfaal@nyktpvjiaonn>
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-4-quic_mukhopad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913103755.7290-4-quic_mukhopad@quicinc.com>

On Fri, Sep 13, 2024 at 04:07:53PM GMT, Soutrik Mukhopadhyay wrote:
> Add support for eDP PHY v5 found on the Qualcomm SA8775P platform.
> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: Fixed review comments from Dmitry
> 	- Reused edp_swing_hbr_rbr and edp_swing_hbr2_hbr3 for v5.
> 
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 33 +++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

