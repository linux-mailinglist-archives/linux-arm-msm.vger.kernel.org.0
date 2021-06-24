Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 350AA3B2EA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 14:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbhFXML1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 08:11:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:57278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229448AbhFXML1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 08:11:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDF17613DC;
        Thu, 24 Jun 2021 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624536548;
        bh=1bF9//mc403rZp5trgsGdpRFYX2hU8FOa310qh23jGY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KYIxQGUyGdfM8HoY4AH6QsFG1376JJICmqb/HnTqaFxi3yrl0yENFg7Ccz702SAAs
         xLvrr9sQ4DhEqa8gU1Uq6WriFDMR1Hpwb7Zt+abMP2R6RmUGMt7Zs5WLNJ3dNK+P73
         cNIUoBkoyw8LGbP9MGmiMkI1NCKmzFqRf0SZCYUI=
Date:   Thu, 24 Jun 2021 14:09:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     balbi@kernel.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com,
        heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com
Subject: Re: [PATCH v10 2/6] usb: gadget: configfs: Check USB configuration
 before adding
Message-ID: <YNR14X77hZ+SDJeV@kroah.com>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <1623923899-16759-3-git-send-email-wcheng@codeaurora.org>
 <YMss5tFFBjokk1k6@kroah.com>
 <012b0264-107a-5596-d73f-3a2fd20470cf@codeaurora.org>
 <YNF9kv0kWAz6Pp00@kroah.com>
 <afe0c718-1c16-1b20-4b0c-d8592a13af42@codeaurora.org>
 <YNMcnISDv2e7bze1@kroah.com>
 <e7d70e8c-4574-808c-80f6-ae469937f35d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7d70e8c-4574-808c-80f6-ae469937f35d@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 23, 2021 at 02:44:31PM -0700, Wesley Cheng wrote:
