Return-Path: <linux-arm-msm+bounces-4075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0643180B218
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 06:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30D541C203BC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 05:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7EF15B5;
	Sat,  9 Dec 2023 05:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1vJ2HWm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8503510E6;
	Fri,  8 Dec 2023 21:00:33 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50be9e6427dso2955481e87.1;
        Fri, 08 Dec 2023 21:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702098031; x=1702702831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQ6KAjlHjfDZW8uY6DsJK0Hf/7tre7xZG4al0V3/BsA=;
        b=W1vJ2HWma/YLa4qZdwRfWFFOR+dg5UkAzjXXgtyGEuRTNa9wQOjTi3IguYghYEhd+2
         NsRlVtKkI05GrsergOdtu2nEB4eLyo2o4YzbfzNkNZT3BHqkXlc/y58F6qOwhbJaoD7i
         aJr/5mMNr0GaiULr/6PBEiImX0ud2i+O0rQ8mMPqACHveoJV+fQyzhzgDV3HW12nqsmC
         Ps9Kk+RPq9+u+0eW4X4IgZtr+wlZfgLMngrs+LI09KDwshpLvtXJY2i9Mg4wy5vb29rj
         4q+D0fPEr3LGClfwRxFXsrq3q0siznhCIKU/e+R0HPBm30CTYWgY7nlRuaO1CWhcdW/L
         wlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702098031; x=1702702831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQ6KAjlHjfDZW8uY6DsJK0Hf/7tre7xZG4al0V3/BsA=;
        b=D1tON1aGE+52y7nDr1P/9z5Ucf677swXyp0jFdZ6Ud+V7W3k+wIBO9UZVaceHPkVDR
         8yNnyY2L7bdW1UA4eHXvIdfgTdC2bYIt8qgzqbHUONwTseh6uQOvb71LjGLzfPIkBlmK
         c9dPbbtLR3zOUi5GOu5tbtjnxS3LuotnUgY876f1jPKn6q4IzNFXJ+X/jibUYsy4l51s
         rK2vYwDuScsEDXTNujFcXayPfdRGxeShTGqtILp1cYipL8Fp31pK3zoyo8PTFJH3YGtF
         PJcRolmd4kuTKZmS4rc4cUBWq3wiRAhpAUjcZ+vFIFPwMtABF2Btrmnru5B88ifsh9Xs
         JQqQ==
X-Gm-Message-State: AOJu0Yw5QipRaeSrwCZ+gkDPAGVdHNc5DtBc4vpksLIHjeSRmP8VFILD
	PsAohhDnusq15FEsY9uXOttsQP90JGUSQpDDCZw=
X-Google-Smtp-Source: AGHT+IGsNbYAdw+cxY/PDa+tKM4JAcCQ870JoL59/S6VNsWNaxysMF9SxnLw6vuQfPxameeOStSG9SBG88tMYKMUae0=
X-Received: by 2002:a05:6512:60f:b0:50b:ebfe:4ef0 with SMTP id
 b15-20020a056512060f00b0050bebfe4ef0mr480610lfe.86.1702098031050; Fri, 08 Dec
 2023 21:00:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEPPPKtEoiF-xiNm+LjCxb_Rt4c7rrUDRr7KkGE_8iJDuc+M1g@mail.gmail.com>
 <CAA8EJpqMEmORJYZKHKBwexBCjmA916d9_-Y+eAByFD_VFQiA=g@mail.gmail.com>
In-Reply-To: <CAA8EJpqMEmORJYZKHKBwexBCjmA916d9_-Y+eAByFD_VFQiA=g@mail.gmail.com>
From: Xilin Wu <wuxilin123@gmail.com>
Date: Sat, 9 Dec 2023 13:00:18 +0800
Message-ID: <CAEPPPKvrjvB_T8+JcgG-9JMOJcQr_+iFV+K+mDuspQGeGynZZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>, andersson@kernel.org, gregkh@linuxfoundation.org, 
	heikki.krogerus@linux.intel.com, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	neil.armstrong@linaro.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2023=E5=B9=B412=E6=
=9C=888=E6=97=A5=E5=91=A8=E4=BA=94 23:39=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, 8 Dec 2023 at 17:27, Xilin Wu <wuxilin123@gmail.com> wrote:
> >
> > Hi,
> >
> > On Wed, 25 Oct 2023 14:49, Dmitry Baryshkov wrote:
> > > On sevral Qualcomm platforms (SC8180X, SM8350, SC8280XP) a call to
> > > UCSI_GET_PDOS for non-PD partners will cause a firmware crash with no
> > > easy way to recover from it. Since we have no easy way to determine
> > > whether the partner really has PD support, shortcut UCSI_GET_PDOS on
> > > such platforms. This allows us to enable UCSI support on such devices=
.
> >
> > This issue actually also exists on an SM8550 platform, specifically AYN=
 Odin 2.
> > I tested the patch on AYN Odin 2 and it also fixed the issue.
>
> Do you have the latest firmware available?

I think yes. The firmware version is
`ADSP.HT.5.8-01153-KAILUA-1: QCM8550-ADSP-R01-1.00_20231106`

> If it's true, please send a patch adding sm8550 to the list of platforms =
requiring
> the workaround.

Will do.

