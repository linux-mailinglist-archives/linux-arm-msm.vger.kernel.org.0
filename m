Return-Path: <linux-arm-msm+bounces-82351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEF2C6A38C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 16:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 15F894F619B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81568364049;
	Tue, 18 Nov 2025 15:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKuh0xHW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CEF363C61
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763478025; cv=none; b=Qnynl4WU9JS8C/+lp+VjfwPE1L6qa/m+IwF6y6fZ+OL4ql4gDb43RePdNN9/Yln92I4az61DitStODqaW1xif3k7DrEZ3bAwVjphxR4+EiQ4mPPBKI5IlHR2psqlMxbUC3kxncWl7ckgNb2DehsoFnRSjhYK5kQNMCg5EsVv0Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763478025; c=relaxed/simple;
	bh=yYBIMUYPEMQkGXlIun/Z5XghzFBT2+jZnb6mvUooXYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izGx6tySmdeiKBwAYu93I1ghP+3CURPTypS9BlUCNkFBy+ErnhA5knltwUCOdmeoaqLppp0amINAbadKd5VRnERCFfp5TPBJG5U+PWeJ8JWDtj4nuU0PzmwycW3OXubn5jwDG0vKo3xJaaU3dB0ZeBDz21OTc6iVZhj/SpDmNcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rKuh0xHW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b735b89501fso620520366b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763478022; x=1764082822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6ycbeHCv6YzVBfiihvNrBQTxTs7GIypa/MVav3f8pE=;
        b=rKuh0xHWyB7JqCwIBvmmAqR4ygE3xvBbpD2tbDnnpG5h8K3b+OxsL4PHDAooxaKHx4
         gS7P3vIsXlUVzeamoTgNAXIU6xAHSCXvFG4si7YXwxk91zX9VW+OgjXfhrhhIcBUH+9g
         JXynzdDgTm/5K2jBKDQ/euvBa2J9WSZ5UG6DWnTuuUpVzdisjs/Nh5XMqV5N0QdT2uJA
         AU6tlwuZh9Y6F+IIRfZtmJ5ZfhpcIwnOhTkvAkJQzRBQC4RcCFz0syEPa5DJzPD1l5fg
         T7lszg2+oPqXzsr927p2cyjgd+1Q6hWeOJtHbbTV3YmCzRGZboEudvyRS63eR0UzvUCe
         zJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478022; x=1764082822;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6ycbeHCv6YzVBfiihvNrBQTxTs7GIypa/MVav3f8pE=;
        b=EocMrAovND68hjS6lOrjytj61i4rZElkIFKmQUsU657pNCCarx1L9MOsAa6WB4sl2M
         1rMObGpGgYwaIm3H60N6y1PJ0tSWUKRJssHBycLZylab7/hXc4FUtCTjDYnxdaj5abdb
         3FrBrZodB3van9uJE6hBPIU+UEC3ZxR1BT8kMRoiDig7nqcF1Od8lYMiuEsehSoCkHop
         D4llVWLzgaIP3rXskvu/VMOH9FoBbRtaeBjOnUjpKaZFZH9N8QDHbFMP5yIV6hPs0OkY
         R9/et0Bc6AEdZydUaiBuwNkaLLe5gPpfP033zapR61AbLmNUCEGH1OYuzj4NdnCwlFiI
         tKkg==
X-Gm-Message-State: AOJu0YzSNp42HljdUcRDdOjkjZ2qsn42O8vXBqBXAJkMAJW7+/rDKLV8
	ve96dxvYavwNd+7rVPoCoDKrRNH/doFetQpolt19rRzOetQUP1fGKsUcrn/XDRasli+6Dgo1Nji
	OFRCqj3A=
X-Gm-Gg: ASbGncsAT3D4IBMuzurdHb35zNce7JVwncQ4B98Y2eeHziZgDERdGcMbnvrDT3LNupI
	hYmeh/YeyUdkpn4YMBIQzQ8WcV5p34t+GZAfQHdWrkDujRi6TZic94FulKLqnzjpe5HKX3xSdnt
	yuaveLJ+Cf7gvvStDsZyleoEkDFtF7av5pxcgp3l0Jp0tgxJDBsvt75m7ea2Gd9AJVkwENbi4A3
	UKYPydU4iqGHFOER1PogAXNvORgSa0nzut8XstcP9hfcBFsTCMuNuZMjoihEEoRZAP/jA5JeRh3
	4HUNEVsx7QVgmcKAdqMFm+r3pfckScx2BfeNpKzbbc+l8sVmJz7MJd9cVrPRFO0d0sonJOPGUJq
	7AgItprOCPjpfglEPXkG9ogC0Q4kOWvYbyYFq7Yek9Rdm9quP6EUilUzLXcEqucMsu+p+zl1itg
	7nRUwwWWxL+vbfTwuR++GIcdWjwQGXmvnezn0lasB5aA==
X-Google-Smtp-Source: AGHT+IH+SRzIG78Le1UGkTuOPhMOU5+HcBSFJxx8Le0nV1kHbKsPT2vPJv/0gTUUe2wMNoZCRo3Mcg==
X-Received: by 2002:a17:907:980d:b0:b70:ac7a:2a93 with SMTP id a640c23a62f3a-b736793d8demr1658422566b.43.1763478021813;
        Tue, 18 Nov 2025 07:00:21 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad456bsm1398335566b.21.2025.11.18.07.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 07:00:21 -0800 (PST)
Message-ID: <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
Date: Tue, 18 Nov 2025 15:00:19 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2025 03:29, Hangxiang Ma wrote:
> +                  <0x0 0x0900e000 0x0 0x1000>,

Why aren't you starting @ 0x0900e000 ? seems to be omitting some of the 
registers in the ICP block. Should start at +0xd000 not +0xe000 ?

> +                  <0x0 0x0902e000 0x0 0x1000>,

Same here.

> +                  <0x0 0x090d7000 0x0 0x20000>,
> +                  <0x0 0x0904e000 0x0 0x1000>,
> +                  <0x0 0x0904d000 0x0 0x1000>,
> +                  <0x0 0x09057000 0x0 0x40000>,
> +                  <0x0 0x09147000 0x0 0x580>,
> +                  <0x0 0x09148000 0x0 0x580>,
> +                  <0x0 0x09149000 0x0 0x580>,
> +                  <0x0 0x0914a000 0x0 0x580>,
> +                  <0x0 0x0914b000 0x0 0x580>,
> +                  <0x0 0x093fd000 0x0 0x400>,
> +                  <0x0 0x093fe000 0x0 0x400>,
> +                  <0x0 0x093ff000 0x0 0x400>;

The rest of these registers start at the defined block addresses in the 
documentation.

Unless there's a very good reason for that, please amend.

---
bod

