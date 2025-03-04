Return-Path: <linux-arm-msm+bounces-50088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E11A4CFAD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 01:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FC957A6E11
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 00:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A7B23B0;
	Tue,  4 Mar 2025 00:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="doiRnlB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DEB523A
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 00:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741046793; cv=none; b=MT6w6FCS6iTNZDUWD1WxCvcsOBWgn4oWco/2LWzEAFvxr3neqLB6qSru/V0nAMrGgyplV0zmSO9FF0+AzwsmjtEzu2c4MXuwcQYYP4krZxyJlEMfln3YA5MUiY5lWjnulo30uenuPiREV+07X0RF5i3Mr26p32RkUOfGET6QVZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741046793; c=relaxed/simple;
	bh=DmvrjdGMkdYU50xfYunbbBY3nOOByhi9IRxms4LXfoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ue9nJPDuPK23JfOhLgSf+S1apUOcxEyKic1nM21QrPT9X5Gz+QoiekcgNR4F/Y1o4WljNn0aLAgnqJDsqB2615DQ2SyNLPd88cjdahepvupwAMvnUaEOU760ftV5Oe7P8KAw0vYoSPGdInACT5q2T/uYJ3N+T7dUkJgLoqjpQ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=doiRnlB9; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30ba5cccc19so26212811fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 16:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741046789; x=1741651589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VKg30KZBI8UiQdlXXrLUMK6Gz3/HQfqbDgR8mQQyzs4=;
        b=doiRnlB9Z4iBP9jJBNlZm39xhchJ78285KHWt2/cUruaZUP5MG0SOt5SpRd3Zer+LR
         YVOcQlo2Ja3JZ1kgm2isvC6HqvOFgI5TmbNlSxzJW7s70dqN/lZhVj1Zt0yGDFcfW+Dp
         lXFAHE/C27ojijOOPZo+1pQg31bz9cu9x5ZvkFsog8jdSEIMTVBvYuhDOF6zeFnS/pQw
         KVZHYW7DMyT26TrWISu9+4vPHhukc2BLEGmB2tkJsEXY9f4QP2RnxS2NyxG+4rKEO+BK
         ufJiq9TvrSsPjNfx7D9Kj4cbb6U0p2j5HnCH9+EcXaMZf1cFc5Msoie0EF5WXm0EVHEW
         DstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741046789; x=1741651589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKg30KZBI8UiQdlXXrLUMK6Gz3/HQfqbDgR8mQQyzs4=;
        b=wou6hwwUcJDcgiF/8s9/eAohUn0j0PHWTj3TfjUMf7BR8cZkmESiZSyMrQL2cFYGYZ
         o+qxnsnSozyUWPKVt34cDPuqBEeZlORx5K3aksj3EK/SOemlkl281OMOl1liffUt9qjo
         hGK43iJalzjwC1WO+rUhMffh+onbAX2h5oU5/mhnEvFjUqQtC1l/vEQyUVy3Ihj/Buxz
         yNpl2JLA8L3QiXuiIXDDJvzVZFTFDKFQIgENhBG134o7MQ7j/WB5Ild/Sqa6jOLM1QVQ
         wiL2YnLfbXxv6J6zSx9ySGOoovoGaViauKtBEh/6k++IU6Bx7OhwwKfKArRIzFROzWvW
         UGZA==
X-Forwarded-Encrypted: i=1; AJvYcCWy+1oUI+53bQC91h5EfoxCgjvoxMCPBdy2qJVguKM82bgtO+BtmokIKlyTpsCscwXyanSh+zB0vx18bZou@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt1PKplI9BgQ5sR/Z36A2VikZbwZMlGHEl8qrszHo52n/iwOd3
	8GhpPSrgdN3HBwdhQHyrZo8zNhP5WxbRnFU/4JrQtnnY4xB31cEw/YCs+UHBJJk=
X-Gm-Gg: ASbGnctRNnz7ihmNi70yNg0/Gg6wSSDi67EgPkFWwrLdDMaCXXBvrmVoAQTU+Fmjhpu
	PNtdQX/bB1pNFsqMrW2knhUVxuRQm6T/SmRdU6C8/uzLQQHk2uNzB6h5rSxA3Q4VTT+jJG8V4DD
	wdmQ11XH+pDC5MXffmaqvvAEBL50OgpLNqnA9KKxmEgbu8Jkc1zGipXB9w6vAokhitP297qYo4o
	g+I1WiQ5h2ghCunYjv0MT7cgyL3sKkV753TGj6ZcZ5yzJiEyb9Y9dyIoRoyWvHRLkuBejNWSXJG
	ehI0auxdTB8T3AKR4lGH37j1dqZFUVK2QD5umUol5EWb6voJIcds9c2noFAgofKKb4EgSyZOFU8
	c+YuSbAHwK+QZz+NGhNWoIgAb
