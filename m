Return-Path: <linux-arm-msm+bounces-34435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A464299EA2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 14:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6529B2884B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 12:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39E21C07DD;
	Tue, 15 Oct 2024 12:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IZxHSXHy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D332F207A2F
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 12:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728996207; cv=none; b=hSqg05QGPNbSFm3/SY1kBOT6IWYzxJ5e3fwjNYCmWJmebGQy4cqksQLnQDtJRLbscqbbTXgIW8JMZtz9JXIfQEGYwGB7rLaE1ztB1We2SaOwQBY1igZjrWlRDISOlYC06+UCS9OEFuiwGKPSQVabNtppomry/hmWIMOYb2AKFzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728996207; c=relaxed/simple;
	bh=WsyoNm3Inxe+dgm35rTRKiOyqk27oY4gozorw47wODQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+0VyXFub5eDN8LW++Szr+0+GnzNMm6qC4aPdlm3Q5Orpf9hIJ2atzl/73xAlraPhGM7etT5TFTtoZN/vJgNPHMxBdFD7mTI3stOQUxaabf+ZOu0aMst4gEGzuP8/Us0zIMIHctURQ8BqZePBEXoKcuwjGCAW9uIsuVF5mRLivo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IZxHSXHy; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f6e1f756so2302772e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 05:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728996204; x=1729601004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dWAWLMerFNg7ziMX/kkTq0c63ntBQBUxjKKx6kq8y/c=;
        b=IZxHSXHybJDIDDf2sxo4LsKZbvf7sYMBbAcbSmXhMOe+75XckvTm2eM9NFuYaJ9srw
         SfboyF8OD6Us7fQES2CfM1/9bKrssNhw5iqBUdN/4qFGpKyoMrBH6vIsl4oV8P/eoAUR
         0fO+Udu+A6owv8DNdWb9m5nm0ABbmSs1JYCfVbF1tmOGntekrJ8XgZSs+t3AceYMBltW
         ohPPvKyBjl/FpoSE+s3XfEwycXsyvBzKwGDTEZ1bhl0rNMc0BQ7TGu4n4Xgcl0NrakTZ
         V2qxKVGEr/EgcyFrbTwk0T5wt6iUamYkX8Zzz8CO1yS4Ac8XveiWVN0kd5XRwLfNgE/O
         ugvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728996204; x=1729601004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWAWLMerFNg7ziMX/kkTq0c63ntBQBUxjKKx6kq8y/c=;
        b=qFBTTX1p/cdiqjdqo2ouKj2aPzZeWDx/3nqfGmAlQVWUGweAvaQOlmWWQDZcocN5NY
         L88JCqZgQCKzaRbWmLFhYVoT9QOyrhTf+W8KTQr0TJni1E42UDnQST62IJjfXOzVI/49
         AJmU/z01cfNJfGHrqSBHO+viA/zH5gJ8lH5NdiKzx5vZOEDUgAVMJNzUZSiuVM0k3Wrr
         3tgKYn+F3yqPZrj2qLwaanWXTXNAPiFViKRAGlnFzroGUTVPwjyaHvkFzL28Ktz0Wfq6
         Ttdbg3dSj1Fq4zlMgBPLDBH2ZlDrxhNSOQreYukfMGlb+8Lj9U+1NvYgMMvswKkKlOSJ
         KP/A==
X-Forwarded-Encrypted: i=1; AJvYcCXBTmQ30nTTrkczBRy+roOVtA9KLaDnzGRysFMrShNy86h/TpG9APrytW0/4p0LE6vBwXTK9/u65XceJqU5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq0DMQBXTLxSjzbmo8P/MWYutgQdr7o88bsdwZ5VLUcy8ubR3j
	/ifbpL91vV6jQvJ+8bUkJGQV9TN+4ol3/umGt9j9LQczQ6/IbGQLO7T0oPmARMs=
X-Google-Smtp-Source: AGHT+IFDKiJwxfvgxARv/QcbzKu7J6NoBQCUqpvWt3aC3NqNz5nV6x02/nbgYhrL2lnm8ld/sOFK6A==
X-Received: by 2002:a05:6512:158b:b0:539:fcba:cc65 with SMTP id 2adb3069b0e04-53a03f19aadmr191156e87.17.1728996203869;
        Tue, 15 Oct 2024 05:43:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa8e3fsm161387e87.12.2024.10.15.05.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 05:43:23 -0700 (PDT)
Date: Tue, 15 Oct 2024 15:43:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: don't always activate merge_3d block
Message-ID: <3bh2bs5webxfwzuvj4io24cgpikgue5ukn4mthzlm4nqun54ge@quonfyry4soc>
References: <20241011-merge3d-fix-v2-1-2082470f573c@quicinc.com>
 <kah73euzauizsxvcrgmfsatshfe4pytgb7xe5iprtajg7abhsv@l7jdcxza5gd2>
 <0ca707a4-bd5f-4a31-a424-f466afa08e0d@quicinc.com>
 <pahfbstxa6snym7bem456npsp6bdekjqhnjcsrlpbfn77hkrut@uviaesubwz2a>
 <098b51a8-0165-4d14-9365-ef56ea2bcfae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <098b51a8-0165-4d14-9365-ef56ea2bcfae@quicinc.com>

On Mon, Oct 14, 2024 at 01:23:24PM -0700, Jessica Zhang wrote:
> 
> 
> On 10/14/2024 12:13 AM, Dmitry Baryshkov wrote:
> > On Sun, Oct 13, 2024 at 07:37:20PM -0700, Abhinav Kumar wrote:
> > > Hi Dmitry
> > > 
> > > On 10/13/2024 5:20 PM, Dmitry Baryshkov wrote:
> > > > On Fri, Oct 11, 2024 at 10:25:13AM -0700, Jessica Zhang wrote:
> > > > > Only enable the merge_3d block for the video phys encoder when the 3d
> > > > > blend mode is not *_NONE since there is no need to activate the merge_3d
> > > > > block for cases where merge_3d is not needed.
> > > > > 
> > > > > Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
> > > > > Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > ---
> > > > > Changes in v2:
> > > > > - Added more detailed commit message
> > > > > - Link to v1: https://lore.kernel.org/r/20241009-merge3d-fix-v1-1-0d0b6f5c244e@quicinc.com
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > LGTM now. Please clarify, is there any dependency between this patch and
> > > > [1]
> > > > 
> > > 
> > > No dependency as such. Both are tackling similar issues though. One for
> > > video mode and the other for writeback thats all. Namely:
> > > 
> > > 1) We should not be enabling merge_3d block if two LMs are not being used as
> > > that block needs to be enabled only to merge two streams. If its always
> > > enabled, its incorrect programming because as per the docs its mentioned "if
> > > required". Even if thats not causing issues, I would prefer not to enable it
> > > always due to the "if required" clause and also we dont need to enable a
> > > hardware sub-block unnecessarily.
> > > 
> > > 2) We should be flushing the merge_3d only if its active like Jessica wrote
> > > in the commit message of [1]. Otherwise, the flush bit will never be taken
> > > by hardware leading to the false timeout errors.
> > > 
> > > It has been sent as two patches as one is for video mode and the other for
> > > writeback and for writeback it includes both (1) and (2) together in the
> > > same patch.
> > 
> > I think it's better to handle (1) in a single patch (both for video and
> > WB) and (2) in another patch. This way it becomes more obvious that WB
> > had two different independent issues issues.
> 
> Hi Dmitry,
> 
> Just to clarify, the patches are already being split this way.

I had a different understanding of them, but after going through the
patches second time, you are right.

-- 
With best wishes
Dmitry

