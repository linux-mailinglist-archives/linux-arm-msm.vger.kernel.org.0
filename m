Return-Path: <linux-arm-msm+bounces-99515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG1+I4v0wWmmYQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:18:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1715301143
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C754301E3F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A874637DE85;
	Tue, 24 Mar 2026 02:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b="MHkybLtX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E2437CD3B
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318191; cv=none; b=XoJ83wnHhcIF5NPG2rL6Lmo4srgJ1fVbQARwGLkk1KftDN5LKOM4vbYmQaNMEZ0ESqvMWoAdHu7JxiM6yNH0Q2vVRkLx6EgsBJPiWRPy0FZH17bjDCGfubgmI7WY5mVXimouv6uOaIhe3vl7V75mjkw/yrVhMD2kN5LevnTT7DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318191; c=relaxed/simple;
	bh=37vPBBAzTZ3/lo9gvOGeuopFoiWJS0MKCuHWiza282c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cjkfa91qD7q8XsbNNhWEVuBvKBXuV6ky8J2Wn3U9bk+3VTi5dE0e4JDAphktK2eVVl641CuMcuryx7v0TXii/uzTye5NWS3U60T0KfE1fi1VeBrZoH2ayY6buc+29VYg9qQZjWdqi/SSJGgkhZdV9DueW6pBRQRGdzXtPJ9jbyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org; spf=pass smtp.mailfrom=me.ssier.org; dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b=MHkybLtX; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.ssier.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cb40149037so522712685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1774318189; x=1774922989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5ZJoTMOV2ASUMfnuWTwy6IQmOeUZviHlyu/QYJ4be0=;
        b=MHkybLtXVRRLGzpOSeBqelcAdO3Pzem+zCiOVSWVeqcSeubTOBGeFw2uuV88w4FB0U
         0kr0AV6D8OMLFejDNwtbT0mH6MYBgBvw3GShgagKRcf+SI30sXIkQzGNAi55yo9fms8Z
         RU459C6RzoZ4Rw/ZCv1YerYd1chNjYI1Bnr5fW1WNSo8Gxqrox1p15Gk5sxyS3G9LYbk
         7qlXf1cwpgPuKQ6ldF1CzidtzAdrBqNQAmrZmC/rSUg3oFQJDMGgq0+x7sHsC4TrmNUi
         ByOYlT/yZSk/w/DZ0clpknczd5ZcdqJyfAiqnoYD8B3ah+kVtFfPZtfQFL7yCIur+0y+
         rR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774318189; x=1774922989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5ZJoTMOV2ASUMfnuWTwy6IQmOeUZviHlyu/QYJ4be0=;
        b=IERf4h+3gvDLy/3qtKVmVV37teueqZ/STD9aJpaK1Hfx5i5vpvS0qU+lcQNAGyyucT
         Xy/XI9Bi03lUj7rPZgwxt1qVpl35ZxQ0StAHciD6KgUFLwBVgKgUjnoBJydtgyQ2xgPS
         GJfUgeovPvdUmjnXQhmouFGUrDbUgF15Q9Tgg9RjKP1nTz4KSkBxMB5Cn7GhmSJcC6v5
         M+MjSNwO+keoc1weF7dQDUo3L0yc/4Zd6JvsRezOnzsz3OjVs/CNYxY31UXH3zeeTiVN
         V1Z254/gyptKFe0+lMmR7F8v8e8Y1T0ZPmLRmp6CbixXnPNqVokBdbdnRnazyHB/0AIB
         Udxw==
X-Gm-Message-State: AOJu0YxoeLHijaCxGiXxhwuMBDqlwP6g1Lm6dSMmrh7QWk7sdOVs05XN
	wRP50uzsWg2wPZ2bXZI8GweI72venmgcp5LFtqFHaamdPRhYUxwy+s+Gtzw53ZHY8DM=
