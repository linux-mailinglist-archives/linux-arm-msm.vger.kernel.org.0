Return-Path: <linux-arm-msm+bounces-36452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6679B63F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 14:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AAFB281572
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 13:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119BB1E22ED;
	Wed, 30 Oct 2024 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VdYFrGDW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E8245023;
	Wed, 30 Oct 2024 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730294400; cv=none; b=TzQwyaV3Lfih4aY7OS8PNAkYlClcKKsU4RxMb6lnxh1161M3fwpJUkFKJmTQBdW4mbYI3UqbePMovBa/7oUU7RpkHVbRzN2Vjmy7ieC3l49CUBZM2aXEZpiZNxb2tPiOR5LA2kvcV8G4Mml5lzmWnisc9GEVK3DxLencSsfW+Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730294400; c=relaxed/simple;
	bh=9BXZE8ctKHlk8G6n9aKeSTsvv6Nq/CVpyvu2WPt6kpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSIvRNFrTtXPRqbGu1zh1AxvSnOgnDyPH98a14CYv39jhXP9ro1NlaFrBpb93qh1cFnhOykQV0ojJZ/PQLklHvlUVOb2VZQ64N2x5UKrZ/thyIMQhF6ay7ks6ni+sxBzm7P1pHsMiTqzb7KHUh34klZIGYtJ7hpZyEbj4kevv2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VdYFrGDW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730294397; x=1761830397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9BXZE8ctKHlk8G6n9aKeSTsvv6Nq/CVpyvu2WPt6kpw=;
  b=VdYFrGDWrUiNZxUI0ig54t88Ml1oEWE8TLCJe/t+EX8/GHUl+WRTsPPw
   R2HwDF97JKcmbEgr4F5lLK7lTHS0Zws0dK/nrH3+ctNREB0VT1bgqXAUH
   AdLbAvppkNYitognD7OgOxnA/bS8FalGJxL0quvV4C3vAJtoOI3Fiq0R9
   t51qPtv/LzSaTla7uOJds2EkQ+Re8bMItN3XqAZYrA3FZiCTpVleHHEVJ
   2vf6E1jokeLr9n104EeEGOq5I1sFDRGnoi4Av0Sw5M/b4Z6Ab+nSLDYcF
   4T9M2zRBErSleyaOTdeZ4KVOcpOgVv0tBhZ2HRjktKLF6PsfRi3Xax/Gh
   w==;
X-CSE-ConnectionGUID: NrR09Pj7TE271B1/fVmbtA==
X-CSE-MsgGUID: 1L275cuRRLy/2YgY8BsPzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="47468611"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="47468611"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 06:19:56 -0700
X-CSE-ConnectionGUID: nL7PYqFGSOm2vkyQGt6Ukw==
X-CSE-MsgGUID: mdn5Rj3cSWqoqn1T8KKfMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87097344"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa003.jf.intel.com with SMTP; 30 Oct 2024 06:19:52 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 30 Oct 2024 15:19:51 +0200
Date: Wed, 30 Oct 2024 15:19:51 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Rex Nie <rex.nie@jaguarmicro.com>
Cc: bryan.odonoghue@linaro.org, gregkh@linuxfoundation.org,
	linux@roeck-us.net, caleb.connolly@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, angus.chen@jaguarmicro.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] usb: typec: qcom-pmic: init value of
 hdr_len/txbuf_len earlier
Message-ID: <ZyIyd3QmUxUCqglH@kuha.fi.intel.com>
References: <20241030022753.2045-1-rex.nie@jaguarmicro.com>
 <20241030103256.2087-1-rex.nie@jaguarmicro.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030103256.2087-1-rex.nie@jaguarmicro.com>

On Wed, Oct 30, 2024 at 06:32:57PM +0800, Rex Nie wrote:
> If the read of USB_PDPHY_RX_ACKNOWLEDGE_REG failed, then hdr_len and
> txbuf_len are uninitialized. This commit stops to print uninitialized
> value and misleading/false data.
> 
> ---
> V2 -> V3:
> - add changelog, add Fixes tag, add Cc stable ml. Thanks heikki
> - Link to v2: https://lore.kernel.org/all/20241030022753.2045-1-rex.nie@jaguarmicro.com/
> V1 -> V2:
> - keep printout when data didn't transmit, thanks Bjorn, bod, greg k-h
> - Links: https://lore.kernel.org/all/b177e736-e640-47ed-9f1e-ee65971dfc9c@linaro.org/
> 
> Cc: stable@vger.kernel.org
> Fixes: a4422ff22142 (" usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>

Sorry, but this is still broken.

Those tags need to come before the "---". Otherwise they will not
end-up into the actual commit when this patch is applied.

It should look something like this:

        usb: typec: qcom-pmic: init value of hdr_len/txbuf_len earlier

        If the read of USB_PDPHY_RX_ACKNOWLEDGE_REG failed, then hdr_len and
        txbuf_len are uninitialized. This commit stops to print uninitialized
        value and misleading/false data.

        Cc: stable@vger.kernel.org
        Fixes: a4422ff22142 (" usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
        Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>
        ---
        V2 -> V3:
        - add changelog, add Fixes tag, add Cc stable ml. Thanks heikki
        - Link to v2: https://lore.kernel.org/all/20241030022753.2045-1-rex.nie@jaguarmicro.com/
        V1 -> V2:
        - keep printout when data didn't transmit, thanks Bjorn, bod, greg k-h
        - Links: https://lore.kernel.org/all/b177e736-e640-47ed-9f1e-ee65971dfc9c@linaro.org/

         drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 8 ++++----
         1 file changed, 4 insertions(+), 4 deletions(-)

        diff --git a/drivers/usb/typec...

thanks,

-- 
heikki

