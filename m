Return-Path: <linux-arm-msm+bounces-42896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3799F8B3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 05:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84074168C6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 04:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0523A70838;
	Fri, 20 Dec 2024 04:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dxugQtnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F06755887
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 04:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734669175; cv=none; b=PAmzweycJMJc+l3Q5SjMt5W/b2rquBAl7sm/jC3gnY7uV897ZGFO/m+rUoqhT5Km1nD6UC7BIpuoCRoK0h1wLgr2WTLdCIBSuaUgi/QAk31v8epbFkH4Gz8oAtfAfw8qgzeG3NWpI9y9K4lGo6LjDJo0dB3aBq7B6l3WHLaUR+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734669175; c=relaxed/simple;
	bh=OSrK4P8S/D7uJoH0nEX3pAuAWd0uXm4JvxyRw6d9X8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4D9c6F0IOlG3yAhPiZ6Y/iUIDvzeg7S3blrRYbjVlHiPxW5K7hF0v4KbJNxXYsR7T17RCZks9euEpFK5CbOybXfI35rwlT+o1Ast7aNRG7brxW0T+SYufNLyvwsjWDkt80dAXNyln4mA4UjX5/HLZKLcRH7qPFUdO2wON14eRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dxugQtnU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21636268e43so17216775ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734669173; x=1735273973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NVqSzgdvMPcdx/FNg6nKx+Oqk/eOtN9slCOURnBKQ6c=;
        b=dxugQtnUiWRpp2K2bxhc2kLnQB46OQwjGYGeWgN8kc2jrSY0ZSg/qL1Yq5XH3SGwdh
         jHWfX7pfcyOzVCeX0MyFKHn3jDnj4NtMW+tRxQra8vxUWsFvHl+SR1t4A5BUkrTf/CXw
         2UzCe7K45TC7WrWFK/STQO7w9/eyIMnCAtnRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734669173; x=1735273973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVqSzgdvMPcdx/FNg6nKx+Oqk/eOtN9slCOURnBKQ6c=;
        b=uyVAfXFUZ+GOz5qfq2VkM/xKLONWtvccbeXbg3fNb2b9lB56V69WTUdTL1QI9crd7d
         W+uDeD2o2z0M29FfRYe+S6jJIJ7j0wx5esqS214vHshcsulaFcq1YEoRNfnwYhVw0Iem
         jpAOE0rHedar/ELzlTVp6HfAybO4eLa647kCbgQ4WLbv3iRw1sTHROLimivVYoRNzBjU
         th8/kGvfO8/FWntjxEOT4NmpjvFMOY4SlqEguCnndL7oFmm3Lh7Jy9kEgDoZ6DQ1AjwO
         Iuv6e/vyILEze854vPFv4hPsju/TrxGxXoXxBn3iLbNIqQkSnlbnZP5RPk2NCdlrZeEm
         R9lw==
X-Forwarded-Encrypted: i=1; AJvYcCW4aQc/7C7Cw9A9qb1fNd3OzV8heH4aXn0roJvDDk8BElw1i8uhuNgWU4fwa3R5pLGph9lIlIVkc8E1/BbM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx10UP3ipzer+lcoFOzfuSgopsHVscvaoYfTqLdDSEaNuhpDMYX
	+90CLZEPIIdMyfMq0OjApO/RRsvXGOjs4h/Om4xT/NvLP8LB2GRqd/j27INJXA==
X-Gm-Gg: ASbGncuqRtxNNe9TJw2VJzc9OgMHQWUfNMtJ3TSnEwbaVGV5gOixi4/udSA8eFLX8nY
	2ocQ/jwZn8GZQQqTf03npsyzlWFj5GqaOvjfpz3Q1p//FvqEmii/a7lWSigLQHB4ZTS58AXWPbY
	0hyst+oMvRAKIdTFO+ucrMAmdC+wmHQR7VBaWc3ODZwHLDtHgXAGiXOAKfzrkMoCH9KRhENBnKP
	p/urk3d3D0G86xrIHnGm3X0EGPwS8YXtY9Iys2rUk9xfUQHyWYykCg7tZ1k
X-Google-Smtp-Source: AGHT+IEcslkGB6AJ/jFfNUJKFDnDJ0UoXitm3+XznAk8iVhKCkHnnHczShCxzi/hkt0jWFWF298nFQ==
X-Received: by 2002:a17:902:ccc7:b0:215:94b0:9df4 with SMTP id d9443c01a7336-219e6f283aemr20782245ad.54.1734669173741;
        Thu, 19 Dec 2024 20:32:53 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:8e99:8969:ed54:b6c2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964b1fsm20366725ad.37.2024.12.19.20.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 20:32:53 -0800 (PST)
Date: Fri, 20 Dec 2024 13:32:48 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCHv2] media: venc: destroy hfi session after m2m_ctx release
Message-ID: <xkmtptaqzvwe2px7q7ypnkltpx6jnnjeh5mgbirajzbomtsjyz@gefwjgfsjnv7>
References: <20241219033345.559196-1-senozhatsky@chromium.org>
 <20241219053734.588145-1-senozhatsky@chromium.org>
 <yp3nafi4blvtqmr6vqsso2cwrjwb5gdzakzal7ftr2ty66uh46@n42c4q7m6elm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yp3nafi4blvtqmr6vqsso2cwrjwb5gdzakzal7ftr2ty66uh46@n42c4q7m6elm>

On (24/12/19 15:12), Dmitry Baryshkov wrote:
> On Thu, Dec 19, 2024 at 02:37:08PM +0900, Sergey Senozhatsky wrote:
> > This partially reverts commit that made hfi_session_destroy()
> > the first step of vdec/venc close().  The reason being is a
> > regression report when, supposedly, encode/decoder is closed
> > with still active streaming (no ->stop_streaming() call before
> > close()) and pending pkts, so isr_thread cannot find instance
> > and fails to process those pending pkts.  This was the idea
> > behind the original patch - make it impossible to use instance
> > under destruction, because this is racy, but apparently there
> > are uses cases that depend on that unsafe pattern.  Return to
> > the old (unsafe) behaviour for the time being (until a better
> > fix is found).
> 
> You are describing a regression. Could you please add corresponding
> Reported-by and Closes tags (for now you can post them in a reply to
> your patch, in future please include them in your commit message).

The regression report is internal, I don't have anything public.
One of the teams found out that some of their tests started to
fail.

> > Fixes: 45b1a1b348ec ("media: venus: sync with threaded IRQ during inst destruction")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> This is v2, but there is no changelog. Please provide one.

The code is obviously the same, I only added Cc: stable and removed
one extra character in commit id "45b1a1b348ec".

