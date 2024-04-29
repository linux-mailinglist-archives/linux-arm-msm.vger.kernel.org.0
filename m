Return-Path: <linux-arm-msm+bounces-18803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 401698B5AEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 16:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 444711C20340
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 14:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251257BAE4;
	Mon, 29 Apr 2024 14:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="Nhw9HWjJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0477476405
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 14:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399704; cv=none; b=n9trGwo/e6lHcrBTKYQlS6+jAwOrKF52CAaT/ZWM+NeJPRX1H7cWm7xoO8G7smfk7L6y2WWIb+BeBcOiurcgMuaUfpZgfwpzCOdMaPrDAUC0wyqU8bpLEyM/QLbyNzXPrxo8GfRb6DsLX5+fK3Q5b857nvaWQDqayJ+FbNm2m3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399704; c=relaxed/simple;
	bh=UMmU4EaPtt4Sc7gHKo5oC4Xvqd8k19rulgB4e7VGPFs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=AiNrBIrH6ScDRKIGKrGXQNGz4L/L8kRIH/rqUA6Dm1SIFvbx//2QK5uES1+ZC4dePnN8CnYOG3aDhRDQxu72CtixqTiA1lRRtQwgoi83Z9kMyJ6zXp1/GE/Oz0pfv0DnwOs7HKcdOpp+Oy1a3tFGGurutTnJ/P/UT7xeYJes0eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=Nhw9HWjJ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-346359c8785so3884754f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 07:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714399700; x=1715004500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgN/Q2xaGtKT6vvkSTDEzO9awo6/5voQRCCnxevwdKQ=;
        b=Nhw9HWjJqIH35rtbuCYJNilli0R5uvlS94U5G5XGnJk/WZXA33owxAekzK4+z6KRYc
         JDvlARjEujZwlWDdxxoggVYaSHJZ+m2xDVx9adEwkQz1TMtlNIJQmJISHaQTmnoKOftO
         cVdQa7gbiIHXebQv42VOUf2BFzAR1zIi3iKHTs3KvXAsY6I/NbHisNdpMEDUcHKGD1Pa
         pPLhA7Vj6c8nvgOWUxLQaCf/lWoe4CXcAEBxkQItuc5snD0pfj3IbEUk7ll4gOujBi6e
         YWqhCGIOviSdGk7F+bFaOoEbNIuKlyhIPRL8AjBRh832KEp4nxRESkiy2NZK4IwpATFA
         ctDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714399700; x=1715004500;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZgN/Q2xaGtKT6vvkSTDEzO9awo6/5voQRCCnxevwdKQ=;
        b=SDUIpVvZTSF6KJZnRiIIwBIInHjXY7p8qyKPSdiWOdEiZvVzyess/Qp8lDIvLoLMMS
         Yv3Albz9m/Lxj4IbWYrB5JgiZhdB4UxIUNnCpPMzAIugudxjTsNCkakVp4teGAeSbV0+
         BGbW3cxwcQ3k9nRParCRYu8o5vn1CRlwKeei+4dujKatVNkhJogOdKfNofEktcHNCoQw
         Blf//OQDUoOhh6ghYNKmPrSvKLNOZ2QQtCs3j+4mTG8mhTLXxD1cBtiWg0+B+bMnyzdN
         9sIUpJeRNlWHRJ+NPH03XDGnqjiELNbUmw0WkrmTdy7lJAnRO8qlVT3y+XksAuGKBFX5
         NKnA==
X-Forwarded-Encrypted: i=1; AJvYcCUkjHv4+dEzfVj0v7SJFJaTn4dRo4EH8bFbvHw3Dim4L3CC+dI5kgBIlry6wEJRK1+GplrfaUi7b1Q2Mt+5ylZy3i0wXepv+HiRg5+3lg==
X-Gm-Message-State: AOJu0YyE+uVT+vPtV+7jZ9d/exRNSpDiN4jsdmsuFspOx0Tq6oJBN4/l
	7f3Db0pN++jqmqcy3jqYEZiwW+Mjt4dTmeiyyui7JC2d8FFpwUv3ys4uwxSrcUQ=
X-Google-Smtp-Source: AGHT+IEYOKVhPKai+Fa1uXLnecUJvyvuyl4SsHgSfkU/MZ0kr1joJET/wbdjmxnDeMCyPvAKUbffYw==
X-Received: by 2002:a5d:6306:0:b0:343:efb7:8748 with SMTP id i6-20020a5d6306000000b00343efb78748mr6534087wru.66.1714399700400;
        Mon, 29 Apr 2024 07:08:20 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id h1-20020a5d6881000000b0034615862c64sm29585477wru.110.2024.04.29.07.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 07:08:20 -0700 (PDT)
Message-ID: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
Date: Mon, 29 Apr 2024 16:01:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v3 0/3] Work around missing MSA_READY indicator for msm8998
 devices
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Work around missing MSA_READY indicator in ath10k driver
(apply work-around for all msm8998 devices)

CHANGELOG v3
- Add a paragraph in binding commit to explain why we use
  a DT property instead of a firmware feature bit.
- Warn if the "no_msa_ready_indicator" property is true,
  but we actually receive the indicator.

Marc Gonzalez (3):
  dt-bindings: net: wireless: ath10k: add qcom,no-msa-ready-indicator prop
  wifi: ath10k: do not always wait for MSA_READY indicator
  arm64: dts: qcom: msm8998: set qcom,no-msa-ready-indicator for wifi

 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml |  5 +++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi                           |  1 +
 drivers/net/wireless/ath/ath10k/qmi.c                           | 11 +++++++++++
 drivers/net/wireless/ath/ath10k/qmi.h                           |  1 +
 4 files changed, 18 insertions(+)

-- 
2.34.1

