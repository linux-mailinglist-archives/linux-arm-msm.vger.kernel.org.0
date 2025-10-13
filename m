Return-Path: <linux-arm-msm+bounces-77042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 660B9BD4BB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 18:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B02D018A605E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 16:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074F7314A7F;
	Mon, 13 Oct 2025 15:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FGvPhjr6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7A3314A8A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370178; cv=none; b=LQZazX7vnZbE6pe3Rof+htvJTVb+lZR7u0kUP8ZwlqEevW41yxY9O9CwQXZs/fKLUZE2NJffkfFBOvIo5S4cTpiEs1Kz503x3NzJCCCIcxOn5lMsGT/dFCExEB6jSsG1S0rIawZa5wxHQQqSL/go6SgLt1+x6luFfdbjy/IrlnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370178; c=relaxed/simple;
	bh=zHUy7XXGMyXFLXpNE2q0vIraquILzGwKPNK5Is7w658=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=YgTc7QDtWVeWQTWQ7fDfodKO6l6vp5xGEAS+E0uSCiSN8iiI+JnL4bPVWf3TAaUKxxDseaBTLc9sWUijc4KqAgz/5hzzlOIUQpPdpsfkLRM2ZFgOWUIeS/Z8GPfjz4eQsiDZ8v30A34E3wXoiub+Wqkvkxr/2YvrGaX0k9xfKn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FGvPhjr6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e4f2696bdso45165775e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760370174; x=1760974974; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHEv1j+HHd283A1HRLwWHl44uhnMzzIL2eUu93Oc5+0=;
        b=FGvPhjr6UjrQemq9uVjTCWMt1jW95zRG6vTdHtVOLu3Qe8cIXWAvtLc1zMh9SWkzzc
         Q/+RYL01YTFTc1fsH2M05V8cak11kyK2QyZ+eVMIwBhof+iLVACweRvaX9gLXoGEW7nU
         uSmfO8lipm81YqHAoiCDpmUGaiLPs1kKrp9I0zRAXxm9NT63LZ4c/KxJWBw2oZGTBFxl
         aM0NDyQdWHhh5HdhryvGTdNxLm3tWhxP/AW6hMgmsmNA+ILQJCr3bgCK1LwcywmOFA9n
         0W7YWBA7yfNOBF8pDRI9Rc+2s7PQJjg9mboCaANZc3V4VxmBbHwtk6r6yqzzfvmZTEjo
         u7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370174; x=1760974974;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lHEv1j+HHd283A1HRLwWHl44uhnMzzIL2eUu93Oc5+0=;
        b=ni8/FYzP+vdaZbJy3xILi6rcrmsH1rxBxU4EgVhPu2F26HHjG68dgy8pOoldS3m66X
         DCRqEquN2KTXFp99jiCCrfM4deC91AwSUfWyRmZee6/WJ1b/19Xv6mm8Vc5HssRgGN9h
         U5bkI8PRV3cdtXt34JGp8rLvei2EJVM8guk9HnnDi1Ph4jjNvq+fNqkw76VVMeAdr3Ds
         CR+wI1PGwy+1434ycwKW11ejRAvqXdvax7xDJGV5PgLGxrTebhn0cKWguPtYj5Zq4nu9
         409EzHMMbY4emOhruNQRb5E/bCKJ/FsylEYkrKtKfuQmBx5LUlqE3d/TGL2N38kbQXDH
         Wyag==
X-Forwarded-Encrypted: i=1; AJvYcCVkNIXDilLnRwzK5VtlOQ51O/EIDzJ73Mc17OrLAuz4oMsj7rqseY0GJI1ymayf7uOMpMw22TLmZS9Y0pCC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+zUGqbOCeLTwPxcxjrijBdBnIQxuHOZNmK/SdqoUMZ5gu2SM6
	N//Jvn9u7iBo5OShf/2aNejCUmNce5m8UsNld66LwwMS4nqVHacEtVlcrcrgugft4n4=
