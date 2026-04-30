Return-Path: <linux-arm-msm+bounces-105296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LFSLKMB82lswgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:15:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D26E349E7F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E8966300C34D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF8A39E6E4;
	Thu, 30 Apr 2026 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qOpWjSls"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF0439FCDF
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 07:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533341; cv=none; b=kBTi9QukhPdcnW0OsgH5u/MkWT8Qq8nQN23GuveUMkVdppnOMaLtrrD5oW7XALUrvvBh60RDrtDg6lDIIlpWRuZiSlw5MDrYZsIfZ8N4onPkhcrYxhhZcRKcD49Yw3UiMaHcfCxG3z2F8X13LUkfjO69X7SM6o7YvgOScnk410g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533341; c=relaxed/simple;
	bh=943u9tGah9fZKkBwSz2vWV6zvES2zNY+ugxae7nl5oY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrLz/SyJCth60DHMqPvS5cKE3nMqazbv083gaITrcFrPa2d7hM3EtsQmE6+OZA9Uia9MO92F9Wim2D//TC3BTy/zc7YuIfYkTb0y7lHSrzA/8iVoGE2571zg6wk0Zgwa4ILhDlwdG0sZix5YpJNoqiXJSehfPFXYY7oaiG+/3Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qOpWjSls; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43fe62837baso297839f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 00:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777533338; x=1778138138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VmRymc3GPUbLGGqxDSkazp7UPTgnpwv2CEs1VA6yd2g=;
        b=qOpWjSlshHfX2QfWoTTjkcCTyIqnQYo5T6I8dnS5wKZOZG91IPvbBHH5p7naasmH6N
         7MN6PJePxwV8U69lrB+ch3lvFOMOSycneyiLh68PV+fcznyoI8FFC6aLj06nitOI20JT
         tZRgxL3XplTq1dJA/OQq2pwhFCBZpO29JmxxK5FtpojsaOAStm02C/bkJpenwo9UjAO1
         dgdCcI/vhAX9F3KKIYHIgQe9/pMJQckGI0vhXAxEGUxBpGsuByGhBVaaHo5D5W6bs2oh
         t6W0cnkLZXM+l5S53mkbdwnKRQHnvV9oQNsMgaJWVxhia7/0cFE8bXRQv5t4fjbYuJba
         nzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533338; x=1778138138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmRymc3GPUbLGGqxDSkazp7UPTgnpwv2CEs1VA6yd2g=;
        b=lf8+yCwUQvDmJHhyErDJRgti0M1xl6jQVYjuSls2TDDMueT5iaScwYuWiJza2A01jf
         OlUfaK3LRi1HS98bDsJ2jck1+2bB5iubpwRCQQf2HDH9ll1gHnXT/tOZbCkgLTgMJWgN
         k61APaBBHzmaiz2mlDywS9pmDXpg22FKk4HW9o7u1JfwOUEYpUHV30o2DDr7DZlY7RRg
         2cyoD1rHNQfKngoyZ5s3aWlJ4I32XQDmgmW0d+3rUmC6IlAWtxA3o6rXrHjfJYzs9b5V
         zag8hsNXWsL9FzMTG2AyJ9zZa1dKjdno90jdBREjyJNkKiYZqZQzUljPMHSltkyHZFSI
         wOXg==
X-Forwarded-Encrypted: i=1; AFNElJ8cOcWOlq6lVyUDMCtxzfBNFjBR8UribWzERui7hcfKtPbaLxra0SynLS4vs0GZUgFiPS80rMeiFHPFcAb8@vger.kernel.org
X-Gm-Message-State: AOJu0Yycw7g7EXZGm94t2HCJaIcwZD3ya4usYk+/hg31vT18UXPPEulw
	95CwT3u72U8uTxIHpct+clpKG7RrtA9HalkiPviSC5l1awpZ8DyvgJ1E2ekwMaW5Th8=
X-Gm-Gg: AeBDieuf3SQyzk0rDwB5KgB8Tt7p4MJRVoHfN7/2waW/5q3Xk8l+Q8y17sffuoEsYaH
	PeV26ckFP/yGYkCzFl32rcHLLa3EHhgoYc37QZUDLPxcFxY+Tc5nO5jngj0jtNlPU124T7m8ZeU
	W7yZ8MEMZA5QIIogSZ8M6+Wey8A4sPXe6ttt6vX3LJZXdn6sB5ie3DOtKRGNlVDD76MqSkTwesH
	L8Exm8n0X+r1fd1JmuzRWle/yIeWbg6dgJVbRP6YFRVK7gU4cFhzRt/k71t+bz/3iTkn8hkROhB
	AFXdSasz3RSfyKEc9fGCJ9qj4W802ID+W2ShUNRGjMVXAuWs7c7q2krOGjMTHYn99T0iSsLycDX
	DNGWa8CNiic2Mv//Eair+syPfvbUC+E4kBBdAbdR89je8oi2gg9pyVKw/H3EtJvPWgQHDHoBbge
	3XZby3cWrCqBo6XOoiYHHUzFhMv0GiGTFt4Rvtwwykzd07CM0R
X-Received: by 2002:a5d:5f82:0:b0:43d:2be:e54 with SMTP id ffacd0b85a97d-449403a9bb7mr2449221f8f.39.1777533337875;
        Thu, 30 Apr 2026 00:15:37 -0700 (PDT)
Received: from [192.168.42.159] ([83.240.169.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7217c56sm10970745f8f.20.2026.04.30.00.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 00:15:37 -0700 (PDT)
Message-ID: <749460c6-2111-4729-a5f1-711d674bacfb@linaro.org>
Date: Thu, 30 Apr 2026 08:15:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: glymur: Add camera clock
 controller support
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
 <20260429-glymur_camcc-v2-3-0c3fd1977869@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260429-glymur_camcc-v2-3-0c3fd1977869@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D26E349E7F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-105296-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:email,linaro.org:dkim,linaro.org:mid,ae00000:email]

On 29/04/2026 15:14, Jagadeesh Kona wrote:
> Add support for camera clock controller for camera clients to
> be able to request for camera clocks on Glymur SoC's.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..8e2a872988d1c3d97506856e2e5325646db59746 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -4163,6 +4163,22 @@ usb_mp: usb@a400000 {
>   			status = "disabled";
>   		};
>   
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,glymur-camcc";
> +			reg = <0x0 0x0ade0000 0x0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,glymur-mdss";
>   			reg = <0x0 0x0ae00000 0x0 0x1000>;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

