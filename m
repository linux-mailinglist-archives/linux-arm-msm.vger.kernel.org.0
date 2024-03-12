Return-Path: <linux-arm-msm+bounces-13938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2DC8796A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 15:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A2241F21988
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 14:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB4F7B3C0;
	Tue, 12 Mar 2024 14:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y4W57fqD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAD77AE6A
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710254690; cv=none; b=iQcWEKYSDFQhEOJCB4RqHrqpp0Ch1P90Rp2S2BQy7pKrIC1bwuJCxaisBTkvqicmS1vu3y7E3zpB1Qady2rMFmVgGo2hyvCjP74ovLXgKQjWy9hJQ7bJQbBUgA6swseaAj6RC06AYAi2uPvq6DPArl52mHhBPnhsUyo1NSRqPYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710254690; c=relaxed/simple;
	bh=l7PXpZXI01MHCt+hHEmDQ8I/JZ4vbfrmDPTT2vYwv68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doxhJ6SLSLItLBk0sNl12J0lduTPUeptWzuFQsbu7R5T+jeC68qSaoPGqMpXbqUQE7r+lixF6hL0LvkJMVcwcQd8rlu/qQQT8mWHyamntyfRGvAO22enbLKG0CrxZLJJ8nONBsZMrj7rpEMn3iYEuT+qsN7EASr1IWLJ5k5O0i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y4W57fqD; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d26227d508so84593451fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 07:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710254687; x=1710859487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmj+F0z52Li+K1sTvSePjF0GjlsGyqeJSli7wVVMSxg=;
        b=y4W57fqDpXLk9d6w30F7ClHmWQSP+T4jklHSO7kY6nrPHs2ipWmAxfymt/rToDL6Pc
         KvwIlqIZOVv8zPB+YTf41D627J3/RBSZxyM1ft4GbGMHfMoekm7fBOxP5o2j/PPjcdic
         IJfmjeGuXJ54F7bVoUdDKnbuF1lN2+or/IXwcbcqkeLileMzByz7MyBHtkDP4r1APRZL
         Cayc6H3kpsTuVjnKu/1OtQ/Iec/utwp5OGMRUymFyvxPYwnn6k7BsYQte/k9L0X+katC
         dEnEo8b2OEossfJRoaLcpTFqeOwnRjMEXBhQDYbq31azB5yKWEwjE03HmtO7taSYkRnX
         C3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710254687; x=1710859487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hmj+F0z52Li+K1sTvSePjF0GjlsGyqeJSli7wVVMSxg=;
        b=t8hOgY+AI/U7V/tfP4dookSZp2WBRhTswqSPAsLTmQAwMW3u1myKKxY5EnrthFHA16
         0sjyqShbY5clNQ81yQ0s2rEZX1zorz06oX3p0XghjuuntQ5rr/CrSkDvJsHw72Uayn/4
         EKvcKko7YYjzNX3/x6QmmwEuVmlEjTgK6jWtjEi+4tBd4Epcv3VXbRWYZEuVddKVEDHH
         tbDmqPG5LlKButnWUwc0gHTjy8YMR/VYduKgiW3f/ZWFzIrK51T23LHDAtF435gF/Cyh
         EWCcIgDnPOS7mCpT4JrWzjARAX91IQk3/mKV2i0TZ59Z+kOdsT66NF7c/0PBgS2njL8l
         TzLA==
X-Forwarded-Encrypted: i=1; AJvYcCVs2e+Ml3OFpYgsrlL5IfZ1nXItTrvc+ku4YgBXu/oPDPFHzvOq4dKaXYPtx2qF9LymijIWh9XfSAxmm1uBe702xtax1R3FjsETzFRDaA==
X-Gm-Message-State: AOJu0YxMHrLmKOUl4hbaXv95+ucC4AfD8tQF6ClAij3iPaflKdXbZFnZ
	EgS+8Q7ECMmeDeybWMCxqVkaZXYToMbtBnqBk9SAuyD5zTPeqpXd7UsamJIjT/oFWEswYtj3JkZ
	sRzw=
X-Google-Smtp-Source: AGHT+IFFBjF9LuTxcCz5RrKNbfWJ5SkfQz9Wt8O54/LYbK1vtsUcRNeb2QIqZOgtU22jErtQ9pTySQ==
X-Received: by 2002:a2e:9804:0:b0:2d4:529c:f490 with SMTP id a4-20020a2e9804000000b002d4529cf490mr1424131ljj.35.1710254686722;
        Tue, 12 Mar 2024 07:44:46 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u10-20020a2e9b0a000000b002d406e8f01asm1626480lji.71.2024.03.12.07.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 07:44:46 -0700 (PDT)
Message-ID: <9af62237-98ec-4130-8523-f6c9cb0ad281@linaro.org>
Date: Tue, 12 Mar 2024 15:44:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] media: qcom: camss: Add per sub-device type resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, andersson@kernel.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240227122415.491-1-quic_grosikop@quicinc.com>
 <20240227122415.491-2-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240227122415.491-2-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/27/24 13:24, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Currently resources structure grows with additional parameters required for
> each sub-deivce. However each sub-device has some specific resources or
> configurations which need to be passed during the initialization.
> 
> This change adds per sub-device type structure to simplify the things
> and removes the magical void pointer to hw_ops.

I'm not quite sure what the benefit here is, as opposed to simply
extending <name>_device?

Generally, I think the driver state as of today is somewhat backwards..

We define a common set of resources, and then assign them subdev-specific
ops, instead of defining the subdev and consuming clocks/pds/resets
within a subdevice there..

Konrad

