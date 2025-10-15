Return-Path: <linux-arm-msm+bounces-77407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 255CBBDECA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 23F204E7C01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 13:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4EC22B8C5;
	Wed, 15 Oct 2025 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eas/vt6K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6BE229B2E
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760535741; cv=none; b=CFSHvzx1LK5pDInmjRrqFqSIw5jbCiYYCCKKb3tHXVWkicXdPOhvd8rZui+gK/mqRbLE7aPxa8GBaBxfkcuciSotNNYKut4O/cBiUnfWt2YDGUmmmyqDU5Xdf9H/Bt128CAoZ6IMqQ9SFPCBDjAUQBtEQy9M2gqgclBQclC08ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760535741; c=relaxed/simple;
	bh=8ZEjVMazAtWAvqIzRKTRefBLcLx91zYhhGw4XMuX0xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZK7B0UI6Vn5vbp3MECHVG8Zwf5sKLaTa5i5fDh+uxwgFh4TF4lkBJExU4UFMs9yPh9pPeomcp23ExYSZYvJdKCTDLMxoqTnetT4yQrZQLdbR8qnPg2d/ylHmHMtWjy+zANI5wPSj3S6ZRamTc6nP5SYWPDf+SVNDkG/4YSfAYvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eas/vt6K; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso41116405e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760535738; x=1761140538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hy7Sxq2jeauDwIsq3RFiUz3/9uTUpwLAUFOHgM+Hwug=;
        b=Eas/vt6K5AVEUAc8QjbYHcLtShNnek0UkPwINwdPX3okqHlzvyTuFgq6Mz5eYVIXZ2
         qhf9Dj5UoeUqcRo/foGQ9iFXkhVNjOXvu93tjZXWTgOlCJkECsJIdWHoKdNkz/bA4F4G
         kVVxw1HaXB9qjrWzJb7LyH0lKNw1QxIw1A71R4JmXcBkym/ZQlU3cdB/S5jb1zIgNXcC
         GgXYFjZ5NRp/EFhFID+ApfdduF9MLcxW5xeHoXFjJyqPbVyPu9K7iHKLt66pIeFk4/xD
         ghNyp0T1aVJhlf6BBDL2fwuIrRycYGM159km9+fFjbaeoNmXvRdf17iEorGMlfjXdUnE
         UBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760535738; x=1761140538;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy7Sxq2jeauDwIsq3RFiUz3/9uTUpwLAUFOHgM+Hwug=;
        b=Uj6eRMyiAOGAxbguqY1zl6a/o1PCOcUreckEo00ouGicYoaQXmvZjcNumO0jddtMkZ
         nMelP5k7XyVmc1jtpkE3HamLgBJwFYkgu4YNzTDnYIWwdieb89ZCXDE59px/2Gwz0On2
         kTqjl05n1fdBH8ExdW2l5eJIkbFKRWBqdGVIhRs41jA14RcuJvV6aeQyuh31oILobmQp
         yLURPPQfeVpjloqCXh25i89w0hVd0bo7H/0vJXpdLxM31g0nuYUNzQAzYlGAOhcpZ/7u
         YFTkVbmkjS+XHf/PBtSAXMJDBIgXRCsou+CC288NqDs4vyrvL5tYToGnRpGoQYcO2CPO
         b3zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLXfBnRwRkU/C8nzEEpUhdjoveyq4bsMsyBLgsI/JbhrvqqTeylg0vb60/irglEMOZv/F86/+c/PAF52OQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxqPZWTFtLgGfsGyBkuR5KhLYT/GMJVY9hsm5LHzI6NrMW9oa8D
	pRBS92F4CXPzhUtSME4hr+jF6pb4ZCcOoYm+kyplY1En1c0As2sEbm6DkdtgqnlEhDU=
X-Gm-Gg: ASbGncs2hS4p5h/TpQLRXsvwJXK4/ZmCvobppk59h2WYg8suvuqWem++3tY0+Dwm9NH
	u39Q1ZMyteS0KHmZrLrJgvxUeWV6yb3RjHZi/DW7ToKYnYtk5Gtkl9liyXLbURUuXexc+cr0u2Y
	EDU9jou5GInzQRwHB4Bxl9KkVrJ8qNk9uEHg/4nPQGCjvylH+4a7tfhBXEIuZnQQsFdUhTGOmr4
	10jt5CegAPpR3RAOUcoJ4Qr67/vJqAE1vM4y6JJo6yZ04FPUfFSIsMZ78t8WN9NoAOuwi7d/1e2
	qSfxYZDi2wzAAxXWf1U7VUrkWsuR8T/xXZTNdxC+FV14NEKs70XoMOiIV2Bas99sNMNFA1VjSyx
	ROqDa+Rj7/jOUmZ8cNg3A1Y8tMBkikpaYJgGDlYMRW33sMJxr8Kq5a1P1/mIze4NoDd/O6lSQ6t
	kjSlpy9v1oWXk=
X-Google-Smtp-Source: AGHT+IGNyrbP28TPNxoPwZO9FwODuDXd4rA8MhI1zvCQw4TzwS02DCNbsFRGuJzAypYvXf9n3XAkEA==
X-Received: by 2002:a05:600c:34c2:b0:46e:21c8:ad37 with SMTP id 5b1f17b1804b1-46fa9b06d3dmr193578825e9.25.1760535738467;
        Wed, 15 Oct 2025 06:42:18 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce583335sm28846561f8f.18.2025.10.15.06.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 06:42:18 -0700 (PDT)
Message-ID: <84f17b74-a3ea-46bd-a6d4-efa79c1cb43a@linaro.org>
Date: Wed, 15 Oct 2025 14:42:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 quic_nihalkum@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-3-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251015131303.2797800-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2025 14:13, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Qualcomm QCS8300 SoC contains 3 Camera Control Interface (CCI). Compared
> to lemans, the key difference is in SDA/SCL GPIO assignments and number
> of CCIs.

Codename should be "Lemans" and since you need to update the commit log 
for this it should be "three Camera Control .."

Assuming thats fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

