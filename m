Return-Path: <linux-arm-msm+bounces-83666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E81B6C9003F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 20:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 91D2434EEDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8813304BD4;
	Thu, 27 Nov 2025 19:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QFsktIJS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2353A304BA0
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 19:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764271729; cv=none; b=iNp/mXkPUPjEWI4znrWxOAU0GYhGskCpwJRwe1SfBRGmE/kc0wonaej30H4Wh33pH6himTT4FQOfwOfqoAbLKrwMfMT4so+BN/106J6yKyeEJdaCNJFs/rBt0Kx8cgkWryxUnMr/dUzmKocdlR4TepAjwE6q8Ve4oWb7c6QipGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764271729; c=relaxed/simple;
	bh=HgNIphkgRWgB8H0fofmVUpH+pm7TGTwMqkA9pghB24A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VeAwzrlfbIqe1LAdLtH7HcPeVhgvXUnYOOkdl9iFyGqlJK24FC2OhPToMK141CqoKStNMsrcqazw9c5yUDTBJOiZLxu9Yd6i0ASWtxlub9ERFdae2IKQKa7znOdTQIEdynKZFCc7/aKaIZZwELCPOB5i6LH8XyWURcLTOO1FjZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QFsktIJS; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37a4ab6aa55so706171fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764271726; x=1764876526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUEPJnkiBuZQK3LUealV73M/xL8bSVg1Its+Oao/Qno=;
        b=QFsktIJSRX3pmGsJf/NFZrSnJyLDWDIZhqSuqY9k4zIp4egR7Y2bB8jAKiglC1K0U+
         qpgpJKfPMvEOK967H1qB3KU3pe+Hf+ovgRCjhY4zYmBgVnkupA5X07+XKYsFN2m4gSv1
         SNOXsrfHl+ZJICpeqkUxHrAXn0NLJXYhzK/imi/+XuEmHNqvUDZQbpXDiICQxeryy6H6
         C5y+GJ9KoYE2BlSxYvRMCipG51GDgn3ZXipdX1ogMBLZidPs+y0eyGKDem/aakFU3ROz
         iPZBuDyfQdpmm5d/IqBN+jWNMaB3rjqskgAQ7+1t8vMf5tEBFDEk5bn/eQa5sF3sl5vy
         UMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764271726; x=1764876526;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wUEPJnkiBuZQK3LUealV73M/xL8bSVg1Its+Oao/Qno=;
        b=OhnhgJbaqayt4d62DKD2paq7xM/babsp1JL4jOvShczEhHM7DPoWf6wOAaNBg8FTuA
         5wUGRR9BhM1rQsQpujio0VeowJ9ZD7chk7Pk57QXCIUoaJsGBv/E1NiMV8v8vtUt7g7N
         KU4FpYvb+2O1Pv7sSjNsfm1uoA4Zya6rBYRDnQRmFg5m1X566s7UJKQDrUsnJ7aMxpFP
         PHiOBeIFe24ZaZ2Wht5/cKW0Bp/rjPwf+CfMqtRt1kyluz175fVY/+TgOs5XiGDww3Ra
         0NxQnA5jwYWVfd4e7i7leVVzYt4NCA+8tfUDAXcEU4E+rnuxWI2W4TK33FqoH9pRh3Xf
         PsyA==
X-Forwarded-Encrypted: i=1; AJvYcCUE1/7jm/Fk/6IYUrGFK7QFi8cMHa5jWrcLOu36RXsJ0tURmJjvrrMeKyIlzZPCnodl7JsMHst9epqYyxw5@vger.kernel.org
X-Gm-Message-State: AOJu0YyHNrqNoQYw40L7tXwoS6DDoXd+hDICnMfYBrx1yTD7Y2Cq0VMw
	fzHlFKrzB2RUCTIDWowfgn8DpRud1oUvsXEYdP3SYDWOp7SXfkDSj0zPytxBpeM892k=
X-Gm-Gg: ASbGncsJoP+QM9rTzrEfO9be2n9XSjF4gnjJhDxY1WPRRKiTNmHh96SVqcehZAuj9Q7
	Yj9JItXGs6lJureYCxTKVpGken/NmdwECyYCspc2n6H5adfIZRUjApzit/Ni6A/NxWCrqeXg/fd
	H6rrd7aC0yOXNLVoUtjmPmfGQLicUBj5o6G2CoePL1IGESKsCPVCNHarMZGPEjy6UNgGRouKX6H
	y/AVDQvGH9cdpwY4MdDuiZk0Z5yxVY/06QOVg3uy0NBm9U+0x3dfXRLEXKyehNC+Vrxorlzejzd
	8Qp6QxM746dFrL7gIMgv81Bd5q13lmJBHuVkrT8knN048cyelfGIWeXvJGPBlTJL1GzPF+zIpHv
	j+w/K8HarWvtM4c99hZsS4g++wEcti0MDsB3uTyydBLHJ2Ni3hTMG8B8BHhWbQiTSo+DzjNBpWG
	1ZHKUQpClvc7pHkb+lE4MheuEx+sh8xNI85fXErakvYBkDaCTJx6/vptagYARaN4fyCQ==
X-Google-Smtp-Source: AGHT+IE5LGOdLf0Y/iYWvojWMY550Bwmp3eJqTkKNZMLAkujkeD1aIWJHItk+jaTtGViyh0dgvqt7g==
X-Received: by 2002:a05:651c:2583:b0:37a:407d:6359 with SMTP id 38308e7fff4ca-37cdc33f096mr34504321fa.1.1764271726185;
        Thu, 27 Nov 2025 11:28:46 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d236b7e97sm5545551fa.13.2025.11.27.11.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 11:28:45 -0800 (PST)
Message-ID: <132e5d5b-fc90-441a-beef-2774fb7d56ab@linaro.org>
Date: Thu, 27 Nov 2025 21:28:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] clk: qcom: gcc-glymur: Update the SDCC RCGs to use
 shared_floor_ops
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
 <20251127-sdcc_shared_floor_ops-v2-8-473afc86589c@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-8-473afc86589c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/25 19:57, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

