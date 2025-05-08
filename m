Return-Path: <linux-arm-msm+bounces-57265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C077EAAFC94
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBBDE4E73E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E11267732;
	Thu,  8 May 2025 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hf9ou+eU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843DC266EF1;
	Thu,  8 May 2025 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713500; cv=none; b=S4ore5WAk/5LT6Ty8da8lb6xmK01IaU5GKT3e8DeIFsheBvGaj8YaOHzdPyK1sIJmFFLqz7XIY5I63U05OqB9DohUn5Tn4nk7Ud/XRfojJ/v1R86Gwjl4O/SdoAL9Z7SrBV+dm49V+8fwP8b8iuSh97jSXdkjxYEBT6zaaoSxBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713500; c=relaxed/simple;
	bh=93klCyoTKNhAzWuevlsS+fZXbDukLivz4ITUu4ZYfuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWUtw+ZS7024/+mMD/5o22pKKvmGTBUOwlRcTvDYpsyKDoF0xjBMkicHy+0sDKaht/xodVx22gEnr6Kni89cEYgRg0K3fnXqXQUyCp6/XI7mI3IpyqDA5eQX5KJtkqgtFhKbawl2TB7t4KMey0qHwuggo6CQedZavm6utkr/dKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hf9ou+eU; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5fbe7a65609so1773990a12.0;
        Thu, 08 May 2025 07:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746713497; x=1747318297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJ5nnUYR5u4H4FMiNdhnizipvd3q4umfiz/JcIFJB84=;
        b=Hf9ou+eUJsV7plRltauEZFFVFO0c37rh2qex+IZVCVocL3fXvfaBZ1jpt/REfaI7uF
         ytxuOF75LsVQLOq8h9u4TvSZ3CSZ2oD3XE6PrEBiMywz1KPzGjwtG5NutPZyLejm51VV
         pU3dvhL+njmfx4H3z1FxVjGa0bKf52bH0WYzD7nkKtKLR9DTLy5n0WDjdKpWv5feZE5k
         h0vHSlGtDtxnmZ5HrGRcnX91qjZaXbljpXu9qtExM2hF1d07InQq0UrgDxkWcUMYvkUI
         Crwp5ZJ0ALkuh39OQgz3HfONagWIc0kB5yeLYg33jSxjEdVlKLxyMO1YUIaHEx/GX0Lk
         3mFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713497; x=1747318297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJ5nnUYR5u4H4FMiNdhnizipvd3q4umfiz/JcIFJB84=;
        b=eeEl8S4Aom6GWUWyMQ/Ut5HGnA7rd9qNtISU+G7ACfGrduvcszNWH0HcjO1p4uCQMO
         slxUG3H4yJ/BDSnT8RyDdqkS14GIXemIRBTzixgleMVHrx5HgOAVGTjbO5QXiIrv9TAC
         is1E93LZZCy7143b4BjiiQHEPnvGkAbu/iQxWEzs9UW/g6LQkREN8qYM+M7eyHsrU5R7
         YKddKhoBqhWfh6ZvmzeUrToE13O7IggcB243DS5ht/vkU+X1RmqCtU/pIrMAHHemIocq
         Ftn5bSOs9H2ungMGUwfFL9Nu8Os+4mIV6HdVGYId6EJ2CeVIq8/N3Y4FewUUd7XJiP8G
         m+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrvBmVSmuVOUld33OPbxyfG8PR2LRe42ZBQhsltozfpBoOB/iQnY4zu5WrOnHNHe8XYmf46gJXlqVCYss=@vger.kernel.org, AJvYcCVvfcx66em7Qe7pQe04IFc80Ad+neNqaIgiSoCOlHyxbPuTkWyD+3I6kTnfxWvelE/e+vNmwKxSeY1v@vger.kernel.org, AJvYcCXs4GdIX4Tfsmf6umue2ZKp1OW1vCd/Eql6zZ10OuVC2m1YxBDIe8skexCqjOOcCH2ayYVwBkfdkZqgHbc+@vger.kernel.org
X-Gm-Message-State: AOJu0YxPQI1nouDQDydzqyervVsUmvM6a0gbLFg2M9OkG1mG+IKad0/i
	u3IxPfM2gLncxyUY5AnU5IxYKGhDxLi3wTblQWnuUFp/5Tjg9JZe
X-Gm-Gg: ASbGncs96g4RNgjJcpmH9wdpHRp6x9LwoHXyshK5tHxcpVqKAD1G6m7DeNGJ1sqjB9C
	S6Ox061IzOAPOJLBU1h8l21JEYkjUUJxCirYtBPv2EbAnybJo7J4u3YusD6ti/OiuciNOX7TZzY
	OSyq3vjiBvI9DLG9xsswd8aYB5WMuB8e8UMVVkr+SDwcyxkoBM4F3EPX91EQ58mBkwYHc7VWL+j
	V7B9IL1PfMHlkWaRm43UHRObDrlYTuhW8qHh/LwIIo6PhDKlMuh4RGVWf1DNBGdxRoG9GTDEY9k
	dC3Ndgnco6hpPGBqWv/bdvb4Kf/4H0fSnKp0MgIyYP6gek1iLJ5K1ENj3JmF80FoxusZlcxarD+
	HrkNQ
X-Google-Smtp-Source: AGHT+IHd64zJE+LTw6DAvxkBFNYRvbilzQkeJXaAqFji8eENn7G5grbiEz4USHisRKUg1+1wTJQ+bw==
X-Received: by 2002:a17:907:cbc3:b0:ad1:91cb:3976 with SMTP id a640c23a62f3a-ad1e8d2ced6mr712315166b.58.1746713496490;
        Thu, 08 May 2025 07:11:36 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7781bf6asm11338216a12.44.2025.05.08.07.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:11:36 -0700 (PDT)
Date: Thu, 8 May 2025 16:11:34 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: qcom: msm8226-motorola-falcon: specify
 vddio_disp output voltage
Message-ID: <6143603464a65aebbed281fe6c6164316dd07269.1746711762.git.stano.jakubek@gmail.com>
References: <cover.1746711762.git.stano.jakubek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746711762.git.stano.jakubek@gmail.com>

After some digging in downstream sources, it was found that the vddio_disp
regulator's output voltage is 1.8V. This is further confirmed by the
troubleshooting guide. Specify its output voltage as such.
While at it, add a comment specifying the IC, which according to the
schematic is the TI TPS22902.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
 arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
index d6d5a86491aac..e6392f7d14c75 100644
--- a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
+++ b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
@@ -62,9 +62,12 @@ key-volume-up {
 		};
 	};
 
+	/* TI TPS22902 */
 	vddio_disp_vreg: regulator-vddio-disp {
 		compatible = "regulator-fixed";
 		regulator-name = "vddio_disp";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
 		gpio = <&tlmm 34 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&pm8226_l8>;
 		startup-delay-us = <300>;
-- 
2.43.0


