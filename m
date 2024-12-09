Return-Path: <linux-arm-msm+bounces-41155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AE59EA053
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 21:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7325166695
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 20:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACC7199239;
	Mon,  9 Dec 2024 20:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nSW7CS0Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2158F1531EF
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 20:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733776534; cv=none; b=WYr8sGwdwQKAmA5j2adksmKQZrNy3AA8n18yv8Gx125+QWpZw8sNrtIeYHvzjkNLf7UNLmFQG5jE7HFl4p0AITE6artEQ31JI2noOnqF7ij55HaYB3ruSqIsDLxW5hexAmD6JTv4u0m322d0/AnM3Jd/5xc+fcIFcuqk6LYzbog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733776534; c=relaxed/simple;
	bh=eAOEVYminb645n0faah7aMs6X15Nsaf5goPu8nyF+6o=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLMJiZSUcLDdGogICTRk+x6B3S8oJnBpcak+wxHAKL8t6UChivSkqf19ljCiV8kbZWb9ftn8vMqDi+G5GQCS5SfUw74rj3edr996ys7RzC5Ov+YssnSsSqXN6pb0YJjbtd82LrNzaDQgW89+2FB4Inhf0i87dCJmPHbTmCQCxtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nSW7CS0Y; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-300479ca5c6so21486611fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 12:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733776531; x=1734381331; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6meGJSR6TFEtc79fnopCaEDJRi1TmVlCHaOBF/ByVQ=;
        b=nSW7CS0YLqSETIKjSO0TQuMyRb4a2JXZG6qp6KZnaul74IY/yMUTYxvg2QjI0TUdit
         Vjs5/sha8gSR//YUOq/8Vjg2DmpbNvSVoiQH+vLudOIpSQeTdi1qUhFz+RtPuKhUNQd2
         gVrHhWuZpn7L5lo5h9nMvw+28f+idME3jeQrmYkEo7dBl6C5ofweg4l8ES/AjYSY8Ax4
         kACuERuNWPQN/OwbhOGVRwqjSjcmylsDh6kXNtxBywfNpZEtM9vdIHEe+9gAPg00ZJPp
         kKsuVBiK++vSr5MSiA+fOq32RsHOTYl69NKKF4i4io/aL/AvZYVDyfOIir7Dkubf+/UI
         BRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733776531; x=1734381331;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6meGJSR6TFEtc79fnopCaEDJRi1TmVlCHaOBF/ByVQ=;
        b=MPhdP02fh5TzB/4pv0gSTlUJ1ZNIfVxr6UkPDyEpHk++LqrvPqWTBWPEZpGyXDjUX7
         zI2u6nX80isBiiXa9yuM5RPyTAhiZJqy+qcwCcJUHoZZWATwlP+LtX/JA/UPG635y2/c
         Pd3+xClVmh/rCn4F1flPFCwvrULGf9+hMr9yyi0uTf25aLaPuz4ep+m26iietzgYB+ZD
         FWlfpZLt6HOVjS5ev+VcgbcXuoCUy9zbAqwfL6C4bEBzRJGVN6f5SFY54nGn9EvMm2KT
         OLm5MG1KEjZC9g06cFqgJzNNJvLxNwn+tElGJnceRb89M3uGxldnm24oiQNs3J9cxajh
         XwTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWreEEQvyuurlGxYX/OfhW+swE1VMhE+826ZRusdzVfe20vj7Uy6Zt6uxkyV4snHoQ0Mnp7FrcDNEpaY2qf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj9SKPweXDcS9eX61+o2OJkpvGrgKUhnffiQ7iug3TSxpp9mTj
	4jvlyAaq/0L6xCZNa7EGoXz8ZmjDTg7trUBvubxxmjOUAC4kQUbyjshtwadgHO7EsnIb1K7tvzs
	kARAu6DfSIFKgj+dpeLVl9a2LorecGlVkHJqqbQ==
X-Gm-Gg: ASbGncsB3Pmp9Ey3vV7fblfkdOv9BAmBvjVTLUHlVcWlBRYdzKbf7Biag5JglrzJ/r8
	SnpdJEvY6dYhvj8rn21lwqEnxbtEHJqdTwTPwSu7w70IKqenoNHgGdGLDYPnQ0b/BKd4=
X-Google-Smtp-Source: AGHT+IHymsOIaOPZPl6kBT694eWAVY0RGnB3iP+D+2pYOF4u/+ntIMZdJ1ab7zwXBPXlvQVIeOrk64ttwKY8rAoeyHg=
X-Received: by 2002:a05:651c:514:b0:2ff:caf8:3011 with SMTP id
 38308e7fff4ca-3022fb4e66amr5905541fa.11.1733776531008; Mon, 09 Dec 2024
 12:35:31 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Dec 2024 14:35:29 -0600
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20241209201516.GA1742@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209045530.507833-1-ebiggers@kernel.org> <CAMRc=MfLzuNjRqURpVwLzVTsdr8OmtK+NQZ6XU4hUsawKWTcqQ@mail.gmail.com>
 <20241209201516.GA1742@sol.localdomain>
Date: Mon, 9 Dec 2024 14:35:29 -0600
Message-ID: <CAMRc=Me7kEBHW1BTDkJ6w+3GjucCfC+GNZBch3kX=gsZniFHvA@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Support for hardware-wrapped inline encryption keys
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Gaurav Kashyap <quic_gaurkash@quicinc.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Jens Axboe <axboe@kernel.dk>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Dec 2024 21:15:16 +0100, Eric Biggers <ebiggers@kernel.org> said:
> On Mon, Dec 09, 2024 at 04:00:18PM +0100, Bartosz Golaszewski wrote:
>>
>> I haven't gotten to the bottom of this yet but the
>> FS_IOC_ADD_ENCRYPTION_KEY ioctl doesn't work due to the SCM call
>> returning EINVAL. Just FYI. I'm still figuring out what's wrong.
>>
>> Bart
>>
>
> Can you try the following?
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 180220d663f8b..36f3ddcb90207 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1330,11 +1330,11 @@ int qcom_scm_derive_sw_secret(const u8 *eph_key, size_t eph_key_size,
>  								  sw_secret_size,
>  								  GFP_KERNEL);
>  	if (!sw_secret_buf)
>  		return -ENOMEM;
>
> -	memcpy(eph_key_buf, eph_key_buf, eph_key_size);
> +	memcpy(eph_key_buf, eph_key, eph_key_size);
>  	desc.args[0] = qcom_tzmem_to_phys(eph_key_buf);
>  	desc.args[1] = eph_key_size;
>  	desc.args[2] = qcom_tzmem_to_phys(sw_secret_buf);
>  	desc.args[3] = sw_secret_size;
>
>

That's better, thanks. Now it's fscryptctl set_policy that fails like this:

ioctl(3, FS_IOC_SET_ENCRYPTION_POLICY, 0xffffcaf8bb20) = -1 EINVAL
(Invalid argument)

Bartosz

