Return-Path: <linux-arm-msm+bounces-88908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A84F3D1C95F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 06:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F21C30133B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 05:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74600366DA1;
	Wed, 14 Jan 2026 05:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cf+jTHIL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F785346AD8
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 05:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768368556; cv=none; b=F4+p9FoSfnNN7xoYKQDkut7yslJmVqZ9eFFvejwwS37HMVF5lAg5kP2z4WYtFWegBW9qLVCVg7hDC+W+Pa9tVS756w86yQWm9tgTKrVXU4SfP0eITp4q8pEDbbUVhTUqnYmGOY9xTMiOvKYXmYCfadHPDe2/kIRzQ6BUZ/gm0aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768368556; c=relaxed/simple;
	bh=MVjK6WeI2M4GiEOYbDWK+8u7i2JuviaaxDLh3ANAi+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KkVfq/1WaVSbVIP/yrBAI+QtLjMzf/RkUBmiG8D4ZqYPVD6fqfDLBQVb0zQVSD5nDEwiPstnLTrqxUNTlq74XP+9zrqeHM+6wH/17NsH/A9mXB+zuyVA3AkLmuEYu06KWGGOp8FyACL6GJHqfcOwbc0Doqk9vUBLsICjS0tIiXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cf+jTHIL; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso4757042a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 21:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768368548; x=1768973348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rp3D1Gyy3CCTi05ytq+4em51FnTrdhdCrnVcIgHJxEI=;
        b=cf+jTHILO621YsmQHzLRtujIxCztkgbXDkGUAQOZaKDs4xw0GUqfPs4WJJlh24A4GZ
         MFjPJkDh3LxXPOC2hP6jrIa/qAKnulcvatFgxlyqiwv/KU2++48IlXDYeSi3jdzc/pnJ
         m9BrpEESxQ9u51wWiMCy5AVEhb+Zcy0rF4uHw7AgB7QJvlp/cyMI1RqGMjgrvRPMypCu
         rEh3/Rk306BR4CKBctI+mrfDeG7g8BJzVdiVwdjFqAgGZytC+iI4om4/uqTZcPlJwuNM
         9Mf53gxKxdMW/+kGh4h2qusqCk8xox5o0kwxP9A64Jk6HxGbmZBCjnzNN+TBfoBCBn6/
         Pc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768368548; x=1768973348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rp3D1Gyy3CCTi05ytq+4em51FnTrdhdCrnVcIgHJxEI=;
        b=NpvFFTpXnNLTevUeI5JJYhZoHzYxLOAT99i+GseJ7JMXGPI0EEZOh/17ufSowwH1F7
         5GC/XQfT7KbvJf8bREwipoC2uG+cIxksatS6Dy5SqDS7RQIXpoL4U6JItlb27b3uCnk3
         ClScpn3Ma7YC/jiX6BA2tSlWBFrAw1EPsZt59ADlwIxDHb04y+b7hfYED7ygJWek2QqL
         ezX08xUptkDTXay7R3jeIIHsQ3EmcdponQZDqXPG36REoB5iM5hDHk5W+nlTjXkAywVh
         DwiuWGinAVITX3qx5fJCLIjkw7t+2dhvP1SRWgqq44BV/1k1vhNnNktRv4SfuIDYRLDs
         fZnA==
X-Forwarded-Encrypted: i=1; AJvYcCVrnebGoPX5FEYFrYuNkvGcN555VS4GOiX/Wa7AVtrF7VgmmMc6Ugwh4jI3LwLn3cKEZ8EALPcaBf3zp5tV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5iIFVr/q7LAw9OW38reeFAHIHxsW+x+eYBdWij8eerSKKqFz1
	j4leJLkEunl7qavSf3MBMosJ5vQ5vDSQg1pp7cOvAuI0mgao8mnxumTq4LXZ9w==
X-Gm-Gg: AY/fxX7JR8D28NfhuE0g9zs6auMHXXPM9wBpyDMv0OfSGnngZ3PGKbUaPeRbI8n29mE
	ER+ZbTMGO2At9AArUdGZiWUERq0QzXGSrQBvr29rX6fXq6g7jyXJa0pnneZnM6p0eoj+HnTVwP6
	ZElMBsVeMINPsFS9b8+6OWJnlasOoy0XyEbEGx7aWyZzJpULplbwz4W+CqUcWKvB5Fwv4iNFoPd
	rVNy6jQTrTqAv731Eb4Qdcgxv7lwuL8sNBky0GkZNeShTU4EMTzB1k14RS6PyPPF7cMr83jPMBp
	iB5TWkX/yz1FEvtYC3Pb2YQXy6V8a/xde55WRsYnhHd3GMgeIesf8Sex0iqRzd0oDR8qPyH+Jbv
	uaAhjhS/yQ8CHglp7QICaovSm1vsHXeaozWxYohwSxshLNrDWJ0rbdaLiKH7NPr3bBAyr2ke/x5
	TQgf12KrLQV8O3uWZ1LVIiVYO2EKmYMcrfbQ==
X-Received: by 2002:a05:6a20:7293:b0:372:18b8:49b5 with SMTP id adf61e73a8af0-38bed0b27b9mr1610097637.6.1768368548020;
        Tue, 13 Jan 2026 21:29:08 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b16fsm22460613a12.31.2026.01.13.21.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 21:29:07 -0800 (PST)
Message-ID: <65f51660-a521-4803-ba7c-eacd53993982@gmail.com>
Date: Wed, 14 Jan 2026 10:59:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/4] Add Qualcomm Technologies, Inc. Talos EVK SMARC
 support
To: Rob Herring <robh@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260109095221.2847067-1-tessolveupstream@gmail.com>
 <20260112153134.GA215739-robh@kernel.org>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <20260112153134.GA215739-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12-01-2026 21:01, Rob Herring wrote:
> On Fri, Jan 09, 2026 at 03:22:16PM +0530, Sudarshan Shetty wrote:
>> Hi all,
> 
> From the mail headers:
>> Content-Type: text/plain; charset=y                                                                        
>> Content-Transfer-Encoding: 8bit                                                                            
> 
> When git-send-email prompts you for which encoding to use, the correct 
> answer is not 'y'. The default utf-8 is correct, so just hit enter. 
> IIRC, newer git versions fixed this.
>

Okay, got it.
 
> Rob


