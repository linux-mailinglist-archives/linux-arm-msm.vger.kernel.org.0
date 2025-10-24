Return-Path: <linux-arm-msm+bounces-78687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBA9C04B78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 09:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF0154E4106
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 07:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E362D5437;
	Fri, 24 Oct 2025 07:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1mIjjqM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14832D47E2
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761290930; cv=none; b=ZJtlldAGPBB81nPRr23KlMc6AXzNfKIjewzEBWpSbonI1l1rcQhjj20dnWOiAtw76j817QCm5ef/U/1zTUO3p5pOLN1oxZMwz6wdSPBc8SUwfOAuGkBo8eAdu/FCtKO85WsQsLDbyWrE8/tUWHD/jmYC7Us9v7gq7JPt5oz9iI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761290930; c=relaxed/simple;
	bh=PDOmGa80IgV5TpNTwO8LtYP/7lNrk6vcGBSxu7/+wIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyS4ZAq6MAO7U5DkBX24VpwUTtMJiKIKIF++nLMq0O+OoEysE/xbB0L+QDhw9kExUwTQAd+yrLd+3IlK/7iaYNtk8qw6r/m7mUizdsj1lrKfLUL0ynkiiMNn2F+XI407CMTx2iULKbl5YFCQ5EQGebvCgtb3idCvfzEtlD8hh/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1mIjjqM; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4e896e91368so21711901cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 00:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761290927; x=1761895727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NLq4EMqV8KeUwDEw9NmG3B9JiKdj+/ZaWJacLQX9P6s=;
        b=L1mIjjqMhnpalFGwZCOsQPjBL47QbgpGIynEmixgy4cFtEhrTEFf6j1imGvhmTUWSn
         lRNlnV3WPZ26/1Yomkr69RzJA4itnFT3a1TD7DV27oWjTtN9WoscGY5DMLo3m7yfDyXa
         M8zrf6nOmQQC0buCmYxhoseWFoC5K6RyDWwc+8y5ZxJVWJK9N7uLVunofO99JHbp4aNq
         5vz6H7VJxm+fifLxkCkhvmoGBc87oW0tpRygoStq7VmyzIzTwsogeNCRhYJudQ36pPCY
         GgnqkrmxHKi+i+S9GE3liSoU3I+Re9MpE8IlnScoCZrhoMiY3Rxb9IctBifbUSB1Cjj2
         5rUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761290927; x=1761895727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLq4EMqV8KeUwDEw9NmG3B9JiKdj+/ZaWJacLQX9P6s=;
        b=ndHTXPyjQxutHHLhjo+wgdyUxwLPzbxzuf80faWX/8PzHj59sOGAf0NRH2HeEgFtbF
         PRx8AiJh1WsVZszkkePDFcA9FvpFeLCQkzGaf2rK2QZHnjNEV/L4YQ22CJAGtyYjRId7
         uqKyBk0qTMuqkM9oRy3iqHwlobtid2U8SwcKJ81QHO5H3poMDJaipYuIn+FQdvjNmy9t
         oFUKLzzrJQKMWD6HZDsskBEr+N+lvjSH5tdB4sLVOzwwnag7Y70aPNSEcuG7i9ZDH6AF
         /CjPzC+5iAj0K2UN/uRSSJxBDMtjVk4WNQMkvBH0BVghmACst7ChULOknFXpBng7i+uZ
         hltw==
X-Forwarded-Encrypted: i=1; AJvYcCW8Wda+ivzYqSXc4vEGVZvueDFSHmlaJwKo9GuWRiOyVt4zCiL3403xu/v391AAmjxDA1osupNe0zbortlk@vger.kernel.org
X-Gm-Message-State: AOJu0YxyCk5bgTePLIAHqyxW4Jq4as425s+oXILiQ7d78Q+5x+Nj9ps8
	g2WlaC4FbeZEa9jXMTAhnMRJjfYB0g1CT3t9elJbhb5ICC0gmC3NC6OI
