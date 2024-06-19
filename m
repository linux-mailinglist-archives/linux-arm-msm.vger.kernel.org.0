Return-Path: <linux-arm-msm+bounces-23238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 974B690F391
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25D081F23F70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 16:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4E815F3E8;
	Wed, 19 Jun 2024 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="vlqlEYVw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A086315F335
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718812594; cv=none; b=o7DibvOeNuYMGqkx0TcjTH5xCTFuaPK+sJge+Kn8c000+ljMETPG0HPPG2F3Q7vsiHKBdW+Vb79mYG3G2ayvUtVhnoKGlTxvTaB508bjL/I8iXWRTt5DB/VOvSo5M2sD/u9CqO6MGkPITwH5owjGxZIoonZ3q0RXI9UdcO8c1Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718812594; c=relaxed/simple;
	bh=LgcVYIRO8T26ASMCKl/EoDp1gqiFvT8kCgk9LpX+Q3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONBMxT0aNzX2maAryg+3TFg8O1ZqS5VjPuZ/cn6Z1ilFZEkrYSxXee3Oxvw+Iraoxo6/525rhMq+8VexX0Pe8EO3Zkn9A6U62djUlHQ2ifC6DjtiPWXFZFNj83Bxf7OOouq7TXP+p32UcSsMLmBLqq+mIQ3+38UrOGZ1SUZ3bkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=vlqlEYVw; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebd421a931so62801141fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1718812589; x=1719417389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M1BFZzRTH7ja91K8N7mMKCSJfOC96DMaExd23EFhZN8=;
        b=vlqlEYVwJjC7WgmPxnlh7bVdFpZmtgzz1cbWl+Z+t66L6wrndk0eb3zqQJuB3uaQTc
         AdMlV2sjJEDFqniCUTlBCZg98mXIPYyr3AycL1h5tkNR9Fg158kWafwdSp0P7NBQ0bhs
         78yIBzTHsUo0vb9ALXMsn4MA+n9Fr4dOdWIMDxayApGJGM1LCENXuQDVz/U1PJb64UuM
         SIhDMkpPwVDDTJgpLTH3WKFp/eMJD7MJ5eLNLEwg9eJuMEm+9NPIip+lzrkMTzEJ0B2M
         DFqCpQNR6LxOxJNH/RlcvOn8I6vNVPcAU+/UC5hXYyni+Ry/uS4DELo1Y7R3lOZn8QNr
         fGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718812589; x=1719417389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M1BFZzRTH7ja91K8N7mMKCSJfOC96DMaExd23EFhZN8=;
        b=Sb7puVhMFZUY/nw1C9PyPtNn6pUQLH+7q4ajgd/d7/GKybbwJrCb2u5jpwBfjj01V+
         x678eaZq58WCW1hnbKlm020H8dGuso2wCQQ9E3xQU2iS0HK1ngkn+t/wePPVW9r8wnhE
         pZwo8C2jzVrt8eKAFYEZgqPTEkacltw1/kUvZaMn5nZYVxjDMxnmLtHivlA9R5in/6nN
         Vg50ixS8R++pTXb1PIUhv8Kqr98fe1l1kWETWiyjxO+tF2hP5B+jS1J4aMijXDqUk8Nm
         FQD3uZ1IKWRdO1yCnfpW7+f1Bl5avutYSU2nOp2wNTIG6ZwWLV+5H9PEH4W4oePm5Vyk
         m45A==
X-Forwarded-Encrypted: i=1; AJvYcCX93w81qA1qRWaFdzD3sgBR5YM0BUCpQpjyyzGZtznCk5moe2FcdvUZBICuc132PAjk1qJd8rvLhgIDohWkLx0TcTTnP6VzkoGt4p3GCg==
X-Gm-Message-State: AOJu0YyUT+s69A4zoB3FqTXAaZmKuzjbAjhuuPRfKJM3duawGKGWAfxH
	lACS2os6V65b4W88NASfYMO9QFjzIcqV0I+0FVQCIUmDoP1te05H0zD/7fW/Xqk=
X-Google-Smtp-Source: AGHT+IHaA9hcJJZxhODlzWXhLljZW7b77T7umunIdwrTJtOLoyjhilkaA+PUmNL+9uZYE92Nn6e8VQ==
X-Received: by 2002:a2e:2416:0:b0:2ec:fa4:e310 with SMTP id 38308e7fff4ca-2ec3cfd6deemr18677031fa.34.1718812589347;
        Wed, 19 Jun 2024 08:56:29 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:dbf8:4c1e:1db7:2077? ([2a01:e34:ec24:52e0:dbf8:4c1e:1db7:2077])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9145sm271027215e9.22.2024.06.19.08.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 08:56:29 -0700 (PDT)
Message-ID: <fcc585d5-637c-4736-a7ba-5f4eaad13ae6@freebox.fr>
Date: Wed, 19 Jun 2024 17:56:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240613-hdmi-tx-v4-0-4af17e468699@freebox.fr>
 <20240613-hdmi-tx-v4-4-4af17e468699@freebox.fr>
 <348e16f1-0a1b-4cad-a3f0-3f7979a99a02@linaro.org>
 <pprbxhow6gl6bqlhzoiozz7ymwqk5uwuyuwclviulie4ucyjok@xv34zrzw72oz>
 <b6676951-33a2-4c3a-bb29-0d1ea7ad33d2@linaro.org>
 <c18c3acc-8f08-1384-0d99-509ffd663879@quicinc.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <c18c3acc-8f08-1384-0d99-509ffd663879@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/06/2024 19:14, Jeffrey Hugo wrote:
> On 6/15/2024 5:35 AM, Konrad Dybcio wrote:
>> On 14.06.2024 12:33 PM, Dmitry Baryshkov wrote:
>>> On Fri, Jun 14, 2024 at 01:55:46AM GMT, Konrad Dybcio wrote:
>>>>
>>>>
>>
>> [...]
>>
>>>> GCC_HDMI_CLKREF_CLK is a child of xo, so you can drop the latter.
>>>> It would also be worth confirming whether it's really powering the
>>>> PHY and not the TX.. You can test that by trying to only power on the
>>>> phy (e.g. call the phy_power_on or whatever APIs) with and without the
>>>> clock
>>>
>>> I'd prefer to keep it. I think the original DT used one of LN_BB clocks
>>> here, so it might be that the HDMI uses CXO2 / LN_BB instead of the main
>>> CXO.
>>>
>>> If somebody can check, which clock is actually used for the HDMI, it
>>> would be really great.
>>
>> +CC jhugo - could you please take a look?
>>
>> Konrad
> 
> Documentation is not great but it looks like CXO from what little I can 
> find.

If I read correctly, the conclusion of this sub-thread is
that the clock tree described in the patch is correct?

HDMI controller:

+				clocks = <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_HDMI_CLK>,
+					 <&mmcc MDSS_HDMI_DP_AHB_CLK>,
+					 <&mmcc MDSS_EXTPCLK_CLK>,
+					 <&mmcc MDSS_AXI_CLK>,
+					 <&mmcc MNOC_AHB_CLK>,
+					 <&mmcc MISC_AHB_CLK>;
+				clock-names =
+					"mdp_core",
+					"iface",
+					"core",
+					"alt_iface",
+					"extp",
+					"bus",
+					"mnoc",
+					"iface_mmss";


PHY:

+				clocks = <&mmcc MDSS_AHB_CLK>,
+					 <&gcc GCC_HDMI_CLKREF_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface",
+					      "ref",
+					      "xo";


Regards

