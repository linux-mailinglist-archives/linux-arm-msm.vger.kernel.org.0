Return-Path: <linux-arm-msm+bounces-91962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IAzEXPXhGlo5gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:46:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1132F622D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9EDB3024A73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 17:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F31E2F362D;
	Thu,  5 Feb 2026 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQNExgLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1832EC561
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 17:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770313261; cv=pass; b=YGZ8kj9i7d8sTkVz2NehOZw5VF/7tsiM13zoKKAkfdswNQll0XUtFSh4OEnNkuWqtWyUIv7MByiP8mITzRocDREhUE/7E5n2fIR/GTbIubUAZDL3Qly4xxJu2oar267oMg8WgkB38UQbd7y78ehDiHLtfOgzYrYBuPS2RRjZng4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770313261; c=relaxed/simple;
	bh=MN3kNzzba5n6eScfOs7qCzw60H8v8G3fxgTYXa2Tx0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBecFBCEITk4B/fzeGsTueiUR4TbdKbUIpbBlRM3NgX0Py1i4UjsdiuNyxH03HilIUTb5bmzVT9vfpNVI/+H+p6vKkBJu91HW4q+eV3ZdV0BxT7AKEjndqlh4EJEyQrDYOA6P2SgETlhF91un9RDGfTssR9oBTx4rejNfu6daBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQNExgLa; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-385bc6910eeso9991351fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:41:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770313259; cv=none;
        d=google.com; s=arc-20240605;
        b=NGtXq7mrQjlh6LxIR/iu14TPEuVHb4J8J1+aivKeKYlNBcvGB8KLlX5MFfBKhCVmyZ
         ehKfMiiL5fz8uE6r1+72Hx0LxvhTvhK5BJ6a28XfR2Y+/C5sk6qOVhdMTggWVZ+Ptla+
         zO5RoO+VzItFQm2YMzOdMm2pyc3v3Gti/aGLLl4iPiFqjBmB1jDnUsdQNfzGi60SRunB
         /4geDYgKmVfZayeEJKTvNxEs9aIHRsxmEEydQaCgvRGwBl0kgbaPPUiwQRPVb9WrROXz
         cH9zk6GD01jhbzwi5+MqBHuYyLFTvEndLYPimuMIgMM17+/9Ex4PjobqqJ+OIPnqZnq+
         ONFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9OwiKvAH/e32GMm1L8CMIz3BlXbgu/K6SMZdtur5t2I=;
        fh=3T1bzL9y7jnfDXQd41kEdgI9dbum3wrO3V4PGqy0vPs=;
        b=PbJFiDzcbLKtIh/WT2w7to1/VrXDyf6Howg6UYUhebKEQ3OgjAqNS+yXidv8lVzHwf
         TOOgF7VL17f5ZzkaMfFyzyVA1H7dgk+9stk3JU135PLTpXSgDs9JU6DeraEblr+429k2
         F2JST0M7WqhWQoWC4WWnr8R5NOxtztIal0o/i50K7n7G/bbeQqUX62KeeE29ErWlAX+p
         Eq9nplBZEuwwqcvm6RFb6nwPJ18DWyfmzmBqn7OP4Y/Mtn6wrwz8/lkAHngSUVBaZ/dm
         k4mSmgIZRvwmwKq7R8lLz8xSwGTFno6lwlXR7QCN2sYnRrGOwdu/MlJ1BqTQ7SpHR6CO
         kx/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770313259; x=1770918059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OwiKvAH/e32GMm1L8CMIz3BlXbgu/K6SMZdtur5t2I=;
        b=XQNExgLaZBqDknZXgxc7ODG5l2y0R1LKixaP3j1jvDQGj0sbBBOycsKPsMAcS/82WK
         NCMk8Q1DSSwJHiB3MmNUczzFkmfEpVHTsozLDCd/3Y6/42ma6jCQDHYrhIKf9yV6o8xJ
         0ihdGiU4K631ppSp4hAaQlLVcuJJIxyPE4lLiGXnidGajwSo2cNl8g2oyVa9XqwVbU7Q
         mqIp7wjlHlECE1lUfKjkXIskUfKi8A/C5hwsXsMypY2aCtp3QkfIjgv2js3EAMnxbXja
         4HaeUR1inziZmx/KpXgTLcBS4BLv9kBGyPP1vHfi/koChf1qMFFRyE7DPPnHje8u8fJ2
         XITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770313259; x=1770918059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9OwiKvAH/e32GMm1L8CMIz3BlXbgu/K6SMZdtur5t2I=;
        b=Q7Mrg4G/a8GnKJExFfaJ85YFSouOWYpeXziGqhk6Dd9MrJkVP12EOWlQd0u9Tq6txF
         Y6zOgYoAlqbbE3V7Bco0hcLvU/bY7U1t3cedfBWIThSr1wN4PVLjcLcSSviaMTzX7SqH
         izNUQ/XPIevCm4wHHV1gJhtbwPPm1I4qRvNvxnqtsqVf5IlT16B5Gykjnmh1eFV5tGAC
         XreYgMBiaqQYJc5mL9soTpoRVRDNSL0S3QbLLZaXnvHdUpiWxZUqN6M18cGzFkJO4W6W
         bh29ipyoJ0L4g3jkUu+UpsRZWmMUWPxm+ZgEJ4tqdAL1huK0Ip9Bsvg+WEofaqCu4IvR
         anbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvRJzobk4/M6/pPo8Sjol7SF6fcL/qbmKCv2Q1PKFe7n8XoUWq6+m+2KMlyjDg9yjgiWhrNquN3JByq/ov@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/QW8ZDbz+5VaFJJXkPsl0XKrWb9fkc2GzCGdxb11KGSalhyXR
	OCzGNoRRdpuRE2285/QaTnNihv0g8UakFK9eOv0JQq6bJoOWUHa7H8VKN0r9CeX+cfoxqh28PJP
	U/zXF95gphFemygd54DnHB3o/LQdodIY=
