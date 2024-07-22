Return-Path: <linux-arm-msm+bounces-26729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A931938B4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DD15B21018
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 08:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF001662EF;
	Mon, 22 Jul 2024 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CXqbKitv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DD0140366
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 08:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721637341; cv=none; b=fQm+RiIbzdzfy/CIyeuDmM4r1eszQj09Ea9fSI1Fm3ejc+j6balfIw+W7eFnMUf7z03kpJE6ESY8jTbWf4oHwHrOR7tjiunBBgTrbLny9OuZ9Amj6uzpI35WJe6KF5ME0OVfxAWbmvK+GMJfbaujnsgG0Txqssnes/i1DfFkblI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721637341; c=relaxed/simple;
	bh=U7Eznn4L+ov25iSdpx1HiOLl16tIkq7P1rLsGayDoAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFJftkCET3+j1SA6SGJVggZ/oZNycUu5G74J4SNCsL7ST6jthcn5In+/kS/x39sBrTyqMx72b5FUeX85Or1bYduJajGyFQQg/wd8ZlcDPAg/R+xA0KGMLxz55GiYcfNDL2YnsygSXOeIfxByB11BQPAv1k7ULfzKEcBx0OlA5x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CXqbKitv; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52efd08e6d9so1972220e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 01:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721637338; x=1722242138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cWHKylAsBhQdum7PEydgBYOZJmVi93mkje+AFT6B2K8=;
        b=CXqbKitvEVLzkLso1i/9UcR9t4eKHrkVSqNwHL2fQRAKWH6n1u1GiVuUGtGCDlH6xz
         3KI2G5fSsS325Bq89FAcm+oxbb62kFOhIcPBOBTpX3xuqmuVh8KX+jfkzPHPcj+TjrQ1
         7f9pqoUpcfaKLra6+koYE2rE7ISo9LWtlrDGqGdv7sq4pK12GOsNC0ZUQhJ2Ped2PTwC
         ufMhrJP/n5vCpIwf54CF6SdaCVHwKR2Crq3+MQExi/W4Z+qysZZbjoDOJ2i1dx04sA8N
         QNIxzHzsfO8y6hbXAtQh+NoXb2qnvI9V/+z1dKkl7x87vVWEhxVltIAHLrIUPnNK0Qwx
         bYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721637338; x=1722242138;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWHKylAsBhQdum7PEydgBYOZJmVi93mkje+AFT6B2K8=;
        b=S4y1/kMe68LEu0+YfdQeXzburdxx4Twp3h7HDXvECGOhIwZOcq9UYJnCOhqojyo8aK
         h5gLU2QF0AkL5i1ZBO0UKLaKXnPDzWQakrHdRXIcfjJLXkvpbKkCVI4gw9FCAQs8K5wf
         kg4YiYELiAnB9C2Tse6QqhEUXESSfudHwa4MBCZsRpCOdR/oRqzhCNE3zRZpdetYHpdR
         ShFdqwnGjx4bkiMh4v5o6UpEPqi7XNLPe6/Kdzbjg8V36y+OG1oeIOxrGmzo6Y8xi0p4
         /jUaZvfjPpcZaYqX+4hwsN4vIfKLUVjSvYRd8ZeYrGVS13fkTpOhjlPAmZwjz6CPMAIx
         6ZDg==
X-Forwarded-Encrypted: i=1; AJvYcCXHmBC5hQv27993zbJLWPoymGL+tvmcggzeAajpimgcjNTDhK/PwtTZMjT4OtITB1mvOiJQ6ExlbWav3Vhcjz4ghS/mHHnoMeYyhA2pcA==
X-Gm-Message-State: AOJu0Yxm7aJ052vpXIfKkr9TmMgKEAk2P4901TfPBga9Ov4JUcqHUspD
	K8MVChxmAysGDMnMDNQwcKTewK/CrOcRb+P2rkOfbi0GU6SnW25EH/bC2OpF9zk=
X-Google-Smtp-Source: AGHT+IHjevizuibJDz5E5VdEkI5v5scWCUWFEx47E6z9+6Rl01COJBoI+jzaAXjPoRVvS1rMHPbfkg==
X-Received: by 2002:a05:6512:ad0:b0:52c:def6:7c97 with SMTP id 2adb3069b0e04-52efb885765mr3305700e87.45.1721637337693;
        Mon, 22 Jul 2024 01:35:37 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30aaa253fsm5757883a12.23.2024.07.22.01.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 01:35:37 -0700 (PDT)
Message-ID: <a4b19a3f-c3d2-4d49-8595-fc4df208aef6@linaro.org>
Date: Mon, 22 Jul 2024 10:35:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] arm64: dts: qcom: sm6115-pro1x: Add PCA9534 IO
 Expander
To: Dang Huynh <danct12@riseup.net>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
 <20240722-qx1050-feature-expansion-v1-2-c4d486435b96@riseup.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240722-qx1050-feature-expansion-v1-2-c4d486435b96@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 9:10 AM, Dang Huynh wrote:
> F(x)tec Pro1X comes with PCA9534 IO Expander, it is used for enabling
> touch screen VDD/VDDIO and keyboard's caps lock LED.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

