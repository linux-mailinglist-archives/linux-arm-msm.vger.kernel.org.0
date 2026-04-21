Return-Path: <linux-arm-msm+bounces-103926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCjlNwFV52nz6gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:44:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A580439ABC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D45E33020015
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE173BADB8;
	Tue, 21 Apr 2026 10:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLhdVBpQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F230E84B;
	Tue, 21 Apr 2026 10:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768193; cv=none; b=kLJBnpUrFoPDDJ/HmsejtRTKj0/BCK7i5NAuAbD7+z8YY6ApOyrzizUzCJPrdeFtksBls7L2XdViAPx0tlBaeJZbiClLMBI1f939WDaHs9+ByNuaeWTTeB8EudASp7Um/J77wqKWPoS+k9K+ERtNzWI37cHb4vA33+9qocCOcTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768193; c=relaxed/simple;
	bh=JcDPgzg2j2WZfo2SLhAPU4//YnBSM+eb2KC3tj3S+gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQOgiMH+jDc+ASiiV3e7MXzXfy4WjHabNgEa8XvViez8Zz3VL3p6Jt8KLwC94GmrEjlilANHMI0nl35LTMAljYcfqY38ei8nItA6y13pUwOF+BulxWUk1FE/Rayqjm/avHKXNzxTjrYRYIXW8mJUDomyKOlQVBY8ugPhubDV+fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLhdVBpQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16886C2BCB0;
	Tue, 21 Apr 2026 10:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776768192;
	bh=JcDPgzg2j2WZfo2SLhAPU4//YnBSM+eb2KC3tj3S+gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLhdVBpQalUZuh0F95ZclT5Es3jgg00X/QhYBnsDrf1H9OHm/DJbMPzevS5KrYBx4
	 /Wdrn/+sXPD2s6GA2uNtXCZT1J6cfHFQWLu03agswVLPHMZWis9P5LKh1KBoo8LwUi
	 v4WnlVaAO8YkVFqGy/td3CoA0fSR7E+h1rNWMlk83EkVd7CLfZ3n4aIWFZ/++tvcBt
	 yPpv8EmduIXeb4Egnk8UFz4Ov/TeyTEjDf2ZK3Uli4qb7nhydZ5KKYBIuJZDwl7Fap
	 8fcfcPlCUvPZUW5C7wggddNQgudXOofwHb0+QisX7zGFTfmQ5Nx/SJc9oQpW/VM+T2
	 3F/+JPxYoug3w==
Date: Tue, 21 Apr 2026 12:43:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] scsi: ufs: dt-bindings: Add compatible for Nord UFS
 Host Controller
Message-ID: <20260421-burgundy-moose-of-discourse-f6bbf4@quoll>
References: <20260420100416.1252983-1-shengchao.guo@oss.qualcomm.com>
 <20260420100416.1252983-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420100416.1252983-2-shengchao.guo@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103926-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 4A580439ABC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 06:04:15PM +0800, Shawn Guo wrote:
> Document UFS Host Controller on Qualcomm Nord SoC.  Like the Eliza SoC,
> Nord has a multi-queue command (MCQ) register range in addition to
> the standard one, making both reg entries required.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

You posted ~22 patchsets for DT review during the merge window.
https://patchwork.kernel.org/project/devicetree/list/?submitter=220289&archive=both&state=*

Some maintainers, including myself, dislike receiving huge pile of work
during the merge window, because it is not the time to review such work.
I finish here and skip the rest of the Nord patches.

Best regards,
Krzysztof


