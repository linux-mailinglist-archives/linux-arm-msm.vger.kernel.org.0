Return-Path: <linux-arm-msm+bounces-87795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C22CFC547
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 08:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E4943029C46
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 07:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6899D2765F8;
	Wed,  7 Jan 2026 07:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pAWBDTJO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C93526E6F3;
	Wed,  7 Jan 2026 07:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767770704; cv=none; b=L8yqz2HrddvQQyXKla+0UyAsnyDyCS0FXMYdnTX7ySppfD9dL5iZX05IiZt6dXUOnyWtWuxHTAN1tQl9x4e83lhEia1yRX6Poi77JYPONBlzViOEQTS9TPbxLY2uZ0QmVBOXknkTKjCYgKCEBWRxM0vMy2ATSI6V4HdBF6TuWSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767770704; c=relaxed/simple;
	bh=pHB0cf2hDba8QTFFIDsIyGp2bQMgAQjjyqVQk9Dp5N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNkv4Tnk/wS+DkeeivespEMxWYb1+sb/R2+Z61haEonkW5q0yUw3z/IJy+FXxPYy4ln9UYaKPHoNZuHfWJaH4JDnVZVSYGBNhrF5HEhw3f6L06LIZOFkcLzzf4gQTPPEIPmnRHXu/ujwTzwoVIqRNzSuO2rXlI4WIKsG4+fLsLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pAWBDTJO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0C2C4CEF7;
	Wed,  7 Jan 2026 07:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767770703;
	bh=pHB0cf2hDba8QTFFIDsIyGp2bQMgAQjjyqVQk9Dp5N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pAWBDTJOrrZWXMzNS4MTwgSZKtwjZhKnWOtEsdKSQUprVdMul9BJGqH6S5JRaO6Yz
	 LscXJWRM2zuLKimpfimhVnTLjnGvYzHUfWvLjTFBUo4PzUebi7MVl0Laff0/+a59h2
	 IbGjliiMB/ZKT/kKDD8+UN2kADFdZMj0d/Q0HrX4=
Date: Wed, 7 Jan 2026 08:25:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
	andersson@kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
	quic_arandive@quicinc.com, quic_shazhuss@quicinc.com,
	quic_cchiluve@quicinc.com
Subject: Re: [PATCH v1] serial: qcom_geni: Fix BT failure regression on RB2
 platform
Message-ID: <2026010746-maker-oink-39fb@gregkh>
References: <20260107064834.1006428-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107064834.1006428-1-praveen.talari@oss.qualcomm.com>

On Wed, Jan 07, 2026 at 12:18:34PM +0530, Praveen Talari wrote:
> A regression in linux-next causes Bluetooth functionality to fail during
> bootup on the RB2 platform, preventing proper BT initialization. However,
> BT works correctly after bootup completes.
> 
> The issue occurs when runtime PM is enabled and uart_add_one_port() is
> called before wakeup IRQ setup. The uart_add_one_port() call activates the
> device through runtime PM, which configures GPIOs to their default state.
> When wakeup IRQ registration happens afterward, it conflicts with these
> GPIO settings, causing state corruption that breaks Bluetooth
> functionality.
> 
> Fix this by moving runtime PM enablement and uart_add_one_port() after
> wakeup IRQ registration, ensuring proper initialization order.
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Closes:
> https://lore.kernel.org/all/20251110101043.2108414-4-praveen.talari@oss.qualcomm.com/

No line wrapping for tags please.

thanks,

greg k-h

