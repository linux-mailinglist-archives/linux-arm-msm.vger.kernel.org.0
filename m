Return-Path: <linux-arm-msm+bounces-96780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAzRFq2TsGkukgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 22:57:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B41C2588DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 22:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 267F7312B058
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4B93EF649;
	Tue, 10 Mar 2026 21:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwpxuhdE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC22B3EB80B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 21:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179611; cv=pass; b=WyPx/k2NUAi8M41mgyMy6y58KmEBd7jGPv5FkUQ0swoXVRZDQVEyaqtdP1ATlOls/paCXUT+C2Cnx+ax8+UhtqkepIe47FjclvKoD+xNMMlJ+Gg98vNN6odCT6CnjZVypx59i+rLwpiYPPd0kB/r8ISYsuyxYTHFNG5WoeqFuSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179611; c=relaxed/simple;
	bh=qdKJuLAYGsoLeasi3VhgWCx5OL9g7Y4E0GrLw+oxmh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rTVx3YG0L8yPNjJX+AAy588ui0oFOu/sMGaxF899sCQXVokdLBSrRBuEcnsXXjtNVU1mDzoNhq4wjMP9tRm43NN8vYg8fp5KikG2RYXXvmtIGf2o53PGmek7wBvfscrU1NGI6JV/66W9jIypaam9LIrc5NJFpO6M54gF/rvsotw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwpxuhdE; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38704f70ea3so180129871fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773179607; cv=none;
        d=google.com; s=arc-20240605;
        b=TN5lfoHRPkS4v27+gzk3Wb9S4XmvA6tZY09VWBJYPIxAJDzC++KsZCrw+70XZjsjis
         T+Dp/aFEj9e5tKoE+OgKL6yBoeLexWTnkZWdjBgHn1LuLEF3JTbKx4bbbOKDjD0j1oSO
         RqEnXgOaaXNBqODoS+9U3ROqBg2fYhShtXZFnPYex5XheSTIpWsaQ9tM9OhwRi8Q2mfH
         slPadKZ5p3BFVA+LZ90Jd5sM/A/zgy6dShvmZK6Qi225ht16NSue7iTBPiCop0iJ59ui
         WkqTxPtx5JJJWKGe+bcIgKKjutGlNeUaqpesrng97gRVGIMyJWQXRx6xpBbbBvXsd1aJ
         fgVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gw27JI7CmTIjnj6R6PFYP+P17fBFEaLvBYR6OvYy/OA=;
        fh=7Y6qSo/DgNUt07rmSd1bhXmqr78rnv7fkYl9a+AVsA4=;
        b=dCnSYU9IhMhG0vzCR//5Vl8EbYF8tNDzmeoVZeGVh+ulaMs4t1gDIcMMbR8lyzqTFD
         50jY5rwiz0I501KglAWtFLBP4CHwxpVMd0ae07GnjR/qG3sJcvlRuAdHj4HL8ebbmR+y
         PwQJfx3VtgJtRLq1lFAzJ6fVZ5+vWJJ9Ny5ETeaecOjqMvRXVHfMzDxUQ75XoxzIEOIe
         /nsIgiI1bcXSDT/LY7jIoCB5oscyDukkCX2LkV7iLet14TZM2yIp5MqaE6SUMzUDVyE7
         qQu38NVgmQKGA9ATfLkbPdz0yHICeGmSemi5G9GUI42ej0SVTzVqgf8dTY0DMr7ZQIZJ
         a5ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773179607; x=1773784407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gw27JI7CmTIjnj6R6PFYP+P17fBFEaLvBYR6OvYy/OA=;
        b=SwpxuhdEgFMp5m18DU3XS0yaHKO1jLnJpd7jkp9WYQwaSIj1LtrACFunLYPCqr2Zv+
         GL3pDMIKyy5QRUZeTuzjvGSvYgaG/EJilR5pHWkOXUNi3uvhiqQVi5ZyQ81Ug1375wWv
         uqhadC3skHvoZ/LO7/7HtQbdXGHZr6OEJ/5BsxgdAqW8WEmyPFmjCLpcoETU+r0jVWk3
         R1eAc45+CBhg6xoOOz7maJddio7df7iOE+pWPb5/jDIYVoQZxwTvlFOev7ndTyPJkibL
         t4Jk+6yArK3zxDKv0evHHGMf9gK1PFcTXyi38yfjWpu6tQckZ/33SJVFb6H03FRikUTg
         vP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773179607; x=1773784407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gw27JI7CmTIjnj6R6PFYP+P17fBFEaLvBYR6OvYy/OA=;
        b=WMttCCFl9sg/3Cb0HkSUA9kW41seM3/3R1bTYnkz7moH41i8nnwgqWluInsSbXlkvR
         MbAS4KSLqQF3YVI01BNP5foZ2Rbdcs+X3WVJXFR6dstH9lfT7xidy2Ob8GEGemr09W7h
         z+lDVvk56wWGal5MLTgJYUx1AbIHB8C+tVJI/iuVqhyUapctigzorGCwgHUfeZHcUSTH
         VwQuEp5IkPKeZ7YtyCv/BtV0ozJdtxrZ/wSi0go58r2Q0OhxdC6zx5WEUdJhCTdy8whC
         GcqiXrMhFbiikACW4+X/18tm7Uk5lm285voVQXSgqZE/U5CMJJTc6LbdOZvHp9ZtZ73e
         X6gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCw4bXx3PV0qg0HuBFkfzVIBlL3EqS1TYsRcL+9TYx56VKOxzT/1P6ne3nXfA8misbl9xQ6PN0g7I8jRyE@vger.kernel.org
