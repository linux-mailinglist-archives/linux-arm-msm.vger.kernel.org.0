Return-Path: <linux-arm-msm+bounces-61254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB85BAD92EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 18:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F32941BC12E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62832E11B5;
	Fri, 13 Jun 2025 16:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UrXvI2eT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8118D205AD7
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 16:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749832732; cv=none; b=Hnk/wY5B3XTzzNj3ljXNtX3IvFXkJCkXM8Nvk+iQuKtCXI0NsQdyJHMRRd18m+EGKn86ZlYYj6evTr0MxpRC5Srkeh+fH+8M5A84mU1ZozUk8tNoaU8jJp1JTfPfxs3U3LabpQktXvfMFZF/D+e9Q/AEZxE5bjrlZJSMM6OS59k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749832732; c=relaxed/simple;
	bh=z+N8jqjN/nASPdQ0iP1STfKAC3rAtGf71WFeCKFFe4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4MkTHxx3ZLajzY0e4di3GSV/j6up5NQUENRdkbs7Dpi5mSu56RiWizJ/zJW18wn5Spq6HOIqyA8Ezk6lc/GDUxDOpXAg8JrxEfC2Y/vWqlqfg3Avx++/cq5GuV7vFyFwQs/JtY0iufHIzMi1oxxYM/enHy0gsPcH8IVVpasezk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UrXvI2eT; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b6da862aso151e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 09:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749832728; x=1750437528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cYUtT+6UfKx7Gs9aWpbJRe4xmbx/ClKSljdS1pnK8R4=;
        b=UrXvI2eTdCBGACPLTStoFa8xEcUAVUfn08PBuPpbkf1o2OudeK+zyn4d7/uwR1kpr7
         xY05abDosFePjvXdkjq3Z1G9R7cDDO1/abE1MGoIVo2Kynbdwyx9/pzTsXu+6ooDg4Mr
         Yg+OCI+kQyTIK40or6RBfD73KsUYzD8O1Ly5AOG1WDienuUVAS1IrHjr5HztulybFshF
         pSlyU7aFEnuL9ijCTk+5A5sbZ2FCCT1AT3/2XPa1tfqSse98akdr1To7MHDu2qMWjGuu
         WmB/2TxoU74ABPrDg2gMovvypgfejojxyhoY8tHiKbrueSL9dinJMD1dFZMSNF2N0r/e
         cTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749832728; x=1750437528;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cYUtT+6UfKx7Gs9aWpbJRe4xmbx/ClKSljdS1pnK8R4=;
        b=C4GCL45POb8knnHqLSry26GJQOV0vFhh5I1TUfiM9aNLRQ48bdtKJ9Ecz7IVDBAwXF
         oIZSXXtMNhkGOvVpyK6pokfJhJXsqy/hCVE22Oh6B7EqbvgAwRUfpowjAsKCrhuUXqSm
         aWUeq2PsJg2fkB7vnDkKvT7eFfxbDWZjQSPHBhc18XaU7mdUObL/qcD8eBs7eO/hRi/U
         Ag/9g5FqfJcN7qjHrcY97OZNEY962BfGKppwQ3EEgtUvLPpj4Yw04ClWEaMZNgnjUDW8
         Lt/a9dq1qBl83vj1lhJ/EKHdfSymu3Hm2AJIfpdalshRB1IKdgH7ed6Sv4y4G7NGGYUe
         F0AA==
X-Forwarded-Encrypted: i=1; AJvYcCWg9uT9pL6UiS06geK7pqdi+qjAW6dz8zSgt/JGxJ1GSh7jiP7eWhvG8Qsd0xjc1NORvzyBf4a4p/ZUwIOI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp42ug7HNP8Tg5zHSDE7KBbFV/AuBosnZ1k9F+djYA6PlbnQl2
	16CNxe5uPDY8O63xhYMcfohWzYJ5rE0GMTiR8VNfbl/AGhGYivBEz0F/DVDKFdQ722E=
X-Gm-Gg: ASbGncvciu3OEDHRccPhiitQF3FnSi9eP7OfqP1b87G86oP6T+inpArHjjc2DAly0oF
	zEkfAaHHbx3IfvhR413L+tpahJ8/abmX6qjO4MsRao5so62Sad3jOq0xPXjM1+ZdfHrRe/IPl5U
	rJLQIkEVGi3YWFJE3Q5ZRyvnRS2HTdj/As9BaPnXzWtuovMfhZbCRq+9SturCqVIJMrYMjAaQsK
	wSLOEc7roxhZIcxgkgwBbeOjIu/kIqGr/FhGhd/zi3yovFE8Zm7uookAjZjQ66hWsy/zsoFJ/8W
	hoo5+ubnigTejrmG8/5ZXs7Hik9FYEUq9peei/BBhCrq5zKGoHfP4dV8MVrcMXmC03t5LfTBPub
	glnqHg8B99Wqiw7mVmmJ/JbbdgL64vq9uBrrawScGIRAjVkdCfRs=
X-Google-Smtp-Source: AGHT+IHj662g3SbQNpP4iPqUmNkvYX9U4szpKPW9FX5yhoIuara4ioYwpzJZkOyb7Ebp5gFoz9go2g==
X-Received: by 2002:a05:6512:acf:b0:553:2421:f5e5 with SMTP id 2adb3069b0e04-553af991409mr356267e87.9.1749832728513;
        Fri, 13 Jun 2025 09:38:48 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1fd7aesm494781e87.258.2025.06.13.09.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 09:38:48 -0700 (PDT)
Message-ID: <0b94f65a-ec4c-44a1-8021-cbafe6beab31@linaro.org>
Date: Fri, 13 Jun 2025 19:38:47 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] media: dt-bindings: Add qcom,msm8939-camss
Content-Language: ru-RU
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org>
 <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/25 12:33, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add bindings for qcom,msm8939-camss in order to support the camera
> subsystem for MSM8939.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

