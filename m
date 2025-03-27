Return-Path: <linux-arm-msm+bounces-52626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D66D6A72D8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 11:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A85D188F05C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7710520F08C;
	Thu, 27 Mar 2025 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PH3/UzjT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A803020F063
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070488; cv=none; b=sP4q0zX84FN/oO4HX7dVuEOSS0gVyP+8cIBqQiOY3SAoaDPxZ0ReRhvngOVqaJoQAO2S9hy7PNxdVMBESJlo308tRVtfo/IKysGjOXqVQMHxndUlucOBA4FPQSxGI5KjpSARxznOXtDYK6nXnUDky7UzqRpbjPcOCulxPBA0U08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070488; c=relaxed/simple;
	bh=C6Yhmj5NSDmuki5prkNWWgqAqbPvRZU5lqPe4zAvakg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNcc47IYZh/Yf1hV6BcDPULx6WD1fxaxlBsl7TAFglLdXcMs40oetQrzy4kDYy268e+c6zCSvqT5bzex77AUPXZp5m7XzAxYRnZM4CMNRW5mFS0BtcJ1/uK1GxzWk5d2rnMTPgP4FRnnw0MjH2PPwPBM4ECOGcdia3TnvW6Jsuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PH3/UzjT; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so3836425a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 03:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743070486; x=1743675286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXU1FLrii1vst2IhDKt8s9STfEquca1Y5iYBAMgYvYg=;
        b=PH3/UzjTb/1krpG8Qhb+auQ/CnsfSOHHdB5Q+A0CQ6doDY651lqKw/HkA7VjN8r5tU
         CrY0UQtBs3JEewTrzqDftEEb9Zb4gVZoJ9ZT4oM5VT1B0UXMzRfMBeO9G8dNVh5Cyq+4
         VYZvKWVsJQ/OwT7buSyKLOanCGFys1x1pAC8KdMiTHANjyFOHsDfMLp0FsGZx/VsjlRV
         YI8zgtsxAa80/58k6PTyoEEbR4MsUUR+671M9ABK5abRbO8EZtGaoNT870aDpujfno5l
         jGR45gPctibq+09rgy/uirYVpVDif3QdRwQf0cuL8YJlBvdrPEmpVrPBKUkmP/gSMuyW
         svcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070486; x=1743675286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXU1FLrii1vst2IhDKt8s9STfEquca1Y5iYBAMgYvYg=;
        b=qpdD6yYRpsmhHp5s/Aj4AWR7g7KNndJTd7D+7he9xmHM3LoeRTKhIoU/eGCiWE/xNc
         HPwHd4NoARnc9/jCiFn+ham+J/dLD5gaRKdU8bjVmhLHcEmQWVSvFhuC7/H9kXCHPsHA
         tk01fNB0ohiR23vWrY66RoFatl9cRk4HigGVdExLBT97Z73GQeEDuQojZDtgVGhr6ekB
         pU1oDGNcBw8ACI2x9h+vpUrwPgudbFZoO3tRirBxP1Befq06iqapd//vYesRB+tO5oI9
         4ICsV4Nb1/ky+T0lAQv3/Xh65hHaxTtfa8eo4Uf6oQjn3F6nlHI5ZhdFiyDBQFID4quM
         SFtw==
X-Forwarded-Encrypted: i=1; AJvYcCWcz9iQBQcLWWHdcbcz0X6cNfv80iZIj/vfYclw4DGsKYBH/T6vbqF5T3C0/RbhVVpHKi4k45gT85lC4pGE@vger.kernel.org
X-Gm-Message-State: AOJu0YzBWINvXIpR+91xlXlk0bahFBP1O33kG/8nMU57oDxyso3XBtcd
	/MJXvVgbEGWqcAABzSt9euQaNSyF3wiBuLYstk4kfyfCeOvPTFLMV61jRHHioivzT7GQE9aEkQU
	NHNrYdZus3wSAswOpEqPfIIlY31+AeONJ+qRr
X-Gm-Gg: ASbGncsYhue5CesT4UCFFSrT4wq7ZgUCsU4riRzn5VbozDrdd0pNgKPnnnL/nACXV0z
	LmqNAWYTsQ4Z1csbBbhRBhRJRH9MB1o0F0Iagg8VhveKsDUvchxzSlGAGM12XWTXqdlsSfgEZbz
	MSoZSUU57IuN3t5YUdI8geZ/a+REuCpuPYnBTtMudj5V+DwPLPpXJgKCOl
X-Google-Smtp-Source: AGHT+IE1AefcJXIAWpDxPG3bUQ0bh6A+2grtsHhf+KAx7LnCFJqdzcBF4kLKgl+IZnDTHnXwKb1Ss9FhuZTqsrkbkRw=
X-Received: by 2002:a17:90b:2cc3:b0:2fa:4926:d18d with SMTP id
 98e67ed59e1d1-303789576damr11844174a91.13.1743070485612; Thu, 27 Mar 2025
 03:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-2-quic_wcheng@quicinc.com> <CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
 <2025032734-reward-fantasize-dc16@gregkh>
In-Reply-To: <2025032734-reward-fantasize-dc16@gregkh>
From: Puma Hsu <pumahsu@google.com>
Date: Thu, 27 Mar 2025 18:14:00 +0800
X-Gm-Features: AQ5f1JpamchKB-mbo8HzMPc07dJP4L7AYc2gJudLypuurcRTBQseSpaQIpAXpM8
Message-ID: <CAGCq0LamxvvE8b45VAshw9aWJNC2so_vK9t+pzXd3C7Y7tfYAg@mail.gmail.com>
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org, 
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org, 
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org, 
	lgirdwood@gmail.com, krzk+dt@kernel.org, pierre-louis.bossart@linux.intel.com, 
	Thinh.Nguyen@synopsys.com, tiwai@suse.com, robh@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 3:02=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Mar 27, 2025 at 02:27:00PM +0800, Puma Hsu wrote:
> > Hi,
> >
> > We have implemented and verified the USB audio offloading feature with
> > the xhci sideband driver on our Google Pixel products. We would
> > appreciate it if this solution can be accepted. Thank you all for the
> > work!
> >
>
> Great, can you properly send a "Tested-by:" line for this against the
> 00/XX email so that it will be properly saved?
>

We(Google Pixel) only use the xhci sideband related changes and two
changes in the sound card driver. For the details, what we actually
tested are patch [01], [02], [03], [04], [05], [06], [08], and [12].
Do I still send the "Tested-by:" line to 00/31 email? Or should I just
send the "Tested-by:" line to the 8 changes above? (I added
"Tested-by" line for this [01/31] first.)

> Also, I think a new version of the series is coming, can you test that
> to verify it works properly?  We have to wait until after -rc1 is out
> anyway.
>

I think this v36 is the last version of the series as I discussed with
QCOM Wesley. And for sure I will test it if they do have a new
version.

Thanks
Puma

