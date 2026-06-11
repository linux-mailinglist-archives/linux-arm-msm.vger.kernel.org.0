Return-Path: <linux-arm-msm+bounces-112670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3qKWDs97KmoLqwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:11:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A69DE670459
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:11:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=QhS9STeM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112670-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112670-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 704DE302DFBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6508B3A257C;
	Thu, 11 Jun 2026 09:10:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CE137B400
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:10:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169031; cv=none; b=l14FIe6nlSzj7XLxOrOgtBUloVo/Dw2OH7fiwis3yDIBoWyo7f8QN1RiyiaW87feUfM5CVE0dfct+k8fDwWAbFovM8UGtlTAOcBGBmv7rnH/TojGWHKsF+Ncp+jrPZ6jU2FU2NtymxaEPKTAmyaoRPzmOkreHjUCID/2o/LSwc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169031; c=relaxed/simple;
	bh=j4eAY2w32SKbEshmvsYmWzB3GI+jB07TxlyNvC942Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzEbQ6koEBiIHVFo6i6mFDaDxqVPxjhGWLUdgPJ1bmpHnPgBBZr94emTIE4crp0WLjvbOg9FGzEVfJAmCInU/Dp2o8AnR9du9lBRgpk/QP/vNXTAtn/h053QF+nXSvSC7jVOtMKAz+0DQJvhvsaIw2SYxsSFRHpY46n0soFcKsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QhS9STeM; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b613a17bso75188855e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781169028; x=1781773828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9rWlq4as1LWNFg509PkNNd1MIv6uha19xNkTO/t/tj0=;
        b=QhS9STeMaKgyQFeshDyAKCmjg2vUqzTDFdR3+d9RzDY9eQsoTqzBe6JisJt5NARLMj
         DJf0/ebGlckLWWqXgbe8IRm5sflARdeJHtz0uYyWFNlJlfgc+khz8vzCkGWOmQjyHu29
         SDodJnARar8AUsU3x5QySz3pJ2ov6PBJ6rkbxJvLTTpmB+zqfO9F8wd701CnwHwtVWL9
         qzWcmtMJt69R9e75NkjvFstsQGJeCl57EFsxlY+76YwTAVQd9CwGdeNIIdOKS46y5sE1
         hFhqDBftcBOQxplx2LM0TzGWKnGPb3RLA2nejnZ+GNLYSGSE42bGJvV+Gk4crYthxzRh
         W7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169028; x=1781773828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rWlq4as1LWNFg509PkNNd1MIv6uha19xNkTO/t/tj0=;
        b=gbdhOaiaTFii6h92LZK3ri9uxwLZumE2tjP+ZZuvp49qSbvm45XPez2aXQpY4CRAAl
         OyuB/OBXB/i+hZtP1H8ZZ8brJKQPt3c64LcESkgGRN4w3j+kpqURtFpJ1n25AIOg/vDI
         J+b2/ceQYNzSHwrwxu/dusvX6dGCgdodmpzGxH1jeEIdN5PIuLPbsdw5wDTj2xzEzpFI
         y0TsNxtVTWVJP5Kkk/iLtVR6tr4W53tBMb7XsXHiO0BE1cUDlA/QWMoUH/y5UO5RmCJ1
         jAhziL84vHfW2k/9MaTP8vTJZNRd9qRnWcxB+sJwa7b6UsZxMdj+vc6XqvwEtGqkR3Nn
         0YbA==
X-Forwarded-Encrypted: i=1; AFNElJ+JaN/Q2FdXVT99DAd+/sN8XqI2ErDhkQLrnygYfpMZXgWJ07PDW7hLynroDiDE3WWxCp8x14SgO2WdNowO@vger.kernel.org
X-Gm-Message-State: AOJu0YxRTvAJbox4JdI8LMzjsEUzl2BSzgbYVgevfZ5TEhaWRQasSM1E
	M++Z+U0YlyrY+IbSCKYBlUb67Wzdko9dSLeWrRphH9L+1+R9IKK1LIb1d/EhB9vXxj8=
X-Gm-Gg: Acq92OG9hL0Yin/nvQ6n9dXjJaDmwuD2vALfACJUD6ND5O9XSvfonm7eYg+TadUFHup
	SmtOsPMs8oEl+Rn4/gqFeQ/Nj02pTGw79N5lBHwj6Yp4jja5q0P58U0xY8XV3MzJaltuUvXZTSV
	VinIgFXz0BDT1R/oH5FAfxbJLQRpfXJfwBBMD31w1Z8XOdi7Sx+xnqqDeHAD6ey/k31tsjQkBSc
	RiGwfozADO1nRkc3quQusrLkcJGBzUzjRjHA/L2SAlfQw9RHjBK7k92VRfiLpUMzCuvh0G7Snnc
	f2tZLAAF3wEg8nlcIkuHQxQ/oQCIyAylM0aS43+GAcQIhdZcMq+SYGx8qaGZF5K+rS+MJa2I1ul
	kIfZZnWXu1RVQTr4sDYSNYPf0S+MEXErT1e6Yf/nkKCuUcpY8mcfu7PUNl2hd80f7ttrNIZjSEW
	Q3sobnitKs0xre344510fVEsk3JZHM4La6QjOQ3oFClc+hXA==
