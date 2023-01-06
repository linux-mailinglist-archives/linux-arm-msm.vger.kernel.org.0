Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7206601C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 15:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbjAFOF2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 09:05:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjAFOF1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 09:05:27 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4235D77D1C
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 06:05:24 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 550BA26CFD;
        Fri,  6 Jan 2023 14:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1673013923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/txCGLqzudObSmAt66+DeDCDFC0yFjz3bt7S4MEc6g0=;
        b=sF0wVfjruAZHRzg1+HbyEqT6/5apxiaDtFSPF2ik8wa2HNczpNJHrO3VdW0A0C1IJ305AO
        sKI//zy8+fHPj9zuUHUiGCWQwVvqkcIEaeRA2QxEMj6byVEieJevrunsQukldIYG9oxGMm
        8YNT4n8PhYudCVxr8m5ZxIIKKfwUN0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1673013923;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/txCGLqzudObSmAt66+DeDCDFC0yFjz3bt7S4MEc6g0=;
        b=MvQ0cN/OD/bzUr60/RTvGtKqnKHD5Kly8MJHqcfp+l79hr1sI8kOM5M2KOu63sA5Oqmr0e
        9AhgDd7BxGs8m9CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F36313596;
        Fri,  6 Jan 2023 14:05:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id /uykBqMquGMPbwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 06 Jan 2023 14:05:23 +0000
Message-ID: <5dcecae8-5c55-0e2e-bdf0-18fd559f8e00@suse.de>
Date:   Fri, 6 Jan 2023 15:05:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4] drm/fb-helper: Replace bpp/depth parameter by color
 mode
Content-Language: en-US
To:     daniel@ffwll.ch, mcanal@igalia.com, steev@kali.org,
        dmitry.baryshkov@linaro.org, javierm@redhat.com, airlied@gmail.com,
        mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230106112324.22055-1-tzimmermann@suse.de>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230106112324.22055-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BG1I8KiDdVFqawcpsQKs2oI9"
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BG1I8KiDdVFqawcpsQKs2oI9
Content-Type: multipart/mixed; boundary="------------RwEThR0EypWDaB0aeyKOA6vm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, mcanal@igalia.com, steev@kali.org,
 dmitry.baryshkov@linaro.org, javierm@redhat.com, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <5dcecae8-5c55-0e2e-bdf0-18fd559f8e00@suse.de>
Subject: Re: [PATCH v4] drm/fb-helper: Replace bpp/depth parameter by color
 mode
References: <20230106112324.22055-1-tzimmermann@suse.de>
In-Reply-To: <20230106112324.22055-1-tzimmermann@suse.de>

