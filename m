Return-Path: <linux-arm-msm+bounces-89544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B4FD3998A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jan 2026 20:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D2E23004F7B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jan 2026 19:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79908296BBF;
	Sun, 18 Jan 2026 19:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzLuUgWs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B96248873
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 19:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768765268; cv=pass; b=mzPePueONNHKo4cgzuBaa3FgSSocIrsbo8dE46YQ2ezJDxZ4IP0MT0zP7rI0VE3az3I98wJPRG7QDeReez2y62dofGb7f4h8+LLtBFPnYN7wBCYtiD3E0GCptSUVxgV2BtN9M10bG/Q2zMd+zZgfROOMxnFAznyl6tVfl+VZBFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768765268; c=relaxed/simple;
	bh=VlYoL6q2Ncy8SBeulWbd5DRRucKY3L7Th1Ngh8Vt77s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGIgB4i8QkuiT0DbcV9B+J9MS74EFf7PWA5NW/3RyltUJ1FWV7V3dPZvWNP6c93K3j6VHDNHgNeWJ9NL0VkwU8xfNSgAqEfhbv9OvFFZAmlrhqXbGpBNgV/Zbpg64QiGaNAKl6qZr1qD7IP64g7jRAW2xmD5vS3HP9URCb3Y1kE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzLuUgWs; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-45c8e85deffso1243456b6e.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 11:41:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768765266; cv=none;
        d=google.com; s=arc-20240605;
        b=Y/46Y8SnYWNBkrc30QDQoS/lwsrLlgp8UcBx5LJyUuK7QGGN+fsa6ZUXxDSRq1szED
         EF7j8xczxaBT0CwA5VTXjGxzcKc+oLKaqv8gA4LtZhdeCl+4fMmOHLolYlJWV6ZmJU62
         gYG545wP3RdRPurx8D4IYkuYkBCGr300IoyPzib1jAbT2pcWbA3HjXtLmEHx1+3Yh6Hp
         M51bH/ZpdE0MsQQH1kOWNSJLcMnDwRTDasR58Z6A8fNbJMUCmzM7rO3k0BLJMHhkj2cu
         whOcEh3eMHGoOkf8gYd8fONELzT6w8QeZ+NawCgXfDxUSwgitaTlLFHOlI21PDKH2vSx
         nSFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jiL1b1PFmfmDNWDFtV+c3j0QUNNL09k3KF9wFBCvRSQ=;
        fh=50ul1y98fwFzEhPreeADPtQ5zQUt1/a9h7wotw6TXGs=;
        b=LNaz5bnm1g9P/MhFKO8er9Js9iX0ckWkLbOWC1rKmr5YHtQkJrdqJfU7Jbhp9+Z6j4
         9l2e/4Aar3GLs+DE/xNKcgffbVfmIN+jY+RmOOdy90k3I5KmSKZwmKnaLSfjJ+6KR9Fi
         8niTtwc4JDsuNtJdc5Yk1PGt9MiyM1yxOoeJNBhF3Q1KUGr6U9XSieP7weh87u4Dbduj
         6A0uKt0rSiYNF6PF+SvGMU3lsEMh+JggYT15wlI+nfQpb9WHAcNnIkHRfZBLPG2AcfNg
         Dlt2lzpWfs1cL/7ke+v6BwGSXlDCFCJs0lA4i7yzThSA+L/bQNhoh/cXfDC50PIDIdsC
         D1jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768765266; x=1769370066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiL1b1PFmfmDNWDFtV+c3j0QUNNL09k3KF9wFBCvRSQ=;
        b=OzLuUgWsB9whaHiKmrz8CXLV1uJBGMSUarroaho1gA/V5AOYgNQLI1FOBxWfXWlEyG
         Em0DbQiixlMZLn87V82b1C77znb4yUv3CLpV7SmQlPGrpjPIS0XqWor+d52hPdD1YSvf
         PE9CU79hkvngiot3laDqK07aOLU5pG5DdEpyqEFf+VstwWID+b10BRFZ445tDrgpW0S1
         eLBtx8o3CGPYi0lhbANzv3ritZ1YeYvMZNUe+xHNoyU2hAcw84yVdYZX+Mxj3eXR1q2D
         8bwvslH0wUhk0xrP3XzLTN/qOjfzn3PlJXDK4CpFGZf29eSD5/QW20i21w95aB0gYXFk
         qY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768765266; x=1769370066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jiL1b1PFmfmDNWDFtV+c3j0QUNNL09k3KF9wFBCvRSQ=;
        b=WNta7d6Mj7eatmaiYLPeY41Ebd/CqUnnUZCsNBo/6qY6uq8FuJxJ/mr1SmARinELEU
         W5rCm9ylrE8TWVzZkovTpHTgcIXkLEcC73t4lG2Rp1W/TB8gM7gJEdR94od9ttjlooEn
         8r6EwEPTxy+GN7BYAvGW0MwJCfD8QjN4IB7OnPNRd+2vAQetJ81awkdvkxHYHS6+Gw2E
         r2iUnqyf5kabyz15J7C0G2eEecGk6oBolSTj3BQgrx6powfp2NIzWBMpUOVS8WE7NLIz
         F9WI6ZoyDyfN2ndPp/i4y2kLXAUm1/Ubkr6fOpBs4Pahy8GTHLPHBF0zrVegfGYz83OO
         J4Kw==
