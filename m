Return-Path: <linux-arm-msm+bounces-8019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 174C5839804
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 19:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C43CA28D882
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 18:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A20B7FBC5;
	Tue, 23 Jan 2024 18:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZD/nwtfW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AD0823D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 18:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706035333; cv=none; b=A3Wxc2gyPx24y5Hik1vvGGPgvlRtxSvEnUE/hOpQ58PvXIJpSYTt+gI8SXd6F4XcnzO6QynUnzUAXD6rUrSm/vLlCDqFNEJgKjkIYrPhTwzVFX+Vl7BnkZ3bVtE6mpl5a7B6woklnJ/60vWqbY7bFYe/1qNLpUXhpUlX999u09A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706035333; c=relaxed/simple;
	bh=jYLyxNEUsjD3oHw3RfCJzuYV90CU0PZCraZsQjrd19Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvBSqLDU+EhQ0g2UmnMIA1WUe7fxhGowdatKLhsBeuF/XAKpJjmVCgY2N2mDxyEIt3Ug4n3EZaYzip8b5pnuAev3LWd+l2sge0+wKosjjWmWijDxvQWTi2ZdLWlrha+DQ9ckRCUMbHXJrKeEMlviLvp8gEOkV28EkxzfGq9hECo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZD/nwtfW; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50ea9e189ebso5149166e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 10:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706035330; x=1706640130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yzsTsGczKI6Xyfdy4MTULSYbNs/jLsDoqBb/j5tuTTg=;
        b=ZD/nwtfWSVfMSfWLJZjx9cUGISmdJnJU05a7nDe+4/CkvN6pL8Noi3N0qRZ0W+UwLA
         JvOU5jCdnh5JP5F4Tdabkxy0HUmQaq1vCJ1ijG/1o7wbuGdHcy/BCg27nHk77YcSljwR
         gB/0ldnH0BZDsBcZ0dx1/LMGlB/UiHmMYVdDkXyqZ21Nu7kAbifQSZ6MV/0X6ahbWN8U
         jsuNGrbKyV+4YEejCfk5gC/E2RJXncnW4JCv1zzxBU0kQ3K3db8QIWQlQTt63JWmKGn4
         JLTAv8c+yjjGy6q5dHZMRPmoel3P16qxsOIoBFES8FRf5ssQ57inu08tlhPAgzb9La/V
         1E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706035330; x=1706640130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzsTsGczKI6Xyfdy4MTULSYbNs/jLsDoqBb/j5tuTTg=;
        b=TfKjtyLDoWLoiirU6VVbhPdjBHNJ5WLS3b6Bsv/YtsaDOz3C8F4o3rgs7RgB++zgYX
         bP87v47ytigH6FvAnisa/yYgh61n9Rz03rqCdlbrEtnqgM1C/MNhyd6NMiVx5hnIiNt4
         lhdgE4HE77X1zZJocOaqB5m43kzYhUq9KrGFD4Vcoz3KHb9e8U17wT4iV0ubjqYeQtWs
         ByHP3lHsTcPy9kPmd5oldpyBg5+mTLLS0x5jsAA2yJUhzq/KCujsx76yZJcDzfX9iCV0
         DkqCf9a6qvo0CiyeDjDO6m33qV/XZs0HsaIhmcUXfpRPNK5Jgc66AtKoPWhreDC5C8IL
         BtVw==
X-Gm-Message-State: AOJu0YzXJCUGH30rzI9PNWQSNmDn3dAY9FWw36p9ii5AvZJIYtODbWRK
	B5lKLSYbMcP4sd69eWL6sI18DTSiR4r4zQWmf6R9zk45sO/Uy+ejIlLfa33HaIg=
X-Google-Smtp-Source: AGHT+IGaEnFdqksia0Yy81wIZbaYWiYzTjjDrfLdKLLyXbeWrgcxmcdx+hLeizeeBQyBYR7z+QJLbA==
X-Received: by 2002:a05:6512:b90:b0:50e:7c70:fdf0 with SMTP id b16-20020a0565120b9000b0050e7c70fdf0mr2913447lfv.85.1706035329800;
        Tue, 23 Jan 2024 10:42:09 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id ep26-20020a056512485a00b00510091c44a6sm40347lfb.165.2024.01.23.10.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 10:42:09 -0800 (PST)
Message-ID: <61730f0a-bed9-4755-9c47-1bd2044176ed@linaro.org>
Date: Tue, 23 Jan 2024 19:42:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] iommu/arm-smmu: add ACTLR data and support for
 SM8550
Content-Language: en-US
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, dmitry.baryshkov@linaro.org,
 jsnitsel@redhat.com, quic_bjorande@quicinc.com, mani@kernel.org,
 quic_eberman@quicinc.com, robdclark@chromium.org,
 u.kleine-koenig@pengutronix.de, robh@kernel.org, vladimir.oltean@nxp.com,
 quic_pkondeti@quicinc.com, quic_molvera@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240123144543.9405-1-quic_bibekkum@quicinc.com>
 <20240123144543.9405-5-quic_bibekkum@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123144543.9405-5-quic_bibekkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/23/24 15:45, Bibek Kumar Patro wrote:
> Add ACTLR data table for SM8550 along with support for
> same including SM8550 specific implementation operations.
> 
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

