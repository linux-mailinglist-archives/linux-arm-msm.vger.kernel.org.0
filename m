Return-Path: <linux-arm-msm+bounces-33372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99952992D28
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBEAF1C22952
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1843F1D4329;
	Mon,  7 Oct 2024 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="CBlQuJCg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0101D417D
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 13:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728307351; cv=none; b=YvfYGdmCOUNohFdP8bILaStD2bSz6E4rQ6wgqRL+1k2cWJoxUmmkmKd3Y63lW41Nx4WG+qkhZnuMqEuHBxbgVxSUhdCqRNP6Bt8dJXPlRakLTTnxbXdGg9FpI2aXmdLz6Op8YF9qAatbcR+lqqgQ9GcHHnx9JX6voEh+dJ+Sokw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728307351; c=relaxed/simple;
	bh=utVWN3iWLARwJ1w0i0Zp3uRtKoFb2xnAD8O1rUjwFLA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=dFKI/MJD2yVOnkX5r5A3KO9Noa2uM3fciQ7c8/vt1Kzh9p/Wj76yx3CsCyvIrvhpogxbrs+DFbCVKp1Kc2kFZHovX0hbndhpOWdJ4DPFGuN3b5fBc185heKO1GFo56VEItEHSGZTpYzpCJMij7hkPARaKYp9NDIZyXc5fhtBWno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=CBlQuJCg; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-45821eb62daso28814911cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 06:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728307348; x=1728912148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stNX0CPH5IvIaCsbaIGRjS0lIiZFwjIZE9dikF6mqJU=;
        b=CBlQuJCgoIqXQwqIE3Q6kHy/rsNpxiwE92FriDw+xmkr0N4vSCRQdh0n6chS4ctSQZ
         w5S368IT80ohFd3PgPTP2b2VvGEBZGleQ8o4B+a0pGj/qfSMd1qCmGUCxcI4yFeApt34
         OkdwSP3YAGMLvoVOEgaWB3KJh/W8ABgOFvZHoy+t/upyfwzmtRhKRCM+YHD20/IuT6Sl
         amxmExr3ynLg8nxw8kXYxx0Px/USvwot1R02OdHfZg50mFcwdREzx5bmDrNoNCpDbgxH
         YbRRFi2cSHog2uNU5MFdzQljFQnBfFK36DtfGnz2NlPzLFANiMmIcpMI7M0SY7+PbprO
         ce6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728307348; x=1728912148;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=stNX0CPH5IvIaCsbaIGRjS0lIiZFwjIZE9dikF6mqJU=;
        b=a6gdq9MbE+mKnmZ0iMit4+MxZlQxFhxfhtQyIkuB0XFeoeMTZSRMLoMj8LEgdlVO2S
         mLIQtw0IXjB4tL+pFaLneHQuEU+A/wm8PoVpDOxpqczF1ACCcFClvSvbUfE5sRAv46BN
         75SnkzStsM0e9ekoGJUaRRx/wat6LfJL0E5QGK5pCVmSk2HSxMb4Z3Ci1V4yscN0UvHK
         qXBUn6t5rRqaTFbXPbI/FR+KjT9bYeAh64RKXptaDGowmvxAXNpZow+LOmunh6xm7GWk
         EoIZ0lOD5xPVE5ivW+dwJ3jA8KRzpZcTakgyuf+RNi6NkSRWniKi7dTPL8D3DfmY1Kh2
         Jfmg==
X-Gm-Message-State: AOJu0YwCousSMEOxGhGpCXk5BFp9omQ+1UlUlocucjjOsoY2LHuAOnCe
	0JG3hq5RwTnp9VPZvitena+eZ3HPx/NtOcAyuPxQWQi2Wrt8QWe+cAPMkvYzZeY=
X-Google-Smtp-Source: AGHT+IGm5KDXGgiekH3egpesPDNg8awpzbf4iyWtuNkaFmOHJ2mn6HP4vwirEz7pnWjezESexrXL3A==
X-Received: by 2002:ac8:5715:0:b0:458:401e:c1f2 with SMTP id d75a77b69052e-45d9ba69ca5mr143491341cf.31.1728307348099;
        Mon, 07 Oct 2024 06:22:28 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45da755647asm26379781cf.41.2024.10.07.06.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 06:22:27 -0700 (PDT)
Subject: Re: [PATCH] rpmsg: glink: use only lower 16-bits of param2 for
 CMD_OPEN name length
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Arun Kumar Neelakantam <quic_aneela@quicinc.com>,
 "open list:REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20241007044723.25347-1-jonathan@marek.ca>
 <rmybaobbmhmynz3or4uwvhdgqjrkahmkwz5ncct6rssnfpq4jh@ulqeqesixyhz>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <8b050bcb-640d-4443-ca31-787ec5c02a7d@marek.ca>
Date: Mon, 7 Oct 2024 09:19:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <rmybaobbmhmynz3or4uwvhdgqjrkahmkwz5ncct6rssnfpq4jh@ulqeqesixyhz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/7/24 9:16 AM, Dmitry Baryshkov wrote:
> On Mon, Oct 07, 2024 at 12:47:22AM GMT, Jonathan Marek wrote:
>> The name len field of the CMD_OPEN packet is only 16-bits and the upper
>> 16-bits of "param2" are a different field, which can be nonzero in certain
>> situations, and CMD_OPEN packets can be unexpectedly dropped because of
>> this.
> 
> Any idea about the upper 16 bits? Should we care about that data too?
> 

Its a "prio" value, it should be OK to ignore it.

