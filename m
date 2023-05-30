Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76B3771564A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 09:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbjE3HMr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 03:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbjE3HMp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 03:12:45 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 317F2A7;
        Tue, 30 May 2023 00:12:43 -0700 (PDT)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id E12AE1F889;
        Tue, 30 May 2023 07:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685430761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9tlETPpyhleeZ5cFOIa3Bmkb097K300AlT3drUIvyOg=;
        b=HaCFIGRGAJzqauLDbHV3jIj8zPnCXL/weQB8L5anGaQxdOAblna6P+ti/YBrKqrnN1ehgt
        MQ8Lhk9ffu8Yi39TV0Zbm3nHz84cASmnkzCdorRMXC2nxIth5EDLX3DdZGF4nNIrOKbcny
        NXKk3CsdwiWp+z9AN6rDQ+nNqSZlG6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685430761;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9tlETPpyhleeZ5cFOIa3Bmkb097K300AlT3drUIvyOg=;
        b=oeLEh5ZUkpebIhQruGrHcVn+Ryvo6HRXhrv27udWWN2YDTGDGb3SvnqpyJsh/GW9uC5jed
        3Nw9snQKafim+qAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8F2FB1341B;
        Tue, 30 May 2023 07:12:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id yhSBIOmhdWQ7dwAAGKfGzw
        (envelope-from <tzimmermann@suse.de>); Tue, 30 May 2023 07:12:41 +0000
Message-ID: <539118fc-ad60-ee3c-4a0c-1472774f5122@suse.de>
Date:   Tue, 30 May 2023 09:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4 13/13] drm/i915: Implement dedicated fbdev I/O helpers
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, javierm@redhat.com,
        dri-devel@lists.freedesktop.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230524092150.11776-1-tzimmermann@suse.de>
 <20230524092150.11776-14-tzimmermann@suse.de>
 <20230529193621.GD1370714@ravnborg.org>
Content-Language: en-US
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230529193621.GD1370714@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------102zqtLdF2GwOZ32o0ncrzQj"
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------102zqtLdF2GwOZ32o0ncrzQj
Content-Type: multipart/mixed; boundary="------------yaJuYe1kVrXFCbvMlvAu0kKY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-ID: <539118fc-ad60-ee3c-4a0c-1472774f5122@suse.de>
Subject: Re: [PATCH v4 13/13] drm/i915: Implement dedicated fbdev I/O helpers
References: <20230524092150.11776-1-tzimmermann@suse.de>
 <20230524092150.11776-14-tzimmermann@suse.de>
 <20230529193621.GD1370714@ravnborg.org>
In-Reply-To: <20230529193621.GD1370714@ravnborg.org>

