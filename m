Return-Path: <linux-arm-msm+bounces-41990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1639F0B08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB627162A86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9E31DE4CC;
	Fri, 13 Dec 2024 11:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nm3ih19H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E648C1AB528
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089472; cv=none; b=DnP3PeETKTqOsgDb/rUw7Q+ZBor4vVOm/mCbyVjwhr4uBQkaLWlYcNAsDV/OEZ56AG5dO6BXfaY5kpPRH/JyvzY/vehIU/60F0c5AiEUNU8uow1MdNWgdSNRk+RQ/YeK0QmyWfTjps2PSC+JVUYAQPM2GeM8TP85h3Mv2tQxYhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089472; c=relaxed/simple;
	bh=FUAaikwISy2yCao/qOHxZDhQqBDvQRhKmpOYdt+b9y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOqZLROnJZV7XoIkbXbQBW2g45ziCkHrDuICRNlWcOrstpNelxAc4ZVt8YFaNsE0cRcJMya8pCiQgKl9NqmkjtnRKHyy37bNcR13yCEknJ5ASZ2D7EsrWDE5tK+wc11/ATl75J/pzjANufJ1hW+DBejotk+fcT3FS0it9g02RIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nm3ih19H; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so15496405e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 03:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734089469; x=1734694269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4y10DVoW4HQIavObhRHig9NVjzLlQQfmJ/QJuh+fR6o=;
        b=nm3ih19HBay+supzYW0II3jkqt9znNzcWOlDCycjAtrcZHQog1WT6RZyv9hdVXJV59
         ai5qgW+o2ZLyAZgkqsV9qWpPDV17/Bm4b8Lx0aZnmq6XN+rr+0gnltD1IClZcTYdlhqP
         RhQxMaygJ9cfBnQdjwFxAJdPSUO91RJAMT9gCuxGIJb1Ct+7LX/Ke3V99vUx5OJmuK+I
         RSLVShrVJIg7w3vTGxoaqMK+/2k5Twj/+X7BZYDbiO5CV0ZqjX+sqe39lVof47A5IVMF
         MCdvNJYLudr8WphC3sH8oa7zvKjhca9PJovOp2yL9dxSuYBMcn6H5Bnx8V883GGQXCxD
         c40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734089469; x=1734694269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4y10DVoW4HQIavObhRHig9NVjzLlQQfmJ/QJuh+fR6o=;
        b=bt3Q94aD3j9R8QJvfiPACzScMkySPRnUk9wjmrM3bhf9IEYF4XbWBRaETnxImScZ81
         AyxIGUvCuvTYiiqqHrIghZB07EliphnmVhCuW+mn/6l4fssoKmyeFlESMg/2KxcGVnGW
         u7GhcIWUgi5C0eriFe3RrMPLWqC5q68eJff0AsntK30N9dJoYHZYgMmHAZwwCmXrZJQP
         2ZLvXMAlTWQDGxISlzSLep/5SVyNwFCYT4I5bFJOomzizmFxcnoDdfwoey08a9MKaT0X
         e+SOH2nt+Vx6pkHevwea3U7Kvkx1GlutCBHKLc0M7oh/u9+czfdTS92JI8+k+LfxF/g+
         Nesg==
X-Forwarded-Encrypted: i=1; AJvYcCURPfSocAQOuya2jyojiccCE9+htbhfAvnEFG0gD4gwYst//f7JNFaIFbT20OhJ1eFBOqy0n58DDvdpr27w@vger.kernel.org
X-Gm-Message-State: AOJu0YzL7ENyPgcZtOyTcjkuArrprQhvsyesEvTPrY4RCUmiEHantRwp
	7WI90HsZ2+X/v5lThPfk+oO/XkOVDOlCDYhEMy3X72dxPgLaNLstkKJMmINvNvM=
X-Gm-Gg: ASbGncs5bQ9nVBZVlnCVEqvU7JG8ebELgtsL5qNTUfg/5HyIjnYUFoREXMTdMYaqHaI
	JVaq32qzo8TIhLNH7mfTMivxBaWFWWr0jZvYJPLoAwUgEPGsgsNSon1GAlS5xF6bolasANRwlRm
	es5uNwd9748E0AYtiRJaYlgXmlrv+iuuZV1ohbaIs+pp2950I5G+SxU4LSxA1cbF8CI+rDRhCk/
	s9iHlhgqqdhNtD0Ll5QWM0KrHbI8LkHlIYEzlYmCBwiPcjjnRO2rUes3xeRzAsyrCyFlA==
X-Google-Smtp-Source: AGHT+IETuPHPFuuNGFE6WzO5Hx+8zK5/GuDZNTK85Oe+eNBHryZXY+p4CHr5oTbKQs3HzS98KnozpQ==
X-Received: by 2002:a05:600c:1e0d:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-4362aa27057mr17130235e9.4.1734089469166;
        Fri, 13 Dec 2024 03:31:09 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824bd634sm6943016f8f.45.2024.12.13.03.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:31:08 -0800 (PST)
Message-ID: <ae83acc2-534d-49de-a0ec-b2117e5bd4d1@linaro.org>
Date: Fri, 13 Dec 2024 11:31:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: add venus node for the qcs615
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com>
 <20241213-add-venus-for-qcs615-v4-3-7e2c9a72d309@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241213-add-venus-for-qcs615-v4-3-7e2c9a72d309@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/12/2024 09:56, Renjiang Han wrote:
> +			video-decoder {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +			};

To be honest, I'd prefer not to continue on doing this.

Adding a compat string to existing yaml might work-around the issue but, 
it doesn't really _account_ for the issue.

I've posted a series to fix the problem

20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org

Either that or deeper rewrite of venus to remove the above dependencies 
should go ahead.

I'm not in favour of willfully continuing to do the wrong thing, 
especially when per above, there's a working solution for it.

---
bod