X-Received: by 2002:a05:600d:6414:20b0:490:ce99:d2ee with SMTP id 5b1f17b1804b1-490e55e962cmr16950155e9.15.1781169027922;
        Thu, 11 Jun 2026 02:10:27 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:7bb1:6476:9114:cf39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e52ac9aasm33929275e9.4.2026.06.11.02.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:10:26 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:10:21 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	shengchao.guo@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <aip7feoTn0ncwzL7@linaro.org>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <ahBG6jKYdSAboWjs@linaro.org>
 <6df4c351-7287-4fb9-8af8-83b5deabfa07@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6df4c351-7287-4fb9-8af8-83b5deabfa07@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112670-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:aiqun.yu@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gokul.krishnakumar@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A69DE670459

On Thu, Jun 11, 2026 at 11:10:25AM +0800, Aiqun(Maria) Yu wrote:
> On 5/22/2026 8:07 PM, Stephan Gerhold wrote:
> > On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
> >> Subsystems can be brought out of reset by entities such as bootloaders.
> >> As the irq enablement could be later than subsystem bring up, the state
> >> of subsystem should be checked by reading SMP2P bits.
> >>
> >> A new qcom_pas_attach() function is introduced. if a crash state is
> >> detected for the subsystem, rproc_report_crash() is called. If the ready
> >> state is detected, it will be marked as "attached", otherwise it could
> >> be the early boot feature is not supported by other entities. In this
> >> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
> >> can load the firmware and start the remoteproc.
> >>
> >> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> >> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > 
> > Unfortunately, removing the ping-pong functionality that was present in
> > previous patch versions makes the whole mechanism a lot more fragile.
> > I'm not entirely sure if this has changed in SMP2P v2 or more recent
> > firmware versions, but in my experience the SMP2P "ready" bit does not
> > tell you if the remoteproc is actually running. The problem is that the
> > "ready" bit is asserted by the remoteproc when the firmware is ready,
> > but it is not cleared when you shutdown or forcibly stop the remoteproc.
> > 
> > If this is still the case, you can easily reproduce that with the
> > following test:
> > 
> >  1. Start the system as usual and let it attach the remoteproc
> >  2. Manually stop the remoteproc in sysfs (echo stop > state)
> >  3. modprobe -r qcom_q6v5_pas
> >  4. modprobe qcom_q6v5_pas
> >  5. If the "ready" bit is still set, the driver will try attaching the
> >     remoteproc, but it's actually not running. No recovery will happen.
> > 
> > In this situation, it is very difficult to detect the correct remoteproc
> > state without relying on an additional query mechanism like the
> > ping-pong feature.
> 
> This a valid use case and concern. We had a discussion with Bjorn, and
> want to take this scenario into consideration of the separate robustness
> improvement series[1].
> Stephan could you agree to have the basic function in this series can be
> go in firstly.
> 
> [1]
> https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/
> 
> > 
> > You can make it a bit more reliable if you also check the status of the
> > "stop-ack" bit. This would tell you if the remoteproc was cleanly
> > stopped with the SMP2P "stop" mechanism. However, that will typically
> > still not fix the case above since nowadays remoteprocs are typically
> > stopped via the QMI qcom_sysmon and the "stop-ack" is not set in that
> > case. I believe this might set the separate "shutdown-ack" bit though
> > that is described for some SoCs, I never finished testing that.
> > 
> > And even if you check both "stop-ack" and "shutdown-ack", that doesn't
> > tell you if the remoteproc was forcibly killed using
> > qcom_scm_pas_shutdown() without gracefully stopping it first. The ideal
> > solution would be querying the PAS API to tell us if the remoteproc is
> > actively running, but the last time I checked I was unfortunately not
> > able to find a documented call that would tell us that.
> 
> It is a state currently kernel don't know whether the remoteproc is
> offline or crashed when ready==1 && error==0 && ping-pong==0 scenario.
> If it is re-modprob, the software don't have any data and only the
> firmware can tell us whether if it is active or not per my understanding.
> 
> Maybe let's have this scenario and solution discussion in the other
> series I mentioned before.
> 

If you add a new feature upstream, you must make sure that it is
reasonably robust and reliable. The other series is about generic
limitations in the remoteproc subsystem, so I don't think you should
move QC-specific parts over there as well (personally, I would have
probably kept all of it in one series to make it easier to understand,
but that's subjective).

With the current firmware design, it's hard - probably impossible - to
make the status detection perfectably reliable. I would therefore choose
some reasonable compromise to start with. Given that Shawn (and actually
me as well) would like to have attach working without firmware support
for the ping-pong functionality, I think it would be reasonable to start
with the basic detection scheme discussed above, i.e.

  ready==1 && handover==1 && fatal==0 && stop-ack==0 && shutdown-ack==0

The ping-pong functionality could be added later for platforms that
support it. It would be good to have the interrupts already defined in
the device tree, so you can tweak the driver without making DT changes
later.

Thanks,
Stephan

