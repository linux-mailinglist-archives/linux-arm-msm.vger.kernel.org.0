Return-Path: <linux-arm-msm+bounces-78034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EE8BF2062
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 17:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 86E174F2BF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 15:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162BC2417DE;
	Mon, 20 Oct 2025 15:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u7YATRdy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A78123E320
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760973161; cv=none; b=XwzRvKKu8FNy4XEn+tJvbT5gnfIBFrhTlRSpx/JWiZ3Vvf7uAXj4RICZgxbfdRoSsYkhGkbCdhYutZh50WOu2JKg1yc7OJW1mfYQlAg8vhALoK7w5LtxcM/vOSYWhG+uU21yd6TVuzAdDub21MYRZ1jXhSIZHjB2jR9B9Ywn1i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760973161; c=relaxed/simple;
	bh=xOuPESK8A8ZsLAMfQkDlhPH9utzkEu7vEwNlSg8sCvA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=HmlCdtQAhxTc7Yb5fVhU1TkAw5tk8mB/aOh4oLECozag/0l1/aLJHk2r6HX5uc7eFL/LTw4s3HZvVOh2pKOHncviA9tSttOwB/iSM0MtbAW42lTtqkhTQsbu9dDpEYK6GlIkAjCBm08CiyqMSwIBH5Bgn+Lw3HGV0PbBwVe/4vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u7YATRdy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so24344615e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 08:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760973157; x=1761577957; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOuPESK8A8ZsLAMfQkDlhPH9utzkEu7vEwNlSg8sCvA=;
        b=u7YATRdyfxGr5Ef3fOzbO8mHJTbllMykVxqzgsXIYu+uanfTZ3aOzKbvAMoLRUhlMN
         yEMwq+CD5W6iHPn27fpHLpnsNQdtPIUiodC7TkPJ3BHW5JLuxR9v6dszCjQaUMUfynFL
         Mv3ojBMuST2+CnPe6PWrQatrJoR6G3xBcGUKz1q6M6qmhbezZxVeNQsRsrrkOjVQXQLw
         dskg33Z5pk3s6hGCLCkvkRUSts1E7DXOV0FE+UxDcFeo/juNgPTEFjvR5teyadZlNOuc
         OCSiQiGZMsAfGVwn1rjaddR+R3FTT0t2x8q21Rvrz8eckHSUoPbCFHRuaQMvswRTUfbi
         +Wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760973157; x=1761577957;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xOuPESK8A8ZsLAMfQkDlhPH9utzkEu7vEwNlSg8sCvA=;
        b=YFhrUYz/nJKnaBVo6IZA3zXhpfz9WaIwpCPnbV15OJlaRjrHjgihS7JnN9GmIHBar9
         JzGVnw1idEHVkZRiI1xwlCItJVIj0m+Oc5fE6oXWsKBBqMMgzkn1w0aNEO9WouctcTOB
         u5hw1zuv1gL2wggXu7dwzvLSdex6l/kMBMMUx7y3E+u4g2vAjcsXSR91B5VCroDu45wt
         fWk3VkPqbvJSbgaHx/bYebeVsecXMyxzFr87lMNRKtXY/fVmlhi8G6dbFeqYUxXy1y9Z
         srwViIXT+lfyk7TYO/hy6/gzGaO7fJub0z1phyrP3FhC9rj6c+A5xjKqULm0JTiEVDDJ
         d33g==
X-Forwarded-Encrypted: i=1; AJvYcCWystFa/VAEdupHmU8M1ei2mS8YKSzSJGLIo41t7wa2Xw7KjHBLsG0wnF5vIvzD5Kcb7jLic+TAldZclUzO@vger.kernel.org
X-Gm-Message-State: AOJu0YxNmOZwZODJVdWArVjEG5551SRpUcp7W7LY1ljZjEFokn6Ql+z+
	gWVmDuv6t6xc71ODASqg2RJaPUW8TDmO4s2u+Wt5C572JuZ2I0drJO7dhqKe7KynZqk=
X-Gm-Gg: ASbGncv6QaWNFceGubvU4YEEzwqP8sKAKi9Q9stCU6fgdmpjllmhKlgoQ2VGl4dl9aU
	GpqqtTOnNNOBr4IDDR5obdcpW3z5PBv5X0rooqLm3DVdjqgBfDyfqVFjvWiwhO7ArAcb8HUXRXO
	zme6+kjGqfCMpgG6WaR08UqXvmPDnWDbExLe1sXvaDccw3gj8CBJVaV+4NLml5SnnGpULY65oE0
	/SV8ODuJ7hGBngVRvzC9HkYqNyAe628nIPoFX/0w4qXbpqx4vpwcJKsHDhMlro9pfksuhdfKlm3
	gyPhOcJDn0OJNxrxXFXbWJnUifqyfSZ5IKxjWRTfg7v0vn36MhQ+OwW3XecrkSuShviUJSTG7gn
	rsGr/ZcINMckktUT6LvmD/MbOSxLkSfhJGbdtnY9sAYeTwJlRHjncmKFHvSCNtDQ4iaxviRGibi
	I4HSs=
X-Google-Smtp-Source: AGHT+IECoZa3fLJQgVws7eIYsvFcF+35q6vBM+53448SH1/XsTn40cSP7eTVirwX0Mnmnf2V5Dy6mQ==
X-Received: by 2002:a05:600c:3581:b0:45d:d5df:ab2d with SMTP id 5b1f17b1804b1-4711790bf23mr94199515e9.26.1760973157411;
        Mon, 20 Oct 2025 08:12:37 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:9f99:cf6:2e6a:c11f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47152959b55sm154497755e9.6.2025.10.20.08.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 08:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 16:12:36 +0100
Message-Id: <DDN8VVZ4ZL38.13JN04FQV1254@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>
Cc: <perex@perex.cz>, <tiwai@suse.com>, <srini@kernel.org>,
 <linux-sound@vger.kernel.org>, <m.facchin@arduino.cc>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <Stable@vger.kernel.org>
Subject: Re: [PATCH 2/9] ASoC: qcom: q6adm: the the copp device only during
 last instance
X-Mailer: aerc 0.20.0
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-3-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251015131740.340258-3-srinivas.kandagatla@oss.qualcomm.com>

On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
> A matching Common object post processing instance is normally resused
> across multiple streams. However currently we close this on DSP
> eventhough there is a refcount on this copp object, this can result in

even though?

> below error.

[..]

Best regards,
Alexey

