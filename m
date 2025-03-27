Return-Path: <linux-arm-msm+bounces-52583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBFCA72A2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 07:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F6FF7A35F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 06:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9891B5EA4;
	Thu, 27 Mar 2025 06:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Slx1x+X7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871411ACEA6
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 06:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743056861; cv=none; b=LGr7J99WTqAK+vP4xs3vQi2hJ4S7S8bqHE76VkNmrYLYscNeC+Uo+Ws0P4NVho5LPTWK1d7UN0qb2pE4M8F4gxGld4oYrhntIiUAop++LD+rlyOqH7oxkyaWF9TTKHWXmhEzs/5FKSoQpJ/Lpiex1Za/aqAzgrvwwCfSyUHjmig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743056861; c=relaxed/simple;
	bh=vNB55LLHsIzewlg4O3Bpq6Hpru+HJpGh5yavNpxEX24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2+5kSGg3IumoQ36mXX3wCaQa3YJKZ+pv02Bd9tA9Xq6+09LXpoS1YX0NwkqOH3Hhy7AR+p/b8d0O5wDp9H2MH0aayh25jXqw9KkeJaMsd//lwZZe9xtnoHxXglhHpYxnW8WvpHrQgveuWTC6M+bDgw3YFGTYcvNl3gcgkyOHZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Slx1x+X7; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30332dfc821so827244a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 23:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743056859; x=1743661659; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vNB55LLHsIzewlg4O3Bpq6Hpru+HJpGh5yavNpxEX24=;
        b=Slx1x+X77vv+lBm/QSo/JzDCg5zL3cE+6cCBpC5Bc8vE4vLaS8UZxH/mGc5tkh7PHD
         u8OaFfYX9eRqGiffN9GCxXgfXv3AUdb6YhuceWvYWMWAfUt6nKLoOAiAHzF5ZlxT845B
         qwnwdrqf8oL+k+bliBKFqj3oxl2rynksEqTdl6Px2APq5Et5xjnLFHHFO4XU1QnJRXQ2
         Y5GJie3APj8wN8RVlAeO4TRALaqhGjrUS1LA8UknXJ9RnOlTexp+YPIuOHpXEiqCyJlV
         7yubMZZX1d24EaVRZlQ+ZKl+7EVD3maOJobMB+YDq7kRunvauKf8rfQxALyKVJul8zsf
         z2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743056859; x=1743661659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNB55LLHsIzewlg4O3Bpq6Hpru+HJpGh5yavNpxEX24=;
        b=luIvU7JKkwnWMcQAIMa5HeohM5nVzsPB7PgspPNp5Io7KDg/gud5Id+i4wsUNGhacF
         7DloCpojh8nBZb/+CFoJpbLxxDZc796OHdjtbDgUrIrhW0IWHNqrMvaEMi1o90Mmi9bu
         +BmE5IWi4++pdcgqj3tWMiYsDFd6QNIroVTkSZfJWXRqQmtgtqs2UXqP+ajYiPuTtYBb
         cQY3FCkez5mN5a8p7ZwmTSZThw9apCbCYGOuGS2OuaDC4fOFR65CUT6vXO8Ff9qY30/5
         d8ELbYALBGmvuASdTZpRgedmu+6ZSlbzVfx3fLcOGuJJLi+zEtWGhQrxe01Wp0sTxpJo
         NZlg==
X-Forwarded-Encrypted: i=1; AJvYcCVv3VMSsdpT52qgPRxNhtMjnmLUWgV4pBYQFGSy+CXE+CAVcyJwWqrNv0XgqIg5Q1KONxTjz9N6WqJRQBLl@vger.kernel.org
X-Gm-Message-State: AOJu0YzjHZn+IFNp802+23px8GmcPrAU2qmTiJHFoysoNV3D6QTM7Wzd
	xG+7r3xkjW4uRHt6w0EaDAljPbPiJqonizptO8aaxBfiTmrRbJ3y7CMfCxcUyx/GN6j7vVkRWPQ
	s/CKB5rY/1L+KF+u6bMF005iNhItFmCtI9oG2
X-Gm-Gg: ASbGncv9nKPrK26/9trHNld97wR5ucvfz0/3q+znEeVlUpWLklIG5BptXOf/fMehdfT
	G+OWFCEks/RcSAdfhmEA7+KoRfQtw8hNsDraM4nYx05mTakPvD369teeUGPNrPVYAwnBXY70iSZ
	Tn4slEuYwCDNMxd64NHB0P13gJWkqyuD5xx1muXmOXaA9EaWfWYddiBtjv
X-Google-Smtp-Source: AGHT+IFt7Uet3UwCNOAH8meYB2W9ViJLDi7wcmCNPw9mSbfJ0sSbyamjROCSnSFkmO0FUw183zFiWc7Rnl9Qc4okr5s=
X-Received: by 2002:a17:90b:354e:b0:304:ec28:4437 with SMTP id
 98e67ed59e1d1-304ec284935mr218399a91.22.1743056858259; Wed, 26 Mar 2025
 23:27:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-2-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-2-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Thu, 27 Mar 2025 14:27:00 +0800
X-Gm-Features: AQ5f1JoUEAB76GccOuQU5OR51PoZ29U3C8QHFwNl_oTL2dvwjiuuxHuLDi3FutQ
Message-ID: <CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net, 
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com, 
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

We have implemented and verified the USB audio offloading feature with
the xhci sideband driver on our Google Pixel products. We would
appreciate it if this solution can be accepted. Thank you all for the
work!

