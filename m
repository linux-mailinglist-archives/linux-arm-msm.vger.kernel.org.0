Return-Path: <linux-arm-msm+bounces-78820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F61C0B0BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 20:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B720E348A03
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 19:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E928F40;
	Sun, 26 Oct 2025 19:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vygLbYo9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B42C24A079
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 19:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761505564; cv=none; b=LxtlJNOJGd8iAFwYcf6iIZL+1cisCEsRxO3RaS/1H1N31ETsjn4w3g9d5hmSnEXs8PmzyYbCTuoHbUdNQTofnv6+GmdayyBfEJrQe7xOj5iKj3rlFnEnrQUEz8ZTBCA536ikjUoDGTqLnwaZuQFyorzMzBc1dytJxUYWDkziWr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761505564; c=relaxed/simple;
	bh=th1ZtWlZtq2jND3L9Um4As08DGJhTXtwGc5UK83poPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfTpiHUG+v2g+dnd/TGMq4yl1v5w+E+amimXpt8y6Q1HABeeh0sA+jHlEJtAGFEl36+lCQh+RIZ7o1E8kHYximyWHO0luluqoiGDLtqbgamK0hWfkyInpgH1pKlgUmfhSXtAK9yMpxJBrR/Dzj9vZbZ6WNEx0OjZUT8xuAdg0JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vygLbYo9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so4010215f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 12:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761505560; x=1762110360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JxAGfxDoeTCVa/M6rSIz3dTSkpIo2EUGND46i603cvA=;
        b=vygLbYo9RuTtsydonAk3pa6QyocI/vTsRURycwkfqGi4nXKoE2m2lv7zwuzAEpr/G+
         7Ppr+SCWUfXh/bzCMZngMvkBald0p9Yde6u01S9PiwcHGXgUBN6sFHAi9kNfn1DSBzdH
         h655HWHq/gYTGeqMpJwi3oesqZIIlzCd//OhLXkZd+ChGEsEhtBlDj2HzWbibWDtCthe
         sILA2hAdqoi+xBLFm7R1ZzSmZV/ULVRi1A+E6+6vauXjWjOCfJP1a0eXwCrtPJxaumwr
         rWVmis4bDz9sUa6Tp5whhgTOLAITvfRrP3WBpqR3N8/aghMvnWWjhnTYISuz1QXENisP
         hwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761505560; x=1762110360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxAGfxDoeTCVa/M6rSIz3dTSkpIo2EUGND46i603cvA=;
        b=g7WxXRUIlcXAdEGLd7aNBO3Bl0U/zV6vkQA37AgrXzFRMn2LF4nxBIg9JKKEzfOD9Y
         rdgSaui3t0Xab8slRW0zuutI86UvNbD1TmToZE81QeAMiVflcjVtRDPbDZ987IXo+Y47
         MRK3BDbZtt6NfFphJbnYxewTEyu4DeHeRmXjPyFQc1yaYBCdK0KWxdRrEOvn5FDQGmm3
         8u+h8rAv/DA5E3dknRk+QF4cCPXF2VXs57P+FMnZj/mbYVCBQqB/JMjyeovDSLi/i3di
         PJw5v2g/6jfYzeE41JBIzHMC02ICf3+tu0E5Llms8l5bLp+g2bzzhTD50esAYT2/T1p/
         zFPQ==
X-Forwarded-Encrypted: i=1; AJvYcCULIzoXWr+wth+zqrC9K6FevcJ2ZZ3HEQWMPW86kQmkzC6fhwtXs3aeHaHW/3bESA1fe2qOMX97SO52NOmu@vger.kernel.org
X-Gm-Message-State: AOJu0YxOX79LkTLRLCRthux6c9p0Q02Rw/JAr+SSmoWDRVICLTmIZ8VS
	in4ifGcFVSxmz+q2i51Rl4PleF0g1DvObg6/rI8fkkA/TjWxTJ/otrTDtpeuQQ0XxeVHdl2ksRk
	L7w4G
X-Gm-Gg: ASbGncshmN3kDhkHxNlRL+gjcQzOfrsJFuWRM/u+xXrWZIKUCQpMbaCA6BYqTuThQi8
	BW+UxB9m9uvFcW/Ufpnv2Wi/KkrUPnnxs/AChpg8rkUbG9ilqmsb1/RgbVXPdYuxxB+DNDqD4ID
	vJ059wIg/yhf3yGDjvRBMssZNvpSSudmEbAUI7VCzpJ9N81ZDtfF+8jg+9cxhwr0SCxAtSZe7gq
	IoxFmFhaCzFfZpnzrVFwF9xFNlLAKFx7kBAmHSuz3+RAUoH+BFrQoI1voNPIXkg/yEk/qaHEB97
	2+t41aGnSAa6jo8rVIKm5bS+HvJ97y9jJMpFRMa6U5VKy8/CjuxosxvLd4t+Uk6rc2X69OgZJ5t
	cjWPPRQ0KBHmx82agvCeAa/vPhqs7GQElAVCCmKmkvntTlIAYicC4bdbazkCfXcDYptrxn8RJC2
	voi9eRt20=
X-Google-Smtp-Source: AGHT+IE8SiE2nOPWBT1SDIBvc0CB5GW5Usu9sWArZFnGhC0jdaaIBNtRWS4NERHC5dfjGaaI02Jlfg==
X-Received: by 2002:a05:6000:18ab:b0:429:8d0a:8108 with SMTP id ffacd0b85a97d-4298d0a8213mr9705765f8f.24.1761505560384;
        Sun, 26 Oct 2025 12:06:00 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df473sm9985453f8f.42.2025.10.26.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 12:05:59 -0700 (PDT)
Date: Sun, 26 Oct 2025 21:05:58 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH] media: qcom: iris: Constify iris_v4l2_file_ops
Message-ID: <q3gfnoogax4hzzamk3hn5mc562ub44thzy4rfytbehzfjbguxv@wlwnclakophi>
References: <20251026181138.13387-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026181138.13387-1-laurent.pinchart@ideasonboard.com>

On 25-10-26 20:11:38, Laurent Pinchart wrote:
> The iris_v4l2_file_ops structure is never modified. Make it const.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

