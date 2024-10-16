Return-Path: <linux-arm-msm+bounces-34591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0319A0B80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 589BB1F21810
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 13:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97192076DA;
	Wed, 16 Oct 2024 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="aOIvnR6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492F41D8E1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085670; cv=none; b=uEOG7boCe4VpnGslpSN/TDhx2Gzr9xYyXYgjGsoS2jjB/T6Us9/++EJOepsD+ALZxdVY4j2RvSyZP6nR8iTIJD+aONJz/pzqYpPQvgARxxDnlY2KROy9zcj4UhTWNZD1X2TdVUTE9GKqRFC8ckq8ZU/R2ppY/f7VWScae4jRK10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085670; c=relaxed/simple;
	bh=4TDceqBwB5/CSA70st1bX9f2C9Pa3VHqCT+1UuQ4cko=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=knZj/FubC3I9L1lg6D1PzRzfDfrYKD0ZmEPhImPD/p/iAAPEnGuJMhnItzpUBwLbounkzUk5lQbli4aGj9G2KEjot4PXFcW62fD6A4QF1JsOWt2Qksxev9MT089jOXSL/qIF/7yyUXKIKFTO+Bi/yqMEeBkPZ7E3sG0ujjXrBkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=aOIvnR6R; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6cbceb321b3so51019256d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1729085668; x=1729690468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60BUvf9HqnbeuKt+3QuiFsp8g1MCOzdKxeoyAqr2mHQ=;
        b=aOIvnR6RnBFlhG54TZOCTmd5zWkDcsruHzmDFHxA/cHayDDY9vjoJ+Ewz0GbdWWCwi
         81jLcH/yfB1DIYvgiUAfMKEYjC2mfSHI3McJM99AoG0TkKG8b/lM/dhgRyy4+kSSwImD
         euejiFlFL7apjXevpIw5bta55dtfzb99nu5V9bD+/xTyKAg7vHJieJTzZJzKat82CEE1
         rfIJuGNInlTq18Cheu3aco4thaN+pZMKd0KQ0LVPpEYBe4cEPDQiL2x6eoWIqn8g0olS
         yoBImiRP/l/lkhT0h768uMII0Y47JCzM6Ddhpoc4GyenI6Uk7DYQ8psiyknVkxEput/9
         H3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085668; x=1729690468;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=60BUvf9HqnbeuKt+3QuiFsp8g1MCOzdKxeoyAqr2mHQ=;
        b=YOsgwVWNdSFkK5QdxhBlehbTZg6FOCSUROukPA+XEaWfrQWT+yOhae1fvbIvgvW6fv
         80rT2DatyyaFwCqRkskSHas1/GJrC2Ed1Owp9YDLerT7XwWENX8Pq2dE8iBtlXXB9lYv
         E3zOUCU/GZ/h9yTLf8dT7H5uq7mLB/hMDcF9+jNJLddhTqRO0sm2gv8qh1OvvoPHfsSX
         EmXIP9wlttn7tSuXKkHVf/LSh7zkrnc+eayLs2qEWbegs8e8p8ntDKf20c5Dw/oIbTHv
         2C4yfa192gsT6Eed33VExPuxFQ4qQvU6C/aWWgAU5tZr0hErOSGOAC6U1+i2bpQlSkAD
         eO/Q==
X-Gm-Message-State: AOJu0YxtSdpMPuHukIb8e9bjM4pNmc/KSWtvjij29KTRgkZs5lUPgzI1
	aSRa21cSMmXqdiP9BmO7AW/gqkbuJJTsq6seqwqFMCF2MSYAzpoOqj+1h07wLmU=
X-Google-Smtp-Source: AGHT+IGkt9nV2zFDYZc7p68pW9RiNJVGEAerCIXZvjfqozTAP2VCLEad5feNiIsFKsPyFiMd9pqK4g==
X-Received: by 2002:a05:6214:4987:b0:6cb:e6fa:495d with SMTP id 6a1803df08f44-6cc2b8d371dmr52417516d6.21.1729085668158;
        Wed, 16 Oct 2024 06:34:28 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cc22961be9sm17901106d6.114.2024.10.16.06.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 06:34:27 -0700 (PDT)
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: x1e80100-crd: add rtc offset to
 set rtc time
To: Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20241015004945.3676-1-jonathan@marek.ca>
 <20241015004945.3676-5-jonathan@marek.ca>
 <Zw9ijUy04cC4Qzio@hovoldconsulting.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <663cf3f6-3254-e490-d557-a12aa41a1628@marek.ca>
Date: Wed, 16 Oct 2024 09:31:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Zw9ijUy04cC4Qzio@hovoldconsulting.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/16/24 2:51 AM, Johan Hovold wrote:
> On Mon, Oct 14, 2024 at 08:47:29PM -0400, Jonathan Marek wrote:
>> See commit e67b45582c5e for explanation.
> 
> It's good that you reference commit e67b45582c5e ("arm64: dts: qcom:
> sc8280xp-crd: enable rtc") but your commit message still needs to be
> self-contained and provide the explanation here in some form (e.g.
> quoted or paraphrased).
> 
> Also spell out the commit summary in parenthesis when referring to
> commits as I did above.
> 
>> Note: the 0xbc offset is arbitrary, it just needs to not be already in use.
> 
> How did you verify that nothing is using this offset on this platform? I
> assume we need someone with access to the docs to make sure it's not in
> use as we did for sc8280xp.
> 

AFAIK qcom allocate things from the start of the SDAM, so allocating 
from the end of the SDAM should be safe. And AFAIK this is supposed to 
be a general purpose HLOS (linux/windows) SDAM block, so should be 
mostly free to use.

(its possible windows uses this offset for something, I don't know about 
that)