X-Gm-Message-State: AOJu0YwQUal/7GnE8+7lc5L81qmV3xMwGZqdhVjMXuSv0aghDBmnabIV
	zy7VSpaGkxc9AHFPndIp/DWfoMEAzDjDZcsGATzRdDJ24umI1UK+Xo5vqkvp5zF7EPMz1AcYAX1
	93iqN9bu1HYLqD5YVO63f3WqfaGVpW3UPvu/ZCFs=
X-Gm-Gg: ATEYQzz82pAoyoXt9BR4JAuZ2lbxp5WynqQ833Oyr1m2O3HA1/hwxsiQAhPSwRqvffv
	x7UB1H207ca/mROB6LjTQfpuj7gdLCicPCiic7o4mvyJwQFIm3CLTerNIQkf5Qo5BMuq5BkxdJG
	AcpRP7SybVyWaHOjL5TkwA4W6z6SRDRjDh/BOvMP22BH6XvVpNOLC9keouWjlcHzNpyAi67yu3l
	43MKYn6UjoOonxeRy3PKeIg3luTgbPq5DRvQi/RXdIf80TaMptiUFMzXyuI5MSTljm/yKarJQYb
	L3d7fazKg50S5nYJ6J9x8ixjQMdId17mVnq1UKkVRBarb5aWE1fC1yWDkx/F7JvS1YOy
X-Received: by 2002:a2e:a54c:0:b0:38a:4a27:1b5d with SMTP id
 38308e7fff4ca-38a67e1b356mr926341fa.18.1773179606507; Tue, 10 Mar 2026
 14:53:26 -0700 (PDT)
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
 <CALHNRZ_=c0JZ4B779rCciP+_U+YMqEbby1F5RaeyUTZiNZdc2Q@mail.gmail.com>
 <593afb89-031d-4376-8ea7-024b645c62cb@oss.qualcomm.com> <CALHNRZ-FjMiS7ADWmBeY2gAQhswi15Uc1qCM6xP5FDeSbgD9_Q@mail.gmail.com>
 <b2c3c56d-5b30-4201-bd16-924bf674c9d7@oss.qualcomm.com>
