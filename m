Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E03C2416F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 09:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbgHKHMu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 03:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgHKHMt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 03:12:49 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37288C06174A;
        Tue, 11 Aug 2020 00:12:49 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h19so12326109ljg.13;
        Tue, 11 Aug 2020 00:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=7bmfSdcP8nAJ6eufJvnZyOOA5fmvgr+qxvCK6Eif1M8=;
        b=dp0taWtrZcdTBfRahr1KwjxanpDhAeW+LmzOYnbXNKFYs2UmRBHHKNsI3+zsCh72k+
         3PA75AfLdqW0ypTG+MckbCre9zWTtCc20U5kpS8H7QtjuGk4mdniioosZle2Bs8fS2hi
         c8ahMXv28FmeGZYOFYWkLfH28IEVn+st2cKfRLdHkMxG3MA6iKfUlCvlIeBGEPmUWhCv
         /yf1MYQRJUuesyS4IyQTYftirdQfremLX8InLveWiiMuX6DCha0XIoewAVMkuqXzmhgQ
         h2QQz5Z5s9OC020DL3xn4rMqY0CedZ3RZ1Z33b5TmBDYYyn0i2b0Bfq7N3QHaregiUdU
         rBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=7bmfSdcP8nAJ6eufJvnZyOOA5fmvgr+qxvCK6Eif1M8=;
        b=X6jjrju8WO5gf+J8slSL4EbFIPpkWvxXpB9/5wixMMR6C7Wbq8zfgYK+9fVlesfGhK
         M3Ai1cyJk/HhaHP+2dX/PXr+YQasz+6ebuy7pPZ3KlwVY5OdR8/AZttHEmfjYNAundgO
         vFUiGqp4ckg9iUoF0biuLid+clYee9sMRGwITTsxWlt6PDy1ke213Qg3zdXjtbrXIqI8
         eNpeiamRe8iDwiT8OuLnyIZJlrbHcgdf/sSpSS+zkQXIH1/Rxczbq33x1OMznlPKEY9G
         VXLVIiWrwVJ0QRJaEIEpp9rMlzXPatHLhm1I6tO9pd05I2O6ldCJmPqNvqEGexpJpb1V
         l0NA==
X-Gm-Message-State: AOAM531dU+I1Zg6DaBVJ2HKvTcM8uomdt8mJ5K6Mr5wVAhRzvETPnUdt
        2oVrGkkqkzV1L11sMgMv65JgTCSuaNE=
X-Google-Smtp-Source: ABdhPJxRuWMchbZpnBgVASzaeeTvW03Mo41per/jH9BlTQnm/4RZmD3Ce0Kf6Te/n5xLF+SccGNSCQ==
X-Received: by 2002:a2e:6808:: with SMTP id c8mr2580495lja.13.1597129967438;
        Tue, 11 Aug 2020 00:12:47 -0700 (PDT)
Received: from saruman ([194.34.132.58])
        by smtp.gmail.com with ESMTPSA id s1sm11520605lfi.76.2020.08.11.00.12.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Aug 2020 00:12:46 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org
Subject: Re: [RFC v4 1/3] usb: dwc3: Resize TX FIFOs to meet EP bursting requirements
In-Reply-To: <b0c8a95b-45e3-0d79-2a7c-14c8936dd551@codeaurora.org>
References: <20200624022848.7765-1-wcheng@codeaurora.org> <20200624022848.7765-2-wcheng@codeaurora.org> <87d03yptxi.fsf@kernel.org> <b0c8a95b-45e3-0d79-2a7c-14c8936dd551@codeaurora.org>
Date:   Tue, 11 Aug 2020 10:12:41 +0300
Message-ID: <877du5pseu.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Wesley Cheng <wcheng@codeaurora.org> writes:
> On 8/10/2020 5:27 AM, Felipe Balbi wrote:
>> Wesley Cheng <wcheng@codeaurora.org> writes:
>>=20
>> Hi,
>>=20
>>> Some devices have USB compositions which may require multiple endpoints
>>> that support EP bursting.  HW defined TX FIFO sizes may not always be
>>> sufficient for these compositions.  By utilizing flexible TX FIFO
>>> allocation, this allows for endpoints to request the required FIFO dept=
h to
>>> achieve higher bandwidth.  With some higher bMaxBurst configurations, u=
sing
>>> a larger TX FIFO size results in better TX throughput.
>>=20
>> how much better? What's the impact? Got some real numbers of this
>> running with upstream kernel? I guess mass storage gadget is the
>> simplest one to test.
>>=20
> Hi Felipe,
>
> Thanks for the input.
>
> Sorry for not including the numbers in the patch itself, but I did
> mention the set of mass storage tests I ran w/ the upstream kernel on
> SM8150 in the cover letter.  Let me just share that here:
>
> Test Parameters:
>  - Platform: Qualcomm SM8150
>  - bMaxBurst =3D 6
>  - USB req size =3D 256kB
>  - Num of USB reqs =3D 16
>  - USB Speed =3D Super-Speed
>  - Function Driver: Mass Storage (w/ ramdisk)
>  - Test Application: CrystalDiskMark
>
> Results:
>
> TXFIFO Depth =3D 3 max packets
>
> Test Case | Data Size | AVG tput (in MB/s)
> -------------------------------------------
> Sequential|1 GB x     |
> Read      |9 loops    | 193.60
> 	  |           | 195.86
>           |           | 184.77
>           |           | 193.60
> -------------------------------------------
>
> TXFIFO Depth =3D 6 max packets
>
> Test Case | Data Size | AVG tput (in MB/s)
> -------------------------------------------
> Sequential|1 GB x     |
> Read      |9 loops    | 287.35
> 	  |           | 304.94
>           |           | 289.64
>           |           | 293.61
> -------------------------------------------

