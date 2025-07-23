Return-Path: <linux-arm-msm+bounces-66225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38634B0EF8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFB3E1AA3619
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D94428C5C3;
	Wed, 23 Jul 2025 10:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TEfu7Q8R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230BD2882B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753265728; cv=none; b=HbN8S8IU5/C+wKV7GLEhuf1jPJpP6iVfPQUifykgPuzL7lJZP/3TmiFxhurfMvGFn9YalJLfBJEeVAfGnDaYh5JTsZNSvadxBZums9azTn8ng11LIyGXdYdH9fkEW+Gdq427tlSDIOMWeIIMcy6yTupj0QB46DQiOrg7HFiH5JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753265728; c=relaxed/simple;
	bh=bVmnYXcNpbvjM55bFzMCxtV2rB1OTba8n+Ra95I9D4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZ6oM+2ceMxNgS8vfuErJ1YSkpBEZy81rbOaBW0JHoVsGNJPWsJ9+Qe0T2uKd+Vvlg669zhSVZWZRhsqQ2RWjsmoJSV1bCHZRzAGtnvTFaRCXWC1AqmDcaFP1jXW6DIj7eKB5ftmajts0pTBcTzZPyxO+i3AifsT/tq/JSL9jpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TEfu7Q8R; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70e3e0415a7so9028007b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753265725; x=1753870525; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=keXN2baWTCHNPA/RphADFpl2yUS3e/Xrt6QyChUGi2o=;
        b=TEfu7Q8RvH0zoibNQleHT+ygvWvBbCNx1xUDEkeSzF68IvehmMfFa28zAX7LIqrx9k
         YebcXIKlkvbjEtvZhOiaEAl8IM35d+5ZBMvkksUwKWjR6KGWeMmsi3v6kAFREU7ZOW1v
         qKGy6d5iaBX9aW1pCPKV3NGdesIrS1lhduuv9INHJgtZ5R/WFIdvuOvxtFaez5Twhzpn
         21YzpQ0lebX828JVevt/kYGmM2vEwFELD25Lez+otiA2lCVcAMCKFwu1iAU4z+jMllm5
         JPV2wxw1/K1YjqFh+aJS1R1Ra4ytxCfYpR6ixAg5yjKNyjLqa6QPBiGSA/u9IB63NcjS
         ekpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753265725; x=1753870525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=keXN2baWTCHNPA/RphADFpl2yUS3e/Xrt6QyChUGi2o=;
        b=dAPRXNXMuaTGaaFiVRRk/7XbLWvBB6zG6p7N4mL3fm2V3eHLzrI3wCuFmQ7LnOxJJv
         yetP+FdxmMkOudbX/eKgIeM1lohkT6Ur3QpI+gGPgRO5XgKCDPBNjyQ0vdyOqFyjmc2L
         Kl2M5wYbWEysTw2WMqiB8eZid+EV0ffiJ+V9oVm8qsDOPXibZKbDCqKIllsta8CFk79W
         rSiR9SgyaFLkWMPx/fYi09HdD+i6rr5vEsnn15eiLIdf+ryQli4k4ljK5DhTpR0cTzLt
         2IqoAfZQldRAKWL9DLyCoqeFVSUBuYJw1mwHreHm5KGS4sZpZjQifJjPs6xvmkdzJYyv
         HXWg==
X-Forwarded-Encrypted: i=1; AJvYcCUdV0Fng7asssjy+GvP5ummRCP9iHwbtr5pP1ug5uRjVFXTH/++zc7c9lXrK3cDoFj3r2x+C19wMgq/VvM7@vger.kernel.org
X-Gm-Message-State: AOJu0YxhoT6i56OwDzrpHAtkkjLZOGMzXfVWw5zFAhwnNFj1nPhzQ9Rz
	RZjY9oF9uj5irz9iOHHXI4G3uJputiWMhmCOIgOZSIv7oCDODs1eMURM6F48m0ehkm1mpwNugfq
	+sSYyKKQg2G3nGpplcyCCMcndtdgSyNMWrt1Le4AgGw==
X-Gm-Gg: ASbGncuAN4QGkmB/2SiFeX0DhiF6GVe5XgA4Wsh0tElPnTizCnL4yZSqBohVw+1fOMt
	V8GSQMGc+l3ZzrGQoctPWEB4zXgBwOuLmdRaHbH5/iwquozF3mv5BeBZXDjRkttJKbnNh4TvXUc
	5ZSUrsfn/hr9E3XMjBvjyIgtm9T45cnIRkuVlD3T8mw74tQlaMXs+unVcf0p+nYGypa0UXSBjIa
	ZR/5uYu0LFjGncGXXIDD+hVffXwtKfZTnmA854mLg==
X-Google-Smtp-Source: AGHT+IHLwbDU+l6YFqXq+ZhOTIt3EsG2LfI9gk0yhItHuQJhFHjnzjhqd5q6F+kb9kyqNAhw6q+3Ha0RnPN1bk1gZLw=
X-Received: by 2002:a05:690c:3704:b0:70e:61b:afed with SMTP id
 00721157ae682-719b4b61bdfmr28060077b3.7.1753265724935; Wed, 23 Jul 2025
 03:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250716152758.4079467-1-pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20250716152758.4079467-1-pankaj.patil@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 23 Jul 2025 12:14:49 +0200
X-Gm-Features: Ac12FXwdNShN-_Kv2LQC7hceFT9DkPQKcUCw0HK3tS9vOljvQ7MzDNxnuXt3sRs
Message-ID: <CAPDyKFovVuZgQNvRUomxd+P=poy_7xSWuCCwyTzhy88mJtcyqA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for RPMHPD on Glymur SoC
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: robh@kernel.org, lumag@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, quic_tingguoc@quicinc.com, 
	quic_rjendra@quicinc.com, kamal.wadhwa@oss.qualcomm.com, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Jul 2025 at 17:28, Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> Add support for RPMHPD bindings and driver for the Qualcomm Glymur SoC
>
> Kamal Wadhwa (2):
>   dt-bindings: power: rpmpd: Add Glymur power domains
>   pmdomain: qcom: rpmhpd: Add Glymur RPMh Power Domains
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  drivers/pmdomain/qcom/rpmhpd.c                | 26 +++++++++++++++++++
>  2 files changed, 27 insertions(+)
>

Applied for next, thanks!

Kind regards
Uffe