X-Gm-Gg: ASbGncttp6+tDCDMHakyi3PYYIPscEbu+tRJBsaf5vPqI2UkyARwlS58zAUzkEPLShM
	dWfpLcEn7NmMwM53PCkuiF8c5QqtPITwIKF/FDy8K88Nw50Ep2mBuShI+/4HXCgWSHlK8i5M+hf
	93OsH4IpKKcjU9cXhm8iZCf0tNo/UvrW/JjdydOCB1gtGeSM2TjjgXwMTNlENeOARcHOz/Glpe0
	YBibUwfuEW0/f+Is6ywC0QC5G8JeDWlvx6dkdmug16JMEnc7m9xqz1Z6z3L6oXW4TKUvSpPbc1a
	SS9bgkVK46kmSVBOSJg+CkZZb61NlU13OKmFmU40sLfJyfx2e8MCWf1oFsRxVUs4jJdugoYML+p
	w5wOdD1al2WJiY5/WkyjDCpR/rOrw1qZehkasEGLOKUDwWoVEkg==
X-Google-Smtp-Source: AGHT+IENs+5e8LKBfLhRT9P70/UD8KqfOPC4WFoR5uKqHSevkq3rY6VCRH7NruUPqe4xFx0PkJgS6w==
X-Received: by 2002:a05:600c:548d:b0:46e:49fd:5e30 with SMTP id 5b1f17b1804b1-46fa9a8f4e3mr158026495e9.6.1760370173692;
        Mon, 13 Oct 2025 08:42:53 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:4e8d:2e2d:48a3:9e4a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb48a6069sm192562845e9.20.2025.10.13.08.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 16:42:52 +0100
Message-Id: <DDHB5915QELQ.38GN91PJ6ZO68@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <vkoul@kernel.org>
Cc: <conor+dt@kernel.org>, <srini@kernel.org>,
 <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v4 0/7] soundwire: qcom: add support for v3.1.0
X-Mailer: aerc 0.20.0
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>

On Fri Sep 12, 2025 at 9:32 AM BST, Srinivas Kandagatla wrote:
> This patch series adds support for Qualcomm Soundwire Controller
> version v3.1.0.
> As part for adding this support, a new macro of_property_read_u8_index()
> is added so that we can remove the qcom,din-ports and qcom,dout-ports.
> As v3.1.0 supports more than 17 soundwire ports. Also due to change in
> the register offsets, new entries are added to the variant data.
>
> Tested this patchset on T14s and Glymur reference platform.
> Alexey also tested this on SM8550
>
> Merge strategy:
>
> I think the patches can go via soundwire tree given that Rob has
> provided Reviewed-by on the of_property patch.
> Vinod are you okay with this?
>
> Changes since v3:
> 	- added bit more flexiblity to driver with a missmatch message
> 	to address incorrectly specified dt-entires.
>
> Thanks,
> Srini
>
> Srinivas Kandagatla (7):
>   of: base: Add of_property_read_u8_index
>   soundwire: qcom: remove unused rd_fifo_depth
>   dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
>   soundwire: qcom: deprecate qcom,din/out-ports
>   soundwire: qcom: prepare for v3.x
>   dt-bindings: soundwire: qcom: Document v3.1.0 version of IP block
>   soundwire: qcom: adding support for v3.1.0
>
>  .../bindings/soundwire/qcom,soundwire.yaml    |   8 +-
>  drivers/of/property.c                         |  33 +++
>  drivers/soundwire/qcom.c                      | 257 +++++++++++-------
>  include/linux/of.h                            |   9 +
>  4 files changed, 199 insertions(+), 108 deletions(-)

I just tested the whole series on sm8550 and it boots, playback works.
If it is needed to provided tested-by tag for each individual patch, please
let me know.

For the whole series:

Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # sm8550

Thanks,
Alexey

