Return-Path: <linux-arm-msm+bounces-79202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C12C156A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D26134E6797
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8BC33509B;
	Tue, 28 Oct 2025 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TF56fZeM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8433F8B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761664806; cv=none; b=CJiOw2j7RjNUpgQKS+iC++g/qa/tHsYZLzb223UQRz+rioeHjk23DXb/Ph9Cay8y2dE9Yn5/tJOzivDYQBg4J726lhkGPdseZDkUKy1kNg+iIVk+UTdfZ/wxYwTGwYsZJKiyCSLhoxMVNMcg824qerFSO0lBc85uEWqF+lzV1jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761664806; c=relaxed/simple;
	bh=s4Gx6QagiTUE1mIaeDbONB9+Ep16cr+q0GGk6X8s7jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JA4tLqL3d+nn3qS+meiYW8tqEXiGPQFI98nHY7kfmm5GxhNVkJ4uh09jtJL0W3SpBjQ+cj/jSD+h1HocUrgAEVVjtSCrSf6qPTP+Vc2heAUEsSE3mwRkxl90k96xfaSopvGO7aDfltjEDdLOH0LBabcruUbb13oBY1s5s1zNfeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TF56fZeM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so34626395e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761664801; x=1762269601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g4xM4gK6/cv+oBkMKfsDBfGRWPzGwfaysxJmVNv0Gpw=;
        b=TF56fZeMJfUYiZDzHgEXEBErcxhwGL2kWDZCu8XtcpruE1LQroQdNkUzsrZ7RskTLt
         s7Le6jVDSg9s6r3sPmj9SZ9PGUk5bWnQObnBChD8dq8TDM8+ORj9Z59wWxSkMJ14Hbwp
         SNnSzwAnIey0gfb3JeMuIHg+ImD3UcnnxMmUj2OD3OJ6NWM3TO1Pbdx5WESyEVM8OBPv
         qDLWDw68wnNrkHFYqzUP1gw+uijuykVKFpxsRjU/j0rhCmCSIGh4RDmxRHwBAK8U33+o
         nq7qL42W/0m3KN0exH1mYJ4E6dYYYFDXCbwKMFGRhYHEQveNPPpTJx5xS7W2OFWSDfyO
         jYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761664801; x=1762269601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4xM4gK6/cv+oBkMKfsDBfGRWPzGwfaysxJmVNv0Gpw=;
        b=F2X/Hp7vv1SiEuK/8h1PsNP86hgjaI3VzWN/z41ojxsct9YjuhT4dWbH8H6VCTyEuC
         8ItWXigdsQ3yDvSV7jnBNsvM0H13ve5Gb9jq6xibAb2Tb1I1gXQ955K/SCX+NjwgZUE9
         W4g2Pcrjw7YTZ7C572z2XsYcZGQ/5i9LJGo+jxAvlOnmussIoY71CwO91/7joyvf9YF6
         Xu7cQ2YhBuALCupBuqXW+FOC4NOfm7ehl7sSyjnka+1vU2eSC9VWycWli1svNKuVd4YR
         MBzqItxm3pbaRgtICpITThY47RVI9V/hPSWAJxWKwha+gXByuxjGYMeH56Dw6fPSHCOs
         p0/A==
X-Forwarded-Encrypted: i=1; AJvYcCVo4pgG9mZbaAHG2b00CIbYFKnEzvyicBFJjyr+b4FsuHT2L/g412QC3K97z4vDJnMVM/xb7PDzwg+gGp+A@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/pvMyxNMLbaTXcfjW+f0jBJmXFXYpwAZAH2jDdfSlIXm2GU1g
	QU8AW4U9gWvZaVh0mHSj0nG71uiWJjs5ZF8HVj6jnNBNC/Q5jONRJVULLfv+45EqTcc=
X-Gm-Gg: ASbGncvwxzMKJZ6BjduPtj4coifWgC78Jue9qTsXa3D0LDq4uAdQeqKHhwK69yOGV9Q
	lNsccopM8mHdH5ZI6AT1Mks+j2rHPU//SDdCMd1TGzhGF0xAJNc/jdHrxjpE+03G7XFTnYgs2BW
	lxcE3AfzqxIThikK1LjKvg1Tmysy3kkIide21JxgY+nkKTGKdK5LrDZ1NtvnUFRaTfaDjJvQr9d
	puVQ39XBALMu+Fh3XOxKjJK+twWlH9FayEk3Jo807MSNCl+mfKpOV26hjZT+CteuS9B+4ue2jn+
	ehlJ2cIID0PGfIL4vIKAe8LAQRTqnEjBsJK6QO7JmCOU2IrC5IeJNqGuzm05B4Ja9GXONPNpY30
	N40pRbE1c6T1KM63yHk5vi+hdjlnVcpNkrndlkNow5q7vqofY+t+8P2SI2EUOa+ZaUTLg1rQy
X-Google-Smtp-Source: AGHT+IGKCeR2r/LqTWZfnp4F6FPA5DKpq/WscvEqy8cVGEsQO6uQyLdM2X62ZFpf/CF88WVJpNKzJA==
X-Received: by 2002:a05:600c:608e:b0:471:672:3486 with SMTP id 5b1f17b1804b1-47717dff927mr33130885e9.15.1761664801353;
        Tue, 28 Oct 2025 08:20:01 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47718ffa42bsm21650985e9.4.2025.10.28.08.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:19:59 -0700 (PDT)
Date: Tue, 28 Oct 2025 17:19:58 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Skip setting orientation for UCSI
 version 2.0 and above
Message-ID: <a4f3yhhz5sntno6gnfbjnjjsbtyo2e4y3da2aywsg36gvxkaxg@vw2vryukrepl>
References: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>

On 25-10-28 16:39:19, Abel Vesa wrote:
> In case of UCSI version 2.0 and above, if the orientation is set from
> glink as well, it will trigger the consumers along the graph (PHYs,
> repeaters and so on) to reconfigure a second time. This might break
> the consumer drivers which aren't currently implemented to drop the
> second request of setting the same orientation.
> 
> So lets leave the orientation setting to the UCSI generic implementation
> for all platform that implement UCSI spec 2.0 and above.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Ignore this one please, as it is incomplete.

We need to also set the orientation_aware in pmic_glink_ucsi_update_connector()
if the ucsi version is at least 2.0.

Will do and respin.