X-Gm-Gg: AZuq6aJaDVUHgTEgKiEB4U3IDKnYf2ZdDOsFsT8FisytVxrI+bARgO0XQKVcY2WVaI8
	2OGQt9mU3dXucVu/w9AP3bR4c6Krm8O47/qgNUX3SbPOM/kxv4l5Cf3oP/be2e2HPFSL7adS0Ti
	ZHsUNWvYYu6znFF6qwUM0E1azKv9bdbdRERxw1Ie7R2y6oyHKcxFSOsg2MG4/PcKrsoRV1uNOaH
	4VISneJahJv65ntiUGJwxXThQVC3ZSrvcblHudicSFXWSVoVcJlMycZgFFKv5RjdbgTQWEDe9aE
	i6UE1L5QFtZ5RE0H8SAaI6M0JEnnCWzd61OWG8uLNR3z2wDi0Whw1DlB
X-Received: by 2002:a05:651c:1547:b0:385:dde5:1bfe with SMTP id
 38308e7fff4ca-386b50f87c9mr630061fa.25.1770313258643; Thu, 05 Feb 2026
 09:40:58 -0800 (PST)
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
 <CALHNRZ_=c0JZ4B779rCciP+_U+YMqEbby1F5RaeyUTZiNZdc2Q@mail.gmail.com> <593afb89-031d-4376-8ea7-024b645c62cb@oss.qualcomm.com>
