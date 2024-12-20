Return-Path: <linux-arm-msm+bounces-43006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3BC9F9899
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 18:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F33931644CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 17:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE45122B5B7;
	Fri, 20 Dec 2024 17:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sux4smDW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAD522ACE5
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 17:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715663; cv=none; b=WRr10pVvlphFEDsmku3RALT6GVRO0steJzDOQtFGI7CXbVvEiCt0lbKaZ8fPgZdfPMi1bmY4CnpayoaaIvuXp6jroY7UwnaRicL/wHHBE6hzqZmI4ucRRW2PWFMYTxwe5NA+YdggPJCI+aq6XBVJD6/OZa0cp98FarlPuSYY/jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715663; c=relaxed/simple;
	bh=ftFlFL8Hf6gjCPdcRFrVx2YclVhyvU0X+h6fy2EfzIQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cFO3PXzGsB6yixtV/5l0MAknzrfdpXUu4gXI6KNn9m3t3JXaOeDaBwkBabo9S53Yi5b5hTn0zg0PK2jgBiYr9aW3Dy4Ln7JPbMbua/zDGJWwKKNCPfgwfJ5cKid3cBo4D8hpMXMzCqCrGWNmHGcWXedVvFhsPzDkymmibR1m6c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sux4smDW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385e87b25f0so2163227f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734715658; x=1735320458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl2GUGW1SKIB73yuGvAyVPoBfBy5XbBiVj4hV5yN+VI=;
        b=Sux4smDWvhRYVAocCLrB8sH5Gn4iglVnvLOtYXjw2SwmbrW98B6c98IdTir+VF+VQJ
         W10BWI4R3GFC1zT/iJoBlxuzYK0hnggsfABamHJxaKShxH8tLAyw6SYs1kiT5Zpq5DY/
         y8F5G+SxDNISHMSnfr/J8ZC+W2oNrTFwJ0KMsYltX1nRmRejzvK8hykx9rw4E4PSCPjK
         hBR+wlIXLMxbiloh7lXnf5z8TBJg0j3ePqZ9LWqb7cYYzpaMr36BzlgWIDpW6dDQHpe5
         znRcS8BpCe/go3BIeiuQzZZSpEoYEyOJCj8IeINw++6FJJgIOUIPFK+PvAzsigdqsUly
         aZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715658; x=1735320458;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl2GUGW1SKIB73yuGvAyVPoBfBy5XbBiVj4hV5yN+VI=;
        b=a1POXCZT+wgSWuYGCWkGiIXxKJ62fr8TNlXPBGHSmhXFaZ1k1Gdfnjnf+Wflyq6xQj
         RBuhQPCKYVjC2XET7pmvI2g42qeFBIPXyNrYUmjDJPY8K3XB3+5tNXeNiOQyqYo6bbJm
         0eQf5ZJYm0fszHWXIe8dx5QYAusQhYWnV2/YbPnGtWszy5iDC5TTWbGb6F0kfsOBCpxT
         kSfv5HDRxXTqoC3yLAfqaS0i9YNTOLGrgztDTOSBl4ImN9S1Ksb8Czw/uh0bau3ZlNNH
         fIv6svoZdDFRx61oyeWbCQ5XJV2YeIqWC/tGLl9yGWI8SUtKTBxjOI/pJfiaV2/rABoU
         eRuA==
X-Forwarded-Encrypted: i=1; AJvYcCW9JbBOQgd2i1AGoxkXYo8kAneLYX/kPkJy+4WfgDkaVLfa7JnHkYxNcGZPu9oDAIbZR9JMLNHEBcd3tbyL@vger.kernel.org
X-Gm-Message-State: AOJu0YyWFYmit1hJHpVQMR1VYqjyXxPjBuMzrrk+2L75aYvvzEnugKvL
	wTzMx2rT0+c7yw70rE9bFKPSBIbhm1YgKpH11NUCzUaBFuIwaQgDN7cwJNlVY/+oc1DzqZTTEFf
	YAn8=
X-Gm-Gg: ASbGncsXrSOhVzx5v8/HWZJTAU1whHg22R/Z/DsgCppNmfzxcVTAYgMC7U3fj9iT2Cl
	t/Fc+ADdui5eS4lxX59oBr2G49CUBS9hwNL/x+aW8qyiVyG8OlIMy2pB4fvFQyVveK0bpj7ikLP
	cb4ilpx3SgOWBvgJrb7//eEacMVCmlvNSKUsv/k+DP6Wqb4WZ/rQqKH4gyb5WVS56WgGpOBAcMP
	PwUTGFWelb3224g/+RsjtmhxxS06DeCnyHonrl3OcJ9B+WlM6nm3PjTogwYmO2gvCrEk6fV+SI=
X-Google-Smtp-Source: AGHT+IHQofl14bIpVpiQqz6qAEwAjKsEmWVjRCOjis6wH9jKfvKMjWLHCbYlsDgmYPDOjR7ci+Y7xw==
X-Received: by 2002:a5d:47c3:0:b0:388:cacf:24b0 with SMTP id ffacd0b85a97d-38a1a1f7253mr6745803f8f.2.1734715658179;
        Fri, 20 Dec 2024 09:27:38 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e357sm4642915f8f.72.2024.12.20.09.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:27:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, audit@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-usb@vger.kernel.org, linux-mm@kvack.org, 
 maple-tree@lists.infradead.org, alsa-devel@alsa-project.org, 
 Sanyog Kale <sanyog.r.kale@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, dccp@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, 
 drbd-dev@lists.linbit.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-leds@vger.kernel.org, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org, tipc-discussion@lists.sourceforge.net, 
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 linux-trace-kernel@vger.kernel.org, Neil Brown <neilb@suse.de>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org, 
 intel-wired-lan@lists.osuosl.org
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 00/35] Reorganize kerneldoc parameter names
Message-Id: <173471565665.227782.7244101246430956449.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 17:27:36 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Mon, 30 Sep 2024 13:20:46 +0200, Julia Lawall wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> The misordered cases were identified using the following
> Coccinelle semantic patch:
> 
> // <smpl>
> @initialize:ocaml@
> @@
> 
> [...]

Applied, thanks!

[31/35] slimbus: messaging: Reorganize kerneldoc parameter names
        commit: 52d3d7f7a77ee9afc6a846b415790e13e1434847

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


