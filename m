Return-Path: <linux-arm-msm+bounces-42236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D82519F1FD7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 17:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34BA4188608D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 16:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13841199384;
	Sat, 14 Dec 2024 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xU5dQtHj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB53522F
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734192084; cv=none; b=cE8EfruJBPtdrWkz/g4EIk5KOtvlOv3fmvQZxT3bmnz+yqzYNtPROf3E2vouCP4xnIOrmSfm3NXx052TdBpRDB6UurlI68MWie1D+k2+LxC2qD9RNW+vsxy1Z1mz9fDnnY9ysiWA7kHVG3iXSNBEGyGYp9+Pgi2LunXxVOR9eWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734192084; c=relaxed/simple;
	bh=djCkpaOEEQOt3dJ6XDBzVVotj3XZNCPmkRaNCWtfNKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dl8ZHJlvH+hIdD49y+4+XH8GABux3YHZfjldDLzXwz4det1vhN8nk2wFmYZPmf2lHbtPbbltSW3V8L1tkeJMmnJlGXOjEmQdR13T0Rw06l3r2hXpjl7TwNywIwaDnlne9PftIiN2IN3qVmejsqc67igiB51/jWFm8CZJNgakqCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xU5dQtHj; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so2785592e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 08:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734192079; x=1734796879; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=52OmguDOAfIxjeQcqf1HnSRCwwgdXocUlZ7XVYEBwug=;
        b=xU5dQtHjD/n3i78eHFfu9aWgjFAb2tiWLo2KCzm/eOx09uerF5MvEGIvqG2WfnjhAB
         sN+obNNmRn4xKv9x52DErZsPZ6l50JF579UC2dSEibqPg6bGFomhKsB7QTZYz8xA3hoF
         Zo4MWm8UKcGLyMBYQO0yvbmWBHrlQNALB6rk2QhhogWipRNmKC01yvzZoabcjDCdB4kK
         2QJ8BNd/cKqYL0K0qPAdQFcxe52ooaYicpubXru/pNFuiLDxrykTru/BgdLo60O1g10c
         CCMZ+ZSWmixTwqyZz0DKZt3GBseGy7BlBmsQVx+stgEka5XuJ35Jmd/PdlfJuwpTbXbH
         jt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734192079; x=1734796879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52OmguDOAfIxjeQcqf1HnSRCwwgdXocUlZ7XVYEBwug=;
        b=TnlK2OeP6fFm7NK+FLswL+ObzHyMrr+ZUWZh8WuB9qfoQLCWW8IwEGGrB+9YftNjST
         Mb++RhVXaNDw2eNzZcqg+ZbT5KyxQ/J4YG8yrHpGapCiuNNOjb1qmaFcW2zENSwe7jAt
         Sx6RkgVhjA6NN5/Y5tnfgHUiAw00+UWAE2s5oDO/CpslAKWaWGCNHgfCGbuhMwcEXUdo
         swghk+KxrAggbE4PuwDPdv4/RanPBBoH/lqwvq1tZj30euskNJ+kTOFaE5Z1Z83bpadC
         nARj81KDsLk+f+fMVzE1elI2zgqI1He4O2zPGLH7S1sPrqe3mOduG7wxCnD7O0+FSkU6
         r17w==
X-Forwarded-Encrypted: i=1; AJvYcCUvFTCrVzwLBseLB1D8aSCsVG2PN/7OHpE356E0c2idHjynvJEHK0qYzwRnx/OqJSE8VEOsGX49rRBrNRii@vger.kernel.org
X-Gm-Message-State: AOJu0YxbQbwG/9Q0fZKkMEqEuQjDcUgZgw0WaTFrL/fhg620n3qkl72n
	YhB9ilUWHGQCRVmw1l2TG67+VtKlR6h4Q96zDBphgwggfiHtBvUXr/HGnfQfQlI=