--------------yaJuYe1kVrXFCbvMlvAu0kKY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMDUuMjMgdW0gMjE6MzYgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIFdlZCwgTWF5IDI0LCAyMDIzIGF0IDExOjIxOjUwQU0gKzAy
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSW1wbGVtZW50IGRlZGljYXRlZCBm
YmRldiBoZWxwZXJzIGZvciBmcmFtZWJ1ZmZlciBJL08gaW5zdGVhZA0KPj4gb2YgdXNpbmcg
RFJNJ3MgaGVscGVycy4gVXNlIGFuIGZiZGV2IGdlbmVyYXRvciBtYWNybyBmb3INCj4+IGRl
ZmVycmVkIEkvTyB0byBjcmVhdGUgdGhlIGZiZGV2IGNhbGxiYWNrcy4gaTkxNSB3YXMgdGhl
IG9ubHkNCj4+IGNhbGxlciBvZiB0aGUgRFJNIGhlbHBlcnMsIHNvIHJlbW92ZSB0aGVtIGZy
b20gdGhlIGhlbHBlciBtb2R1bGUuDQo+Pg0KPj4gaTkxNSdzIGZiZGV2IGVtdWxhdGlvbiBp
cyBzdGlsbCBpbmNvbXBsZXRlIGFzIGl0IGRvZXNuJ3QgaW1wbGVtZW50DQo+PiBkZWZlcnJl
ZCBJL08gYW5kIGRhbWFnZSBoYW5kbGluZyBmb3IgbW1hcGVkIHBhZ2VzLg0KPj4NCj4+IHY0
Og0KPj4gCSogZ2VuZXJhdGUgZGVmZXJyZWQtSS9PIGhlbHBlcnMNCj4+IAkqIHVzZSBpbml0
aWFsaXplciBtYWNyb3MgZm9yIGZiX29wcw0KPj4gdjI6DQo+PiAJKiB1c2UgRkJfSU9fSEVM
UEVSUyBvcHRpb25zDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGxpbnV4LmludGVsLmNvbT4NCj4+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0
aW5lbkBsaW51eC5pbnRlbC5jb20+DQo+PiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZp
dmlAaW50ZWwuY29tPg0KPj4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBs
aW51eC5pbnRlbC5jb20+DQo+PiBDYzogIlZpbGxlIFN5cmrDpGzDpCIgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICB8ICAgMyAtDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZmJfaGVscGVyLmMgICAgICAgICAgICB8IDEwNyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZpZyAgICAgICAgICAgICAgIHwgICAx
ICsNCj4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmRldi5jIHwg
IDE0ICstLQ0KPj4gICBpbmNsdWRlL2RybS9kcm1fZmJfaGVscGVyLmggICAgICAgICAgICAg
ICAgfCAgMzkgLS0tLS0tLS0NCj4+ICAgNSBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDE1NSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0KPj4gaW5kZXggOTJhNzgy
ODI3YjdiLi5iYjJlNDhjYzZjZDYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
S2NvbmZpZw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcNCj4+IEBAIC0xMzMs
OSArMTMzLDYgQEAgY29uZmlnIERSTV9GQkRFVl9FTVVMQVRJT04NCj4+ICAgCWJvb2wgIkVu
YWJsZSBsZWdhY3kgZmJkZXYgc3VwcG9ydCBmb3IgeW91ciBtb2Rlc2V0dGluZyBkcml2ZXIi
DQo+PiAgIAlkZXBlbmRzIG9uIERSTV9LTVNfSEVMUEVSDQo+PiAgIAlkZXBlbmRzIG9uIEZC
PXkgfHwgRkI9RFJNX0tNU19IRUxQRVINCj4+IC0Jc2VsZWN0IEZCX0NGQl9GSUxMUkVDVA0K
Pj4gLQlzZWxlY3QgRkJfQ0ZCX0NPUFlBUkVBDQo+PiAtCXNlbGVjdCBGQl9DRkJfSU1BR0VC
TElUDQo+PiAgIAlzZWxlY3QgRlJBTUVCVUZGRVJfQ09OU09MRSBpZiAhRVhQRVJUDQo+PiAg
IAlzZWxlY3QgRlJBTUVCVUZGRVJfQ09OU09MRV9ERVRFQ1RfUFJJTUFSWSBpZiBGUkFNRUJV
RkZFUl9DT05TT0xFDQo+PiAgIAlkZWZhdWx0IHkNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxw
ZXIuYw0KPj4gaW5kZXggYmFiNmIyNTJmMDJhLi45OTc4MTQ3YmJjOGEgMTAwNjQ0DQo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+PiBAQCAtNzM2LDExMyArNzM2LDYgQEAgdm9p
ZCBkcm1fZmJfaGVscGVyX2RlZmVycmVkX2lvKHN0cnVjdCBmYl9pbmZvICppbmZvLCBzdHJ1
Y3QgbGlzdF9oZWFkICpwYWdlcmVmbGkNCj4+ICAgfQ0KPj4gICBFWFBPUlRfU1lNQk9MKGRy
bV9mYl9oZWxwZXJfZGVmZXJyZWRfaW8pOw0KPj4gICANCj4+IC0vKioNCj4+IC0gKiBkcm1f
ZmJfaGVscGVyX2NmYl9yZWFkIC0gSW1wbGVtZW50cyBzdHJ1Y3QgJmZiX29wcy5mYl9yZWFk
IGZvciBJL08gbWVtb3J5DQo+PiAtICogQGluZm86IGZiX2luZm8gc3RydWN0IHBvaW50ZXIN
Cj4+IC0gKiBAYnVmOiB1c2Vyc3BhY2UgYnVmZmVyIHRvIHJlYWQgZnJvbSBmcmFtZWJ1ZmZl
ciBtZW1vcnkNCj4+IC0gKiBAY291bnQ6IG51bWJlciBvZiBieXRlcyB0byByZWFkIGZyb20g
ZnJhbWVidWZmZXIgbWVtb3J5DQo+PiAtICogQHBwb3M6IHJlYWQgb2Zmc2V0IHdpdGhpbiBm
cmFtZWJ1ZmZlciBtZW1vcnkNCj4+IC0gKg0KPj4gLSAqIFJldHVybnM6DQo+PiAtICogVGhl
IG51bWJlciBvZiBieXRlcyByZWFkIG9uIHN1Y2Nlc3MsIG9yIGFuIGVycm9yIGNvZGUgb3Ro
ZXJ3aXNlLg0KPj4gLSAqLw0KPj4gLXNzaXplX3QgZHJtX2ZiX2hlbHBlcl9jZmJfcmVhZChz
dHJ1Y3QgZmJfaW5mbyAqaW5mbywgY2hhciBfX3VzZXIgKmJ1ZiwNCj4+IC0JCQkgICAgICAg
c2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpDQo+PiAtew0KPj4gLQlyZXR1cm4gZmJfaW9f
cmVhZChpbmZvLCBidWYsIGNvdW50LCBwcG9zKTsNCj4+IC19DQo+PiAtRVhQT1JUX1NZTUJP
TChkcm1fZmJfaGVscGVyX2NmYl9yZWFkKTsNCj4+IC0NCj4+IC0vKioNCj4+IC0gKiBkcm1f
ZmJfaGVscGVyX2NmYl93cml0ZSAtIEltcGxlbWVudHMgc3RydWN0ICZmYl9vcHMuZmJfd3Jp
dGUgZm9yIEkvTyBtZW1vcnkNCj4+IC0gKiBAaW5mbzogZmJfaW5mbyBzdHJ1Y3QgcG9pbnRl
cg0KPj4gLSAqIEBidWY6IHVzZXJzcGFjZSBidWZmZXIgdG8gd3JpdGUgdG8gZnJhbWVidWZm
ZXIgbWVtb3J5DQo+PiAtICogQGNvdW50OiBudW1iZXIgb2YgYnl0ZXMgdG8gd3JpdGUgdG8g
ZnJhbWVidWZmZXIgbWVtb3J5DQo+PiAtICogQHBwb3M6IHdyaXRlIG9mZnNldCB3aXRoaW4g
ZnJhbWVidWZmZXIgbWVtb3J5DQo+PiAtICoNCj4+IC0gKiBSZXR1cm5zOg0KPj4gLSAqIFRo
ZSBudW1iZXIgb2YgYnl0ZXMgd3JpdHRlbiBvbiBzdWNjZXNzLCBvciBhbiBlcnJvciBjb2Rl
IG90aGVyd2lzZS4NCj4+IC0gKi8NCj4+IC1zc2l6ZV90IGRybV9mYl9oZWxwZXJfY2ZiX3dy
aXRlKHN0cnVjdCBmYl9pbmZvICppbmZvLCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLA0KPj4g
LQkJCQlzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcykNCj4+IC17DQo+PiAtCXN0cnVjdCBk
cm1fZmJfaGVscGVyICpoZWxwZXIgPSBpbmZvLT5wYXI7DQo+PiAtCWxvZmZfdCBwb3MgPSAq
cHBvczsNCj4+IC0Jc3NpemVfdCByZXQ7DQo+PiAtCXN0cnVjdCBkcm1fcmVjdCBkYW1hZ2Vf
YXJlYTsNCj4+IC0NCj4+IC0JcmV0ID0gZmJfaW9fd3JpdGUoaW5mbywgYnVmLCBjb3VudCwg
cHBvcyk7DQo+PiAtCWlmIChyZXQgPD0gMCkNCj4+IC0JCXJldHVybiByZXQ7DQo+PiAtDQo+
PiAtCWlmIChoZWxwZXItPmZ1bmNzLT5mYl9kaXJ0eSkgew0KPj4gLQkJZHJtX2ZiX2hlbHBl
cl9tZW1vcnlfcmFuZ2VfdG9fY2xpcChpbmZvLCBwb3MsIHJldCwgJmRhbWFnZV9hcmVhKTsN
Cj4+IC0JCWRybV9mYl9oZWxwZXJfZGFtYWdlKGhlbHBlciwgZGFtYWdlX2FyZWEueDEsIGRh
bWFnZV9hcmVhLnkxLA0KPj4gLQkJCQkgICAgIGRybV9yZWN0X3dpZHRoKCZkYW1hZ2VfYXJl
YSksDQo+PiAtCQkJCSAgICAgZHJtX3JlY3RfaGVpZ2h0KCZkYW1hZ2VfYXJlYSkpOw0KPj4g
LQl9DQo+IA0KPiBUaGUgZ2VuZXJhdGVkIGhlbHBlcnMgZG8gbm90IGhhdmUgdGhlIGlmICho
ZWxwZXItPmZ1bmNzLT5mYl9kaXJ0eSkNCj4gY2hlY2suDQo+IElzIHRoaXMgaW1wbGVtZW50
ZWQgc29tZXdoZXJlIGVsc2UgdGhhdCBJIG1pc3NlZD8NCg0KSXQncyBub3QgbmVlZGVkIGFu
eSBsb25nZXIuICBXZSB1c2VkIHRvIHRlc3QgaWYgdGhlIGZiZGV2IGNvZGUgbmVlZHMgDQpk
YW1hZ2UgaGFuZGxpbmcgYnkgbG9va2luZyBmb3IgYSBmYl9kaXJ0eSBjYWxsYmFjay4gSWYg
c28sIHdlIHJhbiB0aGUgDQpkYW1hZ2UgaGFuZGxpbmcgY29kZS4NCg0KV2l0aCB0aGUgcGF0
Y2hzZXQgYXBwbGllZCwgdGhlIGZiZGV2IGNvZGUgdGhhdCBkb2VzIG5vdCBuZWVkIGRhbWFn
ZSANCmhhbmRsaW5nIGNhbGxzIGZiX3tpbyxzeXN9X3dyaXRlKCkgZGlyZWN0bHkuICBUaGUg
ZmJkZXYgY29kZSB0aGF0IG5lZWRzIA0KZGFtYWdlIGhhbmRsaW5nIChnZW5lcmljLCBpOTE1
LCBtc20pIHVzZXMgdGhlIGdlbmVyYXRvciBtYWNybyB0aGF0IA0KY3JlYXRlcyBuZWNlc3Nh
cnkgdGhlIGNhbGxzIHVuY29uZGl0aW9uYWxseS4gIFdlIGtub3cgZWFjaCBjYXNlIGF0IGJ1
aWxkIA0KdGltZS4NCg0KKEkgdGhpbmsgSSBoYXZlIHRvIG1vdmUgdGhlIG1zbSBwYXRjaCBh
ZnRlciBwYXRjaCAxMC8xMyB0byBtYWtlIGl0IA0KYmlzZWN0YWJsZS4pDQoNCkFGQUlDVCB0
aGUgbWlzc2luZyB0ZXN0IGZvciBmYl9kaXJ0eSBpcyBhbHNvIG9uZSBvZiB0aGUgcmVhc29u
cyB3aHkgDQp0aGVyZSdzIGEgZGlmZmVyZW5jZSBpbiBwZXJmb3JtYW5jZS4NCg0KSG9wZWZ1
bGx5LCB0aGlzIGFuc3dlcnMgeW91ciBxdWVzdGlvbj8NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4gCVNhbQ0KPiANCj4gDQo+PiAtDQo+PiAtCXJldHVybiByZXQ7DQo+PiAt
fQ0KPj4gLUVYUE9SVF9TWU1CT0woZHJtX2ZiX2hlbHBlcl9jZmJfd3JpdGUpOw0KPj4gLQ0K
Pj4gLS8qKg0KPj4gLSAqIGRybV9mYl9oZWxwZXJfY2ZiX2ZpbGxyZWN0IC0gd3JhcHBlciBh
cm91bmQgY2ZiX2ZpbGxyZWN0DQo+PiAtICogQGluZm86IGZiZGV2IHJlZ2lzdGVyZWQgYnkg
dGhlIGhlbHBlcg0KPj4gLSAqIEByZWN0OiBpbmZvIGFib3V0IHJlY3RhbmdsZSB0byBmaWxs
DQo+PiAtICoNCj4+IC0gKiBBIHdyYXBwZXIgYXJvdW5kIGNmYl9maWxscmVjdCBpbXBsZW1l
bnRlZCBieSBmYmRldiBjb3JlDQo+PiAtICovDQo+PiAtdm9pZCBkcm1fZmJfaGVscGVyX2Nm
Yl9maWxscmVjdChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywNCj4+IC0JCQkJY29uc3Qgc3RydWN0
IGZiX2ZpbGxyZWN0ICpyZWN0KQ0KPj4gLXsNCj4+IC0Jc3RydWN0IGRybV9mYl9oZWxwZXIg
KmhlbHBlciA9IGluZm8tPnBhcjsNCj4+IC0NCj4+IC0JY2ZiX2ZpbGxyZWN0KGluZm8sIHJl
Y3QpOw0KPj4gLQ0KPj4gLQlpZiAoaGVscGVyLT5mdW5jcy0+ZmJfZGlydHkpDQo+PiAtCQlk
cm1fZmJfaGVscGVyX2RhbWFnZShoZWxwZXIsIHJlY3QtPmR4LCByZWN0LT5keSwgcmVjdC0+
d2lkdGgsIHJlY3QtPmhlaWdodCk7DQo+PiAtfQ0KPj4gLUVYUE9SVF9TWU1CT0woZHJtX2Zi
X2hlbHBlcl9jZmJfZmlsbHJlY3QpOw0KPj4gLQ0KPj4gLS8qKg0KPj4gLSAqIGRybV9mYl9o
ZWxwZXJfY2ZiX2NvcHlhcmVhIC0gd3JhcHBlciBhcm91bmQgY2ZiX2NvcHlhcmVhDQo+PiAt
ICogQGluZm86IGZiZGV2IHJlZ2lzdGVyZWQgYnkgdGhlIGhlbHBlcg0KPj4gLSAqIEBhcmVh
OiBpbmZvIGFib3V0IGFyZWEgdG8gY29weQ0KPj4gLSAqDQo+PiAtICogQSB3cmFwcGVyIGFy
b3VuZCBjZmJfY29weWFyZWEgaW1wbGVtZW50ZWQgYnkgZmJkZXYgY29yZQ0KPj4gLSAqLw0K
Pj4gLXZvaWQgZHJtX2ZiX2hlbHBlcl9jZmJfY29weWFyZWEoc3RydWN0IGZiX2luZm8gKmlu
Zm8sDQo+PiAtCQkJCWNvbnN0IHN0cnVjdCBmYl9jb3B5YXJlYSAqYXJlYSkNCj4+IC17DQo+
PiAtCXN0cnVjdCBkcm1fZmJfaGVscGVyICpoZWxwZXIgPSBpbmZvLT5wYXI7DQo+PiAtDQo+
PiAtCWNmYl9jb3B5YXJlYShpbmZvLCBhcmVhKTsNCj4+IC0NCj4+IC0JaWYgKGhlbHBlci0+
ZnVuY3MtPmZiX2RpcnR5KQ0KPj4gLQkJZHJtX2ZiX2hlbHBlcl9kYW1hZ2UoaGVscGVyLCBh
cmVhLT5keCwgYXJlYS0+ZHksIGFyZWEtPndpZHRoLCBhcmVhLT5oZWlnaHQpOw0KPj4gLX0N
Cj4+IC1FWFBPUlRfU1lNQk9MKGRybV9mYl9oZWxwZXJfY2ZiX2NvcHlhcmVhKTsNCj4+IC0N
Cj4+IC0vKioNCj4+IC0gKiBkcm1fZmJfaGVscGVyX2NmYl9pbWFnZWJsaXQgLSB3cmFwcGVy
IGFyb3VuZCBjZmJfaW1hZ2VibGl0DQo+PiAtICogQGluZm86IGZiZGV2IHJlZ2lzdGVyZWQg
YnkgdGhlIGhlbHBlcg0KPj4gLSAqIEBpbWFnZTogaW5mbyBhYm91dCBpbWFnZSB0byBibGl0
DQo+PiAtICoNCj4+IC0gKiBBIHdyYXBwZXIgYXJvdW5kIGNmYl9pbWFnZWJsaXQgaW1wbGVt
ZW50ZWQgYnkgZmJkZXYgY29yZQ0KPj4gLSAqLw0KPj4gLXZvaWQgZHJtX2ZiX2hlbHBlcl9j
ZmJfaW1hZ2VibGl0KHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPj4gLQkJCQkgY29uc3Qgc3Ry
dWN0IGZiX2ltYWdlICppbWFnZSkNCj4+IC17DQo+PiAtCXN0cnVjdCBkcm1fZmJfaGVscGVy
ICpoZWxwZXIgPSBpbmZvLT5wYXI7DQo+PiAtDQo+PiAtCWNmYl9pbWFnZWJsaXQoaW5mbywg
aW1hZ2UpOw0KPj4gLQ0KPj4gLQlpZiAoaGVscGVyLT5mdW5jcy0+ZmJfZGlydHkpDQo+PiAt
CQlkcm1fZmJfaGVscGVyX2RhbWFnZShoZWxwZXIsIGltYWdlLT5keCwgaW1hZ2UtPmR5LCBp
bWFnZS0+d2lkdGgsIGltYWdlLT5oZWlnaHQpOw0KPj4gLX0NCj4+IC1FWFBPUlRfU1lNQk9M
KGRybV9mYl9oZWxwZXJfY2ZiX2ltYWdlYmxpdCk7DQo+PiAtDQo+PiAgIC8qKg0KPj4gICAg
KiBkcm1fZmJfaGVscGVyX3NldF9zdXNwZW5kIC0gd3JhcHBlciBhcm91bmQgZmJfc2V0X3N1
c3BlbmQNCj4+ICAgICogQGZiX2hlbHBlcjogZHJpdmVyLWFsbG9jYXRlZCBmYmRldiBoZWxw
ZXIsIGNhbiBiZSBOVUxMDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
S2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L0tjb25maWcNCj4+IGluZGV4IGU0ZjRk
MmUzZmRmZS4uMDFiNWE4MjcyYTI3IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvS2NvbmZpZw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZpZw0K
Pj4gQEAgLTE3LDYgKzE3LDcgQEAgY29uZmlnIERSTV9JOTE1DQo+PiAgIAlzZWxlY3QgRFJN
X0tNU19IRUxQRVINCj4+ICAgCXNlbGVjdCBEUk1fUEFORUwNCj4+ICAgCXNlbGVjdCBEUk1f
TUlQSV9EU0kNCj4+ICsJc2VsZWN0IEZCX0lPX0hFTFBFUlMgaWYgRFJNX0ZCREVWX0VNVUxB
VElPTg0KPj4gICAJc2VsZWN0IFJFTEFZDQo+PiAgIAlzZWxlY3QgSTJDDQo+PiAgIAlzZWxl
Y3QgSTJDX0FMR09CSVQNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2ZiZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2ZiZGV2LmMNCj4+IGluZGV4IGFhYjFhZTc0YThmNy4uZWNjYWNlYWY4YjlkIDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmRldi5j
DQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMN
Cj4+IEBAIC0yOCw2ICsyOCw3IEBADQo+PiAgICNpbmNsdWRlIDxsaW51eC9jb25zb2xlLmg+
DQo+PiAgICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgv
ZXJybm8uaD4NCj4+ICsjaW5jbHVkZSA8bGludXgvZmIuaD4NCj4+ICAgI2luY2x1ZGUgPGxp
bnV4L2luaXQuaD4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KPj4gICAjaW5j
bHVkZSA8bGludXgvbW0uaD4NCj4+IEBAIC04NCw2ICs4NSwxMCBAQCBzdGF0aWMgdm9pZCBp
bnRlbF9mYmRldl9pbnZhbGlkYXRlKHN0cnVjdCBpbnRlbF9mYmRldiAqaWZiZGV2KQ0KPj4g
ICAJaW50ZWxfZnJvbnRidWZmZXJfaW52YWxpZGF0ZSh0b19mcm9udGJ1ZmZlcihpZmJkZXYp
LCBPUklHSU5fQ1BVKTsNCj4+ICAgfQ0KPj4gICANCj4+ICtGQl9HRU5fREVGQVVMVF9ERUZF
UlJFRF9JT19PUFMoaW50ZWxfZmJkZXYsDQo+PiArCQkJICAgICAgIGRybV9mYl9oZWxwZXJf
ZGFtYWdlX3JhbmdlLA0KPj4gKwkJCSAgICAgICBkcm1fZmJfaGVscGVyX2RhbWFnZV9hcmVh
KQ0KPj4gKw0KPj4gICBzdGF0aWMgaW50IGludGVsX2ZiZGV2X3NldF9wYXIoc3RydWN0IGZi
X2luZm8gKmluZm8pDQo+PiAgIHsNCj4+ICAgCXN0cnVjdCBpbnRlbF9mYmRldiAqaWZiZGV2
ID0gdG9faW50ZWxfZmJkZXYoaW5mby0+cGFyKTsNCj4+IEBAIC0xMzIsMTUgKzEzNywxMiBA
QCBzdGF0aWMgaW50IGludGVsX2ZiZGV2X21tYXAoc3RydWN0IGZiX2luZm8gKmluZm8sIHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQ0KPj4gICANCj4+ICAgc3RhdGljIGNvbnN0IHN0
cnVjdCBmYl9vcHMgaW50ZWxmYl9vcHMgPSB7DQo+PiAgIAkub3duZXIgPSBUSElTX01PRFVM
RSwNCj4+ICsJX19GQl9ERUZBVUxUX0RFRkVSUkVEX09QU19SRFdSKGludGVsX2ZiZGV2KSwN
Cj4+ICAgCURSTV9GQl9IRUxQRVJfREVGQVVMVF9PUFMsDQo+PiAgIAkuZmJfc2V0X3BhciA9
IGludGVsX2ZiZGV2X3NldF9wYXIsDQo+PiAtCS5mYl9yZWFkID0gZHJtX2ZiX2hlbHBlcl9j
ZmJfcmVhZCwNCj4+IC0JLmZiX3dyaXRlID0gZHJtX2ZiX2hlbHBlcl9jZmJfd3JpdGUsDQo+
PiAtCS5mYl9maWxscmVjdCA9IGRybV9mYl9oZWxwZXJfY2ZiX2ZpbGxyZWN0LA0KPj4gLQku
ZmJfY29weWFyZWEgPSBkcm1fZmJfaGVscGVyX2NmYl9jb3B5YXJlYSwNCj4+IC0JLmZiX2lt
YWdlYmxpdCA9IGRybV9mYl9oZWxwZXJfY2ZiX2ltYWdlYmxpdCwNCj4+IC0JLmZiX3Bhbl9k
aXNwbGF5ID0gaW50ZWxfZmJkZXZfcGFuX2Rpc3BsYXksDQo+PiAgIAkuZmJfYmxhbmsgPSBp
bnRlbF9mYmRldl9ibGFuaywNCj4+ICsJLmZiX3Bhbl9kaXNwbGF5ID0gaW50ZWxfZmJkZXZf
cGFuX2Rpc3BsYXksDQo+PiArCV9fRkJfREVGQVVMVF9ERUZFUlJFRF9PUFNfRFJBVyhpbnRl
bF9mYmRldiksDQo+PiAgIAkuZmJfbW1hcCA9IGludGVsX2ZiZGV2X21tYXAsDQo+PiAgIH07
DQo+PiAgIA0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaCBi
L2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaA0KPj4gaW5kZXggYjUwZmQwYzBiNzEzLi40
ODYzYjBmODI5OWUgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZmJfaGVscGVy
LmgNCj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaA0KPj4gQEAgLTI1OCwx
OCArMjU4LDYgQEAgdm9pZCBkcm1fZmJfaGVscGVyX2RhbWFnZV9hcmVhKHN0cnVjdCBmYl9p
bmZvICppbmZvLCB1MzIgeCwgdTMyIHksIHUzMiB3aWR0aCwgdTMNCj4+ICAgDQo+PiAgIHZv
aWQgZHJtX2ZiX2hlbHBlcl9kZWZlcnJlZF9pbyhzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgc3Ry
dWN0IGxpc3RfaGVhZCAqcGFnZXJlZmxpc3QpOw0KPj4gICANCj4+IC1zc2l6ZV90IGRybV9m
Yl9oZWxwZXJfY2ZiX3JlYWQoc3RydWN0IGZiX2luZm8gKmluZm8sIGNoYXIgX191c2VyICpi
dWYsDQo+PiAtCQkJICAgICAgIHNpemVfdCBjb3VudCwgbG9mZl90ICpwcG9zKTsNCj4+IC1z
c2l6ZV90IGRybV9mYl9oZWxwZXJfY2ZiX3dyaXRlKHN0cnVjdCBmYl9pbmZvICppbmZvLCBj
b25zdCBjaGFyIF9fdXNlciAqYnVmLA0KPj4gLQkJCQlzaXplX3QgY291bnQsIGxvZmZfdCAq
cHBvcyk7DQo+PiAtDQo+PiAtdm9pZCBkcm1fZmJfaGVscGVyX2NmYl9maWxscmVjdChzdHJ1
Y3QgZmJfaW5mbyAqaW5mbywNCj4+IC0JCQkJY29uc3Qgc3RydWN0IGZiX2ZpbGxyZWN0ICpy
ZWN0KTsNCj4+IC12b2lkIGRybV9mYl9oZWxwZXJfY2ZiX2NvcHlhcmVhKHN0cnVjdCBmYl9p
bmZvICppbmZvLA0KPj4gLQkJCQljb25zdCBzdHJ1Y3QgZmJfY29weWFyZWEgKmFyZWEpOw0K
Pj4gLXZvaWQgZHJtX2ZiX2hlbHBlcl9jZmJfaW1hZ2VibGl0KHN0cnVjdCBmYl9pbmZvICpp
bmZvLA0KPj4gLQkJCQkgY29uc3Qgc3RydWN0IGZiX2ltYWdlICppbWFnZSk7DQo+PiAtDQo+
PiAgIHZvaWQgZHJtX2ZiX2hlbHBlcl9zZXRfc3VzcGVuZChzdHJ1Y3QgZHJtX2ZiX2hlbHBl
ciAqZmJfaGVscGVyLCBib29sIHN1c3BlbmQpOw0KPj4gICB2b2lkIGRybV9mYl9oZWxwZXJf
c2V0X3N1c3BlbmRfdW5sb2NrZWQoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwN
Cj4+ICAgCQkJCQlib29sIHN1c3BlbmQpOw0KPj4gQEAgLTM4NSwzMyArMzczLDYgQEAgc3Rh
dGljIGlubGluZSBpbnQgZHJtX2ZiX2hlbHBlcl9kZWZpb19pbml0KHN0cnVjdCBkcm1fZmJf
aGVscGVyICpmYl9oZWxwZXIpDQo+PiAgIAlyZXR1cm4gLUVOT0RFVjsNCj4+ICAgfQ0KPj4g
ICANCj4+IC1zdGF0aWMgaW5saW5lIHNzaXplX3QgZHJtX2ZiX2hlbHBlcl9jZmJfcmVhZChz
dHJ1Y3QgZmJfaW5mbyAqaW5mbywgY2hhciBfX3VzZXIgKmJ1ZiwNCj4+IC0JCQkJCSAgICAg
c2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpDQo+PiAtew0KPj4gLQlyZXR1cm4gLUVOT0RF
VjsNCj4+IC19DQo+PiAtDQo+PiAtc3RhdGljIGlubGluZSBzc2l6ZV90IGRybV9mYl9oZWxw
ZXJfY2ZiX3dyaXRlKHN0cnVjdCBmYl9pbmZvICppbmZvLCBjb25zdCBjaGFyIF9fdXNlciAq
YnVmLA0KPj4gLQkJCQkJICAgICAgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpDQo+PiAt
ew0KPj4gLQlyZXR1cm4gLUVOT0RFVjsNCj4+IC19DQo+PiAtDQo+PiAtc3RhdGljIGlubGlu
ZSB2b2lkIGRybV9mYl9oZWxwZXJfY2ZiX2ZpbGxyZWN0KHN0cnVjdCBmYl9pbmZvICppbmZv
LA0KPj4gLQkJCQkJICAgICAgY29uc3Qgc3RydWN0IGZiX2ZpbGxyZWN0ICpyZWN0KQ0KPj4g
LXsNCj4+IC19DQo+PiAtDQo+PiAtc3RhdGljIGlubGluZSB2b2lkIGRybV9mYl9oZWxwZXJf
Y2ZiX2NvcHlhcmVhKHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPj4gLQkJCQkJICAgICAgY29u
c3Qgc3RydWN0IGZiX2NvcHlhcmVhICphcmVhKQ0KPj4gLXsNCj4+IC19DQo+PiAtDQo+PiAt
c3RhdGljIGlubGluZSB2b2lkIGRybV9mYl9oZWxwZXJfY2ZiX2ltYWdlYmxpdChzdHJ1Y3Qg
ZmJfaW5mbyAqaW5mbywNCj4+IC0JCQkJCSAgICAgICBjb25zdCBzdHJ1Y3QgZmJfaW1hZ2Ug
KmltYWdlKQ0KPj4gLXsNCj4+IC19DQo+PiAtDQo+PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBk
cm1fZmJfaGVscGVyX3NldF9zdXNwZW5kKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxw
ZXIsDQo+PiAgIAkJCQkJICAgICBib29sIHN1c3BlbmQpDQo+PiAgIHsNCj4+IC0tIA0KPj4g
Mi40MC4xDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0
cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFu
ZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgw
OSAoQUcgTnVlcm5iZXJnKQ0K

