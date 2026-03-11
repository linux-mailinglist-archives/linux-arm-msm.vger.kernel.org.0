Return-Path: <linux-arm-msm+bounces-96993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aE3vBY5tsWlVvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:26:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA472647BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDEAC3216682
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1960B317145;
	Wed, 11 Mar 2026 13:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VgBeXXDM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8A0314D2D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235256; cv=none; b=ps14tWT0wk9Qd2rTB7uhidDdcFJ9wlkJbA+PcND4AnI3FqoCJ1Q0xBrxLQ5Kx65leWqcUPK9MwfPAJGKsTryR48+WZArcBZAhPBRc2/bX3aJPHQTSr27JcKk5ZDkKvbCthT+oGZzwmR/kAsGVVcjzscWuUBJUiTQY2Isg9dKrN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235256; c=relaxed/simple;
	bh=NXm8s0AozeUtQD3EKZ7gknpxzYb2cyziX5d0mIBoPmg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbhFTxigdFl6TMpwfkEFsfFcN1O+e/PVk6uOI238nA1kKewkIWsUsx/mUR9PTiDbzfvkat5Dqe9li1YN+5BoTUrgn72TfcS9hgIyh45bKU0rKpgOvP3tlIva+33OtFOeIiX6iIQqeR/Ls1510KMdUJH0ngZNNu7jtXI9To4wXEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VgBeXXDM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CAEC2BC9E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773235255;
	bh=NXm8s0AozeUtQD3EKZ7gknpxzYb2cyziX5d0mIBoPmg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=VgBeXXDMlfMiC4ZpPcDgywHYYfjix6PxK0HdpMqSPG/r4jmacKQh2KIabA4YLQwH+
	 lSWtnbOFY8rZKO0dnt59furCSMaJ0M0TaL8jmp7r45CpRzDU1jxsmM86PAtJdqN1os
	 dlrxTNTFcYMzwTb1qXriV4SJijFTMDUuwgQ2ZdcE9EULeYPs6cDSSe70VJy1uLWT/f
	 XsJZlgmXrpvLdmaie7F1EndoZvzFH92Ke5XBhUC0f+l3VUEJk0GA9BeadgU270BID8
	 Hro5X5maHw7ueMkH3fKDTcAZhbVgeSMDzf90Bq0kV4Mbzv3kmFl8gMqucMqXqFEq+9
	 xdtX4V1gXMMuw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so9109904e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:20:55 -0700 (PDT)
X-Gm-Message-State: AOJu0YyTo94/oyGsoHJ1uyGjxFElgcd8/3G7JYk91IafakJEhNAGhKhp
	F2E2C8PLnPpUX02xRbe6xWke3PFoKfdLY4+E9WXIKG8VGgW1gkA0r1JPZCiDP7fd+HMqT+MVmpR
	Bf4Ii0qB3rRzYDfzqBCTz9i4u0XXb+GhpKAYu+/VbBw==
X-Received: by 2002:a05:6512:22db:b0:5a1:2738:faa1 with SMTP id
 2adb3069b0e04-5a156bc2feamr853436e87.17.1773235254249; Wed, 11 Mar 2026
 06:20:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 06:20:53 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 06:20:53 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260304-b4-scmi-upstream-v5-1-f8fc763d8da0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com> <20260304-b4-scmi-upstream-v5-1-f8fc763d8da0@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 06:20:53 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdr6Xjwwgre1Rf5u0VLptKKhOqA_cn2Vv-DWeL+2Y6Fiw@mail.gmail.com>
X-Gm-Features: AaiRm52EEd3eHZIBcS7E6LUFRRzMD0pzq-ZknhubPpNS-Io4tv2Mz634duPLD3g
Message-ID: <CAMRc=Mdr6Xjwwgre1Rf5u0VLptKKhOqA_cn2Vv-DWeL+2Y6Fiw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: qcom: add SA8255p Ride board
To: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>, Nikunj Kela <quic_nkela@quicinc.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6FA472647BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96993-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email,quicinc.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 05:28:28 +0100, Deepti Jaggi
<deepti.jaggi@oss.qualcomm.com> said:
> From: Nikunj Kela <quic_nkela@quicinc.com>
>
> Document the SA8255p SoC and its reference board: sa8255p-ride.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index d48c625d3fc4..f9a04769e20b 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -891,6 +891,11 @@ properties:
>                - qcom,sa8155p-adp
>            - const: qcom,sa8155p
>
> +      - items:
> +          - enum:
> +              - qcom,sa8255p-ride
> +          - const: qcom,sa8255p
> +
>        - items:
>            - enum:
>                - qcom,sa8295p-adp
>
> --
> 2.43.0
>
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