--------------RwEThR0EypWDaB0aeyKOA6vm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkndmUgcHVzaGVkIHRoaXMgZml4IGludG8gZHJtLW1pc2MtbmV4dC4gSXQgd2ls
bCBob3BlZnVsbHkgcmVzdG9yZSB0aGUgDQpmYmRldiBjb25zb2xlcy4gU29ycnkgZm9yIHRo
ZSBpbmNvbnZlbmllbmNlLiBJZiB0aGluZ3Mgc3RpbGwgZG9uJ3Qgd29yaywgDQpzdGF0aW5n
DQoNCiAgIHZpZGVvPTEwMjR4NzY4LTMyDQoNCm9uIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5l
IHNob3VsZCBiZSBhIHNhZmUgb3ZlcnJpZGUgb24gbW9zdCBzeXN0ZW1zLg0KDQpCZXN0IHJl
Z2FyZHMNClRob21hcw0KDQpBbSAwNi4wMS4yMyB1bSAxMjoyMyBzY2hyaWViIFRob21hcyBa
aW1tZXJtYW5uOg0KPiBSZXBsYWNlIHRoZSBjb21iaW5hdGlvbiBvZiBicHAgYW5kIGRlcHRo
IHdpdGggYSBzaW5nbGUgY29sb3ItbW9kZQ0KPiBhcmd1bWVudC4gSGFuZGxlIHNwZWNpYWwg
Y2FzZXMgaW4gc2ltcGxlZHJtIGFuZCBvZmRybS4gSGFyZC1jb2RlDQo+IFhSR0I4ODg4IGFz
IGZhbGxiYWNrIGZvcm1hdCBmb3IgY2FzZXMgd2hlcmUgbm8gZ2l2ZW4gZm9ybWF0IHdvcmtz
Lg0KPiANCj4gVGhlIGNvbG9yLW1vZGUgYXJndW1lbnQgYWNjZXB0cyB0aGUgc2FtZSB2YWx1
ZXMgYXMgdGhlIGtlcm5lbCdzIHZpZGVvDQo+IHBhcmFtZXRlci4gVGhlc2UgYXJlIG1vc3Rs
eSBicHAgdmFsdWVzIGJldHdlZW4gMSBhbmQgMzIuIFRoZSBleGNlcHRpb25zDQo+IGFyZSAx
NSwgd2hpY2ggaGFzIGEgY29sb3IgZGVwdGggb2YgMTUgYW5kIGEgYnBwIHZhbHVlIG9mIDE2
OyBhbmQgMzIsDQo+IHdoaWNoIGhhcyBhIGNvbG9yIGRlcHRoIG9mIDI0IGFuZCBhIGJwcCB2
YWx1ZSBvZiAzMi4NCj4gDQo+IHY0Og0KPiAJKiBhZGQgYmFjayBsb3N0IHRlc3QgZm9yIGJw
cF9zcGVjaWZpZWQgKE1haXJhKQ0KPiAJKiBhZGQgRml4ZXMgdGFnIChEYW5pZWwpDQo+IHYz
Og0KPiAJKiBmaXggb2Zkcm0gYnVpbGQgKE1heGltZSkNCj4gdjI6DQo+IAkqIG1pbmltaXpl
IGNoYW5nZXMgKERhbmllbCkNCj4gCSogdXNlIGRybV9kcml2ZXJfbGVnYWN5X2ZiX2Zvcm1h
dCgpIChEYW5pZWwpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gRml4ZXM6IDM3YzkwZDU4OWRjMCAoImRybS9mYi1o
ZWxwZXI6IEZpeCBzaW5nbGUtcHJvYmUgY29sb3ItZm9ybWF0IHNlbGVjdGlvbiIpDQo+IENj
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gQ2M6IEphdmll
ciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiBDYzogTWFhcnRl
biBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6
IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4NCj4gLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyAgfCA0MiArKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L29mZHJtLmMgICAgIHwgIDcg
KysrKystDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgfCAgNyArKysr
Ky0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+IGluZGV4IDEzNjljYTRh
ZTM5Yi4uNDI3NjMxNzA2MTI4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiX2hlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMN
Cj4gQEAgLTE3NTYsMjQgKzE3NTYsMjEgQEAgc3RhdGljIHVpbnQzMl90IGRybV9mYl9oZWxw
ZXJfZmluZF9mb3JtYXQoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwgY29uc3QN
Cj4gICAJcmV0dXJuIERSTV9GT1JNQVRfSU5WQUxJRDsNCj4gICB9DQo+ICAgDQo+IC1zdGF0
aWMgdWludDMyX3QgZHJtX2ZiX2hlbHBlcl9maW5kX2NtZGxpbmVfZm9ybWF0KHN0cnVjdCBk
cm1fZmJfaGVscGVyICpmYl9oZWxwZXIsDQo+IC0JCQkJCQkgIGNvbnN0IHVpbnQzMl90ICpm
b3JtYXRzLCBzaXplX3QgZm9ybWF0X2NvdW50LA0KPiAtCQkJCQkJICBjb25zdCBzdHJ1Y3Qg
ZHJtX2NtZGxpbmVfbW9kZSAqY21kbGluZV9tb2RlKQ0KPiArc3RhdGljIHVpbnQzMl90IGRy
bV9mYl9oZWxwZXJfZmluZF9jb2xvcl9tb2RlX2Zvcm1hdChzdHJ1Y3QgZHJtX2ZiX2hlbHBl
ciAqZmJfaGVscGVyLA0KPiArCQkJCQkJICAgICBjb25zdCB1aW50MzJfdCAqZm9ybWF0cywg
c2l6ZV90IGZvcm1hdF9jb3VudCwNCj4gKwkJCQkJCSAgICAgdW5zaWduZWQgaW50IGNvbG9y
X21vZGUpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gZmJfaGVscGVy
LT5kZXY7DQo+ICAgCXVpbnQzMl90IGJwcCwgZGVwdGg7DQo+ICAgDQo+IC0JaWYgKCFjbWRs
aW5lX21vZGUtPmJwcF9zcGVjaWZpZWQpDQo+IC0JCXJldHVybiBEUk1fRk9STUFUX0lOVkFM
SUQ7DQo+IC0NCj4gLQlzd2l0Y2ggKGNtZGxpbmVfbW9kZS0+YnBwKSB7DQo+ICsJc3dpdGNo
IChjb2xvcl9tb2RlKSB7DQo+ICAgCWNhc2UgMToNCj4gICAJY2FzZSAyOg0KPiAgIAljYXNl
IDQ6DQo+ICAgCWNhc2UgODoNCj4gICAJY2FzZSAxNjoNCj4gICAJY2FzZSAyNDoNCj4gLQkJ
YnBwID0gZGVwdGggPSBjbWRsaW5lX21vZGUtPmJwcDsNCj4gKwkJYnBwID0gZGVwdGggPSBj
b2xvcl9tb2RlOw0KPiAgIAkJYnJlYWs7DQo+ICAgCWNhc2UgMTU6DQo+ICAgCQlicHAgPSAx
NjsNCj4gQEAgLTE3ODQsNyArMTc4MSw3IEBAIHN0YXRpYyB1aW50MzJfdCBkcm1fZmJfaGVs
cGVyX2ZpbmRfY21kbGluZV9mb3JtYXQoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBl
DQo+ICAgCQlkZXB0aCA9IDI0Ow0KPiAgIAkJYnJlYWs7DQo+ICAgCWRlZmF1bHQ6DQo+IC0J
CWRybV9pbmZvKGRldiwgInVuc3VwcG9ydGVkIGJwcCB2YWx1ZSBvZiAlZFxuIiwgY21kbGlu
ZV9tb2RlLT5icHApOw0KPiArCQlkcm1faW5mbyhkZXYsICJ1bnN1cHBvcnRlZCBjb2xvciBt
b2RlIG9mICVkXG4iLCBjb2xvcl9tb2RlKTsNCj4gICAJCXJldHVybiBEUk1fRk9STUFUX0lO
VkFMSUQ7DQo+ICAgCX0NCj4gICANCj4gQEAgLTE4MTcsMTAgKzE4MTQsMTMgQEAgc3RhdGlj
IGludCBfX2RybV9mYl9oZWxwZXJfZmluZF9zaXplcyhzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAq
ZmJfaGVscGVyLCBpbnQgcHJlZmUNCj4gICAJCWRybV9jbGllbnRfZm9yX2VhY2hfY29ubmVj
dG9yX2l0ZXIoY29ubmVjdG9yLCAmY29ubl9pdGVyKSB7DQo+ICAgCQkJc3RydWN0IGRybV9j
bWRsaW5lX21vZGUgKmNtZGxpbmVfbW9kZSA9ICZjb25uZWN0b3ItPmNtZGxpbmVfbW9kZTsN
Cj4gICANCj4gLQkJCXN1cmZhY2VfZm9ybWF0ID0gZHJtX2ZiX2hlbHBlcl9maW5kX2NtZGxp
bmVfZm9ybWF0KGZiX2hlbHBlciwNCj4gLQkJCQkJCQkJCSAgIHBsYW5lLT5mb3JtYXRfdHlw
ZXMsDQo+IC0JCQkJCQkJCQkgICBwbGFuZS0+Zm9ybWF0X2NvdW50LA0KPiAtCQkJCQkJCQkJ
ICAgY21kbGluZV9tb2RlKTsNCj4gKwkJCWlmICghY21kbGluZV9tb2RlLT5icHBfc3BlY2lm
aWVkKQ0KPiArCQkJCWNvbnRpbnVlOw0KPiArDQo+ICsJCQlzdXJmYWNlX2Zvcm1hdCA9IGRy
bV9mYl9oZWxwZXJfZmluZF9jb2xvcl9tb2RlX2Zvcm1hdChmYl9oZWxwZXIsDQo+ICsJCQkJ
CQkJCQkgICAgICBwbGFuZS0+Zm9ybWF0X3R5cGVzLA0KPiArCQkJCQkJCQkJICAgICAgcGxh
bmUtPmZvcm1hdF9jb3VudCwNCj4gKwkJCQkJCQkJCSAgICAgIGNtZGxpbmVfbW9kZS0+YnBw
KTsNCj4gICAJCQlpZiAoc3VyZmFjZV9mb3JtYXQgIT0gRFJNX0ZPUk1BVF9JTlZBTElEKQ0K
PiAgIAkJCQlicmVhazsgLyogZm91bmQgc3VwcG9ydGVkIGZvcm1hdCAqLw0KPiAgIAkJfQ0K
PiBAQCAtMTgyOSwxNyArMTgyOSwyMyBAQCBzdGF0aWMgaW50IF9fZHJtX2ZiX2hlbHBlcl9m
aW5kX3NpemVzKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIsIGludCBwcmVmZQ0K
PiAgIAkJaWYgKHN1cmZhY2VfZm9ybWF0ICE9IERSTV9GT1JNQVRfSU5WQUxJRCkNCj4gICAJ
CQlicmVhazsgLyogZm91bmQgc3VwcG9ydGVkIGZvcm1hdCAqLw0KPiAgIA0KPiAtCQkvKiB0
cnkgcHJlZmVycmVkIGJwcC9kZXB0aCAqLw0KPiAtCQlzdXJmYWNlX2Zvcm1hdCA9IGRybV9m
Yl9oZWxwZXJfZmluZF9mb3JtYXQoZmJfaGVscGVyLCBwbGFuZS0+Zm9ybWF0X3R5cGVzLA0K
PiAtCQkJCQkJCSAgIHBsYW5lLT5mb3JtYXRfY291bnQsIHByZWZlcnJlZF9icHAsDQo+IC0J
CQkJCQkJICAgZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVwdGgpOw0KPiArCQkvKiB0
cnkgcHJlZmVycmVkIGNvbG9yIG1vZGUgKi8NCj4gKwkJc3VyZmFjZV9mb3JtYXQgPSBkcm1f
ZmJfaGVscGVyX2ZpbmRfY29sb3JfbW9kZV9mb3JtYXQoZmJfaGVscGVyLA0KPiArCQkJCQkJ
CQkgICAgICBwbGFuZS0+Zm9ybWF0X3R5cGVzLA0KPiArCQkJCQkJCQkgICAgICBwbGFuZS0+
Zm9ybWF0X2NvdW50LA0KPiArCQkJCQkJCQkgICAgICBwcmVmZXJyZWRfYnBwKTsNCj4gICAJ
CWlmIChzdXJmYWNlX2Zvcm1hdCAhPSBEUk1fRk9STUFUX0lOVkFMSUQpDQo+ICAgCQkJYnJl
YWs7IC8qIGZvdW5kIHN1cHBvcnRlZCBmb3JtYXQgKi8NCj4gICAJfQ0KPiAgIA0KPiAgIAlp
ZiAoc3VyZmFjZV9mb3JtYXQgPT0gRFJNX0ZPUk1BVF9JTlZBTElEKSB7DQo+ICsJCS8qDQo+
ICsJCSAqIElmIG5vbmUgb2YgdGhlIGdpdmVuIGNvbG9yIG1vZGVzIHdvcmtzLCBmYWxsIGJh
Y2sNCj4gKwkJICogdG8gWFJHQjg4ODguIERyaXZlcnMgYXJlIGV4cGVjdGVkIHRvIHByb3Zp
ZGUgdGhpcw0KPiArCQkgKiBmb3JtYXQgZm9yIGNvbXBhdGliaWxpdHkgd2l0aCBsZWdhY3kg
YXBwbGljYXRpb25zLg0KPiArCQkgKi8NCj4gICAJCWRybV93YXJuKGRldiwgIk5vIGNvbXBh
dGlibGUgZm9ybWF0IGZvdW5kXG4iKTsNCj4gLQkJcmV0dXJuIC1FQUdBSU47DQo+ICsJCXN1
cmZhY2VfZm9ybWF0ID0gZHJtX2RyaXZlcl9sZWdhY3lfZmJfZm9ybWF0KGRldiwgMzIsIDI0
KTsNCj4gICAJfQ0KPiAgIA0KPiAgIAlpbmZvID0gZHJtX2Zvcm1hdF9pbmZvKHN1cmZhY2Vf
Zm9ybWF0KTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55L29mZHJtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdGlueS9vZmRybS5jDQo+IGluZGV4IDM5YzVmZDQ2M2ZlYy4u
NmUzNDljYTQyNDg1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9vZmRy
bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L29mZHJtLmMNCj4gQEAgLTEzNTIs
NiArMTM1Miw3IEBAIHN0YXRpYyBpbnQgb2Zkcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gICB7DQo+ICAgCXN0cnVjdCBvZmRybV9kZXZpY2UgKm9kZXY7DQo+
ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXY7DQo+ICsJdW5zaWduZWQgaW50IGNvbG9yX21v
ZGU7DQo+ICAgCWludCByZXQ7DQo+ICAgDQo+ICAgCW9kZXYgPSBvZmRybV9kZXZpY2VfY3Jl
YXRlKCZvZmRybV9kcml2ZXIsIHBkZXYpOw0KPiBAQCAtMTM2Myw3ICsxMzY0LDExIEBAIHN0
YXRpYyBpbnQgb2Zkcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
ICAJaWYgKHJldCkNCj4gICAJCXJldHVybiByZXQ7DQo+ICAgDQo+IC0JZHJtX2ZiZGV2X2dl
bmVyaWNfc2V0dXAoZGV2LCBkcm1fZm9ybWF0X2luZm9fYnBwKG9kZXYtPmZvcm1hdCwgMCkp
Ow0KPiArCWNvbG9yX21vZGUgPSBkcm1fZm9ybWF0X2luZm9fYnBwKG9kZXYtPmZvcm1hdCwg
MCk7DQo+ICsJaWYgKGNvbG9yX21vZGUgPT0gMTYpDQo+ICsJCWNvbG9yX21vZGUgPSBvZGV2
LT5mb3JtYXQtPmRlcHRoOyAvLyBjYW4gYmUgMTUgb3IgMTYNCj4gKw0KPiArCWRybV9mYmRl
dl9nZW5lcmljX3NldHVwKGRldiwgY29sb3JfbW9kZSk7DQo+ICAgDQo+ICAgCXJldHVybiAw
Ow0KPiAgIH0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRy
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gaW5kZXggNzM1NTYx
N2YzOGQzLi5mNjU4Yjk5Yzc5NmEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
aW55L3NpbXBsZWRybS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRy
bS5jDQo+IEBAIC04MDIsNiArODAyLDcgQEAgc3RhdGljIGludCBzaW1wbGVkcm1fcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICB7DQo+ICAgCXN0cnVjdCBzaW1w
bGVkcm1fZGV2aWNlICpzZGV2Ow0KPiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2Ow0KPiAr
CXVuc2lnbmVkIGludCBjb2xvcl9tb2RlOw0KPiAgIAlpbnQgcmV0Ow0KPiAgIA0KPiAgIAlz
ZGV2ID0gc2ltcGxlZHJtX2RldmljZV9jcmVhdGUoJnNpbXBsZWRybV9kcml2ZXIsIHBkZXYp
Ow0KPiBAQCAtODEzLDcgKzgxNCwxMSBAQCBzdGF0aWMgaW50IHNpbXBsZWRybV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgIAlpZiAocmV0KQ0KPiAgIAkJcmV0
dXJuIHJldDsNCj4gICANCj4gLQlkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cChkZXYsIGRybV9m
b3JtYXRfaW5mb19icHAoc2Rldi0+Zm9ybWF0LCAwKSk7DQo+ICsJY29sb3JfbW9kZSA9IGRy
bV9mb3JtYXRfaW5mb19icHAoc2Rldi0+Zm9ybWF0LCAwKTsNCj4gKwlpZiAoY29sb3JfbW9k
ZSA9PSAxNikNCj4gKwkJY29sb3JfbW9kZSA9IHNkZXYtPmZvcm1hdC0+ZGVwdGg7IC8vIGNh
biBiZSAxNSBvciAxNg0KPiArDQo+ICsJZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoZGV2LCBj
b2xvcl9tb2RlKTsNCj4gICANCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------RwEThR0EypWDaB0aeyKOA6vm--

