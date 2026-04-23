Return-Path: <linux-arm-msm+bounces-104218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG+TA7XS6Wm9kgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:05:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6177944E4C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F9FD3015865
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 08:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC24299959;
	Thu, 23 Apr 2026 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="05nlUrvJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eSPXX4X4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d9+Wg/qi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gKc2cZhj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDAD363C49
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776931500; cv=none; b=CUK+fHwYcDe9Dxg/K1dVjhkFPTetYQjr9NXIieXSWYoSFura0rU5X/TZmuuOSjGrubKVB9EsmHFSHWw80v/OfUmREpWJQlVu6HAqYNSoX51VO00zw+YcrgCLQ3shNOWIOoAwwGb3ZeF7OJjCnXqXkKcwpbdDE9xGt/3huh4lOwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776931500; c=relaxed/simple;
	bh=ivVL4G+5Dm7yO3fR+PHexDZemYlAJNN24XgJPBocD/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njbvhBas7L+I+De9VVhH8+eqy906HoDE/wLFrFVkDrbCFXnRR8Z2ntt61lkJWSiw2e+xtlIVh/RIKmzwuUKoQGlhg2yyqsLGf9jfhPKFZGfytiekIjQY1B7m2h4Nxhn0pk+8rTup89X87Xj0y9OutBnjO2pjtKC7QfspCyJUq7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=05nlUrvJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eSPXX4X4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d9+Wg/qi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gKc2cZhj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 68CCC5BD44;
	Thu, 23 Apr 2026 08:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776931496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yhUM7Vf6n34pJ0M/2M3nLiOIzy0QxpK1YKF5BCoZRTk=;
	b=05nlUrvJIiT/M1OMd3fZblGyXN1E9HHszbEYtItE8YTZgtuLvRWqaVhzaPXs8Mqop7m6vO
	mV1/yE/q4k1VdujApJy3VK/Qdf9XB4GXZgMJcRGWIzkDADMt/ks1ljDsdymHqZIbClVF8D
	nTf71AjIpi7n2+W3I8V7BDAVqjeWCUo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776931496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yhUM7Vf6n34pJ0M/2M3nLiOIzy0QxpK1YKF5BCoZRTk=;
	b=eSPXX4X4n6MRsKhAWb6amwX/OXMBQKphpoBq+DGYmkzeYeclgvhNfjdFGe2wpvtx+AIeg7
	8ItslcFW4a6cieBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="d9+Wg/qi";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gKc2cZhj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776931491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yhUM7Vf6n34pJ0M/2M3nLiOIzy0QxpK1YKF5BCoZRTk=;
	b=d9+Wg/qiGFKbHkB0o1dvMUjZMUDv4Tj8EZEhPv14OKJMHCp1yHyueCpTMeU9uO5KXYIyHE
	c60m1UDHmlgAmMBaP2AOqZ5Va4U17z5X1n6etP8tRhfKFHDL9vqNUoePqH0ePQWW/uUyzi
	HKEczUPSnheB3Wn7TpaUASPsRB1trAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776931491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yhUM7Vf6n34pJ0M/2M3nLiOIzy0QxpK1YKF5BCoZRTk=;
	b=gKc2cZhjQ48FsY7lfMWvH3xA6kIrB1UMz76rghGo8gZw4vuGWdgQmFBplvEB8PexxqndSE
	xtL3ihwHvqyf13Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 143A8593A3;
	Thu, 23 Apr 2026 08:04:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9rb5AqPS6WlMWgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 23 Apr 2026 08:04:51 +0000
Message-ID: <47d757e7-3740-4e2a-af6d-239b7d4bbfac@suse.de>
Date: Thu, 23 Apr 2026 10:04:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] drm/msm: fbdev: Use client buffers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20260421125733.209568-1-tzimmermann@suse.de>
 <pcbuciyme6uh7hmduzzykuyacwelope6or5durvddzwfandtvb@wfjyexsjra5x>
 <tyeiktohirfdxqz4psxoxbvxogakabbnbdwcf6ado2um5sym2n@5h6ip5oj6ucj>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <tyeiktohirfdxqz4psxoxbvxogakabbnbdwcf6ado2um5sym2n@5h6ip5oj6ucj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-104218-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.105.105.114:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6177944E4C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi

Am 22.04.26 um 02:14 schrieb Dmitry Baryshkov:
> On Tue, Apr 21, 2026 at 07:08:31PM +0300, Dmitry Baryshkov wrote:
>> On Tue, Apr 21, 2026 at 02:51:13PM +0200, Thomas Zimmermann wrote:
>>> A client buffer holds the DRM framebuffer for an in-kernel DRM
>>> client. Until now, msm created an internal ad-hoc framebuffer for
>>> its fbdev emulation, while by-passing the regular interfaces used by
>>> user-space compositors.
>> I assume this was somewhat because we supported using the stolen memory
>> for FB. Support for it has been dropped when we moved to GPUVM.
>>
>> Rob, would it be possible to get it back at some point?
>>
>> Thomas, would the series prevent us from using the stolen memory for FB?
> And answering my question, no, we still can continue using stolen memory
> for the FB.

Indeed. The idea here is to keep the GEM buffer allocation as it is; 
including stolen memory.   Once all driver's fbdev emulation uses the 
client-buffer interfaces, we might be able to create the framebuffer in 
the shared fbdev helpers.

As I mentioned in my reply to patch 4, the GEM buffer object is 
something like fbdev framebuffer memory (i.e., video ram). In a later 
change, we could allocate all of the stolen memory unconditionally.

Best regards
Thomas

>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