In-Reply-To: <593afb89-031d-4376-8ea7-024b645c62cb@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 5 Feb 2026 11:40:46 -0600
X-Gm-Features: AZwV_Qil2zciBLG9qPAKR0xWFrFirKfmwMgfir3m9NvQSY_A6XGVzNQOpTZPWlU
Message-ID: <CALHNRZ-FjMiS7ADWmBeY2gAQhswi15Uc1qCM6xP5FDeSbgD9_Q@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91962-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: B1132F622D
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 7:29=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> On 2/5/2026 1:31 PM, Aaron Kling wrote:
> > On Thu, Jan 29, 2026 at 8:35=E2=80=AFPM Aaron Kling <webgeek1234@gmail.=
com> wrote:
> >>
> >> On Thu, Jan 29, 2026 at 5:11=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qu=
alcomm.com> wrote:
> >>>
> >>> On 1/28/2026 11:24 PM, Aaron Kling wrote:
> >>>> On Wed, Jan 28, 2026 at 8:46=E2=80=AFAM Rob Clark <rob.clark@oss.qua=
lcomm.com> wrote:
> >>>>>
> >>>>> On Wed, Jan 28, 2026 at 12:54=E2=80=AFAM Neil Armstrong
> >>>>> <neil.armstrong@linaro.org> wrote:
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> On 1/27/26 23:48, Aaron Kling wrote:
> >>>>>>> I am working on the AYN Odin 2 qcs8550 series of devices, specifi=
cally
> >>>>>>> for Android, using mainline kernel drivers. I have come across so=
me
> >>>>>>> missing functionality and failures that I would like to inquire a=
bout.
> >>>>>>>
> >>>>>>> * ABL fails to load a dtbo using a baseline dtb unmodified from
> >>>>>>> mainline. Using changes described in the gunyah watchdog thread [=
0], a
> >>>>>>> dtbo loads and the devices boot as expected. If any of the change=
s in
> >>>>>>> that post don't exist in the base dtb, abl will fail to load the =
dtbo
> >>>>>>> and go to the bootloader menu. This appears to be an issue in the
> >>>>>>> baseline abl code, affecting all devices of that generation. Woul=
d it
> >>>>>>> be allowable to merge a change adding those changes to the sm8550
> >>>>>>> dtsi, allowing an unmodified mainline dtb to work with overlays?
> >>>>>>
> >>>>>> Any addition to the DT must be documented in dt-bindings, so if it=
's needed
> >>>>>> for boot they should be documented and added for sure.
> >>>>>>
> >>>>>>>
> >>>>>>> * SM8550 does not have cpu opp tables, thus cpufreq does not work=
. I
> >>>>>>> have locally copied the commits from sm8650 and adapted for sm855=
0,
> >>>>>>> and that seems to work okay. But no measuring of bandwidth was do=
ne,
> >>>>>>> so the numbers are likely not entirely correct. Is there any plan=
 to
> >>>>>>> generate correct tables for sm8550?
> >>>>>>
> >>>>>> Cpufreq works but not the interconnect scaling, so doing the same =
as sm8650
> >>>>>> is fine but since the values were calculated from downstream DT ta=
bles,
> >>>>>> the same should be done for sm8550.
> >>>>>>
> >>>>>>>
> >>>>>>> * As part of a series to support the original Odin 2, a patch to
> >>>>>>> update sm8550 EAS values was submitted [1]. But that series stall=
ed
> >>>>>>> and this was never merged. If this change is valid, which per tha=
t
> >>>>>>> discussion it appears to be, can it be resubmitted by itself and
> >>>>>>> merged?
> >>>>>>
> >>>>>> I missed this patch, please re-submit, I also need to update the o=
nes
> >>>>>> for SM8650.
> >>>>>>
> >>>>>>>
> >>>>>>> * Per the mainline kernel device trees and audio topology provide=
 by
> >>>>>>> the oem, these devices use primary i2s for the speakers path. The=
re
> >>>>>>> was a commit adding clock support for that as part of an hdmi ser=
ies
> >>>>>>> [2], but that seems to have stalled. Is this going to be picked b=
ack
> >>>>>>> up?
> >>>>>>
> >>>>>> No, I do not plan to do this work, it required adding callbacks in=
 the
> >>>>>> code to handle the clocks like done for the pre-audioreach firmwar=
es.
> >>>>>>
> >>>>>>>
> >>>>>>> * Inline crypto fails to detect hwkm support. And I see other log=
s
> >>>>>>> online, such as for the sm8550 qrd, that logs the same way my dev=
ice
> >>>>>>> does. I traced the issue to the check for wrapped key support [3]=
. On
> >>>>>>> my devices, the derive call is supported, but the other three cal=
ls
> >>>>>>> are not. I was pointed at the downstream headers for sm8550 suppo=
rt
> >>>>>>> and only derive is listed there, the other three don't appear to =
be
> >>>>>>> used in the downstream driver. Is this expected? And if so, will =
this
> >>>>>>> case be added to the mainline drivers?
> >>>>>>
> >>>>>> Does hwkm work with you remove the last 3 calls ?
> >>>>>>
> >>>>>>>
> >>>>>>> * Some gpu related clocks complain about being stuck off during b=
oot,
> >>>>>>> causing stack traces, but the gpu does work. I tried to do some
> >>>>>>> research into this, but quickly got lost in the weeds and I have =
no
> >>>>>>> idea where to even look.
> >>>>>>> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
> >>>>>>> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
> >>>>>>> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
> >>>>>>> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
> >>>>>>
> >>>>>> This may be related with the display handoff from ABL, did you add=
 the
