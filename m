Return-Path: <linux-arm-msm+bounces-45846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 013D8A1974A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 18:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 474D4164058
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 17:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148EF2153C7;
	Wed, 22 Jan 2025 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJq9EUbp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5E621519A;
	Wed, 22 Jan 2025 17:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737566142; cv=none; b=lAuKe3kuQh7JydJnC7lO+z24M6LrzfDO0ROVvs9E5coJMEXLSxYoNub1fmTDQZvf9/0pDP+QL8GO4+jEmzgLYNNMcCDRzeKVUp/7sYQ6XijFxnCOFO0XGectvA2TXC4wuhY+pmpUx3/lWPPhVMCRDi/VsDsaqnImCKpAWyue7Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737566142; c=relaxed/simple;
	bh=KkN9daKbuUc1+GsKlJnpGBGFVZ7lUsrr5xe1tqv9bsM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RD9iAX5QaXRkx0JpI6BgF7/0Tp0yv0ejowW39KFM1D5MkqVrMaUnv8X8jryV9O5KZIPOr68Huo4UtjgjDwaA/pAYclixl0J8L9PM6Fy+y8YMeihxlsts5B/9HYWW31ek71AH9d16oTsHwJZ9JhXD7mfPTSQEGBj/kSfwC1WCQ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJq9EUbp; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so14353a12.2;
        Wed, 22 Jan 2025 09:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737566138; x=1738170938; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KkN9daKbuUc1+GsKlJnpGBGFVZ7lUsrr5xe1tqv9bsM=;
        b=HJq9EUbpsuJDlG4bCPv789mTy9QCNbtTfk/dRiMCc57twJALpvVQTydv+Pms9VL+/9
         rgxUPGyxtodsScNhwquPuAIcno7Ft8eqlJU330s6gn/AXCLQ5YgOGp1kITbjedj3kJKO
         SDpZfFanuxmU3ctFo2uIETOPGIPEBf9Q1KHJXqFmnwMp6voIj7zkljigZ4LWVYwSzXvE
         MZuLm4wABdTLndfWVNJD8n1xDjM2e2bMpPkqQ3ib3h9gIUIcoM1xoM7RSg3iUceQMYgt
         Wa50TQoYYsGaR0PImNN8s9gxA7opDJAhdYA1utU+ehYcg+8oNUOle1KPlMLnGEosQ64Q
         wtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737566138; x=1738170938;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KkN9daKbuUc1+GsKlJnpGBGFVZ7lUsrr5xe1tqv9bsM=;
        b=MJNrFWj7/1IKHj5W4BJrtyVtMTwDeg8SvOdcMPKXUIbH8wVFmeVvaPr+atNsSd5WEg
         /PEAbRzntfXik/TjQuxdgX5kCVA7232dxiniS5A22rxu/vBCj/wHwls05fMJABWOr/rN
         m6Q/uY/XAkH6xZrUlVDec+Btu1Wv29vBXXwFqOeh23I2PLt4F9bpwizvORfT/2Xhm15g
         7EK10OKxgTO+0eld6eASWdX1x+eK9c22uoUEFgjTvKlP4E8nGLqs6KLqgS8M3SWKkTDW
         fgBaSHkRur9UE85wRMXfdHqoJd7qHttW+5RllOFjiORhK62SMdsjhM/ZYOySXyP2KZMD
         134A==
X-Forwarded-Encrypted: i=1; AJvYcCVOndgzhEGMnZPypfDNaktwEvqb0ZX3PO47cjaWybWlJQCK13MXq4x6E5yJ/IFghSAqBz9kq1g4RIlBFw==@vger.kernel.org, AJvYcCXlDKH6ZD5Sk0xTJQhrcqYFWzuATvjvtVxpDm8NcharNxCO3+xOgE+oyXZjVN9Dmos7KVL1H1hYiveWY0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCDg8kGpjZzUbn2kIy02J53CUIFbdMnxvjmDHL+M04Bi4Q9z0y
	4TyAbWGPre+rhzm5PoTfMemQfHQtMu+CQWxl3pNqLIYQijJXBHAAIEeeEKs/
X-Gm-Gg: ASbGncuOMBqT07VVDqboQkJ9tnZEObadZuqUFAmTyQYGx4scjvaGwkKBrnt41azt66I
	dekiYTI/rNdEcN/jbrzHRJ1IBBj0j8JLJvgauDXR5mrpUIN8Rq2EDZJWW99E1AHBf/4v2KM+ib/
	WAfakH/OrVo3Ixr3oRlGkQZSJCkyryXkHqDiQctV7iHrT9dS5oplG5keYSJu590FkpKsMdf8Qkn
	rnEMHaJAEOGqXNoGjRtrcMxVMhaSTWS2nmLuBUpClaUDXfP+zGvHfG55spZhebNztrxzher
X-Google-Smtp-Source: AGHT+IEtevUasV7FNB4JV0ofXcZajBLqvPNQWI+xjkStd9b1z2sG00ozPct25cjJHy3Y9rdYzgjoiw==
X-Received: by 2002:a05:6402:2682:b0:5db:f83c:2473 with SMTP id 4fb4d7f45d1cf-5dbf83c26bdmr2775424a12.30.1737566138333;
        Wed, 22 Jan 2025 09:15:38 -0800 (PST)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73670fb5sm9098585a12.25.2025.01.22.09.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 09:15:37 -0800 (PST)
Message-ID: <af547b5494799fc58b14f00cbdefea0306d04764.camel@gmail.com>
Subject: Re: [PATCH v2 4/8] scsi: ufs: qcom: Implement the
 freq_to_gear_speed() vops
From: Bean Huo <huobean@gmail.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com, 
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com,  junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com,  quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Manivannan
	Sadhasivam <manivannan.sadhasivam@linaro.org>, "James E.J. Bottomley"
	 <James.Bottomley@HansenPartnership.com>, open list
	 <linux-kernel@vger.kernel.org>
Date: Wed, 22 Jan 2025 18:15:36 +0100
In-Reply-To: <20250122100214.489749-5-quic_ziqichen@quicinc.com>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
	 <20250122100214.489749-5-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-01-22 at 18:02 +0800, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
>=20
> Implement the freq_to_gear_speed() vops to map the unipro core clock
> frequency to the corresponding maximum supported gear speed.
>=20
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>


Reviewed-by: Bean Huo <beanhuo@micron.com>

