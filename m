Return-Path: <linux-arm-msm+bounces-91861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGABGyhPhGkE2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:04:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6753EFB5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE93B3011F0D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 08:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652E128CF7C;
	Thu,  5 Feb 2026 08:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVm8G65I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16AF348445
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770278475; cv=pass; b=aNyIGH4KjBNGeAMvWQLatNdcYdklSqIBssOl/+LtdqQF7s9oSKRnJnon5AHS2DH1iIsF1saAEZF4vWzlCaOvhSm6Pm2wYq6kGeMAqBmA3btf/PBsqgWcftSURVi2BKIJXd7MZ+jUtt+HE1/VGybUSRZGONFlJyfQ5IRsNXtr/To=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770278475; c=relaxed/simple;
	bh=/AJ4U6gh3MKJZdKD8w/iOndk83/SnVdMyfBVZEqz9LY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fm8GgZ4bcbqByswx80LLt3KJRWbHUV1+jngBPRWi2pCXQHrcI/98R6l72teTg+l4Fz+ansvCdiaJD0/Q0MRQKVBema5MdKoe2rKPzhXn9EZtaEBSTEDnqXIHoG388zXXFkiaxjHDABYrSdDpJG38YDXQfjCS4BATeNjw92iTeAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVm8G65I; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-385d75e1a79so4821591fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 00:01:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770278473; cv=none;
        d=google.com; s=arc-20240605;
        b=CpiDB9IddCX6BlCYdpJzU6vjZPb9QpIEIoPZiGXVWfXc6YH04Aylk0RIPvcCtIHV7M
         dcTXVta0UyRxTe7vXSpJ8+/wt74GjdDqLIpx8Ulkj0myT0gYOGMJ23pEde7oV52lYG7x
         LsE0qUhDxzpCSCK/6KQo9Ni8EGfr4OFZvdTjOGKkhTvVkCoeDqN1FcB1nUYWS0JvLTBv
         seAAoF7NvZpiawzaXn1Wzhuy8YqLScTa67yZW7jGr2VIQHaTa6ZrdTdAF1G906NLAfQ9
         0T0DRDWo07JbR1LEASP36e7iNEtiaTxfwBDj/fe1uPhLpYmruM3CgaG+ruBEB2z4c6yK
         ycQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/IvY3ICgjtqApqS2PRfqr2QbryjB/lNh89R/p/mLxcA=;
        fh=0gYVoPQPNplYnfg3+IDc9fU80qwrjm3UY5XKe3eFuT0=;
        b=jKl4XD3loL7W5Jz4uVy202IJUCWX152p47IwnFItl5lpuL+MBu9SaXtb4hpmXTI7Jk
         Di875IC4EiimEt9RZ1nN+9zPUWOb+NWVBKcvez7eKIg8qqAvsxYxr4ydPi3r9a1SYqhY
         bebSDVWnsndXho9NTTLd9p5cc0hF9Zw43LBba+Zv7/hN+4zeOr1AJ44n5CyGjrKWgwqL
         rhmUU7FfXa03w3fTGuVt9EpO1GeEePVzjPLfTHvrkgCfotdRXqW22hrPDD537SUN95xN
         Io/kFvpkT0n8VLu14p8xtkIdc1oGUAQLTwn3OGmF78ckiDigPGu1FYA0oi/0P4JjFJAf
         VoKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770278473; x=1770883273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IvY3ICgjtqApqS2PRfqr2QbryjB/lNh89R/p/mLxcA=;
        b=XVm8G65IV4N/h39iNUNcEHZi4eUv1vcmb+Vk7hsGjfjBpjE5J+q+uWsxUwOtJJRCqn
         Y2YrshpiC2w5jbQdipnH00JD3LTIe4Vmwk9XWMWGqA+pYpXR7Qi/O9uS04dBLXPdCHEq
         sF9OkEOfzBlQa2twM1ack3RaaLqjq9XD5ODdqYDlJ96er6Ur7CyboMTPRRMXsByrMlqU
         E9Y89DY/80UD5lSx2suFOSa2ovsSGwRAPVOgL2ELH76S+SBBJiI8EMgmfDidBYpLWBq1
         PmSadkmXZRfJO0lZm+/r8hv0mP3aYYnCyIWC18mFNORKjBegpVkk8wGOCprl5gJUQbbI
         BL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770278473; x=1770883273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/IvY3ICgjtqApqS2PRfqr2QbryjB/lNh89R/p/mLxcA=;
        b=Le22WI0yRSMAVORXtCKsYf1xkAX4RipNuA0WRyf5AysZlLHkDHYPbvvPqSPYsumuaC
         uln0QhvbNEf0BSWuiJ/F6g/Mzqrl8mVhRh4OLYw5BHjlS2ioW5g5wcugP/Ncwp3wQajZ
         teiO9MnP2BVfRJjekS+3vInvsfWcwWaHCXz6Js0lbUZRCrTseKFwYl5aNbBzDCqpheoI
         XS+HkRkEWwSXnaazvC1WTHWN/wyFStRQ5I0hKi5s+lDse4f5VY40Q6ZGiiwgGclqleJ7
         HW1t25+H96rd48Ynms7ygSl5Cu6XDhD2qaP++3qzCC/rx8GC+8BHiYz9zdGgMuXTchx8
         Kh+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZsgWV2lOh2VHc07OJ8yx5QEhaMdXJZ63affbjVUQHfSANq3gD5OtQLq+BwKYCT3/u9LmkTH9RaBqIn0AZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzRsy3HAh3xiG7KK9XgRUuAKL/pojGZy9rcxplilAqOIFWyZiGy
	6hXA6l38v3E8XPvMEoG0ulRkeFqHQGCNgRqTjMQcWY5Ui4OSxsPYUJ4GF/2WeqZCnUCQLe6akFa
	1sTDiA7jsXm+YRj/mBDUmvy0PSIOyog8=
