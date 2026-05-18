Return-Path: <linux-arm-msm+bounces-108262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHzwLMxhC2pHGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:00:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0281157281E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87A00300BC8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC0E38F255;
	Mon, 18 May 2026 19:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFdcSBec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD828751B
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130826; cv=pass; b=qBUTfxe9We7w1MHRDfnNAsoKJA64NeKvI9iOVWv+RGMMbB5t33X/5fl48tzEOcGmPi4VXTaYE19APwmnD0c9GUL0XUxaxRD9e51IeJZihwNOFb8S2j+YTnJ4mPXNGsC86sNov/RUZAIpr82yajpKH9wGROFHIHjsYVi+8pnP4BI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130826; c=relaxed/simple;
	bh=jqpLVtdaekwJwnvaQIwx+IWTuYaGV9QkqYaMYh2FdSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nUOLgiG/t54NyfneZsrM0MaILzRXQaAKeXXlwK8gyWiOnsWMsqzkc2rTW33aJ638Z5SQAw8XTSwIsg2HpRtZQMm0lwVGVzs7TjlWVQVpzcU3dI7KpJ4LReS3tQEWTSA5RrTUqaJPfJ2z40gMwHGxejQ1RgXI9AVsQ73sgqzc3fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFdcSBec; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-479d593a0c3so2271117b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779130823; cv=none;
        d=google.com; s=arc-20240605;
        b=RaDHoCeEnmirGpgq11z59MfL81EkYSRws5bi4lcavJ0cycAxUyEQZ3eBBQM0lDgYv/
         bHKwrVUSZdHhx8dp2/sM0gwghB8r/6Iv5LcbADdBq1I+IPXdkQNsn+O2kzM+Ihe2Ids4
         vcLEkDJY+O5++0jepMnnrhmsW22v1Usz0Cr6/kqhtOyZHPLOZu5rTxk9HS4BRIDgNW81
         i7EDdc4jmlPVZH1aa1XPHW9a1Ie4W7iXrVGaYutcs0/1cjqTD4YhQcr8aTZoqlPKIiJn
         FbBdb3cvbkxASetAsQDnd1Z+MHrHpDBnSTFXLRklElXRyZ/iVFce7Sgz5oEeHBiZXolH
         SKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aKjYUNHanWZ9/vxOgUgSAaa1aIDsNs/cg6V/PaTm7D8=;
        fh=g+OvRNYypwEOS32wntWg8sGgH+ActZHVuIfEPm9Fa4c=;
        b=SuiuOHIJRrmQU+Q2JF+PrikvdavxC4Q6jvF0umL/SN25h2/fA2Atg5suxzTXYpc9DN
         QyWlQ7+gHHA9oU8aiVKMemPu9FiYidtFbuGIm267+EeGPVv8HInWlBuF0/FyrX2He9dq
         6EJlqWFaKCT0izwYo8QCdtVpquq0UGKkkv1PHo9R35F+PXgUshtKdl3Mo2vugxVdW9H+
         nE2WkLBoexNpqCZOA/KRakHR+4S6u8fgrFTDi7WKMTWVrSYPJWtSGev5dQAJOVTFQKIr
         UiwkCsrJ5cJ3wZ6MfnmorYNIpp0cxmqPZhTvfWJAnrVogic2+9kJ8K++XIodbsncufxA
         0jmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130823; x=1779735623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKjYUNHanWZ9/vxOgUgSAaa1aIDsNs/cg6V/PaTm7D8=;
        b=mFdcSBecdDC+w38TxNaI6h/T57RRPub4cMg9RKg8k+bvNeD0QZOvkwx0VEGR9cldqG
         T3GnlmRcVoWgzVdpKZJLojdSXA5LIO5S1THzfuF8jZE7voMn+oDtRpQB0g99s+w02GU+
         nFi5gkD6VG/QlWY/AtWpV4ZYMKaB5gy+hxlzrhWz4OPf//NeLrZWRgdqBjShlUfpCela
         Dl7TpwlpCLpPMEdntUSGMVsNkhM3lpVx5C6bK3yqW95+INKGQ4PvzINh1LIuLjeYz8Gw
         nTzp7JefavDQrRFz6p6MnuC/ZdBdThMRXTftFC07qNjemeLR4qb8j9DiPEOW5jQ5SWn5
         +5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130823; x=1779735623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aKjYUNHanWZ9/vxOgUgSAaa1aIDsNs/cg6V/PaTm7D8=;
        b=K3lGCO2TDGFyp0nfYkmJNybcPtopswa4vqlqF5mworBL+geZiAqnx4ovhW1JE1DNF2
         DMEEVl3CbACnQO9LmfVfzjLS2EBar8Mh5VEN3RRo7oj5gf4kbq/fTkyRMTGDjhTPR45b
         LdhrVpwX354qH/BVjyVT2rwhqycSU9jiKsyu1yEtVFKmL00zDucO1h2oA4iqyYcPu1bd
         Ewv7kGGIzG78EnIcUYQtPEQo055FHIe+5x8odWgPtIBv3YPG5i4OXtHiEAPe+Qv9/+HT
         Qs8oUBS2dBzzF5gQPxLO7h3nwEbx2Ta9CTCUBbagftqwWCqwHWZiqQMlKNaave7q6rQw
         igqA==