--------------BG1I8KiDdVFqawcpsQKs2oI9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO4KqIFAwAAAAAACgkQlh/E3EQov+AW
PA//SSZNf9Ib/iwnaTWQu8m0/KA+tdyAAEy/Q1Ve85Pyw4n576nxTU4LbGjzwG/ZTPHHT3a4/0Um
dSsOgfNPAXYWUKQ4CGxiIo28E7qxFHGKMoYJnSZsRoHqhStI2c1CIFe+ArnaU9pBpQKkdMt0z2+H
ek+zV+i9AQKSHbmPSn88m82KNXC+kXIBwGBpmxEkOrJYGyZK2oIOMcGNOEg1vVhzZwtTGhzada5c
RkZHBSDQrqypvRw78BmZeTfv8cU6B7uG6Alby09pUNqHnS3uP2pBogD53ttXoibQYRlgIADS+7yf
D8LGDBvNunhtKOh+oO8NcJRnQ73A664qfc1kTB7Ptm0AP0JRKl9rC+R1tPDQuigRF0wDoBkWq6Ct
wr49rjyv2z/6np7oawsVeBzfBwGO+0MPGzF8zb2PP69CmhRJM3Qb3y16lr7EpPkpxA/ooiFY2FyY
VURtjbOC2gjURo+cqduta0dZT6p1Nzgz4wWUHjromIJKr6RpLsiOsVQj+7GC23IEaZDp76fM1lrw
R2C3EBS0dL999gW76cCh09XYjE99txrMVk3iuPDErc6POqwgrSrThJUo0HA50EdADFRjIqmzMuHB
zugxNBr0p/vcnYyaWoxk0Rbmg+i5G2izH8xfrQYSj9z2wPO4IubdIYUlSRWPwM6l/3gLjWB6EqRB
pkc=
=iXDH
-----END PGP SIGNATURE-----

--------------BG1I8KiDdVFqawcpsQKs2oI9--
