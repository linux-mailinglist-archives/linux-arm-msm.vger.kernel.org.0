Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9FB1528216
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 12:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242700AbiEPK2u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 06:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242758AbiEPK2k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 06:28:40 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECE013E24;
        Mon, 16 May 2022 03:28:16 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 9914521F76;
        Mon, 16 May 2022 10:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1652696895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IbWdGpEaF5BmWaFq2MQ0/vY8Q/+HNZlu8w/vHFUL8w8=;
        b=v02j2CwKvtzqRWoBHPXGswk38lBgr2/4EVQ0iGLjzwP3pzl7CGYhOU60M+nsKaWKU/kpRR
        sWCI84kk3uR5Uct8YoaW6WvmtSZhQADjvFDgPy3YYeTdimgWpqDf+LmTwLa2VXIaD5gHFN
        OxBXc/88aZwq96Lg2g6WrQchKPAB0h8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1652696895;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IbWdGpEaF5BmWaFq2MQ0/vY8Q/+HNZlu8w/vHFUL8w8=;
        b=ejs6DnNNLBqhYQzEGCiZiLkfljgb3vZLJ8qe5yuVDsZwng7i/17oOORF4Dpc/AUiUcQ1V7
        rWsIyCJxO4oX1TCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CDD813ADC;
        Mon, 16 May 2022 10:28:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id vFOqDT8ngmLBKgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 16 May 2022 10:28:15 +0000
Message-ID: <5857c510-9783-a483-8414-65d7350618d6@suse.de>
Date:   Mon, 16 May 2022 12:28:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3] drm/probe-helper: Make 640x480 first if no EDID
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org
Cc:     quic_aravindh@quicinc.com, quic_khsieh@quicinc.com,
        jani.nikula@linux.intel.com, robdclark@gmail.com,
        quic_sbillaka@quicinc.com, ville.syrjala@linux.intel.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        swboyd@chromium.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------e1LEwrNpciWji2gXoobnf7xw"
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------e1LEwrNpciWji2gXoobnf7xw
Content-Type: multipart/mixed; boundary="------------YFrukezgSqQ100MX0GePfkJ0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: quic_aravindh@quicinc.com, quic_khsieh@quicinc.com,
 jani.nikula@linux.intel.com, robdclark@gmail.com, quic_sbillaka@quicinc.com,
 ville.syrjala@linux.intel.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Message-ID: <5857c510-9783-a483-8414-65d7350618d6@suse.de>
Subject: Re: [PATCH v3] drm/probe-helper: Make 640x480 first if no EDID
References: <20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
In-Reply-To: <20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>

