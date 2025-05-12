Return-Path: <linux-arm-msm+bounces-57594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 888EEAB328E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 11:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00CA3189C8E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 09:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFDE266B55;
	Mon, 12 May 2025 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyhxcAIb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEF1265CA3;
	Mon, 12 May 2025 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747040270; cv=none; b=K9LUe784lE1JUi/1MxajK36p4/onoQFHVHmkuL+RUSVUH6lOhItMY3DRvpsNEH829azO2zEc6FbJN4PruIkBpmBEDlYHY1QUOBZU9d4ldVNQngfnFh7L9GIQukgXehSp32gmSlxYsYppFPEOZsdCnK+scVSxBGo5ko9Xce1hgmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747040270; c=relaxed/simple;
	bh=qCiOc2lGEPA6wS0ywTwxLfWN66tfkPb8n12/TLdqL3k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BNoHkeeL0Qxp5H4SAS67EabXJN6Dl3TNbLUUo/vlUh5oGazrBjN5B7y0YrMrdUtyg5u2rJxAdWlYjCpJ63T3I/PPFgrZsoQijVIBK+WST41q4ORKDiGajaCi/YD+KWQaSYhN2YU2nyqemSwlOawBPEENXndviZ3lb8s3iP7lsoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyhxcAIb; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acb5ec407b1so732796566b.1;
        Mon, 12 May 2025 01:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747040267; x=1747645067; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qCiOc2lGEPA6wS0ywTwxLfWN66tfkPb8n12/TLdqL3k=;
        b=WyhxcAIblIrbetgEpJN72aIIzpnHeRVv5HHk/lpMAzxuSuOkZYpVktK6CMfjbil8Qk
         w1uW9SXgGLXSmDTLtb7PhFvyxwxHf7Kxs5RyILqG75IT+fpcKjKqrpCuNqryPX/P5I7R
         ZGfe6veZ9Zc1Itabxjc0sClh8iMnDK0CV5nn4RUHps7uJWF2EL1SZzYISctAV5WwjOB/
         bM+/vVc7s2FUJIKfx9e6ryBOyQQtIupFseamrqHqGDF1tDBjVhJK+rUgk4EVrwf6/GRw
         UijC1M9ZQFmBtDtpChPW2AMapDv3nXOQEplneO7Cv6OaeZjGjavTJqmVrDJ3olFMSQQU
         Reiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747040267; x=1747645067;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qCiOc2lGEPA6wS0ywTwxLfWN66tfkPb8n12/TLdqL3k=;
        b=JjF7hmcczQ8CNl2trHEUKKTdiMZiYtngtfomm6nLq8P6YICQ+6FIPUVCu5Kwau6fAI
         jMc+k8KaRtoyx7VwlXkQlMmdzGdj5B2xdfZZBjPPWPwvb59DMeOK8gN/7VFoC885SPE+
         AZA5i9n6/L5t3Orecjt+PjJsJ5DD0/6TvCufJE3yDFGG+cHjqaVFi/zxCDGDBzfq6lxM
         fowNMzKLpoD7CD0TzHcl2CyFSf2Glyl7TIRX8PErhbIIoLKHu4AFAdIaprWTAcDK8RJM
         Hx/h4SC/3BNXOa88G/jqgHVGWE2mKb5nMYrxzTPte7rn3DCb2Qx2oIHJLJtuhG8BG9YI
         nfJw==
X-Forwarded-Encrypted: i=1; AJvYcCW9qZCyQnuVMMql2bGBrW7fCNsUwONhfEoZiiCgtiOT1XreVm1dbk1oKbLdPccNMw/GIAD6t7WFa44ENCQ=@vger.kernel.org, AJvYcCXYxANixajhKEi6X3lvoTR3GmonElk0dXuQQe0vfWxx1X0behTFTl+cMY2sAxKJUMeaaDuQWVHWU356sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB3IfBKAdmVjM1e8YiQaiGzFW1qX4mzGUZX3WnVNKqoOi6ZOak
	D3waaBSaFeNI7F8JCIiSPFIj9AIOVS9XEHgdhO8ccMidBCFUqSPM
X-Gm-Gg: ASbGncvMaB5uO3/YajpnHWOwovtT4yQnKQyYHdhmRvKD+mu4Fs/tR4c/dOce7AxVIaE
	VLI7IAU8Ocw/WUhGdtsQphkWqeJpr4fole8LbCjVvbG1Jy1qz5+L5/XNVSU5jkZzcQ8pXl64a/c
	z/4DUp5tOKs/nWFB9/VxVaN2hp1mJO0wjzRZNXhGhoZwJWJ9UR3lvY9uThzoGeQdncsLpRBKUum
	qwtXhr34+XsfFVatnuAFcqJLiRgkM2nZZwk1xstq1Ajhs47UbQaqGH645qBs2Taq0A5q6ppobos
	wW5tjFj7a61Ombba6k0o/oK6zoGn5KCIpnipxIsUjggA22XRlklqCg==
X-Google-Smtp-Source: AGHT+IGJBdps9c8bdW4GuYaz6tfF93ydrZ6lD3tOaY3CcqSNDXObZagPFTfmNPLmYXrOY46TTm5x3g==
X-Received: by 2002:a17:907:a810:b0:ad2:5499:75a1 with SMTP id a640c23a62f3a-ad254997932mr280618466b.32.1747040266634;
        Mon, 12 May 2025 01:57:46 -0700 (PDT)
Received: from [10.176.234.34] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21985b026sm588720366b.177.2025.05.12.01.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:57:46 -0700 (PDT)
Message-ID: <9df429e159b3933566c386a4464536ec2982f5f5.camel@gmail.com>
Subject: Re: [PATCH v3 2/3] scsi: ufs: qcom: Map devfreq OPP freq to UniPro
 Core Clock freq
From: Bean Huo <huobean@gmail.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com, 
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com,  junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com,  quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com, neil.armstrong@linaro.org, 
 luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com, 
 peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Manivannan
	Sadhasivam <manivannan.sadhasivam@linaro.org>, "James E.J. Bottomley"
	 <James.Bottomley@HansenPartnership.com>, open list
	 <linux-kernel@vger.kernel.org>
Date: Mon, 12 May 2025 10:57:44 +0200
In-Reply-To: <20250509075029.3776419-3-quic_ziqichen@quicinc.com>
References: <20250509075029.3776419-1-quic_ziqichen@quicinc.com>
	 <20250509075029.3776419-3-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-05-09 at 15:50 +0800, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
>=20
> On some platforms, the devfreq OPP freq may be different than the unipro
> core clock freq. Implement ufs_qcom_opp_freq_to_clk_freq() and use it to
> find the unipro core clk freq.
>=20
> Fixes: c02fe9e222d1 ("scsi: ufs: qcom: Implement the freq_to_gear_speed()=
 vop")
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>


Looks good to me:

Reviewed-by: Bean Huo <beanhuo@micron.com>

