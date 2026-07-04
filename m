Return-Path: <linux-arm-msm+bounces-116483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q+G3MS23SGq+swAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 09:33:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14D706F20
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 09:33:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=web.de header.s=s29768273 header.b=VIHTFpjW;
	dmarc=pass (policy=quarantine) header.from=web.de;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116483-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116483-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B915430057B2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 07:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D132F8EA4;
	Sat,  4 Jul 2026 07:32:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B18D39446D;
	Sat,  4 Jul 2026 07:32:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150374; cv=none; b=YKyEWGaT3VEu9IVSagRvT1I0nR2dj7RwQKbK3Y6OzFXqGDeBk7I6mUnjZk/YckOYhbrSIqH0cuIzCbRspx0Xu3ix5x5E3PnCqTELfVfMgvPkCNpVcsU9qIDk324zUdjRJ1xUnHa8zyfdF2o8+q7AcuZFoP6uBnogkhlDbzdwPWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150374; c=relaxed/simple;
	bh=u6cj08GQI/5+AXKJlkvrDogCstGVqPs4HlCNka1cj3E=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=YmiKeIXMZPaCnmIncSqylXz+zRpjx284xJs0jex01/23tqdTWZjfroj54T1zTjjjgHDzPZoxciqUrhYc0B7/x6/q8iOWpAvjFWizPnvHA/+K8i4RNi2XEPTDKe8zlHdhjWXq9MrcyihHR/BCWkqv4whnc7kxBcQzibRWjvcF9wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=VIHTFpjW; arc=none smtp.client-ip=212.227.15.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1783150338; x=1783755138; i=markus.elfring@web.de;
	bh=u6cj08GQI/5+AXKJlkvrDogCstGVqPs4HlCNka1cj3E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VIHTFpjWWNRgHr34VFRKDdlNGnom3rmOaqb6Z3s/3Xdb3Fg5eVFLENkC/um77Q/f
	 +zlEBvvaGs/yes0RxZsc8cf4oMKL3l/CznCU9H9KccIZy8TikTOx82C8WzvnfERwc
	 d/0Z50HqnDpOkIFyT2wu4CSpWAEUQ0nTX9qRvEYlDnMjnD7dRthTZwZ+/PAhLvttC
	 o4TGgK58Yo7NjiHL02ssCQFCGzok8a/znshQgJQuHQlnSPoFP/hGLjYSl6BfsZ8QN
	 R4Ut9F/LC4RF/yZyChykrHTgvBmzSREWhLfwkmAVsMZYeHT+GDeqQYbgtHN8mYplQ
	 0h1q383SbuCBYAB4DQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mpl4z-1xRIqd04Zp-00gLfQ; Sat, 04
 Jul 2026 09:32:18 +0200
