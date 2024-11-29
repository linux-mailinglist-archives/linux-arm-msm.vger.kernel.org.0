Return-Path: <linux-arm-msm+bounces-39621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C339DEB89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 18:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B1031635DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 17:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0B72C18C;
	Fri, 29 Nov 2024 17:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="atVTwDcY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7423E14A624
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 17:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732900430; cv=none; b=ZiV7e36y9UAzRb5iAq2KODvbwaqVcdnzVap2RDLeAqSvcfcepMVq61L6nAc5meUuoay54YfvIx4EDY5z6B7Sdgelh2iQ6VMl57ZE+qdyeYcdi3NFH0F57HqZE5PPBGy6G3ABSEvkYFYedYlDKQSBvVxaSEABDRi7rSvvXOxjyGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732900430; c=relaxed/simple;
	bh=OVULNuLdiuiJSgGYUUiF7CpOzfMeTbxpEJR3jCkSq5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D22k8hoU/8vs/yb5CuaqyueaktJYwTldirMasV9c2dS96RwsR88sbpNBO2+SvdKu+kBBw+Ki05dTkAbVO2tTkA7YvNftRA1uVdoMeMbAo1/ndZYo4Wel4RK6XMHLGlog6Q6ledaKWntrwIR/o4KJ7gLBkw+3kVVggIlPZ4rKcqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=atVTwDcY; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ffc81cee68so23817461fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 09:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732900427; x=1733505227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KaSmwlTmC5QYIHum9Bux7hahnfWaBrL/wcT59DsXIOQ=;
        b=atVTwDcY/QR2Y7gdAv2d0gLxsQ7kJIZxneeNNLq2tNMMlysu/1WUvVsjNqTndSKoZG
         pVqpcS8sah9ZT40brVhvcLo2280UtmJPgKiWbQ21bWCLisgTte24oTGfYT7vJtbPayNg
         b+1LFuWNok+lOqRZXW5gKHf8JeuCGpaBCk6CsoMSxEYSl15G1dLQ12w0Mkun8hbdKAPd
         QydguwF9HFlDyyEsAgjbcJGB9nGfAQKrm0nz3nmfbgPwggEFyJ1Pc6XzqdY0GzaMzNRL
         RhPvhCDPo2jLKZ9asWn02vC9JYFCvM6ct41JYvp0m+aW8LYt55HBbaCCymUtI5f18FYV
         SKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732900427; x=1733505227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaSmwlTmC5QYIHum9Bux7hahnfWaBrL/wcT59DsXIOQ=;
        b=LnyqxzBeRmdrOjE4Yb+bcIFTw1UKsAnOBHWe8hq089JxLHkhAJoL4OrgmB9UHD1weL
         jAt2z0pYiXKLXa8/srffSdf8JROgV26GZxMUarhif6fy78nlkx7m+1mzxkQcizTNuC/n
         MjREjINI3gHCP/IFYU0EBgNNJEqgQCA9IOEj9qR5E9CLu85gMVw5ec6EkrfSm67IQUnx
         kA8zfu8uJhRg3sJ6yMWtOkSs/np3kkBh4Ymj5jooGzNlbRfJ8MUq8TvD0yv9lCGziGtL
         QsPesN1DacPRfFSlcv2N0EA1qvfGtmwlQtl2IatMTpcMoEDfvK8nSC/9yf5UOUVP7vRb
         cp4g==
X-Forwarded-Encrypted: i=1; AJvYcCVpU65TC9qDnAJ4Qun5ScWvvv5gLfTyWxWYil+Km43iMnaG4ZL0k8ZyRcXZMXxHlpSycBHv8JcGgWN/XX4C@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmk9k/h63qeV6lmDS8TvV891uqkDBm85QttyXY20Pe+U68tPX7
	BLbfSl0tSuHoQTd3bco7zLShgxWtWyfx9IkoR/g+bFnlKqmU1UJq4WnfISHfYow=