X-Forwarded-Encrypted: i=1; AFNElJ8skzfOZfB+ZXKmV6cXS0NxKR8QKuiupJxkYFDy6EGfwWpRYjthJ+KaoIqayHKfGxBNo8wRiIvr2Kx54Kr8@vger.kernel.org
X-Gm-Message-State: AOJu0YxpdpXcPcJS6c7QutzGB938Uuk6G4iqGUbQ88+MBk5rlj3nDgAt
	S7lv3frkTUcEz13hAOIUbFDmgy7KW/Q1+Amm8HH7TL74l0KIKTetVbCYJhn2Yy+mGXQc453ucXq
	g19iJ/I07+ht47BLBSieCQ/nMZ+UDbPo=
X-Gm-Gg: Acq92OFM6piExIQsoD0tlSBpPqhbHt+1xlhB0ZMj14HCqztRJta6D8urih/ULkTcM+X
	KrU26Kf/ssYxmfExk1x0osoY+TBU5UG7rFF4HPeEiPLAKAiWI+KTxtC1OplZL5azw7IXV7qgS9v
	V5GBv/caKEFT+qCdGUgR1LOXTvN2ndOearHvtucL9JnCA+OtDglyHliA/3a+AC5MRzeSTq41prX
	Q4Nii314qNLdz5OCoJMB/9pgkSr6DY41YTkEMYnHEMv6PzYyKtprOBVF0PXumcUVX1MHu7KX3vi
	3HAs
X-Received: by 2002:a05:6808:148c:b0:470:d1f:de69 with SMTP id
 5614622812f47-482cba8d3b8mr11223043b6e.26.1779130823539; Mon, 18 May 2026
 12:00:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401125126.593254-1-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260401125126.593254-1-mukesh.ojha@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 14:00:11 -0500
X-Gm-Features: AVHnY4Jf_k30k-UwsPBwW36rpegtCw8gTY8KHt3VPyqvGlu8_35mtZ1i3se0sro
Message-ID: <CABb+yY0O1u0oWpDeiK7VTpfa5_BBcTQppjhhwUEDMSbwYBXvSw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPCC support for Hawi Platform
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108262-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0281157281E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 7:51=E2=80=AFAM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> Document the Inter-Processor Communication Controller on the Qualcomm
> Hawi Platform, which will be used to route interrupts across various
> subsystems found on the SoC.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/D=
ocumentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index 7c4d6170491d..7dbc3ac6c5c9 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -25,6 +25,7 @@ properties:
>      items:
>        - enum:
>            - qcom,glymur-ipcc
> +          - qcom,hawi-ipcc
>            - qcom,kaanapali-ipcc
>            - qcom,milos-ipcc
>            - qcom,qcs8300-ipcc
> --
> 2.53.0
>
Applied to mailbox/for-next
Thanks
Jassi

