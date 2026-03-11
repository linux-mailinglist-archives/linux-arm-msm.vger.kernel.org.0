Return-Path: <linux-arm-msm+bounces-97095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCcdNd37sWnhHgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:33:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD1C26B616
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C3A0306FE1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 23:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F21E3A16BF;
	Wed, 11 Mar 2026 23:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGbZhjUx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6C9220F2A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773272015; cv=pass; b=X876yTdjUWxYxiPH0Ya0naTGDrzEBhbvVihN3nntEsajMgw19B/50xUqEscQYBlyXWUPZSG3+H50dLDgLAthaWJ0GxTB7lmqXbf73488jvVUcdWRR5UAIMwqAi5i0vYYMjF9MOOQiHQJnXXRa3whjsRf6PHlw5ao7XyrClnm3gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773272015; c=relaxed/simple;
	bh=CPlu3EtS5tOuI8Sr5n1CftNout3HIPBpprslevfd9WU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k6TVbwPK7QadIGESiOnDC6eQKGC7xoUwqj7UCVepAXRcWiisTk85f+HW4+bbnGi0c/x72bHYsPyVRIL9vBBExVPkBdLmAp7Xn6hoZeUBStAOBXMdtMBp84K7pE4IoCDtgWSUlRSep/rsWWX4i15GQxiaUch32Oi+CmidxEavzMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGbZhjUx; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3870778358aso3863621fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 16:33:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773272012; cv=none;
        d=google.com; s=arc-20240605;
        b=QphzpM+xNw4HsHX8THKJrkZC58zfVf42tBo872dFki8+kRuPbLabeLgXyECYNbVOcO
         l7YNOSgqSBXeUYUkIhwkuO58Udm/4n/yrI0BH1l3Uf/34rzWnQWPZqfqsTIXEZReZaH8
         rb17CpAJHngjm4P8cLoRI8RxuBeq/AG7J6qDJRKBx557P8Hel2Egf9phsw3Z+FLvLDdZ
         4tslm4HDww7hhZ0gY4roi2DW2zzAOVG2CUtPni5oQ1ZmdU2OITaQ2N/r7RmP2KoiTf/C
         0vie2kpN+Jlvj4viKzQ7yLGLrBN9KSgfE5z+uKFKck3WjX26/uJost/EwKOKclR9EKUg
         U6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/tiVeuZQ9C5cw5BMo1u1mwKDs+K3e4NsRZypaGcvV5A=;
        fh=2Ui/255jMSU5qWFuuKMSdlXNt/67RN7iS29W+j/QyIo=;
        b=L9uZa8gaP0iFLqqW3PoWPYdP1CWW0a3FrEuQySRjpMT+5gtQtRZVA8EmaC08MB1szp
         DuLctz0FIszgdcREGlVnRDy/ppZZLDMMZvmDumvMvLI0g9SWL6KWpVeyPr+wkQ8fjDkl
         BV2hApimW8dA92pPBzKFdB8nBw0dR0B4+pVxl6ipmd4awuObbXAjVeqo2kXl20Mlu94u
         2axjHhDrTpYOgnJ4Fe4rNGrjaZ8tU61AV77X7VCDfsra0DiQzTfmZbETqj4NwhGH8hYI
         labVQFGEheHtES5/GwedOCddc7HNxsMJ2y+JPC7O0ZyP1eEQ7GD7joB90tttzyOBwGbC
         BFRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773272012; x=1773876812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tiVeuZQ9C5cw5BMo1u1mwKDs+K3e4NsRZypaGcvV5A=;
        b=KGbZhjUxMfeWNfnTEAAenMQr6sc0kYRUHvoAiBKWkFXj4xc8wEp3hCgjxQVnaJiK4R
         jhZ9JH8dI0Lq5eXFOHTreySX9JrBUOiHv/mwF899vMvfIAV3H6y7PbkVPFU8hmw/iFag
         1+AK9Di49e+3Xcs2dzNRmJlIovgQNAMdw+KUakO2rj/WxO11L+MqM5B/YBEgcirYoFNC
         y+VBNHf6zUDMNZzsCo6fiNPqDbip5n6e7ay+6tSdLyy5IFcNPnhcXq5sigO4MZbKh5Fy
         lyc+fKCUYQup/Fx1ad8omz3t47yT/Dd7434tk03C46ZDokuH+3ZA9BxjlHDeMJC+b/sq
         Y6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773272012; x=1773876812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/tiVeuZQ9C5cw5BMo1u1mwKDs+K3e4NsRZypaGcvV5A=;
        b=B0pbV+E+fwc+BLq2mjIsNVnUn+Y4yJJUPlBKjaaXMR3aaCUE+Xmj42vzmRKcWpAQWd
         uz6gBiqoq2mxx0YkQ4zjYjcCqOeXlbuBZqaHiDZ9JPR6JXgqqOeafcFNCeI80s8b8QEk
         hi8t4BU3xcD5TNHY9rNlJojz1w9XVeMs2yxTcQd/SpKmnjlT1BOuxvzXmOgarPPA51mL
         Z/T3UjwL/x3nREschGUQwFXC3JzbjS/ZzNgNHJL0PIWye2smwJ6BUZqy1b8DSyAjfpyE
         WKIhd9Fv2kjDrsExZiqse2d15/yNsy75XhROsaa0HnPMIWFHlkqQcWGVtkHOCarwAjX3
         p/jA==
