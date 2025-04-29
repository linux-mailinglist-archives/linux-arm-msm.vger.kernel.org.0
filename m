Return-Path: <linux-arm-msm+bounces-56167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30366AA1B6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 21:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AF7B1BA62B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 19:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0689E25F793;
	Tue, 29 Apr 2025 19:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rf0BKcOU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1FD259C9E
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745955643; cv=none; b=m0D0ZcgJFagCcTuTbn+TEZWHkKZbD4DfIupYDvM8Hgx1jjH/JEPXKcZ9bFz+UD6pI3whsGJVymsm/xRwTqWCzQKFll0GDnwF1AEVh3Bg75YbOln7Isii8+F2lCaIoIgnOFY+ucXoyXaRl/2OAlDrYLiaTeb3xFEuh7soO+ilugM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745955643; c=relaxed/simple;
	bh=uyBW2F53VjXt91VxFs8QcOadp66bOPozuITiEZzqW5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gKbGdmexPh8CvrYB+B+QCK7vrZPAGQtGnlo4HdqOoANlAbIooy2gZKHHl8BdZLwk+40cJG8srlnrp/iaMtbZla/h3MNfEV3DSfRzSdc7VoWk4ebu4cEH2d1Y6SxjDbmGn/pocOwVNGy8DR46VQqERprDjWOwlXfmTMrYUdk8A0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rf0BKcOU; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so5879831f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745955640; x=1746560440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0PbBEsPipY0WewKQtcQRsKwmeC5ZS0HYXbMTYUT+Lo=;
        b=Rf0BKcOUUiwJ/A2Umzhj3/fn8+p3+40lItBl9QGD0Vm1vAgLAgx1mF/Td/SqfWXMXE
         Iqu7x1f4bcpVIFfRI/WkVaUGfaUGThsOxeu04AE4I1hQ+nTTqWu+Kt1zNoGB/yxDp09k
         mjMOSwhjIRFwj6l6UBwCJH9jtip+RQ3zlmrns7DsSemYWF1A6SM/sAiUASvwNglyN0JG
         u8/jj+4EX0nV/kpuSHYCLVk2mr5voM62wgCQhILC/vaG58v6MVUEpTKto1EkcGXVBtVN
         NmbDSL1ucE5mYzDdqszwLk2VDb7sYHBfTPwiWv8yUlMysi+KpJgroKy7/FhYZXlx+fQU
         Hn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745955640; x=1746560440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0PbBEsPipY0WewKQtcQRsKwmeC5ZS0HYXbMTYUT+Lo=;
        b=xErzHrk8OhMPMRMGeBMYVjkRbWa85stUCTQfdOJSBLjgYWwqTSIW3vb6d0i+hFp4ip
         +uF1N7b3x4+jjgnzGvhvKGgqnov1LhqmTaELLlsNFVl8zaAB0PvVXGn2k44zLgXACZtt
         RF4VlFRowwz6kG9vQp/0xEct1qNa5ax7TVgBmvJ52cG/K4Lc9msdwkV6UJsLbnGQhrPn
         uLQr2gi7cqnnh2nEYzSdB41YMsFwLrYr9RVZFHjqWENBcQzGcoe4cu49AvWQvMqMJ6Gx
         HgzpM9hHvX1tA6qSgqCXxPxre1z+8QomOVRffotzSng84XeUYdCsNMk0/rrJrQFwKoqb
         rqaw==
X-Forwarded-Encrypted: i=1; AJvYcCWjFKlasezjhXiPWGUm0qzo0DL1yHA9TKnRYnT1yPqAPlxbTSbid5d4Aqhwwr/1fRwuyZXfjx08qrn/FQ70@vger.kernel.org
X-Gm-Message-State: AOJu0YzFOIhBZLjQ4pMlhgC9uSLEmA9RGlygJajAh9WsAm0fD6x1secF
	6lMpaIi8Ea6g1zLB5UAT4W5A0a+8iGVbkNRj5mW4pXelcbX6MYKW9GSeK91inLs=
X-Gm-Gg: ASbGncuxcbjJmqImAtm93LnFFGPGn1pqO55pw4JJsMu3RkzwRp/JmPi6bBSc1eZAQ9Z
	wQQQ99+WOUJqmh3eiyT8v16PifgCz+XteWU0TiTlsHGAkn8AX3yByFsrrHFjhqkyzVxXy8FkY5r
	YCPEPQnS/LKarPjPJSdz+4VOxHltS3RG7I2ZVOArQ+g5yOomveOno5yMZ6RKV0HrWWLafivp1i+
	mPDFYPFkipwlLluZ4KRi6rRhm9/BxmtePTAVMUbQns7jygHVSR6VaLI3LywTwkv9Rf41IlVA1Rw
	cc7rgmUh4IiMExpmfXAlNp0hn8CBmIRA/CKrSBBFOZRCR4FHbDyyquA4a3Oor+SMaZCUyaIhK4W
	O64cFOw==
X-Google-Smtp-Source: AGHT+IGdtirTulKWn3yLeBQ9FLdZchJ1HiTAtu6x9e+yU+nlnzwUCocNO4vXYUU28KgjdJMHGmXGhA==
X-Received: by 2002:a05:6000:1a87:b0:39e:f89b:85ce with SMTP id ffacd0b85a97d-3a08f77c159mr564828f8f.26.1745955640581;
        Tue, 29 Apr 2025 12:40:40 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441af882ee4sm20920745e9.39.2025.04.29.12.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 12:40:40 -0700 (PDT)
Message-ID: <000934a5-4934-4d21-8859-897fe48474dc@linaro.org>
Date: Tue, 29 Apr 2025 20:40:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2025 19:08, Krzysztof Kozlowski wrote:
> -	dev_dbg(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
> -		vfe->id, gen, rev, step);

Please just change to dev_dbg_once() instead of entirely removing.

Same comment with the other patches.

---
bod

