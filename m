Return-Path: <linux-arm-msm+bounces-32240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9131D9840E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C16231C2117E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 08:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA581527AC;
	Tue, 24 Sep 2024 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qsor8WRS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86863182A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 08:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167538; cv=none; b=tYGygdR6W/CA7TZanlyMFETl9c55kkQjdTliiYmY3zQ5WRNbtI+QJjvU0zdmKvf03poncAZLnAMtbYnLRXBakQo5PQ1pI1bJXH+/4DsA1L1oKemagu58AuSh5m6fy5D019l32SYRuf6zTSS9EdynYibUlJAvR/9SLZWSPop6qOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167538; c=relaxed/simple;
	bh=TLMh3kbteF3jlPlge4PD7id2x3AntYpEUVW1KYe1ifY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GvmN0AGEAduYnT0Xhw28PCzFdm0viXfKjvAJU+FVuTkXUDgg9llLydNRkOfe/TpxK6eBGRCP9v2STKC7HTYGdee9mQhpDdbUj2O60zYmtKQvaBEnbFZA5/2vh16WNRYIyYWfCO0G2BNL96/79lCfX7Nspy1lQoE3xt2RVYHxTEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qsor8WRS; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6b747f2e2b7so40799327b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 01:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727167534; x=1727772334; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vLbfRp1GyKsHq9/4yxpkhCrQ4dJsOb/iBgUBX9AZBi4=;
        b=qsor8WRS+R5atlal57MKRwN6nNg6aEvfSL4IlYFHhYhcvqIV03MBBCZvbXE0RDtow2
         aiYLMJJoWxp80BJGR6/jahKGMB0SrZ1cAANXyEZVKp4aI7zcQVVF3KPCfBuhJZlLvDAZ
         Vh7obrQSvqfU3tT72de6X4+Tm3WVX2OJJG4/iT1nM7RvPBKAc+HRblcue8PTNsBM89h5
         rqYrbNUFabPjMVRDHX1ok5W//ivx4SBjskZowYUHR1CfL07GkzGp9Uz6gAqeYfksvNkA
         nha1QVxykpySxI6i4FKyWYRDYrAutLPqicBw+9Doh9fNHPOoT4thAZhK/jC2fbwF5fVq
         2Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727167534; x=1727772334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLbfRp1GyKsHq9/4yxpkhCrQ4dJsOb/iBgUBX9AZBi4=;
        b=fT3N5jUB7evzEGYJWZpHmgvfSUSF1DFzMVwDHmB9u263GeG0llbBB0+SPMkxVjSoo9
         QPeBK9BTGDmGulXr5/v3BJNPnKi8GEyo7VDhXs/dONWvi/sSAcLIFw3auGjMweKQ2pVF
         Ae/Saj4QfuJdA3o4/NfWg5auInAQlyhtMBc3Wfn9LgytFjPHNlorfjYm6vIeoqihxQWc
         XOIHsyi3JWf65KxSiGnA3mmiObXnkMYMU/rWC/MrascyHwiwIHQWwD7iBvrjphWhnVIf
         Bee2rUzExEPwyVG53gFhn+bLhbk+q/rwxUuOnaLn677U6DMWm0s87y88HBG5fCHLbdqC
         xcFA==
X-Forwarded-Encrypted: i=1; AJvYcCUWnGCApYSt7f16ARFlwi6CfcWxerxSpJNUG+P96yj0Gx32igalU0Y6+QtZFnIzdQNI+yIiD7P1S0dtf4Dy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6V8zUpcwTxQNTPgpU7NDTGlDXSVZgK9F8wYzPrDeTN0lub6r6
	qy1ScTOF6sgLUkqJuKQUVMZQSYv8f6HgTY1CwTtIaRTJbwYaAzclu7GhE14JINpd/1dRA+tdmnA
	Qqu9obEElQuplXKePgncdID0JRY1mlgiORbdNMg==
X-Google-Smtp-Source: AGHT+IGe9j0q8Q9cKjNhdaZZKSjTbUKB7QpzrQxyjIHHRXX/F/YDICTnOwTO73wcqvDaKSh0zF8icqhvgh5hpB8zmqc=
X-Received: by 2002:a05:690c:b8e:b0:6d3:4c37:d652 with SMTP id
 00721157ae682-6dfeed618admr131284717b3.24.1727167534556; Tue, 24 Sep 2024
 01:45:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-6-quic_mahap@quicinc.com> <kxxcjrqndc2qzmexn4mm4vmfugfo23y63aa6oyia3uiwpe3arr@sbvdni2f2hq2>
 <a09e0bb8-5de9-4633-ab0f-161ec5800346@quicinc.com>
In-Reply-To: <a09e0bb8-5de9-4633-ab0f-161ec5800346@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Sep 2024 10:45:23 +0200
Message-ID: <CAA8EJpqt=jeZtEeCBfr8kOgaOD+WchphbzsAQkbnWJsWQZfj-A@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sa8775p: add display dt nodes
To: Mahadevan P <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
	konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
	neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
	andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, 
	quic_vpolimer@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Sept 2024 at 09:36, Mahadevan P <quic_mahap@quicinc.com> wrote:
>
>
> On 9/12/2024 1:30 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 12, 2024 at 12:44:37PM GMT, Mahadevan wrote:
> >> Add mdss and mdp DT nodes for SA8775P.
> >>
> >> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 85 +++++++++++++++++++++++++++
> >>   1 file changed, 85 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> >> index 67ba124d20f8..d5d8e02fdb29 100644
> >> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> >> @@ -6,6 +6,7 @@
> >>   #include <dt-bindings/interconnect/qcom,icc.h>
> >>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>   #include <dt-bindings/clock/qcom,rpmh.h>
> >> +#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
> >>   #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
> >>   #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
> >>   #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
> >> @@ -2937,6 +2938,90 @@ camcc: clock-controller@ade0000 {
> >>                      #power-domain-cells = <1>;
> >>              };
> >>
> >> +            mdss0: display-subsystem@ae00000 {
> > Is there going to be mdss1?
>
>
> Currently we don't have plan to enable mdss1. Do we need to rename label
> to just "mdss" in that case?

No, please keep mdss0. Just explain what you are doing in the commit message.

-- 
With best wishes
Dmitry