--------------YFrukezgSqQ100MX0GePfkJ0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgRG91Z2xhcywNCg0KSSB1bmRlcnN0YW5kIHRoYXQgeW91J3JlIHRyeWluZyB0byB0ZWxs
IHVzZXJzcGFjZSB0aGF0IHRoZSBtb2RlbGlzdCBoYXMgDQpiZWVuIG1hZGUgdXAsIGJ1dCBp
dCdzIG5vdCBzb21ldGhpbmcgdGhhdCBzaG91bGQgYmUgZG9uZSB2aWEgZnJhZ2lsZSANCmhl
dXJpc3RpY3MgSU1ITy4NCg0KSSBsb29rZWQgYXQgdGhlIENocm9taXVtIHNvdXJjZSBjb2Rl
IHRoYXQgeW91IGxpbmtlZCwgYnV0IEkgY2Fubm90IHNheSANCndoZXRoZXIgaXQncyBkb2lu
ZyB0aGUgY29ycmVjdCB0aGluZy4gSXQgYWxsIGRlcGVuZHMgb24gd2hhdCB5b3VyIA0KcHJv
Z3JhbSBuZWVkcy4NCg0KSW4gdGhhdCBmdW5jdGlvbiwgeW91IGNvdWxkIGFsc28gc2VhcmNo
IGZvciAnRFJNX01PREVfVFlQRV9VU0VSREVGJy4gDQpJdCdzIHRoZSBtb2RlIHRoYXQgdGhl
IHVzZXIgc3BlY2lmaWVkIG9uIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lLiBJZiANCkNocm9t
aXVtJ3MgYXV0b21hdGljIG1vZGUgc2VsZWN0aW9uIGZhaWxzLCB5b3UnZCBnaXZlIHlvdXIg
dXNlcnMgZGlyZWN0IA0KY29udHJvbCBvdmVyIGl0LiAgV2hlbiB0aGVyZSdzIG5vIGZsYWdn
ZWQgbW9kZSBvciBpZiANCi9zeXMvY2xhc3MvZHJtL2NhcmQ8Li4uPi9zdGF0dXMgY29udGFp
bnMgInVuY29ubmVjdGVkIiwgeW91IGNhbiBhc3N1bWUgDQp0aGF0IHRoZSBtb2RlbGlzdCBp
cyBhcnRpZmljaWFsIGFuZCB0cnkgdGhlIG1vZGVzIGluIGFuIGFwcHJvcHJpYXRlIG9yZGVy
Lg0KDQpJZiB3ZSByZWFsbHkgd2FudCB0aGUga2VybmVsIHRvIGdpdmUgYWRkaXRpb25hbCBn
dWFyYW50ZWVzLCB3ZSBzaG91bGQgDQpoYXZlIGEgYnJvYWRlciBkaXNjdXNzaW9uIGFib3V0
IHRoaXMgdG9waWMgSU1ITy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTcuOC9zb3VyY2UvZHJpdmVycy9n
cHUvZHJtL2RybV9zeXNmcy5jI0wxOTYNCg0KQW0gMTMuMDUuMjIgdW0gMjI6MDYgc2Nocmll
YiBEb3VnbGFzIEFuZGVyc29uOg0KPiBJZiB3ZSdyZSB1bmFibGUgdG8gcmVhZCB0aGUgRURJ
RCBmb3IgYSBkaXNwbGF5IGJlY2F1c2UgaXQncyBjb3JydXB0IC8NCj4gYm9ndXMgLyBpbnZh
bGlkIHRoZW4gd2UnbGwgYWRkIGEgc2V0IG9mIHN0YW5kYXJkIG1vZGVzIGZvciB0aGUNCj4g
ZGlzcGxheS4gU2luY2Ugd2UgaGF2ZSBubyB0cnVlIGluZm9ybWF0aW9uIGFib3V0IHRoZSBj
b25uZWN0ZWQNCj4gZGlzcGxheSwgdGhlc2UgbW9kZXMgYXJlIGVzc2VudGlhbGx5IGd1ZXNz
ZXMgYnV0IGJldHRlciB0aGFuIG5vdGhpbmcuDQo+IE5vbmUgb2YgdGhlIG1vZGVzIHJldHVy
bmVkIGlzIG1hcmtlZCBhcyBwcmVmZXJyZWQsIGJ1dCB0aGUgbW9kZXMgYXJlDQo+IGN1cnJl
bnRseSBzb3J0ZWQgc3VjaCB0aGF0IHRoZSBoaWdoZXIgcmVzb2x1dGlvbiBtb2RlcyBhcmUg
bGlzdGVkDQo+IGZpcnN0Lg0KPiANCj4gV2hlbiB1c2Vyc3BhY2Ugc2VlcyB0aGVzZSBtb2Rl
cyBwcmVzZW50ZWQgYnkgdGhlIGtlcm5lbCBpdCBuZWVkcyB0bw0KPiBmaWd1cmUgb3V0IHdo
aWNoIG9uZSB0byBwaWNrLiBBdCBsZWFzdCBvbmUgdXNlcnNwYWNlLCBDaHJvbWVPUyBbMV0N
Cj4gc2VlbXMgdG8gdXNlIHRoZSBydWxlczoNCj4gMS4gVHJ5IHRvIHBpY2sgdGhlIGZpcnN0
IG1vZGUgbWFya2VkIGFzIHByZWZlcnJlZC4NCj4gMi4gSWYgbm8gbW9kZXMgd2VyZSBtYXJr
ZWQgYXMgcHJlZmVycmVkIHRoZW4gcGljayB0aGUgZmlyc3QgbW9kZS4NCj4gDQo+IFRoZSBy
dWxlcyBhYm92ZSBzZWVtIHByZXR0eSByZWFzb25hYmxlLCBidXQgdGhleSBoYXZlIHVuZm9y
dHVuYXRlIHNpZGUNCj4gZWZmZWN0IHRoYXQgd2hlbiB3ZSBoYXZlIG5vIEVESUQgcHJlc2Vu
dCB3ZSdsbCBkZWZhdWx0IHRvIHRoZSBoaWdoZXN0DQo+IHJlc29sdXRpb24gKGxlYXN0IGxp
a2VseSB0byB3b3JrKSBtb2RlLg0KPiANCj4gTGV0J3MgY2hhbmdlIHRoaW5ncyBzbGlnaHRs
eS4gSW4gdGhlIGNhc2Ugb2YgYSBmYWlsZWQgRURJRCByZWFkIHdlDQo+IHN0aWxsIHdvbid0
IG1hcmsgYW55dGhpbmcgcHJlZmVycmVkIGJ1dCB3ZSBfd29uJ3RfIHNvcnQgdGhlIG1vZGVz
IGF0DQo+IHRoZSBlbmQgb2YgZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVfY29ubmVjdG9yX21v
ZGVzKCkuIFRoZQ0KPiBkcm1fYWRkX21vZGVzX25vZWRpZCgpIGFkZHMgNjQweDQ4MCBmaXJz
dCBhbmQgc28gYnkgc2tpcHBpbmcgdGhlIGNhbGwNCj4gdG8gZHJtX21vZGVfc29ydCgpIGl0
IHdpbGwgc3RheSBmaXJzdC4gVGhhdCB3aWxsIGJlIGEgaGludCB0bw0KPiB1c2Vyc3BhY2Ug
dG8gZGVmYXVsdCB0byA2NDB4NDgwLg0KPiANCj4gVGhpcyBjaGFuZ2UgbWFrZXMgdXNlcnNw
YWNlIHRoYXQgYmVoYXZlcyBsaWtlIENocm9tZU9TIGRvZXMgY29tcGxpYW50DQo+IHdpdGgg
c2VjdGlvbiA0LjIuMi42IChFRElEIENvcnJ1cHRpb24gRGV0ZWN0aW9uKSBvZiB0aGUgRFAg
MS40YSBMaW5rDQo+IENUUy4gVGhhdCBzZWN0aW9uIGluZGljYXRlcyB0aGF0LCBhdCBsZWFz
dCBvbiBEUCwgaWYgd2UgaGF2ZSBhIGNvcnJ1cHQNCj4gRURJRCB1c2Vyc3BhY2UgbWF5IGFs
bG93IG90aGVyIG1vZGVzIHRvIGJlIHRyaWVkIGJ1dCBzaG91bGQgZGVmYXVsdCB0bw0KPiA2
NDB4NDgwIGluIHRoZSBhYnNlbmNlIG9mIG1vcmUgaW5mb3JtYXRpb24uIE5vdGUgdGhhdCBp
Zg0KPiBkcm1fYWRkX21vZGVzX25vZWRpZCgpIGV2ZXIgY2hhbmdlcyB0byBfbm90XyBsaXN0
IDY0MHg0ODAgZmlyc3Qgd2UNCj4gbWlnaHQgbmVlZCB0byBkbyBtb3JlIGhlcmUsIGJ1dCB0
aGF0IHNlZW1zIHVubGlrZWx5IGFuZCwgaW4gYW55IGNhc2UsDQo+IGl0IHdvdWxkIGJlIGNh
dWdodCBieSBhIGZ1dHVyZSBydW4gb2YgRFAgY29tcGxpYW5jZSB0ZXN0aW5nLg0KPiANCj4g
Tm90ZTogdGhpcyBjaGFuZ2UgY291bGQgcGF2ZSB0aGUgd2F5IHRvIGZ1cnRoZXIgaW1wcm92
ZW1lbnQgdG8NCj4gZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVfY29ubmVjdG9yX21vZGVzKCku
IFNwZWNpZmljYWxseSwgaW4gdGhlIGNhc2UNCj4gb2Ygbm8gRURJRCB3ZSBjb3VsZCBhZGQg
YWRkaXRpb25hbCAic3RhbmRhcmQiIG1vZGVzIHRoYXQgYXJlIHJpc2tpZXINCj4gdGhhbiAx
MDI0eDc2OCAodGhlIGN1cnJlbnQgbWF4IHdlIGFkZCkuIE5vdyB0aGF0IHdlJ3JlIGdpdmlu
Zw0KPiB1c2Vyc3BhY2UgdGhlIGhpbnQgdGhhdCBpdCBzaG91bGQgZGVmYXVsdCB0byA2NDB4
NDgwIHBlcmhhcHMgaXQgd291bGQNCj4gYmUgT0sgdG8gb2ZmZXIgdGhlIG9wdGlvbnMgb2Yg
dGhlIGhpZ2hlciByZXNvbHV0aW9uIG1vZGVzIGp1c3QgaW4gY2FzZQ0KPiB0aGV5IHdvcmsu
IFRoaXMgZnVydGhlciBpbXByb3ZlbWVudCBpcyBsZWZ0IGFzIGFuIGV4ZXJjaXNlIHRvIHRo
ZQ0KPiByZWFkZXIuDQo+IA0KPiBbMV0gaHR0cHM6Ly9zb3VyY2UuY2hyb21pdW0ub3JnL2No
cm9taXVtL2Nocm9taXVtL3NyYy8rL2EwNTFmNzQxZDBhMTVjYWZmMjI1MTMwMWVmZTA4MWMz
MGUwZjRhOTY6dWkvb3pvbmUvcGxhdGZvcm0vZHJtL2NvbW1vbi9kcm1fdXRpbC5jYztsPTQ4
OA0KPiANCj4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hy
b21pdW0ub3JnPg0KPiAtLS0NCj4gTm90ZSB0aGF0IHRoaXMgaXMgdGhlIHNlY29uZCBvZiB0
d28gcmVsYXRlZCBhbmQgc2ltaWxhci1zb3VuZGluZyBidXQNCj4gZGlmZmVyZW50IHBhdGNo
ZXMuIFNlZSBhbHNvICgiZHJtL3Byb2JlLWhlbHBlcjogRm9yIERQLCBhZGQgNjQweDQ4MCBp
Zg0KPiBhbGwgb3RoZXIgbW9kZXMgYXJlIGJhZCIpIFsyXS4gSSdtIGhvcGluZyB0byBsYW5k
IF9ib3RoXyBvZiB0aGUNCj4gcGF0Y2hlcyBzaW5jZSB0aGV5IGFkZHJlc3MgZGlmZmVyZW50
IGlzc3Vlcy4gVGhpcyBwYXRjaCBhZGRyZXNzZXMgdGhlDQo+IGNhc2Ugb2YgYSBjb3JydXB0
IEVESUQgYW5kIGhhdmluZyA2NDB4NDgwIGJlIHRoZSBkZWZhdWx0IGluIHRoZQ0KPiAiZ3Vl
c3NlZCIgbW9kZXMuIFRoZSBvdGhlciBwYXRjaCBoYW5kbGVzIHRoZSBjYXNlIHdoZXJlIHRo
ZSBFRElEDQo+IF9pc24ndF8gY29ycnVwdCBidXQgYWxsIHRoZSBtb2RlcyBsaXN0ZWQgY2Fu
J3QgYmUgbWFkZSB3aXRoIHRoZQ0KPiBleGlzdGluZyBzaXR1YXRpb25zLiBUaGUgdHdvIHBh
dGNoZXMgY2FuIGxhbmQgaW4gZWl0aGVyIG9yZGVyLg0KPiANCj4gQWxzbyBub3RlIHRoYXQg
SSBkaWRuJ3QgY2FycnkgYW55IFRlc3RlZC1ieSAvIFJldmlld2VkLWJ5IHRhZ3Mgc2luY2UN
Cj4gdGhlIHBhdGNoIGlzIG5vdyBxdWl0ZSBkaWZmZXJlbnQgKHlldCBhZ2FpbiBmb3IgdjIg
dG8gdjMpLg0KPiANCj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMjA1MTAx
MzEzMDkudjIuMi5JNGFjN2Y1NWFhNDQ2Njk5ZjhjMjAwYTIzYzEwNDYzMjU2ZjZmNDM5ZkBj
aGFuZ2VpZA0KPiANCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSBEb24ndCBzZXQgcHJlZmVycmVk
LCBqdXN0IGRpc2FibGUgdGhlIHNvcnQuDQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIERv
bid0IG1vZGlmeSBkcm1fYWRkX21vZGVzX25vZWRpZCgpICdjYXVzZSB0aGF0J2xsIGJyZWFr
IG90aGVycw0KPiAtIFNldCA2NDB4NDgwIGFzIHByZWZlcnJlZCBpbiBkcm1faGVscGVyX3By
b2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMoKQ0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX3Byb2JlX2hlbHBlci5jIHwgMTQgKysrKysrKysrKysrLS0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9wcm9iZV9oZWxwZXIuYw0KPiBpbmRleCA2ODIzNTk1MTI5OTYuLjIxZGQ2MGYz
MGNjNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcm9iZV9oZWxwZXIu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jDQo+IEBAIC00
MjUsNiArNDI1LDcgQEAgaW50IGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5lY3Rvcl9t
b2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KPiAgIAlib29sIHZlcmJv
c2VfcHJ1bmUgPSB0cnVlOw0KPiAgIAllbnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzIG9sZF9z
dGF0dXM7DQo+ICAgCXN0cnVjdCBkcm1fbW9kZXNldF9hY3F1aXJlX2N0eCBjdHg7DQo+ICsJ
Ym9vbCBzb3J0X2xpc3QgPSB0cnVlOw0KPiAgIA0KPiAgIAlXQVJOX09OKCFtdXRleF9pc19s
b2NrZWQoJmRldi0+bW9kZV9jb25maWcubXV0ZXgpKTsNCj4gICANCj4gQEAgLTUxNiw4ICs1
MTcsMTYgQEAgaW50IGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5lY3Rvcl9tb2Rlcyhz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KPiAgIAkJY291bnQgPSBkcm1fYWRk
X292ZXJyaWRlX2VkaWRfbW9kZXMoY29ubmVjdG9yKTsNCj4gICANCj4gICAJaWYgKGNvdW50
ID09IDAgJiYgKGNvbm5lY3Rvci0+c3RhdHVzID09IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVj
dGVkIHx8DQo+IC0JCQkgICBjb25uZWN0b3ItPnN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVz
X3Vua25vd24pKQ0KPiArCQkJICAgY29ubmVjdG9yLT5zdGF0dXMgPT0gY29ubmVjdG9yX3N0
YXR1c191bmtub3duKSkgew0KPiAgIAkJY291bnQgPSBkcm1fYWRkX21vZGVzX25vZWRpZChj
b25uZWN0b3IsIDEwMjQsIDc2OCk7DQo+ICsJCS8qDQo+ICsJCSAqIFdhbnQgbG93ZXIgcmVz
IG1vZGVzLCBsaWtlIDY0MHg0ODAsIGZpcnN0LiBUaGF0IGluZGljYXRlcw0KPiArCQkgKiB0
byB1c2Vyc3BhY2UgdGhhdCB0aGVzZSBhcmUgImJldHRlciIgbW9kZXMuIFNpbmNlIHdlIGhh
dmUNCj4gKwkJICogbm8gRURJRCB0aGUgbW9kZXMgYXJlIGEgZ3Vlc3MgYW55d2F5LCBzbyBn
dWVzcyB0aGUgc2FmZXINCj4gKwkJICogbW9kZSBmaXJzdC4NCj4gKwkJICovDQo+ICsJCXNv
cnRfbGlzdCA9IGZhbHNlOw0KPiArCX0NCj4gICAJY291bnQgKz0gZHJtX2hlbHBlcl9wcm9i
ZV9hZGRfY21kbGluZV9tb2RlKGNvbm5lY3Rvcik7DQo+ICAgCWlmIChjb3VudCA9PSAwKQ0K
PiAgIAkJZ290byBwcnVuZTsNCj4gQEAgLTU3Niw3ICs1ODUsOCBAQCBpbnQgZHJtX2hlbHBl
cl9wcm9iZV9zaW5nbGVfY29ubmVjdG9yX21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IsDQo+ICAgCWlmIChsaXN0X2VtcHR5KCZjb25uZWN0b3ItPm1vZGVzKSkNCj4g
ICAJCXJldHVybiAwOw0KPiAgIA0KPiAtCWRybV9tb2RlX3NvcnQoJmNvbm5lY3Rvci0+bW9k
ZXMpOw0KPiArCWlmIChzb3J0X2xpc3QpDQo+ICsJCWRybV9tb2RlX3NvcnQoJmNvbm5lY3Rv
ci0+bW9kZXMpOw0KPiAgIA0KPiAgIAlEUk1fREVCVUdfS01TKCJbQ09OTkVDVE9SOiVkOiVz
XSBwcm9iZWQgbW9kZXMgOlxuIiwgY29ubmVjdG9yLT5iYXNlLmlkLA0KPiAgIAkJCWNvbm5l
Y3Rvci0+bmFtZSk7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4
ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBO
w7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------YFrukezgSqQ100MX0GePfkJ0--

