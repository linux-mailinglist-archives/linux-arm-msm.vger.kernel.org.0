Return-Path: <linux-arm-msm+bounces-91045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PX0HZQiemmv2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:52:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C9A33B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5EB2307C769
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AB928F50F;
	Wed, 28 Jan 2026 14:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwG1NHmT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUbFo3Nt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5F624A044
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 14:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769611584; cv=pass; b=CyFaom6t4jTbrkb845pG6V6V523DBuPFEn1uO0DxNYPAM3oxX7qSCXarCfEukMKPQsjdenyT84E0j+B7f+Xc99T0C/3RqEoO8DnGwHkRSqNCePDtMTELmO+3QfBRLMzcPdA7+b1f4Tuan4Qkfl3xmvsbtJt5EXDrVmZ+Q19EvYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769611584; c=relaxed/simple;
	bh=z/ZpQWOMa4ID9JdVZRK9OztelTKRV8qph+9Qs21dGeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0SVGchvpZsrSg8VJCgEErd/Seb3aaE2nuYiYkXDfUdA+LESVEeiqbqIJK4aKTvKLrxevXW+SyYoYYVpUzETF7G7K9jnI3f/0gXj9YcsyFH62E9piEuqSM7k+0PnaPnIBZbcPHAw88kmRtfg+zD8usq0+hqQ4/yPXUP0B3GOpvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwG1NHmT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUbFo3Nt; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SCwnBV3906116
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 14:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=BQAxmTBFjLZDPG2H6WUi2KBeYc+O5A24PfaDK5II9sw=; b=Mw
	G1NHmTBulIcBtAsHQ/tnMurSM456aBm96ymfy+H0GHtnDmvrGteEK1KTpN8OPHQc
	m50vyd/ZCXIKEO5tXeFcQATEvQrgYLuw1PvttMmiI1IqnWwbnpxTunoyAnJyIaxR
	tlG7JGMpXLVwGEPqj0VPDz1IMjZjtMEu06jbmpo+jcDlrwioeKhxWow0IvfQReoP
	LTOtrIgKNkZcG4YVHttTYR74haPXDEX1jP1SFlc7llOxnjyvMGokU0kQJV/RtdW8
	WvQ+YgT8/nWC+GNLMTaBtkgA2eM/QInHU4QJJ8jBHCt3XpmLZOq/Yr75qmQV8yek
	ExlqwaXdZCa+RHX63ifw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byjxhrbjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 14:46:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b71c5826fbso7522905eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 06:46:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769611580; cv=none;
        d=google.com; s=arc-20240605;
        b=jVtXWt+hFNLqyQlLkKPxZG7q4nbOcjlvK7LuUakxpkDhg7g9k7rP4Rvf7Ywd/kgKWT
         MkRgq13Jek4hR7KtF/mmAfQ8qY0oxgqFX5r1rRo3yIBBAnGLAQCUL/KhY2DQfZgxW1YD
         xKc+NmI7fvIXSzFXgTWPayVcKOMayfKtCP/PuybY9AIZaMk3zlKVNu7AyQV7ETXeC4MT
         lAP77T0LE2JQJQe+kmRxf1GKamUQAF7kb9tJglmLwlm/BlHyZKlIyxEj517HYgryPeND
         rl3i8tvRiubQl3gQvu6gTXKYDzTbhA7JsjYVPQbkiyuQ8BTzNIWtk7eL0OWe5SVi6DX2
         VXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=BQAxmTBFjLZDPG2H6WUi2KBeYc+O5A24PfaDK5II9sw=;
        fh=GXIZZbZHC2LjURqjoQSD0FZdlohBzEBMgvQxpWrJ9HY=;
        b=brYT2CwiYTkS+SxIpA+YNRjNIMXeagCVYB1mI1XS78N/jiT39eo0p4eQDQRuzWz3mv
         EVNU4eYGuGdLo3PDAPWWEL9nPOxqcqmi2BQvEywotMm4mpGHLMxlTDi9/96Ie54YlVWQ
         1NVjpMFDdxjWqY2XG/dv0+t+3Fs7pnBD7REJhrUyHrHdYiG7pGeBlyKVeqSW49jXfl/D
         hOFqXRwO0/70xPuNTQHOxcMfJW8voJK7vy4O2BF6vz3ybwOcfZTQtS9h/LDRtcIZuX49
         ph1LqqZdDhm/YX2JYwz0LiLKnraM58zQSsmBbIFTJp3DiwhL1aQzq+tZH0Gsd6gKEWlN
         WMiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769611580; x=1770216380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BQAxmTBFjLZDPG2H6WUi2KBeYc+O5A24PfaDK5II9sw=;
        b=NUbFo3Nte5cm7Z3vTJiZMLYkciADCyMwkQQtw3xCgqKH3MK26HgLI5b7i5aH0Ye0SJ
         Ov4Yzx5V6eaw4BOmJ8GPLR/H/hkn4Xc1SpFmvP5W4mXzDJrekOiQ2AOK0Hx6F76/7wlZ
         p3FmKsWJkbZ9nS5SD6eg885rh5Vg9isGnYXt7nDNbbDm9p+nVBghzArb7rzpbd3QWVVK
         sHKSfNmlOv/LTu1NZNRqrwRbTq/hWbRvYFCWsVJD2K50P48QqlIpxjK3FbO41/MADZ0g
         gst3TyMNCBFSFqiIWIP/ha65sc3oz73EbbtkMtXPNC+qPHAssWk7HNkn+vo6QToY9ckm
         qs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769611580; x=1770216380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQAxmTBFjLZDPG2H6WUi2KBeYc+O5A24PfaDK5II9sw=;
        b=EC2j369ic4je7XailwRLEZPJ1n8M4y01LmuDbVgh77C92b7ZR+5HnPW1Hq6FQoOJpt
         KDZm5t84NvDNaM9vR0BANelQmZmnzQyF8wHQ6goNfqRN7TOPGU66Up0DydiAZ7p6RKee
         3DFhFbkx3a9A+fSOMdnaoCGknXj9Djd+6GDylwLPOiT8/8AwS3/FAPNT9+OeD5+bWVkn
         iGJpRK3EoPSgFJPDm8pylR+DEbwSKk9paXC/qQCUsooGw/z8p/hKGVhUwAWW1F+kj5Y2
         zj6x1Qawf2gTC4brONTahs8JRlC2u+N9ZGzNQ09y1TIxwVmI0mdl8LQGjKBfkJBZXQDU
         lvQA==
