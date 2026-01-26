Return-Path: <linux-arm-msm+bounces-90505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHnFJ0c9d2mMdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:09:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 281608672B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DC01300C266
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F943064AF;
	Mon, 26 Jan 2026 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cpTjePBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41202313550
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421997; cv=pass; b=LGXP5P4iXEQewTNfuhtS72pu9ST6oBUzCw3QAM/TrawP5+gJOj/w40I2dE4fNQesQ1a8eYOr0jLa50F9N3FfT1ZM50GtW4LOdKQyFr+X8s6ttSMapm3itfIxYOcCARrrgsXSZFQXI+Ri5wsL//eVHd3LQcM2dl4afzdu07zeLPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421997; c=relaxed/simple;
	bh=tQ9l/WeI/5nyh6dIopUp3AzhOz2swBfPl0sUm8R5bI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6UyxfQ1AHX/0Oc9QA82+Sq252CFnTmu2OFwzcoPYs2Hv6kBJV/2WVBk46CT0BAuI0vn8nU4zF3R8sfgMdii1RkGi3V5jl+LEDkxBOgnP6M1dmqoDmVf9F6kxAWE0pgUhQkxU4btzbGZrJf9tcElvYg7uuasomMhJXEOd+i4rSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cpTjePBI; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64969550a1aso1370018d50.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:06:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769421995; cv=none;
        d=google.com; s=arc-20240605;
        b=c+07pERFvcL5XTRrXs7s3espwvOKScN8/owZbGfbHffqxRhS3QZAsvcUDSQth+gjIY
         ITh890yZN0765tAuobDFnCSroTrpdsAD8RxjdPPUOQmPaIG36e7BexMLvOD/zDBg7osD
         0znibnlVuHcymWWcKG1TmlEGjyuqknuWR7oqt02udiEfN9i8fHkPdy2Fh3hnexGO9+tn
         HjsCShRfnTyFA//8KuM35FprpPQSL+puymY15XzxBnGFlXqY485suUe5zZc8zz42wjnE
         XGJqmCHk1HPCoMCwAP7Y+xGRgfed8K8lms9fI+WjXoATd/NwsbrkFPwPS/jgQeRlWyeN
         FfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tQ9l/WeI/5nyh6dIopUp3AzhOz2swBfPl0sUm8R5bI4=;
        fh=qb+QEGSuBVfZmoiapwki5pLj/AvmOJGBeyul48e5+9E=;
        b=Qx+vNJhsPIpOlY7+uU225tdSXZR77sLMNT4MfRodgrBNz/MkYE3nzKa0TQk/ctulbp
         m+E3Z0ZolL1Ulw8TCe3CTbgjMFFymyvkqoB3v4TMhQJgqEQ9qVkaAlwB9YLWs91DmAFJ
         7R1rGcc2FcpxePIApNH0LkrFY9CiJsya2QZ1fHG/uLUOegZJyCIgNnvnp7wj5oa+m2j5
         wDDOVJxrDVZZdC/DOU4FGLIKH10zr0o7mENDvBO2ccaPU/cz9djtP2RQRDqgbBhOyRVM
         NxLSndU+ZyrrhBVx8FZnxpk9Iuko3Gt1A16c6MYKre41+E3L/B2X12+c4z7CIALK4J6m
         Kk0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769421995; x=1770026795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQ9l/WeI/5nyh6dIopUp3AzhOz2swBfPl0sUm8R5bI4=;
        b=cpTjePBIKeA0bsbaQT6GJ7sig3pavjIrmsIFdBZwC7YgnN2XOC4xEkm18EOpynD5n1
         zL9ubZjs7Qn7uM6+eFtm/pJwwGOaPMiLytOoYb2/g4Km16wOq8hMjbGlaLe+OZQ5Vsac
         R19oBigfQbFwdhzrxLXzmO9XK465a70tKSoVUO62TT07TwLc79yTv5BMu/6igxQdq1Sy
         f8Gmn20shNyWDkiaCPMljuClS4aMWKZxMXffwaER8iEJnDwObdDxSvE5sTEH+yNxb4VX
         71OeWvoCXyNKGT9d/FnPbgvEDKVELGAVqlK/PB7JJ6ELelZHH83xyILc2Nu+YSHHZU/w
         l9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421995; x=1770026795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tQ9l/WeI/5nyh6dIopUp3AzhOz2swBfPl0sUm8R5bI4=;
        b=JEFjtJZL3p+ETsYJuh8Gsl3JyRvShpDeSPy1g+sS9LOv7uNg8berz0/dwamQb/jwjp
         7zXEVGaR8sFdeXi1lFSrcm0cm74J4m0M2EhknSSTFXTrXxIjhANx1Tc3W/QkKFjF8wVz
         9pKw3hu7MBWpyG/VTGpmmg9C70sBjCFVjyJy3FE4Xi2+2UNOKXsOu5lWYigx8zY0CFw1
         822IRqFh+MWT65GGEg0r+R13g7B4vZiSTjR67UG7H9T2XkZaxYmQZM5UdBDKwTqH0TE4
         ptLBDEqRbNI4nUsmGPHmZRvhwDOnakqcFwYJYjD6Iuw0RB/OzvQ2yylTZvzLXR2m4p1N
         Q4HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnwKlXNq9R3RMc7uw3BZGXyM0mflGp/AK0gPNZ9LQN0eg61H1VebP4k5T9zye0hy7AgO2us3Xt4EvYOoeT@vger.kernel.org