X-Gm-Gg: ASbGncsLUvxxt9/S0oiM1zPUjElE97PJvxFQyaCvClcV5WrPTpyB0p9wG9vrUeFvZUh
	76Rn1OTBBfx8SSDLKFJHn2gMPsYj8CDJsSIAw4S0GFgxqHYaQPpjOZB36NlOLu3i4qgpvKcQuAs
	En8HYgJH0dvgnGnIRNP1vgOldglek03n8fHxmujUH1DPuESMEgAyVOrZwXLqmI4p/bYEax04Dct
	lnSKbcHEkA04pLl224x/xACNkVFMUhE+B+Sn4MUQYWToJV+0qzda6QyaKm8pJS6NI20nvAro4Mm
	v6EMylaGNUhB77Bo944KZJhpmOGsNw==
X-Google-Smtp-Source: AGHT+IGJg1oqUzIF8Y1+ias4szk7baOW2OySOACIMvEDl848iG0nT+EhFaH2JwRDoUvzjYl+I6RWHw==
X-Received: by 2002:a05:6512:1195:b0:53d:ef6a:17f4 with SMTP id 2adb3069b0e04-53df00a9f95mr8246482e87.1.1732900426652;
        Fri, 29 Nov 2024 09:13:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6442a12sm534219e87.58.2024.11.29.09.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 09:13:46 -0800 (PST)
Date: Fri, 29 Nov 2024 19:13:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_mohamull@quicinc.com, quic_zijuhu@quicinc.com, 
	quic_jiaymao@quicinc.com
Subject: Re: [PATCH v1 2/3] dt-bindings: net: Add QCA6698 Bluetooth
Message-ID: <vlmdm5yfekmx5miv5twjpukwhudcpjoijk3jxoobhzvecpsb54@her62ghhpruy>
References: <20241128120922.3518582-1-quic_chejiang@quicinc.com>
 <20241128120922.3518582-3-quic_chejiang@quicinc.com>
 <jaq7tjdq4srboo7m4byfofdbigy5hyeeqwyrgh72t23xgwb65m@lz5yivskxbwd>
 <cd82ea16-7c37-41cf-bfb1-7cc6d743d8e9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd82ea16-7c37-41cf-bfb1-7cc6d743d8e9@quicinc.com>

On Fri, Nov 29, 2024 at 10:30:00AM +0800, Cheng Jiang (IOE) wrote:
> Hi Dmitry,
> 
> On 11/28/2024 8:58 PM, Dmitry Baryshkov wrote:
> > On Thu, Nov 28, 2024 at 08:09:21PM +0800, Cheng Jiang wrote:
> >> Add the compatible for the Bluetooth part of the Qualcomm QCA6698 chipset.
> > 
> > ... 
> > And you have misssed to explain why do you need to add it and how it is
> > different from WCN6855.
> > 
> Got it. I just explain in the dts/driver change, forget to explain here. 
> 
> If use the firmware-name solution, do we still need add the new compatible
> string for qcom,qca6698-bt here? The driver may not use this string.   

DT describes the hardware. If you want, you can still add new string
_and_ use old one as a fallback compatible: "qcom,qca6698-bt",
"qcom,wcn6855-bt".

> >>
> >> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> >> ---
> >>  .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml   | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> >> index 7bb68311c..82105382a 100644
> >> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> >> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> >> @@ -18,6 +18,7 @@ properties:
> >>      enum:
> >>        - qcom,qca2066-bt
> >>        - qcom,qca6174-bt
> >> +      - qcom,qca6698-bt
> >>        - qcom,qca9377-bt
> >>        - qcom,wcn3988-bt
> >>        - qcom,wcn3990-bt
> >> @@ -170,6 +171,7 @@ allOf:
> >>            contains:
> >>              enum:
> >>                - qcom,wcn6855-bt
> >> +              - qcom,qca6698-bt
> >>      then:
> >>        required:
> >>          - vddrfacmn-supply
> >> -- 
> >> 2.25.1
> >>
> > 
> 

-- 
With best wishes
Dmitry

