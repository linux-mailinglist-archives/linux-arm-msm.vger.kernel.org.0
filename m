Return-Path: <linux-arm-msm+bounces-31129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AAB96F689
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 16:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BCF01F23FBE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 14:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05AE81D1729;
	Fri,  6 Sep 2024 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="n4evPdo/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0EB1D0940
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725632356; cv=none; b=Z3zSMGmf+SUBlK+D5L2lZwOWaahbwaPgMuitVg1wrvhs5iDZEglRSwI9Nafb2sOzDyqpUJOwFvNfGvqS+5ojo2bkgNEYwKWwoi45eAk/2LyZ7XGc4CfRUzhLuudn+CQ8vGcQdXfTtVLWSj5k1xLKgqe8KdcoHrHKm0HhaCOi/xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725632356; c=relaxed/simple;
	bh=ydzbIc3uchLj5j2dGGWHdkfMgZ21jHZerl7pgqcsxqM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uXXu10jb9n2TiLWCBMIB8JGjJUlwPYPhuaPt7U34CogWlMWM/LMkTVcDEVOLBZphtgKaq04BnFVzug3gzbcPDiZtdRJiJXisLxV0TelMGVhPN8KkkUWC2U+OLi1gUONr0BIDIbDaYvBLxrHIzbaRrfLJQZWBPVl5VlKor/6o4cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=n4evPdo/; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6c35ac3a7e6so11885126d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 07:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1725632354; x=1726237154; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j1E8xLSdMkIL6+Cg3gwnucUAdLjwZmRxTq6ZFy2FvIs=;
        b=n4evPdo/Wmn6fjMr/s2jHmBs2w+2RX+kekPTXjS8FzB8QqhX6uMqvkVdkB2qNMWqcj
         tIfu3e5LoVHRWby8lI+VXKqYlXdGKiFipfhQhiQ6cvhm5Cw6C4EXXjLvvtk5uGWL8363
         aYhQfiDKBq12nBh2th2bExk3ZFp1wcViRNggwgg7mIpML5/2gkIZL5NwcAWz4E2hqsjK
         6VHJMkU2Mc/bwdfyPMNbpnXaFIvllSqr1TJDCXlQrPp3Et95TLagbR+lALLOm9gClZE6
         WpfcE/akbu9OnoIIQBklsxCcs/jMel7clHrm+lNjDzPXY26YNQ6JI/jkKnNf6lysJ91C
         IlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725632354; x=1726237154;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j1E8xLSdMkIL6+Cg3gwnucUAdLjwZmRxTq6ZFy2FvIs=;
        b=rXA69rax8tEZn4RAZX1njlnjnHgiMeM05LkEWkHzITvk3oOCfiFbHvZTLkaJsXuair
         W98zupC3ug3ccD7G26xQ2o0DWaC/AFWT+/kYrfokUs7qsrYRGb7605+i/hKvaFFMRwN5
         u7rLOQN6+3UIfxvOPPkxGHvJIQp6v90uzhYiiCRvb6d/OnrytViNU9YhfUmwOK9y2X/m
         jMW+iQOHO1oRkH+KmiFDh3Xpn885kemYidGNV7x8oQOcw+pcX3HIxHbIP5phzld+blqC
         9aN7LYzcEn1wPdgkzOKMTkxXPFlIBsAhiS6La8/ViN2s+5odpK2sWN+x/482m4keLtl7
         78mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHHqWHQruC0F6Wx+XazdzplmBRaPHqIyeTSs2Be2J9NcXKbA2qZYcHGIuk01odZAKaExYEqkrII4y79XWq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf4+ft8Do3JUTFsikGY7riUOC/J6s40HT6iSjcjR3LtT8ARcfP
	52Bu33xNkjEMMVtVHbd+TEEI5LzC9bK2d63PPCHKCiYDQFNYEhJ6EPC3ZVTsCUk=
X-Google-Smtp-Source: AGHT+IHEBqO3pCdDbyTMj/U3zKiT7uL0UrW72faKRhBDrKq9eoAHWC79R55P0DMSO+XfrIBFqH2nyA==
X-Received: by 2002:a05:6214:3902:b0:6bf:75da:de1e with SMTP id 6a1803df08f44-6c5283fac49mr34355106d6.25.1725632354319;
        Fri, 06 Sep 2024 07:19:14 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:9cac::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c520419eb9sm16972586d6.122.2024.09.06.07.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:19:14 -0700 (PDT)
Message-ID: <149c25c05a5a59890ade38fdd4c8c0b65c13a916.camel@ndufresne.ca>
Subject: Re: [PATCH v3 00/29] Qualcomm iris video decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bryan O'Donoghue
	 <bryan.odonoghue@linaro.org>
Cc: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>,  linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vedang Nagar <quic_vnagar@quicinc.com>
Date: Fri, 06 Sep 2024 10:19:12 -0400
In-Reply-To: <xwkibtfakensuzrj4ycmyh4nqjr4nwkgqr63og7n6ejiw3hjqo@rvl3hhznfftx>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
	 <3a62b4cb-5c41-4c76-a957-af8e594ca8b1@linaro.org>
	 <xwkibtfakensuzrj4ycmyh4nqjr4nwkgqr63og7n6ejiw3hjqo@rvl3hhznfftx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le lundi 02 septembre 2024 =C3=A0 03:02 +0300, Dmitry Baryshkov a =C3=A9cri=
t=C2=A0:
> On Sat, Aug 31, 2024 at 04:18:35PM GMT, Bryan O'Donoghue wrote:
> > > The result of v4l2-compliance test on SM8250:
> > >=20
> > > v4l2-compliance 1.29.0-5239, 64 bits, 64-bit time_t
> > > v4l2-compliance SHA: a1ebb4dad512 2024-08-08 20:00:17
> > >=20
> > > Compliance test for iris_driver device /dev/video0:
> > >=20
> > > Driver Info:
> > >          Driver name      : iris_driver
> > >          Card type        : iris_decoder
> >=20
> > Hmm, so this is decoder only ?
> >=20
> > What's the intention here for encoding support ?
> >=20
> > I've verified your results on the test branch but I just noticed that s=
m8250
> > with the iris driver is decoder only - whereas the venus driver does bo=
th,
> > which strikes me as a bit odd.
>=20
> I think we all have discussed this during the review of the previous
> series: complete driver becomes very huge and complicated to review. So
> the recommendation was to submit the limited features driver (decoding,
> 1 codec) and get more features (more codecs, encoding support, etc)
> after getting the Iris driver in. Of course sm8250 support in Venus
> driver will stay in until Iris driver reaches feature parity.

And demonstrated backward compatibility. Just mentioning, since flipping de=
fault
driver could theoretically break userspace, and that is a big no no. As
maintainers won't run your HW, it will work on trust, and users report. But=
 you
have to be convincing.

> >=20
> > Is your intention to publish more patches to enable the encoder in anot=
her
> > series ?

I think this was the real question, any reason not immediately replying ? W=
hat
I'm hoping is an answer in the form "yes" + some ETA.

Nicolas

> >=20
> > ---
> > bod
>=20


