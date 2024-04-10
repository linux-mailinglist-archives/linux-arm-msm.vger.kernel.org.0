Return-Path: <linux-arm-msm+bounces-17097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6B789FF23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 19:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30792B23EB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 17:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F7817F37B;
	Wed, 10 Apr 2024 17:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qgXzQd7l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F41F17BB17
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 17:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712771541; cv=none; b=AMxZRyzkNQ2d123K7q2JMxk87YjbQKy1ZGht93tHZu120exNwCtqvTBCAPzW+MRUmPLcK64+2iJ+1hURkIBomb0M77hhT5sHKoRU7sv8kuxvmIqZOxGijI5t9ljqCQbVPD5zSZzSssea1HwOXJZ+oARSdTaFECISB1PEnq25WmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712771541; c=relaxed/simple;
	bh=Lfmagm0VU/ENSbzyTlDC4+jjVBPt67IIy9krA8RAvHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HGRhzRLtIDL59jeo1dIAIFlDL019GOCZIiLKgL/NZOWowkc4Gf0xGzp6WG+gpo+9OX8ibig5LeV6mI6zNtbrORmVbJeWXFB8pjhhuVKYJ9eX2/yc0iIYkThLGACPQaaDmvQoHPrFDs0Sue3EIc7iDMgQFZFdRfvr8EyxLexGkWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qgXzQd7l; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516d2600569so7710416e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 10:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712771538; x=1713376338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/JL57b8mZR+eGT4B7pLnLps2t76k3zBdlXlsnrQHptw=;
        b=qgXzQd7lLiRBhQnoMxJPPDbUCiyuGr8aYLG/neU70Z38MadG7YrkclYwLJaTImRdAu
         eJ/NepsjN4ocHPjzdCUdljhK8iI02qKpENtmfdSsjIOOsSE8/48MOT2u58BTdzErVzT+
         L+MJNE36+ZnuevfGY9rsprtZFShtRCLalYpRyg4bT80PdiqbV+hV64kngQUG3tlihkF4
         FMcSOw+dB536zOSJ3t4osi2gLV9mKKloj6uvSInewPlaTnLJPMudrpWZotvtp2qHlIbW
         sOPiLDlWtIHxVvfEouiOfmmNKWproXEOd9g1p3b1kjZsw65taMbnJkjOsmtlBAlon/rN
         3auA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712771538; x=1713376338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/JL57b8mZR+eGT4B7pLnLps2t76k3zBdlXlsnrQHptw=;
        b=DTXK87wayUOfq0ZoyiXsYwcpHt0CG0KhwyyjZYUppqKz1Y7v54ZZ7V2FBP2UoVZubb
         rHjDK++vZBzonhYk2DiZ0WOo1F5ufhI1wgX2/3MZkeudmdsDixtu7C+Cst0M4xPDcPsM
         Ma7YDQM4SXcBL+IRhfiqMvyAoshso7bZj6fPTDpW0i6und8gtYRLtTo1J1Hmvdnv6CK2
         Lf1J2y8GCLE9QK3fX7SGUzL9PJWw+guudhuRdA+Z9+rpmv04rMHVfsha6m1VM4jWnzTm
         wW/jZAXjQ8EPoaK4+22ARNPeg5G14xjagYlzBdjyp4pTXyn9rtcitB0oCYGPRoDA4Z3H
         FDFA==
X-Forwarded-Encrypted: i=1; AJvYcCUkHGbOE2WF7WJJkF3A3A+eDiZt0CIECmNvmiQZcBi/HL0R6mclCI2YWUSpcHjN3A0cBEVR+2j7Vx7ShRaquKffera+tTsLbxzMWBajUQ==
X-Gm-Message-State: AOJu0YwmrvWRMzSLsjvx0n6h3sl/8sozxMSbLULlzNnyWtt41eIMZzzn
	DrYytj7EjTa2um8wya1y3eFFrAOrx/yIqOR/cmecK9cd1XD+grFiYXJ33p19ntY=
X-Google-Smtp-Source: AGHT+IGyvTFRBvbpgzMy5Z3pW9YsMbWGdgBzXAu6U2+ci9OErZcBCoTcJlAyYiknD6FJK5MgHZOmpw==
X-Received: by 2002:ac2:5a09:0:b0:516:9f03:6a9b with SMTP id q9-20020ac25a09000000b005169f036a9bmr2225221lfn.4.1712771537783;
        Wed, 10 Apr 2024 10:52:17 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t18-20020ac24c12000000b005158558022bsm1909780lfq.288.2024.04.10.10.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 10:52:17 -0700 (PDT)
Message-ID: <66a122ae-0a5e-45f3-b572-c741c828cca3@linaro.org>
Date: Wed, 10 Apr 2024 19:52:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom-ctrl: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20240410170129.248361-1-krzk@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240410170129.248361-1-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 19:01, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