X-Forwarded-Encrypted: i=1; AJvYcCWCwWgYNlJvrx6HgPpeojFgUr4McUAWnGriopLA60Vp+PjID5VNeZErd9Wg1S8mKsJCJ/kx2Fly0nFDQ9Ep@vger.kernel.org
X-Gm-Message-State: AOJu0YyGHWDHDL3svTKCq4WK96rP1Tl5hlynj/gBb2Ed1RZ8NhIed9BE
	Ag17NmKNMoawvLaPFnLvl6L6tW9Il1YDbN83I8dBfnswU7dh/xsU7qyvDLgT4HMnPvZiuXN28TA
	GXdwiZ2qVEb8HhtDc6ETSNxk52O/TIC0=
X-Gm-Gg: ATEYQzwrfwa/3rh1RklL77kK7LO/CuwPc/+9QCkxexQ0hjB1A9vC3lf+StwHjJgPc8j
	03s87o8W0VMiN23ee+9aUH5/kbjSqBv9mMMr9QfLlNi6XkpKy3EcTcx3gGHwyKB5yLGC9UwSN1m
	Y32QLTSU+zmBvzsG9CL9Suo7+4oDH3CrRgixEc8SktGEwsvaBNKfIofvbD/VOCrU3iz/DAfqk9G
	Xxwys2l6HTNkyJPJRnr5W5pWqXoLkgj4ssG7MXG+xBEhd+HMmYtnXEgZnTuEdgLZfxu/1vrCsLX
	zfGV0AshUWDIeL6Uoh3EUiSdRWqkc9HYkMJx6ts7kRRjyVhH80butFolyGM0MiX22vB/
X-Received: by 2002:a05:651c:304c:b0:38a:322d:693b with SMTP id
 38308e7fff4ca-38a67e6287dmr14966411fa.26.1773272011373; Wed, 11 Mar 2026
 16:33:31 -0700 (PDT)
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
 <b2c3c56d-5b30-4201-bd16-924bf674c9d7@oss.qualcomm.com> <CALHNRZ-Uc9HEHc_8wJ3SAKxHX+cE0Gu7_BeakvF5muCmS9wmhg@mail.gmail.com>
 <71ec1014-e357-4368-9ed7-37083ead9989@oss.qualcomm.com>
