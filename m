Return-Path: <linux-arm-msm+bounces-26137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5669310FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 11:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D9DE1C2193D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 09:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67266184101;
	Mon, 15 Jul 2024 09:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XTrmNhqt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F0823B1
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721034927; cv=none; b=RJhuzTTj/2sZzHkyCACzu2Jx85VSsXWWJHFcvTQwxHACicl7BMSjSM4CCJpfIXZvv3V9ShGjEyhrDHGhvkmjklHjvwDgJTCFBt9ESRhgkbCXhPsFpOXwaqlhMlqxCj9r3Ra3r6c0H6TQWiTITpaGKQaUvYYlzdRE9L5b9226x4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721034927; c=relaxed/simple;
	bh=54CaZIk+oyVZNemcEVgJd0qRF1wknBrK+U8TDQZbLdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pI93hF3MtBci81P/vpn/7Rsi44TcsLXaTqEUcRFfXRH0rHqATXmZR9jWSBkc9Wsfb8NNRSCyTtP6kZTdQp6C3PezkVsT2KzSjLum4BK4dVRIfDxIT++Nwpdu6ZC/828SlbiP3Ux3oTAhlxpVXK99YRrJI1dIqZRvULPmrO1niV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XTrmNhqt; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ea0f18500so4160963e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 02:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721034924; x=1721639724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2m3lT+8e+fZ61YPDTuybNJRn/xGhJoX2Iin5K3yz8Os=;
        b=XTrmNhqtv8JbycqN4GFEqc5HDkLW4Abn0d/MjDlDfY1IFNLniVMKsDMvvbX1jNKIx5
         0+BboSI+7d5G3VFzIEdiEFR+WB9+Ck5IXuldI1wP7o5rqrk5/w2RHvq95ng9pOmas+Bf
         gKjdpxXyfR5c7JNytGlKFsjC+pPOW3s+5fVbDOikohUF0OEnXccFTuEXvs/npKzedswQ
         xMcThA76ekTLcnZzl1sIKSlQ9DRatWBm7xVoxCB67Tr/h1OLOF1RTa2zR4VnVCIVUYKl
         zhw4EL72HxZwXa26yoHAA8BuBXFyfZVSUZGSHTDEEPYyKjK2uhw+xNEKRE4tjssFXmEf
         hvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721034924; x=1721639724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2m3lT+8e+fZ61YPDTuybNJRn/xGhJoX2Iin5K3yz8Os=;
        b=TQod+tHSxxZZl9agivElA45PabAQEdRq4acGDm97j26LYzCZUXhAcvorluM0dOq4Qm
         46iKgoYu8fOdhe96J8SnHJSV687syzDEqchtdYN/y72U7m6qrmap9RLiufvF8ZBR8/3x
         Ei5rD3PZ9P+ZyCKUJTSG2Bdt6ZOXKs6lGR8QjpATXcblLY8S+7j1gbQ/WMvc9YGnuJLs
         aTHd1R7cIFKmgXGwoE2Vc3ZKVxhI65bhNItQ2syJpzORiYrFlFhb5+j9FJ53pxpe1ty6
         xEHHHX+GDpAjdOU1d8dEBQj35zOdUeEE2kUUNh8ucn5nKp43WPDjMHFVoA/6YP7elvIo
         GE9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAg0ehVXs2DNucALlk1i67a1ysef7Yech7iZEg+X8j9LXiI281ovI8GG4ALo5Erz6af68HteGdejWxW3fxeTNHVELAMQkRAnX7voKnnw==
X-Gm-Message-State: AOJu0YzSMajE5uaiWY/mclUAkIgklytSnQrJY9axQzY0vBjqynm01hmn
	53cKy+JgYr9sl2/FVnx2AYsJ1jQVgHu2H0subPwYeMCtc22BrpPDC9mTn3Hi8KM=
X-Google-Smtp-Source: AGHT+IG2OrcKLpQ2/wzPtelwlPnXXPL9jsLWPAZnUb7Shn707tdEIIbppLam6Qk3sPRqZImLVUVo6Q==
X-Received: by 2002:a05:6512:158f:b0:52e:6d6e:5770 with SMTP id 2adb3069b0e04-52eb998fc71mr10153863e87.14.1721034921945;
        Mon, 15 Jul 2024 02:15:21 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b280:82fb:4328:f644:289a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a63449fcsm76838685e9.29.2024.07.15.02.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 02:15:21 -0700 (PDT)
Date: Mon, 15 Jul 2024 11:15:16 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] power: supply: qcom_battmgr: Ignore extra __le32 in info
 payload
Message-ID: <ZpTopJi7GJSLaF99@linaro.org>
References: <20240712-x1e80100-battmgr-v1-1-a253d767f493@linaro.org>
 <mz6h625ecs4ozmjxoozjdnunfmr3vsdw5yyo6il5vyzknyzqsz@pun3t27zhiv4>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mz6h625ecs4ozmjxoozjdnunfmr3vsdw5yyo6il5vyzknyzqsz@pun3t27zhiv4>

On Sat, Jul 13, 2024 at 07:17:51PM +0300, Dmitry Baryshkov wrote:
> On Fri, Jul 12, 2024 at 12:00:03PM GMT, Stephan Gerhold wrote:
> > Some newer ADSP firmware versions on X1E80100 report an extra __le32 at the
> > end of the battery information request payload, causing qcom_battmgr to
> > fail to initialize. Adjust the check to ignore the extra field in the info
> > payload so we can support both old and newer firmware versions.
> > 
> > Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > ---
> >  drivers/power/supply/qcom_battmgr.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> > index 46f36dcb185c..a5b5f1251af1 100644
> > --- a/drivers/power/supply/qcom_battmgr.c
> > +++ b/drivers/power/supply/qcom_battmgr.c
> > @@ -1007,7 +1007,9 @@ static void qcom_battmgr_sc8280xp_callback(struct qcom_battmgr *battmgr,
> >  		battmgr->error = 0;
> >  		break;
> >  	case BATTMGR_BAT_INFO:
> > -		if (payload_len != sizeof(resp->info)) {
> > +		/* some firmware versions report an extra __le32 at the end of the payload */
> 
> Any useful information in that extra?
> 

No, I don't think so. I think we can just ignore it.

Thanks,
Stephan

