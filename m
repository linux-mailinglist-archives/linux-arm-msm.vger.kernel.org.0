Return-Path: <linux-arm-msm+bounces-43935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4162A01304
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 08:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6651164038
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 07:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F14C1990CD;
	Sat,  4 Jan 2025 07:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jsIvTbMh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3318C15443F
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jan 2025 07:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735976452; cv=none; b=pPSd5pwDaVpUCX1foH65qJFiR1kauIfZ7ywU3RFr+t7kk/ulT9d1u/AbVOAvazRk7G60ysXPXPfMxcsuR7vCGEOxq7awixX+WB4Sc62j5X6iIoaqtLnf0EhLO6OQoD7qdp3yiN2OorkdQtjI3nCP4MTfGo6fgIpxg4pxY/GF0a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735976452; c=relaxed/simple;
	bh=bD9cvYB/v3oIIfnzHpurWBx5Ah2yTSnPWPLyYvYKA5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qx/Nf96SlaVU5AOB+eW9mAAktdAIsEVLl1J8G5+l7Cx/VwOU/zPVIy3vPEoI2fxxe9eCpOfz78qY7O7ZL8D3mACR6UkywLFr24ZK0r9JqbHtf02GU/NlVvM/RZV+EwjMNKD3VrqS3AUu+VwJG4zUuYwmqnznATA/9mRopnHL+84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jsIvTbMh; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e3a227b82so12027803e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 23:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735976448; x=1736581248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q0MJI+9cycXeH9M/cbiVDnCLxbdncwNilXjR2G6v30w=;
        b=jsIvTbMhwR295lTi+1IRzd39Nk500bxX4gerufT3DwsOr8zAJUxOS5jIEMKc9LEzyf
         CaHxRPn5486HWAdqamITY2D+eyTpJsJnSGSFDdCVJFxz6VAo7colgB3qSkIGhqKZTfAP
         B2L/+2JG/0GK1PjvljAS26V3ptqqf/NL67OPxu2raQklduK6PtNy3rN4xrmxXAVe9FHx
         0SvwZR00gk8xT/A7uJ99lAy7jfvnL2LL8pDAixgGySft5N3mqYVagT4zmZU52J7mfWPM
         czzWYuTl6BtO4pwR66GQeu1a/yTE3YJfTfk6LdgBCWnL1oqopXk5xhx9WvCOZYFJJ/mA
         M+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976448; x=1736581248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0MJI+9cycXeH9M/cbiVDnCLxbdncwNilXjR2G6v30w=;
        b=cYNocNPKxPmaM8sL5sNZEmyhsRG/g+huG4BCglXMlHXifXNL5eBGzALX5mT/JiFFVl
         IBDZhG75BxUaKlbm+HWTd6J68WAmyrTZjMFtewmbKbohQCcYMGWlTQOzbSo+pOJO4edJ
         Tr99s3j02aJOhkr3ol3/w9ukrlrQnF4kzSbOATeyCe6TzI/RYXj4/lrQkUzl7AzXCwi2
         6ZS8qlu/3ij085VLgMyqAKBxcqLAFGeJZ7srRmhA/f5sdS7A6j4NKyqcfNBuHNP5SbJR
         1Tim7SXksRinDYIA+6h7fkmopp1mF1afzb/CZo38ivGqpdxWYEtNM8Q9vn5R/zgx4VsL
         rlDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmzxjXl+g9TZrm68mfpzGT0obMCBY2TWP+IuaCpLLk0gJZwuNBlYO62ak3BlrjWyo+y9b2fmDlL5sU/L//@vger.kernel.org
X-Gm-Message-State: AOJu0YzZs7REL+mKoUEZsIa4c/idTxXBXXV3/pnQUt4IWdqjBrQHGI7+
	QfAe0iGrGTWV98Sm/M5EgpV5wNDEoUfLxRYRqckmzT18Y9l5Ny+plgNfX0EoGzY=
