Return-Path: <linux-arm-msm+bounces-67915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 467ADB1C642
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 14:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 440664E1589
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 12:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB812B9A7;
	Wed,  6 Aug 2025 12:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y563eKZL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDC818035
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754484458; cv=none; b=kpgQzBfRKRbMuPV8C0v7y3Q5yJ9ZPDp1EgbYvbS8/ka4/fCKDCnyqvgkuvtX8XKNdknfOClNbfR/LfENz5GOegFIh757wr+nMEz9RpSJWmIf3monComERA3hvJKTuWsHtM6Kaxg3uL/5xOvEXOOvRvrlt/pznL0sVPrKpzU1CVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754484458; c=relaxed/simple;
	bh=uMQQAh8WcEu02JuyRqG+sm8RrNuWu2jygYPIttRgVMs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=M8tt1IMLp4KdSlkNJNvP5fNk4ddvk0QjTfKr9T05BqySiljMw34JIi4B3EgIDgSlEedpDvZ9Sz9v+ocUDey22ndx1Eunqr1XCiVP/Gaqox/TrEwoXTMglfQnzXF56bk3L/gFPl7Wi8H2xSLDww6Tt7eFnlUlEhKe9bYD1RWiyH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y563eKZL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b8de6f7556so2031669f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 05:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754484455; x=1755089255; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMQQAh8WcEu02JuyRqG+sm8RrNuWu2jygYPIttRgVMs=;
        b=Y563eKZLs+dk82ECbRE0AshTXvJznIRc9cr9MhygBCmWO9RGAjre7XgSyN2uhhG4oL
         JiV9glDJlbuMJy79Jwq739tZO6+Pur+dXeFYnifU/COFNt3SrUEOUFozPW54qBKZ/+P3
         XgA0TCLCs7Xsr8VK9HBBNXzDF43DJLSwkNC0azEfRuwiJR69QSRvniv9YfPPiGwNzzk8
         4BHOyz2OBV26cB8qnMiUJSvhlSBX//dUKHa3WyO9UhRwytEaDOXiIXT8/FN3ez1B75D+
         WKXigqjr+pJpFNLMG/6FsU5Z+xC1PbV1onB5XpxyDh+9NBawNkpCJbRaMKhXMW8VYXj6
         /cgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754484455; x=1755089255;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uMQQAh8WcEu02JuyRqG+sm8RrNuWu2jygYPIttRgVMs=;
        b=UdqT25MoVVgpbs3b2O5xlr97x5Tcxxf6h9WJb3k9+SDNvaEXl87yXFOPusN20BSuNH
         h672kIYwHyKzl8Fo8QsivZGBbkuByViCy7Q/HnqNu5YFGZJwy3jbAf3StKSd8X0MGBn5
         TKA7OrYfz2jrqyZd6j2RSPBPaSQnUJiVbLVdUoxjLZi9a+dTK+NEPRTdZPgR4zW0EzMm
         oJSSQom+whGl6bCNSfyEJxv8tHlGH3Q86rtiAL4zGiewVJCAeVp67zJE/aNFVmXdKZVI
         KmCB6HkGhI2feePb8GLgwBqBoB3bHlqH/k+B5C1CrkXoXewYiaywiwy2gjh5YH0U7U/B
         bMbg==
X-Forwarded-Encrypted: i=1; AJvYcCWLitsieaw+kBADU99iUip/WtLqn0VNQSkpypDmwSpIi4IBEl147QYxUiEQrmFxcJFgUM9cntmXI/CGvB5O@vger.kernel.org
X-Gm-Message-State: AOJu0YxPg8BLmYuB6McG4suRQSGo/8lgMbv3rS0caFeiUdAAaZ4qSBYT
	2dx/+8Aqf4SHsG5LTNqK7gU8PYUarOeVoOg3NLjczzeahexA22JiWvSw9aNJSOUMbE99+tA/URP
	wy+c/
