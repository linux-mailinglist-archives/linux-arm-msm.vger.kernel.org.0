Return-Path: <linux-arm-msm+bounces-67068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A96AB15AAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 10:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F112544717
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 08:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD774292B2D;
	Wed, 30 Jul 2025 08:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJIXC2ee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02EE2512C3
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753864138; cv=none; b=EzIXCOowWOSK8ea64Bbtt/NEVDg3gM2baJfdrc7msRxwKPhAFuWkWDaOhcU3x3hoPRxQM02ffMWfirr7RCxBgcX0ab4ld6Csbu6ZuRduddZfaUVzx4iGmpJq5y9sIlmN5rssdrk/MxbJuDv96AqDcgwGQlojbjpkAuNoOMKIFNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753864138; c=relaxed/simple;
	bh=1r0lsiP6NFGnYsSI+kcsYV+APIoQCHOYgWvbuEVB5cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLjyxdtXI9ujUQI4b90ZwRPHW0ps1m0J/4uJsPz9xEyn1tUwn+LYt3+tFV3BOPJDS949lsKi9roEQ4YALEWsqvWrktjUMspPFYe0AtO6QNGxDisJ8KJdjm2DELXrPEXh1r+jrEn+VxE1PAdEwp8w2bUVQCY05ErvRae9qazXb5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJIXC2ee; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76a3818eb9bso1117527b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 01:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753864136; x=1754468936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YerKRYt4LpxD7mnuz6omSbAb88Gr2Tk54H8CGOtbvNE=;
        b=AJIXC2ee0SLyJg4Q7rmt/K04rQ/yuITaF6KL8bseDIpuRbI2W0d/3ixxVAOHw8xEdW
         YWBMFkxY87FCAzPgaGwOZjnPZVlnQ74f7sY1k4vs4IJs9xTYHwwAdSIQNW8ZDofma8vk
         vYQlSo10TV+y0NGravTM/AaBE01YQliLDXahIrVn9dhrgeBF+HXmNokTJmDeg6HulHDI
         0Ni1OfVCFC7S990O7phwaibR6bI5zurNwL17z7NJXZ7AtMI7rSmVlxfWunhS+rqTLMDU
         qRviaKbc6rJ72M6nF4fY0vp6zp+HYVHj9bliUBTKu/Jd5+FZgVp8bnMqhM5267E+EQA7
         isuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753864136; x=1754468936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YerKRYt4LpxD7mnuz6omSbAb88Gr2Tk54H8CGOtbvNE=;
        b=XFfSRD3pqu5rdvDUdTZeESYyZcJLVaLSoWvblDS2R3wcuzgRVQ0Rm06LqS+QG74Nu4
         sXafQcuMNhIlZdDT9vuPlggKgvWCt+yLI3G7O64Ni/K9Q80cTlCEGUqEMCud1JLU03xm
         8FnIsz+PE8UMVjtF4JWDCXo+hq3lQe2Lx50PNBEisNgG0QIEWKzkDMIjLbLjGblOprTK
         56wqX1VMhPA03YF1eGtzjFjn9bfECGv9DYgCoXQKf5c9m9XcTbch1vTINRTRvzDtI4hz
         GgoAZ/S0VliPWL5YGaoQX5teCD/cCmGWHk9ozDlcAP3OyauJTcAExxWMjJ/o+aro2vhM
         cLDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkPmhcHwWa3uqaYG1BmhkXb3XFp8DCjyVPRAN09bpOCSmrbxhuaRbdOTHz9Q9ZgWTGCBT3ZXgBS2VG9i8s@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu/H/NRlHLtqvQpBV8BboA7h3Afx9ubfmGslbB9/TEtMYcXjOu
	xZeZycSeeOtOZocmZNN5jPBAoFeC4oVAfqa7LxyBgvTTnco1h2O1AuaVS6DDrSDdrAI=
X-Gm-Gg: ASbGncu1tzSIUPiNodpy7+P/mNlb4bGRLPLJjKNBfDKoKhXdGsDm3Qicuju6vbmRAM9
	m7KgU00+mFFG7biCIZyjwyOQo4+PJBA0LuZ1cyI76yU3+rRxveg703+lLBd2wRISYJD+dYE5O5Y
	YoUQgJC7LDKHPT4S0OvLJ9xWf7cvqar81spse+VGE3gBGJAMFfHMQnpcBewc/eCGZJsDnkMCJEh
	3uMdMblEHxZ4RpFibib4olDQfFtRjzY65GHAq6MFegRpawEAXOfRkismColHISePO9AfaxcnHdB
	j/ErtkclZm1e7XxybqloCndTCsar0M9kJaE6cXkCYh36vG92tlcG1Gcn45eOy9+uVtXZDZg71DM
	U6Ls1fZvGBvLisNYKDvu3qmM=
X-Google-Smtp-Source: AGHT+IH0CJhtgQb6pIChZ+X8XZwoN1ESWodJscR6CHa9EpEX0lyC2wpKatW0FkXPKTJsPAVRZjuF7A==
X-Received: by 2002:a05:6a20:9389:b0:232:87d1:fac8 with SMTP id adf61e73a8af0-23dc0eba14bmr4486339637.40.1753864135839;
        Wed, 30 Jul 2025 01:28:55 -0700 (PDT)
Received: from localhost ([122.172.85.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76b8d37eee6sm282359b3a.60.2025.07.30.01.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 01:28:55 -0700 (PDT)
Date: Wed, 30 Jul 2025 13:58:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	konradybcio@kernel.org, rafael@kernel.org, ilia.lin@kernel.org,
	djakov@kernel.org, quic_srichara@quicinc.com,
	quic_mdalam@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] cpufreq: qcom-nvmem: Enable cpufreq for ipq5424
Message-ID: <20250730082852.oxy3tjjtdrykrzne@vireshk-i7>
References: <20250730081316.547796-1-quic_varada@quicinc.com>
 <20250730081316.547796-4-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730081316.547796-4-quic_varada@quicinc.com>

On 30-07-25, 13:43, Varadarajan Narayanan wrote:
> From: Md Sadre Alam <quic_mdalam@quicinc.com>
> 
> IPQ5424 have different OPPs available for the CPU based on
> SoC variant. This can be determined through use of an eFuse
> register present in the silicon.
> 
> Added support for ipq5424 on nvmem driver which helps to
> determine OPPs at runtime based on the eFuse register which
> has the CPU frequency limits. opp-supported-hw dt binding
> can be used to indicate the available OPPs for each limit.
> 
> nvmem driver also creates the "cpufreq-dt" platform_device after
> passing the version matching data to the OPP framework so that the
> cpufreq-dt handles the actual cpufreq implementation.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> [ Changed '!=' based check to '==' based check ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: Add Reviewed-by: Konrad
>     Change speed bin check to == instead of !=
> --
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 5 +++++
>  2 files changed, 6 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Lemme know if you want me to pick this one.

-- 
viresh

