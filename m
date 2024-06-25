Return-Path: <linux-arm-msm+bounces-24104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5859168B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 15:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EA3F1C20916
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 13:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1CC1509A2;
	Tue, 25 Jun 2024 13:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DATyc/Za"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0AA157A6C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 13:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719321549; cv=none; b=VBGIOXD5DXhqKEoSwnUO0N+/ePMopHUbUI6oD70j2dBlG2KMorDmCoI2WGq3OvkTDQmOgl1i+0Zh5KGUJMKecaykqN66EFBHPNsMX6AeRYniMUsHQg6RH2R+w4hkVJ/Fneu/qYITxlRfXls9nfnCvVaF8GYYirGc5LHSGjKbK6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719321549; c=relaxed/simple;
	bh=vWS/mnVp4hFq6wVXe1g8Jr8pTNH980df7zMzurqUdHo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=n7yn+YAn6gczeqoul6o5mKsOcwZJKnMTRvOwaWQehg0NpGYWGaOAgRBs2Gf8IIHDDdu3sLtjAVuukktTayZ/VrpHTspZ2K6Y63jBSFeW69Yd02YTc41Ncl6P11AU/SEBUfJ/Svk7sF3Fqj4ZV3+AyoBf4MV1Ela1PHZkPifkl88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DATyc/Za; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52bbf73f334so4234964e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 06:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719321546; x=1719926346; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWS/mnVp4hFq6wVXe1g8Jr8pTNH980df7zMzurqUdHo=;
        b=DATyc/ZaX+RpdeCP0S6AQ1E6TCNk7HvWdhbDDyqafOHxIynEG2jYnBSBh6dX67kvfp
         UKbDEVWNFdEwa8Zok+AgYJeObK2llOQZd3xPmu483guKXEAk/PH/cVy8q2bCXq/elY7R
         /Bxr9bWh6uH/IG/tlEQ9wp7QbLvcCJ+uB0CqLXZ7J6DaiTUu3j8hVU+T5FHCsfnh6V/5
         vezn6uNd29f6/vun5coASmiKKMUHVQLB3o/34QIhRNUFcN+vZdtRwZhJjQLzK5oiH7wh
         pSoy568GX+LmfC4n7zbGKsH5mxGVnKIEyt2vy3ZpOuLR4oKNI8ex8laBeJkKhYrdZ0e0
         5hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719321546; x=1719926346;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vWS/mnVp4hFq6wVXe1g8Jr8pTNH980df7zMzurqUdHo=;
        b=H0kT/438C98imCpe5dcnEO8CRGcEpHNrQGYNNkkWZYu8tCNvSNODTPxZIPGi38OySy
         qAtChQmULBJDs1cAEexVvt0bc0mczFirVqcgVLFRYmwCnMZX/UcdG/5TqjeQZQmbTzHC
         bqSYYJ8YZhlQYOhcC3lCTIYHIaW648o1YxI6r1XhCY4IJKDNZSBWN1nFamyOkuJvJHcu
         2ktuZicy+OOHTPJfFJnbBSjH+PIe3Ld+7fq46ovzkFeFiUZvlMnWA7F/r+tly0cx1flY
         1kPjmYaGhhS4nRz/LJ7m9ehGE81XNP1huOZIMbNgfNPsU0l0Mp4oDPCm4SuYWzCZTveL
         93Bg==
X-Gm-Message-State: AOJu0YxVR/Zkd2BRGJOhVtDAgCjAcYNmptfnCC5B27AvcmeAUlHNO9uO
	lt7VrKoqcSEdesSQ4I8PVp90p+LvFAAxOIHl/4gShpWbc4rZOkk+Tc638FKS
X-Google-Smtp-Source: AGHT+IEtomCa4jRiitqGCnxyjj33kQVSZlGkdazOLdHHGplnNE8uJ+Nso09r9FAeUnE+RRLWGtYUFw==
X-Received: by 2002:a19:2d55:0:b0:52c:cda0:18b9 with SMTP id 2adb3069b0e04-52cdf825734mr5651083e87.59.1719321545674;
        Tue, 25 Jun 2024 06:19:05 -0700 (PDT)
Received: from [192.168.86.250] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f6717sm13087756f8f.9.2024.06.25.06.19.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 06:19:05 -0700 (PDT)
Message-ID: <1e77e3d4-9286-4eba-a623-6bbf5290e52c@gmail.com>
Date: Tue, 25 Jun 2024 14:19:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-arm-msm@vger.kernel.org
From: Neha Giri <neharajendra.giri@gmail.com>
Subject: Subscribe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Subscribe linux-arm-msm

end


