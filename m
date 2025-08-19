Return-Path: <linux-arm-msm+bounces-69745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0357B2C099
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 13:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD0E516551A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB76C32A3EF;
	Tue, 19 Aug 2025 11:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXS3rCCK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D2D2749C6;
	Tue, 19 Aug 2025 11:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603173; cv=none; b=vAkx9EAAkuPmJ/y7f4nr/GzTcw1SzzPxYyURr9OD3cSExZq2G2ogHQfwO33vw4GU9AuvpMvvIh7+PceB4+jk+SmZ7+pVZWG7/eVsarJOlQq5s3jWkYqGN7ZCv2uwFUeH/HgkIMSCZSCoIbIEY8rdZ2klpHSbLXmfukpmEsIfhWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603173; c=relaxed/simple;
	bh=PtASh1h1eP/dh2IkO9qTA2+mWJHclI14Nu3V/MvcF84=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jp2jT+CH8xAGSgoxBzQGzP9nD0s7n2Gx15IWJBPEoWMkY/YXEYrBHP7fvsGyDSE4mrNwEg1T0O31k+wb8khqB06iGiZUww2JD3UfuMGkMhtf+1Nd6+hRVEhg6RMz8ngwRdq1KpzaegABMguzI198PdoG54hMCkSui2gJCi690pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXS3rCCK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC7DC4CEF1;
	Tue, 19 Aug 2025 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755603173;
	bh=PtASh1h1eP/dh2IkO9qTA2+mWJHclI14Nu3V/MvcF84=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LXS3rCCKbwt3OD0P7ZZGB1LE5mAkf3+y1mROHdJBCk5JeOEgkuX0rdIFzf9oDGpYJ
	 F1SHho73LliB6MP7DNo/2Nn3cFOpa5RjC0MDKr8pzxVAJcTKgg3TFuHPWxr2i/Ys4j
	 kvm6uIE6TgnrMDTqg6G3IMWGw6X/9Ntmz3x50XuXDyEVuSuPJiHwgi/T5bZkdYdHD+
	 4Nam+kDThMsDaJbqzBmhWpSX8cZ8Zw37BwKcZZKxP20PcC0YwsxOPSJWUsHiRtVU5Z
	 K3QtgbTGlZlhGWgvQuFg5CJPaa98bsSq/c0ZskiivM/1Grmz3XGXHCaqnBKeYn1v0o
	 2Iy4XRSNIrmTg==
From: Srinivas Kandagatla <srini@kernel.org>
To: amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
 arnd@arndb.de, gregkh@linuxfoundation.org, Ling Xu <quic_lxu5@quicinc.com>
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250813030638.1075-1-quic_lxu5@quicinc.com>
References: <20250813030638.1075-1-quic_lxu5@quicinc.com>
Subject: Re: (subset) [PATCH v10 0/5] Add support for gdsp remoteproc on
 lemans
Message-Id: <175560317029.1303764.11181128542690408473.b4-ty@kernel.org>
Date: Tue, 19 Aug 2025 12:32:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 13 Aug 2025 08:36:33 +0530, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GDSP remoteprocs. GDSP is General Purpose
> DSP where tasks can be offloaded. Add fastrpc nodes and task offload
> support for GDSP. Also strict domain IDs for domain.
> Patch [v9]: https://lore.kernel.org/linux-arm-msm/20250716132836.1008119-1-quic_lxu5@quicinc.com/
> 
> Changes in v10:
>   - Rebase patch because the file is renamed to lemans.dtsi.
> Changes in v9:
>   - Change the patches order.
> Changes in v8:
>   - Split patch.
> Changes in v7:
>   - Edit commit message.
> Changes in v6:
>   - Edit commit message.
>   - Remove unused definition.
> Changes in v5:
>   - Edit commit message and add sapce before comment end.
>   - Move domain definitions back to driver.
> Changes in v4:
>   - Split patch and change to common syntax.
> Changes in v3:
>   - Restrict domain IDs to represent a domain.
> Changes in v2:
>   - Add GPDSP labels in dt-bindings.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: misc: qcom,fastrpc: Add GDSP label
      commit: 256b7e7d77e107b1fabce481b77b0020091315ec
[3/5] misc: fastrpc: Remove kernel-side domain checks from capability ioctl
      commit: 0765171ec418d4f0d4e022568bea8e9c7756ef28
[4/5] misc: fastrpc: Cleanup the domain names
      commit: 600c965d016466dcf4564bc8b118441d2eef0482
[5/5] misc: fastrpc: add support for gdsp remoteproc
      commit: b52ebc078bb6785666cd0396e088907882df80fa

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


