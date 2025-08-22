Return-Path: <linux-arm-msm+bounces-70254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FC9B30F97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 08:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D0CF1C25D87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 06:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C86C15E90;
	Fri, 22 Aug 2025 06:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EksWfMZl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5842E5409
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 06:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755845483; cv=none; b=GZu19Bp+KT3yWtU/Ql88RvbI3gRf8cWGE32SUiakTeNVEII8Cc7ky6hdNhjVzwMGVr74By4fY/sz5Wey8QwtdNWJfK34aIcwWwba0zbLjlz4+882xPXdOgzCyD2ysn2uactnXRkcvppZsRuxiijghkpudRhV4+Uhm1RTVfp8avc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755845483; c=relaxed/simple;
	bh=w+fF5jilwCss3OzaglG2MI9XKzVq/OKDUeZWYv3d5Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePE9+EQvsAkuEccrr1pRecMeZLXvLJ56hH5rzxJLC2erDM41OlimpBKG9/hkKaum3i7U88lgn74znQYmd1R0Q28PS4rhAWRLsptBCT21JDu17GzvqKbx+E5h/wBmVEqBpx5BcDmNNyOBzww1oqnhQO1v5EvVevNx40Bwl8uEUsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EksWfMZl; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b49c622e598so59106a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 23:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755845481; x=1756450281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wnWlGVKFdFIBt1j22TCSqfwegODnyLKYBcy7SHn/za4=;
        b=EksWfMZlgr4e5ZZThYERWiBQ7aMeSuPlEUg2Lbwog/Po0WjlUTyewqcU0wAuE23gS0
         YaXbNNe3hoGrMgH9pE+x98EThdmcpXDbf4ZKlyClWmW7va0ThDh4ljLFhIyyGSl/lKkS
         okjFw0PmAnlvexeq6aeqFl5r5euYi+8FL20H9JAP4SD/M2pJQEXDaqVPo2UQMf0DyBaB
         shYCg8xsZn0xEyiqn3ZcbD8GQvp5GFvrnVuHcebM7j+Dow10jOmvA6zv7s0HHes3fKmn
         mFNNHJKJaCxP4txRNdhaGi5RyK/6O+P0K+CB0f0blNOnb96aSHRRerAq55B6tjUMPYt3
         x95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755845481; x=1756450281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnWlGVKFdFIBt1j22TCSqfwegODnyLKYBcy7SHn/za4=;
        b=iRjqrX8vH2DCkVqxuXgci6mYbkSDgjlAl+NdVmKi5ErlZY2cfl0KI2Gh+d47JsjBdd
         +BZHagrhu7lzofNvcF282m+Ie1D4P8vinAdUuXbEHPusHZsFMU4o+xqA2Z7b0AewoPUo
         WIS3p5MpJYLH5P92CBdNhu1F3S/z4V+thMeYpQRcOUwWGSt+UQ01h1iZyEqOJvJBB0x5
         fFsON9gJXzMYWWh4TfAnEHhuhMN9lV0TFpGhcRXkCUKkygK4VcP/xIa5H5f2De/HrTgb
         dG1FzSEn122dDGNLTN0Fwai8HUCGR4DJikQ+cwXqSJMqqpl022A1nfUhE8RgehhN4r+x
         tyfw==
X-Forwarded-Encrypted: i=1; AJvYcCWELPdFd885L0Biyl0Bei3ipXBttxGql8bk3GkwKcFu7HrgQIddrsULQ5pHITl9JnLYNXf8wu1QVvUpuAjw@vger.kernel.org
X-Gm-Message-State: AOJu0YxfmqoUXiYDKTqPEuLqw7rhZGsDgMH2dzdCYPNvkmgsMkXmiO9s
	9M8tLhzzMg1wQZrpF8NnVeU8yiguxUJhvPYw0yBQ6O+RYtJIyHDsN0NZMGIGG7891iU=
X-Gm-Gg: ASbGncvlQdepS5xNN7fNi/k3N5N6MFd2dUkG2XEKlRFSFQt+kdyNsKu4kVsUUUI74do
	9J759CanJcUH/2pyb7ewOD+WN/3B/F/n16hLEtT87q9IIdt/ssO917kewfJheH+n1B8rtrpLxlr
	6wf3VexBP4S0Dw83VO9nmOj4ksv66XAn6SQ1tTqKTuMjcmrg8pxc425aySe2/pH7NbiwYB0CWnD
	b4nvFzIvVwxKguNZkiDWbyd3SUGO2SCsshRa7dxt3dF4SN2iBEifypBtF9VZHmQlcLpTE5qf7kI
	l9S+Z6t/E2ve1LDY2OF/7E9lNJbVzkURzpqWK5hy8NoOX18jdIV/xS84GeKD+clVhQydfAIzSXm
	sUdAbfmZyX4x3jHh16AOfYZIC
X-Google-Smtp-Source: AGHT+IFuWz2fYkZGwCki5RHEZnzuVzd/HPxt47eh+hbJsFpZ62hbUXT2LVNh+1RDFwpb0mmLfChYMw==
X-Received: by 2002:a17:902:d607:b0:246:441f:f111 with SMTP id d9443c01a7336-246441ff47cmr14160665ad.43.1755845480880;
        Thu, 21 Aug 2025 23:51:20 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4c7489sm74182225ad.70.2025.08.21.23.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 23:51:20 -0700 (PDT)
Date: Fri, 22 Aug 2025 12:21:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/7] OPP: Move refcount and key update for readability
 in _opp_table_find_key()
Message-ID: <20250822065118.qktpqaudc2uhgzdm@vireshk-i7>
References: <20250820-opp_pcie-v4-0-273b8944eed0@oss.qualcomm.com>
 <20250820-opp_pcie-v4-2-273b8944eed0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-opp_pcie-v4-2-273b8944eed0@oss.qualcomm.com>

On 20-08-25, 13:58, Krishna Chaitanya Chundru wrote:
> Refactor _opp_table_find_key() to improve readability by moving the
> reference count increment and key update inside the match condition block.
> 
> Also make the 'assert' check mandatory instead of treating it as optional.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/opp/core.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Applied with:

@@ -554,8 +554,9 @@ static struct dev_pm_opp *_opp_table_find_key(struct opp_table *opp_table,
        list_for_each_entry(temp_opp, &opp_table->opp_list, node) {
                if (temp_opp->available == available) {
                        if (compare(&opp, temp_opp, read(temp_opp, index), *key)) {
-                               /* Increment the reference count of OPP */
                                *key = read(opp, index);
+
+                               /* Increment the reference count of OPP */
                                dev_pm_opp_get(opp);
                                break;
                        }

-- 
viresh

