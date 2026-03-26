Return-Path: <linux-arm-msm+bounces-100009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHnZMbWnxGmZ1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:27:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF1432ED07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:27:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61FFA30D3636
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5CA39D6CE;
	Thu, 26 Mar 2026 03:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NH1/Ll12"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB91B3932E0;
	Thu, 26 Mar 2026 03:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495183; cv=none; b=Q20j6rxeBXIZymc+sOaSMnBy0vcVfGBWaSpIPVPeu22kTJtWV/Ksn1egLE2SKSoaLFrM9RZy1xER+t0aHPmQ8DwfE5q28KjvxS4ihmbZ6c/F+ChDmUj8xEhlVTKMWt0r8OofIjCmYECxgCuxWbpEsRMVH9iB7qd412XrVbnIhkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495183; c=relaxed/simple;
	bh=5sRH1SV82VlFLwflvncD1gyPWBJ7UsEvuqbUKlJCYCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nTBVhxUfhNU4JIrRNONamoHnX028YD/+7eoUxthr7h1YGESoUJ68p6SDrbQeldmPF3/2EZN5pvTJ0eo2HKvEE5f0BMZrSNAP5cBgdKydjsjg6Bnb+OEMWUO/+iwAoqSOVfO6aGj7TEF643LZzXwdQgdTX+3RHXaZWxNleludnrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NH1/Ll12; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA3BC2BC9E;
	Thu, 26 Mar 2026 03:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495183;
	bh=5sRH1SV82VlFLwflvncD1gyPWBJ7UsEvuqbUKlJCYCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NH1/Ll12DvvgmQqtgzPTEmTOEwL7vVtFa2QtqzbdLNNsH1gNMU3UJwqH6d4njte93
	 xE5jwgyffpkefIMAt0+Y0skpStK/bvnlb0DkvbdmIdv9wyTt8JSH4mIZ9B8F47O2KJ
	 0OYkAy0l0B4HHuoYodk3WjzLNc2A1lLt2w/0GQQDi+ayNRM3qQfHyWtjyFQTAUfEfz
	 E1FS4V67M/scplW6ughynhdwNmfG3XJAAk5bH7ncnjCwKvth6LzjUb7Rj/+O1TjXVf
	 h7YDsrYWOhRCTTFaAYUpO+cI2cZ4o9JbhkMVN7qSz66h4cRNuMVB2Fwswvb6Dj8KSp
	 cDIG0cK94Gm7A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2] soc: qcom: ubwc: Remove redundant x1e80100_data
Date: Wed, 25 Mar 2026 22:19:24 -0500
Message-ID: <177449516598.60308.1290778766611105425.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325120846.139836-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260325120846.139836-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100009-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7EF1432ED07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 13:08:47 +0100, Krzysztof Kozlowski wrote:
> UBWC data for X1E80100 is exactly the same as one for SM8550, so reduce
> code duplication by reusing older entry.
> 
> 

Applied, thanks!

[1/1] soc: qcom: ubwc: Remove redundant x1e80100_data
      commit: 624a97208904ed50288f32e8b1ecc9ff9aeddf1b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

