Return-Path: <linux-arm-msm+bounces-7829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA02E836DAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 18:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73D552876D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 17:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C515917E;
	Mon, 22 Jan 2024 16:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J0zrVvE2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7465915E
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 16:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705942205; cv=none; b=pp5MIZD2mGU9KvZaZlmBm67kmH5fZDzdWhZ4jiGVvMyuspJcBDxSy/JUep2klY35v7OcvIhaFcKPGoQmPT2AQJYj+2szV5E+lZa1jkCdSKFXQOhGuJ77pgPZO+btATGqyfXLeAtAn3pR30JABBc+/FRJW2FNs8iRvEAa4DstoJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705942205; c=relaxed/simple;
	bh=NZq5+dAFqn48RMhvQUsO5Asi9OVWgIRdClURIQH3qbQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hLJbMy4kHeuvgLYkQQhnWbzRzAhOiJgSxVjSHa4dICTicGYtq5+1sOl0Feknrqi1hDClSJYDJM8XOUeO18Lf9TRRDmV+JPp447TgdtcEnc31mFXHvpvy9hhGGxn3bLi7dgCrvRWNSNxSZTugMycJeBVTKZKRefntCPdbj5/hUPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J0zrVvE2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a309c0a5593so29353266b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 08:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705942201; x=1706547001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hx0v8Bj4GKVZ3QX1c+Yo1eWfE6TjAxBrGSt0bJT3EUs=;
        b=J0zrVvE2dYtsGiHoEZDhmB+c2WM0+r9sNzTdUDQNeuHcajsByqMdInvbNxIyfO3EPl
         Ik04UhXc+rJQ56n9Qn4JyuHkrzo4l90kSbOn5h8NZ7lykvmPGC2NBnY4zhxSCwXWE2Ns
         Yn0zm8nYgqujCDOmncW2bND4hrWnq/ExL5SA3HuibqpVIszskxQf3KEa3ZaX3lTUmAg1
         zDp/5PPUM//QvJbCtBM3mDes2MzIahlytf2wc6tgpSgNI9fFx2V34mA2DOIPC+gvBdKH
         8IoVY3qi3trafzKo9b9ljt1SUFbmU5+BSt5LTvCcwJlUnYZm9EK/YytLzRK2PF01E+ud
         kaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705942201; x=1706547001;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hx0v8Bj4GKVZ3QX1c+Yo1eWfE6TjAxBrGSt0bJT3EUs=;
        b=oic+RY82oCD0YiAbtgv+rbOCMxegqdBTGSJzmRDYnM4jrmmRnI7n73aOAk2PqJAjki
         r640qArOiGoAYjaTn2+L9hAQlF1oumx2AgAnpu2O+7WUKkew79zweRFQgsnVLYVlFvDt
         ZczWEJLpYm4DTdoXgdGMAkJQVsc8xc1p7RaCasdgm9+50wbI9zRSqXTrW1jkRN9GRGcn
         9PuubIhguU+oQu8gQ8s1Wiz02pUigJm0Hy/+5X1w9SVM5b34AobfdA4ideO7JOGEH+w3
         +GOGKwoUqp4qN2E+lgiDnGh+zWdgHJkHRm/NSYoFIrcPviVZM7eruB5DLbFzlk/8jl22
         YVMA==
X-Gm-Message-State: AOJu0YwYko2SQIOxGcaWMHYeAMiL8EXUNydXksBsJtTj6/tORHbvtfca
	YvuxIEAcYlkRhFLW9rVi6zIlxefA3Djx2orbmea/iZvUXkaMzTvRBGmKROhPq60=
X-Google-Smtp-Source: AGHT+IHOPYeXj/Lsqjzqr8U95ZUAS68kHgZTiMF53h+FacnBwiNk7aQKA+zEWelNKA+si7MsKDlkww==
X-Received: by 2002:a17:906:1994:b0:a2e:bf57:3613 with SMTP id g20-20020a170906199400b00a2ebf573613mr1448037ejd.10.1705942201677;
        Mon, 22 Jan 2024 08:50:01 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id bv9-20020a170906b1c900b00a2bfd60c6a8sm13487452ejb.80.2024.01.22.08.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 08:50:01 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, kernel@quicinc.com
In-Reply-To: <20231221-qmi_elem_info-const-v1-1-81db0a9e6616@quicinc.com>
References: <20231221-qmi_elem_info-const-v1-1-81db0a9e6616@quicinc.com>
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Make QMI message rules const
Message-Id: <170594220086.17125.3833934694462346103.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 16:50:00 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Thu, 21 Dec 2023 07:16:04 -0800, Jeff Johnson wrote:
> Commit ff6d365898d4 ("soc: qcom: qmi: use const for struct
> qmi_elem_info") allows QMI message encoding/decoding rules
> to be const, so do that for qcom-ngd-ctrl.c.
> 
> 

Applied, thanks!

[1/1] slimbus: qcom-ngd-ctrl: Make QMI message rules const
      commit: 04b945e4cf81a12365f8207a4d34dbc81ba17413

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