--------------e1LEwrNpciWji2gXoobnf7xw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKCJz4FAwAAAAAACgkQlh/E3EQov+C7
6w/9EjxyAWV8Zxt2As/C/qK1z2rrznyCrnQNVe7CBT+zrIDGnqa2TG1Ekfi1xF1dnQP6v9KPgPwg
E19CxvPXvb2zB2fDSdyyV0ubvkcQtZHsj8nflWOFyvu3YLkXY4fHy7t2DxXV6DNbAbvJ3qEb+84v
Qe7lZr/gPEUAGVfaZLddMCBOjJLhdbR+r+lUUWBNScexIu8fF6oR5tmQOaa4ju0e9d87CdbMdfAs
MzcORy0D2Up2Auzc5h84/fmSRJaDYyCN8ROTJlAGb2aJR4In0yLKqI0+bi0YXgJ1Tgfs48M+rpM2
4urshvoboCJ0btP69us1YlFBpVIg/Pd7S3dZGwr6y3A4NXuWXJgJcrL1CxLOLp8gUUHEP4eqlt3H
FF3RKWXOS4WHezw75X6FcHLBTHgRPQTk1NqUGDczH+TubUaGYEHqYbESADRF0FgcvUAkgmVhPzDH
q8xat3QJty1rcXtgZP1615afPLIzUINFZCAItYEJRinPvvsWOq+V+RtZlVCpNMUhw17Wnc/9I/S3
PTfUA/aYUJ22KOnGhmP2w6JgOQ1a1umSnYajvnuH/c2KZtwnykmwdQ0Cir5WAwuphToyoQmZUKcV
MnIqz0bIDHKUjaxFTEm7MV4JPInqgnPPPHo5NTBXKqRge8upeCgcHqtMLQDCEg8YCF0vizxNow3r
ATI=
=/SuJ
-----END PGP SIGNATURE-----

--------------e1LEwrNpciWji2gXoobnf7xw--