In-Reply-To: <b2c3c56d-5b30-4201-bd16-924bf674c9d7@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 10 Mar 2026 16:53:15 -0500
X-Gm-Features: AaiRm50CEy5Cg9Fj9WFl6PgPPwNUDL7A7zRybStWkfBOvKaesBtHUw4PHrELrdM
Message-ID: <CALHNRZ-Uc9HEHc_8wJ3SAKxHX+cE0Gu7_BeakvF5muCmS9wmhg@mail.gmail.com>
Subject: Re: Questions About SM8550 Support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: rob.clark@oss.qualcomm.com, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9B41C2588DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96780-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,qualcomm.com:email,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 4:33=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 2/5/2026 11:10 PM, Aaron Kling wrote:
> > On Thu, Feb 5, 2026 at 7:29=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qual=
comm.com> wrote:
> >>
> >> On 2/5/2026 1:31 PM, Aaron Kling wrote:
> >>> On Thu, Jan 29, 2026 at 8:35=E2=80=AFPM Aaron Kling <webgeek1234@gmai=
l.com> wrote:
> >>>>
> >>>> On Thu, Jan 29, 2026 at 5:11=E2=80=AFPM Akhil P Oommen <akhilpo@oss.=
qualcomm.com> wrote:
> >>>>>
> >>>>> On 1/28/2026 11:24 PM, Aaron Kling wrote:
> >>>>>> On Wed, Jan 28, 2026 at 8:46=E2=80=AFAM Rob Clark <rob.clark@oss.q=
ualcomm.com> wrote:
> >>>>>>>
> >>>>>>> On Wed, Jan 28, 2026 at 12:54=E2=80=AFAM Neil Armstrong
> >>>>>>> <neil.armstrong@linaro.org> wrote:
> >>>>>>>>
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> On 1/27/26 23:48, Aaron Kling wrote:
> >>>>>>>>> I am working on the AYN Odin 2 qcs8550 series of devices, speci=
fically
> >>>>>>>>> for Android, using mainline kernel drivers. I have come across =
some
> >>>>>>>>> missing functionality and failures that I would like to inquire=
 about.
> >>>>>>>>>
> >>>>>>>>> * ABL fails to load a dtbo using a baseline dtb unmodified from
> >>>>>>>>> mainline. Using changes described in the gunyah watchdog thread=
 [0], a
> >>>>>>>>> dtbo loads and the devices boot as expected. If any of the chan=
ges in
> >>>>>>>>> that post don't exist in the base dtb, abl will fail to load th=
e dtbo
> >>>>>>>>> and go to the bootloader menu. This appears to be an issue in t=
he
> >>>>>>>>> baseline abl code, affecting all devices of that generation. Wo=
uld it
> >>>>>>>>> be allowable to merge a change adding those changes to the sm85=
50
> >>>>>>>>> dtsi, allowing an unmodified mainline dtb to work with overlays=
?
> >>>>>>>>
> >>>>>>>> Any addition to the DT must be documented in dt-bindings, so if =
it's needed
> >>>>>>>> for boot they should be documented and added for sure.
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> * SM8550 does not have cpu opp tables, thus cpufreq does not wo=
rk. I
> >>>>>>>>> have locally copied the commits from sm8650 and adapted for sm8=
550,
> >>>>>>>>> and that seems to work okay. But no measuring of bandwidth was =
done,
> >>>>>>>>> so the numbers are likely not entirely correct. Is there any pl=
an to
> >>>>>>>>> generate correct tables for sm8550?
> >>>>>>>>
> >>>>>>>> Cpufreq works but not the interconnect scaling, so doing the sam=
e as sm8650
> >>>>>>>> is fine but since the values were calculated from downstream DT =
tables,
> >>>>>>>> the same should be done for sm8550.
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> * As part of a series to support the original Odin 2, a patch t=
o
> >>>>>>>>> update sm8550 EAS values was submitted [1]. But that series sta=
lled
> >>>>>>>>> and this was never merged. If this change is valid, which per t=
hat
> >>>>>>>>> discussion it appears to be, can it be resubmitted by itself an=
d
> >>>>>>>>> merged?
> >>>>>>>>
> >>>>>>>> I missed this patch, please re-submit, I also need to update the=
 ones
