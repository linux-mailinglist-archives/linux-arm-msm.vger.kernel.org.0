Return-Path: <linux-arm-msm+bounces-71883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAD5B42320
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 16:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3055A7BE6A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D0030FF01;
	Wed,  3 Sep 2025 14:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6A0lRSQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F41E30EF77
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908316; cv=none; b=cU8MtGP6txSEDVMK61vhJk/fZAldA7UuyC5abKY5BGQc2KRxZytkNLACiuTe0t9+SoHhldwi0j1HLYAzzrujfWGdvy8eKLhBVw94KmmP+jKW4fwuwv/CTIgIXK9MkUeo0q2f+8laI0flW30K0DOzzSKGwCYtn38OvekXx26a5Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908316; c=relaxed/simple;
	bh=p1lxtpJ7TjvFoHPJ/hZ3029ZCfEe68+gdc5pXFuSGH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXyTsoK8BH/vZqHrNfSOXgmcm4jqkieSIPOLcKSmdbgStQhCalas/2VlL10Ka8Sz5xrQCGx0pc6zCrlrwwZtaEaE9ugqUkcN2CehfB3dDK51QNSRJs3ZXllzjEsyLKn3UJK86gFmnWxd1reXiMYmFPjhkeAcKb4ExeKXDtTFLfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s6A0lRSQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3dae49b117bso1579865f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756908312; x=1757513112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QK1Plguf59MohKiPDL9B9tJ9p4M4VouT3+3TgzQ44t8=;
        b=s6A0lRSQEJ90tneUCy4zUGJz3L2E5jUu9WsMzIfv6g50o0+H8hjACes/xhJphVACrJ
         wY1XRLApmYh3RopjnhuBLvNY3qAYVViMH8S4T2lxPJTesKnZsjZiSxvGQlqw6MOLlZAd
         spHHgGYKFIqxBJXUa814BPmEowiwB6LyLnJmS5ReefQgeKwgRzD8qZY3cALUKn3qHYc1
         fBwZboS/iNUwRVy51FHS0tecA5Tr0p5Fi/fZEynI2SpJpN940MLe/WzIso3NlGan5fXc
         yPpYUIvYfnSNLVtFdXcWmJv1TshOwEhfJDkJobAuuFhJkRNvIxBDQSqsMlkOBGZnZn7s
         RHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756908312; x=1757513112;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QK1Plguf59MohKiPDL9B9tJ9p4M4VouT3+3TgzQ44t8=;
        b=rgbxPSGVCqsnmAF2f8TwyQSep7L7VZbvnzuyG4onIKdR7uCRDtUJxg+fDubLaZHMzd
         zhcRF5IDO/iVMg/5lye1eJSliVHmlxplfP5k5zRDpwgLG35jCJmt+FkTcy9Zc7SLMLDP
         EwDCYcXbuCAQDlDQ/fjqR8lbqSCTmUDNC18uSs0rzzWd84Ns+6GyMpDAsIOPX4CRx8vE
         tbVV9r4Pgp9ML2NhHuaSQFhcaBcYahnPpH3AJvqqDltj7oC+bp8TrpY8HwEd2KFH+Xb9
         H6CQGD2DEvaA77Mva4vsf4239D7xzdiO50/C//ikez0j624g6CjzsMSqvlmG8Db8isUX
         tfEw==
X-Forwarded-Encrypted: i=1; AJvYcCUh/gVS357tZ3nVdUGk23WMy9PP48dMhuXCCYEP8nUguqIJrQ+9Ca5APdGfkmSZfhbWntDo97XEcChZ6C9H@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt5FrdPZ9TOR4QhUud4mE2MwS1wiqsTVQKm4CwMTazAUOsDpGi
	CiYvk/dbVN6GHZQQT5lNUGD6GkoCIWNjbJjSf+FaVYQQgUeff/NLoCz6FV81euV44Sw=
X-Gm-Gg: ASbGnctqIhIPy6Gib9cZUAWTg08CT1rQrpoR3OlDLJa/rOOcg/1ssdpLcjlGUvPPoaW
	l3XM1cpDldGxtWy9bMD31emExPIL1AjHmXegaY7t/wpY0VNvdT6fKi108hk7RfSOk27e9x3cX9J
	iQdBSsAkWl0LLtFpwHIgGRJE70a22EsuK3oBLr6i+lqT18CtX+Tia929J0HU7hlmZ/e9eCIjapy
	dwFsMp/1WbmXKhDPtb5amLlMjUuT1kXK6hj8mKdZ/PnMzPkyblf6DZ7RJ8n458JfdSm5MP9whyS
	vSjkQOk6dbYTlmfe1OLBg/xEyre7OOPYu+vjtLONFTucc6LFc8rnysIBaR8mVLAVS6PcNvTXG5G
	89EC2OzmHe2zUGamIvv68Pt/Js+b2KGmzrRRA9af9uJy4aB94W27NIc7qneJeh7MACk8XS5n27x
	Odgn2zR0VbfitzzzbkQ0nkcyUkgASubA==
X-Google-Smtp-Source: AGHT+IEZMZforlja2xX6xreLhIbpAVhCSknwT4/G7zI8fcA9TDR7jhhzcqogfHqvrdx3U1dTW1cIhg==
X-Received: by 2002:a5d:5887:0:b0:3db:f9f7:df86 with SMTP id ffacd0b85a97d-3dbf9f7e8d7mr2886230f8f.61.1756908312422;
        Wed, 03 Sep 2025 07:05:12 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm323422865e9.5.2025.09.03.07.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 07:05:11 -0700 (PDT)
Message-ID: <680de02a-6592-40a6-b25c-4d8fa85c4e81@linaro.org>
Date: Wed, 3 Sep 2025 15:05:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
 <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
 <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
 <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
 <2g3iwc2en6wh2ucrsth5ontzdwqr7tr6oplxjnfdjsy3lwyyfe@l76frwiadgru>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <2g3iwc2en6wh2ucrsth5ontzdwqr7tr6oplxjnfdjsy3lwyyfe@l76frwiadgru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2025 15:02, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 02:31:55PM +0100, Bryan O'Donoghue wrote:
>> On 03/09/2025 12:56, Konrad Dybcio wrote:
>>>> Can you try with this next-20250814 tag ?
>>> You sent it on the 19th, so it's in your best interest to run a quick
>>>
>>> git rebase --onto linux-next/master $(git describe --abbrev=0)
>>>
>>> and giving the series a prompt re-test before sending, because there might have
>>> been incompatible changes, whether ones that would prevent applying, or break
>>> things functionally
>>
>> I can't even find that tag next-20250814 closets thing is
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag/?h=next-20250814
> 
>>
>> | * \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   00062ea01d35e - Merge tag
>> 'drm-xe-fixes-2025-08-14' of https://gitlab.freedesktop.org/drm/xe/kernel
>> into drm-fixes (3 weeks ago)
>>
>> but patch #9 in this series stubbornly won't apply to any SHA I've tried.
>>
>> meh
>>
>> ---
>> bod
> 

ah..

I fetched -stable

---
bod




