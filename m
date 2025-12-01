Return-Path: <linux-arm-msm+bounces-83909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99690C9571B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 01:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CB2A3A1B30
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 00:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62ADF36D4EA;
	Mon,  1 Dec 2025 00:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBjRy9BW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C994C79
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 00:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764548037; cv=none; b=pDhlB8Qk4IE1LLtzHHwu8rf1g7guRVFrIzlvV3hr3nFPkyin/vrU83yrdzp/sKS/Az8lqcurMnoMro0gutqIi3o1osMtu3eCymu7QRrroM1jnjgOiRuhSMwd4xIkFhQU8ZEMUjz1m/2Oef35DevsyGIeX+RZ2bZbx92pKid+aic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764548037; c=relaxed/simple;
	bh=XZDBFeOSveiAVVICQYf5inaVTPvKwFEm+wic4vGe6gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XyNwLC9qrr1GPjFJAYbAsjdgnbkmbGuiPOzKbEi/pr+XYqCdcXFkXRs+cLNJKUIapY0ekOXgJqxOB9fLOzWXkvxmMaTb8DF4UiosEXP44O+Ol6/CwWkg+vIM36qyYQEaFkBz51LZQzpYRzKEf+Zt8pfIMuepm6DA0gByaks3Bx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBjRy9BW; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78ab039ddb4so34120687b3.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 16:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764548035; x=1765152835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhgqPEHAVied+bvslO4D2+NiTeUca2gsxHO1K1xsBSM=;
        b=NBjRy9BWEDrXRjHdGuk75lW9yz3o504fyRgBULYY2AUCcHwQNLwAYAzKOYQijeitbR
         WsrWfO1MtZNQHB2UlerfP0ZKU/SfO5iGw/Hh7gFG+DnDM5fw7hog65C3TAhk4A8Mr9Aa
         rC2byC+CblZJmAqWq+rtJgwD1IxhUgNWuA8OV1Lw14sytaBD4k5MBoTqeS1Tws/SeA0x
         qx7rI/eRJCMVYau4D5LSlLHB2WhbpOvSK8QIg7az4mHFlzxK9EENlgpFpmT/DngHIs+h
         pYaU/zv2yt84vLxpCGXgZcfla3kABZ33x0jU0Br71d5DXRwewmTQ3f/ATBicfvgo+nL0
         B26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764548035; x=1765152835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JhgqPEHAVied+bvslO4D2+NiTeUca2gsxHO1K1xsBSM=;
        b=DarBCZz4Qd6i1XjQiL4YvcHd2uVSrPF+/WIQUjIKNizbZhv2DgVw/cIt0jHseeXHRj
         a6lTeIGjGhpx1EHdZ3OebRrDaXETsiSZHDa5oFaV3+YqDU+htR6OmLBOSO9LccJoQHS2
         MA3+Tm5lovj2y7jgqVcdmR4JStlFTIvVBSoON/LL0Bj8WsdaQT4vJZbo96pIvS8ghnJm
         ZR5lPl39ix6yTu/q09l2C09RGE+c2jU9D0a8t8eZ/gy3HUpxF71JPOYOdqrTa4hWGsU/
         Msdla/rv42NdybbERnvxQK1wDMs+SfIjdAnHlziUQsiHWLgau/iZFEHEQ9wo70evywBc
         kBQg==
X-Forwarded-Encrypted: i=1; AJvYcCVo3RTKdJDvEUwx4hCDAzI4B3F4TGTOVkeqh1w0ZR22evRk+GuYh5PtoYhfhV2hWQukjsZH12bD9MtwmU6X@vger.kernel.org
X-Gm-Message-State: AOJu0YxtWXbnGquInirCQ6xLDkc/OrPdoICUh1cVsd6eeXFkdPmpIhJQ
	JjTiKgK0A4O/PBfzwRp1RUc28hOVeLxngtO0vrROqsc4yw2frv/tzjCF
X-Gm-Gg: ASbGnctOAA+pMDmRpeu2Qryz8Uc9qeUSGGXMmKlSi2HaYrAaaBx8zaatvTik1LraL4t
	2n/Dqvkci/n2QLu348HNPYRNf7/FLlj8VWh+LQA6FIJFsxWr4fywepod/++mH63e59q4yg1QnSg
	cqlfE2WpidZxQ17jt7i6kaWt0+fwGxlSsFyrTpVuhSnYmyHaj7RPl+trK2XF+uA2WYY5KthFHyn
	ZhyiZoCOfWQmke121wv6kLDMawcAyS1LQ/ooLnd1EwWdQC8y2QGxmII9/NssbCE4XrbkUx3iGpO
	HPjPxtSQPFGMV8VVgYO6ypVNmi8YGx+OfKn6TmWRl7QOi4j/f1y9z2NITfUoBOsmYVZAiXYPIJq
	2sP6eJNWox8RAZVcuNy8BRMMKWZu6lMVa3gvOJ6zAfQ0tRKrzrh00JL0MwTRAefaeoeEQ+ssqgL
	on4F/ibR9dWmdDjYQX+UU/0dpxHzJO0BUDY5FYq6FPbi3vZMndZynx4cpOx08=
X-Google-Smtp-Source: AGHT+IEmlgGyroXsPoYWC6AyXSzvWQ9UmiRkTlcECxYQVwBbbQRoUHXQg+OWZhfmwhS618cczeXgjQ==
X-Received: by 2002:a05:690c:368f:b0:787:ec0c:da38 with SMTP id 00721157ae682-78a8b577c22mr301740827b3.70.1764548034671;
        Sun, 30 Nov 2025 16:13:54 -0800 (PST)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-78ad0d3f5c8sm42643627b3.3.2025.11.30.16.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 16:13:54 -0800 (PST)
From: Steev Klimaszewski <threeway@gmail.com>
To: jonathan@marek.ca
Cc: abel.vesa@linaro.org,
	andersson@kernel.org,
	christopher.obbard@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_rjendra@quicinc.com,
	robh@kernel.org,
	sibi.sankar@oss.qualcomm.com,
	stephan.gerhold@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
Date: Sun, 30 Nov 2025 18:13:53 -0600
Message-ID: <20251201001353.9852-1-threeway@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <35615ad4-5b86-577f-4695-c6cd85206334@marek.ca>
References: <35615ad4-5b86-577f-4695-c6cd85206334@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

On my Thinkpad T14S OLED with 64GB, with this patch applied, I am unable to boot
the laptop anymore.  It doesn't matter whether I have mem=30GB, nor if I set
CONFIG_ARM64_VA_BITS_39, or not limiting the ram - shortly after loading the
device tree, the laptop just resets.  

I have tried over 20 boots with it applied, as well as trying both booting a
working kernel, and then rebooting as well as cold boots.


-- steev

