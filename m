Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61FB313C64B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 15:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgAOOiN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 09:38:13 -0500
Received: from mga18.intel.com ([134.134.136.126]:12981 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726248AbgAOOiN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 09:38:13 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 06:38:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,322,1574150400"; 
   d="scan'208";a="273659015"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by FMSMGA003.fm.intel.com with SMTP; 15 Jan 2020 06:37:58 -0800
Received: by stinkbox (sSMTP sendmail emulation); Wed, 15 Jan 2020 16:37:57 +0200
Date:   Wed, 15 Jan 2020 16:37:57 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
        christian.koenig@amd.com, David1.Zhou@amd.com,
        maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
        robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
        vincent.abriou@st.com, yannick.fertre@st.com,
        philippe.cornu@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, eric@anholt.net,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
        bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 02/21] drm: Evaluate struct
 drm_device.vblank_disable_immediate on each use
Message-ID: <20200115143757.GZ13686@intel.com>
References: <20200115121652.7050-1-tzimmermann@suse.de>
 <20200115121652.7050-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200115121652.7050-3-tzimmermann@suse.de>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 15, 2020 at 01:16:33PM +0100, Thomas Zimmermann wrote:
> VBLANK interrupts can be disabled immediately or with a delay, where the
> latter is the default. The former option can be selected by setting
> get_vblank_timestamp, and enabling vblank_disable_immediate in struct
> drm_device.
> 
> The setup is only evaluated once when DRM initializes VBLANKs. Evaluating
> the settings on each use of vblank_disable_immediate will allow for easy
> integration of CRTC VBLANK functions.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_vblank.c | 31 ++++++++++++++-----------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 3f1dd54cc8bb..abb085c67d82 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -481,19 +481,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
>  
>  	DRM_INFO("Supports vblank timestamp caching Rev 2 (21.10.2013).\n");
>  
> -	/* Driver specific high-precision vblank timestamping supported? */
> -	if (dev->driver->get_vblank_timestamp)
> -		DRM_INFO("Driver supports precise vblank timestamp query.\n");
> -	else
> -		DRM_INFO("No driver support for vblank timestamp query.\n");
> -
> -	/* Must have precise timestamping for reliable vblank instant disable */
> -	if (dev->vblank_disable_immediate && !dev->driver->get_vblank_timestamp) {
> -		dev->vblank_disable_immediate = false;
> -		DRM_INFO("Setting vblank_disable_immediate to false because "
> -			 "get_vblank_timestamp == NULL\n");
> -	}

Which drivers are so broken they set vblank_disable_immediate to true
without having the vfunc specified? IMO this code should just go away
(or converted to a WARN).

> -
>  	return 0;
>  
>  err:
> @@ -1070,6 +1057,15 @@ int drm_crtc_vblank_get(struct drm_crtc *crtc)
>  }
>  EXPORT_SYMBOL(drm_crtc_vblank_get);
>  
> +static bool __vblank_disable_immediate(struct drm_device *dev, unsigned int pipe)
> +{
> +	if (!dev->vblank_disable_immediate)
> +		return false;
> +	if (!dev->driver->get_vblank_timestamp)
> +		return false;
> +	return true;
> +}
> +
>  static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> @@ -1086,7 +1082,7 @@ static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>  			return;
>  		else if (drm_vblank_offdelay < 0)
>  			vblank_disable_fn(&vblank->disable_timer);
> -		else if (!dev->vblank_disable_immediate)
> +		else if (__vblank_disable_immediate(dev, pipe))
>  			mod_timer(&vblank->disable_timer,
>  				  jiffies + ((drm_vblank_offdelay * HZ)/1000));
>  	}
> @@ -1663,7 +1659,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>  	/* If the counter is currently enabled and accurate, short-circuit
>  	 * queries to return the cached timestamp of the last vblank.
>  	 */
> -	if (dev->vblank_disable_immediate &&
> +	if (__vblank_disable_immediate(dev, pipe) &&
>  	    drm_wait_vblank_is_query(vblwait) &&
>  	    READ_ONCE(vblank->enabled)) {
>  		drm_wait_vblank_reply(dev, pipe, &vblwait->reply);
> @@ -1820,7 +1816,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
>  	 * been signaled. The disable has to be last (after
>  	 * drm_handle_vblank_events) so that the timestamp is always accurate.
>  	 */
> -	disable_irq = (dev->vblank_disable_immediate &&
> +	disable_irq = (__vblank_disable_immediate(dev, pipe) &&
>  		       drm_vblank_offdelay > 0 &&
>  		       !atomic_read(&vblank->refcount));
>  
> @@ -1893,7 +1889,8 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>  	pipe = drm_crtc_index(crtc);
>  
>  	vblank = &dev->vblank[pipe];
> -	vblank_enabled = dev->vblank_disable_immediate && READ_ONCE(vblank->enabled);
> +	vblank_enabled = __vblank_disable_immediate(dev, pipe) &&
> +			 READ_ONCE(vblank->enabled);
>  
>  	if (!vblank_enabled) {
>  		ret = drm_crtc_vblank_get(crtc);
> -- 
> 2.24.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Ville Syrjälä
Intel
