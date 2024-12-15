Return-Path: <linux-arm-msm+bounces-42270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C359F2422
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 14:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36DB7188666B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 13:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E84192B8F;
	Sun, 15 Dec 2024 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dssUxXKB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736A4192B66
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734268259; cv=none; b=lEgWHDoaor+BaxggCJpfNjBkVic9zIZwoJCtlvzXlPMZmQrw3bbDnfAmp/doQEC6eiNRSKS0R/bHlhAHIVc2DpMWavpNjOJ8+XX+A6ngtlF9Bgp+hIgULRl/TeQYZxkmWOTurMXIVWfHGHkprftS/RMwYoJ0bHnzYg0DU0OLKPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734268259; c=relaxed/simple;
	bh=K5/nf71iDVNxc+GUSfyZS6XpkzB+A2xx6OftMChIeeA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dz+HC7CcV6hLgXiRn3D0Al8+mOacVKmfJ8c1f44BA3z6r0H4I15fbAdX1FXdyu+yXh9A42cQsg1UrkY+mUcefEnSq2di/i2Ity6WgdSwmwOxt2Gr6aFcfYfrh009N0pkBEt7aDuJnXL725Z89PzLHcrHu+Zm6SpepLQI7wa5TKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dssUxXKB; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso32594051fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 05:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734268255; x=1734873055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cnbx6Y9yMJBvsPZY055b2Z+E7Q3d8VBnIiflj19jBI=;
        b=dssUxXKBSaO/yaNX1wagGVs4BkBRAAkD4Pc7QqfB9XlZSjZLb8SEOR75RRfCtoKLp+
         j2zvRteFc9LOCXVbBKtrVGwQQZfGf2yExU7OoQNQvwOIeLIbY7ICiReTRxakuh+ywWdz
         td/AqYY57ZI31apd+GIC0kNKhjBzfFhD4ja6AkZaVUXUUS6WYcWigcDuN7qGQrNSISSr
         1un6JsaQyNI9CDU0DwiZFGKsW/pWQ4YrqrTjFPckg/86Jvz+iIPlon90JYh48wepm9Wu
         aC+R6C6KvopQkyL92zTQH6+cPrvmxgHZgIp24QFhlCQk+UDGCKHv7nEaBJPs8R69EtT3
         ippg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734268255; x=1734873055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cnbx6Y9yMJBvsPZY055b2Z+E7Q3d8VBnIiflj19jBI=;
        b=S1+hTtTREpqhaFLIus9bwsElDWUuWR15GIIjK3BdavpwW9k2PL4JJfwKaf9ZejepDR
         dA6/n0UR0Ak1XueXIPUeGFGVxHVnEb/o0bwssOPHvqSjkDCK8ZUBK9hGdZyaOELraAF2
         qdK+Bhetk0K9hCDdLLeC6Qgynh1a3KvWKv8ruXY592n5eB9T22w4KqjT1zmzTXaSk8Lh
         noMnX1czP7DBz68NDn/yvKcqsx5YaAvODRPBvygPWu/qyE/K+VdZtb1NrI7W8H5bpnpK
         gKJfk0IQji87uka1lW5gsHRRBCQmi9O3HBFqpY8OOaNuADVTW3myZ3mptvZwL0Vzsihs
         qm0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdNaIIE1CUGrAuUpf1Po8y+IvhchYQnF2kZu+Atjja6joQD+Zb2iOoBG3OojikWw81+OqjLTSHSsciwaq0@vger.kernel.org
X-Gm-Message-State: AOJu0YwabGt3K9bsXuPGeBTfwg7J6SGXCN0Bvrqt3KhaeZGQ8kmrRPtG
	uBh0kfcbO2mdqOGbuQSREy0UyuUroGWFbrjtIaon1AlGoy9/Ezl/QdEc583eLCI=
X-Gm-Gg: ASbGnctbt5Z2mq278j3A1Cl1/RuMWaMdMTekyU1qbSUQGhHKPpKN4r3dUack6+1W2w2
	GQZNVZtF2Z4aorlzsaGD+56SMSCNTnDntrU6C+4S/YjNJ2QNvI8gWXlKXoBgarrC6WuJ1ZqyLBd
	UTJ+8toojPcKZ+mJu3g2v3dHgf8GzzFxHybf3RK7qdb+3d+gvNfSQQoLSDvobW5mnzGmeO2ZeIJ
	W7/U/nSrC2m6mu1VrIreDOSSdsrP8xMpwD1aBwW8eXxWLcvui5mXHTmFFMyGCFPqErlw/4c
X-Google-Smtp-Source: AGHT+IHTw20hSoY1t2S8hQDm6sAR/6CNjVdyRnyImaVn8xVxpAXP6KiR+1x/jnjFYeOmyB9D3YqAAg==
X-Received: by 2002:a05:6512:3195:b0:53e:395c:688e with SMTP id 2adb3069b0e04-5408badcf28mr2596428e87.10.1734268255530;
        Sun, 15 Dec 2024 05:10:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c00262sm496316e87.138.2024.12.15.05.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 05:10:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: quic_abhinavk@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add VBIF to DPU snapshot
Date: Sun, 15 Dec 2024 15:10:43 +0200
Message-Id: <173426667309.2196979.11608285674325095814.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>
References: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 22 Nov 2024 15:09:10 -0800, Jessica Zhang wrote:
> Add VBIF registers to the DPU snapshot to help with debugging.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Add VBIF to DPU snapshot
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1a40bb31fcf1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

