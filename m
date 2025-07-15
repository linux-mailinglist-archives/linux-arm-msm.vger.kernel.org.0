Return-Path: <linux-arm-msm+bounces-64894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA22BB04CB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 02:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E70616E853
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 00:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90110262A6;
	Tue, 15 Jul 2025 00:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M0IleP0s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8D54A21
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752538388; cv=none; b=DSUZMWKLcNHDDKsX7vJsXd9IYOlgCLCijug8joPyyXnRT7KAFuNo4vuJYL8Ucv9g34g6jN6i06P93gjfAr4fQ5FsfDHWP++5/GCWauu8y4L9RaIoK5W2Q2bZ+q8A6ibeji/HbtCCMv6bDuxm5jYPY5ssrX68AYpoywU1qZuzh2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752538388; c=relaxed/simple;
	bh=Rtl+kg8lua8MhwuqM/aGV9rwRAtERpeCerUyDwG5VV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jAd88ncmZFg/WrXkVBLe4OIH9bBDiwD6/fE2zB9WZQ2MNKkSDO6iKa6C4A2QgeTgq5XzT/32Orek3PeVojlkm26BOQvPAQvPUIrcErcftCvVmigtEW2c8yQeNHbGEMD1CSNJzqB9ox4o/SsOjgQASFmqR8Y3FmaS6zp21FsIKK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M0IleP0s; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2936292f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 17:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752538384; x=1753143184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wjjlBO5McvqWYarNTItF1TpVtLRk0nuxtxgk1AQtFqQ=;
        b=M0IleP0sgw16y9WgCJk1fMPr3BfjtpxZ9QmUcTNtm/VRqp4gqZG9O76aHOKECZ8k1g
         Z6mYeaB9lc3GJVhWOB2wTR/W9jCl81CnBaiEml18OL3SrESnG+UTr8bTk18qv/vWdIiw
         eZqVN9ghaFBKJw4cSXv2p3pMPuu3h0Z476pppv5gdofex5H+T1nXCRGzGmIq8k94QDv0
         MgsFJyI29O5frBN76AC2ZLJH9wGRH3qYHo6SXTOYOjweA4s5yNB3pc5fNKH+cVaHBYUM
         zIDIwToO9+TGghAO3AVcNdr2ZrhRu6uHjkB7ADCPea+r/10nu/VlR+axewJMzoa+HIt+
         Q7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752538384; x=1753143184;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wjjlBO5McvqWYarNTItF1TpVtLRk0nuxtxgk1AQtFqQ=;
        b=QY6Os1Ug+FXQHgLxNby4Wq+vfeNiVgLbs9ebeo1RhkVOU9VhwB2r7YsH1lKRdk7HcF
         YR+x+wxUUJWKNuYPF6o9Yussg1VVwYal4DXS/tIg3iEFffLjTJQ9zRdj1aF09rnx/L8B
         zwOlrSshVH7duXxEWFbS4Vg1TmdCivoHIirPnCfpyrEYz0OM2CEGdRMIhZ3vgKjFRJL0
         TS9SL5Ikg6+Z6sQIdCiEymG68I0oIg55MCrF1/lHYZHj2T7Lx9baIX+iwAMCBsBHxL0d
         zCISwJfbOzeK2QJe+wv2Lc0w4cBqu1CMlqDqyCSxu3Bzh6hDA2VpweWZDMWU0X92eN6q
         OCVw==
X-Forwarded-Encrypted: i=1; AJvYcCXidqkrUZYNV1D2XfwZ+ggcJX6hzpqF2br63BQtMLJBcqnxZJ0Bq7Cf/qF/Bf/ULFEgknXwb03mVp6Y08CY@vger.kernel.org
X-Gm-Message-State: AOJu0YyfJfII1iDH4MAHBJI1eVn+UZUjtihD4mOu3VHFXh9ChuHIz5Va
	lZxB+sOe/nko7WHcwO4+u3LmpbpgiALnDN0KUy+hsiYGvn1mdfZxBMq4uIYsaPPHiJk=
