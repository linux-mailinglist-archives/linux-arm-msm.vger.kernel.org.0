Return-Path: <linux-arm-msm+bounces-86694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A81CCDFFAE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 17:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 856CF3011425
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 16:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA513176F2;
	Sat, 27 Dec 2025 16:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDhJKqxm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080991F9ECB
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 16:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766854411; cv=none; b=eDYuEGgY/as3lkpKUjifHd1OSRaj5hLYyT6IMiP28/FB0lmA3OULv1SrO8oB+zgx5FND7yzvcPQSFZaj1jeEq7rX4ta8Elbu+zpyGf9PIRLfwqZHF2CmcRQw61TaQUPsRTfv3WFSrRwoDc9Tx+6cLxImf2IUVuV9RvHA4wg5tBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766854411; c=relaxed/simple;
	bh=gu4P8yCtGv38ojTrodppXUMSDmAq3ug24zzKR6LldJ4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Y3ryQumhuqjxTJ5s8MwssrXejOj6i1JveMoKp2d4PTsxfPR7bnD5WnMhqj8XF3K6VZ/uAaVoSVj5DtSOsLNSl6rSqlhyXVa2bkOvICPzHUC0Lf5hAKfhGUj5tCyTQACDeYZmkiI9TBUQDxL5zvcR2tWC44A8NE+6dPgGwU9+wmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDhJKqxm; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-787d5555274so73154157b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 08:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766854409; x=1767459209; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gu4P8yCtGv38ojTrodppXUMSDmAq3ug24zzKR6LldJ4=;
        b=QDhJKqxm7FEZ4RFnti2R6tTqK7hH71vHV/VblwD6XBiZr35ArhxkMjygs3OtTmFvtm
         GQ1AmgwfSWQWL+gElq7vwkuZxf7q15KuUdqRblWZHBa5u5182q8C7A4C2XA4t6uzpKVX
         +pNd4dtyEqS+H4yN0jP/nFje92W/Rymy9ExrCqlaR3XpzR80zooQy6x8VpCA23ZD4qYf
         s31Z59m4lqS140QE9rpScOvahBnTZ1C/ToyacjYxwYseGZDw31pF6UDbPh3V7QuYIDxN
         Qujj3bknKQuzHI2l7qf60TMVrYFbmcw4wq7t6uSL0Ohv3827R1oksyZgH0fG/ILY6khr
         UNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766854409; x=1767459209;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gu4P8yCtGv38ojTrodppXUMSDmAq3ug24zzKR6LldJ4=;
        b=lBRP/gVkHXTGTzS8ugSkQxDzUCmUB6RAvCPWrt2yCBdUsox+wvvbOHQKSReNR7Wn2Q
         tGXDnOIoSy5lz4w9BwfJTJaQsaNpEKf/8PIMWRuxWR8Q741+I9T5GSY107XWmwL8j4u3
         KUjWNcYjJl6KBRehcBBJfFqmHiYkaK2sGxEhhNq/UIC6N7qrbiHgeg7qJ8oqdU7cf02j
         l6JbnwJ1kXotid4XPoaT/j13T59El+e4UhTqxTG/gsptHh8fl1WlItcBDw4R42p5N3yw
         EUaanQMfzDigJFR0O7cV2CmAxQbDvK5NNvsW3Xo4UpBqnZ40BRLagcjZD154afJKV4v2
         yzVg==
X-Forwarded-Encrypted: i=1; AJvYcCUXV0+Xa+0vjADSSpYIVGnjRypcB5o8xESfC9j1mX8iExtJkOhUTTbyBiuJXihxzXXk61jRP/VgL8rg01ry@vger.kernel.org
X-Gm-Message-State: AOJu0YxSH8nq0RBcn5VRPb1ISOqazou+0Qe48ixhpYETw7cVfn789Ba7
	AV79vgC8nW3D/+lxwlqovzyfl9bTOukLoVZ/4u+v7EbSbKfgq+rx+IswVyvbhgIJRHf/+tcZN7N
	0FrPYLMLF1cRBlZMkwXJF7vQiO9RwdLQ=
X-Gm-Gg: AY/fxX7fZ4c1TYSp841sETmwOhGZfq5wtxhVUA5EWIDLI1Ocy2lCAkRpxachuoI8dFE
	j7uxANWdvKq6ys91NOcDriQofjN6d+Clx4UBLW5p8W4ET67z5a2SaB9UXqgEwSR0ZWEkYeYvUk0
	Z06ZmID2XrMxTfs8Qwrzpzga5Cctu38cggHG520kkGBRiR9T260hT8a6k00iCGfgS1RL4009KtF
	ZWuQa9mOGF+V1QbczW9vkukBfa7pyOz8B/kjD7q1bxICaOgKeeslA2FwfyScdyzrvgh
X-Google-Smtp-Source: AGHT+IF3Ar92THam/YBoDFLspVYsbTbaPEn4UDgIjGwlo+OzDwvfQfbc5kNYDFIO2HEklpYYD2voIBzsATqCIeii49c=
X-Received: by 2002:a05:690e:ec3:b0:644:5d3f:844b with SMTP id
 956f58d0204a3-6466a8a89d6mr15524495d50.54.1766854408938; Sat, 27 Dec 2025
 08:53:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Sat, 27 Dec 2025 17:53:18 +0100
X-Gm-Features: AQt7F2qYKWCD4_nduV_EbKeCZVZL2BRsDeJglVK1M4bYvsM7D9xgKCVpKAP_4SI
Message-ID: <CAGsSOWWMO8+8vB2EM8s1=hyN1raO6TDpqGBTdrmNrZpfDfn5wQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: dts: switch to RPMPD_* indices
To: dmitry.baryshkov@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, konradybcio@kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"

Hi,

MSM8937 and MSM8917 MSS would need more power domains like MSM8939 and MSM8953.
I am planning to send modem related changes soon what are interfering
with this change.

https://github.com/barni2000/linux/commit/21151cb3d07124897e4d3dad51c833c4af27f6e0

Br,
Barnabas

