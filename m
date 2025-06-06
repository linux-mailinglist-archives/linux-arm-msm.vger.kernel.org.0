Return-Path: <linux-arm-msm+bounces-60435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 761C3ACFC36
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 07:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC137189251C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 05:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DAD1DD9AD;
	Fri,  6 Jun 2025 05:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzqb1Dwi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3140D1C9EB1;
	Fri,  6 Jun 2025 05:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749187903; cv=none; b=ZECOGaMeo9fWPwkHqAk6FvTftn+VHsXix+zpmzYINWhsmY3komn2eSe9HaSwqZCQleV+qEcYfyUheOuGiS61Qew7D8xVR7uhmkceTO4p0SfhG1/SMGO2YEAy0reHZRXXnxWHDDcbaumB72DXQg6+mhtw9iDBEBJN1283Dhm9TUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749187903; c=relaxed/simple;
	bh=Rs6u/8uV0wNpRku8tHaJX2RzEPsFk0Z6vIX0IKDE7zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X9gtwDv8vLKlASeaPE6PuRNzF3/HbxuJXh2EL92nQeGmuUcaatbC7M6cMGKgMQBkK/rt5QV441zWaqRGyPIMcDy4Jd/qkbENHf1G/NuHA9g0rs2AvGykTWGrr3Tam8POoj9yoqddQn/+r4QCI1WUZwBw6p8rcttrxqb3EI0B8X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzqb1Dwi; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235e1d4cba0so14721495ad.2;
        Thu, 05 Jun 2025 22:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749187901; x=1749792701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzlXgy5IGuV11bydpJNOntnZHJEgtC/+n57kSppntuY=;
        b=lzqb1DwiXX2TDtpOBglmP4b1h73BvzA0VR4pA1B8daKEFAdJgZaLdh5UrvZahxNZMR
         dPI0ZIhJmAmsmmyECp5dkBtHZtBNNE5BOFtiSsgmPVhHvP1bBr+AZqRh7nxsm6QUqP+/
         nl5iMgQeyWpl1ZYhbBJgl69hPVURy3FzLxpcWX90kbETLOIAr2LOr+Atpt+qHgZsiu0a
         6a8STCnTuUljPXBPbV1DVJD6+YLpkYKm685iNLObMZe+2BQTRMAkoutCyRbq4sq9mEhc
         R4Ck8p4nWi5Ty1NV0R5CLNFA6g51kDr0T6vSh0JIanwPJGwJVRLRk/sAB4BPKFze7mKj
         YQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749187901; x=1749792701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzlXgy5IGuV11bydpJNOntnZHJEgtC/+n57kSppntuY=;
        b=e4+vigx5lUx1l7B0+xm7bbywVEwwh6F3FcQTv9B6b2SYpKN+Us/1O9BRBmwqe27Zne
         HjPNNT/8X5/fUCxAAf3gCiC/hhY5K7ZFw1UApPZqelycJyEtadk6Tnztc/0pa1vG0uWq
         SfrjhOkNEdLEVG+Ay6anWfmsE8UZzt2AOxkgHfUChLX62hI8Dzx1Kp6oHrwMvACO23Pu
         2bUi9jtJ/R8JP+LyCZDCbIQTGUkOk1zhYmGvdXWGTr3vHfeRsk/7VEKRqkL0chG93hdc
         VFGTQaPjjh5QlqJAjzff3cH63ojmzSZTRAAGmaf+h6CdFuT5B+nXH2LJKP4RIcI2HJ3/
         9ZGg==
X-Forwarded-Encrypted: i=1; AJvYcCUDSkZgoS0wj1WJrIRwMDuxVLopThJDH6pU03SqFaZCLEpBnFobMUzHqjny6DMnMW9ISw/J4RvZfFjS@vger.kernel.org, AJvYcCV3OeGONHmJqNlVI2nmGFgEvVQlgqGTzBegr7Lx67shhfkB+EBHd9VhJZ7VDGb0wEw5NVOEfvm4zLJa8yFo@vger.kernel.org, AJvYcCVJ4MU+4/aH0CV8P4hnLs0IdmRdOwKEW0zxYeFdmzWxwE79q/e3iVnZFVyKbS9N/kdTOlpPEMaMmK+5846o4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTBLo4JAiQdTYqWlHqg1IpNFdvqBc6zUWNy6WRS/C70gqpUlm+
	8LIN2Fvs0WGpcYyzk0pQLBhjdYxxFSthzz+24yECUbla5ELJ3FfVsD3F
X-Gm-Gg: ASbGncv688yijoxgygOeK82dBTuknwYPuePWPxZhJJcRRmYj3CZ+BabWU/VrHWZmyEe
	wYyoBFBCADg1g270fIwtW4QXZD2ZfGvdclrgEILGQiidjRF7KR9WdyZHbl3jdzwu0rBgRMlxI1N
	Se2PEwkJSXeIkMcI5y3MfIuF8fXajvo4KLFBFL7leh24ky0K+mRGQo9ZtseYni5R/wlyMEF8Zih
	jG3vwFQeWEbicZBVX86uBoRsQZUP3JF9WIM7kdvqPA6/DNbEywcttcpJLLufWxnS1GAEtAki9VM
	2xWPa4R3Sr6SG0AKKNTvW+oGJVNk4CJcF1bzuQYYa1N9HkIB+vJJpm1D0xDS
X-Google-Smtp-Source: AGHT+IHm9V8MInY7eid9ZjIu/qmANGOMoaeiN5kAiiPpPU+C0cJpEdUtkuzqSwl6yjJEnE728bmZPg==
X-Received: by 2002:a17:903:41c9:b0:235:6e7:8df2 with SMTP id d9443c01a7336-23601d975acmr29530675ad.41.1749187901230;
        Thu, 05 Jun 2025 22:31:41 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034109cfsm4765675ad.200.2025.06.05.22.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 22:31:40 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: quic_amakhija@quicinc.com
Cc: Laurent.pinchart@ideasonboard.com,
	andersson@kernel.org,
	andrzej.hajda@intel.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	marijn.suijten@somainline.org,
	neil.armstrong@linaro.org,
	quic_abhinavk@quicinc.com,
	quic_jesszhan@quicinc.com,
	quic_rajeevny@quicinc.com,
	quic_vproddut@quicinc.com,
	rfoss@kernel.org,
	robdclark@gmail.com,
	robh+dt@kernel.org,
	robh@kernel.org,
	sean@poorly.run
Subject: Re: [PATCH v8 RESEND 0/2] Add DSI display support for SA8775P target
Date: Fri,  6 Jun 2025 13:31:22 +0800
Message-ID: <20250606053122.523651-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604071851.1438612-1-quic_amakhija@quicinc.com>
References: <20250604071851.1438612-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed,  4 Jun 2025 12:48:49 +0530 Ayushi Makhija <quic_amakhija@quicinc.com> wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
>
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> Since I am just an amateur, so I followed some applied examples, like [1]
> If you mind this, I will describe in next version.

Hi, Ayushi. I think this series had been verified to work. Do you have
any idea in my case? According to the public information, SA8775P is
equipped with Adreno DPU1199, SA8295P(almost identical to SC8280XP) too.
And SC8280XP has the same dsi version and dsi phy. And my device tree
nodes for the DSI0 and DSI1 are almost same as yours. I got
`dsi_err_worker: status=4` only with a blanking screen.

Best wishes,
Pengyu

