Return-Path: <linux-arm-msm+bounces-38885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 064C59D659C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 23:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3233282357
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 22:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58681189BAE;
	Fri, 22 Nov 2024 22:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ij7m8Td7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C361531DC
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 22:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732313801; cv=none; b=ZANDXiLagtQrbfZjCFTgY4vZkH++7AmuJ/GEy3tN5aJffNjeekhsbWlrm2THQ0RQFgXk1q3h7GrPXCZLxvdFp6775ShTxbfZDjH6hd3njDaKf1qK3CigokHp79XfszHVGwjMevJRdGw5JKLTU0t6gvNdJ18ztQJR3u87KQc5ii4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732313801; c=relaxed/simple;
	bh=aOG6ClrY6lqefMk44UT4DZQKlYJU8tKP5/H9aVO6OZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgLbHLr6cQkQ2Ntxd2K/w2Dod4+OgbcfJbcSnugm2/hBSQH2Oiw7Il+Ha0CU+HWUWO0Z2832X3vd+7VoXQHXgWtFV9YGb3IB9ajuxzuP/p7M2GbwM8boUW/5M0aEN6TpOa68b1VMOyAb33Kf3zPDZp/zULZRzAkCUN5Z3csA580=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ij7m8Td7; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53dd8eb55c4so1268474e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 14:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732313797; x=1732918597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5NFj02jhNQNdIiYin2GDKXP53mu5BQwP426EP/zKK4E=;
        b=Ij7m8Td7fNbHjeweGrfGRLoKLkmolfOZGfArAhCcmj7slaALn4LZvdjdRBPrN4ssFO
         jxl7llYkbCdnJ8g9OGBqXfNZhloP+damFSiot3l8TxbEE9t3yLrBKKUf8GPLC2nfAtE4
         42uUJZKX6e5cDuhMAKHKOyZMPWCzA2hBwBPCkOs/3Z8SLLY6iHQ6n4ifskWX4gPfY4R8
         P4TSGSMzaITeCyRC3cVmuzZQJZsad2uHCR3V53sTpgp+Dh24xC+q2xlHemxi5bMJ53m4
         QNnwpx2UluiA0smFKkyySXfXiu7+gFJGqpBjuFo3LEii8TPoglPYv0/QH0odqB5Rjk0y
         6EmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732313797; x=1732918597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NFj02jhNQNdIiYin2GDKXP53mu5BQwP426EP/zKK4E=;
        b=sr/xpADZk+7ytiiv7B0C5dZtlwM2cuhNcXdltnlgNeRISaOyx1Chzhnm4E2KK6d4Yu
         p4IT34+5KqCmFxnGxXPvZRL99M4ku6Q8sGIDWN7/jsVEfLBZR3UKmgUY86CZQGO3hURK
         0pQ34+i0I6dfN/JIQEnKNUrM+NsRSU73Gzv2GQhatNcLCfAPIQkboU4leahcxCVD+Hmu
         +8rZAAuKCbI4k8OdGAq82hxj7iBBFcu53RHfEb3THIJXrISxaB3syFl+/g538lswQ+R5
         edDmMvbK5s6/cgIx1/Y2lLQb4dDwHRMy5shtTIl8jNN17YkvkaT9FoADTUoWMbk7DCiy
         L9+A==
X-Forwarded-Encrypted: i=1; AJvYcCVvKqQ4Zdu2o+7Zn/l6dFlrySw8AEVwM1RRDah4hOrfSr5nzXnHec9Qr5oZRSvIb7e/xIAjdDU59/yieJ9l@vger.kernel.org
X-Gm-Message-State: AOJu0YyHHNRuiQipKwS8j2972xFfZIHDi+sqjZVHMkFw8JFx9aFAaVNl
	EGNZ3d25BVjQ6mTm2vkpd/f8aZ5GEPInXzweGoYRM68fU2sbHog2KWLs9iEkyj8=
X-Gm-Gg: ASbGnctJQhN9f3fQENFI+xhOMlAKuvvwIjmw1NmD8AmAa/fS3A603KadCWPQZjEaJ6d
	gadkLRE+F8dcA4G1O0bkWNEYTxRaGNVwkC9BlY3KgQpBYaLFPkmn/WyWK6xFcxL5D8c0quwd6uY
	dfOkpeiOawiuz/S5VOpiUb0/bmBwlf3MQ3/r2DHIuPrz36mHBeCiRlnZoxxswyH/rckwEloZY03
	ZMy+HrNwQ4kC95MCfZ4tcQZDEl2C5MEwtlqq6aMQWdmL/qtaL0jDEhRw0w5I1xABHvYo0BxncFN
	Ox0CbgAltYY67bUfJzEyR+22ysIseA==
X-Google-Smtp-Source: AGHT+IGDdynUZU/f9IFLUQqvS6pNdTQ+VSJ+DMeR8Cru5dJY0qXDuv5b6VTt88UdQU0hNw5zRSNqgA==
X-Received: by 2002:a05:6512:2382:b0:53d:c322:e782 with SMTP id 2adb3069b0e04-53dd389d3f5mr2814612e87.28.1732313795952;
        Fri, 22 Nov 2024 14:16:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd248b40bsm575233e87.198.2024.11.22.14.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:16:35 -0800 (PST)
Date: Sat, 23 Nov 2024 00:16:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] arm64: dts: qcom: sm8750: CDSP and modem
Message-ID: <gt2kci6nntiq33fkcu5tmffsmsbjn4ivuiaxc24btjj72wp2ws@iumjaevtdgbc>
References: <20241122-b4-sm8750-cdsp-v1-0-9a69a889d1b7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-b4-sm8750-cdsp-v1-0-9a69a889d1b7@linaro.org>

On Fri, Nov 22, 2024 at 04:26:47PM +0100, Krzysztof Kozlowski wrote:
> Hi,
> 
> Context of this depends on my audio patches:
> https://lore.kernel.org/all/20241101-sm8750-audio-v1-0-730aec176459@linaro.org/
> 

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