In-Reply-To: <71ec1014-e357-4368-9ed7-37083ead9989@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 11 Mar 2026 18:33:19 -0500
X-Gm-Features: AaiRm52NM14SaEdSrYXgjtpn4RqSjw8C-BopuZPFF4PuXAptBhnqhcLYJFkz3eA
Message-ID: <CALHNRZ-gFD3jgtjfGKUQcdT23h71v4kbQWsALSuh8yfOSC=p0Q@mail.gmail.com>
Subject: Re: Questions About SM8550 Support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, rob.clark@oss.qualcomm.com, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97095-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 0CD1C26B616
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 3:47=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/10/26 10:53 PM, Aaron Kling wrote:
> > On Tue, Mar 10, 2026 at 4:33=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qua=
lcomm.com> wrote:
> >>
> >> On 2/5/2026 11:10 PM, Aaron Kling wrote:
> >>> On Thu, Feb 5, 2026 at 7:29=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qu=
alcomm.com> wrote:
> >>>>
> >>>> On 2/5/2026 1:31 PM, Aaron Kling wrote:
> >>>>> On Thu, Jan 29, 2026 at 8:35=E2=80=AFPM Aaron Kling <webgeek1234@gm=
ail.com> wrote:
> >>>>>>
> >>>>>> On Thu, Jan 29, 2026 at 5:11=E2=80=AFPM Akhil P Oommen <akhilpo@os=
s.qualcomm.com> wrote:
> >>>>>>>
> >>>>>>> On 1/28/2026 11:24 PM, Aaron Kling wrote:
> >>>>>>>> On Wed, Jan 28, 2026 at 8:46=E2=80=AFAM Rob Clark <rob.clark@oss=
.qualcomm.com> wrote:
> >>>>>>>>>
> >>>>>>>>> On Wed, Jan 28, 2026 at 12:54=E2=80=AFAM Neil Armstrong
> >>>>>>>>> <neil.armstrong@linaro.org> wrote:
> >>>>>>>>>>
> >>>>>>>>>> Hi,
> >>>>>>>>>>
> >>>>>>>>>> On 1/27/26 23:48, Aaron Kling wrote:
> >>>>>>>>>>> I am working on the AYN Odin 2 qcs8550 series of devices, spe=
cifically
> >>>>>>>>>>> for Android, using mainline kernel drivers. I have come acros=
s some
> >>>>>>>>>>> missing functionality and failures that I would like to inqui=
re about.
> >>>>>>>>>>>
> >>>>>>>>>>> * ABL fails to load a dtbo using a baseline dtb unmodified fr=
om
> >>>>>>>>>>> mainline. Using changes described in the gunyah watchdog thre=
ad [0], a
> >>>>>>>>>>> dtbo loads and the devices boot as expected. If any of the ch=
anges in
> >>>>>>>>>>> that post don't exist in the base dtb, abl will fail to load =
the dtbo
> >>>>>>>>>>> and go to the bootloader menu. This appears to be an issue in=
 the
> >>>>>>>>>>> baseline abl code, affecting all devices of that generation. =
Would it
> >>>>>>>>>>> be allowable to merge a change adding those changes to the sm=
8550
> >>>>>>>>>>> dtsi, allowing an unmodified mainline dtb to work with overla=
ys?
> >>>>>>>>>>
> >>>>>>>>>> Any addition to the DT must be documented in dt-bindings, so i=
f it's needed
> >>>>>>>>>> for boot they should be documented and added for sure.
> >>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> * SM8550 does not have cpu opp tables, thus cpufreq does not =
work. I
> >>>>>>>>>>> have locally copied the commits from sm8650 and adapted for s=
m8550,
> >>>>>>>>>>> and that seems to work okay. But no measuring of bandwidth wa=
s done,
> >>>>>>>>>>> so the numbers are likely not entirely correct. Is there any =
plan to
> >>>>>>>>>>> generate correct tables for sm8550?
> >>>>>>>>>>
> >>>>>>>>>> Cpufreq works but not the interconnect scaling, so doing the s=
ame as sm8650
> >>>>>>>>>> is fine but since the values were calculated from downstream D=
T tables,
> >>>>>>>>>> the same should be done for sm8550.
> >>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> * As part of a series to support the original Odin 2, a patch=
 to
> >>>>>>>>>>> update sm8550 EAS values was submitted [1]. But that series s=
talled
> >>>>>>>>>>> and this was never merged. If this change is valid, which per=
 that
> >>>>>>>>>>> discussion it appears to be, can it be resubmitted by itself =
and
> >>>>>>>>>>> merged?
> >>>>>>>>>>
> >>>>>>>>>> I missed this patch, please re-submit, I also need to update t=
he ones
> >>>>>>>>>> for SM8650.
> >>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> * Per the mainline kernel device trees and audio topology pro=
vide by
> >>>>>>>>>>> the oem, these devices use primary i2s for the speakers path.=
 There
> >>>>>>>>>>> was a commit adding clock support for that as part of an hdmi=
 series
