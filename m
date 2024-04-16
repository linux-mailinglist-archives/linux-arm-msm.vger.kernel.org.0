Return-Path: <linux-arm-msm+bounces-17607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8278A7172
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 18:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27BCD2849A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 16:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B472C19B;
	Tue, 16 Apr 2024 16:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RISmRxOx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32B9F9F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713285079; cv=none; b=kMw6kfYn8UMLOabK507wfyIgZa+7zKcYH3JwB4KPwsrxvwSmbFddBTw8Sy7iET7mhk/BRqPenkTEWr1S5jadyy186u+WXcKHG+a66mGEQwuZ4ZVZdQt19jU39yuLtSxQFjL/0nOnv4eFOUMR5iHQ12kBumzV9RfhbhhTIh5p62U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713285079; c=relaxed/simple;
	bh=D/TTuyRaftFb3LDRxju0Ljo4YVpxPz74LbyObKzjd2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsbNiZFAQtRYsbalfkR7RNIevYGfYvA+KTb/XKgbl+s2DerxhZLaxUi+LKmjQluvL0cQB1ET3BWzuZOMErEdMTTc16Hw7Kq14ZMqdvcppeBQlDg4JKzqneZ4CIMo6h6RQ9qukzbQjyDdpkFI1coIXyN4R0nkV4QQmbjvPT+Zi5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RISmRxOx; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-ddaebc9d6c9so4194022276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713285077; x=1713889877; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9dToPYehH+g6V6v2hNgg16rhT+ANp2c0WokJKovgwYw=;
        b=RISmRxOxxCujjZUVVh+Y1LxtdOCbFGQ0XcqTDkqTUA/g4NlkP3FtOLUkTN+hgUU6iv
         47lHLsWh6oMDWtxMAZYWgxhAXdy0h47Mgc19NiYP1S+eCr96/ryeIbkzOrWpPBzeTxTo
         qWK5ZrMiOUbYEXakStWDcU3ZxJhprC4bDb9ZmQZNiRMpqHgZb606iW/TPWN0zS/R+Eb4
         GT7Do3B8uEPkOzAT6YvgfXGYgs0tMX4i1ECaGBO/N1il32Sf0cB48N4MwXC/SKQvbHqN
         ez7wI6pfUmwWlMQpKDTK9I+jDHlFFFtufygWJgORr3dK+FDhR7JAn97mrp+IJiR6w1Fs
         V6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713285077; x=1713889877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dToPYehH+g6V6v2hNgg16rhT+ANp2c0WokJKovgwYw=;
        b=LyVbBxja34Zh5Pt2LlwCxncAY3Bglp9ctVCbav4q18dziWqt+d6YRvr5hwqU6lIUHk
         zw8cOM9Z/GH5BPanJAowrf2Ky9NE+Ioa+Ki7Bdy9AbWqykykKt8CQz8y+9+cBotjHs69
         Mr3kHphniXM8tJkU7AIljvTNfdLbc591KkESHo9TPY0Et/dm0JTSlmIgJnbQLQm2yJVW
         PY0hrzvVZqEaDahS4iesfN20m1Reetvmt6Glr9KeoFKC4T50GgBAHnLlOsvK6GtkwZpI
         V9FYrJKmVS10Pl4F7JHcmZkxGp1K9oWw2YHpKYEt+Qi01yAP7DQxW+wUyiPCiQxy7y9g
         mYLw==
X-Forwarded-Encrypted: i=1; AJvYcCUwrZznxKxR8FHdXc80nYfevaKTkbFMu0gDqzre72bDfK+HtrQ+YzSzxvO9gNtsRA/5hDHqbHyCgYHpo+q9C5hVe9KkEJrhztQs6bcvqQ==
X-Gm-Message-State: AOJu0YyTmCzTyWDRM8S4G7By473uTHpxyBbP41hzC/TZjyi8rBicVFAH
	T9w3/AjGaczySA0lI3gfCKA13lfGB+T4HHV77qwNW13bLKFjHgea1Nd/92fyMfz2fq/pz31qTZY
	i42YU8bTLo282qdU4M6Rfkg4+2ujTRYU7aULpuQ==
X-Google-Smtp-Source: AGHT+IGBjn7zuaQgCFJTrQ+1Nhcpwm06XCwoBwLu3ii+rK6PeQm5e0AS9rBhQvWI9xkE/yOff1MKshJ9e4elqmpnh6I=
X-Received: by 2002:a05:6902:14c:b0:dcc:eb38:199c with SMTP id
 p12-20020a056902014c00b00dcceb38199cmr11823917ybh.56.1713285076816; Tue, 16
 Apr 2024 09:31:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328095044.2926125-1-quic_sibis@quicinc.com> <20240328095044.2926125-4-quic_sibis@quicinc.com>
In-Reply-To: <20240328095044.2926125-4-quic_sibis@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 19:31:06 +0300
Message-ID: <CAA8EJppg6MiRawsJ3A1_FKF_1cti6Jf0LQJOuTKx+Akhig9COQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: x1e80100: Resize GIC Redistributor
 register region
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, jassisinghbrar@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org, 
	quic_gkohli@quicinc.com, quic_nkela@quicinc.com, quic_psodagud@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 11:53, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> Resize the GICR register region as it currently seeps into the CPU Control
> Processor mailbox RX region.
>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

