Return-Path: <linux-arm-msm+bounces-18551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75A88B20B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 13:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F2C128A9E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 11:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D7912AAEC;
	Thu, 25 Apr 2024 11:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="dTyOCpXn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5435322EE9
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 11:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714045736; cv=none; b=IOcOAUjjvju6YCli8wlI2eMoz4bKhcu4x4f4dbHZEZartGdmTIiLxuSyYfsezpmHc/fp6sBzNvLZJeSpE3VTw5b2hVWy4xjVau1GfOazfa86xsbdHUGOObDF+ybd9ncsr6TaeoCzh3cwOwwAe1N/Io86HdG7y12CglJbc4DA7YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714045736; c=relaxed/simple;
	bh=iRqZJGzbLO7immaT4nudfgfXnI3zAGjQPmg5oNwp8Jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eq1od+Y4i5bGD1ySznGhrEHW1pH/c5NE+26VtKX/7IqgpPPFElberB6/jszeKBkL6fBblIAaKZ49tEvvDS8Zhg0XjOc94YqPinGINw8ZWIDKWxohStqo7fVOEyZEHdPTwVocDAEoV4gP1hlsMbUJcfsEgBDtkm+DWIwBwK3Y6c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=dTyOCpXn; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-34b029296f5so930616f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 04:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714045732; x=1714650532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HaiwvUlPF7WAHLG6FS4I2jCzZYZaAZS8Db4/cIEwfh4=;
        b=dTyOCpXnj5OIawdlvw+4hKKvxtK2Lv8kA3qTHHWaPQ2ygYnudRZ2Smpo0El6KIIndF
         24nVoGpAVJoOZRs9rloecX4UyAJzDmzRIIXH4FEIqrDuLkQ2QJJi+MqxszhiyjcKFm/0
         doX/WjCWimogxslA8Ba+wjKTmbP76ZV9kn0F70ur+AILRDzGS+9b8Yq25WBRLeoHVWfx
         wWXMgkCDbi80LSrRH2Ee48jPkL+81GR6J0MAR5oQ+mapHGQUFbPCgVTEv1SNz4IDmamf
         8ynCc/K0KRWfgwyuEoW1KrNFv2LEX7TR/8E3B3M7fkQzqoFBvfZxwalrWMwW/Kabj5lN
         IkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714045732; x=1714650532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HaiwvUlPF7WAHLG6FS4I2jCzZYZaAZS8Db4/cIEwfh4=;
        b=bp4rOhOCl2DGZX94Gm6+RXzq4inl3lNh60BK9y9Y05TmwKf6CTeuGQ2lIyi0IYIUeq
         +trKWorZHN3DogBAMzqYnJlJnsLbzOtcAkahCOenygc96Evz+nhsebyAop6cUANB3RKG
         MY8N7oKww8/mhwnoChDIzh+RAEyZ06WrWgjcy0Vg+53j2Amx6xnyzaA7Oi0RIpOA5J3a
         +PxWkD0HCSaaEAeotedHUbX6T7omeD1e/yMFBtzwAH4D8ZZeikkdAZ2/zHtzw8tzm3uo
         wKZly33MJZwAm0moNt5U6y3iF+8cXDjOm++/Lmi91k+DILBEF5o4dzNAGr6/v0VF32pv
         G72g==
X-Forwarded-Encrypted: i=1; AJvYcCXUkWlt3KfuA6LIWXoEuJdQZjV4suvU181DU0PtbIlGP3M1rsWOLJf89XNmo5h80lWn/KtzjYX8z1GS3cnFvWh4AEeu6cm3XGmBY76nWw==
X-Gm-Message-State: AOJu0YxlncH2YioVFxrTRfOuH87lAq3kSAhyaO/m3Erxd17Cqp5OBnUi
	qoMIhaZ+2z2nvk1BOcBebT8ydjB9eCmGQZjkJ8CU8cFf/N9JW/K1mhnPGAyZGi0=
X-Google-Smtp-Source: AGHT+IEQKdEXXjmwHYjGtrZx+A4ntpBLtbov3wrDvOhIJp7CrXwZrZ9Zsbj80j2w2j8dI4s5T//PLA==
X-Received: by 2002:a05:6000:12c3:b0:34a:d130:611b with SMTP id l3-20020a05600012c300b0034ad130611bmr4607478wrx.17.1714045731749;
        Thu, 25 Apr 2024 04:48:51 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id p17-20020a5d4591000000b0034658db39d7sm19844255wrq.8.2024.04.25.04.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 04:48:51 -0700 (PDT)
Message-ID: <de65290c-0f67-4499-ba28-a460e6d6e419@freebox.fr>
Date: Thu, 25 Apr 2024 13:48:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
To: Kalle Valo <kvalo@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k
 <ath10k@lists.infradead.org>, wireless <linux-wireless@vger.kernel.org>,
 DT <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr>
 <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
 <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org>
 <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
 <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
 <87ttkh49xi.fsf@kernel.org> <e804b257-4dc0-45f1-a5c5-66bda51cf296@freebox.fr>
 <87h6gh406w.fsf@kernel.org> <ad5e178b-cd64-4a87-8994-f917993f3bbb@freebox.fr>
 <871q6tu6bn.fsf@kernel.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <871q6tu6bn.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2024 11:42, Kalle Valo wrote:

> Marc Gonzalez wrote:
> 
>> Do you prefer:
>>
>> Option A = never waiting for the MSA_READY indicator for ANYONE
>> Option B = not waiting for the MSA_READY indicator when
>> qcom,no-msa-ready-indicator is defined
>> Option C = not waiting for the MSA_READY indicator for certain
>> platforms (based on root compatible)
>> Option D = some other solution not yet discussed
> 
> After firmware-N.bin solution didn't work (sorry about that!) my
> preference is option B.

Actually, Option B is this patch series.
Could you formally review it?

Perhaps one thing I could do slightly differently is to NOT call
ath10k_qmi_event_msa_ready() a second time if we DO receive the
indicator later.


>> Dmitry has tested Option A on 5 platforms, where it does not induce regressions.
>> I worked on msm8998, where Option A (or any equivalent) unbreaks WiFi.
> 
> What do you mean here? Are you saying that option A works on all
> devices? I'm guessing I'm misunderstanding something.

No one serious would ever claim "this works on all devices".

Dmitry and I tested the following patch:

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


Dmitry tested several platforms:

> For reference, I tested this patch on sdm845 (db845c), qcm2290 aka
> qrb2210 (rb1), sm6115 aka qrb4210 (rb2) and sm8150 platforms.
> I was not able to fully test it on sda660, modem crashes without this
> patch (there is no MSA_READY indication) and with the patch applied
> the device hangs, most likely because of the IOMMU or clocking issue.

I tested on apq8098 (msm8998 sibling).
Patch makes adapter work on my msm8998 platform.

Regards