> >>>>>>>> for SM8650.
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> * Per the mainline kernel device trees and audio topology provi=
de by
> >>>>>>>>> the oem, these devices use primary i2s for the speakers path. T=
here
> >>>>>>>>> was a commit adding clock support for that as part of an hdmi s=
eries
> >>>>>>>>> [2], but that seems to have stalled. Is this going to be picked=
 back
> >>>>>>>>> up?
> >>>>>>>>
> >>>>>>>> No, I do not plan to do this work, it required adding callbacks =
in the
> >>>>>>>> code to handle the clocks like done for the pre-audioreach firmw=
ares.
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> * Inline crypto fails to detect hwkm support. And I see other l=
ogs
> >>>>>>>>> online, such as for the sm8550 qrd, that logs the same way my d=
evice
> >>>>>>>>> does. I traced the issue to the check for wrapped key support [=
3]. On
> >>>>>>>>> my devices, the derive call is supported, but the other three c=
alls
> >>>>>>>>> are not. I was pointed at the downstream headers for sm8550 sup=
port
> >>>>>>>>> and only derive is listed there, the other three don't appear t=
o be
> >>>>>>>>> used in the downstream driver. Is this expected? And if so, wil=
l this
> >>>>>>>>> case be added to the mainline drivers?
> >>>>>>>>
> >>>>>>>> Does hwkm work with you remove the last 3 calls ?
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> * Some gpu related clocks complain about being stuck off during=
 boot,
> >>>>>>>>> causing stack traces, but the gpu does work. I tried to do some
> >>>>>>>>> research into this, but quickly got lost in the weeds and I hav=
e no
> >>>>>>>>> idea where to even look.
> >>>>>>>>> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
> >>>>>>>>> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
> >>>>>>>>> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
> >>>>>>>>> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
> >>>>>>>>
> >>>>>>>> This may be related with the display handoff from ABL, did you a=
dd the
> >>>>>>>> plat region to the reserved memories ?
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> * Sometimes when starting rendering, a bandwidth submission tim=
es out,
> >>>>>>>>> then the driver immediately complains that said id was left on =
the
> >>>>>>>>> queue. I have tried increasing the timeout, but the same sequen=
ce
> >>>>>>>>> still happens. Timeout happens, immediately followed by a match=
ing
> >>>>>>>>> unexpected response. Implying that this isn't actually a delay =
/
> >>>>>>>>> timeout issue.
> >>>>>>>>> [ 1848.517020] platform 3d6a000.gmu:
> >>>>>>>>> [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message
> >>>>>>>>> HFI_H2F_MSG_GX_BW_PERF_VOTE id 1015 timed out waiting for respo=
nse
> >>>>>>>>> [ 1848.518020] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg [ms=
m]]
> >>>>>>>>> *ERROR* Unexpected message id 1015 on the response queue
> >>>>>>>>
> >>>>>>>> Weird the timeout was extended for this very purpose
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> * Some 3dmark benchmarks such as solar bay cause a gpu crash. I=
 am
> >>>>>>>>> unsure if this is a kernel problem or userspace, so I'm submitt=
ing
> >>>>>>>>> here first. If the consensus is that it's a userspace issue, I'=
ll
> >>>>>>>>> submit it to mesa.
> >>>>>>>>> [ 1860.112008] adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR*=
 gpu
