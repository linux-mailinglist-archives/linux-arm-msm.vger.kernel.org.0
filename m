Return-Path: <linux-arm-msm+bounces-12142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D2585F3A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 09:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 186B11F21712
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 08:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F40F2C68A;
	Thu, 22 Feb 2024 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C3+Xmemb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7092933CD2
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592212; cv=none; b=sNdukYQd/3yk+rl/AGHkg7ViHG/pcjsKTqfVGhDCyW1w2y9SfkW0ZvriTnb5hXC1PpEzgHD7IQZpIUOVLL4HraZoNySzZbNx3yTqMsreEWPFtWc2hTEZY2l5KQm5MFmFtdblTj9ezgdXVfz6xXYGpJ9NtXqXLLdif5ChAKieybc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592212; c=relaxed/simple;
	bh=CD4SihF6H/OkAstPie75S87Q+Qm9UZdKMCp08Bvbxf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uKgY8abRVgXIcJ4h3nMUxQTplE/fdEr8ZJmhy84EI4tPmWFrQrjUy/IFnUaiQqBoXcoHr8+X9l3tpWdCWMiPV5kIDzLYTmWZ6hq0I02XcMpxfYUb2EQKmLOlJ1LinXZGVNWcf8Okl8Vd/XdgiaiFeKyjE75BSyaeEws4wqgrQ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C3+Xmemb; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-512b700c8ebso5381744e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 00:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708592200; x=1709197000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PEgtmPpUUtS04VQTMENBao32ylE6cASSI+0OxszxwdU=;
        b=C3+XmembUCNa4jGT9OjqsIpXi13CxtlN3XGNVmHeQEUyrosoOkafolg7YQ2L081N/n
         97MpZ42aibotIFFt2AsjgdlWLIpqnjiQoKkxBntw6yPoG00YHGtpr6AKPrj1LUQx+Vqb
         u95I9GiOV36ymFdyMcdXnRmtOIjGUbGhAo6DK9cUwL6eaeNTyuYZaaCsI/TSr949Jgu1
         HkaHZe2CtVddo8Yo4iFc0KovcZlMKJXgoEW2vLcPLQxiuVFTbLbJ+oOuTo39BOsdjBFm
         KuSV94JD4BUolG/LRmWKrxg0vPiDSSWjuMdQTf9XbTqpywJnwKxWU10U3U6RucJzTvfv
         iDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708592200; x=1709197000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEgtmPpUUtS04VQTMENBao32ylE6cASSI+0OxszxwdU=;
        b=pXYPNUBeD116JbmePADniOrtVX/MAZ/06hWqTKkLbzT+aaF7ctJoGv3btaL2HEe9Pz
         cyFQX+DVTP8NN54dLeB8eS2HaIHx/A3oAvgWyOeTPVtDSiceclbq6WEx60nrtKS68HhG
         JjeVFBPGeymM3ErDJVaRKIeZvBkpS6dbUzZ3V4m2yntja7SZaH5aM1NC8aio3iamggll
         6xWF9pfH2oL6cXUb9VwoZKV5v8ie+/Iq5fKGIr76c+dANi8VFcpEaox74KZrqg5coimX
         NwrXZiFJMHXwOD5/usqrXJezGc0XB74YjHRj8PIRDPD9CWbtfH9LghX12W5xDoFjQT6d
         y6mg==
X-Forwarded-Encrypted: i=1; AJvYcCX5ErTso3KbijDbPSez40lHVYtSe/9RJ/EMmtwkoO4Tn0ro0Fcx8Aw2ivpt82k9Po4PGrRj8dxYsAa0zugviuhYPjf1zPzpYkcHTm0hvA==
X-Gm-Message-State: AOJu0YyWcw7OulJxNXVSmN0zYyWa4v05/64lowvar054PJqFDhCG0Sbj
	70w+McRtfx+D0Jb2kvw2sfD4zWKWq5kQxY/KjAqn877n2Og4j0uX1Su7y+v+nEM=
X-Google-Smtp-Source: AGHT+IFSeuajGNAOcaAVLfuqKfripMfReJl5BdXtuhgJqsFGc8yFLiHiRUy0+Q+DPvx38P5N3hxEdQ==
X-Received: by 2002:a05:6512:1024:b0:511:87b7:6d88 with SMTP id r4-20020a056512102400b0051187b76d88mr13436790lfr.32.1708592200373;
        Thu, 22 Feb 2024 00:56:40 -0800 (PST)
Received: from [87.246.222.6] (netpanel-87-246-222-6.pol.akademiki.lublin.pl. [87.246.222.6])
        by smtp.gmail.com with ESMTPSA id b6-20020ac24106000000b0051176ff32c1sm1992022lfi.62.2024.02.22.00.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 00:56:39 -0800 (PST)
Message-ID: <8313a7c3-3ace-4dee-ad27-8f51a06cd58c@linaro.org>
Date: Thu, 22 Feb 2024 09:56:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
 <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/22/24 00:41, Dmitry Baryshkov wrote:
> On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>>
>> The max frequency listed in the DPU opp-table is 506MHz, this is not
>> sufficient to drive a 4k@60 display, resulting in constant underrun.
>>
>> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-table to
>> fix this.
> 
> I think we might want to keep this disabled for ChromeOS devices. Doug?

ChromeOS devices don't get a special SoC

Konrad

