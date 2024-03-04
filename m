Return-Path: <linux-arm-msm+bounces-13255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C439986FFBA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 12:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 014CD1C21CDA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 11:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6822376F9;
	Mon,  4 Mar 2024 11:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UVlrbSZ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F46B25764
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 11:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709550226; cv=none; b=LhSheu4e6m4LPds1AtSNs5NbNDccca2UVNE/yKj3YYBYscOidZLy6ZbWdGXyXjWpEiEjAXg7BxWzvo1L76fbUWECdp3Xq+ZPxkVh66kDZJuhiVBcEeOrqFCk3O5796XIE7MK2mwpdkMU6V11ANhJYdSf0wo6ku6vnsl97y96YAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709550226; c=relaxed/simple;
	bh=Cgn+AbUmEAUkw7Gtthr0yt0NYWx7rqcOh+VRv3isIy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNDDhcob0b9PxJXJE4AQf9Cf0Bq1FYAhcnatC1WUo+l/O1Oa0rBkZlE2LSA2ZnJ1wJThkMNNKBqggj9S8aRguohzc74BonlprihHok3uD5tyMiySfPR+VfJ6nwPpnxNrTkUCiRTUYKt2C7L4Ds2erDtC3Qvp/egjEhethWXIBys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UVlrbSZ1; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e5a50d91b4so4045404b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 03:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709550225; x=1710155025; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uRCimQwiaMy/3k7Ta7kTx3HHC9SAus7Ndnzb5kkMHD0=;
        b=UVlrbSZ1O3X16VEi1JHckwrjDdm0LX+xFXgz8nGoPIa1DpQH9KaZ1n3LOXwR0APPP0
         G52Oul5bQr0PYx4Y/6gIe9dTqiHjH12B0FpwgddBVXiwwHhqzBVSMbw0ZPxdhkNQhsa7
         pAg99heaozZG93DiFfHgTfsg7ntxBrR0Lhaoub/wIiAkoCK4RWKLdkHid+oXdpwv7PIH
         5GA5XHLJ2y4hKluvN2tDUsL0lsVwNf+TCJpLNXb73sQL/OOGiVM/1zOejJ/xcDhM8vvV
         lS8sSYSVFVwE/Frpd4Cd7vzpL71MMYMj349parDCc19Wi6Ka0JkglUQar/JlS70nqFXj
         f1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709550225; x=1710155025;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRCimQwiaMy/3k7Ta7kTx3HHC9SAus7Ndnzb5kkMHD0=;
        b=KkMJQ5unuQGv4VFhDGhCmu/S8YhvGUbeK/Dd96Vwd8iauvypk0/I/yzB+jbY5dFKOg
         Sryg1FikKOQpNew8EfcXOP8HjsYbeODXs48Ph0D4JVUPWdOGgJ02ZVuJz6F49G1pRT6N
         b2o1o+DNpvturyHk5c+GnKat7LX2tqc2h46xkNgIzpZVIW5qJuJg+FQRT7yAnKHdXME3
         ywKMuxoR5a3l6atglKoD6mm91Rpodn3LDYaHW9DqyYnkdD3+pLKMktaPV4VuS0TOrdhY
         X9QzloBqZAvCSnjwt8P1JA+8zYTwWRt6enUstPGB9eYcZYbfbhm9jUpT1eD8tzH2W63N
         tLBg==
X-Forwarded-Encrypted: i=1; AJvYcCX0vNlYBztFsEKXh3MZfMIboQIR4KvzL0fO6nGCJjFQ8De8ZxdJOWHGb7tuW1SvBbh0pDh0L31Hfrf5p9WTgvZ0sDefwLlacXACmpw99A==
X-Gm-Message-State: AOJu0YxRwqg1+vGGby975ZtCPuW5vRvjiO04ZHRIr1AwLP71zJvaaH8i
	k+6vi3+LHyVwVX7Zhik47HYO0DsKupXkRerKUb1Z2U/p+63+zxJ4qIVXI8BSwjs=
X-Google-Smtp-Source: AGHT+IFHnmY9rsYiBuXaQPJyCeTKsOqjxrv1/2WHgvsre2aqcSomXoz0h9mLcg2wzjoF7OHK2UyQ7g==
X-Received: by 2002:a05:6a00:852:b0:6e6:24d0:a171 with SMTP id q18-20020a056a00085200b006e624d0a171mr2452853pfk.27.1709550224498;
        Mon, 04 Mar 2024 03:03:44 -0800 (PST)
Received: from localhost ([122.172.85.206])
        by smtp.gmail.com with ESMTPSA id w189-20020a6262c6000000b006e629bd793esm923045pfb.108.2024.03.04.03.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 03:03:44 -0800 (PST)
Date: Mon, 4 Mar 2024 16:33:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	morten.rasmussen@arm.com, dietmar.eggemann@arm.com,
	lukasz.luba@arm.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com,
	linux-arm-msm@vger.kernel.org, nm@ti.com
Subject: Re: [PATCH V2 3/3] cpufreq: scmi: Enable boost support
Message-ID: <20240304110341.vd6w4mbcq6uwrpif@vireshk-i7>
References: <20240227173434.650334-1-quic_sibis@quicinc.com>
 <20240227173434.650334-4-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227173434.650334-4-quic_sibis@quicinc.com>

On 27-02-24, 23:04, Sibi Sankar wrote:
> +	priv->policy = policy;

Did I miss applying something ? Dropped the commit now.

drivers/cpufreq/scmi-cpufreq.c:272:6: error: ‘struct scmi_data’ has no member named ‘policy’

-- 
viresh

