Return-Path: <linux-arm-msm+bounces-56462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7311AAA6C5B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 10:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36DAD1BA32E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 08:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEA2268C6D;
	Fri,  2 May 2025 08:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cyowpTXs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6080267B9F
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 08:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746173647; cv=none; b=tmUzanjqd514FI6XWw+7dOxKJEg42j2hOs1ESO1NoSCwo2Ad47T28+A8SjA5CXU6nFIYJEiouMPZUMNoC6PBcsuFLKKRqwKP4pupJJK0QUByr0XiUXsg0CnJu9QdXQvVy56wcW51ufI/ilrRi5oevuoh+rrGBVPsmNKtiRzvbXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746173647; c=relaxed/simple;
	bh=Jn4eWjXxwsoqBV85M6GsL2+wR4fJEbwSADRw9jJ+1DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlqIPYnA1OES3EWd8KBSzfTLmX9GnrgI7Elt9Ftxem1Jo33uTjLGgZt4LhZ0xMhJpOhdVcMe74itbz4Od2EJC5mV/UBqIl35eGOmAINU0YjxUF77ADBju8YGV4q9DFlUClxaw2RZjm/E9E6czlTpQaLLGVWeeA1dbTiAxcbNQOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cyowpTXs; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2260c91576aso16190905ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 01:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746173645; x=1746778445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h9CBhyGDLFpnb+f5rsG3NlbjD1cjKYpOIM2q4JdOS8g=;
        b=cyowpTXsjL2zxgXj1XI9wFYIcQbYM50MxhVTzyX8NC0B+biSwUCQoEw/2/7PU7gmmT
         ulfpw+sw3Ksga/mX6qR488sb9jAWWjSjzsCR/HhV7RJZrDceLrm70nGFXJcqu1+aqc4N
         EyzE8iETxmM+ltSUuE1Z1IVFyUdO9Vb33q5S08qujdsISd+SCvKoh17ShR+vLDM8FB2a
         J85AdBGX3BQ62EKhn0g+NKVAAenOd9JKh/FwaSm61XGWX6ZsKZExqaxa7RufTWop1iHA
         ltXBlO38NIPjT3/X3nvWtwHbsBc39MzxfZTEquBG+HLixgGqRtNonldsuXPWi+wDx6Jk
         Ne/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746173645; x=1746778445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9CBhyGDLFpnb+f5rsG3NlbjD1cjKYpOIM2q4JdOS8g=;
        b=bC79KVORkaIVfN9hA3AQuTONH6P6HqmkxJWy4HkMiiINUv3svQTsO7/73lE4bRk0D7
         QLe5wnu3uXx8bCRUBrO2SJcOq78kK25H6FZokJ1/2QheDG+BYWJchBkL6TpnGVWuB7sK
         TwvsiCSlhuCkv61FmXX2CUJtWKsC6Nm6LV6aNIM+TQGMjvcql1zoDMfsDZmjU/x0HUVt
         1VKuuOQxlJdKNyVxf4VuGndndYEmABD1ENNmtz5WnsEgWKQfE11mshKea3lFMnHTu1Az
         0IVdOBOO8Qhgwq62phB3OebLH52V+SdH1ND6jc0L3YCUK9juNpddiGQVqtL3zsso58Jh
         9kOw==
X-Forwarded-Encrypted: i=1; AJvYcCWbwWsY70qT5uuSwyh2w8xUV6T6Y4cGwBwIrE2qOxiJzRxtDw8zKmJt6o/qOvuRNeR+jYio2qzeBoGdZ+MH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz79cID4WoU/KGLT/y9au/JUtE4SBzHRxJjKM/SsGZDAflCuraH
	ZtTNAya+FLt0h/55w3o/WoavXyInzdPlYeJbCCE4r49ahmMi78IB/grr7eThg/8=
X-Gm-Gg: ASbGncuEI1K95VVK2teGUP/XuRrXwpktVu5znh9iCSmdxcMFkdgH6kcHAG8w2eKJJ6Z
	rhHuE2m7UFT+jc9lZatZivomAQ8CFWhFXZs4Voejc7qepS3+FTB3qcrnmZNStpErCRAAm4BONc4
	Blb1hcY+j7g51RBUr77F2h+WQ+I9/Ak/qx1O9yDVIXFaGwgXC1egFkdqb1iOlvY2X9dqHm7Vund
	3XkTmkGN3TcwhdChwX1mC6OsLLMfLf7N9xjuH3VVTChxd3JYR2VYr7LXzMZRZrFqdFP+nAjXK4a
	3CgRLMNaR/A93s9zyxDMknqKMrl/HW+JzKz6bht6fmPbZ3U40G4N
X-Google-Smtp-Source: AGHT+IE8k2uHCd5vOWDOxwC36pkdJWkb0CZOrK041eLixQ2GEf6iz7bejpQdIdbRQPU3r3GiD0ut2w==
X-Received: by 2002:a17:903:3bc7:b0:223:f9a4:3fa8 with SMTP id d9443c01a7336-22e103571b1mr31592105ad.19.1746173645117;
        Fri, 02 May 2025 01:14:05 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15232224sm1644065ad.253.2025.05.02.01.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:14:04 -0700 (PDT)
Date: Fri, 2 May 2025 13:44:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
	quic_arandive@quicinc.com, quic_mnaresh@quicinc.com,
	quic_shazhuss@quicinc.com
Subject: Re: [PATCH v3 1/9] opp: add new helper API dev_pm_opp_set_level()
Message-ID: <20250502081402.yjagnnjrfva7u4cb@vireshk-i7>
References: <20250502031018.1292-1-quic_ptalari@quicinc.com>
 <20250502031018.1292-2-quic_ptalari@quicinc.com>
 <20250502053758.utawzhq6famwenc2@vireshk-i7>
 <8ba02745-378b-4264-883a-b99764701d0b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ba02745-378b-4264-883a-b99764701d0b@quicinc.com>

On 02-05-25, 13:31, Praveen Talari wrote:
> Shall i keep commit as you suggested with your SIB.

I already applied it to my tree. You can drop it from your series now.

-- 
viresh

