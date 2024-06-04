Return-Path: <linux-arm-msm+bounces-21605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F1E8FB45E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 15:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2585A1C22504
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 13:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B43175A1;
	Tue,  4 Jun 2024 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="pVisfXq3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D72EADC
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 13:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717509054; cv=none; b=sgOoY4R8P2RDLfAh/726UF52VXPfjkAB7wwuHoMiFvVE3TYuv7HVkWsmwYDXCTYOkD9YRYVAPngpqRAl9wBGVj0fYQAfcL+VmPcWKlkZ6a3cCNiol4CnhCzfPU+pzPp8WnYFjAcIH5oSM2ALAwUakK0kbOazQpuq1RbntpjfEBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717509054; c=relaxed/simple;
	bh=KFaoi4oj1/WCHj7ZnXRUSSLfeXGtAKCrn+Jrsl+3K3o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JcQMsfwnreTp4A5FcegJx5z0ymZAK8d/eW8JIKE6aZbpc74nfJDtAg878YPcrks5t8mH6gVZmE7SCs+huyCZv9PQru8Fmd7LTmY265K1ItP3+W9iQPjELMqVlFIJsr2Yv8jmdFp7Ze0yHfPLyNUsTxKMlCw2/74VEHk1MYHvnIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=pVisfXq3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4213870aafdso25175635e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717509051; x=1718113851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A0z8y2KXgWMctf+4HNibjJ24MwvWsWDlBq67X1P0x7Q=;
        b=pVisfXq34AYR+pb3k8jPclx+rkTkILa/F1JxGgEwX3t3WeCunrcb7ArcmfUjtucj0K
         PKZRP4KWgootj3iN85l/+ziVhOuGNyEL0UBEBwrqJ6KiGEXiCO9ejqA0J8UgZw874BBr
         NLhYzChfIjkR4SMxnDRWDGnqTW4RszsQBqdgAzcK/ZBfdybTNPAJNQ8VnBK0lm0X+rw0
         4leFa5M09deEwlbKOOoabf2NFys7+k5/cqCdcHeIkKVnlFeWG/nec543V0evQqlORpol
         Ycz89LT8iQ27nNzpiRYaDxI1lJSvMJ2BWMH7CAMv2rTqda+AgP7aAV6UqpYZu/0m+lU+
         vHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717509051; x=1718113851;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A0z8y2KXgWMctf+4HNibjJ24MwvWsWDlBq67X1P0x7Q=;
        b=nYIvly0GchZG6QVEzjIJV/GCnRek1EdVSDvJanivDIIJ6vESwVOPSdfeSWM4EG9IST
         sGImn24r15V3ixHYOZ/qt92Ax2IdXIG0Ym/GFMdfAM2YB2lgnFq55QR2EN0SzJ1fexZo
         l4xUU0qzsSe000v4ueppYIH15sOrE50O047W2q+8xCNTKVAeZGhK02T3YDYJbsFSk50c
         LOUyJeWH6APuDJfs5ykAuTEHpeasNf6KO0il6t9BKqwbsOKj3rYKovF5jM6nW9wmtrn5
         Qprlk2fVh0nRsJmbx9YEZY23EW1SHNB7fkVPde6aWUUKBrb4AK1OaztMYPASLkq6O6mY
         YqQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnVOR0xjllC7TgnLutlVmRVubGoOT96OaErp6A6g6fKhbMTynyjZWL6zeZKkDJBnikbHkeB1BNGJ606olChCifTWwGazVnNDjowgqjLA==
X-Gm-Message-State: AOJu0YzBekyEEHwGJ3mav2Fzh2hNXKQ1f1Olo3D/aYqniiKmrF1B0s2t
	dw7gNf0wscDyjtzy2Znz/bPzMgNZuWChHi2SNKQEjS0I/lqZIkuyeglUkXvcU94=
X-Google-Smtp-Source: AGHT+IEc2+tqSTQ0+czKAp3EtUoJe7f/LGCfMvFWif4Jd/fuXiqh5Du825hPDJRf3RAhHkvuNgWcgw==
X-Received: by 2002:a05:600c:4f46:b0:41f:f32c:e097 with SMTP id 5b1f17b1804b1-4212e0763ebmr92670415e9.23.1717509051469;
        Tue, 04 Jun 2024 06:50:51 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42133227f8asm139569755e9.19.2024.06.04.06.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 06:50:51 -0700 (PDT)
Message-ID: <c1f26026-dd53-4082-bb0b-c35db2d17fb7@freebox.fr>
Date: Tue, 4 Jun 2024 15:46:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/4] dt-bindings: display/msm: hdmi: add qcom,hdmi-phy-8998
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
Content-Language: en-US
In-Reply-To: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

HDMI PHY block embedded in the APQ8098.

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
index 83fe4b39b56f4..78607ee3e2e84 100644
--- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     enum:
       - qcom,hdmi-phy-8996
+      - qcom,hdmi-phy-8998
 
   reg:
     maxItems: 6
-- 
2.34.1