> >>>>>>>>>>> [2], but that seems to have stalled. Is this going to be pick=
ed back
> >>>>>>>>>>> up?
> >>>>>>>>>>
> >>>>>>>>>> No, I do not plan to do this work, it required adding callback=
s in the
> >>>>>>>>>> code to handle the clocks like done for the pre-audioreach fir=
mwares.
> >>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> * Inline crypto fails to detect hwkm support. And I see other=
 logs
> >>>>>>>>>>> online, such as for the sm8550 qrd, that logs the same way my=
 device
> >>>>>>>>>>> does. I traced the issue to the check for wrapped key support=
 [3]. On
> >>>>>>>>>>> my devices, the derive call is supported, but the other three=
 calls
> >>>>>>>>>>> are not. I was pointed at the downstream headers for sm8550 s=
upport
> >>>>>>>>>>> and only derive is listed there, the other three don't appear=
 to be
> >>>>>>>>>>> used in the downstream driver. Is this expected? And if so, w=
ill this
> >>>>>>>>>>> case be added to the mainline drivers?
> >>>>>>>>>>
> >>>>>>>>>> Does hwkm work with you remove the last 3 calls ?
> >>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> * Some gpu related clocks complain about being stuck off duri=
ng boot,
> >>>>>>>>>>> causing stack traces, but the gpu does work. I tried to do so=
me
> >>>>>>>>>>> research into this, but quickly got lost in the weeds and I h=
ave no
> >>>>>>>>>>> idea where to even look.
> >>>>>>>>>>> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
> >>>>>>>>>>> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
> >>>>>>>>>>> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
> >>>>>>>>>>> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
> >>>>>>>>>>
> >>>>>>>>>> This may be related with the display handoff from ABL, did you=
 add the
> >>>>>>>>>> plat region to the reserved memories ?
> >>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> * Sometimes when starting rendering, a bandwidth submission t=
imes out,
> >>>>>>>>>>> then the driver immediately complains that said id was left o=
n the
> >>>>>>>>>>> queue. I have tried increasing the timeout, but the same sequ=
ence
> >>>>>>>>>>> still happens. Timeout happens, immediately followed by a mat=
ching
> >>>>>>>>>>> unexpected response. Implying that this isn't actually a dela=
y /
> >>>>>>>>>>> timeout issue.
> >>>>>>>>>>> [ 1848.517020] platform 3d6a000.gmu:
> >>>>>>>>>>> [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message
> >>>>>>>>>>> HFI_H2F_MSG_GX_BW_PERF_VOTE id 1015 timed out waiting for res=
ponse
> >>>>>>>>>>> [ 1848.518020] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg [=
msm]]
> >>>>>>>>>>> *ERROR* Unexpected message id 1015 on the response queue
> >>>>>>>>>>
> >>>>>>>>>> Weird the timeout was extended for this very purpose
> >>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> * Some 3dmark benchmarks such as solar bay cause a gpu crash.=
 I am
