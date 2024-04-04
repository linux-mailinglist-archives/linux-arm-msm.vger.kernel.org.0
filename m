Return-Path: <linux-arm-msm+bounces-16399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B6F8987E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 14:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BB77B2BBA1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 12:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E86127B7E;
	Thu,  4 Apr 2024 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="UdPpvlmz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4056784D08
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Apr 2024 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233845; cv=none; b=sMU5cGsPl6pMZiJm6u4rnY4W9LYhNWUPThJOEPrPid9MscppjpvPHBNRezfYGhcCJW9zISReO46zcOH7k1m8iNWGb2AH2EWP3CtfLkpe6pxqf8h/NqqNAYG2XWu1cSnpM15QEZxobzu1LYUvhf41oooBJ5kcfu62ZKnHeNTlKMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233845; c=relaxed/simple;
	bh=f28NbA4ZuZA/fyXjKOiLtArFZfgGGB0391csJcl81uI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzVDlZ/CcIcbrf/yYzg2f/PSTMIcTubjXRZHDW1p5PSHlBEg0LotXFsolSlN4ZsbFVsxUYbRBQ60vZ6Iv++y/r92FnGDkVz9+jPdhI/U7gT3YAwsxCeLGVbcBPE3JDN3soKxD8uL2rXzocuaBxHOBlNZINrNvBX1M5ixZGg6rxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=UdPpvlmz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4162b7f18b6so2627135e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Apr 2024 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1712233841; x=1712838641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+BMPQleoesnEmuZIKvnJIR9RrNyhXeocOmGMELh+Uw=;
        b=UdPpvlmzbkRG0OBRspo3R6mr9qaIOIjxZ3kgoE+5VEYXEL0mQgi2XxI7E2yA7sSkP9
         2It8Fbwdwvf3cwC6wQ36RsqylPkisJvFNs64yUQahiBxtGZODn0TjkEsicM0HdeqUmys
         PVF4DoUzvrwAAN/I7G3AnJ+vbXnNN1c7y0BIbSJfP+qOgmI5QaHcFW2Za1wHY2YHj9Y3
         okSQgifFnSEurZ441Nh9NBkFymOqlRA8iCOIl8IYMDE8ghZ83NLvo3vyjCO5kypkYfl2
         C3AakstAoqzTWK0ctR00oDwjj1eE7htJoeilH/H5eRXyxXHarWWzHf9fTAsMb4TcGWxm
         UOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233841; x=1712838641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+BMPQleoesnEmuZIKvnJIR9RrNyhXeocOmGMELh+Uw=;
        b=uP3vCDQm+5d1ibHSLk1leoo8dxH1PAC3+v38SUydo8vq4cXr8HupTkpNyPPKBEp4/n
         bGaYoTqVdewZFHr0wxinaYJ/yjsG/u5WyWQqv3dT4DhZRqI5i1Q6v8++xmr9qz1ovPje
         1ZvYxr08HOyI1MYry/o/Xeo/R+F8k/pU+lPsflVqqDz92zjM1uvuXKB29REd1Hv8c6Uu
         IAFYMxE7e27Q9Sh0OZlr4DKfOExu0Gl2bzhRQ4/IfC6MiWTNwpYkH29c5CNPQ4o3swMK
         /u3pTsutIcU1W7Y05Jx5pA735oPFXsYVIh7qLOGMWnx6sjFBVTNrT/nlfBmnxyncbLsM
         ABGg==
X-Forwarded-Encrypted: i=1; AJvYcCUO8oxCV9tKmQbhcKKP1lgM7maSWVKn54qhLxiwlTr5moCfYk1VMPRGGJ6r2OG6eeoynWzzjRIkduNkDQ0khPbw+FZc63cnCXTKdAZROw==
X-Gm-Message-State: AOJu0YwQW9Re/gJRrXK58I5dSQXRa3Fp2cP9H8iM3SYqVAV5RJdT2JEm
	uDBYt6PG/Pn7kHi25auR/9jMOrrMcYUbLvvdpdI7XE7jP2jvBttrbRt1WM16WlM=
X-Google-Smtp-Source: AGHT+IEV9SRf3L1IqaNEnuhHOMN7UgW5DwSVakpA51/xjM2jO4fLk72OjgqTkeR4uvMKVXqT36uwBA==
X-Received: by 2002:a05:600c:3115:b0:416:1d2e:62f1 with SMTP id g21-20020a05600c311500b004161d2e62f1mr1874361wmo.5.1712233841414;
        Thu, 04 Apr 2024 05:30:41 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id bg2-20020a05600c3c8200b004149530aa97sm2617799wmb.10.2024.04.04.05.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 05:30:41 -0700 (PDT)
Message-ID: <e804b257-4dc0-45f1-a5c5-66bda51cf296@freebox.fr>
Date: Thu, 4 Apr 2024 14:30:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
To: Kalle Valo <kvalo@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k
 <ath10k@lists.infradead.org>, wireless <linux-wireless@vger.kernel.org>,
 DT <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr>
 <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
 <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org>
 <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
 <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
 <87ttkh49xi.fsf@kernel.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <87ttkh49xi.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2024 13:57, Kalle Valo wrote:

> Dmitry Baryshkov wrote:
> 
>> I'd say, we should take a step back and actually verify how this was
>> handled in the vendor kernel.
> 
> One comment related to this: usually vendor driver and firmware branches
> go "hand in hand", meaning that a version of driver supports only one
> specific firmware branch. And there can be a lot of branches. So even if
> one branch might have a check for something specific, there are no
> guarantees what the other N+1 branches do :/

The consequences and ramifications of the above comment are not clear to me.

Does this mean:
"It is pointless to analyze a given version (or even several versions)
of the vendor driver downstream, because there are exist a large number
of variations of the code." ?

And thus, "it is nonsensical to try to "align" the mainline driver to
"the" vendor driver, as there is no single "vendor driver"" ?

Thus, the following patch (or one functionally-equivalent) is not acceptable?

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 38e939f572a9e..fd9ac9717488a 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1040,6 +1040,8 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
                switch (event->type) {
                case ATH10K_QMI_EVENT_SERVER_ARRIVE:
                        ath10k_qmi_event_server_arrive(qmi);
+                       printk(KERN_NOTICE "NOT WAITING FOR MSA_READY INDICATOR");
+                       ath10k_qmi_event_msa_ready(qmi);
                        break;
                case ATH10K_QMI_EVENT_SERVER_EXIT:
                        ath10k_qmi_event_server_exit(qmi);
@@ -1048,7 +1050,7 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
                        ath10k_qmi_event_fw_ready_ind(qmi);
                        break;
                case ATH10K_QMI_EVENT_MSA_READY_IND:
-                       ath10k_qmi_event_msa_ready(qmi);
+                       printk(KERN_NOTICE "IGNORING ACTUAL MSA_READY INDICATOR");
                        break;
                default:
                        ath10k_warn(ar, "invalid event type: %d", event->type);



Regards


