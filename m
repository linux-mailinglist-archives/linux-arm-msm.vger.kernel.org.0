Return-Path: <linux-arm-msm+bounces-74379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87078B8E8CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 00:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 461793B9994
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 22:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43F9248F47;
	Sun, 21 Sep 2025 22:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+w72L2k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DE42F37;
	Sun, 21 Sep 2025 22:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758493657; cv=none; b=jkW5b+vbPLEx7lKfrmBpZK1CWJhrCgACX+I1BSJzcyRgciPkYxyQGSst8BuZHbe2+SELXekuSPiQmITmr5MhsRRA4iwSPAJmVVQ6f8PWs3nq/OSUSe4dg8T9BT4cm4GBNjaHNkgO0gGAGQt0KaR+bqmoHpZpSpLaPtds/ANUD8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758493657; c=relaxed/simple;
	bh=XsPgplYi8+wjn2NIA2VSHLyCnxyguHWdNakfzR5RU/o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=t+0LkMv0lPQ5d5w/Kv2sCTpj112D0CzqUaHHTRb9Jx8Xkm0hvMJrcwVpOXRcjjSvuDERo4I7czTIWd06Vd1BL1hHAmodrzlSsiYPrGyunnEQYeblRvVPM84nfQUZOgTi8WfQpC3mIqZw1GdQxd+JBFn6GIqTFafyxEa2jUP2Yso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+w72L2k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD79C4CEE7;
	Sun, 21 Sep 2025 22:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758493657;
	bh=XsPgplYi8+wjn2NIA2VSHLyCnxyguHWdNakfzR5RU/o=;
	h=Date:Subject:From:To:Cc:Reply-To:References:In-Reply-To:From;
	b=X+w72L2k6rlJ6HbCh/1zMbvLRq5rgX+sCiXAqA7PK8dWEdRWU27HzOf/NQEgbmb3Q
	 3t9Lrj2nICdu9L9Bw489gQo7KXWo4RjheUjzm5pUQfLLyeUcbahlhA9wPKO2AVAQcH
	 fwF+bKId922LfaQGAL4RBVcGOv6q3UP/OFHTATpqPopH7KfiyBLJnMdJ5MFSGVhKMQ
	 lGATzoVCH31EvudYAH+zwGkSSfvoCeACMIZxOT5fUIkhuy6ENNaZlfnrY34cBR5BGH
	 SDPdl5g8//a2/+J6CNu3oIUtewefb7TwJ2ttr6VNdYrIybobT7+fLPHvfjTYaYfGeL
	 WMPDXjsoxM3Uw==
Message-ID: <c6c192a8-1d33-43b2-8131-6bad53f06d05@kernel.org>
Date: Sun, 21 Sep 2025 23:27:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
From: Bryan O'Donoghue <bod@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Bryan O'Donoghue <bod@kernel.org>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <_EY7CMwY6zRmzmm13Bo2V7im-VNhJRkSEhPkwo3PQnrA6Gxd5fVTyT_wRbBbN0VB7Nt8DKXVU88AwGEi0OYEvw==@protonmail.internalid>
 <20250921-kvm_rproc_pas-v3-6-458f09647920@oss.qualcomm.com>
 <W0IHn8rT1rbt5S-iZhk7vogi7VhtzK80LCjugAp0h0EmEH2kfhTG3eHXQnyRMEWt4JY9KcoADxEZqW5BgvbNpg==@protonmail.internalid>
 <591289e2-a5e3-4941-b8d4-85edac281013@kernel.org>
Content-Language: en-US
In-Reply-To: <591289e2-a5e3-4941-b8d4-85edac281013@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/09/2025 23:23, Bryan O'Donoghue wrote:
> Gunyah create

creates

---
bod

