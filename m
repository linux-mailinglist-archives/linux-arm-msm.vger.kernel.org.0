Return-Path: <linux-arm-msm+bounces-81152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0061C49B7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 00:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6DB7D4E8AC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 23:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE17268C40;
	Mon, 10 Nov 2025 23:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DERuaMvx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73652206A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 23:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762816560; cv=none; b=ZRhhabUpuekVVGKb7bo/pU2stAlRfhPY7SU/vY4whkwix1f/je79DJjwbETvCpDB6vByGuEK0IDyiaBsETaLfz+tmVDDZ3WEBnp3M8j800alkC+TKgcEsh07x+rVThQH9xNCAup+XCg0ADzqyYV+AYnMt3FXOonBK1uJwnaa6Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762816560; c=relaxed/simple;
	bh=h5TTiI/L91Gy+XLFx/Zl3KrvUTe7SfQYuWBRrcnVR54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekf81mREVdXKNOy37B87eZRLeyNMd3vCuDHcdq5sNHP9SYjWYKUCt2ibkiEfxj5ru3eiiDoVBx13wU+Te2UmBAVMD8jPmO3vK6AkVdwb9CMLMx3b1jmXqj7TVuxXXVw6Tj6QeKMFwCJ9Z0NOyFfVUVD/z6G+/+XI2tyS7OJ48cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DERuaMvx; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b9f1d0126e6so179948a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 15:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762816558; x=1763421358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tTCBfyjKL85nI7lncbdUck6wtAuHEbruuMTez3UdOuA=;
        b=DERuaMvx4XwTvfn4aCMWr74Rj+wFrQbzox5lH6uq9HCJMjMsVRuba7ar8ka8MHemmo
         UpqHqmgi5xhtdky+1fE8K33yw3cKczDTbdgECGdZ9aQINbmykbd6VWlLGDQE+Knxp3pK
         GxEyRxP+BM07SYEPtKkkY/V2VeG9JWQhxO45Q80DKG6HYrLjioUD39KsNvmp1R9b112Z
         UjSOIxMpLb48ILikt2AL02ml3msWq1vCqgoVEOADE/07I6lqZ/YFdbIhz86XysKoQy4t
         Ui0PEbzt+40oYIkJXAXr+4Cnf/J425zG/fan7nxgtUKYfWVQiCUlpQ9mVANzLbuUwf1X
         /xWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762816558; x=1763421358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTCBfyjKL85nI7lncbdUck6wtAuHEbruuMTez3UdOuA=;
        b=w57A0Y5ZGAGea6NL/wT+So0BRvhBQijz0akhzyvZvmOfhpytDmjyu9OS7ct7B9eA62
         9GEKxoEM7j8icvL+KupkLmiHHfm45SfyyRasg2IqATR/S/RjFsaQ3FxvyoIUWV0lA6ee
         YoeZ99K+NbTkyeexPIX+LG04JR0AAqQKjVBwIWKE+thaQqECgjYniLjr5OdlFQz6cCHh
         gc4XlMwPS+T9xksD1y7sDLX91YWm5x4F49wU8N9hB9CY7+6GL4BvktY3E+YwJuRrLgsM
         gkBceZUKVzlfRid//0LSIuDXxGGuPrDcPtooncZX77BYJADIbuIRa4HbxP+dCK8cya6w
         LhMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE1FUQxa0Y2rFrpNA7pFSTnkp68o5Ma9cE/4Q3VWIF89amlP46CQevBJDIvQrYgdM0s2UOfW7UdQGiUfOQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxxCRc7DaqcCJKjcYhzR7qh/+J2iHo/+LBNJd08xLDEd6eiwvP8
	c/FMrlkIpYkXQlOiAG3aH3AWhzwSMDnGtGL+Hf0CnjEDG72euOPPT8P/
X-Gm-Gg: ASbGncscDQGulCAIjwtfxE6T3aWoiALeDl+8GxLFRCEF99Lt9MiwofqIN7068AkH20X
	ORTwhiMnDzP0KqSbNp2p6wlM4qCjoRdbKGs5iPbh7ktj8PqoVNRTt2oB3nuuaGGlx04SthX/0Uo
	bohS5v4oxJ3hIKh7gio/yudbL4TN3hDOEKmMzzPEOqyn2Xj9NasHiqu+lYej3B7LesJNTgd3Zyl
	NZq1AYdEMh38/lrBeQxH5Cf2sxpce6pmcz9hqdPCC+42xuoETYnkaO5V3bn6nym3NE6+Y1lGC1P
	2bOxsbehRu6JwrRJqHFOXnbu2db3xKi6pAu/UBdjJg4QZNRrBW+Xan1gURFrWNXv3YH99SdvmNA
	EnLVxMJ0NYC1NuA9HFYFPYnfHkuMiDbQ/vP/1mO4VweGfnbq9e0M8JuwY4o5tN42ZRupE6ZJ2AS
	cS
X-Google-Smtp-Source: AGHT+IGwvLf3ZgdUd4iAsN+CriZ8KUEaW9yxRhFdFBiIvi5V0uUTvjVhxvMH6yq504eeDgLltAEolQ==
X-Received: by 2002:a17:903:18d:b0:297:df99:6bd4 with SMTP id d9443c01a7336-29840842cb3mr12574055ad.18.1762816557960;
        Mon, 10 Nov 2025 15:15:57 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29836cce339sm25144965ad.59.2025.11.10.15.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 15:15:57 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 34C6A4206925; Tue, 11 Nov 2025 06:15:55 +0700 (WIB)
Date: Tue, 11 Nov 2025 06:15:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
	Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
	Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
	Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Subject: Re: [PATCH 0/2] accel/qaic documentation fixes
Message-ID: <aRJyKlRkihq1OcGk@archie.me>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
 <e44c8f40-b6ff-4369-8d86-ded225b41544@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e44c8f40-b6ff-4369-8d86-ded225b41544@oss.qualcomm.com>

On Mon, Nov 10, 2025 at 11:54:59AM -0700, Jeff Hugo wrote:
> Thank you for the fixes. Yet again I am impressed by having your fixes in my
> inbox before I even see the reports.
> 
> I'll get these merged to drm-misc-next where the offending issues currently
> reside.  I anticipate getting that done later today.

Thank you for the compliment!

-- 
An old man doll... just what I always wanted! - Clara

