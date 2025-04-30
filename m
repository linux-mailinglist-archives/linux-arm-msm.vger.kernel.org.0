Return-Path: <linux-arm-msm+bounces-56211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F62AA4576
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 10:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18B487B7933
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 08:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D30221DB6;
	Wed, 30 Apr 2025 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQsh4Ibr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249AF221541
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001811; cv=none; b=nVjB/06XIdW6xlLTZdD97iobielUIvDdHuLF2jTmR1n+kTZ8Qm2CKQwQYOCGKpys2JfzK3MDzVaNqvmolFT4IdsN233RTwRfEScBk1DfQsxnIWVB4q+QsPXKsPcTx0qvsEwVa/HF5LaC2Rbf9w4o6hihUga9f3bOai+ELRELG8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001811; c=relaxed/simple;
	bh=WwNEX0SJd4sKCdCIpe+GFVpttomXVtec+QbXcof6w0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oq/e9AIg/LQfT45Ws9mZjy+JXUdqVksDAg3EPNmZnTJzc2Oxi46NfwgIaK/m3LUTBl/HAee77uIoFdYxxy72OB2NcLNsllIrJPEaM/curUa5KZ4eawEUr+2CeMNK7eNWI8D6K+lKIuJa8f2pCeoK6o4/IbDMXLsYDTuwh5ipL98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQsh4Ibr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ac9aea656so7981985f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 01:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746001808; x=1746606608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQgBSGX6UzW41PwoF6qQQTtlNAihQ+2ygYEYwpcMDEI=;
        b=SQsh4Ibrs72fjakucYL6OXHZ79Hbf1Z3FbfrLR0cpq7ovAIHmBLn7wXAM700tKMgPQ
         +AFsRoJrn4RBMOcPeAVCmE+P4qTjtlTAoUfOa+mHGdXxX7+Pz4XftmT8NGYrTWX+Uv8t
         X/X8/lsPKkWvNFPnKM9Vt23jIFXDKAA9fRmJihalhdGl4xQX65qgfgWiC5oKeRjv82oQ
         jotWZEomIkKxB8a1Hy5PfXv4IelE8HnFles2xTzOvkfVxGSREJzvM51VMHO5bzZ8lWFh
         OoNM6U5/bwI+hlhvFsrZZer68L/WlrshPBGlVH3QieXPgHJi/FoIluBrXd56myBvkd6I
         UBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001808; x=1746606608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQgBSGX6UzW41PwoF6qQQTtlNAihQ+2ygYEYwpcMDEI=;
        b=jb48jNyGyeAcMJa0PF5v3TF8+e/iDgaO603KG/FrdZ0mjYOxcVaUmssKjLAxa2/bdy
         S0Cv3lVbiG7gG+THbbZVGNkuXGiAvQfVgzX/Zn87dLPex/+wfkUNb82q3kd0K3KHGPCV
         vf1uMOUGeBKy8V+El5W7QUeIaKtvvdNE8Wy27K5z5c7JcskoY7jzsOn8vGBlsGpiuwEt
         ErcTFNf/o/RuZkaP/2F7gKFo43hgxzXAw0A+H2u5VJUCS0dVwDhoI0xxby/hdipSXEAQ
         vmxYjRN6+oeoIM/E5osazxWLc24U8kJeSPvzS/888Frin2UC9K0x3G62WCkdZKlg+NOg
         +xlw==
X-Forwarded-Encrypted: i=1; AJvYcCU3znJRiUV28bAg1XCAJ9AoCirrEREu5ywHgiyjKNd0QkfJiyljb7tzpVst7dxK/nBOgf5bHVJEzC1ItWf+@vger.kernel.org
X-Gm-Message-State: AOJu0YzmCI84j8jlvTPe39D53NWfnJBdI6yIOVdPe412JV6Z3md1zjjd
	PqwVizdnzn7kvstH1FdoCi9qDBTF1sNPQ441viNw4+4yKGMEPlM9AiAIGJuM9ek=
X-Gm-Gg: ASbGncu4HqeVyixKVLy5akJ2oFTZUuiDeE4VBbDK4RloDHTFRnowYqkFOA2AkY4M2Kh
	dDseea6pSMggY7Pmual/ySraZFwffW0zTj4OEPQJaBJJcgW+GDceh0hOkTd64sod/ORZ7T2iVSZ
	uR91MaNXWvf9dZVrZMrMyLSOXZvtIikwPih8gtNmB2B1lZsqrX2eyRJO3bnNERZRoXaUXUGBytd
	eVfRE9V8xqVxAIQ+zPMdmyzCrRhsSotM8HkXzyyTBDImLBeDNFZKSMpwp92V3B3N/SNyDq26o9V
	VB0696XUUltB/OvvhPMttz1UTQxJ95Tmne825PiKiF5n2L5utHmcfjlfEAI0Yeb5OmPSWhwKBm9
	twQQFtg==
X-Google-Smtp-Source: AGHT+IEMbr/1aWW2sRvMW/gmZB7eZZbSIxh1N3RpCw5sEtrnwewfQ3Bx8136TYBSoJ9ZuMZ6YQF1uA==
X-Received: by 2002:a05:6000:178d:b0:3a0:7b07:af9 with SMTP id ffacd0b85a97d-3a08f7bb221mr1880126f8f.56.1746001808467;
        Wed, 30 Apr 2025 01:30:08 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e4698csm16399086f8f.62.2025.04.30.01.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 01:30:08 -0700 (PDT)
Message-ID: <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
Date: Wed, 30 Apr 2025 09:30:06 +0100
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
 Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2025 09:19, Krzysztof Kozlowski wrote:
> If anyone wants to know it and cannot deduce from compatible, then add
> debugfs interface.

dev_dbg(); isn't too offensive really IMO but if it really bothers you 
switching to debugfs would be fine.

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/e62825fc2ed737ab88085567f0947306a2a0da9b

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/ff0d7d980ec8192b459b5926b85a105917746d91

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/3580ffcbe507036c35e8f21e293f018fbb62d8bf

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/cd88d924eb55f5dfeb2283e6e0eef37d5bd4c1c4

---
bod

