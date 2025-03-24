Return-Path: <linux-arm-msm+bounces-52277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D39A6D54A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67C87166BF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC40257AC3;
	Mon, 24 Mar 2025 07:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7pw4lje"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDFF25744D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 07:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742802093; cv=none; b=p4rRRS8fEFdRX2C2wlvDrozj7sgvwlO4wZXQKTHe6zJI4G3BGf4Z/CU4BZGIyUon6wX40lZQbPdjGRKkU7SE+yZG/MI6HPhqxREnEeD4dfGFf7CUmrZZm46/XfSGw2TDFaH6TL0RB1KEBimoeu0Numk6X/2Jj1pB7peWQD3uLNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742802093; c=relaxed/simple;
	bh=t9LuTuSgB7oSIWQS+74CbsdvDwfuBsZQt9ORVAh6Xmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBybfZLDNtjnxbLGz+RrQtqYTQFAsVexeN+EF8Cuw7KmVdJoQSTUAW3ksmy7zjGYf1MWH9/QTbhI0qvqU8I31y8w4Npz9/MTTQ29B6g4BljAzMPkMjrLJ3aVe8EgJ/p+Em+YvguLf6UVsNjVoTS5PhR2L7ejqoE3UvP41UHBpr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7pw4lje; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3015001f862so4946819a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 00:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742802091; x=1743406891; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=txguX40hwxFqsph9jZ0ZY6Gsn7G7EapqsYPb05Nyq5Q=;
        b=F7pw4ljeuoQHAhhfW6A0Ut4AXy7WNI0IRZlxxyOs+Aqwwp+eLM7KVwGO2tzE/wB9IZ
         nkibdzZKhyMB2tb1NC+BKu+f38ZhpFEl2buos21qw0j+68oPv1Ngpp9LVoientd/7gYr
         vl2q4Hu0e95GOdav1BKGKZLRqZ5Vyif4OHfxR5XsmtpxPL3Aqi+tXbEuT+w6eEWfO6cX
         qv55CEd2nJOzeDmh3F+qXvyPEmeHm2GVwPrW/DsY3Z5QNPqMX9M2VRREPdbNRr06HzVZ
         5NaAesqh7ht9bs/DjehM5Cue7H1MYOlt/cq+t5vlSUy5yBD/ltqb7pQ9O52+yMSnwqF1
         QVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802091; x=1743406891;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txguX40hwxFqsph9jZ0ZY6Gsn7G7EapqsYPb05Nyq5Q=;
        b=pQ44h13dkh1rt6ZaE2GGvIdvLHMymQ9l1D1pWEwiWM/44J+q6/lZbYESKCQgbu8IMF
         LNZYVMRAyTeT3qE/LwnkmokTRfyV4QSb7rloa0q0z/hfIMSruUTj5VN8b4T/uTXvsc06
         wqPJy7J12P6C3tmp8100naRysUJSmmuAGKnwWA0Pnj4lLuex8+7EgLqng6O5WQM7tdIi
         38uDtCji+8p4hYOMNgyV36I/qc7wmUFTTacFRzM5dgZAuHqvtXwBAXSPsE4am5SDOkU+
         qsY/4yp87C4TYz9eGKH0GpZCauYrBXDL0ko0oPL3gZoK/pbB8aQ3foIfuYS5nfg2gxt4
         FbYw==
X-Forwarded-Encrypted: i=1; AJvYcCW+/2qxgRQ2TPYMhSyltSOmLLOhCUsHflyuZC/fKc0f4pWxS4KcbsgW5pJgn8HmNFBrp5IhNzKJfTFgCk59@vger.kernel.org
X-Gm-Message-State: AOJu0Yy53McMrkuul5X9ZbsPstzhe5c6snchHLu0dCazAYHj3Lm3INqx
	aDl4V7vWN5eZUjlGzJeA3Qywi98ZYM0rZP4quh6ggrateEwDcUO9BFi7MyTPKQ==
X-Gm-Gg: ASbGncur46NxC6ZMpEExE5nc4bAc8jzAeaoTMLkMw0fGCOKm7Usscp6ZcN5XSoCZgve
	ZMY17N6L8AoQJSyhC69cn8DQ9+vZghTT3NGRq46jjeiG3R8RpiqLT1prvHcnM6uDZwpH7GL++lm
	8jEB5tKOUIR5bCOimuqh8/HDOIfi3+4nNPk78Rfw3Opve2rxQRfn3AwqnG+XTo+n7V3q6TAyQUw
	965alKeTamZn7DvntV+4uT/JlQY9ErC17jxf4obE2mDeYRSNzP3SWh8QRoDFyyr1H30HpDDyqqf
	vNBAay083DchTrpR/yTl0ygleM9GO1OoRlPV40SwzKEuZlkP5gEFZ3uX
X-Google-Smtp-Source: AGHT+IEaSKdVHKBTcyVQUTB8pbjahi6HmIfbAfkDhwtDzh9LW/kbNeuedlIsscVIJH8s5eGwIkSKBQ==
X-Received: by 2002:a17:90a:e70d:b0:2ff:698d:ef7c with SMTP id 98e67ed59e1d1-3030ff230b5mr19236244a91.29.1742802091423;
        Mon, 24 Mar 2025 00:41:31 -0700 (PDT)
Received: from thinkpad ([220.158.156.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf61b34dsm11460804a91.30.2025.03.24.00.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:41:30 -0700 (PDT)
Date: Mon, 24 Mar 2025 13:11:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Manish Pandey <quic_mapa@quicinc.com>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com, quic_cang@quicinc.com, 
	quic_nguyenb@quicinc.com
Subject: Re: [PATCH V4 0/3] scsi: ufs-qcom: Enable Hibern8, MCQ, and Testbus
 registers Dump
Message-ID: <icdzzhtobv6i3pporxca3bf4j3stomni756vuonekdmne2uk4i@wfkk7egdajy5>
References: <20250319063043.15236-1-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250319063043.15236-1-quic_mapa@quicinc.com>

On Wed, Mar 19, 2025 at 12:00:40PM +0530, Manish Pandey wrote:
> Adding support to enhance the debugging capabilities of the Qualcomm UFS
> Host Controller, including HW and SW Hibern8 counts, MCQ registers, and
> testbus registers dump.

Why are you sending next version without concluding the comments from previous
one? This is not going to help and just adds revisions churn.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