> >>>>>> plat region to the reserved memories ?
> >>>>>>
> >>>>>>>
> >>>>>>> * Sometimes when starting rendering, a bandwidth submission times=
 out,
> >>>>>>> then the driver immediately complains that said id was left on th=
e
> >>>>>>> queue. I have tried increasing the timeout, but the same sequence
> >>>>>>> still happens. Timeout happens, immediately followed by a matchin=
g
> >>>>>>> unexpected response. Implying that this isn't actually a delay /
> >>>>>>> timeout issue.
> >>>>>>> [ 1848.517020] platform 3d6a000.gmu:
> >>>>>>> [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message
> >>>>>>> HFI_H2F_MSG_GX_BW_PERF_VOTE id 1015 timed out waiting for respons=
e
> >>>>>>> [ 1848.518020] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg [msm]=
]
> >>>>>>> *ERROR* Unexpected message id 1015 on the response queue
> >>>>>>
> >>>>>> Weird the timeout was extended for this very purpose
> >>>>>>
> >>>>>>>
> >>>>>>> * Some 3dmark benchmarks such as solar bay cause a gpu crash. I a=
m
> >>>>>>> unsure if this is a kernel problem or userspace, so I'm submittin=
g
> >>>>>>> here first. If the consensus is that it's a userspace issue, I'll
> >>>>>>> submit it to mesa.
> >>>>>>> [ 1860.112008] adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* g=
pu
> >>>>>>> fault ring 2 fence a261 status 00EF0585 rb 06df/090f ib1
> >>>>>>> 00000001512E9000/003d ib2 00000001512E7000/0000
> >>>>>>> [ 1860.113122] msm_dpu ae01000.display-controller: [drm:recover_w=
orker
> >>>>>>> [msm]] *ERROR* 67.5.10.1: hangcheck recover!
> >>>>>>> [ 1860.113238] msm_dpu ae01000.display-controller: [drm:recover_w=
orker
> >>>>>>> [msm]] *ERROR* 67.5.10.1: offending task: Thread-23
> >>>>>>> (com.futuremark.dmandroid.application)
> >>>>>>> [ 1860.258126] revision: 0 (67.5.10.1)
> >>>>>>> [ 1860.258132] rb 0: fence:    2884/2884
> >>>>>>> [ 1860.258133] rptr:     36
> >>>>>>> [ 1860.258134] rb wptr:  36
> >>>>>>> [ 1860.258135] rb 1: fence:    -256/-256
> >>>>>>> [ 1860.258138] rptr:     0
> >>>>>>> [ 1860.258138] rb wptr:  0
> >>>>>>> [ 1860.258139] rb 2: fence:    41563/41569
> >>>>>>> [ 1860.258140] rptr:     1752
> >>>>>>> [ 1860.258140] rb wptr:  2319
> >>>>>>> [ 1860.258141] rb 3: fence:    -256/-256
> >>>>>>> [ 1860.258141] rptr:     0
> >>>>>>> [ 1860.258142] rb wptr:  0
> >>>>>>> [ 1860.258146] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SC=
RATCH_REG0: 0
> >>>>>>> [ 1860.258220] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SC=
RATCH_REG1: 0
> >>>>>>> [ 1860.258266] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>>>>> CP_SCRATCH_REG2: 41562
> >>>>>>> [ 1860.258310] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SC=
RATCH_REG3: 0
> >>>>>>> [ 1860.258354] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>>>>> CP_SCRATCH_REG4: 3736059565
> >>>>>>> [ 1860.258399] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>>>>> CP_SCRATCH_REG5: 3736059565
> >>>>>>> [ 1860.258443] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>>>>> CP_SCRATCH_REG6: 3736059565
> >>>>>>> [ 1860.258487] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>>>>> CP_SCRATCH_REG7: 3736059565
> >>>>>>
> >>>>>> @rob do you have any idea how to solve this crash on a740 ?
> >>>>>
> >>>>> The clk and a6xx_hfi_wait_for_msg_interrupt errors indicate that
> >>>>> something is unhappy about gpu pm.  I'd focus on that first, since
> >>>>> that is almost certainly the cause of the later issues.  If things
> >>>>> _sorta_ work (rendering UI, etc) you could try removing all but the
> >>>>> lowest gpu OPP as an experiment.  Could be that power related probl=
ems
> >>>>> surface when the GPU ramps up to higher OPPs.
> >>>>
> >>>> Things work amazingly well compared to what I was expecting. Using
> >>>> mesa staging 26.0 as of yesterday, I'm getting roughly 80% performan=
ce
> >>>> in the benchmarks that do run, compared to the stock Android. And
> >>>> rendering is correct everywhere that I've seen so far. Mesa 25.3.3
> >>>> gives about 89% compared to stock, but there are graphical glitches =
in
> >>>> some of the benchmarks.
> >>>>
> >>>> I set gpu max_freq via devfreq to the minimum available frequency an=
d
> >>>> ran the failing benchmark again. It completed once, but failed with =
a
> >>>> similar stack trace on the second run. And per sysfs, the gpu did st=
ay
> >>>> at that minimum. Of note, that causes the benchmark to fail, but
> >>>> rendering does recover and the unit is still usable afterwards.
> >>>
> >>> In sm8550.dtsi, I see that ACD values are not specified in the GPU OP=
P
> >>> table. Can we add those (from downstream dt) and try again?
> >>
> >> I don't know what I'm looking for in the downstream dt. But if such a
> >> change gets pushed to lkml, I can grab that and verify.
> >
> > I took at look at the downstream dt and took a guess at importing the
> > acd values. I'm not sure if the gpu here is the baseline kalama or
> > kalama v2. I guessed the former. There were a couple values missing
> > however, that I had to extrapolate based on other frequencies. This
> > however changed nothing about my test results. Still getting crashes.
>
> Please use the values from kalama v2 dtsi. And if the acd property is
> missing in any OPP node, that is a hint to the the driver+gmu-fw that
> ACD should be kept disabled for that freq corner. So, please follow the
> same.