X-Gm-Gg: AZuq6aISJ/KYYtJBM+d+KQgNHzm3c29wM6wjJEvKZJahk5Ji6yDG4U4i0kpV8G6sky1
	wsf64FUreLLND5MYoKO/FcvrlSSoQKBMVOHekYWdIIcC3pWJ95THYOfjfBXOAwSanyQD0hPPCfE
	DvoZ43Eg7xJOdGz0OovlRwPpyapwGyw3a8WDv3b8wg+lIt8suYUp9fyQApoEWPjw3YxPW/guLCN
	9GZ+sV8p8y/mS5cWKQeF/8N1vrn8hKgD3mHWdj5WADxs7n1a8xS05BwZsnDgkLSZeHQ8hXSJn39
	SwWZV9CGONq6iovHLaHsKooTVF1fP6tv1Hu5aFhqZXURpDeDNVcJHN2lDCJjDu9+10U=
X-Received: by 2002:a05:651c:4185:b0:383:2102:981d with SMTP id
 38308e7fff4ca-38691e32939mr19109191fa.45.1770278472698; Thu, 05 Feb 2026
 00:01:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <8c64d188-9e14-43ae-8950-b31347f8eff8@linaro.org> <CACSVV02HKpEGQ6cAhNQ8a0YiT0nXHVD8=yXOfONz=1Amac+z2A@mail.gmail.com>
 <CALHNRZ-4oM9Kpx-umvdYaMXDwBtny5HHpe1PWzFcJ9=3m0s49A@mail.gmail.com>
 <4c2faa1d-504d-4642-90d7-8db21b99d7c1@oss.qualcomm.com> <CALHNRZ-HzFfgeScszdHb3CtAsm9rc9UBrbkiz7wgo+dVUZ4wWQ@mail.gmail.com>
In-Reply-To: <CALHNRZ-HzFfgeScszdHb3CtAsm9rc9UBrbkiz7wgo+dVUZ4wWQ@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 5 Feb 2026 02:01:01 -0600
X-Gm-Features: AZwV_QibdT7V7njgieuV2DAWgjI5E5MmK9z2L7-tZqnW-TKfAav3bVq7DipLj7Y
Message-ID: <CALHNRZ_=c0JZ4B779rCciP+_U+YMqEbby1F5RaeyUTZiNZdc2Q@mail.gmail.com>
Subject: Re: Questions About SM8550 Support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: rob.clark@oss.qualcomm.com, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91861-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,linaro.org:email]
X-Rspamd-Queue-Id: B6753EFB5B
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 8:35=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Thu, Jan 29, 2026 at 5:11=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualc=
omm.com> wrote:
> >
> > On 1/28/2026 11:24 PM, Aaron Kling wrote:
> > > On Wed, Jan 28, 2026 at 8:46=E2=80=AFAM Rob Clark <rob.clark@oss.qual=
comm.com> wrote:
> > >>
> > >> On Wed, Jan 28, 2026 at 12:54=E2=80=AFAM Neil Armstrong
> > >> <neil.armstrong@linaro.org> wrote:
> > >>>
> > >>> Hi,
> > >>>
> > >>> On 1/27/26 23:48, Aaron Kling wrote:
> > >>>> I am working on the AYN Odin 2 qcs8550 series of devices, specific=
ally
> > >>>> for Android, using mainline kernel drivers. I have come across som=
e
> > >>>> missing functionality and failures that I would like to inquire ab=
out.
> > >>>>
> > >>>> * ABL fails to load a dtbo using a baseline dtb unmodified from
> > >>>> mainline. Using changes described in the gunyah watchdog thread [0=
], a
> > >>>> dtbo loads and the devices boot as expected. If any of the changes=
 in