X-Gm-Message-State: AOJu0YwKBbaU4Qeu9r0Aoj/HavlxCfoPJUNjKmdOuldNEhP++1mAKuZG
	XU6Pqndnrt8aHOoCVaF1eHnmziPe+FNgrVDZ0vrvS9/J7RwmPv1cXrxc1Ag7vKZogfZ2Ij/SVei
	zJvcZq8CmaMbZyZQopLWo7ogNPTbx+ixTlcPTpjL/2Q==
X-Gm-Gg: AZuq6aLtdGlNTUDknq9X3cecwerscOlqrw02WXUoU0MTJRnjxtXIOz+cVHaFEDmcamg
	hIl6md638Q3X04xZ+SWVDB/nUDZ1CT6SFgt9/1kr0ejqMqOwOXUc87fWLM2Y0xZT24Lhe5799vI
	CapxwKAihUy1+Dzw2qbpYfrd9BCT0NwO300oM2z6MFMGvOSvewDm4jNfbV3eJGqmHrH1GQ/NjK7
	wChoP8ISWT9A1dgUVYrU3/MTnQkCiftk1Tya2UP+KBXNrxvzdHKyE1CwHgmNh+1aGdK9kbHeru/
	cl0EwZlcFzs=
X-Received: by 2002:a05:690e:251c:20b0:649:4f44:86 with SMTP id
 956f58d0204a3-64970bd6222mr2249927d50.27.1769421995119; Mon, 26 Jan 2026
 02:06:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com> <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
In-Reply-To: <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 Jan 2026 18:06:24 +0800
X-Gm-Features: AZwV_QgRZ1B0Lknd_Q1FCCCl8eWQj_IXq44DYTqAuSmzS2FFL3bMdBwa8bSwm5s
Message-ID: <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC check
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90505-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 281608672B
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B 18:22=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > > > Currently, plane splitting and SSPP allocation occur during the pla=
ne
> > > > check phase. Defer these operations until dpu_assign_plane_resource=
s()
> > > > is called from the CRTC side to ensure the topology information fro=
m
> > > > the CRTC check is available.
> > >
> > > Why is it important? What is broken otherwise?
> >
> > I see. Thanks! Will add below lines in next version.
> >
> > By default, the plane check occurs before the CRTC check.
> > Without topology information from the CRTC, plane splitting
> > cannot be properly executed. Consequently, the SSPP
> > engine starts without a valid memory address, which triggers
> > an IOMMU warning.
>
> What is plane splitting? Write commit message for somebody who doesn't
> exactly know what is going on.

Thanks for the suggestion! Any more revise is needed?

Currently, splitting plane into SSPP rectangles the allocation occur
during the plane check phase, so that a plane can be supported by
multiple hardware pipe. While pipe topology is decided in CRTC check.
By default, the plane check occurs before the CRTC check in DRM
framework. Without topology information from the CRTC, plane splitting
cannot be properly executed. Consequently, the SSPP engine starts
without a valid memory address, which triggers IOMMU warning.

Defer above plane operations until dpu_assign_plane_resources()
is called from the CRTC side to ensure the topology information from
the CRTC check is available.


Regards,
Jun
>
>
> --
> With best wishes
> Dmitry