X-Gm-Gg: ASbGncsAsIdIKPPlcz9lcy8eCSIcAGhcnppz2H52lYQIQZuYWWQGh59Q+ocamnno2k8
	08xcHqSPDKn35Z3/l+c/HydtC4cdnd1K6pHEKIiU21Ep0NMK6oi46B1HybozkQSJdPBmdJnd4/y
	yw5OiS4FqFBSJuiYFBOwHBN+tfCLIz2VM01jtcT3/SDB7JDpi3oKmdug+xRGpfSs72/jkyDaRdK
	65na3PaDKHy9i3BekYKuudWFRiWNEGlX4sjCaPYrqqgiumcBE2/Ei0nZqnx1KvMsa51yUPc3OVI
	/2vCguBS2FlSxFlmqUEPDAxFZffK1ZtnNKB3
X-Google-Smtp-Source: AGHT+IG2nq6H7xyAW1mQUxFpByooIqlCa8K7/I4EOHRJTtOWpXN9w4+x4cnSMygTfJ2Xc+WG1B3zTw==
X-Received: by 2002:a05:6512:4020:b0:540:1fcd:1d9d with SMTP id 2adb3069b0e04-5422956be5emr15365408e87.55.1735976448304;
        Fri, 03 Jan 2025 23:40:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832b79sm4396561e87.272.2025.01.03.23.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:47 -0800 (PST)
Date: Sat, 4 Jan 2025 09:40:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Naman Jain <quic_namajain@quicinc.com>
Subject: Re: [PATCH v2 1/2] nvmem: qfprom: Ensure access to qfprom is word
 aligned
Message-ID: <4ajn23p7tbc2csspcfodl3keavl57luuvnnux3dbdhyn7d57ji@ypptsltflwtn>
References: <20241027-sar2130p-nvmem-v2-0-743c1271bf2d@linaro.org>
 <20241027-sar2130p-nvmem-v2-1-743c1271bf2d@linaro.org>
 <60068361-ddb7-4906-84ca-195e5eb13a0f@linaro.org>
 <plemc4swba7ybrncyxt3axxpb3qjbdktfkt7kqt3dqymlusfpq@sfgwakjp7z3g>
 <7924984d-57e9-40f8-8998-b37d6e1bc78c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7924984d-57e9-40f8-8998-b37d6e1bc78c@quicinc.com>

On Mon, Dec 30, 2024 at 01:13:08PM +0530, Akhil P Oommen wrote:
> On 12/9/2024 4:23 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 09, 2024 at 09:55:14AM +0000, Srinivas Kandagatla wrote:
> >>
> >>
> >> On 26/10/2024 23:42, Dmitry Baryshkov wrote:
> >>> From: Naman Jain <quic_namajain@quicinc.com>
> >>>
> >>> Add logic for alignment of address for reading in qfprom driver to avoid
> >>> NOC error issues due to unaligned access. The problem manifests on the
> >>> SAR2130P platform, but in msm-5.x kernels the fix is applied
> >>
> >> Is this only issue with SAR2130P?
> 
> This is applicable to all chipsets with sys arch newer than Snapdragon 8
> Gen 1.
> 
> > 
> > I don't know. I know that it manifests on SAR2130P, but in the vendor
> > kernels the fix is applied to all the platforms.
> > 
> >>
> >>> uncoditionally. Follow this approach and uncoditionally perform aligned
> >>> reads.
> >>
> >> If there is a need of having proper register alignment this should go as
> >> part of the nvmem_config->stride and word_size configuration and not in
> >> reg_read callbacks.
> > 
> > Thanks, I'll explore that option. Indeed, it might be easier to handle.
> 
> Dmitry, any update here? I need similar change for X1E GPU speedbin support.

Excuse me for the delay, I've sent v3, reworking the series as
requested:

https://lore.kernel.org/linux-arm-msm/20250104-sar2130p-nvmem-v3-0-a94e0b7de2fa@linaro.org/

-- 
With best wishes
Dmitry