> > >>>> that post don't exist in the base dtb, abl will fail to load the d=
tbo
> > >>>> and go to the bootloader menu. This appears to be an issue in the
> > >>>> baseline abl code, affecting all devices of that generation. Would=
 it
> > >>>> be allowable to merge a change adding those changes to the sm8550
> > >>>> dtsi, allowing an unmodified mainline dtb to work with overlays?
> > >>>
> > >>> Any addition to the DT must be documented in dt-bindings, so if it'=
s needed
> > >>> for boot they should be documented and added for sure.
> > >>>
> > >>>>
> > >>>> * SM8550 does not have cpu opp tables, thus cpufreq does not work.=
 I
> > >>>> have locally copied the commits from sm8650 and adapted for sm8550=
,
> > >>>> and that seems to work okay. But no measuring of bandwidth was don=
e,
> > >>>> so the numbers are likely not entirely correct. Is there any plan =
to
> > >>>> generate correct tables for sm8550?
> > >>>
> > >>> Cpufreq works but not the interconnect scaling, so doing the same a=
s sm8650
> > >>> is fine but since the values were calculated from downstream DT tab=
les,
> > >>> the same should be done for sm8550.
> > >>>
> > >>>>
> > >>>> * As part of a series to support the original Odin 2, a patch to
> > >>>> update sm8550 EAS values was submitted [1]. But that series stalle=
d
> > >>>> and this was never merged. If this change is valid, which per that
> > >>>> discussion it appears to be, can it be resubmitted by itself and
> > >>>> merged?
> > >>>
> > >>> I missed this patch, please re-submit, I also need to update the on=
es
> > >>> for SM8650.
> > >>>
> > >>>>
> > >>>> * Per the mainline kernel device trees and audio topology provide =
by
> > >>>> the oem, these devices use primary i2s for the speakers path. Ther=
e
> > >>>> was a commit adding clock support for that as part of an hdmi seri=
es
> > >>>> [2], but that seems to have stalled. Is this going to be picked ba=
ck
> > >>>> up?
> > >>>
> > >>> No, I do not plan to do this work, it required adding callbacks in =
the
> > >>> code to handle the clocks like done for the pre-audioreach firmware=
s.
> > >>>
> > >>>>
> > >>>> * Inline crypto fails to detect hwkm support. And I see other logs
> > >>>> online, such as for the sm8550 qrd, that logs the same way my devi=
ce
> > >>>> does. I traced the issue to the check for wrapped key support [3].=
 On