> 
> 
> On 6/23/2021 4:35 AM, Greg KH wrote:
> > On Wed, Jun 23, 2021 at 02:38:55AM -0700, Wesley Cheng wrote:
> >>
> >>
> >> On 6/21/2021 11:05 PM, Greg KH wrote:
> >>> On Mon, Jun 21, 2021 at 10:27:09PM -0700, Wesley Cheng wrote:
> >>>>
> >>>>
> >>>> On 6/17/2021 4:07 AM, Greg KH wrote:
> >>>>> On Thu, Jun 17, 2021 at 02:58:15AM -0700, Wesley Cheng wrote:
> >>>>>> Ensure that the USB gadget is able to support the configuration being
> >>>>>> added based on the number of endpoints required from all interfaces.  This
> >>>>>> is for accounting for any bandwidth or space limitations.
> >>>>>>
> >>>>>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> >>>>>> ---
> >>>>>>  drivers/usb/gadget/configfs.c | 22 ++++++++++++++++++++++
> >>>>>>  1 file changed, 22 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> >>>>>> index 15a607c..76b9983 100644
> >>>>>> --- a/drivers/usb/gadget/configfs.c
> >>>>>> +++ b/drivers/usb/gadget/configfs.c
> >>>>>> @@ -1374,6 +1374,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
> >>>>>>  		struct usb_function *f;
> >>>>>>  		struct usb_function *tmp;
> >>>>>>  		struct gadget_config_name *cn;
> >>>>>> +		unsigned long ep_map = 0;
> >>>>>>  
> >>>>>>  		if (gadget_is_otg(gadget))
> >>>>>>  			c->descriptors = otg_desc;
> >>>>>> @@ -1403,7 +1404,28 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
> >>>>>>  				list_add(&f->list, &cfg->func_list);
> >>>>>>  				goto err_purge_funcs;
> >>>>>>  			}
> >>>>>> +			if (f->fs_descriptors) {
> >>>>>> +				struct usb_descriptor_header **d;
> >>>>>> +
> >>>>>> +				d = f->fs_descriptors;
> >>>>>> +				for (; *d; ++d) {
> >>>>
> >>>> Hi Greg,
> >>>>
> >>>> Thanks for the review and feedback.
> >>>>
> >>>>>
> >>>>> With this check, there really is not a need to check for
> >>>>> f->fs_descriptors above in the if statement, right?
> >>>>>
> >>>>
> >>>> f->fs_descriptor will carry the table of descriptors that a particular
> >>>> function driver has assigned to it.  The for loop here, will dereference
> >>>> the individual descriptors within that descriptor array, so we need to
> >>>> first ensure the descriptor array is present before traversing through
> >>>> the individual entries/elements.
> >>>
> >>> Ah, it's a dereference of an array element.  Subtle.  Tricky.  Messy :(
> >>>
> >>>>>> +					struct usb_endpoint_descriptor *ep;
> >>>>>> +					int addr;
> >>>>>> +
> >>>>>> +					if ((*d)->bDescriptorType != USB_DT_ENDPOINT)
> >>>>>> +						continue;
> >>>>>> +
> >>>>>> +					ep = (struct usb_endpoint_descriptor *)*d;
> >>>>>> +					addr = ((ep->bEndpointAddress & 0x80) >> 3) |
> >>>>>> +						(ep->bEndpointAddress & 0x0f);
> >>>>>
> >>>>> Don't we have direction macros for this type of check?
> >>>>>
> >>>>
> >>>> I don't believe we have a macro which would be able to convert the
> >>>> bEndpointAddress field into the bit which needs to be set, assuming that
> >>>> the 32bit ep_map has the lower 16bits carrying OUT EPs, and the upper
> >>>> 16bits carrying the IN EPs.
> >>
> >> Hi Greg,
> >>
> >>>
> >>> We have macros to tell if an endpoint is IN or OUT, please use those.
> >>>
> >>> And this "cram the whole thing into 64 bits" is not obvious at all.
> >>> Just pass around the original pointer to the descriptors if someone
> >>> wants to use it or not, don't make up yet-another-data-structure here
> >>> for no good reason.  We aren't so memory constrained we need to pack
> >>> stuff into bits here.
> >>>
> >>
> >> Hmm ok, what I can do is to move this logic into the check_config()
> >> callback itself, which is implemented by the UDC driver.  So now, the
> >> DWC3 will have to do something similar to what is done here, ie loop the
> >> EP descriptors for each function to determine the number of IN endpoints
> >> being used.
> 
> Hi Greg,
> 
> > 
> > We have common USB core functions for this, why can't you just use them?
> > 
> 
> So, I've tried to use pre-existing mechanisms there in the USB core, but
> they are not populated correctly at the time of function binding.  I
> will highlight some of the things I've tried, and why they do not work.
>  If possible, if you could point which core functions can achieve what
> we are trying to do here, that would help as well.

We have functions to detect the IN/OUT of an endpoint, use them.

We also have functions that determine how many endpoints of each type
that a device has, why can you not use them as well?  Are they only
valid for driver structures, not gadget ones?

>   - f->endpoints - This is a bitmap which carries the endpoints used by
> a particular function driver.  This does not work, as this is set during
> receiving the SET_CONFIG packet.  (we need this during the function
> driver binding stage)
> 
>   - gadget->in_epnum/gadget->out_epnum - This carries the count of
> endpoints used per configuration.  This would be perfect, but this count
> is only incremented when we are not matching EPs using the EP name.  So
> in designs where the EP name is used to match, it can not be used.
> 
>  - gadget->ep_list - I can use this now in the check_config() to iterate
> through the list of eps to see which ones have been claimed for a
> particular configuration.
> 
> So just to re-iterate, the TXFIFO resize logic kicks in when the host
> sends the SET_CONFIG packet, which is the "end" of USB enumeration.  We
> had discussed a concern previously where, what if we run the resize
> logic, and there is not enough internal memory.  We'd end up with an
> enumerated device w/ certain functions broken.

Where are you running out of memory?  In the gadget kernel?  Or
somewhere else?

> This is where the check_config() comes into the picture.  It uses the
> number of endpoints collected during the bind() stage, and checks to
> make sure the resize logic can at least allocate 1 TXFIFO per endpoint.
>  If it can not, then it will fail the bind sequence.

That's fine, I am just worried about your crazy "pack all the bits into
a u64 for no good reason" logic here.

thanks,

greg k-h