Alright, I updated the change using values from the downstream v2
dtsi. Still getting the same results. Since it's needed regardless,
would you like me to submit the ACD patch?

> ACD configurations are required to meet the hw specifications. We can't
> predict how the hw fails in case of a spec violation. I don't know if
> this issue is ACD related, but we should ensure that all power related
> configurations are accurate first.
>
> Also, could you please try the latest firmwares (sqe and gmu) from here:
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.g=
it/commit/qcom?id=3D30979b116b5c5857b72c4332db8db0ff1ca2dc08

These are what I'm already using.

> >
> > From my perspective, this part does not appear to be a PM or frequency
> > related issue. Some of the 3dmark benchmarks I have never seen crash.
> > Like Wild Life Extreme. I can run the stress variant of that and it
> > beats the unit for 20 minutes at full clocks with a screaming fan and>
> that runs perfectly stable. Solar Bay Extreme also runs completely
> > stable in all of its glorious 3 fps. The two problems are the standard
> > non-extreme Solar Bay and Steel Nomad Light. Both of these
> > intermittently crash with similar traces to what I posted before.
> > There doesn't seem to be consistency in the faults, sometimes it will
> > be almost immediately after starting the benchmark, other times it
> > will get 90% through and then fail. But they virtually always fail to
> > complete. For another point of data, I have never seen GravityMark
> > cause a fault either.
>
> The peak current draw can vary between benchmarks. So we can't rule out
> power issues. And are you able to reproduce the same issue on another
> device?

The only relevant devices I have are two of the AYN qcs8550 devices, a
Thor and an Odin 2 Mini. The issue happens on both, yes. But I don't
have anything like a phone or devkit with sm8550.

Aaron

