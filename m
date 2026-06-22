Return-Path: <linux-arm-msm+bounces-114017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0Y30NEZAOWpFpQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:01:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EA36B01E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:01:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hfH7ldEZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114017-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114017-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 502D73032CC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF3E3BAD9A;
	Mon, 22 Jun 2026 13:59:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142073BA236;
	Mon, 22 Jun 2026 13:59:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136760; cv=none; b=rNYdbgG8CgswNTZ4OM5pcQuFbHnpzt4Ozsvpcf2wPZ3sPHZ0GY8eRaFU66i3HbVGo8pSPg+cBKNsyc/d/V2//WCHI06sz4TpXA7CjwsowrZlkV+IBQ8bsZB3uVALQFqw/p6/zOrEY15xgGgTFERTOobRyo8hatMLQU7vyqZE9Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136760; c=relaxed/simple;
	bh=ckf2CLDcD5bKeJNfALH76945wCUEve6WvHu06tACpbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKBrhQWo1HpiXgZ9rXd4cDAef1uZ258Y29rM0Yw9vvuky59WKnrbKnfIenx97JnHhfy0W7rVOwrqYT4TPY5N77SloJZ6lAKtV+N7ahKYOmA9AtzO5P/vscE5ljjU+NIXeDHqnelydfSe9477rrjjI385z1qnptchosXGEsj+9ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfH7ldEZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42821F000E9;
	Mon, 22 Jun 2026 13:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782136758;
	bh=MWzOfyz2T2EU1PoKiDXZCT09S48JZ9ZqR9VTXBONb08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hfH7ldEZxUXB4JBSpJS4PVZ94sWnAZizGMRIZShEn0UwLfQxMGaXStyExU5p/yGvZ
	 9IJgV7YjnxJspHI9lAOMAm0DOMJWozPUhlo14mTU0++sVcIeSXWRKkFGILuV3ifHej
	 y24SGaI8va+OzbuBs6keJOJovL2HdM/QJEY+Fuyk8fMVokaA/vRk0FTYVmWEOOwN0i
	 GVYQX7yHYTM3Qk1Pcb72DRfTfwq1O1xEyFy+cNEH+GxBZfnR/XfkjnpcEV5SBhZ66a
	 NkY31ZVNarCSAxbi7gODggOqQcleK1HspVP90/YVxasU9CNF1RpkfpXkuuGKOPsTFf
	 9x+UWLszT3vpA==
Date: Mon, 22 Jun 2026 15:59:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] dt-bindings: mailbox: qcom: Document Maili CPUCP
 mailbox controller
Message-ID: <20260622-durable-violet-bittern-5ff7eb@quoll>
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
 <20260618-maili_initial_clock-v1-5-d6ede0352113@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-maili_initial_clock-v1-5-d6ede0352113@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114017-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[taniya.das.oss.qualcomm.com:query timed out,linux-arm-msm@vger.kernel.org:query timed out];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1EA36B01E7

On Thu, Jun 18, 2026 at 10:51:20PM +0530, Taniya Das wrote:
> Document the CPU Control Processor (CPUCP) mailbox controller for the
> Qualcomm Maili SoC. It is software compatible with the X1E80100 CPUCP
> mailbox controller and uses it as a fallback compatible string.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