X-Forwarded-Encrypted: i=1; AJvYcCWByA6PKYsCp2K4awxGtiKltvIN4GOnK37pmIAS2RPoSRkwQ3QcG2wwl2ZbwkMpUYqdKWWjn/glmbmYy4yZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk//Q6mIU8/3lxp3hvqnvDh4pO0MpRMXKV0Sgw4fhlc7+ostv7
	nMHBdRb6splhso/LL+QtIzOLt0Gh854HH1PV4w/KS2syzGl3Oin+Bg2pL7mk98MNklg9Y0TGpHk
	njrbNJ0NL4+hhDmyEdpKdxiT+Dyr5Cd7bHAzBZOwUSRrTEq4+z5HGWtLOjwkppjnsOn5NqFQWxA
	M7IWuqI04WEDaLNZSEkHmVs9IfMao/9WhuWJMDx+YfM9U=
X-Gm-Gg: AZuq6aJwF7oKl8MetI5ATT6UYJ5SHd5hMb1e6n0gcJxxmx61PgAnMqDz3etCo3HNoL8
	MlTx1zKuLw1NsYXilMaZCssv3B19x6vhQrTqR6Aq0T8lp3IyuDbh6S/+PMPVtWYqpM20eagyfmo
	kcdhwIOjU5KXJR59t/VVyzqetqcrCnJGcJ88KEcHNSQaxWjo7Blk6/rBugQ5iQtRo9Yf42nb5T6
	djv3QiGqrPeiwIjBwG6jruqbw==
X-Received: by 2002:a05:693c:40d5:b0:2b7:a3a9:9c2d with SMTP id 5a478bee46e88-2b7a3a9a711mr576037eec.10.1769611578129;
        Wed, 28 Jan 2026 06:46:18 -0800 (PST)
X-Received: by 2002:a05:693c:40d5:b0:2b7:a3a9:9c2d with SMTP id
 5a478bee46e88-2b7a3a9a711mr576031eec.10.1769611577493; Wed, 28 Jan 2026
 06:46:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <8c64d188-9e14-43ae-8950-b31347f8eff8@linaro.org>
