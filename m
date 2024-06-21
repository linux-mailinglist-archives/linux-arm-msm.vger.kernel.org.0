Return-Path: <linux-arm-msm+bounces-23525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FC1911C1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47D761F2349E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1E513DDAE;
	Fri, 21 Jun 2024 06:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oF6+mlTM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC36136E21
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 06:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718952527; cv=none; b=Lt9BE1NWI23RVLRrAke8XrhwM0lLRTP6BW6LITmL5bmAO6wQoBgJmZtlquvxPireV1idk//p6FoHw4wn8EpE6jnrIdj+XB96BOSuM2i5Pqqjug8KI53WN+uBHTPuNLf6+91qW2JysOWg7o2EbJc2dq8qE16+yNvoIt0bGiI2gOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718952527; c=relaxed/simple;
	bh=yXrJtMCRyJfRLypwP10k6bB9GgA1k9yco8lL6ps5GBA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=AwP1B9pmim9+Zvt8seKq24MxhIzh71OiZsZRE+xrDk/7NGpffs1ZYZuWMSjP3q1+KRbuVbwNRMZHdE6dqoe/Yrx8o1Rvdl8FO/9r9jpbTW61jqgAmmP/PhjANBixFT0XajOxTGH4hCfQbf0BAigVsl2ILwJbFxhBxGpEB0Qt8hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oF6+mlTM; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57d1012e52fso1800532a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 23:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1718952524; x=1719557324; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTPTYUIAI+cYSVFPE495y+YpJV2Jh1KvECgLTdMjZnQ=;
        b=oF6+mlTM32T4stcUXlMfog5Anze2/cS+y9DDlpkkauEy6CftyzFVVUAXsPfybiY5iI
         HBEsmoVfNZGObN3HNcSnoZY6wOPAnlcha1VbhNIPGpEDb9jLaqmcsXBHHxnmFbE63zrH
         HB3R9PJP4l9IGu2jwdMwbrDdlMijRPHesb1uFL/pOOfzVKd8tyIhasf5AaameqDo63Lz
         dI5rMmoOQ0fKlrU9dZL21SSGXXKV0HAXf11IK61oMTaKWvmEeYv9/N6+qUMYb0jhMbXA
         LMe9YyUXTdWEu7PnZtSKQmGXWzV8JN1SF12w3oTk5gjn5GuYdtnWtx6JkcvY9Nra/1O1
         g2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718952524; x=1719557324;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WTPTYUIAI+cYSVFPE495y+YpJV2Jh1KvECgLTdMjZnQ=;
        b=dBizcvNI+v09dWwz9xP+ZiYkM8p9o3w8DFJ1XWSEmQ46kSNcGwqSfnb8M+1L8a2ngy
         nOffpD1hTFahjxh7bwMYf59jgBW7fUECu+2EOYctxKlGkhfhwbl5q/LSUvUmCC04n2lL
         kvqU/q5J1Dp5rq1OO/1+4HqhvlMdSLAI/PtDZl1M+76b1WEtKWxE1K+3huMNR7U+amu/
         sAtiOR+uk6i+pihcCQYBMoF+Q9B64e3erkKwliigFUcdmn8mpfmyj/A2L5skzBhrPiyi
         bJXvvEphWZZ4mj/He0Ubts5BbFfS8hb/O8v8hMZVqQ4IL1ax1wFfwC3e0s3yukgLuarx
         KKNw==
X-Forwarded-Encrypted: i=1; AJvYcCUpOQBPw1VpXlXcRx9e4B+A2zt/4uRnbr9xDGqxVmBF7cGn+dpKxGNGN+t6OCWI3dZ1LKDp1xL/h0JWX2F2bZ6YjpTLCHS/tCFA82PdsA==
X-Gm-Message-State: AOJu0Yy3KcXsBD3s7bD1pesDTC8atnYTS0WARtT2vGWB2nHl/TgavmeL
	r11RrzavdUMNfT9/R/NXIJ7COBCboOSFlb7X0qnb2sW+0CvXQyIg1emvl/Bfwpc=
X-Google-Smtp-Source: AGHT+IGwrRaDa7rYvqZ77QTjkvkgem4Yvzeueo9WJucioWs1WL0pxaLkCCk657dD88oHfEueksJ/vA==
X-Received: by 2002:a50:930e:0:b0:579:c3f8:591c with SMTP id 4fb4d7f45d1cf-57d07e5f0f9mr5559105a12.18.1718952523797;
        Thu, 20 Jun 2024 23:48:43 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30413446sm509122a12.31.2024.06.20.23.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 23:48:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Jun 2024 08:48:43 +0200
Message-Id: <D25HTBIFDM42.2W1WGS8HKTHTF@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Rob Clark" <robdclark@gmail.com>
Cc: "Marc Gonzalez" <mgonzalez@freebox.fr>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Abhinav Kumar"
 <quic_abhinavk@quicinc.com>, "MSM" <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, "Sean Paul" <sean@poorly.run>, "Bryan O
 Donoghue" <bryan.odonoghue@linaro.org>, "Pierre-Hugues Husson"
 <phhusson@freebox.fr>, "Arnaud Vrac" <avrac@freebox.fr>, "Bjorn Andersson"
 <andersson@kernel.org>, "Jeffrey Hugo" <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] drm/msm: log iommu init failure
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.17.0
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
 <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr>
 <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
 <CAA8EJpqCmu+TPmdCxwa84s+15inmdi6SeR5XQRVey56RKqdRuQ@mail.gmail.com>
 <717ee43e-41f5-4940-b404-c348812c84c9@linaro.org>
In-Reply-To: <717ee43e-41f5-4940-b404-c348812c84c9@linaro.org>

On Fri Jun 21, 2024 at 12:47 AM CEST, Konrad Dybcio wrote:
>
>
> On 6/20/24 20:24, Dmitry Baryshkov wrote:
> > On Thu, 20 Jun 2024 at 20:32, Rob Clark <robdclark@gmail.com> wrote:
> >>
> >> On Thu, May 30, 2024 at 2:48=E2=80=AFAM Marc Gonzalez <mgonzalez@freeb=
ox.fr> wrote:
> >>>
> >>> On 16/05/2024 10:43, Marijn Suijten wrote:
> >>>
> >>>> On 2024-05-15 17:09:02, Marc Gonzalez wrote:
> >>>>
> >>>>> When create_address_space() fails (e.g. when smmu node is disabled)
> >>
> >> Note that smmu support is going to become a hard dependency with the
> >> drm_gpuvm/VM_BIND conversion.. which I think means we should never get
> >> far enough to hit this error path..
> >=20
> > Does that mean that we will lose GPU support on  MSM8974?
>
> Yeah, that was brought up on #freedreno some time ago

Also on MSM8226 which I also care about...

Anyone at all knowledgable on IOMMU would be very welcome to help out
with IOMMU support on these two platforms (and anything else that
old?) in any case, since me and some other people have looked at this
(on and off) for years but haven't gotten to any stable or usable point
unfortunately.

Regards
Luca

>
> Konrad


