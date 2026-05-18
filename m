Return-Path: <linux-arm-msm+bounces-108263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFX7LBpiC2pHGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:01:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FC0572868
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE0E1300461F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D059338BF72;
	Mon, 18 May 2026 19:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJAntDHW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0E538E8B7
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130903; cv=pass; b=P4Ct9Qv7g7YkbqFVLuHmgGHDEOd+ocfZxrmrfA0jmGtOtyeUp7waO+kQN8ooeYEFb8bUddN0eB1crUiZfMBECyp4Z0/C4G1ybTXiaJTn0VLPEGvihRg0RIMGJCkrNFCDskcUaBHPA4hHtQ583xkJ95SooDnJ43O/vN4uuw9kag0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130903; c=relaxed/simple;
	bh=q5fsOrXGhxde28Ng5nH7s2q2cj/2S9OdaUOtLf7SRXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rK0+U+/Hod8pooHmvwU2+6Z696HDf5XjuzF75MOUfM5XrwSuODBr0hI+xkNQOS+6DYmD/GQC4mSXxFNX17hG467IAlnIYl/GqQQBXeLktTep8vva31NaQEMbAuCOPqOjgSrtnBCqiU5fq2iEa9il/fBp6CbhzDGbpFN4U6I6gv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJAntDHW; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e568ab0bc5so3072881a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779130900; cv=none;
        d=google.com; s=arc-20240605;
        b=S5vWXrBcTVmuPoO5cs0Xu/Iv0q7MfaQVNlJ/sGhLTKZVbP2+3nO/lUg2dOhJkEqPL9
         v3sKqURUb/0JALBkgyvs+zoLJYf3DxGBbVyuGO+M+z103eqx8o6RPtBDKqEla8cgw4M4
         7HvyX/Yh0e6pEH0QgeL7laM/HJazHmxnrjzdkKWLDqO/mgmYyM3WoEykd5AR+XBbESQE
         TDgMMRpViFaPuMw4cwdBASKgiCfa3XQIqTzPLX5jnu4H5CYAf1cb33iRIU0aVZuiLgLF
         /cmHjlH5R9tN7dhAOCC4aviXPSEzryBCOiu5yyZ2tgbYGl9Dg7rFAQFn4aYtGA8bkSd2
         6Jmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T/O63DauL/BsTwWyYkQlvi9bkk5R1sbHMz7fmVxCqDs=;
        fh=oyTcC+zWuHeRIsinbCIR3ZVR7XR5KVXWNlktZaZpbUc=;
        b=SYs8xjCFlOMubOAbv/qe8yv7Ob9SPy7Dx+/Vq6F7z0PG44DqsTjdIkvGD13xqmmQuG
         5DnDmwaGac82IEkC3uU2fBiAZFe8XaZv/lsN4/AXYod81bZge2pf155KGJNWHRpHmpcR
         ni8JV5Bqe95D+dT1o6UkNoM6P20lnUDLr8lGyISO3+KPANDcb56BEjpHWVqPA5QnDFlJ
         E1t90Ij2QyyFvl4MKSTsoNS4W18AXZP4qzh/O/gTzVwjXdvI0vb5WdRC1Jlu/vtu2tCO
         p/bVihr6jM52bbJvNt2+FL7uebR6lro6pdVOhykPNNlvFYtOAkIowdeqoYlMpKiXJhyO
         hrVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130900; x=1779735700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/O63DauL/BsTwWyYkQlvi9bkk5R1sbHMz7fmVxCqDs=;
        b=tJAntDHWNBzW/Cy97JWFsk3FnzEjKD+54I9WvWkx2F313AE0FqRJFfXlq6tVmkQ/xU
         gPMdxSjYua2dNFbJ0xOrJvRQ4WaNtKAJq/d+R6lI6zotGfYZcs0iU4zzjgQpLH4zZD03
         g+7VzrsAGhMoZvG/IDmXkDl7TAHBXVJhEKQMsyKxzSRvsx/X0yIif98O1DWhMEVyHoOK
         VATID8znIAz7jsIT6FdFtW2gbsqN5e7BZ5aqMN9sCujAeNO2KCbAztEGab0dSpmARPv0
         9h+zpz1O4lOwayk4CvmSZBgFBIAOuWxqI84LVXbi8ggxDqX15tRBhG2vitFm30jNOEUU
         cfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130900; x=1779735700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/O63DauL/BsTwWyYkQlvi9bkk5R1sbHMz7fmVxCqDs=;
        b=CkTwXUr17UfDLvSjDBahbTQE2HFabr++3PirvZhyqC0fezPGYYzDAhM/fMzhGZSLGx
         zMiCnIywToTi1SkkyHzIf0/YxdKczVIOOpdioz1qEzgPZyNI00qG5dbc9CPGOYiBzNlB
         Ulw84h+lwhvMIj9AFn/dYnI8kv7q2mFRP9/V4o05ugEjNIsqqAJWbwhx3pM1csTogr2l
         HSOXpjrxhPsBLuMFcQg6lyHFCbRdPkFD4nLcFeHONIqsisUl4y63lgU6Te86r/DL3vZB
         4qkd6FnKAg6JrJeP63DC9aqYT9NzmKoUTZOZkVnW6LNMCTHhP2Rqo8wUXexFf63XfjtB
         kZBA==