awesome, thanks a lot for this :-) It's a considerable increase in your
setup. My only fear here is that we may end up creating a situation
where we can't allocate enough FIFO for all endpoints. This is, of
course, a consequence of the fact that we enable one endpoint at a
time.

Perhaps we could envision a way where function driver requests endpoints
in bulk, i.e. combines all endpoint requirements into a single method
call for gadget framework and, consequently, for UDC.

>>> +	if (!dwc->needs_fifo_resize)
>>> +		return 0;
>>> +
>>> +	/* resize IN endpoints except ep0 */
>>> +	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <=3D 1)
>>> +		return 0;
>>> +
>>> +	/* Don't resize already resized IN endpoint */
>>> +	if (dep->fifo_depth)
>>=20
>> using fifo_depth as a flag seems flakey to me. What happens when someone
>> in the future changes the behavior below and this doesn't apply anymore?
>>=20
>> Also, why is this procedure called more than once for the same endpoint?
>> Does that really happen?
>>=20
> I guess it can be considered a bug elsewhere (ie usb gadget or function
> driver) if this happens twice.  Plus, if we decide to keep this in the
> dwc3 enable endpoint path, the DWC3_EP_ENABLED flag will ensure it's
> called only once as well.  Its probably overkill to check fifo_depth here.

We could add a dev_WARN_ONCE() just to catch any possible bugs elsewhere.

>>> +	if (remaining < fifo_size) {
>>> +		if (remaining > 0)
>>> +			fifo_size =3D remaining;
>>> +		else
>>> +			fifo_size =3D 0;
>>> +	}
>>> +
>>> +	fifo_size +=3D fifo;
>>> +	fifo_size++;
>>=20
>> why the increment?
>>=20
> This is to account for the last +1 in the equation from the DWC3 databook:
> fifo_size =3D mult * ((max_packet + mdwidth)/mdwidth + 1) + 1 <- this one

great, could you add this detail as a comment so it doesn't look as
cryptic? :-)

>>> +	return 0;
>>> +}
>>> +
>>>  static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int=
 action)
>>>  {
>>>  	const struct usb_ss_ep_comp_descriptor *comp_desc;
>>> @@ -620,6 +731,10 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep =
*dep, unsigned int action)
>>>  	int			ret;
>>>=20=20
>>>  	if (!(dep->flags & DWC3_EP_ENABLED)) {
>>> +		ret =3D dwc3_gadget_resize_tx_fifos(dep);
>>> +		if (ret)
>>> +			return ret;
>>=20
>> doesn't it look odd that you're resizing every fifo every time a new
>> endpoint is enabled? Is there a better way to achieve this?
>>=20
> We're only resizing a single fifo per call, and clearing the previous
> fifo configuration upon receiving the set address.  In the past, I know
> the change was to resize all fifos after receiving the set configuration
> packet.  With that approach, I believe we saw issues with some function
> drivers that immediately queued a USB request during their set_alt()
> routine, followed by the dwc3 ep0 driver calling the TX fifo resize
> API.(as the tx fifo resize was executed after we delegated the set
> config packet to the USB composite)

I don't remember seeing such an issue. Allocating FIFOs after we know
the entire requirements would avoid another possible situation, that of
dwc3 exausting FIFO space before it knows there are more enpdoints to
enable.

One possibility around this was suggested above, something along the
lines of:

	usb_gadget_ep_enable_bulk(struct usb_gadget *, struct
		usb_ep_alloc_desc *alloc_desc)

(please think of better names, I'm hopeless haha)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8yROkACgkQzL64meEa
mQYsgw//VrujRt4ABbuiEhJpUVG0Uu0meU5L8aQMg+eTI3U55m2TViV+G+sIs1+T
JjE8Ly1rGqaBL+M3uf38+XNqaHL63J25udIgKeycTb3hOurfQMbqIXUBmVmaMe7l
XGIu4oGw7K4iH0VyqTomvfnWidVRgJMYygv6OFMiSkgGugWW2A4wJ5Wum/+8VweB
YpNSOXC7rp12Ws/cL3+760sJPEqS1FrND33MEilIVJh2nWUk8UEalBo16+OCcf7Y
IzWP+ek6355TiKbCvTCE9OMhg1AySEF3nzXrne1LJkZGBYJrUZ0dQh7h6mmdPZIy
jRwspFEu0eNHDdpuKdCuMurVNc6rJR9RXFsCQJSUFXDig8KJOMlRVO5GlsmHhfjt
VEdHhej0ZZDxL+M49Af9OBV6VXE0KrUE2FU7j/wotYV+A+7pn+5M1/aMaBFy62OA
96EjNiPBGf9O/6fvhCt3zFp+d+g2el0A7Jbha9N8W+aHQM8YOiQ9pW+ulqQh2du5
SoiTtmIzg0DBDlS6Kei4w04e/keD+vn09ALLsbaKE1E3swDq5t8ZKlek2GErugNO
LegzKyzJe9f5mop1EE0L/1xVzGI1bhcYeDHfPJt3LlWess2XxVZ5+ysGklD4Fs0u
bBLlQ3EvO7vyzN/GntKDZjyr/DuHqEQ+MCp4YbkolTu2HYhqxb4=
=vvEl
-----END PGP SIGNATURE-----
--=-=-=--
