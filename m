Return-Path: <linux-arm-msm+bounces-109804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIEhCgSRFWpAWgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:24:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A6D5D57BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8ADB630073D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093F63F8ECC;
	Tue, 26 May 2026 12:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YzzXyVIx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDA03F9278
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798273; cv=none; b=qFJffr3y/yZ/P4LCr3/2wYMs+PffhXDbbcPtc6iIdIBZkZm3q1Xtnx1HprD5z46c6ZBbYZg4PUwBb/9Rsrtnjo4rc+y1fDDbV4ulgrnX1r2s8vc+YFBIZOGqrbNMzOhUPnCeRmZK1s1gUY0Yklc4f4DCOm9NuZQH+WXHNxXfhm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798273; c=relaxed/simple;
	bh=E1ISzBCLBIhW2cLl15JaLwQElpfxj+XxSVyHRpqpxlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HkZSNvYo7Mm5H4lvSaJ6de2L1fLNamXdcdxpUJEHVhZBqAAaT4LlurpqMDZoDEWC55hWitiKdGM9nYr6joY5S6B4HOJlmySsI/MscyMUkBa4skEEp0aExb2MllD9CrCqthAm87McXEzVyBUVkd5QnBe/epyEgP1bgptZ1mlpd9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YzzXyVIx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4905529b933so22001135e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779798271; x=1780403071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BTUnOgQ+1EjcEQJ4pd3MhK4+4n8eohdzmTy0cuBpKuQ=;
        b=YzzXyVIxd97letXrh/XYSgLqnoATuCxoWpz7WoJnGgRPrmocNTPBB/91xxu9TFOE8L
         nflHVzz5PZBP1nd1xtsSTGObdnjJvQP4EPNSlG0hGDkx0jS1S1Ejzf45YZuOzClrPEDS
         JINdH6LJ60s5bj3WskwsftjntL/R+i/cKUGOXN3nl/6jVbhCKwUv88yDX2AQJANlsUS1
         PFgq4snLWl/z6TbnuGNusRUk5fABwvne8hMnt9SaQusCoI/t+QTiVNv5zFnsqxd9ntcE
         3gknMqTXuu+Wd8j81WbFHVT5/K4w5st0FDtKRcUyZY132D04b7F26Vfr1OxdUNvsus/f
         m4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798271; x=1780403071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTUnOgQ+1EjcEQJ4pd3MhK4+4n8eohdzmTy0cuBpKuQ=;
        b=EQfuEXZ5Cmq8Sjdlwi9m8yN09nQrmxU91OM3gc+C/x/onAfdiqCdhp1AZ9+qXxbRFJ
         wNqDICv2z+ay7+88CTRIdWZb7IYllCmmBJRu6Vmy2lBrh/A0/0NAnth2LP2BGISdG7Ck
         ANkQePOeAAGVI3vUo+DNk+rT/jVymb6VZOnlCewY4ZCOA3lmOMFF7i6DAcQmGMmmJgUM
         IDL3vUoms25mKKGm8m6c2q4OGNA9cHJFMkfkhuniO9ZNZ9Zmg6AhCHHmKmhVsM6Fo39A
         RxjaSRXHtNLaSUdkt4y88FytiHJWFEug3+RHLbNK0Rje2tjaHXkOgnfCbYDJqtw/AN8I
         C6AA==
X-Gm-Message-State: AOJu0YzUZKyBuayN21p6bX44vu/tu/WCKFt0q7Y0ZpEtuy0nR6rrNG8a
	6MoTKU4k5tGFurYJvqOjOTczupj3JK2rn9vbg3shXRhn0NuELbNRLmgzelL12ar0EvaZZbi560k
	I5NKZP6safw==
X-Gm-Gg: Acq92OFIpopczr7vH/g8OTE94XcWHs69kleQ2z2rqzjwzwNzxgi52C24Pq0Th3pWhwc
	upXVNjYzj5F9SSS/ekz9c2/ZaUvuMhrFqpA9Ytx0cfE+TGMPK0uBMoWhLvC+wngTga0EPqn6IDH
	0xD9ToP+DyvmtfjM17iSdH/FFhgBFj1AIqlYtLIzul09vuxT65dM8Gh8x/2hReWPxF9NL/QrkPB
	rNDnIHv86b+afhAVXzsLCx9TPTkiivo376mWCWTGJwpme1YjsuCYwzMmUAd8/OO9OZj6AtFjoL4
	u+P26X+X6muxial+KJ77iD9z27JyA2jgbqQ3sKuIwbqPLcMLlbl0v0htTUpNB3Bc+oztxmJcHTX
	9w4V8h5ME9nSTCGgCtO2TVJH/zu6ETxMMdHxL2aqh1IaoSrN1OR6IK0J1xkW+wnhHhszdsyWw1m
	iEIIbUNq3nrMQZZh/SI6S74HANSG1Vrmh948SwzWAD3K4=
X-Received: by 2002:a05:600c:468a:b0:490:3d62:f5df with SMTP id 5b1f17b1804b1-490428e5a6amr316198005e9.30.1779798270637;
        Tue, 26 May 2026 05:24:30 -0700 (PDT)
Received: from [10.149.200.45] ([89.101.53.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454ac6a6sm332352565e9.12.2026.05.26.05.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 05:24:30 -0700 (PDT)
Message-ID: <9e2151a8-85c2-45c8-a592-d0cd47d08528@linaro.org>
Date: Tue, 26 May 2026 13:24:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: embedded-controller:
 qcom,hamoa-crd-ec: add Lenovo Yoga Slim 7x
To: Daniel J Blueman <daniel@quora.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260526112409.66325-1-daniel@quora.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260526112409.66325-1-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,infradead.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-109804-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A2A6D5D57BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/05/2026 12:24, Daniel J Blueman wrote:
> The Lenovo Yoga Slim 7x uses the same Embedded Controller as the Qualcomm
> Hamoa X1 CRD. Add a board-specific compatible with qcom,hamoa-crd-ec as
> the fallback.
> 
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
> Changes in v3:
> - new patch (binding was missing in v1/v2)
> 
> Dependencies:
> https://lore.kernel.org/all/20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com/
> 
>   .../bindings/embedded-controller/qcom,hamoa-crd-ec.yaml          | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> index ac5a08f8f76d..813d41769c0b 100644
> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> @@ -20,6 +20,7 @@ properties:
>       oneOf:
>         - items:
>             - enum:
> +              - lenovo,yoga-slim7x-ec
>                 - qcom,glymur-crd-ec
>                 - qcom,hamoa-iot-evk-ec
>             - const: qcom,hamoa-crd-ec

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