In-Reply-To: <8c64d188-9e14-43ae-8950-b31347f8eff8@linaro.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 06:46:04 -0800
X-Gm-Features: AZwV_QjnqU2orf1oWBm9f-TiVAltAdShf9n8PGKIO8MMijoth5DohFO1c6DE69Y
Message-ID: <CACSVV02HKpEGQ6cAhNQ8a0YiT0nXHVD8=yXOfONz=1Amac+z2A@mail.gmail.com>
Subject: Re: Questions About SM8550 Support
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aaron Kling <webgeek1234@gmail.com>, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: YYv2Osh8jFBgOIZY9d4rZJibOv4NjTuH
X-Proofpoint-GUID: YYv2Osh8jFBgOIZY9d4rZJibOv4NjTuH
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=697a213d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=uG9ovBzR-AZHXtnIHwAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEyMSBTYWx0ZWRfX+05kJK6qc4rR
 STBRTeY3EB1yAlYlo6AH1HLbciqvUgSRMxzIQyUGOFa4iF5ekmqHhtQclUrJuLrTfF9/HdXgyV+
 +Xw4bNHXIVuk5dYYYTn9L0R1AnM4pGOZUD3SXBm0QE0Nxw9+ceiVxXUEJ4blZPllZvB5ZjD7mje
 tSok9Efk3mml7ts++ls9sYIK3o30774APZZTQ9quYoPvuvb2tD6ibUtGgwapY0Zg8C85/HGKFDV
 LgGyUmZWJpthiFF24gwHJiSx+eHSmUsB8pc62LyQY9zMFp+Vk39SeFRo+IQ3qd/DZBPqdsixSLr
 7hy8TlJxxis8KwQOPrdJ4IQ2UYNQnXgR7beXYjOr20+qge3qMYUjZgT1y0lRvkkke9Q5JyP4POX
 KJQ87jzKK28DU7kHmsbzkY06twA8WCURI6ljfQyliEoVaoLCPFn9iNyXjMApKzrI5SGJ1ZcIka9
 dVv91Y63kseXWYwl+fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91045-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,mail.gmail.com:mid,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: C46C9A33B5
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:54=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 1/27/26 23:48, Aaron Kling wrote:
> > I am working on the AYN Odin 2 qcs8550 series of devices, specifically
> > for Android, using mainline kernel drivers. I have come across some
> > missing functionality and failures that I would like to inquire about.
> >
> > * ABL fails to load a dtbo using a baseline dtb unmodified from
> > mainline. Using changes described in the gunyah watchdog thread [0], a
> > dtbo loads and the devices boot as expected. If any of the changes in
> > that post don't exist in the base dtb, abl will fail to load the dtbo
> > and go to the bootloader menu. This appears to be an issue in the
> > baseline abl code, affecting all devices of that generation. Would it
> > be allowable to merge a change adding those changes to the sm8550
> > dtsi, allowing an unmodified mainline dtb to work with overlays?
>
> Any addition to the DT must be documented in dt-bindings, so if it's need=
ed
> for boot they should be documented and added for sure.
>
> >
> > * SM8550 does not have cpu opp tables, thus cpufreq does not work. I
> > have locally copied the commits from sm8650 and adapted for sm8550,
> > and that seems to work okay. But no measuring of bandwidth was done,
> > so the numbers are likely not entirely correct. Is there any plan to
> > generate correct tables for sm8550?
>
> Cpufreq works but not the interconnect scaling, so doing the same as sm86=
50
> is fine but since the values were calculated from downstream DT tables,
> the same should be done for sm8550.
>
> >
> > * As part of a series to support the original Odin 2, a patch to
> > update sm8550 EAS values was submitted [1]. But that series stalled
> > and this was never merged. If this change is valid, which per that
> > discussion it appears to be, can it be resubmitted by itself and
> > merged?
>
> I missed this patch, please re-submit, I also need to update the ones
> for SM8650.
>
> >
> > * Per the mainline kernel device trees and audio topology provide by
> > the oem, these devices use primary i2s for the speakers path. There
> > was a commit adding clock support for that as part of an hdmi series
> > [2], but that seems to have stalled. Is this going to be picked back
> > up?
>
> No, I do not plan to do this work, it required adding callbacks in the
> code to handle the clocks like done for the pre-audioreach firmwares.
>
> >
> > * Inline crypto fails to detect hwkm support. And I see other logs
> > online, such as for the sm8550 qrd, that logs the same way my device
> > does. I traced the issue to the check for wrapped key support [3]. On
> > my devices, the derive call is supported, but the other three calls
> > are not. I was pointed at the downstream headers for sm8550 support
> > and only derive is listed there, the other three don't appear to be
> > used in the downstream driver. Is this expected? And if so, will this
> > case be added to the mainline drivers?
>
> Does hwkm work with you remove the last 3 calls ?
>
> >
> > * Some gpu related clocks complain about being stuck off during boot,
> > causing stack traces, but the gpu does work. I tried to do some
> > research into this, but quickly got lost in the weeds and I have no
> > idea where to even look.
> > [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
> > [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
> > [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
> > [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
>
> This may be related with the display handoff from ABL, did you add the
> plat region to the reserved memories ?
>
> >
> > * Sometimes when starting rendering, a bandwidth submission times out,
> > then the driver immediately complains that said id was left on the
> > queue. I have tried increasing the timeout, but the same sequence
> > still happens. Timeout happens, immediately followed by a matching
> > unexpected response. Implying that this isn't actually a delay /
> > timeout issue.
> > [ 1848.517020] platform 3d6a000.gmu:
> > [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message
> > HFI_H2F_MSG_GX_BW_PERF_VOTE id 1015 timed out waiting for response
> > [ 1848.518020] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg [msm]]
> > *ERROR* Unexpected message id 1015 on the response queue
>
> Weird the timeout was extended for this very purpose
>
> >
> > * Some 3dmark benchmarks such as solar bay cause a gpu crash. I am
> > unsure if this is a kernel problem or userspace, so I'm submitting
> > here first. If the consensus is that it's a userspace issue, I'll
> > submit it to mesa.
> > [ 1860.112008] adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu
> > fault ring 2 fence a261 status 00EF0585 rb 06df/090f ib1
> > 00000001512E9000/003d ib2 00000001512E7000/0000
> > [ 1860.113122] msm_dpu ae01000.display-controller: [drm:recover_worker
> > [msm]] *ERROR* 67.5.10.1: hangcheck recover!
> > [ 1860.113238] msm_dpu ae01000.display-controller: [drm:recover_worker
> > [msm]] *ERROR* 67.5.10.1: offending task: Thread-23
> > (com.futuremark.dmandroid.application)
> > [ 1860.258126] revision: 0 (67.5.10.1)
> > [ 1860.258132] rb 0: fence:    2884/2884
> > [ 1860.258133] rptr:     36
> > [ 1860.258134] rb wptr:  36
> > [ 1860.258135] rb 1: fence:    -256/-256
> > [ 1860.258138] rptr:     0
> > [ 1860.258138] rb wptr:  0
> > [ 1860.258139] rb 2: fence:    41563/41569
> > [ 1860.258140] rptr:     1752
> > [ 1860.258140] rb wptr:  2319
> > [ 1860.258141] rb 3: fence:    -256/-256
> > [ 1860.258141] rptr:     0
> > [ 1860.258142] rb wptr:  0
> > [ 1860.258146] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_=
REG0: 0
> > [ 1860.258220] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_=
REG1: 0
> > [ 1860.258266] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > CP_SCRATCH_REG2: 41562
> > [ 1860.258310] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_=
REG3: 0
> > [ 1860.258354] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > CP_SCRATCH_REG4: 3736059565
> > [ 1860.258399] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > CP_SCRATCH_REG5: 3736059565
> > [ 1860.258443] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > CP_SCRATCH_REG6: 3736059565
> > [ 1860.258487] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > CP_SCRATCH_REG7: 3736059565
>
> @rob do you have any idea how to solve this crash on a740 ?

The clk and a6xx_hfi_wait_for_msg_interrupt errors indicate that
something is unhappy about gpu pm.  I'd focus on that first, since
that is almost certainly the cause of the later issues.  If things
_sorta_ work (rendering UI, etc) you could try removing all but the
lowest gpu OPP as an experiment.  Could be that power related problems
surface when the GPU ramps up to higher OPPs.

BR,
-R

> Neil
>
> >
> > Aaron
> >
> > [0] https://lore.kernel.org/all/91002189-9d9e-48a2-8424-c42705fed3f8@qu=
icinc.com/
> > [1] https://lore.kernel.org/all/20240424-ayn-odin2-initial-v1-7-e0aa05c=
991fd@gmail.com/
> > [2] https://lore.kernel.org/all/20251008-topic-sm8x50-next-hdk-i2s-v2-3=
-6b7d38d4ad5e@linaro.org/
> > [3] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tr=
ee/drivers/firmware/qcom/qcom_scm.c?h=3Dv6.18#n1285
>
>