X-Gm-Gg: ASbGncvnQAPv4n7vcHuPc5plSCWFW1o9kzD2bG7agAWGsDn/Vsw/Ty4Ahx4c6OXbEdq
	9pUsQ7mOP0omDq/3lh0cqTtyFIBaYD/7zbKfvrjpA/KS13RQ9H5/nf2mi7P/EPawoWwciCuv6Ha
	DLeROndoYyrSi1/WrneMFCT7lJLsZZfWG+K/2usOHWTSX0nu6NTBg/GPaQnoBOM5deGDkZlFK4r
	7a8MHD41VA5rwYRp/b8CUuxJ37sQ3k++v0qvwkqZwqs0taMTNKmo3H53q+a9/KIbN+N+vPRMQiI
	j9JgNa0364nt+7ief94uAYt20kXQKSLtkaBZV4fa1fJRxjibLpn7FNZHz3zMQzTO4Fem88joiYb
	ifhyqww0NgrtTvFy6Z5gi9ZtdYh6Nloug1Jaam2HrJGdrrRiRsdM7ETb7bUq6C8Y=
X-Google-Smtp-Source: AGHT+IFJd4axtAtvmY0ckIvQbLgd8yggih4zpyTmoTOUg1GtduaU49kxIVWw0qgHHk8eix9/zHH8ow==
X-Received: by 2002:a05:6000:e0a:b0:3a4:e841:b236 with SMTP id ffacd0b85a97d-3b5f18cebeemr10550712f8f.33.1752538383914;
        Mon, 14 Jul 2025 17:13:03 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e211dcsm13335901f8f.84.2025.07.14.17.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 17:13:03 -0700 (PDT)
Message-ID: <0a12879f-dc4a-47fb-87a0-ac4b8bcd4d75@linaro.org>
Date: Tue, 15 Jul 2025 01:13:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
 <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
 <eac3a877-a4aa-4789-9013-ab8b6c91e0f3@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <eac3a877-a4aa-4789-9013-ab8b6c91e0f3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/07/2025 16:30, Vladimir Zapolskiy wrote:
>>
>> I think that is genuinely something we should handle in camss-csid.c
>> maybe with some meta-data inside of the ports/endpoints..
>>
> 
> This is a CSIPHY property, a CSIPHY hardware configuration and a wiring
> of sensors to a CSIPHY. Where is the relation to CSID here? There is no.

All the PHY really needs to know is the # of lanes in aggregate, which 
physical lanes to map to which logical lanes and the pixel clock.

We should add additional support to the Kernel's D-PHY API parameters 
mechanism to support that physical-to-logical mapping but, that's not 
required for this series or for any currently know upstream user of CAMSS.

> Please share at least a device tree node description, which supports
> a connection of two sensors to a single CSIPHY, like it shall be done
> expectedly.
&camss {
     port@0 {
         csiphy0_lanes01_ep: endpoint0 {
             data-lanes = <0 1>;
             remote-endpoint = <&sensor0_ep>;
         };

         csiphy0_lanes23_ep: endpoint0 {
             data-lanes = <2 3>;
             remote-endpoint = <&sensor1_ep>;
         };
      };
};

&csiphy0 {
     status = "okay";

     vdda-0p8-supply = <&vreg_0p8>;
     vdda-1p2-supply = <&vreg_1p2>;
     phy-mode = <PHY_TYPE_DPHY>;
};

sensor0 {
     compatible = "manufacturer,sensor0";
     port {
         sensor0_ep: endpoint {
             data-lanes = <0 1>;
             remote-endpoint = <&csiphy0_lanes01_ep>;
         };
     };
};

sensor1 {
     compatible = "manufacturer,sensor1";
     port {
         sensor1_ep: endpoint {
             data-lanes = <0 1>;
             remote-endpoint = <&csiphy1_lanes23_ep>;
         };
     };
};

---
bod

