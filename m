Return-Path: <linux-arm-msm+bounces-106648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN8REUy//WkpigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:47:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9755F4F540F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E25523024CA4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68873D1718;
	Fri,  8 May 2026 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H01ZnAi8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3312327AC48
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237081; cv=none; b=Y4OsBCAXaFRYP6Rx3XVo0wMxJi0Z97GyCcJBtT+86YpL2wD3dvEMZkySm/+aUHi3y+0Zmb7+SZnR72QFUT3JGVD1iQO22GhIjI0NfErZHpD9jv3g0lg4Db5ZVYN7KjDYJqMeEqduK5IHKtbNT6Eb1nb/IabIkcidCJL8hAq18oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237081; c=relaxed/simple;
	bh=0bx3yKXhPMK4J1zq8iXEQSWVFgnCPO0orgXPyudyoOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YKqSII6UQeCBGiuhNp+n93/VKSXKrbmzwyjhGS3Xbep8jX5+VjuQtyLxxQRYSGzXi0ocXjWmrXYKvjPCbITPahrkv5F+XYj1ZgEsxJiqEPx/GuYegPz1hQClcVAFcRknN4UE61ctGmMwHmCCAI50+0esyQmTuYKVWw4GJRAMavw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H01ZnAi8; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a40008be82so88231e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778237077; x=1778841877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJqY3ZoDty2H3SIkLL/QDfyOI4hnZOLLYoA1CC1Va3Y=;
        b=H01ZnAi8I6UJbJO0XsBQr28YIQdQBTj81oFbHjBAjIm8+0bhiO2yoBF/jfnwOF0vLh
         JFJyMGSpCQg8AmOCpvWGSlS0n4znkVvl5eqpg1wjqtjnEeIkT8pU4UhOUhNn4ifr2cyx
         b7M+XDvn/UK3Gi+BuwD62vvNXdAl7yIeXgjUN0AREEeG9cv9V9JIHOu8AukRSRBtGqfl
         JrgA8ILagYdRU4L4kQJohQnp45TxoPtrbiAo5SXNtEUrMm7uRQ+jycl/G58CmZtNCQpa
         jWSqoTF35bxEljGQ6vOObl4hLmN3cxyuk8g+aV+2pa7XNZBz0OP/WP543cpq3ROpF7BI
         0xUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778237077; x=1778841877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vJqY3ZoDty2H3SIkLL/QDfyOI4hnZOLLYoA1CC1Va3Y=;
        b=TOiQ2f/P4HnaKVxFbXC3zSHxbOIFnpL5Nr/Ly/7L9mU+5wRKmUTYDL5JUSzZYr+fK/
         vUyDOjOoGKwqgeTjQGcPmSs+rCFAvWX7AJeR9O5UMpQMNXxL3zrMsHty1Alul5hkjWR0
         BPmEiTFfppVAN0E54C6kx1Zf/gH2wsvkCy37sc7mYRySAOO/kDQE8tX0fg9MgGlJ8CqZ
         QhpA91oaG6hKPX/m4HdlC7Fcub60cbL6eJtOeI52ZWJuLaDPqbE7Car2+BaxBUDSUqhi
         8pAaiF85+cuN/JT4emYmlJ1COO4JagH2TErDIzHdrpOD246qtGeNuTsipM9E5h9Vutlg
         gI/Q==
X-Gm-Message-State: AOJu0YzFDXHgGMWMbu7W5OPA/N8i3AK2iRFsgE46LA5vb9B2V3ikOnk4
	wDfL42VBRODaekUznGPXK2XNrSZe6qszksHXQVVT7Km5mwt6ckCamQ7orr4Lev9FdCo=
X-Gm-Gg: Acq92OH223NMXI7mGjTiVlBycQ72+b/9a8KfZZpGquatMO3Y9aZe01PB6ec06arjdNi
	ihN70UMRK7kXZSQ7Q83+zoKBwXgRBSxyxpH01KTszOrDLHfGHrBt9VfS9XZmdzA+l0xL2vzwN+Q
	wUfdLOowqW5wJlNSNQ+vlxKhES6xdfOwT6ztWRVWEYHhPUgdYjH788W+GhgkUB06ngJyR6bXWH3
	MqxN8u7FCVbKZUPmUAaDudlKI7GClio76JEhOUYnuGDGmxgUL7ONKldyq3ehEXtCU/j1Bp3Xzn5
	Kqp5Qy7aP2RvxYNOzHZmyCGgPbj+RE/7YXULSxGeYDgCxIXJmTJw86EcG98LZckzQNg/QFKW7Dc
	L/ZhNtR2d6UO1e9fdiQBv+9Z/dyGQHA+bwHbwtDG0zCvnIVdHyRge75rCthQKXKiy3T4tfRLN2X
	TY1vbTAKnHktiuMfSfgbiL/vFIbO0kgeHUWZbA1jfxdSsbQ9lEFTfI96isB5VpyJS/C4vP098Ma
	iHbu/5Pt0tQNNl5
X-Received: by 2002:a05:6512:15a3:b0:5a2:7798:9990 with SMTP id 2adb3069b0e04-5a887ad990cmr1755661e87.1.1778237077328;
        Fri, 08 May 2026 03:44:37 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f18d66sm3854561fa.6.2026.05.08.03.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:44:37 -0700 (PDT)
Message-ID: <04b15dcc-d418-4982-8fd1-6d2e5eef6e49@linaro.org>
Date: Fri, 8 May 2026 13:44:36 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: kaanapali: Add CCI definitions
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
 <20260508-knp-camera-v1-2-a18e289163fd@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260508-knp-camera-v1-2-a18e289163fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9755F4F540F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106648-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Action: no action

On 5/8/26 11:36, Hangxiang Ma wrote:
> Qualcomm Kaanapali SoC has three Camera Control Interface (CCI). Each
> controller contains two I2C hosts.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