X-Gm-Gg: ASbGncsPGUuo7ZT5jsjjQ6W82cLlhMCCAGXQbybjii035M/lmWy9U9nWGz4uI8DdmJj
	jKySPr4FuNqMATOqWkWrDJfExBP4jRfXbN5tiOBq5lD5XCvpz0PVWpzmaszuZ1iQ8Os4HsN9W5t
	pke46NIlMMuCP6DxFzgFkY7IMLCfviQwAaPHbu6ErUBxDjRhGO95XaO5EzSNLmDWXpYkYR1p5c2
	zdYlfr1kFn2DmXTw+RS5ymA11JRflhWpLBqVc3Nc+/oBwigeL9So7H+CPWZ0cDzEc2e3iFlZx8R
	vMv+XefRUL52FiAtQujYkdBtdRTYb/0m4wWqURYt9Tuwo6CFP7Q177BU7b4+65UB+pG2a6UNYoI
	g2VjYzKoBcw3n4miSvlEBK3Xuhz4=
X-Google-Smtp-Source: AGHT+IHxO9MmitvfhjqylFKRguuox3GDfzQYiukqSwzJ38jFMewGzXEj8G2vcOvegX7ujhbfTAcxKg==
X-Received: by 2002:a05:6000:188f:b0:3b8:d16a:a4b1 with SMTP id ffacd0b85a97d-3b8f420ee27mr2057195f8f.58.1754484454941;
        Wed, 06 Aug 2025 05:47:34 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453aeasm23738876f8f.40.2025.08.06.05.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 05:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Aug 2025 13:47:33 +0100
Message-Id: <DBVCTYZVRR8C.39D28DAAS36UX@linaro.org>
Cc: <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <srini@kernel.org>, <quic_ekangupt@quicinc.com>,
 <krzysztof.kozlowski@linaro.org>, <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8750: Add adsp fastrpc
 nodes/support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Bjorn Andersson" <andersson@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250805162041.47412-1-alexey.klimov@linaro.org>
 <ovlwlyuwj3q2g4eudesq7qtc3q6omylvnnriagd2nfsrbkbldk@zwdw2yovumeh>
In-Reply-To: <ovlwlyuwj3q2g4eudesq7qtc3q6omylvnnriagd2nfsrbkbldk@zwdw2yovumeh>

On Wed Aug 6, 2025 at 1:25 AM BST, Bjorn Andersson wrote:

Previous version was sent few months back.

> On Tue, Aug 05, 2025 at 05:20:41PM +0100, Alexey Klimov wrote:
>> While at this, also add required memory region for adsp fastrpc.
>
> Please https://docs.kernel.org/process/submitting-patches.html#describe-y=
our-changes
> rather than lazily continue the subject.

Ok.
It also seems that some other commits that were merged doesn't
really describe addition of fastrpc nodes well.

> Also, the way you wrote this makes me believe adsp_rpc_remote_heap_mem
> is optional, and as I don't know what it's for I don't understand why
> that would be part of this patch.

Yeah, after looking further at the bindings I agree that this should be
described better.

Although some of this is confusing:
>required memory region
>adsp_rpc_remote_heap_mem is optional

Anyhow this mem region seems to be optional so I'll try to split it into
two patches (need to check that dtbs check will be happy with that).
It also seems that when adsp_rpc_remote_heap_mem was merged for other
dtsi-es then no questions were asked.

>> Tested on sm8750-mtp device with adsprpdcd.
>
> Just adsprpdcd?

Yeah, I forgot to mention that getserial can libcalculator tests.


> Is that sufficient to say that fastrpc is functional? Or
> at least that the information here is sufficiently tested?

The testing of fastrpc for adsp is quite limited. If you or Qualcomm can
provide the usable tests to run and verify then please do so.

I think what happens is that often the info for fastrpc nodes just being
copied and filled in with info from downstream with no requests to provide
test results.

Here it was tested with adsprpdcd with compressed playback and two tests
above I forgot to mention.

[..]

Thanks,
Alexey

