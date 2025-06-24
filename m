Return-Path: <linux-arm-msm+bounces-62242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC47AE727A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 00:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 951257A8F2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 22:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969D4259C98;
	Tue, 24 Jun 2025 22:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZDTmQmo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04B73595C;
	Tue, 24 Jun 2025 22:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805463; cv=none; b=qNwlPJGdLn199ERXv77WdU5PinFIJyoW41gqie2EsKdji9zLKZx63cxiCdiXwWQ0ImhkYMzNiNCLb8mEE9T9VjSN1gPRBZGZo43VjZmiM8Pte9go4Yzpju4EZ9xyr0btvpCnIA83QQSiCU5/NIfNVrmGDkwcsZrL9Fossn4OMdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805463; c=relaxed/simple;
	bh=T8KBieTxhuZTahVfqdneQX0l34RjkembcNWLTB1cw7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oFM9W8TlYWx8Qw67wvErFHdB/wkBlJ2oRIIyz+j/iF+kG7Oa1RhFjw1BMXmeUuTiKKaKfroRBZhro8zgqQj0p6+FWaK0Q0rVXlJsWLgNoioIxibE9sWgi8Pu1MdDeLO0c5t2ar3a7YueSpX1yKzbTOOtX6BZLiZYCGRS3idOjXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZDTmQmo; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso9311727a12.1;
        Tue, 24 Jun 2025 15:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750805460; x=1751410260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Xczy8xEcTibMyimv1VhRCXIPBpvLafnj4WwxtkKaLA=;
        b=GZDTmQmoAQnuHJ+MiKwsuv6fv2HSObx+hKA+33JfXuKI2tWDLrt+KqvgK93ZIgFzK6
         eIzmG3mRRWDEiyRlJ1zHxune1sItaPVQj7YXdERhWl6Da9S2GPktC1Dv3CzWO/D24w2X
         l14u9ytYYSUjl+yoTtDscwTH/EwjS2NZdnf2jHIax/qw0GfE/oM7VJbM0EVGQuTBqinG
         5QstY/Z0faKl89Ta1W3QiKIrBPzjNqQ6/+dlvJi4vmxFO+9y0FQy17EZT1T353Ww1GYp
         SKwYbpf2PqjILwYwb5tlUs/1KZr/xO9oDVtV8aTMnVdWFpzUd0tBlx6kxHAhyg90+pnd
         xqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805460; x=1751410260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Xczy8xEcTibMyimv1VhRCXIPBpvLafnj4WwxtkKaLA=;
        b=ZKisJDw9i67hBtrW/t6/g1ZixbgkT+hJQkti4ZSpguvgq4TYlmL/HPHtr15Xa8DFPF
         Qu8nRsnMGnXLquABQOyOcvJoEDLk0ijZC8msiKA7tHz1wDvOUd8tme0oWJ7bChEA5bkr
         9F2lLqO2LniNW3cOjsyfSSDudTeVYOOKBSALGJLdtygM8pOWd/KoyKEqOvtrhlOK0Y2r
         Hz599PSmOGlytm+H71S+fW9FKfClCzuMS7rgigFhkMm9KyXz1aI03BMVikpeS7SHGCMT
         7lhYOTT15l2Ydb3edfOvZthkNDW8ABLJONP5y6hnExE+o0GfMdk5STq0nB3dnJZ2yEuE
         QKFA==
X-Forwarded-Encrypted: i=1; AJvYcCUG3qtcTGGbiyWahkd2kNsKgmCiNbeSpj0Th0YdU1duw7c0kiWcjYFHbkFsfTKlAZpHARW9twlYJ3XmIsaD@vger.kernel.org, AJvYcCVFBvglGgZDjZOASGaa+l0dt9WRR0X990ZqoGu5JuUBxneFGYrpsQGVsYZ/xZweC949YOhL1wlx6UYw@vger.kernel.org, AJvYcCWZe62JqAlzcueSWo/fMmumgi3G+SF1Tdvc+e+7OcYIK1CB/dXlU1eOQAxFVMoYRHthfZx7U03uUk9mMcvLFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvXfhiXl/DzCuW8u7vwo3nwqZbqntOyH4oWj+rda3YlZ1YaTGN
	9g5JaFCGGimSKpNYRBh0x4Lv9xuXc7J2IHJvsN5o+7e2OkWSOr76vvE=
X-Gm-Gg: ASbGnctwd6iqSaKG8wrK9HUySAWb/T90mm5nPRbDiNVFJwkQ/Eur6RasHCnnuW5gzGQ
	8klsXLLEmewoCcyWGg0yAbCY2VTopjWJSYHqMcPGUunA7xnO/3/zfge1mbb8Ssq5DD+NCt9RbAN
	9YlOqidsTMwaSxiMl+aitEB1od6uXeS+otO10Q6u2C8PALYybbFymLXdvBDUM3jjP+C2SzVYVi/
	v9eEdUAtaZJBDiq1Zclf+dbHh3eZKZICzD3rOVclQH6+OfBbAyus7EPvKRrAYWUitBtRsNBa9qx
	YakOOqOzsEsL/RzCtkiWOY7IVWqwJg6w/xoSmOyUJlRt5vNoNmfpVA2SRyqloBNADcoBBcs1DYk
	ywN9h
X-Google-Smtp-Source: AGHT+IH2S+/FT8sL/swFQVHYZ1kGEg0lc4whDC0ZcBw00Lnz/By+27Z3Dbr2+Mx6hQMUC0xhNC6gyw==
X-Received: by 2002:a17:907:edcb:b0:ad8:9466:3354 with SMTP id a640c23a62f3a-ae0befc28aemr84127966b.54.1750805459799;
        Tue, 24 Jun 2025 15:50:59 -0700 (PDT)
Received: from alex-x1e.localdomain ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0543421e9sm940093666b.185.2025.06.24.15.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:50:59 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	bryan.odonoghue@linaro.org,
	jens.glathe@oldschoolsolutions.biz,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 0/1] arm64: dts: qcom: x1e80100-pmics: Disable pm8010 by default
Date: Wed, 25 Jun 2025 00:41:19 +0200
Message-ID: <20250624225056.1056974-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow up to previous discussion [1].

Disable camera specific PMIC pm8010 by default, as some X1E/X1 devices
do not have one. Platform that utilize it should enable it.

Affected upstream devices:
- none
Affected devices submitted upstream (did not land yet):
- CRD, as part of CAMSS series by Bryan [2]

[1] https://lore.kernel.org/linux-arm-msm/519f9e21-466f-4e8b-9bd0-dfe0448920bb@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-5-3fd4124cf35a@linaro.org/

Aleksandrs Vinarskis (1):
  arm64: dts: qcom: x1e80100-pmics: Disable pm8010 by default

 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.48.1