X-Forwarded-Encrypted: i=1; AFNElJ/OW1NDwRXVPPFa0uLzbKNdaI6WPsbIL6yLJ0E8RcGTeCBLtb0F4IxzGtZ4NW5SLDdOqqPtKk/TbYkzYGQF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+myNbbQiF8Mj2bNoZB4KDsEpuT2NGURIqPG4z/Z/HJuheMdhi
	4eSdLoe/4wyhgz8zXeLhctMHSaI0Qk3OHo+LUNivAnvQ8K0n6Vv6qoiJgVNYjKhw3Lh4TI+uK8g
	H0hMd7ZJ+AcXJFnGbrnSHpy+64FBY7cQ=
X-Gm-Gg: Acq92OHt9c49O6M3krmXUbDQ+5gCztUzZE0nUBOLKI9cGDFAE4Ge9V6qDXVPfFQtv4X
	EzatXIftjrXj/Pq8kqrH7bYETVb6BNLbIg9UgAney0KM1i0xFlPVGSm89dJeME+2kfxKdsPawz3
	QOtMRiLjBnZBfLo9OoBexX4pxCktyiePLziAmzQQZVLyM/aU8nchwGL57cnVqrC97Wy9lYEBrzk
	/z50S3zoJVsVgxmk+73aiVWYQ8XApRs6f27HRwPNFomxQzvV771Q6HDp9q47It0ANVACmZfg1WM
	3MF6Hm37
X-Received: by 2002:a05:6830:6d12:b0:7de:c870:46d4 with SMTP id
 46e09a7af769-7e3f0b985c0mr12318672a34.1.1779130899540; Mon, 18 May 2026
 12:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
 <20260508-shikra_mailbox_and_rpm_changes-v3-3-698f8e5fb339@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-3-698f8e5fb339@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 14:01:28 -0500
X-Gm-Features: AVHnY4Jfqq31qxvmvcr3xUG2xmBWlVIWhUqOAw0XC6IIO55JZbxmx0VMm7oaQS8
Message-ID: <CABb+yY1CusV7QFdMGQOTb0YjR1mRHdp5MAZPL5fsimxB52_Y4Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mailbox: qcom: Add Shikra APCS compatible
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108263-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 35FC0572868
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 8, 2026 at 5:41=E2=80=AFAM Sneh Mankad <sneh.mankad@oss.qualcom=
m.com> wrote:
>
> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> Add compatible for the Qualcomm Shikra APCS block.
>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-glo=
bal.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.=
yaml
> index f40dc9048327298c6e78d4327bbd5f530a013604..1b4ef0688ca79f92f579d9bf5=
ab2cfb2bf879392 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> @@ -49,6 +49,7 @@ properties:
>                - qcom,qcs615-apss-shared
>                - qcom,sc7180-apss-shared
>                - qcom,sc8180x-apss-shared
> +              - qcom,shikra-apss-shared
>                - qcom,sm7150-apss-shared
>                - qcom,sm8150-apss-shared
>            - const: qcom,sdm845-apss-shared
>
> --
> 2.34.1
>
Applied to mailbox/for-next
Thanks
Jassi

