Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC8E7DB1C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2019 14:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbfHAMPV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Aug 2019 08:15:21 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55796 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbfHAMPV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Aug 2019 08:15:21 -0400
Received: by mail-wm1-f66.google.com with SMTP id a15so64411867wmj.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2019 05:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Aagu9W/ubb4X5ymrK2ozOiK3Ep+AoG04QTHQQYENEHk=;
        b=jSZ0DYo20Lse3oBCuziaTTy2OaNf25kG7DxLqT2P/ckZmCnsjzeZA4+ebbBe5NqNa9
         zXDg4owKoJR27sevUem8GuSH8bz5u1zagzKYuvJay4UU7djdJLWevnp18X8SmHO9KXDw
         KiP1CAX1hNeSjwt5htf1cDNu+SsMOTHZ6pSb3MAzfUngjpGCN2AbJFo4XcihNMtZt1Qh
         417rFiIhqZ8MvqZhyuKVmyCB7fNhCfXWLN9I1zOzHUWyLVz7U4kNBAOFK5tfTUHI9klS
         Dui1QkMax3ZyDC0dDlVs9Fyf3DPDxzjeK/qhq9en5mLQds8bQGqquygo1IgmLBHvLNjD
         vwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Aagu9W/ubb4X5ymrK2ozOiK3Ep+AoG04QTHQQYENEHk=;
        b=QfuLgzZfI8Bviy8ZUsn8XKPGejubvDbPdpzdoOPncRnsEXhhwBADn8sHTAAY9mpBDe
         bV+QJllD15ibIJLZ5xk/cN4qHviKMkWd4ytZav3UcPshGJPsI4JcMZ/Y+SNrktKkh6fL
         c4w03atOckUKpG50rYYJD2Yzolbf1Q+L8mhsYrANxlDl8noXFDjd95Ma9wFHZpYW7Oy9
         2YIvXwtFdmNdIk/YFqfxl5iNLjO+LG2tGk5S4ABL9Zs4EQASTfQQomzsc3rQsiHwg8Zb
         gNGVx+CJB+W5ZG4dKhuL2qRsUlE1gCcaudZkw8LnQm2lflRVlS0N0CmEMhGu8Qym9Kzz
         Y9cQ==
X-Gm-Message-State: APjAAAXoAN8M39hN2cz8EYTou8mFweEBXSA6hbeBg1Nj8XhA1eO5doFZ
        4iFw6jGg539IOBq9Xp9/zgAHqNbuRGA=
X-Google-Smtp-Source: APXvYqwMyK8Q3JRQSo7cIstSrD9W+dbpaB9d5bwZQvI+jYKT0Vg2frEzC49iGpSKocm9KjCiAu+PPA==
X-Received: by 2002:a1c:a8d7:: with SMTP id r206mr117061987wme.47.1564661718160;
        Thu, 01 Aug 2019 05:15:18 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id k63sm87640142wmb.2.2019.08.01.05.15.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 05:15:17 -0700 (PDT)
