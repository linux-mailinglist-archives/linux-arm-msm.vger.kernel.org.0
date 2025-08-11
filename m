Return-Path: <linux-arm-msm+bounces-68293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF69B20424
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 11:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FDA73B3B9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 09:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895852DF3DA;
	Mon, 11 Aug 2025 09:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZrwLBJ6q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB2A2D5C9F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 09:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754905498; cv=none; b=J0GuGU9CaoQoPJd0xx0B0dm8urFN+UOgN1nEqAMqVGWcRioPrSnOZnmVXfvYDOAA0hIpBVFAyza4XBlvPeuibZTj63fkTuMmObXJOto+/gkAjyKYtnl7QuDXLrDvkgvmx2yLDUQhtpGyhwdcCvuYQYrNh6j/Fjd7CO4i9ElQPw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754905498; c=relaxed/simple;
	bh=oOOiZ1lqQ3eCOyBC4RUT7MgiecSXIg9A00t08CokTII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsdnddwmwGgc/In8NpyPXN/11WmmLM7av6IIwyXpnif21RGFNQDAyTNE/ZZ75ZLp7LijzfRy//Rw4FaO3HRmsRoAHDfps3CFN/kyyAwB0RTzpA67C/3LEaVeHkEhdQHFYOtMjwTUBi2cEBMVK7P004nm+cy2LKpuN0hIhW4S7AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZrwLBJ6q; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b429abd429aso2104644a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 02:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754905496; x=1755510296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nCoqLwhb4uI1eEgHGHZ1KDRkXmPyMcyy/GtcB68Vpww=;
        b=ZrwLBJ6q7CR54OXI8khFF0A7T9EvvhJqm8bNzTCmHhQxhB5I1RzlII0tr4ntCdXqOT
         AT3/NaTk2MlnB74BaNkVEA3J8v49Q3ArhLAWPIflcd+ddvRHrRNz+22Jeevrqm4No3dl
         //huOxbZ/ZiD0I5pw4ta9kNgVzjXecgTs9qVtdS2KLgEYlEvzghBIIUFTSWkpIeJvxaq
         ZmbMfJP3FAwZBKnCSpM22CpmdTngGgwWyEcLO3BflUjc+X5mAo81X3NAUPK8G5s0IK4S
         ObSN8QVW5oJuJ3tVHCpkeCRJEbs/7AWiGDQM4kGrlLIxUWCdItro3L8dOg3Hy/1021F4
         GXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754905496; x=1755510296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCoqLwhb4uI1eEgHGHZ1KDRkXmPyMcyy/GtcB68Vpww=;
        b=iwTKlz1cSGD7bGmiVbNFSfXF2JnLgIkXHrCgBMFFcfF2J9XCNmXJKA2ni4BJIBfnhZ
         pH1Cs3GHLBUQkuTkn+rR1Uwo617+Ux3QKG4n8RHIRuLv8gVsMAH1RgscSh8q4Umdb5KU
         C+iX5dqZRgCoTh8IfwyNpLMWYKUV29KEGp23rAxAiAcN8PaCosD+531lZvqubNzgfRd+
         p0vJ7iNQYu0zxYMawLojYadQI5GmN6GLUQVnulC+qO4VoXWvG80af4DiXkjcFE+CsKDG
         Wu1eR9GDzALwCxlqVXYGldei3I2W0Ssy496Jikq7/0l4ifcNztgTbiq6bZoXgFgXpiPT
         11Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWYs31oPuWAVa4yBVjpyyHn30bMKNcu7FUiicVu8eSMxSjUGyTYtoe61LsCCSnnI0f7eCrAtVYlkIcR3l4Z@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu1OtnLX+//w0BWMwV/RePisBqZ1FwjoPMA8l1Uoq1h85c/J1b
	Gf39vTcCroK8qeXEICVHUK6BRmctD4OCzuAepI5KNV3smmD4ToYD9t9FjeiLCX2/t1U=
X-Gm-Gg: ASbGncvxiLjsiOutdb2I0uA4a1d36dcynwVU60pnn+Md4qDNyLOEPaPU91DFR4qT9SK
	+FvuX5YZcWYFiFdKEoyWmOXCxW+zoOjwm54ULP9j3hXR3tjjB4i/UuX5t+6bpLXzU7HZVuxyQ3d
	Dc0kw7R2nLZ0UgAXgKDcMwf0UcLbNmQ6l8tWLjYbzBAHG7KbeBgWtDz4uDS8adQjOG9w6WPB0Q3
	9NwrGTSnEY0lMh4nYiFNQNUbhGvPnbPWzFoXMJWL/yKh+Qd2Tsg5tcZrosPLUiDSnjpes9weigb
	5G5RcDudSrv/lXCKyAhru2q1adQAYWeHpCOcQedNO8D2yW02OGv+DuAWwnJGsi5UgQTx4mhOpcw
	H39d/qcZZvpH4amZeo7LeSpIo
X-Google-Smtp-Source: AGHT+IHx6GR2e/+tS4c7qDRjnWjAYpd+pizXL7vvtruA+7iTSso7twvaaA2D0cifsUCnt3e92ef/zA==
X-Received: by 2002:a17:903:292:b0:234:f4da:7eed with SMTP id d9443c01a7336-242c222bf2fmr179458745ad.44.1754905496369;
        Mon, 11 Aug 2025 02:44:56 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32102a559bdsm15486233a91.1.2025.08.11.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:44:55 -0700 (PDT)
Date: Mon, 11 Aug 2025 15:14:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	konradybcio@kernel.org, rafael@kernel.org, ilia.lin@kernel.org,
	djakov@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/4] cpufreq: qcom-nvmem: Enable cpufreq for ipq5424
Message-ID: <20250811094453.qvlpwwpmkpdyauzu@vireshk-i7>
References: <20250811090954.2854440-1-quic_varada@quicinc.com>
 <20250811090954.2854440-4-quic_varada@quicinc.com>
 <20250811092202.auarwnyoagebcw3o@vireshk-i7>
 <aJm6ixlMamgX/+bV@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJm6ixlMamgX/+bV@hu-varada-blr.qualcomm.com>

On 11-08-25, 15:10, Varadarajan Narayanan wrote:
> Sorry. Should I send a v8 with this dropped or is it okay?

No need of a resend for now.

-- 
viresh