> >>>>>>>>> fault ring 2 fence a261 status 00EF0585 rb 06df/090f ib1
> >>>>>>>>> 00000001512E9000/003d ib2 00000001512E7000/0000
> >>>>>>>>> [ 1860.113122] msm_dpu ae01000.display-controller: [drm:recover=
_worker
> >>>>>>>>> [msm]] *ERROR* 67.5.10.1: hangcheck recover!
> >>>>>>>>> [ 1860.113238] msm_dpu ae01000.display-controller: [drm:recover=
_worker
> >>>>>>>>> [msm]] *ERROR* 67.5.10.1: offending task: Thread-23
> >>>>>>>>> (com.futuremark.dmandroid.application)
> >>>>>>>>> [ 1860.258126] revision: 0 (67.5.10.1)
> >>>>>>>>> [ 1860.258132] rb 0: fence:    2884/2884
> >>>>>>>>> [ 1860.258133] rptr:     36
> >>>>>>>>> [ 1860.258134] rb wptr:  36
> >>>>>>>>> [ 1860.258135] rb 1: fence:    -256/-256
> >>>>>>>>> [ 1860.258138] rptr:     0
> >>>>>>>>> [ 1860.258138] rb wptr:  0
> >>>>>>>>> [ 1860.258139] rb 2: fence:    41563/41569
> >>>>>>>>> [ 1860.258140] rptr:     1752
> >>>>>>>>> [ 1860.258140] rb wptr:  2319
> >>>>>>>>> [ 1860.258141] rb 3: fence:    -256/-256
> >>>>>>>>> [ 1860.258141] rptr:     0
> >>>>>>>>> [ 1860.258142] rb wptr:  0
> >>>>>>>>> [ 1860.258146] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_=
SCRATCH_REG0: 0
> >>>>>>>>> [ 1860.258220] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_=
SCRATCH_REG1: 0
> >>>>>>>>> [ 1860.258266] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>>>>>>> CP_SCRATCH_REG2: 41562
> >>>>>>>>> [ 1860.258310] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_=
SCRATCH_REG3: 0
> >>>>>>>>> [ 1860.258354] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>>>>>>> CP_SCRATCH_REG4: 3736059565
> >>>>>>>>> [ 1860.258399] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>>>>>>> CP_SCRATCH_REG5: 3736059565
> >>>>>>>>> [ 1860.258443] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>>>>>>> CP_SCRATCH_REG6: 3736059565
> >>>>>>>>> [ 1860.258487] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>>>>>>> CP_SCRATCH_REG7: 3736059565
> >>>>>>>>
> >>>>>>>> @rob do you have any idea how to solve this crash on a740 ?
> >>>>>>>
> >>>>>>> The clk and a6xx_hfi_wait_for_msg_interrupt errors indicate that
> >>>>>>> something is unhappy about gpu pm.  I'd focus on that first, sinc=
e
> >>>>>>> that is almost certainly the cause of the later issues.  If thing=
s
> >>>>>>> _sorta_ work (rendering UI, etc) you could try removing all but t=
he
> >>>>>>> lowest gpu OPP as an experiment.  Could be that power related pro=
blems
> >>>>>>> surface when the GPU ramps up to higher OPPs.
> >>>>>>
> >>>>>> Things work amazingly well compared to what I was expecting. Using
> >>>>>> mesa staging 26.0 as of yesterday, I'm getting roughly 80% perform=
ance
> >>>>>> in the benchmarks that do run, compared to the stock Android. And
> >>>>>> rendering is correct everywhere that I've seen so far. Mesa 25.3.3
> >>>>>> gives about 89% compared to stock, but there are graphical glitche=
s in
> >>>>>> some of the benchmarks.
> >>>>>>
> >>>>>> I set gpu max_freq via devfreq to the minimum available frequency =
and
> >>>>>> ran the failing benchmark again. It completed once, but failed wit=
h a
> >>>>>> similar stack trace on the second run. And per sysfs, the gpu did =
stay
> >>>>>> at that minimum. Of note, that causes the benchmark to fail, but
> >>>>>> rendering does recover and the unit is still usable afterwards.
> >>>>>
> >>>>> In sm8550.dtsi, I see that ACD values are not specified in the GPU =
OPP
> >>>>> table. Can we add those (from downstream dt) and try again?
> >>>>
> >>>> I don't know what I'm looking for in the downstream dt. But if such =
a
> >>>> change gets pushed to lkml, I can grab that and verify.
> >>>
> >>> I took at look at the downstream dt and took a guess at importing the
> >>> acd values. I'm not sure if the gpu here is the baseline kalama or
> >>> kalama v2. I guessed the former. There were a couple values missing
> >>> however, that I had to extrapolate based on other frequencies. This
> >>> however changed nothing about my test results. Still getting crashes.
> >>
> >> Please use the values from kalama v2 dtsi. And if the acd property is
> >> missing in any OPP node, that is a hint to the the driver+gmu-fw that
> >> ACD should be kept disabled for that freq corner. So, please follow th=
e
> >> same.
> >
> > Alright, I updated the change using values from the downstream v2
> > dtsi. Still getting the same results. Since it's needed regardless,
> > would you like me to submit the ACD patch?
>
> Sorry for the super delayed response.
>
> Please go ahead and post the patch.

