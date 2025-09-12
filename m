Return-Path: <linux-arm-msm+bounces-73386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6375BB556FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 21:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6066D7B5AD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 19:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5B429BD96;
	Fri, 12 Sep 2025 19:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kFpbx6+c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBAA28725A
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 19:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757705851; cv=none; b=ZWPHal+IeaQHfGr/wZ7IeOdqKTYltYtQ8l4dqqZ4oeW8JeFN2UHhe2fhHNQEzKWlMlZ0PC84+YzXZbR428wMfcgDgbF7ZPqmihU2oQfXjYmM2yo1xSeE5Jt8sqUzL27gtOFFkWYX33nL1ugAslWVzU048o+Y/t7AB4Iw1dP24Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757705851; c=relaxed/simple;
	bh=jA4wqu8GiEeHtdnCeD5CK5KRYYjCmySD2Ig7LvqbLvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lt4o30jMd/MLVjRkV6ldCQezOFjPQUdQgHdQDQj7R67ndigerrch4KgtyjFJns/KX2hfKv5Ay0liARLjsfi1BLt5fszkCJsEQjAg2f30dT25sI4Zz0tQq1lRu8bMgZJPu7Ed9uQN5Hx0w4pozEfNDLqj7hjPXZrHcsgbFweQC4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kFpbx6+c; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32326e8005bso2049207a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757705849; x=1758310649; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MG8qheklqH90QoillqEWtKlvYUOtiPcMmtaoD7S73Y0=;
        b=kFpbx6+cfRDl6zH/qqtuWqnqkT8z/4hnFljcCzE79tCabjdui23SUJLdYodCFlQSX2
         kz9mIeAJCHRcU64pWFatcJDddWtC6z4b7uluZ3K9kfhSmxqgvHdEfTGrAyKPXKWk0qM2
         yMg4450bEnmdaFAOAEl9/oh/icjMTKy+fpHzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757705849; x=1758310649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MG8qheklqH90QoillqEWtKlvYUOtiPcMmtaoD7S73Y0=;
        b=pWgWiR0zlLGow1w1jM6xInpftyvZuujXd7oJxg26djx+wjEorkyArDULtp+pdjPqS+
         i47I59uGZEmbhHMffQe2wfk0wei7d/mCBK7tZdea8ji3Y9YNj+A8ssk721Uqzof92zbM
         SXRfxzvkGt/taJ5qfCzWXjt9PFJhdUUjbGG6P9ehtxEXEPU8pZNI9w9nvichRY0UNl/c
         xTv7+M0xBJVNw2H79wSnqva0Jd8eZ4Hhdp3Jg1soQxmBD9d/4kXAC7EtF7XIxfktYfdG
         Tag71+3X9b/3ti7enjSNquNl2OgAXNT7Mfbw343dKDtxEQqZM8A3Cu5SrIVEkUKgQOGQ
         7/Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXBSO0RGYKEzjTGO+c7VUxMVd7Jg1VQoU3O1qkYzCi67hsSuG/P5jaSBrXWpSkCP6D0EREDZeI1dKY97jLw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ne4rjJaeW2eZClIdC0bLEoxU/umDPHTHhj4N0uQrbYqkKbJQ
	e5/g6m+W+BhxFcc8x3xcaKIQolJA/rzTAlihkijuYKdx6sPYFkKLjai/i1wDsRHX/w==
X-Gm-Gg: ASbGncuzyaIYBUzbqJSC+XZ3gwMZ5oLaxRSz/tL4XDrFtpQ7kGFOcPGlXCACDX1hzGb
	5iSdROCG/jb+NPRJCjoGHVSm07sCa/71fGaMPBmyOsyWP9r2A2V1lj1pFpnlgeKunqeVNPUNLSn
	ygHCO8yEQOh39OETRXheBZ2XyOPnsh1q++uglrsmPoQBAXjv2wEj+kHenfowiFosCT1HYafXUwV
	LFdLL662uclyiNzSdebWhIsxhfvYzWKs+34LYk2XBuleOFePso/fciRhaTHQN/Q2iiXh+5+lcrX
	C6bI5UwmLDiLalR0VOCjE+Nv6in6ly/DwpqtRXspXkzqsDKtvkY6k0sDec+vRusiEvGikiMTxI4
	rPped9KaKoYOw3FQ3xf7G8DuPEQqO+l3GyBYQD3Mt4wCq5lZmSuQZaE/QPwSbrXP4cveWgQ==
X-Google-Smtp-Source: AGHT+IEJWqu2QUfygF3YV1YBp/hXP59cBcFdW/VqJblCIvlUJMZ2WVhUCTFyXUdCNveV/J1mClgmeg==
X-Received: by 2002:a17:90b:1c87:b0:32b:623d:ee91 with SMTP id 98e67ed59e1d1-32de4fa205bmr4591160a91.27.1757705849658;
        Fri, 12 Sep 2025 12:37:29 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:e464:c3f:39d8:1bab])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-32dd61eaa27sm6985775a91.1.2025.09.12.12.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 12:37:28 -0700 (PDT)
Date: Fri, 12 Sep 2025 12:37:26 -0700
From: Brian Norris <briannorris@chromium.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Odelu Kukatla <quic_okukatla@quicinc.com>,
	cros-qcom-dts-watchers@chromium.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc7280: Drop aggre{1,2}_noc QOS
 clocks on Herobrine
Message-ID: <aMR2diG8zwvPRSXR@google.com>
References: <20250825155557.v2.1.I018984907c1e6322cf4710bd1ce805580ed33261@changeid>
 <20250825155557.v2.2.Idebf1d8bd8ff507462fef9dc1ff47e84c01e9b60@changeid>
 <90b13660-1844-4701-8e63-7fde2f093db0@oss.qualcomm.com>
 <aMMcNn82AmSavJYf@google.com>
 <b51e1230-d366-4d0f-adc8-fac01b5de655@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b51e1230-d366-4d0f-adc8-fac01b5de655@oss.qualcomm.com>

On Fri, Sep 12, 2025 at 03:10:16PM +0200, Konrad Dybcio wrote:
> As I attempt to find a board that would boot with your sw stack,
> could I ask you to check if commenting any of the three writes in
> 
> drivers/interconnect/qcom/icc-rpmh.c : qcom_icc_set_qos()
> 
> specifically causes the crash?
> 
> FWIW they're supposed to be independent so you don't have to test
> all possible combinations

It seems as if any one of them will cause the crash. I had to comment
out all 3 to avoid crashing.

Brian