Message-ID: <81accb2b-f3e4-4a66-8223-44fe70affc84@web.de>
Date: Sat, 4 Jul 2026 09:32:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260704072236.70862-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: wcd937x-sdw: Propagate regcache_sync()
 errors
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260704072236.70862-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:B5xDXjSH9hq4l0AlfBQDd2vgr8C3Pxsypt47EXrN0/gCl9duC85
 FvUs0Djv1BLJQHkSnizqz5jYhwirtq7cLTXYUP8R/Kl1OKxfOQdOSrnx6z/3rqgvOoBDQ8U
 zGKK7ho9dCzwAbTj4qoHM+ipMSbdSOH1QLkXHOa/sc83BrXT7CU8lxKhWs13nw7nxNE2YQY
 9ajXb0QMnNRPCTsmO8Trg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4P1j5bcjCQM=;9lYTvG+7v8uCznWfniMfOBFDGZO
 4zMRbSHYhg1JkfhTU7v4OtOA2g4ZH6X5/1aRYiGS5xSTz9JawVCgqaY45NVACC8g/ZmKf/7zp
 UwefAZ0QhtIY6oIDR+Qt0pkJzplO1SxuFOTTRynZ3h+BAfaypKA8GNMFqGWcN0q+SJzafRvWL
 IUkfFhnG4Th1AQ3J+/fe9RIQI3ArroFDffF3GlCui6fph/fuE+Rhbw/G05T+t/9lrws3VTDKQ
 nYR0lYTXAnsc/zc/x10DcWJNSsCd6nmbGSLxvOyK9LD+ONBnKFn0AP6eVNn33DoIBYyRC4V6+
 KV4oZ0G6uLz7hUdezYcTjSWKbsL2ndeNpTD62cZl4bRMGm3Mc0+CWXOYGW9jlG9O8B+CGUmU7
 PzEKWp2edpODwNc3ANSbdbcz2wA4PQ/79QxGhT+fWE0PBzXg0sX3N/yT79RNKTaDa+9s4w1mz
 3tX+87bm4yYF8wEaZdODa7Lewv/JJyVlHcGj23HfKVqOpmshdEIk7tmErub35FCDXtDHzZrKy
 LfOIHSrFWucAI1tXkhJBb0qZvHjDzYLze+PoF4krf9wli6A4sVdtsF/ruNk5toLPBh4cgbdCj
 npPdU0GxrzTiDPFLMT8P7XnArwISTrVUVaeYXpHU8R2US/RJ4eGwhiBw2A0bsVeUTCDWQrycM
 ksc7ZIJC7LCEnP1jly2xahojCI1t6dyyfjZJePVFYxv8o7PewLj2h44uWQ1huCUNNqNAue9LN
 EfWGZvP5pqQsBuOgyu4wo6exJEtzIA6+/YF/x6K2P3sKNVAu8MVYDqUddHfPDwLAuvRGYqTnw
 nuV2qDsB6hcl5raF50XcdikUcBXnT8rs1DCTnyr5uK3FQVvA9EqY1pI96t6Xre7Xu7Ga7nPBA
 0h7hs/knKMPJq/NqVjcyWrIZi2gOXJYebj02ZEFLL7keeU+EdBefWM6ltAf02h0otYc/ou4hx
 SgoLRGOn9BLc9ulCfy0SCmOXE2Qd0MNzSZlWeR10Figv/mqnpiKZoV2qqunLsAXbB+MBk//hE
 SvxBb0awXctbKKqkmwq33NXbd5qEsGSIyWQdowqOR2B/OivwcPJAZArv1vXMVRMxR/vwMHxrO
 1BnmMZ4UiGifqll//rXy5FqBu1wu9Ag5gnEjTXkxNQAcMsRRalMbUP/iFI7Q7wMXtRoJiCrke
 XbvTSiSt/nqhwz0Obb7S71knhWmY19Qy7KWgOVSfWRzNHYZFYl1MS9e7SL3qGz1xcdeqqBAh7
 hoFPycIU35J1nCdfUbAMBVnZv90iBhssyuifFZEoE1U1v/Q9qLCq0WbSrwT5qO5U+59fRDPCW
 R+OvFgHpgBTgLHs2/E2y5lT1idN7CX8M2xYYmom7m2vyQ7BG2H2MMYFxfo4jk0CfPjs1oOxt/
 AWzLnMcKomo2zSWyvC9eJ3B0+3qqBZ5peNvpDIXUYUPlRS3OFpdPYpbQVP/Gnmd0lFp0HAqfF
 YMaun8Ax7ROsuQYAFR6bwXPNb25sntQ74X+/jUn1xfTQrSavqr1KppZs2/zjzKm8XTX0WAAwY
 gcLq/Qa8MtlE66SOHuPCkPYTaeOvY5lyTgHEPtWE3YdhWdsDGbeBrqlU1y1PDMNKh7fO/HU9V
 FXcNB2LabSV1QCHwyhmY5ahJ5ZuaY6w9bfGJpYJAP+k0eHLMUUCGm3aedwflLJZ/tPLiNGWXU
 NCHQbNUHlj3+cNgUlAleD7yQtgG3GAOQCeSY8FShlsXMH+qk5pItz+9xeUlasPoIEtm251FrA
 gMUmsLGsqcV7cw9dzCzwpD6MwLdKaRy+t4ShYnk8b6enxEHXBvSmbui65u0VfArGufN3rh6tK
 DD7NF6tW+tj+8rpXv7TEReDnS8M0XMAC0pb0s6PDZLVO9QgVKocKJI9ZzpIWCTqTdwT9qq3W6
 EiMnyNgnxvVTXrEIFjph1kaw52yYDSPq2yF81j6c69gn9ANLdaRo4QJ74g9DpYiu4E1GXHDu9
 H3Zs9lt8k/4gPbCvxJzBu1YsT/oPEyu1MgZvoA6gE9Pvdqdapnm/5Ou2Rsq5S5r0mfVExwJyh
 d51KuCV5SXs1GcQ67xxsqwlZ2JXyYVKVSYHu//AYDEcQlSguqR2zx2MBDmDHk494pkFnEg8TZ
 wyqNafIQReGNwbhAFbJJ4qKjkCGtI4xfPRalvCmOiccQ35jB5t3rL0YenuCKn6+tNtB6v6sHb
 S0fTYMSh9oLQ/QkrK9hxn3RtonkzKl0eizLZBSrUa7nqq4mr7PDhw9XSVCMWsCAdMjGPDtGXQ
 wLmIX8gPxJKYfyihCkMgAo6PHWHrxqwcAYUzvF2zeFiFDuHZFkB1PpFFfduTCYBEwDeyu5AeN
 cNF+mTVPKxRwevWk3ZPKcoSAwq3M2RdCtTDRSKMEz1tQzgNWqMGQyruJLBIDhR6jpz7UI2IPM
 4JDzxfihQkKV/yEwwQvVXaKvdTZb6A+W3I5OPkJhpzw/fUqldXC60AS79t39jMmnlcPiS2u0+
 blXQXiF/SKzt+WV6TlFa7gubrHq37fW/GjKN+ul6Xr5KDvKQh9QjQWsnZeYMaKsPRYASoqafF
 cSFFDofFDXeArwHXJdCqsghw/FEWiuq0tX7smFmcDKxGyFHSGnAnHyRb7a80LnG4OPDF/OmjE
 Ap14qBOaHFU+O9Rs7lUyld+fiXr4edIjrnX4KhXl57DuKI9/OMC5kJvDJxn9sumMfcPdPSSIs
 LkN0zakgdcdKYBenYwLGK4d3+4T0SYuVE6cj9G277nfxzBqSufL45rhdLq9IqJIpb5HKIGqox
 tuiqdNFgBFvmmz+A+99bip5TjPq1u9o9llzFBmNuDStTIj2dBYPNMfh4Ite2clx9KfNw1tiil
 TJpQYqcEKbdv07yc9p/xdqd822PNz9Rk4V7nS9wor6uLxw5rl9lOWP/yCLekT5KKzFneRVTVP
 mwAC2p7+yBxxaz/366l5hWnZjiBsK+Iu1I65dJcwoYKTrN9578ylMkQjooWXDBVmLtfWn2nwP
 8Lykpsd3fQM6VN+jZZiFCXskPgwNwyT5FM2D+5S7uysanic87lQ9YLhLz3LYW3EyYY2TIqKpo
 IoKBY3qBfY1KFj/4SxsIZai8ybmkRGqHEVl1QHEt/d9WiAE6oFgi+R55lyXcGLBuPMJGF9GqF
 J1yfPUBljKTVbSPv4kb/wI+8H/1QE+dOCk/7U47MkpaZ+aSBkMGee8qPcQ4v2Y+hugdZi/4yw
 KhZ7zLrYa7o2XnJe0FqUsc+o6GiYDkJHAkOG3HC0bxt9XQJxAQOlQzSkRGnweBUxs+jyXkdiH
 L8zO7IvqLRb8akLNjTt/+K8WuY+2agGg4RubOI0iLxjgIjWVEiAq7pPS4E7uIfG64m1qt+6sc
 jwubQuBGxrCO4qXru2amhOC0zw2w8QGJ1GOA9pMAezljkV6j4T1mn3tXrcowBD4gtKCs5yAeQ
 1+ZXEm9NMuGKaG7KOsRQKvM+rRny1987NO9SefCb7i5ZcomFg0nNkubQw2HEY5Tii9HXAOpLb
 5i+HRwNwT6rbP0URkQtuQJXyty9AjCgGXP+cVkZTSeEVtYtDVYWlIMIYmyncSZb94z6ZyMfc6
 OkDXZVKnRrhR85cg2JmlTDuYolwERrMnLUvNjou34hQdnO98OfNqz/IKtHCTLoCKActXBjmT+
 j2rENPRVIzVlEx7NqOl3UxFkKEwHi9RLsPyHkBW9ICSJsVztKcG7iI59xV3rI38I9PG/1TeoE
 ZKWXeg7M8vA7emXEXC1q8oe5+LnpJM3mOTMrGCMiwHrKHwwmqJdebYte7WlfXD3rs0r50MV7Z
 etXskjiKEbYTA3qJ9WKit9Zkr3tZqpWPrBLxNLHUBb83smNdMi/8c3WqD9naIC4P4drACftvC
 u8vUXZ3QUxgn6+mXGMf1ZUCGGY770DrioGPa4NRMRbzwTi7lBdpaZUsqMByg02K486WJWwNxL
 beKFjsEzSWTk2GB+4h5b9Ti3D5zacbMUhWn+WBNAu+fbcS2DfC+jMj4oQmZp3PGqzmV7z51Ye
 oAurOvqVaX/KyWc+Elm1aIv77JM+TY/IXvEaHUmjJsUBRPcC7A+vV3ilWYOferfkl9zEly6Gc
 gdsmFe/wg0VS3/zV3GkSRce3qfNB2+nggesdseEq2i4fZMEDfN3gLws9h+Jzjz8AES6KIxPrG
 xiW9RvLaooyGr5N3OiFHbrQi7GjdAlxEl3dqlOIe5oEBaXwAHucIE9AVvc6F4v15wm5d9lPfm
 epAbsYoR8Js+3abyoieCoW87aNV+k2lsDlTcm9fF3Shj/9R1zfX/azwfosqkNzsavHidw2Abq
 cmyL5JhPG1WNTEkFyXbTM5DZYHG+211N7J0Nwu1ycok4owqJ6fri9LCxtHlu2rURJBwXX9Kc2
 q5qfP56v2iG2qa/nMMy7Fa3NIgC7CJ0tyES6x3jXGG8oTf7reBdGwKYL/E5BcNvHsoobfGDhU
 V1A0ZMM/agaCzM3fe8/t3AwJt4SvpReCiBTRhM3Bla2h6F+sM0Z3GsJchsOBM/jh61pVBM2J0
 a/IlJ7M/VWX6lJiSIujQFDv4mSEnTii8YKvHxPMkWrw4yc+dGyksR97Oeu/3JwJBkX8LCSjt2
 wMXLVeIidaQ6jWK0i4+mETGH7DKpCgn0rWVRnAFW+EXtF7azeN16KBIE+mZCdy+adLEjBMTzJ
 5fSYVwSnARdnKBdXbBOpy1tksGBbRqtHf1wuppYLZ5fd7zAtn6xZ/xuJfwYjH5G2ilRSUUH5u
 /DIQWbCVLn+MGDCnu19M5H3uXMsreB+4NkevN12tCMOTFE6PtwIWESqkRVCcSGdXZfpvMSgzf
 M8d5KnRp9HM9XKc9UZ2+Z/r6J3g+eoOX+aM3pf289PU0I38hD20u4Xd0TJKhaKAfODDBbk29q
 /11p5kvymw1tR/if1qyCFb+VEHC/1hN1deETLLk+aousb++UaFJiXblYkSr8Jw/7vaMIl/6zy
 ZJ1aZPCgLQHlIfchzGK83UAIh+e5Az6JDV+Q3q5UYxyo8JfhRhPsuEeTPWbSar0OD/wcfL5z3
 IQNDM7HwKyGo6zM+E1XnycYckWs0ljEufFM5IfRVg+U8G5pEqHn1sqXNrZHyeccIxHzn3kx6F
 W3MVZ/tXO4EwZkP9QbBShbUnrGki65Cv1zOI36K4qtXhho1P338pWphtdRD29hfq9qxE5t3K4
 E3kJ/GwkIiYwTkp5dfZCTj3g3gS5Hx5u1ci12xrtDSZgsKrzpAAlHX2h5bd122miUHUfVbomM
 fPPtbETG66V9Zgjm9RBTFihgw7gyWWuRftPwrpXgMuJ8Y5qVz7aPLavCnB2vYrxygpgl/1K4v
 hLoK/GjKsDPR5on9VdmJQQ2BQ1UlqPsN5rWxbGUehS3zhevlyF6mqgl89UN3tSMtqOLwhCaCJ
 /9jaDrrl/ZL2QBcDNI+3QA3yJ4Efb2xH5va77M3AIwqM8pZ2l7p+3wKT7UVYfFBkum26/4QP1
 nR2eJ4BE0wbiUCa2KiA9wINFo4DZ+NpBbn2I8XwnUTYNlqDj02/pi67ZG/oC6HQKNDp/SDdFD
 J2tSvq4H/ehxvnMicDBrvpO2kJ1u1bpebGUEyXtc0lMLha78r4Rc4de8VqHhn1E5zlsPbzhO3
 JWvu2P2ZSY1Tjh8n4f/dqbvtHD9isDopPMPAm0JcLVjJ8nGD2kcvu7CODEGf2y8QtJkVpmQ/N
 D9aFZB1t9yenpYUxkM=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:perex@perex.cz,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-116483-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,vger.kernel.org,perex.cz,gmail.com,kernel.org,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[web.de];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC14D706F20

=E2=80=A6
> Propagate the error and restore cache-only/dirty state on failure.
=E2=80=A6

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?

See also:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.2-rc1#n145
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv7.2-rc1#n34


Regards,
Markus

