Return-Path: <linux-arm-msm+bounces-96880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F6uAjILsWlDqAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:26:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F35825CD09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82A9C303A242
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EEF368263;
	Wed, 11 Mar 2026 06:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCFHscki"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39E9365A1D;
	Wed, 11 Mar 2026 06:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773210402; cv=none; b=KkkrTxlbn+c9PstzbWpBaw0qkTUz5gsK29i+9n4o/CZMfn2SbX7hlj0ertarbvNApKef0Hp/1rxwsRrIdd94zCw2l6Uifp1p/JYdmJINQ+LNskdyoJARF4eF1s/pWMBwtVRtPX8QMwkJ8yHOuEpbUa06rcGy4IhAdG8tWn1Yq0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773210402; c=relaxed/simple;
	bh=ptSjoq4BNliCbt3hh0am3X1nM3VRLmyr/oLeHfI9i7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJu1NbtScE1JoOe5TBpJK7tfhfflZgm5ojmvst3bxOQ9s0DtjNMY/okIPNeqrOMZr1xKEoDXM6Rx9HZhruYE86ol8+TqYdvcru7+szLw6Ii8Cp2nghZ+V2GxN6z7ptkKhLtuqOcLR1vRpih/VgRmGMPXzSbKyFku2iheiZWTLUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCFHscki; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01183C4CEF7;
	Wed, 11 Mar 2026 06:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773210401;
	bh=ptSjoq4BNliCbt3hh0am3X1nM3VRLmyr/oLeHfI9i7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCFHsckiUpsjUn3URn/UBwl8HxnBfZ9OqIYzDgwvEJ9mSG+KQkRhvi7hrkipcVTLm
	 rRX35P82TUo3PwpMHJQekAqNN7HRBtEWgF0ata49Sx4N1neYLZLGXOjBFTcQ05YvrM
	 bVNPTRi/KcsWL/rjOgiA06zt+lVFTfMZrMwtBiqrXXL8br27pBbKqAn9Uua4vomLD2
	 3kWBQeD8+q+jqiNLF/V+73N8inqD5c2N+eC9o2DNc/w4p9iWtfpJHvo1AwRZPiqEfn
	 VE8T7DMiRPv+JnQAkabnsLr9pVNhuWO5CaAwBewdqn/zmc1juruueWUAtffYmtdkIJ
	 vtIpsGun1Kitg==
Date: Wed, 11 Mar 2026 07:26:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Message-ID: <20260311-unique-daft-nightingale-584252@quoll>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-4-0a91575e0e7e@oss.qualcomm.com>
 <oqvq52az6iknhg4negqaprfsx5dfo527acoeas3tusqpqvak2c@wrdmsydyy6ns>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <oqvq52az6iknhg4negqaprfsx5dfo527acoeas3tusqpqvak2c@wrdmsydyy6ns>
X-Rspamd-Queue-Id: 9F35825CD09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96880-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 04:04:09AM +0200, Dmitry Baryshkov wrote:
> On Tue, Mar 10, 2026 at 03:03:20AM -0700, Jingyi Wang wrote:
> > Document the component used to boot SoCCP on Kaanapali SoC and add
> > compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> > the "qcom,smem-states", "qcom,smem-state-names" in the pas-common.
> > 
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
> >  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
> >  .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
> >  2 files changed, 159 insertions(+), 1 deletion(-)
> 
> With all the changes to pas-common, what is being left in it? Would it

You need place for definition of properties - smd/glink-edge and
qcom,smem-states. The latter is actually not properly defined in one
place, becuse there are bindings having  it but not refencing
pas-common.

It can also define common order of interrupts, but as you pointed out
this does not work for this new device anymore.

> be easier to leave it as is for the traditional DSPs and copy necessary
> functionality into the soccp schema?

Best regards,
Krzysztof