> > >>>> my devices, the derive call is supported, but the other three call=
s
> > >>>> are not. I was pointed at the downstream headers for sm8550 suppor=
t
> > >>>> and only derive is listed there, the other three don't appear to b=
e
> > >>>> used in the downstream driver. Is this expected? And if so, will t=
his
> > >>>> case be added to the mainline drivers?
> > >>>
> > >>> Does hwkm work with you remove the last 3 calls ?
> > >>>
> > >>>>
> > >>>> * Some gpu related clocks complain about being stuck off during bo=
ot,
> > >>>> causing stack traces, but the gpu does work. I tried to do some
> > >>>> research into this, but quickly got lost in the weeds and I have n=
o
> > >>>> idea where to even look.
> > >>>> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
> > >>>> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
> > >>>> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
> > >>>> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
> > >>>
> > >>> This may be related with the display handoff from ABL, did you add =
the
> > >>> plat region to the reserved memories ?
> > >>>
> > >>>>
> > >>>> * Sometimes when starting rendering, a bandwidth submission times =
out,
> > >>>> then the driver immediately complains that said id was left on the
> > >>>> queue. I have tried increasing the timeout, but the same sequence
> > >>>> still happens. Timeout happens, immediately followed by a matching
> > >>>> unexpected response. Implying that this isn't actually a delay /
> > >>>> timeout issue.
> > >>>> [ 1848.517020] platform 3d6a000.gmu:
> > >>>> [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message
> > >>>> HFI_H2F_MSG_GX_BW_PERF_VOTE id 1015 timed out waiting for response
> > >>>> [ 1848.518020] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg [msm]]
> > >>>> *ERROR* Unexpected message id 1015 on the response queue
> > >>>
> > >>> Weird the timeout was extended for this very purpose
> > >>>
> > >>>>
> > >>>> * Some 3dmark benchmarks such as solar bay cause a gpu crash. I am
> > >>>> unsure if this is a kernel problem or userspace, so I'm submitting
> > >>>> here first. If the consensus is that it's a userspace issue, I'll
> > >>>> submit it to mesa.
> > >>>> [ 1860.112008] adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gp=
u
> > >>>> fault ring 2 fence a261 status 00EF0585 rb 06df/090f ib1
> > >>>> 00000001512E9000/003d ib2 00000001512E7000/0000
> > >>>> [ 1860.113122] msm_dpu ae01000.display-controller: [drm:recover_wo=
rker
> > >>>> [msm]] *ERROR* 67.5.10.1: hangcheck recover!
> > >>>> [ 1860.113238] msm_dpu ae01000.display-controller: [drm:recover_wo=
rker
> > >>>> [msm]] *ERROR* 67.5.10.1: offending task: Thread-23
> > >>>> (com.futuremark.dmandroid.application)
> > >>>> [ 1860.258126] revision: 0 (67.5.10.1)
> > >>>> [ 1860.258132] rb 0: fence:    2884/2884
> > >>>> [ 1860.258133] rptr:     36
> > >>>> [ 1860.258134] rb wptr:  36
> > >>>> [ 1860.258135] rb 1: fence:    -256/-256
> > >>>> [ 1860.258138] rptr:     0
> > >>>> [ 1860.258138] rb wptr:  0
> > >>>> [ 1860.258139] rb 2: fence:    41563/41569
> > >>>> [ 1860.258140] rptr:     1752
> > >>>> [ 1860.258140] rb wptr:  2319
> > >>>> [ 1860.258141] rb 3: fence:    -256/-256
> > >>>> [ 1860.258141] rptr:     0
> > >>>> [ 1860.258142] rb wptr:  0
> > >>>> [ 1860.258146] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCR=
ATCH_REG0: 0
> > >>>> [ 1860.258220] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCR=
ATCH_REG1: 0
> > >>>> [ 1860.258266] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > >>>> CP_SCRATCH_REG2: 41562
> > >>>> [ 1860.258310] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCR=
ATCH_REG3: 0
> > >>>> [ 1860.258354] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > >>>> CP_SCRATCH_REG4: 3736059565
> > >>>> [ 1860.258399] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > >>>> CP_SCRATCH_REG5: 3736059565
> > >>>> [ 1860.258443] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > >>>> CP_SCRATCH_REG6: 3736059565
> > >>>> [ 1860.258487] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > >>>> CP_SCRATCH_REG7: 3736059565
> > >>>
> > >>> @rob do you have any idea how to solve this crash on a740 ?
> > >>
> > >> The clk and a6xx_hfi_wait_for_msg_interrupt errors indicate that
> > >> something is unhappy about gpu pm.  I'd focus on that first, since
> > >> that is almost certainly the cause of the later issues.  If things
> > >> _sorta_ work (rendering UI, etc) you could try removing all but the
> > >> lowest gpu OPP as an experiment.  Could be that power related proble=
ms
> > >> surface when the GPU ramps up to higher OPPs.
> > >
> > > Things work amazingly well compared to what I was expecting. Using
> > > mesa staging 26.0 as of yesterday, I'm getting roughly 80% performanc=
e
> > > in the benchmarks that do run, compared to the stock Android. And
> > > rendering is correct everywhere that I've seen so far. Mesa 25.3.3
> > > gives about 89% compared to stock, but there are graphical glitches i=
n
> > > some of the benchmarks.
> > >
> > > I set gpu max_freq via devfreq to the minimum available frequency and
> > > ran the failing benchmark again. It completed once, but failed with a
> > > similar stack trace on the second run. And per sysfs, the gpu did sta=
y
> > > at that minimum. Of note, that causes the benchmark to fail, but
> > > rendering does recover and the unit is still usable afterwards.
> >
> > In sm8550.dtsi, I see that ACD values are not specified in the GPU OPP
> > table. Can we add those (from downstream dt) and try again?
>
> I don't know what I'm looking for in the downstream dt. But if such a
> change gets pushed to lkml, I can grab that and verify.

I took at look at the downstream dt and took a guess at importing the
acd values. I'm not sure if the gpu here is the baseline kalama or
kalama v2. I guessed the former. There were a couple values missing
however, that I had to extrapolate based on other frequencies. This
however changed nothing about my test results. Still getting crashes.

From my perspective, this part does not appear to be a PM or frequency
related issue. Some of the 3dmark benchmarks I have never seen crash.
Like Wild Life Extreme. I can run the stress variant of that and it
beats the unit for 20 minutes at full clocks with a screaming fan and
that runs perfectly stable. Solar Bay Extreme also runs completely
stable in all of its glorious 3 fps. The two problems are the standard
non-extreme Solar Bay and Steel Nomad Light. Both of these
intermittently crash with similar traces to what I posted before.
There doesn't seem to be consistency in the faults, sometimes it will
be almost immediately after starting the benchmark, other times it
will get 90% through and then fail. But they virtually always fail to
complete. For another point of data, I have never seen GravityMark
cause a fault either.

Aaron