X-Gm-Gg: ASbGncvhHa8eD2ubSqBbpuuhBo7jzc9m42qquG2BniXd/b0Un8p6rV1flJkSbgHdyNT
	CRNepHFsF6fJ5gqnRDyzb8Td2c00utvcRl1K9yJmCJ//Oq2y5MZmbb6H1XAvk4ky6iNJkINPSei
	o8AsUpIvmb32rr1YG3agV2k1VAvbb60kx03Sh0uAhdGA6w5ZTksxyZ8FsGw6hc/GRVQFAUK+XyN
	QzgMD5Da9GFCO+Kvb0wUPWXu0ZZyWLg213PGMCFW9IU3Kc4+sKVcy5larKrWAO/lrssYuyrl/Ns
	8zfI08PLX/85eUJA0yo4CqrDJBrk+TdQIm7l
X-Google-Smtp-Source: AGHT+IEJRVT5tEabRS8qiSPbOAqG0r3Ssvy5rTdPzfII22ZDgilHlDbeUnMbHUqE4fRYDG7JFW0h+Q==
X-Received: by 2002:a05:6512:3ca8:b0:53e:398c:bf9e with SMTP id 2adb3069b0e04-54099b69e14mr1768658e87.55.1734192079113;
        Sat, 14 Dec 2024 08:01:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c20ac2sm247759e87.258.2024.12.14.08.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 08:01:17 -0800 (PST)
Date: Sat, 14 Dec 2024 18:01:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: andersson@kernel.org, chenxuecong2009@outlook.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, gty0622@gmail.com, johan+linaro@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go
 (sc8280xp)
Message-ID: <qdnwj54vloxf5xqkesx3vbqjdwfjnz46ca6epagbxolvjwq75y@3ig2ljaxzxmf>
References: <lwhell4z72srw67gj6gpt2uyqzx4k5dzjw5xs7dab6lbya7soi@tsoh2bcn2gwc>
 <20241214144829.670851-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241214144829.670851-1-mitltlatltl@gmail.com>

On Sat, Dec 14, 2024 at 10:48:28PM +0800, Pengyu Luo wrote:
> On Sat, Dec 14, 2024 at 9:39 PM Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On Sat, Dec 14, 2024 at 08:23:00PM +0800, Pengyu Luo wrote:
> >> On Fri, Dec 13, 2024 at 1:13 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> [...]
> >>
> >> >> +
> >> >> +          /* /lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin
> >> >> +           * there is no calibrate data for huawei,
> >> >> +           * but they have the same subsystem-device id
> >> >> +           */
> >> >> +          qcom,ath11k-calibration-variant = "LE_X13S";
> >> >
> >> > Oh, this can be taken care of! See [2], [3].
> >>
> >> [...]
> >>
> >> Hi, Konrad
> >>
> >> I want to distrub you again.
> >>
> >> Finally, I found something, after I enabled ath11k boot dbg, I got my
> >> id_string='bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255`
> >>
> >> With qca-swiss-army-knife (see [1])
> >>
> >> $ ./ath11k-bdencoder -e board-2.bin | grep -i "$id_string"
> >> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255.bin created size: 60048
> >>
> >> It have already been here. So that means I don't need to extract from
> >> Windows. I just extract it from linux-firmware then give it a variant
> >> name and send patches to ath11k, right?
> > 
> > No. Usually 255 is an ID that is used by a variety of boards. So,
> > basically, you have to extract board data from Windows, add a proper
> > calibration variant that is specific to your board and then send the
> > resulting data to the ath11k mailing list.
> > 
> 
> But how? Is it possible that some boards have no  calibration data?
> I tried to track the access time of files, the result shows that these
> bdwlan* are never touched. According to my observation, these files
> should have been accessed, (like BT firmware on windows).

On Windows? Unfortunately I have no idea :-( Please try asking on the
ath11k mailing list.

> 
> >>
> >> Pengyu
> >>
> >> [1] https://github.com/qca/qca-swiss-army-knife
> >
> > --
> > With best wishes
> > Dmitry
> 
> 
> Pengyu

-- 
With best wishes
Dmitry