X-Gm-Gg: ASbGncsuJW7LO0DPZdRpDz2VwRlPhaBH7XPZ1b2ThZOOCCuF6n2GIXT5csI7kp9wOxd
	FZVuPJO1dCTnFpvoLN+J8CHIhjT7EWzMVgi33B2E2bclIpPHLmezFPFN9xG+63bcfzGLnyyTIuM
	ovK8GUlCpmeIJ9LVBr0tr+85AKk8OBkPbjx2fUOB+ANcQ0iE6XXiouxTgoRDAcPtZOjIUee9MHS
	9xe/GtXrODjRrGJgMIsJaPc14s56f96vrWw/zYgwTYOe5Nn7bEbWeF0+S2tVPw7nBcoiiHEmGBk
	r9Cmf/qQgxx+0Cx7Zbe3rciTaphTVFB2NkDOUipLPb5HoikiD/a1xOPUrGsNC7Z0vvLZmpJnPBM
	o59eQAN/KCEt7dKb/hTRV3cZytU1p+yRBaI/0Fp1HsxrMuaa6SNu18YEiIVoITSyrUIpBNuhymJ
	R1wHEtDI+3A564y/h3s0iNIfO2MRfoTxkeIQnDWTQ/VinLdlQTZJbHbWB4BpColtaBE8bFVY/z6
	32CAcdrocQ=
X-Google-Smtp-Source: AGHT+IFB/J0PxbyfsY1NyO2f1J9ko14ZR5Rtgtn2rAFKHvR5BmlJZbOSMCfUnRud8Xjevkvi+qaweQ==
X-Received: by 2002:a05:622a:1646:b0:4e8:b19c:d5d2 with SMTP id d75a77b69052e-4eb810813d3mr61575701cf.32.1761290927436;
        Fri, 24 Oct 2025 00:28:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-4eb80380104sm30138711cf.0.2025.10.24.00.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 00:28:46 -0700 (PDT)
Message-ID: <91288aa0-0088-4b50-8b33-661d8c0c25ae@gmail.com>
Date: Fri, 24 Oct 2025 09:28:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-2-611bf7be8329@oss.qualcomm.com>
 <CAJKOXPc57_0pJ2ZWf2cKSKAcQMc3S_mHKQxJDzWH7t=mgim3CA@mail.gmail.com>
 <5820a9a9-4474-4c4d-905c-0efd9442e5e1@oss.qualcomm.com>
 <o6dzhmlicwiezmxlb5uqitx7e3pjpyuhbjqfumivbdkru42hvn@r4ksfa6m5nd2>
 <540b1de6-c959-4911-925f-8163f5fa5147@oss.qualcomm.com>
 <fdfzoemfxdz2p622hvixpaznh2n22hweit2e43plfu2kdd6kad@reulvi4vs5v4>
 <cdc01b6d-370d-45dd-a3fd-9866d2a5f36d@gmail.com>
 <7952ed3d-f019-4593-af43-b2df7f738d04@oss.qualcomm.com>
 <c0e6b667-2e87-4419-81ad-3366ed56830e@gmail.com>
 <1f98f83f-328f-47c8-84e7-2c77abb37a6a@oss.qualcomm.com>
Content-Language: en-US
From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Autocrypt: addr=k.kozlowski.k@gmail.com; keydata=
 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
 PN9NZAOyb771QoVr8A==
In-Reply-To: <1f98f83f-328f-47c8-84e7-2c77abb37a6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/10/2025 04:10, Jingyi Wang wrote:
>>>
>>> Hi Krzysztof，
>>>
>>> I tested with falling back to sm8650 cdsp but it will fail with:
>>> [    4.739615] qcom_q6v5_pas 26300000.remoteproc: unable to resolve shareable memory-region index 0
>>>
>>> sm8550 and kaanapali define 2 memory regions: 
>>> "memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>;"
>>>
>>> sm8650 and sm8750 define 3 memory regions:
>>> "memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;"
>>> with the driver:
>>>
>>> static const struct qcom_pas_data sm8650_cdsp_resource = {
>>>         .crash_reason_smem = 601,
>>>         .firmware_name = "cdsp.mdt",
>>>         .dtb_firmware_name = "cdsp_dtb.mdt",
>>>          <...>
>>>         .region_assign_idx = 2,
>>>         .region_assign_count = 1,
>>>         .region_assign_shared = true,
>>>         .region_assign_vmid = QCOM_SCM_VMID_CDSP,
>>> };
>>>
>>> When kaanapali fallback to sm8650 it cannot parse this region_assign_idx.
>>>
>>> So shall we still fallback to sm8550 or define a new node "kaanapali_cdsp_resource"
>>> in the driver?
>>
>> And partially the point here is that you might need the third region, no?
>> Best regards,
>> Krzysztof
> 
> On kaanapali, the global_sync_mem region is not managed by kernel, so it should
> be removed.


OK, then please mention this in the commit msg, so it is clear why this
is not compatible with previous generation.

Best regards,
Krzysztof