--------------yaJuYe1kVrXFCbvMlvAu0kKY--

--------------102zqtLdF2GwOZ32o0ncrzQj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmR1oegFAwAAAAAACgkQlh/E3EQov+BK
gRAAoEdeQry/R+tdjPvZWlm4I6EFb2IDmg8Mi4yspobqCJ2ErYqarArdDHYJQJSAgL+nwC07XWT4
pLWA4+XdRPXQKOR7fKnTwe7ELEPFbRHY7MyadY+Wv8IUK2cPXiubzyp4eOWwSJd6BZ8scm/4iqPV
61yxbk2dBCGk0/+ReAThvFqIhuOn63rPrlpn5RWNXkiuza4rG75JVicbw1NgHW8f+ov5tPX1EUZm
pFKwzHDGkmJWGX7c5kvLNhPYUSp0q51kgplrBt/k5zoey1BkrKksuIY+UUoEhkimqOa6HvEkQuIn
mZ//ERrzFfnq/Jf/O4cZk5uusy3Wl54IHwRnv+FuHAUPBCP5U3z0jmKiBPxqpAIHu9Kr5ZHiJ1sB
fr9+GNPjwOX7Rt6mP3Wj58qRROKmkRA8dgrlBKSqraQulvHKKYDePSxc00yjrW5/DpKz3EdiuVLL
8ME4dvkCF0ghhUyIqzZ53qsxFP5Dq/nSvPam11qvCI3nPXAOewBWA7STfF+0ddj4ZF9nQlC+Om7g
sToW0NlD85Yjsn+E7QRZp8/zyqjpZ7XnKO+W9z1RwYRDNl+DpZsBb5oV5d6iP7tfatESM8TQ2Iyl
Az/EZ3/p4LEOAmQGdratSlF8H8RDh4fcE2MTDCsKoJiLVV8WtaxKKw/veo26DiE9XWv9Fj0lZ1Hh
DRU=
=0uOQ
-----END PGP SIGNATURE-----

--------------102zqtLdF2GwOZ32o0ncrzQj--