Subject: Re: [PATCH 02/13] drm/radeon: Eliminate possible use of an
 uninitialized variable
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        dri-devel@lists.freedesktop.org
Cc:     David Airlie <airlied@linux.ie>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mamta Shukla <mamtashukla555@gmail.com>, kernel@collabora.com,
        Anthony Koo <Anthony.Koo@amd.com>,
        linux-samsung-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        David Francis <David.Francis@amd.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sean Paul <sean@poorly.run>,
        Allison Randal <allison@lohutok.net>,
        amd-gfx@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Shawn Guo <shawnguo@kernel.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <65481afa-1104-4ee9-e53d-f2732a10d4b9@baylibre.com>
 <cover.1564591626.git.andrzej.p@collabora.com>
 <cfff357a07bfa572baad058947f281b7095e1794.1564591626.git.andrzej.p@collabora.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 mQENBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAG0KE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT6JATsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIW5AQ0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAYkBHwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8guQINBFYnf6QBEADQ+wBYa+X2n/xIQz/RUoGHf84Jm+yTqRT43t7sO48/cBW9vAn9
 GNwnJ3HRJWKATW0ZXrCr40ES/JqM1fUTfiFDB3VMdWpEfwOAT1zXS+0rX8yljgsWR1UvqyEP
 3xN0M/40Zk+rdmZKaZS8VQaXbveaiWMEmY7sBV3QvgOzB7UF2It1HwoCon5Y+PvyE3CguhBd
 9iq5iEampkMIkbA3FFCpQFI5Ai3BywkLzbA3ZtnMXR8Qt9gFZtyXvFQrB+/6hDzEPnBGZOOx
 zkd/iIX59SxBuS38LMlhPPycbFNmtauOC0DNpXCv9ACgC9tFw3exER/xQgSpDVc4vrL2Cacr
 wmQp1k9E0W+9pk/l8S1jcHx03hgCxPtQLOIyEu9iIJb27TjcXNjiInd7Uea195NldIrndD+x
 58/yU3X70qVY+eWbqzpdlwF1KRm6uV0ZOQhEhbi0FfKKgsYFgBIBchGqSOBsCbL35f9hK/JC
 6LnGDtSHeJs+jd9/qJj4WqF3x8i0sncQ/gszSajdhnWrxraG3b7/9ldMLpKo/OoihfLaCxtv
 xYmtw8TGhlMaiOxjDrohmY1z7f3rf6njskoIXUO0nabun1nPAiV1dpjleg60s3OmVQeEpr3a
 K7gR1ljkemJzM9NUoRROPaT7nMlNYQL+IwuthJd6XQqwzp1jRTGG26J97wARAQABiQM+BBgB
 AgAJBQJWJ3+kAhsCAikJEBaat7Gkz/iuwV0gBBkBAgAGBQJWJ3+kAAoJEHfc29rIyEnRk6MQ
 AJDo0nxsadLpYB26FALZsWlN74rnFXth5dQVQ7SkipmyFWZhFL8fQ9OiIoxWhM6rSg9+C1w+
 n45eByMg2b8H3mmQmyWztdI95OxSREKwbaXVapCcZnv52JRjlc3DoiiHqTZML5x1Z7lQ1T3F
 8o9sKrbFO1WQw1+Nc91+MU0MGN0jtfZ0Tvn/ouEZrSXCE4K3oDGtj3AdC764yZVq6CPigCgs
 6Ex80k6QlzCdVP3RKsnPO2xQXXPgyJPJlpD8bHHHW7OLfoR9DaBNympfcbQJeekQrTvyoASw
 EOTPKE6CVWrcQIztUp0WFTdRGgMK0cZB3Xfe6sOp24PQTHAKGtjTHNP/THomkH24Fum9K3iM
 /4Wh4V2eqGEgpdeSp5K+LdaNyNgaqzMOtt4HYk86LYLSHfFXywdlbGrY9+TqiJ+ZVW4trmui
 NIJCOku8SYansq34QzYM0x3UFRwff+45zNBEVzctSnremg1mVgrzOfXU8rt+4N1b2MxorPF8
 619aCwVP7U16qNSBaqiAJr4e5SNEnoAq18+1Gp8QsFG0ARY8xp+qaKBByWES7lRi3QbqAKZf
 yOHS6gmYo9gBmuAhc65/VtHMJtxwjpUeN4Bcs9HUpDMDVHdfeRa73wM+wY5potfQ5zkSp0Jp
 bxnv/cRBH6+c43stTffprd//4Hgz+nJcCgZKtCYIAPkUxABC85ID2CidzbraErVACmRoizhT
 KR2OiqSLW2x4xdmSiFNcIWkWJB6Qdri0Fzs2dHe8etD1HYaht1ZhZ810s7QOL7JwypO8dscN
 KTEkyoTGn6cWj0CX+PeP4xp8AR8ot4d0BhtUY34UPzjE1/xyrQFAdnLd0PP4wXxdIUuRs0+n
 WLY9Aou/vC1LAdlaGsoTVzJ2gX4fkKQIWhX0WVk41BSFeDKQ3RQ2pnuzwedLO94Bf6X0G48O
 VsbXrP9BZ6snXyHfebPnno/te5XRqZTL9aJOytB/1iUna+1MAwBxGFPvqeEUUyT+gx1l3Acl
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <7cacac43-737e-1ddb-2951-394fcf9ad0b2@baylibre.com>
Date:   Thu, 1 Aug 2019 14:15:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cfff357a07bfa572baad058947f281b7095e1794.1564591626.git.andrzej.p@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Andrzej,

I had to revert the previous patch, so you should re-spin it entirely :

================================
After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/radeon/radeon_connectors.c: In function 'radeon_add_legacy_connector':
drivers/gpu/drm/radeon/radeon_connectors.c:2433:5: error: 'ddc' undeclared (first use in this function)
     ddc = &radeon_connector->ddc_bus->adapter;
     ^~~
drivers/gpu/drm/radeon/radeon_connectors.c:2433:5: note: each undeclared identifier is reported only once for each function it appears in

Caused by commit

  bed7a2182de6 ("drm/radeon: Provide ddc symlink in connector sysfs directory")

I have used the drm-misc tree from next-20190731 for today.
==================================

Neil

On 31/07/2019 18:58, Andrzej Pietrasiewicz wrote:
> ddc local variable is passed to drm_connector_init_with_ddc() and should
> be NULL if no ddc is available.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/radeon/radeon_connectors.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
> index b3ad8d890801..d11131d03ed6 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -1870,7 +1870,7 @@ radeon_add_atom_connector(struct drm_device *dev,
>  	struct radeon_connector_atom_dig *radeon_dig_connector;
>  	struct drm_encoder *encoder;
>  	struct radeon_encoder *radeon_encoder;
> -	struct i2c_adapter *ddc;
> +	struct i2c_adapter *ddc = NULL;
>  	uint32_t subpixel_order = SubPixelNone;
>  	bool shared_ddc = false;
>  	bool is_dp_bridge = false;
> 