> >>>>>>>>>>> unsure if this is a kernel problem or userspace, so I'm submi=
tting
> >>>>>>>>>>> here first. If the consensus is that it's a userspace issue, =
I'll
> >>>>>>>>>>> submit it to mesa.
> >>>>>>>>>>> [ 1860.112008] adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERRO=
R* gpu
> >>>>>>>>>>> fault ring 2 fence a261 status 00EF0585 rb 06df/090f ib1
> >>>>>>>>>>> 00000001512E9000/003d ib2 00000001512E7000/0000
> >>>>>>>>>>> [ 1860.113122] msm_dpu ae01000.display-controller: [drm:recov=
er_worker
> >>>>>>>>>>> [msm]] *ERROR* 67.5.10.1: hangcheck recover!
> >>>>>>>>>>> [ 1860.113238] msm_dpu ae01000.display-controller: [drm:recov=
er_worker
> >>>>>>>>>>> [msm]] *ERROR* 67.5.10.1: offending task: Thread-23
> >>>>>>>>>>> (com.futuremark.dmandroid.application)
> >>>>>>>>>>> [ 1860.258126] revision: 0 (67.5.10.1)
> >>>>>>>>>>> [ 1860.258132] rb 0: fence:    2884/2884
> >>>>>>>>>>> [ 1860.258133] rptr:     36
> >>>>>>>>>>> [ 1860.258134] rb wptr:  36
> >>>>>>>>>>> [ 1860.258135] rb 1: fence:    -256/-256
> >>>>>>>>>>> [ 1860.258138] rptr:     0
> >>>>>>>>>>> [ 1860.258138] rb wptr:  0
> >>>>>>>>>>> [ 1860.258139] rb 2: fence:    41563/41569
> >>>>>>>>>>> [ 1860.258140] rptr:     1752
> >>>>>>>>>>> [ 1860.258140] rb wptr:  2319
> >>>>>>>>>>> [ 1860.258141] rb 3: fence:    -256/-256
> >>>>>>>>>>> [ 1860.258141] rptr:     0
> >>>>>>>>>>> [ 1860.258142] rb wptr:  0
> >>>>>>>>>>> [ 1860.258146] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] C=
P_SCRATCH_REG0: 0
> >>>>>>>>>>> [ 1860.258220] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] C=
P_SCRATCH_REG1: 0
> >>>>>>>>>>> [ 1860.258266] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>>>>>>>>> CP_SCRATCH_REG2: 41562
> >>>>>>>>>>> [ 1860.258310] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] C=
P_SCRATCH_REG3: 0
> >>>>>>>>>>> [ 1860.258354] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>>>>>>>>> CP_SCRATCH_REG4: 3736059565
> >>>>>>>>>>> [ 1860.258399] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>>>>>>>>> CP_SCRATCH_REG5: 3736059565
> >>>>>>>>>>> [ 1860.258443] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>>>>>>>>> CP_SCRATCH_REG6: 3736059565
> >>>>>>>>>>> [ 1860.258487] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> >>>>>>>>>>> CP_SCRATCH_REG7: 3736059565
> >>>>>>>>>>
> >>>>>>>>>> @rob do you have any idea how to solve this crash on a740 ?
> >>>>>>>>>
> >>>>>>>>> The clk and a6xx_hfi_wait_for_msg_interrupt errors indicate tha=
t
> >>>>>>>>> something is unhappy about gpu pm.  I'd focus on that first, si=
nce
> >>>>>>>>> that is almost certainly the cause of the later issues.  If thi=
ngs
> >>>>>>>>> _sorta_ work (rendering UI, etc) you could try removing all but=
 the