X-Forwarded-Encrypted: i=1; AJvYcCV9uMbUKdGzoJvW0xYw9ZuhylSQvVxnfNkTrQea3KhoHrjw/0oVgp0l0MKT4/yk2Qpp2eoTvI8aO1+esOjA@vger.kernel.org
X-Gm-Message-State: AOJu0YytVLd5Kkdet0ZMH/6wjdNWjFN6M6bPAvEsdggrb1FRucK4pYNd
	T5EoCqY+x6Ws+Ntj9PGAb6EbyLVx4GAMUVCZAmv54nng4jkSbeseJsljNV0/4lGBtiljNPV0akG
	SblS6ERT91Zsc5BA8GJoUR/g319Ke3HU=
X-Gm-Gg: AY/fxX59AQunQqQbVzW0rewbYMNn2Q73KkrZ4iOOsFeRj3NO/ixRcrL5Xt+2hXeu9YZ
	EtjjoO5z0wPsNUvgmKFrvggeiIYzd5y9Sxro7VAoCGyo2jaYGpIrtJO93DOhICdZTDExNSdpeEe
	MS5jWdFyTz++YNmoGBxMxVWbmnF24JaSGEZKXVBW1OOWSk5axpS59w1RGh4ti0uf9AypLv4N90k
	7pvGXktjr1VfEL3AteG4Vq4a7qFS89T4noE2rHQFUlAz8AkUhThtscP0epi6ebfz6sZKAPD
X-Received: by 2002:a05:6808:150d:b0:45c:925b:5848 with SMTP id
 5614622812f47-45c9d8a85ffmr4206718b6e.45.1768765265793; Sun, 18 Jan 2026
 11:41:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com> <20251211-sm8750-cpufreq-v1-1-394609e8d624@oss.qualcomm.com>
In-Reply-To: <20251211-sm8750-cpufreq-v1-1-394609e8d624@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 13:40:54 -0600
X-Gm-Features: AZwV_QhGzuuUkbceOTO3fSfYzXGuV86Jyo_JbalH5_JClGBRCgr4eBFXDHD4cFk
Message-ID: <CABb+yY3v7RQTEvnd3g94ntY-COHwKcYPuDfh77bEKzZ-PS65EA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: qcom: Document SM8750 CPUCP
 mailbox controller
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 1:02=E2=80=AFPM Jagadeesh Kona
<jagadeesh.kona@oss.qualcomm.com> wrote:
>
> Document CPU Control Processor (CPUCP) mailbox controller for Qualcomm
> SM8750 SoCs. It is software compatible with X1E80100 CPUCP mailbox
> controller hence fallback to it.
>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.ya=
ml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> index 9122c3d2dc30fade96eaf54aee41f890327deb6c..9d99af46e531aec615f91f1c1=
39ce4fa482e41c3 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cpucp-mbox
> +              - qcom,sm8750-cpucp-mbox
>            - const: qcom,x1e80100-cpucp-mbox
>        - enum:
>            - qcom,x1e80100-cpucp-mbox
>
> --
> 2.34.1
>
Applied, after trivial rebase on top of "dt-bindings: mailbox: qcom:
Add CPUCP mailbox controller bindings for Kaanapali"

Thanks

