Return-Path: <linux-arm-msm+bounces-80542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E070C39A85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 09:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ACAA1A23848
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 08:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6E43093C6;
	Thu,  6 Nov 2025 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zpMBkhr7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166523093BA
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 08:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762419056; cv=none; b=iq3qZPYGB5mQAOMp49JcoVJTxfO6PRXC5lVy1w3hLBm0YiJEr1ELm0SGr3/PysbBRljuHE4Yobz0fcKmHTO96HYxX2oJQF0CG3VNIKXasXNceZy2JOWDQlDva/VviwgwVPQfJsdBCanhFaEvRmUnMscWpKK28ZIKL/p65XAZX2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762419056; c=relaxed/simple;
	bh=y/dw8Yeek5uiSFfzrYLyDpk4KHGZ2Q+0lMj56HOwE3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhY9gr7gtncdtK3jK0YrHmvWpRepNMf3HSQK/8SLuvYXLTdBjvNL2uGgyoLUl5FRYJcTaWtH4HPH1PRM7ojdQS4/fM5oC8NHaIty4frP/PyvgBVSQiwihjLM38D4RFlOSxuLGpC2bXxuaobx1oDoc4nwmj4N8X7UUXGgY2tfqZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zpMBkhr7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee130237a8so460269f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 00:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762419053; x=1763023853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0O1+Bk0V1ecJIiIZPiuBQsoCpD34teqnebEkC3KejHk=;
        b=zpMBkhr7lpfrb0BndEugyEG98HARsRAOlnqU7cCJ8s+vPR0tkymgHv9TIx2jWP9ht+
         CHXG501wIUp3p/H+/5mDBgnSosnu/NlyX4MwkeNdLIXs7AewSDPD36a19QqB9lym0x8w
         PVHatOGR4ILuSUKJSkWmycF5fI+h3e1P1R1nEk5pb6ASahhfEWjBIWHw1kOj0h9NDn+r
         IdV2YPbWVovnaCMiXjwehpnKfH359rwrOHw0hkm5f1fYRzBQqtZpn5J90y4k46c9Dk4W
         RsZjauAXkSj2AJYIyviETBTvEILJYhQ/O7/bM170HrI/H4AfF2R1cmj8U4b0NrL9aKiP
         /Lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762419053; x=1763023853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0O1+Bk0V1ecJIiIZPiuBQsoCpD34teqnebEkC3KejHk=;
        b=Wm5Zho5bBbJWMq/h879x3AuZq7MO/yEOlrv4CckgcCSyFRvVTXTdTe2DBDVMzG+pcL
         clDM8Gp/7KS8JrH5aKFewyHe7AHg9NKI6T6ErT3nrPCYj+fxtC1r/fk51f9MvFostMDG
         v1KvXPlePX/K1pQzF7h9NbvDYxp/KzP5DL/o+2raR/5jjjBD0TXNkN0BkIdACL0B3Ca6
         GtUUHP92jbBucqYxB6Z1/qwVy3unp5MU/nsAQduHopTBF0Sb+/iW8sRq5iSuyF7R5Eue
         MgLhFbCPA7kj4c9WaMmz3tK5yUHZEmmknk3ECFW89ZYOnOKnRR8nC/zVSJRkEYezZX9j
         EyPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ6DVvoMFOPFuZPu37UF1p/84dZF0al6ys9NHauH7DqlBbuKY/9v97HYzfnp07zMhAGcZFA9RVVti2JnW+@vger.kernel.org
X-Gm-Message-State: AOJu0YywuNnVM+T3/VR08yX9XJbhFnKD5TkkCM/JSbqUwJ3uAHBhxcxX
	ijoeFUaag+6DSIhUpbHpW40K/xF5WAg6BFdH76lNwXOUbe4y0Xc3eqUT5tdm94yFnK8=
X-Gm-Gg: ASbGnctQJJe3qR2TUXWXq/GV49/VrpFHNN1/AmSSPUvSZKNtFUCG1KFqbiIuMBLGz8I
	ciZJnILs94dg0HWpwN1KoGoacfQ71KjbCZa964BzDW1kMAlrECzuBlCDwbawSyru1g6lkZ0e5E2
	kDXtjUEM4SBdeMIZOh+lEU8Ymvh0aU7vsI4qvry2nRhDuPymjrc9Lpy19/oi0S98LMgRydnurqW
	2xYhM0B5mW+opjrDx4dN7smRvXHmqecXurCgMFmo0dhZ5Tds3AhGU23mdIbzHmW6Ug00fJ7DbW+
	eMQD+gqXZhSmKaIQBrhse9NAR49KetHE2GYDD1jCOoVreCc/BOjdxvZhcG8UdQS1haUr174UOUY
	TzalFN74GaDv8WfmP4w2zzCsd6UOzGMZAKsK6+CKnCNtFGI90g2xrRH5veEdksu2PN4Vwy/Cl
X-Google-Smtp-Source: AGHT+IEpNkwrjClS3MRT6aT/Q6UAaN6LRZvZHXmcxt93frsHr0y/6tOsqdtfdy9Fugmh28HWQ5XyVg==
X-Received: by 2002:a05:6000:2a0c:b0:429:bb40:eecd with SMTP id ffacd0b85a97d-429e33120cfmr4859897f8f.52.1762419053386;
        Thu, 06 Nov 2025 00:50:53 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb49a079sm3648338f8f.32.2025.11.06.00.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 00:50:52 -0800 (PST)
Date: Thu, 6 Nov 2025 10:50:49 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Ritesh Kumar <riteshk@qti.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, 
	abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, sean@poorly.run, 
	marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_mahap@quicinc.com, 
	andersson@kernel.org, konradybcio@kernel.org, mani@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, vkoul@kernel.org, kishon@kernel.org, 
	cros-qcom-dts-watchers@chromium.org, Ritesh Kumar <quic_riteshk@quicinc.com>, 
	linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org, quic_vproddut@quicinc.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: lemans: Add eDP ref clk for eDP
 PHYs
Message-ID: <x7ej2ne3lwn66xwgavdom45hj5imncczd5h5owufvvx4e3cblu@rdhb2adstev6>
References: <20251104114327.27842-1-riteshk@qti.qualcomm.com>
 <20251104114327.27842-3-riteshk@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104114327.27842-3-riteshk@qti.qualcomm.com>

On 25-11-04 17:13:27, Ritesh Kumar wrote:
> From: Ritesh Kumar <quic_riteshk@quicinc.com>
> 
> Add eDP reference clock for eDP PHYs on lemans chipset.

I'd add more information in here as to why this is needed,
specially since this is a fix.