X-Google-Smtp-Source: AGHT+IGSlqlzuwqVCa0rrjM071WYE9ZyASFIq+8EsX9D9f6afiXzOPp+esDpiRw3UjsklkPpWHb/Tg==
X-Received: by 2002:a05:651c:158a:b0:30b:8f60:cdb7 with SMTP id 38308e7fff4ca-30b932da780mr63732311fa.24.1741046789286;
        Mon, 03 Mar 2025 16:06:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc0ecd4adsm3799761fa.81.2025.03.03.16.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 16:06:28 -0800 (PST)
Date: Tue, 4 Mar 2025 02:06:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 05/16] dt-bindings: display/msm: dp-controller: Add
 SM8750
Message-ID: <cysgc3zxp7qx3gwrqmr6ntvmeyw7sodxjs2a5sil6qw3wk6oav@il6wvs234j5g>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-5-d201dcdda6a4@linaro.org>
 <aqpuik4zitdfuk4pahn4wyzxdvxldy4dcqjs3mhr6fqtxpoxhf@ssfzzbfce2nu>
 <2dfe466c-ad94-4683-a2e9-a49e77a61f4f@linaro.org>
 <h2shpen65r7v4in54avsez7qtlwojbt2cthyomqrsgs5ewprwb@bn53suqrzkac>
 <4e82404a-0ea5-4641-829a-bba666edd352@quicinc.com>
 <CAA8EJpoWEuqKkreUTu1gO-Pr=VFNNP_vBfNZpitJiJH728vjPA@mail.gmail.com>
 <8c0c0935-3a20-4c6a-a6fb-556e14ecedda@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c0c0935-3a20-4c6a-a6fb-556e14ecedda@quicinc.com>

On Mon, Mar 03, 2025 at 01:23:11PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/24/2025 7:14 PM, Dmitry Baryshkov wrote:
> > On Mon, 24 Feb 2025 at 20:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 2/19/2025 9:08 AM, Dmitry Baryshkov wrote:
> > > > On Wed, Feb 19, 2025 at 06:02:20PM +0100, Krzysztof Kozlowski wrote:
> > > > > On 17/02/2025 19:58, Dmitry Baryshkov wrote:
> > > > > > On Mon, Feb 17, 2025 at 05:41:26PM +0100, Krzysztof Kozlowski wrote:
> > > > > > > Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
> > > > > > > fully compatible with earlier SM8650 variant.
> > > > > > 
> > > > > > As that became a question for QCS8300, does SM8750 also support exactly
> > > > > > two MST streams?
> > > > > 
> > > > > v1.5 of DP (starting from SA8775p , then SM8650 and SM8750) support 4x
> > > > > MST for DPTX0 and 2x MST for DPTX1.
> > > > > 
> > > > > The DP in SM8650 and SM8750 are identical, according to datasheet (v1.5.1).
> > > > 
> > > > Hmm. This also means that QCS8300 is compatible with SM8650. I'll let
> > > > Abhinav comment here.
> > > > 
> > > 
> > > DP version by itself is not a good measure of whether the controller can
> > > support 4 streams or not.
> > > 
> > > Firstly, sm8650/sm8750 do not have a DPTX1 so we are only discussing
> > > about DP TX0.
> > > 
> > > Coming to the QCS8300 Vs sm8650/sm8750, even though the DP controller
> > > version is the same, there is no HW support for more than 2 streams on
> > > sm8650/sm8750 because there are no INTF blocks to drive 4 streams.
> > > 
> > > On sm8650/sm8750, only INTF_0 and INTF_3 can be used for DP. Hence 2
> > > streams.
> > > 
> > > Whereas on Monaco, we have INTF_0, INTF_3, INTF_6 and INTF_7 capable of
> > 
> > No idea what Monaco is, most likely it is some platform. Please use
> > SoC names in public.
> > 
> 
> Monaco is indeed QCS8300. I usually do use SoC names, in this instance just
> intuitively ended up using the internal one as I use it often.
> 
> > > driving DP. Hence 4 streams.
> > > 
> > > Let me know if there are more questions.
> > 
> > How many stream clocks are present on those platforms? I'm asking
> > because there is a small, but not non-existing difference between 'DPs
> > are not completely compatible / the same' and 'DPs are fully
> > compatible but different DPU blocks impose different restrictions on
> > the number of MST streams'.
> > 
> 
> I have confirmed this internally. sm8650/sm8750 have only 2 stream clocks
> and not 4.

Ack, thanks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

