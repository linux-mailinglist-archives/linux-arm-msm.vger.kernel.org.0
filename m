Return-Path: <linux-arm-msm+bounces-116205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id apYkEKNrR2oaYAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:58:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F24C6FFCD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:58:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ebgAnrmx;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116205-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116205-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B1ED310170A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CE737189A;
	Fri,  3 Jul 2026 07:49:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EB9370AC0;
	Fri,  3 Jul 2026 07:49:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064966; cv=none; b=GM0SazRyLbHFK7YqsXiGf5C5hdYTKcqFsZiTagk3xa58+LSGQ/3Uy1iiIX8g8aX7lWupNyec4qV3JU2x3kEpPd93tnumO0h0K6c1OhbNgAA7GSrcgqRJ8azJwEWx/NyeuSYyov0VLfKYh/uK1OO/pm8EDNY0MnlY0GscVELk9WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064966; c=relaxed/simple;
	bh=fQqJiiIDpR6OKJLeYYYy7tsAcBhxx0nsZjA0nKhOyDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2CQoUBG5wt6I6NoTAqfnlUOTJD45aLfMpgelG6785Zj6fhE9rInQmuD95FbYQczvqGjwwJfVhIk+GDqpp4RuK7vM5ikql56fml6PYBesC3JpLkQNdphBiGUgLpY16pR7Ph8WmlBwDBq89KDVYPqW+25VFQcKj4FJNjZYzS3noU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebgAnrmx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32661F000E9;
	Fri,  3 Jul 2026 07:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783064964;
	bh=68Qi0IFfsyuroQCNkiNf3ckXfY7NPL30TBvWb8DTwG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ebgAnrmxgieUMjDYs/HyDxK59xvCz3S5EgNI932KOrb34iw7Iy9ujbWyutPg8QWjW
	 9N2sM5Ga1+BULMnKDZzF1mfVE+nzNk63mbZXw2JtcoHcX3Pgm5oDJ9DSea9F5vv/FO
	 XBUXCSv+EmOIRVbK6g9gXH4kxU48eGtGgycSpzbH5ptdcRr5XsBKklf83z/uqJkV7i
	 pf7b8LaLRF38ffP0diE60wIlgLQYRDPy/xLOi8g4aRcGFmT5UpBmaPB4Hj9U8irdAN
	 HaDWfZQj1hx0k0AJ5Xjt4vlFMp32e6pUJqx2a4Xk5OmCHVV58NTxxDmXfXfuDMb7Ss
	 KwJJv0jbitZNg==
Date: Fri, 3 Jul 2026 09:49:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Amit Kucheria <amit.kucheria@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v4 02/10] dt-bindings: remoteproc: qcom,pas: add
 #cooling-cells property
Message-ID: <20260703-quirky-impartial-oyster-caab0d@quoll>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-2-3882189c1f83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-qmi-tmd-v4-2-3882189c1f83@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116205-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,quoll:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F24C6FFCD2

On Fri, Jul 03, 2026 at 10:33:05AM +0530, Gaurav Kohli wrote:
> Document the optional #cooling-cells property for Qualcomm PAS
> remoteproc nodes so they can be used as thermal cooling devices via
> the QMI Thermal Mitigation Device (TMD) interface.
> 
> Qualcomm remote processors expose TMD endpoints that support thermal
> throttling through firmware. The cooling-device specifier uses 3 cells:
> 
>   <&phandle device_id min_state max_state>
> 
> where device_index selects the TMD endpoint (for example PA, modem,
> or CDSP software mitigation), with constants defined in:
> - dt-bindings/firmware/qcom,qmi-tmd.h

Full path.

> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,pas-common.yaml       | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> index 4607b459131b..ef11371058c4 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> @@ -79,6 +79,14 @@ properties:
>        channels and devices related to the ADSP.
>      unevaluatedProperties: false
>  
> +  '#cooling-cells':
> +    description: |
> +      Cooling device with three cells:
> +        Cell 0: Cooling device id

And here you provide full path with device IDs.

> +        Cell 1: Minimum cooling state
> +        Cell 2: Maximum cooling state
> +    const: 3
> +
>    glink-edge:
>      $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>      description:
> @@ -95,3 +103,34 @@ required:
>    - qcom,smem-state-names
>  
>  additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/thermal/thermal.h>
> +    #include <dt-bindings/firmware/qcom,qmi-tmd.h>
> +
> +    remoteproc: remoteproc {
> +      #cooling-cells = <3>;
> +    };

Drop, empty node.

> +
> +    thermal-zones {
> +      subsystem-thermal {
> +        thermal-sensors = <&tsens 0>;
> +
> +        trips {
> +          alert: alert {
> +            temperature = <95000>;
> +            hysteresis = <2000>;
> +            type = "passive";
> +          };
> +        };
> +
> +        cooling-maps {
> +          map0 {
> +            trip = <&alert>;
> +            cooling-device = <&remoteproc QCOM_CDSP_TMD_CDSP_SW
> +                             THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +          };
> +        };
> +      };
> +    };

thermal-zones are not relevant to remoteproc.

Entire example feels pointless - how is schema even applied/matched
against it?

Best regards,
Krzysztof