I sent it here [0].

> >
> >> ACD configurations are required to meet the hw specifications. We can'=
t
> >> predict how the hw fails in case of a spec violation. I don't know if
> >> this issue is ACD related, but we should ensure that all power related
> >> configurations are accurate first.
> >>
> >> Also, could you please try the latest firmwares (sqe and gmu) from her=
e:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmwar=
e.git/commit/qcom?id=3D30979b116b5c5857b72c4332db8db0ff1ca2dc08
> >
> > These are what I'm already using.
> >
> >>>
> >>> From my perspective, this part does not appear to be a PM or frequenc=
y
> >>> related issue. Some of the 3dmark benchmarks I have never seen crash.
> >>> Like Wild Life Extreme. I can run the stress variant of that and it
> >>> beats the unit for 20 minutes at full clocks with a screaming fan and=
>
> >> that runs perfectly stable. Solar Bay Extreme also runs completely
> >>> stable in all of its glorious 3 fps. The two problems are the standar=
d
> >>> non-extreme Solar Bay and Steel Nomad Light. Both of these
> >>> intermittently crash with similar traces to what I posted before.
> >>> There doesn't seem to be consistency in the faults, sometimes it will
> >>> be almost immediately after starting the benchmark, other times it
> >>> will get 90% through and then fail. But they virtually always fail to
> >>> complete. For another point of data, I have never seen GravityMark
> >>> cause a fault either.
> >>
> >> The peak current draw can vary between benchmarks. So we can't rule ou=
t
> >> power issues. And are you able to reproduce the same issue on another
> >> device?
> >
> > The only relevant devices I have are two of the AYN qcs8550 devices, a
> > Thor and an Odin 2 Mini. The issue happens on both, yes. But I don't
> > have anything like a phone or devkit with sm8550.
>
> I will post a few fixes in the next few days. At least, with that there
> should be a coredump generated for hfi errors. Please share that.

I posted an issue on the mesa tracker here [1] and attached some
devcoredumps to one of my replies. I can add more when the new patches
are available.

> iirc, you are using upstream drivers with downstream kernel (ACK?). Any
> chance you can try pure upstream kernel?

Yes, that is correct. My current setup is ACK 6.18.13. I unfortunately
do not have a pure Linux setup. If I had uart access on these devices,
I could use the minimal busybox setup like I do for tegra, but I do
not have such access here. As far as I can tell, no closed case debug
setup is available either. Google does have a mainline tracking branch
which I could use to get closer to -next for verification, but it's
still not unmodified upstream.

Aaron

[0] https://lore.kernel.org/linux-arm-msm/20260207-sm8550-acd-v1-1-53d084c5=
8c9a@gmail.com/
[1] https://gitlab.freedesktop.org/mesa/mesa/-/issues/14919

