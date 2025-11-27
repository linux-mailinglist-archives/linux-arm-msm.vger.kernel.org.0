Return-Path: <linux-arm-msm+bounces-83665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E02FDC90039
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 20:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D55104E1894
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F933043DB;
	Thu, 27 Nov 2025 19:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E6/jcA2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08430304BD4
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 19:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764271707; cv=none; b=D2lpvQH4wEr2gXq1DA+sYEb+E35Cadn0FMYuNNGGPe+rN2V09TZ9LFuEhGI9KGwZ9yJP/ZrKvvK6dzVA7CgCZDv5WtnHbRtRqJ88Qh0gPEOAYA87snOaoppFzrPHIh9ns1kL66u6Tt4UkpVUp4onqyfipSS0qZOUlqwgldpTc94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764271707; c=relaxed/simple;
	bh=wMhT9VCA+Fg1kyNESQJIEXfJcuvbCg86hEoAgTufXCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQWgeKn/tK1eK8oM6l0YJMHwhTehZnHYSQd56eysWAN16d/DIKhWOCxT3h/0nc17zG8eH848nH76ImLfXg/HO7pNB4T3a3h/UOQzbbylBgepoLPdQA+FFZb858mD5OEvzcKyHFbsBHxMJ1WSlC91bPCKHiiipkOwhD0fAlokgho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E6/jcA2x; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37a2d728536so1059851fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764271703; x=1764876503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aK+ZnzMyo2Qglturi3DKY8unAQuLco/jmAh3/EyH0pU=;
        b=E6/jcA2x9xdQ7QtubDUwyFXRoBY6/UOeFr9zrBZAJoxSxlgwwBTBou2nzHFahG24iI
         vGwHz1LQlCXLODZLKsqzYVHSKQHXXFpYRSkXQAKeMt3M0f3Ew4fYxC7Z8bwrqKvhW4ym
         DqvxnokZj52XQyzXC2ZL4WGJZdgd4zMQ4KY3i6NCn39eid/2BeDF+2dEMJjF4GUAoygB
         72NRupPdJjrvyLlfEmER7IvpRXdxVeGqZ55T2SBk0bpeoiYz6Zgl8W4bMfKy019qsZbx
         l2F9LSQV1NvMQ1kaE8Pf6R2io3P2lzHzXp/fF8epGZLLz4lL8bRHIDkJ28GLCLv635/9
         FH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764271703; x=1764876503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aK+ZnzMyo2Qglturi3DKY8unAQuLco/jmAh3/EyH0pU=;
        b=vOMOtZteD5GsfoG/b+0QqU3p0slOgYHluBXFrqf2VyXiIQUp3x+WRIv6rWNcA7k1dR
         W7geYXtKPmDukChKvV2sOS6jEIaoO6jtPD9TXg9AiST3/PbuyqA4UW+i0BwEpkkUjtcW
         wbFG9YoCynvAYflFOu28AfV7wRpofX3THmL2MWyjhSjhCLcEQIDnoQTwuy6roYLlgnmG
         62cVAkvb62C0+PR0Ty8QOmkxj1VS+8HfMTwADkzGkURVSugZZxWG4j+GpqYmavck9U4r
         O3NwEpwzi8EtTLVqe8Qn6HyasBBh+AksmTtSU3nYnet+jTUOYJTBR8Cfzk1GDgn1Jrqn
         ixpw==
X-Forwarded-Encrypted: i=1; AJvYcCV7p2B3De5yUUpdMtSSqlKGEij8imwdGCnOOFROJghrps3LwnYSBQek0+/ZXaVX/sz+gWuVatp9chVSNtIq@vger.kernel.org
X-Gm-Message-State: AOJu0YywWLSj0aWEmSkSsRfsS6ElEgM6S/kL9BOUktkIQrw9B57ezfdt
	/jUuISjQpVfFKRmUUDWc4M14WSCW1nZyEPzdOAj4lq9WbXpDtvxP3K8ZyHVdVPbShZc=
X-Gm-Gg: ASbGncsMx5McG7Nme9Agzu4Z4IeyP0KnuLp/ODTQeCZJA5FsPUJ1sb8OPfnT/JCO/la
	5Jy1OY3SknXQtshACrn27fnl93e2PSqsQ/sQki/JPKTejzrV+Fl4CVlMmEPNjiEPHCnL3G+tgoJ
	dmZxWNKhDeszNygT4o32LAG0MLokA1NL7nsBY2f2WYSfz928RhNEqZylgNwEzyZF3IQs8sftmf5
	TcJP0hE1vWH1NdjFXkRfN2GMXpm0u73bPUY/GQTO89MACOff+vHaLOzb1Vvdtm4bShn63N1N5uS
	aGAmWRsUOJfi/fYRhhqEGk3RE72n1zrwHLP0KMO0eb2ARRK3/M3NTQ8O9qtIKvesKzmEvaomPHK
	BfucXU9WgQQCNCwGtTrN4i7eboSnctvOHoxbISsaW9oZ0iIgRJlByZv8fDELtKzDVcruZzy7ozz
	5ZkuD4VAPotUmKWdDbrD6msZy4Zl6MZjfQCSEWjLX4NXXjdobhS7UITUHpMO+s2Q0xp+9YLycWk
	6ei
X-Google-Smtp-Source: AGHT+IHpVprhxqb/fHYDOy9jXjkZxaKctTCYR+JZNVbUZzVArM07katvWL6BbKyJBlyUk/6pUXi38g==
X-Received: by 2002:a2e:be1e:0:b0:37b:be38:76ab with SMTP id 38308e7fff4ca-37cd92b9ae6mr36695051fa.8.1764271703115;
        Thu, 27 Nov 2025 11:28:23 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4406esm620078e87.66.2025.11.27.11.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 11:28:22 -0800 (PST)
Message-ID: <b3743f6c-6fe2-48c7-b380-76b26e6b93cf@linaro.org>
Date: Thu, 27 Nov 2025 21:28:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] clk: qcom: gcc-qdu1000: Update the SDCC RCGs to
 use shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, Melody Olvera
 <quic_molvera@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
 <20251127-sdcc_shared_floor_ops-v2-7-473afc86589c@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-7-473afc86589c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/25 19:57, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: baa316580013 ("clk: qcom: gcc-qdu1000: Update the SDCC clock RCG ops")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