X-Gm-Gg: ATEYQzwZU2MmCg7G5rV+u5YwQAr/wCnomwvUFAflD/sNUW4hSvawlhYq+PtYxgWz+CS
	ww+oUzSDFrVltqDi75RQaUNGBP+x4d3aJWKV1x5BQQzhlzX2/CIfeDUdoKLLy3yqxk6o+XFi+qm
	nsi1IiH+H/TcXmvioz5BoOBsxsmjBAkg0r8d8afxcZ69hK+gkCN/3pJLpC/9G29kfbMu4Ji+33i
	W/tr36WO0O5cwfMYa/KrSXZovlk+9heyD0HHNPqGlWA6S8pMvfI30SmUMCP8Jsi4Ur/RQSpBXO6
	xLWeFh7U+A22QpdHT6on+FpfHBtmon9im3K6XNaxrXjuekZzRWE9B1uFqdqiN7ZppuHQGnPbJLX
	VFwksRVFh0xZYKUgrmwKBuVEtYJkrib8YFUt0Vzq/5UkPw/q7nZPPw73IrIHj4pqIGlcaNU7/QJ
	DTLzHhTx33nD4SRLrcjU+qMx1HdSX86MU=
X-Received: by 2002:a05:620a:1987:b0:8cf:bd15:b537 with SMTP id af79cd13be357-8cfc80bbb08mr2160211785a.60.1774318188297;
        Mon, 23 Mar 2026 19:09:48 -0700 (PDT)
Received: from [192.168.2.8] ([74.14.125.72])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8f5f979sm895014685a.6.2026.03.23.19.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 19:09:47 -0700 (PDT)
Message-ID: <b09a51bf-26b8-4c88-ab23-c92ddc1fb801@me.ssier.org>
Date: Mon, 23 Mar 2026 22:09:35 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] interconnect: qcom: let MSM8974 interconnect work
 again
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
Content-Language: en-US
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[me-ssier-org.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99515-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[ssier.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[me-ssier-org.20230601.gappssmtp.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@me.ssier.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,me-ssier-org.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,me.ssier.org:mid,ssier.org:email]
X-Rspamd-Queue-Id: F1715301143
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-23 20:10, Dmitry Baryshkov wrote:
> Commit d6edc31f3a68 ("clk: qcom: smd-rpm: Separate out interconnect bus
> clocks") moved control over several RPM resources from the clk-smd-rpm
> driver to the icc-rpm.c interconnect helpers. Most of the platforms were
> fixed before that commit or shortly after. However the MSM8974 was left
> as a foster child in broken state. Fix the loose ends and reenable
> interconnects on that platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Swapped order of clocks and clock-names properties (Konrad)
> - Corrected the ocmem comment regarding core clock (Konrad)
> - Link to v1: https://lore.kernel.org/r/20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com
> 
> ---
> Dmitry Baryshkov (9):
>       dt-bindings: interconnect: qcom,msm8974: drop bus clocks
>       dt-bindings: interconnect: qcom,msm8974: use qcom,rpm-common
>       interconnect: qcom: drop unused is_on flag
>       interconnect: qcom: icc-rpm: allow overwriting get_bw callback
>       interconnect: qcom: define OCMEM bus resource
>       interconnect: qcom: let platforms declare their bugginess
>       interconnect: qcom: msm8974: switch to the main icc-rpm driver
>       interconnect: qcom: msm8974: expand DEFINE_QNODE macros
>       ARM: dts: qcom: msm8974: Drop RPM bus clocks
> 
>  .../bindings/interconnect/qcom,msm8974.yaml        |   28 +-
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |   21 +-
>  drivers/interconnect/qcom/icc-rpm-clocks.c         |    6 +
>  drivers/interconnect/qcom/icc-rpm.c                |   18 +-
>  drivers/interconnect/qcom/icc-rpm.h                |    7 +-
>  drivers/interconnect/qcom/msm8974.c                | 1637 +++++++++++++++-----
>  6 files changed, 1274 insertions(+), 443 deletions(-)
> ---
> base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
> change-id: 20260322-msm8974-icc-0ac4c28e139a
> 
> Best regards,
> --  
> With best wishes
> Dmitry
> 
> 

Tried this patch series on top of 7.0-rc5, using "htc,m8", and can confirm the device boots properly now!

I do see these messages in the kernel log now:

[    0.692540] ocmem fdd00000.sram: error -ENOENT: Unable to get core clock
[    0.692582] ocmem fdd00000.sram: probe with driver ocmem failed with error -2
[   24.173125] mmcc-msm8974 fd8c0000.clock-controller: sync_state() pending due to fdd00000.sram

I do not know if that error was expected or not.

In any case:

Tested-by: Alexandre Messier <alex@me.ssier.org>