> >>>>>>>>> lowest gpu OPP as an experiment.  Could be that power related p=
roblems
> >>>>>>>>> surface when the GPU ramps up to higher OPPs.
> >>>>>>>>
> >>>>>>>> Things work amazingly well compared to what I was expecting. Usi=
ng
> >>>>>>>> mesa staging 26.0 as of yesterday, I'm getting roughly 80% perfo=
rmance
> >>>>>>>> in the benchmarks that do run, compared to the stock Android. An=
d
> >>>>>>>> rendering is correct everywhere that I've seen so far. Mesa 25.3=
.3
> >>>>>>>> gives about 89% compared to stock, but there are graphical glitc=
hes in
> >>>>>>>> some of the benchmarks.
> >>>>>>>>
> >>>>>>>> I set gpu max_freq via devfreq to the minimum available frequenc=
y and
> >>>>>>>> ran the failing benchmark again. It completed once, but failed w=
ith a
> >>>>>>>> similar stack trace on the second run. And per sysfs, the gpu di=
d stay
> >>>>>>>> at that minimum. Of note, that causes the benchmark to fail, but
> >>>>>>>> rendering does recover and the unit is still usable afterwards.
> >>>>>>>
> >>>>>>> In sm8550.dtsi, I see that ACD values are not specified in the GP=
U OPP
> >>>>>>> table. Can we add those (from downstream dt) and try again?
> >>>>>>
> >>>>>> I don't know what I'm looking for in the downstream dt. But if suc=
h a
> >>>>>> change gets pushed to lkml, I can grab that and verify.
> >>>>>
> >>>>> I took at look at the downstream dt and took a guess at importing t=
he
> >>>>> acd values. I'm not sure if the gpu here is the baseline kalama or
> >>>>> kalama v2. I guessed the former. There were a couple values missing
> >>>>> however, that I had to extrapolate based on other frequencies. This
> >>>>> however changed nothing about my test results. Still getting crashe=
s.
> >>>>
> >>>> Please use the values from kalama v2 dtsi. And if the acd property i=
s
> >>>> missing in any OPP node, that is a hint to the the driver+gmu-fw tha=
t
> >>>> ACD should be kept disabled for that freq corner. So, please follow =
the
> >>>> same.
> >>>
> >>> Alright, I updated the change using values from the downstream v2
> >>> dtsi. Still getting the same results. Since it's needed regardless,
> >>> would you like me to submit the ACD patch?
> >>
> >> Sorry for the super delayed response.
> >>
> >> Please go ahead and post the patch.
> >
> > I sent it here [0].
> >
> >>>
> >>>> ACD configurations are required to meet the hw specifications. We ca=
n't
> >>>> predict how the hw fails in case of a spec violation. I don't know i=
f
> >>>> this issue is ACD related, but we should ensure that all power relat=
ed
> >>>> configurations are accurate first.
> >>>>
> >>>> Also, could you please try the latest firmwares (sqe and gmu) from h=
ere:
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmw=
are.git/commit/qcom?id=3D30979b116b5c5857b72c4332db8db0ff1ca2dc08
> >>>
> >>> These are what I'm already using.
> >>>
> >>>>>
> >>>>> From my perspective, this part does not appear to be a PM or freque=
ncy
> >>>>> related issue. Some of the 3dmark benchmarks I have never seen cras=
h.
> >>>>> Like Wild Life Extreme. I can run the stress variant of that and it
> >>>>> beats the unit for 20 minutes at full clocks with a screaming fan a=
nd>
> >>>> that runs perfectly stable. Solar Bay Extreme also runs completely
> >>>>> stable in all of its glorious 3 fps. The two problems are the stand=
ard
> >>>>> non-extreme Solar Bay and Steel Nomad Light. Both of these
> >>>>> intermittently crash with similar traces to what I posted before.
> >>>>> There doesn't seem to be consistency in the faults, sometimes it wi=
ll
> >>>>> be almost immediately after starting the benchmark, other times it
> >>>>> will get 90% through and then fail. But they virtually always fail =
to
> >>>>> complete. For another point of data, I have never seen GravityMark
> >>>>> cause a fault either.
> >>>>
> >>>> The peak current draw can vary between benchmarks. So we can't rule =
out
> >>>> power issues. And are you able to reproduce the same issue on anothe=
r
> >>>> device?
> >>>
> >>> The only relevant devices I have are two of the AYN qcs8550 devices, =
a
> >>> Thor and an Odin 2 Mini. The issue happens on both, yes. But I don't
> >>> have anything like a phone or devkit with sm8550.
> >>
> >> I will post a few fixes in the next few days. At least, with that ther=
e
> >> should be a coredump generated for hfi errors. Please share that.
> >
> > I posted an issue on the mesa tracker here [1] and attached some
> > devcoredumps to one of my replies. I can add more when the new patches
> > are available.
> >
> >> iirc, you are using upstream drivers with downstream kernel (ACK?). An=
y
> >> chance you can try pure upstream kernel?
> >
> > Yes, that is correct. My current setup is ACK 6.18.13. I unfortunately
> > do not have a pure Linux setup. If I had uart access on these devices,
> > I could use the minimal busybox setup like I do for tegra, but I do
> > not have such access here. As far as I can tell, no closed case debug
> > setup is available either. Google does have a mainline tracking branch
> > which I could use to get closer to -next for verification, but it's
> > still not unmodified upstream.
>
> FWIW you can run AOSP on pure upstream, perhaps not with all the features=
,
> but you can. Try copying the config from ACK and give it a spin

I spent some time this afternoon trying to jam todays linux-next into
my build setup, aka googles bazel kernel-platform, and did get it to
build. However, it doesn't boot, no display and no adb. Tried
android-mainline and... that also doesn't boot. Yay. I did have a
version of that booting pre ack 6.18 fork. Extrapolation is that
either something either broke the entire soc again, like that ifpc
thing in 6.18 that took me a week to figure out (and only then found a
patch had already been submitted), or something on that level. And the
only way I've been able to debug without uart or in-ram pstore is
fudgery with pstore-blk and swapping boot slots, and I'd really prefer
not to do that again. I will try to see if I can bisect
android-mainline to track down the issue, then apply the findings to
-next.

Aaron

